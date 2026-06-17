Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB29CD98EE
	for <opensbi@archiver.kernel.org>; Wed, 17 Jun 2026 09:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VPcsT+dxGAqCToC+4tJ7xoqhd4RbwEYUZa3qRj3xorI=; b=ZhigCizjg9rZlF
	8PWa4sD33LndKncTZcilJvv9CZkr2Wi2691/QVZIS9yclCpAzxAi5HLkgwqZ/rNyAy3DHpLdvWlX3
	DKxRsMo1pG30fRb5Wflwsbp9jlLDR0TKDaawKtTEklZjusArUrqEnkJV2aCIBkfw5/1alnt0qaGSl
	ZiDDaHaW/gagMBp+6RziCckJ1rlwvt6RaSZ/AOMr0CcRLX0VVqxnXBV6Pi8AySlNuaA+znepI7Coi
	kEEuuq12gnK+/8TKo6ArbLwgWmWiRZ5dSovPu6s8ueIrrZHhhS5Q3pMP1igNyOfVuPKXMM5LWyVJI
	+4K7EfVuf0SyruuIXj+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZm8L-0000000GvPY-0szq;
	Wed, 17 Jun 2026 09:00:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZm8I-0000000GvPB-1h85
	for opensbi@lists.infradead.org;
	Wed, 17 Jun 2026 09:00:28 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UZfp2217819
	for <opensbi@lists.infradead.org>; Wed, 17 Jun 2026 09:00:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=02IfcDsi62qhE+K1YUogud3r
	OZ3bUMie4qZgzHUcZyY=; b=XFefTWkjlK/taBH815vzR0hdAUNMObUVf2De0L2a
	lM2H8b4t8jP54eWq4YK0eyvXElKDRaWL3Z8oyocMpmuJXAmCgAiNYQ5Z7MdcF2V+
	r0PdxTBM+Rj48L4iYMSCps1pWRTMBmmKoPgfUy+o9EQlhOQSpkhhiTArH7WP0nJl
	xkFo/m9OH779vFIa++7npGP9ata+0iG2/M2ULK4/rUdT3v5djHGgLOmOVxwXGx7v
	LE3DjHRQSMgPO0HNkXFnL/eI5G9qGWysw0BaF99aACNHBJHHur9NgJFYP8v0kyLl
	PucJot/bqwiKMTl3LBnV6RiQnq3jjN3xV0hil2ERaaKCIw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueerabr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Wed, 17 Jun 2026 09:00:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915f6ff639aso1516601485a.1
        for <opensbi@lists.infradead.org>; Wed, 17 Jun 2026 02:00:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781686824; cv=none;
        d=google.com; s=arc-20240605;
        b=IV5S3aq+t9PCulKP330L5Ks/nK5O6imwkMt6/K2ijpRW0ySNf/c8tkaAdar92TkUBJ
         3nzxymOLo2DN6Ji+QwAwVYjDaMrkQLPimK1M7VSr/86wvGcW1H89ePjhMBXjK3nlTcXL
         obl2/h13/JMo3+nVWPsTWhl/qPVh7UUbTEZb6YQn23oNxwJSRJtHAi7iPuONyzCzEIJS
         7zajha4mt+LJqSlv1/brIII1k7+IQcJ6ue8i0fvJ0F8t1X2jeYJZi9C9nmMDLKadYQwd
         avc1z4FxCK/lBYAEbyNXm60Alf7GYEgmmhBBjFDZYKeDpS7GNx4SxHGGe5yNrtEfmIwI
         OUIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=02IfcDsi62qhE+K1YUogud3rOZ3bUMie4qZgzHUcZyY=;
        fh=AjEMO+LaGc5h9bSc2U0ef6B0fpOsp708NUy+Qto5y2w=;
        b=LKOkkUoUgVoAlYKrPU+pR10DSXl4lFFsz/O/+zCwMudNL/5ANumA7OnqUuLVUfElpW
         lsoCRCLfAMdv7odRjPbde9ki2I5E6e2l+8SgiTsjWqcW742+pIfeDou3gZDfiDZJjTVL
         dWzyv7MnE4mSIruBU7iTRZhNQIBlCWCNYmxYVuGj0CqQ1t/80B0mcqB1oXBVkibxqhKa
         01EX8vQ8375KAgG6ssB/er1d6JcpBNa0h28DrEE0V3q0BxhwlPHnsepFQ6lvC242LviO
         F4BKFmtAq6wqxJNHvxG6j94pyQ1xpWU8bKdWAHwdZEJCXReAQBPyzZi9/+5UbfyPbL5f
         hDjg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781686824; x=1782291624; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=02IfcDsi62qhE+K1YUogud3rOZ3bUMie4qZgzHUcZyY=;
        b=UqBsoKU8AQE1ujlJWHg6C9T6xGdHgoLP1fNNCEaWkGXP5zPUgJEnU+AJx5dgLMIl8Z
         VCLu4AlsvklFiKbhNVLxCtZki8foZht0vTiv6CMyzEW+Chpc3J5KcXL4f8YB93uX1iVG
         a+bnSiulqotvsu8Xzp+yT8GLq7kB0D9+oIy/NpyyN3OeWC2eNEjwY8QDb1Gso2AVSkUJ
         FvsYPvCQ9EZocyvWDS2kwBkcVmaUIV/UVhfuw5SKHxmSpTQD5rsOwl4NpkD+XWRiZou1
         u7aLS9A6p63AJLodHyPpTq0Z7yVsDA73CYN2UTNacdpuk/i7tcdkHWzGA9mfAobVQeCk
         /Idg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781686824; x=1782291624;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=02IfcDsi62qhE+K1YUogud3rOZ3bUMie4qZgzHUcZyY=;
        b=PVwfXyokESauKT94S/4LlOXvnattM1OrNq2rwShLSF6Sp0lepAJ/khymkX1RZL1zmz
         IlciLkpNSY9lXLliTxmx5YjjKyCbeOkz4l4rOwoVn0IYy/9xeJ/crBEDBe9NcZ4ZnLFq
         9VEEh/rhntV+2GyLkiDhbvblnREonMLi0sZXKCE6bR61643pA9iNsvGMtM3BkRiuWGeq
         gliVS5ZOzLvpEwAHZMKvReuMXBkagsuCKHjVpfGv8EJey2GIsxY0+uDnFuKLRUGv8u+C
         HSSXdxrBhqti0Q/3G1G3wxseGcOW9mf0r9gwZV6bPegwXy27jhB/qf0DtARg3mRwQ302
         ZpFw==
