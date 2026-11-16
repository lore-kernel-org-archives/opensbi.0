Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217F6606A31C
	for <opensbi@archiver.kernel.org>; Mon, 16 Nov 2026 15:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C/JM0wEG;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=TtX4txIg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8NQxcU9WIkJF4mYVOzLt97pwJnMt1BUc37gjVWxORyA=; b=C/JM0wEGKxPArSPYSyInvcPFDj
	/OBmTaWj8n7w1M2BtRcF0rcnBhWb4+yxn3/5lU+/5RldLU2230V3wsOq18J7G/0w4jLq0Unv/ZQDx
	j9Z22+lMcL1lnaadKA3dPoGYIlrEuVjiugS7KqVWJdTLpo+EiuH+7C5bVby+MtN2IACV5Xdvs6XmH
	1FU/TDBRaOLRMrgez7V8h2+2+Lb5ghgGLirWWeHVHNZ075rqmW9P+fZnWYcQFcDFdrVYAw8kJPIR/
	dyfTAjl7jPItan6nXCM0TNoD60DR+7mgJMyFq/jWz1Cmoz5VC/YQKKXJpcXlnGSzowh9oyclXcuYC
	Hz7/IdSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyHc-00000002zIZ-3njq;
	Mon, 16 Nov 2026 15:06:12 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyHZ-00000002zHP-1PCy
	for opensbi@lists.infradead.org;
	Mon, 16 Nov 2026 15:06:11 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-4ad60ec5eaaso3626475fac.0
        for <opensbi@lists.infradead.org>; Mon, 16 Nov 2026 07:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1794841568; x=1795446368; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=INarFEoRRdTgZYKhhlNrw6zVTMxTqzDjCoy4wES49hE=;
        b=TtX4txIgyWEyGjnEyWObZnPeTYKFODY6zgnMDfG00BUxUOB6859qIeoBF9OiCzeiiI
         W8s6KKmoL+hTmiHz0K6IMKMeOCLBLtTp9IR0ywA1+m3iPjNk6tlFpZzpXHRsbvqQcyAC
         nZWR25Ac80y7e0eoF4yTkZ6csk3ThpmeR+b/O6dUTg20GuX56o7WKbK6FL2u9HnU6joK
         s86PbN+Pw1S0DNtFu0eaW6c9WAeU9BXRTXIeqD3GbGDyYiLKsEdWp5NMf3ma95opZKwx
         ZvxuBAZkb0WRkY2XNyCbAGQi2magr+lku+WvqW1xKjO60D7qqtmWufaFl/CEiihjdhHM
         7JGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841568; x=1795446368;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=INarFEoRRdTgZYKhhlNrw6zVTMxTqzDjCoy4wES49hE=;
        b=zXN/MX1tve2Nnox1Z0CPFb2K9eCyhY3YjNxw4lUnPF9kDI4FNErC/aJNDJRjLoT0iI
         axAL2Aja9Qoto1NEIKXz3qrSH5ldZh7uBwZYcws+1jh3Kygg6dP224Nb+cE+TOKeGWQc
         Uiy+2upUxpRVFjcGiREXVLEqnLACpbcGuyDxOyqMXtzA8o6QnTEK7Ov5eGQlnDPa/kAB
         yxtdlKQz7G4xn9ikcMcexdPV7eCFs/y0f/KfP8+ajdGb8sRYQZCAuyb/patrsfxyTR/y
         6fesz1FIFpVqDHGKeh1nysV+VxYX6KMSsCpcPRXSlrRDZGOg/FGhXUN9s7E+ochZRNmj
         oYeQ==
X-Gm-Message-State: APuU4Z9/SBnMCeNc0VzefbyDxJOSkGgG6tsiZRH69t9BrK8oI9PRBUD9
	7KTvwKwJGx2JyH7kpElXF5jIYBrfa3pP8N373tVWaLMyRUv06rw0pggnNQEvxlnKDJ2sZ30Fv/k
	JwFFyWIM=
