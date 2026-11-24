Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B960F606A31E
	for <opensbi@archiver.kernel.org>; Tue, 24 Nov 2026 06:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Kw1gKGQ8;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oaD7pn/T;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Llj4S98F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=McqtfubxqYrOkTDJj1ZrC957I54TuLaO9Q7Jmc3KWuo=; b=Kw1gKGQ8PIzdOrzfhO/rIQjHO2
	pl7m3g/0kb4wxOF/owP3dbhPOsfiFYU5aNZd3XCi1lXX1zaWxvPCeTgy4RlVGBtOHjH3I+DIAyozo
	7ZbygSvWgTRVcGRHIs4OmLvZ9vgyCQB3dmuTZS9MDAmOqHFPhwAlZJxTKQznxaVyu9ltmGlHCl/M+
	0lXEJQ2LuM7AZu5XXG7woqXN18BukFaSmjuqniRC3tol2hO4Dpz39QKGmfbHAFaqgarQdOVkB362O
	40/k24IXBqejqdttle0A3hHPvaujqKA8nBr+AuSQAvTTaBju6EdwgWDeVcUiicHddf4/GJK8sKMYD
	xC2fcz+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVjp1-00000005dp8-1JVy;
	Tue, 24 Nov 2026 06:16:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVjoz-00000005dog-0QQ0
	for opensbi@lists.infradead.org;
	Tue, 24 Nov 2026 06:16:06 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2k2Yo4128993
	for <opensbi@lists.infradead.org>; Tue, 24 Nov 2026 06:16:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TWoHmyS+D9Umv589qppgED08
	j2S9lBJoax+z20kj7HY=; b=oaD7pn/TGF/norcRX4hnxqlUmRBf8HJmaYlUlqMX
	Ckwh/bK5oVIplfpgplxcmsBf9a8mv1JLuRr0cFZu6czJkmgNCTO8/WjOhzqljXIh
	lle/qLBqxMthUGe+MyVVym2BF7pEG4ywAWX7i7S87Gkwv2KxOTn9XRkNXTkYyPhW
	TE/Gv1VIMJT8Rho8TTrLH58U9G3UNu1dfinFSNTaIEfUSbi6EOHpn+QG6xAfZ4L5
	8MTAgpqtz//5Mw8xf+aRwhV757jUkeW0YuneYbG7edZ7P7J+zP2+zF+z13K7KfFG
	J4FubEUgk4yR6Fwp44jNK6xi4qjsAZk+EUGq4LckPGXlhw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yyt15bs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 24 Nov 2026 06:16:04 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386c3309469so273885eec.0
        for <opensbi@lists.infradead.org>; Mon, 23 Nov 2026 22:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795500963; x=1796105763; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TWoHmyS+D9Umv589qppgED08j2S9lBJoax+z20kj7HY=;
        b=Llj4S98FqH4jtYnu7ws6jv8vXw3GyCzgowJXY+QdZAvd+HYMa6U5pvwDCY4IXkISms
         hm8m9oiEgWO6Plq7FBDUrFuUUwJyVWfPKI9g3RLkoIN55XcGOSt0F6Wy5mKwLmYC5YbT
         rnYmBPI1JiJMATHNWMMAQuIo14Ns+4Za1L74h6xk0wVtH12uQ1ZgDJvgCJ+PlRLJ4DQo
         O4zNyluf1L8lOK9mjwoTcS+zfAnTVJCWxDM7KvWatEnaEN2CMOPOsXzFFVti866LN0mO
         0Ty8j7nM0OvwKteihCeNMOZOfAwRNaDzAfkBGhKIwwLJoxLFH/UsV/LSd4H+vAoJMbVX
         T7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795500963; x=1796105763;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TWoHmyS+D9Umv589qppgED08j2S9lBJoax+z20kj7HY=;
        b=LcaY0veSZwOJGrJbwXUGmtg1tCUhY9AzUL9438g3tF3g1B3MBfnA8LqJ7mMIfMhu4l
         BwkG5i+Sg2hbdfq0Dj3yZyBit8QHDtVJhn0y8/rKHY00UdVsAxMdRHk+tIGaNQSb3OBS
         94j8D5xphUjvuV/DkMVm2GmMvNiBZLG4t9MrUGAjMj3gBIthK06rUlxW9w8aNrLAsUH7
         iCAmHV0JeNwzHeJnwGzZX6o8L80Wu4IXinYrfk/tGOt9T0BtrHD5XK4bZdAZq0sf42Pw
         r64E7lZ4/8ygWKkciXjnnCTgld+aT9vwERa3LCeIPv7qf6ix5GdOT5Skp44LwFDYFFzL
         uQpQ==
