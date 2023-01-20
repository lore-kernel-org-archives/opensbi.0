From: Yu-Chien Peter Lin <peterlin@andestech.com>
Date: Fri, 20 Jan 2023 10:11:26 +0800
Subject: [PATCH v3 4/6] lib: utils: atcsmu: Add Andes System Management
 Unit support
In-Reply-To: <20230119152607.w532kwh4mqqjnleq@arcolinux>
References: <20230118075321.19447-1-peterlin@andestech.com>
 <20230118075321.19447-5-peterlin@andestech.com>
 <20230119152607.w532kwh4mqqjnleq@arcolinux>
Message-ID: <Y8n4Tjr1I5ZbDivI@Thinkpad-L14>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Chauhan,

On Thu, Jan 19, 2023 at 08:56:07PM +0530, Himanshu Chauhan wrote:
> On Wed, Jan 18, 2023 at 03:53:19PM +0800, Yu Chien Peter Lin wrote:
> > This patch adds atcsmu support for Andes AE350 platforms. The SMU
> > provides system management capabilities, including clock, reset
> > and power control based on power domain partitions.
> > 
> > Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> > ---
> >  include/sbi_utils/sys/atcsmu.h | 53 ++++++++++++++++++++
> >  lib/utils/sys/Kconfig          |  4 ++
> >  lib/utils/sys/atcsmu.c         | 92 ++++++++++++++++++++++++++++++++++
> >  lib/utils/sys/objects.mk       |  1 +
> >  platform/generic/Kconfig       |  1 +
> >  5 files changed, 151 insertions(+)
> >  create mode 100644 include/sbi_utils/sys/atcsmu.h
> >  create mode 100644 lib/utils/sys/atcsmu.c
> > 
> > diff --git a/include/sbi_utils/sys/atcsmu.h b/include/sbi_utils/sys/atcsmu.h
> > new file mode 100644
> > index 00000000..0dd923fe
> > --- /dev/null
> > +++ b/include/sbi_utils/sys/atcsmu.h
> > @@ -0,0 +1,53 @@
> > +/*
> > + * SPDX-License-Identifier: BSD-3-Clause
> > + *
> > + * Copyright (c) 2023 Andes Technology Corporation
> > + */
> > +
> > +#ifndef _SYS_ATCSMU_H
> > +#define _SYS_ATCSMU_H
> > +
> > +#include <sbi/sbi_types.h>
> > +
> > +#define PCS0_WE_OFFSET 0x90
> > +#define PCSm_WE_OFFSET(i) ((i + 3) * 0x20 + PCS0_WE_OFFSET)
> > +
> > +#define PCS0_CTL_OFFSET 0x94
> > +#define PCSm_CTL_OFFSET(i) ((i + 3) * 0x20 + PCS0_CTL_OFFSET)
> > +#define PCS_CTL_CMD_SHIFT 0
> > +#define PCS_CTL_PARAM_SHIFT 3
> > +#define SLEEP_CMD 0x3
> > +#define WAKEUP_CMD (0x0 | (1 << PCS_CTL_PARAM_SHIFT))
> > +#define LIGHTSLEEP_MODE 0
> > +#define DEEPSLEEP_MODE 1
> > +#define LIGHT_SLEEP_CMD (SLEEP_CMD | (LIGHTSLEEP_MODE << PCS_CTL_PARAM_SHIFT))
> > +#define DEEP_SLEEP_CMD (SLEEP_CMD | (DEEPSLEEP_MODE << PCS_CTL_PARAM_SHIFT))
> > +
> > +#define PCS0_CFG_OFFSET 0x80
> > +#define PCSm_CFG_OFFSET(i) ((i + 3) * 0x20 + PCS0_CFG_OFFSET)
> > +#define PCS_CFG_LIGHT_SLEEP_SHIFT 2
> > +#define PCS_CFG_LIGHT_SLEEP (1 << PCS_CFG_LIGHT_SLEEP_SHIFT)
> > +#define PCS_CFG_DEEP_SLEEP_SHIFT 3
> > +#define PCS_CFG_DEEP_SLEEP (1 << PCS_CFG_DEEP_SLEEP_SHIFT)
> > +#define RESET_VEC_LO_OFFSET 0x50
> > +#define RESET_VEC_HI_OFFSET 0x60
> > +#define RESET_VEC_8CORE_OFFSET 0x1a0
> > +#define HARTn_RESET_VEC_LO(n)  \
> > +	(RESET_VEC_LO_OFFSET + \
> > +	 ((n) < 4 ? 0 : RESET_VEC_8CORE_OFFSET) + ((n) * 0x4))
> > +#define HARTn_RESET_VEC_HI(n)  \
> > +	(RESET_VEC_HI_OFFSET + \
> > +	 ((n) < 4 ? 0 : RESET_VEC_8CORE_OFFSET) + ((n) * 0x4))
> > +#define PCS_MAX_NR 8
> > +#define FLASH_BASE 0x80000000ULL
> Just a nit, can the values of macros be aligned for better readability?

Sure, I will fix the indentation.

Thanks,
Peter Lin

