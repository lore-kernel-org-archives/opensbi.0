Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C693AC982D6
	for <opensbi@archiver.kernel.org>; Fri, 18 Sep 2026 03:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ysO2QXDJvtR1Xq0lP5fgESRuNGZXaRQ2/3B4gxSj4Sw=; b=eoBt/+ZLommU5B
	dSQM8pcPBENxdtCFr8N+5wElpUc+LYgHc6Uaevp7MXenySBHN/LO7HhAszvJCfchjwlQv9gtCIZMK
	y7cHuEhWHV8/x/fJlu2pOfsMzuxMbmMksaDj5mghHbLydrpBIA4N5HYmY7rcHaouqenM5nYnFhqXE
	CmZdorHGjweDBElYb6oku7cqmdWEIQWTjTSCj+ilEipTknPlS/2hoCTvTRpDXUR/4CvKq/at+wkFo
	b+ozzSPOgPr1sGaMSuhkPaqvdR/PYDABl4WyOtrB0WtWBtPVIRhT5ZkAHUbBxORRX5vctrI11MIcH
	HG83r7rXN9VGINGT6aiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7OzR-0000000DMqQ-0jlI;
	Fri, 18 Sep 2026 03:10:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7OzO-0000000DMpX-44cA
	for opensbi@lists.infradead.org;
	Fri, 18 Sep 2026 03:10:16 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I2VC9i4104820
	for <opensbi@lists.infradead.org>; Fri, 18 Sep 2026 03:10:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XJSlq2C49nU
	mP9JkdGGQjAIsHefFV2RWDeR1uctIa5I=; b=KlKlfAYqeEEKl+Z7rNyGrKH9J+t
	Xovm02iaWuRsLJA3r0ynYWWOE4kGTbcLyxLuYgL/Ev9VhSMCTDgnSWJq97uprzYi
	RSrvn/PToiiLODeksWru36XwZezeyuopcag5gHM95Sldh+s64FX25wyyE8j/j3GX
	l6ggfHOlym2r946kzDOQ0+tbTToAEA9LyKOJMzkIJ2RXIapR2IofE/2qqL56+nKG
	QmIivWBGwWmvwdv3cHgP78vnlR4AI0Aa3mRYiq21OCPZA7/wC49axtxcztDpH2bT
	WonxXudhMV2fV20MQD4v/vVpSUyFFbI/DKOBerFHaU9uQrOFqzbGNz+E4Mg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grhs6k5a3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Fri, 18 Sep 2026 03:10:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39d865b11b4so484858a91.3
        for <opensbi@lists.infradead.org>; Thu, 17 Sep 2026 20:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789701013; x=1790305813; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XJSlq2C49nUmP9JkdGGQjAIsHefFV2RWDeR1uctIa5I=;
        b=Hl8UrAMQrjCcwTJbcn/GFZt1i1y6et5+xQxONfTfWCAXVpdNUgW6eQVpz5HqqeBhiT
         m4N71NEzcjKnP+KOhXn7IJsOhOBwp/ODmK6rUJIRUg6YoUHFVHm34t49IU9f1l3ZLdhG
         LxW3iSjNjRKgTjRNFugFcdNkcmrWsW8Ve8ijgM62NwRq7UOC/KEtiy6K91F06DSil0fm
         rHTYVW5YR4tN6Y6ByL2aO++PHza+7CsBYmGttHKgZ8ToUDq1Pd166niZXjzvZH7OIRe2
         /6h5F/LTJmRCvQul6+w5MnfuytbnL3z9L0xyItzYt1Cnf+EvQJrf450IOQ6fOvGVbhSh
         Bv9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789701013; x=1790305813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XJSlq2C49nUmP9JkdGGQjAIsHefFV2RWDeR1uctIa5I=;
        b=mtHZJQfe34OIzBJpZOzF8Spqm04GAwiyrd4wonJVSc3S1J1rT4TtyolPb6nBKubQhs
         RbDa4JukaBhMx77vTHdMhsqshRugFoX1C71bNRWyc3Px1HZ3vD07ja5gnPGCGOKXGDQn
         DD0LKJxefySco14LCmXHoBkRdTASOp0O3HsIg042X1x3bQ9pl76W7FJS4POYVeAMWprE
         DZN4Zk9nis3B806jJZYYiuAq677KD3fInn3N6TGES260Y/tVDopauIkVXdprPI9gi+vn
         ErJNdUu9f7ZDjbn06GP5Pvc+UTId8MrWWtGwzQx+0OxSOGBqlL/Dzay3jiekN0jfikj1
         SREw==
X-Gm-Message-State: AFuF++nCXMbUMkcTV2st4NU7/lrx1tgy6DnL+VGQLm4AplT0viC2Naf5
	ggkUKcU61i9eqkG0HGxZndfvauskGfJTev+PBboOaauqK9+1hBv1EMFRyx+vf8jXO8lOs2+K3X9
	FmlMsh1m3fX28p45fZD9xck9nGgpYBxpxTbQ+ds3C/0na2PfIm1v2wpVobt0NT1QahF+eBhqZkQ
	==
