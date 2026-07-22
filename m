Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA21C4452D
	for <opensbi@archiver.kernel.org>; Wed, 22 Jul 2026 03:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J+GOXzBky5hvimeVJ+86HplnxVvQfcBnXbVzUXI6iHc=; b=wyDGuig1qZZ3Ih
	qxioUTYZkpbJ6vY7cJ7V7TNwYmsdQI3A/1vza8AdFWJnP8P1JiVjPD1MUJrgDQO4WKgRcsJRt03yU
	1I4G3uDIvbx2ZZRoZpOR3uCwve5eKmKYCvel00u0eCscSBmw7Otll8oFiXX+S5P/qsKC97dvUU3Hd
	36M2OG6VF1fn2zJK4L36hDijpnIhJybfvVUf17BRNFb5w+LrodIN1vPpl/pZUpVY999JhFSL+10tW
	TUHsxop4omy7ece6YPwe1r3L9c/ZjKhLyFuKx1PpR9IEWJ64FxxKDzrGN2EfIWG8WmEJsfbpTfsX/
	8iLpbFhQv64XGv543ZBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmNjx-0000000ApAD-34gl;
	Wed, 22 Jul 2026 03:35:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmNjs-0000000Ap6f-1IbO
	for opensbi@lists.infradead.org;
	Wed, 22 Jul 2026 03:35:21 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M3Gmvf3639655
	for <opensbi@lists.infradead.org>; Wed, 22 Jul 2026 03:35:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=w+KZBGYEdWN
	DNVHqQLtKSWoQ1HhlZcaEmmKzde2/8F0=; b=mFWyOqBcS29EmDagBmWWcvfdyRo
	mjsFNdx+bSPLFMdPGcgbxGlTbhWv35FNWDtanN3qcPFtoVuhhE8f48+2dr8dJav9
	R6ffw0FGMwv+2O50x1pK6g4WosK/LZMMDURQAAhaAXYviCme6xnLRM4Z1R7KG1EJ
	DKgAnQvX7VZcr+mjOlVXJKXU4naf2bZ0hoE8hyRYh1QlX2jZ3/3qJXWr2X9TSM62
	LJE8Y7zYT5XpPMDWDhAyM7hpSTK5VIbhXN7WYWiPiR/ulWQT5RQHvPLeib4REXSL
	XDoYmyjxO8hoTwujeXLsaq0qonXP2V66oWDK+I3pEaVPDCDUh4r7YzRLq7w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjntn01x0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Wed, 22 Jul 2026 03:35:19 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb5bdd8450dso3052697a12.0
        for <opensbi@lists.infradead.org>; Tue, 21 Jul 2026 20:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784691318; x=1785296118; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w+KZBGYEdWNDNVHqQLtKSWoQ1HhlZcaEmmKzde2/8F0=;
        b=IBRb1Qi8yW8WVmPnCnOxFcaTG+W/zWm0JxZwhs82NGQj+XVQTICzUIf5ddacXIQUS7
         mwFLfrH83ESaoW4rGDB9YhtDDE6stJwab5fUOPH7+XlTPJL5TcXiZsT+GzT11VQ/X8bA
         ghGRcKQHyeigGfJVtjKMd9IZ+EXPFjCDr+3WraihSJQSmat7nJzGpkFpjPg1U4kDvjvw
         i+l3fnKq/lJTKYQdeq0GzJtwOLdcbrUfQXXwCF/TJQn8Fvn8chKRxz+TS1HEkB8SUmSh
         OPnGunN5KAwDtpBUHR3OCQdV5biv3Zfei0xRmHtu5hoDDgrB9gVvSTRPtraVcEs30+Qr
         4FCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784691318; x=1785296118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w+KZBGYEdWNDNVHqQLtKSWoQ1HhlZcaEmmKzde2/8F0=;
        b=a9iddoNLuP5tqRFDKF/50/N96dkCV8cMBbT869Uc7C+c9N80E7NgL7ogYS0WtBIymF
         VsT0fnwl5MqijV3NPsLh0DAq81/NoAvMHjG1Ci9hv+tvbVb3D22cEHnnODilyzN7QIwg
         xgXTIs+sQOJ/mGH8hPSNJcb4nyJGbmJ0p26OPFeV862kYDV6kpz7u1TqL17cQx9OX2QG
         pGRQlam/AFH1KAf/jdic0/qHiPpTd30oFctH5dXKNtzwmbQZwqFFmcFQ525I/cZ5w9Eq
         GHL+CxNbadJoKejSiZmxi7BZQ0hbNcLE5HldB6aumOtYGyx2WB83J9bmc7fl7u0yHupS
         os+g==
