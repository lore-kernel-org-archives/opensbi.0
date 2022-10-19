From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
Date: Wed, 19 Oct 2022 20:22:08 +0100
Subject: [QUERY] Adding a new platform
Message-ID: <CA+V-a8ua-D1MVLAXpBbaoFX5X9BR3F-yPshnmjZzNbw2B6P48w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi All,

I plan to add support for the Renesas RZ/Five SoC soon.

The RZ/Five SoC is based on the Andes AX45MP core and most of the code
for RZ/Five will be almost identical in the existing [0] (with just
slight differences). What is the best approach I should follow without
duplicating the code?

[0] platform/andes/ae350/

Cheers,
Prabhakar

