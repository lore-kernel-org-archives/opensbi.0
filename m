From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 31 May 2023 15:06:11 +0200
Subject: [PATCH 14/17] lib: utils/timer: Use scratch space to save
 per-HART MTIMER pointer
In-Reply-To: <20230425123230.3943447-15-apatel@ventanamicro.com>
References: <20230425123230.3943447-1-apatel@ventanamicro.com>
 <20230425123230.3943447-15-apatel@ventanamicro.com>
Message-ID: <20230531-5869d73f83854598ffa8a440@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 25, 2023 at 06:02:27PM +0530, Anup Patel wrote:
> Instead of using a global array indexed by hartid, we should use
> scratch space to save per-HART MTIMER pointer.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  lib/utils/timer/aclint_mtimer.c | 82 +++++++++++++++++++++++++++------
>  1 file changed, 67 insertions(+), 15 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

