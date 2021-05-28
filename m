From: Anup Patel <Anup.Patel@wdc.com>
Date: Fri, 28 May 2021 04:04:05 +0000
Subject: [RFC 1/1] lib/utils: consider ':' in stdout-path
In-Reply-To: <20210524131953.200555-1-xypron.glpk@gmx.de>
References: <20210524131953.200555-1-xypron.glpk@gmx.de>
Message-ID: <CO6PR04MB781294A3400724AB17C16ADC8D229@CO6PR04MB7812.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Heinrich Schuchardt <xypron.glpk@gmx.de>
> Sent: 24 May 2021 18:50
> To: opensbi at lists.infradead.org
> Cc: Anup Patel <Anup.Patel@wdc.com>; Atish Patra <Atish.Patra@wdc.com>;
> Heinrich Schuchardt <xypron.glpk@gmx.de>
> Subject: [RFC 1/1] lib/utils: consider ':' in stdout-path
> 
> The value of the /chosen/stdout-path devicetree property is used to
> determine the UART used by openSBI. According to the devicetree
> specification the value may contain a hyphen, e.g.
> 
> 	chosen {
> ????????????????stdout-path = "/serial at f00:115200";
> ????????};
> 
> If the character ':' is present, it terminates the path of the device.
> 
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> ---

I was aware of the "stdout-path" parsing issue but was not finding
time to address it. Thanks for taking this up.

> Is it allowable to temporarily change the device-tree here?
> Or should we use sbi_scratch_alloc_offset() and copy the string?

The per-HART SBI scratch space is a small resource so I suggest
we use it only for critical things.

I am getting a feeling that someday we will need a simple memory
management module to allocate memory used across HARTs.

For now, I am okay updating the FDT in-place and then restoring
it back. I would suggest to have a comment block explaining why
we are updating FDT in-place for stdout-path.

> ---
>  lib/utils/serial/fdt_serial.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/utils/serial/fdt_serial.c b/lib/utils/serial/fdt_serial.c index
> 25982ec..d1b762c 100644
> --- a/lib/utils/serial/fdt_serial.c
> +++ b/lib/utils/serial/fdt_serial.c
> @@ -46,8 +46,16 @@ int fdt_serial_init(void)
>  	coff = fdt_path_offset(fdt, "/chosen");
>  	if (-1 < coff) {
>  		prop = fdt_getprop(fdt, coff, "stdout-path", &len);
> -		if (prop && len)
> +		if (prop && len) {
> +			char *s;
> +
> +			s = strchr(prop, ':');
> +			if (s)
> +				*s = 0;
>  			noff = fdt_path_offset(fdt, prop);
> +			if (s)
> +				*s = ':';
> +		}
>  	}
> 
>  	/* First check DT node pointed by stdout-path */
> --
> 2.30.2

Regards,
Anup
