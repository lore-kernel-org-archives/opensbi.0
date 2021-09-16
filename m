From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 16 Sep 2021 15:33:18 +0800
Subject: [PATCH 2/5] lib: sbi: Add timer frequency to struct
 sbi_timer_device
In-Reply-To: <20210915092128.1029868-3-anup.patel@wdc.com>
References: <20210915092128.1029868-1-anup.patel@wdc.com>
 <20210915092128.1029868-3-anup.patel@wdc.com>
Message-ID: <CAEUhbmUfqoULm9hOsjYKrsfQEGjb38MMwog2GmpgXukK4HUqjA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 15, 2021 at 5:22 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> Generic mdelay() and udelay() functions can be provided by the
> sbi_timer framework if timer frequency is available in the timer
> instance provided by the platform support or timer driver.
>
> This patch adds timer frequency (timer_freq) member in the
> struct sbi_timer_device for above purpose.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  include/sbi/sbi_timer.h                 | 3 +++
>  include/sbi_utils/timer/aclint_mtimer.h | 1 +
>  lib/utils/timer/aclint_mtimer.c         | 3 +++
>  lib/utils/timer/fdt_timer_mtimer.c      | 4 ++++
>  platform/fpga/ariane/platform.c         | 2 ++
>  platform/fpga/openpiton/platform.c      | 7 +++++++
>  platform/kendryte/k210/platform.c       | 1 +
>  platform/kendryte/k210/platform.h       | 2 +-
>  platform/nuclei/ux600/platform.c        | 1 +
>  platform/template/platform.c            | 2 ++
>  10 files changed, 25 insertions(+), 1 deletion(-)
>
> diff --git a/include/sbi/sbi_timer.h b/include/sbi/sbi_timer.h
> index 1ba6da0..211e83d 100644
> --- a/include/sbi/sbi_timer.h
> +++ b/include/sbi/sbi_timer.h
> @@ -17,6 +17,9 @@ struct sbi_timer_device {
>         /** Name of the timer operations */
>         char name[32];
>
> +       /** Frequency of timer in HZ */
> +       unsigned long timer_freq;
> +
>         /** Get free-running timer value */
>         u64 (*timer_value)(void);
>
> diff --git a/include/sbi_utils/timer/aclint_mtimer.h b/include/sbi_utils/timer/aclint_mtimer.h
> index a9fe445..f02cc62 100644
> --- a/include/sbi_utils/timer/aclint_mtimer.h
> +++ b/include/sbi_utils/timer/aclint_mtimer.h
> @@ -24,6 +24,7 @@
>
>  struct aclint_mtimer_data {
>         /* Public details */
> +       unsigned long mtime_freq;
>         unsigned long mtime_addr;
>         unsigned long mtime_size;
>         unsigned long mtimecmp_addr;
> diff --git a/lib/utils/timer/aclint_mtimer.c b/lib/utils/timer/aclint_mtimer.c
> index d612b12..62e87f7 100644
> --- a/lib/utils/timer/aclint_mtimer.c
> +++ b/lib/utils/timer/aclint_mtimer.c
> @@ -186,6 +186,8 @@ int aclint_mtimer_cold_init(struct aclint_mtimer_data *mt,
>             (mt->first_hartid >= SBI_HARTMASK_MAX_BITS) ||
>             (mt->hart_count > ACLINT_MTIMER_MAX_HARTS))
>                 return SBI_EINVAL;
> +       if (reference && mt->mtime_freq != reference->mtime_freq)
> +               return SBI_EINVAL;
>
>         /* Initialize private data */
>         aclint_mtimer_set_reference(mt, reference);
> @@ -227,6 +229,7 @@ int aclint_mtimer_cold_init(struct aclint_mtimer_data *mt,
>                         return rc;
>         }
>
> +       mtimer.timer_freq = mt->mtime_freq;
>         sbi_timer_set_device(&mtimer);
>
>         return 0;
> diff --git a/lib/utils/timer/fdt_timer_mtimer.c b/lib/utils/timer/fdt_timer_mtimer.c
> index 4eafffa..1ad8508 100644
> --- a/lib/utils/timer/fdt_timer_mtimer.c
> +++ b/lib/utils/timer/fdt_timer_mtimer.c
> @@ -38,6 +38,10 @@ static int timer_mtimer_cold_init(void *fdt, int nodeoff,
>         mt->has_64bit_mmio = true;
>         mt->has_shared_mtime = false;
>
> +       rc = fdt_parse_timebase_frequency(fdt, &mt->mtime_freq);
> +       if (rc)
> +               return rc;
> +
>         if (match->data) { /* SiFive CLINT */
>                 /* Set CLINT addresses */
>                 mt->mtimecmp_addr = addr[0] + ACLINT_DEFAULT_MTIMECMP_OFFSET;
> diff --git a/platform/fpga/ariane/platform.c b/platform/fpga/ariane/platform.c
> index 58a46c0..b17b61d 100644
> --- a/platform/fpga/ariane/platform.c
> +++ b/platform/fpga/ariane/platform.c
> @@ -26,6 +26,7 @@
>  #define ARIANE_PLIC_NUM_SOURCES                        3
>  #define ARIANE_HART_COUNT                      1
>  #define ARIANE_CLINT_ADDR                      0x2000000
> +#define ARIANE_ACLINT_FREQ                     1000000

Better to name it as ARIANE_ACLINT_TIMER_FREQ ?

>  #define ARIANE_ACLINT_MSWI_ADDR                        (ARIANE_CLINT_ADDR + \
>                                                  CLINT_MSWI_OFFSET)
>  #define ARIANE_ACLINT_MTIMER_ADDR              (ARIANE_CLINT_ADDR + \
> @@ -44,6 +45,7 @@ static struct aclint_mswi_data mswi = {
>  };
>
>  static struct aclint_mtimer_data mtimer = {
> +       .mtime_freq = ARIANE_ACLINT_FREQ,
>         .mtime_addr = ARIANE_ACLINT_MTIMER_ADDR +
>                       ACLINT_DEFAULT_MTIME_OFFSET,
>         .mtime_size = ACLINT_DEFAULT_MTIME_SIZE,
> diff --git a/platform/fpga/openpiton/platform.c b/platform/fpga/openpiton/platform.c
> index a9bfa99..47d3f30 100644
> --- a/platform/fpga/openpiton/platform.c
> +++ b/platform/fpga/openpiton/platform.c
> @@ -25,6 +25,7 @@
>  #define OPENPITON_DEFAULT_PLIC_ADDR            0xfff1100000
>  #define OPENPITON_DEFAULT_PLIC_NUM_SOURCES     2
>  #define OPENPITON_DEFAULT_HART_COUNT           3
> +#define OPENPITON_DEFAULT_CLINT_FREQ           1000000

ACLINT_TIMER_FREQ ?

>  #define OPENPITON_DEFAULT_CLINT_ADDR           0xfff1020000
>  #define OPENPITON_DEFAULT_ACLINT_MSWI_ADDR     \
>                 (OPENPITON_DEFAULT_CLINT_ADDR + CLINT_MSWI_OFFSET)
> @@ -49,6 +50,7 @@ static struct aclint_mswi_data mswi = {
>  };
>
>  static struct aclint_mtimer_data mtimer = {
> +       .mtime_freq = OPENPITON_DEFAULT_CLINT_FREQ,
>         .mtime_addr = OPENPITON_DEFAULT_ACLINT_MTIMER_ADDR +
>                       ACLINT_DEFAULT_MTIME_OFFSET,
>         .mtime_size = ACLINT_DEFAULT_MTIME_SIZE,
> @@ -68,6 +70,7 @@ static int openpiton_early_init(bool cold_boot)
>         void *fdt;
>         struct platform_uart_data uart_data;
>         struct plic_data plic_data;
> +       unsigned long aclint_freq;
>         uint64_t clint_addr;
>         int rc;
>
> @@ -83,6 +86,10 @@ static int openpiton_early_init(bool cold_boot)
>         if (!rc)
>                 plic = plic_data;
>
> +       rc = fdt_parse_timebase_frequency(fdt, &aclint_freq);
> +       if (!rc)
> +               mtimer.mtime_freq = aclint_freq;
> +
>         rc = fdt_parse_compat_addr(fdt, &clint_addr, "riscv,clint0");
>         if (!rc) {
>                 mswi.addr = clint_addr;
> diff --git a/platform/kendryte/k210/platform.c b/platform/kendryte/k210/platform.c
> index ee4c223..6ec9699 100644
> --- a/platform/kendryte/k210/platform.c
> +++ b/platform/kendryte/k210/platform.c
> @@ -42,6 +42,7 @@ static struct aclint_mswi_data mswi = {
>  };
>
>  static struct aclint_mtimer_data mtimer = {
> +       .mtime_freq = K210_ACLINT_FREQ,
>         .mtime_addr = K210_ACLINT_MTIMER_ADDR +
>                       ACLINT_DEFAULT_MTIME_OFFSET,
>         .mtime_size = ACLINT_DEFAULT_MTIME_SIZE,
> diff --git a/platform/kendryte/k210/platform.h b/platform/kendryte/k210/platform.h
> index 0a32530..79befe2 100644
> --- a/platform/kendryte/k210/platform.h
> +++ b/platform/kendryte/k210/platform.h
> @@ -14,7 +14,7 @@
>  #define K210_HART_COUNT                2
>
>  #define K210_UART_BAUDRATE     115200
> -
> +#define K210_ACLINT_FREQ       7800000
>  #define K210_CLK0_FREQ         26000000UL
>  #define K210_PLIC_NUM_SOURCES  65
>
> diff --git a/platform/nuclei/ux600/platform.c b/platform/nuclei/ux600/platform.c
> index ab0becc..6bef4c4 100644
> --- a/platform/nuclei/ux600/platform.c
> +++ b/platform/nuclei/ux600/platform.c
> @@ -74,6 +74,7 @@ static struct aclint_mswi_data mswi = {
>  };
>
>  static struct aclint_mtimer_data mtimer = {
> +       .mtime_freq = UX600_TIMER_FREQ,

UX600_ACLINT_TIMER_FREQ?

>         .mtime_addr = UX600_ACLINT_MTIMER_ADDR +
>                       ACLINT_DEFAULT_MTIME_OFFSET,
>         .mtime_size = ACLINT_DEFAULT_MTIME_SIZE,
> diff --git a/platform/template/platform.c b/platform/template/platform.c
> index 4528822..99e70c6 100644
> --- a/platform/template/platform.c
> +++ b/platform/template/platform.c
> @@ -22,6 +22,7 @@
>  #define PLATFORM_PLIC_NUM_SOURCES      128
>  #define PLATFORM_HART_COUNT            4
>  #define PLATFORM_CLINT_ADDR            0x2000000
> +#define PLATFORM_ACLINT_FREQ           10000000
>  #define PLATFORM_ACLINT_MSWI_ADDR      (PLATFORM_CLINT_ADDR + \
>                                          CLINT_MSWI_OFFSET)
>  #define PLATFORM_ACLINT_MTIMER_ADDR    (PLATFORM_CLINT_ADDR + \
> @@ -43,6 +44,7 @@ static struct aclint_mswi_data mswi = {
>  };
>
>  static struct aclint_mtimer_data mtimer = {
> +       .mtime_freq = PLATFORM_ACLINT_FREQ,
>         .mtime_addr = PLATFORM_ACLINT_MTIMER_ADDR +
>                       ACLINT_DEFAULT_MTIME_OFFSET,
>         .mtime_size = ACLINT_DEFAULT_MTIME_SIZE,
> --

Regards,
Bin