X-Forwarded-Encrypted: i=1; AL+hErH0I7xBU8ebNYwcB+PEHF1eOtjeWzic0pNOH+TtyeFf0gkrMGX2hcWj0BuL+CVhFDhGohg7CHET@lists.infradead.org
X-Gm-Message-State: APuU4Z/aGAjeox4Tg/dH6RaghtbM3eQmd8inv1VsDcmaq/+DbFGSIi7q
	LcxRyjyAAb7cv5SeweG5Lld/RjEXVCrCHPY0ycuH4XfDN5PN7KF/Eq0MjzPXXafQlBoIxWelgyl
	BttOLsx0ddUIgrs9hsd2Nhw0PzwtZzv4OXlMuwE9PR+gThHKgLilPsETkx50mCuDQ99I/pGvilg
	==
X-Gm-Gg: AZFdTZe9Z8Q5DyPETYKZ3dHeoK9fjBDkqe2g1zCZFaqaVhJET94wTbk9/rYzb6V+Zf+
	LXQQuAC19qa1MbnIqZOG5pJWZi2jvQykRF+gQLBgT6CZAcYGSw3npa/9uPLy0phS3/z4afAufd7
	xjFfSaM3Fdu9GY3CBAhbMnpBNx/2/Hf2m8JqXK/1fApYc+bTss1NHf0hUlArF+prct75VySgyzl
	yN6eE6DZ9e7iv88PkvYFWbq48aCmLA7DlMXgUl5SlvvIOR3BWNkcC+uxr/D/ZJ8FeIQknajiOIl
	+UbIOWvvuXmghoijOVKZN2j3kJCmOS6jAm2c4HYjFNZ95wAyU3uHUK3+4rzFAsTuzgdXLozS6cV
	L1NP/wtiiR8g32OMeZTOA6CK9dO4ZnTAsVDvq/JGodbr7fmYei1Z/FHRRglBfSscYjVBmHkA7q4
	+xAqnrruOTFjiOIq/ChHFt3azgvyuO07fHkb8riutjeMGDN9EeMHK4B30yDeVSYvZGUOoG5HvhR
	Q==
X-Received: by 2002:a05:7301:2e30:b0:376:19bd:2af9 with SMTP id 5a478bee46e88-3856c2c4a0dmr15930396eec.5.1795500963502;
        Mon, 23 Nov 2026 22:16:03 -0800 (PST)
X-Received: by 2002:a05:7301:2e30:b0:376:19bd:2af9 with SMTP id 5a478bee46e88-3856c2c4a0dmr15930374eec.5.1795500962862;
        Mon, 23 Nov 2026 22:16:02 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm39430530eec.7.2026.11.23.22.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:16:02 -0800 (PST)
Date: Tue, 24 Nov 2026 11:45:57 +0530
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
        opensbi@lists.infradead.org
Subject: Re: [PATCH 4/7] lib: sbi: dbtr: validate the trigger set of
 uninstall, enable, disable
Message-ID: <awUrnU6zlY2UxZ6o@hu-himchau-blr.qualcomm.com>
References: <20261120231119.90214-1-heinrich.schuchardt@canonical.com>
 <20261120231119.90214-5-heinrich.schuchardt@canonical.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261120231119.90214-5-heinrich.schuchardt@canonical.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyNCBTYWx0ZWRfXxTUvEtnrEH2b
 rwD0PMj8fSv1OVrAOYyC3TWJ1pzK8cXiLen8IUcvJZzFjrnjTfHekZ7TO1Q12VwxIryR5HNJ1YN
 B+ZlCPo6CwY57F6glf940/AGVgAm/2I=
