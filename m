From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 18 Oct 2021 16:12:25 +0800
Subject: [PATCH v5] Makefile: Add build time and compiler info string
In-Reply-To: <87h7dehj56.fsf@igel.home>
References: <20211018041148.1343731-1-anup.patel@wdc.com>
 <CAEUhbmWt9sPua3iQhJxBR0UzDPGDyHJK7BOZv15g5qT5+Z6OXQ@mail.gmail.com>
 <CAAhSdy25Fp1pY0utamEd9sUfkPBhdBq3k8Rm61mdwayw-09bzQ@mail.gmail.com>
 <CAEUhbmXnpJCH9z8XoyG14s7YJ7L4wiKj--Z1YU1UgFz4J8irmQ@mail.gmail.com>
 <87h7dehj56.fsf@igel.home>
Message-ID: <CAEUhbmV1PRz=h2B+uH6Vmnb9zsAdku6zH7KPp4iotLFsjWRkCQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Oct 18, 2021 at 3:44 PM Andreas Schwab <schwab@linux-m68k.org> wrote:
>
> On Okt 18 2021, Bin Meng wrote:
>
> > If this BUILD_DATE_EPOCH is not needed at all, I am not sure why do we
> > still keep
>
> BUILD_DATE_EPOCH is also non-standard.  The standard variable is
> SOURCE_DATE_EPOCH.
>

Yep, it's SOURCE_DATE_EPOCH in v4, not sure why Anup changed the name in v5.

SOURCE_DATE_EPOCH is well documented and is the way for distros to
generate "reproducible builds".

I would vote to completely drop the "BUILD_INFO=y" as it is not necessary.

Regards,
Bin

