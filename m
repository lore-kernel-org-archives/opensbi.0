From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Thu, 28 Mar 2024 11:33:01 +0800
Subject: [PATCH v2 0/2] Minor fixes for domain context switch
Message-ID: <20240328033303.883674-1-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix illegal instruction caused by non-existent S-mode CSRs and
race condition when updating domain assigned_harts.

Yu Chien Peter Lin (2):
  sbi: sbi_domain_context: Check privilege spec version before accessing
    S-mode CSRs
  sbi: sbi_domain_context: Add spinlock for updating domain
    assigned_harts

 lib/sbi/sbi_domain_context.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

-- 
2.34.1


