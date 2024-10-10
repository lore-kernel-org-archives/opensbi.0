From: Anup Patel <anup@brainfault.org>
Date: Thu, 10 Oct 2024 10:50:05 +0530
Subject: [PATCH 2/9] lib: utils/irqchip: Use sbi_domain_root_add_memrange()
 for IMSIC
In-Reply-To: <3b1a72cd-3b2a-414d-98a5-4cacd5fe044e@sifive.com>
References: <20240923115700.381916-1-apatel@ventanamicro.com>
 <20240923115700.381916-3-apatel@ventanamicro.com> <3b1a72cd-3b2a-414d-98a5-4cacd5fe044e@sifive.com>
Message-ID: <CAAhSdy2MttiVsZyz9eqL_ET-UhLWDdZ3eENKr=1Gag-=48rLyQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 10, 2024 at 4:34?AM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> On 2024-09-23 6:56 AM, Anup Patel wrote:
> > The sbi_domain_root_add_memrange() should be preferred for creating
> > multiple memregions over a range. Update IMSIC driver to use
> > sbi_domain_root_add_memrange() instead of explicity registering
>
> typo: explicitly

Okay, I will update.

>
> > memregions.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  lib/utils/irqchip/imsic.c | 14 ++++++--------
> >  1 file changed, 6 insertions(+), 8 deletions(-)
>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
>

Thanks,
Anup

