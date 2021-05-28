From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 28 May 2021 10:58:23 -0700
Subject: [PATCH v3 1/1] lib/utils: consider ':' in stdout-path
In-Reply-To: <20210528170632.13267-1-xypron.glpk@gmx.de>
References: <20210528170632.13267-1-xypron.glpk@gmx.de>
Message-ID: <CAOnJCUKTAT5puN85wC9ec2hQFq_OhbL3aMmn3xxUR+D5LgH3yQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, May 28, 2021 at 10:06 AM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>
> The value of the /chosen/stdout-path devicetree property is used to
> determine the UART used by openSBI. According to the devicetree
> specification the value may contain a hyphen, e.g.
>
>         chosen {
>                 stdout-path = "/serial at f00:115200";
>         };
>
> If the character ':' is present, it terminates the path of the device.
>
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> ---
> v3:
>         * Use fdt_path_offset_namelen() if stdout-path contains a ':'
>           (thanks Atish).
>         * Fix typo %s/pointed/pointed to/.
> ---
>  lib/utils/serial/fdt_serial.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/lib/utils/serial/fdt_serial.c b/lib/utils/serial/fdt_serial.c
> index 25982ec..1d1eba8 100644
> --- a/lib/utils/serial/fdt_serial.c
> +++ b/lib/utils/serial/fdt_serial.c
> @@ -42,12 +42,21 @@ int fdt_serial_init(void)
>         int pos, noff = -1, len, coff, rc;
>         void *fdt = sbi_scratch_thishart_arg1_ptr();
>
> -       /* Find offset of node pointed by stdout-path */
> +       /* Find offset of node pointed to by stdout-path */
>         coff = fdt_path_offset(fdt, "/chosen");
>         if (-1 < coff) {
>                 prop = fdt_getprop(fdt, coff, "stdout-path", &len);
> -               if (prop && len)
> -                       noff = fdt_path_offset(fdt, prop);
> +               if (prop && len) {
> +                       const char *sep, *start = prop;
> +
> +                       /* The device path may be followed by ':' */
> +                       sep = strchr(start, ':');
> +                       if (sep)
> +                               noff = fdt_path_offset_namelen(fdt, prop,
> +                                                              sep - start);
> +                       else
> +                               noff = fdt_path_offset(fdt, prop);

We can further simplify this by passing strlen() to
fdt_path_offset_namelen if ": "
is not present. But that's just personal preference.

I am fine with this version as well.

> +               }
>         }
>
>         /* First check DT node pointed by stdout-path */
> --
> 2.30.2
>

Either way,

Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

