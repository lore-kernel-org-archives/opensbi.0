From: Anup Patel <anup@brainfault.org>
Date: Tue, 7 May 2024 14:19:38 +0530
Subject: [PATCH 3/7] lib: sbi: sse: simplify 32bits overflow check
In-Reply-To: <20240409100216.263256-4-cleger@rivosinc.com>
References: <20240409100216.263256-1-cleger@rivosinc.com> <20240409100216.263256-4-cleger@rivosinc.com>
Message-ID: <CAAhSdy1+E1K2KvKc5hN1bvEu7XgNBGZxbMxH-7Lt-Zb-Qr_x3w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 9, 2024 at 3:32?PM Cl?ment L?ger <cleger@rivosinc.com> wrote:
>
> Rather than checking 32bits overflow with some absolute value, check the
> value to be different from the cast itself.
>
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
> Reported-by: Samuel Holland <samuel.holland@sifive.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  lib/sbi/sbi_sse.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
> index d54c125..cd8a539 100644
> --- a/lib/sbi/sbi_sse.c
> +++ b/lib/sbi/sbi_sse.c
> @@ -344,7 +344,7 @@ static int sse_event_set_attr_check(struct sbi_sse_event *e, uint32_t attr_id,
>                 break;
>         case SBI_SSE_ATTR_PRIO:
>  #if __riscv_xlen > 32
> -               if (val > 0xFFFFFFFFUL) {
> +               if (val != (uint32_t)val) {
>                         ret = SBI_EINVAL;
>                         break;
>                 }
> --
> 2.43.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

