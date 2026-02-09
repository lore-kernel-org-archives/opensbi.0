Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DFD7E81BDF
	for <opensbi@archiver.kernel.org>; Mon,  9 Feb 2026 16:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rGezt3pdb8fhe11YTu51FBLJKIOzCDs1L/03XGAIWbs=; b=wYigxJosSEgFvp
	P8RHwZn+xdIbgfelZRWRXFWQuegNuf54ilHsDx4NQ2EYqvwLswaHFmcJgw5SYvzRq71zGVB8EgFFn
	Mg7u/OHDMH7txyMUzDAdSC0cwd8JFBuQGrBaCIigNA2idcuvyLpGkoIFsERdU3QHQpOSI/OKQDHZt
	sdBPbwgO2Y63XSx5QcSmU02Hi2gYnxxdbJD1t63XJQ101WX8NBmFdAEd8OJYqIWUnXBK/n/n51ds9
	YhoEgwBY1lkdbuoRAZFYC+p4wUiNTiS4o2l9VWRu8vVbPF+cF8QHLZDsddyWDHJhUu9sAVxSlSXFL
	G/HIn/hrqXx1kdFkHlMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpUV4-0000000Fj0W-1sPT;
	Mon, 09 Feb 2026 16:52:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpUUz-0000000Fizy-2pQK
	for opensbi@lists.infradead.org;
	Mon, 09 Feb 2026 16:52:35 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619GVlR04102801
	for <opensbi@lists.infradead.org>; Mon, 9 Feb 2026 16:52:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8jZNFtEeFhKG+vRAwRhkuwOb
	sRT38GxTeS9Ic8Cud2g=; b=LSmIMVdKe2RMmtHlIHdS0piaCWJh8RL1qWmurHsb
	Y0CppXW8diDrzvSWfacFruiB8h5D5PwxQwK0o4lXZSsB1FIEyG1xm9MJuv29qFBL
	UND7Pm+Eda8ymlWKGWWetMc25XbO00gAEqY91pExIC0a46GUSfBlcjrLsE3gz/FC
	JHfk9rjAeQqUxPnVVH4V3r+GAWme6X2vkil5/bC2RmifMnXYTs+ZQY0Cr87xdzXn
	1zAfsu/t15D6rhDJC00ZttnwMRcw3P4/fjt6ALih5smEeV50EfubJnhE+LyWSak7
	tMNRrIJA/gL+/bf7gJ+ddH+fSR1Bxp+nX3vcJZ+o/Eeh1A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7k61g26t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 09 Feb 2026 16:52:32 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b9ea5408fbso1270941eec.1
        for <opensbi@lists.infradead.org>; Mon, 09 Feb 2026 08:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770655951; x=1771260751; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8jZNFtEeFhKG+vRAwRhkuwObsRT38GxTeS9Ic8Cud2g=;
        b=bQ3+LxEQEFVcRFqoesKVWRSpBzFRUxggAT0MzFMOoqJzH9NARJ8mszI05vNLDOkHb+
         jRUtszCLNdzcxqAbC71odpuJ0v2Ur/qEqWccLtQvnwl3K+YroC/F4b5YnK6bgM4CZ9kb
         4h8V5+GTe5a8BwkBdDrpjzA11sFaYreQfmIKuIofVcsX6/L95KEMmp/+HpiJydPDQ7/2
         X5fHV1rlRXiuNuf+KYIAZLeRPAGIQkCOd0kxlWiJo0yhOK0Pv7sReMUjSsSH9yDYyc8w
         yhoTMDnLkUNl6RRo9VC3a/NfKEpODydSapOjXay7gZqn7ZjM6mAxszTY6Qs6feNrwitN
         JWOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770655951; x=1771260751;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8jZNFtEeFhKG+vRAwRhkuwObsRT38GxTeS9Ic8Cud2g=;
        b=a4rSg3BB34V2B3tll7+2NILiV0+2MyR0KYg/yPfObO7EK17KGX0/wfToh9pjfJ03G5
         bjv9iglduRJiywKE/gTCpoXVt7ZywkasbqabV6EWqcUxFztOMn2lXSaEx1ym1QqiWInV
         NenA4ppCjQfTJ9de39TyuaqUSg+rm5CHE61WFFpCepWJGFnBysbinVgNkEELatVUqiLI
         V8lSMBrlRD1sTdlLyQxw24aaV2QX96I3YqRw9FKVqg3biRzGrZDrcMlnpR1OcsGuQbGa
         AffG0kuMTsATdfAWFS9fD/3po/8YP/0IGjLtm9bjcs2fXGsYrIq9bTUEsfRtIAM0N11M
         oHNw==
