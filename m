From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 18 Oct 2021 14:21:00 +0800
Subject: [PATCH v5] Makefile: Add build time and compiler info string
In-Reply-To: <CAAhSdy25Fp1pY0utamEd9sUfkPBhdBq3k8Rm61mdwayw-09bzQ@mail.gmail.com>
References: <20211018041148.1343731-1-anup.patel@wdc.com>
 <CAEUhbmWt9sPua3iQhJxBR0UzDPGDyHJK7BOZv15g5qT5+Z6OXQ@mail.gmail.com>
 <CAAhSdy25Fp1pY0utamEd9sUfkPBhdBq3k8Rm61mdwayw-09bzQ@mail.gmail.com>
Message-ID: <CAEUhbmXnpJCH9z8XoyG14s7YJ7L4wiKj--Z1YU1UgFz4J8irmQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Oct 18, 2021 at 2:17 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Mon, Oct 18, 2021 at 11:27 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > Hi Anup,
> >
> > On Mon, Oct 18, 2021 at 12:13 PM Anup Patel <anup.patel@wdc.com> wrote:
> > >
> > > From: Wei Fu <wefu@redhat.com>
> > >
> > > When we are doing opensbi development, we want to know the build time and
> > > compiler info for debug purpose.
> > > To enable this message, please add "BUILD_INFO=y", like:
> > >
> > > ```
> > > make BUILD_INFO=y
> > > ```
> > >
> > > NOTE: `BUILD_INFO=y` will violate "reproducible builds".
> > > So it's ONLY for development and debug purpose, and should NOT be used
> > > in a product which follows "reproducible builds".
> >
> > As I pointed out in v4, with BUILD_INFO=y we can still achieve
> > reproducible builds with BUILD_DATE_EPOCH, so this statement is not
> > entirely true.
>
> Yes, but BUILD_DATE_EPOCH is optional and generally people will not
> specify BUILD_DATE_EPOCH unless they want a reproducible build.
>

If this BUILD_DATE_EPOCH is not needed at all, I am not sure why do we
still keep

ifdef BUILD_DATE_EPOCH
       OPENSBI_BUILD_TIME_STAMP ?= $(shell date -u -d "@$(BUILD_DATE_EPOCH)" \
               "$(OPENSBI_BUILD_DATE_FMT)" 2>/dev/null || \
               date -u -r "$(BUILD_DATE_EPOCH)" \
               "$(OPENSBI_BUILD_DATE_FMT)" 2>/dev/null || \
               date -u "$(OPENSBI_BUILD_DATE_FMT)")
else

> I will certainly update the "NOTE:" in the commit description to clearly
> state when reproducible builds are violated.
>
> >
> > The question is whether we should just drop introducing BUILD_INFO and
> > turn this on for all builds. If reproducible builds is required,
> > define BUILD_DATE_EPOCH.
>
> I think we should keep both BUILD_INFO and BUILD_DATA_EPOCH
> because of the reason I mentioned above.
>

Regards,
Bin

