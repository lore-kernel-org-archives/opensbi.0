From: Alvin Chang <alvinga@andestech.com>
Date: Tue, 18 Feb 2025 13:48:33 +0800
Subject: [PATCH 0/4] lib: sbi: Introduce per-domain MPXY state
Message-ID: <20250218054837.2328180-1-alvinga@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When multiple supervisor domains need to communicate with OpenSBI
through MPXY channel, they will allocate shared memory from their
own memory region, thus the MPXY state need to be per-domain and
per-hart data.

Alvin Chang (4):
  lib: sbi_mpxy: Export MPXY data structures
  lib: sbi_domain: Introduce per-domain MPXY state data
  lib: sbi_mpxy: Convert MPXY state to per-domain data
  lib: sbi: sbi_init: Allocate MPXY state for each domain

 include/sbi/sbi_domain.h            |  1 +
 include/sbi/sbi_domain_mpxy_state.h | 50 ++++++++++++++++++++
 include/sbi/sbi_mpxy.h              | 15 ++++++
 lib/sbi/objects.mk                  |  1 +
 lib/sbi/sbi_domain.c                |  9 +++-
 lib/sbi/sbi_domain_mpxy_state.c     | 47 +++++++++++++++++++
 lib/sbi/sbi_init.c                  | 15 ++++--
 lib/sbi/sbi_mpxy.c                  | 72 +++++++++++++----------------
 8 files changed, 164 insertions(+), 46 deletions(-)
 create mode 100644 include/sbi/sbi_domain_mpxy_state.h
 create mode 100644 lib/sbi/sbi_domain_mpxy_state.c

-- 
2.34.1


