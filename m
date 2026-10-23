Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDFA606A319
	for <opensbi@archiver.kernel.org>; Fri, 23 Oct 2026 05:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jmCqxpB+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gFGmAyz9;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FgjDDz4t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wh1+DSyorQBjXyvgK18QduyJXmkWYi500WVN/pPpkmQ=; b=jmCqxpB+uZfwW2/MrK1lXdGLQU
	dZ8WmsdM+IglL3QRLY9ZR+McrgO5fOsBtJqDo8Ivi49hAKAPn+i50dpsGNBK7hO4Yjuh4vZjcKttW
	O57TtcuRm0D4cbWph1sbXXCYdoYOqtlstEmGrb3Pp6fl9MrqKFWLU/hcq55wtFyrzkfFU90sNBsmm
	CdJbApm1DxwPwxU/LaNomF9hLwOfdJfSlsSlRvLRe+5kmVeZjKpmRWuLlS6WmaPDdIpIKRrai4k42
	2pt0ZrWhe3FMrCS9X1OO8BYG5eRt2vPxnTEv4rOfyVfZzp5Cv5ojE2a3J/UXENLRSEe1I1QJUgGMG
	tKMzrDRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK7Pp-0000000FVTJ-1vkn;
	Fri, 23 Oct 2026 05:02:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK7Pm-0000000FVSu-2Rkl
	for opensbi@lists.infradead.org;
	Fri, 23 Oct 2026 05:02:04 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1G64N1795935
	for <opensbi@lists.infradead.org>; Fri, 23 Oct 2026 05:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MjKBqlqfiiCNUf+u7caMcczY
	Z3NP2SXIz300pl4RDHI=; b=gFGmAyz9zBsI5/xDwznnkOhQ2r6KMDEcrswiZxa9
	UhEI7adITcezjblLdBrCnkj4xtGn7iTVW4aqhmhBh4YrFnqFNEi+q6iZAk5ciLU5
	DZAAWJXPabBWxy8zLBaGNi3yGmfr7Um2UBRrz8pcQs2vgl53Nd3dlKNVDQLC/QMD
	3Y+VsSOAFkWQAMGSq2NP3I8L/v5pPwIFaC0M+dd57pWKyLA1NxGbNd3qaoRG5jdP
	aCaek1kkhj7LAZ5X+lN7ximtQuKAQqNkdzQ+6cU2KTNjC6oPsciXyMnpWiusPsjA
	zgoxoZKI/7Xtr90v9zjuNNoBBv1N3W6xkQ+dN5lZ+DKfHw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnq0jh12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Fri, 23 Oct 2026 05:01:58 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91b8306ba68so11912406d6.2
        for <opensbi@lists.infradead.org>; Thu, 22 Oct 2026 22:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792731718; x=1793336518; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MjKBqlqfiiCNUf+u7caMcczYZ3NP2SXIz300pl4RDHI=;
        b=FgjDDz4tQBCWJMD1F9fS5e7bLi3aLuyGuBblAXdZy8/7klfAhk9u2X9/yc5amR5QsQ
         DaH0ByyEjWtJ1pxfhYZLzWKN27Z6pJVJFXSVpEKNg45Xr0SYlUidwNhK1hCZKGl3a7w5
         uRnwweQZBbas22i6pITJDEDM+mkt2OMzHyusXH+PojzSbcGmGBO7Ju1G+ZZIAGkEnr4R
         bKSRmbN1nyddVIJVvx1dsAjH3XQoHoh0ngH1C6sp0Fq4rA8Xio0iMRDQqCJz/gNljObK
         6aZ7F5cTWLIkbtiy2IaOBp17pO74oA+/pa6oeSFgITp47mOxyCL+dFW3IiV/41YIzIii
         zhTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792731718; x=1793336518;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MjKBqlqfiiCNUf+u7caMcczYZ3NP2SXIz300pl4RDHI=;
        b=F2T1KayURh0bjNbJ8FtU1ncx5qYYlhEMqeKItAMBf/SSd6oQsYh7FXGe5EmUHa4dh3
         pzpjz8dIwghp4XKmruVG0/+IibDRPL4gAWi6qPxDQCUCFFYu583qltHElOJ754wlAQg+
         +bKMWaAyOILaRzboeSFwJ9RF7LbWTvKO3Pk+LqpLdTqhrawcCfQnrR1dF4SMz7rh2bec
         CvAKjO7yg+NQDOt0SQnFxWXZezcCu6DT80ug2aAdGRRdKJJN+mn1CzrGEplj8i135xJc
         IX4VCFcN3EVo57mcFJz0xeT56ReJoT45Mpuv7sH1E6vfel/k5RFaD3z931CPaZzVCMZu
         p7Bg==
