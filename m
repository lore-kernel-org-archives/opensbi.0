Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 803F9C982FE
	for <opensbi@archiver.kernel.org>; Tue, 22 Sep 2026 05:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XwMvgKZ7iHdoO/FeDb4iHLSiA+sksLdEKOzqvg9iNhY=; b=Vt1kgssf1aK6CC
	0spJeUskgq51YR3jmNMgPwPdX1AJDUXSDRWRJ0FQlvX+FhNUB79tEWjqJ9UVewzmL44OcFd7CAtsv
	fqb+PBYBPrLH12mLAkAKWsVwNElLyjmmKvbNbzTsEHnWJZphswvQ6gUBVwKd8sjTs3LykYo+SlzGz
	u+cCBG4anm0ofFz4svhwlrhTaZw/dU1NxnT5WSe0/lLg85Fn1dA8WFjHqPFFsuNWoWngXk9aZPOZk
	1ZqUfSFx5a1WR4JeJexkqSE6miSppb4P7uYYU88MCU4Zrdzt3mv9J+8aIy2t4KRyjRSWWdz4Ecjfv
	l921yzbu5XAfq/0bX/JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8tQB-00000004I8c-00Sh;
	Tue, 22 Sep 2026 05:52:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8tQ6-00000004I8B-2zaS
	for opensbi@bombadil.infradead.org;
	Tue, 22 Sep 2026 05:52:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xz6eiWYLA9aX6QkVXiTWwcQuoZ0kv590YTrGRWQ7wnU=; b=jpjQ9ssIMSjokPwnLMnVhdMmrw
	9NReqziccv44LLPjjDI+GF3/Kh9HMf37fGo8RKMyB1oyJbaebEpI2ekcvfcShTa2xao3u/ZTxsXSa
	1eAyYhAh8pUNE2fU/vlC2aRJ6AwwCiD6vL0ZloulmvMskDAuKv3QPx52AaZvHhZKZaPHFiEV05MbQ
	BCADVchR3CcDiEWdRiCEPLKuqxKIJXc1ABv3yTkQ89IEo7q+2sR7DaqV5rvh8CiuzDFFm6PhqlF25
	kgPH86IX05HmUWqcoieHs3/pdNkI1xgl0r0MKXWB+u3TUXyFqss9gs+hCnRjYeqUAk8iNdNoerzyL
	NJpeizIQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8tPo-0000000D8Wm-1Fcz
	for opensbi@lists.infradead.org;
	Tue, 22 Sep 2026 05:51:56 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M00AMk1978678
	for <opensbi@lists.infradead.org>; Tue, 22 Sep 2026 05:51:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xz6eiWYLA9aX6QkVXiTWwcQu
	oZ0kv590YTrGRWQ7wnU=; b=ha6SjyQBzvV1AmvNQPtLPorK4TC4g9r/nM6Ez+81
	YshPXxHwGIN32Ki3V5VkRpxXewvFN7HUV8jb6F5MuJgdv7GtGIRgdkuz+Lg3dWmt
	7xpWL2Cjw85jHXKWdTaOubsMR8yDc0q/o57J9cgHjgQcEHAYe48nYShzFSZMn6Oo
	FDJrN8dYlTD0BdWvobEg0jjyBV48tLDOJwnmIWJMm640ySa60BMy38aVaQuBeyob
	voP6TvxwkYDkaVzFOXKbXLvHf/vkm3nkq8YGnfKs5Nn9KAE9vCEBnkvBRJKdHtOP
	2Cy/BLyhlaqCU5mfUEtOzb2lllMphTCWvjfxoNPoH+GGMQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gudw0h78p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 22 Sep 2026 05:51:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so4588539a91.1
        for <opensbi@lists.infradead.org>; Mon, 21 Sep 2026 22:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790056295; x=1790661095; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xz6eiWYLA9aX6QkVXiTWwcQuoZ0kv590YTrGRWQ7wnU=;
        b=b/p8RyjgzTCnT/8l/U/YPKvlGLHhhL0I9spW3P3cFcKw+v6GPp3LB+STek5jaH4MUb
         k1fPEFHeFGlLZh4Iq/JCzAemAlDLJduN2vZ6ACIxiuYsty2Yf+LOt3m9kAfPc4EdSWW5
         Ew/A4uUj4FLtlVWjt2I5ahBJBjfd/usBgCK/YcNzkqV4WfkYWabPmJPVs2vJyVRgHSZz
         I3X6ZI+89qZkg++gWxeMLXniYVg/AQYKwUqCgPJ7XKXTxZc6Z8tYHBvqURV6ShO9loCn
         whtXdzYZK9M2zAUGG48FB8hHLKUMybha2HOpYqCLrjQGd4ek9uWLLfbDXVF6LRWBEFyB
         yV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790056295; x=1790661095;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xz6eiWYLA9aX6QkVXiTWwcQuoZ0kv590YTrGRWQ7wnU=;
        b=HkahjdxB2PnjMHqBCXripOcLqdW6F9hvlvOwpjgY9vy7YEPyEOcVs+/LGaYkpEr95e
         rJKoSVl7pzak1YyWzjx8qeK6EjMnr+UZQ3FFiNWojpUizxvvgAz9MjOdJnrloi0kuiLx
         wM9K0lru9Glu2HGomLtL1A/HorCeoWsTiDJR9e5fzPVxDisDMMrDe4Y3G4znhmZHgD5F
         1/QivJhxa/ros58m4UNUR8I2Etszhbo+bispHFDMm8ZW8dzhNVNoLOQ9PiiXWLv+IXRs
         wkSVU9mpqwfEoopXoDz5UwlGZdHTGOA+xSA2tViE9J1V3X9ZeHFz6D7Ar/LBQfsR/bBM
         JS0w==
