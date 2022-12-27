From: Andreas Schwab <schwab@linux-m68k.org>
Date: Tue, 27 Dec 2022 19:52:22 +0100
Subject: [PATCH 1/1] platform: generic: allwinner: avoid buffer overrun
In-Reply-To: <af4ef9bb-8c83-6c73-6e68-8c46b3b96892@sholland.org> (Samuel
	Holland's message of "Tue, 27 Dec 2022 12:49:12 -0600")
References: <20221227110129.145976-1-heinrich.schuchardt@canonical.com>
	<CAEUhbmX9u1Fpy-ZQP=Gyp=-jwc5OzRM7XziCkydLcsQqYBivKg@mail.gmail.com>
	<374eb91d-e580-3583-accf-0d0e3a3687ea@canonical.com>
	<CAEUhbmUbaAYp-dcEYF845XX66ZGFLPkNuJMp2xpkpPLNZ3o4MQ@mail.gmail.com>
	<87cz85dmmd.fsf@igel.home>
	<CAEUhbmXcQiGH6WQ3pN_C+mv_qRn0mF2Pb2vq_dxeXxMsygNwdw@mail.gmail.com>
	<da726834-79af-8e40-c39e-a6dd4c421ea4@sholland.org>
	<87v8lwd736.fsf@igel.home>
	<af4ef9bb-8c83-6c73-6e68-8c46b3b96892@sholland.org>
Message-ID: <87r0wkd6hl.fsf@igel.home>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Dez 27 2022, Samuel Holland wrote:

> I am aware. However, this sort of change is not feasible for
> plic_context_save()/plic_context_restore(). It would severely complicate
> those functions with extra bit manipulation (thus wasting even more
> space in code size).

If your compiler is so dumb you have a much bigger problem.

-- 
Andreas Schwab, schwab at linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