X-Forwarded-Encrypted: i=1; AKwUvBzqIblCJocckLs1S2I4SlMHAf7lewQFFdlQREzhXddlOyKdaZ8AjSR7GAUp4HYKfhlHkseooXYQ@lists.infradead.org
X-Gm-Message-State: AFq9FYKSDNAb9E/O4R/Yp/NE8pODc6ssgPwq6ZvRIrSeyDsl1EbNDuP0
	WneYz8vIvSCebnWVlIYUkGkLscYYb+hjcxuOo8BJ5HsQQ+L/ljbmxbfZc3+HlIdLkzQDrU1DEH5
	FFn2pk03xWjuDl/U8TUwAC16lN98yYg9L2IT5NtrD01NaeTpo0e5MJMaDOWVqpMjmvlY81mzcUQ
	==
X-Gm-Gg: AYBFou00kVsI53BTk2O3g2SqZVUfkJ8JHK3qpUF9LdAtZaFyzd99iIThCYV559JsQPr
	stV1cLF7FJveOfyu9bAZGhFgD8WmlY+kPHMc6UUuHO+C8cI/PJRxUpstpjGJb4juVM0s/AHHQQP
	sKyTATnANyUrW8N2ST0EtlwPJ+0AkPSwEdRRuTBAT1aOhJ8Y5Rj717Ut41lqRRuZhjRwCKEi0SX
	AL3Q9Bi9df08B2buJ0d18f9PHJrT+jSX/hJmf6rr0DAwSQmy+ms06BuE0FcK6iQWP5Zsr/RLxsS
	kIgoKRykHtSuW+M6BVUpKgyaq/Y1L0ISK8hv8BL3T7upmMKvfTyRzB1BJ/y8OREFoMuVUZSLJAL
	qgmCx4E8h/xp4WZN6VLGeWU6TG8cRq6t+kvWfOHy2HABJfENj7NjcfxYxWCzyDPo+GfZF1Kv7/s
	qOLM35RI982Ss/XUrhCe28TKf6
X-Received: by 2002:a05:6214:401e:b0:91b:ec1d:1746 with SMTP id 6a1803df08f44-91c3ab15a36mr12711146d6.55.1792731717774;
        Thu, 22 Oct 2026 22:01:57 -0700 (PDT)
X-Received: by 2002:a05:7022:b048:20b0:144:fb42:52 with SMTP id a92af1059eb24-195c6560d83mr1607248c88.28.1792731333126;
        Thu, 22 Oct 2026 21:55:33 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195ebc951b9sm3351955c88.16.2026.10.22.21.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 21:55:32 -0700 (PDT)
Date: Fri, 23 Oct 2026 10:25:28 +0530
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: Prajwal N <prajwal.n@oss.qualcomm.com>
Cc: anup@brainfault.org, opensbi@lists.infradead.org, prajwal.n.oss@gmail.com
Subject: Re: [PATCH 3/4] lib: sbi: Add SBI watchdog framework
Message-ID: <atrowINB-eBbnBc_@hu-himchau-blr.qualcomm.com>
References: <20261002083040.2533097-1-prajwal.n@oss.qualcomm.com>
 <20261002083040.2533097-4-prajwal.n@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261002083040.2533097-4-prajwal.n@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: f3RKA8IFaGiX3R4rsgW38f8DGZtesrRm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAxOSBTYWx0ZWRfXwL/r6Wp5xgzT
 3rpZcc0cTWbRheeSbB7/vndF6KEu4N0Ouu4bRTVaUMIjefx69cqistPma66g/PhBDLN0Q/8HMqM
 M2MBx96OndvhEeJTJildFCDUMddAI4KbKuEHGZ+RmaEQR6ih5hD7JjMpcqLX8b9lvpwnJPizGSY
 xiR6ApdCf+z34JIklcw7Tv6a0P6ELd4EaKWYsQM4x1BmEBp2IjGg86pS4QHt5caoZRLTzqb2XfK
 MlpqSlICgnrkHnJNy7M8ZKQbDc688CFyx/WFywK/vZJ8cUxLORcuOtHSmqO5xoZtdCO8DeRGLRv
 hCBZvy9xyz5SsUdhAG68n0sFIVZHf+23bec0KGQFDolGFarQ9Nrxj26QCsVaxOlw3dJIIyiM3c9
 wVVggp1s+aFf28viG+j7eItWvKQQPIdzbpP6CG9M0y4rsSEUxOalcT46TuRH0wUmDy1AMeTmpxT
 qaeQDXRz9+g8A05/R4g==
