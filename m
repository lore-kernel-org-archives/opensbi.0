Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81821CCF2EE
	for <opensbi@archiver.kernel.org>; Mon, 19 Jan 2026 11:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=flSk0coQfKfhmCkwRfSv2Idv8I2S1+qqtaXZ4CMPwQU=; b=h6zgKrpcHfNMeW
	kxJ0HAXXZ+nOZBYnnHKFTtedO1G0A5lzvK0ReEvquU5lbGhTW4+QG2BflExoUSQufE4CfK0qLgO7n
	VXNlYPal0EAJqrUQEesDFPo9xTiOjauPuVUUgIA4ySsEDbp0NRgk9Sbm/3dlBFJXzanpWm89vwiHl
	YvRK1jKYKrMX7IfoYOnZlqxL3PlSDPzEIVNRiS9ecv0uWoG0n2H0L7Bd37sfykMtW/uUMuoNzUGga
	ADej2V7Byont7Mx3T+bqz3C5JPdN95Wjs3XSvh96jE9E3MZ02rdxXdSEOmCplXF/TiMlxaV6Wr+S3
	saPJPGkI+bZ6zoD8HT+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhnsq-00000001vyI-09gI;
	Mon, 19 Jan 2026 11:57:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhnsn-00000001vxL-14Du
	for opensbi@lists.infradead.org;
	Mon, 19 Jan 2026 11:57:22 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J9n2WQ2965098
	for <opensbi@lists.infradead.org>; Mon, 19 Jan 2026 11:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CYjEYjw25BvAa2wQ+eS2fRzTW8C/+mfkY2bMqsuWb4I=; b=AqBgMhUIF88s0C58
	i1/1VyoU0d0SBSbcJyToyPY1hHEgTGLwj20LUdmMjSfoRNsRWF42Y+ziWmZ5NfpK
	kZ8FE1PZFMyRz7jADKJmR/juHpZseazjdAKWxJX9R7ckTed/aflTNzPFToHeh4yB
	VjJgCvroltY1vIDOJFtaRU6S0xM86GKi6q0i+rGC0lm4HhoQ2lk87exhY2y0d2Ou
	vco5tErEb1IZDD425d9ta8WCnZK9wVDZFUsR593FK6p1wXl7Q0dLS5zDx52vrRZv
	DrYEvNGEeFabKI1klLHe5zpCXKCwWZ4JYq2sH3BWAkBIjrsZ2EjaKbVlpJ/s6QNP
	BwhIow==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjaa8cc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 19 Jan 2026 11:57:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6b4058909so417403685a.3
        for <opensbi@lists.infradead.org>; Mon, 19 Jan 2026 03:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768823838; x=1769428638; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYjEYjw25BvAa2wQ+eS2fRzTW8C/+mfkY2bMqsuWb4I=;
        b=G4jan71ZznG23CEfNJfR7jUCoHUE4iMtgfDGG4eZcyVnIayjB6zIM6gFwf208/63Yk
         FcFx6wdeek+SfHbG1Oa4b7jEL/nfi33FDfVyvUwgu6QsNscDGKBaN0Cb68rzbUmh5k9z
         4tlvkN0DFP2pnxgI8M2Zmzy01Xp/DbKVr4osoHUgli2SbqDMtx3ERIBdBYadgx/n26Zv
         NeCOr9XnvGAWNGlooeZKThwPNCejG+hpVxhQwkoa5lbYFkESYoYFz9cgOYYWGHcO0Dc7
         RyJsvFQH35PWpD1Xw7mK9BnnKfFbnID0mqndEt/III83ryVf1MyDDrJeYzOls+wlkN0T
         EQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768823838; x=1769428638;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CYjEYjw25BvAa2wQ+eS2fRzTW8C/+mfkY2bMqsuWb4I=;
        b=kBfUyGvqPIVYt8RJS+lVdwcNG1IxxeiIs+2qDUPFJxG2BuxyecL1j/08UlKfdPZvSO
         iSBq3po5OXHiFGuDFq5WJbjFb/nL4mlQmvImAwVrkWX4mmRpbSoxEx4weUgPDrBfHPnE
         s7NklVWDVClov9yZjGLhCrNJ/VLCW2qh4BmLlgCNLOuCWTpulu5MadV8DnERnk6fMriQ
         QW9exF34LdxPVYllE2dqoehohZiqEeM+LLikTMHlp8DrZQ3Yj2m3eHMyM5sidmjSX0PE
         idSXz8qkhWJ9sQBvCEntUW6wf2ks35K+ZL5LakhAhTjMjVtPONsacyTk0VJbDnlqgonW
         waJA==