X-Gm-Message-State: AFuF++nf92+R0dlkmdPMPlFGTMFZJaDtr3Jcp7Ji7t5pPreqhscVIJIg
	4rRX8oMWPCTcF90Iro8HYADcVfyp4dgepWzTBKHqHRDnUhg7JihQfxQq8jjLS2DXKaoNckPLpbQ
	WfSguUcWxJhnbA6hVUEXauej/m4JnIWnmEjpWYD/hKCW1XPwr5Egac29E1ZjM4IiMAwXmVxxkYA
	==
X-Gm-Gg: AYBFou1dm6RIZi55xHVGt7y8hP2t3JxVwrHIrW4WYZxM9ICWWnxtlAcB7Rdcnm3bg9j
	g4l6l+QM8RAViyZ2x/CCKeS4YG5Kn+bfeyhqGvZBD1QhYKp2Noi5Jv9B7lqHZMPwvcj8W8JdJAK
	vURDQhYHkfwWeofRKC2jWugNxQiQX9cW46BHQruw+vzpj6QL5Cu32Qo08LZGyOR3Zm6yXY7sgYQ
	i7GBMiX7EiXZflHSdjfrvJEESjHRhOpgQoxQnt1k3M+b9K9FmcTVr90MF7XPcPLOfZjmuieHmiL
	o9Bshu7bBxQpKZJrfLSe0oIoXIK6/6o2fAG2/Z0iYCn9uBiHXIhFgb6Caq/B4r9+x1raiDXM5tb
	JsmvL0kU/APim8R/f5o1nM6knxNpNm7rJMw/IXEAfiWx9qZoQ8b6OE3xJWS/t6KR9OgNx7w9Sfq
	bmT4+CL7ugyeN0Mp73lptfOkv4
X-Received: by 2002:a17:90b:4d0f:b0:3a0:3d1c:2dc6 with SMTP id 98e67ed59e1d1-3a0732b3c4dmr70896a91.66.1790056294718;
        Mon, 21 Sep 2026 22:51:34 -0700 (PDT)
X-Received: by 2002:a17:90b:4d0f:b0:3a0:3d1c:2dc6 with SMTP id 98e67ed59e1d1-3a0732b3c4dmr70882a91.66.1790056294180;
        Mon, 21 Sep 2026 22:51:34 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e612d0c6bsm2719059eec.20.2026.09.21.22.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 22:51:33 -0700 (PDT)
Date: Tue, 22 Sep 2026 11:21:29 +0530
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: liutong <liutong@iscas.ac.cn>
Cc: opensbi@lists.infradead.org, anup@brainfault.org
Subject: Re: [PATCH v3 0/3] lib: sbi: fix shared memory double-fetch in DBTR
 and SSE
Message-ID: <arIXYQCyjvgZX1jM@hu-himchau-blr.qualcomm.com>
References: <20260910052958.3365324-1-liutong@iscas.ac.cn>
 <arC6_NukHKk_mH4U@hu-himchau-blr.qualcomm.com>
 <20260921080808.2865944-1-liutong@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260921080808.2865944-1-liutong@iscas.ac.cn>
X-Proofpoint-ORIG-GUID: tYlgyshiKVbKUHNTH9zn1k8uxAn-mXNH
X-Proofpoint-GUID: tYlgyshiKVbKUHNTH9zn1k8uxAn-mXNH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA4MiBTYWx0ZWRfXydyVKC031q8o
 p33TSfvDZpwKmBI8bIlcb6DDwWlo5FM60docph23F/X9N0uEJZFQ0GQ1cpjm65m4peYHlrfgm0g
 WXAnq5OQSPoPRPl/TqphRuhEmT/i5ouwTvahppCFW2Npp6q3E6IW9vfKczptUavx+0EuyrPkLce
 qM9VtvCa+Ur97cOzi+G9mwJdjO7nfYSrvjdh3fK2mds6Km/q5pbcXkiIxQ2lZTV1v7heM92isqv
 CI+a9ny9CQZ89qvjRdga+qE09DwsI+fyUUl1wi8+35nJjJ85nsEYI1eMgEbsPk6sKtMdb4IXaja
 X6r3pFpzCGzPVUEFfpXGZDgTzcijn+ebamfZnk4Ev9K2wBe6g6fnb3ssyx/HBF1ky1pGYduHV6a
 oaDsw5p5hj2je1ydlFFgx1vyov+og39liMHE1IgxlLea/0dXDtMuYB/4DZ8Fm3sajGUGHmJ0O/k
 VF8o8mNFq0xieywBRZg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA4MiBTYWx0ZWRfXxxksNF0OV1cE
 scWSsUavQrmUkmEnNjFBmIZhNnnUKG5zmsPbOLDXAGicv2CWhJ1WWCvYzm5SwHmkZpNwIvpqfGP
 vVcUlQpMmihDsF1cQzDhOxxzSk5+74I=
