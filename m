From: Inochi Amaoto <inochiama@outlook.com>
Date: Tue, 10 Oct 2023 08:59:22 +0800
Subject: [PATCH v2 0/3] lib: sbi: Add sub-regions check for sanitizing domain
Message-ID: <IA1PR20MB49533A7AB5888E0117F7799BBBCDA@IA1PR20MB4953.namprd20.prod.outlook.com>
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

Changed from v1:
1. separate the patch into three parts.

Inochi Amaoto (3):
  lib: sbi: separate the swap operation of domain region
  lib: sbi: add more restriction to domain region subset check
  lib: sbi: Add regions merging when sanitizing domain region

 lib/sbi/sbi_domain.c | 86 ++++++++++++++++++++++++++++++--------------
 1 file changed, 59 insertions(+), 27 deletions(-)

--
2.42.0