X-Forwarded-Encrypted: i=1; AJvYcCXgPM0L6hc8EaIw7mW7fXC7rjLc9C90WX8vcIlJn4GO+XA90EEuG8mi8h076NcgW1P3/iXIy4Gj@lists.infradead.org
X-Gm-Message-State: AOJu0YxsxlMfvnAWrUPOvk0Tlq1JoR8ZN2tjvsLzVhjbVeOtauEGry8v
	QQ9pBGk4/UOTPqkd5ddmmeiIkbrx+xEw+6pelWrw3X6feY98iWz+keN0xFOlU3FR57/cja67Cpo
	+MfFZ+K7N/fiCf5NFwMHpBn7rJQKspaRCF0mT0OSTdtkegUb5uFQqX4Qhgq9GFs3nuzuoDQRMvg
	==
X-Gm-Gg: AY/fxX58+8l2iNTC0+X9Xf75HmxG/7CKTBBqcW+dr2yFz+GZQ+XfYAtKm1TBwUtwv6V
	Vgz+NuNR7/G7aLuYTEpy0p/XegixiN3uIS3TZzxRz3o52sgdNr/ZkyNwiE4s9a3fYw8FW4TKW2v
	XVHINrkyVmQ5ElXzoLli6eGUz1PbySeQZqMwgHRoTEI26uC5cs0hk6c8E1TL2UdgSh0mzoNJYKk
	RPaLhPt7DKL5rcVQmlHixUu2T+dlseoObkXsEjfaofAsLk02tHaqqwChYnmuRS/MM2yaVxnztCi
	fp6dCeDaZEJPsrFt+zxzdbbmlIhmO7bIAvltYJk4+DQLN1hCLSh4fFVxK2ynpYBVFl5H/kEVIKq
	tjYcTgwqmDg9X8MwHVWamQQuP+WmVJuLvgMx65XTZaf4P3jWq
X-Received: by 2002:a05:620a:4112:b0:8a2:3be9:1d79 with SMTP id af79cd13be357-8c6a66d697cmr1560417185a.18.1768823838355;
        Mon, 19 Jan 2026 03:57:18 -0800 (PST)
X-Received: by 2002:a05:620a:4112:b0:8a2:3be9:1d79 with SMTP id af79cd13be357-8c6a66d697cmr1560414385a.18.1768823837906;
        Mon, 19 Jan 2026 03:57:17 -0800 (PST)