X-Gm-Gg: AYBFou1sQQy5aX2r8ySsSs8gEnOHb1bzlQjNYTK8IXzcr1SfxPjBBSHSoo2VzJaLWYD
	roqo8O7KBFBmbdKvvfObiitzZhkw9S+27AEmEv7g5DyeYoE3ieH7SAM8D8nCTolKXvLyqtFQdF3
	vDXoTDtTQqvZePPbVTQR4ilFwk5Nhgi04ydArM8F/gZkI4AuZosnqcPSk8YtJA/nJpagQ4Wq3Th
	dPjJXX+y5BH97O5sePNrBtWvLew8mwy4OKnvcPUviVNyHWHMhAUtBc9V8fxCWg2pmPi3laIOyss
	gZjZ5Dn6DDHgWSRiHiNpP8wdMlNs0f784jQHLOxQsnu/84jLstdxJDGMZNY8FGO6Xqs1nG521Vf
	SRRkaHDTplAtG8mmtS+6IQ3zG4t45RE20Am+XV0bbii8pjznvjpAxRERX5vaQXkiTEIzigFI4Rg
	tVoBL/jDefgRiQDawysmvO5w5rs14zLYarJliuC4d2eBlf96zkIemZEWtIWmERx4kUy4rd5hpxh
	5GWy6571M594EalgEdoNtqY/xmYgAt4ihhBVYWo5CToE1B56Yirsm+3NS8JSt7i4GXAvYas0dKc
	BLX+tCcbkfKTp89b4X5glxFQLUgnkfc4X2o1LhpvYljqdFhs+EY=
X-Received: by 2002:a05:6870:c2a7:b0:4ae:2a8c:e9b9 with SMTP id 586e51a60fabf-4ae64250a47mr8139299fac.26.1794841567516;
        Mon, 16 Nov 2026 07:06:07 -0800 (PST)
Received: from [100.64.0.1] ([198.14.89.43])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe2011c25sm6930596fac.2.2026.11.16.07.06.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 07:06:06 -0800 (PST)
Message-ID: <4425d551-1518-4a53-9a4b-a5c7d38d9bd0@sifive.com>
Date: Mon, 16 Nov 2026 09:06:03 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] lib: sbi_ipi: Protect the IPI device list with a
 read-write lock
To: Nickolai Zeldovich <nickolai@csail.mit.edu>,
 Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org
References: <20261006193630.735611-1-nickolai@csail.mit.edu>
 <20261116135623.52061-1-nickolai@csail.mit.edu>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20261116135623.52061-1-nickolai@csail.mit.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_070609_407846_1405FA35 
X-CRM114-Status: GOOD (  28.03  )
X-Spam-Score: -2.1 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-16 7:56 AM, Nickolai Zeldovich wrote:
> The cold boot hart wakes the other harts before it registers the IPI
> devices, and each woken hart walks ipi_dev_node_list in
> sbi_ipi_raw_clear(true) while sbi_ipi_add_device() may be inserting
> into it. Nothing orders the walk against the insertion, so a hart can
> follow a new node before its contents are visible and call through a
> NULL entry->dev.

This is a more fundamental issue, not just with the IPI device list. Effectively
none of the cold boot code is written with synchronization in mind, and
functions like sbi_hsm_hart_wait() and sbi_ipi_raw_clear() can call into
arbitrary platform code (think timer or irqchip drivers), so any driver
subsystem could have a race here. I think the only robust solution is to move
wake_coldboot_harts() to the very end of the coldboot process, so secondary
harts never see a partially-initialized state.

The tiny bit of parallelism gained by releasing the secondary harts early is not
worth complicating runtime code paths with locking. And on platforms that leave
secondary harts in reset until the HSM start operation, nothing at all is
gained, because the hart necessarily comes out of reset long after cold boot
completes.

If the slight increase in boot time on platforms that release all harts in
parallel is a concern, we can refactor the code to have the boot hart 1) run the
cold boot process _excluding_ the local warm boot operations, 2) release the
secondary harts, and then 3) call init_warm_startup(). This refactoring
direction is additionally useful because it cleanly separates out code that is
used for cold boot only, and those bytes can be reclaimed as additional
stack/heap memory (cf. Linux __init).

Regards,
Samuel

