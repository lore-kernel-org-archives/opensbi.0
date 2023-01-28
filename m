From: Yu-Chien Peter Lin <peterlin@andestech.com>
Date: Sat, 28 Jan 2023 11:15:17 +0800
Subject: [RFC PATCH v3 1/3] platform: generic: renesas: rzfive: Add
 support to configure the PMA
In-Reply-To: <20230126095832.21566-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230126095832.21566-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230126095832.21566-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Message-ID: <Y9STRS2xa4WUXk4r@Thinkpad-L14>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Prabhakar,

> +static unsigned long
> +andes45_pma_setup(const struct andes45_pma_region *pma_region,
> +		  unsigned int entry_id)
> +{
> +	unsigned long size = pma_region->size;
> +	unsigned long addr = pma_region->pa;
> +	unsigned int pma_cfg_addr;
> +	unsigned long pmacfg_val;
> +	unsigned long pmaaddr;
> +	char *pmaxcfg;
> +
> +	/* Check for 4KiB granularity */
> +	if (size < (1 << 12))
> +		return SBI_EINVAL;
> +
> +	/* Check size is power of 2 */
> +	if (size & (size - 1))
> +		return SBI_EINVAL;
> +
> +	if (pma_region->flags > 0xff || entry_id > 15)

(pma_region->flags > 0xff) is always false as its type is unsigned char?
I guess we can drop the condition and specify the bit-field of flags as
7-bit wide (the MSB is reserved), i.e.

struct andes45_pma_region {
    unsigned long pa;
    unsigned long size;
    u8 flags:7;
[...]

So if someone sets the flags to a value greater than 0x7f, it will cause
a compilation error.

Regards,
Peter Lin

