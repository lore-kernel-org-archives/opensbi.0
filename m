From: Samuel Holland <samuel.holland@sifive.com>
Date: Sun, 19 Jan 2025 17:00:35 -0600
Subject: [PATCH 04/12] lib: sbi: Fix capability bit assignment in MPXY
 framework
In-Reply-To: <20250116155651.103782-5-apatel@ventanamicro.com>
References: <20250116155651.103782-1-apatel@ventanamicro.com>
 <20250116155651.103782-5-apatel@ventanamicro.com>
Message-ID: <94dce126-205a-45a0-8594-e524f92a2785@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2025-01-16 9:56 AM, Anup Patel wrote:
> The capability bit assignment in MPXY framework does not match the
> SBI MPXY extension in latest SBI specification so update it.
> 
> Fixes: 7939bf1329eb ("lib: sbi: Add SBI Message Proxy (MPXY) framework")
> Signed-off-by: Anup patel <apatel@ventanamicro.com>
> ---
>  lib/sbi/sbi_mpxy.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


