Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF45606A31A
	for <opensbi@archiver.kernel.org>; Mon, 23 Nov 2026 08:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CheClnqt;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rq/FMQKT;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DCBQKSBZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rBEVUAyO17UHu0+2tMjZBxu16ROkY/5d/4jNGd/f00E=; b=CheClnqtmEtenBTA4dklSvgqct
	49cqEMAc7pCzIBC5AfsaK8V0zR1G6m7ppTd6XLdk9OXEld9SUYKYCjnXThADqjT1y9roBSSWXlVZM
	qgKFXCT6w6H/SKNoXdBL1EY1+Q2XhCxxT1v1/Ixr6LjiKIKWF6zNtD/3pJ/7fTX+CQmn4niKhCnF9
	ppBLBO2tU2Au5qFPa+yuvRD7yQFL/Nnv8d/ZMr+g2mUyoMg99rD27S5icpAMVxDXl2wYC6y/bagqW
	2JXr8dlY8ouxoAol8T3doELQ7D75tgRtGfo91VIcjEN0a0pXif1VWt5UFMgCaCeETNEHbEsCanIf8
	+GLccVLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPC8-00000002Y2F-2JLm;
	Mon, 23 Nov 2026 08:14:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPC1-00000002Y0q-1iIC
	for opensbi@lists.infradead.org;
	Mon, 23 Nov 2026 08:14:32 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN83ksL2366071
	for <opensbi@lists.infradead.org>; Mon, 23 Nov 2026 08:14:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MUHp3CNN+PYLurubpIku0Nwb
	HWgFuOmAynNu2aMGw7Q=; b=Rq/FMQKTDcY4DDWGfj2AYB+W/dQjfH4MXUORDP2Y
	u20ZJkon8oR2RGYWCUiQBB021jruVhn+YbOOw41Qqgvak1NbWcAz/8xd0tY1NdOH
	fAGohlWfsd9JoUEmzjViSL6Cd00s/2IUPVP0IFOEFe/a5NDHuE2pVbE/ljhUO829
	Ai+wK+MPcNZvJ1gCik/n38helHnsDhj3V9GUxohLZOmxZ+mAYui9ClQbI5gER50Q
	0IAvf6Qey7WFfmY7x4HCI69ujikIv3qTEIp9R9c4G95O2vtp9mKZdnht8hSOAG1A
	j+/h9uxmlwS7DiWxOnEhB66y2yuK5g1Q9y73CN0m/nqyMA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7r1e8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 23 Nov 2026 08:14:27 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386a65fca25so1459607eec.0
        for <opensbi@lists.infradead.org>; Mon, 23 Nov 2026 00:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795421667; x=1796026467; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MUHp3CNN+PYLurubpIku0NwbHWgFuOmAynNu2aMGw7Q=;
        b=DCBQKSBZSjaDRVJLNXEMKkx1Is0ICcIoPxxU0/ajwOUOsSOy3FEX8teOlBJH6RmDHP
         LY0FrhagKQXvr0/DTN54xjwK16iFcsi5LWN+4z+y2FmUCnNGNr+ok4aQ561wwa4gG+zl
         whhvZiLrTaPYEftD2wjOa5g43btmH6E1ymuO9o8UeGu5D6/vB3eVc0zMQg+yGiEJnkNX
         1GyndA8PutROnk4xuIcmJ2LJjFNur5CtuDmvK0HiTLR70oQVbOZe283/rT1kGAVnhfLG
         AHpw8c+m55TZVRdiwb7yxyVkHTx9yGQZ90Spaxt85yD+1zgNcdJjLdTRONT8hWqzDIh2
         z1nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795421667; x=1796026467;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MUHp3CNN+PYLurubpIku0NwbHWgFuOmAynNu2aMGw7Q=;
        b=xLUPeBlBgZEFk5+rGijMlTRylOSr7gTwT15g+512zFAQHF0beAxnu7ivDCMCzG88P7
         9JlJf7029f8OvN0/2WpGNtaBdehQ4yiuMvdd9ywloeltu6tgq9I7pe4vRIBdVfNjBMFu
         D0jJinD60zyQy0shtegJ1H5IlEzy/zwmuRBN+4TlRgC0x0/dl2qnE5fFPtu7a/Krkop3
         ++XpMuw5s0DCpd7RruJjY9EiQ2ZqEqfXLow0Rg7QhQNmx0wi5flnS8bcD6iUkis2kwYc
         OPFheNADNeRLqCoSEEXpMaDJIZQYvyXKfodzABqThTtDk76UJAyIP+X+xMfh8axKjvqY
         Q9bQ==
