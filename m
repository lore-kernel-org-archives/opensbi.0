From: Yao Zi <ziyao@disroot.org>
Date: Fri, 14 Mar 2025 03:48:39 +0000
Subject: [PATCH 0/2] Register Zicntr in FDT when emulating is possible
In-Reply-To: <20250225154103.5229-1-ziyao@disroot.org>
References: <20250225154103.5229-1-ziyao@disroot.org>
Message-ID: <Z9OnF49ocru1Dlro@pie>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 25, 2025 at 03:41:01PM +0000, Yao Zi wrote:
> OpenSBI is capable of emulating time CSR on HARTs without a full Zicntr
> extension. Previously, we hardcoded Zicntr extension in the devicetree
> for these cores, like JH7110 in mainline Linux[1]. This doesn't reflect
> the hardware and may confuse pre-SBI bootloaders, like U-Boot running in
> M-Mode.
> 
> To solve the issue, let's register Zicntr in FDT dynamically for cores
> supporting it by SBI emulation, allowing pre-SBI stages to detect Zicntr
> availability reliably with riscv,isa-extensions.

Ping on this series, are there any more comments? If no I'll improve the
commit message of PATCH 1 and send v2 soon.

Thanks,
Yao Zi

> [1]: https://elixir.bootlin.com/linux/v6.14-rc3/source/arch/riscv/boot/dts/starfive/jh7110.dtsi#L61
> 
> Yao Zi (2):
>   lib: sbi: hart: Detect existence of cycle and instret CSRs for Zicntr
>   lib: utils: fdt: Claim Zicntr if time CSR emulation is possible
> 
>  include/sbi/sbi_hart.h    |  8 ++++++--
>  lib/sbi/sbi_hart.c        | 30 ++++++++++++++++++++++--------
>  lib/sbi/sbi_timer.c       |  2 +-
>  lib/utils/fdt/fdt_fixup.c | 30 +++++++++++++++++++++++++++++-
>  4 files changed, 58 insertions(+), 12 deletions(-)
> 
> -- 
> 2.48.1
> 

