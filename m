From: Chao-ying Fu <icebergfu@gmail.com>
Date: Tue, 25 Feb 2025 16:53:32 -0800
Subject: [PATCH v2 08/11] platform: generic: mips: add a dts file
In-Reply-To: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
Message-ID: <20250226005335.19498-8-cfu@mips.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We add a dts file for 4 cores 2 threads each on a Boston board.
---
 platform/generic/mips/mips,boston-p8700.dts | 353 ++++++++++++++++++++
 1 file changed, 353 insertions(+)
 create mode 100644 platform/generic/mips/mips,boston-p8700.dts

diff --git a/platform/generic/mips/mips,boston-p8700.dts b/platform/generic/mips/mips,boston-p8700.dts
new file mode 100644
index 0000000..9e3ca2a
--- /dev/null
+++ b/platform/generic/mips/mips,boston-p8700.dts
@@ -0,0 +1,353 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 MIPS
+ *
+ */
+
+/dts-v1/;
+
+#define CM_BASE 0x16100000
+#define APLIC_M_BASE (CM_BASE + 0x40000)
+#define APLIC_S_BASE (CM_BASE + 0x60000)
+#define MSWI_BASE (CM_BASE + 0x50000)
+#define MTIMER_BASE (MSWI_BASE + 0x4000)
+#define CPC_TIMER (CM_BASE + 0x8050)
+
+#define BITFILE_FREQUENCY 25000000
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	model = "MIPS P8700";
+	compatible = "mips,p8700";
+
+	chosen {
+		stdout-path = &uart0;
+		// For Qemu
+		//bootargs = "root=/dev/sda rw earlycon console=ttyS0,115200n8r";
+		// For a Boston board
+		bootargs = "root=/dev/mmcblk0p5 rw rootwait earlycon console=ttyS0,115200n8r";
+
+		opensbi-domains {
+			compatible = "opensbi,domain,config";
+
+			tmem: tmem {
+				compatible = "opensbi,domain,memregion";
+				base = <0x0 0x80000000>;
+				order = <31>;
+			};
+
+			allmem: allmem {
+				compatible = "opensbi,domain,memregion";
+				base = <0x0 0x0>;
+				order = <64>;
+			};
+
+			tdomain: trusted-domain {
+				compatible = "opensbi,domain,instance";
+				possible-harts = <&cpu0 &cpu1 &cpu2 &cpu3 &cpu4 &cpu5 &cpu6 &cpu7>;
+				regions = <&tmem 0x3f>, <&allmem 0x3f>;
+			};
+		};
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		timebase-frequency = <BITFILE_FREQUENCY>;
+
+		cpu0: cpu at 0 {
+			phandle = <0x00000001>;
+			device_type = "cpu";
+			compatible = "riscv";
+			opensbi-domain = <&tdomain>;
+			mmu-type = "riscv,sv39";
+			riscv,isa = "rv64imafdcsu";
+			status = "okay";
+			reg = <0x00000000>;
+
+			interrupt-controller {
+				phandle = <0x00000002>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu1: cpu at 1 {
+			phandle = <0x00000005>;
+			device_type = "cpu";
+			compatible = "riscv";
+			opensbi-domain = <&tdomain>;
+			mmu-type = "riscv,sv39";
+			riscv,isa = "rv64imafdcsu";
+			status = "okay";
+			reg = <0x00000001>;
+
+			interrupt-controller {
+				phandle = <0x00000006>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu2: cpu at 2 {
+			phandle = <0x00000007>;
+			device_type = "cpu";
+			compatible = "riscv";
+			opensbi-domain = <&tdomain>;
+			mmu-type = "riscv,sv39";
+			riscv,isa = "rv64imafdcsu";
+			status = "okay";
+			reg = <0x00000010>;
+
+			interrupt-controller {
+				phandle = <0x00000008>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu3: cpu at 3 {
+			phandle = <0x00000009>;
+			device_type = "cpu";
+			compatible = "riscv";
+			opensbi-domain = <&tdomain>;
+			mmu-type = "riscv,sv39";
+			riscv,isa = "rv64imafdcsu";
+			status = "okay";
+			reg = <0x00000011>;
+
+			interrupt-controller {
+				phandle = <0x0000000a>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu4: cpu at 4 {
+			phandle = <0x0000000b>;
+			device_type = "cpu";
+			compatible = "riscv";
+			opensbi-domain = <&tdomain>;
+			mmu-type = "riscv,sv39";
+			riscv,isa = "rv64imafdcsu";
+			status = "okay";
+			reg = <0x00000020>;
+
+			interrupt-controller {
+				phandle = <0x0000000c>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu5: cpu at 5 {
+			phandle = <0x0000000d>;
+			device_type = "cpu";
+			compatible = "riscv";
+			opensbi-domain = <&tdomain>;
+			mmu-type = "riscv,sv39";
+			riscv,isa = "rv64imafdcsu";
+			status = "okay";
+			reg = <0x00000021>;
+
+			interrupt-controller {
+				phandle = <0x0000000e>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu6: cpu at 6 {
+			phandle = <0x0000000f>;
+			device_type = "cpu";
+			compatible = "riscv";
+			opensbi-domain = <&tdomain>;
+			mmu-type = "riscv,sv39";
+			riscv,isa = "rv64imafdcsu";
+			status = "okay";
+			reg = <0x00000030>;
+
+			interrupt-controller {
+				phandle = <0x00000010>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu7: cpu at 7 {
+			phandle = <0x00000011>;
+			device_type = "cpu";
+			compatible = "riscv";
+			opensbi-domain = <&tdomain>;
+			mmu-type = "riscv,sv39";
+			riscv,isa = "rv64imafdcsu";
+			status = "okay";
+			reg = <0x00000031>;
+
+			interrupt-controller {
+				phandle = <0x00000012>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+	};
+
+	memory at 0 {
+		device_type = "memory";
+		reg = <0x80000000 0x80000000>;
+	};
+
+	pci2: pci at 14000000 {
+		compatible = "xlnx,axi-pcie-host-1.00.a";
+		device_type = "pci";
+		reg = <0x14000000 0x2000000>;
+
+		#address-cells = <3>;
+		#size-cells = <2>;
+		#interrupt-cells = <1>;
+
+		interrupt-parent = <4>;
+		interrupts = <0x00000007 0x00000004>;
+
+		ranges = <0x02000000 0 0x16000000
+			  0x16000000 0 0x100000>;
+
+		bus-range = <0x00 0xff>;
+
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &pci2_intc 1>,
+				<0 0 0 2 &pci2_intc 2>,
+				<0 0 0 3 &pci2_intc 3>,
+				<0 0 0 4 &pci2_intc 4>;
+
+		pci2_intc: interrupt-controller {
+			interrupt-controller;
+			#address-cells = <0>;
+			#interrupt-cells = <1>;
+		};
+
+		pci2_root at 0,0,0 {
+			compatible = "pci10ee,7021", "pci-bridge";
+			reg = <0x00000000 0 0 0 0>;
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <1>;
+
+			eg20t_bridge at 1,0,0 {
+				compatible = "pci8086,8800", "pci-bridge";
+				reg = <0x00010000 0 0 0 0>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				#interrupt-cells = <1>;
+
+				eg20t_mac at 2,0,1 {
+					compatible = "pci8086,8802", "intel,pch-gbe";
+					reg = <0x00020100 0 0 0 0>;
+					phy-reset-gpios = <&eg20t_gpio 6 1>;
+				};
+
+				eg20t_gpio: eg20t_gpio at 2,0,2 {
+					compatible = "pci8086,8803", "intel,eg20t-gpio";
+					reg = <0x00020200 0 0 0 0>;
+
+					gpio-controller;
+					#gpio-cells = <2>;
+				};
+
+				eg20t_i2c at 2,12,2 {
+					compatible = "pci8086,8817";
+					reg = <0x00026200 0 0 0 0>;
+
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					rtc at 68 {
+						compatible = "st,m41t81s";
+						reg = <0x68>;
+					};
+				};
+			};
+		};
+	};
+
+	uart0: uart at 17ffe000 {
+		compatible = "ns16550a";
+		reg = <0x17ffe000 0x1000>;
+		reg-shift = <2>;
+		reg-io-width = <4>;
+
+		interrupt-parent = <4>;
+		interrupts = <0x00000004 0x00000004>;
+
+		clock-frequency = <BITFILE_FREQUENCY>;
+
+		u-boot,dm-pre-reloc;
+	};
+
+	lcd: lcd at 17fff000 {
+		compatible = "img,boston-lcd";
+		reg = <0x17fff000 0x8>;
+	};
+
+	flash at 18000000 {
+		compatible = "cfi-flash";
+		reg = <0x18000000 0x8000000>;
+		bank-width = <2>;
+	};
+
+	soc {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "simple-bus";
+		ranges;
+
+		aplic_s0 {
+			phandle = <0x00000004>;
+			#interrupt-cells = <0x00000002>;
+			compatible = "riscv,aplic";
+			interrupt-controller;
+			interrupts-extended = <2 9 6 9 8 9 10 9 12 9 14 9 16 9 18 9>;
+			reg = <APLIC_S_BASE 0x00008000>;
+			riscv,num-sources = <0x00000035>;
+		};
+
+		aplic_m0 {
+			phandle = <0x00000003>;
+			#interrupt-cells = <0x00000002>;
+			riscv,delegate = <0x00000004 0x00000001 0x00000035>;
+			riscv,children = <0x00000004>;
+			compatible = "riscv,aplic";
+			interrupt-controller;
+			interrupts-extended = <2 11 6 11 8 11 10 11 12 11 14 11 16 11 18 11>;
+			reg = <APLIC_M_BASE 0x00008000>;
+			riscv,num-sources = <0x00000035>;
+		};
+
+		mswi0 {
+			compatible = "riscv,aclint-mswi";
+			interrupts-extended = <2 3>, <6 3>, <8 3>, <10 3>, <12 3>, <14 3>, <16 3>, <18 3>;
+			reg = <MSWI_BASE 0x4000>;
+			interrupt-controller;
+			#interrupt-cells = <0>;
+		};
+
+		mtimer0 {
+			compatible = "riscv,aclint-mtimer";
+			reg = <CPC_TIMER 0x8>,
+			      <MTIMER_BASE 0x7ff8>;
+			interrupts-extended = <2 7>, <6 7>, <8 7>, <10 7>, <12 7>, <14 7>, <16 7>, <18 7>;
+		};
+	};
+};
-- 
2.47.1