X-Forwarded-Encrypted: i=1; AL+hErFkdziv5SL4ZaAVZpvlxuoukNbdNch17IG2MY+tpGCq1R5ux+EEYQA5efhVlB14jqiLg7FcJ02C@lists.infradead.org
X-Gm-Message-State: APuU4Z/bWKn26cYtaGEh/rzUMTghEI9Ao4aMhPEgiwqRY32pg5Fqatsp
	/e57tsky/mfgod9Pk0utSgeqRgbidlFh18wyIXOTferbXfgr7f5xnGJ7wHCkOjha9ellvcDIYEj
	EnbXHpXN6iYU0Y3ztg79xmzvd+0tbahKPahTM0TTMFgerxW0c/iWC83BpSvVDTLZqCA==
X-Gm-Gg: AZFdTZcgEWw3F6oreBic3zErQgloDrnkljSy/KegVh9h4LmbNHgmsk4UMCc5RIVZXYu
	vFqu3zxUjaA2EVlwxPKi0dmp1vvuKSWDVWG3GTAPvGHjHz44sf1RWZzfhg1Mv6DmwkC758ezVF7
	+OBkGB/2Wst+J/H7dfhjqEzqjQjHTMVJ7mVem6CGN5Mx26JpgTrma6YvzhJTCXbq01GkZDvKUcW
	pleGQe1b71ZKA2Kra1WHNL3X4wjyKwfTICVoQK1WJhR0BqbMf4ZQFZ0ZgXru3ri0+T+3FTvzzzB
	DPe/RZfylfFIj1hOI/mMZFD+J+tPwYR7SJ6vHapaafUwPZQrh1fJD2uyX09k1X46QRUZGVGyUd7
	ydS9s0KzDcd37j2DUTL9sfA02kie7ByYhJsHVYrcQYqqvF4OLxGul0qzfY0DQqt11A/AXlgXt+t
	3pQ37PtzIFPckVgZDJrf14xFNr43A7NlXgGR1F5k8PwxjchuumUyozvLtDdusDX2rU1I9d+wo9F
	g==
X-Received: by 2002:a05:693c:41cf:10b0:386:ac97:f656 with SMTP id 5a478bee46e88-386ac97f9ffmr3208685eec.19.1795421666411;
        Mon, 23 Nov 2026 00:14:26 -0800 (PST)
X-Received: by 2002:a05:693c:41cf:10b0:386:ac97:f656 with SMTP id 5a478bee46e88-386ac97f9ffmr3208666eec.19.1795421665836;
        Mon, 23 Nov 2026 00:14:25 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3866f299d0bsm26297263eec.19.2026.11.23.00.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 00:14:25 -0800 (PST)
Date: Mon, 23 Nov 2026 13:44:21 +0530
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
        opensbi@lists.infradead.org
Subject: Re: [PATCH 3/7] lib: sbi: dbtr: check the whole shared memory range
 in SETUP_SHMEM
