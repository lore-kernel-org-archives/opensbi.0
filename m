Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC400606A31E
	for <opensbi@archiver.kernel.org>; Tue, 24 Nov 2026 06:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qR9rtU1H;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hRfm0siy;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W+iuWrpy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1b8oajS7b1ztVkZ+lPPq4PsOhY3lX7I4MR1qEksnSiw=; b=qR9rtU1HkT50So5PiO86sHDiE8
	SL4ZnvgF0EmxNVFOyoRuwYR9PwSyA4e0qAjSScgLSxpxYcVTpSMW1/eCP8syRFkouRZMGNUwX5jvv
	jGCmutKJkn/5pYx5yM5K5DDAZa+gqNgRbWZKNnhw0bDJdLPK88sbmvN/Kl5I6+OI5XAtzCU3KKU6M
	OSZyIE6jIIk5OSUlO4AvT5abmJCtLsr+B391iQK7DQqyBzAd0E5gIsENTJmbEUmB3iLVw/LSS6cNF
	gzVfWzgRPRmVOUBlhMeciCw8atf8icH+vxTlJJcTEB1yTISxoBVKphZd3pkKq1FgHeaBVVCT7u3jo
	S209WJVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVk7B-00000005eva-2Tzf;
	Tue, 24 Nov 2026 06:34:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVk78-00000005ev7-3MXM
	for opensbi@lists.infradead.org;
	Tue, 24 Nov 2026 06:34:52 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2kBQY196998
	for <opensbi@lists.infradead.org>; Tue, 24 Nov 2026 06:34:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xJiXD/7TTMCzpoEiZTIcyWtn
	PFPivJJphtk94Qu4O58=; b=hRfm0siyxmVEGOHBJlsok5cIQ0R1Z9ndEGY88zw7
	X5zD8sSNGRxF7BQjZRNhSNn1NtxJyc0zggxRwYF7rUygB13RuYG3AYd2s7FR7QqT
	RQDlUzLnBe0EwuBM6o47L/5s8Rg2utpBYKkCNks7ChhhtOjzMvFuUQM+VlImdSsY
	ePnpv9FNkMWBrV0E5pyoSyxW1ZxstuaACDZxxKQ3tsMk0Vk3v5ui/okoj5LFS5Ai
	YkEgpqAlxY4vrp6baPw+yOiFDPgwxczIFSKXGlwLvbGQm1mM3MbxiVaqzGkdFPxs
	d9Bu2CEkKVP3bAxHmFSNYaY9dO/8uLhuz7CR4pu/45qJlQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukra5t2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 24 Nov 2026 06:34:50 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3854627c1c8so6150795eec.1
        for <opensbi@lists.infradead.org>; Mon, 23 Nov 2026 22:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795502090; x=1796106890; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xJiXD/7TTMCzpoEiZTIcyWtnPFPivJJphtk94Qu4O58=;
        b=W+iuWrpy9C6Y9lDFba7BlpE5MDZVmi3/UiEQ94OnmlQMvlc5/G7/+/Z1LjDXbUL4OY
         /A36vZCfu05J6tuP/Tm3lphguk2+LzZrZJhV9C/AspDcr8rAOv4mbZPtdfBv11JBnHsP
         35+zEhDjri1Anc74BEQRLnzsL815HGnPcVXYfvKy0oJ8zzb5xZHYI+yS4x45xcOxudaQ
         4tbp3JeihZ+sqj6IOthuRu9j4lWpy+H5GwxbSnTh4C84QLkiG/YMquuI/zLS08gEq+AB
         HHkFBAv6peKFUh+Dy5GjnkNvfcKzlAUvG31bDuWjdk6X5vML7pCsxKAOIs5159ezQSm7
         4pPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795502090; x=1796106890;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xJiXD/7TTMCzpoEiZTIcyWtnPFPivJJphtk94Qu4O58=;
        b=rTVhJbrK4Oov+HKyjXxq3qziWtUvYfN8ANINbCxgB8yGzBSdzme+aGsTZQGsnZOBTU
         ewMeu+FOTRt3qMXHIX8oq3A90XduivY4zFwHQ2M1Aq1rodnvxsi/bXA5NfO8sY96dFUK
         8UfLozvgz1/alFPrfIFKdguCse3NUEmRbO2daWOBjZBWMgHSQcZZlWvwC/NqpkECRQLL
         vUxwvC1BvDimUcu1j9CbBZCdh/bZjj0XSHy7bgMuXpOuS80VyuIC3b+Cyo1w54VVzkAX
         U5b0tn9wVdDwnw80za9OS3/QyIeAVqfqs/aR4i+DTZnwfoSdGlqZiHcFv/prsS9sR6td
         VD2Q==
