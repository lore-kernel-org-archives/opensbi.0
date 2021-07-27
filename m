From: Andreas Schwab <schwab@linux-m68k.org>
Date: Tue, 27 Jul 2021 18:15:09 +0200
Subject: [PATCH] lib: sbi: Fix bug in strncmp function
In-Reply-To: <20210726164111.17320-1-ddnirvana1@gmail.com> (Dong Du's message
 of "Tue, 27 Jul 2021 00:41:11 +0800")
References: <20210726164111.17320-1-ddnirvana1@gmail.com>
Message-ID: <875ywv3f8y.fsf@igel.home>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Jul 27 2021, Dong Du wrote:

> From: Dong Du <dd_nirvana@sjtu.edu.cn>
>
> strncmp should return 0 when the count is 0.
> Fix the issue in sbi_strncmp.
>
> Signed-off-by: Dong Du <ddnirvana1@gmail.com>
> ---
>  lib/sbi/sbi_string.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/lib/sbi/sbi_string.c b/lib/sbi/sbi_string.c
> index 7805ba4..f93ed5f 100644
> --- a/lib/sbi/sbi_string.c
> +++ b/lib/sbi/sbi_string.c
> @@ -29,6 +29,9 @@ int sbi_strcmp(const char *a, const char *b)
>  
>  int sbi_strncmp(const char *a, const char *b, size_t count)
>  {
> +	if (!count)
> +		return 0;
> +
>  	/* search first diff or end of string */
>  	for (; count > 0 && *a == *b && *a != '\0'; a++, b++, count--)
>  		;

You need to put the test after the loop.  Once count becomes zero, there
are no more characters to compare.

Andreas.

-- 
Andreas Schwab, schwab at linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

