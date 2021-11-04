From: Anup Patel <anup@brainfault.org>
Date: Thu, 4 Nov 2021 20:13:48 +0530
Subject: [PATCH v4 1/3] lib: sbi: move sbi_boot_print_general()
In-Reply-To: <20211027152206.68913-2-heinrich.schuchardt@canonical.com>
References: <20211027152206.68913-1-heinrich.schuchardt@canonical.com>
 <20211027152206.68913-2-heinrich.schuchardt@canonical.com>
Message-ID: <CAAhSdy1=P5OkG_thFo8QfDYkYTh2fVm43a2VkgZ1tUpcnhrJqA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Oct 27, 2021 at 8:52 PM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> Moving the sbi_boot_print_general() call after the
> sbi_platform_final_init() call allows to print devices initialized in the
> latter.
>
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> Reviewed-by: Dong Du <Dd_nirvana@sjtu.edu.cn>
> ---
> v4:
>         no change
> v3:
>         no change
> v2:
>         new patch
> ---
>  lib/sbi/sbi_init.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> index b1c7cf0..18eb0d7 100644
> --- a/lib/sbi/sbi_init.c
> +++ b/lib/sbi/sbi_init.c
> @@ -301,8 +301,6 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
>                 sbi_hart_hang();
>         }
>
> -       sbi_boot_print_general(scratch);
> -
>         /*
>          * Note: Finalize domains after HSM initialization so that we
>          * can startup non-root domains.
> @@ -336,6 +334,8 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
>                 sbi_hart_hang();
>         }
>
> +       sbi_boot_print_general(scratch);
> +

I would suggest moving sbi_boot_print_domains() here as well
so that the order of prints is the same as the previous.

Regards,
Anup

>         sbi_boot_print_hart(scratch, hartid);
>
>         wake_coldboot_harts(scratch, hartid);
> --
> 2.32.0
>

