From: 杜东 <dd_nirvana@sjtu.edu.cn>
Date: Thu, 29 Jul 2021 00:16:05 +0800 (CST)
Subject: [PATCH] lib: sbi: Fix bug in strncmp function
In-Reply-To: <875ywv3f8y.fsf@igel.home>
References: <20210726164111.17320-1-ddnirvana1@gmail.com>
 <875ywv3f8y.fsf@igel.home>
Message-ID: <367023298.2035778.1627488965678.JavaMail.zimbra@sjtu.edu.cn>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Andreas,
   You are right.
   The updated patch has been sent.

Regards,
Dong

----- Original Message -----
From: "Andreas Schwab" <schwab@linux-m68k.org>
To: "Dong Du" <ddnirvana1@gmail.com>
Cc: "anup patel" <anup.patel@wdc.com>, opensbi at lists.infradead.org, "Dd nirvana" <dd_nirvana@sjtu.edu.cn>
Sent: Wednesday, July 28, 2021 12:15:09 AM
Subject: Re: [PATCH] lib: sbi: Fix bug in strncmp function

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

