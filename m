From: Marouene Boubakri <marouene.boubakri@nxp.com>
Date: Tue, 27 Dec 2022 08:24:36 +0000
Subject: [EXT] Re: BUG: OpenSBI crashes when passing custom DTB on Qemu
In-Reply-To: <CAEUhbmX3JXdv1=ek0yugEHnVP-h84rgHUj1f5PAa4YBvBSXBdw@mail.gmail.com>
References: <AS1PR04MB9455ACCE24963065CDC19D47FCEC9@AS1PR04MB9455.eurprd04.prod.outlook.com>
 <CAEUhbmX3JXdv1=ek0yugEHnVP-h84rgHUj1f5PAa4YBvBSXBdw@mail.gmail.com>
Message-ID: <AS1PR04MB9455E9128C9AD28B6812C550FCED9@AS1PR04MB9455.eurprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I updated the issue on Github
Here is the DTS:

/dts-v1/;

/ {
        #address-cells = <0x02>;
        #size-cells = <0x02>;
        compatible = "riscv-virtio";
        model = "riscv-virtio,qemu";

        /*fw-cfg at 10100000 {
                dma-coherent;
                reg = <0x00 0x10100000 0x00 0x18>;
                compatible = "qemu,fw-cfg-mmio";
        };*/

        flash at 20000000 {
                bank-width = <0x04>;
                reg = <0x00 0x20000000 0x00 0x2000000 0x00 0x22000000 0x00 0x2000000>;
                compatible = "cfi-flash";
        };

        chosen {
                bootargs = "root=/dev/vda rw console=ttyS0 earlycon";
                stdout-path = "/soc/uart at 10000000";
				
				opensbi-domains {
					compatible = "opensbi,domain,config";

					mumem: mumem {
						compatible = "opensbi,domain,memregion";
						base = <0x0 0x50000000>;
						order = <10>;
					};

					tmem: tmem {
						compatible = "opensbi,domain,memregion";
						base = <0x0 0x80100000>;
						order = <20>;
					};

					tuart: tuart {
						compatible = "opensbi,domain,memregion";
						base = <0x0 0x10000000>;
						order = <12>;
						mmio;
						devices = <&uart0>;
					};

					allmem: allmem {
						compatible = "opensbi,domain,memregion";
						base = <0x0 0x0>;
						order = <64>;
					};

					tdomain: trusted-domain {
						compatible = "opensbi,domain,instance";
						possible-harts = <&cpu0>;
						/* dev: access to all for now */
						regions = <&tmem 0x7>, <&tuart 0x7>, <&allmem 0x7>, <&mumem 0x7>;
						boot-hart = <&cpu0>;
						next-arg1 = <0x0 0x0>;
						next-addr = <0x0 0x80100000>;
						next-mode = <0x1>;
						system-reset-allowed;
					};

					udomain: untrusted-domain {
						compatible = "opensbi,domain,instance";
						possible-harts = <&cpu1 &cpu2 &cpu3>;
						/* dev: access to all for now */
						regions = <&tmem 0x0>, <&tuart 0x7>, <&allmem 0x7>, <&mumem 0x7>;
					};
				};				
        };

        memory at 80000000 {
                device_type = "memory";
                reg = <0x00 0x80000000 0x00 0x10000000>;
        };
	
        cpus {
                #address-cells = <0x01>;
                #size-cells = <0x00>;
                timebase-frequency = <0x989680>;

                cpu0: cpu at 0 {
                        phandle = <0x07>;
                        device_type = "cpu";
                        reg = <0x00>;
                        status = "okay";
                        compatible = "riscv";
                        riscv,isa = "rv64imafdcsu";
			opensbi-domain = <&tdomain>;
                        mmu-type = "riscv,sv39";

                        interrupt-controller {
                                #interrupt-cells = <0x01>;
                                interrupt-controller;
                                compatible = "riscv,cpu-intc";
                                phandle = <0x08>;
                        };
                };

                cpu1:cpu at 1 {
                        phandle = <0x05>;
                        device_type = "cpu";
                        reg = <0x01>;
                        status = "okay";
                        compatible = "riscv";
                        riscv,isa = "rv64imafdcsu";
			opensbi-domain = <&udomain>;
                        mmu-type = "riscv,sv39";

                        interrupt-controller {
                                #interrupt-cells = <0x01>;
                                interrupt-controller;
                                compatible = "riscv,cpu-intc";
                                phandle = <0x06>;
                        };
                };

                cpu2:cpu at 2 {
                        phandle = <0x03>;
                        device_type = "cpu";
                        reg = <0x02>;
                        status = "okay";
                        compatible = "riscv";
                        riscv,isa = "rv64imafdcsu";
			opensbi-domain = <&udomain>;
                        mmu-type = "riscv,sv39";

                        interrupt-controller {
                                #interrupt-cells = <0x01>;
                                interrupt-controller;
                                compatible = "riscv,cpu-intc";
                                phandle = <0x04>;
                        };
                };

                cpu3:cpu at 3 {
                        phandle = <0x01>;
                        device_type = "cpu";
                        reg = <0x03>;
                        status = "okay";
                        compatible = "riscv";
                        riscv,isa = "rv64imafdcsu";
			opensbi-domain = <&udomain>;
                        mmu-type = "riscv,sv39";

                        interrupt-controller {
                                #interrupt-cells = <0x01>;
                                interrupt-controller;
                                compatible = "riscv,cpu-intc";
                                phandle = <0x02>;
                        };
                };

                cpu-map {

                        cluster0 {

                                /*core0 {
                                        cpu = <0x07>;
                                };*/

                                core1 {
                                        cpu = <0x05>;
                                };

                                core2 {
                                        cpu = <0x03>;
                                };

                                core3 {
                                        cpu = <0x01>;
                                };
                        };
                };
        };

        soc {
                #address-cells = <0x02>;
                #size-cells = <0x02>;
                compatible = "simple-bus";
                ranges;

                rtc at 101000 {
                        interrupts = <0x0b>;
                        interrupt-parent = <0x09>;
                        reg = <0x00 0x101000 0x00 0x1000>;
                        compatible = "google,goldfish-rtc";
                };

                uart0:uart at 10000000 {
                        interrupts = <0x0a>;
                        interrupt-parent = <0x09>;
                        clock-frequency = "\08@";
                        reg = <0x00 0x10000000 0x00 0x100>;
                        compatible = "ns16550a";
                };

                poweroff {
                        value = <0x5555>;
                        offset = <0x00>;
                        regmap = <0x0a>;
                        compatible = "syscon-poweroff";
                };

                reboot {
                        value = <0x7777>;
                        offset = <0x00>;
                        regmap = <0x0a>;
                        compatible = "syscon-reboot";
                };

                test at 100000 {
                        phandle = <0x0a>;
                        reg = <0x00 0x100000 0x00 0x1000>;
                        compatible = "sifive,test1\0sifive,test0\0syscon";
                };

                pci at 30000000 {
                        interrupt-map-mask = <0x1800 0x00 0x00 0x07>;
                        interrupt-map = <0x00 0x00 0x00 0x01 0x09 0x20 0x00 0x00 0x00 0x02 0x09 0x21 0x00 0x00 0x00 0x03 0x09 0x22 0x00 0x00 0x00 0x04 0x09 0x23 0x800 0x00 0x00 0x01 0x09 0x21 0x800 0x00 0x00 0x02 0x09 0x22 0x800 0x00 0x00 0x03 0x09 0x23 0x800 0x00 0x00 0x04 0x09 0x20 0x1000 0x00 0x00 0x01 0x09 0x22 0x1000 0x00 0x00 0x02 0x09 0x23 0x1000 0x00 0x00 0x03 0x09 0x20 0x1000 0x00 0x00 0x04 0x09 0x21 0x1800 0x00 0x00 0x01 0x09 0x23 0x1800 0x00 0x00 0x02 0x09 0x20 0x1800 0x00 0x00 0x03 0x09 0x21 0x1800 0x00 0x00 0x04 0x09 0x22>;
                        ranges = <0x1000000 0x00 0x00 0x00 0x3000000 0x00 0x10000 0x2000000 0x00 0x40000000 0x00 0x40000000 0x00 0x40000000 0x3000000 0x04 0x00 0x04 0x00 0x04 0x00>;
                        reg = <0x00 0x30000000 0x00 0x10000000>;
                        dma-coherent;
                        bus-range = <0x00 0xff>;
                        linux,pci-domain = <0x00>;
                        device_type = "pci";
                        compatible = "pci-host-ecam-generic";
                        #size-cells = <0x02>;
                        #interrupt-cells = <0x01>;
                        #address-cells = <0x03>;
                };

                virtio_mmio at 10008000 {
                        interrupts = <0x08>;
                        interrupt-parent = <0x09>;
                        reg = <0x00 0x10008000 0x00 0x1000>;
                        compatible = "virtio,mmio";
                };

                virtio_mmio at 10007000 {
                        interrupts = <0x07>;
                        interrupt-parent = <0x09>;
                        reg = <0x00 0x10007000 0x00 0x1000>;
                        compatible = "virtio,mmio";
                };

                virtio_mmio at 10006000 {
                        interrupts = <0x06>;
                        interrupt-parent = <0x09>;
                        reg = <0x00 0x10006000 0x00 0x1000>;
                        compatible = "virtio,mmio";
                };

                virtio_mmio at 10005000 {
                        interrupts = <0x05>;
                        interrupt-parent = <0x09>;
                        reg = <0x00 0x10005000 0x00 0x1000>;
                        compatible = "virtio,mmio";
                };

                virtio_mmio at 10004000 {
                        interrupts = <0x04>;
                        interrupt-parent = <0x09>;
                        reg = <0x00 0x10004000 0x00 0x1000>;
                        compatible = "virtio,mmio";
                };

                virtio_mmio at 10003000 {
                        interrupts = <0x03>;
                        interrupt-parent = <0x09>;
                        reg = <0x00 0x10003000 0x00 0x1000>;
                        compatible = "virtio,mmio";
                };

                virtio_mmio at 10002000 {
                        interrupts = <0x02>;
                        interrupt-parent = <0x09>;
                        reg = <0x00 0x10002000 0x00 0x1000>;
                        compatible = "virtio,mmio";
                };

                virtio_mmio at 10001000 {
                        interrupts = <0x01>;
                        interrupt-parent = <0x09>;
                        reg = <0x00 0x10001000 0x00 0x1000>;
                        compatible = "virtio,mmio";
                };

                plic at c000000 {
                        phandle = <0x09>;
                        riscv,ndev = <0x35>;
                        reg = <0x00 0xc000000 0x00 0x210000>;
                        interrupts-extended = <0x08 0x0b 0x08 0x09 0x06 0x0b 0x06 0x09 0x04 0x0b 0x04 0x09 0x02 0x0b 0x02 0x09>;
                        interrupt-controller;
                        compatible = "sifive,plic-1.0.0\0riscv,plic0";
                        #interrupt-cells = <0x01>;
                        #address-cells = <0x00>;
                };

                clint at 2000000 {
                        interrupts-extended = <0x08 0x03 0x08 0x07 0x06 0x03 0x06 0x07 0x04 0x03 0x04 0x07 0x02 0x03 0x02 0x07>;
                        reg = <0x00 0x2000000 0x00 0x10000>;
                        compatible = "sifive,clint0\0riscv,clint0";
                };
        };

		firmware {
			optee {
				compatible = "riscv,optee-td";
				method = "rpmsg";
			};
		};
	
};

