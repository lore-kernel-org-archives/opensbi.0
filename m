From: Samuel Holland <samuel.holland@sifive.com>
Date: Wed, 9 Oct 2024 18:04:23 -0500
Subject: [PATCH 2/9] lib: utils/irqchip: Use
 sbi_domain_root_add_memrange() for IMSIC
In-Reply-To: <20240923115700.381916-3-apatel@ventanamicro.com>
References: <20240923115700.381916-1-apatel@ventanamicro.com>
 <20240923115700.381916-3-apatel@ventanamicro.com>
Message-ID: <3b1a72cd-3b2a-414d-98a5-4cacd5fe044e@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2024-09-23 6:56 AM, Anup Patel wrote:
> The sbi_domain_root_add_memrange() should be preferred for creating
> multiple memregions over a range. Update IMSIC driver to use
> sbi_domain_root_add_memrange() instead of explicity registering

typo: explicitly

> memregions.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  lib/utils/irqchip/imsic.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


