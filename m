Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 246F1EF99DC
	for <opensbi@archiver.kernel.org>; Fri, 13 Feb 2026 21:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MqNyW5aMG0gRmxFYZQEjpbYvDde/o6MjPwUOkAYzhn4=; b=MYtVXpvYHS/9Gy
	LN99raNOl+2zIoIn9ZLocMaTDXSjOyhfdslkt83A85cDOP0t27mzK1m5K7Dn6WUwQ0a72DUXtq8PM
	Jgjct/b59JTZYIHrpzWGQGz+idPjXek+QAWP9BBF/WlM4U+JOl61nJ4hWMg9vpIOUPsLq1fNFThOO
	W7C3Z9Qyh0RmCBgS1JLcGZ4tdBanadLjaOA3P9otGeC1hbs0vux8171BISGbUA8v5jzuIgGcxN6I6
	/TaikjtECJOgmx/XzA/s/RlJ+W3NMNGX1XND6xH8tWKUkidm5ioT5L+/qizX8UwIR2wKUUN8FkC/Q
	he+i/R3VXi7qbwCrh3ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr0Jx-00000003wCV-124t;
	Fri, 13 Feb 2026 21:03:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr0Ju-00000003wC8-0o2v
	for opensbi@lists.infradead.org;
	Fri, 13 Feb 2026 21:03:23 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61DKAgec1827706
	for <opensbi@lists.infradead.org>; Fri, 13 Feb 2026 21:03:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IkIfpZtMCvNg8raaNvJBOkkx
	jWV7cekP5g3DoKTMGDc=; b=GSFYUR5ik2bxJS2wQfVBehvdpwjQTkFHhBVoxigC
	T2NvBbEeP4bo8aQGV+F43B/pJGaN9NaZ8TQeil5gTjBgR5HoD8TpM5aaqAgibXna
	9HW0qRMvEABYhb8vSZAna+C6BPIdwGar4VmMWWE/XNkaEeOTEqomgFYWJ9bQJvZb
	zFraTharsCxUJMwgeeBMwVV/kE4SiSE+mEJhiBjtaZTgMm4P/ZjYKoUzfj+hYw2A
	YMUdswoS6QONoBekg02om49Hdp/YHWLJ/EwgZgZ/gtEj2lKUS1+Kja5cNsE+iGOZ
	+Xp+iKgk5tMPnlW77a/RsfJ2gjlqlEtNL/2mzOfdxA4QMw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9wg03c4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Fri, 13 Feb 2026 21:03:20 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b7ef896edcso12299169eec.0
        for <opensbi@lists.infradead.org>; Fri, 13 Feb 2026 13:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771016600; x=1771621400; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IkIfpZtMCvNg8raaNvJBOkkxjWV7cekP5g3DoKTMGDc=;
        b=R7If96+r7m2DF6+eIoQ1JtU2U8tzUb9KCRpElJQV+pPQTPPVmMdILh3SOPIfU61AM8
         jBctFWbcSKtPAjmO6g9g436tfai49X+ikq8lOqB8Of0mq930ozK+jK3Ls5PqkItm6J+t
         3QwBTqF6PVPCs1ARSLYQGHdOH57GcWa2jib2/0J9izc0xcJvQ2jBhaK+sYGh6BqBsQ4H
         yr42vM0q8rUg0TCR2RDpXVRYLt9vpjRwxubCYECqc4wBfNCeoxcXXhohTT/KUXWlv/hD
         utBBxKQVc6MniBi5XP7gHI7R5KgHlsYOQMXJfxSIIiJLfdcVkjoXrUqn8aJ+ERwQNw8w
         32Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771016600; x=1771621400;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IkIfpZtMCvNg8raaNvJBOkkxjWV7cekP5g3DoKTMGDc=;
        b=YqykoWZ8GX+rBEpBbAgW0/baPEKl54CXakRzcxYw092P6TwDRcXERa0eqsZSW46vKo
         qJevYbT4uJUDYOf4RuKVFrJjEgdAEm9pS6XGwPhra2GQ9eUS3zkCKxMcAd/NW8NlhotO
         LrXk31XFdiJr9cYcEMwtqcnVupciprlgkdQDfIiItN41KIWBHaGHrqqRqaulf/k4wksl
         PgZt/EQJbimpf8y+EMy0XHsH0Ou003JZ1+P2G0xyVJ3FHGItuPe6PdxUuQf3E9csbS5V
         fW9hpgU+f071T5M4ICHWpLmi986xSXPIIMnDwpCMio2HDYVCSV3DdChRG/9k+Wlj6VFv
         uIlw==
