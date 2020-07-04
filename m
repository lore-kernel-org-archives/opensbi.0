From: Anup Patel <anup@brainfault.org>
Date: Sat, 4 Jul 2020 09:56:31 +0530
Subject: [PATCH] README.md: fix markdown link formatting
In-Reply-To: <CAEUhbmU+s10t4EHMeH79MjNZRcoR67TZaEkfvnGrhObYxQ5QXQ@mail.gmail.com>
References: <20200701130708.15818-1-tklauser@distanz.ch>
 <CAEUhbmU+s10t4EHMeH79MjNZRcoR67TZaEkfvnGrhObYxQ5QXQ@mail.gmail.com>
Message-ID: <CAAhSdy1bxM26xbbH5ssJYbCCvPVzjR-ML_2iWf5aeSV_YgeuQg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jul 3, 2020 at 6:31 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Wed, Jul 1, 2020 at 9:09 PM Tobias Klauser <tklauser@distanz.ch> wrote:
> >
> > Consistently use reference-style markdown links in the README. This
> > won't show the URL next to the linked text for the [Github] and [U-Boot]
> > links and link the text "Bootlin toolchain repository" instead of
> > showing it verbatim with the URL next to it.
> >
> > Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> > ---
> >  README.md | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
>
> Reviewed-by: Bin Meng <bin.meng@windriver.com>

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Applied this patch to the riscv/opensbi repo.

>
> Anup / Atish,
> This patch does not show up on patchwork. Not sure if it's properly configured?

Okay, we will check. Might be some config issue.

>
> Regards,
> Bin
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Thanks,
Anup