X-Authority-Analysis: v=2.4 cv=TvFzFzXh c=1 sm=1 tr=0 ts=6ab21767 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=I9g1oPNoVCGDOB4_hVsA:9 a=CjuIK1q_8ugA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_065141_195170_A44686A8 
X-CRM114-Status: GOOD (  32.87  )
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

Hi Liutong,

On Mon, Sep 21, 2026 at 08:08:08AM +0000, liutong wrote:
> Hi Himanshu,
> 
> On Sun, Sep 20, 2026 at 10:05:00PM -0700, Himanshu Chauhan wrote:
> > Secondly, even if there is a CPU running rogue code, cannot bring down
> > the system. The triggers programmed may be bad. But again, its a
> > S-mode bug.
> 
> Fair question, and I wasn't sure of the answer myself, so I measured it.
> QEMU 11.1.0-rc3, -M virt -smp 2 -cpu rv64,debug=on, MTTCG, OpenSBI
> 3593a5fa. Hart 0 installs an mcontrol6 EXEC|S trigger with M clear;
> hart 1 rewrites the same tdata1 to M=1.
> 
> Read back via TRIGGER_READ, i.e. csr_read(CSR_TDATA1):
> 
>   0x6000000000000054      type=mcontrol6, M=1, S=1, EXEC=1
> 
>   3593a5fa                : hit in 3 rounds
>   3593a5fa + this series  : no hit in 20000 rounds
> 
> Submitted honestly, the same value returns SBI_ERR_INVALID_PARAM.
> 
> With tdata2 aimed at sbi_ecall_handler, the next SBI call gives:
> 
>   sbi_trap_error: hart0: trap1: trap redirect failed (error -2)
>   sbi_trap_error: hart0: trap1: mcause=0x0000000000000003 mtval=0x0000000080014382
>   sbi_trap_error: hart0: trap1: mepc=0x0000000080014382 mstatus=0x8000000a00007800
> 
> mcause=3 with MPP=3, so it fired in M-mode. An M-mode trap can't be
> redirected, so it ends in sbi_trap_error() and sbi_hart_hang(). The
> nested context below it is the DBTR ecall itself. Aimed at the trap
> vector instead, the hart goes silent with no diagnostic at all: the
> breakpoint sits on the vector, so every entry re-triggers it. An
> honestly installed M=0 trigger at the same address survives 2000 SBI
> calls untouched.
>
Fair enough scenario. But still no reason for the code churn. Ideally, the
S-mode shouldn't be able to set M=1. The patch which fails if M=1 is being set
should be the one here. If OpenSBI is not doing it (which it seems so), please
send that patch.

> You're right that it isn't a machine kill - the trigger CSRs are
> per-hart and the other hart kept running throughout. But the calling
> hart ends on OpenSBI's own unrecoverable path and S-mode can't recover
> it, which is what makes me hesitant to call it an S-mode bug.
> 
> On fixing it in S-mode: I may be misreading what you have in mind. The
> only S-mode-side fix I can see is for S-mode to keep other harts off
> the buffer while the call is in flight. That works if S-mode is merely
> buggy, but the case this series is about is a deliberate one, and an
> S-mode that is attacking M-mode will not adopt that discipline. So I
> can't see how to close it from that side, which is why I went looking
> at the M-mode side instead.

Not allowing M bit from S-mode to be set will take care of above two. I would suggest that
you merge the validation and trigger allocation in one go (by modifying dbtr_find_free_slot()
to return trigger). Rollback from failure is easier by just freeing the allocated trigger.
The installtion should go through. If in any case it fails, set the prior triggers to their
origial value and not zero then as you are doing now.

Regards
Himanshu

> 
> Which turns the whole thing into one question: is DBTR's validation
> meant to hold against an S-mode that is deliberately attacking, or only
> to catch an S-mode that is buggy? That's the one part I can't settle by
> testing, so I'd rather have your answer on it.
> 
> Separately: while testing this I found sbi_dbtr_update_trig() never
> calls dbtr_trigger_valid() at all. S-mode can install a benign trigger,
> then set the M bit on it with TRIGGER_UPDATE - one hart, no race, both
> calls returning err=0, and the bit is live in CSR_TDATA1 afterwards.
> That is independent of this series and I'll send it separately.
> 
> PoC is ~200 lines, I can post it.
> 
> Regards,
> liutong
> 

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
