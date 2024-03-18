From: Samuel Holland <samuel.holland@sifive.com>
Date: Mon, 18 Mar 2024 07:49:27 -0700
Subject: [PATCH 0/2] Optimize current hart scratch access
Message-ID: <20240318144932.4165729-1-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

These patches save about 280 bytes of code size in the generic platform
firmware.


Samuel Holland (2):
  lib: utils/timer: Optimize current hart scratch access
  platform: generic: allwinner: Optimize current hart scratch access

 lib/utils/timer/aclint_mtimer.c        | 18 +++---------------
 platform/generic/allwinner/sun20i-d1.c |  2 +-
 2 files changed, 4 insertions(+), 16 deletions(-)

-- 
2.43.1


