Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD08FF885A
	for <opensbi@archiver.kernel.org>; Mon,  4 May 2026 15:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NZ+MNtMEcDxMJQqpMp+v95Wn+u14QnzZFQvD75cWg2g=; b=uIS28O0aVM/5oP
	mS3sPv42GYnJVH091fOzx3FQw9XyjCR+pWn27IUnnCVZJPPqN9zhJAImBrdgTaRq01g8YcjTNU9d2
	TLPITchnf6V7ZrRvhaTpBjiVDtqGtNvIABRibjv3ziLV12zGJCDdQ8UdPsq9bzYP8c8SDLdErh0cY
	ZhSFxxTx8vDWRFJe8NgaOVl6UgxQxnA81CNjjis2i+MEDJEqmfEm47EoiR7W/W2KyHV21NL6TqzJh
	ssn38hk+BZ25RBh72UgHdmhc2exHJcaVdQyzlVc5F6WkaJmEeob7tCvocttxP424pT15JnBYZO/DX
	7Allp0MlJPG0027oyF4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJunN-0000000DXoy-1LvB;
	Mon, 04 May 2026 15:01:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJunL-0000000DXnz-0UmX
	for opensbi@lists.infradead.org;
	Mon, 04 May 2026 15:01:16 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644DlpD5299673
	for <opensbi@lists.infradead.org>; Mon, 4 May 2026 15:01:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TBJx7sl4bVVADvbZ+Dby9HDZ
	BT+fXdJ8W/iRMlUwS2A=; b=XFB8+3pLAHx4fyEe/dtMysh/+6bRNfiUkrYPz6by
	TX+MM3/dbe62zzXWajAw2z+6TTTV8d+nqzXhMcUl5bDTiIHl0aFEEMPVnnfZ6eob
	Hk96yoLewK9kFBF1WBXyu84J2P1uXY7KATG60fb3Z0zOHBQREE8WOuTwcJyxCH3F
	VrxoDGzzrwrsnEOvwE8RkDY96b+Vvrj8Te9uhdMK/ggAd8iWqev4FUYu7LZ7HW9/
	vKU8fIdhWsPyfuBOTyQn+fisUYRQDrDL4R5QG79yh980QYBKE6IKcK22oPQ6lz9b
	UeYTg7OhchQEdGeTWD9m5i2t/ZqM6oyixr1Jqqx2mJvwGg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvnd8a78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 04 May 2026 15:01:12 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8230d6d54a5so3247302b3a.1
        for <opensbi@lists.infradead.org>; Mon, 04 May 2026 08:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777906872; x=1778511672; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TBJx7sl4bVVADvbZ+Dby9HDZBT+fXdJ8W/iRMlUwS2A=;
        b=G/yijywtKeL3R2Sr0naHgE4iph3P9N1lMPj8qPfhElh0Q+SW/Mx1NJ5s9T71JPHxiE
         be6cviF9TIJHzFGYbng+74pmpjukbbduM01ighcFVaflAMjCNg57eYmKYhPWN+hpECRA
         X8F4CUeoq0fS5uKN3+pc/3ZVHZuE/iBNO+x3ddaDPRK4LD+U4e0BcfhnsgoOsRzLFOzX
         fAFEN5NETQpHH3wcpTDHxB4K6+7nPj1jwnl1dyIWuPRqIHntWWwsHSf+//yzpJ/0Q5RO
         PT6ZyrydRzk1r2z1eRJxs6rHmS/cAXyyRDFK0I9MHXZZlwquoLd7GDEuFApLnt3b9uJC
         kK8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777906872; x=1778511672;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBJx7sl4bVVADvbZ+Dby9HDZBT+fXdJ8W/iRMlUwS2A=;
        b=K9DgYoiVvp6F5Ys8RjEdwL8E+YotFzPFj1N7qLJ+R5RVs3RV4tWo0VBmh/uooOHUCT
         s9gxAk6ImvQXQoKZiE79tnSnjnnMOsr4gAWwAHAhvkkWMsdU4my0dgeF9HszwkPcueby
         taBkeS93wXSQ3sZvG6zqiOZjXo7VFEDIf7xGhyxKUw0Y4L2ZzCZg7UC+UI4uJcp7V7wo
         Oze0eY/SAQDJM1A8pB458VkwugkHzT2CXS8nsZMuopul2beKIrD18dsEm7lW7lQx4g8T
         W0KWUhNnV4xDompETx//1PaDXDpDGKzQThJ8UZNiLkK62MnuNI4SSDA8TZGmSM5ku/r+
         1YXw==
