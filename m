From: Xiang W <wxjstz@126.com>
Date: Thu, 08 Jul 2021 23:58:01 +0800
Subject: [PATCH] firmware: Minor optimization in _scratch_init()
In-Reply-To: <20210708133511.9198-1-bmeng.cn@gmail.com>
References: <20210708133511.9198-1-bmeng.cn@gmail.com>
Message-ID: <ca4dfeaaef91f58c68c5d5e9d1642da469566018.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2021-07-08???? 21:35 +0800?Bin Meng???
> Before entering _scratch_init(), register t3 already holds a copy
> of the firmware end address, hence there is no need to calculate
> it again. This reduces 3 instructions in each _scratch_init() loop.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Xiang W <wxjstz@126.com>
> ---
> 
> ?firmware/fw_base.S | 5 +----
> ?1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/firmware/fw_base.S b/firmware/fw_base.S
> index a5ce946..e35f18e 100644
> --- a/firmware/fw_base.S
> +++ b/firmware/fw_base.S
> @@ -287,10 +287,7 @@ _scratch_init:
> ????????/* Initialize scratch space */
> ????????/* Store fw_start and fw_size in scratch space */
> ????????lla?????a4, _fw_start
> -???????lla?????a5, _fw_end
> -???????mul?????t0, s7, s8
> -???????add?????a5, a5, t0
> -???????sub?????a5, a5, a4
> +???????sub?????a5, t3, a4
> ????????REG_S???a4, SBI_SCRATCH_FW_START_OFFSET(tp)
> ????????REG_S???a5, SBI_SCRATCH_FW_SIZE_OFFSET(tp)
> ????????/* Store next arg1 in scratch space */
> -- 
> 2.25.1
> 
> 



