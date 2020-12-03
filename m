From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 3 Dec 2020 15:59:17 -0800
Subject: [PATCH 05/11] include: sbi: Use lower bits for domain memory
 region permissions
In-Reply-To: <20201121094756.4154728-6-anup.patel@wdc.com>
References: <20201121094756.4154728-1-anup.patel@wdc.com>
 <20201121094756.4154728-6-anup.patel@wdc.com>
Message-ID: <CAOnJCU+e8URp+sE5Pm1Jga4gc-MqsXTb0dQ0_SftBoqhqT=HWQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Nov 21, 2020 at 2:53 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> We should use lower bits for domain memory region access permissions
> and higher bits for other domain memory region attributes. This helps
> us use same bit assignment for parsing domain memory region access
> permissions from device tree.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  include/sbi/sbi_domain.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
> index 6f90b26..a7cb61e 100644
> --- a/include/sbi/sbi_domain.h
> +++ b/include/sbi/sbi_domain.h
> @@ -39,8 +39,10 @@ struct sbi_domain_memregion {
>  #define SBI_DOMAIN_MEMREGION_READABLE          (1UL << 0)
>  #define SBI_DOMAIN_MEMREGION_WRITEABLE         (1UL << 1)
>  #define SBI_DOMAIN_MEMREGION_EXECUTABLE                (1UL << 2)
> -#define SBI_DOMAIN_MEMREGION_MMIO              (1UL << 3)
> -#define SBI_DOMAIN_MEMREGION_MMODE             (1UL << 4)
> +#define SBI_DOMAIN_MEMREGION_MMODE             (1UL << 3)
> +#define SBI_DOMAIN_MEMREGION_ACCESS_MASK       (0xfUL)
> +
> +#define SBI_DOMAIN_MEMREGION_MMIO              (1UL << 31)
>         unsigned long flags;
>  };
>
> --
> 2.25.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi


Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