X-Gm-Message-State: AOJu0YwlnNZeoU9nA0cYYC0S9Z//G9NdoDaJqOjG5fXPd+S/k85Tbax4
	9gmFV1YsGpLMbqeCMn3nVcAoam2dJyIw1lJwFM7YsPzsU7b0qxkDAfXsWWhd2DDjHowZFoCJ2KY
	vP7pqE9D6b5IdyFlruTA4myofrUnyCAvqcv7kx9YW4DYMs9CihZuCR7KBaqCGfVeUQg==
X-Gm-Gg: AeBDieuKRemPn0l4SxgyhGdJXV7ifpWr++zqHrLpngoywnCY2Cf6s8mgYCaBm6emLJr
	ygxRfRHX8kd5MLntNOyW0jfrcfVm/E2pSrpxUlzaSscb2fR1CuSNdR1nwrIIHgGjK/Qksl9ki0Z
	arNpkHu5noMHE+eQ58dF5ZOSd2smjSI6SVU49WKVguFWSBD6JqTRcAJfttN/XbSafsA7Qs2GzNW
	0fVVQjvmKOn5p0zeVgP1hmXo6SojiIPZla3Eu2CM3dio03RD1N1Q6RZ2XTIHJeiFeqJ0Vl4vcQe
	1+x3P15BQ35YaYMKma1WuNLgkjrUfKTm9UTF0MNN8a2eSXUAloEGYWjWKqqDnY4H+AUZVyITzGQ
	uTLJsMVDvTRGU75pcL5goi4D9D/aRqUV+d9lajO3Ybe9zsTZHXOhTYdPb+7r8HmhHqsvHw1pIT4
	wUjsyEjdVUTLO4Jwe3b91/bxls6ab74C9vE3SyX6nf0HNbU57SMQe8RpAe
X-Received: by 2002:a05:6a00:b603:b0:837:8342:abe5 with SMTP id d2e1a72fcca58-8378342b11emr3716260b3a.18.1777906871685;
        Mon, 04 May 2026 08:01:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:b603:b0:837:8342:abe5 with SMTP id d2e1a72fcca58-8378342b11emr3716202b3a.18.1777906870968;
        Mon, 04 May 2026 08:01:10 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8351587db67sm12047562b3a.13.2026.05.04.08.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 08:01:10 -0700 (PDT)
Date: Mon, 4 May 2026 20:30:33 +0530
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: opensbi@lists.infradead.org, Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: Re: [PATCH 02/18] dbtr: Trigger update should set sbiret.value on
 failure
Message-ID: <afi0kZrVW42qXOzI@hu-himchau-blr.qualcomm.com>
References: <20260313051948.4017134-1-npiggin@gmail.com>
 <20260313051948.4017134-3-npiggin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260313051948.4017134-3-npiggin@gmail.com>
X-Proofpoint-ORIG-GUID: HeccUMlk8XUtA57JF0cJbXgqVCqYkDWh
X-Authority-Analysis: v=2.4 cv=d9jFDxjE c=1 sm=1 tr=0 ts=69f8b4b8 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=JfrnYn6hAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=DNuTscI9b5_Jvs8fipYA:9
 a=CjuIK1q_8ugA:10 a=OpyuDcXvxspvyRM73sMx:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: HeccUMlk8XUtA57JF0cJbXgqVCqYkDWh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE1MSBTYWx0ZWRfX64FGCgurTs0z
 IfV1a4Jmc4Q8FwVMgxwMr+TGv0qwBt5Lkkysw9YwmAN7qq/Y+A5KZMPnw3dhjM91jLiGYz9Cpcx
 0XLq+NNpi9xCiMBk6eXoRzfTuPwL+4TA8GI6XbeEW2I7yMGdGIzK1qP//FapD54vKjm8OjgOeS0
 iKd+8z0LxX/bkZAo79x9yVdIBLQsiBHP8rCQMJcdYx+Lt5ChbelB8c02mrdeRsZryja7wCANG+X
 y2l3hEgMpzOhw4TLfnah3eSihToow1kyL+3vTTMFL6BB5VtpD6HRV30MZifISyNCdaDPnUOLg0E
 KaMlICD/XNHhqRW5JzdUb5IkJ+x12aiIBXZeMYA5K+LKqOsAPZGCqTTv0HA0nb2gU8eJ2LkWl/M
 Fqd9mbU3W1/vJi5fuTnjbz6Emrb1HfSqQjMNnhc6i4NBoagIypsHMU/NGQ4ChU8dLij/D9cgnY5
 uUHBWgBG9erKHFiNOKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_080115_182331_1E291412 
