Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DF5606A31E
	for <opensbi@archiver.kernel.org>; Tue, 24 Nov 2026 06:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oZ+mgJgK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CvgW7Xzv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XLAoEWQj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OCzWGGm3DWRNsI1d337s1Tya6oHqDITp9y95Hh/NRXs=; b=oZ+mgJgKi424LQ2aYaMRIv18FM
	eKqiNSZfBol02OAnV14Ba/C1hvWSTJYasz1dq+nsFn6NrzFFDsWbV0ObTxppjI4RP5Nlo+A1GivXL
	/RHHoO6k3p6fwGvrdrCQcfPf32H212bgQ00TVBdlcQi1P7QwWJ0OyB0Ehtp6YcM3n1RJv7ulTnNpy
	DXoIJWzn2A2+1z3qWFahib2IIPYVl2/AFfNxupv58v5W3cXnDKEcKiWhsYtT8g/GQeFh0IMoBipPQ
	AJBeg0BM8V8E+pyfLGxfx+sb2PKTRn2j4wPLfZ1+004IG0RAk8/vxwGVCLPWNyr8ymrHuzY3MT/CD
	jJgogCZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVk0H-00000005ebe-46WI;
	Tue, 24 Nov 2026 06:27:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVk0D-00000005eb6-426k
	for opensbi@lists.infradead.org;
	Tue, 24 Nov 2026 06:27:44 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2k6RZ3225413
	for <opensbi@lists.infradead.org>; Tue, 24 Nov 2026 06:27:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GkNiXfrZPGLUZnAUode8wzPb
	e8oxZ9fCQw2mW3E+P0Y=; b=CvgW7Xzvy2mhPBDRuuUPe6TAeyvvxRXSztptrzO0
	RDf0i+z85Cys/KZ+BWxS44MTaaEDrnCNKyZDS85vhR6TEhlbhNt5jvU05rZfeJdj
	sDe0VDesbjbcoZMsVnS6CK1ANKR3wZuXxItfoZRQVT/iLB17ZO1C8WHOjEQ1jYkd
	YkP6bJ9fT99/oxh60zcpaqmpjphm8+WFqKrTr2+aTvSm8S18fmbfVzzFd+l6dwln
	6gohm5jelVLqICUkWwB8kJC0DbTq6Kotc4hDb3NmCrtHkHpcLUMlk99S3JPyx4cb
	5AdittF4ztxIP13Fr3n+Z5imuPJBOHZagHt8XYtWOeo85Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4x8f1h69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 24 Nov 2026 06:27:41 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-382af5cfc58so2773824eec.0
        for <opensbi@lists.infradead.org>; Mon, 23 Nov 2026 22:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795501661; x=1796106461; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GkNiXfrZPGLUZnAUode8wzPbe8oxZ9fCQw2mW3E+P0Y=;
        b=XLAoEWQj4UxoUBnOwPna0mHuyw7BssZc4id5dnSdpr9gxygww+OJzX+U1ety10+1pM
         uzMvrAA/ssoWB1XMlv3YD7lbZAK33JbsYynYPXUhtRg4RqgIa6O1OwGDJ4+YgjepHd2n
         jvsTbD8sAQ2qnEB8xTTo+5kaHPcZwXAn/Z0zOePPqHjaEq1iYuBd4U9dkWaOLfBHTyXB
         vzcsGKUPnzPqnMcaQoOZv8HT1KSVjBGZSDJ3vnSIRInBX99XNPzBSZzJwbLp2HyMaeq2
         EWFfAQ6uQetEoXO/LyD/EyCRlL5+T75oMw1lfu2xCAT+XZkNt3KfgnTQAYhyFNJaiIu5
         zCCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795501661; x=1796106461;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GkNiXfrZPGLUZnAUode8wzPbe8oxZ9fCQw2mW3E+P0Y=;
        b=Ujg191puDIAsGKNnt3c5sa1lpcc7MXaBVR2xfWZjFjNLdlfDsnYJT1TcI0pSzCJahl
         iDIKWPmF7GWOlrT9j/Kzis6hYbfjosgpdGnJoy1a4QRNqxxRU0KK6TsltnhvdkKsogyZ
         OjuL2b3XzxN5ypA8okQpsexpoKTRnPDv1+dV3Od/JVJ6Rr6RMIITqoFa/RK6R++xm2Mt
         wosWGvuf1SfIfUvPtrvnKY+uF4RtrZwU1G/AdqJD+boCZ3hlRr66glk/4In1njzCIEwB
         6n2/K5/I0/qnkTb3UtJiCzxu+FAtY/cGWVHisnmhO5ohs25sqAJ3DCa6Kz7DYgeUdXLh
         Ag6Q==
