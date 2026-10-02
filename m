Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC5EACA5FC4
	for <opensbi@archiver.kernel.org>; Fri,  2 Oct 2026 08:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DK7aphb7d46bo7K4x9DnCUG7+/TEdwBNZaOxiZn3sqo=; b=xAGAT1yeDIti8K
	O7t9CZyxSKjKIZa+hNtlD2hoOG6W2DYAw1YG2vAfChk4bbjSTJIPYGijDn2s68FH4/1X+RMHpFpIW
	l0aydliJA0BTkiFd/0u/GEJkrBw/Y+D+RtxEkK7vhRgHJmfxlMTwFP2wm3Y9mMqWATJgguoK1KKsh
	KzpiI5jYZxnXto4kVb6JrR+QRT4f/OlTCJJQcEPOJbJtItq6fRqcMpwdiYm2/TF9sy/DB8CYgYY5G
	Opp1N49KlTUfakov0njr8P2x0m5ukJclBhVOFxxlWvbMKF0w0hIkEupYxQaPzLpjzieIICQ6XVw0x
	Tjg2R0preRrLTAqNirkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYfW-0000000AzLp-1pPK;
	Fri, 02 Oct 2026 08:31:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYfR-0000000AzK3-3s9Z
	for opensbi@lists.infradead.org;
	Fri, 02 Oct 2026 08:31:00 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6925j8Ji673017
	for <opensbi@lists.infradead.org>; Fri, 2 Oct 2026 08:30:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YrQiWGAjwaX
	96rfPUtJXRX9iYCOfcMUgjQ6y0NinGcU=; b=XsrnAfkm3w4hwvNy21GMTxKxD6p
	W3cDEmcLpac0yme/tqo7Rv+rzqdogRtuuxSEoG8JLusJeXNTUg0JP1bbJLvCcsYC
	LQ/ow3hWzuD1WFvO3QQeKV+39x4mdI4373k2tP0fy1b2F1TZ2H5Kd5hqCALgarg9
	85FxtGzvEIIFx2SQVh09fSK7SaCRQlPTPOjhVzl2qYdHwJN91MSKKqptCsPYvZmb
	yiY3yD+tngOSeHRMWgFAlPFRpen2K77arJArXKKGdeB5rbG79g0FoCfCOUK8LDDc
	Yfz1Qfa2ZiU/iFtrn+e0evEkmSRLaRDGJCpTgfiaqzD7UNkaVGVQLo+VrMQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1w8tjac3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Fri, 02 Oct 2026 08:30:57 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34e676375d9so1261672eec.0
        for <opensbi@lists.infradead.org>; Fri, 02 Oct 2026 01:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790929857; x=1791534657; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YrQiWGAjwaX96rfPUtJXRX9iYCOfcMUgjQ6y0NinGcU=;
        b=B0MEv0GY/lTOS63RdLChvcDJi440sgUeypJxZtnOSafbz7zn45vnF7RCRBpAn5GiBW
         s+IV3h3tFzg7dfvbBco0FGPbnShFuHGV3Bv9uIidcQ9PhSJr/1Zo9pOD/URSZTeavC24
         NGwt3SJUgZOtY3bVo9BQc7YMuU7hUo7uTkd8nQoWBk3eZboiZPT2FkdmNpa8ulckSwJ1
         dWElsBj0G5wQ5S1VXbXSkZ9NHuR6gK+9+Vo4/WBHlGWbB2MefWOcv+1mt4y7eklQFRS/
         riRD9MFkiXQbHoj9/GoLyvVwh7mTE+mriL5njRrKnJIVsK7ZJrz/qHgapHgC6N20EQZu
         dSJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929857; x=1791534657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YrQiWGAjwaX96rfPUtJXRX9iYCOfcMUgjQ6y0NinGcU=;
        b=jAjZ5LashZDADE3FG8yl9xffKFEHxvWVrQtJb5yHc3UgTUqC+uWuTVg1zBRAeDkIM3
         ZLjqCQz7kNZw77J2GQ/BsEruNNgK2gKB3kffw5RG3sptzqi+eO4xL63V7tglYs4uioSt
         8+Ns1sjiR1onLeIzwt0OOSwhAbS0Ol4hi/Nb6Nq/Eyf4YGqyLRd5W8VZ59+CAxObyyT9
         cVoH2IA92n3TC2jt7wxdbCDaLSHXPJG9Chw2de38CbCchd4xdANKBVvlfRUpzre5rTa6
         q8LxWUgVdoPLxnhBosRVBftvpbeEc4xKJCqMBoDkn36bsi3QvoLCdSSMQqQn1rYyrNf5
         1Yrg==
