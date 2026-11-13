Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB1D606A321
	for <opensbi@archiver.kernel.org>; Fri, 13 Nov 2026 05:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t7Y3oXmU;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=osIxloM/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d7AwKfYw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ei+FrpNL0Ser4J4jxBdVfyrUaVvRq5Awl30XS2e8y8Y=; b=t7Y3oXmU6/GSpjDcRinryFLKZb
	L4nBnXwohPZTBfS3M5ogVanU4NdGXKq/i5VmoCBuhr3yZ2cpAOVVEPF5+5cxaD4Ko33qKtIFCQYNe
	eOGpFVC1rLdRgV+7fTSSH9f+gpXXumHvwK509qASeseXU3BNe7zE0vAVEwKJ3zgy6oD7qP9xM4D0Z
	ktxPzTSOqW0YE0XePkaqXVAWBVbfO0TBj3xsqKp9goXfOlgvpyTtq/nuG2/0j9WJG/rGcM1KLhBwi
	fKVb1bg1KDztNM195EAsY3BeX+LDAtB3fWRvuk2esSqFsf4yXnrdPnpJWrHxEFIsyOrsVQ4dr6IoD
	0yLmxnSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRkDz-0000000BjLx-3zkW;
	Fri, 13 Nov 2026 05:53:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRkDw-0000000BjLU-2iGs
	for opensbi@lists.infradead.org;
	Fri, 13 Nov 2026 05:53:21 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD574wK3717384
	for <opensbi@lists.infradead.org>; Fri, 13 Nov 2026 05:53:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fIIejYOanWXcCSnjA7qPAl/1
	tRwSc5WK8aYl/wpd1SM=; b=osIxloM/KDOCmvmeDCQ2FvDA7/LgyY5P5NvKpWgT
	j/CFu0sI61XjzIXDDt9d0kAF+ajV+zs/ZPt/tEZfnRCp5l8smXXZrAbvkrlJeUPO
	Vp9CEMtorf7OCjhd0PixdZkmoi/g98qo/dXbInnvpdd5f0PQXKljX5LtUaslSVrx
	Rbe/5pjK99WiczOFezBjlr7MWq1EFFtxIW/MdWXg00VXo8Gl75mnrpp+4t9GFMeJ
	zJHUd4u7FaXjoTTdm/+mDrvJXrcKxxO1a95B6SPidsURtXCayZhPHoGez446p/hb
	Fk26Z1KEu6F+c15qlIdpY9Eu9dMicDM5129pvyChkzdT+g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufgyup-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Fri, 13 Nov 2026 05:53:19 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36f26e6abe9so742447eec.0
        for <opensbi@lists.infradead.org>; Thu, 12 Nov 2026 21:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794549199; x=1795153999; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fIIejYOanWXcCSnjA7qPAl/1tRwSc5WK8aYl/wpd1SM=;
        b=d7AwKfYwLFd7bYANzYKYz31sZiNTdO3LuoG1jMnq0u/+xdwoyz4d85PijlxzMcLjpp
         8+OzCKtgvRZS625LwLTE6PT4Z+Qcbrr0cmQAu5X3bB4JF7dQC9+JhwUk9eIyyrvNj8fQ
         PHK5HGdBn15uRjac93oM4MeFgT0AvTL7G2RiUqmeZ6KU2d4otgjLVpw5ZOn9NlON/P0y
         D/DwE5mUajRpqh3ZU+AyDNgeWDtwKseJoEqcAVZQ7jahobOMi45JHH7JFNg9IFhiurGJ
         6N9vcR8ZuQ79Xj8bySwHoyHgwL3YpDdaTR43HsdAj0utEB8OsPOWETcrV1Muqm8Uwadc
         VthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794549199; x=1795153999;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fIIejYOanWXcCSnjA7qPAl/1tRwSc5WK8aYl/wpd1SM=;
        b=ma3KPYDJHZohb3ZQM3oedjDfM90o7N6uOmn/ontn4lEFB0rTGkFxV0qUIUU+0LTG19
         P06mKzGuOOgXue2KZj6toELJjmL1NAIn8VTZ3zeDPKQ6CHiWpSeATRpgtK0EX7tNs0mf
         Alc1LmIUcmS9pYlSFe3IpUAeYnv7hE2OPoxNa3xLTjQOolslX8MnagwSjTx9gTm6bX5R
         ikl4ZR+wPK1upiLZr4l0OGGYY/TRq21TdVHs1dpwuqXZkbPpOlNOHYM/m5IxK5nmgIzV
         bamM3EM59CTU2Oja8tMGN0HMOxh9wyeIro8dksP8z2/lJWmxMTlhqBEoRXOKX6WoEI4N
         092w==
