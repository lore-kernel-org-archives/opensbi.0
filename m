From: Samuel Holland <samuel@sholland.org>
Date: Tue, 27 Dec 2022 20:58:27 -0600
Subject: [PATCH] treewide: Replace TRUE/FALSE with true/false
In-Reply-To: <20221221113806.1450323-1-bmeng@tinylab.org>
References: <20221221113806.1450323-1-bmeng@tinylab.org>
Message-ID: <dee4771b-eaed-8c6a-03e3-e37e3b790add@sholland.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 12/21/22 05:38, Bin Meng wrote:
> C language standard uses true/false for the boolean type.
> Let's switch to that for better language compatibility.
> 
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---
> 
>  include/sbi/sbi_domain.h           |  4 +--
>  include/sbi/sbi_list.h             |  2 +-
>  include/sbi/sbi_platform.h         | 18 +++++------
>  include/sbi/sbi_types.h            |  6 ++--
>  lib/sbi/sbi_console.c              |  4 +--
>  lib/sbi/sbi_domain.c               | 44 ++++++++++++-------------
>  lib/sbi/sbi_ecall.c                |  4 +--
>  lib/sbi/sbi_ecall_hsm.c            |  2 +-
>  lib/sbi/sbi_emulate_csr.c          | 10 +++---
>  lib/sbi/sbi_fifo.c                 |  8 ++---
>  lib/sbi/sbi_init.c                 | 52 +++++++++++++++---------------
>  lib/sbi/sbi_ipi.c                  |  2 +-
>  lib/sbi/sbi_pmu.c                  | 14 ++++----
>  lib/sbi/sbi_system.c               |  2 +-
>  lib/sbi/sbi_trap.c                 |  8 ++---
>  lib/utils/fdt/fdt_domain.c         |  4 +--
>  lib/utils/reset/fdt_reset_gpio.c   | 12 +++----
>  platform/fpga/ariane/platform.c    |  2 +-
>  platform/fpga/openpiton/platform.c |  2 +-
>  platform/generic/sifive/fu740.c    |  2 +-
>  platform/kendryte/k210/platform.c  |  2 +-
>  platform/nuclei/ux600/platform.c   |  2 +-
>  platform/template/platform.c       |  2 +-
>  23 files changed, 103 insertions(+), 105 deletions(-)

Verified the generated firmware binaries are identical.

Reviewed-by: Samuel Holland <samuel@sholland.org>
Tested-by: Samuel Holland <samuel@sholland.org>


