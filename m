Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F5DFCA5FA5
	for <opensbi@archiver.kernel.org>; Thu,  1 Oct 2026 06:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ee09OBn58H3hc1mesWBwnhV7FBGT9G/44Eid/OPnN3A=; b=j9NlfTmAMGREFw
	bF2+kSA5jEBszf5emk8wghE1A5eClUtibjaAB313u9UMiYdm++1+q3lrkHBIgLhiyolPXcLzJUx5E
	QbVlaSbjjXdIZTBlXAMKCehOxodz0I8/FYS6tt6Wbqmpa3OtN+R6TF9P+ZJS7q+kbPBgye7J/uSNa
	o945vfWk3f2Gp2nWfoH1qp5Sa8GEX7oEFzdcq3uI6PICVNzWJkB2Rxf0c57XYd1/cEbqM1soerKO5
	/g6DsHTDh2r1/2R1KpjEhpKXjgsBMsbXhEd3yeuLcjIQBxyYTaxGyN7MY8eC+wdv5ehV6iGKJOA14
	/PurK2WqDhrk6n1Mr4pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC9yC-00000007rkP-3yOD;
	Thu, 01 Oct 2026 06:08:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC9yB-00000007rkH-3C0l
	for opensbi@bombadil.infradead.org;
	Thu, 01 Oct 2026 06:08:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=xn8wg0exqioP3hQ9GcYq2yt3g6pVAECCX1wC1QYpn94=; b=AginUuSKXQypmw4QE7/vj+YH9G
	SZFV+SGF6hIrMXeULmHYsL0MigSc/KbgXD9UPXllICYGdYOrrtpe4Um0Sip7Mzy8sC2UAyrMmw8Ep
	uDJsq9RPVozRGpaKhQj5okhaRL6DaboePTTkFCmCoJpbLUsBjcNKX3f2ecyF+hBvyJRC4rSeLlDV7
	OAySiSnevULR9jYXCc2T1QTADdszwATyzcv3eOu/00XTEN5XAUwv3fxzs/ftb8AHcrRBCY+jtKmKd
	i33u+ds4a5WZ8SAn48ULWtXFolNkbuCZnVHLDht8hx6/432Te+JXPJYBLHc0UBe0nEYX9S3dn2VmZ
	ODm4ai1Q==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xC9y6-00000004cUC-1DRw
	for opensbi@lists.infradead.org;
	Thu, 01 Oct 2026 06:08:37 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6913gDcg1510995
	for <opensbi@lists.infradead.org>; Thu, 1 Oct 2026 06:08:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xn8wg0exqioP3hQ9GcYq2yt3g6pVAECCX1w
	C1QYpn94=; b=AWLVQxYrbMRuKq+a3uBu0pM260jTsz90XgXWM1pwktg63PJ1txA
	mtlPlryM3/mhxaLGLkQ7X6PIELhxOQT/6VPMxxF0CsOfp7CPqhj9SnQU2IHUIM41
	PNMbqUbtkvlWKZ3jl6yaDYVrfjI4kZSa+Dw4YTw5LADMDBRrdlbpwywcPUNZnSnH
	PW/hEvBO6hlIoDAJu4BtVZCj1fhmGo92UtTrYcY7zR39P6hx8rxU7+rwH8oTG1tz
	TbxLDj93bVhm2x/3FisiZD/8n5tLyaOjfL0H67E5jVe2CA9NIywutotwaC22Ev8j
	6/Z5atGJbL4iIrXCSGZKlMVK0C6sTTW/rkg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1bh59b2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Thu, 01 Oct 2026 06:08:29 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33713e5e6daso8908546eec.0
        for <opensbi@lists.infradead.org>; Wed, 30 Sep 2026 23:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790834909; x=1791439709; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xn8wg0exqioP3hQ9GcYq2yt3g6pVAECCX1wC1QYpn94=;
        b=Sgrd4L1R5kpRJeLa9RZrZud+wyyd4XtkvmoKs9pnxSqWLVtsVr67GSXzWxkwAqPtO+
         LtnaYbwgzCX1Ke3UYcme7Jp13Xb522ocu/6u8HX9+8YZR0UOMzoFQwKgDjDyr7eujnT7
         KtHSmvKkm8ytumwniQwGV4UndyemTHaAwTSvZUeHvkPaRyS+fGJ4jL/7XdlcqCKvbKGo
         ta7+kObY0VZpmilYf6EB+zS53RNbSPKVX/PA2oDEWMeOQ0MwXXfiME4W2xIhUNrGc9Z7
         mfx76SxN/dsmSNeqkcvzBRKJDh3wpHMCsPNn4Kspcf1ezzfL8VtMmwGwRKDLswa8to3s
         YBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790834909; x=1791439709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xn8wg0exqioP3hQ9GcYq2yt3g6pVAECCX1wC1QYpn94=;
        b=N1wE4GNqg5ubiyuOwA53ULiqdxdE0iwO5cfDpAjLWexeXQd4hVJJCUFX0kpTPdc0SX
         Gmj9oTtRRbYFzxb7TmFTbyBzy6KO0OHep5ZBJYgNFuT7OBVIs4KAbaOY173SbwKEQ0ev
         0Ptx8xwz+/eovtxVZY62EKMSzx+Sxc6eY4tbYD+LWA7qyZWP5tjWxQmz+KLqXGy6lLlR
         cesjhPlUDkkRSkoLOk4R+bECkN6oFGmeMPctpw8A2ztaRyfb4qz3rZBQ4gPPcD0ItnzP
         nvjVOwX7Er2eCVIGGnybMXeCkB8sHCJ9wq+uhOb6AbzOys74x8FQrFODXTk5Ry9sdTGC
         exWA==
