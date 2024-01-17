From: Andreas Schwab <schwab@suse.de>
Date: Wed, 17 Jan 2024 12:36:18 +0100
Subject: [PATCH v2] Makefile: add rebuild
In-Reply-To: <20240117105843.1058338-1-wxjstz@126.com> (Xiang W.'s message of
	"Wed, 17 Jan 2024 18:57:44 +0800")
References: <20240117105843.1058338-1-wxjstz@126.com>
Message-ID: <mvm4jfcxkct.fsf@suse.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Jan 17 2024, Xiang W wrote:

> diff --git a/Makefile b/Makefile
> index de4e73a..17d0a22 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -688,5 +688,9 @@ endif
>  	$(if $(V), @echo " RM        $(src_dir)/cscope*")
>  	$(CMD_PREFIX)rm -f $(src_dir)/cscope*
>  
> +# Rule for "make rebuild"
> +.PHONY: rebuild
> +rebuild: clean all

This will not work in a parallel build, since clean and all will be run
in parallel.

-- 
Andreas Schwab, SUSE Labs, schwab at suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

