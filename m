From: Clément Léger <cleger@rivosinc.com>
Date: Mon, 20 Jan 2025 10:27:33 +0100
Subject: [PATCH] ext-sse: Handle landing pads SSTATUS.SPELP bit
Message-ID: <20250120092734.3933281-1-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When landing pads are enabled, we need to actually save and restore
the interrupted state using SSTATUS.SPELP content. In order to match the
Zicfilp specification, disable ELP by clearing MSTATUS.SPELP before
entering the S-mode SSE event handler like it is done for a trap.

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
---

Note: I modified the bit ordering to keep sstatus SP* bit together but we might
keep the existing ordering as well depending on feedback.

 src/ext-sse.adoc | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/src/ext-sse.adoc b/src/ext-sse.adoc
index c85ff14..d685ddb 100644
--- a/src/ext-sse.adoc
+++ b/src/ext-sse.adoc
@@ -240,11 +240,14 @@ event attributes.
   +
   `bit[1:1]`: interrupted `sstatus.SPIE` CSR bit value +
   +
-  `bit[2:2]`: interrupted `hstatus.SPV` CSR bit value +
+  `bit[2:2]`: interrupted `sstatus.SPELP` CSR bit value if `Zicfilp` extension
+  is available to supervisor mode +
   +
-  `bit[3:3]`: interrupted `hstatus.SPVP` CSR bit value +
+  `bit[3:3]`: interrupted `hstatus.SPV` CSR bit value +
   +
-  `bit[XLEN-1:4]`: Reserved for future use and should be zero +
+  `bit[4:4]`: interrupted `hstatus.SPVP` CSR bit value +
+  +
+  `bit[XLEN-1:5]`: Reserved for future use and should be zero +
 
 | INTERRUPTED_A6
 | 0x00000008
@@ -281,12 +284,14 @@ following:
   .. Set `INTERRUPTED_FLAGS` event attribute as follows:
      ... `INTERRUPTED_FLAGS[0:0]` = interrupted `sstatus.SPP` CSR bit value
      ... `INTERRUPTED_FLAGS[1:1]` = interrupted `sstatus.SPIE` CSR bit value
+     ... if `Zicfilp` is available to supervisor mode:
+     ....  `INTERRUPTED_FLAGS[2:2]` = interrupted `sstatus.SPELP` CSR bit value
      ... if H-extension is available to supervisor mode:
-     ....  Set `INTERRUPTED_FLAGS[2:2]` = interrupted `hstatus.SPV` CSR bit value
-     ....  Set `INTERRUPTED_FLAGS[3:3]` = interrupted `hstatus.SPVP` CSR bit value
+     ....  Set `INTERRUPTED_FLAGS[3:3]` = interrupted `hstatus.SPV` CSR bit value
+     ....  Set `INTERRUPTED_FLAGS[4:4]` = interrupted `hstatus.SPVP` CSR bit value
      ... else
-     ....  Set `INTERRUPTED_FLAGS[3:2]` = zero
-     ... Set `INTERRUPTED_FLAGS[XLEN-1:4]` = zero
+     ....  Set `INTERRUPTED_FLAGS[4:3]` = zero
+     ... Set `INTERRUPTED_FLAGS[XLEN-1:5]` = zero
   .. Set `INTERRUPTED_SEPC` event attribute = interrupted `sepc` CSR
   .. Set `INTERRUPTED_A6` event attribute = interrupted `A6` GPR value
   .. Set `INTERRUPTED_A7` event attribute = interrupted `A7` GPR value
@@ -297,10 +302,13 @@ following:
   .. Set `sstatus.SPP` CSR bit = interrupted privilege mode
   .. Set `sstatus.SPIE` CSR bit = `sstatus.SIE` CSR bit value
   .. Set `sstatus.SIE` CSR bit = zero
+  .. if `Zicfilp` is available to supervisor mode:
+     ... Set `sstatus.SPELP` = interrupted landing pad state
   .. if H-extension is available to supervisor mode:
      ... Set `hstatus.SPV` CSR bit = interrupted virtualization state
      ... if `hstatus.SPV` CSR bit == 1:
        .... Set `hstatus.SPVP` CSR bit = `sstatus.SPP` CSR bit value
+  .. Set landing pad state = NO_LP_EXPECTED
   .. Set virtualization state = OFF
   .. Set privilege mode = S-mode
   .. Set program counter = `ENTRY_PC` event attribute value
@@ -316,9 +324,11 @@ resume the interrupted state for a completed event:
 . Set privilege mode = `sstatus.SPP` CSR bit value
 . if H-extension is available to supervisor mode:
   .. Set virtualization state = `hstatus.SPV` CSR bit value
-  .. Set `hstatus.SPV` CSR bit = `INTERRUPTED_FLAGS[2:2]` event attribute value
-  .. Set `hstatus.SPVP` CSR bit = `INTERRUPTED_FLAGS[3:3]` event attribute value
+  .. Set `hstatus.SPV` CSR bit = `INTERRUPTED_FLAGS[3:3]` event attribute value
+  .. Set `hstatus.SPVP` CSR bit = `INTERRUPTED_FLAGS[4:4]` event attribute value
 . Set `sstatus.SIE` CSR bit = `sstatus.SPIE` CSR bit
+. if `Zicfilp` is available to supervisor mode:
+  .. Set `sstatus.SPELP` CSR bit = `INTERRUPTED_FLAGS[2:2]` event attribute value
 . Set `sstatus.SPIE` CSR bit = `INTERRUPTED_FLAGS[1:1]` event attribute value
 . Set `sstatus.SPP` CSR bit = `INTERRUPTED_FLAGS[0:0]` event attribute value
 . Set `A7` GPR = `INTERRUPTED_A7` event attribute value
-- 
2.47.1


