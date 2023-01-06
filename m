From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri,  6 Jan 2023 12:22:08 +0100
Subject: [RFC PATCH 10/11] docs: Correct opensbi-domain property name
In-Reply-To: <20230106112209.441825-1-ajones@ventanamicro.com>
References: <20230106112209.441825-1-ajones@ventanamicro.com>
Message-ID: <20230106112209.441825-11-ajones@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Replace the commas with dashes to correct the name.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 docs/domain_support.md | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/domain_support.md b/docs/domain_support.md
index ac8c73d40b3e..b2c1023008cc 100644
--- a/docs/domain_support.md
+++ b/docs/domain_support.md
@@ -199,9 +199,9 @@ platform support can provide the HART to domain instance assignment using
 platform specific callback.
 
 The HART to domain instance assignment can be parsed from the device tree
-using optional DT property **opensbi,domain** in each CPU DT node. The
-value of DT property **opensbi,domain** is the DT phandle of the domain
-instance DT node. If **opensbi,domain** DT property is not specified then
+using optional DT property **opensbi-domain** in each CPU DT node. The
+value of DT property **opensbi-domain** is the DT phandle of the domain
+instance DT node. If **opensbi-domain** DT property is not specified then
 corresponding HART is assigned to **the ROOT domain**.
 
 ### Domain Configuration Only Accessible to OpenSBI
-- 
2.39.0


