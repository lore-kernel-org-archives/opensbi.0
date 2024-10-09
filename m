From: Samuel Holland <samuel.holland@sifive.com>
Date: Wed, 9 Oct 2024 18:06:46 -0500
Subject: [PATCH 4/9] lib: sbi_domain: Make sbi_domain_root_add_memregion()
 as local function
In-Reply-To: <20240923115700.381916-5-apatel@ventanamicro.com>
References: <20240923115700.381916-1-apatel@ventanamicro.com>
 <20240923115700.381916-5-apatel@ventanamicro.com>
Message-ID: <62afd12b-cc14-42de-ad69-2abdb09713b5@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2024-09-23 6:56 AM, Anup Patel wrote:
> The sbi_domain_root_add_memregion() is only used within sbi_domain
> implementation so make rename and make it a local function.

typo: extra "make"

> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  include/sbi/sbi_domain.h | 10 ----------
>  lib/sbi/sbi_domain.c     |  4 ++--
>  2 files changed, 2 insertions(+), 12 deletions(-)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


