Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C6D606A31A
	for <opensbi@archiver.kernel.org>; Mon, 23 Nov 2026 07:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EJHeqPwH;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=icOmCNJ6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mdz/IVUc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yDFZVoW8J2tcxSfqqKxZRiAMfiHtakz7RWkv3ebpxEc=; b=EJHeqPwHO+UaLKN5UVLsXuDBy0
	mEYuSZu9dJaxAVkBnqlFYvFw5QBVMCkePGmWq/ag7FiFm0VO+2lDHM3fxrzUcKgmy5WbcEMl9EYKy
	dvyWTuUVZnN2jhsp/uvk4SWZhREYlNtbvS6DxhxHlAbGou78wHk9Jow18DfoHHcOPr2FjJAtkrSVx
	h9NvxEiYMEoMryweHMvgB0wtBlcdvMqowI2spX+FN+vAC4GlVfdcw1srP0YwsaydICLetZViWrFPu
	XPsdmzrN5WVXqCIe9BAWAsx2sKckAi8JQuis1/73w0Xod/50WjXx2FX5TDVLEvgmlOUQFyNBZXc2K
	DveRFVGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOiy-00000002Ty8-3Tby;
	Mon, 23 Nov 2026 07:44:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOir-00000002Txb-3x6e
	for opensbi@lists.infradead.org;
	Mon, 23 Nov 2026 07:44:23 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN698gk2372570
	for <opensbi@lists.infradead.org>; Mon, 23 Nov 2026 07:44:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pXGDdPc7Z8AL4xmCZk0/GHDR
	mC6jUw81aWnjZBfwc2o=; b=icOmCNJ6UqSl3MBrksXugEfzp4z+PsxHCwNoZsIa
	diU9uQkZ3F1Z+UwuzCRy846gE0fmWPszX4ABErgSdw1Bn/GlcxWU38FsbW0RIptM
	CNZdlgVVpJz9O9UReTfUi8z64sQ7GxhNbKC7LalMvb6K80hegUl7jlo9wCMWiL23
	uLgVJZZFqK+faqmqNXyLxriZKb3PZS3n5xlMtv79Z1uVts6XVDqITjWF3T9d6khI
	HSUva0X/l8p1N1QHLy8NnJxmkWYEse/trtT4rGF/CGhUVGD/BdPGyHDGvv13LbQ2
	eQB9uW7vHI8oJDjMHK2HxpCuoussSuawN0wNbAaq+javVw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd0akc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 23 Nov 2026 07:44:21 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b56c696405so221356c88.1
        for <opensbi@lists.infradead.org>; Sun, 22 Nov 2026 23:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795419861; x=1796024661; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pXGDdPc7Z8AL4xmCZk0/GHDRmC6jUw81aWnjZBfwc2o=;
        b=Mdz/IVUcpdivq7iPizg7Ia3Q7NWCIR0z/+KNVMDSFrQONvKokVCX2hxM9aQqdP6nTL
         DPrLOig33ZDV53+QQ/oOZ6jHZVpv9VXsa5TlW4wEvsL52e1AdXLISpEiC9SDEz481YaF
         H1VPvZIPWS3b+eNAvej2moch8v2KLsOci10y2+o3RzJSEBH3Mar79LpSBEMdNEahvwvd
         D3zfDQth05S5B9k7T7r+88VIz2nqq8Eh+ganORvfYiKVVkuk8SSu6LX21P2aEl6ssmLw
         cuS8R33rpU3h4WR3pfuEHfGueZ1+lGnqkraNR6gK24WdVVO8jJoqoTqUZdsRZHLquOoK
         tAaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795419861; x=1796024661;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pXGDdPc7Z8AL4xmCZk0/GHDRmC6jUw81aWnjZBfwc2o=;
        b=AiFkuzbfDF5X3w6R+DRNNJ6z+aIKaxY1VbIl6KM7rzOax+WyTMVYg2maIhdE8lM9pB
         B6v1dbKgqMw6Z5ra0josKZEUVlMMfm36RUV/Cswz1y9LHh8TXacF99Zh3Ad7ncSJikKO
         SZRETkIDcZkholKB4wqLgXAa5fy+vl7b92otgQ78AiCzz5xRjkiZTt4CUcl+gviTmh+d
         R+F0Nv/HHZ9/gF9nWq/rdiaIlVXQ8QkyT5dHbM354C5acBsuSorJ6JiVHnpWcndIr37p
         hqpN9ogN4ZLDg7ToJRvMba3Uahsifs4qPckfqT/2XYAvG9WZGSYpcradLZ1rMFCmWXa3
         /ltg==
X-Forwarded-Encrypted: i=1; AL+hErFjfdQKqo5lBTGwEJRgFC2mogsJGcUrmpz/AAKlh6YqFOLi3nfsbiEjvjOPJL/6+/OtOs4F0hJH@lists.infradead.org
X-Gm-Message-State: APuU4Z8fGPbdCkHGLQ22bTSz3wJeBUmUh+kvUE+VexO0JVX0CnetfCRl
	crWsUkZzATKjRPh39mX+yBXUfvwQVgNe3+Qe7RnB9xhDnYoQRsu0iQBAZz+BijMR9jtvORFsBWA
	c/98c3PsTTTkf0/+m30j0ppXJqZGpgrP7VLjGw0icyk2jKKBHsr5Z2BvE7Rvb+nuNDcdW/GOhZw
	==
