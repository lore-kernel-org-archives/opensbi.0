Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DCDECD6C1
	for <opensbi@archiver.kernel.org>; Wed, 11 Feb 2026 15:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lSX/x87XfZBMBAOzj1OIJY5Yt4KqjsOd9GZ/tPpPSjU=; b=rXyA2wbhD30NTa
	ItrvwLMfnTpYJTflVgb8FzaCvZptfn335jjMPG0IkN0i3XqKFiJK9rbEzFqZGj5VIv0hzo190F6Qd
	u/4F/1x7xornyvrp3CVabdIh5+Qwnrzuxh3GrcNzMDI7xMc3Nt90sdrkdvW2SRgG6zOC/atD+Oj1S
	b9FMsxG99IXD2bi+5ai3lMPTOBw940SYDR0WcZcPopyV3RMMj9JI6FUCu6BVvxe31CjFvf5W8HBBT
	gfW8cQWftoeAiuAF4tfJr4CQv59PEnmZqJOCgLG71/fdVHTdZJXPpWVXArFmFcZfir84mAtYoLIBX
	+TI0PVDDsIflNsTaL1VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqCd0-00000000omI-2n6Y;
	Wed, 11 Feb 2026 15:59:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqCcy-00000000olx-05zH
	for opensbi@lists.infradead.org;
	Wed, 11 Feb 2026 15:59:45 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B99ZM0170977
	for <opensbi@lists.infradead.org>; Wed, 11 Feb 2026 15:59:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TNzkC6PokNhNlQVsIzRFkElg
	5PFBQ3geLP4E9w0e8/4=; b=Om/fKlenej5Z1/HeNClr8NNjYTEtEklkwWccZJYx
	3T3PYq4FTGKiGg/0C0l0XEw85h+i3OBtXFn9OunA/aGWl1rNC8qQSr1i26/GnrHe
	JavfeDH3zNsjfgOS3vnmIHO3UT14EWQePQobfZPOmvRaheHtqLJtpBt1nvwvVxIb
	7fzRooB1rAktWYK+YsjsbnXgmsvPinwNKk229i70GChgF5WJpPAQspbBePtDmQI8
	QhK0B6IGqGk/9gQNpZbfaC9gNfE0ztBow65ahkYHyCBIZpWamRiBfwvfO3Tyqa8e
	8XwIQv7xxm/xMCAcZ/uRxUEZmtnwAGZJ+NT8Tmox6aMwmA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8f87ar4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Wed, 11 Feb 2026 15:59:42 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ba8013a9e3so1833664eec.0
        for <opensbi@lists.infradead.org>; Wed, 11 Feb 2026 07:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770825582; x=1771430382; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TNzkC6PokNhNlQVsIzRFkElg5PFBQ3geLP4E9w0e8/4=;
        b=Kr7sws63SFJpPNvoe7TAopEcPkv3TW2Gwg6gJTKbxEf0iRqtqCyZkfHzh55X51prcs
         faGeTv7pm432Lz4tmvgDEwYUVvPr+3ZylSCn5mQ3nR0OM2CRkDrlcmuutKxkusHVsUM3
         tWpIG1i0gPO8o4gsunm8RO5SLhMCF0aymMrO9BQ3Ev98V2EQ4IxLSOkiWY7Y5EorUjrP
         u4c5/CvJg63uUweFpJwK7p6cLacZwJk0zKV4tU0BdjrufMeRwrmHptNM1F3xiYkOw49W
         JH1iDDKss2dLcxRkW9nxgpG/Un0BCRwTeqJxibTRRlvm4BMsH4wxSgxj0sc8Ea1ERbfQ
         68zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770825582; x=1771430382;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TNzkC6PokNhNlQVsIzRFkElg5PFBQ3geLP4E9w0e8/4=;
        b=BMZ8pjy3O5g0vghCAtOjFfQItHkSA/hPC3btMyh+w6B3jE+QyxpxNduA7FkYvLXcNF
         tSeseqvAqyNgiZ6cOlXmxhcCnkLn04+wpDpUmZhjebWRX2dfkblXwIYeyH1/gQiXK0NS
         QI/0tg9dtVC//y6Lfi2EfqriAcQqWpAOHUA4NnSO75gx0xsnpAqsYrtk8CZVwNBZos/z
         /CesbPskHEyu7MV7JG47MebKq/s5UyISPyjYuEhmbjoBg3gx8V9s1Q9RkG1LFNxOT4mv
         EwiaIZaNrWcQFl6wYmyR3zq6eEX8Zf8M1hpEjfnc726+Jk/+4kPhNVO5yljmAGUlRFR8
         Zt4g==
X-Gm-Message-State: AOJu0YzZELgduxnMuxIJxHYAR629cYxaktDS5AFuTaJ7mY7FwQC1FUv2
	ojnFiawozD2TlR2/yiJtIFrqdbJ6FiYVsfh/2TT6/TeW9FQd2Yf6HJ9HosBgd7HiLTX7pZE7YRI
	oseM4jzAfpw/goQy+8jjjXf05Znjj+fHztEYqle3KemG26BdEwg6xoHDHAZWvny7GdLlevxYXaQ
	==
