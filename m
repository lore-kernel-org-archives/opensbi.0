From: Anup Patel <Anup.Patel@wdc.com>
Date: Wed, 2 Jun 2021 11:57:57 +0000
Subject: [PATCH] firmware: Do not allow harts with different XLEN to boot
In-Reply-To: <20210602014201.246899-1-atish.patra@wdc.com>
References: <20210602014201.246899-1-atish.patra@wdc.com>
Message-ID: <CO6PR04MB7812D05D1D957FAE1B3C5C378D3D9@CO6PR04MB7812.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Atish Patra <atish.patra@wdc.com>
> Sent: 02 June 2021 07:12
> To: opensbi at lists.infradead.org
> Cc: Anup Patel <Anup.Patel@wdc.com>; Atish Patra <Atish.Patra@wdc.com>
> Subject: [PATCH] firmware: Do not allow harts with different XLEN to boot
> 
> OpenSBI is built separately for RV32/RV64. Thus, it shouldn't try to boot harts
> with a different XLEN compared to what it is compiled with.
> 
> This patch fixes the issue observed in beagleV which has two U74(RV64) and
> one E24 (RV32) harts.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  firmware/fw_base.S | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/firmware/fw_base.S b/firmware/fw_base.S index
> a5ce946aa3fe..ae12a126ca66 100644
> --- a/firmware/fw_base.S
> +++ b/firmware/fw_base.S
> @@ -47,6 +47,16 @@
>  	.globl _start
>  	.globl _start_warm
>  _start:
> +	csrr   t0, misa
> +	slti   t1, t0, 0
> +	slli   t1, t1, 1
> +	slli   t0, t0, 1
> +	slti   t0, t0, 0
> +	add    t2, t0, t1
> +	li     t3, __riscv_xlen
> +	srli   t3, t3, 5
> +	bne    t2, t3, _start_hang
> +

Unfortunately, MISA can be wired to zero in which case
platform will provide non-standard hooks to check
extensions.

How about this ?

	li    t0, 1
	slli t0, t0, 32
#if __riscv_xlen == 32
	bne t0, zero, _start_hang
#else
	beq t0, zero, _start_hang
#endif

Probably above can be ASM macro so that we can call
this macro at start of both _start() and _start_warm()

>  	/* Find preferred boot HART id */
>  	MOV_3R	s0, a0, s1, a1, s2, a2
>  	call	fw_boot_hart
> --
> 2.31.1

Regards,
Anup


