From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 31 May 2023 15:03:56 +0200
Subject: [PATCH 13/17] lib: utils/ipi: Use scratch space to save per-HART
 MSWI pointer
In-Reply-To: <20230425123230.3943447-14-apatel@ventanamicro.com>
References: <20230425123230.3943447-1-apatel@ventanamicro.com>
 <20230425123230.3943447-14-apatel@ventanamicro.com>
Message-ID: <20230531-04ff3aca4f5f6a0c97964088@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 25, 2023 at 06:02:26PM +0530, Anup Patel wrote:
> Instead of using a global array indexed by hartid, we should use
> scratch space to save per-HART MSWI pointer.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  lib/utils/ipi/aclint_mswi.c | 49 +++++++++++++++++++++++++++++--------
>  1 file changed, 39 insertions(+), 10 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

