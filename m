From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Fri, 10 Jan 2025 19:12:03 +0000
Subject: [PATCH] Add a counter and debug printf to change the latency
 inside tlb_sync
In-Reply-To: <B03A7A01-2DD4-497D-A465-9A56901A7F98@jrtc27.com>
References: <20250110000301.2620-1-cfu@mips.com>
 <35430B00-3D3C-4922-B425-F4C08A1A4802@jrtc27.com>
 <38b6bf1b-37b4-4cd8-bcab-a3c5537546a1@gmail.com>
 <CAM1rFzFkH2r=w1WSRaYeqGKETHnR9TRcMnPKd+5s0KnoEHToJQ@mail.gmail.com>
 <B03A7A01-2DD4-497D-A465-9A56901A7F98@jrtc27.com>
Message-ID: <9FA52FF6-E706-40C4-A1AA-E20E087A5F48@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10 Jan 2025, at 19:08, Jessica Clarke <jrtc27@jrtc27.com> wrote:
> 
> On 10 Jan 2025, at 02:16, Chao-ying Fu <icebergfu@gmail.com> wrote:
>> 
>> On Thu, Jan 9, 2025 at 5:18?PM Bo Gan <ganboing@gmail.com> wrote:
>>> 
>>> Hi Chaoying,
>>> 
>>> I don't think this patch does anything at all. Using printf to delay is naive.
>>> Can you give concrete example of how the livelock happened and when it happens
>>> some precise number on the performance impact?
>> 
>> Yes, the patch is naive, and we can treat it as the debug patch.
>> However, this patch does help us to avoid livelock.
>> From our 24-hart configuration, one hart cannot update the variable
>> tlb_sync, because another hart always wins to read the value. Then,
>> the tlb_sync loop never exits.
> 
> That sounds like your core violates the forward progress guarantee
> required by the RISC-V spec.

Except atomic_add_return uses amoadd.d.aqrl, which doesn?t even need
such a guarantee, because it?s a single instruction, so that?s saying
your hart can wedge on AMOs. Unless you?ve also patched OpenSBI to use
LR/SC there, in which case we?re back to the forward progress guarantee
being violated.

I have serious concerns about this implementation.

Jess


