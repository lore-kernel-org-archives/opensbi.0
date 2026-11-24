Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E95606A31E
	for <opensbi@archiver.kernel.org>; Tue, 24 Nov 2026 08:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t6Deh89T;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q7hcVi12;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L+rhu1QV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ono+xhUUtYnyQRc9rNQQqoC9WKOxWMxm02ZITlgSQAY=; b=t6Deh89TXIQvt2lselaMy3ZRIH
	vKOc4cSlseFgyNLIIoCB0bhDXdLx9QAj/bJaXpf2lVtqdUkUOBiHxEUuCiw1Zdt9KDZ3Qrnoq5Bn/
	eQ+d289VMwRUoT3OrWlsJk+lSkfriNemxzHl2S73502Q8YYJhmlrLhEd+pIgD15Xje7HSDLmP09n6
	T6DrrFyQZDnQ0pm/zzpwFBPe8dDK/mAjRIdBy+nmghzZkRx0YP3I1r4Tk3sqwmKn5MPkxqw2oDD46
	OVuQWxMaM/tQuXx/C7Im+vo9o9/wioE6ewsQ2DBA3OFAfCEtJhAUyVpDEgjYZtH52hm87q1bpxu8K
	s4xIRKQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVlhu-00000005rT3-3t83;
	Tue, 24 Nov 2026 08:16:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVlht-00000005rSi-02IZ
	for opensbi@lists.infradead.org;
	Tue, 24 Nov 2026 08:16:54 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO5m4BV2848365
	for <opensbi@lists.infradead.org>; Tue, 24 Nov 2026 08:16:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KuyCg1Pep/lDw7sQZ9kztixz
	H6R6OVPSpoyfQF0UnCs=; b=Q7hcVi12W8NLq6EFArOvS9rpFgHIGI+6YNGlC23q
	mCys4IzA0Hzz5CR2kvpAVcqe8NQWjfAseMHGPiekSJKjwM+O87AyGQb2qxDgkthR
	Z5yrLz9of44P0fAZHAvLcbadSMyVyoNyqSLFUo08FnyEp6JkyRaRBH3AXL6BI6PC
	ydX+nkeSirENvUKy889ttpOuDNQaRf4uYtjWVsiQaF0tc2NvCWTW3TX8n1C4lgJj
	OCmjDHFwWF37jqSDWnet7vV6J5KhcBjeDj7WgJUe4VrN/j4xd6tz3CxHffOGqJdu
	e9u2ChzVST9AUcQPl8KhACA84bl+EBGVCHk1/Rn7HJp58Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rh8h43-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 24 Nov 2026 08:16:52 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-383ec96a7deso4860638eec.1
        for <opensbi@lists.infradead.org>; Tue, 24 Nov 2026 00:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795508212; x=1796113012; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KuyCg1Pep/lDw7sQZ9kztixzH6R6OVPSpoyfQF0UnCs=;
        b=L+rhu1QVLjWzqmF1GAU+qdRIQEix5J4DTJ1gsaNvVCqjss7MWFzgTn5jMbjv4oPTwA
         4H0KfP1pIqTPu6jKMtm7xD97R3hqIsEVL1Qmzpdr07xNm5ZTSa57yQyvZfPAayj/obwe
         REPo4J0PtzBT7RMTfEHkZfETmJGzmfGJaaYnX4HyrBCT6xTvD1skSGjAMS9asku8BrMs
         w3us5k9RMOq3aS3GU8XYpqrejJIhnirKb8DruZOp0E1bK16+uxVOt1z6UoF5D5x1CeDl
         vjFHbfFNAjUzsSfCcY2ZLteOPniCogI33iYB8O4azVlddFGtycOqT21PUn5LpJwB93M4
         2QrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795508212; x=1796113012;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KuyCg1Pep/lDw7sQZ9kztixzH6R6OVPSpoyfQF0UnCs=;
        b=0VVIqhkKzmeziQG5kQbVrVXIF1pzSLXI4IU5+iHeCEl8Mwxdhdv/gfWkdzSullFyJP
         D1qdnv+NenaDNYSP6xW8xQuOW5Hpi+40MjpqbnQ0599cXbGZp4YqmVvZZ/pslzIlDrRC
         14tixPzwuqA3cwhnmpo6mDcrVlQur42UoVJ7R8UyGrujkDeJ7mmNJCtJVKBOahDBWH+t
         bxVVrNsuxju9lYKDm5/m5VCIE9YE1Qy5Mzazi6KzPd5XiA/NmF1ZpIJPFvYb8HV/z7Ns
         QhiwRXqZUflFNQZQOHp3bZflpx0GawhX09e/AG9C9lll4Kit8f/WkwnX9vX/Q75k5mZh
         3MCA==