X-Gm-Message-State: AFq9FYI+4Hf2nYZggpFiz9CCntCQdDd12aTX77sbJP50woy/g8x+V9Dn
	q50iFGuv9G8SAtIerIUME0sr2qtVfYQBISRyO3KJZcC/tPc28JLfcDUww5xZZANqu5e1QHOyFEL
	PeifZ/Ms1k/hycgb3c2fXKD8Y954CwnLEI/d1KJX2A6lXzbEM9QUlBrcGVf3NZw5lj5mYdXMn5g
	==
X-Gm-Gg: AYBFou3jTi5qrJ1zt8nRgVh+aZxms8QqX/BdXI9ygb2iZr15reI292h4DcY+s/w0sUI
	UYZN3+lPF4QbjjCPevFmwn7tCVgdaZbqfvxsMuboJp7Fo7hU0bHws9j+wkIbYeDqE9EnI3pR+Dj
	6UymU8RdRnB6ZqySave8ZYnmXlI/4UO9wP3EW4ebqftWWYQHSciMX8vSpPgfXZunOYXwhx/6txR
	U7+12xxXCoCFA8EWkEHQ1uBawSuH2XeL2wQtKGCSUNBLpM+s1yV/04FEyKs85IScFpx9ElCVOe/
	GRBf0bQV1sY6KGJt/a0ep/22Woy47wpHf8AxeUOnE0TAP3K0fAZx9A/8Tp/xJZwBpY77DUIHuyr
	/XI6uScP8IcSHU1mulpRbcLFvudfDgkrGmymEdDlvoApPVob/srM0V9pmXugChB1S7ZP6Alj36o
	nTZfD7g4sNW2C6
X-Received: by 2002:a05:693c:87d5:10b0:341:dd10:c9f with SMTP id 5a478bee46e88-34cdd0aaeccmr3929710eec.35.1790834908537;
        Wed, 30 Sep 2026 23:08:28 -0700 (PDT)
X-Received: by 2002:a05:693c:87d5:10b0:341:dd10:c9f with SMTP id 5a478bee46e88-34cdd0aaeccmr3929692eec.35.1790834907940;
        Wed, 30 Sep 2026 23:08:27 -0700 (PDT)
