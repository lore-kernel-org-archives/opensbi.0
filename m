From: Andreas Schwab <schwab@linux-m68k.org>
Date: Tue, 27 Dec 2022 15:06:00 +0100
Subject: [PATCH 1/1] platform: generic: allwinner: avoid buffer overrun
In-Reply-To: <CAEUhbmWx9=YYZQ1SW_a9rkLraJ-R4ABStdMASUARVkBAx0mYUA@mail.gmail.com>
	(Bin Meng's message of "Tue, 27 Dec 2022 21:49:07 +0800")
References: <20221227110129.145976-1-heinrich.schuchardt@canonical.com>
	<CAEUhbmX9u1Fpy-ZQP=Gyp=-jwc5OzRM7XziCkydLcsQqYBivKg@mail.gmail.com>
	<374eb91d-e580-3583-accf-0d0e3a3687ea@canonical.com>
	<CAEUhbmUbaAYp-dcEYF845XX66ZGFLPkNuJMp2xpkpPLNZ3o4MQ@mail.gmail.com>
	<87cz85dmmd.fsf@igel.home>
	<CAEUhbmXcQiGH6WQ3pN_C+mv_qRn0mF2Pb2vq_dxeXxMsygNwdw@mail.gmail.com>
	<878ritdl45.fsf@igel.home>
	<CAEUhbmWx9=YYZQ1SW_a9rkLraJ-R4ABStdMASUARVkBAx0mYUA@mail.gmail.com>
Message-ID: <874jthdjqv.fsf@igel.home>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Dez 27 2022, Bin Meng wrote:

> Passing num = 200 to plic_priority_save/restore.
>
> You can argue my example is a misuse of the API,

It is a bug just like the bug in plic_priority_save/restore.

> but I can argue a wrong dtb should not be in the first place too.

The dtb is an external resource.

-- 
Andreas Schwab, schwab at linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

