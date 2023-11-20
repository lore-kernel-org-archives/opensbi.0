From: Xiang W <wxjstz@126.com>
Date: Mon, 20 Nov 2023 17:57:52 +0800
Subject: [PATCH 2/2] lib: sbi: Make ipi send/clear and access ipi_type
 non-reentrant
In-Reply-To: <20231120095301.105772-2-wxjstz@126.com>
References: <20231120095301.105772-1-wxjstz@126.com>
	 <20231120095301.105772-2-wxjstz@126.com>
Message-ID: <3f1751b2c8b0437e72543e2d25f8ef6ae40512fe.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2023-11-20???? 17:52 +0800?Xiang W???
> Sending/receiving ipi messages and setting ipi_type should be
> non-reentrant. If reentrant, unexpected errors may occur.
If reentrant, the following case may occur:

                hart A             hart B
send ipi--------->|                  |
                  | clear ipi        | 
                  |                  | set ipi_type
                  |                  |
                  | xchg ipi_type    |
                  |                  |
                  |<-----------------| send ipi
                  |                  |
                  |                  |

For more discussion, please refer to
https://lists.infradead.org/pipermail/opensbi/2023-November/005817.html

Regards,
Xiang W
> 
> Signed-off-by: Xiang W <wxjstz@126.com>
> Reported-by: Bo Gan <ganboing@gmail.com>
> ---
> ?lib/sbi/sbi_ipi.c | 9 +++++++++
> ?1 file changed, 9 insertions(+)
> 
> diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
> index 30cb315..8e05d28 100644
> --- a/lib/sbi/sbi_ipi.c
> +++ b/lib/sbi/sbi_ipi.c
> @@ -11,6 +11,7 @@
> ?#include <sbi/riscv_asm.h>
> ?#include <sbi/riscv_atomic.h>
> ?#include <sbi/riscv_barrier.h>
> +#include <sbi/riscv_locks.h>
> ?#include <sbi/sbi_bitops.h>
> ?#include <sbi/sbi_domain.h>
> ?#include <sbi/sbi_error.h>
> @@ -25,6 +26,7 @@
> ?
> ?struct sbi_ipi_data {
> ?	unsigned long ipi_type;
> +	spinlock_t lock;
> ?};
> ?
> ?_Static_assert(
> @@ -66,9 +68,11 @@ static int sbi_ipi_send(struct sbi_scratch *scratch, u32 remote_hartindex,
> ?	 * Set IPI type on remote hart's scratch area and
> ?	 * trigger the interrupt
> ?	 */
> +	spin_lock(&ipi_data->lock);
> ?	atomic_raw_set_bit(event, &ipi_data->ipi_type);
> ?	smp_wmb();
> ?	sbi_ipi_raw_send(remote_hartindex);
> +	spin_unlock(&ipi_data->lock);
> ?
> ?	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_IPI_SENT);
> ?
> @@ -220,8 +224,12 @@ void sbi_ipi_process(void)
> ?	u32 hartindex = sbi_hartid_to_hartindex(current_hartid());
> ?
> ?	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_IPI_RECVD);
> +
> +	spin_lock(&ipi_data->lock);
> ?	sbi_ipi_raw_clear(hartindex);
> ?	ipi_type = atomic_raw_xchg_ulong(&ipi_data->ipi_type, 0);
> +	spin_unlock(&ipi_data->lock);
> +
> ?	ipi_event = 0;
> ?	while (ipi_type) {
> ?		if (ipi_type & 1UL) {
> @@ -289,6 +297,7 @@ int sbi_ipi_init(struct sbi_scratch *scratch, bool cold_boot)
> ?
> ?	ipi_data = sbi_scratch_offset_ptr(scratch, ipi_data_off);
> ?	ipi_data->ipi_type = 0x00;
> +	SPIN_LOCK_INIT(ipi_data->lock);
> ?
> ?	/*
> ?	 * Initialize platform IPI support. This will also clear any


