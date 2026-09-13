Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E9A5C88E56
	for <opensbi@archiver.kernel.org>; Sun, 13 Sep 2026 10:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n5bo40nlHZz7Zht9SBEX2kwAQKtWM/8K2e9aIEczk60=; b=aVpqzre4ADRCOR
	KYagmpt66XYAjX6BdikVM+YUdkqvg522nwCPuo3xUlrLV4tnsuJvmuI6ZNn4HdxusSzVNDtTs9R0U
	i42IIVhp15WoylwD8Zph9BagFI0XvAqsGroWuqBm/VTmWHSxRPRNWY6MhZcko1Wt72aLdaHD79vQA
	D6w6O3Jzw9olsaQDCQkRKjWaILoU0xmJgzxKMxJvjGN3PoEWlrhV5HLkBBmWG8EwmQadQuwUZ48vr
	c4Wu1c1C0QneLDpBZEeyJcDF970mlbElsrVIKWpyEWhzrJu47JyF1un/BH6KZM8PGxcdHXAUFrR4j
	CDiCRf2/IRTccKDB5xQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5h5B-00000001ZPW-0DFC;
	Sun, 13 Sep 2026 10:05:09 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5h58-00000001ZPB-1EDC
	for opensbi@lists.infradead.org;
	Sun, 13 Sep 2026 10:05:07 +0000
Received: by mail-pz2-x10.google.com with SMTP id d2e1a72fcca58-85469a34908so871358b3a.0
        for <opensbi@lists.infradead.org>; Sun, 13 Sep 2026 03:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789293905; x=1789898705; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/MB/kBvWadBHSNMbmUveBUy8EKYLiV1rvoKCoLuLxM4=;
        b=JCmtUIchMH+V2munFwPnyptdtmvVl+zlZj951Nw9NzlTI4/66uSblI4MTcSnVkPrk0
         kDugdag1L7Ow9fZUWudJvPXU2OoVTTO9zxr454CB/A/Pzkd6UusB+TV22iBd6sRT6XM0
         5QjVXtC8aNXpCsjVSXac9xGtSIScrq1pMnGeYk78eVkCJvyB2iFoPdEZY7fuzLT8VQEC
         RWPKZeaB/PTFj+PhxIWbYqXDQdUZK3GG4SHROqjxU8GCWA4mXPG3+y9VaX+1PRgZx2Rq
         IMg4VA03D+u9ntBtQkZjhBMcbKYvPNfXnvgxIEsS+9i/aMYlzfqjd+aHVvbZQ4FIcqK2
         oE4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789293905; x=1789898705;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/MB/kBvWadBHSNMbmUveBUy8EKYLiV1rvoKCoLuLxM4=;
        b=tPPAkAARRPBoJiJoi57T9Cdu+BwKZ/UBzYgw5AMZ+G4D2p331qCW43oi4cNnKgmq0Z
         UVD1/5tUZml92ZFB+yaiDIwQ3CgihB73iVl8UuRj+0Kq9PA2IW5N9QfHAzCCOKqJ0svJ
         Efx5wdB92K2jaM8h9wRTFBFayldJWVzpGNpG0GPX5nQ+ztC8aYC3PpJtYGCMsMNduzgy
         O+oE5yELpcZ0oHEk+NTgcPM28TOw44EW+LyxhSxdTeKOsbTy8yHORQFiy1d4ibxQBQi+
         TP/uueiX/8Gls3S9PoAyvGcoNUI098Dudlr2Cc0R1MdyKgWdiz1eCI2OF5oTrzjo7FA5
         Z0Aw==
X-Forwarded-Encrypted: i=1; AKwUvBwSpHzXh5c8iUrNmtMt438fzo8VXRQKqEfuUBLi1mD1lVa+yZ3IrwsNpYwOblNFaNxVfbVc9sva@lists.infradead.org
X-Gm-Message-State: AFuF++moXviu4tC2JcdQjpiKBIMyJcYzo5XAlSrptA/yvRBSb5+t6QDn
	MaHQC7X0inb5USlp00OViO6oavK90SeQ2BXthi3pvkvXUeFb/msJsijt
X-Gm-Gg: AYBFou0csqbx4magNyfhk3bMyH3QnSAe23SG/e6UxFFRcpV96zLw+gjmMSPMcWM2meV
	apMoFL9bubbcdipN+T5pvxe2pfTal63sJQgvxV7igpOFmxpw38LOoBLLpzIIY7zYYufKHcnMFeD
	/9TXPkUzUzobCbByPV/8z8Xi4/tNJnbUg7QN0rmyMmJm2XK7BDtWUuq9ecgMyXW8GHWmLe5Ss9s
	roVH8kmcZJAWwOAFGOXyZDt0wOY1vV8nnKAoymvAHChxxaomSC0hz0y5afF6ugI2Zt72A2ylmMg
	kRpVu1a2A3YrTwXAKdJWsBHOJXYK+78wNWE4rq2OXXwViJhapgf1ss5xXEOJB9eDdjmn7ZLNh18
	6FCkTE08X5FRXvzLW28Bc/64pmphYxjkD8fyu4VduATpn3P7HBofKNSQvGJzHpVrxoXfy6N5/ct
	lN75TVEFBs3V2nFCictFuR/IaAPhCeWn5clDA96fRGBD+IblrwcIdXDHp2/+XuAykqMkvYG1NG
