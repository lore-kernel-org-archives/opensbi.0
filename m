From: Anup Patel <anup@brainfault.org>
Date: Wed, 1 Jun 2022 18:30:08 +0530
Subject: [RFC PATCH v2 6/9] lib: irqchip/plic: Add priority save/restore helpers
In-Reply-To: <20220530033738.27127-7-samuel@sholland.org>
References: <20220530033738.27127-1-samuel@sholland.org> <20220530033738.27127-7-samuel@sholland.org>
Message-ID: <CAAhSdy12bfaULJPpO6d-QtoUZuEv0Rq6u2KDnk0m-5w3__r8-w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 30, 2022 at 9:07 AM Samuel Holland <samuel@sholland.org> wrote:
>
> These can be used by platform code to save the PLIC priority state, if
> it would otherwise be lost during non-retentive suspend. The platform
> is responsible for allocating all necessary storage.
>
> As a space optimization, store the saved priority values as 8-bit
> integers, since that is large enough to hold any priority value on the
> relevant platforms.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>
> Changes in v2:
>  - New patch for v2
>
>  include/sbi_utils/irqchip/plic.h |  4 ++++
>  lib/utils/irqchip/plic.c         | 20 ++++++++++++++++++++
>  2 files changed, 24 insertions(+)
>
> diff --git a/include/sbi_utils/irqchip/plic.h b/include/sbi_utils/irqchip/plic.h
> index 21b2266..566fd7a 100644
> --- a/include/sbi_utils/irqchip/plic.h
> +++ b/include/sbi_utils/irqchip/plic.h
> @@ -17,6 +17,10 @@ struct plic_data {
>         unsigned long num_src;
>  };
>
> +void plic_priority_save(const struct plic_data *plic, u8 *priority);
> +
> +void plic_priority_restore(const struct plic_data *plic, const u8 *priority);
> +
>  void plic_context_save(const struct plic_data *plic, int context_id,
>                        u32 *enable, u32 *threshold);
>
> diff --git a/lib/utils/irqchip/plic.c b/lib/utils/irqchip/plic.c
> index 0c64078..b0329b8 100644
> --- a/lib/utils/irqchip/plic.c
> +++ b/lib/utils/irqchip/plic.c
> @@ -22,6 +22,13 @@
>  #define PLIC_CONTEXT_BASE 0x200000
>  #define PLIC_CONTEXT_STRIDE 0x1000
>
> +static u32 plic_get_priority(const struct plic_data *plic, u32 source)
> +{
> +       volatile void *plic_priority = (char *)plic->addr +
> +                       PLIC_PRIORITY_BASE + 4 * source;
> +       return readl(plic_priority);
> +}
> +
>  static void plic_set_priority(const struct plic_data *plic, u32 source, u32 val)
>  {
>         volatile void *plic_priority = (char *)plic->addr +
> @@ -29,6 +36,19 @@ static void plic_set_priority(const struct plic_data *plic, u32 source, u32 val)
>         writel(val, plic_priority);
>  }
>
> +/* So far, priorities on all consumers of these functions fit in 8 bits. */
> +void plic_priority_save(const struct plic_data *plic, u8 *priority)
> +{
> +       for (u32 i = 0; i < plic->num_src; i++)
> +               priority[i] = plic_get_priority(plic, i);
> +}
> +
> +void plic_priority_restore(const struct plic_data *plic, const u8 *priority)
> +{
> +       for (u32 i = 0; i < plic->num_src; i++)
> +               plic_set_priority(plic, i, priority[i]);
> +}
> +
>  static u32 plic_get_thresh(const struct plic_data *plic, u32 cntxid)
>  {
>         volatile void *plic_thresh;
> --
> 2.35.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