X-Gm-Message-State: AOJu0YwXE/WhNxY0Bpj2FMUw5VUKdvl1gJpWdLMHrj270Xf6BrR+5jKZ
	rE33ah2nTInMdV9r1ZZyiqsGVruXDRqwl2/KkcVy8x+ys4xtaEeE30X7pM9YlEn12hIJwwb9q/D
	Rwv5xKQaocgmNrBLZJUPQLskA9iwQ6XsT5IsKjgCwb82noaDNEXmzVkA60C7yuQGKHxQuWuaO/w
	==
X-Gm-Gg: AR+sD11HVy+rO/9l0jrwyTPDOauy1Lzw6qf8Pkky7a0AGlRvBhu3+I+RE5kZ9dYpyPe
	Rq0FLmjVE1knoX8Qn2eQGYvUqRweEi+cwZBbWpIN2ZDxhqM2O76Q3ui3TepdjFIj0Ma2GnU53L3
	HJ3N6diwaeHD+3U1l6l0ApSWgac/FuleNhIZsj1GshKZAYjC09i+QNcsUz/k1AfuLVVWjz3Nnbu
	IBVmfR89VzaBJMTBkcRD1iIib1u4gDGgCagjh20tgOgDBkDozhyHrnT/w4SbudXOppNja0E8JDk
	9CMtet/H6BKPW9V9EQFez9Y5DsQioUXeqy07ViO2weLVDvNBto6kNyPtvq7TYfD2+5pVJwCdpJI
	AFNl40TTwkyHyMcax72YPUyv9mZv71iFTZjlczqHGfzcJrgHQY5JOcMsTZAeSGUss39G2ViVuwg
	RWlc91oW9w0KMtfAzI7S1E
X-Received: by 2002:a05:6a21:7111:b0:3c3:928a:b0c1 with SMTP id adf61e73a8af0-3c3adb1efefmr21909264637.74.1784691318440;
        Tue, 21 Jul 2026 20:35:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:7111:b0:3c3:928a:b0c1 with SMTP id adf61e73a8af0-3c3adb1efefmr21909233637.74.1784691317934;
        Tue, 21 Jul 2026 20:35:17 -0700 (PDT)
Received: from hu-rahupath-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d1302659fsm1645787c88.8.2026.07.21.20.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 20:35:16 -0700 (PDT)
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: rahul.pathak@oss.qualcomm.com, rahul@summations.net
Subject: [RFC PATCH 5/5] sbi: init: Print supervisor domains at boot
Date: Wed, 22 Jul 2026 09:04:54 +0530
Message-ID: <20260722033455.2658178-6-rahul.pathak@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722033455.2658178-1-rahul.pathak@oss.qualcomm.com>
References: <20260722033455.2658178-1-rahul.pathak@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=AJsSZ1gA c=1 sm=1 tr=0 ts=6a603a77 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=K4ympkDPe7tnraVRMg0A:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: d7Qx2NiscHOsVXhz9tPBmC4ulGlGpW7b
X-Proofpoint-ORIG-GUID: d7Qx2NiscHOsVXhz9tPBmC4ulGlGpW7b
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDAzMCBTYWx0ZWRfX1TZmwbE8sm8B
 NgYntTgUMD38QLXvfvD2oRbZ6MjGltO9VjIlBOmFeRuG+oNYzqsJnUZ5n2/keStAAKww2ZrY6Bs
 E0uvSkx3LPjcAUNf2aKfIQiDlmasq1g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDAzMCBTYWx0ZWRfXww4TG1crptsm
 ZrkVCnkaywkUfxajpmU2wSevBWtJkzrapGz90O+R0oUEESABbqMbQZZqwGv8P3LYuKNeLV6bFqp
 Dv8Xz8R6s3jfOshC/ttJnb53UAOrT4hA8v4aO/1kNWb1Q98Fx7VJ04mrKEzNYrXhKL9FtBQmu11
 +w8ppbSNFipEalpD47QBztuslvOKhtm5YKOaHhDCg0vy8oO27rWIWkHzVL615PhXTvllxdWwvSs
 +jQezqf0YPiwfZvz2suuabin/EWjQ6TaZm1cf6QETf8NfwuhOW0tYZ136AmGobKCYHZjgk40FcV
 Z06zPrHv50LBqZLMGqVRLrDU4rNxIv2cOL0tuaSdusOEhwv/m2cxpy8hrDDpKjbg/R/k04rWcDX
 EaHlp7BDHS51RmwoHbfS4ZM2gj5Zz1lNmxoY7M3R23jb0C7kW66uGsU5W6IXncE3HTRvrJd6HsS
 t8HHDs3V4ykZt+UTh0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_01,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_203520_464773_AF35B49F 
X-CRM114-Status: GOOD (  12.03  )
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
