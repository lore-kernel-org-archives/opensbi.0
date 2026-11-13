Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA85606A321
	for <opensbi@archiver.kernel.org>; Fri, 13 Nov 2026 04:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vj4BGk7I;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J2uMXlDG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=No0/1QTX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=g8mhmDY/6U8ooTRU4aSmr7keVKG+SmzbEMpX2xBFyIY=; b=vj4BGk7IX6QE0JwPe+PT1ae8tJ
	CjQaVamE0uhrC1kvUTP0R5mcU97uPH3lxOPG+AZqtlnnB2179RWrbL8Q/HAaLEUtpcPst4aeEhK7F
	CKCtu5N77+odu7yEiIFbVKvclUHc8XR+hl3Ya8gkhhG2XgVQ5rj7JyFYkulttjtXk6omp/D3REpXX
	qW+J3lh8W96cBIg2J/ckj06Y+axeid/ob7mmHDEgnSlmU9DCC4EoDSuyFqk4YS+s0WBgH18dHBRw6
	LYMcpGEPFte3vX/DX6j77h8GcFnpERhIWnE2m+exaycVtQDgIwQ//GdC9wJl3v5TAF+kyaHFrVgMU
	C/WBCgSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRjLn-0000000Bew7-0aqe;
	Fri, 13 Nov 2026 04:57:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRjLk-0000000Bevh-3Gmu
	for opensbi@lists.infradead.org;
	Fri, 13 Nov 2026 04:57:21 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2K1KJ4120216
	for <opensbi@lists.infradead.org>; Fri, 13 Nov 2026 04:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=a9+bJcc5cXleJfXzO+R43eP9
	KPHrzUU1zGQS8LHawnU=; b=J2uMXlDGLlZMmdW+T43LS+7TURqdA6uoIrqfQTE7
	QMvaPd5O2AmQzDh16fW/VbTespwXlhEGzhj/3NC56+e/xdtgLH9RHvsyVT0lDCGt
	Zund0CP5Ky79KpOzuEd7d24Zy168tANSPftzm67xdrQ3EY+KqcduUFSmEqJt6Iac
	sLS8D5yN+1RGNsB5eXkuRelFP35VVnyPjYT+rjixdnjw4i+W4AeZbcvDoNuPsgGL
	7aD64bba6uEdE+2NVaqLz6JMaqWT0HcRHZDgC2rfj9iaqIAS+34r89nDwGaELQ7Q
	ceVbBJKNY1oueiDl9ErzJpsZ5RdpC1GGhclJTRAhBBBelA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbx33g61-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Fri, 13 Nov 2026 04:57:19 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-139b62317d0so2151333c88.0
        for <opensbi@lists.infradead.org>; Thu, 12 Nov 2026 20:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794545838; x=1795150638; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a9+bJcc5cXleJfXzO+R43eP9KPHrzUU1zGQS8LHawnU=;
        b=No0/1QTXrdk2apkq2nmONwz696dqbknvKTvasoADxJOL6ZISG+vVXdBWzLeboWyHAX
         d/ox1r/tWp0c756I4J5fvGhAl91S4PsGBlNGwKLCYhXJ+PGkwVTswosofv+I1dZCb7Xu
         1fAiePFa2a9oNuoPxKMQgiPixWYN6pw1B7UVyB8mw+QEs6gkAH9n1zMm/F2pa421yFig
         Vig9Yq1y+jhHb9Z6voWhC6HdfQvToYv0juvtGZl1eHruxGE/9BhABQ0MZQESUOzEddfK
         VKkNmucuz7QzFbM5e29iiiN9mrbuNHubv3H8XBqCZpNMGF2DcH+NehguPvFHEkNpo9MZ
         mxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794545838; x=1795150638;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a9+bJcc5cXleJfXzO+R43eP9KPHrzUU1zGQS8LHawnU=;
        b=qz9d53JUFlmg9qTLX6nNFznk1j1AgDQfQfTdy3/E45Ya0uMxSH4JQTar2cCAEwxd1O
         fVHuKLGTGADwZzZb/abteM7BNMD+4nrA7uU/6ic3O7bL/Adhfj1ymotS59ckW1+RU52H
         rUPwQxRE2sp+fUdm6ZsMNNRXd+Rv0Ca5pN1quGZKDd97iPnJixzXjvyP59YGRS9vdCRq
         zvQAY7O8LM+MdNN55xylYn4T/J3givOQB0DvZteHwZRaf/U47bvM8TtrlIrrneiwLu+d
         2WXCshvDAiucGkD0xEzTYEtjTck5S8R5BUTxpZ4DszoaXdY9DYGt41YKL6De6jhQ2bUU
         ZknA==
