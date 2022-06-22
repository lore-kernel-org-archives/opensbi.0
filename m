From: Samuel Holland <samuel@sholland.org>
Date: Tue, 21 Jun 2022 23:59:23 -0500
Subject: [PATCH] lib: irqchip/plic: fix typo in plic_warm_irqchip_init
In-Reply-To: <20220621120739.422990-1-jan.remes@codasip.com>
References: <20220621120739.422990-1-jan.remes@codasip.com>
Message-ID: <7472a47d-be9e-b7c1-a3c1-1e2fde2e835d@sholland.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 6/21/22 7:07 AM, Jan Remes wrote:
> The second invocation of plic_context_init() incorrectly calls the
> function with m_cntx_id instead of s_cntx_id. This breaks systems which
> only have 1 external interrupt per hart.
> 
> Fixes: 8c362e7 ("lib: irqchip/plic: Factor out a context init function")
> Signed-off-by: Jan Remes <jan.remes@codasip.com>

Reviewed-by: Samuel Holland <samuel@sholland.org>

