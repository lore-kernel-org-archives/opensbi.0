From: Andreas Schwab <schwab@linux-m68k.org>
Date: Fri, 24 Nov 2023 12:08:49 +0100
Subject: [QUESTION] Usage of negative number notations on unsigned numbers.
In-Reply-To: <PN2P287MB0754429FA98AFB8EFD2F4D4BFAB8A@PN2P287MB0754.INDP287.PROD.OUTLOOK.COM>
	(Karthik B. K.'s message of "Fri, 24 Nov 2023 09:36:07 +0000")
References: <PN2P287MB0754429FA98AFB8EFD2F4D4BFAB8A@PN2P287MB0754.INDP287.PROD.OUTLOOK.COM>
Message-ID: <878r6n76im.fsf@igel.home>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Nov 24 2023, Karthik B K wrote:

> If so, isn't it safer to use (~0UL) ? This could be a very silent bug. Please correct me if I'm wrong.

The safest way is to write -1 without any suffix.  This is guaranteed to
evaluate to the maximum value when converted to any unsigned type.

-- 
Andreas Schwab, schwab at linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

