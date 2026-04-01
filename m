Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B720110FCAF0
	for <opensbi@archiver.kernel.org>; Wed,  1 Apr 2026 22:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yOzYJQKx0TY8WFifxRdaAJdybRAMjWYpOMUHJMwkc88=; b=c4dgROiEE9wJ97
	2as7BaJ2N/X1bVcebwbnDpdp1h/2bWtrq1fBid7LzB+nrsSks/1iskqo9ObRnfOadbK+mZely47Or
	M60kDlkcfWKHdoSBijJANPBlAFdtHBr5njfr4D7eAMQYXeb9ocVJWgJipGkxDPKtJFF0S6/2yPVky
	h0ffIdPq0v7SgWxhmJywvrudJcGseKNn+1duy2m0Es9GsIZqPpmqBimiNAUbrLUHNzBljfzoO087Q
	DaUjA3SNFlGy8BXffTShEe0gqFbsTRX0ZEujMKJwYU3dY1xTjAed/CbJr5i3Y5w62jSX+qLKu1Xta
	+aM49SoqPlpN4A+44oxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w83mL-0000000GHM1-2LFt;
	Wed, 01 Apr 2026 22:11:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w83k9-0000000GESK-0yHz
	for opensbi@bombadil.infradead.org;
	Wed, 01 Apr 2026 22:08:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=DIrymiB81twR4x/FCVxrvFw/QL1dKvV7GznCVmkpWyY=; b=SjZYIhODJiLGUeVnOjHfXkyO5F
	E8gyUtFkI9kTClBlVt/Fg53B1aJheDt65FIbF6n8OhUGgLpFVT6T4hJbc/nMLyi7jvobAqxSvhTxc
	MlB1Zkiwlv+xdjWbnq9gCEI/n4SkcAL4ZRg6bnXbR+kYVQ+Ry4GvvAPBCXnURuh3oOqAV8UbSzBrr
	y/XaIhz3vRNYW4ZFjmIYY4P05+JFcRHvjAMHK2M+LKAaTnnBQjVRZ/6wBHvqP+PEZnz31pRbus61D
	M0SmjMXrzwGIVXI+csmEmcotTTSSv8BBz9ygLuXIeg3VDrMYdQiXbhoz9+kNxliIu7BP9PL/20JVm
	r8ZRlpHA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w83k5-00000001MfR-2RgX
	for opensbi@lists.infradead.org;
	Wed, 01 Apr 2026 22:08:55 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M4DVr3746285
	for <opensbi@lists.infradead.org>; Wed, 1 Apr 2026 22:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DIrymiB81twR4x/FCVxrvFw/QL1dKvV7Gzn
	CVmkpWyY=; b=n3nZTmJTJ37SkU+MxrJ0gVK+RO8ZnnmVVJQatFRGOxfBTKtMcOo
	EDE+7d2VgKjTRyRHKk/AA8L++1521gHdWCKVXXl2SfNN77hCIGZX7GHacZ+A/n2g
	+TzAR29v0kvr5EeNYenFEjgM5qjF6Snc9Vp7awx1HrIFvZdVaNQAOaZ98XLSMhtJ
	2oOMIqU8/gGiJt9+tOPTK621WGguRK9dpQbaJPqwQjZZlWmLTIJDmYoPAysc3vUW
	mEhyzHZE8w3j16gVTgy8kHO4hVwbHatgGbwALbukq979xca5kIiPXvop9TucDFHw
	ZEw4bn4aPnf4HkH6u7dyvh/ZIKR9ncuZmzQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9324jamt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Wed, 01 Apr 2026 22:08:48 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c72849f648so1518286eec.0
        for <opensbi@lists.infradead.org>; Wed, 01 Apr 2026 15:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775081328; x=1775686128; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DIrymiB81twR4x/FCVxrvFw/QL1dKvV7GznCVmkpWyY=;
        b=I59f1UwLA1xB6kTkYpOktxrI3hnB9zHZOPy7zLmcRvdSdZhtjiNRMjbxnoOJ6vdcCS
         fuF7TAOUDuv0KAOaunmdoapnWWKMd3tDshQCUoz+owG0dJv96RZ0ZpRVeMZ9QLsi7x6L
         k0OfkeTKZUkpxhsVXY1w1JIAo9MhRCPCJfv4VMuv9KlXHr3QTULgbti31gGjNYSWtxPP
         axP0sTYux6CLQq03mPHvfPJc8Yd4UPJODo8FbCgfvbxec1TWoo4Jq7p8tNiY3e13QanB
         iFBeySWQ3CKSkDbT9mCmyodkGJgTs5Ud5YudDxdYGZeOa2igx0Tc6+iUNqRzWRTV8qf+
         Z7cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775081328; x=1775686128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DIrymiB81twR4x/FCVxrvFw/QL1dKvV7GznCVmkpWyY=;
        b=QATaCseIDwP9+SKAGCzRCYZs15sZQ74znf0kkxSKFo2v8u6SFVUE5HdJlv6h748/EN
         4UFxbHCoJ2geWnCtwYvuEIL5kJzTZ8L0Xt3qUaGM9VQHMZ675FsG2OmpLBl9Q8LxOLuZ
         ttTSmvwykHZ/1TbuyD3glXuxftTQMroclyxPDmnxSIF3MwwtGdGuRFk6IC6s1TfK5dlz
         Ck7g/bCKdZU2k7OoINNTu/QhM0tnsJLLyrXJ4D+L1b3ezmn27SZG4CMvcx/2bE2b/YzV
         bXW+CLpHnErlgZSXMgjddVy6m8YujCXLY5j9rzeqgdHNS+ic+/SdkuzBRLTyGLvy+Y+t
         BHqg==