X-Forwarded-Encrypted: i=1; AL+hErGYn1dwpmEOxnfahpP1KK1ea4x7MVaoEVF/I0ezFgK8KVnPRgPG/lCedwb+hUGJoVs1WKAUA8Br@lists.infradead.org
X-Gm-Message-State: APuU4Z945N6ntfSQzxH55cqFW2EUDij8z2ijjFWVv7ZPIav6/W0PRGZh
	Md/8vlXjN/MO6QgraJjVtg24r/d1OonzUVP3CcQbVP0Vx6+m9lXwhrM/tZ0ImT5YsGIcHJo0kAu
	ifJvuotoG7KrbZu0+qm/vu/1UHugKIDmQLLdA9UE5EkpDqEmvIHfLxNW1nGj1IwLpEQ==
X-Gm-Gg: AZFdTZedYo/+IBWXcXTS0XA5UbBNDqg9xnNQFk3aaHeXwctosSjk+Muo3mofBTNuCfK
	ard91PBmfXSd4CFark+1GLwIfWMySprR2n2pyITy0jE/MLDTMfCAxbI0CcYzWc5KYmG1h+yAsrz
	AyMR/dhoXAtcaK59ZRiavJPGpd84TB6vXT4aJ0CQL27jGOAf1L8HuuXT0lZO253G9WMf2G/sAgf
	4kTuw687THkqXV1DXPhE/qRD0HFDsZq8QPJ0v0ivYs0+Yxd9qDoHiH1HFiJYkQGSohKIvv3EC5f
	YaSA7y8K7BZLRyZf71Rs4MWNOzOsfnATr3KdZ5VivK3a3Fva0a4jf4MRBZ3r6Wp/wBMe7CNKK/h
	eSfFWjWCVt8dlKJXzOhs4XgkN9i/9PL0QVrqLi25FbJ5q3g1n1sXYyZsS6V9/wwyi4q4pP3VZIT
	vi1iA+LzGVFo1g6/tUGpgyQVvnSfeKDdN3ITQqOCdjw17UvcK9Sp4aHyfFVK7Uq5+T35D9NhmS
X-Received: by 2002:a05:7301:fd06:b0:369:f05d:6c5c with SMTP id 5a478bee46e88-3856f549471mr14286308eec.28.1795501660552;
        Mon, 23 Nov 2026 22:27:40 -0800 (PST)
X-Received: by 2002:a05:7301:fd06:b0:369:f05d:6c5c with SMTP id 5a478bee46e88-3856f549471mr14286284eec.28.1795501660038;
        Mon, 23 Nov 2026 22:27:40 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm49240872eec.10.2026.11.23.22.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:27:39 -0800 (PST)
Date: Tue, 24 Nov 2026 11:57:35 +0530
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
        opensbi@lists.infradead.org
Subject: Re: [PATCH 5/7] lib: sbi: dbtr: keep type and chain of a trigger in
 UPDATE
Message-ID: <awUuV6-iB-kzpDTm@hu-himchau-blr.qualcomm.com>
References: <20261120231119.90214-1-heinrich.schuchardt@canonical.com>
 <20261120231119.90214-6-heinrich.schuchardt@canonical.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261120231119.90214-6-heinrich.schuchardt@canonical.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyNSBTYWx0ZWRfX0GqxbL4s3MIT
 aE9XgNWGzCz1VrVrJC+S+psGlbU56orlNS8HGTKSng9rj9K5K/449z8tmMDgkR5zBryAzpLrTEa
 63ypNvYSkOin6YTkUPy7nWxq4IXOI+E=
X-Authority-Analysis: v=2.4 cv=JbgpPkKV c=1 sm=1 tr=0 ts=6b052e5d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=JfrnYn6hAAAA:8 a=DfNHnWVPAAAA:8 a=EUspDBNiAAAA:8 a=DtssGoY8kpqnmDkfurgA:9
 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=rjTVMONInIDnV1a_A2c_:22