X-Gm-Message-State: AOJu0YwhD0jbEml5OxK0iqn1STmAhlWiaJegWzNiNgAhmeXJ21TKc0Mh
	ZYq2TpS1xnUK3Nxsc35jR3XYozmA2mWyPpQfp2QSyvGTCM+8lG4018wxtMYSLxYNR5z1PXkBvNk
	B4bLTGlOXGL2ts1KGz5i9hx2qCJsE3qte2EaLlAFSvVAtanZ5oSqSzMHqZmp61ZGqxBMdsusUHd
	VckHw/NT2lk852rG6abjSit1EJ2oHJWU1fGkoA2+HarCy5uMP0fTc=
X-Gm-Gg: Acq92OEszHyi5MbK8hfx83g7uf7TaQh8s6A9vbT2nGO72AMYYFGZcmbagaja9Fd1o6z
	VEBh7LLj8M5+2aI964TnMWSzlG1giYReBPp85PFjNJ7BmD8CRegOlh/ZD//cSIQBolhL+ioHGMx
	in0KIL1zGn7ycWkL5L0h4+gQGlqAiU7W9Ewqa8A0f3MPDsLoW9DEYGTNm/oULYhOMbmMQG5Q==
X-Received: by 2002:a05:620a:7084:b0:915:bac0:fc2d with SMTP id af79cd13be357-91d8a7ecde6mr551325985a.7.1781686820045;
        Wed, 17 Jun 2026 02:00:20 -0700 (PDT)
X-Received: by 2002:a05:620a:7084:b0:915:bac0:fc2d with SMTP id
 af79cd13be357-91d8a7ecde6mr551293685a.7.1781686818440; Wed, 17 Jun 2026
 02:00:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260617081307.429101-1-subrahmanya.lingappa@oss.qualcomm.com>
In-Reply-To: <20260617081307.429101-1-subrahmanya.lingappa@oss.qualcomm.com>
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 14:30:06 +0530
X-Gm-Features: AVVi8CfWwe0a8uODi5DWOAcbTXDVYuai-2JjPGWbLeDVQllBAVHO0kQSYC6Ar68
Message-ID: <CAFR3w35G1=2NVD_RDkdJCXr1X07ytw9zH7Vm6YAjpPVh5zHS4Q@mail.gmail.com>
Subject: Re: [PATCH v3] lib: utils: Add Logging service group handlers
To: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA4NCBTYWx0ZWRfX9WjGIdoHwFrJ
 FBW93vSZcj9Dh9SgDxU/+FkK5ra3s3muQC2a4Jt2mhr7TQ8j537abUiTSJv1BBV8WCJpaK8tFvn
 Jn1gccQBjQokeTVfr04RQE+FnjZqc8E=
