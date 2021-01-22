From: Andreas Schwab <schwab@linux-m68k.org>
Date: Fri, 22 Jan 2021 10:52:25 +0100
Subject: Questions for OpenSBI to support position independent execution
In-Reply-To: <CAAhSdy0SrvzxnQdpeNhpCXfH1c=dOycNGis2=otNs=xdCUbxGg@mail.gmail.com>
 (Anup Patel's message of "Fri, 22 Jan 2021 11:01:18 +0530")
References: <CABvJ_xh87_8omB+E-e3h4OuQXJEdfbL46D4mNr6mx2Y4oJG4NA@mail.gmail.com>
 <CAAhSdy0SrvzxnQdpeNhpCXfH1c=dOycNGis2=otNs=xdCUbxGg@mail.gmail.com>
Message-ID: <87a6t1uwme.fsf@igel.home>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Jan 22 2021, Anup Patel wrote:

> The proposal for position-independent OpenSBI firmwares has been
> suggested in the past. Our only concern with position-independent
> code is additional instructions added in hot-path which can affect
> performances because all global variables and global functions will
> now be referred via GOT.

If you compile it as PIE that should all end up as pc-relative.

Andreas.

-- 
Andreas Schwab, schwab at linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

