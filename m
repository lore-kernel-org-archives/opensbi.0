From: Xiang W <wxjstz@126.com>
Date: Tue, 05 Dec 2023 13:19:16 +0800
Subject: [RFC PATCH 2/2] lib: sbi: add support for Supervisor Software
 Events extension
In-Reply-To: <20231130091319.1223849-3-cleger@rivosinc.com>
References: <20231130091319.1223849-1-cleger@rivosinc.com>
	 <20231130091319.1223849-3-cleger@rivosinc.com>
Message-ID: <b75f06c8451fb9948d6f5c9831ca5e0f6e498ca5.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2023-11-30???? 10:13 +0100?Cl?ment L?ger???
> This extension [1] allows to deliver events from SBI to supervisor via a
> software mecanism. This extensions defines events (either local or
> global) which are signaled by the SBI on specific signal sources (IRQ,
> traps, etc) and are injected to be executed in supervisor mode.
> 
> [1] https://lists.riscv.org/g/tech-prs/message/515
> 
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
> ---
> 
> +struct sbi_sse_cb_ops {
> +	/**
> +	 * Called when hart_id is changed on the event.
> +	 */
> +	void (*set_hartid_cb)(uint32_t event_id, unsigned long hart_id);
> +
Maybe should add a callback before running. This callback can be used to?
access sensitive resources, such as keys.

> +	/**
> +	 * Called when the SBI_EXT_SSE_COMPLETE is invoked on the event.
> +	 */
> +	void (*complete_cb)(uint32_t event_id);
> +
> +	/**
> +	 * Called when the SBI_EXT_SSE_REGISTER is invoked on the event.
> +	 */
> +	void (*register_cb)(uint32_t event_id);
> +
> +	/**
> +	 * Called when the SBI_EXT_SSE_UNREGISTER is invoked on the event.
> +	 */
> +	void (*unregister_cb)(uint32_t event_id);
> +};
> +
> 
> +static void sse_event_set_state(struct sbi_sse_event *e,
> +				enum sbi_sse_state new_state)
> +{
> +	enum sbi_sse_state prev_state = e->state;
> +
> +	e->state = new_state;
Do not change before checking.
> +	switch (new_state) {
> +		case SSE_STATE_UNUSED:
> +			if (prev_state == SSE_STATE_REGISTERED)
> +				return;
> +		break;
> +		case SSE_STATE_REGISTERED:
> +			if (prev_state == SSE_STATE_UNUSED ||
> +			??? prev_state == SSE_STATE_ENABLED) {
> +				return;
> +			}
> +		break;
> +		case SSE_STATE_ENABLED:
> +			if (prev_state == SSE_STATE_REGISTERED ||
> +			??? prev_state == SSE_STATE_RUNNING)
> +				return;
> +		break;
> +		case SSE_STATE_RUNNING:
> +			if (prev_state == SSE_STATE_ENABLED)
> +				return;
> +		break;
> +	}
This state machine is characterized by the difference between the old and new
states being 1. So the code can be simplified as follows:

	if ((new_state - prev_state == 1) || (prev_state - new_state == 1)) {
		e->state = new_state;
		return;
	}

> +
> +	sbi_panic("Invalid SSE state transition: %d -> %d\n", prev_state,
> +		? new_state);
> +}
> +
> 
> +
> +static int sse_event_set_hart_id(struct sbi_sse_event *e, uint32_t event_id,
> +				 unsigned long new_hartid)
> +{
> +	int hstate;
> +	unsigned int hartid = (uint32_t) new_hartid;
> +	struct sbi_domain * hd = sbi_domain_thishart_ptr();
> +
> +	if (!sse_event_is_global(e))
> +		return SBI_EDENIED;
> +
> +	if (e->state == SSE_STATE_RUNNING)
> +		return SBI_EBUSY;
> +
> +	if (!sbi_domain_is_assigned_hart(hd, new_hartid))
> +		return SBI_EINVAL;
> +
> +	hstate = sbi_hsm_hart_get_state(hd, hartid);
> +	if (hstate != SBI_HSM_STATE_STARTED)
> +		return SBI_EINVAL;
> +
> +	if (new_hartid == e->hartid)
> +		return SBI_OK;
> +
> +	if (e->state >= SSE_STATE_ENABLED)
> +		sse_event_remove_from_list(e);
> +
> +	e->hartid = hartid;
> +
> +	if (e->cb_ops && e->cb_ops->set_hartid_cb)
> +		 e->cb_ops->set_hartid_cb(event_id, e->hartid);
> +
> +	if (e->state >= SSE_STATE_ENABLED)
> +		sse_event_add_to_list(e);
> +
> +	if (e->pending)
> +		sbi_ipi_send_many(BIT(e->hartid), 0, sse_ipi_inject_event, NULL);
hartid can't big then XLEN. change to:
		sbi_ipi_send_many(1, e->hartid, sse_ipi_inject_event, NULL);
> +
> +	return 0;
> +}
> +
> 
> +
> +static int sse_ipi_inject_send(unsigned long hartid, uint32_t event_id)
> +{
> +	int ret;
> +	struct sbi_scratch *remote_scratch = NULL;
> +	struct sse_ipi_inject_data evt = {event_id};
> +	struct sbi_fifo *sse_inject_fifo_r;
> +
> +	remote_scratch = sbi_hartid_to_scratch(hartid);
> +	if (!remote_scratch)
> +		return SBI_EINVAL;
> +	sse_inject_fifo_r = sbi_scratch_offset_ptr(remote_scratch,
> +						?? sse_inject_fifo_off);
> +
> +	ret = sbi_fifo_enqueue(sse_inject_fifo_r, &evt);
> +	if (ret)
> +		return SBI_EFAIL;
> +
> +	ret = sbi_ipi_send_many(BIT(hartid), 0, sse_ipi_inject_event, NULL);
hartid can't big then XLEN. change to:
	ret = sbi_ipi_send_many(1, hartid, sse_ipi_inject_event, NULL);
> +	if (ret)
> +		return SBI_EFAIL;
> +
> +	return SBI_OK;
> +}
> +
> 
> +}
> -- 
> 2.42.0
> 
> 
Regards,
Xiang W


