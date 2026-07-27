Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15834C54EFC
	for <opensbi@archiver.kernel.org>; Mon, 27 Jul 2026 13:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J+GOXzBky5hvimeVJ+86HplnxVvQfcBnXbVzUXI6iHc=; b=MCn056Yx6VUo9G
	b+VYYZd+ozNyQVwdWEwClbdVPaFg8hWTaLJ9bp3kGB4atOfa25vjTbDnfefaYPaYfxqQVcBpZTwp4
	uwy8WMIFIvPm6hNfXpppJ6Q2g3qdVajPapD60apSU91XZ5L1UK8KU2F/MLk/421aHtI3Vg7C1nRT7
	qnP/LhWgBLOEIggRObGiuLpUR9nxc4RwYQpCS21gEEE5K1vpAajdslOqjPAsDGEna/JUoRmdUkJoO
	ABi68OlyHPbiodJ9Ol0KPgZtHkJKe9ug43J4n/Q2Sqx9760daWGjNkAAA0zH1/m5rKjPD52JrjgSc
	rzmK004graSzONY4loIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLoi-00000002ujn-2WL5;
	Mon, 27 Jul 2026 13:56:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLof-00000002ugt-2SpN
	for opensbi@lists.infradead.org;
	Mon, 27 Jul 2026 13:56:27 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlXIQ855714
	for <opensbi@lists.infradead.org>; Mon, 27 Jul 2026 13:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=w+KZBGYEdWN
	DNVHqQLtKSWoQ1HhlZcaEmmKzde2/8F0=; b=j4MnWy7TpuqcNgEo/N66SIwItbn
	VDUwJQ50l5Sm+bMLf6lCkvsJGEFbV55YFvvkRmZ0YslUSEEF6L+BCPbb+hSs/6n1
	XlGHipS77maEoDYE1S0Dgilm5JN10AvVROLVtF1z5a+aDelUVHUa5Yz/EmwAHEnr
	B7PSg+tTaq641QRd713BRvfvBGb7abWImPlU9Qc+tKSiNvI373W5Pnvmwj2nheyR
	0xGyPSfX0WpYl7azXCIKJS8smugtq3JYAt8v4sRQTclHA8DPpyIEola79by1pnk4
	+aqNp0N93n6uAnhiKlE7X5sSTMkOlF85y32xKizKuuX99Sobl1QLP2ffkCQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fny9wj8af-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 27 Jul 2026 13:56:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc88e22f92so64411615ad.1
        for <opensbi@lists.infradead.org>; Mon, 27 Jul 2026 06:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785160584; x=1785765384; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w+KZBGYEdWNDNVHqQLtKSWoQ1HhlZcaEmmKzde2/8F0=;
        b=i2iZZQ/bxWIVMWhAWlOrtUs34GT4j/6s8SA7YlQdt34j3SOtwdtlf/27sKbYRAySkr
         Pj1liV1KhuygNV8VimNzzOmzOFsbeMsoHGWUWa57Kddsz6gx2NQJ8dbyWGMSEbvRYm/7
         /pTxNVYgsMYS5/8ZamRsfaie3OwWHnEio5zchLcKN+KrkI6A2jctni6kQs2Dcc+uCQEZ
         debPTrGa55ZIiO4HYOfT4bINjK0+QOJ1lnsu6VWmW90Jgr6nNWVsNK4P9GhbNvHFGAdI
         ySI7AUIAKv6ga7O9LsRt5N3DjHgKF6VfhRjbqMSC1MYWbd4ykCRBWGzA3r59mtiyLmRb
         cM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785160584; x=1785765384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w+KZBGYEdWNDNVHqQLtKSWoQ1HhlZcaEmmKzde2/8F0=;
        b=O8RWlaM18oRIJk17TEKiHfxMtk5GjB6/MSmazBiXTyuRRRW8bKBWfiX8Z9sCGKOf7s
         FKrEL9Ek1LNLwtVqgtN2y+ROvjKZVcMNgPtrChJG/1/N/JtRk3BH9MNIdI3lBJu3k9rU
         ilZQSSlAvf7n5Ac1/MKvGzPWjCbu/rzZ/6DeYksYTByOY13qy1C5YJIqgHxiattqqbiW
         S8eRm71hFKrIWIJWWuQzzeWuYBT5PFZ9WWi7LCciCn45LaNacZ/Ox9mm6z5AafbdUoIJ
         gfiA5Q3vG9AfcKvgahyI6lVFBT9gsQuo/DH58u6wXs9pX+SaJZ0TU/HQzobHzHEdN6EA
         MBFA==
X-Gm-Message-State: AOJu0Yzjy0qdEDeGjrEEl9x3FYRMvKJYv9HgbDS3k9LO6U5C5D/NyIPI
	DtTNVob+koSbe+MwwmzvKQRQZvkogbzrGjNOw9JcoVQqpvpp0+jKSBXeSFl/6guhsV1gSm2Z5IQ
	CUm43buhcG938NPuxHY4uLSIX5FC8ecviYnyhmAvDqrq3xvkP0BVpjwOiCmN98pxS1R+1fKgZWg
	==
