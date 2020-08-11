From: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
Date: Tue, 11 Aug 2020 17:52:37 +0800
Subject: The senario when SCOUNTEREN[TM] == 0 && MCOUNTEREN[TM]==1 ?
Message-ID: <20200811095237.GA4330@APC301.andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all,                                                                                                                                                           
I'm having some questions about the timing spec for RISC-V and OpenSBI.

If I understand the spec correctly, we allow implementation to use a real timer CSR or
triggers an illegal instruction exception and request OpenSBI to do the routine e.g. read a memory-mapped register.

The problem is :
As the Privileged ISA Spec stated, once the SCOUNTEREN[TM] is set to 0,
then U-mode is not allowed to access timer;
and thus the OpenSBI will refuse to provide timer info - -
https://github.com/riscv/opensbi/blob/master/lib/sbi/sbi_emulate_csr.c#L32

This was not a problem before, yet recently Linux Kernel 5.8 changed its RISC-V vdso implementation to issue rdtime in the user space directly.

On some platform, this causes a backward-compat issue - -
the hardware implementation without a real timer CSR internally expects that only S-mode could issue rdtime and hard-wires SCOUNTEREN[TM] to be 0 so the CPU will issue an illegal instruction exception and let OpenSBI do the job.

So when OpenSBI checks SCOUNTEREN[TM], there will be no one to provide timer info and the init on rootfs will crash.

Furthermore, this raises a question to me - - when will SCOUNTEREN[TM] be set to 0 while MCOUNTEREN[TM] set to 1 ?

My gut-feeling is that the hypervisor might want this feature, so the guest U-mode program won't be able to access time CSR directly and the OpenSBI will return -1 so the S-mode program (e.g. Xvisor/KVM/Xen) could do the corresponding emulation, such as faking a timer.

Yet I haven't seen any related code there.
Is there a reason that we're checking SCOUNTEREN[TM] while the previous privileged mode is U-mode ?

Besides, I'm wondering whether we should read [M|S]COUNTEREN in the first place.
Since it's an enablement bit and it's designed as WARL, should it be just written by software and enables some hardware features, instead of being a "global status holder" for software to bridging different privileged modes ?

Sincerely,
Ruinland

