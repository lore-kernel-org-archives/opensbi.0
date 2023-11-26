From: Anup Patel <anup@brainfault.org>
Date: Sun, 26 Nov 2023 18:48:39 +0530
Subject: [PATCH 0/2] Allow relaxed MMIO writes in device IPI callbacks
In-Reply-To: <20231121161711.904674-1-apatel@ventanamicro.com>
References: <20231121161711.904674-1-apatel@ventanamicro.com>
Message-ID: <CAAhSdy0zbmfYgKw+gNw5CLJOyUWHE5SDEiDiMAt5xKqn6V3B1g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 21, 2023 at 9:48?PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> This series improves the barrier usage around device IPI callbacks
> such that platform IPI driver can now use relaxed MMIO writes in
> device IPI callbacks.
>
> These patches can also be found in the sbi_ipi_barrier_imp_v1 branch
> at: https://github.com/avpatel/opensbi.git
>
> Anup Patel (2):
>   lib: sbi: Allow relaxed MMIO writes in device ipi_send() callback
>   lib: sbi: Allow relaxed MMIO writes in device ipi_clear() callback

Applied this series to the riscv/opensbi repo.

Regards,
Anup

>
>  lib/sbi/sbi_ipi.c           | 31 +++++++++++++++++++++++++------
>  lib/utils/ipi/aclint_mswi.c |  4 ++--
>  lib/utils/irqchip/imsic.c   |  4 ++--
>  3 files changed, 29 insertions(+), 10 deletions(-)
>
> --
> 2.34.1
>

