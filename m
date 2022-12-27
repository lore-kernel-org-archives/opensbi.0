From: Andreas Schwab <schwab@linux-m68k.org>
Date: Tue, 27 Dec 2022 14:03:54 +0100
Subject: [PATCH 1/1] platform: generic: allwinner: avoid buffer overrun
In-Reply-To: <CAEUhbmUbaAYp-dcEYF845XX66ZGFLPkNuJMp2xpkpPLNZ3o4MQ@mail.gmail.com>
	(Bin Meng's message of "Tue, 27 Dec 2022 20:07:40 +0800")
References: <20221227110129.145976-1-heinrich.schuchardt@canonical.com>
	<CAEUhbmX9u1Fpy-ZQP=Gyp=-jwc5OzRM7XziCkydLcsQqYBivKg@mail.gmail.com>
	<374eb91d-e580-3583-accf-0d0e3a3687ea@canonical.com>
	<CAEUhbmUbaAYp-dcEYF845XX66ZGFLPkNuJMp2xpkpPLNZ3o4MQ@mail.gmail.com>
Message-ID: <87cz85dmmd.fsf@igel.home>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Dez 27 2022, Bin Meng wrote:

> Changing the array size to PLIC_SOURCES + 1 does not make sense. The
> PLIC_SOURCES should be 176 which is correct as it includes source 0 on
> the Allwinner SoC. The "riscv,ndev" [1] should not be 176 otherwise it
> will create a buffer overrun.

The range check will always allow that overrrun.

-- 
Andreas Schwab, schwab at linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