X-Gm-Message-State: APuU4Z9/B4Ef0cLsY4CBJ9GvF5JgJF2XCBZ95GevJFyXsvSMJeRC5j8G
	MhYIpd8Veb1BG+pPe5l8XyQLGiDyASgGP5FhtNkwdVzk1UWw/O0eEnRLh4TwlEtnpG7Jp60+tpV
	BJy+sIC6xfthf739Ygb+7/Utzia7Zj08n9cR5Xz9OQ+byXeF+MD7iEh193DEJUnbh8/tekd4Z+g
	==
X-Gm-Gg: AYBFou1piCwew+owpXmHX4TJT0qJwCCo9TNcyAC96oRPmaSxqbqHtk/a6x7w85+atsS
	CGz74iD5gjgWxD2tWEHGUeIa4ApYG6JV8gUw26RsOAK/BchaiZqtIu7QJHIVETiXZCMBT+jtMuL
	Q/jiX2ORG/YOLkfxZB4Mi3pFUAW7mJAOlE5UsxJJunYj8UAL4BEbVCAItPAYwS65sZgdXhPZqRJ
	0pejviy4bRh6QKF9FGwR6bHXwzNpztoS1xEn7xopj3bTclhr0BgJGstULadPfbLVLTcHj+QCasx
	8tQcEntmuqG8Z/QnNQK4LT9qIUlOxECRbMzZFTqzLckBXDoLMqxZEWZdNhe85FesaihmI2tRhD8
	aMGEV2w6NeRukyEax5zrcgTJn2UEgcMT0htpdSG45jjrS7vi914UMVkc/nXYHRjA3fNAEXPxJLM
	H7C0LKPAupT6Lb4Xxd15eAVQ+AWY7mUJZonAHhBXKFuQv70T7aX5P1xMEkkZ9NoKbbFMn01yni
X-Received: by 2002:a05:7301:7193:b0:376:19bd:2af9 with SMTP id 5a478bee46e88-3796366047bmr1408036eec.5.1794549199080;
        Thu, 12 Nov 2026 21:53:19 -0800 (PST)
X-Received: by 2002:a05:7301:7193:b0:376:19bd:2af9 with SMTP id 5a478bee46e88-3796366047bmr1408016eec.5.1794549198511;
        Thu, 12 Nov 2026 21:53:18 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0c40sm4381954eec.28.2026.11.12.21.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:53:17 -0800 (PST)
Date: Fri, 13 Nov 2026 11:23:13 +0530
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: liutong <liutong@iscas.ac.cn>
Cc: opensbi@lists.infradead.org, cleger@rivosinc.com, anup@brainfault.org
Subject: Re: [PATCH] lib: sbi: sse: fix shared memory double-fetch in
 sse_write_attrs
Message-ID: <avalyYY6a--EDkxu@hu-himchau-blr.qualcomm.com>
References: <20261105013958.32686-1-liutong@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261105013958.32686-1-liutong@iscas.ac.cn>
X-Proofpoint-GUID: f9V3HxzfrrEtWBUtVhepwKS7qmMXEmTX
X-Proofpoint-ORIG-GUID: f9V3HxzfrrEtWBUtVhepwKS7qmMXEmTX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyMyBTYWx0ZWRfX8/Rz2XaYxjkr
 OZ7EGkXdfRRpxB7O7ncTzXmh1K2MDVYUI6uzFoEDrZQlT+8r1BJ8Ore4d5Z3c425/HHF9Fuc6gC
 z8lwBBfH3LGfuh39cV+JvzZA0u1/sFsUb2EyxjA8f5mjeoxx6WLurUBcz8nh9qxdn24FcK9Q2zF
 jDW7D3mPg+HbIRmCkrpIeGX19JQwqKzelr1tm5R49RHiskZ87bZ6fokKrgExgQcWb4HiN51M1Dt
 6P2BYuEgaCujw7jcMCPDDD+M4iTC/zjNNVVT+/V2YZyLr45+FUXKN1Tat3gjnJ7wcycdwtqbjI6
 jD8aB9NqvPfenr2LwumMsXpuIBELsOLg9kmmfAEgMw8YG1oAySnPZjHAPGX+TTY2TQLJzHiV//W
 rM6Mgh8sti0hmI3qVueEoHLDkRv+yD9rBKsoNmosGFkD6lAb/DR7Dcfs3VvpUinR4LnrCqpH8aB
 8CRbTVb77R899GVGbIw==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af6a5cf cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=v9N62HWVhgqZbxvixngA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyMyBTYWx0ZWRfX7MwIXKOHJnDp
 KCjIN9FR4tTtRTAhn4r69MsHYN27L7LIMp5PZ+VsAQE6uX5+Vc7PnxI3BQpb+2Lu+dVno6yIGKq
 zwLLw/R5R7xLVo3iz13dyrbdFhidcVk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_215320_702130_7720D20D 