X-Gm-Message-State: AOJu0Ywg7hZ/dKiO+y5fM8FNBE+rsf2jlmhiiAv0A5Ot7EIu5RV9SIDx
	OUOMbEMPY5ChGFEYjoMsvO078Izq0/m0CHdoYdS28wrrLY+Z//x6EN6202lWSun75y2AVWjXy2L
	Nt2bKcrNa17JnuBHgMllu6cDV8qcNGpv/4GHYoVHopDDA6WXYjEi2I5ZGvsfuBg5nrG4zMvd2Gg
	==
X-Gm-Gg: ATEYQzzXbJNdnBYLmkDap6Cc73kyEZ+jANgdB6en9QzFA2CQ6s/ARGbXFqShI6KyE/X
	bH/3A2+q5IXaekmppgEnubxbeaM/Fj01OCbqnXlEXJOd0xTv1Hk2yVyWRhaWCLC70Bu+uEybfxu
	vDRnkUlfj4nP+aYXUdOlBDv/WH/8W5uW4qsBSecg+s2iIIKBRiadLzWv8/Pv32ViVAa1KHL0XHx
	DUWPrryzuNQUwC4P9e/xKysI2FvQBz9CQMaM+5GBq+mmLZ0uBszJ8Gz0dA/ZalVLP5CjlFkMOjr
	iCm6U3YqdjN9QbqpLtXzomcvALQ23XUv+tOFGdEwi0KDx0xNQkpdm/Y71whjjo6xmLpZBVckvK0
	azwcsThY0hnLJqBHlviGYxeedxFL4ia4=
X-Received: by 2002:a05:7301:fa13:b0:2c0:dd10:bba7 with SMTP id 5a478bee46e88-2c931384317mr3210567eec.15.1775081327937;
        Wed, 01 Apr 2026 15:08:47 -0700 (PDT)
X-Received: by 2002:a05:7301:fa13:b0:2c0:dd10:bba7 with SMTP id 5a478bee46e88-2c931384317mr3210552eec.15.1775081327441;
        Wed, 01 Apr 2026 15:08:47 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7c20c0c2sm983781eec.17.2026.04.01.15.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 15:08:47 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: Anup Patel <anup.patel@oss.qualcomm.com>,
        Atish Patra <atish.patra@linux.dev>,
        Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>
