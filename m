From: Anup Patel <anup@brainfault.org>
Date: Fri, 5 Jul 2024 12:25:19 +0530
Subject: [PATCH v2 2/3] lib: sbi: dump logs when crash
In-Reply-To: <20240624141903.2305676-3-wxjstz@126.com>
References: <20240624141903.2305676-1-wxjstz@126.com> <20240624141903.2305676-3-wxjstz@126.com>
Message-ID: <CAAhSdy2=NCdWH+7iG3a2_dYYbSJFfi2Xciqo1=GciOLKjgKWuw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 24, 2024 at 7:49?PM Xiang W <wxjstz@126.com> wrote:
>
> When opensbi crashes, try to initialize the console in order to
> output error messages.
>
> Signed-off-by: Xiang W <wxjstz@126.com>
> ---
>  lib/sbi/sbi_hart.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index c366701..48ec97c 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -1010,6 +1010,10 @@ int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)
>
>  void __attribute__((noreturn)) sbi_hart_hang(void)
>  {
> +       /* Try to initialize the console to output some error messages */
> +       if (sbi_console_get_device() == NULL)
> +               sbi_console_init(sbi_scratch_thishart_ptr());
> +

If a crash happened early then this will again change the order
in which platform console_init() is called as compared to other
functions in init_coldboot().

>         while (1)
>                 wfi();
>         __builtin_unreachable();
> --
> 2.43.0
>

Regards,
Anup

