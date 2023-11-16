From: Inochi Amaoto <inochiama@outlook.com>
Date: Thu, 16 Nov 2023 18:48:50 +0800
Subject: [PATCH v4 0/2] lib: sbi: Add sub-regions check for sanitizing domain
Message-ID: <IA1PR20MB49535E12C4609D9816C7C824BBB0A@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

As the domain will reject a new memory region which has a sub-regions
already in the domain, even the new region is bigger and has the same
flags.

To resolve this problem, just relax restriction of memory region when
adding it, and merge the region into the existed domain regions when
sorting regions.

Changed from v3:
1. rearrange the code to avoid unnecessary check.
2. use a stable check to preserve region orders.

Changed from v2:
1. rebase to master
2. removed the useless changed for conflict check.
3. improve the commit for the patch 3.

Changed from v1:
1. separate the patch into three parts.

Inochi Amaoto (2):
  lib: sbi: separate the swap operation of domain region
  lib: sbi: Add regions merging when sanitizing domain region

 lib/sbi/sbi_domain.c | 75 +++++++++++++++++++++++++++++---------------
 1 file changed, 49 insertions(+), 26 deletions(-)

--
2.42.1


