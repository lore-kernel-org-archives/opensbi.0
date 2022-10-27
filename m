From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
Date: Fri, 28 Oct 2022 00:19:28 +0100
Subject: [QUERY] Adding a new platform
In-Reply-To: <CAOnJCULhkjV5KPh=VU5XhncvxhkXf5C8p=h2xGHTr_B-N9S7ZA@mail.gmail.com>
References: <CA+V-a8ua-D1MVLAXpBbaoFX5X9BR3F-yPshnmjZzNbw2B6P48w@mail.gmail.com>
 <CAOnJCULhkjV5KPh=VU5XhncvxhkXf5C8p=h2xGHTr_B-N9S7ZA@mail.gmail.com>
Message-ID: <CA+V-a8snimcvBjqzyYq+WfOt9dipZrHedTCmJahzVfYHiC=rcA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Atish,

Sorry for the late reply.

On Fri, Oct 21, 2022 at 7:03 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Wed, Oct 19, 2022 at 12:22 PM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> >
> > Hi All,
> >
> > I plan to add support for the Renesas RZ/Five SoC soon.
> >
> > The RZ/Five SoC is based on the Andes AX45MP core and most of the code
> > for RZ/Five will be almost identical in the existing [0] (with just
> > slight differences). What is the best approach I should follow without
> > duplicating the code?
> >
>
> Can you use the generic platform ? I noticed bunch andes patches
> supporting DT based probing.
> That should help Renesas RZ/Five SoC as well.
>
I haven't tried the generic platform but I'm guessing it won't work as
Andes AE350 doesnt use it. Thanks for the pointer for andes patches
I'll send RFC patches soon.

Cheers,
Prabhakar

