From: Leon M. Busch-George <leon@georgemail.eu>
Date: Fri, 26 Jan 2024 16:21:25 +0100
Subject: [PATCH 2/2] firmware: always create dynsym section
In-Reply-To: <20240126152145.60488-1-leon@georgemail.eu>
References: <20240126152145.60488-1-leon@georgemail.eu>
Message-ID: <20240126152145.60488-2-leon@georgemail.eu>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

With a bare-metal linkers (e.g. riscv64-elf-ld), there exists no dynsym section.
The dynsym section is not used by OpenSBI but discarding it makes linkers with dynamic library support unhappy.
---
 firmware/fw_base.ldS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/firmware/fw_base.ldS b/firmware/fw_base.ldS
index c15ccdb..fb47984 100644
--- a/firmware/fw_base.ldS
+++ b/firmware/fw_base.ldS
@@ -38,6 +38,11 @@
 		. = ALIGN(8);
 	}
 
+	.dynsym :
+	{
+		*(.dynsym)
+	}
+
 	. = ALIGN(0x1000); /* Ensure next section is page aligned */
 
 	.rela.dyn : {
-- 
2.43.0


