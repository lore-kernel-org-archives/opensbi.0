From: Anup Patel <anup@brainfault.org>
Date: Sun, 27 Mar 2022 08:59:49 +0530
Subject: [PATCH 2/3] firmware: Fix code for accessing hart_count and
 stack_size to be more flexible
In-Reply-To: <CAAhSdy1qmTazCHYqQ=BNuBnHOFdNvedvGUikLMhAgqqLctU5YQ@mail.gmail.com>
References: <20220315162240.40990-1-wxjstz@126.com>
 <20220315162240.40990-2-wxjstz@126.com>
 <CAAhSdy1qmTazCHYqQ=BNuBnHOFdNvedvGUikLMhAgqqLctU5YQ@mail.gmail.com>
Message-ID: <CAAhSdy3Ypa6d1syOTv6s3JjeBdpAvb=YSeqct34H=Y9da8bf_w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 21, 2022 at 6:18 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Tue, Mar 15, 2022 at 9:52 PM Xiang W <wxjstz@126.com> wrote:
> >
> > lwu exists under the current rv64 and should also exist under the rv128
> > in the future, so I modified the conditions of conditional compilation
> > so that it can adapt to the future situation
> >
> > Signed-off-by: Xiang W <wxjstz@126.com>
>
> The PATCH subject is too long (almost 80 characters). If possible
> simplify this.
>
> Otherwise, it looks good to me.
>
> Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

>
> Regards,
> Anup
>
> > ---
> >  firmware/fw_base.S | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/firmware/fw_base.S b/firmware/fw_base.S
> > index ab3e1b3..07be4c4 100644
> > --- a/firmware/fw_base.S
> > +++ b/firmware/fw_base.S
> > @@ -259,7 +259,7 @@ _bss_zero:
> >          * s8 -> HART Stack Size
> >          */
> >         lla     a4, platform
> > -#if __riscv_xlen == 64
> > +#if __riscv_xlen > 32
> >         lwu     s7, SBI_PLATFORM_HART_COUNT_OFFSET(a4)
> >         lwu     s8, SBI_PLATFORM_HART_STACK_SIZE_OFFSET(a4)
> >  #else
> > --
> > 2.30.2
> >

