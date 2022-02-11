From: Nikita Shubin <nikita.shubin@maquefel.me>
Date: Fri, 11 Feb 2022 14:11:52 +0300
Subject: [PATCH 0/3] sbi_domain fixes
Message-ID: <20220211111155.16121-1-nikita.shubin@maquefel.me>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Nikita Shubin <n.shubin@yadro.com>

The first patch is self-explanatory.

In the second one i would prefer implementing new SBI_EEXISTS code instead 
of using SBI_EALREADY, we should really give more hints on this type of 
error instead of returning SBI_EINVAL for all kind of errors.

The third one is attempt to fix case when we share mtimeaddr among 
several mtimer's with different or same mtimercmp addresses.

I personally don't like the third patch - so suggestions are welcome.

Nikita Shubin (3):
  lib: sbi: fix typo in is_region_subset
  lib: sbi: verbose sbi_domain_root_add_memregion
  lib: utils/timer: check if addr exists

 include/sbi/sbi_domain.h        |  4 ++-
 lib/sbi/sbi_domain.c            | 10 +++++--
 lib/utils/timer/aclint_mtimer.c | 51 ++++++++++++++++++++++++++-------
 3 files changed, 50 insertions(+), 15 deletions(-)

-- 
2.31.1


