From: Anup Patel <anup@brainfault.org>
Date: Wed, 18 Jan 2023 13:20:12 +0530
Subject: [PATCH 1/5] firmware: Split RO/RX and RW sections
In-Reply-To: <20230109084049.31828-2-hchauhan@ventanamicro.com>
References: <20230109084049.31828-1-hchauhan@ventanamicro.com> <20230109084049.31828-2-hchauhan@ventanamicro.com>
Message-ID: <CAAhSdy2VddZrtXJruomAVZGpMPju3WL1yHCCygmPbK6WQmiwhA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 9, 2023 at 2:11 PM Himanshu Chauhan
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

Looks good to me.

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
> 2.39.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