X-Gm-Message-State: AOJu0YzfoZNJCJW0xDCd6/RIf0OolfmBo/hJjRqicfcxJp5bcTqgBml8
	OwKU2fl5NSCYygYTieIPFtjKZPpt0Umm3aOJCaXlgj/4naZqC3bBtS1+jlBBGrDd5Q3IzbF7whF
	/Ql8fs6mNAGcXc6fnmB9f4NU6Gfgh2zMwL4fIgdZlEI7U4gJeqQsIx3eCxaK//1fGtg==
X-Gm-Gg: AZuq6aIHwOG8+5WB75MgImmFK3Dz+4LPcZv/wgxWq6xSAkVQlOvcoWV3ylAdjep8XN0
	tKrum15PmUW8btZxaaia9SbExP+0yDLwZ6bMwNdUFVx8k1n+RBgV6hISI7Vdd++yokPPvdROaTU
	bwu9J+4CzhNE6r0Z9t+SeZ5wYmd3aS7rV5szEWMv6oG4ChwKY4/awDVvOEpHxQYuMTd47HEh5uH
	nzUmCEPS7AmCWs1wuSldSelJNlv9vdrcfA6X4NrSoisHSIWWyBwSJgYuLOnRatayNADibraMkOk
	VCRQqlfY5gPnqU1NM/L7OAoWavLayXRGjIyyQkQfrno26S7xKwcSmbLqiM6cIoY/cuQjTpIf5gQ
	w5Lbj3feKmBtyJJxeebkB+cUPl5GhGac=
X-Received: by 2002:a05:693c:2c0e:b0:2ba:981b:ede2 with SMTP id 5a478bee46e88-2babc42d33fmr1201226eec.5.1771016599945;
        Fri, 13 Feb 2026 13:03:19 -0800 (PST)
X-Received: by 2002:a05:693c:2c0e:b0:2ba:981b:ede2 with SMTP id 5a478bee46e88-2babc42d33fmr1201203eec.5.1771016599234;
        Fri, 13 Feb 2026 13:03:19 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb543e1dsm51585eec.4.2026.02.13.13.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 13:03:18 -0800 (PST)
Date: Fri, 13 Feb 2026 15:03:17 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Raymond Mao <raymondmaoca@gmail.com>
Cc: opensbi@lists.infradead.org, scott@riscstar.com, dave.patel@riscstar.com,
        raymond.mao@riscstar.com, robin.randhawa@sifive.com,
        samuel.holland@sifive.com, anup.patel@qti.qualcomm.com,
        anuppate@qti.qualcomm.com, dhaval@rivosinc.com, peter.lin@sifive.com
Subject: Re: [PATCH RFC 3/3] lib: sbi: Add VIRQ ecall extension
Message-ID: <tx4srauwlm4cy755tqqbo5fxp53rzfvyesgpsftc7w76p7xqql@uvwgjaruyc4n>
References: <20260213190459.2540597-1-raymondmaoca@gmail.com>
 <20260213190459.2540597-4-raymondmaoca@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260213190459.2540597-4-raymondmaoca@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDE2MSBTYWx0ZWRfX/GynhpJ/KPud
 L6qvmH2Mv/mK2jayLZ8dNX6BhYEpUdMjxb12NTyWotCNti5Bcy6TTIz/V7c8iXsdxwO40TbKoqL
 FDWbBF1oceCFXA69Pf7go8KOwlBv4pZo198oZqQSU+U4tivEnLZSAzh/w3cHFbi3PWoJSQidbdi
 ySAuiHhNd+8yn2I2UusTngfkUhF+aauipWN2N9oG4Cg75G0Oc5bfKijecNaS9TRquVhWYU8MNW0
 D0RuRNyAEeFPKXy6DyygMLZUWf9BcpWhLc0xGKayp7v8MGCUJ2y61A4D6t8L+UHZaYRbDrxJwO0
 T0ObQzv0aLpbOP6G3WJiYkTsHzx0waYbVsnXchaLUKcKxeApgNRcYnaKl4Ld727i5QQm5LcqA0r
 l9likV8omm611/kkPPjYpo4cTJ19gACfpyxzD3u5XqsEH8/cRQmWh12kaZf6EyQHJrun1XAVRhg
 PaAQFhyFFsiCvfyrBig==
X-Proofpoint-ORIG-GUID: R73CFRJLGJHnUKfpwyoi3TVaRzvxxcQP
X-Proofpoint-GUID: R73CFRJLGJHnUKfpwyoi3TVaRzvxxcQP
X-Authority-Analysis: v=2.4 cv=bo5BxUai c=1 sm=1 tr=0 ts=698f9198 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=ee_2aqc6AAAA:8 a=BULRxCZIHRo6WV8BamAA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_04,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_130322_245950_66586156 
X-CRM114-Status: GOOD (  24.53  )
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

