From: Guo Ren <guoren@kernel.org>
Date: Thu, 15 Jun 2023 23:32:05 +0800
Subject: [RFC PATCH 2/2] lib: reset: thead: Correct the naming convention
 of dts
In-Reply-To: <858958E3-78A5-460F-BE5D-EFF9D8628C1B@jrtc27.com>
References: <20230523094649.4100554-1-guoren@kernel.org> <20230523094649.4100554-3-guoren@kernel.org>
 <20230523-manatee-providing-77413fac0c58@spud> <CAJF2gTSR1LzGyzxLWWst+4M_nKWXBA=v8=zY-42-ODGU_aO-Lg@mail.gmail.com>
 <20230524-vertebrae-slip-84584f5bb65b@wendy> <CAJF2gTQPyyi5twqdboo=4t0KgP0RqgOpqd0PX239PQZKC-Z8Uw@mail.gmail.com>
 <20230524-claw-obligate-e4815c3e232b@spud> <0115F3EA-6071-4876-A50B-CCCB6496FBB6@jrtc27.com>
 <20230524-climate-citrus-4959e052bf56@spud> <CAJF2gTRgE2ceqZ7Ddi6NwT++qFGEzK-YZ4gg9mYPwTSUKiTwRw@mail.gmail.com>
 <B31C373E-7DDF-43A5-B855-DB664C940C7B@kernel.org> <CAJF2gTT-PkUUceDR8d3GXq4v40daJuNQ6rFHzLTAkLA_=ie=cA@mail.gmail.com>
 <CAJF2gTQNXncSUcDh0SfbRwb2GrKn7DeoQ_pgOfERXbLZ9yS_jg@mail.gmail.com>
 <2B91C2C6-750D-43B5-9E03-B53F07045056@jrtc27.com> <CAJF2gTToZv2bNrpKn2oJx_v_hkYLWsQokC9VniMnd_v2mKuaVg@mail.gmail.com>
 <F519491B-325E-4B8D-961C-FC8965895BA3@jrtc27.com> <CAJF2gTRFbh5vV0ktD43z_Nhj04e=FKWtdnO+9jyYyjwQO4tbiw@mail.gmail.com>
 <858958E3-78A5-460F-BE5D-EFF9D8628C1B@jrtc27.com>
