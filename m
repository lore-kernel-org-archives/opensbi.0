From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
Date: Thu, 22 Dec 2022 17:52:17 +0000
Subject: [RFC PATCH] platform: generic: renesas: Add support to configure
 the PMA
In-Reply-To: <Y6S6uRzAupUkCFP2@APC323>
References: <20221212094421.14556-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Y6IzTcaMxw9JjBW3@APC323> <CA+V-a8t8G3AawnRNxi373Gp6W15hp9FmHYCCuSANVnyT7wqmXQ@mail.gmail.com>
 <Y6MjCN7UD1PqL9pL@APC323> <CA+V-a8staavOP=bpnxZw=ZjXFH-XQB7HQLKOF6fY39iFu8Wq0w@mail.gmail.com>
 <Y6S6uRzAupUkCFP2@APC323>
Message-ID: <CA+V-a8sXSO3xyREjgM=UUc+BsQFwrEgeRMeGC2g+MshNTqs-Ng@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Yu-Chien,

On Thu, Dec 22, 2022 at 12:19 PM Yu-Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> Hi Prabhakar,
>
> On Wed, Dec 21, 2022 at 06:19:12PM +0000, Lad, Prabhakar wrote:
> > Hi Yu-Chien,
> >
> > For the next version I'm thinking of having an array in OpenSBI itself
> > for the PMA regions to be configured instead of passing it from u-boot
> > and then passing the required region to the upper boot stack. Hope
> > that's OK with you.
>
> I'll help to test with our platform.
>
Thanks, that would be great.

While you are testing that, maybe you also want to test the PMA
patches too on your platform ;)

Cheers,
Prabhakar

