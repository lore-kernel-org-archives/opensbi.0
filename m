From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Date: Tue, 27 Dec 2022 14:25:24 -0300
Subject: [PATCH] lib: utils/sys: Allow custom HTIF base address for RV32
In-Reply-To: <20221226033603.1860569-1-bmeng@tinylab.org>
References: <20221226033603.1860569-1-bmeng@tinylab.org>
Message-ID: <ddf50096-ee91-b0af-9a03-496159e264bf@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 12/26/22 00:36, Bin Meng wrote:
> commit 6dde43584f18 ("lib: utils/sys: Extend HTIF library to allow custom base address")
> forgot to update do_tohost_fromhost() codes for RV32, which still
> accesses the HTIF registers using the ELF symbol address directly.
>
> Fixes: 6dde43584f18 ("lib: utils/sys: Extend HTIF library to allow custom base address")
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---

With this patch, "qemu-system-riscv32 -M spike -bios fw_payload.bin -nographic"
now displays OpenSBI output in the terminal


Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>
>   lib/utils/sys/htif.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/utils/sys/htif.c b/lib/utils/sys/htif.c
> index d7cbeaf..b4e6321 100644
> --- a/lib/utils/sys/htif.c
> +++ b/lib/utils/sys/htif.c
> @@ -135,11 +135,11 @@ static void do_tohost_fromhost(uint64_t dev, uint64_t cmd, uint64_t data)
>   	__set_tohost(HTIF_DEV_SYSTEM, cmd, data);
>   
>   	while (1) {
> -		uint64_t fh = fromhost;
> +		uint64_t fh = __read_fromhost();
>   		if (fh) {
>   			if (FROMHOST_DEV(fh) == HTIF_DEV_SYSTEM &&
>   			    FROMHOST_CMD(fh) == cmd) {
> -				fromhost = 0;
> +				__write_fromhost(0);
>   				break;
>   			}
>   			__check_fromhost();