X-Forwarded-Encrypted: i=1; AJvYcCVXV9BokUuOdpTxEbsjtQYWgJnL7PV5VSkYTGBmHBEde9uNfsWgBo4T28jCzxRPB/6eIFMRnj18@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5h8wdsqgL4iL7zuBtZI9q598VlJ8MXlnxN/peql6V3JQ4qNar
	xQqcCZJMu60HcSAjbmUFOKR/B+zVBw3gzj9T5yZJ6XEssTvaL6aRJiZ0EbGeukhgaqNBtJ5gCmC
	0vPSAw2OBlL9l7z/SYnV2g37ZBJBLsZbZQE1YVnHdQi5qYp9Ypo+j8bT/R57iWZgbVw==
X-Gm-Gg: AZuq6aL2zHKRPPh7MfJcECJz99dxWAefbVP7/xcZUCJxJ8LvqcfH+uMrUC4pQNMc5+b
	s/K7vFy5RZ9ekSV2MFzMWqGSzdZ2rf+mqRIRifFipxGxQ/3+Rj7an7Iml6MHYm6JXD/lKSf7z/q
	K/MsJxs+6xqBM5vBqKFHgfCjt3R1xy8IiIxZqNo06RyMH/S3n04ZXtctP7egX3Xd+SHlkNGXTH8
	HEsFBsT5ApVaA35GTfkDLnwPQSuaRrNyBT+o+EnYanw34nIi9PIA+CSXjCyJKCRnCeE+eiqSYmK
	U/80LFCppaHF4L9jcWxVM7HxeQJNxFnpLHbq37GS0LdF4vlA/QEuM0MogqV2Wfmb1+zEFxSVJje
	moUoFXTjhNEOXdPBm5qQ=
X-Received: by 2002:a05:7301:4190:b0:2b7:ee0e:e9bf with SMTP id 5a478bee46e88-2b856722105mr5546009eec.27.1770655950695;
        Mon, 09 Feb 2026 08:52:30 -0800 (PST)
X-Received: by 2002:a05:7301:4190:b0:2b7:ee0e:e9bf with SMTP id 5a478bee46e88-2b856722105mr5545985eec.27.1770655949953;
        Mon, 09 Feb 2026 08:52:29 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855af7806sm7781444eec.10.2026.02.09.08.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 08:52:29 -0800 (PST)
Date: Mon, 9 Feb 2026 10:52:28 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>,
        Raymond Mao <raymond.mao@riscstar.com>,
        Dave Patel <dave.patel@riscstar.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
Subject: Re: [PATCH 8/8] lib: sbi_irqchip: Allow registering interrupt
 handlers
Message-ID: <5yqqsrtxytg5aeljr2ua6t4iiuguzcehh7hvqpf333sbj7vwjv@zpxxz5vkxnqo>
References: <20260207102602.2917520-1-anup.patel@oss.qualcomm.com>
 <20260207102602.2917520-9-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260207102602.2917520-9-anup.patel@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=M8lA6iws c=1 sm=1 tr=0 ts=698a10d0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=bDdBU3oEAAAA:8 a=_u_v14LYyS36E9y7mhwA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=DN7SgORnOiO7RqxRx1GC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDE0MSBTYWx0ZWRfXwbWdiHDJKv/a
 fnEfRx9KutR68ilX/mimsxREtnrKe0RG+HFg9b97bJGQxzzYHvH1MCbzEXAjrThN9/ppef0uLHa
 +gHu412w4yE7WBmORoFBlVFWtvDvbUvcyqGGz8pIvnaV0afvkaETszsEs33juXtaRqgHIN1VnGQ
 iWrDhUKokI8TDlX9C7G2y695pMauCI5j5csdtPrEFyR6V7CbzOD0izINQjINIijeUrGId4cSBx8
 iqkY/1pM3h9VGFkeF2/SD37OMVkZiSR71RXK5JysLPB3sLQPMkBma3kox1n3b7rsMs2JcVJiGNd
 jhMw+0kQK+t2Y/FlQV1XqAqiKYT1H0d8YPcgHAqi8tgfqcBfaiuifn57cBAVyQuJvSYiuPSx/e/
 Kt4ZpPmYcevt6e59BVpjg0ru7vSa6xesz3buB7df8QNcti0Y1ufie6aQvWAX2lwFry0L2OD4fD6
 XGKzmCHGZNq/RKdCVLw==