X-Proofpoint-GUID: WQz3Ik7DC-NKM44NmApwbsoi0hVWjmlU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyNSBTYWx0ZWRfX5EO2vUo7vIRa
 20NVNPK/DRgjT0heSNIm39XTsXGC0Ya6fp/v6F1yk5JAMAD0zCjCd1kOwya22VbNOTC+fvNIA5U
 KTu96pgkq9R5rDovskELOAocA1Cd358OVjtMR02sV4cRd4BJI3dX/SiMbEdGrxiC0G78Ie8n+gc
 YQWtSbUWK33F7Nz4PkPE8ZYPXAcxA0Cye2q0ZJEI7wCXLbLCvQL1S4zFlmcmDDBo5RV1Pya1wvw
 R92OxyPbbiZ/csvLxEHnmE/cWBkNRFJ0jP1QK1E8Utr0mI1I4mxjuO8difx8ICtgES5HlJQ3xAk
 4lV64xFrL0DyZxju8iGLt5RRRoPKhEnntAfEexszjlv+wMakbe9+Y3DuJiZiqq+Y7KbP4dXbLsA
 qMF0CnsOg8sSfHoCLepxGasyU8PwsYf5IIunWTaOlPgVGVS4YYCktGsbZo+00SQK7wTMyc+Lk41
 DG1Jb5PeIuGKp1aImpA==
X-Proofpoint-ORIG-GUID: WQz3Ik7DC-NKM44NmApwbsoi0hVWjmlU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_222742_007376_E2D7BE24 
X-CRM114-Status: GOOD (  32.57  )
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

On Sat, Nov 21, 2026 at 12:11:17AM +0100, Heinrich Schuchardt wrote:
> The specification requires an update of a debug trigger to fail if
> trig_tdata1.type or trig_tdata1.chain differ from the installed trigger.
> 
> The update only asked if the hardware trigger can do the new type. A
> trigger that supports several types, like the ones of QEMU that do
> mcontrol and mcontrol6, was switched to another type. A changed chain
> field was not noticed either.
> 
> Compare both with the tdata1 of the installed trigger and return
> SBI_ERR_INVALID_PARAM. The specification names no error code for this
> case, so use the one for an invalid trig_tdata1.
> 
> The chain field is defined by the trigger types mcontrol and mcontrol6 of
> the RISC-V Debug Specification. Other types have no such field. For them
> the same bits belong to other fields, for example to the count of icount,
> and they are not compared.
> 
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
>  lib/sbi/sbi_dbtr.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
> index d4be1be3..01b74f5f 100644
> --- a/lib/sbi/sbi_dbtr.c
> +++ b/lib/sbi/sbi_dbtr.c
> @@ -693,6 +693,24 @@ int sbi_dbtr_read_trig(unsigned long smode,
>  	return SBI_SUCCESS;
>  }
>  
> +/*
> + * Value of the chain field of tdata1, 0 if the trigger type has none. Only
> + * the types mcontrol and mcontrol6 define a chain field. The other types use
> + * the bits for something else, e.g. icount for its count, so they must not
> + * be compared as a chain.
> + */
> +static unsigned long dbtr_tdata1_chain(unsigned long tdata1)
> +{
> +	switch (TDATA1_GET_TYPE(tdata1)) {
> +	case RISCV_DBTR_TRIG_MCONTROL:
> +		return !!(tdata1 & RV_DBTR_BIT_MASK(MC, CHAIN));
> +	case RISCV_DBTR_TRIG_MCONTROL6:
> +		return !!(tdata1 & RV_DBTR_BIT_MASK(MC6, CHAIN));
> +	default:
> +		return 0;
> +	}
> +}
> +
>  /*
>   * Check the configuration of one trigger read from the shared memory.
>   *
> @@ -730,6 +748,15 @@ static int dbtr_check_trigger_config(struct sbi_dbtr_hart_triggers_state *hs,
>  		return SBI_ERR_NOT_SUPPORTED;
>  
>  	if (trig) {
> +		/*
> +		 * An update keeps the type and the chain bit of the installed
> +		 * trigger, see the update function of the specification.
> +		 */
> +		if (type != TDATA1_GET_TYPE(trig->tdata1) ||
> +		    dbtr_tdata1_chain(tdata1) !=
> +			    dbtr_tdata1_chain(trig->tdata1))
> +			return SBI_ERR_INVALID_PARAM;
> +
>  		if (!__test_bit(type, &trig->type_mask) ||
>  		    !dbtr_trigger_hw_supported(trig->index, tdata1, tdata2,
>  					       tdata3))
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
