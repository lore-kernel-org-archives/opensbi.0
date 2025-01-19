From: Samuel Holland <samuel.holland@sifive.com>
Date: Sun, 19 Jan 2025 17:02:05 -0600
Subject: [PATCH 05/12] lib: sbi: Improve local variable declarations in
 MPXY framework
In-Reply-To: <20250116155651.103782-6-apatel@ventanamicro.com>
References: <20250116155651.103782-1-apatel@ventanamicro.com>
 <20250116155651.103782-6-apatel@ventanamicro.com>
Message-ID: <8beb7c6c-0284-4fec-978e-8bacac6c6d89@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2025-01-16 9:56 AM, Anup Patel wrote:
> The local variable declarations should be at the start of function
> and preferrably organized like a inverted pyramid.
> 
> Signed-off-by: Anup patel <apatel@ventanamicro.com>
> ---
>  lib/sbi/sbi_mpxy.c | 65 ++++++++++++++++++----------------------------
>  1 file changed, 25 insertions(+), 40 deletions(-)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