X-Gm-Message-State: AFq9FYK4lL0Iy6TZCYih2WYQfp4A0PdXxl8e/0BM+G4UdSDeN+jKQ+Cj
	36tZMuJvY4GdQkkLmPYSq7aolxB84TW5vh3fBmmARX93ka6lZuaaIFk0mlOqMYPaCjJbSQfSS5B
	x7y5SV4Iex8YfvUqeki4H9t9Xn9mnZbq5dxHGnlxhrI1rpQU0EyEtH4L0/SFnpATu4g==
X-Gm-Gg: AYBFou1FlcqxPvMwRMQriQXgQeJZ7MB7JhEoPWEp8B0BM1dbprqwvqBvaaTBX9fs6GB
	fNQKGjdB+k2Gtk1MWoQ5yT2yu8i4zpG7nLKlF7SFs6HXoh9UmkXAbaIiBM/JBoKuvzGclErAZiH
	WEAt2rbMYGDGduaD/k1whoU1LfuVpz/euvMDYfIVBI/r2H+mSVNO47VDv4OBxIEU3WYsXpiihQv
	xr/o0wsnVasfanUHsDnVUmgnRJhgYIyNtQuJRRGlBeTVKLUU05o5LsjQTh9k57luOcUmJwW1jWe
	eh12fsHBvOqYZWQ2VFBy0XrUxcjovy8x25tg1eXQPSQ3Gid3LChfD8d1gGjHM7d8/On8kZ3XHKP
	3uq9D9CvtE978U9ZSODSnNxREI8flzT6xYgdGPjVmHSryyHzDsJe6fC3Sgp5seUE3DEkpc/4B+u
	ePBCWpovscEAye
X-Received: by 2002:a05:693c:8641:20b0:342:890a:4088 with SMTP id 5a478bee46e88-34db1376d7cmr5860476eec.2.1790929856724;
        Fri, 02 Oct 2026 01:30:56 -0700 (PDT)
X-Received: by 2002:a05:693c:8641:20b0:342:890a:4088 with SMTP id 5a478bee46e88-34db1376d7cmr5860441eec.2.1790929856065;
        Fri, 02 Oct 2026 01:30:56 -0700 (PDT)
Received: from hu-prajn-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f067301b5sm5208850eec.1.2026.10.02.01.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 01:30:55 -0700 (PDT)
From: Prajwal N <prajwal.n@oss.qualcomm.com>
To: anup@brainfault.org
Cc: opensbi@lists.infradead.org, prajwal.n.oss@gmail.com,
        Prajwal N <prajwal.n@oss.qualcomm.com>
Subject: [PATCH 2/4] include: sbi: Add SBI watchdog extension definitions
Date: Fri,  2 Oct 2026 14:00:38 +0530
Message-ID: <20261002083040.2533097-3-prajwal.n@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002083040.2533097-1-prajwal.n@oss.qualcomm.com>
References: <20261002083040.2533097-1-prajwal.n@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: ZNW5encXO_b1tcncACF-DApWuM74JewQ
X-Authority-Analysis: v=2.4 cv=ML/1C8Zl c=1 sm=1 tr=0 ts=6abf6bc1 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=k1SuS2GwAr6InA9BYjUA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzMyBTYWx0ZWRfXz7yBtrgQyQNM
 7N0szgXQr1VPplqrh+U+XnSlykrhfKq8KgFqfeb3NxS3fi5yhD+OfFPuprib5OwIkoRjglGbAif
 mnujaBkvNgd0sigJ1WDfrQSeWmP1qtafZsWMzg/1oICaygHKaOZGI406M1rkXMMPtYcx9V3EJnI
 JscULVhYMNIAh+yRgMUkHavWmCc9Uz1mkEnvTfVCeBTASp3YjtQCUt3iLEs4aC+t2Fh5527JrFl
 4RbVlP9rSfop31jzOpNdGLZXMIj3BFTaMGhd38UhaKR9moWappfVCjt6F2ZJkzdOH0C/1NGANMj
 eLsEkLUUAu+/b0+mfywzYAK5g8NGNrEXnw6oIRRFOcOmRSuoRu1vrSHa8vaO9Re6HoSUmUWbKpo
 xwOWkW3Id07rIN/iNMdTdpTAZYUPb1Mvgt9zbJCCPUTbbScfo6/purwtlRmprxFtkh4KYqgCrvt
 eydT7Hpp85zOi7+pXxQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzMyBTYWx0ZWRfX3hyFG5X0H9ld
 kA7nISEMIBbXKlh/yAUKg0kKRtbSneKXP8CCbBAqUY58f5vLv7dtTdhPRD5wPPK8A5cnr5B8Efp
 pAvKlKx123WuoakS08EIkVeRYMdemQU=