X-Proofpoint-GUID: POpxuJzXXGV6iFMM86mNI9Q-EW_9BM7B
X-Proofpoint-ORIG-GUID: POpxuJzXXGV6iFMM86mNI9Q-EW_9BM7B
X-Authority-Analysis: v=2.4 cv=W9OtxhWk c=1 sm=1 tr=0 ts=6b052ba4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=JfrnYn6hAAAA:8 a=DfNHnWVPAAAA:8 a=Wdwn0XTQFpUIsAqK-OYA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=1CNFftbPRP8L7MoqJWF3:22 a=rjTVMONInIDnV1a_A2c_:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyNCBTYWx0ZWRfX5kK8wZINo/FO
 DlI6FTvVkeDIVw6tJw+RgJJf1G45Vu0xNzhGHvK1oDcOFYlPRLpD7V7Htci3Y7pEWpF1BSUyJ+/
 Bsx/r/yGORx3CxqDovyzMwdRGa9kxnXoENdFhDnYqW8IAr1wqfNHMRyJ2va8Q5afBpT6KmKV5F3
 82V5RYLobd1ESioA30Ah30tD60fwCtdLaSf1X9mP0nkIFIfq9V8X1ibDeDB4NtFTDOdX/qPAWNR
 G9A5LlvknUE1ZeJOVjksQGsYkIRiiuAzVHAZwDhUV94GdK7L3gZJDIpVRzltEzLIq7Je13JxFEg
 UJW1XnHCiqleLYuT5HnlzuJiIAWvR3929dQAhn3DQH6HKj2jT4pnYM37oQNK28k6HN5mSiR743s
 BMEa7EhyJ25j/yaAt5mntTAJV6IkY+kDP7xNCwTr7sE1lOhwtCS60fnocREHCpi4crSriWUZ4tC
 hq2c+/ZfrT9mycOHoeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_221605_172788_CA2D33F9 
X-CRM114-Status: GOOD (  31.30  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 21, 2026 at 12:11:16AM +0100, Heinrich Schuchardt wrote:
> The specification requires SBI_ERR_INVALID_PARAM for these calls if a
> trigger of the set is not mapped to a hardware trigger or has an index
> of trig_max or more.
> 
> The functions shifted the mask by the base and walked the set bits below
> total_trigs. Bits that are not below total_trigs were never visited, and
> the shift dropped the high bits of the mask. A base or a mask bit that
> is out of range therefore ended in SBI_SUCCESS. Enable and disable
> silently skipped triggers that were not mapped, so enabling a trigger
> after it was uninstalled succeeded.
> 
> Check the whole set before anything is changed. The index of a bit is
> compared without adding base and bit, so it cannot overflow. As a side
> effect a failed call changes no trigger.
> 
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
>  lib/sbi/sbi_dbtr.c | 73 +++++++++++++++++++++++++++++++++-------------
>  1 file changed, 52 insertions(+), 21 deletions(-)
> 
> diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
> index fa0e5962..d4be1be3 100644
> --- a/lib/sbi/sbi_dbtr.c
> +++ b/lib/sbi/sbi_dbtr.c
> @@ -839,22 +839,52 @@ int sbi_dbtr_install_trig(unsigned long smode,
>  	return SBI_SUCCESS;
>  }
>  
> +/*
> + * Check the set of triggers of uninstall, enable and disable: bit i of the
> + * mask is the trigger with the index trig_idx_base + i. Each one has to be
> + * below trig_max and mapped to a hardware trigger, otherwise the specification
> + * demands SBI_ERR_INVALID_PARAM. Nothing is changed unless the whole set is
> + * valid. The comparison is done without adding base and bit, they cannot
> + * overflow.
> + */
> +static int dbtr_check_trig_set(struct sbi_dbtr_hart_triggers_state *hs,
> +			       unsigned long trig_idx_base,
> +			       unsigned long trig_idx_mask)
> +{
> +	struct sbi_dbtr_trigger *trig;
> +	unsigned long bit;
> +
> +	for_each_set_bit(bit, &trig_idx_mask, BITS_PER_LONG) {
> +		if (trig_idx_base >= hs->total_trigs ||
> +		    bit >= hs->total_trigs - trig_idx_base)
> +			return SBI_ERR_INVALID_PARAM;
> +
> +		trig = INDEX_TO_TRIGGER(trig_idx_base + bit);
> +		if (!(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED)))
> +			return SBI_ERR_INVALID_PARAM;
> +	}
> +
> +	return SBI_SUCCESS;
> +}
> +
Nit. dbtr_check_trig_set could be dbtr_check_trig_mapped.
One more thing which is missing in other patches as well is Fixes tag.

