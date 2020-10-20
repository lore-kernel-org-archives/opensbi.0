From: Andreas Schwab <schwab@linux-m68k.org>
Date: Tue, 20 Oct 2020 09:27:46 +0200
Subject: [PATCH] Makefile: Don't specify mabi or march
In-Reply-To: <ebad7c513b7450d143556bc8af629cf46187e2c9.camel@wdc.com>
 (Alistair Francis's message of "Mon, 19 Oct 2020 23:32:01 +0000")
References: <20201019224108.99481-1-alistair.francis@wdc.com>
 <86597E3E-0796-48AA-9FB1-665A2E7A9102@jrtc27.com>
 <27758a2d4af9da67e8740577cc71d0595bbb6f11.camel@wdc.com>
 <9CE3772E-7817-45AB-BF84-304E0FCA3423@jrtc27.com>
 <ebad7c513b7450d143556bc8af629cf46187e2c9.camel@wdc.com>
Message-ID: <87lfg1uzkd.fsf@igel.home>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Okt 19 2020, Alistair Francis wrote:

> On Tue, 2020-10-20 at 00:05 +0100, Jessica Clarke wrote:
>> Makefile:196:CFLAGS		=	-g -Wall -Werror -ffreestanding
>> -nostdlib -fno-strict-aliasing -O2
>
> Ah, I didn't realise this. I'll change it to a +=

That won't work with `make CFLAGS=foo'.

Andreas.

-- 
Andreas Schwab, schwab at linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

