From: Samuel Holland <samuel.holland@sifive.com>
Date: Wed, 9 Oct 2024 18:05:21 -0500
Subject: [PATCH 3/9] lib: utils/irqchip: Use
 sbi_domain_root_add_memrange() for APLIC
In-Reply-To: <20240923115700.381916-4-apatel@ventanamicro.com>
References: <20240923115700.381916-1-apatel@ventanamicro.com>
 <20240923115700.381916-4-apatel@ventanamicro.com>
Message-ID: <311626c2-b30a-4630-bb06-7c8fded0a6f8@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2024-09-23 6:56 AM, Anup Patel wrote:
> The sbi_domain_root_add_memrange() should be preferred for creating
> multiple memregions over a range. Update APLIC driver to use
> sbi_domain_root_add_memrange() instead of explicity registering

typo: explicitly

> memregions.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  lib/utils/irqchip/aplic.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


