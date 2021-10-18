From: Anup Patel <anup@brainfault.org>
Date: Mon, 18 Oct 2021 16:06:25 +0530
Subject: [PATCH v5] Makefile: Add build time and compiler info string
In-Reply-To: <87ilxufwzz.fsf@igel.home>
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
Message-ID: <CAAhSdy3HbhTBPYA182pDUk5qY7eJ5DvPqqqgkbK5K7oyjJLMLA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Oct 18, 2021 at 3:58 PM Andreas Schwab <schwab@linux-m68k.org> wrote:
>
> On Okt 18 2021, Anup Patel wrote:
>
> > Users will have to figure-out/remember a fixed build date when
> > using SOURCE_DATA_EPOCH for reproducible builds whereas
> > users don't need to do anything when BUILD_INFO is not defined.
>
> Users who care about reproducible builds already know how to set
> SOURCE_DATA_EPOCH.
>

@Alistair Francis Are you okay removing BUILD_INFO and having it
always enabled ?

Regards,
Anup

