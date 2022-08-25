From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 25 Aug 2022 10:05:06 +0200
Subject: [PATCH 5/7] lib: sbi_pmu: Add custom PMU device operations
In-Reply-To: <20220825045144.752619-6-apatel@ventanamicro.com>
References: <20220825045144.752619-1-apatel@ventanamicro.com>
 <20220825045144.752619-6-apatel@ventanamicro.com>
Message-ID: <20220825080506.extkgwqoxhmorjrz@kamzik>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 25, 2022 at 10:21:42AM +0530, Anup Patel wrote:
> We extend SBI PMU implementation to allow custom PMU device operations
> which a platform can use for platform specific quirks.
> 
> The custom PMU device operations added by this patch include:
> 1) Operations to allow a platform implement custom firmware events.
>    These custom firmware events can be SBI vendor extension related
>    events or platform specific per-HART events are not possible to
>    count through HPM CSRs.
> 2) Operations to allow a platform implement custom way for enabling
>    (or disabling) an overflow interrupt (e.g. T-Head C9xx).
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  include/sbi/sbi_pmu.h |  57 ++++++++++++++++++++++
>  lib/sbi/sbi_pmu.c     | 108 ++++++++++++++++++++++++++++++++++--------
>  2 files changed, 144 insertions(+), 21 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

