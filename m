Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9060CC5B572
	for <opensbi@archiver.kernel.org>; Mon, 17 Aug 2026 16:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G7HHmZX6H/iRWfJ2S8JmmFo109QQFpbXaeR+7NvA++w=; b=iw8q+3pz2ku6IQ
	6kSHp3KQFIERd4e6oncvRH+V/pdYZ3zg3tJfygsmZhRCBZ8EMU3hq71TkBAyfWs6/LWFaAuodGM7U
	3Kwg+hgrcSDs5k8JgquM3Uz62JKmhdPxieBJDVuTzEbQNYoNiTqJrpld/ab4MfsOoJEICcFMRkXFA
	hTRqp9bCRcwYXlwePhQOROOJvVznsDneBvqSfTjac95h7JOMHHca86zyiFKQGphp5eOcrHAZbxiLe
	fI+haT83iLzTUH4SX3MlG/AW3VMOBmvePsLK5NseDsgzEAnJEWqRUFh1CIbw7lv8wYF+bhwHcLJ4R
	SrA4khQzn0JTL3FG4kxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvzlj-00000006StJ-1weN;
	Mon, 17 Aug 2026 16:00:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvzlE-00000006Srs-3a4L
	for opensbi@lists.infradead.org;
	Mon, 17 Aug 2026 16:00:58 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HFYbeU3790455
	for <opensbi@lists.infradead.org>; Mon, 17 Aug 2026 16:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oPI5+vEvCF/
	xDilnwnbck0qOqVBvb+OjAtyfTYlFUFU=; b=cjTLdLx3sZ75Qpj+1eKoxj/OH4u
	DqOWNY1tQo2T+pKK6fjWDwMlp4y5zHZ743ix8Ax2UCI4X0zy6gSfqXiRK6YL95kz
	M8/pkm+sbxG1GFyGApsHGl2uEs9MNSDgX/lwuwtNtoDiUz3F98k1mlDqL3mGaDB2
	IdROKuWFGCU0B2llEO35c/nNeGWCsbxvXjmTuAP4mr2sTxtVeUIT1pa055Se+kpG
	2AoNhmxAbDkRzl/JJLmBusZFDo2NZ9JH5ecDk9RSA9YXAWEDBjcHUVFpwsalsbO+
	ht20BsoW2mWUoZkA50VPPCkLZEe38pX7BDstCKqyqTadfdwj6ACsXvx8Y1w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3y7ksnf9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 17 Aug 2026 16:00:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e25e4b41cso3819802a91.0
        for <opensbi@lists.infradead.org>; Mon, 17 Aug 2026 09:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786982428; x=1787587228; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oPI5+vEvCF/xDilnwnbck0qOqVBvb+OjAtyfTYlFUFU=;
        b=KmEW90pXMLdbp19E5gMUsUs2nYw6MBPbY/F2NN4c4N0+4a044i67vxGYm+ONndqKLK
         jqfGz6GWEr5sAAOmFXrNOT/j1Db1Auv7dZXGd0NRFNH96SzjgKjtlQXz6wkhDhL9kCMp
         L4sEevZQIRIehWKLUvI5vTqfxmv4FZ78mC6a1iGy9y20cXdKlzwLI3XSoGEcwzVI4i/s
         4fhijJ21ha6oRC4RDkkRQpbcva7/pIRi6qdB3hN5ToR1HXPwWVDVUJoYvKALta0hMj5j
         lrntwtmmJhj4gYSRe7dR1j9fzVUgc6i3bM95HZQicpQkjPLhWbjyyXyxEI58E2NR4euj
         3rzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786982428; x=1787587228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oPI5+vEvCF/xDilnwnbck0qOqVBvb+OjAtyfTYlFUFU=;
        b=tOPtsVvNgkudX+wchJpNDW9DqyLyDvlmn78d13va1u6KvjDKwIYNLEEpk1aF84ZI6o
         BdXl/Yf0/G8Mjd6Wzvfbb6mETs87a5WK8+xMrfcVOyMbaxxGcShGlMVqpN9Od6keOczp
         yab4Y6y74SzUcrvy45pEaiQ+uh5+pq4uoJ+qAqI13AzyFyAaexHlykNlp9DRLfBh7iri
         DiENFdY1QVRsopT9m11ygQL05MJ+gfy89LRLrbnVyGZk8z4Ozgz5GWmACzRCU1JgCm9i
         Uhr1qxocKLWh+wvL59l3/AISB3Z0ImlKbdQqfmfpd5YHtHT0ayQM2NTStt4nLd4Ku1SW
         ghEA==
