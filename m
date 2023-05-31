From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 31 May 2023 14:32:24 +0200
Subject: [PATCH 04/17] lib: sbi_pmu: Use heap for per-HART PMU state
In-Reply-To: <20230425123230.3943447-5-apatel@ventanamicro.com>
References: <20230425123230.3943447-1-apatel@ventanamicro.com>
 <20230425123230.3943447-5-apatel@ventanamicro.com>
Message-ID: <20230531-6ff0ad7f193cee898492bc3e@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 25, 2023 at 06:02:17PM +0530, Anup Patel wrote:
> Instead of using a global array for per-HART PMU state, we should
> use heap to on-demand allocate per-HART PMU state when the HART
> is initialized in cold boot or warm boot path.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  lib/sbi/sbi_pmu.c | 221 ++++++++++++++++++++++++++++------------------
>  1 file changed, 133 insertions(+), 88 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

