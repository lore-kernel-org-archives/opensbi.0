From: Gabriel L. Somlo <gsomlo@gmail.com>
Date: Thu, 30 Mar 2023 16:24:28 -0400
Subject: [PATCH v3] docs: Correct FW_JUMP_FDT_ADDR calculation example
In-Reply-To: <o5wzf3o3xqlpyjfwurk4bvf2e2dcxutke3z7equoxamvfenhca@67zhwblqwv3k>
References: <20230324120728.3926464-1-gsomlo@gmail.com>
 <7ecf54d130e979c0fc1f74f6ce0483eff1a0fa03.camel@126.com>
 <ZCT+cdxBr0t+JJwe@errol.ini.cmu.edu>
 <261bbbfc531fa4a479e97e70933d5e722e7a8ab6.camel@126.com>
 <3be5bff68835974783ecf7231dc4eac0140d9be1.camel@126.com>
 <nvtmivbx6ew3wql6jroofvsaxuxut7ampinf3r5krx6ks5zbbp@vy3nsieqhfko>
 <o5wzf3o3xqlpyjfwurk4bvf2e2dcxutke3z7equoxamvfenhca@67zhwblqwv3k>
Message-ID: <ZCXv/FAt0vRs4i7M@errol.ini.cmu.edu>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Mar 30, 2023 at 11:13:48AM +0200, Andrew Jones wrote:
> On Thu, Mar 30, 2023 at 10:46:57AM +0200, Andrew Jones wrote:
> > T+cdxBr0t+JJwe at errol.ini.cmu.edu>
> >  <261bbbfc531fa4a479e97e70933d5e722e7a8ab6.camel@126.com>
> >  <3be5bff68835974783ecf7231dc4eac0140d9be1.camel@126.com>
> > MIME-Version: 1.0
> > Content-Type: text/plain; charset=utf-8
> > Content-Disposition: inline
> > Content-Transfer-Encoding: 8bit
> > In-Reply-To: <3be5bff68835974783ecf7231dc4eac0140d9be1.camel@126.com>
> > 
> > On Thu, Mar 30, 2023 at 04:20:30PM +0800, Xiang W wrote:
> > > ? 2023-03-30???? 16:13 +0800?Xiang W???
> > > > ? 2023-03-29???? 23:13 -0400?Gabriel L. Somlo???
> > > > > On Thu, Mar 30, 2023 at 10:15:59AM +0800, Xiang W wrote:
> > > > > > ? 2023-03-24???? 08:07 -0400?Gabriel Somlo???
> > > > > > > When using `PLATFORM=generic` defaults, the kernel is loaded at
> > > > > > > `FW_JUMP_ADDR`, and the FDT is loaded at `FW_JUMP_FDT_ADDR.
> > > > > > > 
> > > > > > > Therefore, the maximum kernel size before `FW_JUMP_FDT_ADDR` must
> > > > > > > be increased is `$(( FW_JUMP_FDT_ADDR - FW_JUMP_ADDR ))`.
> > > > > > > 
> > > > > > > The example calculation assumes `rv64`, and is wrong to boot
> > > > > > > (off by 0x200000). Fix it and update it for the general case.
> > > > > > > 
> > > > > > > Signed-off-by: Gabriel Somlo <gsomlo@gmail.com>
> > > > > > > ---
> > > > > > > ?docs/firmware/fw_jump.md | 16 ++++++++--------
> > > > > > > ?1 file changed, 8 insertions(+), 8 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/docs/firmware/fw_jump.md b/docs/firmware/fw_jump.md
> > > > > > > index 956897e..ed3a43e 100644
> > > > > > > --- a/docs/firmware/fw_jump.md
> > > > > > > +++ b/docs/firmware/fw_jump.md
> > > > > > > @@ -46,15 +46,15 @@ follows:
> > > > > > > ?? You can use the following method.
> > > > > > > ?
> > > > > > > ?? ```
> > > > > > > -? ${CROSS_COMPILE}objdump -h $KERNEL_ELF | sort -k 5,5 | awk -n '/^ +[0-9]+ /\
> > > > > > > -? {addr="0x"$3; size="0x"$5; printf "0x""%x\n",addr+size}' \
> > > > > > > -? | (( `tail -1` > 0x2200000 )) && echo fdt overlaps kernel,\
> > > > > > > -? increase FW_JUMP_FDT_ADDR
> > > > > > > +? ${CROSS_COMPILE}objdump -h $KERNEL_ELF | sort -k 5,5 | awk -n '
> > > > > > > +? /^ +[0-9]+ / {addr="0x"$3; size="0x"$5; printf "0x""%x\n",addr+size}' |
> > > > > > > +? (( `tail -1` > (FW_JUMP_FDT_ADDR - FW_JUMP_ADDR) )) &&
> > > > > > FW_JUMP_FDT_ADDR and FW_JUMP_ADDR should be variables in the shell,
> > > > > > and references need to use $ as the starting char.
> > > > > 
> > > > > AFAIK, "ARITHMETIC EVALUATION" rules in bash allow shell variables to
> > > > > be referenced without the "parameter expansion syntax" (i.e., $FOO),
> > > > > when they are within an expression (e.g., "(( FOO + BAR ))").
> > > > 
> > > > It is better to use POSIX shell, if want to use BASH it is better to
> > > > add some text description
> > > Sorry!!! This is POSIX grammar!!!
> > 
> > ((..)) is undefined for POSIX, only $((..)) is defined, but do we care?
> > This is just an example in a document, not a script expected to run as
> > part of the build on multiple platforms. Maybe we could change the
> > sentence above to point out Bash though,
> > 
> >    ensure *FW_JUMP_FDT_ADDR* is set high enough to avoid overwriting the kernel.
> > -  You can use the following method.
> > +  Using Bash, you can use the following method:
> > 
> >    ```
> 
> Or, we can make more use of [posix] awk and make everything posix
> compatible
> 
> ${CROSS_COMPILE}objdump -h $KERNEL_ELF | sort -k 5,5 |
> awk -P -v maxsize=$((FW_JUMP_FDT_ADDR - FW_JUMP_ADDR)) '
> /^ +[0-9]+ / {
>   addr="0x"$3; size="0x"$5; size+=addr;
> }
> END {
>   if (size > maxsize) {
>     print "fdt overlaps kernel, increase FW_JUMP_FDT_ADDR";
>   }
> }'

If it's all the same to you all, I'd prefer we mentioned bash
(or zsh, which also works) and avoided using the (IMHO much
harder to read) syntax above just to satisfy posix...

I'll send out another version where bash and zsh are namedropped in
the "following method" line... :)

Thanks,
--Gabriel
 
> Thanks,
> drew

