From: Samuel Holland <samuel.holland@sifive.com>
Date: Thu, 13 Feb 2025 16:59:32 -0600
Subject: [PATCH] lib: sbi: sse: fix invalid errors returned for
 sse_hart_mask/unmask()
In-Reply-To: <20250213092507.735642-1-cleger@rivosinc.com>
References: <20250213092507.735642-1-cleger@rivosinc.com>
Message-ID: <adeaabf2-6480-43e2-afca-8d6434c6224f@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2025-02-13 3:25 AM, Cl?ment L?ger wrote:
> When called twice, sse_hart_mask()/sse_hart_unmask() should return
> SBI_EALREADY_STOPPED/SBI_EALREADY_STARTED. This was currently inverted.
> 
> Fixes: b919daf49582 ("lib: sbi: Add support to mask/unmask SSE events")
> Reported-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
> ---
>  lib/sbi/sbi_sse.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


