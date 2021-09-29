From: Nikita Shubin <nikita.shubin@maquefel.me>
Date: Wed, 29 Sep 2021 12:41:49 +0300
Subject: [RFC PATCH 0/2] system reset rework to list, priority
Message-ID: <20210929094151.26639-1-nikita.shubin@maquefel.me>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Nikita Shubin <n.shubin@yadro.com>

Hi Anup.

I decided to go as separate proposal for system reset, as i don't think 
da9063 is really connected to this one.

Let's rework our current sbi_system reset to support multiply reset 
handlers.

However there are some things to discuss. If we want priority handling like in Linux,
we need separate lists for each reset type and sort them on insertions.

If we go the way like in the second patch no separate lists are needed but we will lack 
the ability to call them in chain.

So what are your thoughts ?

Nikita Shubin (2):
  lib: sbi: convert reset to list
  lib: sbi: add priority for reset handler

 include/sbi/sbi_system.h              | 13 +++++--
 lib/sbi/sbi_init.c                    |  5 ++-
 lib/sbi/sbi_system.c                  | 50 +++++++++++++++++++--------
 lib/utils/reset/fdt_reset_gpio.c      |  2 +-
 lib/utils/reset/fdt_reset_sunxi_wdt.c |  2 +-
 lib/utils/reset/fdt_reset_thead.c     |  2 +-
 lib/utils/sys/htif.c                  |  2 +-
 lib/utils/sys/sifive_test.c           |  2 +-
 platform/kendryte/k210/platform.c     |  2 +-
 platform/nuclei/ux600/platform.c      |  2 +-
 10 files changed, 58 insertions(+), 24 deletions(-)

-- 
2.31.1


