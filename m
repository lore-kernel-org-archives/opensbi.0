Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51838CD343F
	for <opensbi@archiver.kernel.org>; Thu, 21 May 2026 05:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GBoiqcO+DxAXDNW11TMosIT0j621p2Rrjz1UURffLMc=; b=CEl9W4dzqFu9dl
	re49yqjeTo8TERnJ75LB3w0knfD50Adpx0Oq+/WxdeK8cdRiAgbBr5RnpcIuttOGFzeqiFERNvAa2
	U82hP7np2IfHJjOKF7uZhU5pDRQ83YmTILYuRL+RH9AHk61MDZTjxH+AzRZ9aVz84inoaACYasGjq
	trfwQS0POlTq5zqwTPqKKHkpyLoBADLgUsAz3j8oKMEOesNuWSPaJy7ZO0Rc1XwD+tDbZh1exq+nK
	fDE5A3uNthTdqODeWJ1znbjyUP2kVpfCLo30gCmxtR0uzJkBkDMRzxIfXq0mFFk5ypWZRR6UrJqfF
	L3ylWp2utRcMbr28QG4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPvxh-00000006jbd-0piG;
	Thu, 21 May 2026 05:28:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPvxd-00000006jb5-3w4D
	for opensbi@lists.infradead.org;
	Thu, 21 May 2026 05:28:47 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L2T6nW3816809
	for <opensbi@lists.infradead.org>; Thu, 21 May 2026 05:28:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vBJyk7LCXaZrKVARr1eoslg7EvjBzd0Yxxm
	o8LB8h78=; b=ocj/NCd48KG0wVCu5PM6AYdyRRMsAE/Kin3bEMmvXcFjCzC6ZnV
	50pYKCjpqv7MPK4umh3ObssXIqw88I3EwBns8AZiWRQBgltTeyn0Z7xVFwtwa8/W
	+EkhbfcSv+iVwxlW17L/ZMgSh4DojYxUsLY+NYbFImKDL09/AmS81RXHUY/eGbLy
	JZV97RYSCJAIoKUrUVFLtMGuKRsxH+bsc0E7cun7gNGHI7BB+lYzW+1ouijeijyb
	ulLGhjmJhWxGabA/7Ftbh5q+ICAIjXDZo9zMniL2K5cskGD7D4bYxDfKyIJNCzkG
	1xqsbzksNPlOcvlIgrJaTLd1L7e/+UaGThQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9saa0hrr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Thu, 21 May 2026 05:28:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36641fe4aedso11055559a91.1
        for <opensbi@lists.infradead.org>; Wed, 20 May 2026 22:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779341324; x=1779946124; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vBJyk7LCXaZrKVARr1eoslg7EvjBzd0Yxxmo8LB8h78=;
        b=DZEDEFYhhaJz2o9cNbyzFBLTqvyOTL8NLntjWH/BL/o0E4Lase5OCNyQf8Zbfisp1B
         gx/lamg4aZ7l032Z0suRdSUiBL/f7l9LLr7KleSAJq2AMmtBanSMWPgwBaYI/1ItQ3xT
         ViZgJv3gU04+DD7MqJgYDcJTZIyeLV1qMGRYpHn3wnBShIcLDydx0l1y7tN734fI1QDL
         VeTD0vwGcbKlfb+oOlfmAllb0MMu/SXeDW4EOfT813DOzuWdJawO8Cfw+hERpXe22u4A
         dnpvJkJ283XTV/EuI++aeND5xaFJEi/EwRQaGeyTKp42qQaLSPVoc631n6OOrdYuL/Pp
         zg/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779341324; x=1779946124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vBJyk7LCXaZrKVARr1eoslg7EvjBzd0Yxxmo8LB8h78=;
        b=fEUICLjhXyw/bGpdNnnbdPiypRGkKgxj86wHikYwbjH88RdMvEet9im8b5nx6dqtnv
         B+BeC1cSRYaksyTFXQRl1w+ZnjkvKaIZ3MzcHQ3MB6ioH/9LVnuQxXqeq3r1iBaZNYkF
         ja0kCvWaLQYocDKZeMgdxBvV4Cvl7LsPSmubkBfNSSse6qR1zV62lbKl2e0q6V/8PE4t
         HvVjpJJ/lBi6TUvAEW+ugw22/YYHyjuTmh5J5PCHfnmLgJmfKxFpYXqochY6RVH3QiOq
         JiXC88Cj8/3UFeEoU1cPIywAIyG7awsbXX023NLd1IphmGszcfRdLRAmR0ZABF3jotvO
         8b5g==
X-Gm-Message-State: AOJu0Yz2PSk2VnIrER16O23Qt0lX9dr5JTISG7QZMijlXz4QTN9FBQN+
	NIfdCbjSFzXAEk8ePz7vdR1aTFVLkSJISATRBweyKP55qyY9DjHMfl5qUQ0RrVHGwOxR0lKQN24
	fWND550cIh/3afAEiW3xobidvlNleZ8rxc76uionkGWHuOwBlr28ZK+f6mHh+jnTNLDGurDGC1w
	==
