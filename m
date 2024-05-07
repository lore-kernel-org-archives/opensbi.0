From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 7 May 2024 17:22:57 +0530
Subject: [PATCH 2/7] lib: sbi: sse: rename sse_hart_unlock() to sse_enabled_event_unlock()
In-Reply-To: <20240409100216.263256-3-cleger@rivosinc.com>
References: <20240409100216.263256-1-cleger@rivosinc.com> <20240409100216.263256-3-cleger@rivosinc.com>
Message-ID: <CAK9=C2X9AHErejEPggjcJno4MYOk24nKseEHVX2KGhuhEvvSqg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 9, 2024 at 3:32?PM Cl?ment L?ger <cleger@rivosinc.com> wrote:
>
> There was a naming incoherency between enabled events list lock/unlock.
> Rename sse_hart_unlock() to sse_enabled_event_unlock() to be coherent
> and reword comments above lock()/unlock() functions.
>
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  lib/sbi/sbi_sse.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
> index 39b4588..d54c125 100644
> --- a/lib/sbi/sbi_sse.c
> +++ b/lib/sbi/sbi_sse.c
> @@ -208,7 +208,7 @@ static struct sse_global_event *sse_get_global_event(struct sbi_sse_event *e)
>  }
>
>  /**
> - * If event is global, must be called under global event lock
> + * If event is global, must be called under enabled event lock
>   */
>  static void sse_enabled_event_lock(struct sbi_sse_event *e)
>  {
> @@ -219,9 +219,9 @@ static void sse_enabled_event_lock(struct sbi_sse_event *e)
>  }
>
>  /**
> - * If event is global, must be called under global event lock
> + * If event is global, must be called under enabled event lock
>   */
> -static void sse_hart_unlock(struct sbi_sse_event *e)
> +static void sse_enabled_event_unlock(struct sbi_sse_event *e)
>  {
>         struct sse_hart_state *shs;
>
> @@ -753,7 +753,7 @@ int sbi_sse_enable(uint32_t event_id)
>
>         sse_enabled_event_lock(e);
>         ret = sse_event_enable(e);
> -       sse_hart_unlock(e);
> +       sse_enabled_event_unlock(e);
>         sse_event_put(e);
>
>         return ret;
> @@ -770,7 +770,7 @@ int sbi_sse_disable(uint32_t event_id)
>
>         sse_enabled_event_lock(e);
>         ret = sse_event_disable(e);
> -       sse_hart_unlock(e);
> +       sse_enabled_event_unlock(e);
>
>         sse_event_put(e);
>
> --
> 2.43.0
>

