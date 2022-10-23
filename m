From: Anup Patel <anup@brainfault.org>
Date: Sun, 23 Oct 2022 11:11:31 +0530
Subject: [PATCH 2/3] lib: sbi_ecall: Generate extensions list with carray
In-Reply-To: <TYYP286MB1439A8ACCFD1DCC62C87208AC6209@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
References: <TYYP286MB1439D0F7EA824413E8EF63FCC6209@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
 <TYYP286MB1439A8ACCFD1DCC62C87208AC6209@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
Message-ID: <CAAhSdy2c4AzwtC_Q30PJE-cSUt0+b=-tUeCp8xWV3VpwrdX=LQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Oct 10, 2022 at 10:05 PM Vivian Wang <dramforever@live.com> wrote:
>
> Instead of hard-coding the list of extensions in C code, use carray to
> generate the list of extensions.
>
> Using carray makes adding and removing extensions slightly cleaner. This
> also paves the way for using Kconfig to disable unneeded extensions.
>
> Signed-off-by: Vivian Wang <dramforever@live.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  include/sbi/sbi_ecall.h       | 10 ---------
>  lib/sbi/objects.mk            | 22 ++++++++++++++++----
>  lib/sbi/sbi_ecall.c           | 39 ++++++++++-------------------------
>  lib/sbi/sbi_ecall_exts.carray |  3 +++
>  4 files changed, 32 insertions(+), 42 deletions(-)
>  create mode 100644 lib/sbi/sbi_ecall_exts.carray
>
> diff --git a/include/sbi/sbi_ecall.h b/include/sbi/sbi_ecall.h
> index 046a56a..ff9bf8e 100644
> --- a/include/sbi/sbi_ecall.h
> +++ b/include/sbi/sbi_ecall.h
> @@ -31,16 +31,6 @@ struct sbi_ecall_extension {
>                        struct sbi_trap_info *out_trap);
>  };
>
> -extern struct sbi_ecall_extension ecall_base;
> -extern struct sbi_ecall_extension ecall_legacy;
> -extern struct sbi_ecall_extension ecall_time;
> -extern struct sbi_ecall_extension ecall_rfence;
> -extern struct sbi_ecall_extension ecall_ipi;
> -extern struct sbi_ecall_extension ecall_vendor;
> -extern struct sbi_ecall_extension ecall_hsm;
> -extern struct sbi_ecall_extension ecall_srst;
> -extern struct sbi_ecall_extension ecall_pmu;
> -
>  u16 sbi_ecall_version_major(void);
>
>  u16 sbi_ecall_version_minor(void);
> diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
> index 1ed1983..fa20b7b 100644
> --- a/lib/sbi/objects.mk
> +++ b/lib/sbi/objects.mk
> @@ -12,17 +12,31 @@ libsbi-objs-y += riscv_atomic.o
>  libsbi-objs-y += riscv_hardfp.o
>  libsbi-objs-y += riscv_locks.o
>
> -libsbi-objs-y += sbi_bitmap.o
> -libsbi-objs-y += sbi_bitops.o
> -libsbi-objs-y += sbi_console.o
> -libsbi-objs-y += sbi_domain.o
>  libsbi-objs-y += sbi_ecall.o
> +libsbi-objs-y += sbi_ecall_exts.o
> +
> +# The order of below extensions is performance optimized
> +carray-sbi_ecall_exts-y += ecall_time
> +carray-sbi_ecall_exts-y += ecall_rfence
> +carray-sbi_ecall_exts-y += ecall_ipi
> +carray-sbi_ecall_exts-y += ecall_base
> +carray-sbi_ecall_exts-y += ecall_hsm
> +carray-sbi_ecall_exts-y += ecall_srst
> +carray-sbi_ecall_exts-y += ecall_pmu
> +carray-sbi_ecall_exts-y += ecall_legacy
> +carray-sbi_ecall_exts-y += ecall_vendor
> +
>  libsbi-objs-y += sbi_ecall_base.o
>  libsbi-objs-y += sbi_ecall_hsm.o
>  libsbi-objs-y += sbi_ecall_legacy.o
>  libsbi-objs-y += sbi_ecall_pmu.o
>  libsbi-objs-y += sbi_ecall_replace.o
>  libsbi-objs-y += sbi_ecall_vendor.o
> +
> +libsbi-objs-y += sbi_bitmap.o
> +libsbi-objs-y += sbi_bitops.o
> +libsbi-objs-y += sbi_console.o
> +libsbi-objs-y += sbi_domain.o
>  libsbi-objs-y += sbi_emulate_csr.o
>  libsbi-objs-y += sbi_fifo.o
>  libsbi-objs-y += sbi_hart.o
> diff --git a/lib/sbi/sbi_ecall.c b/lib/sbi/sbi_ecall.c
> index ce021eb..25dd78c 100644
> --- a/lib/sbi/sbi_ecall.c
> +++ b/lib/sbi/sbi_ecall.c
> @@ -13,6 +13,9 @@
>  #include <sbi/sbi_error.h>
>  #include <sbi/sbi_trap.h>
>
> +extern struct sbi_ecall_extension *sbi_ecall_exts[];
> +extern unsigned long sbi_ecall_exts_size;
> +
>  u16 sbi_ecall_version_major(void)
>  {
>         return SBI_ECALL_VERSION_MAJOR;
> @@ -144,35 +147,15 @@ int sbi_ecall_handler(struct sbi_trap_regs *regs)
>  int sbi_ecall_init(void)
>  {
>         int ret;
> +       struct sbi_ecall_extension *ext;
> +       unsigned long i;
>
> -       /* The order of below registrations is performance optimized */
> -       ret = sbi_ecall_register_extension(&ecall_time);
> -       if (ret)
> -               return ret;
> -       ret = sbi_ecall_register_extension(&ecall_rfence);
> -       if (ret)
> -               return ret;
> -       ret = sbi_ecall_register_extension(&ecall_ipi);
> -       if (ret)
> -               return ret;
> -       ret = sbi_ecall_register_extension(&ecall_base);
> -       if (ret)
> -               return ret;
> -       ret = sbi_ecall_register_extension(&ecall_hsm);
> -       if (ret)
> -               return ret;
> -       ret = sbi_ecall_register_extension(&ecall_srst);
> -       if (ret)
> -               return ret;
> -       ret = sbi_ecall_register_extension(&ecall_pmu);
> -       if (ret)
> -               return ret;
> -       ret = sbi_ecall_register_extension(&ecall_legacy);
> -       if (ret)
> -               return ret;
> -       ret = sbi_ecall_register_extension(&ecall_vendor);
> -       if (ret)
> -               return ret;
> +       for (i = 0; i < sbi_ecall_exts_size; i++) {
> +               ext = sbi_ecall_exts[i];
> +               ret = sbi_ecall_register_extension(ext);
> +               if (ret)
> +                       return ret;
> +       }
>
>         return 0;
>  }
> diff --git a/lib/sbi/sbi_ecall_exts.carray b/lib/sbi/sbi_ecall_exts.carray
> new file mode 100644
> index 0000000..710e3ed
> --- /dev/null
> +++ b/lib/sbi/sbi_ecall_exts.carray
> @@ -0,0 +1,3 @@
> +HEADER: sbi/sbi_ecall.h
> +TYPE: struct sbi_ecall_extension
> +NAME: sbi_ecall_exts
> --
> 2.37.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

