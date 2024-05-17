From: Anup Patel <anup@brainfault.org>
Date: Fri, 17 May 2024 10:23:52 +0530
Subject: [PATCH] lib: utils/irqchip: Add sanity checks in imsic_get_data()
 and imsic_get_target_file()
In-Reply-To: <20240516083243.19770-1-cyan.yang@sifive.com>
References: <20240516083243.19770-1-cyan.yang@sifive.com>
Message-ID: <CAAhSdy19Pb8q8nkz8uria=+8L1FhJsV64YTW7z3p9ge1+VXF1w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, May 16, 2024 at 2:03?PM Cyan Yang <cyan.yang@sifive.com> wrote:
>
> Add extra sanity checks to prevent the caller getting the invalid result from
> imsic_get_data() or imsic_get_target_file() when imsic is not initialized
> correctly.
>
> Signed-off-by: Cyan Yang <cyan.yang@sifive.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  lib/utils/irqchip/imsic.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
> index 02e3a33..7d6993e 100644
> --- a/lib/utils/irqchip/imsic.c
> +++ b/lib/utils/irqchip/imsic.c
> @@ -123,6 +123,9 @@ struct imsic_data *imsic_get_data(u32 hartid)
>  {
>         struct sbi_scratch *scratch;
>
> +       if (!imsic_ptr_offset)
> +               return NULL;
> +
>         scratch = sbi_hartid_to_scratch(hartid);
>         if (!scratch)
>                 return NULL;
> @@ -134,6 +137,9 @@ int imsic_get_target_file(u32 hartid)
>  {
>         struct sbi_scratch *scratch;
>
> +       if (!imsic_file_offset)
> +               return SBI_ENOENT;
> +
>         scratch = sbi_hartid_to_scratch(hartid);
>         if (!scratch)
>                 return SBI_ENOENT;
> --
> 2.39.3 (Apple Git-146)
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

