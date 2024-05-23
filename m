From: Anup Patel <anup@brainfault.org>
Date: Thu, 23 May 2024 18:00:18 +0530
Subject: [PATCH] lib: utils/irqchip: Add sanity checks in imsic_get_data()
 and imsic_get_target_file()
In-Reply-To: <20240516083243.19770-1-cyan.yang@sifive.com>
References: <20240516083243.19770-1-cyan.yang@sifive.com>
Message-ID: <CAAhSdy0ad7anGBi0rjDnOtTVw6TBmcK0VsiHN3v0h5+gz4V+iQ@mail.gmail.com>
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

Applied this patch to the riscv/opensbi repo.

Thanks,
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

