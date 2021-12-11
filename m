From: Anup Patel <anup@brainfault.org>
Date: Sat, 11 Dec 2021 16:33:09 +0530
Subject: [PATCH 1/1] docs/platform: spike: Enhance Spike examples
In-Reply-To: <CAAhSdy0LMfBtT=h6MapsWkcxG77VEZX81bse9HT1pbVgBDN77w@mail.gmail.com>
References: <cover.1638493883.git.research_trasio@irq.a4lg.com>
 <92283da5b32c3fbec8f23df7bdb6f7c80ba435d6.1638493883.git.research_trasio@irq.a4lg.com>
 <CAAhSdy0LMfBtT=h6MapsWkcxG77VEZX81bse9HT1pbVgBDN77w@mail.gmail.com>
Message-ID: <CAAhSdy242NiXC3Vw88cnGd0vXPP=2VxMiv4GxBAymULEn1cJ3Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 3, 2021 at 9:58 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Fri, Dec 3, 2021 at 6:44 AM Tsukasa OI <research_trasio@irq.a4lg.com> wrote:
> >
> > This commit makes Spike usable as QEMU (in fact, those are based on
> > QEMU examples).
> >
> > Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
>
> Looks good to me.
>
> Reviewed-by: Anup Patel <anup.patel@wdc.com>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

>
> Regards,
> Anup
>
> > ---
> >  docs/platform/spike.md | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/docs/platform/spike.md b/docs/platform/spike.md
> > index 79e2eb2..bde9e13 100644
> > --- a/docs/platform/spike.md
> > +++ b/docs/platform/spike.md
> > @@ -43,7 +43,18 @@ make PLATFORM=generic FW_PAYLOAD_PATH=<linux_build_directory>/arch/riscv/boot/Im
> >
> >  Run:
> >  ```
> > -spike --initrd <path_to_cpio_ramdisk> build/platform/generic/firmware/fw_payload.elf
> > +spike -m256 \
> > +       --initrd <path_to_cpio_ramdisk> \
> > +       --bootargs 'root=/dev/ram rw console=hvc0 earlycon=sbi' \
> > +       build/platform/generic/firmware/fw_payload.elf
> > +```
> > +or
> > +```
> > +spike -m256 \
> > +       --kernel <linux_build_directory>/arch/riscv/boot/Image \
> > +       --initrd <path_to_cpio_ramdisk> \
> > +       --bootargs 'root=/dev/ram rw console=hvc0 earlycon=sbi' \
> > +       build/platform/generic/firmware/fw_jump.elf
> >  ```
> >
> >  Execution on QEMU RISC-V 64-bit
> > --
> > 2.32.0
> >

