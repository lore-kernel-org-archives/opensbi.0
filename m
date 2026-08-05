Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48632C561E6
	for <opensbi@archiver.kernel.org>; Wed,  5 Aug 2026 18:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KDd8U4etSYaE95pNtwXev1CTyCs1A3j5q8ccZUQaHuQ=; b=VZv0G+vCQSvjFZ
	oy1B97nnqKukNjsitRv1nUDs+SQRJ7u7t1IZWtu9kDsIrzdTYHtJjLklysLIifu3TNIzmfdwn159p
	S9d/n6iKm7OdQ2FyI2kAnchZurzv5OgDflqHMAh51onEl6n7IdlDCLFViH3hRIRTQEm1A3kR7tcJH
	wTVf3Fe6VvNOLFvNs7Iy/qbKQ2EwDj2JntMmga4en5M9yioUzrpQs939VezKG/ZCPPV+9KlbCzvL4
	ZJcvblntTrFoWQocJcHpLiNsaYa4lRn4sUP2NtbQ2XVXva/AHoz/nbn3eC68SInniuLyrRjGqZ8w6
	v/wxNk/1tzlHZjQ6ftTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrgW1-00000004Ozy-2l1q;
	Wed, 05 Aug 2026 18:38:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrgVy-00000004OyK-3wXk
	for opensbi@lists.infradead.org;
	Wed, 05 Aug 2026 18:38:56 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675HSNwU3561254
	for <opensbi@lists.infradead.org>; Wed, 5 Aug 2026 18:38:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=klymbeRqw/4
	N50Z78/UBvIPe3oOwCC3MvT00KT99zG4=; b=bGA6UpNJ4EZSLEyAegiZpY3wctW
	LYy6evHwdqJVIfkkAqzmSnjhfdKe64lqXmjXW8EAM1IW5z8kj+3jwnfsR3XZIDwg
	2hqdauuL41ytMe+CoV+NTEgiuJWUgg0omkjh+o7BBqczDaQszgI841FcsdwtzcQA
	2ifRKpZ8qwDxvjZKSIaLkwanTaHRqYJutURQy6NdqL5/9MiXo2nHbmzzsmc+16mQ
	Cyqv1VicsUa/H5n9is+PIV/KcH7ofBQnHIymceuPVWAuML3GOVErwj4PE8nQDoBA
	qpMG+CzFScm+VJAukFOYuCX1EAHq0S60LRpNLRxMpdrThcocyIgSbf5kxYg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5x5ske0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Wed, 05 Aug 2026 18:38:53 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb5bdd8450dso856592a12.0
        for <opensbi@lists.infradead.org>; Wed, 05 Aug 2026 11:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785955133; x=1786559933; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=klymbeRqw/4N50Z78/UBvIPe3oOwCC3MvT00KT99zG4=;
        b=jHi+XQpUkcKw7ZPWzTcDrv1AqK01zG1LBLXAmUG4YRUqAPUINdBQ9GRMT12JUOA6nb
         fseDbNoW3RQ4bcXH2J18VWHkxpsKbDimzZwtuPAoyW0IxpTF+bDaZEp8wcMVYjGaRnlF
         BADi1E6lgMqepltWcuvNDum9gY7SzgbCXuMQKyFbpQCEd/dNHZMLhzkAV1COZyha7NYn
         IuHUmdVhKELKwawi4UR7rkDkQZ/RXoE8EuluX1/rh3slhgfHZ2Mn7WFhcr/zEPfMv3yr
         IZR5hGtv8iqqrUrqQWux3x3k46U97C7RKNUcEcqY7sYJumVpDmwme8BD6lv6oU64ePwQ
         zryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785955133; x=1786559933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=klymbeRqw/4N50Z78/UBvIPe3oOwCC3MvT00KT99zG4=;
        b=VYCdHKBmKnZ6yR4+l+WojKj8AxLG4ECaRaydNoKkPlQmJDKiPlaNT4iA/ukr/LDFaW
         dwZw3U3CcVV7s0/hV4eDmTIXJBH2nUL3qer6IYU2qoRypw8DDdqzexl8zkBJLchoJpIo
         C7+eDfiMRJC79SiDoo6uXoZ7Iwwr/saaIcAr4WrOf95DRGBp7qEbsHQ0NXtAn7rrmehc
         cY5/TOo9ow2+A8vUYVNTkVfU9PR0YqWu7+CqUUpmopTumhD2r792IqadpggqB13g2TO/
         hNWcChtzqpqjlp8nNfo6LPZbC3to7gzdd6nfSP3rxhLXpNRvSS2NJ4xYzoVaEp849PYf
         L9lQ==