X-Proofpoint-GUID: f3RKA8IFaGiX3R4rsgW38f8DGZtesrRm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAxOSBTYWx0ZWRfX9q0AG8r99Oz0
 Ot92nqxwIcQnb+0WswzBtDxcD2Wi9acpBHHjRk5vcguZ7wSLACFiuI16lIZQJBL8ktV+WMcHrOF
 kK1TA457h3iOvn2Uk1XdZtZ/fxtafUY=
X-Authority-Analysis: v=2.4 cv=UaHE26SN c=1 sm=1 tr=0 ts=6adaea46 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=REz500sFIBv3WmS_N7EA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_220202_777986_EC2549D8 
X-CRM114-Status: GOOD (  28.16  )
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Prajwal,

On Fri, Oct 02, 2026 at 02:00:39PM +0530, Prajwal N wrote:
> Update the build infrastructure to include the SBI
> watchdog compilation.
> 
> Implement the SBI watchdog functionality including
> start, stop, pat, read and write attributes,
> pretimeout and timeout handlers.
> 
> Signed-off-by: Prajwal N <prajwal.n@oss.qualcomm.com>
> ---
>  include/sbi/sbi_wdt.h |  72 +++++++
>  lib/sbi/objects.mk    |   1 +
>  lib/sbi/sbi_init.c    |   8 +
>  lib/sbi/sbi_wdt.c     | 455 ++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 536 insertions(+)
>  create mode 100644 include/sbi/sbi_wdt.h
>  create mode 100644 lib/sbi/sbi_wdt.c
> 
> diff --git a/include/sbi/sbi_wdt.h b/include/sbi/sbi_wdt.h
> new file mode 100644
> index 00000000..43f866dc
> --- /dev/null
> +++ b/include/sbi/sbi_wdt.h
> @@ -0,0 +1,72 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2026 Qualcomm Inc.
> + *
> + * Authors:
> + *   Prajwal N <prajwal.n@oss.qualcomm.com>
> + */
> +
> +#ifndef __SBI_WDT_H__
> +#define __SBI_WDT_H__
> +
> +/**
> + * Read the watchdog attribute
> + * @param attribute_id The wdt attribute id to be read
> + * @param attribute_value The value of attribute returned
> + * @return int error
> + */
> +int sbi_watchdog_read_attribute(u32 attribute_id, u32* attribute_value);
> +
> +/**
> + * Write the watchdog attribute
> + * @param attribute_id The wdt attribute id to be written
> + * @param attribute_value The wdt attribute value to be written
> + * @return int error
> + */
> +int sbi_watchdog_write_attribute(u32 attribute_id, u32 attribute_value);
> +
> +/**
> + * Write the watchdog MSI message attribute
> + * @param msi_addr_low The value of MSI low address
> + * @param msi_addr_high The value of MSI high address
> + * @param msi_data The value of MSI data
> + * @return int error
> + */
> +int sbi_watchdog_write_notif_msi_message(u32 msi_addr_low, u32 msi_addr_high, u32 msi_data);
> +
> +/**
> + * Start the watchdog
> + * @param void
> + * @return int error
> + */
> +int sbi_watchdog_start(void);
> +
> +/**
> + * Stop the watchdog
> + * @param void
> + * @return int error
> + */
> +int sbi_watchdog_stop(void);
> +
> +/**
> + * Pat the watchdog
> + * @param void
> + * @return int error
> + */
> +int sbi_watchdog_pat(void);
> +
> +/**
> + * Initialize the watchdog
> + * @param void
> + * @return int error
> + */
> +int sbi_watchdog_init(void);
> +
> +/**
> + * Remove the watchdog
> + * @param void
> + * @return int error
> + */
> +int sbi_watchdog_exit(void);
> +#endif
> diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
> index ae27d0c5..c8bdc94a 100644
> --- a/lib/sbi/objects.mk
> +++ b/lib/sbi/objects.mk
> @@ -106,5 +106,6 @@ endif
>  libsbi-objs-y += sbi_unpriv.o
>  libsbi-objs-y += sbi_expected_trap.o
>  libsbi-objs-y += sbi_cppc.o
> +libsbi-objs-y += sbi_wdt.o
>  libsbi-objs-$(CC_SUPPORT_VECTOR) += sbi_vector.o
>  libsbi-objs-y += sbi_fp.o
> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> index acd2f8b6..a8ce0a63 100644
> --- a/lib/sbi/sbi_init.c
> +++ b/lib/sbi/sbi_init.c
> @@ -35,6 +35,7 @@
>  #include <sbi/sbi_tlb.h>
>  #include <sbi/sbi_version.h>
>  #include <sbi/sbi_unit_test.h>
> +#include <sbi/sbi_wdt.h>
>  
>  #define BANNER                                              \
>  	"   ____                    _____ ____ _____\n"     \
> @@ -365,6 +366,13 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
>  		sbi_hart_hang();
>  	}
>  
> +	/* Initialise the watchdog*/
> +	rc = sbi_watchdog_init();
> +	if (rc) {
> +		sbi_printf("%s: watchdog init failed (error %d)\n", __func__, rc);
> +		sbi_hart_hang();
> +	}
> +
>  	/*
>  	 * Note: Finalize domains after HSM initialization
>  	 * Note: Finalize domains before HART PMP configuration so
> diff --git a/lib/sbi/sbi_wdt.c b/lib/sbi/sbi_wdt.c
> new file mode 100644
> index 00000000..988c6581
> --- /dev/null
> +++ b/lib/sbi/sbi_wdt.c
> @@ -0,0 +1,455 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2026 Qualcomm Inc.
> + *
> + * Authors:
> + *   Prajwal N <prajwal.n@oss.qualcomm.com>
> + */
> +
> +#include <sbi/riscv_asm.h>
> +#include <sbi/sbi_error.h>
> +#include <sbi/sbi_ecall.h>
> +#include <sbi/sbi_bitops.h>
> +#include <sbi/sbi_ecall_interface.h>
> +#include <sbi/riscv_locks.h>
> +#include <sbi/sbi_heap.h>
> +#include <sbi/sbi_irqchip.h>
> +#include <sbi/sbi_timer.h>
> +#include <sbi/sbi_wdt.h>
> +#include <sbi/sbi_system.h>
> +#include <sbi/sbi_console.h>
> +#include <sbi/riscv_io.h>
> +#include <sbi/sbi_string.h>
> +#include <sbi/sbi_hart_protection.h>
> +
> +/** Watchdog capabitlity - MSI */
> +#define WDT_CAP_MSI_MASK	BIT(1)
> +
> +/** Watchdog capabitlity - SSE */
> +#define WDT_CAP_SSE_MASK	BIT(0)
> +
> +/**
> + * Helpers to enable/disable channel capability bits
> + * _c: capability variable
> + * _m: capability mask
> + */
> +#define CAP_ENABLE(_c, _m)	INSERT_FIELD(_c, _m, 1)
> +#define CAP_DISABLE(_c, _m)	INSERT_FIELD(_c, _m, 0)
> +#define CAP_GET(_c, _m)		EXTRACT_FIELD(_c, _m)
> +
> +/* Watchdog Permission Flags */
> +#define WDT_ATTR_PERM_RO	BIT(0)
> +#define WDT_ATTR_PERM_W	 BIT(1)
> +#define WDT_ATTR_PERM_RW	(WDT_ATTR_PERM_RO) | (WDT_ATTR_PERM_W)
> +
> +static const u32 sbi_watchdog_attr_perm[SBI_WDT_ATTR_MAX] = {
> +	[SBI_WDT_CAPABILITY]            = WDT_ATTR_PERM_RO,
> +	[SBI_WDT_STATE]                 = WDT_ATTR_PERM_RO,
> +	[SBI_WDT_MIN_PERIOD]            = WDT_ATTR_PERM_RO,
> +	[SBI_WDT_PERIOD]                = WDT_ATTR_PERM_RW,
> +	[SBI_WDT_TIME_LEFT]             = WDT_ATTR_PERM_RO,
> +	[SBI_WDT_NOTIF_TIME]            = WDT_ATTR_PERM_RW,
> +	[SBI_WDT_NOTIF_MSI_ADDR_LOW]    = WDT_ATTR_PERM_RW,
> +	[SBI_WDT_NOTIF_MSI_ADDR_HIGH]   = WDT_ATTR_PERM_RW,
> +	[SBI_WDT_NOTIF_MSI_DATA]        = WDT_ATTR_PERM_RW
> +};
> +
> +/**
> + * SBI watchdog state
> + */
> +typedef enum {
> +	SBI_WDT_STOPPED = 0,
> +	SBI_WDT_RUNNING	= 1,
> +	SBI_WDT_PAUSED  = 2,
> +	SBI_WDT_EXPIRED	= 3
> +} sbi_wdt_state_t;
> +
> +/**
> + * SBI watchdog attributes
> + */
> +struct sbi_watchdog_attrs {
> +	/* MSI and SSE capability flags */
> +	u32 wdt_capability;
> +	/* Watchdog state */
> +	u32 wdt_state;
> +	/* Minimum watchdog timeout supported in us */
> +	u32 wdt_min_period;
> +	/* Watchdog timeout period in us */
> +	u32 wdt_period;
> +	/* Time left until watchdog expiry in us */
> +	u32 wdt_time_left;
> +	/* Watchdog pretimeout in us */
> +	u32 wdt_notif_time;
> +	/* MSI target address low 32-bit */
> +	u32 wdt_notif_msi_addr_low;
> +	/* MSI target address high 32-bit */
> +	u32 wdt_notif_msi_addr_high;
> +	/* MSI data */
> +	u32 wdt_notif_msi_data;
> +};
> +
> +struct sbi_watchdog {
> +	/* Watchdog attributes */
> +	struct sbi_watchdog_attrs wdt_attr;
> +	/* Watchdog timeout event */
> +	struct sbi_timer_event wdt_timer_ev;
> +	/* Watchdog pretimeout event */
> +	struct sbi_timer_event wdt_pretimeout_ev;
> +	/* Watchdog spinlock */
> +	spinlock_t wdt_lock;
> +};
> +
> +/* Global pointer to the watchdog structure */
> +static struct sbi_watchdog *sbi_system_watchdog;
> +
> +/** Make sure all the attributes are packed for direct memcpy in ATTR_READ */
> +#define assert_field_offset(field, attr_offset)				\
> +	_Static_assert(							\
> +		((offsetof(struct sbi_watchdog_attrs, field)) /		\
> +			sizeof(u32)) == attr_offset,			\
> +		"field" #field						\
> +		" from struct sbi_watchdog_attrs invalid offset, expected " #attr_offset)
> +
> +assert_field_offset(wdt_capability, SBI_WDT_CAPABILITY);
> +assert_field_offset(wdt_state, SBI_WDT_STATE);
> +assert_field_offset(wdt_min_period, SBI_WDT_MIN_PERIOD);
> +assert_field_offset(wdt_period, SBI_WDT_PERIOD);
> +assert_field_offset(wdt_time_left, SBI_WDT_TIME_LEFT);
> +assert_field_offset(wdt_notif_time, SBI_WDT_NOTIF_TIME);
> +assert_field_offset(wdt_notif_msi_addr_low, SBI_WDT_NOTIF_MSI_ADDR_LOW);
> +assert_field_offset(wdt_notif_msi_addr_high, SBI_WDT_NOTIF_MSI_ADDR_HIGH);
> +assert_field_offset(wdt_notif_msi_data, SBI_WDT_NOTIF_MSI_DATA);
> +
> +int sbi_watchdog_read_attribute(u32 attribute_id, u32* attribute_value)
> +{
> +	u64 current, deadline, tick_delta;
> +	int ret = SBI_SUCCESS;
> +
> +	spin_lock(&sbi_system_watchdog->wdt_lock);
> +
> +	switch (attribute_id) {
> +	case SBI_WDT_TIME_LEFT:
> +		/* Calculate the time left before expiry and update the attribute */
> +		current = sbi_timer_value();
> +		deadline = sbi_system_watchdog->wdt_timer_ev.time_stamp;
> +		if (current >= deadline) {
> +			sbi_system_watchdog->wdt_attr.wdt_time_left = 0;
> +			break;
> +		}
> +		tick_delta = deadline - current;
> +		sbi_system_watchdog->wdt_attr.wdt_time_left = sbi_timer_ticks_to_usec(tick_delta);
> +		break;
> +
> +	default:
> +		/* Return error if the attribute index is out of bound*/
> +		if (attribute_id >= SBI_WDT_ATTR_MAX) {
> +			ret = SBI_ERR_INVALID_PARAM;
> +			goto out;
> +		}
> +		break;
> +	}
> +
> +	u32 *wdt_attrs = (u32 *)&sbi_system_watchdog->wdt_attr;
> +	*attribute_value = wdt_attrs[attribute_id];
> +
> +out:
> +	spin_unlock(&sbi_system_watchdog->wdt_lock);
> +	return ret;
> +}
> +
> +int sbi_watchdog_write_attribute(u32 attribute_id, u32 attribute_value)
> +{
> +	int ret;
> +
> +	spin_lock(&sbi_system_watchdog->wdt_lock);
> +
> +	/* Check if the attribute is writable */
> +	if (!(sbi_watchdog_attr_perm[attribute_id] & WDT_ATTR_PERM_W)) {
This is unbounded access. Please validate attribute_id against SBI_WDT_ATTR_MAX before access.

> +		ret = SBI_ERR_DENIED;
> +		goto out;
> +	}
> +
> +	switch (attribute_id) {
> +	case SBI_WDT_PERIOD:
> +		/* Return error if wdt_period passed is less than wdt_min_period */
> +		if (attribute_value < sbi_system_watchdog->wdt_attr.wdt_min_period) {
> +			ret = SBI_ERR_FAILED;
> +			goto out;
> +		}
> +		break;
> +
> +	case SBI_WDT_NOTIF_TIME:
> +		/* Ignore the write if the MSI capability is not enabled */
> +		if (!CAP_GET(sbi_system_watchdog->wdt_attr.wdt_capability, WDT_CAP_MSI_MASK)) {
> +			ret = SBI_SUCCESS;
> +			goto out;
> +		}
> +
> +		/* Returen error if the notif time is greater than the timeout period*/
Typo.

> +		if (attribute_value >= sbi_system_watchdog->wdt_attr.wdt_period) {
> +			ret = SBI_ERR_FAILED;
> +			goto out;
> +		}
> +		break;
> +
> +	case SBI_WDT_NOTIF_MSI_ADDR_LOW:
> +	case SBI_WDT_NOTIF_MSI_ADDR_HIGH:
> +	case SBI_WDT_NOTIF_MSI_DATA:
> +		/* Ignore the write if the MSI capability is not enabled */
> +		if (!CAP_GET(sbi_system_watchdog->wdt_attr.wdt_capability, WDT_CAP_MSI_MASK)) {
> +			ret = SBI_SUCCESS;
> +			goto out;
> +		}
> +
> +		/*
> +		 * The MSI address and data can be written only when
> +		 * the notifications are disabled
> +		 */
> +		if (sbi_system_watchdog->wdt_attr.wdt_notif_time != 0) {
> +			ret = SBI_ERR_FAILED;
> +			goto out;
> +		}
> +		break;
> +
> +	default:
> +		/* Return error if the attribute index is out of bound*/
> +		if (attribute_id >= SBI_WDT_ATTR_MAX) {
> +			ret = SBI_ERR_INVALID_PARAM;
> +			goto out;
> +		}
> +		break;
> +	}
> +
> +	u32 *wdt_attrs = (u32 *)&sbi_system_watchdog->wdt_attr;
> +	wdt_attrs[attribute_id] = attribute_value;
> +
> +	ret = SBI_SUCCESS;
> +
> +out:
> +	spin_unlock(&sbi_system_watchdog->wdt_lock);
> +	return ret;
> +}
> +
> +int sbi_watchdog_write_notif_msi_message(u32 msi_addr_low, u32 msi_addr_high, u32 msi_data)
> +{
> +	int ret;
> +
> +	spin_lock(&sbi_system_watchdog->wdt_lock);
> +
> +	/* Ignore the write if the MSI capability is not enabled */
> +	if (!CAP_GET(sbi_system_watchdog->wdt_attr.wdt_capability, WDT_CAP_MSI_MASK)) {
> +		ret = SBI_SUCCESS;
> +		goto out;
> +	}
> +
> +	/* The MSI address and data can be written only when the notifications are disabled */
> +	if (sbi_system_watchdog->wdt_attr.wdt_notif_time != 0) {
> +		ret = SBI_EINVAL;
> +		goto out;
> +	}
> +
> +	u32 *wdt_attrs = (u32 *)&sbi_system_watchdog->wdt_attr;
> +	wdt_attrs[SBI_WDT_NOTIF_MSI_ADDR_LOW] = msi_addr_low;
> +	wdt_attrs[SBI_WDT_NOTIF_MSI_ADDR_HIGH] = msi_addr_high;
> +	wdt_attrs[SBI_WDT_NOTIF_MSI_DATA] = msi_data;
> +
> +	ret = SBI_SUCCESS;
> +
> +out:
> +	spin_unlock(&sbi_system_watchdog->wdt_lock);
> +	return ret;
> +}
> +
> +static void sbi_watchdog_pretimeout_cleanup(struct sbi_timer_event *ev)
> +{
> +	/* Nothing to do */
> +}
> +
> +static void sbi_watchdog_pretimeout_callback(struct sbi_timer_event *ev,
> +					     struct sbi_timer_event_restart *restart)
> +{
> +	u64 msi_addr;
> +	u32 msi_data;
> +
> +	spin_lock(&sbi_system_watchdog->wdt_lock);
> +	/* Calculate the MSI address using the low and high addresses*/
> +	msi_addr = (((u64)sbi_system_watchdog->wdt_attr.wdt_notif_msi_addr_high << 32 ) |
> +					sbi_system_watchdog->wdt_attr.wdt_notif_msi_addr_low);
> +	msi_data = sbi_system_watchdog->wdt_attr.wdt_notif_msi_data;
> +
> +	spin_unlock(&sbi_system_watchdog->wdt_lock);
> +
> +	sbi_hart_protection_temp_map_range((unsigned long)msi_addr, sizeof(u32));
> +	/* Write the MSI data to the MSI address*/
> +	writel(msi_data, (void *)(unsigned long)msi_addr);
> +	sbi_hart_protection_temp_unmap_range((unsigned long)msi_addr, sizeof(u32));
> +}
> +
> +static void sbi_watchdog_event_cleanup(struct sbi_timer_event *ev)
> +{
> +	/* Nothing to do */
> +}
> +
> +static void sbi_watchdog_expired_callback(struct sbi_timer_event *ev,
> +					  struct sbi_timer_event_restart *restart)
> +{
> +	spin_lock(&sbi_system_watchdog->wdt_lock);
> +
> +	sbi_system_watchdog->wdt_attr.wdt_state = SBI_WDT_EXPIRED;
> +	/* Trigger the system reboot*/
> +	sbi_system_reset(SBI_SRST_RESET_TYPE_WARM_REBOOT, SBI_SRST_RESET_REASON_NONE);
> +
> +	spin_unlock(&sbi_system_watchdog->wdt_lock);
> +}
> +
> +static void sbi_watchdog_enable_timer_events()
> +{
This function is always called with wdt_lock held and it calls sbi_timer_event_start(), which takes the timer
event-list lock. In the following remote but possible scenario:

Hart 0: sbi_watchdog_pat()
           holds wdt_lock
           calls sbi_timer_event_start()
           waits for Hart 1's event_list_lock

 Hart 1: sbi_timer_process()
           holds event_list_lock
           invokes watchdog callback
           waits for wdt_lock

A deadlock is possible.

> +	u64 timeout, pretimeout;
> +	u32 pretimeout_us;
> +
> +	/* Restart the pretimeout event only if the wdt_notif_time is non zero*/
> +	if (sbi_system_watchdog->wdt_attr.wdt_notif_time != 0) {
> +		pretimeout_us = sbi_system_watchdog->wdt_attr.wdt_period -
> +				sbi_system_watchdog->wdt_attr.wdt_notif_time;
When writing SBI_WDT_NOTIF_TIME, its value is checked against the current SBI_WDT_PERIOD
but when writing SBI_WDT_PERIOD, the check of the new value is against wdt_min_period.
It is not checked whether the new period is still greater than the already configured wdt_notif_time.
So, it is possible that wdt_period - wdt_notif_time underflows. Am I missing something?

> +		pretimeout = sbi_timer_value() + sbi_timer_compute_udelta(pretimeout_us);
> +
> +		sbi_timer_event_start(&sbi_system_watchdog->wdt_pretimeout_ev, pretimeout);
> +	}
> +
> +	/* Restart the Watchdog timeout event only if the wdt_period is non zero*/
> +	if (sbi_system_watchdog->wdt_attr.wdt_period != 0) {
> +		timeout = sbi_timer_value() +
> +			  sbi_timer_compute_udelta(sbi_system_watchdog->wdt_attr.wdt_period);
> +		sbi_timer_event_start(&sbi_system_watchdog->wdt_timer_ev, timeout);
> +	}
> +}
> +
> +int sbi_watchdog_start(void)
> +{
> +	int ret;
> +
> +	spin_lock(&sbi_system_watchdog->wdt_lock);
> +
> +	/* Return error if the watchdog is not in SBI_WDT_STOPPED state*/
> +	if (sbi_system_watchdog->wdt_attr.wdt_state != SBI_WDT_STOPPED) {
> +		ret = SBI_ERR_INVALID_STATE;
> +		goto out;
> +	}
> +
> +	sbi_watchdog_enable_timer_events();
> +
> +	sbi_system_watchdog->wdt_attr.wdt_state = SBI_WDT_RUNNING;
> +	ret = SBI_SUCCESS;
> +
> +out:
> +	spin_unlock(&sbi_system_watchdog->wdt_lock);
> +	return ret;
> +}
> +
> +int sbi_watchdog_stop(void)
> +{
> +	int ret;
> +
> +	spin_lock(&sbi_system_watchdog->wdt_lock);
> +
> +	/* Return error if the watchdog is already in SBI_WDT_STOPPED state */
> +	if (sbi_system_watchdog->wdt_attr.wdt_state == SBI_WDT_STOPPED) {
> +		ret = SBI_ERR_INVALID_STATE;
> +		goto out;
> +	}
> +
> +	/* Stop both the pretimeout and expiry events */
> +	sbi_timer_event_stop(&sbi_system_watchdog->wdt_pretimeout_ev);
> +	sbi_timer_event_stop(&sbi_system_watchdog->wdt_timer_ev);
> +
> +	sbi_system_watchdog->wdt_attr.wdt_state = SBI_WDT_STOPPED;
> +	sbi_system_watchdog->wdt_attr.wdt_time_left = 0;
> +
> +	ret = SBI_SUCCESS;
> +
> +out:
> +	spin_unlock(&sbi_system_watchdog->wdt_lock);
> +	return ret;
> +}
> +
> +int sbi_watchdog_pat(void)
> +{
> +	int ret;
> +
> +	spin_lock(&sbi_system_watchdog->wdt_lock);
> +
> +	/* Return error if the watchdog is not in SBI_WDT_RUNNING state*/
> +	if (sbi_system_watchdog->wdt_attr.wdt_state != SBI_WDT_RUNNING) {
> +		ret = SBI_ERR_INVALID_STATE;
> +		goto out;
> +	}
> +
> +	sbi_watchdog_enable_timer_events();
> +	ret = SBI_SUCCESS;
> +
> +out:
> +	spin_unlock(&sbi_system_watchdog->wdt_lock);
> +	return ret;
> +}
> +
> +static void sbi_watchdog_init_attributes(void)
> +{
> +	const struct sbi_timer_device *tdev;
> +	unsigned long timer_freq;
> +	u32 capability = 0;
> +
> +	spin_lock(&sbi_system_watchdog->wdt_lock);
> +
> +	sbi_memset(&sbi_system_watchdog->wdt_attr, 0, sizeof(struct sbi_watchdog_attrs));
> +
> +	/* Retrieve the MSI capability from irqchip */
> +	if (sbi_irqchip_find_device_by_caps(SBI_IRQCHIP_CAPS_MSI, NULL))
> +		capability = CAP_ENABLE(capability, WDT_CAP_MSI_MASK);
> +
> +	sbi_system_watchdog->wdt_attr.wdt_capability = capability;
> +
> +	sbi_system_watchdog->wdt_attr.wdt_state = SBI_WDT_STOPPED;
> +
> +	/* Set the min period based on the timer frequency */
> +	tdev = sbi_timer_get_device();
> +	if (tdev != NULL) {
> +		timer_freq = tdev->timer_freq;
> +		/* Ceil division to ensure the result is non-zero */
> +		sbi_system_watchdog->wdt_attr.wdt_min_period =
> +					(u32)((SEC_TO_MICROSEC + timer_freq - 1) / timer_freq);
> +	}
> +
> +	spin_unlock(&sbi_system_watchdog->wdt_lock);
> +}
> +
> +int sbi_watchdog_init(void)
> +{
> +	/* Allocate memory for global watchdog structure sbi_system_watchdog */
> +	sbi_system_watchdog = (struct sbi_watchdog*)sbi_zalloc(sizeof(struct sbi_watchdog));
> +
> +	if(!sbi_system_watchdog) {
> +		return SBI_ENOMEM;
> +	}
> +
> +	SPIN_LOCK_INIT(sbi_system_watchdog->wdt_lock);
> +	SBI_INIT_TIMER_EVENT(&sbi_system_watchdog->wdt_timer_ev,
> +			     sbi_watchdog_expired_callback,
> +			     sbi_watchdog_event_cleanup, NULL);
> +	SBI_INIT_TIMER_EVENT(&sbi_system_watchdog->wdt_pretimeout_ev,
> +			     sbi_watchdog_pretimeout_callback,
> +			     sbi_watchdog_pretimeout_cleanup, NULL);
> +
> +	/* Initialize the default watchdog attributes */
> +	sbi_watchdog_init_attributes();
> +
> +	return SBI_SUCCESS;
> +}
> +
> +int sbi_watchdog_exit(void)
> +{
> +	/* Clean up the global watchdog */
> +	sbi_free(sbi_system_watchdog);
> +
> +	return 0;
> +}
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
