From: Anup Patel <anup@brainfault.org>
Date: Tue, 9 Jan 2024 16:03:53 +0530
Subject: [PATCH v2 7/7] lib: sbi: Print number of debug triggers found
In-Reply-To: <20240108065525.208172-8-hchauhan@ventanamicro.com>
References: <20240108065525.208172-1-hchauhan@ventanamicro.com> <20240108065525.208172-8-hchauhan@ventanamicro.com>
Message-ID: <CAAhSdy3ZSMgkqH3z=YSvbUbhPZiSesd8L5WvRbvx+7bRN_VeMw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 8, 2024 at 12:25?PM Himanshu Chauhan
<hchauhan@ventanamicro.com> wrote:
>
> Print the total number of triggers found on the boot hart.
>
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>

Already reviewed previously.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  lib/sbi/sbi_init.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> index 0dcde27..c5612a0 100644
> --- a/lib/sbi/sbi_init.c
> +++ b/lib/sbi/sbi_init.c
> @@ -184,6 +184,8 @@ static void sbi_boot_print_hart(struct sbi_scratch *scratch, u32 hartid)
>         sbi_printf("Boot HART MHPM Info       : %lu (0x%08x)\n",
>                    sbi_popcount(sbi_hart_mhpm_mask(scratch)),
>                    sbi_hart_mhpm_mask(scratch));
> +       sbi_printf("Boot HART Debug Triggers  : %d trigger(s) found.\n",
> +                  sbi_dbtr_get_total_triggers());
>         sbi_hart_delegation_dump(scratch, "Boot HART ", "         ");
>  }
>
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