On Fri, Feb 13, 2026 at 02:04:59PM -0500, Raymond Mao wrote:
> From: Raymond Mao <raymond.mao@riscstar.com>
> 
> Add vendor SBI extension ecall for VIRQ.
> This allows S-mode payload to pop/complete the next pending VIRQ has
> couried into the current domain.
> 
> Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
> ---
>  include/sbi/sbi_ecall_interface.h | 18 ++++++++++
>  lib/sbi/Kconfig                   |  5 +++
>  lib/sbi/objects.mk                |  3 ++
>  lib/sbi/sbi_ecall_virq.c          | 57 +++++++++++++++++++++++++++++++
>  4 files changed, 83 insertions(+)
>  create mode 100644 lib/sbi/sbi_ecall_virq.c
> 
> diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
> index 76624e3f..9cb9a7eb 100644
> --- a/include/sbi/sbi_ecall_interface.h
> +++ b/include/sbi/sbi_ecall_interface.h
> @@ -126,6 +126,24 @@
>  #define SBI_EXT_FWFT_SET		0x0
>  #define SBI_EXT_FWFT_GET		0x1
>  
> +#ifdef CONFIG_SBI_ECALL_VIRQ
> +
> +/* Vendor extension base range is defined by the SBI spec. Choose a private ID. */
> +#define SBI_EXT_VIRQ			0x0900524d

I'm not sure where this number comes from. I'd expect it to be
0x56495251 == "VIRQ"

> +
> +/* Function IDs for SBI_EXT_VIRQ */
> +#define SBI_EXT_VIRQ_POP		0
> +#define SBI_EXT_VIRQ_COMPLETE		1
> +
> +/*
> + * SBI_EXT_VIRQ_POP
> + * Returns:
> + *   a0: SBI error code (0 for success)
> + *   a1: next pending hwirq (0 if none pending)
                         ^ virq, but...

how about creating an SBI function which allows registering a shared
memory region (as several SBI extensions already do) and then place a
bitmap in that shared memory which represents all virqs (a set bit means
that that virq is pending). That would allow S-mode to immediately get
all pending virqs in its SSE handler and we wouldn't need to worry about
a queue filling up. The downside is that S-mode wouldn't necessarily
handle the virqs in FIFO order. But, that can be a feature, because the
queue forces FIFO order whereas S-mode may need to handle them in some
priority order instead.

> + */
> +
> +#endif
> +
>  enum sbi_fwft_feature_t {
>  	SBI_FWFT_MISALIGNED_EXC_DELEG		= 0x0,
>  	SBI_FWFT_LANDING_PAD			= 0x1,
> diff --git a/lib/sbi/Kconfig b/lib/sbi/Kconfig
> index c6cc04bc..8479f861 100644
> --- a/lib/sbi/Kconfig
> +++ b/lib/sbi/Kconfig
> @@ -69,4 +69,9 @@ config SBI_ECALL_SSE
>  config SBI_ECALL_MPXY
>  	bool "MPXY extension"
>  	default y
> +
> +config SBI_ECALL_VIRQ
> +	bool "VIRQ extension"
> +	default y
> +
>  endmenu
> diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
> index 07d13229..18e590ab 100644
> --- a/lib/sbi/objects.mk
> +++ b/lib/sbi/objects.mk
> @@ -64,6 +64,9 @@ libsbi-objs-$(CONFIG_SBI_ECALL_SSE) += sbi_ecall_sse.o
>  carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_MPXY) += ecall_mpxy
>  libsbi-objs-$(CONFIG_SBI_ECALL_MPXY) += sbi_ecall_mpxy.o
>  
> +carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_VIRQ) += ecall_virq
> +libsbi-objs-$(CONFIG_SBI_ECALL_VIRQ) += sbi_ecall_virq.o
> +
>  libsbi-objs-y += sbi_bitmap.o
>  libsbi-objs-y += sbi_bitops.o
>  libsbi-objs-y += sbi_console.o
> diff --git a/lib/sbi/sbi_ecall_virq.c b/lib/sbi/sbi_ecall_virq.c
> new file mode 100644
> index 00000000..b192598e
> --- /dev/null
> +++ b/lib/sbi/sbi_ecall_virq.c
> @@ -0,0 +1,57 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2026 RISCstar Solutions.
> + *
> + * Author: Raymond Mao <raymond.mao@riscstar.com>
> + */
> +
> +#include <sbi/sbi_console.h>
> +#include <sbi/sbi_ecall.h>
> +#include <sbi/sbi_ecall_interface.h>
> +#include <sbi/sbi_error.h>
> +#include <sbi/sbi_trap.h>
> +#include <sbi/sbi_virq.h>
> +
> +static int sbi_ecall_virq_handler(unsigned long extid,
> +				  unsigned long funcid,
> +				  struct sbi_trap_regs *regs,
> +				  struct sbi_ecall_return *out)
> +{
> +	(void)extid;
> +
> +	sbi_printf("[ECALL VIRQ] VIRQ ecall handler, funcid: %ld\n", funcid);

You'll want to get rid of these print statements when posting without the
RFC.

Thanks,
drew

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
