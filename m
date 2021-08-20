From: Anup Patel <anup@brainfault.org>
Date: Fri, 20 Aug 2021 10:23:52 +0530
Subject: [PATCH] lib: sbi_trap: Restore redirect for access faults
In-Reply-To: <CAEUhbmWkBgsZM5NjiDJh6AyZZTGmFUiLLC=WQXyAq8xkwm5XDA@mail.gmail.com>
References: <20210814134147.14056-1-samuel@sholland.org>
 <CAEUhbmWkBgsZM5NjiDJh6AyZZTGmFUiLLC=WQXyAq8xkwm5XDA@mail.gmail.com>
Message-ID: <CAAhSdy08+gkHPFZqRwoxCZn1asEQj6qvRKQV6UfPoRo3m36FaQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Aug 17, 2021 at 11:48 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Sat, Aug 14, 2021 at 9:42 PM Samuel Holland <samuel@sholland.org> wrote:
> >
> > commit 764a17d852a8 ("lib: sbi: Implement firmware counters") added
> > switch cases for CAUSE_LOAD_ACCESS and CAUSE_STORE_ACCESS. This caused
> > them to stop being redirected to U or S mode, as that is handled in the
> > default switch case. As a result, an error in userspace could cause the
> > system to hang. Fix this by allowing the acces fault case to fall
> > through to the default case.
> >
> > Signed-off-by: Samuel Holland <samuel@sholland.org>
> > ---
> >  lib/sbi/sbi_trap.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> >
>
> Should have a:
>
> Fixes 764a17d852a8 ("lib: sbi: Implement firmware counters")
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

I have included the Fixes tag at time of merging this patch.

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

