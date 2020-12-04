From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 3 Dec 2020 22:59:28 -0800
Subject: [PATCH 09/11] docs: Add domain device tree binding documentation
In-Reply-To: <CAOnJCULeMC3gGQf5YsaSNoVJnwqq4BrPZcWADtAijY2HdXMJwg@mail.gmail.com>
References: <20201121094756.4154728-1-anup.patel@wdc.com>
 <20201121094756.4154728-10-anup.patel@wdc.com>
 <CAOnJCULeMC3gGQf5YsaSNoVJnwqq4BrPZcWADtAijY2HdXMJwg@mail.gmail.com>
Message-ID: <CAOnJCUKwMc_YuUt_wUwz+d0BeWi=TTOyjw7cnHAPn+bisafaag@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 3, 2020 at 3:47 PM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Sat, Nov 21, 2020 at 2:53 PM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > This patch adds domain device tree binding documentation in the
> > OpenSBI domain support documentation.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  docs/domain_support.md | 186 +++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 186 insertions(+)
> >
> > diff --git a/docs/domain_support.md b/docs/domain_support.md
> > index 04989df..eae8cdb 100644
> > --- a/docs/domain_support.md
> > +++ b/docs/domain_support.md
> > @@ -104,3 +104,189 @@ Few noteworthy effects of a system partitioned into domains are as follows:
> >    only work if both HART A and HART B are assigned same domain
> >  * A HART running in S-mode or U-mode can only access memory based on the
> >    memory regions of the domain assigned to the HART
> > +
> > +Domain Device Tree Bindings
> > +---------------------------
> > +
> > +The OpenSBI domains can be described in the **device tree (DT) blob** (or
>
> must/should be ?
>
> > +flattened device tree) passed to the OpenSBI firmwares by the previous
> > +booting stage. This allows OpenSBI platform support to parse and populate
> > +OpenSBI domains from the device tree blob (or flattened device tree).
> > +
> > +### Domain Configuration Node
> > +
> > +All OpenSBI domain description related DT nodes should be under the domain
> > +configuration DT node. The **/chosen** DT node is the preferred parent of
> > +the domain configuration DT node and it should have **compatible** DT
> > +property with value *"opensbi,domain,config"*.
> > +
>
> Follow the same formatting for properties as below. For example.
>
> .. it should have following  DT properties.
>
> * **compatible** (Mandatory) - The compatible string of the domain
> node under /chosen
> node. This DT property should have value *"opensbi,domain,config"*.
>
>
> > +### Domain Memory Region Node
> > +
> > +The domain memory region DT node describes details of a memory region and
> > +can be pointed by multiple domain instance DT nodes. The access permissions
> > +of the memory region are specified separately in domain instance node.
> > +
> > +The DT properties of a domain memory region DT node are as follows:
> > +
> > +* **compatible** (Mandatory) - The compatible string of the domain memory
> > +  region. This DT property should have value *"opensbi,domain,memregion"*
> > +* **base** (Mandatory) - The base address of the domain memory region. This
> > +  DT property should have a **2 ^ order** aligned 64 bit address (i.e. two
> > +  DT cells).
> > +**order** (Mandatory) - The order of the domain memory region. This DT
> > +  property should have a 32 bit value (i.e. one DT cell) in the range
> > +  **3 <= order <= __riscv_xlen**.
> > +* **mmio** (Optional) - A boolean flag representing whether the domain
> > +  memory region is a memory-mapped I/O (MMIO) region.
> > +* **devices** (Optional) - The list of device DT node phandles for devices
> > +  which fall under this domain memory region.
> > +
> > +### Domain Instance Node
> > +
> > +The domain instance DT node describes a domain instance using following
> > +DT properties:
> > +
> > +* **compatible** (Mandatory) - The compatible string of the domain instance.
> > +  This DT property should have value *"opensbi,domain,instance"*
> > +* **possible-harts** (Optional) - The list of CPU DT node phandles for the
> > +  the domain instance. This list represents the possible HARTs of the
> > +  domain instance.
> > +* **regions** (Optional) - The list of domain memory region DT node phandle
> > +  and access permissions for the domain instance. Each list entry is a pair
> > +  of DT node phandle and access permissions. The access permissions are
> > +  represented as a 32bit bitmask having bits: **readable** (BIT[0]),
> > +  **writeable** (BIT[1]), **executable** (BIT[2]), and **m-mode** (BIT[3]).
> > +* **boot-hart** (Optional) - The DT node phandle of the HART booting the
> > +  domain instance. If coldboot HART is assigned to the domain instance then
> > +  this DT property is ignored and the coldboot HART is assumed to be the
> > +  boot HART of the domain instance.
> > +* **next-arg1** (Optional) - The 64 bit next booting stage arg1 for the
> > +  domain instance. If this DT property is not available and coldboot HART
> > +  is not assigned to the domain instance then **0x0** is used as default
> > +  value. If this DT property is not available and coldboot HART is assigned
> > +  to the domain instance then **next booting stage arg1 of coldboot HART**
> > +  is used as default value.
> > +* **next-addr** (Optional) - The 64 bit next booting stage address for the
> > +  domain instance. If this DT property is not available and coldboot HART
> > +  is not assigned to the domain instance then **0x0** is used as default
> > +  value. If this DT property is not available and coldboot HART is assigned
> > +  to the domain instance then **next booting stage address of coldboot HART**
> > +  is used as default value.
> > +* **next-mode** (Optional) - The 32 bit next booting stage mode for the
> > +  domain instance. The possible values of this DT property are: **0x1**
> > +  (s-mode), and **0x0** (u-mode).
>
> An ascii table format would be good for these.
>
>  If this DT property is not available
> > +  and coldboot HART is not assigned to the domain instance then **0x1**
> > +  is used as default value. If this DT property is not available and
> > +  coldboot HART is assigned to the domain instance then **next booting
> > +  stage mode of coldboot HART** is used as default value.
> > +* **system-reset-allowed** (Optional) - A boolean flag representing
> > +  whether the domain instance is allowed to do system reset.
> > +
>
> It should define the default value in case this property is not present.
>