-----Original Message-----
From: Bin Meng <bmeng.cn@gmail.com> 
Sent: Tuesday, December 27, 2022 8:50 AM
To: Marouene Boubakri <marouene.boubakri@nxp.com>
Cc: opensbi at lists.infradead.org
Subject: [EXT] Re: BUG: OpenSBI crashes when passing custom DTB on Qemu

Caution: EXT Email

On Tue, Dec 27, 2022 at 2:27 AM Marouene Boubakri <marouene.boubakri@nxp.com> wrote:
>
> Hi,
>
> Is the OpenSBI community looking to the Github repository sometime ?
> I opened an issue [1] and would be great if someone looks at this.
>
> [1] 
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgith
> ub.com%2Friscv-software-src%2Fopensbi%2Fissues%2F281&data=05%7C01%7Cma
> rouene.boubakri%40nxp.com%7C7cdd0a33c2224e4342a208dae7deec3b%7C686ea1d
> 3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638077241876898208%7CUnknown%7CTWF
> pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6M
> n0%3D%7C3000%7C%7C%7C&sdata=40WuGPVNGHBxpElw7XR9rmjuCX8kucy2Ho0RA%2FH9
> kGw%3D&reserved=0
>

Yes, it's monitored, and I asked for a clarification already.

Regards,
Bin