X-Forwarded-Encrypted: i=1; AL+hErFA403HMLhPs4pXm9ofLaO1taCiHuvZXubLG2Mn6a7av6xXzgzWNilnGSMOifFWyPdcpAR21T3+@lists.infradead.org
X-Gm-Message-State: APuU4Z9rE4ChFzZNps1NBs/UUPdi30G5lOI567yijcTqxCpN2/pRM3jG
	FIzAKhCAZuJSaZ9+zXi5yC2XX0G1XOl0DkMDNFpewJ1Drwux/nCUUuonHneyPpao1Ra9lMUfDzp
	Vp2vX8UTOmKm/0byvTyIKMPOpbbsmY33Sxi1L7tPN1lhrV9wnJr0vDOxFo9cjmZJmWg==
X-Gm-Gg: AZFdTZec+o/O14R/CekIddYGPIsayWYatyDJ3YKLs2HqS4h/HPNsYhgEfub6oWS6HcR
	H7r0G8MsL5Rmgtk8vqE//crOF0mhOXRtxmfduOwkNsRv7ebdklDEzLoHkJa98Y+GRbKqeOtmmTz
	cD5Ei1HAfA8W6ftaSZHd2m4/k5Y7zc2qxi0UYqJm26kAKvWVFm/rruJl59g84feaTwiZuN7oWHc
	EaGSMgPiAqBvkVvL06/XsvhXXYB9PxqKhgJmlqjsU6CQifqEQ7A9Fxp7NCtcHlIvctXNuOunvib
	gXT9IxgMlKPoCZmvJnnfra4unnRZmK5ishOwPmfwMTRBgPcEZ0yNiyPoW9I3Syxup0MNoIGEZLf
	TxliFJXXQ6XhVaKGevzDbmugvIjIk3dUhrbx5yHhk/Q4OAQrhPNkRiv2f8k4PsbRGTGAGrGM2WW
	MIuObgs7lP5K1F3N9S+0uw9oUGNDz4yspEt6sEjdM69MJRcDo5rVye3vMSHL/oNXQO6ltOHNjp
X-Received: by 2002:a05:7300:7c08:b0:384:3123:a0cb with SMTP id 5a478bee46e88-3856ff5b880mr22285058eec.27.1795502089508;
        Mon, 23 Nov 2026 22:34:49 -0800 (PST)
X-Received: by 2002:a05:7300:7c08:b0:384:3123:a0cb with SMTP id 5a478bee46e88-3856ff5b880mr22285039eec.27.1795502088990;
        Mon, 23 Nov 2026 22:34:48 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3866f299d0bsm34128364eec.19.2026.11.23.22.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:34:48 -0800 (PST)
Date: Tue, 24 Nov 2026 12:04:44 +0530
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
        opensbi@lists.infradead.org
Subject: Re: [PATCH 6/7] lib: sbi: dbtr: report the failing index of UPDATE
Message-ID: <awUwBJSMNMFjuYYE@hu-himchau-blr.qualcomm.com>
References: <20261120231119.90214-1-heinrich.schuchardt@canonical.com>
 <20261120231119.90214-7-heinrich.schuchardt@canonical.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261120231119.90214-7-heinrich.schuchardt@canonical.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyNSBTYWx0ZWRfX0znpqeRQvWod
 g/3q5cJmIn+Hork43ebGwufYkEeDH4nACIoayQ2/ORkFXmMe1f1zvqe4FJT8IoyQdMNhcBfk3GS
 7IZ/BrgdaO2ZSyo9/C6MgjjDY6wIzao=
X-Proofpoint-ORIG-GUID: Ckeyd9T1ate9I18wsLNRfNobu2BmXVcG
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b05300a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=JfrnYn6hAAAA:8 a=DfNHnWVPAAAA:8 a=EUspDBNiAAAA:8 a=T1ahe28ADJCvHduAaJsA:9
 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=rjTVMONInIDnV1a_A2c_:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyNSBTYWx0ZWRfX9v2BNgZ/tYB9
 m0oy7xpqraJiifbOww8+dCUrlkThW+TGVrfnkGNnbE+daxS+4SUqlg4ZssZMHa/ibx+rOQFkdvj
 +ZsAuWwMqxY38lQt6MkWblvyGDgecIGQXhMVdW5+R6H9CMqh73wV7pejh7mHjipkFpjCcvY7rmb
 +S/zENMaWrU56bklOmXfrM3sQauXJtiHb7lyXAS5+ZsqCG11v2HUyxNzNXDrz8XrrJUwrw7N5dx
 gvSita+Gj1aCBJmiwauBkgBoEeHll5rT4uayNi0pp0HwTqBy3Fe3SgGerCcaOThYi5TijoiHaVR
 66rzFnxAlLLMcclc64p4IIlOa1/eT29coNG2BOv37pU8gm7BysnBXVMOUg33a/0Rs9l0j+gRLsD
 ihAyt1ebDhkBrt6JWesK/Epc6nFQuBcE/E7GWKZ8ZNcY5tGyL9dsF6qr0V/Gx/ZArtrKlkP4mTK
 VBXCVKxuqJup4MPqZbA==
