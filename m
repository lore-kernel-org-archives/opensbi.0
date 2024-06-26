From: Anup Patel <anup@brainfault.org>
Date: Wed, 26 Jun 2024 18:18:36 +0530
Subject: [PATCH 2/2] lib: sbi: fwft: return SBI_EINVAL rather than SBI_ERR_INVALID_PARAM
In-Reply-To: <20240624102918.1410501-2-cleger@rivosinc.com>
References: <20240624102918.1410501-1-cleger@rivosinc.com> <20240624102918.1410501-2-cleger@rivosinc.com>
Message-ID: <CAAhSdy1U+9YqVnueHqMH_kjjsSwyLu1SYX=gY1x-b6kK=_LpxQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 24, 2024 at 4:08?PM Cl?ment L?ger <cleger@rivosinc.com> wrote:
>
> Error code returned by the ecall handles should use the defines from
> sbi_ecall_interface.h rather than sbi_error.h.
>
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/sbi/sbi_fwft.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/sbi/sbi_fwft.c b/lib/sbi/sbi_fwft.c
> index 595819b..f1ae915 100644
> --- a/lib/sbi/sbi_fwft.c
> +++ b/lib/sbi/sbi_fwft.c
> @@ -196,7 +196,7 @@ int sbi_fwft_set(enum sbi_fwft_feature_t feature, unsigned long value,
>                 return ret;
>
>         if ((flags & ~SBI_FWFT_SET_FLAG_LOCK) != 0)
> -               return SBI_ERR_INVALID_PARAM;
> +               return SBI_EINVAL;
>
>         if (conf->flags & SBI_FWFT_SET_FLAG_LOCK)
>                 return SBI_EDENIED;
> --
> 2.45.2
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

