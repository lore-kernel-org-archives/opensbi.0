From: Anup Patel <anup@brainfault.org>
Date: Wed, 19 Feb 2025 22:15:13 +0530
Subject: [PATCH 2/3] lib: sbi: fwft: Return SBI_ERR_DENIED_LOCKED when
 setting a locked feature
In-Reply-To: <20250123160537.3420975-3-cleger@rivosinc.com>
References: <20250123160537.3420975-1-cleger@rivosinc.com> <20250123160537.3420975-3-cleger@rivosinc.com>
Message-ID: <CAAhSdy0NE7Whp_hJhcjKjdGpgX2Aaj7jhhdNsCs3iuitWo8csA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 23, 2025 at 9:36?PM Cl?ment L?ger <cleger@rivosinc.com> wrote:
>
> Latest modifications to the spec mandates that a set on a lock feature
> returns SBI_ERR_DENIED_LOCKED.
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
> index 0cb165b4..c46006d4 100644
> --- a/lib/sbi/sbi_fwft.c
> +++ b/lib/sbi/sbi_fwft.c
> @@ -337,7 +337,7 @@ int sbi_fwft_set(enum sbi_fwft_feature_t feature, unsigned long value,
>                 return SBI_EINVAL;
>
>         if (conf->flags & SBI_FWFT_SET_FLAG_LOCK)
> -               return SBI_EDENIED;
> +               return SBI_EDENIED_LOCKED;
>
>         ret = conf->feature->set(conf, value);
>         if (ret)
> --
> 2.47.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

