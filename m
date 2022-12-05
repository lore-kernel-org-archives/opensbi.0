From: Anup Patel <anup@brainfault.org>
Date: Mon, 5 Dec 2022 10:53:54 +0530
Subject: [PATCH 1/1] firmware: Minor optimization for relocate
In-Reply-To: <20221129035407.28946-2-zhangdongdong@eswincomputing.com>
References: <20221129035407.28946-1-zhangdongdong@eswincomputing.com> <20221129035407.28946-2-zhangdongdong@eswincomputing.com>
Message-ID: <CAAhSdy0-a9PtRj18dMmv3fe-EU6t0O0TNHFDhu0GP9uhKnNPKg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 29, 2022 at 9:26 AM Dongdong Zhang
<zhangdongdong@eswincomputing.com> wrote:
>
> The t3 register stores the address of _load_end. If relocation is not required, it is unnecessary to calculate the address of _load_end.
>
> This can reduce the operation time of two instructions.
>
> Signed-off-by: Dongdong Zhang <zhangdongdong@eswincomputing.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

I have taken care of Bin's comment at the time of merging this patch.

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  firmware/fw_base.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/firmware/fw_base.S b/firmware/fw_base.S
> index 07be4c4..3f622b3 100644
> --- a/firmware/fw_base.S
> +++ b/firmware/fw_base.S
> @@ -128,9 +128,9 @@ _relocate:
>         REG_L   t1, 0(t1)
>         lla     t2, _load_start
>         REG_L   t2, 0(t2)
> +       beq     t0, t2, _relocate_done
>         sub     t3, t1, t0
>         add     t3, t3, t2
> -       beq     t0, t2, _relocate_done
>         lla     t4, _relocate_done
>         sub     t4, t4, t2
>         add     t4, t4, t0
> --
> 2.17.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

