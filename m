From: Guo Ren <guoren@kernel.org>
Date: Sun, 18 Apr 2021 10:19:11 +0800
Subject: [PATCH 1/2] lib: utils: Implement "64bit-mmio" property parsing
In-Reply-To: <4B38E6F7-BD21-4DE5-B34F-590532741346@jrtc27.com>
References: <1618285442-84580-1-git-send-email-guoren@kernel.org>
 <B636699C-B856-43E6-9FEC-44A62284E0B6@jrtc27.com>
 <CED1C4CB-F804-4548-8052-FD1251B7256F@jrtc27.com>
 <CAJF2gTSYMHBeYqpEf=YGLxp57rMhApHVsW63aDq6ymVDutk2xg@mail.gmail.com>
 <4B38E6F7-BD21-4DE5-B34F-590532741346@jrtc27.com>
Message-ID: <CAJF2gTQMHwZvPrGvhkPa=9f6SSuV+JUGy_AMLch5gj8eJDkiZw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Apr 17, 2021 at 11:10 PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> On 17 Apr 2021, at 15:24, Guo Ren <guoren@kernel.org> wrote:
> >
> > On Sat, Apr 17, 2021 at 7:45 PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
> >>
> >> On 17 Apr 2021, at 12:41, Jessica Clarke <jrtc27@jrtc27.com> wrote:
> >>>
> >>> On 13 Apr 2021, at 04:44, guoren at kernel.org wrote:
> >>>>
> >>>> From: Guo Ren <guoren@linux.alibaba.com>
> >>>>
> >>>> Figure out CLINT has_64bit_mmio from DT node and using antonym for
> >>>> compatibility.
> >>>>
> >>>> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> >>>> Cc: Anup Patel <anup.patel@wdc.com>
> >>>> Cc: Xiang W <wxjstz@126.com>
> >>>> ---
> >>>> lib/utils/fdt/fdt_helper.c | 3 ++-
> >>>> 1 file changed, 2 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> >>>> index bf19ff9..909de01 100644
> >>>> --- a/lib/utils/fdt/fdt_helper.c
> >>>> +++ b/lib/utils/fdt/fdt_helper.c
> >>>> @@ -442,8 +442,9 @@ int fdt_parse_clint_node(void *fdt, int nodeoffset, bool for_timer,
> >>>>     if (clint->hart_count < count)
> >>>>             clint->hart_count = count;
> >>>>
> >>>> -    /* TODO: We should figure-out CLINT has_64bit_mmio from DT node */
> >>>>     clint->has_64bit_mmio = TRUE;
> >>>> +    if (fdt_getprop(fdt, nodeoffset, "clint,has-no-64bit-mmio", &count))
> >>>
> >>> I do not see this specified in clint.yaml.
> >>
> >> Also, the RISC-V privileged is very clear:
> >>
> >>> For RV64, naturally aligned 64-bit memory accesses to the mtime and mtimecmp
> >>> registers are atomic.
> >>
> >> So I would say your CLINT violates the spec and thus should not claim to be a
> >> RISC-V or SiFive-compatible CLINT.
> >>
> >> Jess
> >>
> >
> > Normal Linux use csr_read(CSR_TIME), and C9xx wouldn't support
> > M-mode&MMU-less Linux. So the only sbi_set_timer would be affected.
> >
> > Because mmio-32bit is perfect with RV32, it wouldn't cause problems in
> > the RV64 linux mmu s-mode system.
>
> That doesn?t change the fact that it violates the spec for RV64.
>
> Jess
>

"For RV64, naturally aligned 64-bit memory accesses to the mtime and
mtimecmp registers are atomic."
The sentence didn't enforce RV64 must use 64-bit memory accesses to
mtime* regs. It says if you are using RV64 64-bit memory accesses,
then it would be atomic and you needn't do it like in RV32.

"Platforms provide a real-time counter, exposed as a memory-mapped
machine-mode read-write register, time.".
That means the soc vendor determines the data width of the IO
interconnects. You know a lot of them just have a 32-bit APB on hand
and easily reuse it.

Conclude my views here:
 - RV64 using 32-bit memory accesses to mtime* doesn't violate spec.
 - Using 32-bit/64-bit IO access depends on platform integration, not
CPU vendor. (Of cause, we could recommend them using 64-bit IO access)
 - Because 64-bit IO access always contains 32-bit IO access
capability, that why our sample using 32-bit IO access as default.

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

