From: Conor Dooley <conor@kernel.org>
Date: Fri, 14 Jul 2023 00:04:22 +0100
Subject: Boot failure after QEMU's upgrade to OpenSBI v1.3 (was Re:
 [PATCH for-8.2 6/7] target/riscv: add 'max' CPU type)
In-Reply-To: <20230713-craziness-lankiness-8aec3db24993@spud>
References: <20230712190149.424675-1-dbarboza@ventanamicro.com>
 <20230712190149.424675-7-dbarboza@ventanamicro.com>
 <20230712-stench-happiness-40c2ea831257@spud>
 <3e9b5be8-d3ca-3a17-bef9-4a6a5bdc0ad0@ventanamicro.com>
 <20230712-tulip-replica-0322e71c3e81@spud>
 <744cbde6-7ce5-c327-3c5a-3858e994cc39@ventanamicro.com>
 <20230712-superhero-rabid-578605f52927@spud>
 <5dd3366d-13ba-c7fb-554f-549d97e7d4f9@ventanamicro.com>
 <20230712-fancied-aviator-270f51166407@spud>
 <20230713-craziness-lankiness-8aec3db24993@spud>
Message-ID: <20230714-gliding-clinking-f2fdfc92823d@spud>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jul 13, 2023 at 11:12:33PM +0100, Conor Dooley wrote:
> +CC OpenSBI Mailing list
> 
> I've not yet had the chance to bisect this, so adding the OpenSBI folks
> to CC in case they might have an idea for what to try.

NVM this, I bisected it. Logs below.

> And a question for you below Daniel.
> 
> On Wed, Jul 12, 2023 at 11:14:21PM +0100, Conor Dooley wrote:
> > On Wed, Jul 12, 2023 at 06:39:28PM -0300, Daniel Henrique Barboza wrote:
> > > On 7/12/23 18:35, Conor Dooley wrote:
> > > > On Wed, Jul 12, 2023 at 06:09:10PM -0300, Daniel Henrique Barboza wrote:
> > > > 
> > > > > It is intentional. Those default marchid/mimpid vals were derived from the current
> > > > > QEMU version ID/build and didn't mean much.
> > > > > 
> > > > > It is still possible to set them via "-cpu rv64,marchid=N,mimpid=N" if needed when
> > > > > using the generic (rv64,rv32) CPUs. Vendor CPUs can't have their machine IDs changed
> > > > > via command line.
> > > > 
> > > > Sounds good, thanks. I did just now go and check icicle to see what it
> > > > would report & it does not boot. I'll go bisect...
> > > 
> > > BTW how are you booting the icicle board nowadays? I remember you mentioning about
> > > some changes in the FDT being required to boot and whatnot.
> > 
> > I do direct kernel boots, as the HSS doesn't work anymore, and just lie
> > a bit to QEMU about how much DDR we have.
> > .PHONY: qemu-icicle
> > qemu-icicle:
> > 	$(qemu) -M microchip-icicle-kit \
> > 		-m 3G -smp 5 \
> > 		-kernel $(vmlinux_bin) \
> > 		-dtb $(icicle_dtb) \
> > 		-initrd $(initramfs) \
> > 		-display none -serial null \
> > 		-serial stdio \
> > 		-D qemu.log -d unimp
> > 
> > The platform only supports 2 GiB of DDR, not 3, but if I pass 2 to QEMU
> > it thinks there's 1 GiB at 0x8000_0000 and 1 GiB at 0x10_0000_0000. The
> > upstream devicetree (and current FPGA reference design) expects there to
> > be 1 GiB at 0x8000_0000 and 1 GiB at 0x10_4000_0000. If I lie to QEMU,
> > it thinks there is 1 GiB at 0x8000_0000 and 2 GiB at 0x10_0000_0000, and
> > things just work. I prefer doing it this way than having to modify the
> > DT, it is a lot easier to explain to people this way.
> > 
> > I've been meaning to work the support for the icicle & mpfs in QEMU, but
> > it just gets shunted down the priority list. I'd really like if a proper
> > boot flow would run in QEMU, which means fixing whatever broke the HSS,
> > but I've recently picked up maintainership of dt-binding stuff in Linux,
> > so I've unfortunately got even less time to try and work on it. Maybe
> > we'll get some new graduate in and I can make them suffer in my stead...
> > 
> > > If it's not too hard I'll add it in my test scripts to keep it under check. Perhaps
> > > we can even add it to QEMU testsuite.
> > 
> > I don't think it really should be that bad, at least for the direct
> > kernel boot, which is what I mainly care about, since I use it fairly
> > often for debugging boot stuff in Linux.
> > 
> > Anyways, aa903cf31391dd505b399627158f1292a6d19896 is the first bad commit:
> > commit aa903cf31391dd505b399627158f1292a6d19896
> > Author: Bin Meng <bmeng@tinylab.org>
> > Date:   Fri Jun 30 23:36:04 2023 +0800
> > 
> >     roms/opensbi: Upgrade from v1.2 to v1.3
> >     
> >     Upgrade OpenSBI from v1.2 to v1.3 and the pre-built bios images.
> > 
> > And I see something like:
> > qemu//build/qemu-system-riscv64 -M microchip-icicle-kit \
> >         -m 3G -smp 5 \
> >         -kernel vmlinux.bin \
> >         -dtb icicle.dtb \
> >         -initrd initramfs.cpio.gz \
> >         -display none -serial null \
> >         -serial stdio \
> >         -D qemu.log -d unimp
> 
> > qemu-system-riscv64: warning: disabling zca extension for hart 0x0000000000000000 because privilege spec version does not match
> > qemu-system-riscv64: warning: disabling zca extension for hart 0x0000000000000001 because privilege spec version does not match
> > qemu-system-riscv64: warning: disabling zcd extension for hart 0x0000000000000001 because privilege spec version does not match
> > qemu-system-riscv64: warning: disabling zca extension for hart 0x0000000000000002 because privilege spec version does not match
> > qemu-system-riscv64: warning: disabling zcd extension for hart 0x0000000000000002 because privilege spec version does not match
> > qemu-system-riscv64: warning: disabling zca extension for hart 0x0000000000000003 because privilege spec version does not match
> > qemu-system-riscv64: warning: disabling zcd extension for hart 0x0000000000000003 because privilege spec version does not match
> > qemu-system-riscv64: warning: disabling zca extension for hart 0x0000000000000004 because privilege spec version does not match
> > qemu-system-riscv64: warning: disabling zcd extension for hart 0x0000000000000004 because privilege spec version does not match
> 
> Why am I seeing these warnings? Does the mpfs machine type need to
> disable some things? It only supports rv64imafdc per the DT, and
> predates things like Zca existing, so emitting warnings does not seem
> fair at all to me!

