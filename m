From: Yu-Chien Peter Lin <peterlin@andestech.com>
Date: Mon, 19 Sep 2022 13:51:22 +0000
Subject: [PATCH 12/12] docs: andes-ae350.md: Update ae350 documentation for
 fdt driver support
In-Reply-To: <A4A9739F-3D40-425A-9430-F1CFE23BD296@jrtc27.com>
References: <20220915015121.27596-1-peterlin@andestech.com>
 <20220915015121.27596-13-peterlin@andestech.com>
 <A4A9739F-3D40-425A-9430-F1CFE23BD296@jrtc27.com>
Message-ID: <Yyhz2mqIK8syb7v5@APC323>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 15, 2022 at 03:31:38AM +0100, Jessica Clarke wrote:
> On 15 Sept 2022, at 02:51, Yu Chien Peter Lin <peterlin@andestech.com> wrote:
> > 
> > We update ae350 documentation to add details about platform device tree.
> > The nodes and their properties must be provided to properly initialize 
> > data of underlying hardware and access their mmio registers.
> > 
> > Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> > ---
> > docs/platform/andes-ae350.md | 191 ++++++++++++++++++++++++++++++++++-
> > 1 file changed, 187 insertions(+), 4 deletions(-)
> > 
> > diff --git a/docs/platform/andes-ae350.md b/docs/platform/andes-ae350.md
> > index 1cf83cf..2a0e242 100644
> > --- a/docs/platform/andes-ae350.md
> > +++ b/docs/platform/andes-ae350.md
> > @@ -18,13 +18,196 @@ The Andes AE350 platform does not have any platform-specific options.
> > Building Andes AE350 Platform
> > -----------------------------
> > 
> > -To use Linux v5.2 should be used to build Andes AE350 OpenSBI binaries by using
> > -the compile time option FW_FDT_PATH.
> > -
> > -AE350's dts is included in https://github.com/andestech/linux/tree/ast-v3_2_0-release-public
> > +AE350's dts is included in https://github.com/andestech/linux/tree/RISCV-Linux-5.4-ast-v5_1_0-branch
> > 
> > **Linux Kernel Payload**
> > 
> > ```
> > make PLATFORM=andes/ae350 FW_PAYLOAD_PATH=<linux_build_directory>/arch/riscv/boot/Image FW_FDT_PATH=<ae350.dtb path>
> > ```
> > +
> > +DTS Example: (Quad-core AX45MP)
> > +-------------------------------
> > +
> > +```
> > +	cpus {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +		timebase-frequency = <60000000>;
> > +
> > +		CPU0: cpu at 0 {
> > +			device_type = "cpu";
> > +			reg = <0>;
> > +			status = "okay";
> > +			compatible = "riscv";
> > +			riscv,isa = "rv64i2p0m2p0a2p0f2p0d2p0c2p0xv5-1p1xdsp0p0";
> 
> The versions mean it won?t validate even with the updated bindings in [1].

Hi Jessica,

Thanks, we'll update it to comply with bindings.

> > ...
> > +		wdt: wdt at f0500000 {
> > +			compatible = "andestech,atcwdt200";
> 
> Assuming atc stands for AndesTeCh that seems a bit redundant?
> 
> Jess

This is not an abbreviation but a term used in our manual and kernel driver.

Best regards,
Peter Lin

> 
> [1] https://lore.kernel.org/all/20220823183319.3314940-4-mail at conchuod.ie/
> 
> > +			reg = <0x00000000 0xf0500000 0x00000000 0x00001000>;
> > +			interrupts = <3 4>;
> > +			interrupt-parent = <&plic0>;
> > +			clock-frequency = <15000000>;
> > +		};
> > +
> > +		serial0: serial at f0300000 {
> > +			compatible = "andestech,uart16550", "ns16550a";
> > +			reg = <0x00000000 0xf0300000 0x00000000 0x00001000>;
> > +			interrupts = <9 4>;
> > +			interrupt-parent = <&plic0>;
> > +			clock-frequency = <19660800>;
> > +			current-speed = <38400>;
> > +			reg-shift = <2>;
> > +			reg-offset = <32>;
> > +			reg-io-width = <4>;
> > +			no-loopback-test = <1>;
> > +		};
> > +
> > +		smu: smu at f0100000 {
> > +			compatible = "andestech,atcsmu";
> > +			reg = <0x00000000 0xf0100000 0x00000000 0x00001000>;
> > +		};
> > +	};
> > +```
> > -- 
> > 2.34.1
> > 
> > 
> > -- 
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi
> 

