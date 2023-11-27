From: Karthik B K <karthik.bk@incoresemi.com>
Date: Mon, 27 Nov 2023 11:59:56 +0000
Subject: [QUESTION] Usage of negative number notations on unsigned
 numbers.
In-Reply-To: <878r6n76im.fsf@igel.home>
References: <PN2P287MB0754429FA98AFB8EFD2F4D4BFAB8A@PN2P287MB0754.INDP287.PROD.OUTLOOK.COM>
 <878r6n76im.fsf@igel.home>
Message-ID: <PN2P287MB0754BFB8B175A81159CBBF45FABDA@PN2P287MB0754.INDP287.PROD.OUTLOOK.COM>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit




From:?Andreas Schwab <schwab@linux-m68k.org>
Sent:?Friday, November 24, 2023 4:38 PM
To:?Karthik B K <karthik.bk@incoresemi.com>
Cc:?opensbi at lists.infradead.org <opensbi@lists.infradead.org>
Subject:?Re: [QUESTION] Usage of negative number notations on unsigned numbers.
?
On Nov 24 2023, Karthik B K wrote:

> If so, isn't it safer to use (~0UL) ? This could be a very silent bug. Please correct me if I'm wrong.

The safest way is to write -1 without any suffix.? This is guaranteed to
evaluate to the maximum value when converted to any unsigned type.

This is with the assumption that the encoding for -1 == 2^32-1.
I'm still trying to understand what arithmetic negation mean to an unsigned quantity and its representation in UL.
While 0 has a defined encoding in a UL type, -1 does not!

karthik.
