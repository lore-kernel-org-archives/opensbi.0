From: Anup Patel <Anup.Patel@wdc.com>
Date: Mon, 2 Nov 2020 03:34:25 +0000
Subject: [PATCH] Makefile: Add option to use toolchain default ABI and ISA
 string
In-Reply-To: <C3DAF7D3-6D3B-4EE8-8D23-2335F8EEA7D7@jrtc27.com>
References: <20201029085840.2862264-1-anup.patel@wdc.com>
 <4dd3a26644edddb0bb93a20d08d1a035bf98a7ea.camel@wdc.com>
 <C3DAF7D3-6D3B-4EE8-8D23-2335F8EEA7D7@jrtc27.com>
Message-ID: <DM6PR04MB62019386E970AB9105D767778D100@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Jessica Clarke <jrtc27@jrtc27.com>
> Sent: 30 October 2020 03:28
> To: Alistair Francis <Alistair.Francis@wdc.com>
> Cc: Atish Patra <Atish.Patra@wdc.com>; Anup Patel
> <Anup.Patel@wdc.com>; anup at brainfault.org; opensbi at lists.infradead.org
> Subject: Re: [PATCH] Makefile: Add option to use toolchain default ABI and
> ISA string
> 
> On 29 Oct 2020, at 17:08, Alistair Francis <Alistair.Francis@wdc.com> wrote:
> >
> > On Thu, 2020-10-29 at 14:28 +0530, Anup Patel wrote:
> >> When PLATFORM_RISCV_ABI and PLATFORM_RISCV_ISA are not
> specified, we
> >> force "-mabi=lp64 -march=rv64gc" for RV64 and force "-mabi=ilp32
> >> -march=rv32gc" for RV32. This can prevent users from using the
> >> toolchain default "-mabi" and "-march" options.
> >>
> >> To allow using toolchain defaults, we add compile-time option
> >> PLATFORM_RISCV_TOOLCHAIN_DEFAULT which when enabled forces the
> >> top-level makefile to use toolchain default ABI and ISA string.
> >>
> >> To enable the option, pass "PLATFORM_RISCV_TOOLCHAIN_DEFAULT=1"
> >> to top-level make.
> >>
> >> Reported-by: Alistair Francis <alistair.francis@wdc.com>
> >> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> >
> > Thanks!
> >
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> 
> FYI, --with-arch/--with-abi are GCC-specific configure flags. Clang doesn't
> have such a notion, and even if it did it's using CMake so those would be
> differently-named. Though I don't understand why we need to probe to see
> what they are; if you want the default, just don't specify -march/-mabi?
> Seems a bit unnecessary to go and ask what the default is only to then
> explicitly give it to the tool you just asked.

Okay, sounds good to me. Let's just skip specifying "-mabi/-march" when
"PLATFORM_RISCV_TOOLCHAIN_DEFAULT=1"

Regards,
Anup

