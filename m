From: Xiang W <wxjstz@126.com>
Date: Mon, 11 Dec 2023 15:24:08 +0800
Subject: [PATCH 2/3] lib: sbi_ipi: Process self-IPIs in sbi_ipi_send()
In-Reply-To: <20231208212301.3649930-3-samuel.holland@sifive.com>
References: <20231208212301.3649930-1-samuel.holland@sifive.com>
	 <20231208212301.3649930-3-samuel.holland@sifive.com>
Message-ID: <5aafcddbf5b44c626f7514df33f61dad6a34511d.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2023-12-08???? 13:22 -0800?Samuel Holland???
> An IPI sent to the local hart can be processed directly instead of
> triggering the IPI device. This is more efficient, and it avoids a
> deadlock when the .sync callback is defined. Since interrupts are
> disabled while handling an ecall, the IPI would not get delivered
> until the next mret, but sbi_ipi_sync() is called before then.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> 
> ?lib/sbi/sbi_ipi.c | 8 ++++++++
> ?1 file changed, 8 insertions(+)
> 
> diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
> index 1fd24228..ac31cd94 100644
> --- a/lib/sbi/sbi_ipi.c
> +++ b/lib/sbi/sbi_ipi.c
> @@ -60,6 +60,14 @@ static int sbi_ipi_send(struct sbi_scratch *scratch, u32 remote_hartindex,
> ?				????? remote_hartindex, data);
> ?		if (ret != SBI_IPI_UPDATE_SUCCESS)
> ?			return ret;
> +	} else if (scratch == remote_scratch) {
> +		/*
> +		 * IPI events with an update() callback are expected to return
> +		 * SBI_IPI_UPDATE_BREAK for self-IPIs. For other events, check
> +		 * for self-IPI and execute the callback directly here.
> +		 */
> +		ipi_ops->process(scratch);
> +		return 0;
This modification will affect sbi_tlb.c. tlb_update has already called
tinfo->local_fn(tinfo) when returning SBI_IPI_UPDATE_BREAK. And the?
synchronization variable is only updated when SBI_IPI_UPDATE_SUCCESS is?
returned. If tlb_process is called, the synchronization variable will be?
affected.

Regards,
Xiang W

> ?	}
> ?
> ?	/*
> -- 
> 2.42.0
> 
> 