X-Gm-Gg: AZFdTZd+9hkv//UUVsOixYbuHod5oaOQ6w2GI4xRXfRslIjvDiAu/Ag2zKI5H7lsPi7
	vXDd8hj+k+xoTBc9pSYOerz4bqrSErLbh5JkIO5sfPPjujA4BRiH9H5ooh7TQALOse8hNOm/K0O
	XBpxBWWNtutCooMedI11aTczXA9YUfQR4pXJ7AJUEHXIZ7wtL0pSRPNc7HNr1bC94yMn1Nodmhh
	Rvh3ZHi01ZSZMbp07tHR3rYESkt9qPANh8biAMCmQa2K1O27p9FddvhTDTlXyTu0eK/UYaCW6CL
	xWIwJN2yvZkBuxBbpV7ggQCEOeVAOvI476EUWAQErraN/0cs8eX/PFQY+CQJ8X9sGjD/behAttR
	+3G4eFMp2YwPAKYgbKNLoFJtba6clPlNVUG5/5pXLh5u0Wk60zCeS32fu+Zd0XpFMZmo1P3KCB3
	T+VAH0DcJNJQOategfd/+g8CKsqN0kGO0Orj7v6GLkCg2uenxg/yNaxI6SPsdRbHk/j1/LTaRB
X-Received: by 2002:a05:701b:2814:b0:1b5:1a5a:1dc with SMTP id a92af1059eb24-1b5568bcbb3mr12959474c88.12.1795419860636;
        Sun, 22 Nov 2026 23:44:20 -0800 (PST)
X-Received: by 2002:a05:701b:2814:b0:1b5:1a5a:1dc with SMTP id a92af1059eb24-1b5568bcbb3mr12959456c88.12.1795419860167;
        Sun, 22 Nov 2026 23:44:20 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm26141857c88.8.2026.11.22.23.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:44:19 -0800 (PST)
Date: Mon, 23 Nov 2026 13:14:15 +0530
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
        opensbi@lists.infradead.org
Subject: Re: [PATCH 1/7] lib: sbi: dbtr: check the flags parameter of
 SETUP_SHMEM
Message-ID: <awPuz_i6Qj1ZOBoF@hu-himchau-blr.qualcomm.com>
References: <20261120231119.90214-1-heinrich.schuchardt@canonical.com>
 <20261120231119.90214-2-heinrich.schuchardt@canonical.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261120231119.90214-2-heinrich.schuchardt@canonical.com>
X-Proofpoint-ORIG-GUID: 6O2j6I0l1aaLD6zsbhkN5XhzlNY7Cz2G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAzMCBTYWx0ZWRfXwNp7od0MgerH
 YUmf44tDtIZHf+1+ib+YYAOAMEBoVC4KRHctojvzzZFFqbAfv/KgLyVj5g/vln/kELJBZTFPHuw
 OpR1CmKJX6stVwulZOaTr2HUfiF8MpHK8Dd584vUBzyG7Tqf7Stp/WOyzd0WiT/YLbPtQY1zx6F
 fTlNllVJzbH4Jz5QdHpAdzqnseuwTXfwi4iDEdQhdo/awwZAKBuVZIf5mbEjb7+TzpLJUFP4eNO
 xL+meMltcPgLOtOglZPqqRbUlTLD7d78vJ+Y3lI1zDeQGUHqw51IgOEoZqHy8od213GX+4PjES+
 3vMPMqvLjA5Do9blbfoTKBKkbc1wrif87NKEMq26s82PZrE+p5PaGnUJ84pOLgC3THGnDEw2keI
 xKibTWm9FLNxSZ5GKmoQ2sThHuLAtB3teOFF4HwLDgSP5GYN/Je6loaj0HTU6pwkFEYt4OjhR8p
 mGacRp4IVP2PcxpBGtA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAzMCBTYWx0ZWRfX6LZh8P0leqUx
 lHuhyWLV0zJzbsDtYaJ7Hx0V9bTnCQeTCT+e9fY9aJPMhUDdA2ZBQ3EfxBwmMHxL2Cf/K0Ir695
 7ssRPWBvzhsNqDCK6UhZ0KGZVQOYNPQ=
X-Proofpoint-GUID: 6O2j6I0l1aaLD6zsbhkN5XhzlNY7Cz2G
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b03eed5 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=JfrnYn6hAAAA:8 a=DfNHnWVPAAAA:8 a=EUspDBNiAAAA:8 a=9HsdpxEPwQBOG_PlcvMA:9
 a=CjuIK1q_8ugA:10 a=vBUdepa8ALXHeOFLBtFW:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=rjTVMONInIDnV1a_A2c_:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_234421_983388_9C5EE84D 
X-CRM114-Status: GOOD (  24.98  )
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

On Sat, Nov 21, 2026 at 12:11:13AM +0100, Heinrich Schuchardt wrote:
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

LGTM as said in preivous patch.

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
