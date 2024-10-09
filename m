From: Samuel Holland <samuel.holland@sifive.com>
Date: Wed, 9 Oct 2024 18:00:56 -0500
Subject: [PATCH 1/9] lib: utils/ipi: Use sbi_domain_root_add_memrange()
 for ACLINT mswi
In-Reply-To: <20240923115700.381916-2-apatel@ventanamicro.com>
References: <20240923115700.381916-1-apatel@ventanamicro.com>
 <20240923115700.381916-2-apatel@ventanamicro.com>
Message-ID: <8a2cd292-fb0f-487c-809a-bd3e3b4a64a3@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2024-09-23 6:56 AM, Anup Patel wrote:
> The sbi_domain_root_add_memrange() should be preferred for creating
> multiple memregions over a range. Update ACLINT mswi driver to use
> sbi_domain_root_add_memrange() instead of explicity registering

typo: explicitly

> memregions.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  lib/utils/ipi/aclint_mswi.c | 20 ++++++--------------
>  1 file changed, 6 insertions(+), 14 deletions(-)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


