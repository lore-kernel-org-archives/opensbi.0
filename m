Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F697606A31E
	for <opensbi@archiver.kernel.org>; Mon, 23 Nov 2026 07:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u4fRw+jF;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RfXymb0f;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PzHScRAn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OkF6wALMULYIlfvexSYHMrasqRXA2DmdW+WX0APpu+c=; b=u4fRw+jFdaubT/AxcK4X0n4wjw
	lzM23idClXZdgH1g67bXHEddOm7blgkoLiJkd2W5+GyQLephOm4xwM0TsaZE9iOB4dBii82jjmMyZ
	VApCqzm/Wk7WX4eld/i8SpqvMd4p37Ur5SkT8v7jIppd7+NGLoDPNO0fmbpnDmEGltgphHMrf+N7h
	ltOWVQL+5DI3BSNJc6tSezelHgtiGo4aI7+01QZJqkTuIUAMS+vrX5vgytsz173haA7PVOli/FaPK
	R/iMuYMcXXPYoPYjpWliHfmNtY1kmQXHrHbq1Z2JHZZN6v2GYtQ9VT6dg7AwSLcnkM8dcaIRre0iR
	m6NYyt1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOVs-00000002SXv-27LA;
	Mon, 23 Nov 2026 07:30:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOVR-00000002SUc-3PuL
	for opensbi@lists.infradead.org;
	Mon, 23 Nov 2026 07:30:41 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN68uU72371825
	for <opensbi@lists.infradead.org>; Mon, 23 Nov 2026 07:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NXBmAZe9/oyoVviAokXCEvFV
	WPymco4Ga0C1B6hs6X8=; b=RfXymb0fNcD1hAanEl+hFtPELLZzb09fLyUWMrtB
	L7eHJEcnfKzX/wOH79d1C7Z/JiI1njj2AN6bDtkNnkB3KSy3L1Y0y+FsDWoaUpQB
	pRbYeLzxUX3dMW+wS3ZbRZE3ggFv7ugCGJKxhByiJLWLvhT9ZAiMx/G/QyzUPP+3
	1m76Wg1FaWIGvEJ9knxLdI/sj/IlPCb2m+MeD1RTNlPOw4QLYSd+/gctJoj5FPo9
	RJX3rnKesmbqsD0xqOv66hRdmiJ2lCjala4JJEJYS2QIZ+WuHlyR/4BmkYQBjEQR
	cQn5NkxklMOUBXxmguhGjRjEY1q3Wb0tZZvLdOtZl0i7GA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd091f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 23 Nov 2026 07:30:29 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-38531c1a566so641249eec.1
        for <opensbi@lists.infradead.org>; Sun, 22 Nov 2026 23:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795419028; x=1796023828; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NXBmAZe9/oyoVviAokXCEvFVWPymco4Ga0C1B6hs6X8=;
        b=PzHScRAnoMf7kGnzgfUUGvFJRABIVQu+uaFUMcarYcFAp/bPszL3hmdCYgMxI+s4C3
         TQ/FCgSx/mGUutnqRyzM1sOTQBsh7+u/bJPUIm49Z9WBNXdH5k6EjUiqzOyrIV4YWHsf
         6RzuFcqNcpFRbzuzcKKYmCqyV947qR5NxnfHb93xNnEUwMU/2cAxWDAnhLNL2izfyeIo
         cWOYDDzNRkn5E76pGjDzFe7GwTcvp3Pp3yBUdl8bLHAHBah/m65qGp9v81bg5a3jUlcI
         C4WWUUqZSTd0NBgd2HLu/won6CawDDToiZJ52qENCNQE8mPRzg0GTxAXa6GImuOLLymj
         CXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795419028; x=1796023828;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NXBmAZe9/oyoVviAokXCEvFVWPymco4Ga0C1B6hs6X8=;
        b=aV/P24Vkde/584p9UZS/+lGBF5S8PkETaGhIEVqIrQfinIabgCyotpD/PVkm1Eelsb
         gUIgnm0FOKO6hFcddfVpCACiv9xNc/b6mZhO3BTln6cgf8Nq6Kfq12czr98rHnOr9667
         0oZXOIQ5Km2DyG/AgiTD5YszSEdNKIT+PKv2UcoVzF89X+6I3ZDrr4fMe/Sypf8X0xJw
         wTtDW52XxYlDxrNN69jRjEwNRa39rUPoKJ1ychBEJL69pY3fjvtgSO8QAzg3t44+QApg
         cY5ZRswjKuqChxLcV9luIk6pafoE7R1HllgMBibgl+wKhVcfRe7+OrTsctgICHDZNUrs
         ekng==
