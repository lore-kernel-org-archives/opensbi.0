From: Xiang W <wxjstz@126.com>
Date: Sat, 25 Sep 2021 15:46:42 +0800
Subject: [PATCH 1/2] lib: sbi: Introduce early hart initialization scheme
In-Reply-To: <20210923022839.17777-1-ycliang@andestech.com>
References: <20210923022839.17777-1-ycliang@andestech.com>
Message-ID: <1fdd83b77e99ade5faf95e379b399970fa02577d.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2021-09-23???? 10:28 +0800?Leo Yu-Chi Liang???
> Referencing U-Boot (edd9ad81 riscv: cpu: Add callback to init each
> core)
> Introduce a callback function for each hart to do its own
> initialization
> as early as possible.
> 
> Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
> ---
> ?firmware/fw_base.S | 6 ++++++
> ?lib/sbi/sbi_init.c | 4 ++++
> ?2 files changed, 10 insertions(+)
> 
> diff --git a/firmware/fw_base.S b/firmware/fw_base.S
> index 1569e60..dfbe7d7 100644
> --- a/firmware/fw_base.S
> +++ b/firmware/fw_base.S
> @@ -47,6 +47,12 @@
> ????????.globl _start
> ????????.globl _start_warm
> ?_start:
> +???????/* Setup temporary stack */
> +???????lla?????s4, _fw_end
> +???????li??????s5, (SBI_SCRATCH_SIZE * 2)
> +???????add?????sp, s4, s5
> +???????/* call harts_early_init */
> +???????call harts_early_init
This will destroy the parameters (a0/a1/a2) that the firmware passed to
opensbi in the previous stage. And here, the stack pointers of multiple
cores are set to the same memory address, which may cause  memory
conflicts. 

Regards,
Xiang W
> ????????/* Find preferred boot HART id */
> ????????MOV_3R??s0, a0, s1, a1, s2, a2
> ????????call????fw_boot_hart
> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> index 6ef8742..02acac0 100644
> --- a/lib/sbi/sbi_init.c
> +++ b/lib/sbi/sbi_init.c
> @@ -536,3 +536,7 @@ void __noreturn sbi_exit(struct sbi_scratch
> *scratch)
> ?
> ????????sbi_hsm_exit(scratch);
> ?}
> +
> +__attribute__((weak)) void harts_early_init(void)
> +{
> +}
> -- 
> 2.17.0
> 
> 



