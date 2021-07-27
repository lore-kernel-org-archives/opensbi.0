From: Anup Patel <anup@brainfault.org>
Date: Tue, 27 Jul 2021 17:02:53 +0530
Subject: [PATCH] firmware: use _fw_start for load address
In-Reply-To: <20210714071439.38674-1-wxjstz@126.com>
References: <20210714071439.38674-1-wxjstz@126.com>
Message-ID: <CAAhSdy0ig7tXVbHOzh8tTuYtyFxu4a-WLX_OhQ-TNw7ORKFeKA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 14, 2021 at 12:44 PM Xiang W <wxjstz@126.com> wrote:
>
> The previous code uses _start as the load address, this default .entry is
> the first segment, using _fw_start does not need to make this assumption.
>
> Signed-off-by: Xiang W <wxjstz@126.com>

Overall, I am fine with this patch but firmware flat binaries need to have
_start at the very beginning otherwise none of the firmware flat binaries
will work hence the assumption about _start being at beginning made
sense.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Applied this patch to the riscv/opensbi repo.

Regards,
Anup

> ---
>  firmware/fw_base.S   | 6 +++---
>  firmware/fw_base.ldS | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/firmware/fw_base.S b/firmware/fw_base.S
> index 928ca91..63408d1 100644
> --- a/firmware/fw_base.S
> +++ b/firmware/fw_base.S
> @@ -65,14 +65,14 @@ _try_lottery:
>
>         /* Save load address */
>         lla     t0, _load_start
> -       lla     t1, _start
> +       lla     t1, _fw_start
>         REG_S   t1, 0(t0)
>
>  #ifdef FW_PIC
>         /* relocate the global table content */
>         lla     t0, _link_start
>         REG_L   t0, 0(t0)
> -       /* t1 shall has the address of _start */
> +       /* t1 shall has the address of _fw_start */
>         sub     t2, t1, t0
>         lla     t3, _runtime_offset
>         REG_S   t2, (t3)
> @@ -172,7 +172,7 @@ _relocate_copy_to_upper_loop:
>         blt     t0, t1, _relocate_copy_to_upper_loop
>         jr      t4
>  _wait_relocate_copy_done:
> -       lla     t0, _start
> +       lla     t0, _fw_start
>         lla     t1, _link_start
>         REG_L   t1, 0(t1)
>         beq     t0, t1, _wait_for_boot_hart
> diff --git a/firmware/fw_base.ldS b/firmware/fw_base.ldS
> index 0d222da..0738767 100644
> --- a/firmware/fw_base.ldS
> +++ b/firmware/fw_base.ldS
> @@ -8,7 +8,7 @@
>   */
>
>         . = FW_TEXT_START;
> -
> +       /* don't add any section between FW_TEXT_START and _fw_start */
>         PROVIDE(_fw_start = .);
>
>         . = ALIGN(0x1000); /* Need this to create proper sections */
> --
> 2.30.2
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

