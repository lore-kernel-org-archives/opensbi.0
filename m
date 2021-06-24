From: Anup Patel <Anup.Patel@wdc.com>
Date: Thu, 24 Jun 2021 04:38:38 +0000
Subject: [PATCH v3 4/6] lib: utils/ipi: Add FDT based ACLINT MSWI IPI
 driver
In-Reply-To: <20210624043019.498627-5-anup.patel@wdc.com>
References: <20210624043019.498627-1-anup.patel@wdc.com>
 <20210624043019.498627-5-anup.patel@wdc.com>
Message-ID: <1246A760-0FBE-488C-BBB1-E787D6363151@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



?On 24/06/21, 10:00 AM, "Anup Patel" <Anup.Patel@wdc.com> wrote:

    We add a new FDT based ACLINT MSWI IPI driver which works for both
    CLINT device and standalone ACLINT MSWI device.

    Signed-off-by: Anup Patel <anup.patel@wdc.com>
    Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
    Reviewed-by: Xiang W <wxjstz@126.com>

Applied this patch to the riscv/opensbi repo

Regards,
Anup

    ---
     lib/utils/ipi/fdt_ipi.c       |  4 +--
     lib/utils/ipi/fdt_ipi_clint.c | 51 --------------------------
     lib/utils/ipi/fdt_ipi_mswi.c  | 67 +++++++++++++++++++++++++++++++++++
     lib/utils/ipi/objects.mk      |  2 +-
     4 files changed, 70 insertions(+), 54 deletions(-)
     delete mode 100644 lib/utils/ipi/fdt_ipi_clint.c
     create mode 100644 lib/utils/ipi/fdt_ipi_mswi.c

    diff --git a/lib/utils/ipi/fdt_ipi.c b/lib/utils/ipi/fdt_ipi.c
    index 3932f50..ed56e49 100644
    --- a/lib/utils/ipi/fdt_ipi.c
    +++ b/lib/utils/ipi/fdt_ipi.c
    @@ -12,10 +12,10 @@
     #include <sbi_utils/fdt/fdt_helper.h>
     #include <sbi_utils/ipi/fdt_ipi.h>

    -extern struct fdt_ipi fdt_ipi_clint;
    +extern struct fdt_ipi fdt_ipi_mswi;

     static struct fdt_ipi *ipi_drivers[] = {
    -	&fdt_ipi_clint
    +	&fdt_ipi_mswi
     };

     static struct fdt_ipi dummy = {
    diff --git a/lib/utils/ipi/fdt_ipi_clint.c b/lib/utils/ipi/fdt_ipi_clint.c
    deleted file mode 100644
    index ce0ca8e..0000000
    --- a/lib/utils/ipi/fdt_ipi_clint.c
    +++ /dev/null
    @@ -1,51 +0,0 @@
    -/*
    - * SPDX-License-Identifier: BSD-2-Clause
    - *
    - * Copyright (c) 2020 Western Digital Corporation or its affiliates.
    - *
    - * Authors:
    - *   Anup Patel <anup.patel@wdc.com>
    - */
    -
    -#include <sbi/sbi_error.h>
    -#include <sbi_utils/fdt/fdt_helper.h>
    -#include <sbi_utils/ipi/fdt_ipi.h>
    -#include <sbi_utils/sys/clint.h>
    -
    -#define CLINT_IPI_MAX_NR			16
    -
    -static unsigned long clint_ipi_count = 0;
    -static struct clint_data clint_ipi[CLINT_IPI_MAX_NR];
    -
    -static int ipi_clint_cold_init(void *fdt, int nodeoff,
    -			       const struct fdt_match *match)
    -{
    -	int rc;
    -	unsigned long cisize;
    -	struct clint_data *ci;
    -
    -	if (CLINT_IPI_MAX_NR <= clint_ipi_count)
    -		return SBI_ENOSPC;
    -	ci = &clint_ipi[clint_ipi_count++];
    -
    -	rc = fdt_parse_aclint_node(fdt, nodeoff, false, &ci->addr, &cisize,
    -				   &ci->first_hartid, &ci->hart_count);
    -	if (rc)
    -		return rc;
    -	ci->has_64bit_mmio = false;
    -
    -	return clint_cold_ipi_init(ci);
    -}
    -
    -static const struct fdt_match ipi_clint_match[] = {
    -	{ .compatible = "riscv,clint0" },
    -	{ .compatible = "sifive,clint0" },
    -	{ },
    -};
    -
    -struct fdt_ipi fdt_ipi_clint = {
    -	.match_table = ipi_clint_match,
    -	.cold_init = ipi_clint_cold_init,
    -	.warm_init = clint_warm_ipi_init,
    -	.exit = NULL,
    -};
    diff --git a/lib/utils/ipi/fdt_ipi_mswi.c b/lib/utils/ipi/fdt_ipi_mswi.c
    new file mode 100644
    index 0000000..f119f9c
    --- /dev/null
    +++ b/lib/utils/ipi/fdt_ipi_mswi.c
    @@ -0,0 +1,67 @@
    +/*
    + * SPDX-License-Identifier: BSD-2-Clause
    + *
    + * Copyright (c) 2021 Western Digital Corporation or its affiliates.
    + *
    + * Authors:
    + *   Anup Patel <anup.patel@wdc.com>
    + */
    +
    +#include <sbi/sbi_error.h>
    +#include <sbi_utils/fdt/fdt_helper.h>
    +#include <sbi_utils/ipi/fdt_ipi.h>
    +#include <sbi_utils/ipi/aclint_mswi.h>
    +
    +#define MSWI_MAX_NR			16
    +
    +static unsigned long mswi_count = 0;
    +static struct aclint_mswi_data mswi[MSWI_MAX_NR];
    +
    +static int ipi_mswi_cold_init(void *fdt, int nodeoff,
    +			      const struct fdt_match *match)
    +{
    +	int rc;
    +	unsigned long offset;
    +	struct aclint_mswi_data *ms;
    +
    +	if (MSWI_MAX_NR <= mswi_count)
    +		return SBI_ENOSPC;
    +	ms = &mswi[mswi_count];
    +
    +	rc = fdt_parse_aclint_node(fdt, nodeoff, false, &ms->addr, &ms->size,
    +				   &ms->first_hartid, &ms->hart_count);
    +	if (rc)
    +		return rc;
    +
    +	if (match->data) {
    +		/* Adjust MSWI address and size for CLINT device */
    +		offset = *((unsigned long *)match->data);
    +		ms->addr += offset;
    +		if ((ms->size - offset) < ACLINT_MSWI_SIZE)
    +			return SBI_EINVAL;
    +		ms->size = ACLINT_MSWI_SIZE;
    +	}
    +
    +	rc = aclint_mswi_cold_init(ms);
    +	if (rc)
    +		return rc;
    +
    +	mswi_count++;
    +	return 0;
    +}
    +
    +static unsigned long clint_offset = CLINT_MSWI_OFFSET;
    +
    +static const struct fdt_match ipi_mswi_match[] = {
    +	{ .compatible = "riscv,clint0", .data = &clint_offset },
    +	{ .compatible = "sifive,clint0", .data = &clint_offset },
    +	{ .compatible = "riscv,aclint-mswi" },
    +	{ },
    +};
    +
    +struct fdt_ipi fdt_ipi_mswi = {
    +	.match_table = ipi_mswi_match,
    +	.cold_init = ipi_mswi_cold_init,
    +	.warm_init = aclint_mswi_warm_init,
    +	.exit = NULL,
    +};
    diff --git a/lib/utils/ipi/objects.mk b/lib/utils/ipi/objects.mk
    index 7e37816..129eea8 100644
    --- a/lib/utils/ipi/objects.mk
    +++ b/lib/utils/ipi/objects.mk
    @@ -9,4 +9,4 @@

     libsbiutils-objs-y += ipi/aclint_mswi.o
     libsbiutils-objs-y += ipi/fdt_ipi.o
    -libsbiutils-objs-y += ipi/fdt_ipi_clint.o
    +libsbiutils-objs-y += ipi/fdt_ipi_mswi.o
    -- 
    2.25.1


