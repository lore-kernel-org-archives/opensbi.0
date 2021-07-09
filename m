From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Fri, 9 Jul 2021 05:13:45 +0100
Subject: [PATCH v3 1/3] fw_base: Don't mark fw_platform_init as both
 global and weak
In-Reply-To: <20210709041213.11883-2-jrtc27@jrtc27.com>
References: <20210709041213.11883-1-jrtc27@jrtc27.com>
 <20210709041213.11883-2-jrtc27@jrtc27.com>
Message-ID: <0DE0BB9C-1422-40CA-9D1F-59805DF4A438@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 9 Jul 2021, at 05:12, Jessica Clarke <jrtc27@jrtc27.com> wrote:
> 
> These are mutually exclusive. GNU as and LLVM both let later binding
> directives override earlier ones so this works as intended, but LLVM 12
> turned this into a warning as there's no good reason to do such a thing
> and could be a potential bug. Thus, remove the redundant and incorrect
> .globl directive for fw_platform_init.

Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>

*Sigh*, not that this patch is at all interesting copyright-wise...

Jess

> ---
> firmware/fw_base.S | 1 -
> 1 file changed, 1 deletion(-)
> 
> diff --git a/firmware/fw_base.S b/firmware/fw_base.S
> index a5ce946..ee2a51b 100644
> --- a/firmware/fw_base.S
> +++ b/firmware/fw_base.S
> @@ -553,7 +553,6 @@ _start_hang:
> 
> 	.section .entry, "ax", %progbits
> 	.align 3
> -	.globl fw_platform_init
> 	.weak fw_platform_init
> fw_platform_init:
> 	add	a0, a1, zero
> -- 
> 2.31.0
> 