> Take the write lock around the insertion and the read lock around the
> all-devices walks in sbi_ipi_raw_clear() and sbi_ipi_raw_send().
> 
> Fixes: ee92afa63892 ("lib: sbi: Introduce IPI device rating")
> Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
> ---
> 
> Notes:
>     Changes in v2:
>     - Protect the list with a read-write lock instead of smp_wmb()/smp_rmb()
>       and an open-coded list insertion (Anup).
>     - New subject (v1: "lib: sbi: Order the publication of IPI device
>       nodes"); added the Fixes tag.
>     
>     Depends on "lib: sbi: Add read-write locks", sent separately.
>     
>     v1: https://lore.kernel.org/r/20261006193630.735611-1-nickolai@csail.mit.edu
>     
>     Tested on QEMU virt with 8 harts, with ACLINT and with AIA (IMSIC)
>     IPIs: Linux brings up all harts.
>     
>     This patch was written with the assistance of an AI agent.
> 
>  lib/sbi/sbi_ipi.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
> index b04a5877..756baab0 100644
> --- a/lib/sbi/sbi_ipi.c
> +++ b/lib/sbi/sbi_ipi.c
> @@ -11,6 +11,7 @@
>  #include <sbi/riscv_asm.h>
>  #include <sbi/riscv_atomic.h>
>  #include <sbi/riscv_barrier.h>
> +#include <sbi/riscv_locks.h>
>  #include <sbi/sbi_bitops.h>
>  #include <sbi/sbi_domain.h>
>  #include <sbi/sbi_error.h>
> @@ -41,7 +42,9 @@ struct sbi_ipi_device_node {
>  
>  static unsigned long ipi_data_off;
>  static const struct sbi_ipi_device *ipi_dev = NULL;
> -static SBI_LIST_HEAD(ipi_dev_node_list);
> +static rwlock_t ipi_dev_node_lock = RW_LOCK_INITIALIZER;
> +static struct sbi_dlist ipi_dev_node_list GUARDED_BY(&ipi_dev_node_lock) =
> +	SBI_LIST_HEAD_INIT(ipi_dev_node_list);
>  static const struct sbi_ipi_event_ops *ipi_ops_array[SBI_IPI_EVENT_MAX];
>  
>  static int sbi_ipi_send(struct sbi_scratch *scratch, u32 remote_hartindex,
> @@ -297,10 +300,12 @@ int sbi_ipi_raw_send(u32 hartindex, bool all_devices)
>  	wmb();
>  
>  	if (all_devices) {
> +		read_lock(&ipi_dev_node_lock);
>  		sbi_list_for_each_entry(entry, &ipi_dev_node_list, head) {
>  			if (entry->dev->ipi_send)
>  				entry->dev->ipi_send(hartindex);
>  		}
> +		read_unlock(&ipi_dev_node_lock);
>  	} else {
>  		ipi_dev->ipi_send(hartindex);
>  	}
> @@ -313,10 +318,12 @@ void sbi_ipi_raw_clear(bool all_devices)
>  	struct sbi_ipi_device_node *entry;
>  
>  	if (all_devices) {
> +		read_lock(&ipi_dev_node_lock);
>  		sbi_list_for_each_entry(entry, &ipi_dev_node_list, head) {
>  			if (entry->dev->ipi_clear)
>  				entry->dev->ipi_clear();
>  		}
> +		read_unlock(&ipi_dev_node_lock);
>  	} else {
>  		if (ipi_dev && ipi_dev->ipi_clear)
>  			ipi_dev->ipi_clear();
> @@ -351,7 +358,9 @@ void sbi_ipi_add_device(const struct sbi_ipi_device *dev)
>  		return;
>  	SBI_INIT_LIST_HEAD(&entry->head);
>  	entry->dev = dev;
> +	write_lock(&ipi_dev_node_lock);
>  	sbi_list_add_tail(&entry->head, &ipi_dev_node_list);
> +	write_unlock(&ipi_dev_node_lock);
>  
>  	if (!ipi_dev || ipi_dev->rating < dev->rating)
>  		ipi_dev = dev;
> 
> base-commit: ed70256dd22c09962d146e433834239825ef0616
> prerequisite-patch-id: 3f219b25b93a055133df65f70c1671f3df0514b7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
