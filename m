Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C5CCA5FA5
	for <opensbi@archiver.kernel.org>; Thu,  1 Oct 2026 08:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MTp7fm4gFoCuE4Wq77K27wiy1JOjmcbcY7B4zByuJJo=; b=lGPdE40jB9N5FN
	5DMAg4jcftNch1ufaAjmps/s3vbxT37feApUdSJcCzY7JOqHoEomSs5AvzWPILKle7SXWrXdIdXZC
	1pTvqZnYCloPu4e+k4yqVGcyDvD+9hPrD7p+30hZzQb2Cry2zkMD2couVqxcqM2e2UCZMnXQtdaj0
	V85CWXclSggH/rnCIBoeoU1pXpO61mTKDJ00Hn+O7bmfa3h5nhbeAKKDTsN4wFmFwC+u1uBuVEKhR
	Epsvdg1HqM//bgFzokbO3LisohHLiQxpJhgona4cD3diH080XVc2UMsFsk1i1UfawTLyoMkIccS/Y
	Owbn2xePUFXz2rkRML5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCOx-00000008F3y-0ysE;
	Thu, 01 Oct 2026 08:44:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCOv-00000008F37-04ui
	for opensbi@lists.infradead.org;
	Thu, 01 Oct 2026 08:44:26 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xgZl2887992
	for <opensbi@lists.infradead.org>; Thu, 1 Oct 2026 08:44:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vGh5lc43PPw51QmgDcVngTrInxnZlYOxqBb
	TN9bOAEk=; b=fyhTmDyyVIJk2gRj+/2ouDYu/k1JzYAamIHjhWcgvdl0T7aEJdF
	tnX2Q9o6eDetXvbcy0XQDQS2Y0tB+5G5hdjiYRszV8LklwnF5VRQPDfNevvt1QXd
	HB7qaB1+lV11VIbnT+q7Xfu1sKId7ZtvlXTxxjmf4Bhlv6h751V3GL6F+pnfKaU9
	sgbjiXWmqLm9y/8zzCC3U5LsHkZkmK8ix9sBYbwvhA/6EVMBxfIENUDAPhr4pwew
	5WOuv0rXQ3ZBCo27rAjCU7+9tOooCBmilLxL0dBZgHjATF6M0IIYGxzjbhzQk9Tj
	2yPVl8WtvadEQd4i5BSD/kHU27zX7dMwQsQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h136tm7fp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Thu, 01 Oct 2026 08:44:24 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34344599f01so6941490eec.0
        for <opensbi@lists.infradead.org>; Thu, 01 Oct 2026 01:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790844264; x=1791449064; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vGh5lc43PPw51QmgDcVngTrInxnZlYOxqBbTN9bOAEk=;
        b=OSUsEJ5yUCVXa/FRQxWkLy07xLB43WfAJEHl1CJ8o30JImM5/8wwK6WEiFwPBvKygA
         J2O8XThda8PQzIWWtNFDtgXFiDXJ3To7m8f2e6gSpTImkz9E9EClmhF10Jc9xDMeRiXp
         15GHnNrl6DfC26TeLXP3PxMka8LORJD47D0/6jotK2mOO5Du9APeRcStwmeF8wD+DuYL
         /u9rgpq9glJ/aBi2j6UPvmEhGqy/H0hEXIVdfgPD7g+GWJg9lwKP1B0Y9OQRkw4WH8wA
         JaTrmkH6Qz/x0eHnK8/9UxNGfR4qwzG8yyPob/JyD6pnyYoH57VhETwCzClaRZzTH/w+
         tLlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790844264; x=1791449064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vGh5lc43PPw51QmgDcVngTrInxnZlYOxqBbTN9bOAEk=;
        b=kgI7//LnV3rpZkGhdtbwp4KBWMb1wE1wQY2tbEKN4Z73o/O2n6SBBTYisadq/44N8E
         I+nd/25G1tEnjrUmhGByFvj73IxUgJ88cpIT1L9TNaQ2Xlk3kE5RKyxSZf4kSdxt8s0z
         w4ypcmwvO/cKt5fzAr7VARzIjuuWCTaelASv97UU/l/suMsnsFIKrbgsAp9zah74vSDX
         Rx6OzG5BrILiWbS3Z41GkK0DNCQdOGPUE79AhDDk47GXflNtw+Qvy2TAKAaqBeY17DMK
         491OMQR/+KXqW27Zjdp6mYvHLD1OyjUY08zxlw268bQOlfnsHeVz9WZJCx/OVzh8mZtz
         h3Pg==
X-Gm-Message-State: AFq9FYIg64l4CV3Mfe90vXdbv1QIwzhDXQfwkzJDtAbnEGmDKH6pvt5M
	JAUMhh6FpYZqPE6xsIuT/+Xn4aCx2xScmM6bchaLASrA0etF2+17wRW6ybVPtbSSyeX+vpD8IOr
	mElhEAAVVc5e1atIStfSjK3MMFEsAlPrRC++3R3kQeZYd4tWpMc0XiyFQ3ohdrrEJzw==
