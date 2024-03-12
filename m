From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue, 12 Mar 2024 11:56:22 -0500
Subject: [PATCH v2 07/10] lib: sbi: Remove regs paramter of
 sbi_irqchip_process()
In-Reply-To: <20240312102804.1436376-8-apatel@ventanamicro.com>
References: <20240312102804.1436376-1-apatel@ventanamicro.com>
 <20240312102804.1436376-8-apatel@ventanamicro.com>
Message-ID: <bea73c9f-393d-49fc-9464-913066b3e10d@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2024-03-12 5:28 AM, Anup Patel wrote:
> The irqchip handlers will typically not need pointer to trap registers
> so remove regs paramter of sbi_irqchip_process().
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  include/sbi/sbi_irqchip.h |  5 ++---
>  lib/sbi/sbi_irqchip.c     | 10 +++++-----
>  lib/sbi/sbi_trap.c        |  4 ++--
>  lib/utils/irqchip/imsic.c |  2 +-
>  4 files changed, 10 insertions(+), 11 deletions(-)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


