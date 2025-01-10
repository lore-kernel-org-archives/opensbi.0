From: Chao-ying Fu <icebergfu@gmail.com>
Date: Thu, 9 Jan 2025 18:33:34 -0800
Subject: [PATCH] Add RISCV_ISA_ZALRSC_ONLY to rewrite amo instructions via
 lr and sc
In-Reply-To: <64a3e024-ed34-4ab2-8161-708920702911@gmail.com>
References: <20250110002447.2758-1-cfu@mips.com> <64a3e024-ed34-4ab2-8161-708920702911@gmail.com>
Message-ID: <CAM1rFzG31uEE6ghzeVMsBBoZfZNWdEJToF2QJvx8ftACf41Fxg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 9, 2025 at 5:12?PM Bo Gan <ganboing@gmail.com> wrote:
>
> Hi Chaoying,
>
> On 1/9/25 16:24, Chao-ying Fu wrote:
> > Some platforms implement lr and sc in hardware, and emulate amo
> > instructions via the exception handler. To get better performance,
> > we use lr and sc only, when the config is defined.
>
> This comment seems to be self-contradictory. If the core does not support
> amo, then there's no way currently in opensbi to trap/emulate it through
> exception handler. Thus, from your description, it's not only performance,
> but correctness instead. Also do you have a concrete example of such HW?
> I wonder if it's worthwhile to maintain for such special HW. I know the
> S7 hart in hifive/unmatched and starfive/jh7110 works the other way around:
> it only supports AMO, but not lr/sc.

Our core implements extra custom illegal instruction exceptions for
amo instructions and has custom exception vector address. We have
assembly source code to emulate amo via lr and sc in our platform
code. We will post our platform patch to OpenSBI later.
Note that without this patch, the original code still can run.
However, if we just replace amo with lr and sc directly in OpenSBI, we
don't need to run through our custom exception handler.
Thanks a lot!

Regards,
Chao-ying

