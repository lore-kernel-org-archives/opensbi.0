From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Tue, 5 Apr 2022 16:35:22 +0530
Subject: [PATCH v2 0/3] RISC-V Smstateen support
In-Reply-To: <20220405104541.13185-1-mchitale@ventanamicro.com>
References: <20220405104541.13185-1-mchitale@ventanamicro.com>
Message-ID: <CAN37VV68u0L7dmHueKYjiLgHA-xx2CsjSeQyVuFGp5tfh6w10g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There is a minor error in patch 2 of the series.
Please ignore this version. I will send out a v3 with the fix.

Thanks,
Mayuresh.



On Tue, Apr 5, 2022 at 4:15 PM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> This series adds support for the Smstateen specification which provides
> a mechanism to plug potential covert channels which are opened by extensions
> which add to processor state that may not get context-switched. Currently
> access to AIA registers and *envcfg registers is controlled via
> smstateen.
>
> Changes in v2:
> - Rebase on latest master branch
> - Fix RV32 compilation issue
> - Fix indentation issue
>
> Mayuresh Chitale (3):
>   lib: sbi: Add Smstateen extension defines
>   lib: sbi: Detect Smstateen CSRs at boot-time
>   lib: irqchip/imsic: configure mstateen
>
>  include/sbi/riscv_encoding.h | 44 ++++++++++++++++++++++++++++++++++++
>  include/sbi/sbi_hart.h       |  4 +++-
>  lib/sbi/sbi_hart.c           | 31 +++++++++++++++++++++++++
>  3 files changed, 78 insertions(+), 1 deletion(-)
>
> --
> 2.17.1
>