X-Gm-Gg: AYBFou3MPZMcsXl54JOha+heQbvf0nZn8iVWYhXJumP2Sr+fH6YEd0sUodnC73Leco4
	FNGtgdlymnYI2LOquyiZiExmBEzbwO28VVmiUXAHGtVk84rX2GLhGijJafvNh1EdO25j6b4R9+r
	gv5wntYCYifKHKstrguCHxXO0PzDUPHuUf+yt4/bfVyQ+4i8oHoGhygUehNcGQ7fbkeXiJv7KdW
	dkaA/VhhlK7/J5ePlUcJegR0mNz+BnPHsP+kpPvKpnVoLAG3l/U+ClHBV13tH9KAA53syEq754m
	UUEs5Ovllw+6zwTjLUCOo4gHIu/osO8XuhDbcgemsztElvvEF7N+jf4H52nkxPQ8OevJiomQ0H9
	J4zKPfSgsacaFr/8ZmfIq+inkER1Ig+f6MIZSUDHnwwjAxZ5nDxMiUGr5oJaCjeaOlB+QkIixHw
	OILoU6CDGBUPjLr7ixyS6v
X-Received: by 2002:a17:90b:17c1:b0:398:e86b:ce14 with SMTP id 98e67ed59e1d1-39e54e3f526mr2350369a91.20.1789701013008;
        Thu, 17 Sep 2026 20:10:13 -0700 (PDT)
X-Received: by 2002:a17:90b:17c1:b0:398:e86b:ce14 with SMTP id 98e67ed59e1d1-39e54e3f526mr2350325a91.20.1789701012606;
        Thu, 17 Sep 2026 20:10:12 -0700 (PDT)
Received: from hu-rahupath-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144cddb4cf8sm846468c88.1.2026.09.17.20.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 20:10:11 -0700 (PDT)
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: rahul.pathak@oss.qualcomm, rahul@summations.net,
        Rahul Pathak <rahul.pathak@oss.qualcomm.com>,
        Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>,
        Ranbir Singh <ranbir.singh@oss.qualcomm.com>,
        Anup Patel <anup@brainfault.org>
Subject: [RFC PATCH v5 2/4] riscv: Add Smsdid and Smmpt hart extensions
Date: Fri, 18 Sep 2026 08:39:51 +0530
Message-ID: <20260918030955.3902993-3-rahul.pathak@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918030955.3902993-1-rahul.pathak@oss.qualcomm.com>
References: <20260918030955.3902993-1-rahul.pathak@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDAzOCBTYWx0ZWRfX3h7SQxpSuCc3
 v4wJvE7y2p2Zzs+9rXlmLGR00gvgnOF672BpHs87zGOPLYx0KnX0sHGQaHiNWHdRBFFSEdBF+/b
 8aes4029mW+EPpZNrnGRWAaQJ6wEjL+crwUhpjU/xkbOobI+Zroo0ZgskfJr3PsA6BNLU59G5uc
 MOqM7Cd2xEc2srjfLzfv1qfovy1W2pl4gZXxntPU7pHGA0X7bM7dfftk1HYHhQy5H3vLaQArFkm
 cmnMvLvGR5EJCLQ5Xy83ciyJv/cg6lPLQuhBPcZgVYNsU9HlOcN/7MHHIH7hoCqCvlnaMvAFAJB
 wSBFVTrFCTz8M0vog3zHUyEK73cIYbSSc5WkORDN58v9nt3pc/mQ56JAHsm0lUVuu+q/ROzxIRi
 QCedBg0LuKkoanDcUEGIClzD0Zy59qJ70ITOSVJrtFtbJA5q5UQ0dT+kRqJYvnk0GHh7YlbIRkV
 eIuC5pzXUaImTHbJCHA==
X-Proofpoint-GUID: 147JGMzL8u8eAovqQqaH0Wr-tZIC-8h6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDAzOCBTYWx0ZWRfX2zHVaeYn//sg
 AfrUuZc3DvsiNVEJdA68+jZiUyNyv/lGrmpJAhU/QSc2/xg3rOSLV3FQhGVpK729JJmtWFfpBZh
 ySTec9FTbdppwsBg7YigJMWwn8yQubM=
X-Proofpoint-ORIG-GUID: 147JGMzL8u8eAovqQqaH0Wr-tZIC-8h6
X-Authority-Analysis: v=2.4 cv=cvwOAF4i c=1 sm=1 tr=0 ts=6aacab96 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=W-_n0kkjAAAA:8 a=F7PIS_qpXq7oc_onYicA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_201015_143575_BB9AA26A 
X-CRM114-Status: GOOD (  11.05  )
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

Reviewed-by: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Reviewed-by: Ranbir Singh <ranbir.singh@oss.qualcomm.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
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
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
