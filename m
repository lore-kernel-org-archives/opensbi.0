From: Anup Patel <anup@brainfault.org>
Date: Sat, 14 May 2022 15:16:55 +0530
Subject: [PATCH v4 3/4] platform: generic: check if CPU node is enabled
In-Reply-To: <20220513105843.5139-4-jan.remes@codasip.com>
References: <20220513105843.5139-1-jan.remes@codasip.com>
 <20220513105843.5139-4-jan.remes@codasip.com>
Message-ID: <CAAhSdy3WSgXGy4Op97ahrunR+DogMR1hYtMHDAaFMVUE4+dvcw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, May 13, 2022 at 4:28 PM Jan Remes <jan.remes@codasip.com> wrote:
>
> Ignore CPU nodes in FDT which are not enabled.
>
> Signed-off-by: Jan Remes <jan.remes@codasip.com>
> Reviewed-by: Xiang W <wxjstz@126.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  platform/generic/platform.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/platform/generic/platform.c b/platform/generic/platform.c
> index 8a4fb70..86db960 100644
> --- a/platform/generic/platform.c
> +++ b/platform/generic/platform.c
> @@ -107,6 +107,9 @@ unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
>                 if (SBI_HARTMASK_MAX_BITS <= hartid)
>                         continue;
>
> +               if (!fdt_node_is_enabled(fdt, cpu_offset))
> +                       continue;
> +
>                 generic_hart_index2id[hart_count++] = hartid;
>         }
>
> --
> 2.36.1
>

