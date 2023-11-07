From: Xiang W <wxjstz@126.com>
Date: Tue, 07 Nov 2023 23:41:01 +0800
Subject: issue about lr/sc and __riscv_atomic
In-Reply-To: <CAK9=C2VJGfT_R5LrE_ZkdfJeh_0AKFUYTbbE=EmdRpe8p3jAZA@mail.gmail.com>
References: <f93027a6dd48ed1a0432750c4dd4b24ebeaa1117.camel@126.com>
	 <CAK9=C2VJGfT_R5LrE_ZkdfJeh_0AKFUYTbbE=EmdRpe8p3jAZA@mail.gmail.com>
Message-ID: <b9467b1d1907891c5d1b3b2c565207f3330415c7.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2023-11-07???? 20:40 +0530?Anup Patel???
> On Tue, Nov 7, 2023 at 8:03?PM Xiang W <wxjstz@126.com> wrote:
> > 
> > There are some conditional compilation related to __riscv_atomic in
> > lib/sbi/riscv_atomic.c. Atomic operations are implemented through lr/sc when
> > the __riscv_atomic macro is not defined. But lr/sc is also part of the A
> > extension. If the A extension is not supported, lr/sc should not be used.
> > 
> > We should remove these conditional compilations, opensbi is strongly dependent
> > on the A extension.
> > 
> > The following is the compilation log when I turned off the A extension.
> > 
> > make CROSS_COMPILE=riscv64-unknown-elf- PLATFORM_RISCV_ISA=rv64imfdc_zicsr_zifencei
> > ?CC??????? lib/sbi/riscv_asm.o
> > ?CC??????? lib/sbi/riscv_atomic.o
> > /home/merle/workspaces/opensbi/lib/sbi/riscv_atomic.c: Assembler messages:
> > /home/merle/workspaces/opensbi/lib/sbi/riscv_atomic.c:37: Error: unrecognized opcode `amoadd.d.aqrl a5,a1,0(a0)', extension `a' required
> > /home/merle/workspaces/opensbi/lib/sbi/riscv_atomic.c:37: Error: unrecognized opcode `amoadd.d.aqrl a5,a5,0(a0)', extension `a' required
> > /home/merle/workspaces/opensbi/lib/sbi/riscv_atomic.c:173: Error: unrecognized opcode `lr.d a3,0(a0)', extension `a' required
> > /home/merle/workspaces/opensbi/lib/sbi/riscv_atomic.c:175: Error: unrecognized opcode `sc.d.rl a2,a4,0(a0)', extension `a' required
> > /home/merle/workspaces/opensbi/lib/sbi/riscv_atomic.c:183: Error: unrecognized opcode `lr.d a4,0(a0)', extension `a' required
> > /home/merle/workspaces/opensbi/lib/sbi/riscv_atomic.c:184: Error: unrecognized opcode `sc.d.rl a3,a5,0(a0)', extension `a' required
> > /home/merle/workspaces/opensbi/lib/sbi/riscv_atomic.c:194: Error: unrecognized opcode `lr.w a4,0(a0)', extension `a' required
> > /home/merle/workspaces/opensbi/lib/sbi/riscv_atomic.c:195: Error: unrecognized opcode `sc.w.rl a3,a5,0(a0)', extension `a' required
> > /home/merle/workspaces/opensbi/lib/sbi/riscv_atomic.c:205: Error: unrecognized opcode `lr.d a4,0(a0)', extension `a' required
> > /home/merle/workspaces/opensbi/lib/sbi/riscv_atomic.c:206: Error: unrecognized opcode `sc.d.rl a3,a5,0(a0)', extension `a' required
> > /home/merle/workspaces/opensbi/lib/sbi/riscv_atomic.c:237: Error: unrecognized opcode `amoor.d.aqrl a0,a0,0(a1)', extension `a' required
> > /home/merle/workspaces/opensbi/lib/sbi/riscv_atomic.c:242: Error: unrecognized opcode `amoand.d.aqrl a0,a0,0(a1)', extension `a' required
> > /home/merle/workspaces/opensbi/lib/sbi/riscv_atomic.c:237: Error: unrecognized opcode `amoor.d.aqrl a0,a0,0(a1)', extension `a' required
> > /home/merle/workspaces/opensbi/lib/sbi/riscv_atomic.c:242: Error: unrecognized opcode `amoand.d.aqrl a0,a0,0(a1)', extension `a' required
> > make: *** [Makefile:504: /home/merle/workspaces/opensbi/build/lib/sbi/riscv_atomic.o] Error 1
> 
> We did not add "#if" checks because IMA is a minimal requirement for OpenSBI.
I mean remove these
https://github.com/riscv-software-src/opensbi/blob/master/lib/sbi/riscv_atomic.c#L170
https://github.com/riscv-software-src/opensbi/blob/master/lib/sbi/riscv_atomic.c#L180
https://github.com/riscv-software-src/opensbi/blob/master/lib/sbi/riscv_atomic.c#L191
https://github.com/riscv-software-src/opensbi/blob/master/lib/sbi/riscv_atomic.c#L202

Regards,
Xiang W

> 
> Refer, https://github.com/riscv-software-src/opensbi/blob/master/docs/platform_requirements.md
> 
> Regards,
> Anup


