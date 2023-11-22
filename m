From: Bo Gan <ganboing@gmail.com>
Date: Tue, 21 Nov 2023 16:44:59 -0800
Subject: [PATCH 0/2] Allow relaxed MMIO writes in device IPI callbacks
In-Reply-To: <20231121161711.904674-1-apatel@ventanamicro.com>
References: <20231121161711.904674-1-apatel@ventanamicro.com>
Message-ID: <ec81a8a5-f6e7-1301-d3ac-5bb3b09e4ab6@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/21/23 8:17 AM, Anup Patel wrote:
> This series improves the barrier usage around device IPI callbacks
> such that platform IPI driver can now use relaxed MMIO writes in
> device IPI callbacks.
> 
> These patches can also be found in the sbi_ipi_barrier_imp_v1 branch
> at: https://github.com/avpatel/opensbi.git
> 
> Anup Patel (2):
>    lib: sbi: Allow relaxed MMIO writes in device ipi_send() callback
>    lib: sbi: Allow relaxed MMIO writes in device ipi_clear() callback
> 
>   lib/sbi/sbi_ipi.c           | 31 +++++++++++++++++++++++++------
>   lib/utils/ipi/aclint_mswi.c |  4 ++--
>   lib/utils/irqchip/imsic.c   |  4 ++--
>   3 files changed, 29 insertions(+), 10 deletions(-)
> 
Hi Anup,

Thank you so much for fixing this. I hope my previous discussion helped.
Would you mind having a Reported-by: Bo Gan <ganboing@gmail.com> ?
Really appreciate you helping me understand the code.

Bo