X-Gm-Gg: AZuq6aKkqg03+vUr9flAHEpvHsOO7QZHPtHKrGZussH+D583G71rh55R8AdUBJvaeqX
	hPWFNSpJxfdWZXeBj3WkNSp6PXYjMGmdNBh/yZTgE2wkBTENlkgDGShi69FhG/NMXEztBdp9szz
	B55ngXSul6eP6Y2XxkiiD5d6P+h8PLEcsPcBduv2Wxr8oAG/6RrKgb1W4V286ckkVnoex1lfCVO
	OqK5o9iWysuiEBYsZKeK3pzuF/+LVnXaiOy8oBQ+sOKzMYEt+GenDutXV3tjG8pXZBf8iOpCkxQ
	4gA3DKp7A/KUVLzvRdFShmVAZJEceEQyuuwwLYCvOJLGXqZ2E3VT6p8yqg2Nhtkl4BjSV6pQhy0
	O7ied4h5j03roRib09w7ebPUVmrLCQIve
X-Received: by 2002:a05:693c:310d:b0:2ba:a075:5422 with SMTP id 5a478bee46e88-2baa0755ccfmr729386eec.34.1770825582063;
        Wed, 11 Feb 2026 07:59:42 -0800 (PST)
X-Received: by 2002:a05:693c:310d:b0:2ba:a075:5422 with SMTP id 5a478bee46e88-2baa0755ccfmr729367eec.34.1770825581475;
        Wed, 11 Feb 2026 07:59:41 -0800 (PST)
Received: from localhost ([138.199.100.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ba9dce80f9sm1475000eec.23.2026.02.11.07.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 07:59:41 -0800 (PST)
Date: Wed, 11 Feb 2026 09:59:39 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: opensbi@lists.infradead.org, Leo Yu-Chi Liang <ycliang@andestech.com>
Subject: Re: [PATCH 5/5] lib: utils/suspend: add Andes ATCSMU suspend driver
Message-ID: <47gaecm2iwnihliide4hfjnp4b5ygmk3edjltvl2mdp4wwaydx@5ggtizp65f2t>
References: <20251229071914.1451587-1-ben717@andestech.com>
 <20251229071914.1451587-6-ben717@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251229071914.1451587-6-ben717@andestech.com>
X-Authority-Analysis: v=2.4 cv=KpNAGGWN c=1 sm=1 tr=0 ts=698ca76e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=OC80/TC5XWgnnCQ5Z9xtWg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=50qDPX_GIfJ507ApCd4A:9 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDEyMyBTYWx0ZWRfX4CWUxA6kiWqP
 /PG/SpET+NzU/nUGgiXblbfEUKRU2ex8PRsPlpqESw958lQdoGtrF3O3WvBp3FMqyurKkRekme6
 tMbqVV1FjtmVXNhRxcMj+m/rAcFKg6neGFMOrHNHTHlTVlO88V+svy5TAr8F0dGNCjl8kgrHAM1
 lwcAufGtaUp9UFuDQDSZ3veTnjR6PQ4l6K6+10yJ57ooxftohge0ffJy2+vB9ZBzDnpfXkXY4+b
 XuR2hASMXuDLlrzkzbzFmEr16U2LCbrcdCUPyWghtLurEvoWL8VhAsR1tvwbXAxfpka0JhdEZdd
 hs/NjIpvBnnvJXymvP83YVsQlhs8HRQ3ilaDz+AdYLou2eX5KmouDc5dzAheuD9JA4lFMA+8lKB
 RzcupYapDaM1/aOJ6ONMVtdcBPVMpU0Bg1K/zcIX0w8XaaUlrDWSu30GMdHgDMZvk7CTMohpVCN
 R9ZZ6q5IMm725W9Z0yg==
X-Proofpoint-GUID: WGTMG-AmQifz-HCws92IaRaVolF46OdR
X-Proofpoint-ORIG-GUID: WGTMG-AmQifz-HCws92IaRaVolF46OdR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-11_02,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_075944_066548_9BAA8349 
X-CRM114-Status: GOOD (  16.35  )
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

On Mon, Dec 29, 2025 at 03:19:14PM +0800, Ben Zong-You Xie wrote:
...
> @@ -130,16 +152,27 @@ static int ae350_hart_stop(void)
>  	/* Prevent the core leaving the WFI mode unexpectedly */
>  	csr_write(CSR_MIE, 0);
>  
> -	atcsmu_set_wakeup_events(0x0, hartid);
> -	atcsmu_set_command(DEEP_SLEEP_CMD, hartid);
> -	rc = atcsmu_set_reset_vector((u64)ae350_enable_coherency_warmboot, hartid);
> -	if (rc)
> -		return SBI_EFAIL;
> +	if (sleep_type == SBI_SUSP_AE350_LIGHT_SLEEP) {
> +		csr_write(CSR_MIE, MIP_MSIP);
> +		atcsmu_set_wakeup_events(PCS_WAKEUP_MSIP_MASK, hartid);
> +		atcsmu_set_command(LIGHT_SLEEP_CMD, hartid);
> +	} else if (sleep_type == SBI_SUSP_SLEEP_TYPE_SUSPEND) {
> +		atcsmu_set_wakeup_events(0x0, hartid);
> +		atcsmu_set_command(DEEP_SLEEP_CMD, hartid);
> +		rc = atcsmu_set_reset_vector((u64)ae350_enable_coherency_warmboot, hartid);
> +		if (rc)
> +			return SBI_EFAIL;
> +
> +		ae350_non_ret_save(sbi_scratch_thishart_ptr());
> +	}
>  
> -	ae350_non_ret_save(sbi_scratch_thishart_ptr());
>  	ae350_disable_coherency();
>  	wfi();
> -	return 0;
> +
> +	/* Light sleep resumes here */
> +	ae350_enable_coherency();
> +
> +	return SBI_ENOTSUPP;

I just skimmed this patch really fast, so I probably missed something,
but it seems odd to return SBI_ENOTSUPP here.

Thanks,
drew

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
