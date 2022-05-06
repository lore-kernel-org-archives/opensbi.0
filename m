From: Anup Patel <anup@brainfault.org>
Date: Fri, 6 May 2022 08:51:30 +0530
Subject: [PATCH 00/11] HART Feature Improvements
In-Reply-To: <504d93a0ab76701dc3b6ba3f9d015ac3dce937a4.camel@126.com>
References: <20220429155151.314788-1-apatel@ventanamicro.com>
 <504d93a0ab76701dc3b6ba3f9d015ac3dce937a4.camel@126.com>
Message-ID: <CAAhSdy0PF-BP9hbYwbEK+sqWkGDHdLBO5uqr1kS6-aohZ24FSw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, May 5, 2022 at 10:00 PM Xiang W <wxjstz@126.com> wrote:
>
> ? 2022-04-29???? 21:21 +0530?Anup Patel???
> > This series does following improvements to OpenSBI hart features:
> > 1) Add per-HART priv spec version
>
> Detecting the privileged spec version by CSR is not friendly to some
> non-standard implementations. I recommend defining the privileged spec
> version via a macro in the platform code's header file

I disagree. Hard coding priv spec version as macro in platform header
file because we support running OpenSBI generic firmware binaries on
multiple RISC-V platforms (i.e. same binary should run on RISC-V Priv
v1.10, v1.11 and v1.12).

To address this, we have PATCH10 which adds a platform callback for
platforms to enable/disable HART extension based on DT (or something
else). The same callback can also be used by platform to read priv spec
version from DT (or something else) and update it using some generic
library function.

Unfortunately, there is no standard way (not even in DT) to specify priv
spec version so first we need to at least propose ad DT binding to
describe Priv spec version. The RISC-V profiles spec is using a special
notation for Priv spec version and we can use that as wel (e.g. Priv v1.12
is represented as extension Ss1p12).

In any case, there we will be separate series for generic platform to
parse extensions and priv spec version from ISA string.

Regards,
Anup

>
> Regards,
> Xiang
>
> > 2) Remove redundant per-HART features
> > 3) Convert HART features into HART extensions
> > 4) Platform callback to populate HART extensions
> >
> > These patches can also be found in the hart_feat_v1 brach at:
> > https://github.com/avpatel/opensbi.git
> >
> > Anup Patel (11):
> >   lib: sbi: Detect and print privileged spec version
>
> >   lib: sbi: Remove 's' and 'u' from misa_string() output
> >   lib: sbi: Update the name of ISA string printed at boot time
> >   lib: sbi: Remove MCOUNTEREN and SCOUNTEREN hart features
> >   lib: sbi: Remove MCOUNTINHIBT hart feature
> >   lib: sbi: Remove MENVCFG hart feature
> >   lib: sbi: Fix AIA feature detection
> >   lib: sbi: Convert hart features into hart extensions
> >   lib: sbi: Detect hart features only once for each hart
> >   lib: sbi: Add sbi_hart_update_extension() function
> >   lib: sbi_platform: Add callback to populate HART extensions
> >
> >  include/sbi/sbi_hart.h     |  61 ++++----
> >  include/sbi/sbi_platform.h |  18 +++
> >  lib/sbi/riscv_asm.c        |   2 +-
> >  lib/sbi/sbi_emulate_csr.c  |   4 +-
> >  lib/sbi/sbi_hart.c         | 288 +++++++++++++++++++++----------------
> >  lib/sbi/sbi_init.c         |   8 +-
> >  lib/sbi/sbi_pmu.c          |  19 +--
> >  lib/sbi/sbi_timer.c        |   6 +-
> >  lib/sbi/sbi_trap.c         |   4 +-
> >  lib/utils/fdt/fdt_pmu.c    |   2 +-
> >  10 files changed, 246 insertions(+), 166 deletions(-)
> >
> > --
> > 2.34.1
> >
> >
>
>

