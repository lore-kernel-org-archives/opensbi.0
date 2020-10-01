From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Date: Thu,  1 Oct 2020 12:27:47 +0200
Subject: [PATCH 1/1] lib: sbi_scratch: typo scatch
Message-ID: <20201001102747.15565-1-xypron.glpk@gmx.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

%s/scatch/scratch

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
---
 include/sbi/sbi_scratch.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
index 8086207..9f3453d 100644
--- a/include/sbi/sbi_scratch.h
+++ b/include/sbi/sbi_scratch.h
@@ -85,7 +85,7 @@ enum sbi_scratch_options {
 #define sbi_scratch_thishart_arg1_ptr() \
 	((void *)(sbi_scratch_thishart_ptr()->next_arg1))

-/** Initialize scatch table and allocator */
+/** Initialize scratch table and allocator */
 int sbi_scratch_init(struct sbi_scratch *scratch);

 /**
--
2.28.0


