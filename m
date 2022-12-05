From: Yu-Chien Peter Lin <peterlin@andestech.com>
Date: Mon, 5 Dec 2022 09:38:23 +0000
Subject: [PATCH 2/4] docs: platform: Update AE350 and generic platform
 documentation
In-Reply-To: <CAEUhbmW8y4tQixXSw-kLsjsGTf89wMfEYAW_dnmAsruN581dWQ@mail.gmail.com>
References: <20221128083046.6799-1-peterlin@andestech.com>
 <20221128083046.6799-3-peterlin@andestech.com>
 <CAEUhbmW8y4tQixXSw-kLsjsGTf89wMfEYAW_dnmAsruN581dWQ@mail.gmail.com>
Message-ID: <Y428D1JYLNd8/s1R@APC323>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Dec 03, 2022 at 12:10:08AM +0800, Bin Meng wrote:
> On Mon, Nov 28, 2022 at 4:33 PM Yu Chien Peter Lin
> <peterlin@andestech.com> wrote:
> >
> > Update compile option and platform compatible string for AE350 and
> > add it to the generic platform list.
> >
> > Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> > ---
> >  docs/platform/andes-ae350.md | 5 +++--
> >  docs/platform/generic.md     | 2 ++
> >  2 files changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/docs/platform/andes-ae350.md b/docs/platform/andes-ae350.md
> > index ec241ec..4739951 100644
> > --- a/docs/platform/andes-ae350.md
> > +++ b/docs/platform/andes-ae350.md
> > @@ -8,7 +8,7 @@ AHB/APB IPs suites a majority embedded systems, and the verified platform serves
> >  as a starting point to jump start SoC designs.
> >
> >  To build platform specific library and firmwares, provide the
> > -*PLATFORM=andes/ae350* parameter to the top level make command.
> > +*PLATFORM=generic* parameter to the top level `make` command.
> >
> >  Platform Options
> >  ----------------
> > @@ -23,13 +23,14 @@ AE350's dts is included in https://github.com/andestech/linux/tree/RISCV-Linux-5
> >  **Linux Kernel Payload**
> >
> >  ```
> > -make PLATFORM=andes/ae350 FW_PAYLOAD_PATH=<linux_build_directory>/arch/riscv/boot/Image FW_FDT_PATH=<ae350.dtb path>
> > +make PLATFORM=generic FW_PAYLOAD_PATH=<linux_build_directory>/arch/riscv/boot/Image FW_FDT_PATH=<ae350.dtb path>
> >  ```
> >
> >  DTS Example: (Quad-core AX45MP)
> >  -------------------------------
> >
> >  ```
> > +       compatible = "andestech,ae350";
> >         cpus {
> >                 #address-cells = <1>;
> >                 #size-cells = <0>;
> > diff --git a/docs/platform/generic.md b/docs/platform/generic.md
> > index 73a8afa..bd3c8ab 100644
> > --- a/docs/platform/generic.md
> > +++ b/docs/platform/generic.md
> > @@ -50,9 +50,11 @@ RISC-V Platforms Using Generic Platform
> >  * **SiFive HiFive Unleashed** (*[sifive_fu540.md]*)
> >  * **Spike** (*[spike.md]*)
> >  * **T-HEAD C9xx series Processors** (*[thead-c9xx.md]*)
> > +* **Andes AE350 Platform** (*[andes-ae350.md]*)
> 
> nits: please insert this by following alphabetical order
> 
> >
> >  [qemu_virt.md]: qemu_virt.md
> >  [shakti_cclass.md]: shakti_cclass.md
> >  [sifive_fu540.md]: sifive_fu540.md
> >  [spike.md]: spike.md
> >  [thead-c9xx.md]: thead-c9xx.md
> > +[andes-ae350.md]: andse-ae350.md
> > --
> 
> nits: please insert this by following alphabetical order
> 
> Otherwise,
> Reviewed-by: Bin Meng <bmeng@tinylab.org>

Hi Bin,

Thanks for your review,
I'll reorder the list.

Best regards,
Peter Lin

