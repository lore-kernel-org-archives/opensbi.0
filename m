From: Chao-ying Fu <icebergfu@gmail.com>
Date: Thu, 9 Jan 2025 17:36:10 -0800
Subject: [PATCH] Work with hartid equal to or greater than SBI_HARTMASK_MAX_BITS.
In-Reply-To: <835E687C-AF11-4AA7-844D-67280CDB4AC0@jrtc27.com>
References: <20250109230853.2440-1-cfu@mips.com> <835E687C-AF11-4AA7-844D-67280CDB4AC0@jrtc27.com>
Message-ID: <CAM1rFzGOXoAFA_XTXbGwtEn=CO-bomP3aOBm9rHGAiLQEQ3QGQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 9, 2025 at 4:57?PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> On 9 Jan 2025, at 23:08, Chao-ying Fu <icebergfu@gmail.com> wrote:
> >
> > Some platforms use hartid that is equal to greater than SBI_HARTMASK_MAX_BITS,
> > so we should remove the check.
>
> The checks aren?t there for fun, they?re required. From sbi_hartmask.h:
>
> > /**
> >  * Maximum number of bits in a hartmask
> >  *
> >  * The hartmask is indexed using physical HART id so this define
> >  * also represents the maximum number of HART ids generic OpenSBI
> >  * can handle.
> >  */

This comment may not be accurate, as OpenSBI changed to use hart index
to access the array last year.

>
> OpenSBI does not support hart IDs outside this range today, so there is
> real work to do if that?s needed, not just deleting checks. Otherwise
> you?re going to end up with out-of-bounds memory accesses.
>
> I?m concerned that none of the patches you?ve sent just now seem to
> have been thought through properly. Whilst I?m sure you have the best
> intentions, I also note that this kind of patch is precisely the kind
> of patch one might make were one to want to insert vulnerabilities into
> core system components.
>
> Jess

We did run OpenSBI 1.6 and Linux 6.12 with hart ids (some of them >=
SBI_HARTMASK_MAX_BITS) with this patch on FPGA boards, RTL
simulations, and QEMU.
Thanks!

Regards,
Chao-ying

