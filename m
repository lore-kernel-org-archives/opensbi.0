From: Xiang W <wxjstz@126.com>
Date: Wed, 23 Nov 2022 21:36:01 +0800
Subject: [Issue] OpenSBI domains
In-Reply-To: <AS1PR04MB945575D72C9B1E2DAC0EF5EFFC0C9@AS1PR04MB9455.eurprd04.prod.outlook.com>
References: <AS1PR04MB945575D72C9B1E2DAC0EF5EFFC0C9@AS1PR04MB9455.eurprd04.prod.outlook.com>
Message-ID: <e82005264d1e1d88acbe541e7abdabb7631c69d4.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2022-11-23???? 08:35 +0000?Marouene Boubakri???
> Hi,
> 
> This is not a patch sorry, but due to non-reactiveness? to issues open on Github, maybe this will go faster.
> I'm trying to experiment with OpenSBI domains I'm not sure if this working as expected. (Random errors,? below)
> 
> Could you kindly provide a FULL DTS? showcasing the feature to align with that ? the one used here 
> https://github.com/riscv-software-src/opensbi/blob/master/docs/domain_support.md
> 
> A generic DTS for virt Qemu machine will be much better.
> 
> Error 1:
> sbi_trap_error: hart0: trap handler failed (error -2)
> sbi_trap_error: hart0: mcause=0x0000000000000005 mtval=0x0000000000000004
> sbi_trap_error: hart0: mepc=0x00000000800122a2 mstatus=0x8000000a00007800
> sbi_trap_error: hart0: ra=0x0000000080003cd8 sp=0x000000008003aea0
> sbi_trap_error: hart0: gp=0x0000000000000000 tp=0x000000008003b000
> sbi_trap_error: hart0: s0=0x000000008003af10 s1=0x0000000000000000
> sbi_trap_error: hart0: a0=0x0000000000000000 a1=0xffffffffffffffff
> sbi_trap_error: hart0: a2=0x0000000080019db0 a3=0x000000008003aeb8
> sbi_trap_error: hart0: a4=0x0000000000000000 a5=0x000000008003b000
> sbi_trap_error: hart0: a6=0x0000000000000000 a7=0x0000000000000050
> sbi_trap_error: hart0: s2=0x0000000000000000 s3=0x0000000000000000
> sbi_trap_error: hart0: s4=0x0000000000000000 s5=0x000000008001d000
> sbi_trap_error: hart0: s6=0x0000000000000000 s7=0x0000000000000005
> sbi_trap_error: hart0: s8=0x0000000000002000 s9=0x0000000080029ab0
> sbi_trap_error: hart0: s10=0x0000000000000000 s11=0x0000000000000000
> sbi_trap_error: hart0: t0=0x0000000080007b8c t1=0x0000000000000414
> sbi_trap_error: hart0: t2=0x0000000000001000 t3=0x00000000000000a0
> sbi_trap_error: hart0: t4=0x000000000000003f t5=0x0000000000000004
> sbi_trap_error: hart0: t6=0x0000000000000000
> 
> Error 2:
> 
> sbi_domain_finalize: failed to start boot HART 0 for trusted-domain (error -3)
> init_coldboot: domain finalize failed (error -3)
> 
> Error 3:
> Nothing just happens.
> 
> Thank you
> Maro
> 
You'd better provide some details of your test so that we can reproduce it easily.

Regards,
Xiang W
> 