X-Gm-Gg: AR+sD13huQNSLLVNqdoGTX0Zkgs6XJiqOerHOPPmFPzOdZhNA8WhSWqYyzNjcBBh4Ri
	V+rVmTiluQXYpN0zyU3cgj9lVS0irpovxT1MfR2nNre4ZzqLQYZ0rvb025Ltkq6FY7lnweUe6Th
	j8RCKJEiEcW7+N1jI8g+n25MdCz9p+9g/7QBK163Rv28KaIVJmgkIO44c4QncAtRubCe4ftLZKI
	ABnmpZ6uFcHjVPoT5LZsXKjz/jm/ZMjfVpG/sZh/ePDMPaW6a7XBILSPXmR1LpqDw45hbmK0tcz
	EG2cMeRfoeY1HFVVU7XOEYFROvbFOx7xR82XXcw1tSTAEjnr80RAU5DjVC3BAyQXqM4+OyjAMMr
	EnWWKsrThWn+Mf0m7SrPLRzpPdFot9VbEXw2HiGq6ripT4MO3T2kXFtCSrj/G2Y8RknzDcWFPyf
	q/p/yRXRNX+fQM8QMRiZ7r
X-Received: by 2002:a05:6a21:6004:b0:3c3:bb40:790 with SMTP id adf61e73a8af0-3c67e15a4abmr8411384637.66.1785160584279;
        Mon, 27 Jul 2026 06:56:24 -0700 (PDT)
X-Received: by 2002:a05:6a21:6004:b0:3c3:bb40:790 with SMTP id adf61e73a8af0-3c67e15a4abmr8411346637.66.1785160583733;
        Mon, 27 Jul 2026 06:56:23 -0700 (PDT)
Received: from hu-rahupath-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc593b57sm47067658eec.25.2026.07.27.06.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 06:56:22 -0700 (PDT)
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: rahul.pathak@oss.qualcomm.com, rahul@summations.net
Subject: [RFC PATCH v2 5/5] sbi: init: Print supervisor domains at boot
Date: Mon, 27 Jul 2026 19:26:03 +0530
Message-ID: <20260727135605.465309-6-rahul.pathak@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727135605.465309-1-rahul.pathak@oss.qualcomm.com>
References: <20260727135605.465309-1-rahul.pathak@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzMyBTYWx0ZWRfX0Vec1lWV9eo6
 XQ0+/iHJjBO+XNpPZ0xbZq4ReEykZBWFTW9E33nSbvraYWifOv8kTQBdOz+CQ5OGlwsU2UG2NiL
 NfPvTDOe6KJ6FDHxU8x//Hxcjr3aOGh2qini/AMoqwFQR77g6cjgdJ/t8/+9xKvhfu8+sZQ4DWx
 h2obXZHopytdP9nqfNI0YUv/4+o/YoRArGx/KyMVIoh51A4kRGDMmSBuDyR6soi1MnrZcpcWJ2i
 rdCqeipfiIDBXNhx5xk4PDDqBdtT8T+0xADPrUMMWqrWEtXPmwqV0oQdtyIbc9mQf4H/vuk0irv
 s8rFFGKcPYQzx37E6z9v7eBwyKtIqVkxT5ENCiD2B//bLwPGdUTBq4n2EMCx9ccIsBEPVqITZOE
 0np6fB+OlQIGVc4DnfvMGUvdEFyRD9PWen7QtU4shUeC0EGfYwwKGWYyhMNaAWGw+dpqHVTM5rI
 i3BvhgN0BUvVlyo25gA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzMyBTYWx0ZWRfX+AAWHV0BLb4b
 BlfnapmcUF1wamQBS8iLmwaCjkmvcJVe0AbOx4RoGyEIE56nfhPWb+IGbqnnuwJrTMMEjdRa1vM
 KXVcO9bMjXkn/AVYxVKFe9hyXc2rIzk=
X-Proofpoint-ORIG-GUID: yOZc02-FyA3kQ23WhinZrE6QLL7dPUVC
X-Authority-Analysis: v=2.4 cv=E4b9Y6dl c=1 sm=1 tr=0 ts=6a676389 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=K4ympkDPe7tnraVRMg0A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: yOZc02-FyA3kQ23WhinZrE6QLL7dPUVC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_065626_650235_7A9EFFF5 
X-CRM114-Status: GOOD (  11.73  )
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

Print the configured supervisor domains alongside the existing domain
details during boot.

Signed-off-by: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
---
 lib/sbi/sbi_init.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 9bb1a37e..86a05ac6 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -35,6 +35,7 @@
 #include <sbi/sbi_tlb.h>
 #include <sbi/sbi_version.h>
 #include <sbi/sbi_unit_test.h>
+#include <sbi/sbi_mpt.h>
 
 #define BANNER                                              \
 	"   ____                    _____ ____ _____\n"     \
@@ -162,6 +163,9 @@ static void sbi_boot_print_domains(struct sbi_scratch *scratch)
 
 	/* Domain details */
 	sbi_domain_dump_all("        ");
+
+	/* Print Supervisor Domains */
+	sbi_mpt_dump();
 }
 
 static void sbi_boot_print_hart(struct sbi_scratch *scratch, u32 hartid)
-- 
2.51.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
