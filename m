From: Anup Patel <anup@brainfault.org>
Date: Sun, 23 Mar 2025 09:48:50 +0530
Subject: [PATCH v2 1/4] lib: sbi_mpxy: Export MPXY data structures
In-Reply-To: <20250225011640.949660-2-alvinga@andestech.com>
References: <20250225011640.949660-1-alvinga@andestech.com> <20250225011640.949660-2-alvinga@andestech.com>
Message-ID: <CAAhSdy3bDCVDZq-T5ytSpmPJ28D7eNVPWSKUiXL37-dExnM1Cw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 25, 2025 at 6:47?AM Alvin Chang <alvinga@andestech.com> wrote:
>
> Move MPXY data structures from private C source file to public header so
> that other modules can reference them.
>
> Signed-off-by: Alvin Chang <alvinga@andestech.com>
> Reviewed-by: Yu-Chien Peter Lin <peter.lin@sifive.com>

No need for this patch.

Regards,
Anup

> ---
>  include/sbi/sbi_mpxy.h | 15 +++++++++++++++
>  lib/sbi/sbi_mpxy.c     | 15 ---------------
>  2 files changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/include/sbi/sbi_mpxy.h b/include/sbi/sbi_mpxy.h
> index 9da2791..5e5836c 100644
> --- a/include/sbi/sbi_mpxy.h
> +++ b/include/sbi/sbi_mpxy.h
> @@ -14,6 +14,21 @@
>
>  struct sbi_scratch;
>
> +/** Per hart shared memory */
> +struct mpxy_shmem {
> +       unsigned long shmem_addr_lo;
> +       unsigned long shmem_addr_hi;
> +};
> +
> +struct mpxy_state {
> +       /* MSI support in MPXY */
> +       bool msi_avail;
> +       /* SSE support in MPXY */
> +       bool sse_avail;
> +       /* MPXY Shared memory details */
> +       struct mpxy_shmem shmem;
> +};
> +
>  #define SBI_MPXY_MSGPROTO_VERSION(Major, Minor) ((Major << 16) | Minor)
>
>  enum sbi_mpxy_attr_id {
> diff --git a/lib/sbi/sbi_mpxy.c b/lib/sbi/sbi_mpxy.c
> index c5d9d1b..cf40e83 100644
> --- a/lib/sbi/sbi_mpxy.c
> +++ b/lib/sbi/sbi_mpxy.c
> @@ -74,21 +74,6 @@ static SBI_LIST_HEAD(mpxy_channel_list);
>  #error "Undefined XLEN"
>  #endif
>
> -/** Per hart shared memory */
> -struct mpxy_shmem {
> -       unsigned long shmem_addr_lo;
> -       unsigned long shmem_addr_hi;
> -};
> -
> -struct mpxy_state {
> -       /* MSI support in MPXY */
> -       bool msi_avail;
> -       /* SSE support in MPXY */
> -       bool sse_avail;
> -       /* MPXY Shared memory details */
> -       struct mpxy_shmem shmem;
> -};
> -
>  /** Disable hart shared memory */
>  static inline void sbi_mpxy_shmem_disable(struct mpxy_state *ms)
>  {
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

