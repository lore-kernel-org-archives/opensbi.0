From: Xiang W <wxjstz@126.com>
Date: Tue, 09 Jul 2024 00:48:38 +0800
Subject: [PATCH 0/6] Early console buffer for OpenSBI
In-Reply-To: <20240705071504.50988-1-apatel@ventanamicro.com>
References: <20240705071504.50988-1-apatel@ventanamicro.com>
Message-ID: <a93ce84ba62502dd8f6b2084bdacf30d9630a93a.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2024-07-05???? 12:44 +0530?Anup Patel???
> This series tries to improve OpenSBI debugging by:
> 1) Registering console device via platform early_init()
> 2) Introducing early console buffer
> 
> These patches can also be found in the console_early_probe_v1
> branch at: https://github.com/avpatel/opensbi.git
> 
> Anup Patel (6):
> ? platform: Setup serial console device in early_init()
> ? lib: sbi: Remove sbi_console_init() and console_init() platform
> ??? callback
> ? lib: sbi: Optimize fifo enqueue/dequeue for basic data types
> ? lib: sbi: Allow forceful queueing of data in sbi_fifo_enqueue()
> ? include: sbi: Add macros to create FIFO as local or global variable
> ? lib: sbi: Introduce an early console buffer for caching early prints
> 
Hi, Anup

Before the console is initialized, sbi_printf is only called if an error
occurs, and an error usually causes the program to enter sbi_hart_hang,
resulting in no output. This makes adding an early console buffer less
useful. The program will crash anyway, and we don't need to care about
the order of function calls, we should just output some useful information
as much as possible.

Regards,
Xiang W
> ?include/sbi/sbi_console.h????????? |? 2 -
> ?include/sbi/sbi_fifo.h???????????? | 14 +++++-
> ?include/sbi/sbi_platform.h???????? | 17 -------
> ?lib/sbi/Kconfig??????????????????? |? 6 ++-
> ?lib/sbi/sbi_console.c????????????? | 36 ++++++++++-----
> ?lib/sbi/sbi_fifo.c???????????????? | 72 +++++++++++++++++++++++++-----
> ?lib/sbi/sbi_init.c???????????????? |? 4 --
> ?lib/sbi/sbi_sse.c????????????????? |? 2 +-
> ?lib/sbi/sbi_tlb.c????????????????? |? 3 +-
> ?platform/fpga/ariane/platform.c??? | 26 ++++-------
> ?platform/fpga/openpiton/platform.c | 20 ++-------
> ?platform/generic/platform.c??????? | 21 ++++-----
> ?platform/kendryte/k210/platform.c? | 18 +++-----
> ?platform/nuclei/ux600/platform.c?? | 18 +++-----
> ?platform/template/platform.c?????? | 18 +++-----
> ?15 files changed, 151 insertions(+), 126 deletions(-)
> 
> -- 
> 2.34.1
> 
> 

