From: Anup Patel <anup@brainfault.org>
Date: Mon, 23 Jan 2023 10:04:03 +0530
Subject: [PATCH v3 1/5] firmware: Split RO/RX and RW sections
In-Reply-To: <20230119151826.59697-2-hchauhan@ventanamicro.com>
References: <20230119151826.59697-1-hchauhan@ventanamicro.com> <20230119151826.59697-2-hchauhan@ventanamicro.com>
Message-ID: <CAAhSdy1rznC=H04WccatO0uhsfkVQr6MLaRzXjJuJ5FxwfbqTA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 19, 2023 at 8:48 PM Himanshu Chauhan
<hchauhan@ventanamicro.com> wrote:
>
> Split the RO/RX and RW sections so that they can have
> independent pmp entries with required permissions. The
> split size is ensured to be a power-of-2 as required by
> pmp.
>
> _fw_rw_offset symbol marks the beginning of the data
> section.
>
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>

This was already reviewed but nevertheless ...

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  firmware/fw_base.ldS | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/firmware/fw_base.ldS b/firmware/fw_base.ldS
> index 563ae25..5411bbd 100644
> --- a/firmware/fw_base.ldS
> +++ b/firmware/fw_base.ldS
> @@ -42,6 +42,14 @@
>
>         . = ALIGN(0x1000); /* Ensure next section is page aligned */
>
> +       /*
> +        * PMP regions must be to be power-of-2. RO/RW will have separate
> +        * regions, so ensure that the split is power-of-2.
> +        */
> +       . = ALIGN(1 << LOG2CEIL(SIZEOF(.rodata) + SIZEOF(.text)));
> +
> +       PROVIDE(_fw_rw_offset = (.  - _fw_start));
> +
>         /* Beginning of the read-write data sections */
>
>         .data :
> --
> 2.39.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

