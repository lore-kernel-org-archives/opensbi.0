From: Richard Hughes <hughsient@gmail.com>
Date: Mon,  9 Dec 2024 12:05:09 +0000
Subject: [PATCH 1/1] Add a SBOM template in CycloneDX format
In-Reply-To: <20241209120653.996455-1-richard@hughsie.com>
References: <20241209120653.996455-1-richard@hughsie.com>
Message-ID: <20241209120653.996455-2-richard@hughsie.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Improve supply chain security by including a SBOM file with substituted values.

This will be used to construct a composite platform SBOM.

Signed-off-by: Richard Hughes <richard@hughsie.com>
---
 docs/sbom.cdx.json | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 docs/sbom.cdx.json

diff --git a/docs/sbom.cdx.json b/docs/sbom.cdx.json
new file mode 100644
index 0000000..d300807
--- /dev/null
+++ b/docs/sbom.cdx.json
@@ -0,0 +1,43 @@
+{
+  "bomFormat": "CycloneDX",
+  "specVersion": "1.6",
+  "version": 1,
+  "metadata": {
+    "authors": [
+      {
+        "name": "@VCS_SBOM_AUTHORS@"
+      }
+    ]
+  },
+  "components": [
+    {
+      "type": "library",
+      "bom-ref": "pkg:github/riscv-software-src/opensbi@@VCS_TAG@",
+      "cpe": "cpe:2.3:a:riscv:opensbi:@VCS_TAG@:*:*:*:*:*:*:*",
+      "name": "OpenSBI",
+      "version": "@VCS_VERSION@",
+      "description": "Open Source Supervisor Binary Interface for RISC-V",
+      "authors": [
+        {
+          "name": "@VCS_AUTHORS@"
+        }
+      ],
+      "supplier": {
+        "name": "RISC-V Foundation"
+      },
+      "licenses": [
+        {
+          "license": {
+            "id": "BSD-2-Clause"
+          }
+        }
+      ],
+      "externalReferences": [
+        {
+          "type": "vcs",
+          "url": "https://github.com/riscv-software-src/opensbi"
+        }
+      ]
+    }
+  ]
+}
-- 
2.47.1