X-Gm-Message-State: AOJu0Yyf0DauCt73h4jpKbFMxE+HHqO2DmHhrECSnLlBrjrK5qdNIzeb
	G479uVjCnaUTuJXCf3bS9GK6Cz+yl+ZlnFkXewiQZrxs1iR/lW+6FWqtx3ceZ3ptkbJz8c5JVKy
	u0ujVi9zUwFLeopKT+AiOr8xYLlyoNIyvjmvENV0WFp3tQv10mStYCHDwD2q3uQcraJ40yoCJXw
	==
X-Gm-Gg: AR+sD11CLxCCn0DFX5C1OgedRW7f0L96GYe4hBu4r7LkAkuvVp3wkIoh5nlWungpPMZ
	iSCgHtJqZuuJSwdeApBR6x1/U4B5silMdOh9PYnQqmWi7/JPOnfqVm5YA9HTmjVAMAu5r/cYSK2
	9nEsoviJNGS7OqmgPabAUGXadG01LNrMKIoBrnwRz3GB4SW2SnwpjGAawiMouvSP7xr3BCEngSn
	Ezq7qae83xgMiK0BjF2GkB5nDSu3Sn35DOlaQ3yRfIMbTnnlf+FuHrYCkdwGvxDXcus8DQkSNXF
	KkO4i7lO4vGwFgQTjjghPxsTJnh5g4AMChN2cxL0O9hYy4qgSkirHWVXSGoLfG2vI91Y25ttqnV
	5ZXP47zwFjdIh9mb4il+R+NlY6mPeB83tNNWX7461df/Bes/FyMwainoH1gpZDyP+o17I3nHCFz
	46x8W5jcEVKPsDHbyRdaqB
X-Received: by 2002:a05:6a20:4307:b0:3c3:9df0:2d66 with SMTP id adf61e73a8af0-3cb85dee617mr9727734637.6.1785955132781;
        Wed, 05 Aug 2026 11:38:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:4307:b0:3c3:9df0:2d66 with SMTP id adf61e73a8af0-3cb85dee617mr9727678637.6.1785955132253;
        Wed, 05 Aug 2026 11:38:52 -0700 (PDT)
Received: from hu-rahupath-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586447d52sm17636943eec.12.2026.08.05.11.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 11:38:51 -0700 (PDT)
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: rahul.pathak@oss.qualcomm.com, rahul@summations.net,
        Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>,
        Ranbir Singh <ranbir.singh@oss.qualcomm.com>
Subject: [RFC PATCH v3 2/5] riscv: Add Smsdid and Smmpt hart extensions
Date: Thu,  6 Aug 2026 00:08:35 +0530
Message-ID: <20260805183839.2576691-3-rahul.pathak@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805183839.2576691-1-rahul.pathak@oss.qualcomm.com>
References: <20260805183839.2576691-1-rahul.pathak@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: ERRAIUkRnzJQ9-hSsTvjFsEDF9SXx-vi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDE1MyBTYWx0ZWRfX+uTFPFLNS1fi
 mN/QVJrH4WsS7Pja9mPKVAaHiSkzHRSaP1acTwUmOeXd7XM2zJSpCYrg4O24DR+U6eDL4jtCkUp
 e/ofa4x18GLprTHqWUviHyJzBzPkLF0bG7SGA10sVW8ZUQlRdZJpNkAKWGlsujIYUstxqMrnM8U
 dJ3Wbq1XB5102HyvIgJidBu38xiy5likgGVVKl30McfRpfD3rQDxo8rpVcPnYFTjooAyfpoVAwq
 lr0VRhSdqlgzdxYrfAYijhV0U3yJXNw8+5Eg0Vlv8tLsb+XnvcXVmqqQmn8ldTMzSCBQ0f1KWr8
 l9nQl4IMyC6DbGApoYJvOzWrfIobUC6ug2w3Fb61XKdO9r2/izO0jwDRyMPxrMtXtzd3nEGcG6g
 OpF7TfBVj7/5lOoFZ4xEZqWBVzlU6OwdaluQmzMVLEChczdCoTmxBzBPafxZBwDexFnbyr9Vxko
 PiXEm3siTFqYqsQaDyw==
X-Proofpoint-ORIG-GUID: ERRAIUkRnzJQ9-hSsTvjFsEDF9SXx-vi
X-Authority-Analysis: v=2.4 cv=RcygzVtv c=1 sm=1 tr=0 ts=6a73833d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=F7PIS_qpXq7oc_onYicA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDE1MyBTYWx0ZWRfX3wmFH5VfoiUP
 oxTscAKuCNqgWMb0xRSIQFcMgUIJvcpnxJ+Or2J6OntVr0WYyIyrpVXbNgBX5uMqreg65FRWYqG
 9heD8OOEOB6QGHFqzoiwkka/7dB7M2A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_05,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_113855_093825_1808954B 
X-CRM114-Status: GOOD (  11.13  )
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
