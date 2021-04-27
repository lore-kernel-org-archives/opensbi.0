From: guoren@kernel.org <guoren@kernel.org>
Date: Tue, 27 Apr 2021 06:47:53 +0000
Subject: [PATCH 2/2] doc: generic: Add T-HEAD C9xx series processors
In-Reply-To: <1619506073-1398-1-git-send-email-guoren@kernel.org>
References: <1619506073-1398-1-git-send-email-guoren@kernel.org>
Message-ID: <1619506073-1398-2-git-send-email-guoren@kernel.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Guo Ren <guoren@linux.alibaba.com>

Add description and dts examples for startup.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Reviewed-by: Anup Patel <anup.patel@wdc.com>
---
 docs/platform/generic.md    |   2 +
 docs/platform/thead-c9xx.md | 197 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 199 insertions(+)
 create mode 100644 docs/platform/thead-c9xx.md

diff --git a/docs/platform/generic.md b/docs/platform/generic.md
index f1f7f64..8c3b0dd 100644
--- a/docs/platform/generic.md
+++ b/docs/platform/generic.md
@@ -48,7 +48,9 @@ RISC-V Platforms Using Generic Platform
 * **QEMU RISC-V Virt Machine** (*[qemu_virt.md]*)
 * **Spike** (*[spike.md]*)
 * **Shakti C-class SoC Platform** (*[shakti_cclass.md]*)
+* **T-HEAD C9xx series Processors** (*[thead-c9xx.md]*)
 
 [qemu_virt.md]: qemu_virt.md
 [spike.md]: spike.md
 [shakti_cclass.md]: shakti_cclass.md