X-Gm-Gg: AYBFou3sOfHyer0CYYqmc2b2y7XO/O9yVWdoxgU0tkXW9tWi0sbC3ifKydEmqBeBOSU
	1Q7bptEPG0UzS+gKmRp6fDgKUfVcYBSx38fXnJZk+zy74jX9vMVC2r/dnAHON9SPvemd4tPmHb1
	prNMO87NrgnkJ1ReikPIJ3MtPZr7wHAYPpRVO+FWNFItrUJ0cQxvefGyQ6TllNcUc7OzFJF+wse
	URzjDa8Bxl4pcC6l7ccU4PkXfIMyxONw4dGmDlufBDLfsyU/dexHdY0BeDkTCmNIOfgZTiAp9oC
	VEYp2ooNO2BPCdEOPJUc/ZrfsH0IuEU9f5jweQlxXWR4rYcphD23JhNrX4Bp+QBgklBrbJ3IWR5
	SHa8OevT/gi6oGEdNXQO18wC4egndE3gGaxBxd8dDZZJxTNkSskEs/dRQnK5iB1Ylv1JhG4vgJP
	TKZCopF9Tfomwx
X-Received: by 2002:a05:7301:5319:b0:33e:4475:5e02 with SMTP id 5a478bee46e88-34cd917cda7mr4054585eec.5.1790844263784;
        Thu, 01 Oct 2026 01:44:23 -0700 (PDT)
X-Received: by 2002:a05:7301:5319:b0:33e:4475:5e02 with SMTP id 5a478bee46e88-34cd917cda7mr4054556eec.5.1790844263220;
        Thu, 01 Oct 2026 01:44:23 -0700 (PDT)
Received: from hu-prajn-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db3e331a8sm5404527eec.17.2026.10.01.01.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 01:44:22 -0700 (PDT)
From: Prajwal N <prajwal.n@oss.qualcomm.com>
To: anup@brainfault.org
Cc: opensbi@lists.infradead.org, prajwal.n.oss@gmail.com,
        Prajwal N <prajwal.n@oss.qualcomm.com>
Subject: [PATCH] include/sbi_utils: Fix warm reboot failure
Date: Thu,  1 Oct 2026 14:14:12 +0530
Message-ID: <20261001084412.1383854-1-prajwal.n@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfX8AE4xxk1ywUW
 PLhkd7PtjREO+0gm8ne2R5hnYvnjaamvpQKsA+ebnv/kYvs3efIF64HHdH0i/t4h5q4f1f/nDmZ
 g7mdb/90OVFLhGuMH5Vq9tq6ogyMFBs=
X-Authority-Analysis: v=2.4 cv=aPFlOr9m c=1 sm=1 tr=0 ts=6abe1d68 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=esBtEfQAucSApucbMAsA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: -Yxgg3JVFy3RIpsosFA6iX7SJptrXwfX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfXzoc9Jy+zOW08
 vL70PB2appHFhe1YqxyFaIgYKfMd81HMY6DdxlwCNbCprAyctJQBK9S8KusnmO0dqy4j9WSp7wb
 xjBsjDNmuuOJlc/f+kuJawgDguSFNl3m1FDo3BGyp1BrI6X4zHsO3K+MHbjdAvYq9yrAk1RuRLz
 AqU+5/1gvaCzbV1DxG3EqeY1qUIqYbxOfmIbKBv+yZ8oTrfKR7ix/gUbll38l8Nw46K0UOe4Cr3
 FnneFRRDnC5qmda4giPb6GQXQKj3Hre2UkLNt0zOcUNNH1kAQgbYjH1KFBXzZmFY8YsmqKNMQzK
 tQu1QAnhs7/FPnAU4pPKJ+y6FQp9txTIdnjYWfZC9XE4zHTxEVdE2+LUOKLJEMqqx3Ky37UztFw
 cYfE1qu9V3F0O98cjhHLmkYPa1QUfDuA3YT45+1m+izicXY6NSdOl66ha2wgr7+HwiIo/zKC/zu
 0VSZOOHWOA+VLBMoJpg==
X-Proofpoint-GUID: -Yxgg3JVFy3RIpsosFA6iX7SJptrXwfX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_014425_060950_048C19CB 
X-CRM114-Status: GOOD (  12.73  )
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

When sbi_system_reset() is invoked with SBI_SRST_RESET_TYPE_WARM_REBOOT,
the RPMI system reset driver reports warm reboot as unsupported.

The driver was checking the wrong bit in the FLAGS field returned
by rpmi_sysreset_get_attributes().

Fix: Check the correct bit to detect warm reboot support

Fixes: 6a26726e08e4 (lib/utils: reset: Add RPMI System Reset driver)

Signed-off-by: Prajwal N <prajwal.n@oss.qualcomm.com>
---
 include/sbi_utils/mailbox/rpmi_msgprot.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sbi_utils/mailbox/rpmi_msgprot.h b/include/sbi_utils/mailbox/rpmi_msgprot.h
index 7ae4abe0..b473e5f6 100644
--- a/include/sbi_utils/mailbox/rpmi_msgprot.h
+++ b/include/sbi_utils/mailbox/rpmi_msgprot.h
@@ -392,7 +392,7 @@ enum rpmi_sysrst_reset_type {
 	RPMI_SYSRST_TYPE_MAX,
 };
 
-#define RPMI_SYSRST_ATTRS_FLAGS_RESETTYPE_POS		(1)
+#define RPMI_SYSRST_ATTRS_FLAGS_RESETTYPE_POS		(0)
 #define RPMI_SYSRST_ATTRS_FLAGS_RESETTYPE_MASK		\
 			(1U << RPMI_SYSRST_ATTRS_FLAGS_RESETTYPE_POS)
 
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
