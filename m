From: Dong Du <dd_nirvana@sjtu.edu.cn>
Date: Sat, 8 Jan 2022 17:08:21 +0800 (CST)
Subject: [PATCH 2/2] lib: utils/sys: Extend HTIF library to allow custom
 base address
In-Reply-To: <20220108040336.14414-3-apatel@ventanamicro.com>
References: <20220108040336.14414-1-apatel@ventanamicro.com>
 <20220108040336.14414-3-apatel@ventanamicro.com>
Message-ID: <260135903.10101356.1641632901143.JavaMail.zimbra@sjtu.edu.cn>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Jan 8, 2022, at 12:03 PM, Anup Patel apatel at ventanamicro.com wrote:

> Some of RISC-V emulators provide HTIF at fixed base address so for
> such emulators users have to hard-code HTIF base address in the
> linker script.
> 
> To address this problem, we let users optionally provide fixed HTIF
> base address via platform support (or device tree).
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
> include/sbi_utils/sys/htif.h       |  4 +-
> lib/utils/reset/fdt_reset_htif.c   |  8 +++-
> lib/utils/serial/fdt_serial_htif.c |  8 +++-
> lib/utils/sys/htif.c               | 74 ++++++++++++++++++++++++++----
> 4 files changed, 80 insertions(+), 14 deletions(-)
> 
> diff --git a/include/sbi_utils/sys/htif.h b/include/sbi_utils/sys/htif.h
> index 9cc9634..106a096 100644
> --- a/include/sbi_utils/sys/htif.h
> +++ b/include/sbi_utils/sys/htif.h
> @@ -10,8 +10,8 @@
> 
> #include <sbi/sbi_types.h>
> 
> -int htif_serial_init(void);
> +int htif_serial_init(bool custom_base, unsigned long custom_base_addr);
> 
> -int htif_system_reset_init(void);
> +int htif_system_reset_init(bool custom_base, unsigned long custom_base_addr);
> 
> #endif
> diff --git a/lib/utils/reset/fdt_reset_htif.c b/lib/utils/reset/fdt_reset_htif.c
> index dd08660..ab55198 100644
> --- a/lib/utils/reset/fdt_reset_htif.c
> +++ b/lib/utils/reset/fdt_reset_htif.c
> @@ -14,7 +14,13 @@
> static int htif_reset_init(void *fdt, int nodeoff,
> 			   const struct fdt_match *match)
> {
> -	return htif_system_reset_init();
> +	bool custom;
> +	uint64_t addr = 0;
> +
> +	custom = fdt_get_node_addr_size(fdt, nodeoff, 0, &addr, NULL) ?
> +		 false : true;
> +
> +	return htif_system_reset_init(custom, addr);
> }
> 
> static const struct fdt_match htif_reset_match[] = {
> diff --git a/lib/utils/serial/fdt_serial_htif.c
> b/lib/utils/serial/fdt_serial_htif.c
> index fae55b8..e8bdbb4 100644
> --- a/lib/utils/serial/fdt_serial_htif.c
> +++ b/lib/utils/serial/fdt_serial_htif.c
> @@ -19,7 +19,13 @@ static const struct fdt_match serial_htif_match[] = {
> static int serial_htif_init(void *fdt, int nodeoff,
> 			    const struct fdt_match *match)
> {
> -	return htif_serial_init();
> +	bool custom;
> +	uint64_t addr = 0;
> +
> +	custom = fdt_get_node_addr_size(fdt, nodeoff, 0, &addr, NULL) ?
> +		 false : true;
> +
> +	return htif_serial_init(custom, addr);
> }
> 
> struct fdt_serial fdt_serial_htif = {
> diff --git a/lib/utils/sys/htif.c b/lib/utils/sys/htif.c
> index 7c69c7f..fbee4c7 100644
> --- a/lib/utils/sys/htif.c
> +++ b/lib/utils/sys/htif.c
> @@ -7,6 +7,7 @@
> 
> #include <sbi/riscv_locks.h>
> #include <sbi/sbi_console.h>
> +#include <sbi/sbi_error.h>
> #include <sbi/sbi_system.h>
> #include <sbi_utils/sys/htif.h>
> 
> @@ -47,15 +48,45 @@
> 
> volatile uint64_t tohost __attribute__((section(".htif")));
> volatile uint64_t fromhost __attribute__((section(".htif")));
> +
> +static uint64_t *htif_base = NULL;
> +static bool htif_have_base = false;
> +
> static int htif_console_buf;
> static spinlock_t htif_lock = SPIN_LOCK_INITIALIZER;
> 
> +static inline uint64_t __read_tohost(void)
> +{
> +	return (htif_have_base) ? htif_base[1] : tohost;
> +}
> +
> +static inline void __write_tohost(uint64_t val)
> +{
> +	if (htif_have_base)
> +		htif_base[1] = val;
> +	else
> +		tohost = val;
> +}
> +
> +static inline uint64_t __read_fromhost(void)
> +{
> +	return (htif_have_base) ? htif_base[0] : fromhost;
> +}
> +
> +static inline void __write_fromhost(uint64_t val)
> +{
> +	if (htif_have_base)
> +		htif_base[0] = val;
> +	else
> +		fromhost = val;
> +}
> +
> static void __check_fromhost()
> {
> -	uint64_t fh = fromhost;
> +	uint64_t fh = __read_fromhost();
> 	if (!fh)
> 		return;
> -	fromhost = 0;
> +	__write_fromhost(0);
> 
> 	/* this should be from the console */
> 	if (FROMHOST_DEV(fh) != HTIF_DEV_CONSOLE)
> @@ -73,9 +104,22 @@ static void __check_fromhost()
> 
> static void __set_tohost(uint64_t dev, uint64_t cmd, uint64_t data)
> {
> -	while (tohost)
> +	while (__read_tohost())
> 		__check_fromhost();
> -	tohost = TOHOST_CMD(dev, cmd, data);
> +	__write_tohost(TOHOST_CMD(dev, cmd, data));
> +}
> +
> +static int set_custom_base(bool custom_base, unsigned long custom_base_addr)
> +{
> +	if (custom_base) {
> +		if (htif_have_base &&
> +		    custom_base_addr != (unsigned long)htif_base)

The above could be simplified to: if (htif_have_base)

> +			return SBI_EINVAL;
> +		htif_have_base = true;
> +		htif_base = (uint64_t *)custom_base_addr;

Minor suggestion: it would be better to set the value (htif_base) before setting the flag (htif_have_base).

Besides the above minor issues, looks good to me.

Reviewed-by: Dong Du <Dd_nirvana@sjtu.edu.cn>

Regards,
Dong

> +	}
> +
> +	return 0;
> }
> 
> #if __riscv_xlen == 32
> @@ -148,10 +192,15 @@ static struct sbi_console_device htif_console = {
> 	.console_getc = htif_getc
> };
> 
> -int htif_serial_init(void)
> +int htif_serial_init(bool custom_base, unsigned long custom_base_addr)
> {
> -	sbi_console_set_device(&htif_console);
> +	int rc;
> +
> +	rc = set_custom_base(custom_base, custom_base_addr);
> +	if (rc)
> +		return rc;
> 
> +	sbi_console_set_device(&htif_console);
> 	return 0;
> }
> 
> @@ -163,8 +212,8 @@ static int htif_system_reset_check(u32 type, u32 reason)
> static void htif_system_reset(u32 type, u32 reason)
> {
> 	while (1) {
> -		fromhost = 0;
> -		tohost = 1;
> +		__write_fromhost(0);
> +		__write_tohost(1);
> 	}
> }
> 
> @@ -174,9 +223,14 @@ static struct sbi_system_reset_device htif_reset = {
> 	.system_reset = htif_system_reset
> };
> 
> -int htif_system_reset_init(void)
> +int htif_system_reset_init(bool custom_base, unsigned long custom_base_addr)
> {
> -	sbi_system_reset_add_device(&htif_reset);
> +	int rc;
> +
> +	rc = set_custom_base(custom_base, custom_base_addr);
> +	if (rc)
> +		return rc;
> 
> +	sbi_system_reset_add_device(&htif_reset);
> 	return 0;
> }
> --
> 2.25.1
> 
> 
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

