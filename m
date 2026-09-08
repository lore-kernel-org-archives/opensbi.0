Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A89AEC79F99
	for <opensbi@archiver.kernel.org>; Tue,  8 Sep 2026 04:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/hA59F0SwugXSJtM8i1T9D/ngY8agt/Ee2Jsdo6c6D0=; b=K4upXTgHG7o+IA
	vppyiTsQmmdMamHon6f7jFuXu3+h3rEOUxw45Wk2Mt3Ls1UtgZauaEXeUc45teQzzDscynsgfFO/i
	Ik4aUdcYbozk49/OewKbQ+BDdy3mYzBaOhmzQJ5QMAG3hLNUIFIgDAC50AK0nA5HZiFflGD9yGvhA
	2mfPIyNIx6eK6AckE5dXHXBsTlrb41l0fDF4GekKVdN7BwNgfB7P9mMuawQR3jJuNj5NEIqGR6B74
	wLHjbk4UL9LcMAWwOin7wvA0/BFL6BFtJ6wR659+cJdPq8oqEEKbtv3Rda1VF3Nbuu/9KTcPsKIx3
	WI0l40VfqzzPuwAVseAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3nIA-0000000810e-3ak0;
	Tue, 08 Sep 2026 04:18:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3nI4-0000000810G-3OJF
	for opensbi@lists.infradead.org;
	Tue, 08 Sep 2026 04:18:38 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687NlbiK681573
	for <opensbi@lists.infradead.org>; Tue, 8 Sep 2026 04:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1N2/+JjOSNIyv8bHDnDj2HJx
	3QjygKw+yhgQ8mEu3M0=; b=FHnLamRr+uqHFRjVYTdwWuU3x5BJtQC8ABxx3RqR
	elhjIery67aaDeiL9rz8E9YHF5X87FrfWeIES2/OV7YEiaAkyX2yCp83rCLIlx7Z
	v4IP/syECjbIP2yyai09vtCpxlZ/tu+l1FiEFmhetw0YEvdok4RTNo55irORuZpw
	gNPIs0sSoSQ8tBLBH2Mm2yLP9RtTjzbFF+60G0B5FYdH+duSXBh6LsuBctMa+MvI
	tB1fkGTTxuSua8JnEN54jL1X2wlRA4RXHEE+IK5Kxj4lKB4P9jt1asZcKkD/lEA0
	dw9HgYUPXhrtTGqcv62yBAjWDd5h5wrQ570dQCt4c5OQaA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj077hv5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 08 Sep 2026 04:18:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398d0010cfaso8027213a91.3
        for <opensbi@lists.infradead.org>; Mon, 07 Sep 2026 21:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788841105; x=1789445905; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1N2/+JjOSNIyv8bHDnDj2HJx3QjygKw+yhgQ8mEu3M0=;
        b=c4pNk5nNnCrbgq/Wj5ytAph9QSfHhP78ziZPKu6vj6A18l/DAvJR516TD7U1lTNCr6
         /O59sGDiR4NpEzjFMQSxr574umDFOBgxYbhiCRxEN+00LsW8dZRCRbIQyZQGxfXuNxKd
         JeLxVBafV8ityiEFdVdloMO+VfQ6CWf0LqbhLqATjNdd46zwitRW5LSxMUU409RHj1GY
         pDk+waRD8CF/5SVdyNJVQqI8ZsxUaREFq6w0h/wPV0fz+Smw3vDgzmz1Pt0btxOS12I+
         X5Gt66heBWutxlqkTWxm9gvnHfnpOaSNV/DAkAELhaAKiec/+k3fNkyWcIjhUrV2+HsF
         KRnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788841105; x=1789445905;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1N2/+JjOSNIyv8bHDnDj2HJx3QjygKw+yhgQ8mEu3M0=;
        b=lMPY9NbPO8be4i9NskDWj5onylOkAlzrjL2UQ+fClx4UOmMb/IYY9tDfBp+QrEoWH2
         lqr5ybfGrBRkSWK59hBXvJWJRSD94Lsg6gONgYmdgCTAEBupp8cOvOw9WCvlQIDgPAoC
         NX6azlBwqsKUEDjIEMVe4/I50HGW67BDo8GIf2cWCULGPJRACwb8zSuW2oc8oimaf7wt
         cpSoM+wnEhgrKqadtRTN4+qge9QCZGxspgE8DUs2zyRBA042H+oJCQhWEXwiJ75zPGV7
         PBc8upOl2pnhJFEQAyOeJ0GTqvKLyyisJkrxQiMUyIjASjpsh+vzr4YHfqUAqlvGCbTO
         PWdA==
