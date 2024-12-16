From: Samuel Holland <samuel.holland@sifive.com>
Date: Mon, 16 Dec 2024 15:56:04 -0600
Subject: [PATCH v4 5/5] lib: sbi: pmu: add the PMU SSE event only if
 overflow IRQ is supported
In-Reply-To: <20241216212144.3379890-6-cleger@rivosinc.com>
References: <20241216212144.3379890-1-cleger@rivosinc.com>
 <20241216212144.3379890-6-cleger@rivosinc.com>
Message-ID: <468325bf-df89-4b19-8c83-d620155aa364@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2024-12-16 3:21 PM, Cl?ment L?ger wrote:
> Add the PMU SSE event only if an overflow irq bit is present.
> 
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
> ---
>  lib/sbi/sbi_pmu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