Regards
Himanshu


>  int sbi_dbtr_uninstall_trig(unsigned long trig_idx_base,
>  			    unsigned long trig_idx_mask)
>  {
> -	unsigned long trig_mask = trig_idx_mask << trig_idx_base;
> -	unsigned long idx = trig_idx_base;
>  	struct sbi_dbtr_trigger *trig;
>  	struct sbi_dbtr_hart_triggers_state *hs;
> +	unsigned long bit;
> +	int rc;
>  
>  	hs = dbtr_thishart_state_ptr();
>  	if (!hs)
>  		return SBI_ERR_FAILED;
>  
> -	for_each_set_bit_from(idx, &trig_mask, hs->total_trigs) {
> -		trig = INDEX_TO_TRIGGER(idx);
> -		if (!(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED)))
> -			return SBI_ERR_INVALID_PARAM;
> +	rc = dbtr_check_trig_set(hs, trig_idx_base, trig_idx_mask);
> +	if (rc)
> +		return rc;
> +
> +	for_each_set_bit(bit, &trig_idx_mask, BITS_PER_LONG) {
> +		trig = INDEX_TO_TRIGGER(trig_idx_base + bit);
>  
>  		dbtr_trigger_clear(trig);
>  
> @@ -867,20 +897,20 @@ int sbi_dbtr_uninstall_trig(unsigned long trig_idx_base,
>  int sbi_dbtr_enable_trig(unsigned long trig_idx_base,
>  			 unsigned long trig_idx_mask)
>  {
> -	unsigned long trig_mask = trig_idx_mask << trig_idx_base;
> -	unsigned long idx = trig_idx_base;
> -	struct sbi_dbtr_trigger *trig;
>  	struct sbi_dbtr_hart_triggers_state *hs;
> +	unsigned long bit;
> +	int rc;
>  
>  	hs = dbtr_thishart_state_ptr();
>  	if (!hs)
>  		return SBI_ERR_FAILED;
>  
> -	for_each_set_bit_from(idx, &trig_mask, hs->total_trigs) {
> -		trig = INDEX_TO_TRIGGER(idx);
> -		sbi_dprintf("%s: enable trigger %lu\n", __func__, idx);
> -		dbtr_trigger_enable(trig);
> -	}
> +	rc = dbtr_check_trig_set(hs, trig_idx_base, trig_idx_mask);
> +	if (rc)
> +		return rc;
> +
> +	for_each_set_bit(bit, &trig_idx_mask, BITS_PER_LONG)
> +		dbtr_trigger_enable(INDEX_TO_TRIGGER(trig_idx_base + bit));
>  
>  	return SBI_SUCCESS;
>  }
> @@ -945,19 +975,20 @@ int sbi_dbtr_update_trig(unsigned long smode,
>  int sbi_dbtr_disable_trig(unsigned long trig_idx_base,
>  			  unsigned long trig_idx_mask)
>  {
> -	unsigned long trig_mask = trig_idx_mask << trig_idx_base;
> -	unsigned long idx = trig_idx_base;
> -	struct sbi_dbtr_trigger *trig;
>  	struct sbi_dbtr_hart_triggers_state *hs;
> +	unsigned long bit;
> +	int rc;
>  
>  	hs = dbtr_thishart_state_ptr();
>  	if (!hs)
>  		return SBI_ERR_FAILED;
>  
> -	for_each_set_bit_from(idx, &trig_mask, hs->total_trigs) {
> -		trig = INDEX_TO_TRIGGER(idx);
> -		dbtr_trigger_disable(trig);
> -	}
> +	rc = dbtr_check_trig_set(hs, trig_idx_base, trig_idx_mask);
> +	if (rc)
> +		return rc;
> +
> +	for_each_set_bit(bit, &trig_idx_mask, BITS_PER_LONG)
> +		dbtr_trigger_disable(INDEX_TO_TRIGGER(trig_idx_base + bit));
>  
>  	return SBI_SUCCESS;
>  }
> -- 
> 2.53.0
> 
> 
> -- 
> opensbi mailing list
> opensbi@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
