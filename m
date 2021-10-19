From: Alistair Francis <Alistair.Francis@wdc.com>
Date: Tue, 19 Oct 2021 00:23:07 +0000
Subject: [PATCH v5] Makefile: Add build time and compiler info string
In-Reply-To: <CAAhSdy3HbhTBPYA182pDUk5qY7eJ5DvPqqqgkbK5K7oyjJLMLA@mail.gmail.com>
References: <20211018041148.1343731-1-anup.patel@wdc.com>
 <CAEUhbmWt9sPua3iQhJxBR0UzDPGDyHJK7BOZv15g5qT5+Z6OXQ@mail.gmail.com>
 <CAAhSdy25Fp1pY0utamEd9sUfkPBhdBq3k8Rm61mdwayw-09bzQ@mail.gmail.com>
 <CAEUhbmXnpJCH9z8XoyG14s7YJ7L4wiKj--Z1YU1UgFz4J8irmQ@mail.gmail.com>
 <87h7dehj56.fsf@igel.home>
 <CAEUhbmV1PRz=h2B+uH6Vmnb9zsAdku6zH7KPp4iotLFsjWRkCQ@mail.gmail.com>
 <CAAhSdy1GSg34u3eGc5CQCuV+TuEXVj9aVHs12pUkDWt9r+N4HA@mail.gmail.com>
 <CAEUhbmW=+N4d2NJUedgLi1n=4j6sXHTeLTb2xn5w1-K=mrRA5Q@mail.gmail.com>
 <CAAhSdy10-JHm5vPOtZtmYS5ASR+dhvG=uWi7pARunENONP6xEQ@mail.gmail.com>
 <87ilxufwzz.fsf@igel.home>
 <CAAhSdy3HbhTBPYA182pDUk5qY7eJ5DvPqqqgkbK5K7oyjJLMLA@mail.gmail.com>
Message-ID: <23e07b61b8f79e4ac85c7894dc67ebf8da6ec62b.camel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2021-10-18 at 16:06 +0530, Anup Patel wrote:
> On Mon, Oct 18, 2021 at 3:58 PM Andreas Schwab <schwab@linux-m68k.org>
> wrote:
> > 
> > On Okt 18 2021, Anup Patel wrote:
> > 
> > > Users will have to figure-out/remember a fixed build date when
> > > using SOURCE_DATA_EPOCH for reproducible builds whereas
> > > users don't need to do anything when BUILD_INFO is not defined.
> > 
> > Users who care about reproducible builds already know how to set
> > SOURCE_DATA_EPOCH.
> > 
> 
> @Alistair Francis Are you okay removing BUILD_INFO and having it
> always enabled ?

I think it should be disabled by default.

We have not had a timestamp for awhile and it hasn't impacted people
too much.

The reproducible build documentation specifically says that timestamps
are best avoided (https://reproducible-builds.org/docs/timestamps/). I
think they sum it up well that it doesn't add much value, except for a
few specific circumstances.

So I don't see a good justification for enabling it by default, even
with SOURCE_DATE_EPOCH (good catch on the name chage, I missed that).

Alistair

> 
> Regards,
> Anup

