From: Xiang W <wxjstz@126.com>
Date: Thu, 30 Mar 2023 16:20:30 +0800
Subject: [PATCH v3] docs: Correct FW_JUMP_FDT_ADDR calculation example
In-Reply-To: <261bbbfc531fa4a479e97e70933d5e722e7a8ab6.camel@126.com>
References: <20230324120728.3926464-1-gsomlo@gmail.com>
	 <7ecf54d130e979c0fc1f74f6ce0483eff1a0fa03.camel@126.com>
	 <ZCT+cdxBr0t+JJwe@errol.ini.cmu.edu>
	 <261bbbfc531fa4a479e97e70933d5e722e7a8ab6.camel@126.com>
Message-ID: <3be5bff68835974783ecf7231dc4eac0140d9be1.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2023-03-30???? 16:13 +0800?Xiang W???
> ? 2023-03-29???? 23:13 -0400?Gabriel L. Somlo???
> > On Thu, Mar 30, 2023 at 10:15:59AM +0800, Xiang W wrote:
> > > ? 2023-03-24???? 08:07 -0400?Gabriel Somlo???
> > > > When using `PLATFORM=generic` defaults, the kernel is loaded at
> > > > `FW_JUMP_ADDR`, and the FDT is loaded at `FW_JUMP_FDT_ADDR.
> > > > 
> > > > Therefore, the maximum kernel size before `FW_JUMP_FDT_ADDR` must
> > > > be increased is `$(( FW_JUMP_FDT_ADDR - FW_JUMP_ADDR ))`.
> > > > 
> > > > The example calculation assumes `rv64`, and is wrong to boot
> > > > (off by 0x200000). Fix it and update it for the general case.
> > > > 
> > > > Signed-off-by: Gabriel Somlo <gsomlo@gmail.com>
> > > > ---
> > > > ?docs/firmware/fw_jump.md | 16 ++++++++--------
> > > > ?1 file changed, 8 insertions(+), 8 deletions(-)
> > > > 
> > > > diff --git a/docs/firmware/fw_jump.md b/docs/firmware/fw_jump.md
> > > > index 956897e..ed3a43e 100644
> > > > --- a/docs/firmware/fw_jump.md
> > > > +++ b/docs/firmware/fw_jump.md
> > > > @@ -46,15 +46,15 @@ follows:
> > > > ?? You can use the following method.
> > > > ?
> > > > ?? ```
> > > > -? ${CROSS_COMPILE}objdump -h $KERNEL_ELF | sort -k 5,5 | awk -n '/^ +[0-9]+ /\
> > > > -? {addr="0x"$3; size="0x"$5; printf "0x""%x\n",addr+size}' \
> > > > -? | (( `tail -1` > 0x2200000 )) && echo fdt overlaps kernel,\
> > > > -? increase FW_JUMP_FDT_ADDR
> > > > +? ${CROSS_COMPILE}objdump -h $KERNEL_ELF | sort -k 5,5 | awk -n '
> > > > +? /^ +[0-9]+ / {addr="0x"$3; size="0x"$5; printf "0x""%x\n",addr+size}' |
> > > > +? (( `tail -1` > (FW_JUMP_FDT_ADDR - FW_JUMP_ADDR) )) &&
> > > FW_JUMP_FDT_ADDR and FW_JUMP_ADDR should be variables in the shell,
> > > and references need to use $ as the starting char.
> > 
> > AFAIK, "ARITHMETIC EVALUATION" rules in bash allow shell variables to
> > be referenced without the "parameter expansion syntax" (i.e., $FOO),
> > when they are within an expression (e.g., "(( FOO + BAR ))").
> 
> It is better to use POSIX shell, if want to use BASH it is better to
> add some text description
Sorry!!! This is POSIX grammar!!!

Regards,
Xiang W
> > 
> > Regards,
> > Xiang W
> > Thanks,
> > --Gabriel
> > ?
> > > > +? echo fdt overlaps kernel, increase FW_JUMP_FDT_ADDR
> > > > ?
> > > > -? ${LLVM}objdump -h --show-lma $KERNEL_ELF | sort -k 5,5 | \
> > > > -? awk -n '/^ +[0-9]+ / {addr="0x"$3; size="0x"$5; printf "0x""%x\n",addr+size}'\
> > > > -? | (( `tail -1` > 0x2200000 )) && echo fdt overlaps kernel,\
> > > > -? increase FW_JUMP_FDT_ADDR
> > > > +? ${LLVM}objdump -h --show-lma $KERNEL_ELF | sort -k 5,5 | awk -n '
> > > > +? /^ +[0-9]+ / {addr="0x"$3; size="0x"$5; printf "0x""%x\n",addr+size}' |
> > > > +? (( `tail -1` > (FW_JUMP_FDT_ADDR - FW_JUMP_ADDR) )) &&
> > > Same as above
> > > 
> > > Regards,
> > > Xiang W
> > > > +? echo fdt overlaps kernel, increase FW_JUMP_FDT_ADDR
> > > > ?? ```
> > > > ?
> > > > ?*FW_JUMP* Example
> > > > -- 
> > > > 2.39.2
> > > > 
> > > > 
> > > 