+[thead-c9xx.md]: thead-c9xx.md
diff --git a/docs/platform/thead-c9xx.md b/docs/platform/thead-c9xx.md
new file mode 100644
index 0000000..932ca4b
--- /dev/null
+++ b/docs/platform/thead-c9xx.md
@@ -0,0 +1,197 @@
+T-HEAD C9xx Series Processors
+=============================
+
+The **C9xx** series processors are high-performance RISC-V architecture
+multi-core processors with AI vector acceleration engine.
+
+For more details, refer [T-HEAD.CN](https://www.t-head.cn/)
+
+To build the platform-specific library and firmware images, provide the
+*PLATFORM=generic* parameter to the top level `make` command.
+
+Platform Options
+----------------
+
+The *T-HEAD C9xx* does not have any platform-specific compile options.
+
+CROSS_COMPILE=riscv64-linux-gnu- PLATFORM=generic FW_PIC=y /usr/bin/make
+
+It depends on "riscv,clint0", "riscv,plic0", "thead,reset-sample" drivers.
+
+We recommend you use fw_dynamic for all platforms(qemu, sifive, spike, thead).
+
+DTS Example1: (Single core, eg: Allwinner D1 - c906)
+----------------------------------------------------
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		timebase-frequency = <3000000>;
+		cpu at 0 {
+			device_type = "cpu";
+			reg = <0>;
+			status = "okay";
+			compatible = "riscv";
+			riscv,isa = "rv64imafdcv";
+			mmu-type = "riscv,sv39";
+			cpu0_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+			};
+		};
+	};
+
+	soc {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		compatible = "simple-bus";
+		ranges;
+
+		reset: reset-sample {
+			compatible = "thead,reset-sample";
+			plic-delegate = <0x0 0x101ffffc>;
+		};
+
+		clint0: clint at 14000000 {
+			compatible = "riscv,clint0";
+			interrupts-extended = <
+				&cpu0_intc  3 &cpu0_intc  7
+				>;
+			reg = <0x0 0x14000000 0x0 0x04000000>;
+			clint,has-no-64bit-mmio;
+		};
+
+		intc: interrupt-controller at 10000000 {
+			#interrupt-cells = <1>;
+			compatible = "riscv,plic0";
+			interrupt-controller;
+			interrupts-extended = <
+				&cpu0_intc  0xffffffff &cpu0_intc  9
+				>;
+			reg = <0x0 0x10000000 0x0 0x04000000>;
+			reg-names = "control";
+			riscv,max-priority = <7>;
+			riscv,ndev = <200>;
+		};
+	}
+
+DTS Example2: (Multi cores with soc reset-regs)
+-----------------------------------------------
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		timebase-frequency = <3000000>;
+		cpu at 0 {
+			device_type = "cpu";
+			reg = <0>;
+			status = "okay";
+			compatible = "riscv";
+			riscv,isa = "rv64imafdc";
+			mmu-type = "riscv,sv39";
+			cpu0_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+			};
+		};
+		cpu at 1 {
+			device_type = "cpu";
+			reg = <1>;
+			status = "fail";
+			compatible = "riscv";
+			riscv,isa = "rv64imafdc";
+			mmu-type = "riscv,sv39";
+			cpu1_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+			};
+		};
+		cpu at 2 {
+			device_type = "cpu";
+			reg = <2>;
+			status = "fail";
+			compatible = "riscv";
+			riscv,isa = "rv64imafdc";
+			mmu-type = "riscv,sv39";
+			cpu2_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+			};
+		};
+		cpu at 3 {
+			device_type = "cpu";
+			reg = <3>;
+			status = "fail";
+			compatible = "riscv";
+			riscv,isa = "rv64imafdc";
+			mmu-type = "riscv,sv39";
+			cpu3_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+			};
+		};
+	};
+
+	soc {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		compatible = "simple-bus";
+		ranges;
+
+		reset: reset-sample {
+			compatible = "thead,reset-sample";
+			plic-delegate = <0xff 0xd81ffffc>;
+			entry-reg = <0xff 0xff019050>;
+			entry-cnt = <4>;
+			control-reg = <0xff 0xff015004>;
+			control-val = <0x1c>;
+			csr-copy = <0x7f3 0x7c0 0x7c1 0x7c2 0x7c3 0x7c5 0x7cc>;
+		};
+
+		clint0: clint at ffdc000000 {
+			compatible = "riscv,clint0";
+			interrupts-extended = <
+				&cpu0_intc  3 &cpu0_intc  7
+				&cpu1_intc  3 &cpu1_intc  7
+				&cpu2_intc  3 &cpu2_intc  7
+				&cpu3_intc  3 &cpu3_intc  7
+				&cpu4_intc  3 &cpu4_intc  7
+				>;
+			reg = <0xff 0xdc000000 0x0 0x04000000>;
+			clint,has-no-64bit-mmio;
+		};
+
+		intc: interrupt-controller at ffd8000000 {
+			#interrupt-cells = <1>;
+			compatible = "riscv,plic0";
+			interrupt-controller;
+			interrupts-extended = <
+				&cpu0_intc  0xffffffff &cpu0_intc  9
+				&cpu1_intc  0xffffffff &cpu1_intc  9
+				&cpu2_intc  0xffffffff &cpu2_intc  9
+				&cpu3_intc  0xffffffff &cpu3_intc  9
+				>;
+			reg = <0xff 0xd8000000 0x0 0x04000000>;
+			reg-names = "control";
+			riscv,max-priority = <7>;
+			riscv,ndev = <80>;
+		};
+	}
+
+DTS Example2: (Multi cores with old reset csrs)
+-----------------------------------------------
+
+reset: reset-sample {
+	compatible = "thead,reset-sample";
+	plic-delegate = <0xff 0xd81ffffc>;
+	using-csr-reset;
+	csr-copy = <0x7c0 0x7c1 0x7c2 0x7c3 0x7c5 0x7cc
+		    0x3b0 0x3b1 0x3b2 0x3b3
+		    0x3b4 0x3b5 0x3b6 0x3b7
+		    0x3a0>;
+};
-- 
2.7.4


