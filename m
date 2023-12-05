From: Xiang W <wxjstz@126.com>
Date: Tue, 05 Dec 2023 23:04:00 +0800
Subject: [PATCH v2] firmware: fix section types
In-Reply-To: <20231205140435.129112-1-matthewwaltzis@gmail.com>
References: <20231205140435.129112-1-matthewwaltzis@gmail.com>
Message-ID: <0b7b20cddf14d16454d0bb4328263de7a962796a.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2023-12-05???? 07:04 -0700?Matt Waltz???
> These sections are only intended to hold data, and should not be executable.
> 
> Signed-off-by: Matt Waltz <matthewwaltzis@gmail.com>
> ---
> ?firmware/fw_dynamic.S???????? | 2 +-
> ?firmware/fw_jump.S??????????? | 2 +-
> ?firmware/payloads/test_head.S | 2 +-
> ?3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/firmware/fw_dynamic.S b/firmware/fw_dynamic.S
> index 2b60196..ddd0fb4 100644
> --- a/firmware/fw_dynamic.S
> +++ b/firmware/fw_dynamic.S
> @@ -129,7 +129,7 @@ fw_options:
> ?	REG_L	a0, (a0)
> ?	ret
> ?
> -	.section .entry, "ax", %progbits
> +	.section .data, "aw", %progbits
.data is better
> ?	.align 3
> ?_dynamic_next_arg1:
> ?	RISCV_PTR 0x0
> diff --git a/firmware/fw_jump.S b/firmware/fw_jump.S
> index 5b24f8b..c5e66b4 100644
> --- a/firmware/fw_jump.S
> +++ b/firmware/fw_jump.S
> @@ -90,7 +90,7 @@ fw_options:
> ?#error "Must define FW_JUMP_ADDR"
> ?#endif
> ?
> -	.section .entry, "ax", %progbits
> +	.section .data, "aw", %progbits
_jump_addr is readonly , so .rodata is better
> ?	.align 3
> ?_jump_addr:
> ?	RISCV_PTR FW_JUMP_ADDR
> diff --git a/firmware/payloads/test_head.S b/firmware/payloads/test_head.S
> index 4852f71..8729745 100644
> --- a/firmware/payloads/test_head.S
> +++ b/firmware/payloads/test_head.S
> @@ -78,7 +78,7 @@ _start_hang:
> ?	wfi
> ?	j	_start_hang
> ?
> -	.section .entry, "ax", %progbits
> +	.section .data, "aw", %progbits
.data is better
> ?	.align	3
> ?_hart_lottery:
> ?	RISCV_PTR	0
> -- 
> 2.34.1
> 
> 

Regards,
Xiang W


