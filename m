From: Andreas Schwab <schwab@linux-m68k.org>
Date: Mon, 29 Nov 2021 11:35:00 +0100
Subject: [PATCH v2] Makefile: Pass relative paths to the compiler.
In-Reply-To: <20211129015502.4767-1-vagrant@reproducible-builds.org> (Vagrant
 Cascadian's message of "Sun, 28 Nov 2021 17:55:03 -0800")
References: <20211129015502.4767-1-vagrant@reproducible-builds.org>
Message-ID: <87a6hnp7vv.fsf@igel.home>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Nov 28 2021, Vagrant Cascadian wrote:

> diff --git a/Makefile b/Makefile
> index 8623c1c..d017534 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -361,7 +361,7 @@ compile_cc_dep = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
>  	       -MM $(2) >> $(1) || rm -f $(1)
>  compile_cc = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
>  	     echo " CC        $(subst $(build_dir)/,,$(1))"; \
> -	     $(CC) $(CFLAGS) $(call dynamic_flags,$(1),$(2)) -c $(2) -o $(1)
> +	     $(CC) $(CFLAGS) $(call dynamic_flags,$(1),$(2)) -c $(subst $(src_dir)/,,$(2)) -o $(1)

How about making src_dir empty throughout?  This now depends on
$(src_dir) being identical to ".", so making that explicit would be
better.

Andreas.

-- 
Andreas Schwab, schwab at linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

