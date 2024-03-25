From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 25 Mar 2024 14:22:22 -0700
Subject: [PATCH v2] lib: sbi: Add missing sscrind and sscfg extensions in sbi_hart_ext[]
In-Reply-To: <20240320154531.1496553-1-cleger@rivosinc.com>
References: <20240320154531.1496553-1-cleger@rivosinc.com>
Message-ID: <CAOnJCU+iGrnSXTnqvXHcufwn6qMEUYwBgtjR+EFYXW0VaEW8OQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 20, 2024 at 8:45?AM Cl?ment L?ger <cleger@rivosinc.com> wrote:
>
> The sbi_hart_ext[] array is missing these two extensions ids. It is
> expected that this array contains all the extensions declaration at the
> same index of the SBI_HART_EXT_* define. Without this, when adding a new
> extension, there is a mismatch between ids and extension names and it
> can even display corrupted extension names.
>
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
>
> ---
>
> Changes in v2:
>  - Add _Static_assert() to check sbi_hart_ext[] array size
>
> ---
>  lib/sbi/sbi_hart.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index 3d13694..80efeaa 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -666,8 +666,13 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
>         __SBI_HART_EXT_DATA(sdtrig, SBI_HART_EXT_SDTRIG),
>         __SBI_HART_EXT_DATA(smcsrind, SBI_HART_EXT_SMCSRIND),
>         __SBI_HART_EXT_DATA(smcdeleg, SBI_HART_EXT_SMCDELEG),
> +       __SBI_HART_EXT_DATA(sscsrind, SBI_HART_EXT_SSCSRIND),
> +       __SBI_HART_EXT_DATA(ssccfg, SBI_HART_EXT_SSCCFG),
>  };
>

Good catch. I had this included in an earlier version of the patch.
But I was in two minds whether to
add S-mode only extensions  which M-mode doesn't control any states.
I removed it here but forgot to remove it from the SBI_HART_EXT_* defines.

@Anup:
As a general rule, should we include these types of extensions? I just
fear it may blow up in the future.

> +_Static_assert(array_size(sbi_hart_ext) == SBI_HART_EXT_MAX,
> +              "sbi_hart_ext[] array should contain all extensions ids");
> +
>  /**
>   * Get the hart extensions in string format
>   *
> --
> 2.43.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi



-- 
Regards,
Atish