X-Proofpoint-ORIG-GUID: ZNW5encXO_b1tcncACF-DApWuM74JewQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_013059_392678_CAECA18C 
X-CRM114-Status: GOOD (  11.33  )
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

Add the SBI watchdog extension ID and function IDs
for supported operations, including start, stop, pat,
and attribute read and write.

Define the attribute IDs exposed by the SBI watchdog
extension, including watchdog capabilities such as
MSI support and configurable watchdog parameters.

Signed-off-by: Prajwal N <prajwal.n@oss.qualcomm.com>
---
 include/sbi/sbi_ecall_interface.h | 33 +++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
index fd4e77ca..338395fb 100644
--- a/include/sbi/sbi_ecall_interface.h
+++ b/include/sbi/sbi_ecall_interface.h
@@ -38,6 +38,7 @@
 #define SBI_EXT_SSE				0x535345
 #define SBI_EXT_FWFT				0x46574654
 #define SBI_EXT_MPXY				0x4D505859
+#define SBI_EXT_WDT				0x574454
 
 /* SBI function IDs for BASE extension*/
 #define SBI_EXT_BASE_GET_SPEC_VERSION		0x0
@@ -492,6 +493,38 @@ enum sbi_sse_state {
 #define SBI_MPXY_NOTIF_HDR_LOST_OFFSET		0x08
 #define SBI_MPXY_NOTIF_HDR_RESERVED_OFFSET	0x0C
 
+/* SBI function IDs for WDT extension */
+#define SBI_EXT_WATCHDOG_READ_ATTRIBUTE			0x0
+#define SBI_EXT_WATCHDOG_WRITE_ATTRIBUTE		0x1
+#define SBI_EXT_WATCHDOG_WRITE_NOTIF_MSI_MESSAGE	0x2
+#define SBI_EXT_WATCHDOG_START				0x3
+#define SBI_EXT_WATCHDOG_STOP				0x4
+#define SBI_EXT_WATCHDOG_PAT				0x5
+
+/* SBI WDT Attributes. */
+enum sbi_wdt_attr_id {
+	/* MSI and SSE capability flags */
+	SBI_WDT_CAPABILITY		= 0x00000000,
+	/* Watchdog state */
+	SBI_WDT_STATE			= 0x00000001,
+	/* Minimum watchdog timeout supported in us */
+	SBI_WDT_MIN_PERIOD		= 0x00000002,
+	/* Watchdog timeout period in us */
+	SBI_WDT_PERIOD			= 0x00000003,
+	/* Time left until watchdog expiry in us */
+	SBI_WDT_TIME_LEFT		= 0x00000004,
+	/* Watchdog pretimeout in us */
+	SBI_WDT_NOTIF_TIME		= 0x00000005,
+	/* MSI target address low 32-bit */
+	SBI_WDT_NOTIF_MSI_ADDR_LOW	= 0x00000006,
+	/* MSI target address high 32-bit */
+	SBI_WDT_NOTIF_MSI_ADDR_HIGH	= 0x00000007,
+	/* MSI data */
+	SBI_WDT_NOTIF_MSI_DATA		= 0x00000008,
+	SBI_WDT_ATTR_MAX		= 0x00000009,
+	SBI_WDT_ATTR_RESERVED_MAX	= 0xFFFFFFFF
+};
+
 /* SBI base specification related macros */
 #define SBI_SPEC_VERSION_MAJOR_OFFSET		24
 #define SBI_SPEC_VERSION_MAJOR_MASK		0x7f
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
