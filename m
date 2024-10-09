From: Samuel Holland <samuel.holland@sifive.com>
Date: Wed, 9 Oct 2024 18:11:21 -0500
Subject: [PATCH 5/9] lib: utils/fdt: Use sbi_domain_memregion_init() when
 parsing domains
In-Reply-To: <20240923115700.381916-6-apatel@ventanamicro.com>
References: <20240923115700.381916-1-apatel@ventanamicro.com>
 <20240923115700.381916-6-apatel@ventanamicro.com>
Message-ID: <200e0836-a72a-4ee7-b8b2-aab67c51b9be@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2024-09-23 6:56 AM, Anup Patel wrote:
> Use sbi_domain_memregion_init() at the time of parsing domains from
> FDT so that sbi_domain_memregion_init() is always used for setting
> up all memregions.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  lib/utils/fdt/fdt_domain.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