X-CRM114-Status: GOOD (  19.68  )
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

On Fri, Mar 13, 2026 at 03:19:31PM +1000, Nicholas Piggin wrote:
> According to RISC-V SBI specification, trigger updates should return the
> value of the problem trigger index on failure.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  include/sbi/sbi_dbtr.h   | 2 +-
>  lib/sbi/sbi_dbtr.c       | 4 +++-
>  lib/sbi/sbi_ecall_dbtr.c | 2 +-
>  3 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/include/sbi/sbi_dbtr.h b/include/sbi/sbi_dbtr.h
> index 5e0bf84e..b8b5c9ab 100644
> --- a/include/sbi/sbi_dbtr.h
> +++ b/include/sbi/sbi_dbtr.h
> @@ -115,7 +115,7 @@ int sbi_dbtr_uninstall_trig(unsigned long trig_idx_base,
>  int sbi_dbtr_enable_trig(unsigned long trig_idx_base,
>  			 unsigned long trig_idx_mask);
>  int sbi_dbtr_update_trig(unsigned long smode,
> -			 unsigned long trig_count);
> +			 unsigned long trig_count, unsigned long *out);
>  int sbi_dbtr_disable_trig(unsigned long trig_idx_base,
>  			  unsigned long trig_idx_mask);
>  
> diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
> index b0160163..8f59e407 100644
> --- a/lib/sbi/sbi_dbtr.c
> +++ b/lib/sbi/sbi_dbtr.c
> @@ -714,7 +714,7 @@ int sbi_dbtr_enable_trig(unsigned long trig_idx_base,
>  }
>  
>  int sbi_dbtr_update_trig(unsigned long smode,
> -			 unsigned long trig_count)
> +			 unsigned long trig_count, unsigned long *out)
>  {
>  	unsigned long trig_idx;
>  	struct sbi_dbtr_trigger *trig;
> @@ -740,6 +740,7 @@ int sbi_dbtr_update_trig(unsigned long smode,
>  
>  		if (trig_idx >= hs->total_trigs) {
>  			sbi_hart_protection_unmap_range((unsigned long)entry, sizeof(*entry));
> +			*out = _idx;
>  			return SBI_ERR_INVALID_PARAM;
>  		}
>  
> @@ -747,6 +748,7 @@ int sbi_dbtr_update_trig(unsigned long smode,
>  
>  		if (!(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED))) {
>  			sbi_hart_protection_unmap_range((unsigned long)entry, sizeof(*entry));
> +			*out = _idx;
>  			return SBI_ERR_FAILED;
>  		}
>  
> diff --git a/lib/sbi/sbi_ecall_dbtr.c b/lib/sbi/sbi_ecall_dbtr.c
> index 40a437ee..f3196feb 100644
> --- a/lib/sbi/sbi_ecall_dbtr.c
> +++ b/lib/sbi/sbi_ecall_dbtr.c
> @@ -43,7 +43,7 @@ static int sbi_ecall_dbtr_handler(unsigned long extid, unsigned long funcid,
>  		ret = sbi_dbtr_enable_trig(regs->a0, regs->a1);
>  		break;
>  	case SBI_EXT_DBTR_TRIGGER_UPDATE:
> -		ret = sbi_dbtr_update_trig(smode, regs->a0);
> +		ret = sbi_dbtr_update_trig(smode, regs->a0, &out->value);
>  		break;
>  	case SBI_EXT_DBTR_TRIGGER_DISABLE:
>  		ret = sbi_dbtr_disable_trig(regs->a0, regs->a1);

Looks good.

Reviewed-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>

T/R
Himanshu

> -- 
> 2.51.0
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
