From: Chao-ying Fu <icebergfu@gmail.com>
Date: Tue, 25 Feb 2025 16:53:33 -0800
Subject: [PATCH v2 09/11] platform: generic: mips: add objects.mk
In-Reply-To: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
Message-ID: <20250226005335.19498-9-cfu@mips.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We build MIPS files.
---
 platform/generic/mips/objects.mk | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 platform/generic/mips/objects.mk

diff --git a/platform/generic/mips/objects.mk b/platform/generic/mips/objects.mk
new file mode 100644
index 0000000..0254d35
--- /dev/null
+++ b/platform/generic/mips/objects.mk
@@ -0,0 +1,7 @@
+#
+# SPDX-License-Identifier: BSD-2-Clause
+#
+
+carray-platform_override_modules-$(CONFIG_PLATFORM_MIPS_P8700) += mips_p8700
+platform-objs-$(CONFIG_PLATFORM_MIPS_P8700) += mips/p8700.o mips/stw.o mips/cps-vec.o
+platform-dtb-$(CONFIG_PLATFORM_MIPS_P8700) += mips/mips,boston-p8700.dtb
-- 
2.47.1


