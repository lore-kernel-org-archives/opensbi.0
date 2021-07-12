From: Andreas Schwab <schwab@linux-m68k.org>
Date: Mon, 12 Jul 2021 14:59:25 +0200
Subject: [PATCH 1/1] include: types: Use __builtin_offsetof when supported
In-Reply-To: <D8AA0359-B157-4694-A424-37A1EA073F77@jrtc27.com> (Jessica
 Clarke's message of "Mon, 12 Jul 2021 13:46:24 +0100")
References: <20210712123959.58251-1-Alexander.Richardson@cl.cam.ac.uk>
 <D8AA0359-B157-4694-A424-37A1EA073F77@jrtc27.com>
Message-ID: <87mtqrn0wi.fsf@igel.home>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Jul 12 2021, Jessica Clarke wrote:

> The original code was stolen for Linux, where __compiler_offsetof is
> (unconditionally, it seems) defined to __builtin_offsetof. Either
> __compiler_offsetof should be defined to __builtin_offsetof or it
> should be deleted, but having both still exist is wrong. Personally I?m
> of the view OpenSBI should just define offsetof to __builtin_offsetof

No, it should use <stddef.h>.

Andreas.

-- 
Andreas Schwab, schwab at linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

