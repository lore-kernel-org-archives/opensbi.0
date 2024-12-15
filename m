From: Anup Patel <anup@brainfault.org>
Date: Sun, 15 Dec 2024 12:22:58 +0530
Subject: [RFC 3/5] remove carry output if scripts/carray.sh fails
In-Reply-To: <20241202110336.332490-4-ben.dooks@codethink.co.uk>
References: <20241202110336.332490-1-ben.dooks@codethink.co.uk> <20241202110336.332490-4-ben.dooks@codethink.co.uk>
Message-ID: <CAAhSdy2og3dyy3hOgJDQgaYo_JdXaa=qkFm+w7NTnEBCY3w_ng@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 2, 2024 at 4:39?PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>
> If the script fails, we end up trying to build either
> an empty or damaged .c file. Just remove it and let
> gcc fail on non-existant file.
>
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index dae282c..a798691 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -502,7 +502,7 @@ compile_d2c = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
>  compile_carray = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
>              echo " CARRAY    $(subst $(build_dir)/,,$(1))"; \
>              $(eval CARRAY_VAR_LIST := $(carray-$(subst .carray.c,,$(shell basename $(1)))-y)) \
> -            $(src_dir)/scripts/carray.sh -i $(2) -l "$(CARRAY_VAR_LIST)" > $(1)
> +            $(src_dir)/scripts/carray.sh -i $(2) -l "$(CARRAY_VAR_LIST)" > $(1) || rm $(1)
>  compile_gen_dep = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
>              echo " GEN-DEP   $(subst $(build_dir)/,,$(1))"; \
>              echo "$(1:.dep=$(2)): $(3)" >> $(1)
> --
> 2.37.2.352.g3c44437643
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