X-Gm-Message-State: AFuF++mjeOAo85aXYz5RlxLmw5BTcUjroSJcDwwKwRd+Rm9uvHmE9xQ3
	3aKxUWGv+Rp47QlM2Cf7Fw28qx/zh8ZOT/Jr1ELVhRNbhQocBjatNdP9epda4Bri8q6u0MUN/mm
	cuN3y2TBKTVcT52CaKjz+x+NJe6cZyyIy0akwYw9LjIX0br7IqW/fULhQfSn/1i0HP61d3/iKdQ
	==
X-Gm-Gg: AYBFou1U1BbD9xNByZwFRM9kO51fjAczfAXTlJ0o0fd4B6AjzAqa2VTgrFUYpoEb9x1
	z8lVbCPpbaZs65GDFUra683iX7jTcfN6fQGpTXR7GTehiFydOk04JNI4EqaisBh+rGkgSb/o24S
	Dl2PMKcj1wvUMF5O++ODQEr3PG6Ouzu/dB5w0N0P2NHCWUCoUAzzueCJVcLOHt/bdwaIf+qh3p4
	ePbJDWy8rhHn8RPLJ+TAngQqiUypgQNyyNciDsJvB0/FsHchSRFbPKQRZbxpYuF6tD5O+1RNI+g
	Mhh9Kty/rgmCJfiaIyMdS0bQ3sFQjgV3KqP0KBXcfdemxydz3gMsGqFfvhXPq25kxTNLWNnX0Nd
	JG9qao9S2CXSn8IEGghfTLCzfhJ0ppMDiTYizNbA7mVfUbFofE8j4QZ4UAtWVWgrQT8wUw4Emef
	P2NrRXQ1vgU/5l6ldX4kcOfef/
X-Received: by 2002:a17:90a:d004:b0:398:c9be:cca8 with SMTP id 98e67ed59e1d1-39b2609f363mr46817504a91.2.1788841104924;
        Mon, 07 Sep 2026 21:18:24 -0700 (PDT)
X-Received: by 2002:a17:90a:d004:b0:398:c9be:cca8 with SMTP id 98e67ed59e1d1-39b2609f363mr46817441a91.2.1788841104310;
        Mon, 07 Sep 2026 21:18:24 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm36615531eec.21.2026.09.07.21.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 21:18:23 -0700 (PDT)
Date: Tue, 8 Sep 2026 09:48:19 +0530
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
Cc: opensbi@lists.infradead.org
Subject: Re: [PATCH] lib: sbi: Fix DBTR error codes and semantics as per SBI
 v3.0 spec
Message-ID: <ap-Mi2DsE8wzEt3w@hu-himchau-blr.qualcomm.com>
References: <20260814172329.52258-1-david.garcia@aheadcomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260814172329.52258-1-david.garcia@aheadcomputing.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA0NCBTYWx0ZWRfX0PDf1xFv6ckx
 mxEu6AlGL6vpzARLEc8iotl3BNZoy8z4/vocHjELMJfEei1TsEnEv21XLQcrgFf1AkT8Hd+05O3
 TuS7SB9aVjcykEYWTT7lrqixcqAlqWH68hfgScGYY65xxyMbeTgPFujI5nkWdL+BOVveC5iHJYo
 rIGmkNDqHF6orjQKUutuTYvOT/ItrEIT9IpUIUfhhSI1KEdUQhGj/7jKIf5sQgpifuJ3sSGrTit
 8i6nuvq/pmq2AChcPAdWPI9LHYzwGxkiSPOik3Jlv+ZgiAn33ZsiXylTK2HCH4asOtGPjGZbSH1
 QrhOuFvtUzOKv800y0wfavGh81sbLa3F5/Nbt/M3A1KVDK6mQ4HmzDuIeYH8WusvCRsLjSKDi0h
 NAzKiiesRKXr3t/9L4c8XWiqKxFCGRU2SLum+IDJK3Zsr60NezM9Bopmp02SaVU3NIx3qvPnmD+
 csA2CrSU+wd/Gd0DMcA==