X-CRM114-Status: GOOD (  34.59  )
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

On Thu, Nov 05, 2026 at 01:39:58AM +0000, liutong wrote:
> sse_write_attrs() reads the attribute values from the S-mode shared
> memory in two passes: first to validate them, then to apply them.
> S-mode may write the shared memory between the passes, so a value that
> sse_event_set_attr_check() would have rejected can still be applied.
> For SBI_SSE_ATTR_PREFERRED_HART this leaves e->hartindex derived from
> a hart id that sse_event_set_hart_id_check() refused, which
> sbi_sse_enable() then resolves to a NULL scratch.
> 
> Copy the attributes into a local array, unmap the shared memory right
> away, and run both passes against that copy.
> 
> The copy is a fixed size stack array. Its bound is currently guaranteed
> by sbi_sse_attr_check() in the only caller. Check attr_count here as
> well, so that the bound of the array does not depend on validation done
> in another function.
> 
> Fixes: c8cdf01d8f3a ("lib: sbi: Add support for Supervisor Software Events extension")
> Suggested-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
> Signed-off-by: liutong <liutong@iscas.ac.cn>
> ---
> Resent on its own from "[PATCH v3 0/3] lib: sbi: fix shared memory
> double-fetch in DBTR and SSE":
> 
>   https://lore.kernel.org/opensbi/20260910052958.3365324-4-liutong@iscas.ac.cn/
> 
> Himanshu NAKed that series on a debug trigger argument. This one is a
> different subsystem, so I would rather it be judged on its own; if the
> NAK was meant to cover it too, say so and I will drop it.
>

LGTM. You can drop this agent conversation bit.

Reviewed-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>

> The attribute that matters is PREFERRED_HART: winning the race stores a
> hart id that sse_event_set_hart_id_check() refused, e->hartindex becomes
> -1U, and sbi_sse_enable() then dereferences a NULL scratch. Measured on
> f6abdaf2 under QEMU MTTCG, -smp 2: unpatched, won in 6 rounds, and
> SSE_ENABLE then takes an M-mode load access fault (mcause=0x5,
> mtval=0x540); patched, 20000 rounds with no win.
> 
> Unchanged from v3 apart from the commit message, which overstated the
> bound check: it covers attr_count only.
>  lib/sbi/sbi_sse.c | 27 +++++++++++++++++++++------
>  1 file changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
> index 767ea128..b3d35d65 100644
> --- a/lib/sbi/sbi_sse.c
> +++ b/lib/sbi/sbi_sse.c
> @@ -1049,25 +1049,40 @@ static int sse_write_attrs(struct sbi_sse_event *e, uint32_t base_attr_id,
>  	unsigned long attr = 0, val;
>  	uint32_t id, end_id = base_attr_id + attr_count;
>  	unsigned long *attrs = (unsigned long *)input_phys;
> +	unsigned long local_attrs[SBI_SSE_ATTR_MAX];
> +
> +	/*
> +	 * sbi_sse_attr_check() in the only caller already rejects a larger
> +	 * count, but local_attrs is a fixed size stack array, so do not
> +	 * rely on that for its bound.
> +	 */
> +	if (attr_count > SBI_SSE_ATTR_MAX)
> +		return SBI_ERR_INVALID_PARAM;
>  
>  	sbi_hart_protection_temp_map_range(input_phys, sizeof(unsigned long) * attr_count);
>  
> +	/*
> +	 * Snapshot the attributes so that the values checked below are the
> +	 * ones applied, even though S-mode can keep writing the shared
> +	 * memory.
> +	 */
> +	copy_attrs(local_attrs, attrs, attr_count);
> +
> +	sbi_hart_protection_temp_unmap_range(input_phys, sizeof(unsigned long) * attr_count);
> +
>  	for (id = base_attr_id; id < end_id; id++) {
> -		val = attrs[attr++];
> +		val = local_attrs[attr++];
>  		ret = sse_event_set_attr_check(e, id, val);
>  		if (ret)
> -			goto out;
> +			return ret;
>  	}
>  
>  	attr = 0;
>  	for (id = base_attr_id; id < end_id; id++) {
> -		val = attrs[attr++];
> +		val = local_attrs[attr++];
>  		sse_event_set_attr(e, id, val);
>  	}
>  
> -out:
> -	sbi_hart_protection_temp_unmap_range(input_phys, sizeof(unsigned long) * attr_count);
> -
>  	return ret;
>  }
>  
> 
> base-commit: f6abdaf25dfe0608277fc634f3927c1f184ede6d
> -- 
> 2.34.1
> 

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