X-Received: by 2002:a05:6a00:800a:b0:857:7337:5db7 with SMTP id d2e1a72fcca58-86ccc541561mr10335341b3a.21.1789293905157;
        Sun, 13 Sep 2026 03:05:05 -0700 (PDT)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c652ab0dsm3321263a12.6.2026.09.13.03.05.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 03:05:04 -0700 (PDT)
Message-ID: <2be617d8-6f79-4fc2-bc83-2d4b09aa94c2@gmail.com>
Date: Sun, 13 Sep 2026 03:04:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib: sbi: Clear all IPI devices when processing an IPI
To: Troy Mitchell <troy.mitchell@linux.dev>, opensbi@lists.infradead.org,
 Nick Hu <nick.hu@sifive.com>
Cc: Anup Patel <anup@brainfault.org>,
 Kevin Zhang <zhangmeng.kevin@linux.spacemit.com>
References: <20260908-ipi-clear-all-v1-1-b1bd5d016eb6@linux.dev>
 <6cd2145e-b2fb-4f11-ba24-0c9b56554b40@gmail.com>
 <DLD7XSBJKOJ2.3FFDZAGATV2LX@linux.dev>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <DLD7XSBJKOJ2.3FFDZAGATV2LX@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_030506_352567_3A69143C 
X-CRM114-Status: GOOD (  17.93  )
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

Just sent the patch. I've changed the function names slightly:

https://lore.kernel.org/opensbi/20260913100128.2437-1-ganboing@gmail.com/

On 9/12/26 02:09, Troy Mitchell wrote:
> Hi Bo,
> 
> On Fri Sep 11, 2026 at 5:32 PM +08, Bo Gan wrote:
>> Hi Troy,
>>
>> On 9/8/26 06:00, Troy Mitchell wrote:
>>> Hart start sends wake-up IPIs through all registered IPI devices, but
>>> sbi_ipi_process() only clears the preferred device. A notification from
>>> another device can arrive after warm initialization has cleared it.
>>>
>>> With both IMSIC and ACLINT MSWI, IMSIC is preferred and has no ipi_clear
>>> callback: its interrupts are acknowledged through MTOPEI. A late ACLINT
>>> notification therefore leaves MSIP asserted, trapping the hart in the
>>> machine-mode interrupt handler and potentially timing out Linux CPU
>>> bring-up.
>>>
>>> Clear all registered IPI devices before consuming the software IPI event
>>> bits so that late wake-up notifications are acknowledged too.
>>>
>>> Fixes: 94f0f8465622 ("lib: sbi: Extends sbi_ipi_raw_send() to use all available IPI devices")
>>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
>>> ---
>>>    lib/sbi/sbi_ipi.c | 7 ++++++-
>>>    1 file changed, 6 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
>>> index b04a5877..683d559d 100644
>>> --- a/lib/sbi/sbi_ipi.c
>>> +++ b/lib/sbi/sbi_ipi.c
>>> @@ -263,7 +263,12 @@ void sbi_ipi_process(void)
>>>    			sbi_scratch_offset_ptr(scratch, ipi_data_off);
>>>    
>>>    	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_IPI_RECVD);
>>> -	sbi_ipi_raw_clear(false);
>>> +	/*
>>> +	 * A wake-up IPI is sent through all devices. A notification from a
>>> +	 * non-preferred device can arrive after warm-boot initialization
>>> +	 * cleared it, so acknowledge all devices when processing the IPI.
>>> +	 */
>>> +	sbi_ipi_raw_clear(true);
>>
>> I feel like this is not the proper way to fix the issue. It introduces
>> unnecessary overhead for *every* IPI processing, because you need to call
>> clear on all IPI devices, even the non-preferred, inactive ones.
>>
>> IMO, the "int sbi_ipi_raw_send(u32 hartindex, bool all_devices)"
>> interface is a bad idea. It opened the door for such issues. AFAIK, the
>> only reason such interface exists is that sometimes, some platform
>> requires the use of a different IPI device during HSM kicking. E.g.,
>> some Sifive cores can't use imsic, but only aclint. Why not introduce
>> another interface "int sbi_ipi_raw_send_safe(u32 hartindex)" just for this
>> purpose? Then we can have a separate rating on how safe that IPI device
>> could be for cold startup, and pick the right one in the function. E.g.,
>> favor clint over imsic for sbi_ipi_raw_send_safe.
>>
>> In this way, we ensure that only 1 IPI is active at any given time, and
>> ipi_process can still use sbi_ipi_raw_clear(false) to clear the preferred
>> IPI device, and HSM/init code still does sbi_ipi_raw_clear(true). There'd
>> be no more cases like Troy encountered, where IPI from another device
>> arrives late, and you have no ideal way of dealing with it other than what
>> Troy was proposing.
>>
>> Let me test with this approach and prepare a patchset.
> Ok. wait for your feedback.
> 

Bo

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
