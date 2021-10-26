From: Nikita Shubin <nikita.shubin@maquefel.me>
Date: Tue, 26 Oct 2021 17:36:02 +0300
Subject: [PATCH v3 0/3] lib: sbi: error handling in fdt_reset_init()
In-Reply-To: <20211026134822.28220-1-heinrich.schuchardt@canonical.com>
References: <20211026134822.28220-1-heinrich.schuchardt@canonical.com>
Message-ID: <20211026173602.66d679c6@redslave.neermore.group>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Heinrich!

On Tue, 26 Oct 2021 15:48:19 +0200
Heinrich Schuchardt <heinrich.schuchardt@canonical.com> wrote:

> A failure to initialize a reset driver should not stop booting. Yet we
> should print an error message in such a case. This requires to move
> the initialization of reset drivers to after sbi_console_init() and to
> move printing the probed drivers to after the final initialization.

Thank you for your patches, i'll rebase my work on the top of them/

> 
> With the series applied the output including an error message will
> look like:
> 
>     ...
>     Domain0 Next Arg1         : 0x0000000080299f10
>     Domain0 Next Mode         : S-mode
>     Domain0 SysReset          : yes
> 
>     fdt_reset_init: da9063-reset init failed, -1001
>     Platform Name             : SiFive HiFive Unmatched A00
>     Platform Features         : medeleg
>     Platform HART Count       : 5
>     Platform IPI Device       : aclint-mswi
>     Platform Timer Device     : aclint-mtimer @ 1000000Hz
>     Platform Console Device   : sifive_uart
>     Platform HSM Device       : ---
>     Platform Reboot Device    : ---
>     Platform Shutdown Device  : gpio-reset
>     ...
> 
> v3:
> 	fix sign of SBI_ENODEV in fdt_reset_init()
> v2:
> 	add error output
> 
> Heinrich Schuchardt (3):
>   lib: sbi: move sbi_boot_print_general()
>   platform: generic: move fdt_reset_init to final_init
>   lib: sbi: error handling in fdt_reset_init()
> 
>  include/sbi_utils/reset/fdt_reset.h |  5 ++++-
>  lib/sbi/sbi_init.c                  |  4 ++--
>  lib/utils/reset/fdt_reset.c         | 13 ++++++-------
>  platform/generic/platform.c         | 15 +++++----------
>  4 files changed, 17 insertions(+), 20 deletions(-)
> 


