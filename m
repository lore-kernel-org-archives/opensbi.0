From: Samuel Holland <samuel.holland@sifive.com>
Date: Wed, 9 Oct 2024 18:12:55 -0500
Subject: [PATCH 6/9] include: sbi: Remove cyclic include in
 sbi_domain_context.h
In-Reply-To: <20240923115700.381916-7-apatel@ventanamicro.com>
References: <20240923115700.381916-1-apatel@ventanamicro.com>
 <20240923115700.381916-7-apatel@ventanamicro.com>
Message-ID: <7fe4e4a4-7f82-4073-b2be-cc56d7218395@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2024-09-23 6:56 AM, Anup Patel wrote:
> The sbi_domain_context.h includes sbi_domain.h and the sbi_domain.h
> also includes sbi_domain_context.h. Remove this cyclic include in
> sbi_domain_context.h.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  include/sbi/sbi_domain_context.h | 3 ++-
>  lib/sbi/sbi_domain_context.c     | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