X-Proofpoint-GUID: 0b0AmSX9FcCbfkaBNGkyPAOAGaWKj9JW
X-Authority-Analysis: v=2.4 cv=d4fFDxjE c=1 sm=1 tr=0 ts=6a326228 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=qcy1YqZUCqxMKbZvgQkA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA4NCBTYWx0ZWRfX1B553iPafloz
 lx5W8SdCBqj9JA4soqHbmyjsz+vfsdka6Iur/PakzWhDdd/VzT9A+yjcVsvR6qvIpCfsums8XxC
 Kpzma1t8/QG1sTsb7qoUMRXKvMZ73jpbwaqGU/oQz6aGV3Eys/aQgXmfkB5IUVsDm5+B2GMo7+1
 Zl2yEwS4hSWUFztiUs/r1CnA/zJCIUl4Q8W++P4y/J5+dGEjOEKrHeqOEKsN4V6VG21l0xvQmS5
 eQ5F6IDWVURYE3+a1c4jxMhb/TeQ1efzqA2/IS+E2APqL0yLGGrlBM6NbuKtnn19rfAWtbGKeUj
 ezCxWFC9gUyGw6p8yhneOOPp8gl+9mtZt6YHzPGWSd5QyVP3HfyzrYBfdn77Jnyi54RiYU1NwTz
 Q0rrIc84dXYicjBSwMb+dbWyN6/D3YFMVqkgqrw0d3Tlhw53L0MQ0uSGCc0015Ae6pUffpEuveJ
 XVURWd3/79uHYEdq/0A==
X-Proofpoint-ORIG-GUID: 0b0AmSX9FcCbfkaBNGkyPAOAGaWKj9JW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_020026_564189_CE306C20 
X-CRM114-Status: GOOD (  16.92  )
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

> +struct rpmi_logging_log_data_req {
> +       u32 type;
> +       u32 len;
> +#define MAX_LOGGING_DLEN  ((RPMI_MSG_DATA_SIZE(RPMI_SLOT_SIZE_MIN) - (sizeof(u32) * 2)) / sizeof(u32))
> +       u32 data[MAX_LOGGING_DLEN];
> +};
NIT: Either add a comment or change the name of the field like the
spec "num_words" to
highlight that "len" and "DLEN" are not bytes but rather words.

> +
> +struct rpmi_logging_log_data_resp {
> +       s32 status;
> +};
> +
>  #endif /* !__RPMI_MSGPROT_H__ */
> diff --git a/lib/utils/mpxy/Kconfig b/lib/utils/mpxy/Kconfig
> index 1a38b792..a3ed1c22 100644
> --- a/lib/utils/mpxy/Kconfig
> +++ b/lib/utils/mpxy/Kconfig
> @@ -18,6 +18,10 @@ config FDT_MPXY_RPMI_CLOCK
>         bool "MPXY driver for RPMI clock service group"
>         default n
>
> +config FDT_MPXY_RPMI_LOGGING
> +       bool "MPXY driver for RPMI logging service group"
> +       default n
> +
>  config FDT_MPXY_RPMI_SYSMSI
>         bool "MPXY driver for RPMI system MSI service group"
>         default n
> diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_logging.c b/lib/utils/mpxy/fdt_mpxy_rpmi_logging.c
> new file mode 100644
> index 00000000..dbbe33ae
> --- /dev/null
> +++ b/lib/utils/mpxy/fdt_mpxy_rpmi_logging.c
> @@ -0,0 +1,44 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2026 Qualcomm, Inc
> + *
> + * Authors:
> + *   Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
> + */
> +
> +#include <sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h>
> +
> +static struct mpxy_rpmi_service_data logging_services[] = {
> +       [0] = {
> +               .id = RPMI_LOGGING_SRV_LOG_DATA,
> +               .min_tx_len = sizeof(u32) * 2,
> +               .max_tx_len = sizeof(struct rpmi_logging_log_data_req),
> +               .min_rx_len = 4,
Instead of hardcoding, this can also be simply sizeof(struct
rpmi_logging_log_data_resp)

> +               .max_rx_len = sizeof(struct rpmi_logging_log_data_resp),
> +       },
> +       /*
> +        * Keep a local terminator for safe lookup because only service ID 0x02
> +        * is intentionally exposed by this MPXY service group handler.
> +        */

With minor comments -

Reviewed-by: Rahul Pathak <rahul.pathak@oss.qualcomm.com>

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
