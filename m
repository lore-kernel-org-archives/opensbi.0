From: Andreas Schwab <schwab@linux-m68k.org>
Date: Mon, 27 Nov 2023 13:09:14 +0100
Subject: [QUESTION] Usage of negative number notations on unsigned numbers.
In-Reply-To: <PN2P287MB0754BFB8B175A81159CBBF45FABDA@PN2P287MB0754.INDP287.PROD.OUTLOOK.COM>
	(Karthik B. K.'s message of "Mon, 27 Nov 2023 11:59:56 +0000")
References: <PN2P287MB0754429FA98AFB8EFD2F4D4BFAB8A@PN2P287MB0754.INDP287.PROD.OUTLOOK.COM>
	<878r6n76im.fsf@igel.home>
	<PN2P287MB0754BFB8B175A81159CBBF45FABDA@PN2P287MB0754.INDP287.PROD.OUTLOOK.COM>
Message-ID: <87leajmm8l.fsf@igel.home>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Nov 27 2023, Karthik B K wrote:

> This is with the assumption that the encoding for -1 == 2^32-1.

No, the representation has nothing to do with that.  It's a value
conversion.

-- 
Andreas Schwab, schwab at linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

