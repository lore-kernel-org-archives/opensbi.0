From: Andreas Schwab <schwab@linux-m68k.org>
Date: Tue, 12 Nov 2024 00:13:14 +0100
Subject: [PATCH] Makefile: Fix POSIX grep alternation regex
In-Reply-To: <20241111193721.79542-1-imel@purelymail.com> (Igor Melnikov's
	message of "Mon, 11 Nov 2024 20:37:07 +0100")
References: <20241111193721.79542-1-imel@purelymail.com>
Message-ID: <87pln1qs8l.fsf@igel.home>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Nov 11 2024, Igor Melnikov wrote:

> Using grep -E for extended regular expression syntax with non-escaped
> alternation operator | lets both versions interpret the pattern
>  unambiguously and the check to function properly on systems with POSIX
>  grep as well.

Alternatively, you can use multiple -e options.  This works even with
traditional grep implementations.

-- 
Andreas Schwab, schwab at linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

