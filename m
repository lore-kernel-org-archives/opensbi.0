From: Anup Patel <anup@brainfault.org>
Date: Thu, 10 Oct 2024 10:50:33 +0530
Subject: [PATCH 3/9] lib: utils/irqchip: Use sbi_domain_root_add_memrange()
 for APLIC
In-Reply-To: <311626c2-b30a-4630-bb06-7c8fded0a6f8@sifive.com>
References: <20240923115700.381916-1-apatel@ventanamicro.com>
 <20240923115700.381916-4-apatel@ventanamicro.com> <311626c2-b30a-4630-bb06-7c8fded0a6f8@sifive.com>
Message-ID: <CAAhSdy3P=hor6WHW5vv1xH7Zz7b_joAAXP_FGBcMbm6Lxqi1gA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 10, 2024 at 4:35?AM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> On 2024-09-23 6:56 AM, Anup Patel wrote:
> > The sbi_domain_root_add_memrange() should be preferred for creating
> > multiple memregions over a range. Update APLIC driver to use
> > sbi_domain_root_add_memrange() instead of explicity registering
>
> typo: explicitly

Okay, I will update.

>
> > memregions.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  lib/utils/irqchip/aplic.c | 11 ++++-------
> >  1 file changed, 4 insertions(+), 7 deletions(-)
>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
>

Thanks,
Anup

