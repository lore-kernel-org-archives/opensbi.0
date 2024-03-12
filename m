From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue, 12 Mar 2024 11:56:32 -0500
Subject: [PATCH v2 08/10] lib: sbi: Remove regs parameter from trap irq
 handling functions
In-Reply-To: <20240312102804.1436376-9-apatel@ventanamicro.com>
References: <20240312102804.1436376-1-apatel@ventanamicro.com>
 <20240312102804.1436376-9-apatel@ventanamicro.com>
Message-ID: <a3baa558-8272-48c2-b21f-9fc4087338ab@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2024-03-12 5:28 AM, Anup Patel wrote:
> The trap irq handling functions no longer require regs parameter
> so remove it.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  lib/sbi/sbi_trap.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