X-Gm-Message-State: APuU4Z9G5TNpdFF/G7Kfh1Y+skMQrIKeV52K5VH6gwzJgsOHXrI1KAGq
	BGB4G2i+yqGuYz3oRZWVXDT3qpOFhOYgg0rl2Wf7GsAbXOKgEs6n6Ff5zYGMjL0qbgIDlv09s5q
	SrQ4yy0jCXMt17YYE+tyBQBRWwnanpaPK07z7uznn0sziNHwdAqk74cHmiNDsuZKNJn+uefyGgQ
	==
X-Gm-Gg: AYBFou0HdKUJND2jCGC05/itNw/RL0k/nxpO6JU9yDOUYXZDvlhhixWHKunbDs+fH75
	GanpsgaXCavrT7+mp5JAHM4xYizFqEuoJM/BFGlcbnwukGyKMpd2+kUciZ+ma994pfJ4s1OLKvk
	VLj0pH47Z7TgU2p1n/YDdE24QAmhstPRV+zadM3R2JIvIWwS20r5DzxBwrRMRUKP5MLVmMav6gl
	DF1bs0nLmuizpz5CzFu20y9X96EafaDjmf0UShzUKoXbUrEoYNFTUgrazwCbgEpZwAW4PJR9yG+
	RO7UbAOgn/m3j/X7PnDU6ZHsCkbDjV+WqFNSglFiHLBfxoP8dwPDuvAdWcKvdoGzxlgmZv/DR4i
	ex+TEkm/QfIdnz19i6E5FwujEVTWr6gyhA1I31b0rAcX4+RrnbEbzTWV9H2kzOJRU2syI/BEU5R
	YRRbN6oGT2Vhp6uznU01yy8VAsc0I+TDvPyFfFjna1qkHjMtPRroWi0BQH5p2jP1t5fQjvcThvR
	Q==
X-Received: by 2002:a05:7022:f50a:b0:1a4:c892:b130 with SMTP id a92af1059eb24-1b5031152eamr1388256c88.15.1794545838153;
        Thu, 12 Nov 2026 20:57:18 -0800 (PST)
X-Received: by 2002:a05:7022:f50a:b0:1a4:c892:b130 with SMTP id a92af1059eb24-1b5031152eamr1388239c88.15.1794545837506;
        Thu, 12 Nov 2026 20:57:17 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316d9c2sm3371379c88.7.2026.11.12.20.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 20:57:17 -0800 (PST)
Date: Fri, 13 Nov 2026 10:27:12 +0530
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: liutong <liutong@iscas.ac.cn>
Cc: opensbi@lists.infradead.org, anup@brainfault.org, npiggin@gmail.com
Subject: Re: [PATCH] lib: sbi: dbtr: validate trigger configuration in
 update_trig
Message-ID: <avaYqKgR8gzFEX3I@hu-himchau-blr.qualcomm.com>
References: <20261103081001.2948003-1-liutong@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261103081001.2948003-1-liutong@iscas.ac.cn>
X-Authority-Analysis: v=2.4 cv=S+5MU4sP c=1 sm=1 tr=0 ts=6af698af cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=6k0YY9uXW2mkjXBALfwA:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxOSBTYWx0ZWRfX96Jgnvb/Vb7u
 VO68mYhIFUWv3SFzNlMy1ZSfMnvX3RemRBBgMCqt3pZSsEZ+ul+4cWaSjZVNsgapErnjYnSHc1o
 YsnejQYvm0vVVp+Mrt8s35PEJxj/n8u9VpdCFL2OUWkx1H5lU6Zp8TR9atjF/dLrAwPOLLODRAJ
 PrQEXXgNz7ctixVC3n6xNTjVfqjBD+RrYOdHcqJmpkSnv0LOIgEFZJdViXC7LNDcX11w+K2O4Zj
 68oz2Ljnxbga1H/Zi8AcN3SY3D0ms6eysUOB/q0QEcei+lLBT8IwN9L9JxYY42SWQ9j8mD34kAV
 bvQTSGdMHATNNc8rlB9rIsHciVzHtz5ZBbkuDCAR9JWOPO5kxqkXN3dm4d+6cgfsj5/mV2z8F/a
 e97MsjQZploM6m3fWG8gWqy48KVd0zkbbg4B9/7dPSQT3gSDvyysEgPpQbOayWnEmBB+39vBrCb
 R760Q9oUfzhhajtrwKQ==
