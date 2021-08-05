From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 5 Aug 2021 16:39:55 +0800
Subject: [PATCH v2] lib: sbi: Fix bug in strncmp function
In-Reply-To: <20210728161535.421-1-Dd_nirvana@sjtu.edu.cn>
References: <20210728161535.421-1-Dd_nirvana@sjtu.edu.cn>
Message-ID: <CAEUhbmVeLtGTbpbiO9we8vxmsV+HU1e-11kaS4VL_=XgOcBmvA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Dong,

On Thu, Jul 29, 2021 at 12:23 AM Dong Du <Dd_nirvana@sjtu.edu.cn> wrote:
>
> No need to compare characters when the count turns to 0.
> Fix the issue in sbi_strncmp.
>
> Signed-off-by: Dong Du <Dd_nirvana@sjtu.edu.cn>
> ---
>  lib/sbi/sbi_string.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/lib/sbi/sbi_string.c b/lib/sbi/sbi_string.c
> index 7805ba4..c87bce9 100644
> --- a/lib/sbi/sbi_string.c
> +++ b/lib/sbi/sbi_string.c
> @@ -33,6 +33,10 @@ int sbi_strncmp(const char *a, const char *b, size_t count)
>         for (; count > 0 && *a == *b && *a != '\0'; a++, b++, count--)
>                 ;
>
> +       /* No difference till the end */
> +       if (!count)
> +               return 0;
> +
>         return *a - *b;
>  }
>

Your original patch is also needed: "strncmp should return 0 when the
count is 0"

Regards,
Bin