Subject: [PATCH] lib: sbi: Fix hw a/d updating defaults
Date: Wed,  1 Apr 2026 17:08:45 -0500
Message-ID: <20260401220845.190680-1-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-GUID: 3rkAbsl_2aO-HzwOjvfbGS1tNkQGrAfn
X-Authority-Analysis: v=2.4 cv=TKBIilla c=1 sm=1 tr=0 ts=69cd9770 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=VsR4IX63El4WIFM1reQA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDIwOCBTYWx0ZWRfX9eMqHekPxEaS
 213WZCzNssgG4bVWxu2yrY5iDlsefahnOF9CfEM9cS1v3PQQS6bOT9C2be3n5UclxGtymi3Y/d7
 6Z0B0kcb/Tabl/8uMjvgEmxPn99jV+10/4jILFGP41SK+2lkdtJZLywC0kmo+1gehkFYLbGDVMA
 smlcVuZP/Vw8V5IiC7nOG7iLe0DQX+xscJ6ju5EJ1vYUIWcAhvm/kls88Qe7poX/Hq2AA+stVxy
 E6QdM47hjppHltvxl3iFFGjKPgG63+7iYvQDyerjl/jK6U4CvKp/I0D2zm3tfcV08cgLbdOxc1R
 JTAeG16i+rxjD2UUiXFX921gVuAeiHiUzEjnNTjN7he40/nfLw+8CJwoqtm9T+KtPbeTv6FCdQX
 OshaWzaSfbEREI6aqGXsuDmEI/B6ljVW22vOM7qfSSMUur/mknQxve2xEsUmLjEeyTlQvhCfCvp
 EzM1+ypjYpZ3FKbbUQA==
X-Proofpoint-ORIG-GUID: 3rkAbsl_2aO-HzwOjvfbGS1tNkQGrAfn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_230854_024899_E6DF713F 
X-CRM114-Status: GOOD (  16.77  )
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

The Svade dt-binding description states that Svadu should only
be enabled at boot time when only Svadu is present in the DT.
Ensure that's the case. Also, when only Svadu is supported,
disable FWFT.PTE_AD_HW_UPDATING, as we need both to support
toggling.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 lib/sbi/sbi_fwft.c | 10 +++++++++-
 lib/sbi/sbi_hart.c | 18 ++++++++++--------
 2 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/lib/sbi/sbi_fwft.c b/lib/sbi/sbi_fwft.c
index 373140b746bd..574b875e408d 100644
--- a/lib/sbi/sbi_fwft.c
+++ b/lib/sbi/sbi_fwft.c
@@ -160,8 +160,16 @@ static int fwft_get_double_trap(struct fwft_config *conf, unsigned long *value)
 
 static int fwft_adue_supported(struct fwft_config *conf)
 {
+	/*
+	 * FWFT.PTE_AD_HW_UPDATING is only supported when both Svade and Svadu
+	 * are supported. We need both in order to support toggling and to
+	 * ensure the reset value of zero is valid (it wouldn't be when only
+	 * Svadu is supported).
+	 */
 	if (!sbi_hart_has_extension(sbi_scratch_thishart_ptr(),
-				    SBI_HART_EXT_SVADU))
+				    SBI_HART_EXT_SVADU) ||
+	    !sbi_hart_has_extension(sbi_scratch_thishart_ptr(),
+				    SBI_HART_EXT_SVADE))
 		return SBI_ENOTSUPP;
 
 	return SBI_OK;
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 99e13990aa60..0df11d0d1029 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -137,6 +137,9 @@ static void mstatus_init(struct sbi_scratch *scratch)
 	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_12) {
 		menvcfg_val = csr_read64(CSR_MENVCFG);
 
+		/* Disable HW A/D updating by default */
+		menvcfg_val &= ~ENVCFG_ADUE;
+
 		/* Disable double trap by default */
 		menvcfg_val &= ~ENVCFG_DTE;
 
@@ -158,18 +161,17 @@ static void mstatus_init(struct sbi_scratch *scratch)
 #endif
 		__set_menvcfg_ext(SBI_HART_EXT_SSTC, ENVCFG_STCE)
 		__set_menvcfg_ext(SBI_HART_EXT_SMCDELEG, ENVCFG_CDE);
-		__set_menvcfg_ext(SBI_HART_EXT_SVADU, ENVCFG_ADUE);
-
-#undef __set_menvcfg_ext
 
 		/*
-		 * When both Svade and Svadu are present in DT, the default scheme for managing
-		 * the PTE A/D bits should use Svade. Check Svadu before Svade extension to ensure
-		 * that the ADUE bit is cleared when the Svade support are specified.
+		 * Assume only Svadu is supported when it is the only extension
+		 * present in the ISA string. Svade is assumed when neither are
+		 * present. When both are present we must default to Svade (see
+		 * the zero reset value of FWFT.PTE_AD_HW_UPDATING).
 		 */
+		if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SVADE))
+			__set_menvcfg_ext(SBI_HART_EXT_SVADU, ENVCFG_ADUE);
 
-		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SVADE))
-			menvcfg_val &= ~ENVCFG_ADUE;
+#undef __set_menvcfg_ext
 
 		csr_write64(CSR_MENVCFG, menvcfg_val);
 
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