X-Gm-Gg: Acq92OGl1a5jSB3v2g/q9/LXL0aYO6R5/5K8zVZGljP+Ldufq3YdvVWL93I3Nmgoy9i
	AqTx2ChiSXRHB/HfIXy+9ZAd7dVy8N9A5sxdB5J1ckBS7tpEfeVxtKL+v88FXCxcEUZzcvDZBFR
	8ue6OemcaRO7v7MGqBvW4oSMZ/qY/OJjENb4T/zoc3Usap9NlYQfF16fBfirGiaeiMT7CWxKf4v
	xrPNj4fXjsL5Q8wCjuoBvD6EoizEwv4d1WeaN51s2apXj5Pwv/RcG2TeKbnTQysYEjg62pODSg9
	D88r+M1Vhf9sFvGh+uvfGX3hNlVS9ME/AmH7YdKiIy86fHAqZehhnQyv+PgohCOZdOQ5a0DiHyW
	Ti6FXNhpD7c/Udk25yNG2eBbeWL2Um0njbyybe+EjHjQTgNSqXP72PVcln5oJRx5WxVJHsWd4Hc
	WQBKCONhjHiWSj3lC6uST/Aef2cp2H1kH0czZE0dyGVmprxoYYSKmu+uXY
X-Received: by 2002:a17:90b:57c5:b0:369:932a:2b6d with SMTP id 98e67ed59e1d1-36a451c484amr1337422a91.6.1779341323998;
        Wed, 20 May 2026 22:28:43 -0700 (PDT)
X-Received: by 2002:a17:90b:57c5:b0:369:932a:2b6d with SMTP id 98e67ed59e1d1-36a451c484amr1337407a91.6.1779341323537;
        Wed, 20 May 2026 22:28:43 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a3cc5643dsm1615432a91.7.2026.05.20.22.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 22:28:43 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH] sbi: mpxy: define INVALID_ADDR using unsigned long width
Date: Thu, 21 May 2026 10:58:38 +0530
Message-ID: <20260521052838.2174588-1-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA1MCBTYWx0ZWRfX7ChQ2R9xLCsG
 etyiKFyOj848ebsr5wg7dkM4ukFxmktyOJqpVlJoHM9NwQwE+vezQ/lzyuTU2EHXBkakOymt60X
 X+S7oVg1P4t6QY+eUBh+Uf2n3OGzRdzVNSouuXxeVq23NijvClkcTCb9UmsMpybkf368lVfG/sp
 RD1O1KXSlZJsKcddH2A1RdCkfhwczCtrp2MEJ2JyWPb7adDlCZcFvf0dmX5XEOuKYYHQTW8LxCT
 G29GEeKPdqcjps6HoBeqtiIp17khydsQ8Hv1/jSHPsCxHCLg/tiEpUv6YP/zIPXNheBCwjcNFti
 pRckvTfEIPhJ6UYVFeTu66HK1Iar6AUXmyE1D2ZuG/GVrIfufjAPSpJ6PcOyxQdEUxavpxxyIw5
 m8GBWla43TK3hzYyPTBzRGPf+yMkUu8bue9X4/uACaidAYbuuzVtepj40V1nbCaCEfmdNL0Wmef
 VSD8AEBhqilw6/vCVAA==
X-Authority-Analysis: v=2.4 cv=Qe9WeMbv c=1 sm=1 tr=0 ts=6a0e980c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=cRDl_DUD7HMyJ2gD1O8A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: ZhoOD1hzaf3fLemnIwtEK-1wRDKYuEHJ
X-Proofpoint-GUID: ZhoOD1hzaf3fLemnIwtEK-1wRDKYuEHJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_222845_999600_F24CE6DC 
X-CRM114-Status: GOOD (  12.32  )
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

INVALID_ADDR is used as an all-ones physical address sentinel.
Using -1U only guarantees 32-bit width, so on platforms where
unsigned long is wider it may not expand to all ones after assignment.

Use -1ULL so the conversion to unsigned long preserves an all-ones
bit pattern across supported widths.

Fixes: 7939bf1329eb ("lib: sbi: Add SBI Message Proxy (MPXY) framework")
Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 lib/sbi/sbi_mpxy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_mpxy.c b/lib/sbi/sbi_mpxy.c
index a83cf16c..79851097 100644
--- a/lib/sbi/sbi_mpxy.c
+++ b/lib/sbi/sbi_mpxy.c
@@ -28,7 +28,7 @@ static unsigned long mpxy_shmem_size = PAGE_SIZE;
 static SBI_LIST_HEAD(mpxy_channel_list);
 
 /** Invalid Physical Address(all bits 1) */
-#define INVALID_ADDR		(-1U)
+#define INVALID_ADDR		(-1ULL)
 
 /** MPXY Attribute size in bytes */
 #define ATTR_SIZE		(4)
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