X-Proofpoint-ORIG-GUID: CNSckdLI8tx2hXCyBB357R32Z_pgXjTh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxOSBTYWx0ZWRfX3lbRRUCvImjG
 tBnchiNhhGfMo2EohVFaNgWytSdS4yAuRMvqA9jIcGZSgPboz64WgG+fQEs6Xsm9A/LBLN2mEgj
 oviT9U7bkt7GqlnmdHy8rwcfoYfGwzo=
X-Proofpoint-GUID: CNSckdLI8tx2hXCyBB357R32Z_pgXjTh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_205720_831473_B6A6F48A 
X-CRM114-Status: GOOD (  55.25  )
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

Hi Liutong,

There are some gaps.

On Tue, Nov 03, 2026 at 08:10:01AM +0000, liutong wrote:
> sbi_dbtr_update_trig() programs a new tdata1 into an already installed
> trigger without checking it. sbi_dbtr_install_trig() runs
> dbtr_trigger_valid() on the configuration it is given, which refuses a
> tdata1 that sets the mcontrol6 M bit, because such a trigger fires
> while the hart is in M-mode. Update has no equivalent check, so S-mode
> can install a trigger that install accepts and then set that bit on it
> with an update. No race is needed: the two calls succeed in sequence
> and the bit is written to CSR_TDATA1 without being checked.
> 
> dbtr_trigger_valid() also refuses the DMODE bit. That one is not
> reachable this way, since tdata1.dmode is writable only from Debug
> Mode, but the check covers both.
> 
> Check the configuration before the trigger is reprogrammed, and copy
> it out of the shared memory once so that the validity check, the
> hardware support check and the value finally written to the CSRs all
> see the same configuration rather than separate re-reads of memory
> S-mode can still write. The copy also lets the mapping be released
> before the trigger is programmed.
> 
> SBI v3.0 section 19.5 defines SBI_ERR_INVALID_PARAM for an invalid
> trigger configuration entry. Install reports an unknown trigger type
> as SBI_ERR_FAILED instead, from a separate dbtr_trigger_supported()
> call that this patch does not add to update, so the two paths differ
> for that input.
> 
> dbtr_trigger_valid() rejects a type it does not recognise, so an
> unknown type in the new tdata1, including a zero tdata1, is refused
> here as it already was on install. It does not check the new type
> against the one the trigger was installed with, nor against the
> trigger's type_mask, so update still accepts a change of type that
> install would not have allowed in the first place.
> 
> This does not address the equivalent problem in sbi_dbtr_install_trig(),
> where the value passed to dbtr_trigger_valid() and the value later
> programmed come from separate reads of the shared memory. The
> escalation stays reachable there until that is fixed separately.
> 
> Fixes: 97f234f15c96 ("lib: sbi: Introduce the SBI debug triggers extension support")
> Reported-by: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: liutong <liutong@iscas.ac.cn>
> ---
> 
> Prior art: Nicholas Piggin reported the same gap and posted a fix in
> "[PATCH 07/18] dbtr: Check for invalid and unsupported triggers in
> update" (20260313051948.4017134-8-npiggin@gmail.com). That series is
> marked changes-requested in patchwork and has had no v2 in seven
> months, and 07/18 depends on earlier patches in it, so this is a
> standalone version against current master. His version also calls
> dbtr_trigger_supported(), which is what gives install its
> SBI_ERR_FAILED for an unknown type.
> 
> Measured under QEMU 11.1.0-rc3, -M virt -cpu rv64,debug=on, one hart,
> no race, OpenSBI at c9a7d009:
> 
>   install benign (M=0)   : err=0, CSR_TDATA1 = 0x6000000000000014
>   update to M=1          : err=0, CSR_TDATA1 = 0x6000000000000054
>   after this patch       : err=-3, CSR_TDATA1 unchanged
>   benign update          : still applied
> 
> Aimed at an address OpenSBI executes, such a trigger takes a
> breakpoint in M-mode on the next ecall; an M-mode trap cannot be
> redirected, so it ends in sbi_trap_error() and sbi_hart_hang(). The
> other hart keeps running, so it is not a machine kill.
> 
> Adjacent problems this patch deliberately leaves alone, listed so they
> are not assumed fixed:
> 
> - sbi_dbtr_install_trig() has the same split between the validated
>   read and the programmed read. With a second hart rewriting the
>   entry I get the M bit into CSR_TDATA1 within a few rounds. I have a
>   tested patch that moves the check into dbtr_trigger_setup() so one
>   check covers both paths, but it restructures install_trig and I did
>   not want to put that in the same patch. Happy to send it if the
>   approach is wanted.
> - In that same loop, sbi_alloc_trigger() returning NULL leads to
>   xmit->idx = cpu_to_lle(trig->index) on a NULL trig. The comment says
>   the dry-run makes allocation infallible, but the dry-run reads the
>   entry separately.
> - sbi_dbtr_update_trig() reports no index for the failing entry, since
>   it has no out parameter, and this patch adds another failure exit to
>   it. Install sets *out on every failure. Changing the signature felt
>   out of scope here; David E. Garcia Porras's DBTR error code series
>   already proposes it.
> - update applies entries one at a time, so a refused entry leaves the
>   ones before it reprogrammed. That is pre-existing and already
>   reachable through the trig_idx check.
> 
>  lib/sbi/sbi_dbtr.c | 29 +++++++++++++++++++++--------
>  1 file changed, 21 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
> index 5f66b641..5cb494f0 100644
> --- a/lib/sbi/sbi_dbtr.c
> +++ b/lib/sbi/sbi_dbtr.c
> @@ -853,7 +853,8 @@ int sbi_dbtr_enable_trig(unsigned long trig_idx_base,
>  int sbi_dbtr_update_trig(unsigned long smode,
>  			 unsigned long trig_count)
>  {
> -	unsigned long trig_idx;
> +	unsigned long trig_idx, tdata1;
> +	struct sbi_dbtr_data_msg local;
>  	struct sbi_dbtr_trigger *trig;
>  	union sbi_dbtr_shmem_entry *entry;
>  	void *shmem_base = NULL;
> @@ -897,22 +898,34 @@ int sbi_dbtr_update_trig(unsigned long smode,
>  			return SBI_ERR_FAILED;
>  		}
>  
> -		if ((entry->data.tdata2 && !tdata2_impl) ||
> -		    (entry->data.tdata3 && !tdata3_impl)) {
> +		/*
> +		 * Copy the entry once. S-mode can rewrite the shared
> +		 * memory at any time, so the configuration that is
> +		 * checked here has to be the one that is programmed.
> +		 */
> +		local = entry->data;
> +		tdata1 = lle_to_cpu(local.tdata1);
> +
> +		if (!dbtr_trigger_valid(TDATA1_GET_TYPE(tdata1), tdata1)) {
> +			sbi_hart_protection_temp_unmap_range((unsigned long)entry, sizeof(*entry));
> +			return SBI_ERR_INVALID_PARAM;
> +		}

The SBI update rule states that trig_tdata1.type and trig_tdata1.chain must match the originally installed trigger.
The update function still allows the caller to change tdata1.type without checking whether the already allocated
hardware trigger slot supports that type. The S-mode can update an existing trigger slot into a different trigger
type/chain configuration. Install does similar check through trig->type_mask.

The updates where the new tdata1.type is not present in trig->type_mask must be rejected.

> +
> +		if ((local.tdata2 && !tdata2_impl) ||
> +		    (local.tdata3 && !tdata3_impl)) {
>  			sbi_hart_protection_temp_unmap_range((unsigned long)entry, sizeof(*entry));
>  			return SBI_ERR_NOT_SUPPORTED;
>  		}
>  
> -		if (!dbtr_trigger_hw_supported(trig->index,
> -					       lle_to_cpu(entry->data.tdata1),
> -					       lle_to_cpu(entry->data.tdata2),
> -					       lle_to_cpu(entry->data.tdata3))) {
> +		if (!dbtr_trigger_hw_supported(trig->index, tdata1,
> +					       lle_to_cpu(local.tdata2),
> +					       lle_to_cpu(local.tdata3))) {

dbtr_trigger_hw_supported() returns true when there is no platform callback. It is not enough.

Regards
Himanshu


>  			sbi_hart_protection_temp_unmap_range((unsigned long)entry, sizeof(*entry));
>  			return SBI_ERR_NOT_SUPPORTED;
>  		}
>  
> -		dbtr_trigger_setup(trig, &entry->data);
>  		sbi_hart_protection_temp_unmap_range((unsigned long)entry, sizeof(*entry));
> +		dbtr_trigger_setup(trig, &local);
>  		dbtr_trigger_enable(trig);
>  	}
>  
> 
> base-commit: 2c7788e4c3efa63d670ee90402dac2a9799d0bd7
> -- 
> 2.34.1
> 

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