X-Forwarded-Encrypted: i=1; AL+hErHz54Fu/Air4oWcpOFup4dCLFq3ONHaGbRNGjPiZ60yKYhs3fo9B/ZuQRDn1cGKvLE9cNek5rFl@lists.infradead.org
X-Gm-Message-State: APuU4Z9GHM88qOrO5+kYnXUeyvxN1VBxNn4G/Qm+5IIKihbLWBdsexk9
	u2fL/jhGWI4DtK1an2zNm70i6pvphGjqR1mPD/11KDU4kozG2pCjGGvLunqWAW70QbRBmoxXFhi
	r2FXyv7MH8ylu3fuwUxD4qYBfHpjr0mcX8cqGC9gPNZ4/wn7/pk5/01+NQR6bB7AdFA==
X-Gm-Gg: AZFdTZezuZojmWyWZN455f6um8z/IeJLEvNShbge/jHQDEyMTHgeP2bc391GczgE2n4
	bBMdWjnlIahWdNiKuyVTRazW0wKoCdHdzI0T1QaTf/7/4dz4u7JZ0nxgtD2vBvHD/B9sSlMOeSL
	1YtxLGuXMarZJkrRCzQDEja06D32Rwcauf4Q+y5MamUuOFk6EibERl0aGMiVg1UdfJFq/WieegJ
	Udpmyu0IrxOKbvr4SzPSagj1MVDHFsICdW6OvG+uImBBG0bt1pIqeCMC+Fju6k3Q2ukhzIMZu6T
	0n8+1XiwK+/v349kP6VGmilnt5bzocJ0urs8z51yC1kOlE4f1A9J+1/GWOhDA95prhwybeKOVdY
	ZgY6jTFL2i/moPT/+xYYk2Zd8IORFJ2buUqFaJaDPDeMbzIvjJTu61lPAXPt7GtF3rsTrCpbXSE
	w6FRkj4RLxdbfKPYb0UYuCxxQXEAaqS+ncw8gHaY9HvsfnYJbHABMGxVXY4UItxJYWMZye7fMlX
	Q==
X-Received: by 2002:a05:7022:3c0e:b0:190:596:4071 with SMTP id a92af1059eb24-1b55689f722mr11867953c88.11.1795508211444;
        Tue, 24 Nov 2026 00:16:51 -0800 (PST)
X-Received: by 2002:a05:7022:3c0e:b0:190:596:4071 with SMTP id a92af1059eb24-1b55689f722mr11867933c88.11.1795508210823;
        Tue, 24 Nov 2026 00:16:50 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm47840373c88.14.2026.11.24.00.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:16:50 -0800 (PST)
Date: Tue, 24 Nov 2026 13:46:44 +0530
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>,
        Bo Gan <ganboing@gmail.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
        Xiang W <wxjstz@126.com>, Chao-ying Fu <icebergfu@gmail.com>,
        =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>,
        Andrew Jones <ajones@ventanamicro.com>, opensbi@lists.infradead.org
Subject: Re: [PATCH RESEND 1/2] lib: sbi: Add sbi_va_to_pa() to translate
 S/U-mode addresses
Message-ID: <awVH7B2YuGrc2BH5@hu-himchau-blr.qualcomm.com>
References: <20261119-p8700-cm-pmu-v1-0-5cfe67c6b2db@mobileye.com>
 <20261119-p8700-cm-pmu-v1-1-5cfe67c6b2db@mobileye.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261119-p8700-cm-pmu-v1-1-5cfe67c6b2db@mobileye.com>
X-Authority-Analysis: v=2.4 cv=BKkmP1QG c=1 sm=1 tr=0 ts=6b0547f4 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=JfrnYn6hAAAA:8 a=JvO64EORAAAA:8 a=mXVl3_jZ_ega548BAcoA:9 a=CjuIK1q_8ugA:10
 a=O8hF6Hzn-FEA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=Qz6KxWHdQ2_aS5WpiCfK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzMiBTYWx0ZWRfX3rxaaL3ZNpbB
 RaSjNHz3eHedKV777kZuFSmzombyvqNU6HUpbOf87ofRL6fyVZsvbg1ltAUiPbw5d4CTHGoioXa
 5LIezVsgjVw9hOlWFKedkTKCyh09s34=
