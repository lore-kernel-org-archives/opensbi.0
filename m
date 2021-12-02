From: Anup Patel <anup@brainfault.org>
Date: Thu, 2 Dec 2021 09:16:58 +0530
Subject: [PATCH v2] Makefile: Pass relative paths to the compiler.
In-Reply-To: <20211129015502.4767-1-vagrant@reproducible-builds.org>
References: <20211129015502.4767-1-vagrant@reproducible-builds.org>
Message-ID: <CAAhSdy3LDXp0RfXKwKOPR1uFqbwq6P1HLq7AcVs-FwATPyX-ug@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 29, 2021 at 7:25 AM Vagrant Cascadian
<vagrant@reproducible-builds.org> wrote:
>
> Upstream commit 12753d22563f7d2d01f2c6644c7b66b06eb5c90f introduced
> uses of __FILE__ which may result in the build path getting embedded
> into the resulting binary.
>
> https://reproducible-builds.org/docs/build-path/
>
> Signed-off-by: Vagrant Cascadian <vagrant@reproducible-builds.org>
> Cc: Xiang W <wxjstz@126.com>
> Cc: Anup Patel <anup@brainfault.org>

Now that we have sbi_panic() and SBI_ASSERT() in-place (Jessica's patch), we
don't need to change the top-level Makefile because __FILE__ is not
used anywhere
in sources.

Going forward, we should avoid taking patches that use __FILE__ so that we don't
break reproducible builds.

Regards,
Anup

> ---
> Changes since v1:
>
> * Pass relative paths to the compiler instead of using
>   -ffile-prefix-map to strip out the full paths, as suggested by Xiang
>   W.
>
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 8623c1c..d017534 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -361,7 +361,7 @@ compile_cc_dep = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
>                -MM $(2) >> $(1) || rm -f $(1)
>  compile_cc = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
>              echo " CC        $(subst $(build_dir)/,,$(1))"; \
> -            $(CC) $(CFLAGS) $(call dynamic_flags,$(1),$(2)) -c $(2) -o $(1)
> +            $(CC) $(CFLAGS) $(call dynamic_flags,$(1),$(2)) -c $(subst $(src_dir)/,,$(2)) -o $(1)
>  compile_as_dep = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
>              echo " AS-DEP    $(subst $(build_dir)/,,$(1))"; \
>              printf %s `dirname $(1)`/ > $(1) && \
> --
> 2.30.2
>

