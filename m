From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Fri, 15 Oct 2021 12:09:41 +0200
Subject: [PATCH 1/1] dt-bindings: reg-io-width for SiFive CLINT
Message-ID: <20211015100941.17621-1-heinrich.schuchardt@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The CLINT in the T-HEAD 9xx processors do not support 64bit mmio access to
the MTIMER device. The current schema does not allow to specify this.

OpenSBI currently uses a property 'clint,has-no-64bit-mmio' to indicate the
restriction. Samuael Holland suggested in
lib: utils/timer: Use standard property to specify 32-bit I/O
https://github.com/smaeul/opensbi/commit/b95e9cf7cf93b0af16fc89204378bc59ff30008e
to use "reg-io-width = <4>;" as the reg-io-width property is generally used
in the devicetree schema for such a condition.

A release candidate of the ACLINT specification is available at
https://github.com/riscv/riscv-aclint/releases

Add reg-io-width as optional property to the SiFive Core Local Interruptor.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index a35952f48742..266012d887b5 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -41,6 +41,13 @@ properties:
   reg:
     maxItems: 1
 
+  reg-io-width:
+    description: |
+      Some CLINT implementations, e.g. on the T-HEAD 9xx, only support
+      32bit access for MTIMER.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 4
+
   interrupts-extended:
     minItems: 1
 
-- 
2.32.0


