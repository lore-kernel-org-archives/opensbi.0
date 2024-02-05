From: Anup Patel <anup@brainfault.org>
Date: Mon, 5 Feb 2024 16:43:57 +0530
Subject: [PATCH 2/2] firmware: always create dynsym section
In-Reply-To: <20240126152145.60488-2-leon@georgemail.eu>
References: <20240126152145.60488-1-leon@georgemail.eu> <20240126152145.60488-2-leon@georgemail.eu>
Message-ID: <CAAhSdy20fT-MhFkHhSNykvKMm9o_2QMK1z5mjDeBdj5NAe6A8w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 26, 2024 at 8:52?PM Leon M. Busch-George <leon@georgemail.eu> wrote:
>
> With a bare-metal linkers (e.g. riscv64-elf-ld), there exists no dynsym section.
> The dynsym section is not used by OpenSBI but discarding it makes linkers with dynamic library support unhappy.

There is no Signed-off-by  in the commit description.

I have taken care of the above at the time of merging this patch.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  firmware/fw_base.ldS | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/firmware/fw_base.ldS b/firmware/fw_base.ldS
> index c15ccdb..fb47984 100644
> --- a/firmware/fw_base.ldS
> +++ b/firmware/fw_base.ldS
> @@ -38,6 +38,11 @@
>                 . = ALIGN(8);
>         }
>
> +       .dynsym :
> +       {
> +               *(.dynsym)
> +       }
> +
>         . = ALIGN(0x1000); /* Ensure next section is page aligned */
>
>         .rela.dyn : {
> --
> 2.43.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

