From: Xiang W <wxjstz@126.com>
Date: Tue, 05 Dec 2023 16:58:13 +0800
Subject: [PATCH] firmware: fix section type for firmware dynamic
In-Reply-To: <20231205051138.119568-1-matthewwaltzis@gmail.com>
References: <20231205051138.119568-1-matthewwaltzis@gmail.com>
Message-ID: <a1404bcfd1d38aad0ad79075f78dc12b1d0fb14c.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2023-12-04???? 22:11 -0700?Matt Waltz???
> This section is only intended to hold data, and should not be executable.
> 
> Signed-off-by: Matt Waltz <matthewwaltzis@gmail.com>

firmware/fw_jump.S
firmware/payloads/test_head.S
The data section attributes in the above files also need to be modified

Regards,
Xiang W

> ---
> ?firmware/fw_dynamic.S | 2 +-
> ?1 file changed, 1 insertion(+), 1 deletion(-)
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
> ?	.align 3
> ?_dynamic_next_arg1:
> ?	RISCV_PTR 0x0
> -- 
> 2.34.1
> 
> 


