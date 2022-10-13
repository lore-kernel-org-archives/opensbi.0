From: Anup Patel <anup@brainfault.org>
Date: Thu, 13 Oct 2022 08:58:53 +0530
Subject: [PATCH v3 01/13] include: sbi: Fix typo in comment
In-Reply-To: <20221013022951.5206-2-peterlin@andestech.com>
References: <20221013022951.5206-1-peterlin@andestech.com> <20221013022951.5206-2-peterlin@andestech.com>
Message-ID: <CAAhSdy3MJYyNgoy4RM7jyow7G-gQLTm8oSwP=CJxH4wrWPrVxw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 13, 2022 at 8:00 AM Yu Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> %s/Priviledge/Privilege
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
> Changes v2 -> v3
>   - New patch
> ---
>  include/sbi/sbi_scratch.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
> index 2f6f0a1..40a3bc9 100644
> --- a/include/sbi/sbi_scratch.h
> +++ b/include/sbi/sbi_scratch.h
> @@ -57,7 +57,7 @@ struct sbi_scratch {
>         unsigned long next_arg1;
>         /** Address of next booting stage for this HART */
>         unsigned long next_addr;
> -       /** Priviledge mode of next booting stage for this HART */
> +       /** Privilege mode of next booting stage for this HART */
>         unsigned long next_mode;
>         /** Warm boot entry point address for this HART */
>         unsigned long warmboot_addr;
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