X-Forwarded-Encrypted: i=1; AHgh+RrXNr5KEpPWt63SPa8HY1sUGrxzDS+Ime5A6E1K8ZV/G5ISs8INtJhp1RzomoFDcvEeciUWBDUY@lists.infradead.org
X-Gm-Message-State: AOJu0YyTsf70QS22gRxILKDAgoAYlT8hNrgWhGEU4HhDun+CdJW5QAAE
	zqf4IhKFC+yc4Dn8409I9IfKd3AfTq8D0if8mYzBE0Af5qfl/KsnaqZQN4ZK1ng2fVOuHwnLYOo
	6PTVIoL8jOO/d/vHFE+WKEMZBMsHe6f53uIPWwYxWKOb60dTasDl1vqBcwlpNVjr6unFvGGIe6Q
	==
X-Gm-Gg: AR+sD126XuhLH0+51IsfQOAdfWjvmWHhJ3ja6MDcXLZ6qDM65/Gh1mEXmqTtj9pRUpO
	SQvb1ZT+4zQkUA3FRr2wZwYXf8muTY/EZ6f6gGQEvYQBPRgEi4DONXD4VkUsqoWqSyyI8VtgcxF
	IBCJ2Xt+4+s+Z7C9l4h5QoryH6gUoKnhsYyWT2Xc0GrouHx6ysg0tM4Fm7PpNaSII6n6a4GE7FU
	QQV9i4AF24+SmQjNgVWsQdlliiwN6fUj+KiQNuSk/cmdh7PyaUk/Gw2YirXyHL3+Gt2ljSKGWek
	3b9eeVAvYp76oQjBIEHaWGGVCQNw0+WcMZyNfO+x4Gz4Tlqcib2LDY/hxliAWJo8WNxKQtS6Pwu
	oI1uXijInYaETf3IrtIwIdgCG77e6NvK7zmooBxeanhx+S+BqJAwmw5OjaX91wBWd2vW1Yh29wq
	YckzRhzN+j7AnWHc01XWCBPNN7oQ==
X-Received: by 2002:a17:90b:2b8f:b0:38f:7f60:ba35 with SMTP id 98e67ed59e1d1-3933cadeefdmr27487573a91.5.1786982427428;
        Mon, 17 Aug 2026 09:00:27 -0700 (PDT)
X-Received: by 2002:a17:90b:2b8f:b0:38f:7f60:ba35 with SMTP id 98e67ed59e1d1-3933cadeefdmr27487460a91.5.1786982426699;
        Mon, 17 Aug 2026 09:00:26 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-39531cc6a3dsm5549033a91.0.2026.08.17.09.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 09:00:26 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Anup Patel <anup@brainfault.org>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        opensbi@lists.infradead.org
Subject: [RFC PATCH 1/1] lib/sbi: Enable menvcfg.CDE for Sspesa
Date: Mon, 17 Aug 2026 21:30:01 +0530
Message-ID: <20260817160006.3310109-2-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817160006.3310109-1-mayuresh.chitale@oss.qualcomm.com>
References: <20260817160006.3310109-1-mayuresh.chitale@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: XjWFI2BjCUtAHjns2PABKeMjndXqSKgt
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEyMiBTYWx0ZWRfX9GCqBxY48fDa
 KXGbdDM8dNegffE7nOvPPPrRhWlxV0DUnoy9cvxOUkvA317Ixuo7udQKLqGUFffngjevGOyu3OE
 fycMmdhNAT7QuaJsOqNDrxctTe+kqqU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEyMiBTYWx0ZWRfX0SsA96UdH5+h
 qJqBepXSYGj5pKKTRBqW7dC6CujsUXfBbuqDqDKWPPWJ7EZyHnqRXOoEH1rt3l6yXr4Oujpnzhk
 FT6NBDNpKHv1WxrjUhdJ5SrWCd5yAPuW2PcdZ08YDJYLVBKHcexeLZ52KOD28rR2v/xr/MSWxpE
 ogSSqqgUf7LdDz37VX3pRmhURk4qiKW45Gsy7Hj9MGaTMNDSDUicnWQYaDxjpf5/xs41XRkE4DD
 6B5nVeTXz3SjgYR7tNv5pjVzI6Q8AoJfFimLwk+9wkFOKBvlrL7R9xFONXaMSXWqn56kyYzkQ0j
 Q1jq12ktmkKi23vTK6Q7tJ461fqs2NqTgxWYfQ7bLGHCLU5heJp7cAg2ybdx3eTLOJORs9e9aAw
 QqYbXygkpykBlsgmHEVbso2RUzm5wMHhKJpQuUf4iaJklRCuW/WSXeYmD+Yqr6vF1JKSdOYi67m
 X2lgyituQA01Ol6g1SA==