X-Proofpoint-GUID: YGP3wwH5cC6aOtcl3vuoIObN3wzodCPn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzMiBTYWx0ZWRfX0pKRLQrF2IkQ
 mO+WYTQkoBHlaMH2+DAo3buvARPJu+cMwhIQZBZy2jN+0HzqyarYRIcXtgjpYRSDicK7THWDKjs
 RD/eJX1zyuHsD+Vkyrtwv8CVhyN6NHciTMsHEinvnjX7MpT5nxvBJxslhofADQWHgZUWHwUa+Ni
 /t/XfuTzLXRR/7aRR64oH4djemJkc3yHJaaQIs/BfwhX2Nf8wHjrOH6JlIEhjiaIQ/iRyhpZtRL
 9DxN56wkEVMVq7ovuJQQ38LI0r+q2QlEZtRueYMLh9taqCVZF4jnoki4+ec/9b+ghIReABawXm0
 hs+kTGn//pvVJqegknyuUEeWqGaQWzI7pU0kW2Ppt3q5OXy5BiYpaSf2v0e2rze5/aPguH5CeEP
 eyDfQgNlvCPld+1o+NJ4EFKqFEKbcbDPyqPhIpXWRBeOFXEXt77W0OyKYzs43eLw9+CsxV3+nm7
 WX5Lzr1/WzaGs3l3ACQ==
X-Proofpoint-ORIG-GUID: YGP3wwH5cC6aOtcl3vuoIObN3wzodCPn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_001653_081669_EDF32598 
X-CRM114-Status: GOOD (  35.33  )
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

