From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 20 Oct 2022 23:03:06 -0700
Subject: [QUERY] Adding a new platform
In-Reply-To: <CA+V-a8ua-D1MVLAXpBbaoFX5X9BR3F-yPshnmjZzNbw2B6P48w@mail.gmail.com>
References: <CA+V-a8ua-D1MVLAXpBbaoFX5X9BR3F-yPshnmjZzNbw2B6P48w@mail.gmail.com>
Message-ID: <CAOnJCULhkjV5KPh=VU5XhncvxhkXf5C8p=h2xGHTr_B-N9S7ZA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Oct 19, 2022 at 12:22 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi All,
>
> I plan to add support for the Renesas RZ/Five SoC soon.
>
> The RZ/Five SoC is based on the Andes AX45MP core and most of the code
> for RZ/Five will be almost identical in the existing [0] (with just
> slight differences). What is the best approach I should follow without
> duplicating the code?
>

Can you use the generic platform ? I noticed bunch andes patches
supporting DT based probing.
That should help Renesas RZ/Five SoC as well.

> [0] platform/andes/ae350/
>
> Cheers,
> Prabhakar
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi



--
Regards,
Atish

