Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED78C53209
	for <opensbi@archiver.kernel.org>; Mon, 27 Jul 2026 13:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KDd8U4etSYaE95pNtwXev1CTyCs1A3j5q8ccZUQaHuQ=; b=j+eALPfhnDaqJg
	dpbXxJD6GtanHTRbFWH3FtfCfHI+cT0MQZwMFsGrReZ8ShTjZ9rrY0LMP52AzPg9avI/w5kWjAyhq
	OA7eWQo43FkVuj0liFfmgHZNj5wAutaR7jUkz72sGArSyX2LdxuWnxmJJ/G0e5O3KlqQFFJ7aCS3A
	vgA0yTFdJUwl6uP1LvfFgsohFkuLW5/N8KI8+pj79c+W6JuPeuH966dQ8g2qFQtfK4FDM1BOe8qN5
	AO0FbRIKW960uLftVYmEov2zlG6jvoyl0la2FIXFVc/hHDocCgU1j612y62Ns8ce8rpsAGYvpjwcp
	x4PEvB2MFv3q7hwvIvYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLoX-00000002ubg-1Pol;
	Mon, 27 Jul 2026 13:56:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLoV-00000002uax-0ph8
	for opensbi@lists.infradead.org;
	Mon, 27 Jul 2026 13:56:16 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDluH93414506
	for <opensbi@lists.infradead.org>; Mon, 27 Jul 2026 13:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=klymbeRqw/4
	N50Z78/UBvIPe3oOwCC3MvT00KT99zG4=; b=npsq4Z870wSaVJd/y2brPbi+7dA
	djlEiSrUb54QGMxwCk2lqIRrvzDyxG57OBnO8dmvvpemXXh/dM6zCeKViJMteN1z
	uE+3No8gP01Qr3X1bxvqQdY7h0Q4PecEmQcn+uv8ZRg02iZ7jj+GU6L8S8QOsZUR
	uxoXXyVTrc0d/bVZco0X3ik4hTYqYfHiikqALL9jToP23zY/SDN3M3x83FVkAIXT
	ww59xJf9QmeOUZORQWyHq5DPjw7/pDU8upsEPSmUMXYE7tnUhQekO4AIz37J+YiI
	pyPmdVy22CqK1cK/lAP9ZfUmkqCfqzWowQXqR9c5L8r/CchMxqpQ4AinwVA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4v68xbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 27 Jul 2026 13:56:14 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e11baa66eso2985736a91.2
        for <opensbi@lists.infradead.org>; Mon, 27 Jul 2026 06:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785160574; x=1785765374; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=klymbeRqw/4N50Z78/UBvIPe3oOwCC3MvT00KT99zG4=;
        b=G9EpShhhfGgsEkPg9LSnZhkDzFrbwqaBUweZfSpD/hnrEF86gr6iU006A+yIY1a05J
         zU6WPsbYfQNORiQllmG9C3ixADwAOzCLuWUZtF5jYozYj0cFVI8BzjEjoKRgTMoFjy3F
         ueqRtOaOxZmZPikLXJp2MyS8W/Az71Mv2fJce1CBNexc4qM9kdc6Ixge9fPXXckwxIw/
         OYQLbAoYPW5yFAKdmsArARXGEJH78wPRwDgI0gEcoQeRGpkclkiYr4ASDxaFt7JttHbZ
         WHZOiWU4Khn2J7ohkH236Q1U25++8RCcCeiewSXqtEbQnt6B/X5RZyo7io0D8Lq9Z+Z1
         V9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785160574; x=1785765374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=klymbeRqw/4N50Z78/UBvIPe3oOwCC3MvT00KT99zG4=;
        b=l4zFacYVbKZuXtFAWTIwCEm+UWvTvJSg0dUQXDIOdEJIjeX2WZPL4d9f8DtqT2XE+n
         XrFGE/BgBZAvuZvmQtys+cftb83Pv4OP8tlo2P6X3deXSrkZVjPMpw2vExpieIbe5ziN
         BBJ6Ev+KlDKqId11G0F6dTwywOSMbfI6n3ybzSMOGhxxfgBrIjhv5o9KqZSQDq7/wC6m
         kr9VujMlZLolvLgmALnrL0eU/7mpfbsaO93jpukRB2O8QOFPHChde0D+RoW1oAcIU8bV
         Gg/akurqW8bnUDzmco4zYh/pKqJoWuYzhayob+0D38nf3QEFn4GN62y6XpmD6tYDvCj8
         La3A==
X-Gm-Message-State: AOJu0YzK6zp0zQwVm7GP8/BjDwnrypCsEqZHN84Z4Pnh3Zs5rIl/0R7q
	1hDSFMSH35XVxR2/Z4s/01NMrYEvqT50jwbux3gffwEjchMCPfqf3v2pdAUQ+g+1g7355YMHXuZ
	exR/Chd6SnBHsYccjYQh+Pg7bUGss6+IsMXNl+Xau4msLfFNywl0jgTiBwEt7cWWG4IebujXFUw
	==
