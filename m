From: Anup Patel <anup@brainfault.org>
Date: Fri, 25 Oct 2024 23:01:12 +0530
Subject: [PATCH v2 0/9] OpenSBI domain data support
In-Reply-To: <20241010090058.179381-1-apatel@ventanamicro.com>
References: <20241010090058.179381-1-apatel@ventanamicro.com>
Message-ID: <CAAhSdy3=i=ECKv-13KE-3FQ9FVHnDNan9Q+SonD-XkF4Bn3Jng@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 10, 2024 at 2:31?PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> This series extends the OpenSBI domain support to allow per-domain
> data from different parts of OpenSBI. Also extend OpenSBI domain
> context as the first user of OpenSBI domain data support.
>
> The first 6 patches of this series are miscellaneous improvements
> which were pending for quite some time.
>
> These patches can also be found in the sbi_domain_imp_v2 branch at:
> https://github.com/avpatel/opensbi.git
>
> Changes since v1:
>  - Typo fixes in PATCH1 to PATCH4
>  - Use current_hartindex() wherever applicable in PATCH8
>
> Anup Patel (9):
>   lib: utils/ipi: Use sbi_domain_root_add_memrange() for ACLINT mswi
>   lib: utils/irqchip: Use sbi_domain_root_add_memrange() for IMSIC
>   lib: utils/irqchip: Use sbi_domain_root_add_memrange() for APLIC
>   lib: sbi_domain: Make sbi_domain_root_add_memregion() as local
>     function
>   lib: utils/fdt: Use sbi_domain_memregion_init() when parsing domains
>   include: sbi: Remove cyclic include in sbi_domain_context.h
>   lib: sbi: Introduce domain data
>   lib: sbi_domain: Use domain data support for per-domain hart context
>   docs: Remove hartindex_to_context_table from domain_support.md

Applied this series to the riscv/opensbi repo.

Regards,
Anup

>
>  docs/domain_support.md           |   2 -
>  include/sbi/sbi_domain.h         |  15 +---
>  include/sbi/sbi_domain_context.h |  57 +++----------
>  include/sbi/sbi_domain_data.h    |  93 +++++++++++++++++++++
>  lib/sbi/objects.mk               |   1 +
>  lib/sbi/sbi_domain.c             |  24 +++++-
>  lib/sbi/sbi_domain_context.c     | 105 ++++++++++++++++++++---
>  lib/sbi/sbi_domain_data.c        | 138 +++++++++++++++++++++++++++++++
>  lib/utils/fdt/fdt_domain.c       |  14 ++--
>  lib/utils/ipi/aclint_mswi.c      |  20 ++---
>  lib/utils/irqchip/aplic.c        |  11 +--
>  lib/utils/irqchip/imsic.c        |  14 ++--
>  12 files changed, 383 insertions(+), 111 deletions(-)
>  create mode 100644 include/sbi/sbi_domain_data.h
>  create mode 100644 lib/sbi/sbi_domain_data.c
>
> --
> 2.43.0
>

