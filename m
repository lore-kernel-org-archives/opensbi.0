From: Andreas Schwab <schwab@linux-m68k.org>
Date: Mon, 18 Oct 2021 09:44:21 +0200
Subject: [PATCH v5] Makefile: Add build time and compiler info string
In-Reply-To: <CAEUhbmXnpJCH9z8XoyG14s7YJ7L4wiKj--Z1YU1UgFz4J8irmQ@mail.gmail.com>
 (Bin Meng's message of "Mon, 18 Oct 2021 14:21:00 +0800")
References: <20211018041148.1343731-1-anup.patel@wdc.com>
 <CAEUhbmWt9sPua3iQhJxBR0UzDPGDyHJK7BOZv15g5qT5+Z6OXQ@mail.gmail.com>
 <CAAhSdy25Fp1pY0utamEd9sUfkPBhdBq3k8Rm61mdwayw-09bzQ@mail.gmail.com>
 <CAEUhbmXnpJCH9z8XoyG14s7YJ7L4wiKj--Z1YU1UgFz4J8irmQ@mail.gmail.com>
Message-ID: <87h7dehj56.fsf@igel.home>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Okt 18 2021, Bin Meng wrote:

> If this BUILD_DATE_EPOCH is not needed at all, I am not sure why do we
> still keep

BUILD_DATE_EPOCH is also non-standard.  The standard variable is
SOURCE_DATE_EPOCH.

Andreas.

-- 
Andreas Schwab, schwab at linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

