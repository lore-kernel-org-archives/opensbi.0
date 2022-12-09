From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
Date: Fri, 9 Dec 2022 11:06:00 +0000
Subject: [PATCH v4 5/5] docs: platform: Add documentation for Renesas
 RZ/Five SoC
In-Reply-To: <CAAhSdy0N+a_VtiELJ20gRrEKWgmP5Eh8Z7XmWAwJDMkpcT84PQ@mail.gmail.com>
References: <20221207163233.10656-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221207163233.10656-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAAhSdy0N+a_VtiELJ20gRrEKWgmP5Eh8Z7XmWAwJDMkpcT84PQ@mail.gmail.com>
Message-ID: <CA+V-a8tr_aOKeqg4BSjJ5Wif++xQpvAgu_p89yY-rLyPEpqGgg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Anup,

Thank you for the review.

On Fri, Dec 9, 2022 at 9:04 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Wed, Dec 7, 2022 at 10:03 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> >
> > This patch adds documentation to build Renesas RZ/Five (R9A07G043F) SoC.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v3->v4
> > * Added complete list of IP blocks
> >
> > v2->v3
> > * Updated doc with new build command
> >
> > RFC->v2
> > * Updated doc
> > ---
> >  docs/platform/platform.md       |   5 +
> >  docs/platform/renesas-rzfive.md | 160 ++++++++++++++++++++++++++++++++
> >  2 files changed, 165 insertions(+)
> >  create mode 100644 docs/platform/renesas-rzfive.md
> >
> > diff --git a/docs/platform/platform.md b/docs/platform/platform.md
> > index f291931..4504d87 100644
> > --- a/docs/platform/platform.md
> > +++ b/docs/platform/platform.md
> > @@ -39,6 +39,10 @@ OpenSBI currently supports the following virtual and hardware platforms:
> >    processor based SOCs. More details on this platform can be found in the
> >    file *[shakti_cclass.md]*.
> >
> > +* **Renesas RZ/Five SoC**: Platform support for Renesas RZ/Five (R9A07G043F) SoC
> > +  used on the Renesas RZ/Five SMARC EVK board. More details on this platform can
> > +  be found in the file *[renesas-rzfive.md]*.
> > +
> >  The code for these supported platforms can be used as example to implement
> >  support for other platforms. The *platform/template* directory also provides
> >  template files for implementing support for a new platform. The *objects.mk*,
> > @@ -54,3 +58,4 @@ comments to facilitate the implementation.
> >  [spike.md]: spike.md
> >  [fpga-openpiton.md]: fpga-openpiton.md
> >  [shakti_cclass.md]: shakti_cclass.md
> > +[renesas-rzfive.md]: renesas-rzfive.md
>
> Add an entry of your platform in docs/platform/generic.md since you are
> using generic platform.
>
Sure will do and re-spin a v5.

Cheers,
Prabhakar