Message-ID: <CAJF2gTSDGmawDjswmQjT3na=AyUAHy2dEamrUC5AHUH0r+bfcg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 14, 2023 at 9:25?AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> On 14 Jun 2023, at 02:07, Guo Ren <guoren@kernel.org> wrote:
> >
> > On Tue, Jun 13, 2023 at 10:43?AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
> >>
> >> On 13 Jun 2023, at 03:21, Guo Ren <guoren@kernel.org> wrote:
> >>>
> >>> On Mon, Jun 12, 2023 at 9:05?AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
> >>>>
> >>>> On 12 Jun 2023, at 01:57, Guo Ren <guoren@kernel.org> wrote:
> >>>>>
> >>>>> Hi Conor,
> >>>>>
> >>>>> Jisheng Zhang would update the Linux yaml patch, here is the final dts
> >>>>> format of the reset controller:
> >>>>>
> >>>>>             reset-controller at ffff019050 {
> >>>>>                     compatible = "thead,cpu-reset";
> >>>>>                     reg = <0xff 0xff019050 0x0 0x4>, <0xff
> >>>>> 0xff015004 0x0 0x0>;
> >>>>>                     reset-ctrl = <0x1c>;
> >>>>>                     clone-csrs = <0x7f3 0x7c0 0x7c1 0x7c2 0x7c3
> >>>>
> >>>> This is pretty horrible, there?s no indirect CSR read/write
> >>>> instruction, so what are you expecting drivers to do with this? Have a
> >>> We've done it in the opensbi:
> >>> https://github.com/riscv-software-src/opensbi/blob/master/lib/utils/reset/fdt_reset_thead.c
> >>>
> >>> A lot of SoC customers would intergrate their own CSRs though our rtl
> >>> code interface, these CSRs are initilized in their primary hart in
> >>> early boot stage / jtag gdbinit script, the secondary harts just copy
> >>> the CSRs' values from boot hart. That means we could provide a unified
> >>> way to all customer.
> >>>
> >>>> big switch statement for every possible CSR?
> >>> We needn't big switch statement, boot hart store the csrs setting
> >>> codes in the memory, and secondary harts excute them to set the csrs.
> >>> Here is the code snippet:
> >>>
> >>> struct custom_csr custom_csr[MAX_CUSTOM_CSR];
> >>>
> >>> #define CSR_OPCODE 0x39073
> >>> static void clone_csrs(int cnt)
> >>> {
> >>> unsigned long i;
> >>>
> >>> for (i = 0; i < cnt; i++) {
> >>> /* Write csr BIT[31 - 20] to stub */
> >>> __reset_thead_csr_stub[3*i + 1] = CSR_OPCODE | (custom_csr[i].index << 20);
> >>>
> >>> /* Mask csr BIT[31 - 20] */
> >>> *(u32 *)&__fdt_reset_thead_csrr &= BIT(20) - 1;
> >>> smp_mb();
> >>>
> >>> /* Write csr BIT[31 - 20] to __fdt_reset_thead_csrr */
> >>> *(u32 *)&__fdt_reset_thead_csrr |= custom_csr[i].index << 20;
> >>> smp_mb();
> >>>
> >>> RISCV_FENCE_I;
> >>>
> >>> custom_csr[i].value = __fdt_reset_thead_csrr();
> >>> }
> >>
> >> So you want your highly-privileged firmware to be dynamically
> >> generating code, with the ability to have a WX mapping in the
> >> first place?
> > We don't expect WX mapping, but the current fdt_reset_init is after
> > the pmp config. I need to move it into early_init. Thx for pointing it
> > out.
>
> So you didn?t test your code?
We've used it for 2 years, it could satifies us to deliver our CPU
core to the SoC vendors.

Current pmp didn't support WX mapping for m-mode, we force ARWX for
all memory regions for m-mode. See:

Priv-isa-spec
3.7.1.2. Locking and Privilege Mode
When the L bit is clear, any M-mode access matching the PMP entry will
succeed; the R/W/X permissions apply only to S and U modes.

>
> Besides, my point was not about correctness, but about the security
> concerns that come with generating code at run time. If you don?t need
> to do it, don?t.
I agree to prevent generating code at run time, but this advice is not
related to my case.
I found my reset_fdt_init is after pmp_configure, and I plan to move
it before it. Next, when we update to ehanced PMP ISA, the root domain
region1 could be real READ & EXECUTE permission, we can froze the text
region.

>
> Jess
>
> >>> }
> >>> ==========
> >>>
> >>> /* Prepare clone csrs */
> >>> val_w = fdt_getprop(fdt, nodeoff, "csr-copy", &len);
> >>> if (len > 0 && val_w) {
> >>> int cnt;
> >>>
> >>> cnt = len / sizeof(fdt32_t);
> >>> if (cnt > MAX_CUSTOM_CSR)
> >>> sbi_hart_hang();
> >>>
> >>> for (i = 0; i < cnt; i++) {
> >>> custom_csr[i].index = fdt32_to_cpu(val_w[i]);
> >>> }
> >>>
> >>> if (cnt)
> >>> clone_csrs(cnt); // prepare the secondary harts' excution code
> >>> }
> >>>
> >>>
> >>>
> >>>
> >>>
> >>>
> >>>>
> >>>> Jess
> >>>>
> >>>>> 0x7c5 0x7cc 0x7ce>;
> >>>>>              };
> >>>>>
> >>>>> The reset-ctrl is used to control different parts of soc, generally, a
> >>>>> bit indicates a reset signal (a core/a interconnect/a subsystem).
> >>>>>
> >>>>> On Thu, May 25, 2023 at 2:06?PM Guo Ren <guoren@kernel.org> wrote:
> >>>>>>
> >>>>>> On Thu, May 25, 2023 at 1:33?PM Conor Dooley <conor@kernel.org> wrote:
> >>>>>>>
> >>>>>>>
> >>>>>>>
> >>>>>>> On 25 May 2023 04:15:36 IST, Guo Ren <guoren@kernel.org> wrote:
> >>>>>>>
> >>>>>>>> So it could be "thead,cpu-reset", okay?
> >>>>>>>
> >>>>>>> As a generic fallback compatible.
> >>>>>>>
> >>>>>>>> Actually, our core could let SoC vendors define their own custom
> >>>>>>>> CSRs/custom reset values of CSRs, so we don't know what would be added
> >>>>>>>> in the future. Put a array in dts instead of hard-code table is much
> >>>>>>>> more flexiblity.
> >>>>>>>
> >>>>>>> If there's going to be 700 different variations depending on what people do with openc910, then allowing it to be passed sounds like a good idea.
> >>>>>> Yes, that is what we want. th1520 is a example.
> >>>>>>
> >>>>>> Thanks for the review and correction! Your help is greatly appreciated
> >>>>>> in improving th1520 upstream.
> >>>>>>
> >>>>>>>
> >>>>>>> Thanks,
> >>>>>>> Conor.
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> --
> >>>>>> Best Regards
> >>>>>> Guo Ren
> >>>>>
> >>>>>
> >>>>>
> >>>>> --
> >>>>> Best Regards
> >>>>> Guo Ren
> >>>>
> >>>
> >>>
> >>> --
> >>> Best Regards
> >>> Guo Ren
> >>
> >>
> >
> >
> > --
> > Best Regards
> > Guo Ren
>
>


--
Best Regards
 Guo Ren

