From: Prabhakar <prabhakar.csengg@gmail.com>
Date: Fri, 28 Oct 2022 01:40:42 +0100
Subject: [PATCH RFC 7/7] docs: platform: Add documentation for Renesas RZ/Five SoC
In-Reply-To: <20221028004042.135549-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221028004042.135549-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Message-ID: <20221028004042.135549-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

This patch adds documentation to build Renesas RZ/Five SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 docs/platform/platform.md       |   4 +
 docs/platform/renesas-rzfive.md | 139 ++++++++++++++++++++++++++++++++
 2 files changed, 143 insertions(+)
 create mode 100644 docs/platform/renesas-rzfive.md

diff --git a/docs/platform/platform.md b/docs/platform/platform.md
index f291931..a4c1864 100644
--- a/docs/platform/platform.md
+++ b/docs/platform/platform.md
@@ -39,6 +39,9 @@ OpenSBI currently supports the following virtual and hardware platforms:
   processor based SOCs. More details on this platform can be found in the
   file *[shakti_cclass.md]*.
 
+* **Renesas RZ/Five SoC**: Platform support for the Renesas RZ/Five SoC (R9A07G043F).
+  More details on this platform can be found in the file *[renesas-rzfive.md]*.
+
 The code for these supported platforms can be used as example to implement
 support for other platforms. The *platform/template* directory also provides
 template files for implementing support for a new platform. The *objects.mk*,
@@ -54,3 +57,4 @@ comments to facilitate the implementation.
 [spike.md]: spike.md
 [fpga-openpiton.md]: fpga-openpiton.md
 [shakti_cclass.md]: shakti_cclass.md
+[renesas-rzfive.md]: renesas-rzfive.md
diff --git a/docs/platform/renesas-rzfive.md b/docs/platform/renesas-rzfive.md
new file mode 100644
index 0000000..0b886f0
--- /dev/null
+++ b/docs/platform/renesas-rzfive.md
@@ -0,0 +1,139 @@
+Renesas RZ/Five SoC Platform
+============================
+The RZ/Five microprocessor includes a RISC-V CPU Core (AX45MP Single)
+1.0 GHz, 16-bit DDR3L/DDR4 interface. And it also has many interfaces
+such as Gbit-Ether, CAN, and USB 2.0, making it ideal for applications
+such as entry-class social infrastructure gateway control and industrial
+gateway control.
+
+To build platform specific library and firmwares, provide the
+*PLATFORM=renesas/rzfive* parameter to the top level make command.
+
+Platform Options
+----------------
+
+The Renesas RZ/Five platform does not have any platform-specific options.
+
+Building Renesas RZ/Five Platform
+-----------------------------
+
+```
+make PLATFORM=renesas/rzfive
+```
+
+DTS Example: (RZ/Five AX45MP)
+-------------------------------
+
+```
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		timebase-frequency = <12000000>;
+
+		cpu0: cpu at 0 {
+			compatible = "andestech,ax45mp", "riscv";
+			device_type = "cpu";
+			reg = <0x0>;
+			status = "okay";
+			riscv,isa = "rv64imafdc";
+			mmu-type = "riscv,sv39";
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <0x40>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <0x40>;
+			clocks = <&cpg CPG_CORE R9A07G043_AX45MP_CORE0_CLK>,
+				 <&cpg CPG_CORE R9A07G043_AX45MP_ACLK>;
+
+			cpu0_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+			};
+		};
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		ranges;
+
+		scif0: serial at 1004b800 {
+			compatible = "renesas,scif-r9a07g043",
+				     "renesas,scif-r9a07g044";
+			reg = <0 0x1004b800 0 0x400>;
+			interrupts = <412 IRQ_TYPE_LEVEL_HIGH>,
+				     <414 IRQ_TYPE_LEVEL_HIGH>,
+				     <415 IRQ_TYPE_LEVEL_HIGH>,
+				     <413 IRQ_TYPE_LEVEL_HIGH>,
+				     <416 IRQ_TYPE_LEVEL_HIGH>,
+				     <416 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi",
+					  "bri", "dri", "tei";
+			clocks = <&cpg CPG_MOD R9A07G043_SCIF0_CLK_PCK>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A07G043_SCIF0_RST_SYSTEM_N>;
+			status = "disabled";
+		};
+
+		cpg: clock-controller at 11010000 {
+			compatible = "renesas,r9a07g043-cpg";
+			reg = <0 0x11010000 0 0x10000>;
+			clocks = <&extal_clk>;
+			clock-names = "extal";
+			#clock-cells = <2>;
+			#reset-cells = <1>;
+			#power-domain-cells = <0>;
+		};
+
+		sysc: system-controller at 11020000 {
+			compatible = "renesas,r9a07g043-sysc";
+			reg = <0 0x11020000 0 0x10000>;
+			status = "disabled";
+		};
+
+		pinctrl: pinctrl at 11030000 {
+			compatible = "renesas,r9a07g043-pinctrl";
+			reg = <0 0x11030000 0 0x10000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			gpio-ranges = <&pinctrl 0 0 152>;
+			clocks = <&cpg CPG_MOD R9A07G043_GPIO_HCLK>;
+			power-domains = <&cpg>;
+			resets = <&cpg R9A07G043_GPIO_RSTN>,
+				 <&cpg R9A07G043_GPIO_PORT_RESETN>,
+				 <&cpg R9A07G043_GPIO_SPARE_RESETN>;
+		};
+
+		plmt0: plmt0 at 110c0000 {
+			compatible = "andestech,plmt0", "riscv,plmt0";
+			reg = <0x00000000 0x110c0000 0x00000000 0x00100000>;
+			interrupts-extended = <&cpu0_intc 7>;
+		};
+
+		plic: interrupt-controller at 12c00000 {
+			compatible = "renesas,r9a07g043-plic", "andestech,nceplic100";
+			#interrupt-cells = <2>;
+			#address-cells = <0>;
+			riscv,ndev = <511>;
+			interrupt-controller;
+			reg = <0x0 0x12c00000 0 0x400000>;
+			clocks = <&cpg CPG_MOD R9A07G043_NCEPLIC_ACLK>;
+			power-domains = <&cpg>;
+			resets = <&cpg R9A07G043_NCEPLIC_ARESETN>;
+			interrupts-extended = <&cpu0_intc 11 &cpu0_intc 9>;
+		};
+
+		plicsw: interrupt-controller at 13000000 {
+			compatible = "andestech,plicsw";
+			reg = <0x00000000 0x13000000 0x00000000 0x00400000>;
+			interrupts-extended = <&cpu0_intc 3>;
+			interrupt-controller;
+			#address-cells = <2>;
+			#interrupt-cells = <2>;
+		};
+	};
+```
-- 
2.17.1


