From: Xiang W <wxjstz@126.com>
Date: Mon, 15 Jan 2024 23:24:59 +0800
Subject: [PATCH] firmware: fw_base.S: remove _runtime_offset
In-Reply-To: <20240102133551.396639-1-wxjstz@126.com>
References: <20240102133551.396639-1-wxjstz@126.com>
Message-ID: <f0ee13c0a503ef44dace6026f77972965b50095d.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2024-01-02???? 21:35 +0800?Xiang W???
> _runtime_offset is a variable not used elsewhere, so remove it.
> 
> Signed-off-by: Xiang W <wxjstz@126.com>

New patch at https://lists.infradead.org/pipermail/opensbi/2024-January/006268.html

Regards,
Xiang W
> ---
> ?firmware/fw_base.S | 6 ------
> ?1 file changed, 6 deletions(-)
> 
> diff --git a/firmware/fw_base.S b/firmware/fw_base.S
> index f7763f4..04d4f21 100644
> --- a/firmware/fw_base.S
> +++ b/firmware/fw_base.S
> @@ -74,8 +74,6 @@ _try_lottery:
> ?	REG_L	t0, 0(t0)
> ?	/* t1 shall has the address of _fw_start */
> ?	sub	t2, t1, t0
> -	lla	t3, _runtime_offset
> -	REG_S	t2, (t3)
> ?	lla	t0, __rel_dyn_start
> ?	lla	t1, __rel_dyn_end
> ?	beq	t0, t1, _relocate_done
> @@ -500,10 +498,6 @@ _skip_trap_exit_rv32_hyp:
> ?
> ?	.data
> ?	.align 3
> -#ifdef FW_PIC
> -_runtime_offset:
> -	RISCV_PTR	0
> -#endif
> ?_relocate_lottery:
> ?	RISCV_PTR	0
> ?_boot_status:
> -- 
> 2.43.0
> 
> 


