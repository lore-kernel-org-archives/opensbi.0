From: Nylon Chen <nylon.chen@sifive.com>
Date: Mon, 29 Aug 2022 14:13:34 +0800
Subject: [RFC PATCH 0/0] Move the address of FW_JUMP_FDT_ADDR forward
In-Reply-To: <20220811124919.jdlwdp5rigpbomm3@kamzik>
References: <20220811085811.3577-1-nylon.chen@sifive.com> <20220811124919.jdlwdp5rigpbomm3@kamzik>
Message-ID: <CAHh=Yk8OJsUbMp3viWH7W62XyWo3QADbw_Sj-ecAe9-So6CKAQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Andrew,Xiang

Thanks for your comment.

maybe we can add some information in docs/firmware/fw_jump.md to help
the developer avoid this issue?

e.g.

If your PLATFORM=generic and your FW_JUMP_FDT_ADDR is default, you
must check your Linux size because Linux will be overwritten in
OpneSBI's FDT copy loop.

You can use the following method.

```
LAST_SECTION=`${CROSS_COMPILE}objdump -h vmlinux | grep "00*" | awk
'{print $5,$3}'| sort -rfu | head -n 1 | awk '{split($0,addr,"
");print addr[1]}'` && \
LAST_SECTION_SIZE=`${CROSS_COMPILE}objdump -h vmlinux | grep "00*" |
awk '{print $5,$3}'| sort -rfu | head -n 1 | awk '{split($0,addr,"
")}'` && \
OFFSET_ADDR=$(( 16#$LAST_SECTION_SIZE + 16#$LAST_SECTION)) && \
printf "The LMA of the last section of the Kernel is 0x%X\n" ${OFFSET_ADDR}
```

If the result is bigger than the default of
FW_JUMP_FDT_ADDR(0x2200000), you must change it to avoid the problem
of being overwritten.

Andrew Jones <ajones@ventanamicro.com> ? 2022?8?11? ?? ??8:49???
>
> On Thu, Aug 11, 2022 at 04:58:11PM +0800, Nylon Chen wrote:
> > From: "Nylon.Chen" <nylon.chen@sifive.com>
> >
> > A while ago.
> > when we boot from QEMU by OpenSBI Jump mode with initramfs kerenl.
> >
> > The kernel encountered panic because the kernel's section was
> > overwritten, and the address was FW_JUMP_FDT_ADDR.
> >
> > we find out the the rule `$(FW_TEXT_START) + 0x2200000` in
> > platform/generic/config.mk
> >
> > The situation is our kernel size big than it.
>
> This implies opensbi is being used as a FW_PAYLOAD firmware.
>
> >
> > e.g.
> > # readelf -h vmlinux
> > init.bss's LMA is "0x00000000024a96a0", and when we use this rule, it
> > exceeds its size.
> >
> > 0x24a96a0 > 0x2200000
> >
> > After our experiment, we can add offset FW_JUMP_FDT_ADDR, and the
> > problem is solved.
>
> Since this is a FW_PAYLOAD firmware you should be adjusting
> FW_PAYLOAD_FDT_ADDR. Adjusting FW_JUMP_FDT_ADDR only works because
> by default FW_PAYLOAD_FDT_ADDR = FW_JUMP_FDT_ADDR (for the generic
> platform).
>
> >
> > But in my opinion, this is not a good method because the next time the
> > kernel size increases, the same situation occurs again.
>
> I haven't tried it, but I think it should be possible to embed the FDT
> into the kernel (CONFIG_BUILTIN_DTB) and then ensure FW_PAYLOAD_FDT_ADDR
> is *not* defined. Doing that will hopefully keep opensbi from overwriting
> the payload and linux will still find the DTB without looking at a1 for
> it. Taking that approach (if it works) would avoid having to adjust
> FW_PAYLOAD_FDT_ADDR for different payload sizes.
>
> >
> > So maybe we can move the address forward and normalize the address to
> > FW_JUMP_FDT_ADDR?
>
> These types of defaults are impossible to get right for everybody. IMHO,
> what's there today should stay as is and we should work at making it as
> easy as possible to adjust at build- and/or run- time when necessary.
>
> Thanks,
> drew

