From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Mon, 12 Jul 2021 14:02:23 +0100
Subject: [PATCH 1/1] include: types: Use __builtin_offsetof when supported
In-Reply-To: <87mtqrn0wi.fsf@igel.home>
References: <20210712123959.58251-1-Alexander.Richardson@cl.cam.ac.uk>
 <D8AA0359-B157-4694-A424-37A1EA073F77@jrtc27.com> <87mtqrn0wi.fsf@igel.home>
Message-ID: <D3933A39-D381-4C53-B52F-63C5EBCDF1AA@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 12 Jul 2021, at 13:59, Andreas Schwab <schwab@linux-m68k.org> wrote:
> 
> On Jul 12 2021, Jessica Clarke wrote:
> 
>> The original code was stolen for Linux, where __compiler_offsetof is
>> (unconditionally, it seems) defined to __builtin_offsetof. Either
>> __compiler_offsetof should be defined to __builtin_offsetof or it
>> should be deleted, but having both still exist is wrong. Personally I?m
>> of the view OpenSBI should just define offsetof to __builtin_offsetof
> 
> No, it should use <stddef.h>.

OpenSBI is deliberately entirely standalone, unfortunately in this case.

Jess


