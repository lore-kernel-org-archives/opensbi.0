From: Chao-ying Fu <icebergfu@gmail.com>
Date: Thu, 9 Jan 2025 18:36:38 -0800
Subject: [PATCH] Align the scratch allocation to 64 bytes
In-Reply-To: <6e9d769ee4e71a6da4eeb0ecf7084aea04d3ab86.camel@126.com>
References: <20250110003451.2800-1-cfu@mips.com> <6e9d769ee4e71a6da4eeb0ecf7084aea04d3ab86.camel@126.com>
Message-ID: <CAM1rFzHH=HHM-EZoFRBLAwtw4mEniWDEO0fvk0fr3qK+PyVh1Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 9, 2025 at 8:15?PM Xiang W <wxjstz@126.com> wrote:
>
> ? 2025-01-09?? 16:34 -0800?Chao-ying Fu???
> > We increase the scratch allocation alignment to 64 bytes
> > as the cache line size, to avoid two atomic variables from
> > the same cache line that may cause livelock on some platforms.
> > ---
> >  lib/sbi/sbi_scratch.c | 11 +++++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> >
> > diff --git a/lib/sbi/sbi_scratch.c b/lib/sbi/sbi_scratch.c
> > index ccbbc68..6b161bc 100644
> > --- a/lib/sbi/sbi_scratch.c
> > +++ b/lib/sbi/sbi_scratch.c
> > @@ -14,6 +14,9 @@
> >  #include <sbi/sbi_scratch.h>
> >  #include <sbi/sbi_string.h>
> >
> > +/* Minimum size and alignment of scratch allocations */
> > +#define SCRATCH_ALLOC_ALIGN 64
> This appears to be a platform-specific need and should not affect all platforms.
> Can be like this:
>
> #ifndef SCRATCH_ALLOC_ALIGN
> #define SCRATCH_ALLOC_ALIGN __SIZEOF_POINTER__
> #endif
>
> Regards,
> Xiang W

Yes, I will revise the patch to use the original alignment, if
SCRATCH_ALLOC_ALIGN is not defined.
Thanks a lot!

Regards,
Chao-ying

