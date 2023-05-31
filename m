From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 31 May 2023 14:20:00 +0200
Subject: [PATCH 03/17] lib: sbi: Print scratch size and usage at boot time
In-Reply-To: <20230425123230.3943447-4-apatel@ventanamicro.com>
References: <20230425123230.3943447-1-apatel@ventanamicro.com>
 <20230425123230.3943447-4-apatel@ventanamicro.com>
Message-ID: <20230531-2abe55044a422e5a68e420d5@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 25, 2023 at 06:02:16PM +0530, Anup Patel wrote:
> The scratch space being a scarce resource so let us print it's
> size and usage at boot time.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  include/sbi/sbi_scratch.h |  3 +++
>  lib/sbi/sbi_init.c        |  5 +++++
>  lib/sbi/sbi_scratch.c     | 11 +++++++++++
>  3 files changed, 19 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