Message-ID: <awP13Tc5cpXdRJIy@hu-himchau-blr.qualcomm.com>
References: <20261120231119.90214-1-heinrich.schuchardt@canonical.com>
 <20261120231119.90214-4-heinrich.schuchardt@canonical.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261120231119.90214-4-heinrich.schuchardt@canonical.com>
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b03f5e3 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=JfrnYn6hAAAA:8 a=DfNHnWVPAAAA:8 a=EUspDBNiAAAA:8 a=CRQrpHqUE4Pt69JHME0A:9
 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=rjTVMONInIDnV1a_A2c_:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAzMSBTYWx0ZWRfX/2O25NQkUPzF
 yWFaqwax4EYxpvz+2p1b/NF8aD5Z/Q0P/ThVfvLpwwDNe0ATM2aWrGcIxtWvUJlB04XvhV3TsBl
 TY6dTZ6Ugw4iVQ8K1Ie9bUjUGikTFcPNkGCDwsB4Z42TMmnCye74Q4KMEbAEl6BKBSNNbDwk0c2
 SV1J+JIrFYk4+47ArNv/bRG8AR3EPMvbIaU11QufGMvWqRttY6HhvllspyJWWSqa+OXCY6sq0zH
 YEN5hCLn/Lzn67a8RO9Nzs1tSzov9Xh+C4iC0X6JAznIlYinPsPcnsoqgY/iBFRc09cf+6OSzK7
 IMGR5w00LRQ/D8zVTsl3rtoo34odmdP7dklNL1PLkZC/zqR1hWEreA+absk5IbVl7Ma8RG/YRuh
 JDogjPhXzJWv/4Tyj3d4+Df6QU45e7pq64g1bkMdr9KS4ByyJkkNUtkZRUlPPTZxuauOZkQGWMy
 Ei4karYOfT1mJJCfSlw==
X-Proofpoint-GUID: j1n0WTtHZN_-YVWlj3KQ7n6GFTn-m2f-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAzMSBTYWx0ZWRfX5Zk60lIfzQfb
 OAZfCe2dOZPHnmtl2CZ026aCkXp1xdkfh/t/7M5Ai5MXCG+PnaWKwtBMCJr2ol2KS0NnymEZs2R
 u3UyDZPfomTgNG6RXUZcfVAOLp7CagU=
X-Proofpoint-ORIG-GUID: j1n0WTtHZN_-YVWlj3KQ7n6GFTn-m2f-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_001430_237124_F22C22F9 
X-CRM114-Status: GOOD (  27.50  )
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

On Sat, Nov 21, 2026 at 12:11:15AM +0100, Heinrich Schuchardt wrote:
> The shared memory of the debug trigger extension is trig_max * (XLEN / 2)
> bytes long. The specification requires the SBI implementation to check
> that the whole physical memory range is accessible for the caller, see the
> chapter on the shared memory physical address range parameter.
"see the chapter..." can be dropped. But I am okay with this right now.

> 
> sbi_dbtr_setup_shmem() only tested the first address. A range that starts
> in memory of S-mode and reaches into memory protected by PMP was
> accepted. A later read of the triggers then makes M-mode write into the
> protected memory. A range at the top of the address space that wraps

This is a major gap you pointed out yet mentioned in a casual way. Thanks
for fixing this. I request you to throughly review commit logs as well.

> around was accepted too.
> 
> Use sbi_domain_check_addr_range() with the size of the shared memory. It
> also rejects a range that wraps around.
> 
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
>  lib/sbi/sbi_dbtr.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
> index 53fcb0a2..fa0e5962 100644
> --- a/lib/sbi/sbi_dbtr.c
> +++ b/lib/sbi/sbi_dbtr.c
> @@ -385,9 +385,20 @@ int sbi_dbtr_setup_shmem(const struct sbi_domain *dom, unsigned long smode,
>  	if (shmem_phys_hi)
>  		return SBI_EINVALID_ADDR;
>  
> -	if (dom && !sbi_domain_check_addr(dom,
> -		  DBTR_SHMEM_MAKE_PHYS(shmem_phys_hi, shmem_phys_lo), smode,
> -		  SBI_DOMAIN_READ | SBI_DOMAIN_WRITE))
> +	/*
> +	 * The shared memory is trig_max * (XLEN / 2) bytes. All of it has to be
> +	 * readable and writable for the caller, not only its first byte,
> +	 * otherwise a read of the triggers would write into memory that the
> +	 * caller cannot access. A range that wraps around is rejected too.
> +	 */
> +	if (dom &&
> +	    !sbi_domain_check_addr_range(dom,
> +					 DBTR_SHMEM_MAKE_PHYS(shmem_phys_hi,
> +							      shmem_phys_lo),
> +					 hart_state->total_trigs *
> +						 sizeof(union sbi_dbtr_shmem_entry),
> +					 smode,
> +					 SBI_DOMAIN_READ | SBI_DOMAIN_WRITE))
>  		return SBI_ERR_INVALID_ADDRESS;
>  
>  	hart_state->shmem.phys_lo = shmem_phys_lo;
LGTM

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
