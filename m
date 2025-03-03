From: Jan Reinhard <jan.reinhard@sysgo.com>
Date: Mon, 3 Mar 2025 15:42:56 +0100
Subject: vectored interrupt mode not an option for stvec
Message-ID: <d3efe4c5-d9cc-4664-a779-40fb5cafd427@sysgo.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello OpenSBI member,

as described in my issue on the OpenSBI Repository, Vectored mode for 
stvec is not possible right now:
https://github.com/riscv-software-src/opensbi/issues/391

I was asked to provide a patch to make it possible. I attached it to 
this mail.

Regards,
Jan

-- 
Mit freundlichen Gr??en / Best regards / Cordialement

Jan Reinhard
Security Engineer
jan.reinhard at sysgo.com
Phone: +49 (0) 6136 9948 735

SYSGO GmbH
Am Pfaffenstein 8 | 55270 Klein-Winternheim | Germany

www.sysgo.com | www.sysgo.com/news

Data protection information in accordance with article 13 GDPR: www.sysgo.com/privacy-policy

-------------- next part --------------
diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
index e63a563..363e91f 100644
--- a/lib/sbi/sbi_trap.c
+++ b/lib/sbi/sbi_trap.c
@@ -205,6 +205,8 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
 
 		/* Set MEPC to S-mode exception vector base */
 		regs->mepc = csr_read(CSR_STVEC);
+       /* clear the mode field */
+       regs->mepc &= ~0x3;
 
 		/* Set MPP to S-mode */
 		regs->mstatus &= ~MSTATUS_MPP;
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/pkcs7-signature
Size: 3031 bytes
Desc: S/MIME Cryptographic Signature
URL: <http://lists.infradead.org/pipermail/opensbi/attachments/20250303/07ebf7e7/attachment.p7s>
