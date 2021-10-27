From: Dong Du <dd_nirvana@sjtu.edu.cn>
Date: Wed, 27 Oct 2021 22:50:57 +0800 (CST)
Subject: [PATCH v3 1/3] lib: sbi: move sbi_boot_print_general()
In-Reply-To: <20211026134822.28220-2-heinrich.schuchardt@canonical.com>
References: <20211026134822.28220-1-heinrich.schuchardt@canonical.com>
 <20211026134822.28220-2-heinrich.schuchardt@canonical.com>
Message-ID: <1315555239.773100.1635346257904.JavaMail.zimbra@sjtu.edu.cn>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Oct 26, 2021, at 9:48 PM, Heinrich Schuchardt heinrich.schuchardt at canonical.com wrote:

> Moving the sbi_boot_print_general() call after the
> sbi_platform_final_init() call allows to print devices initialized in the
> latter.
> 
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
> v3:
>	no change
> v2:
>	new patch
> ---

Looks good to me.

Reviewed-by: Dong Du <Dd_nirvana@sjtu.edu.cn>

> lib/sbi/sbi_init.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> index b1c7cf0..18eb0d7 100644
> --- a/lib/sbi/sbi_init.c
> +++ b/lib/sbi/sbi_init.c
> @@ -301,8 +301,6 @@ static void __noreturn init_coldboot(struct sbi_scratch
> *scratch, u32 hartid)
> 		sbi_hart_hang();
> 	}
> 
> -	sbi_boot_print_general(scratch);
> -
> 	/*
> 	 * Note: Finalize domains after HSM initialization so that we
> 	 * can startup non-root domains.
> @@ -336,6 +334,8 @@ static void __noreturn init_coldboot(struct sbi_scratch
> *scratch, u32 hartid)
> 		sbi_hart_hang();
> 	}
> 
> +	sbi_boot_print_general(scratch);
> +
> 	sbi_boot_print_hart(scratch, hartid);
> 
> 	wake_coldboot_harts(scratch, hartid);
> --
> 2.32.0
> 
> 
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

