From: Anup Patel <Anup.Patel@wdc.com>
Date: Tue, 11 Aug 2020 12:09:32 +0000
Subject: The senario when SCOUNTEREN[TM] == 0 && MCOUNTEREN[TM]==1 ?
In-Reply-To: <20200811095237.GA4330@APC301.andestech.com>
References: <20200811095237.GA4330@APC301.andestech.com>
Message-ID: <MN2PR04MB6207F44B363761051DDF25EE8D450@MN2PR04MB6207.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: opensbi <opensbi-bounces@lists.infradead.org> On Behalf Of
> Ruinland ChuanTzu Tsai
> Sent: 11 August 2020 15:23
> To: opensbi at lists.infradead.org
> Subject: The senario when SCOUNTEREN[TM] == 0 &&
> MCOUNTEREN[TM]==1 ?
> 
> Hi all,
> I'm having some questions about the timing spec for RISC-V and OpenSBI.
> 
> If I understand the spec correctly, we allow implementation to use a real
> timer CSR or triggers an illegal instruction exception and request OpenSBI to
> do the routine e.g. read a memory-mapped register.

Trap-n-emulate of TIME CSR in OpenSBI is only required for platforms that
do not implement TIME CSR in HW. This is because RISC-V does not mandate
TIME CSR to be provided by all RISC-V platforms.

For platforms having TIME CSR implemented in HW, no illegal instruction
trap is generated hence no trap-n-emulate by OpenSBI on such platforms.
Example, QEMU virt machine.
 
> 
> The problem is :
> As the Privileged ISA Spec stated, once the SCOUNTEREN[TM] is set to 0,
> then U-mode is not allowed to access timer; and thus the OpenSBI will refuse
> to provide timer info - -
> https://github.com/riscv/opensbi/blob/master/lib/sbi/sbi_emulate_csr.c#L3
> 2
> 
> This was not a problem before, yet recently Linux Kernel 5.8 changed its
> RISC-V vdso implementation to issue rdtime in the user space directly.
> 
> On some platform, this causes a backward-compat issue - - the hardware
> implementation without a real timer CSR internally expects that only S-mode
> could issue rdtime and hard-wires SCOUNTEREN[TM] to be 0 so the CPU will
> issue an illegal instruction exception and let OpenSBI do the job.
> 
> So when OpenSBI checks SCOUNTEREN[TM], there will be no one to provide
> timer info and the init on rootfs will crash.
> 
> Furthermore, this raises a question to me - - when will SCOUNTEREN[TM] be
> set to 0 while MCOUNTEREN[TM] set to 1 ?
> 
> My gut-feeling is that the hypervisor might want this feature, so the guest U-
> mode program won't be able to access time CSR directly and the OpenSBI will
> return -1 so the S-mode program (e.g. Xvisor/KVM/Xen) could do the
> corresponding emulation, such as faking a timer.
> 
> Yet I haven't seen any related code there.
> Is there a reason that we're checking SCOUNTEREN[TM] while the previous
> privileged mode is U-mode ?

We are checking SCOUNTEREN[TM] in TIME CSR read emulation to
emulate correct behavior SCOUNTEREN CSR but we should this bit
when TIME CSR is not implemented in HW.

This can be fixed in OpenSBI because we detect whether TIME CSR is
present or not for each HART at boot time.

Maybe we can do something like below:

	if (prev_mode == PRV_U) {
		cen = csr_read(CSR_SCOUNTEREN);
		if (csr_num == CSR_TIME &&
		    !sbi_hart_has_feature(sbi_scratch_thishart_ptr(),
					  SBI_HART_HAS_TIME))
			cen |= (1UL << 1);
	}

> 
> Besides, I'm wondering whether we should read [M|S]COUNTEREN in the
> first place.

Checking [M|S]COUNTEREN is right thing to do because a RISC-V platform
may not have HPMCOUNTER CSRs (alias of MHPMCOUNTER CSRs) even if
it has MHPMCOUNTER CSRs.

> Since it's an enablement bit and it's designed as WARL, should it be just
> written by software and enables some hardware features, instead of being a
> "global status holder" for software to bridging different privileged modes ?

The [M|H|S]COUNTEREN CSRs are like switches to enable/disable
lower-privilege-mode access to various HPMCOUNTER CSRs. A hypervisor
can certainly use this to explicitly emulate certain HPMCOUNTER CSRs.

Regards,
Anup