X-Forwarded-Encrypted: i=1; AL+hErEpRdZM8532LCXZMGGWEebxQF9ZFbn+R7fG7fPHXEp8S20fiOII0gQkD1DKEoCYPCq1tN+MMDTy@lists.infradead.org
X-Gm-Message-State: APuU4Z8QOS5lpQk1cRm1f0sIRmARdJ+r+eyzeONxE2mzZx2wHef9+ywv
	Uploa4udxdlDVDS5ykkq3rgsmU2SiFDGkZrpSq9qevM/Nx3IniJyg9jskFJ1nfkT97ng855mq3P
	3hO1DcJpAV8GUORT7I/SrbHa5t8Fw08NfGjTHjxHuJIrbCleZ7ZotsO/TjMwX7ziWSyIGXoGEeQ
	==
X-Gm-Gg: AZFdTZceN/WGdS2l1hQAyBGO57SYZqxCRdOgVqxAhf1eYjhMfs+JeKxrX6IdnBzLaUl
	ZuKpV5Epy4y8er5hyjTUYRyoJpr/7uPfqpBDPmnoO8Sv9sXkA5ggP5X/NSIrThJg0Jakj2VXK+P
	NRKhziInaFsQKbI2TVnplxt1LY92GsoFEpnMXJ0p3Heuq8+vRcegxgN52uDprKShhaGxzzfqoVo
	X8qMYZyVxvoUUJEh0gbqTJp+XI0e2WIU3riI/sSlegata0nIZb5JI3VeT6x2nX4g2cRKLhSCOhS
	4I1Cjlae+he4Abxk4SrUfUKGhZAylpRNoGW5Ti/YOoxuoucJZo0LUg4JhopRd/+RrtzBNnu5r7Y
	myuFQEHhS0228uRwjIHKgZXFB0TgUKZdQI0H05RgRX3r5U7+EuMFtOqxgpRUW0fo0/exGQuX93j
	mlmyZbXmPlvipzqf9beu6dcaVuEyx0QMKxxo/66WZad/w1xHkYYBGMRNoaZphj5TJGXaG2GKU/
X-Received: by 2002:a05:7300:50e9:b0:386:9a77:b390 with SMTP id 5a478bee46e88-3869a77c55bmr8126262eec.12.1795419028211;
        Sun, 22 Nov 2026 23:30:28 -0800 (PST)
X-Received: by 2002:a05:7300:50e9:b0:386:9a77:b390 with SMTP id 5a478bee46e88-3869a77c55bmr8126231eec.12.1795419027595;
        Sun, 22 Nov 2026 23:30:27 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm10133251eec.18.2026.11.22.23.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:30:27 -0800 (PST)
Date: Mon, 23 Nov 2026 13:00:22 +0530
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
        opensbi@lists.infradead.org
Subject: Re: [PATCH 1/1] lib: sbi: dbtr: check the flags parameter of
 SETUP_SHMEM
Message-ID: <awPrji6DBLreNBV9@hu-himchau-blr.qualcomm.com>
References: <20261120115427.50400-1-heinrich.schuchardt@canonical.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261120115427.50400-1-heinrich.schuchardt@canonical.com>
X-Proofpoint-ORIG-GUID: khLTo2OMny_E8_h06LyGzywxhgXIHnIi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyOSBTYWx0ZWRfX0UVHFisTAKGG
 F2/kgKNuXYCvH5iF2GzB4t3bst/8XJDL+4qahoB3OXWP6YC2C8bbmBnR/yJATqVyckWR47yqEJZ
 nY8q7llI4A1xHaLocqTaGM58HXW2HAvB642zZBF7FADFIPbDrHsKX2tbw50/NF3AnGRvrjgfz4I
 ngx76QNG53FbA2Lx/+DfyLXGrxN71s8mPoXlbNYYJ7EH1hr8DMWIiRmWYf2s/Ly+eqMMY26iilB
 paGGOwlmF0XDC/5zviELDxQ9frESKQ83CpPCqmHT9CUOXeX41cdCsUlYkApeHuomEo3wMT171ke
 Rg7D5tN9ZgJPg5cwdGX2RhZMjUQtbGxr+bjx+UlRvvI6XxAaoxrjd1EilDA24ELf3LE9tVU4MeR
 wzziHhEXi6SO+xhVWytJKgcNPj5i8H+/2tYpn6KxhyJzNHINMkjfDGoF/11Kq/lZM4i7DGStfrG
 NXbzZ12wezLUQa6eThw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyOSBTYWx0ZWRfXxB/6Bars4vn+
 RMq8Wgq9qz2qPTd+q2kAeWkJzfsmHEQysYpMiD4X3DCSDUnOeG9A9+SUzdIzKZU0zx1scuM/8sE
 cT87yFUIln8p0RcSu3HTkoI+HmOls+8=
