From: Anup Patel <anup@brainfault.org>
Date: Tue, 6 Feb 2024 12:56:22 +0530
Subject: [PATCH v3 05/10] firmware: fw_base.S: Move _link_start to .rodata section
In-Reply-To: <20240117104212.1055737-6-wxjstz@126.com>
References: <20240117104212.1055737-1-wxjstz@126.com> <20240117104212.1055737-6-wxjstz@126.com>
Message-ID: <CAAhSdy0we4EkeRMi6+2CH=Cuze=E1_9Hn1QyzWVi_4RnU41RcQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 17, 2024 at 4:12?PM Xiang W <wxjstz@126.com> wrote:
>
> _link_start is readonly, so move it to rodata section.
>
> Signed-off-by: Xiang W <wxjstz@126.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  firmware/fw_base.S | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/firmware/fw_base.S b/firmware/fw_base.S
> index 18dd0c5..7c7157d 100644
> --- a/firmware/fw_base.S
> +++ b/firmware/fw_base.S
> @@ -482,6 +482,9 @@ _relocate_lottery:
>         RISCV_PTR       0
>  _boot_status:
>         RISCV_PTR       0
> +
> +       .section .rodata
> +       .align 3
>  _link_start:
>         RISCV_PTR       FW_TEXT_START
>
> --
> 2.43.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

