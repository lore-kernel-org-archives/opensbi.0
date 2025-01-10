From: Chao-ying Fu <icebergfu@gmail.com>
Date: Thu, 9 Jan 2025 18:01:20 -0800
Subject: [PATCH] Add a counter and debug printf to change the latency
 inside tlb_sync
In-Reply-To: <35430B00-3D3C-4922-B425-F4C08A1A4802@jrtc27.com>
References: <20250110000301.2620-1-cfu@mips.com> <35430B00-3D3C-4922-B425-F4C08A1A4802@jrtc27.com>
Message-ID: <CAM1rFzHLgh4nCFSnpE1+3K4QCRRfw00+f9b1MP=RX1Rom2MTMg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 9, 2025 at 4:52?PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> On 10 Jan 2025, at 00:03, Chao-ying Fu <icebergfu@gmail.com> wrote:
> >
> > The tlb_sync loop is slowed down by variable latency to avoid
> > livelock on some platforms.
>
> I don?t understand ?by variable latency?. It doesn?t do anything but
> print.

This patch serves one purpose to slow down by calculating count % 20
and call the debug printf that may not actually print to the console.
Also, we can really use this patch to debug if the tlb_sync loop never
exits or runs too long.

>
> > ---
> > lib/sbi/sbi_tlb.c | 6 ++++++
> > 1 file changed, 6 insertions(+)
> >
> > diff --git a/lib/sbi/sbi_tlb.c b/lib/sbi/sbi_tlb.c
> > index 01b31f4..d46b95c 100644
> > --- a/lib/sbi/sbi_tlb.c
> > +++ b/lib/sbi/sbi_tlb.c
> > @@ -247,6 +247,7 @@ static void tlb_process(struct sbi_scratch *scratch)
> >
> > static void tlb_sync(struct sbi_scratch *scratch)
> > {
> > + int count = 0;
> > atomic_t *tlb_sync =
> > sbi_scratch_offset_ptr(scratch, tlb_sync_off);
> >
> > @@ -256,6 +257,11 @@ static void tlb_sync(struct sbi_scratch *scratch)
> > * consume fifo requests to avoid deadlock.
> > */
> > tlb_process_once(scratch);
> > + count++;
>
> Technically this could overflow, and count is signed, so UB...

We can change to unsigned int.

>
> > + if ((count % 20) == 0) {
> > + sbi_dprintf("tlb_sync loop count = %d value = %ld\n",
> > +    count, atomic_read(tlb_sync));
>
> What value does this add? 20 isn?t that big...

This is to slow down the loop more frequently, compared to 1000, for example.

>
> If your goal is to avoid spinning and hammering memory, use pause?
>
> Jess
Yes, we try to avoid spinning and hammering memory. We will need
testing to know if pause can help, too.

Thanks a lot!

Regards,
Chao-ying