X-Proofpoint-GUID: khLTo2OMny_E8_h06LyGzywxhgXIHnIi
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b03eb95 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=JfrnYn6hAAAA:8 a=DfNHnWVPAAAA:8 a=EUspDBNiAAAA:8 a=9HsdpxEPwQBOG_PlcvMA:9
 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=rjTVMONInIDnV1a_A2c_:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_233029_890478_CA3D626D 
X-CRM114-Status: GOOD (  24.94  )
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

On Fri, Nov 20, 2026 at 12:54:27PM +0100, Heinrich Schuchardt wrote:
> The SBI specification defines sbi_debug_set_shmem() with three
> arguments: shmem_phys_lo, shmem_phys_hi and flags. The flags parameter
> is reserved for future use and must be zero. If it is not zero the call
> must fail with SBI_ERR_INVALID_PARAM.
> 
> The ecall handler passed only a0 and a1 to sbi_dbtr_setup_shmem(), so
> the value in a2 was ignored. Pass a2 as a new flags argument and return
> SBI_ERR_INVALID_PARAM if it is non-zero. The check is done first, so a
> call with reserved flags does not change the state of the hart.
> 
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
>  include/sbi/sbi_dbtr.h   | 3 ++-
>  lib/sbi/sbi_dbtr.c       | 7 ++++++-
>  lib/sbi/sbi_ecall_dbtr.c | 2 +-
>  3 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/include/sbi/sbi_dbtr.h b/include/sbi/sbi_dbtr.h
> index 90871f0d..86af03f2 100644
> --- a/include/sbi/sbi_dbtr.h
> +++ b/include/sbi/sbi_dbtr.h
> @@ -114,7 +114,8 @@ int sbi_dbtr_init(struct sbi_scratch *scratch, bool coldboot);
>  int sbi_dbtr_supported(void);
>  int sbi_dbtr_setup_shmem(const struct sbi_domain *dom, unsigned long smode,
>  			 unsigned long shmem_phys_lo,
> -			 unsigned long shmem_phys_hi);
> +			 unsigned long shmem_phys_hi,
> +			 unsigned long flags);
>  int sbi_dbtr_num_trig(unsigned long trig_tdata1, unsigned long *out);
>  int sbi_dbtr_read_trig(unsigned long smode,
>  		       unsigned long trig_idx_base, unsigned long trig_count);
> diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
> index c97e625f..2108ca9e 100644
> --- a/lib/sbi/sbi_dbtr.c
> +++ b/lib/sbi/sbi_dbtr.c
> @@ -337,10 +337,15 @@ int sbi_dbtr_get_total_triggers(void)
>  
>  int sbi_dbtr_setup_shmem(const struct sbi_domain *dom, unsigned long smode,
>  			 unsigned long shmem_phys_lo,
> -			 unsigned long shmem_phys_hi)
> +			 unsigned long shmem_phys_hi,
> +			 unsigned long flags)
>  {
>  	struct sbi_dbtr_hart_triggers_state *hart_state;
>  
> +	/* The flags parameter is reserved for future use and must be zero */
> +	if (flags)
> +		return SBI_ERR_INVALID_PARAM;
> +
>  	if (dom && !sbi_domain_is_assigned_hart(dom, current_hartindex())) {
>  		sbi_dprintf("%s: calling hart not assigned to this domain\n",
>  			   __func__);
> diff --git a/lib/sbi/sbi_ecall_dbtr.c b/lib/sbi/sbi_ecall_dbtr.c
> index 40a437ee..704af5a4 100644
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
LGTM.

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
