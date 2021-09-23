From: Anup Patel <anup@brainfault.org>
Date: Thu, 23 Sep 2021 10:06:34 +0530
Subject: [PATCH 2/2] platform/ae350: Initialize Coherent Manager as early
 as possible
In-Reply-To: <3430C8B0-C750-4F0A-A6D3-905450C463EC@jrtc27.com>
References: <20210923022957.17840-1-ycliang@andestech.com>
 <3430C8B0-C750-4F0A-A6D3-905450C463EC@jrtc27.com>
Message-ID: <CAAhSdy3CNkb=2k2O6jLYyT-bsg9re4vEAFFoyto-5ANPc_Bw5Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 23, 2021 at 8:06 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> On 23 Sep 2021, at 03:29, Leo Yu-Chi Liang <ycliang@andestech.com> wrote:
> >
> > Coherent Manager will guarantee cache coherency as well as
> > the correctness of atomic extension instruction on Andes 45 series on ae350.
> >
> > This feature needs to be enabled before the first
> > A extension instruction, thus initialize it as early as possible.
>
> Why should this be OpenSBI?s responsibility, rather than in whatever
> firmware you have running before OpenSBI that does whatever low-level
> platform initialisation is needed like DRAM training (which so far has
> been kept out of OpenSBI)? This kind of thing makes it impossible to
> use a generic OpenSBI image, unlike other platforms that have moved
> towards supporting that. Especially as you explicitly mention U-Boot
> here, its SPL is the ideal place for this kind of thing, not in OpenSBI.

I share the same concern. This kind of very early platform specific HART
initialization makes it impossible for platforms to eventually use generic
platform firmwares.

Further, I see that this is being done in the _start() path and not in the
_start_warm() path so HART hotplug will not be able to do this kind
of very early platform specific HART initialization.

Is this for a FPGA platform where there is no booting stage before
OpenSBI firmware ? If yes then can this very early platform init be
done in the FPGA boot-up scripts ?

If there is no other way then I am afraid Andes platform won't benefit
from generic platform firmwares and Andes will end-up maintaining
their own OpenSBI platform support.

Regards,
Anup

>
> Jess
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