Received: from hu-prajn-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db3b4688asm4413204eec.16.2026.09.30.23.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 23:08:26 -0700 (PDT)
From: Prajwal N <prajwal.n@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: prajwal.n.oss@gmail.com, Prajwal N <prajwal.n@oss.qualcomm.com>
Subject: [PATCH] lib: utils/irqchip/imsic: Fix the MSI capability assignment
Date: Thu,  1 Oct 2026 11:38:19 +0530
Message-ID: <20261001060820.1267933-1-prajwal.n@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-GUID: XUC2XlQl5kGwEi4qoLOK0DmnA1IUUye4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyNCBTYWx0ZWRfX/OHpgph1PzY3
 FOJdimGZ6d4JhSNKArF9S5M2iEDo5l7CUvAynein1CY9NlWz4Zy3YnTOFL8DG4mqSeYpqXlrW4T
 40lyWzV3XDN1fXoJeEJ245tE3rX7VnY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyNCBTYWx0ZWRfX75h3s1iuzzTR
 49EHPbzpsHimPZUONCAs5SCy9UJznviO1MOgZ7ivyB6V8PjxpEzkEsFfpFkgonbSt2OW4cPwN4O
 Gi3SQCAY0Yl5vE3/aQqlfw3hpZodw0U6P8G/YsffyF523nj0BZSi/b0Wh2hwgkZxx8jGDEeC4Do
 v+zJ0H2JZisd9GVCxg0o9wFQoL0Hgnzkd6sTDUn/hFNUWWtBuqFk9xAqkEVowJwxe8RQAvf20vV
 RsRp4uSL/sVqqGFW2hTyT7FvJNk2p6ZkSVF9wKbfkZQ+9ab+nM2dOh8cz/M4p1Icixtl0LQBjHp
 RTANFzfm7sBlnQZNDg0u9eDlGnkDTFcqJliIhjcM/yiCYwnVMi1cmCJbJuBdr1mEX/7l83q9esn
 4hqdRVDLQZwLq1ZsmFZlV/qEpwSp9/8jiw728KrpSFsIpcUgWJy1IAbRThW/Ko0XY4slr4CIyBf
 TxxDDmhAGxqyxsq/P6w==
X-Authority-Analysis: v=2.4 cv=NuxE4MdJ c=1 sm=1 tr=0 ts=6abdf8dd cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=QlXYge8nIN7gddkcPe8A:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: XUC2XlQl5kGwEi4qoLOK0DmnA1IUUye4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_070835_266376_6061AB9E 
X-CRM114-Status: GOOD (  14.72  )
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

The struct sbi_irqchip_device is copied to the struct imsic_data
and the MSI capability is set in sbi_irqchip_device. Since the
struct assignment is not a pointer, the MSI capability setting
does not take effect.

Set the MSI capability directly in the struct imsic_data to
ensure it takes effect.

Fixes: 193b1d9e7ecb ("lib: utils/irqchip/imsic:migrate to irqchip framework")

Signed-off-by: Prajwal N <prajwal.n@oss.qualcomm.com>
---
 lib/utils/irqchip/imsic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
index f6da9f7e..41cfadeb 100644
--- a/lib/utils/irqchip/imsic.c
+++ b/lib/utils/irqchip/imsic.c
@@ -598,7 +598,7 @@ int imsic_cold_irqchip_init(struct imsic_data *imsic)
 
 	imsic->irqchip          = imsic_device;
 	imsic->irqchip.id       = imsic->unique_id;
-	imsic_device.caps = SBI_IRQCHIP_CAPS_MSI;
+	imsic->irqchip.caps	= SBI_IRQCHIP_CAPS_MSI;
 	imsic->irqchip.num_hwirq = imsic->num_ids + 1;
 
 	sbi_hartmask_set_all(&imsic->irqchip.target_harts);
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