X-Proofpoint-GUID: Ckeyd9T1ate9I18wsLNRfNobu2BmXVcG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_223450_847121_A03B5F08 
X-CRM114-Status: GOOD (  23.72  )
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

On Sat, Nov 21, 2026 at 12:11:18AM +0100, Heinrich Schuchardt wrote:
> The specification says that sbi_debug_update_triggers() returns the
> array index i of the failing trigger configuration in sbiret.value, and
> zero on success, like sbi_debug_install_triggers().
> 
> The update function had no output parameter and the ecall handler did
> not pass one, so sbiret.value was always zero. A failure in the second
> entry of a batch looked like a failure of the first one.
> 
> Pass &out->value to sbi_dbtr_update_trig() and set it to the array index
> on every failure inside the loop.
> 
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
>  include/sbi/sbi_dbtr.h   | 2 +-
>  lib/sbi/sbi_dbtr.c       | 5 ++++-
>  lib/sbi/sbi_ecall_dbtr.c | 2 +-
>  3 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/include/sbi/sbi_dbtr.h b/include/sbi/sbi_dbtr.h
> index 86af03f2..ab2038f2 100644
> --- a/include/sbi/sbi_dbtr.h
> +++ b/include/sbi/sbi_dbtr.h
> @@ -126,7 +126,7 @@ int sbi_dbtr_uninstall_trig(unsigned long trig_idx_base,
>  int sbi_dbtr_enable_trig(unsigned long trig_idx_base,
>  			 unsigned long trig_idx_mask);
>  int sbi_dbtr_update_trig(unsigned long smode,
> -			 unsigned long trig_count);
> +			 unsigned long trig_count, unsigned long *out);
>  int sbi_dbtr_disable_trig(unsigned long trig_idx_base,
>  			  unsigned long trig_idx_mask);
>  
> diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
> index 01b74f5f..a6b860da 100644
> --- a/lib/sbi/sbi_dbtr.c
> +++ b/lib/sbi/sbi_dbtr.c
> @@ -943,7 +943,7 @@ int sbi_dbtr_enable_trig(unsigned long trig_idx_base,
>  }
>  
>  int sbi_dbtr_update_trig(unsigned long smode,
> -			 unsigned long trig_count)
> +			 unsigned long trig_count, unsigned long *out)
>  {
>  	unsigned long trig_idx;
>  	struct sbi_dbtr_trigger *trig;
> @@ -973,6 +973,7 @@ int sbi_dbtr_update_trig(unsigned long smode,
>  		trig_idx = entry->id.idx;
>  
>  		if (trig_idx >= hs->total_trigs) {
> +			*out = _idx;
>  			sbi_hart_protection_temp_unmap_range((unsigned long)entry, sizeof(*entry));
>  			return SBI_ERR_INVALID_PARAM;
>  		}
> @@ -980,6 +981,7 @@ int sbi_dbtr_update_trig(unsigned long smode,
>  		trig = INDEX_TO_TRIGGER(trig_idx);
>  
>  		if (!(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED))) {
> +			*out = _idx;
>  			sbi_hart_protection_temp_unmap_range((unsigned long)entry, sizeof(*entry));
>  			return SBI_ERR_FAILED;
>  		}
> @@ -987,6 +989,7 @@ int sbi_dbtr_update_trig(unsigned long smode,
>  		rc = dbtr_check_trigger_config(hs, trig, &entry->data,
>  					       tdata2_impl, tdata3_impl);
>  		if (rc) {
> +			*out = _idx;
>  			sbi_hart_protection_temp_unmap_range((unsigned long)entry, sizeof(*entry));
>  			return rc;
>  		}
> diff --git a/lib/sbi/sbi_ecall_dbtr.c b/lib/sbi/sbi_ecall_dbtr.c
> index 704af5a4..b86ce5b3 100644
> --- a/lib/sbi/sbi_ecall_dbtr.c
> +++ b/lib/sbi/sbi_ecall_dbtr.c
> @@ -43,7 +43,7 @@ static int sbi_ecall_dbtr_handler(unsigned long extid, unsigned long funcid,
>  		ret = sbi_dbtr_enable_trig(regs->a0, regs->a1);
>  		break;
>  	case SBI_EXT_DBTR_TRIGGER_UPDATE:
> -		ret = sbi_dbtr_update_trig(smode, regs->a0);
> +		ret = sbi_dbtr_update_trig(smode, regs->a0, &out->value);
>  		break;
>  	case SBI_EXT_DBTR_TRIGGER_DISABLE:
>  		ret = sbi_dbtr_disable_trig(regs->a0, regs->a1);

Looks good.

Reviewed-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>

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