X-Authority-Analysis: v=2.4 cv=HYEkiCE8 c=1 sm=1 tr=0 ts=6a83301c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=57A9Spic5pfsHI4xC54A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: XjWFI2BjCUtAHjns2PABKeMjndXqSKgt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0
 spamscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_090028_896573_DB1BF185 
X-CRM114-Status: GOOD (  13.58  )
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

The Sspesa (Precise Event Sample Attribution) extension exposes the
shpmspc and shpmsdata CSRs and S-mode access to these CSRs is gated by
menvcfg.CDE. Hence set menvcfg.CDE when Sspesa is enabled.

Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 include/sbi/riscv_encoding.h | 4 ++++
 include/sbi/sbi_hart.h       | 2 ++
 lib/sbi/sbi_hart.c           | 7 ++++++-
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index ffe7666c..12cc0b0c 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -751,6 +751,10 @@
 /* Counter Overflow CSR */
 #define CSR_SCOUNTOVF			0xda0
 
+/* Temporary addresses for Sspesa (Precise Event Sample Attribution) CSRs. */
+#define CSR_SHPMSPC			0x5d0
+#define CSR_SHPMSDATA			0x5d1
+
 /* Debug/Trace Registers */
 #define CSR_TSELECT			0x7a0
 #define CSR_TDATA1			0x7a1
diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 543393bb..2abdc504 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -95,6 +95,8 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_F,
 	/** Hart has D extension */
 	SBI_HART_EXT_D,
+	/** Hart has Sspesa extension */
+	SBI_HART_EXT_SSPESA,
 
 	/** Maximum index of Hart extension */
 	SBI_HART_EXT_MAX,
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index bee88557..783a0773 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -160,7 +160,8 @@ static void mstatus_init(struct sbi_scratch *scratch)
 		__set_menvcfg_ext(SBI_HART_EXT_SVPBMT, ENVCFG_PBMTE)
 #endif
 		__set_menvcfg_ext(SBI_HART_EXT_SSTC, ENVCFG_STCE)
-		__set_menvcfg_ext(SBI_HART_EXT_SMCDELEG, ENVCFG_CDE);
+		__set_menvcfg_ext(SBI_HART_EXT_SMCDELEG, ENVCFG_CDE)
+		__set_menvcfg_ext(SBI_HART_EXT_SSPESA, ENVCFG_CDE);
 
 		/*
 		 * Assume only Svadu is supported when it is the only extension
@@ -360,6 +361,7 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
 	__SBI_HART_EXT_DATA(v, SBI_HART_EXT_V),
 	__SBI_HART_EXT_DATA(f, SBI_HART_EXT_F),
 	__SBI_HART_EXT_DATA(d, SBI_HART_EXT_D),
+	__SBI_HART_EXT_DATA(sspesa, SBI_HART_EXT_SSPESA),
 };
 
 _Static_assert(SBI_HART_EXT_MAX == array_size(sbi_hart_ext),
@@ -629,6 +631,9 @@ __pmp_skip:
 	/* Detect if hart supports sscofpmf */
 	__check_ext_csr(SBI_HART_PRIV_VER_1_11,
 			CSR_SCOUNTOVF, SBI_HART_EXT_SSCOFPMF);
+	/* Detect if hart supports Sspesa (precise sample attribution) */
+	__check_ext_csr(SBI_HART_PRIV_VER_1_12,
+			CSR_SHPMSPC, SBI_HART_EXT_SSPESA);
 	/* Detect if hart has AIA local interrupt CSRs */
 	__check_ext_csr(SBI_HART_PRIV_VER_UNKNOWN,
 			CSR_MTOPI, SBI_HART_EXT_SMAIA);
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
