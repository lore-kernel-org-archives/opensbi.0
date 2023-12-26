From: Gabriel L. Somlo <gsomlo@gmail.com>
Date: Tue, 26 Dec 2023 11:59:41 -0500
Subject: Help: commit 6112d58 breaks my kernel boot
Message-ID: <ZYsGfc/U10S0mKna@errol.ini.cmu.edu>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I recently updated my opensbi sources, and noticed that commit
6112d58 ("lib: utils/fdt: Allow to use reg-names when parsing ACLINT")
breaks booting the (latest upstream) kernel on my LiteX + 4-core Rocket
setup. Without that commit, the kernel boots fine. With the commit
applied, I get:

...
 riscv: providing IPIs using SBI IPI extension
 rcu: srcu_init: Setting srcu_struct sizes based on contention.
 clocksource: riscv_clocksource: mask: 0xffffffffffffffff max_cycles: 0x1d854df40, max_idle_ns: 7052723233920 ns
 sched_clock: 64 bits at 500kHz, resolution 2000ns, wraps every 4398046511000ns
 ------------[ cut here ]------------
 Missing cycle counter and fallback timer; RNG entropy collection will consequently suffer.
 WARNING: CPU: 0 PID: 0 at drivers/char/random.c:905 random_init+0xd0/0xf2
 CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6.7.0-rc7-00022-ga42afb217b9c #103
 Hardware name: freechips,rocketchip-unknown (DT)
 epc : random_init+0xd0/0xf2
  ra : random_init+0xd0/0xf2
 epc : ffffffff8061b364 ra : ffffffff8061b364 sp : ffffffff80e03e40
  gp : ffffffff80ebaac0 tp : ffffffff80e0aa40 t0 : ffffffff80e137a8
  t1 : 000000000000002d t2 : 2d2d2d2d2d2d2d2d s0 : ffffffff80e03e80
  s1 : ffffffff80ebc320 a0 : 000000000000005a a1 : ffffffff80e82678
  a2 : 0000000000000010 a3 : fffffffffffffffe a4 : 0000000000000000
  a5 : 0000000000000000 a6 : 0000000000000000 a7 : 0000000000000000
  s2 : ffffffff80b0ca70 s3 : ffffffd81f7f5640 s4 : 0000000000000000
  s5 : ffffffff80ebb018 s6 : ffffffff80800018 s7 : 000000000000007f
  s8 : 0000000000002000 s9 : 00000000800436f0 s10: 0000000000000000
  s11: 0000000000000000 t3 : ffffffff80ecab67 t4 : ffffffff80ecab67
  t5 : ffffffff80ecab68 t6 : ffffffff80e03c58
 status: 0000000200000100 badaddr: ffffffff8061b364 cause: 0000000000000003
 [<ffffffff8061b364>] random_init+0xd0/0xf2
 [<ffffffff80600bb6>] start_kernel+0x45c/0x626
 ---[ end trace 0000000000000000 ]---

My DTS is enclosed in case it helps pinpoint what I might need to
update, or as a way to figure out whether commit 6112d58 is missing
some otherwise valid corner case.

Any ideas re. what I'm missing, what else about my setup I should
include to help you help me troubleshoot this, etc. -- much
appreciated!

Thanks,
--Gabriel


/dts-v1/;

