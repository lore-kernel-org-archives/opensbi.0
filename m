From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 18 Oct 2021 18:33:59 +0800
Subject: [PATCH v5] Makefile: Add build time and compiler info string
In-Reply-To: <CAAhSdy10-JHm5vPOtZtmYS5ASR+dhvG=uWi7pARunENONP6xEQ@mail.gmail.com>
References: <20211018041148.1343731-1-anup.patel@wdc.com>
 <CAEUhbmWt9sPua3iQhJxBR0UzDPGDyHJK7BOZv15g5qT5+Z6OXQ@mail.gmail.com>
 <CAAhSdy25Fp1pY0utamEd9sUfkPBhdBq3k8Rm61mdwayw-09bzQ@mail.gmail.com>
 <CAEUhbmXnpJCH9z8XoyG14s7YJ7L4wiKj--Z1YU1UgFz4J8irmQ@mail.gmail.com>
 <87h7dehj56.fsf@igel.home>
 <CAEUhbmV1PRz=h2B+uH6Vmnb9zsAdku6zH7KPp4iotLFsjWRkCQ@mail.gmail.com>
 <CAAhSdy1GSg34u3eGc5CQCuV+TuEXVj9aVHs12pUkDWt9r+N4HA@mail.gmail.com>
 <CAEUhbmW=+N4d2NJUedgLi1n=4j6sXHTeLTb2xn5w1-K=mrRA5Q@mail.gmail.com>
 <CAAhSdy10-JHm5vPOtZtmYS5ASR+dhvG=uWi7pARunENONP6xEQ@mail.gmail.com>
Message-ID: <CAEUhbmVTNMp2Y5CCJNZZH4ph5tmBST5hkP6e+Xg8Cb9Sjxqt6g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Oct 18, 2021 at 6:19 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Mon, Oct 18, 2021 at 3:41 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Mon, Oct 18, 2021 at 6:08 PM Anup Patel <anup@brainfault.org> wrote:
> > >
> > > On Mon, Oct 18, 2021 at 1:42 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > >
> > > > On Mon, Oct 18, 2021 at 3:44 PM Andreas Schwab <schwab@linux-m68k.org> wrote:
> > > > >
> > > > > On Okt 18 2021, Bin Meng wrote:
> > > > >
> > > > > > If this BUILD_DATE_EPOCH is not needed at all, I am not sure why do we
> > > > > > still keep
> > > > >
> > > > > BUILD_DATE_EPOCH is also non-standard.  The standard variable is
> > > > > SOURCE_DATE_EPOCH.
> > > > >
> > > >
> > > > Yep, it's SOURCE_DATE_EPOCH in v4, not sure why Anup changed the name in v5.
> > >
> > > Yes, I changed it to BUILD_DATE_EPOCH to imply that it is related to
> > > BUILD_INFO. I was not aware that SOURCE_DATE_EPOCH is a
> > > standard name. I will rename it to SOURCE_DATE_EPOCH in v6.
> > >
> > > >
> > > > SOURCE_DATE_EPOCH is well documented and is the way for distros to
> > > > generate "reproducible builds".
> > > >
> > > > I would vote to completely drop the "BUILD_INFO=y" as it is not necessary.
> > >
> > > I don't agree with this. The BUILD_INFO helps us totally disable build
> > > information whereas SOURCE_DATE_EPOCH helps us override the
> > > build date/time when BUILD_INFO=y.
> >
> > But what benefits us to provide the capability to conditionally
> > disable the build information? I think that is useful and can be
> > turned on unconditionally, and we can still generate reproducible
> > builds with SOURCE_DATE_EPOCH.
>
> Users will have to figure-out/remember a fixed build date when
> using SOURCE_DATA_EPOCH for reproducible builds whereas
> users don't need to do anything when BUILD_INFO is not defined.
>

This is not 100% true as with current OpenSBI we never claim its build
is fully reproducible. For example, one can easily add __DATE__ to the
source codes which will alter unless we provide SOURCE_DATA_EPOCH.

> BUILD_INFO being not defined is easy/convenient for users
> creating reproducible builds by default. This is also reflected by
> the "BUILD_INFO ?= n" line.

Regards,
Bin

