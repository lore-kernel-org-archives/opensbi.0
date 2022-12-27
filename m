From: Andreas Schwab <schwab@linux-m68k.org>
Date: Tue, 27 Dec 2022 20:31:38 +0100
Subject: [PATCH 1/1] platform: generic: allwinner: avoid buffer overrun
In-Reply-To: <6e6e3302-ce90-f851-807f-d236499dbf83@sholland.org> (Samuel
	Holland's message of "Tue, 27 Dec 2022 13:12:05 -0600")
References: <20221227110129.145976-1-heinrich.schuchardt@canonical.com>
	<CAEUhbmX9u1Fpy-ZQP=Gyp=-jwc5OzRM7XziCkydLcsQqYBivKg@mail.gmail.com>
	<374eb91d-e580-3583-accf-0d0e3a3687ea@canonical.com>
	<CAEUhbmUbaAYp-dcEYF845XX66ZGFLPkNuJMp2xpkpPLNZ3o4MQ@mail.gmail.com>
	<87cz85dmmd.fsf@igel.home>
	<CAEUhbmXcQiGH6WQ3pN_C+mv_qRn0mF2Pb2vq_dxeXxMsygNwdw@mail.gmail.com>
	<da726834-79af-8e40-c39e-a6dd4c421ea4@sholland.org>
	<87v8lwd736.fsf@igel.home>
	<af4ef9bb-8c83-6c73-6e68-8c46b3b96892@sholland.org>
	<87r0wkd6hl.fsf@igel.home>
	<6e6e3302-ce90-f851-807f-d236499dbf83@sholland.org>
Message-ID: <87ilhwd4o5.fsf@igel.home>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Dez 27 2022, Samuel Holland wrote:

> "This sort of change" to avoid using space for IRQ 0, thus saving one
> *bit* in the array

??? *byte*

> used by plic_context_save(),

??? plic_priority_save/restore

> 	enable[i] = plic_get_ie(plic, context_id, i) >> 1 |
> 	            plic_get_ie(plic, context_id, i + 1) << 31;

??? Nothing at all changes here.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