X-Proofpoint-GUID: r2i8zkUehCDiA4biKAO8pxfyvWoyewlK
X-Proofpoint-ORIG-GUID: r2i8zkUehCDiA4biKAO8pxfyvWoyewlK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_085233_838580_615170A8 
X-CRM114-Status: GOOD (  28.80  )
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

On Sat, Feb 07, 2026 at 03:56:02PM +0530, Anup Patel wrote:
> To handle external interrupts in M-mode, the sbi_irqchip framework
> must allow registering interrupt handlers from device drivers.
> 
> Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> ---
>  include/sbi/sbi_irqchip.h |  56 ++++++++++-
>  lib/sbi/sbi_irqchip.c     | 202 +++++++++++++++++++++++++++++++++++++-
>  lib/utils/irqchip/aplic.c |   1 +
>  lib/utils/irqchip/imsic.c |   9 ++
>  lib/utils/irqchip/plic.c  |   1 +
>  5 files changed, 267 insertions(+), 2 deletions(-)
> 
> diff --git a/include/sbi/sbi_irqchip.h b/include/sbi/sbi_irqchip.h
> index d2c47ae8..77b54110 100644
> --- a/include/sbi/sbi_irqchip.h
> +++ b/include/sbi/sbi_irqchip.h
> @@ -18,12 +18,21 @@ struct sbi_scratch;
>  
>  /** irqchip hardware device */
>  struct sbi_irqchip_device {
> -	/** Node in the list of irqchip devices */
> +	/** Node in the list of irqchip devices (private) */
>  	struct sbi_dlist node;
>  
> +	/** Internal data of all hardware interrupts of this irqchip (private) */
> +	struct sbi_irqchip_hwirq_data *hwirqs;
> +
> +	/** List of interrupt handlers */
> +	struct sbi_dlist handler_list;
> +
>  	/** Unique ID of this irqchip */
>  	u32 id;
>  
> +	/** Number of hardware IRQs of this irqchip */
> +	u32 num_hwirq;
> +
>  	/** Set of harts targetted by this irqchip */
>  	struct sbi_hartmask target_harts;
>  
> @@ -32,6 +41,21 @@ struct sbi_irqchip_device {
>  
>  	/** Process hardware interrupts from this irqchip */
>  	int (*process_hwirqs)(struct sbi_irqchip_device *chip);
> +
> +	/** Setup a hardware interrupt of this irqchip */
> +	int (*hwirq_setup)(struct sbi_irqchip_device *chip, u32 hwirq);
> +
> +	/** Cleanup a hardware interrupt of this irqchip */
> +	void (*hwirq_cleanup)(struct sbi_irqchip_device *chip, u32 hwirq);
> +
> +	/** End of hardware interrupt of this irqchip */
> +	void (*hwirq_eoi)(struct sbi_irqchip_device *chip, u32 hwirq);
> +
> +	/** Mask a hardware interrupt of this irqchip */
> +	void (*hwirq_mask)(struct sbi_irqchip_device *chip, u32 hwirq);
> +
> +	/** Unmask a hardware interrupt of this irqchip */
> +	void (*hwirq_unmask)(struct sbi_irqchip_device *chip, u32 hwirq);
>  };
>  
>  /**
> @@ -44,6 +68,36 @@ struct sbi_irqchip_device {
>   */
>  int sbi_irqchip_process(void);
>  
> +/**
> + * Process a hwirq of an irqchip device
> + *
> + * This function is called by irqchip drivers to handle hardware
> + * interrupts of the irqchip.
> + */
> +int sbi_irqchip_process_hwirq(struct sbi_irqchip_device *chip, u32 hwirq);
> +
> +/** Unmask a hardware interrupt */
> +int sbi_irqchip_unmask_hwirq(struct sbi_irqchip_device *chip, u32 hwirq);
> +
> +/** Mask a hardware interrupt */
> +int sbi_irqchip_mask_hwirq(struct sbi_irqchip_device *chip, u32 hwirq);
> +
> +/** Default raw hardware interrupt handler */
> +int sbi_irqchip_raw_handler_default(struct sbi_irqchip_device *chip, u32 hwirq);
> +
> +/** Set raw hardware interrupt handler */
> +int sbi_irqchip_set_raw_handler(struct sbi_irqchip_device *chip, u32 hwirq,
> +				int (*raw_hndl)(struct sbi_irqchip_device *, u32));
> +
> +/** Register a hardware interrupt handler */
> +int sbi_irqchip_register_handler(struct sbi_irqchip_device *chip,
> +				 u32 first_hwirq, u32 num_hwirq,
> +				 int (*callback)(u32 hwirq, void *opaque), void *opaque);
> +
> +/** Unregister a hardware interrupt handler */
> +int sbi_irqchip_unregister_handler(struct sbi_irqchip_device *chip,
> +				   u32 first_hwirq, u32 num_hwirq);
> +
>  /** Find an irqchip device based on unique ID */
>  struct sbi_irqchip_device *sbi_irqchip_find_device(u32 id);
>  
> diff --git a/lib/sbi/sbi_irqchip.c b/lib/sbi/sbi_irqchip.c
> index fb3357f3..736dde6c 100644
> --- a/lib/sbi/sbi_irqchip.c
> +++ b/lib/sbi/sbi_irqchip.c
> @@ -7,10 +7,35 @@
>   *   Anup Patel <apatel@ventanamicro.com>
>   */
>  
> +#include <sbi/sbi_heap.h>
>  #include <sbi/sbi_irqchip.h>
>  #include <sbi/sbi_list.h>
>  #include <sbi/sbi_platform.h>
>  
> +/** Internal irqchip hardware interrupt data */
> +struct sbi_irqchip_hwirq_data {
> +	/** raw hardware interrupt handler */
> +	int (*raw_handler)(struct sbi_irqchip_device *chip, u32 hwirq);
> +};
> +
> +/** Internal irqchip interrupt handler */
> +struct sbi_irqchip_handler {
> +	/** Node in the list of irqchip handlers (private) */
> +	struct sbi_dlist node;
> +
> +	/** First hardware IRQ handled by this handler */
> +	u32 first_hwirq;
> +
> +	/** Number of consecutive hardware IRQs handled by this handler */
> +	u32 num_hwirq;
> +
> +	/** Callback function of this handler */
> +	int (*callback)(u32 hwirq, void *priv);
> +
> +	/** Callback private data */
> +	void *priv;
> +};
> +
>  static SBI_LIST_HEAD(irqchip_list);
>  
>  int sbi_irqchip_process(void)
> @@ -31,6 +56,172 @@ int sbi_irqchip_process(void)
>  	return rc;
>  }
>  
> +int sbi_irqchip_process_hwirq(struct sbi_irqchip_device *chip, u32 hwirq)
> +{
> +	struct sbi_irqchip_hwirq_data *data;
> +
> +	if (!chip || chip->num_hwirq <= hwirq)
> +		return SBI_EINVAL;
> +
> +	data = &chip->hwirqs[hwirq];
> +	if (!data->raw_handler)
> +		return SBI_ENOENT;
> +
> +	return data->raw_handler(chip, hwirq);
> +}
> +
> +int sbi_irqchip_unmask_hwirq(struct sbi_irqchip_device *chip, u32 hwirq)
> +{
> +	if (!chip || chip->num_hwirq <= hwirq)
> +		return SBI_EINVAL;
> +
> +	if (chip->hwirq_unmask)
> +		chip->hwirq_unmask(chip, hwirq);
> +	return 0;
> +}
> +
> +int sbi_irqchip_mask_hwirq(struct sbi_irqchip_device *chip, u32 hwirq)
> +{
> +	if (!chip || chip->num_hwirq <= hwirq)
> +		return SBI_EINVAL;
> +
> +	if (chip->hwirq_mask)
> +		chip->hwirq_mask(chip, hwirq);
> +	return 0;
> +}
> +
> +static struct sbi_irqchip_handler *sbi_irqchip_find_handler(struct sbi_irqchip_device *chip,
> +							    u32 hwirq)
> +{
> +	struct sbi_irqchip_handler *h;
> +
> +	if (!chip || chip->num_hwirq <= hwirq)
> +		return NULL;
> +
> +	sbi_list_for_each_entry(h, &chip->handler_list, node) {
> +		if (h->first_hwirq <= hwirq && hwirq < (h->first_hwirq + h->num_hwirq))
> +			return h;
> +	}
> +
> +	return NULL;
> +}
> +
> +int sbi_irqchip_raw_handler_default(struct sbi_irqchip_device *chip, u32 hwirq)
> +{
> +	struct sbi_irqchip_handler *h;
> +	int rc;
> +
> +	if (!chip || chip->num_hwirq <= hwirq)
> +		return SBI_EINVAL;
> +
> +	h = sbi_irqchip_find_handler(chip, hwirq);
> +	rc = h->callback(hwirq, h->priv);
> +
> +	if (chip->hwirq_eoi)
> +		chip->hwirq_eoi(chip, hwirq);
> +
> +	return rc;
> +}
> +
> +int sbi_irqchip_set_raw_handler(struct sbi_irqchip_device *chip, u32 hwirq,
> +				int (*raw_hndl)(struct sbi_irqchip_device *, u32))
> +{
> +	struct sbi_irqchip_hwirq_data *data;
> +
> +	if (!chip || chip->num_hwirq <= hwirq)
> +		return SBI_EINVAL;
> +
> +	data = &chip->hwirqs[hwirq];
> +	data->raw_handler = raw_hndl;
> +	return 0;
> +}
> +
> +int sbi_irqchip_register_handler(struct sbi_irqchip_device *chip,
> +				 u32 first_hwirq, u32 num_hwirq,
> +				 int (*callback)(u32 hwirq, void *opaque), void *priv)
> +{
> +	struct sbi_irqchip_handler *h;
> +	u32 i, j;
> +	int rc;
> +
> +	if (!chip || !num_hwirq || !callback)
> +		return SBI_EINVAL;
> +	if (chip->num_hwirq <= first_hwirq ||
> +	    chip->num_hwirq <= (first_hwirq + num_hwirq - 1))
> +		return SBI_EBAD_RANGE;
> +
> +	h = sbi_irqchip_find_handler(chip, first_hwirq);
> +	if (h)
> +		return SBI_EALREADY;
> +	h = sbi_irqchip_find_handler(chip, first_hwirq + num_hwirq - 1);
> +	if (h)
> +		return SBI_EALREADY;

We should loop over all hwirq numbers from first to the end to ensure no
other handler is already registered for numbers inside the range. Same
comment for sbi_irqchip_unregister_handler() below.

Thanks,
drew

> +
> +	h = sbi_zalloc(sizeof(*h));
> +	if (!h)
> +		return SBI_ENOMEM;
> +	h->first_hwirq = first_hwirq;
> +	h->num_hwirq = num_hwirq;
> +	h->callback = callback;
> +	h->priv = priv;
> +	sbi_list_add_tail(&h->node, &chip->handler_list);
> +
> +	if (chip->hwirq_setup) {
> +		for (i = 0; i < h->num_hwirq; i++) {
> +			rc = chip->hwirq_setup(chip, h->first_hwirq + i);
> +			if (rc) {
> +				if (chip->hwirq_cleanup) {
> +					for (j = 0; j < i; j++)
> +						chip->hwirq_cleanup(chip, h->first_hwirq + j);
> +				}
> +				sbi_list_del(&h->node);
> +				sbi_free(h);
> +				return rc;
> +			}
> +		}
> +	}
> +
> +	if (chip->hwirq_unmask) {
> +		for (i = 0; i < h->num_hwirq; i++)
> +			chip->hwirq_unmask(chip, h->first_hwirq + i);
> +	}
> +
> +	return 0;
> +}
> +
> +int sbi_irqchip_unregister_handler(struct sbi_irqchip_device *chip,
> +				   u32 first_hwirq, u32 num_hwirq)
> +{
> +	struct sbi_irqchip_handler *fh, *lh;
> +	u32 i;
> +
> +	if (!chip || !num_hwirq)
> +		return SBI_EINVAL;
> +	if (chip->num_hwirq <= first_hwirq ||
> +	    chip->num_hwirq <= (first_hwirq + num_hwirq - 1))
> +		return SBI_EBAD_RANGE;
> +
> +	fh = sbi_irqchip_find_handler(chip, first_hwirq);
> +	if (!fh || fh->first_hwirq != first_hwirq || fh->num_hwirq != num_hwirq)
> +		return SBI_ENODEV;
> +	lh = sbi_irqchip_find_handler(chip, first_hwirq + num_hwirq - 1);
> +	if (!lh || lh != fh)
> +		return SBI_ENODEV;
> +
> +	if (chip->hwirq_mask) {
> +		for (i = 0; i < fh->num_hwirq; i++)
> +			chip->hwirq_mask(chip, fh->first_hwirq + i);
> +	}
> +
> +	if (chip->hwirq_cleanup) {
> +		for (i = 0; i < fh->num_hwirq; i++)
> +			chip->hwirq_cleanup(chip, fh->first_hwirq + i);
> +	}
> +
> +	sbi_list_del(&fh->node);
> +	return 0;
> +}
> +
>  struct sbi_irqchip_device *sbi_irqchip_find_device(u32 id)
>  {
>  	struct sbi_irqchip_device *chip;
> @@ -47,8 +238,9 @@ int sbi_irqchip_add_device(struct sbi_irqchip_device *chip)
>  {
>  	struct sbi_irqchip_device *c;
>  	struct sbi_hartmask hm;
> +	u32 i;
>  
> -	if (!chip || !sbi_hartmask_weight(&chip->target_harts))
> +	if (!chip || !chip->num_hwirq || !sbi_hartmask_weight(&chip->target_harts))
>  		return SBI_EINVAL;
>  
>  	if (sbi_irqchip_find_device(chip->id))
> @@ -64,6 +256,14 @@ int sbi_irqchip_add_device(struct sbi_irqchip_device *chip)
>  		}
>  	}
>  
> +	chip->hwirqs = sbi_zalloc(sizeof(*chip->hwirqs) * chip->num_hwirq);
> +	if (!chip->hwirqs)
> +		return SBI_ENOMEM;
> +	for (i = 0; i < chip->num_hwirq; i++)
> +		sbi_irqchip_set_raw_handler(chip, i, sbi_irqchip_raw_handler_default);
> +
> +	SBI_INIT_LIST_HEAD(&chip->handler_list);
> +
>  	sbi_list_add_tail(&chip->node, &irqchip_list);
>  	return 0;
>  }
> diff --git a/lib/utils/irqchip/aplic.c b/lib/utils/irqchip/aplic.c
> index d47a810b..ec69c82b 100644
> --- a/lib/utils/irqchip/aplic.c
> +++ b/lib/utils/irqchip/aplic.c
> @@ -307,6 +307,7 @@ int aplic_cold_irqchip_init(struct aplic_data *aplic)
>  
>  	/* Register irqchip device */
>  	aplic->irqchip.id = aplic->unique_id;
> +	aplic->irqchip.num_hwirq = aplic->num_source + 1;
>  	rc = sbi_irqchip_add_device(&aplic->irqchip);
>  	if (rc)
>  		return rc;
> diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
> index 0f296c89..7559a069 100644
> --- a/lib/utils/irqchip/imsic.c
> +++ b/lib/utils/irqchip/imsic.c
> @@ -346,9 +346,17 @@ int imsic_data_check(struct imsic_data *imsic)
>  	return 0;
>  }
>  
> +static int imsic_hwirq_setup(struct sbi_irqchip_device *chip, u32 hwirq)
> +{
> +	if (!hwirq || hwirq == IMSIC_IPI_ID)
> +		return SBI_ENOTSUPP;
> +	return 0;
> +}
> +
>  static struct sbi_irqchip_device imsic_device = {
>  	.warm_init	= imsic_warm_irqchip_init,
>  	.process_hwirqs	= imsic_process_hwirqs,
> +	.hwirq_setup	= imsic_hwirq_setup,
>  };
>  
>  int imsic_cold_irqchip_init(struct imsic_data *imsic)
> @@ -392,6 +400,7 @@ int imsic_cold_irqchip_init(struct imsic_data *imsic)
>  
>  	/* Register irqchip device */
>  	imsic_device.id = imsic->unique_id;
> +	imsic_device.num_hwirq = imsic->num_ids + 1;
>  	sbi_hartmask_set_all(&imsic_device.target_harts);
>  	rc = sbi_irqchip_add_device(&imsic_device);
>  	if (rc)
> diff --git a/lib/utils/irqchip/plic.c b/lib/utils/irqchip/plic.c
> index 973f7c2a..2d721724 100644
> --- a/lib/utils/irqchip/plic.c
> +++ b/lib/utils/irqchip/plic.c
> @@ -281,6 +281,7 @@ int plic_cold_irqchip_init(struct plic_data *plic)
>  
>  	/* Register irqchip device */
>  	plic->irqchip.id = plic->unique_id;
> +	plic->irqchip.num_hwirq = plic->num_src + 1;
>  	plic->irqchip.warm_init = plic_warm_irqchip_init;
>  	return sbi_irqchip_add_device(&plic->irqchip);
>  }
> -- 
> 2.43.0
> 

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