Received: from localhost (ip-86-49-253-11.bb.vodafone.cz. [86.49.253.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921dedsm22634940f8f.9.2026.01.19.03.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 03:57:17 -0800 (PST)
Mime-Version: 1.0
Date: Mon, 19 Jan 2026 11:57:16 +0000
Message-Id: <DFSJPWHEF293.2Z6H79QH3IDXR@oss.qualcomm.com>
Subject: Re: [PATCH] lib: sbi_pmu: Add FW counter index validation when
 reading high bits on RV64
Cc: <andrew.jones@linux.dev>, <atishp@rivosinc.com>,
        "opensbi"
 <opensbi-bounces@lists.infradead.org>
To: "James Raphael Tiovalen" <jamestiotio@gmail.com>,
        <opensbi@lists.infradead.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
References: <20260117125031.56031-1-jamestiotio@gmail.com>
In-Reply-To: <20260117125031.56031-1-jamestiotio@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA5OSBTYWx0ZWRfX8wgwsGEbn/t3
 NUC/wVcTY/IQyfQk/NQRlviWylPGrG73NX/jA8d8K9VmGaNJIDfLhGpNPkFYQ448SFvEMx8taSg
 voLCr+ClXcAgkImu5vpbqVcmR8VXHTWcIQJ2ufFFznYUYrsiu5NNDrQdoKR1PnZllNPdxNLsM1I
 S79wxw5U0g17ZbPPpin6i4TiPJ42IQJBYFjjxHEMtkeC3NZ5kJdwHddNjxKkBISPulEvxHg2pUc
 BeavDuiGCbss8khnAQpt1M2GFZ1CLLIMGeKL72iGQ1hW5ww2Ih/TeTT5uqRdsfyzmVhGbocvOAJ
 YzKar0o5nDYjwCqoYYW5rdFNS0zczeHFB5LGr2uPtcfhYtNoxWp/tVNqh3F7gqq1bIRLsfDAtWF
 p3c+P/f9Oduv4PbdIkcZ9sAsAytJay0E3qOeaiSCJROOmVLM/+AJOY8lj/GsUzMEJYXO0EnSTQT
 /41JlbOeS2A1X0yB6ag==
X-Proofpoint-ORIG-GUID: oKmSZZI8PvZOOR1hLuaTC-doG36wfrdZ
X-Proofpoint-GUID: oKmSZZI8PvZOOR1hLuaTC-doG36wfrdZ
X-Authority-Analysis: v=2.4 cv=L8gQguT8 c=1 sm=1 tr=0 ts=696e1c1f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=HFCiZzTCIv7qJCpyeE1rag==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=5zEJGDWQOOdwX-l-qeQA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_035721_309881_D41A2256 
X-CRM114-Status: GOOD (  17.92  )
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

2026-01-17T20:50:31+08:00, James Raphael Tiovalen <jamestiotio@gmail.com>:
> Currently, when we attempt to read the upper 32 bits of a firmware
> counter on RV64 or higher, we just set `sbiret.value` to 0 without
> validating the counter index. The SBI specification requires us to set
> `sbiret.error` to `SBI_ERR_INVALID_PARAM` if the counter index points to
> a hardware counter or an invalid counter. Add a validation check to
> ensure compliance with the specification on RV64 or higher.
>
> Fixes: 51951d9e9af8 ("lib: sbi_pmu: Implement sbi_pmu_counter_fw_read_hi")
> Signed-off-by: James Raphael Tiovalen <jamestiotio@gmail.com>
> ---

While the call is poorly specified and your interpretation is valid,
I think the intention is to make this function do nothing else than
return {err, 0} on RV64 as there isn't much reason to complicate the
implementation.

I think always returning {SBI_EINVAL, 0} would be even better than
the current {SBI_SUCCESS, 0}, but it doesn't matter much since
legitimate RV64 software shouldn't ever invoke the ecall.

> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> @@ -227,6 +227,14 @@ static bool pmu_ctr_idx_validate(unsigned long cbase, unsigned long cmask)
>  	return cmask && cbase + sbi_fls(cmask) < total_ctrs;
>  }

In case of disagreement with the above:

> +int sbi_pmu_is_fw_ctr_idx(uint32_t cidx)
> +{

This functions gets passed regs->a0, so cidx should be an xlen sized
type.
(I understand trying to be consistent, as sbi_pmu_ctr_fw_read has the
 same bug, but better fix related code when touching it.)

> +	if (cidx < num_hw_ctrs || cidx >= total_ctrs)
> +		return SBI_EINVAL;

Please refactor the check in sbi_pmu_ctr_fw_read, and use it instead of
adding more logic.

Thanks.

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
