From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Date: Fri, 19 Mar 2021 07:19:48 +0000
Subject: [PATCH 1/1] lib: sbi: illegal CSR 0x306 access in hpm_allowed()
Message-ID: <20210319071948.3809-1-xypron.glpk@gmx.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The trap handler sbi_emulate_csr_read() invokes hpm_allowed() which reads
CSR 0x306. The K210 does not support CSR 0x306. While trying to handle
a trap occurring in S-mode code this creates an additional trap in M-mode.
This results in failure to redirect to S-mode and the system hanging in
sbi_hart_hang().

In hart_detect_features() we have already determined if CSR 0x306 is
available and stored that information in the scratch area. We can use this
information to decide if CSR 0x306 shall be accessed in hpm_allowed() and
thus avoid the M-mode trap.

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
---
 lib/sbi/sbi_emulate_csr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/sbi/sbi_emulate_csr.c b/lib/sbi/sbi_emulate_csr.c
index bee7761..14c8875 100644
--- a/lib/sbi/sbi_emulate_csr.c
+++ b/lib/sbi/sbi_emulate_csr.c
@@ -21,6 +21,10 @@
 static bool hpm_allowed(int hpm_num, ulong prev_mode, bool virt)
 {
 	ulong cen = -1UL;
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+
+	if (!sbi_hart_has_feature(scratch, SBI_HART_HAS_MCOUNTEREN))
+		return FALSE;

 	if (prev_mode <= PRV_S) {
 		cen &= csr_read(CSR_MCOUNTEREN);
--
2.30.2