X-Authority-Analysis: v=2.4 cv=Xbe5Co55 c=1 sm=1 tr=0 ts=6a9f8c92 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=JfrnYn6hAAAA:8 a=mlbbMAg2AAAA:8 a=h0HFRB-iABERQTE3ktIA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=1CNFftbPRP8L7MoqJWF3:22 a=MVgJjSScqoDYXLft4fpg:22
X-Proofpoint-ORIG-GUID: Nnq4-i_T6cq9cbPtSPb9io9McwTjalaD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA0NCBTYWx0ZWRfX7SijICFAj0bx
 BrGWfYdRLZN447pYRb29T6IAb1kpoFZZ/fi+Y0sgXMQZkJGQe+8BIo3ILKnc+Fm5tJRB8WAneub
 RvcCoK4iRsTPDPrzU9rSLeUnTjW/whk=
X-Proofpoint-GUID: Nnq4-i_T6cq9cbPtSPb9io9McwTjalaD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_07,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_211837_084727_FDB750F9 
X-CRM114-Status: GOOD (  32.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

HI David,

On Fri, Aug 14, 2026 at 11:23:29AM -0600, David E. Garcia Porras wrote:
> Align the Debug Triggers (DBTR) extension implementation with the
> error codes and behavior required by the SBI v3.0 specification,
> chapter 19:
> 
>  - sbi_debug_set_shmem (sec 19.2): accept the flags parameter and
>    return SBI_ERR_INVALID_PARAM when it is not zero. Also validate
>    the entire shared memory range of trig_max * (XLEN / 2) bytes
>    instead of only the base address, returning SBI_ERR_INVALID_ADDRESS
>    when the range is not accessible.
> 
>  - sbi_debug_install_triggers (sec 19.4, table 101): return
>    SBI_ERR_BAD_RANGE when trig_count >= trig_max, and return
>    SBI_ERR_NOT_SUPPORTED instead of SBI_ERR_FAILED when the trigger
>    type is not supported.
> 
>  - sbi_debug_update_triggers (sec 19.5, table 102): return the array
>    index of the failing trigger configuration in sbiret.value, and
>    return SBI_ERR_INVALID_PARAM when trig_tdata1.type or
>    trig_tdata1.chain do not match the originally installed debug
>    trigger. Validate the complete request before updating any trigger.
> 
>  - sbi_debug_uninstall_triggers, sbi_debug_enable_triggers and
>    sbi_debug_disable_triggers (secs 19.6-19.8, tables 103-105): return
>    SBI_ERR_INVALID_PARAM when any trigger in the set has
>    trig_idx >= trig_max, and validate the complete set before acting
>    on any trigger so a partially processed batch is not left behind.
> 
>  - Set the trig_state.have_hw_trig bit when a trigger is mapped to a
>    HW debug trigger (table 98).
> 
> Signed-off-by: David E. Garcia Porras <david.garcia@aheadcomputing.com>
> ---
>  include/sbi/sbi_dbtr.h   |  5 ++-
>  lib/sbi/sbi_dbtr.c       | 91 +++++++++++++++++++++++++++++++++-------
>  lib/sbi/sbi_ecall_dbtr.c |  4 +-
>  3 files changed, 81 insertions(+), 19 deletions(-)
> 
> diff --git a/include/sbi/sbi_dbtr.h b/include/sbi/sbi_dbtr.h
> index 5e0bf84e..e6b76086 100644
> --- a/include/sbi/sbi_dbtr.h
> +++ b/include/sbi/sbi_dbtr.h
> @@ -104,7 +104,8 @@ int sbi_dbtr_init(struct sbi_scratch *scratch, bool coldboot);
>  int sbi_dbtr_supported(void);
>  int sbi_dbtr_setup_shmem(const struct sbi_domain *dom, unsigned long smode,
>  			 unsigned long shmem_phys_lo,
> -			 unsigned long shmem_phys_hi);
> +			 unsigned long shmem_phys_hi,
> +			 unsigned long flags);
>  int sbi_dbtr_num_trig(unsigned long trig_tdata1, unsigned long *out);
>  int sbi_dbtr_read_trig(unsigned long smode,
>  		       unsigned long trig_idx_base, unsigned long trig_count);
> @@ -115,7 +116,7 @@ int sbi_dbtr_uninstall_trig(unsigned long trig_idx_base,
>  int sbi_dbtr_enable_trig(unsigned long trig_idx_base,
>  			 unsigned long trig_idx_mask);
>  int sbi_dbtr_update_trig(unsigned long smode,
> -			 unsigned long trig_count);
> +			 unsigned long trig_count, unsigned long *out);
>  int sbi_dbtr_disable_trig(unsigned long trig_idx_base,
>  			  unsigned long trig_idx_mask);
>  
> diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
> index 01047969..1d4785c7 100644
> --- a/lib/sbi/sbi_dbtr.c
> +++ b/lib/sbi/sbi_dbtr.c
> @@ -261,8 +261,10 @@ int sbi_dbtr_get_total_triggers(void)
>  
>  int sbi_dbtr_setup_shmem(const struct sbi_domain *dom, unsigned long smode,
>  			 unsigned long shmem_phys_lo,
> -			 unsigned long shmem_phys_hi)
> +			 unsigned long shmem_phys_hi,
> +			 unsigned long flags)
>  {
> +	unsigned long shmem_size;
>  	struct sbi_dbtr_hart_triggers_state *hart_state;
>  
>  	if (dom && !sbi_domain_is_assigned_hart(dom, current_hartindex())) {
> @@ -271,6 +273,9 @@ int sbi_dbtr_setup_shmem(const struct sbi_domain *dom, unsigned long smode,
>  		return SBI_ERR_DENIED;
>  	}
>  
> +	if (flags)
> +		return SBI_ERR_INVALID_PARAM;
> +
>  	hart_state = dbtr_thishart_state_ptr();
>  	if (!hart_state)
>  		return SBI_ERR_FAILED;
> @@ -304,9 +309,11 @@ int sbi_dbtr_setup_shmem(const struct sbi_domain *dom, unsigned long smode,
>  	if (shmem_phys_hi)
>  		return SBI_EINVALID_ADDR;
>  
> -	if (dom && !sbi_domain_check_addr(dom,
> -		  DBTR_SHMEM_MAKE_PHYS(shmem_phys_hi, shmem_phys_lo), smode,
> -		  SBI_DOMAIN_READ | SBI_DOMAIN_WRITE))
> +	/* Must fail if address *range* is not fully accessible - size is assumed to be trig_max * (XLEN /2) bytes */
> +	shmem_size = (unsigned long) hart_state->total_trigs * (__riscv_xlen / 2);
> +	if (dom && !sbi_domain_check_addr_range(dom,
> +		  DBTR_SHMEM_MAKE_PHYS(shmem_phys_hi, shmem_phys_lo), shmem_size,
> +		  smode, SBI_DOMAIN_READ | SBI_DOMAIN_WRITE))
>  		return SBI_ERR_INVALID_ADDRESS;
>  
>  	hart_state->shmem.phys_lo = shmem_phys_lo;
> @@ -332,6 +339,7 @@ static void dbtr_trigger_setup(struct sbi_dbtr_trigger *trig,
>  	trig->state = 0;
>  
>  	__set_bit(RV_DBTR_BIT(TS, MAPPED), &trig->state);
> +	__set_bit(RV_DBTR_BIT(TS, HAVE_TRIG), &trig->state);
>  
>  	SET_TRIG_HW_INDEX(trig->state, trig->index);
>  
> @@ -616,6 +624,9 @@ int sbi_dbtr_install_trig(unsigned long smode,
>  	if (!hs)
>  		return SBI_ERR_FAILED;
>  
> +	if (trig_count >= hs->total_trigs)
> +		return SBI_ERR_BAD_RANGE;
> +
>  	if (sbi_dbtr_shmem_disabled(hs))
>  		return SBI_ERR_NO_SHMEM;
>  
> @@ -641,7 +652,7 @@ int sbi_dbtr_install_trig(unsigned long smode,
>  			*out = _idx;
>  			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
>  							trig_count * sizeof(*entry));
> -			return SBI_ERR_FAILED;
> +			return SBI_ERR_NOT_SUPPORTED;
>  		}
>  
>  		if (!dbtr_trigger_valid(TDATA1_GET_TYPE(ctrl), ctrl)) {
> @@ -702,13 +713,17 @@ int sbi_dbtr_uninstall_trig(unsigned long trig_idx_base,
>  	if (!hs)
>  		return SBI_ERR_FAILED;
>  
> -	for_each_set_bit_from(idx, &trig_mask, hs->total_trigs) {
> +	for_each_set_bit_from(idx, &trig_mask, RV_MAX_TRIGGERS) {

Why RV_MAX_TRIGGERS? hs->total_trigs may be less than RV_MAX_TRIGGERS and you will want to
work only on available triggers.

>  		trig = INDEX_TO_TRIGGER(idx);
> -		if (!(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED)))
> +		if (!(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED)) || idx >= hs->total_trigs)

Better add a boolean macro IS_TRIGGER_MAPPED(trig).

>  			return SBI_ERR_INVALID_PARAM;
> +	}
>  
> +	/* Only uninstall after validating the arguments - maintain atomicity */
> +	idx = trig_idx_base;
> +	for_each_set_bit_from(idx, &trig_mask, hs->total_trigs) {
> +		trig = INDEX_TO_TRIGGER(idx);
>  		dbtr_trigger_clear(trig);
> -
>  		sbi_free_trigger(trig);
>  	}
>  
> @@ -727,6 +742,14 @@ int sbi_dbtr_enable_trig(unsigned long trig_idx_base,
>  	if (!hs)
>  		return SBI_ERR_FAILED;
>  
> +	for_each_set_bit_from(idx, &trig_mask, RV_MAX_TRIGGERS) {

ditto.

> +		trig = INDEX_TO_TRIGGER(idx);
> +		if (!(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED)) || idx >= hs->total_trigs)
> +			return SBI_ERR_INVALID_PARAM;
> +	}
> +
> +	/* Only enable after validating the arguments - maintain atomicity */
> +	idx = trig_idx_base;
>  	for_each_set_bit_from(idx, &trig_mask, hs->total_trigs) {

If RV_MAX_TRIGGERS there, then why total_trigs here?

>  		trig = INDEX_TO_TRIGGER(idx);
>  		sbi_dprintf("%s: enable trigger %lu\n", __func__, idx);
> @@ -737,8 +760,9 @@ int sbi_dbtr_enable_trig(unsigned long trig_idx_base,
>  }
>  
>  int sbi_dbtr_update_trig(unsigned long smode,
> -			 unsigned long trig_count)
> +			 unsigned long trig_count, unsigned long *out)
>  {
> +	int stat = SBI_SUCCESS;
>  	unsigned long trig_idx;
>  	struct sbi_dbtr_trigger *trig;
>  	union sbi_dbtr_shmem_entry *entry;
> @@ -772,23 +796,52 @@ int sbi_dbtr_update_trig(unsigned long smode,
>  		trig_idx = entry->id.idx;
>  
>  		if (trig_idx >= hs->total_trigs) {
> -			sbi_hart_protection_unmap_range((unsigned long)entry, sizeof(*entry));
> -			return SBI_ERR_INVALID_PARAM;
> +			stat = SBI_ERR_INVALID_PARAM;
> +			goto endloop;
>  		}
>  
>  		trig = INDEX_TO_TRIGGER(trig_idx);
>  
>  		if (!(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED))) {
> -			sbi_hart_protection_unmap_range((unsigned long)entry, sizeof(*entry));
> -			return SBI_ERR_FAILED;
> +			stat = SBI_ERR_FAILED;
> +			goto endloop;
> +		}
> +
> +		if (TDATA1_GET_TYPE(entry->data.tdata1) != TDATA1_GET_TYPE(trig->tdata1)) {
> +			stat = SBI_ERR_INVALID_PARAM;
> +			goto endloop;
> +		}
> +
> +		switch(TDATA1_GET_TYPE(entry->data.tdata1)) {
> +			case RISCV_DBTR_TRIG_MCONTROL:
> +			case RISCV_DBTR_TRIG_MCONTROL6:
> +				if ( (entry->data.tdata1 & RV_DBTR_BIT_MASK(MC6, CHAIN)) != (trig->tdata1 & RV_DBTR_BIT_MASK(MC6, CHAIN)) ) {

Exceeds char limit. Also would you please add comments? Add a boolean macro IS_TRIGGER_CHAINED(trig).


> +					stat = SBI_ERR_INVALID_PARAM;
> +					goto endloop;
> +				}
> +				break;
> +			default:
> +				break;
>  		}
>  
>  		if ((entry->data.tdata2 && !tdata2_impl) ||
>  		    (entry->data.tdata3 && !tdata3_impl)) {
> -			sbi_hart_protection_unmap_range((unsigned long)entry, sizeof(*entry));
> -			return SBI_ERR_NOT_SUPPORTED;
> +			stat = SBI_ERR_NOT_SUPPORTED;
> +			goto endloop;
>  		}
>  
> +		endloop:
> +			sbi_hart_protection_unmap_range((unsigned long)entry, sizeof(*entry));
> +			if (stat != SBI_SUCCESS) {
> +				*out = _idx;
> +				return stat;
> +			}

Is this necessary? End of function error cleanup would be a better place. Right now its same as before.

> +	}
> +
> +	/* Only update after validating request - maintain atomicity */
> +	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
> +		sbi_hart_protection_map_range((unsigned long)entry, sizeof(*entry));
> +		trig = INDEX_TO_TRIGGER(entry->id.idx);
>  		dbtr_trigger_setup(trig, &entry->data);
>  		sbi_hart_protection_unmap_range((unsigned long)entry, sizeof(*entry));
>  		dbtr_trigger_enable(trig);
> @@ -809,6 +862,14 @@ int sbi_dbtr_disable_trig(unsigned long trig_idx_base,
>  	if (!hs)
>  		return SBI_ERR_FAILED;
>  
> +	for_each_set_bit_from(idx, &trig_mask, RV_MAX_TRIGGERS) {

Again why not total_trigs? There is inconsistencies.

> +		trig = INDEX_TO_TRIGGER(idx);
> +		if (!(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED)) || idx >= hs->total_trigs)
> +			return SBI_ERR_INVALID_PARAM;
> +	}
> +
> +	/* Only disable after validating the arguments - maintain atomicity */
> +	idx = trig_idx_base;

You should probably wait for @liutong patches which try to fix TOCTOU.

>  	for_each_set_bit_from(idx, &trig_mask, hs->total_trigs) {
>  		trig = INDEX_TO_TRIGGER(idx);
>  		dbtr_trigger_disable(trig);
> diff --git a/lib/sbi/sbi_ecall_dbtr.c b/lib/sbi/sbi_ecall_dbtr.c
> index 40a437ee..b86ce5b3 100644
> --- a/lib/sbi/sbi_ecall_dbtr.c
> +++ b/lib/sbi/sbi_ecall_dbtr.c
> @@ -28,7 +28,7 @@ static int sbi_ecall_dbtr_handler(unsigned long extid, unsigned long funcid,
>  		break;
>  	case SBI_EXT_DBTR_SETUP_SHMEM:
>  		ret = sbi_dbtr_setup_shmem(sbi_domain_thishart_ptr(), smode,
> -					   regs->a0, regs->a1);
> +					   regs->a0, regs->a1, regs->a2);
>  		break;
>  	case SBI_EXT_DBTR_TRIGGER_READ:
>  		ret = sbi_dbtr_read_trig(smode, regs->a0, regs->a1);
> @@ -43,7 +43,7 @@ static int sbi_ecall_dbtr_handler(unsigned long extid, unsigned long funcid,
>  		ret = sbi_dbtr_enable_trig(regs->a0, regs->a1);
>  		break;
>  	case SBI_EXT_DBTR_TRIGGER_UPDATE:
> -		ret = sbi_dbtr_update_trig(smode, regs->a0);
> +		ret = sbi_dbtr_update_trig(smode, regs->a0, &out->value);
>  		break;
>  	case SBI_EXT_DBTR_TRIGGER_DISABLE:
>  		ret = sbi_dbtr_disable_trig(regs->a0, regs->a1);

As Anup said, please break it down to a series of patches rather than one huge patch.

Regards
Himanshu

> -- 
> 2.43.0
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
