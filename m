From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Mon, 16 Dec 2024 18:31:48 -0800
Subject: [PATCH v4 2/5] lib: sbi: sse: return an error value from sse_event_get()
In-Reply-To: <20241216212144.3379890-3-cleger@rivosinc.com>
References: <20241216212144.3379890-1-cleger@rivosinc.com> <20241216212144.3379890-3-cleger@rivosinc.com>
Message-ID: <CAHBxVyFa=7F7NNZWex0akJqKN8htR-YUxUPmCVYEfuGgNouCeA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 16, 2024 at 1:22?PM Cl?ment L?ger <cleger@rivosinc.com> wrote:
>
> Since event support will be checked in the next commits, return a value
> from sse_event_get() to allow propagating it. This will be used to
> report SBI_ERR_NOT_SUPPORTED when an event isn't supported.
>
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>  lib/sbi/sbi_sse.c | 72 +++++++++++++++++++++++++----------------------
>  1 file changed, 38 insertions(+), 34 deletions(-)
>
> diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
> index c9f9a9dd..f710338e 100644
> --- a/lib/sbi/sbi_sse.c
> +++ b/lib/sbi/sbi_sse.c
> @@ -244,30 +244,36 @@ static void sse_event_set_state(struct sbi_sse_event *e,
>         e->attrs.status |= new_state;
>  }
>
> -static struct sbi_sse_event *sse_event_get(uint32_t event_id)
> +static int sse_event_get(uint32_t event_id, struct sbi_sse_event **eret)
>  {
>         unsigned int i;
>         struct sbi_sse_event *e;
>         struct sse_hart_state *shs;
>
> +       if (!eret)
> +               return SBI_EINVAL;
> +
>         if (EVENT_IS_GLOBAL(event_id)) {
>                 for (i = 0; i < global_event_count; i++) {
>                         e = &global_events[i].event;
>                         if (e->event_id == event_id) {
>                                 spin_lock(&global_events[i].lock);
> -                               return e;
> +                               *eret = e;
> +                               return SBI_SUCCESS;
>                         }
>                 }
>         } else {
>                 shs = sse_thishart_state_ptr();
>                 for (i = 0; i < local_event_count; i++) {
>                         e = &shs->local_events[i];
> -                       if (e->event_id == event_id)
> -                               return e;
> +                       if (e->event_id == event_id) {
> +                               *eret = e;
> +                               return SBI_SUCCESS;
> +                       }
>                 }
>         }
>
> -       return NULL;
> +       return SBI_EINVAL;
>  }
>
>  static void sse_event_put(struct sbi_sse_event *e)
> @@ -653,8 +659,7 @@ static void sse_ipi_inject_process(struct sbi_scratch *scratch)
>
>         /* Mark all queued events as pending */
>         while (!sbi_fifo_dequeue(sse_inject_fifo_r, &evt)) {
> -               e = sse_event_get(evt.event_id);
> -               if (!e)
> +               if (sse_event_get(evt.event_id, &e))
>                         continue;
>
>                 sse_event_set_pending(e);
> @@ -696,10 +701,9 @@ static int sse_inject_event(uint32_t event_id, unsigned long hartid)
>         int ret;
>         struct sbi_sse_event *e;
>
> -       e = sse_event_get(event_id);
> -       if (!e)
> -               return SBI_EINVAL;
> -
> +       ret = sse_event_get(event_id, &e);
> +       if (ret)
> +               return ret;
>
>         /* In case of global event, provided hart_id is ignored */
>         if (sse_event_is_global(e))
> @@ -788,9 +792,9 @@ int sbi_sse_enable(uint32_t event_id)
>         int ret;
>         struct sbi_sse_event *e;
>
> -       e = sse_event_get(event_id);
> -       if (!e)
> -               return SBI_EINVAL;
> +       ret = sse_event_get(event_id, &e);
> +       if (ret)
> +               return ret;
>
>         sse_enabled_event_lock(e);
>         ret = sse_event_enable(e);
> @@ -805,9 +809,9 @@ int sbi_sse_disable(uint32_t event_id)
>         int ret;
>         struct sbi_sse_event *e;
>
> -       e = sse_event_get(event_id);
> -       if (!e)
> -               return SBI_EINVAL;
> +       ret = sse_event_get(event_id, &e);
> +       if (ret)
> +               return ret;
>
>         sse_enabled_event_lock(e);
>         ret = sse_event_disable(e);
> @@ -865,14 +869,15 @@ int sbi_sse_inject_event(uint32_t event_id)
>
>  int sbi_sse_set_cb_ops(uint32_t event_id, const struct sbi_sse_cb_ops *cb_ops)
>  {
> +       int ret;
>         struct sbi_sse_event *e;
>
>         if (cb_ops->set_hartid_cb && !EVENT_IS_GLOBAL(event_id))
>                 return SBI_EINVAL;
>
> -       e = sse_event_get(event_id);
> -       if (!e)
> -               return SBI_EINVAL;
> +       ret = sse_event_get(event_id, &e);
> +       if (ret)
> +               return ret;
>
>         e->cb_ops = cb_ops;
>         sse_event_put(e);
> @@ -943,9 +948,9 @@ int sbi_sse_read_attrs(uint32_t event_id, uint32_t base_attr_id,
>         if (ret)
>                 return ret;
>
> -       e = sse_event_get(event_id);
> -       if (!e)
> -               return SBI_EINVAL;
> +       ret = sse_event_get(event_id, &e);
> +       if (ret)
> +               return ret;
>
>         sbi_hart_map_saddr(output_phys_lo, sizeof(unsigned long) * attr_count);
>
> @@ -1008,9 +1013,9 @@ int sbi_sse_write_attrs(uint32_t event_id, uint32_t base_attr_id,
>         if (ret)
>                 return ret;
>
> -       e = sse_event_get(event_id);
> -       if (!e)
> -               return SBI_EINVAL;
> +       ret = sse_event_get(event_id, &e);
> +       if (ret)
> +               return ret;
>
>         ret = sse_write_attrs(e, base_attr_id, attr_count, input_phys_lo);
>         sse_event_put(e);
> @@ -1033,9 +1038,9 @@ int sbi_sse_register(uint32_t event_id, unsigned long handler_entry_pc,
>                                          SBI_DOMAIN_EXECUTE))
>                 return SBI_EINVALID_ADDR;
>
> -       e = sse_event_get(event_id);
> -       if (!e)
> -               return SBI_EINVAL;
> +       ret = sse_event_get(event_id, &e);
> +       if (ret)
> +               return ret;
>
>         ret = sse_event_register(e, handler_entry_pc, handler_entry_arg);
>         sse_event_put(e);
> @@ -1048,9 +1053,9 @@ int sbi_sse_unregister(uint32_t event_id)
>         int ret;
>         struct sbi_sse_event *e;
>
> -       e = sse_event_get(event_id);
> -       if (!e)
> -               return SBI_EINVAL;
> +       ret = sse_event_get(event_id, &e);
> +       if (ret)
> +               return ret;
>
>         ret = sse_event_unregister(e);
>         sse_event_put(e);
> @@ -1192,8 +1197,7 @@ void sbi_sse_exit(struct sbi_scratch *scratch)
>         struct sbi_sse_event *e;
>
>         for (i = 0; i < EVENT_COUNT; i++) {
> -               e = sse_event_get(supported_events[i]);
> -               if (!e)
> +               if (sse_event_get(supported_events[i], &e))
>                         continue;
>
>                 if (e->attrs.hartid != current_hartid())
> --
> 2.45.2


Reviewed-by: Atish Patra <atishp@rivosinc.com>

>

