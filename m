From: Xiang W <wxjstz@126.com>
Date: Tue, 05 Dec 2023 23:37:44 +0800
Subject: [PATCH v3] firmware: fix section types
In-Reply-To: <20231205151344.131121-1-matthewwaltzis@gmail.com>
References: <20231205151344.131121-1-matthewwaltzis@gmail.com>
Message-ID: <7b58567dc0104efba597ba99a47bea211df406f1.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2023-12-05???? 08:13 -0700?Matt Waltz???
> These sections are only intended to hold data, and should not be executable.
> 
> Signed-off-by: Matt Waltz <matthewwaltzis@gmail.com>
LGTM

Reviewed-by: Xiang W <wxjstz@126.com>
> ---
> ?firmware/fw_dynamic.S???????? | 2 +-
> ?firmware/fw_jump.S??????????? | 2 +-
> ?firmware/payloads/test_head.S | 2 +-
> ?3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/firmware/fw_dynamic.S b/firmware/fw_dynamic.S
> index 2b60196..7ff1c6a 100644
> --- a/firmware/fw_dynamic.S
> +++ b/firmware/fw_dynamic.S
> @@ -129,7 +129,7 @@ fw_options:
> ?	REG_L	a0, (a0)
> ?	ret
> ?
> -	.section .entry, "ax", %progbits
> +	.section .data
> ?	.align 3
> ?_dynamic_next_arg1:
> ?	RISCV_PTR 0x0
> diff --git a/firmware/fw_jump.S b/firmware/fw_jump.S
> index 5b24f8b..ac74dc6 100644
> --- a/firmware/fw_jump.S
> +++ b/firmware/fw_jump.S
> @@ -90,7 +90,7 @@ fw_options:
> ?#error "Must define FW_JUMP_ADDR"
> ?#endif
> ?
> -	.section .entry, "ax", %progbits
> +	.section .rodata
> ?	.align 3
> ?_jump_addr:
> ?	RISCV_PTR FW_JUMP_ADDR
> diff --git a/firmware/payloads/test_head.S b/firmware/payloads/test_head.S
> index 4852f71..7a2ac12 100644
> --- a/firmware/payloads/test_head.S
> +++ b/firmware/payloads/test_head.S
> @@ -78,7 +78,7 @@ _start_hang:
> ?	wfi
> ?	j	_start_hang
> ?
> -	.section .entry, "ax", %progbits
> +	.section .data
> ?	.align	3
> ?_hart_lottery:
> ?	RISCV_PTR	0
> -- 
> 2.34.1
> 
> 