> > OpenSBI v1.3
> >    ____                    _____ ____ _____
> >   / __ \                  / ____|  _ \_   _|
> >  | |  | |_ __   ___ _ __ | (___ | |_) || |
> >  | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
> >  | |__| | |_) |  __/ | | |____) | |_) || |_
> >   \____/| .__/ \___|_| |_|_____/|___/_____|
> >         | |
> >         |_|
> > 
> > init_coldboot: ipi init failed (error -1009)

This can be reproduced using OpenSBI built using `make PLATFORM=generic`
and the QEMU incantation linked above with a -bios argument added to the
incantation.

Thanks,
Conor.

acbd8fce9e5d92f07d344388a3b046f1722ce072 is the first bad commit
commit acbd8fce9e5d92f07d344388a3b046f1722ce072
Author: Anup Patel <apatel@ventanamicro.com>
Date:   Wed Apr 19 21:23:53 2023 +0530

    lib: utils/ipi: Use scratch space to save per-HART MSWI pointer
    
    Instead of using a global array indexed by hartid, we should use
    scratch space to save per-HART MSWI pointer.
    
    Signed-off-by: Anup Patel <apatel@ventanamicro.com>
    Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

 lib/utils/ipi/aclint_mswi.c | 43 +++++++++++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 10 deletions(-)
git bisect start
# status: waiting for both good and bad commits
# bad: [2552799a1df30a3dcd2321a8b75d61d06f5fb9fc] include: Bump-up version to 1.3
git bisect bad 2552799a1df30a3dcd2321a8b75d61d06f5fb9fc
# status: waiting for good commit(s), bad commit known
# good: [6b5188ca14e59ce7bf71afe4e7d3d557c3d31bf8] include: Bump-up version to 1.2
git bisect good 6b5188ca14e59ce7bf71afe4e7d3d557c3d31bf8
# good: [6b5188ca14e59ce7bf71afe4e7d3d557c3d31bf8] include: Bump-up version to 1.2
git bisect good 6b5188ca14e59ce7bf71afe4e7d3d557c3d31bf8
# good: [908be1b85c8ff0695ea226fbbf0ff24a779cdece] gpio/starfive: add gpio driver and support gpio reset
git bisect good 908be1b85c8ff0695ea226fbbf0ff24a779cdece
# good: [6bc02dede86c47f87e65293b7099e9caf3b22c29] lib: sbi: Simplify sbi_ipi_process remove goto
git bisect good 6bc02dede86c47f87e65293b7099e9caf3b22c29
# good: [bbff53fe3b6cdd3c9bc084d489640d7ee2a3f831] lib: sbi_pmu: Use heap for per-HART PMU state
git bisect good bbff53fe3b6cdd3c9bc084d489640d7ee2a3f831
# bad: [f0516beae068ffce0d5a79f09a96904a661a25ba] lib: utils/timer: Use scratch space to save per-HART MTIMER pointer
git bisect bad f0516beae068ffce0d5a79f09a96904a661a25ba
# good: [5a8cfcdf19d98b8dc5dd5a087a2eceb7f5b185fb] lib: utils/ipi: Use heap in ACLINT MSWI driver
git bisect good 5a8cfcdf19d98b8dc5dd5a087a2eceb7f5b185fb
# good: [7e5636ac3788451991a65791c5adcc7798dcc22a] lib: utils/timer: Use heap in ACLINT MTIMER driver
git bisect good 7e5636ac3788451991a65791c5adcc7798dcc22a
# bad: [acbd8fce9e5d92f07d344388a3b046f1722ce072] lib: utils/ipi: Use scratch space to save per-HART MSWI pointer
git bisect bad acbd8fce9e5d92f07d344388a3b046f1722ce072
# good: [3c1c972cb69d670ddc309391c4db76f1f19fd77e] lib: utils/fdt: Use heap in FDT domain parsing
git bisect good 3c1c972cb69d670ddc309391c4db76f1f19fd77e
# first bad commit: [acbd8fce9e5d92f07d344388a3b046f1722ce072] lib: utils/ipi: Use scratch space to save per-HART MSWI pointer

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/opensbi/attachments/20230714/30a3e797/attachment-0001.sig>