Please Ignore this comment. I missed the boolean part :)

> > +### Assigning HART To Domain Instance
> > +
> > +By default, all HARTs are assigned to **the ROOT domain**. The OpenSBI
> > +platform support can provide the HART to domain instance assignment using
> > +platform specific callback.
> > +
> > +The HART to domain instance assignment can be parsed from the device tree
> > +using optional DT property **opensbi,domain** in each CPU DT node. The
> > +value of DT property **opensbi,domain** is the DT phandle of the domain
> > +instance DT node. If **opensbi,domain** DT property is not specified then
> > +corresponding HART is assigned to **the ROOT domain**.
> > +
>
> It should also say that this property and the entire opensbi-domains
> property will be removed by OpenSBI
> before jumping to the next stage.
>
> > +### Example
> > +
> > +```
> > +    chosen {
> > +        opensbi-domains {
> > +            compatible = "opensbi,domain,config";
> > +
> > +            tmem: tmem {
> > +                compatible = "opensbi,domain,memregion";
> > +                base = <0x0 0x80100000>;
> > +                order = <20>;
> > +            };
> > +
> > +            tuart: tuart {
> > +                compatible = "opensbi,domain,memregion";
> > +                base = <0x0 0x10011000>;
> > +                order = <12>;
> > +                mmio;
> > +                devices = <&uart1>;
> > +            };
> > +
> > +            allmem: allmem {
> > +                compatible = "opensbi,domain,memregion";
> > +                base = <0x0 0x0>;
> > +                order = <64>;
> > +            };
> > +
> > +            tdomain: trusted-domain {
> > +                compatible = "opensbi,domain,instance";
> > +                possible-harts = <&cpu0>;
> > +                regions = <&tmem 0x7>, <&tuart 0x7>;
> > +                boot-hartid = <&cpu0>;
> > +                next-arg1 = <0x0 0x0>;
> > +                next-addr = <0x0 0x80100000>;
> > +                next-mode = <0x0>;
> > +                system-reset-allowed;
> > +            };
> > +
> > +            udomain: untrusted-domain {
> > +                compatible = "opensbi,domain,instance";
> > +                possible-harts = <&cpu1 &cpu2 &cpu3 &cpu4>;
> > +                regions = <&tmem 0x0>, <&tuart 0x0>, <&allmem 0x7>;
> > +            };
> > +        };
> > +    };
> > +
> > +    cpus {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +        timebase-frequency = <10000000>;
> > +
> > +        cpu0: cpu at 0 {
> > +            device_type = "cpu";
> > +            reg = <0x00>;
> > +            compatible = "riscv";
> > +            opensbi-domain = <&tdomain>;
> > +            ...
> > +        };
> > +
> > +        cpu1: cpu at 1 {
> > +            device_type = "cpu";
> > +            reg = <0x01>;
> > +            compatible = "riscv";
> > +            opensbi-domain = <&udomain>;
> > +            ...
> > +        };
> > +
> > +        cpu2: cpu at 2 {
> > +            device_type = "cpu";
> > +            reg = <0x02>;
> > +            compatible = "riscv";
> > +            opensbi-domain = <&udomain>;
> > +            ...
> > +        };
> > +
> > +        cpu3: cpu at 3 {
> > +            device_type = "cpu";
> > +            reg = <0x03>;
> > +            compatible = "riscv";
> > +            opensbi-domain = <&udomain>;
> > +            ...
> > +        };
> > +
> > +        cpu4: cpu at 4 {
> > +            device_type = "cpu";
> > +            reg = <0x04>;
> > +            compatible = "riscv";
> > +            opensbi-domain = <&udomain>;
> > +            ...
> > +        };
> > +    };
> > +
> > +    uart1: serial at 10011000 {
> > +        ...
> > +    };
> > +```
> > --
> > 2.25.1
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi
>
> Other than these nits, looks good to me.
>
> Reviewed-by: Atish Patra <atish.patra@wdc.com>
>
> --
> Regards,
> Atish



-- 
Regards,
Atish

