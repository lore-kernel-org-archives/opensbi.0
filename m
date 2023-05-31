From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 31 May 2023 14:34:45 +0200
Subject: [PATCH 05/17] lib: sbi: Use heap for root domain creation
In-Reply-To: <20230425123230.3943447-6-apatel@ventanamicro.com>
References: <20230425123230.3943447-1-apatel@ventanamicro.com>
 <20230425123230.3943447-6-apatel@ventanamicro.com>
Message-ID: <20230531-c045505d5054b4d40f80c9b8@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 25, 2023 at 06:02:18PM +0530, Anup Patel wrote:
> Let's use heap allocation in root domain creation instead of using
> a fixed size global array.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  lib/sbi/sbi_domain.c | 45 +++++++++++++++++++++++++++++++++-----------
>  1 file changed, 34 insertions(+), 11 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

