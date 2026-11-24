Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBBB606A31E
	for <opensbi@archiver.kernel.org>; Tue, 24 Nov 2026 08:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rcWUzXFu;
	dkim=fail reason="signature verification failed" (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=HoJSOqQw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yGNd0/daWjnwCRU5MJMPb0iqRz63Mj8guxmcZl1vsLg=; b=rcWUzXFuUuZU4QBclphMENOEcq
	0nRhzWgImW7Gfe2dUfUQ/6rGVlu6Rpbs0yWdlGko6a/UsFGEYV6EV2b6PO182AjBYYwTBvuFA2uEJ
	WvMeWX97Xg+dz5EBYeD6zkMWHeY/AX+ahtwL86HF9UsPXd0ZX1BdIS+hqdDz3dz5uXXbYhXsACWnd
	Z3Qwe2nCInvZIvxrqhFAsdUhmj8KG1WXk5Rux+4lrtBy4LbpCS2R821qGPyhq5K32EddZ+lgBxD5A
	3S2U0xdNIKmKqLUMFkl4qYEAhDEZueTrtqB0JD3LrQKZ9axP0aIpcqcQQQ7GUQlxiPQP0DNWVZKUd
	6tbW1daA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVlrc-00000005syi-1ta3;
	Tue, 24 Nov 2026 08:26:56 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVlrY-00000005sy7-04OZ
	for opensbi@lists.infradead.org;
	Tue, 24 Nov 2026 08:26:54 +0000
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 270FA3F4C8
	for <opensbi@lists.infradead.org>; Tue, 24 Nov 2026 08:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1795508808;
	bh=BAjZA0WXKuTuPaEOpElDdlYaCuJkAWxOOfGzUnKDdQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=HoJSOqQwW/Yp3xHSVLiKFE0/21XvMVnz+UqXqJKK+hQdgpUCV4ynhIhB5buJ03ApV
	 sFLhpNd0GzctRWyOtVLUmBVJuwv9WBm2p2DJOfrzag6sJ7yJmS/fL9U8NPumJKW1EQ
	 PaRG7JvGcFwid/9rySswbUco38L217gXl+iqksBiPL49GVjKmyyc7It9JN9QoC6tiA
	 a7pfFk6pMDFvUfxIqM6C+AKbgLnixggKne7FYswg3Jejoe9u3TAfBAJKXlus9dv1Yk
	 +Pr5Yg9GXzGkodgwhVLty+2LrnHE19hyEWVQM0z4DSa2no5DjTfbr13K9WREaeFEFP
	 j8oWoKlyNUp07pk2qbfGmqS970Mk0a2JicezSOpJp6QRt9zspQ/lQ/o7jUv5AeWudo
	 womEKNIhwxmIYu8neWxsdkU2P26pRHIbVHSYAUmrM2GoTr/BafLqb756T+oBkeWep+
	 yVMwA+Jthnu7oFS8rsYc29M4epYW830epLMnM7T9g6ZVCcFi7L9rSRDPur9c/EKomP
	 b45K7TckIhXti86LZuJpFqrh3VGhL2zlGRsUtsN9NCx00GT+cRMPoJWOnsvbeEydv3
	 Auo2vGQCUyoXZlrVH0l7a62QagHHp8ZIKjQe4sHu3MbySukUT5nCBPXOwby0+nIXlT
	 2ywrc5SwKknuaW9ItFYw4qRc=
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4a7c864000eso2411406f8f.0
        for <opensbi@lists.infradead.org>; Tue, 24 Nov 2026 00:26:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795508808; x=1796113608;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BAjZA0WXKuTuPaEOpElDdlYaCuJkAWxOOfGzUnKDdQo=;
        b=CA6m1XFSQgLgNIbvVz6f5USd5TO6MiKFdusShhvpmCfpQr5rEHqMQHyYpv0UD+5sdB
         8UDtzZ2uigEKvvbHVxRo+Ez5BYSAt9YKhiEm5fj7fNkcfhGolQXTorGOmEVEN2uiWycb
         p2VcbPqsVHCC/BUB5zvLJr/D7A1Xw6mcdqmmK8+a1OzkK7A1Z2fsR/dy6FgVm0SpG6Uk
         TFt0QUyKuuBYWmewiqFoMTvNIXKNT0sZWd/DhinVE+An9bvNXBND8P8jXZ2sj+6p1ShB
         /LOOppvg/LPaQ2FIqZAVl1E2EG57GVNxFTn8l7B34dr52Lk9p8MGgF/4ecXV+TMtpHvG
         uecQ==
X-Forwarded-Encrypted: i=1; AL+hErHLyK3j6aXiM1d1qbq0J0BscC2RIS08y60oQAcCk13QYwOPW33Qs9aNdXLjoT5XEsSSdkcb+0bw@lists.infradead.org
X-Gm-Message-State: APuU4Z92b+46roHz7j+indW623hxWEDMV4P0boUPWSmz2MtIWBP9SCys
	kEBXG8Ft1SWqn+6Pxd/a1Tifke7304Q2ZadfBcSTqFaF4j1L4COcbRtPawrQPFUK4yH3rYsXIJL
	sFivcUj9bvtxWdEf0UY3UucDrsS+5DN1/hDoawQr4DrE18MWjCxAeVrQhQQu6mrSJA3L363aVMu
	ePw/KL+mf1UZtO
X-Gm-Gg: AZFdTZfGeAOTClDohdria01NIojgN6JHvYTazoL+ADTJ/AWsYwSphsQ1KMLP85eu51U
	zH/95lYYxTesBiQ9azooaSZ4HDZ9CReY0mYsfQ09KdmpjhDgW2/3OQReZK2B+NKjiiJTlcP0zsF
	OFaGT8U0EFIc00iO+ULROJKEO04kekymtNQWXk5E8WAJq/QtaCQ5jgfTbDJg2RNZXnm3G3sRxcd
	5RIZBqECULUzrwhGtNmt4kcy8sR7SatIjwrIY2uDHE1r8c4pxPECcWzERYPlQlfPsgdWpmiAshO
	BlL3f4Y3Wyi3bXflvANWg6MYXnBLr5ynoF2WLItOrihfgXtseVdrq7chGMFRCT0KlYcC/GNxGqf
	Z3i5LhRfUQPeAFVfTnaSHgU47gSP4AcAkwV60wxGFDrfceasNerJD3jLSEuYf5zlxaQFBCRvhpJ
	nLaUHrqa3WKfgOvydM/Id5ZacYYEANiPZkpmiuSTYkpvZkb3FHhFM+W8aYwRRXls1pj7xmyxe7
X-Received: by 2002:a05:6000:22ca:b0:487:1662:cf4c with SMTP id ffacd0b85a97d-4abacfea532mr28872938f8f.7.1795508807684;
        Tue, 24 Nov 2026 00:26:47 -0800 (PST)
X-Received: by 2002:a05:6000:22ca:b0:487:1662:cf4c with SMTP id ffacd0b85a97d-4abacfea532mr28872892f8f.7.1795508807221;
        Tue, 24 Nov 2026 00:26:47 -0800 (PST)
Received: from ?IPV6:2a02:908:1242:30e0:1320:e0ed:cbe3:9c71? ([2a02:908:1242:30e0:1320:e0ed:cbe3:9c71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe48sm24398782f8f.23.2026.11.24.00.26.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 00:26:46 -0800 (PST)
Message-ID: <f64743b7-f481-4b59-89b8-3f2f4f6249cb@canonical.com>
Date: Tue, 24 Nov 2026 09:26:45 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] lib: sbi: dbtr: share trigger checks of install and
 update
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 opensbi@lists.infradead.org, liutong <liutong@iscas.ac.cn>
References: <20261120231119.90214-1-heinrich.schuchardt@canonical.com>
 <20261120231119.90214-3-heinrich.schuchardt@canonical.com>
 <awPuSu5ka-wI9eOE@hu-himchau-blr.qualcomm.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <awPuSu5ka-wI9eOE@hu-himchau-blr.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_002652_587036_E4CACFB8 
X-CRM114-Status: GOOD (  38.30  )
X-Spam-Score: -4.4 (----)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-20.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/23/26 08:42, Himanshu Chauhan wrote:
> On Sat, Nov 21, 2026 at 12:11:14AM +0100, Heinrich Schuchardt wrote:
>> sbi_dbtr_install_trig() validates every trigger configuration before it
>> programs any trigger. sbi_dbtr_update_trig() only checked the optional
>> tdata2/tdata3 CSRs and the platform hook. It did not check that the
>> trigger type is supported and it did not reject a tdata1 with the M or
>> DMODE bit set, which install refuses. Supervisor software could
>> therefore update an installed trigger into one that fires in M-mode or
>> that is owned by the debug module.
>>
>> Move the checks of one configuration into dbtr_check_trigger_config()
>> and call it from both functions. The checks and their order are the same
>> as before for install. For update the configuration is additionally
>> checked against the type mask of the trigger that is updated, instead of
>> against any trigger of the hart.
>>
>> The helper reads tdata1, tdata2 and tdata3 from the shared memory once
>> and uses the local copies for all checks.
>>
>> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
>> ---
>>   lib/sbi/sbi_dbtr.c | 114 +++++++++++++++++++++++----------------------
>>   1 file changed, 59 insertions(+), 55 deletions(-)
>>
>> diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
>> index 2108ca9e..53fcb0a2 100644
>> --- a/lib/sbi/sbi_dbtr.c
>> +++ b/lib/sbi/sbi_dbtr.c
>> @@ -682,6 +682,55 @@ int sbi_dbtr_read_trig(unsigned long smode,
>>   	return SBI_SUCCESS;
>>   }
>>   
>> +/*
>> + * Check the configuration of one trigger read from the shared memory.
>> + *
>> + * The same checks apply when a trigger is installed and when it is updated.
>> + *
>> + * @hs:		trigger state of the calling hart
>> + * @trig:	trigger the configuration is meant for (update), or NULL if any
>> + *		trigger of the hart may be used (install)
>> + * @recv:	configuration to check
>> + *
>> + * SBI v3.0 sec 19.4 and 19.5 require SBI_ERR_NOT_SUPPORTED when a trigger
>> + * programs a non-zero value into an unimplemented optional CSR. Only the
>> + * "whole CSR unimplemented" case is caught here; WARL bits tied off inside an
>> + * otherwise-implemented CSR are delegated to the device-specific
>> + * trigger_supported() callback.
>> + */
> 
> You can drop the reference to SBI sections. Mention them in cover letter. The comment
> has been copied from the preivous implementation of the in function check. It is
> neither clear nor approriate to what exactly function is trying to achieve. Please
> take a look and add information pertaining to the function's job.

Hello Himanshu,

thank you for reviewing.

We should drop this patch in favor of Liutong's
[PATCH v3 0/3] lib: sbi: fix shared memory double-fetch in DBTR and SSE

Later patches in this series depend on the current patch and should be 
reworked once Liutong's series has landed.

Patch 1/7 seems not to conflict. With Liutong's work so maybe Anup can 
pick it up.

A major gap that we have with OpenSBI development is missing test support.

https://gitlab.com/kvm-unit-tests/kvm-unit-tests.git has some tests but 
the work there seems to have stalled. Only a small part of the SBI spec 
is covered and the tests were too superficial to find the conformance 
issues.

The work on SBI in that projects seems to have stalled and would need to 
be revived.

Alternatively we could add testing directly into OpenSBI as sketched in
https://github.com/riscv-software-src/opensbi/pull/437.

@all:
What are your thoughts about testing?

Best regards

Heinrich

> 
>> +static int dbtr_check_trigger_config(struct sbi_dbtr_hart_triggers_state *hs,
>> +				     const struct sbi_dbtr_trigger *trig,
>> +				     const struct sbi_dbtr_data_msg *recv,
>> +				     bool tdata2_impl, bool tdata3_impl)
>> +{
>> +	/* Read the shared memory only once */
>> +	unsigned long tdata1 = lle_to_cpu(recv->tdata1);
>> +	unsigned long tdata2 = lle_to_cpu(recv->tdata2);
>> +	unsigned long tdata3 = lle_to_cpu(recv->tdata3);
>> +	unsigned long type = TDATA1_GET_TYPE(tdata1);
>> +
>> +	if (!dbtr_trigger_supported(type))
>> +		return SBI_ERR_FAILED;
>> +
>> +	if (!dbtr_trigger_valid(type, tdata1))
>> +		return SBI_ERR_INVALID_PARAM;
>> +
>> +	if ((tdata2 && !tdata2_impl) || (tdata3 && !tdata3_impl))
>> +		return SBI_ERR_NOT_SUPPORTED;
>> +
>> +	if (trig) {
>> +		if (!__test_bit(type, &trig->type_mask) ||
>> +		    !dbtr_trigger_hw_supported(trig->index, tdata1, tdata2,
>> +					       tdata3))
>> +			return SBI_ERR_NOT_SUPPORTED;
>> +	} else if (!dbtr_trigger_any_hw_supported(hs, tdata1, tdata2,
>> +						  tdata3)) {
>> +		return SBI_ERR_NOT_SUPPORTED;
>> +	}
>> +
>> +	return SBI_SUCCESS;
>> +}
>> +
>>   int sbi_dbtr_install_trig(unsigned long smode,
>>   			  unsigned long trig_count, unsigned long *out)
>>   {
>> @@ -689,9 +738,8 @@ int sbi_dbtr_install_trig(unsigned long smode,
>>   	union sbi_dbtr_shmem_entry *entry;
>>   	struct sbi_dbtr_data_msg *recv;
>>   	struct sbi_dbtr_id_msg *xmit;
>> -	unsigned long ctrl;
>>   	u32 claimed = 0;
>> -	int slot;
>> +	int slot, rc;
>>   	struct sbi_dbtr_trigger *trig;
>>   	struct sbi_dbtr_hart_triggers_state *hs = NULL;
>>   	bool tdata2_impl, tdata3_impl;
>> @@ -710,52 +758,20 @@ int sbi_dbtr_install_trig(unsigned long smode,
>>   	sbi_hart_protection_temp_map_range((unsigned long)shmem_base,
>>   					   trig_count * sizeof(*entry));
>>   
>> -	/*
>> -	 * SBI v3.0 sec 19.4 requires SBI_ERR_NOT_SUPPORTED when a trigger
>> -	 * programs a non-zero value into an unimplemented optional CSR. Only
>> -	 * the "whole CSR unimplemented" case is caught here; WARL bits tied
>> -	 * off inside an otherwise-implemented CSR are delegated to the
>> -	 * device-specific trigger_supported() callback via
>> -	 * dbtr_trigger_any_hw_supported().
>> -	 */
>>   	tdata2_impl = tdata_implemented(CSR_TDATA2);
>>   	tdata3_impl = tdata_implemented(CSR_TDATA3);
>>   
>>   	/* Check requested triggers configuration */
>>   	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
>>   		recv = (struct sbi_dbtr_data_msg *)(&entry->data);
>> -		ctrl = recv->tdata1;
>>   
>> -		if (!dbtr_trigger_supported(TDATA1_GET_TYPE(ctrl))) {
>> +		rc = dbtr_check_trigger_config(hs, NULL, recv,
>> +					       tdata2_impl, tdata3_impl);
>> +		if (rc) {
>>   			*out = _idx;
>>   			sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base,
>>   							     trig_count * sizeof(*entry));
>> -			return SBI_ERR_FAILED;
>> -		}
>> -
>> -		if (!dbtr_trigger_valid(TDATA1_GET_TYPE(ctrl), ctrl)) {
>> -			*out = _idx;
>> -			sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base,
>> -							     trig_count * sizeof(*entry));
>> -			return SBI_ERR_INVALID_PARAM;
>> -		}
>> -
>> -		if ((recv->tdata2 && !tdata2_impl) ||
>> -		    (recv->tdata3 && !tdata3_impl)) {
>> -			*out = _idx;
>> -			sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base,
>> -							     trig_count * sizeof(*entry));
>> -			return SBI_ERR_NOT_SUPPORTED;
>> -		}
>> -
>> -		if (!dbtr_trigger_any_hw_supported(hs,
>> -						   lle_to_cpu(recv->tdata1),
>> -						   lle_to_cpu(recv->tdata2),
>> -						   lle_to_cpu(recv->tdata3))) {
>> -			*out = _idx;
>> -			sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base,
>> -							     trig_count * sizeof(*entry));
>> -			return SBI_ERR_NOT_SUPPORTED;
>> +			return rc;
>>   		}
>>   	}
>>   
>> @@ -867,6 +883,7 @@ int sbi_dbtr_update_trig(unsigned long smode,
>>   	void *shmem_base = NULL;
>>   	struct sbi_dbtr_hart_triggers_state *hs = NULL;
>>   	bool tdata2_impl, tdata3_impl;
>> +	int rc;
>>   
>>   	hs = dbtr_thishart_state_ptr();
>>   	if (!hs)
>> @@ -880,12 +897,6 @@ int sbi_dbtr_update_trig(unsigned long smode,
>>   	if (trig_count > hs->total_trigs)
>>   		return SBI_ERR_BAD_RANGE;
>>   
>> -	/*
>> -	 * SBI v3.0 sec 19.5 requires SBI_ERR_NOT_SUPPORTED when a trigger
>> -	 * programs a non-zero value into an unimplemented optional CSR. Only
>> -	 * the "whole CSR unimplemented" case is caught; WARL bits tied off
>> -	 * inside an otherwise-implemented CSR are not.
>> -	 */
>>   	tdata2_impl = tdata_implemented(CSR_TDATA2);
>>   	tdata3_impl = tdata_implemented(CSR_TDATA3);
>>   
>> @@ -905,18 +916,11 @@ int sbi_dbtr_update_trig(unsigned long smode,
>>   			return SBI_ERR_FAILED;
>>   		}
>>   
>> -		if ((entry->data.tdata2 && !tdata2_impl) ||
>> -		    (entry->data.tdata3 && !tdata3_impl)) {
>> +		rc = dbtr_check_trigger_config(hs, trig, &entry->data,
>> +					       tdata2_impl, tdata3_impl);
>> +		if (rc) {
>>   			sbi_hart_protection_temp_unmap_range((unsigned long)entry, sizeof(*entry));
>> -			return SBI_ERR_NOT_SUPPORTED;
>> -		}
>> -
>> -		if (!dbtr_trigger_hw_supported(trig->index,
>> -					       lle_to_cpu(entry->data.tdata1),
>> -					       lle_to_cpu(entry->data.tdata2),
>> -					       lle_to_cpu(entry->data.tdata3))) {
>> -			sbi_hart_protection_temp_unmap_range((unsigned long)entry, sizeof(*entry));
>> -			return SBI_ERR_NOT_SUPPORTED;
>> +			return rc;
>>   		}
>>   
>>   		dbtr_trigger_setup(trig, &entry->data);
> 
> Liutong was trying to solve the same TOCTOU problem. It is under review and I had similar comments on that patch series.
> Could you please take a look at that?
> 
> Regards
> Himanshu
> 
>> -- 
>> 2.53.0
>>
>>
>> -- 
>> opensbi mailing list
>> opensbi@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/opensbi


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
