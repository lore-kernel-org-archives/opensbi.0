From: Anup Patel <anup@brainfault.org>
Date: Sun, 11 Jul 2021 10:50:02 +0530
Subject: [PATCH v5 07/15] lib: sbi: Remove redundant boot time print
 statement
In-Reply-To: <20210710161816.632364-8-atish.patra@wdc.com>
References: <20210710161816.632364-1-atish.patra@wdc.com>
 <20210710161816.632364-8-atish.patra@wdc.com>
Message-ID: <CAAhSdy0L5GyxD7hPbMdvtk+GfAxJp2SxYL8=PGGGgZs-sz7oKA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jul 10, 2021 at 9:48 PM Atish Patra <atish.patra@wdc.com> wrote:
>
> Reviewed-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/sbi/sbi_init.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> index e396d95d424c..30747776f3bf 100644
> --- a/lib/sbi/sbi_init.c
> +++ b/lib/sbi/sbi_init.c
> @@ -137,8 +137,6 @@ static void sbi_boot_print_hart(struct sbi_scratch *scratch, u32 hartid)
>                    sbi_hart_pmp_addrbits(scratch));
>         sbi_printf("Boot HART MHPM Count      : %d\n",
>                    sbi_hart_mhpm_count(scratch));
> -       sbi_printf("Boot HART MHPM Count      : %d\n",
> -                  sbi_hart_mhpm_count(scratch));
>         sbi_hart_delegation_dump(scratch, "Boot HART ", "         ");
>  }
>
> --
> 2.31.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