/ {
	#address-cells = <1>;
	#size-cells = <1>;
	compatible = "freechips,rocketchip-unknown-dev";
	model = "freechips,rocketchip-unknown";
	chosen {
		bootargs = "console=liteuart earlycon=liteuart,0x12009000 swiotlb=noforce rootwait root=/dev/ram0";
		linux,initrd-start = <0x82000000>;
		linux,initrd-end   = <0x820BA974>; /* end initrd.gz + 12814 (?) bytes */
	};
	L13: cpus {
		#address-cells = <1>;
		#size-cells = <0>;
		timebase-frequency = <500000>;
		L6: cpu at 0 {
			clock-frequency = <50000000>;
			compatible = "sifive,rocket0", "riscv";
			d-cache-block-size = <64>;
			d-cache-sets = <64>;
			d-cache-size = <16384>;
			d-tlb-sets = <1>;
			d-tlb-size = <32>;
			device_type = "cpu";
			hardware-exec-breakpoint-count = <1>;
			i-cache-block-size = <64>;
			i-cache-sets = <64>;
			i-cache-size = <16384>;
			i-tlb-sets = <1>;
			i-tlb-size = <32>;
			mmu-type = "riscv,sv39";
			next-level-cache = <&L8>;
			reg = <0x0>;
			riscv,isa = "rv64imafdcZicsr_Zifencei_Zihpm_Xrocket";
			riscv,pmpgranularity = <4>;
			riscv,pmpregions = <8>;
			status = "okay";
			tlb-split;
			L4: interrupt-controller {
				#interrupt-cells = <1>;
				compatible = "riscv,cpu-intc";
				interrupt-controller;
			};
		};
		L16: cpu at 1 {
			clock-frequency = <50000000>;
			compatible = "sifive,rocket0", "riscv";
			d-cache-block-size = <64>;
			d-cache-sets = <64>;
			d-cache-size = <16384>;
			d-tlb-sets = <1>;
			d-tlb-size = <32>;
			device_type = "cpu";
			hardware-exec-breakpoint-count = <1>;
			i-cache-block-size = <64>;
			i-cache-sets = <64>;
			i-cache-size = <16384>;
			i-tlb-sets = <1>;
			i-tlb-size = <32>;
			mmu-type = "riscv,sv39";
			next-level-cache = <&L8>;
			reg = <0x1>;
			riscv,isa = "rv64imafdcZicsr_Zifencei_Zihpm_Xrocket";
			riscv,pmpgranularity = <4>;
			riscv,pmpregions = <8>;
			status = "okay";
			tlb-split;
			L14: interrupt-controller {
				#interrupt-cells = <1>;
				compatible = "riscv,cpu-intc";
				interrupt-controller;
			};
		};
		L26: cpu at 2 {
			clock-frequency = <50000000>;
			compatible = "sifive,rocket0", "riscv";
			d-cache-block-size = <64>;
			d-cache-sets = <64>;
			d-cache-size = <16384>;
			d-tlb-sets = <1>;
			d-tlb-size = <32>;
			device_type = "cpu";
			hardware-exec-breakpoint-count = <1>;
			i-cache-block-size = <64>;
			i-cache-sets = <64>;
			i-cache-size = <16384>;
			i-tlb-sets = <1>;
			i-tlb-size = <32>;
			mmu-type = "riscv,sv39";
			next-level-cache = <&L8>;
			reg = <0x2>;
			riscv,isa = "rv64imafdcZicsr_Zifencei_Zihpm_Xrocket";
			riscv,pmpgranularity = <4>;
			riscv,pmpregions = <8>;
			status = "okay";
			tlb-split;
			L24: interrupt-controller {
				#interrupt-cells = <1>;
				compatible = "riscv,cpu-intc";
				interrupt-controller;
			};
		};
		L36: cpu at 3 {
			clock-frequency = <50000000>;
			compatible = "sifive,rocket0", "riscv";
			d-cache-block-size = <64>;
			d-cache-sets = <64>;
			d-cache-size = <16384>;
			d-tlb-sets = <1>;
			d-tlb-size = <32>;
			device_type = "cpu";
			hardware-exec-breakpoint-count = <1>;
			i-cache-block-size = <64>;
			i-cache-sets = <64>;
			i-cache-size = <16384>;
			i-tlb-sets = <1>;
			i-tlb-size = <32>;
			mmu-type = "riscv,sv39";
			next-level-cache = <&L8>;
			reg = <0x3>;
			riscv,isa = "rv64imafdcZicsr_Zifencei_Zihpm_Xrocket";
			riscv,pmpgranularity = <4>;
			riscv,pmpregions = <8>;
			status = "okay";
			tlb-split;
			L34: interrupt-controller {
				#interrupt-cells = <1>;
				compatible = "riscv,cpu-intc";
				interrupt-controller;
			};
		};
	};
	L8: memory at 80000000 {
		device_type = "memory";
		reg = <0x80000000 0x20000000>; /* 512MB (ecpix5, nexys_video) */
	};
	clocks {
		sys_clk: litex_sys_clk {
			#clock-cells = <0>;
			compatible = "fixed-clock";
			clock-frequency = <50000000>;
		};
	};
	vreg_mmc: vreg_mmc {
		compatible = "regulator-fixed";
		regulator-name = "vreg_mmc";
		regulator-min-microvolt = <3300000>;
		regulator-max-microvolt = <3300000>;
		regulator-always-on;
	};
	L12: soc {
		#address-cells = <1>;
		#size-cells = <1>;
		compatible = "freechips,rocketchip-unknown-soc", "simple-bus";
		ranges;
		L2: clint at 2000000 {
			compatible = "riscv,clint0";
			interrupts-extended = <&L4 3 &L4 7 &L14 3 &L14 7 &L24 3 &L24 7 &L34 3 &L34 7>;
			reg = <0x2000000 0x10000>;
			reg-names = "control";
		};
		L3: debug-controller at 0 {
			compatible = "sifive,debug-013", "riscv,debug-013";
			//interrupts-extended = <&L4 0x3F &L14 0x3F &L24 0x3F &L34 0x3F>;
			//FIXME: had to reduce this to 0x3F before, now there
			//are no more kernel errors upon initialization, should
			//I just go with the chisel-elaborated defaults (below)?
			interrupts-extended = <&L4 0xFFFF &L14 0xFFFF &L24 0xFFFF &L34 0xFFFF>;
			reg = <0x0 0x1000>;
			reg-names = "control";
		};
		L0: error-device at 3000 {
			compatible = "sifive,error0";
			reg = <0x3000 0x1000>;
		};
		L7: external-interrupts {
			interrupt-parent = <&L1>;
			interrupts = <1 2 3 4 5 6 7 8>;
		};
		L1: interrupt-controller at c000000 {
			#interrupt-cells = <1>;
			compatible = "riscv,plic0";
			interrupt-controller;
			interrupts-extended = <&L4 11 &L4 9 &L14 11 &L14 9 &L24 11 &L24 9 &L34 11 &L34 9>;
			reg = <0xc000000 0x4000000>;
			reg-names = "control";
			riscv,max-priority = <7>;
			riscv,ndev = <8>;
		};
		L10: rom at 10000 {
			compatible = "sifive,rom0";
			reg = <0x10000 0x10000>;
			reg-names = "mem";
		};
		soc_ctrl0: soc_controller at 12000000 {
			compatible = "litex,soc-controller";
			reg = <0x12000000 0xc>;
		};
		liteuart0: serial at 12009000 {
			compatible = "litex,liteuart";
			reg = <0x12009000 0x100>;
			interrupt-parent = <&L1>;
			interrupts = <1>;
		};
		mac0: mac at 12001000 {
			compatible = "litex,liteeth";
			reg = <0x12001000 0x100>,
				<0x12001800 0x100>,
				<0x30000000 0x2000>;
			reg-names = "mac", "mdio", "buffer";
			litex,rx-slots = <2>;
			litex,tx-slots = <2>;
			litex,slot-size = <0x800>;
			interrupt-parent = <&L1>;
			interrupts = <3>;
		};
		mmc0: mmc at 12007800 {
			compatible = "litex,mmc";
			reg = <0x12007800 0x100>,
				<0x12006000 0x100>,
				<0x12005800 0x100>,
				<0x12007000 0x100>,
				<0x12006800 0x100>;
			reg-names = "phy", "core", "reader", "writer", "irq";
			clocks = <&sys_clk>;
			vmmc-supply = <&vreg_mmc>;
			interrupt-parent = <&L1>;
			interrupts = <5>;
		};
		litesata0: litesata at 12003000 {
			compatible = "litex,litesata";
			reg = <0x12003000 0x100>,
				<0x12004800 0x100>,
				<0x12005000 0x100>,
				<0x12004000 0x100>,
				<0x12003800 0x100>;
			reg-names = "ident", "phy", "reader", "writer", "irq";
			interrupt-parent = <&L1>;
			interrupts = <4>;
		};
		timer at 12008800 {
			compatible = "litex,timer";
			reg = <0x12008800 0x20>;
			clocks = <&sys_clk>;
			interrupt-parent = <&L1>;
			interrupts = <2>;
			//litex,width = <32>;
		};
	};
};


