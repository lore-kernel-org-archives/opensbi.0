From: Anup Patel <anup@brainfault.org>
Date: Tue, 22 Nov 2022 11:25:28 +0530
Subject: [PATCH v2] firmware: payloads: Optimize usage of "ALIGN"
In-Reply-To: <20221121082622.1495-1-zhangleizheng@eswincomputing.com>
References: <20221121082622.1495-1-zhangleizheng@eswincomputing.com>
Message-ID: <CAAhSdy12v2Xy+42O+3m7dZdS4AdTOwReCzWaG48eMxZJk398Dg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 21, 2022 at 1:58 PM <zhangleizheng@eswincomputing.com> wrote:
>
> From: Leizheng Zhang <zhangleizheng@eswincomputing.com>
>
> Delete the redundant "ALIGN" and adjust the position of "ALIGN"
>
> Signed-off-by: Leizheng Zhang <zhangleizheng@eswincomputing.com>

Please carry the Reviewed-by tags which you obtained on your
previous patch revision.

For now, I had to manually pull Reviewed-by tags from the previous
patch.

Applied this patch to the riscv/opensbi repo.

Regards,
Anup
> ---
>  firmware/fw_base.ldS           | 10 ++++------
>  firmware/payloads/test.elf.ldS | 12 +++++-------
>  2 files changed, 9 insertions(+), 13 deletions(-)
>
> diff --git a/firmware/fw_base.ldS b/firmware/fw_base.ldS
> index 220c043..5ea549f 100644
> --- a/firmware/fw_base.ldS
> +++ b/firmware/fw_base.ldS
> @@ -24,13 +24,11 @@
>                 PROVIDE(_text_end = .);
>         }
>
> -       . = ALIGN(0x1000); /* Ensure next section is page aligned */
> -
>         /* End of the code sections */
>
> -       /* Beginning of the read-only data sections */
> +       . = ALIGN(0x1000); /* Ensure next section is page aligned */
>
> -       . = ALIGN(0x1000); /* Ensure next section is page aligned */
> +       /* Beginning of the read-only data sections */
>
>         .rodata :
>         {
> @@ -42,10 +40,10 @@
>
>         /* End of the read-only data sections */
>
> -       /* Beginning of the read-write data sections */
> -
>         . = ALIGN(0x1000); /* Ensure next section is page aligned */
>
> +       /* Beginning of the read-write data sections */
> +
>         .data :
>         {
>                 PROVIDE(_data_start = .);
> diff --git a/firmware/payloads/test.elf.ldS b/firmware/payloads/test.elf.ldS
> index f3f3242..8d18a9c 100644
> --- a/firmware/payloads/test.elf.ldS
> +++ b/firmware/payloads/test.elf.ldS
> @@ -33,13 +33,11 @@ SECTIONS
>                 PROVIDE(_text_end = .);
>         }
>
> -       . = ALIGN(0x1000); /* Ensure next section is page aligned */
> -
>         /* End of the code sections */
>
> -       /* Beginning of the read-only data sections */
> +       . = ALIGN(0x1000); /* Ensure next section is page aligned */
>
> -       . = ALIGN(0x1000); /* Ensure next section is page aligned */
> +       /* Beginning of the read-only data sections */
>
>         .rodata :
>         {
> @@ -51,10 +49,10 @@ SECTIONS
>
>         /* End of the read-only data sections */
>
> -       /* Beginning of the read-write data sections */
> -
> -       . = ALIGN(0x1000); /* Ensure next section is page aligned */
> +       . = ALIGN(0x1000); /* Ensure next section is page aligned */
>
> +       /* Beginning of the read-write data sections */
> +
>         .data :
>         {
>                 PROVIDE(_data_start = .);
> --
> 2.17.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

