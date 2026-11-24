Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3DB606B72A
	for <opensbi@archiver.kernel.org>; Tue, 24 Nov 2026 09:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MYYvymIZ;
	dkim=fail reason="signature verification failed" (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=gotvApA9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IUNSRi2BE4KTWSWYubxodr85k5QfYTlOHyK0YYfLatE=; b=MYYvymIZNR+h4DREIXFt7g2On4
	HAmWuVlTI5tQ5YreiTTlUjxA5+NvDlIwGt/d6kla9gLxOwre6znNBjw7/2IgXwBbvHh8sdVTpe8gP
	ycVKeaeNAZRbAWxjQkxWUB+vBjDQfojMhec5ejAehjzBhGEOPpv0wZ/wZ5qz7ceCFC0jcGvrjVorx
	tTJxrLgPf7T+wgK1TMSb4DDD+farUNV22Qa6t1NuJxAOsGR0tKBNIy2esYhqo1fJZcNAssucF3OeM
	arEV3/LeB2nWWdsUmuPYp9PcUaen3uIoTTsc1GKA6M9CPL+wHBTH5ScFMb8ynoVWuHFihBn3FGLx5
	Wsjz+wGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVn8h-000000067EC-0fRC;
	Tue, 24 Nov 2026 09:48:39 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVn8T-0000000678t-2zH8
	for opensbi@lists.infradead.org;
	Tue, 24 Nov 2026 09:48:31 +0000
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 33CB23F78C
	for <opensbi@lists.infradead.org>; Tue, 24 Nov 2026 09:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1795513703;
	bh=ADQxnjXPsvrExU4FDCcfxhmJ8HsmuITCJibxD8ROBNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=gotvApA9hMqaOxOWbxMkDsto90u/+e3vay3MxQHNVh4wjl/p18VoeIZmOiHYE9ge9
	 t6GeSgVWpAAK53M26wUR0zVLAGIbVHr0gsykSLnGQPduoPTyoGrU9ozEH4ni7wV4AG
	 LNcUZMv/Etqhe+En8UKJ0jZsOFIF2WOHdvspvqaBRAjJ07FZcT5DegXXFupatQ6pTo
	 6gP5MJD9w5OsyKhuXjRIRI8bBddA3bUpAFlAUZ0L/QZRb6qtYZxA3pRL344bNwj6XV
	 Tata/HkJ7wJTIa1rteD1KrN4MeJFKmFypOG75deBjS+kvDSHrJvpRcNYrF+qjcITRP
	 uHHz5Sm2ZKEEVL9sD3o2zyvJlOIcJVE/L5NwZKQJw30fvSn8NwmSHNeTZ2DQ8goSn7
	 7K/Tfp9U2szPmBB1yBmGRKkMCsv/ex0m8oM1lHB67kpszXwqffizPER+sqxOK78WIi
	 vYb6xqccJ1dLNMZ+X4TdXRa0WYopZX6qs+Vurd1hizI+a10GEgMHbqYfgfQ4XMBl91
	 AUsc7H8xZFAIwnoI2oDTWBkk4ATBF5jMoC7LBnTcOTJUdU4LnjAGHuIwwU623vReDk
	 AlIFc01yD7bHTJdz8k+44kJF/rRYQOGSc1XB+ysGcu3E+3+/qQrtu5uDf88rd2XKx3
	 bif9V4cvdaIoy2P8Y6noUzl0=
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4ba078abd78so27641775e9.1
        for <opensbi@lists.infradead.org>; Tue, 24 Nov 2026 01:48:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795513703; x=1796118503;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ADQxnjXPsvrExU4FDCcfxhmJ8HsmuITCJibxD8ROBNs=;
        b=L0bMwTwW4Yainj2gGEVNZwNw4ttbAgdRfjstHm0vGl+BSdcB9R1JP69o0OKPYhNu3T
         F77Q72lQsJoiueexWknGqtSq1fRVtAyjiXRGnwFUfkOKGc55Ct3NT0+QSjTEpSP3NcAZ
         uyhd+Vynst0uSUVXvHiwqgsPbOW6sVclSTxFYdV6+1EiDqSxofpm9li9ecNKElptfVgq
         jyP+WqV5P7Wwx6iEXX4nJrC4piNL1yo4gBda5CRFnZDh/xvCk1QkF05ikRlHDuMVFi2F
         ocVrhZmInGcnAEBvzqCYEHqHZq9g5A9KCVVEZdDhUIp2mve081KlEXtiEzD796E+yDOo
         9Kgw==
X-Forwarded-Encrypted: i=1; AL+hErFTY2fSlrmR5L3/0xUaSMF6xyvVLVp97U9OZGIujHCSSEssbLW13r6UaezpEuKRQc5ckl1rrRA/@lists.infradead.org
X-Gm-Message-State: APuU4Z+PXdkUIULWRIcMHSlWKJ46g1aShlBKxcWe1u+W+BSW/vE8p4ud
	fix+iYmRV7gz7gQ1Pfq73TXBrd7w7zuR/446+gSgg0drLjGrqOzjDA1YrbS0c78uvZwxrXQtI45
	o3rIgiF3b2fk8fFbD2z7pBI+KmISan7XEhCHOlhcgXVz/wgwgjT6SmBAE1Ad+WgebwgM3WwZeaa
	ppkzYK
X-Gm-Gg: AZFdTZft6KXIykWXowrO0yRy6sxxMzDJ5LG9Tn5yVnHw6omXI0K4eM57/lvyH0O8Hsy
	WUrpHZ1+Resb4/KBUDi+GsycUQ7qTgRubPqTG7qF0xXmv7xznlG4oU6EklQ9qVhc061GlpfhSm+
	QzqglfzQdgh0T5H2sq8zcZE1We4K/H+4H6bMd1HX8rzyWJUFLJblJS2f+UHOJJ4rWyHxH2OoxX5
	27tFlJFFIMM1V87Ab3bZmlN0KYlCcjGXWOe0Kf3VS6/bdOlTiCuUzuJ7B/fMi1M5IlJHXKQn3Go
	07IH84LmekWpxa7nnFf4q32yxo0+pz8him7H9coq5sU1udVmUSYDPzsPlpK1qe7UuMmdtcRSKJL
	2TEpECgVKpPPKRt3F1gSKtuXyDEHhoRPNuOmY7hp2SSuO6LEO7cBXFxEvZRy0LV9egQwRi1V6d7
	Fmyxs3YDfpUeKw+7W5RwFZtAXSCsaef73utbJcMtGulJolteyN4GKirqTjvG9Wgtl41ZnnvQk=
X-Received: by 2002:a05:600c:1c0e:b0:4a1:ddaa:571e with SMTP id 5b1f17b1804b1-4bb88824f38mr330722285e9.15.1795513702817;
        Tue, 24 Nov 2026 01:48:22 -0800 (PST)
X-Received: by 2002:a05:600c:1c0e:b0:4a1:ddaa:571e with SMTP id 5b1f17b1804b1-4bb88824f38mr330721795e9.15.1795513702412;
        Tue, 24 Nov 2026 01:48:22 -0800 (PST)
Received: from ?IPV6:2a02:908:1242:30e0:1320:e0ed:cbe3:9c71? ([2a02:908:1242:30e0:1320:e0ed:cbe3:9c71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm431897675e9.15.2026.11.24.01.48.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 01:48:21 -0800 (PST)
Message-ID: <8e42c97a-11d1-4ab2-8ecb-3624b56ee944@canonical.com>
Date: Tue, 24 Nov 2026 10:48:20 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] lib: sbi: dbtr: check the whole shared memory range
 in SETUP_SHMEM
To: Anup Patel <anup@brainfault.org>,
 Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: Atish Patra <atishp@atishpatra.org>, opensbi@lists.infradead.org,
 Pengpeng Hou <pengpeng@iscas.ac.cn>, liutong <liutong@iscas.ac.cn>
References: <20261120231119.90214-1-heinrich.schuchardt@canonical.com>
 <20261120231119.90214-4-heinrich.schuchardt@canonical.com>
 <awP13Tc5cpXdRJIy@hu-himchau-blr.qualcomm.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <awP13Tc5cpXdRJIy@hu-himchau-blr.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_014828_323146_A6B713E0 
X-CRM114-Status: GOOD (  21.81  )
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
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/23/26 09:14, Himanshu Chauhan wrote:
> On Sat, Nov 21, 2026 at 12:11:15AM +0100, Heinrich Schuchardt wrote:
>> The shared memory of the debug trigger extension is trig_max * (XLEN / 2)
>> bytes long. The specification requires the SBI implementation to check
>> that the whole physical memory range is accessible for the caller, see the
>> chapter on the shared memory physical address range parameter.
> "see the chapter..." can be dropped. But I am okay with this right now.
> 
>>
>> sbi_dbtr_setup_shmem() only tested the first address. A range that starts
>> in memory of S-mode and reaches into memory protected by PMP was
>> accepted. A later read of the triggers then makes M-mode write into the
>> protected memory. A range at the top of the address space that wraps
> 
> This is a major gap you pointed out yet mentioned in a casual way. Thanks
> for fixing this. I request you to throughly review commit logs as well.
> 
>> around was accepted too.
>>
>> Use sbi_domain_check_addr_range() with the size of the shared memory. It
>> also rejects a range that wraps around.
>>
>> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
>> ---
>>   lib/sbi/sbi_dbtr.c | 17 ++++++++++++++---
>>   1 file changed, 14 insertions(+), 3 deletions(-)
>>
>> diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
>> index 53fcb0a2..fa0e5962 100644
>> --- a/lib/sbi/sbi_dbtr.c
>> +++ b/lib/sbi/sbi_dbtr.c
>> @@ -385,9 +385,20 @@ int sbi_dbtr_setup_shmem(const struct sbi_domain *dom, unsigned long smode,
>>   	if (shmem_phys_hi)
>>   		return SBI_EINVALID_ADDR;
>>   
>> -	if (dom && !sbi_domain_check_addr(dom,
>> -		  DBTR_SHMEM_MAKE_PHYS(shmem_phys_hi, shmem_phys_lo), smode,
>> -		  SBI_DOMAIN_READ | SBI_DOMAIN_WRITE))
>> +	/*
>> +	 * The shared memory is trig_max * (XLEN / 2) bytes. All of it has to be
>> +	 * readable and writable for the caller, not only its first byte,
>> +	 * otherwise a read of the triggers would write into memory that the
>> +	 * caller cannot access. A range that wraps around is rejected too.
>> +	 */
>> +	if (dom &&
>> +	    !sbi_domain_check_addr_range(dom,
>> +					 DBTR_SHMEM_MAKE_PHYS(shmem_phys_hi,
>> +							      shmem_phys_lo),
>> +					 hart_state->total_trigs *
>> +						 sizeof(union sbi_dbtr_shmem_entry),
>> +					 smode,
>> +					 SBI_DOMAIN_READ | SBI_DOMAIN_WRITE))
>>   		return SBI_ERR_INVALID_ADDRESS;
>>   
>>   	hart_state->shmem.phys_lo = shmem_phys_lo;
> LGTM
> 
> Reviewed-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>

The same change was already suggested by Pengpeng and reviewed positively in

[PATCH] lib: sbi: dbtr: validate complete shared memory range
https://lore.kernel.org/opensbi/CA+Ht8=ZJrfwk6DBk+Dyt71=2r66-N=WBbKnBu+npLekKUX45Sg@mail.gmail.com/

The discussion with Liutong seemed to have ended in Liutong accepting 
Pengpeng's patch.

I wonder why Pengpeng's patch was not merged.

Best regards

Heinrich

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
