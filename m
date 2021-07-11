From: Anup Patel <anup@brainfault.org>
Date: Sun, 11 Jul 2021 14:22:15 +0530
Subject: [PATCH] firmware: Remove the sanity checks in fw_save_info()
In-Reply-To: <e4d6b1558041ad557a69255421442f82dd8a6571.camel@126.com>
References: <20210707100021.4532-1-bmeng.cn@gmail.com>
 <e4d6b1558041ad557a69255421442f82dd8a6571.camel@126.com>
Message-ID: <CAAhSdy18+X=qF91ccSQLYDxP_HP1CynQJQrxjwv2Ny6rGZiLyA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jul 8, 2021 at 6:16 AM Xiang W <wxjstz@126.com> wrote:
>
> ? 2021-07-07???? 18:00 +0800?Bin Meng???
> > The sanity checks on the magic and version was already done in
> > fw_boot_hart(), which happens before fw_save_info() is called.
> >
> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> Reviewed-by: Xiang W <wxjstz@126.com>

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> > ---
> >
> >  firmware/fw_dynamic.S | 8 --------
> >  1 file changed, 8 deletions(-)
> >
> > diff --git a/firmware/fw_dynamic.S b/firmware/fw_dynamic.S
> > index 2b7ec3b..2b60196 100644
> > --- a/firmware/fw_dynamic.S
> > +++ b/firmware/fw_dynamic.S
> > @@ -57,14 +57,6 @@ fw_save_info:
> >         lla     a4, _dynamic_next_arg1
> >         REG_S   a1, (a4)
> >
> > -       /* Sanity checks */
> > -       li      a4, FW_DYNAMIC_INFO_MAGIC_VALUE
> > -       REG_L   a3, FW_DYNAMIC_INFO_MAGIC_OFFSET(a2)
> > -       bne     a3, a4, _bad_dynamic_info
> > -       li      a4, FW_DYNAMIC_INFO_VERSION_MAX
> > -       REG_L   a3, FW_DYNAMIC_INFO_VERSION_OFFSET(a2)
> > -       bgt     a3, a4, _bad_dynamic_info
> > -
> >         /* Save version == 0x1 fields */
> >         lla     a4, _dynamic_next_addr
> >         REG_L   a3, FW_DYNAMIC_INFO_NEXT_ADDR_OFFSET(a2)
> > --
> > 2.25.1
> >
> >
>
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