X-Gm-Gg: AR+sD13KC50k31Lh4Cgf90HtbV5CgBu21JEEi1k+GsdICh9Ld7tmbsq4YifbycfolUv
	U03eMo3Hi3cS1PWuBIViphG3Nt0vrykhpwiemABotNBECw4d+AEYOC9JeB85lMN7rjISxQp/9wn
	15AaEuby/hPLngNZF65Jyai9otCqzWktkdWuldwdupxj/TVMZOMHGwBxIOm4Dp4rVNflGusfkiz
	siOThO7QTuNCUAwtL8QL7wNWaDrgQPrBFJn+jU6Yc59n3O7NvXh3oq07fDOvP9U0DV5/WmaABfb
	vWiwPscZZq51bhsL4jNgfN0LD1kYhUhA/fQ46ZRvNO9T3pBMy1/SjYbYQKsPfttOh6yj1jvQ6Jo
	LszCAuCE1tiI5Zyoj2lzppjm7Txf5k3FrcqytDBpLgNrR34fh3f6s+dxrvWwXoplFGqyYrPwAZ4
	gCfOH5iPoOyigYHRRQ4g4D
X-Received: by 2002:a17:90b:57e5:b0:380:f389:447b with SMTP id 98e67ed59e1d1-38f294e9635mr8187492a91.11.1785160573893;
        Mon, 27 Jul 2026 06:56:13 -0700 (PDT)
X-Received: by 2002:a17:90b:57e5:b0:380:f389:447b with SMTP id 98e67ed59e1d1-38f294e9635mr8187447a91.11.1785160573406;
        Mon, 27 Jul 2026 06:56:13 -0700 (PDT)
Received: from hu-rahupath-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc593b57sm47067658eec.25.2026.07.27.06.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 06:56:12 -0700 (PDT)
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: rahul.pathak@oss.qualcomm.com, rahul@summations.net,
        Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>,
        Ranbir Singh <ranbir.singh@oss.qualcomm.com>
Subject: [RFC PATCH v2 1/5] riscv: Add Smsdid and Smmpt hart extensions
Date: Mon, 27 Jul 2026 19:25:59 +0530
Message-ID: <20260727135605.465309-2-rahul.pathak@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727135605.465309-1-rahul.pathak@oss.qualcomm.com>
References: <20260727135605.465309-1-rahul.pathak@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzMSBTYWx0ZWRfX6DEttcSJTuqH
 dPsieCgmAyp/LF6EfZRPSUZNE+lzUEj6XC6SzkYNQ5Z0myu0Wmk+LbBKeieu9jpey/J0EVlAdyC
 QUvkGtxPhLdd7ru8sGLxn+2JBGU+hho=
X-Proofpoint-GUID: Y5r-fkJ3PLWDxziXViouXT7olq9IjvxG
X-Authority-Analysis: v=2.4 cv=ev3vCIpX c=1 sm=1 tr=0 ts=6a67637e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=F7PIS_qpXq7oc_onYicA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: Y5r-fkJ3PLWDxziXViouXT7olq9IjvxG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzMSBTYWx0ZWRfXz5FRq6A7bRo4
 vKPmEyet0ktduExmBQ2uO8sJBBKpvdVDPh34KfK8IAydaBNJWmB5zJyoFTx/ZTl6q9tsYZQew5w
 0zylfYu7qLBYN643Cm3YZXfumsaH1L5CtAfrDc0fXYw585vtfP2WorUat6BnZ4Mu5afbXuNdUjI
 TS77kt4pqMzXntnqx8fVaVGuA17bvWVmSSyzZc6xwJ28zVL73veP+CRJGsQZ0SWSWpPMUUpiqA6
 dmMHUCrybFVDQdIdEPUNCK6YzYyry18L9SmCSnRb2HgoNh5JYAifYoAKrcQJCN1RbgHDj92L8iQ
 mLcKE2m6N6JssivTO0GrkIiAP81XQXC6N8JTJRnrhFhd/jqm4TUIquzPy7xCaML/3dOYmjrH4vb
 Svi+JeuEb/xgO6zzWjzKs0RN4zzSzw4HjIqivmZJLjZu1FZwIdUzFfw2lBoatagLfnu36nazOXz
 pfaAzQjLkdym7tLal4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_065615_242898_ABF7480F 
X-CRM114-Status: GOOD (  11.20  )
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

Add hart extension identifiers for the RISC-V Smsdid (supervisor
domain ID) and Smmpt (supervisor domain memory protection) extensions.

Signed-off-by: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Reviewed-by: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Reviewed-by: Ranbir Singh <ranbir.singh@oss.qualcomm.com>
---
 include/sbi/sbi_hart.h | 4 ++++
 lib/sbi/sbi_hart.c     | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 543393bb..cbad94d4 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -95,6 +95,10 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_F,
 	/** Hart has D extension */
 	SBI_HART_EXT_D,
+	/** Hart has SMMTT - SMSDID extension */
+	SBI_HART_EXT_SMSDID,
+	/** Hart has SMMTT - SMMPT extension */
+	SBI_HART_EXT_SMMPT,
 
 	/** Maximum index of Hart extension */
 	SBI_HART_EXT_MAX,
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index bee88557..4261fea8 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -360,6 +360,8 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
 	__SBI_HART_EXT_DATA(v, SBI_HART_EXT_V),
 	__SBI_HART_EXT_DATA(f, SBI_HART_EXT_F),
 	__SBI_HART_EXT_DATA(d, SBI_HART_EXT_D),
+	__SBI_HART_EXT_DATA(smsdid, SBI_HART_EXT_SMSDID),
+	__SBI_HART_EXT_DATA(smmpt,  SBI_HART_EXT_SMMPT),
 };
 
 _Static_assert(SBI_HART_EXT_MAX == array_size(sbi_hart_ext),
-- 
2.51.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