On Thu, Nov 19, 2026 at 06:54:42PM +0200, Vladimir Kondratiev wrote:
> Trap handlers that act on behalf of a lower privilege mode, such as
> platform load/store access fault emulators, receive the faulting
> address as a virtual address of the trapped context (mtval). To decide
> what was actually accessed they need the physical address, and RISC-V
> has no instruction to translate an address on behalf of another mode.
> 
> Add sbi_va_to_pa() which walks the page tables referenced by
> satp using plain M-mode physical loads, so it is unaffected by the PMP
> restrictions applied to S-mode. It supports Sv32 on RV32 and
> Sv39/Sv48/Sv57 on RV64, handles superpages, and masks the Svpbmt and
> Svnapot bits out of the PPN. Every PTE address is checked against the
> current domain before being dereferenced so a corrupt page table
> cannot cause a nested M-mode fault. Translation for VS/VU-mode
> (two-stage) is not supported and returns SBI_ENOTSUPP.
> 
> Add the corresponding satp and PTE field definitions to
> riscv_encoding.h.
> 
> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
> ---
>  include/sbi/riscv_encoding.h | 28 ++++++++++++++++
>  include/sbi/sbi_unpriv.h     | 23 +++++++++++++
>  lib/sbi/sbi_unpriv.c         | 78 ++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 129 insertions(+)
> 
> diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
> index ffe7666c176b..367a8eb55649 100644
> --- a/include/sbi/riscv_encoding.h
> +++ b/include/sbi/riscv_encoding.h
> @@ -127,12 +127,32 @@
>  #define PRV_M				_UL(3)
>  
>  #define SATP32_MODE			_UL(0x80000000)
> +#define SATP32_MODE_SHIFT		31
>  #define SATP32_ASID			_UL(0x7FC00000)
>  #define SATP32_PPN			_UL(0x003FFFFF)
>  #define SATP64_MODE			_ULL(0xF000000000000000)
> +#define SATP64_MODE_SHIFT		60
>  #define SATP64_ASID			_ULL(0x0FFFF00000000000)
>  #define SATP64_PPN			_ULL(0x00000FFFFFFFFFFF)
>  
> +/* Page table entry */
> +#define PTE_V				_UL(0x001)
> +#define PTE_R				_UL(0x002)
> +#define PTE_W				_UL(0x004)
> +#define PTE_X				_UL(0x008)
> +#define PTE_U				_UL(0x010)
> +#define PTE_G				_UL(0x020)
> +#define PTE_A				_UL(0x040)
> +#define PTE_D				_UL(0x080)
> +#define PTE_PPN_SHIFT			10
> +/* Sv32: PPN is bits 31:10 */
> +#define PTE32_PPN_MASK			_UL(0x003FFFFF)
> +/* Sv39/48/57: PPN is bits 53:10; excludes Svpbmt (62:61) and Svnapot (63) */
> +#define PTE64_PPN_MASK			_ULL(0x00000FFFFFFFFFFF)
> +/* VPN field width per page table level */
> +#define PTE32_VPN_BITS			10
> +#define PTE64_VPN_BITS			9
> +
>  #define SATP_MODE_OFF			_UL(0)
>  #define SATP_MODE_SV32			_UL(1)
>  #define SATP_MODE_SV39			_UL(8)
> @@ -176,6 +196,10 @@
>  #define MSTATUS_SD			MSTATUS64_SD
>  #define SSTATUS_SD			SSTATUS64_SD
>  #define SATP_MODE			SATP64_MODE
> +#define SATP_MODE_SHIFT			SATP64_MODE_SHIFT
> +#define SATP_PPN			SATP64_PPN
> +#define PTE_PPN_MASK			PTE64_PPN_MASK
> +#define PTE_VPN_BITS			PTE64_VPN_BITS
>  
>  #define HGATP_PPN			HGATP64_PPN
>  #define HGATP_VMID_SHIFT		HGATP64_VMID_SHIFT
> @@ -185,6 +209,10 @@
>  #define MSTATUS_SD			MSTATUS32_SD
>  #define SSTATUS_SD			SSTATUS32_SD
>  #define SATP_MODE			SATP32_MODE
> +#define SATP_MODE_SHIFT			SATP32_MODE_SHIFT
> +#define SATP_PPN			SATP32_PPN
> +#define PTE_PPN_MASK			PTE32_PPN_MASK
> +#define PTE_VPN_BITS			PTE32_VPN_BITS
>  
>  #define HGATP_PPN			HGATP32_PPN
>  #define HGATP_VMID_SHIFT		HGATP32_VMID_SHIFT
> diff --git a/include/sbi/sbi_unpriv.h b/include/sbi/sbi_unpriv.h
> index be2196267413..245ad4a6e817 100644
> --- a/include/sbi/sbi_unpriv.h
> +++ b/include/sbi/sbi_unpriv.h
> @@ -14,6 +14,7 @@
>  
>  struct sbi_scratch;
>  struct sbi_trap_info;
> +struct sbi_trap_regs;
>  
>  #define DECLARE_UNPRIVILEGED_LOAD_FUNCTION(type)           \
>  	type sbi_load_##type(const type *addr,             \
> @@ -44,4 +45,26 @@ void sbi_store_loop(u8 *buffer, ulong addr, ulong len,
>  
>  ulong sbi_get_insn(ulong mepc, struct sbi_trap_info *trap);
>  
> +/**
> + * Translate a virtual address of the trapped S/U-mode context into a
> + * physical address by walking the page tables referenced by satp.
> + *
> + * Intended for trap handlers (e.g. load/store access fault emulation)
> + * that need to know which physical address a lower privilege mode
> + * tried to access. The walk is done with plain M-mode physical loads,
> + * so it is not affected by the PMP restrictions applied to S-mode.
> + *
> + * @param regs trap registers of the trapped context, used to determine
> + *             the previous privilege mode
> + * @param va virtual address in the trapped context
> + * @param pa output physical address
> + *
> + * @return 0 on success,
> + *         SBI_EINVAL if the trapped context was M-mode,
> + *         SBI_ENOTSUPP for VS/VU-mode (two-stage translation) or an
> + *         unsupported satp mode,
> + *         SBI_EINVALID_ADDR if the walk hits an invalid or unreadable PTE
> + */
> +int sbi_va_to_pa(const struct sbi_trap_regs *regs, ulong va, ulong *pa);
> +
>  #endif
> diff --git a/lib/sbi/sbi_unpriv.c b/lib/sbi/sbi_unpriv.c
> index 60becedc2ea4..028d5074fbb8 100644
> --- a/lib/sbi/sbi_unpriv.c
> +++ b/lib/sbi/sbi_unpriv.c
> @@ -9,6 +9,8 @@
>  
>  #include <sbi/riscv_encoding.h>
>  #include <sbi/sbi_bitops.h>
> +#include <sbi/sbi_domain.h>
> +#include <sbi/sbi_error.h>
>  #include <sbi/sbi_hart.h>
>  #include <sbi/sbi_scratch.h>
>  #include <sbi/sbi_string.h>
> @@ -253,3 +255,79 @@ ulong sbi_get_insn(ulong mepc, struct sbi_trap_info *trap)
>  
>  	return insn;
>  }
> +
> +int sbi_va_to_pa(const struct sbi_trap_regs *regs, ulong va, ulong *pa)
> +{
> +	const struct sbi_domain *dom = sbi_domain_thishart_ptr();
> +	ulong satp, ppn, pte, pte_pa, mask;
> +	int levels, lvl;
> +
> +	if (sbi_mstatus_prev_mode(regs->mstatus) == PRV_M)
> +		return SBI_EINVAL;
> +	/* VS/VU-mode would need a two-stage (vsatp + hgatp) walk */
> +	if (sbi_regs_from_virt(regs))
> +		return SBI_ENOTSUPP;
> +
> +	satp = csr_read(CSR_SATP);
> +	switch ((satp & SATP_MODE) >> SATP_MODE_SHIFT) {
> +	case SATP_MODE_OFF:
> +		*pa = va;
> +		return SBI_OK;
> +#if __riscv_xlen == 32
> +	case SATP_MODE_SV32:
> +		levels = 2;
> +		break;
> +#else
> +	case SATP_MODE_SV39:
> +		levels = 3;
> +		break;
> +	case SATP_MODE_SV48:
> +		levels = 4;
> +		break;
> +	case SATP_MODE_SV57:
> +		levels = 5;
> +		break;
> +#endif
> +	default:
> +		return SBI_ENOTSUPP;
> +	}
> +
> +	/*
> +	 * M-mode runs with MPRV=0 so the dereferences below are physical
> +	 * loads. The hardware has already walked these tables to produce
> +	 * the trap, so the PTEs we read are the ones it used.
> +	 */
> +	ppn = satp & SATP_PPN;
> +	for (lvl = levels - 1; lvl >= 0; lvl--) {
> +		pte_pa = (ppn << PAGE_SHIFT) +
> +			 (((va >> (PAGE_SHIFT + PTE_VPN_BITS * lvl)) &
> +			   ((1UL << PTE_VPN_BITS) - 1)) * sizeof(ulong));
> +
> +		/*
> +		 * Never dereference memory the trapped mode itself could not
> +		 * read: a bogus pointer here would be a nested M-mode fault.
> +		 */
> +		if (!sbi_domain_check_addr(dom, pte_pa, PRV_S, SBI_DOMAIN_READ))
> +			return SBI_EINVALID_ADDR;
> +
> +		pte = *(volatile ulong *)pte_pa;
> +		if (!(pte & PTE_V) || ((pte & PTE_W) && !(pte & PTE_R)))
> +			return SBI_EINVALID_ADDR;
> +
> +		ppn = (pte >> PTE_PPN_SHIFT) & PTE_PPN_MASK;
> +		if (!(pte & (PTE_R | PTE_X)))
> +			continue;
> +
> +		/* Leaf PTE. For a superpage the low PPN bits come from VA. */
> +		mask = (1UL << (PAGE_SHIFT + PTE_VPN_BITS * lvl)) - 1;
> +		if (ppn & (mask >> PAGE_SHIFT))
> +			return SBI_EINVALID_ADDR;
> +		/* Physical address must fit in ulong (matters for Sv32) */
> +		if (ppn >> (__riscv_xlen - PAGE_SHIFT))
> +			return SBI_ENOTSUPP;
> +		*pa = ((ppn << PAGE_SHIFT) & ~mask) | (va & mask);
> +		return SBI_OK;
> +	}
> +
> +	return SBI_EINVALID_ADDR;
> +}
>
Hi Vladimir,

I am concerned about the security implications of introducing a generic S-mode page table walker in OpenSBI.
There are multiple boundary-crossing concerns here. First, S-mode owns and manages its page tables, while
M-mode has historically treated them as opaque supervisor-managed data structures. This helper changes that
model by having M-mode interpret and act upon S-mode translation metadata.

More importantly, this establishes a trust relationship where a less-privileged mode is effectively supplying
metadata that may influence subsequent M-mode memory accesses. Even if the current use case is safe, it becomes
easier for future code to make M-mode access decisions based on supervisor-controlled page table contents.

Beyond the security model concerns, this implementation does not appear to fully reproduce architectural address
translation behavior. It is missing several important checks such as A/D bits, MXR, SUM, canonical address validation,
and access-type-specific permission checks for load, store, and instruction fetch accesses. As a result, the software
walk may succeed in cases where hardware would have generated a page fault.

There is also a correctness concern around TOCTOU races. The implementation assumes that the page tables being walked
are the same ones used by hardware when the original fault occurred. However, page tables may be modified concurrently
by another hart after the fault is taken, meaning the software walk can observe a different translation than the one
that triggered the trap. This introduces both correctness and security concerns.

For now, I would push back on this patch series. There would be better ways to achieve the same.

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
