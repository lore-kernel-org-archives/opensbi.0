Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7A4C44512
	for <opensbi@archiver.kernel.org>; Wed, 22 Jul 2026 03:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qld7UCwxV4xeCzi62iKZwtLDr1n2JQ1V7kaz/iBQvK8=; b=CvNbqmxYHgIHYQ
	Tw5Y+02qsLyO5OLQVtWMhtPCpxTURls9rJLQuKoSnjGC++HLqcO/1RWi7rs4b4Nr9StcbGGCyJSdz
	LY/Qngl0ha3icp+tMPiQFhrGr8ckBz6QxWpr+G7sU++f/HsiFN1AIWQLGdm9CAeMKe5a/IVcYuBvI
	Q6Qj1nwXbZPbw+B0n08mRzzgR2kqYmmAMHPRsIjBmHa8MwrMs/ZTwEsiydNRm+l9WxMQbrHZgktE3
	xLtMXYZakiiHJz20dBpygTxXcrUJ1iKe3XUewO0z8ovtF03PcAOPfGIBkxLSg14MeyhvTkEEYjY0S
	213GH7V4AYb0RP0B8Mow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmNjk-0000000Ap2d-0PPW;
	Wed, 22 Jul 2026 03:35:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmNjg-0000000Ap1z-1Vyt
	for opensbi@lists.infradead.org;
	Wed, 22 Jul 2026 03:35:09 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M1CM7C2961560
	for <opensbi@lists.infradead.org>; Wed, 22 Jul 2026 03:35:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=J1RWGFxKQTO
	KGQO9CVOXbUP126Z2tG5zAeEuRR28q4E=; b=Uf7gGogiUBhkK+70H+ycxmePal7
	yPU15j4RLLixzYOQSGJt66LsHZ6EPsTA+bOl/7q8pRcNNLtKm7JoChIyiH1U/MST
	/VRVTyIuClg4CiBMPHk3JXzoaKxk5SOZOWA21+4YQ/nVsW+zRDiEkBacuAwujhMj
	XgikmNpE6ihqagYfR2r/RNJGUTJ04zZ61RXo7F8qqo8DPzWMd58whGw83QKpKhCk
	LjJa8VQpz0jytdUAZiXoyTBqniSBCNeeCEx3a/JKxuncICkJGM3u+B5J4WPcOvZC
	2xGX8FbgK4v19q+pa1odm9xLJJtSb+FXvwBja/XtBD/hz31k02cEibmTr5g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6ft0ta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Wed, 22 Jul 2026 03:35:07 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb5ea36f969so5027486a12.2
        for <opensbi@lists.infradead.org>; Tue, 21 Jul 2026 20:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784691307; x=1785296107; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J1RWGFxKQTOKGQO9CVOXbUP126Z2tG5zAeEuRR28q4E=;
        b=EP7nGEnwcgb6coBZY/3I7p9qMFkR9rKDXzWuLzWRnrTV3/1KFCsg2x8/l7chhTLkHy
         mClqI7lruWlOmzJJdej+3msWbWLytHmegWa+MjI+9Z02yEYUyIq/pozxZ57efF7tU5tq
         gVxQ9V73ahc+n5FaJUMitYwLStN2JdfEZ9S/bgv3xCSuV745Dw0Fc/A8o3731WQOpdwv
         OUMFOLPq73uJRVw3VQnkRK9n0aFyS9YhYI0AYN8TSLyKqqSrpZX939Bo4wuo20EfD/qp
         XAaRs8L958TcX42xUMQtgFFMyuyOH513aaA2G3c6VwOBKaeOv54TGw9/Kp5rapEbp/2H
         7FSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784691307; x=1785296107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J1RWGFxKQTOKGQO9CVOXbUP126Z2tG5zAeEuRR28q4E=;
        b=F8ZXwtNXaIbKmvvtCcVOcqoRdf3ttudxjREu0JkEWFkagWRq8jAY/WhWAS4goJ12vE
         xJyXK3iQ36+F5olZSdYcAgmp/O1WfrAC4gZvTILQTLyPiht/a56QrD7aIB+/nIQ35uZ1
         82qDPaquVvgT+hMnVi9jEFtClQ2KEoxo5Xg2viBoIs0vc/fkPp4yQDdKjkl+8C1i5FUp
         KlPE8CouuQbSP5rfybefHpHUXUvwzfJLxR4iHmov4Ngu1BsbVC7wPOxcSjvp83xAiLtA
         2TejATAsqlf1VKu74WsHmFsQV933SHEYfbnMbddc2SK5qc7x+kt6OCg7aC9JyP3jAiAc
         0Ilg==
X-Gm-Message-State: AOJu0Yy7S6ez3iGJulmmW2HBLyn2+pulh2JjJHn9wafV9Z7OPfa4w02B
	xnJynG+4McqhPlaxxNzkNRMWA2cC6f0Ho/kgKgw3S3Lx5gybdfSisSurY94OwsFXtbpyuZ7zcYH
	t7Vjed4nmKUkk5oZCifkj1ZyFqZN70GLoDNyFSOCwp2UbyVkfjHJaMxccroHe0od4+0e+hx5Hxg
	==
X-Gm-Gg: AR+sD12T2tIRh9porNCvwGu79zIOGqFaBntFTcWPC3SxODeL8y5GyxmUmoiJZBOQB4F
	s00gYnkWB+XFAshIfrUkT1WiRVtlUQ+pITmGA/c13BNNpD/1Pz+EmITHYZuqVWBoOvS7jZI0Dc7
	HdKxERSV1iCzhCerig22SJue137hRvzGSauzbidFkNDvHIx8Pz3UPIp4iTBXRFdz3Sfcjyt3jow
	q2vYgdtDGVzTv7V+oochah3JCKwwWXOGICYtLD39j8txkV6Ah3a6N8csJ1u7ZQDJQbqh++cdjQo
	GG3/PYuvZNXb5hq1S3gQz7tiEFLpBtywRxesOUd93+xsNBRfwRPy9AAsrToYdr5ISD8dGZTDHnt
	A7hft+1XZ0oP4bbM23RK57Xj+QDNGdrpYUXUOGkoYFbDViM0FlOutoBfoJwQds5zt3HTg5XxC8I
	yP28OBxKqAFXUfjgm1SXza
X-Received: by 2002:a05:6a20:3d82:b0:3c3:875d:705e with SMTP id adf61e73a8af0-3c3ad64b573mr21766772637.19.1784691307071;
        Tue, 21 Jul 2026 20:35:07 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d82:b0:3c3:875d:705e with SMTP id adf61e73a8af0-3c3ad64b573mr21766752637.19.1784691306649;
        Tue, 21 Jul 2026 20:35:06 -0700 (PDT)
Received: from hu-rahupath-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d1302659fsm1645787c88.8.2026.07.21.20.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 20:35:06 -0700 (PDT)
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: rahul.pathak@oss.qualcomm.com, rahul@summations.net
Subject: [RFC PATCH 1/5] riscv: Add Smsdid and Smmpt hart extensions
Date: Wed, 22 Jul 2026 09:04:50 +0530
Message-ID: <20260722033455.2658178-2-rahul.pathak@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722033455.2658178-1-rahul.pathak@oss.qualcomm.com>
References: <20260722033455.2658178-1-rahul.pathak@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: YYC3mGE_kjfeo6wEYAif2DBRbS-tFY3q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDAzMCBTYWx0ZWRfX5eLnMQcsnM8g
 Iv0LQaK66OuqIc+67kJbyupmLC7P3gqBdm5vo7/GoZwQqJ38RI0I6cI9a4IUExNox38Zj0IPXvL
 6LVOltDHSnHqcn2ndQdV7cwyQZEhMJtkLtYyKajhZaJTJLV9IPWa/ElY38aRD7IPgpqvSJD7e0n
 FBxXV83L65A34Lxw+slRCJvQbyRnzvfH4qYCvvQ312COI6q4R99rscPgR9QTjVH74j1PyFSZyql
 8QCVLQHBAVVG0wS6AqJo2FywTY0N3hH1J/TGYdkwLB9KNG7eCVoS61RGdde+VlTwJdQASrXxo9R
 0HTKnbgp3qlsPQi7N55Bwip2W9Qa5elFjDvCiRo6/YGUkJZEV64vy9/Egl03dKa+rCnyU9RliAu
 1zSsDNMI5sFDuYlCfi4wzm1vWp+7URer5Q69ghemZ1su36BFf2mH+iBP/6qlU4oUny4iQLiW4m7
 nHN/KVnPUW8mQl58ziw==
X-Authority-Analysis: v=2.4 cv=e/o2j6p/ c=1 sm=1 tr=0 ts=6a603a6b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=iILhA1FoMeFb3KInxGAA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: YYC3mGE_kjfeo6wEYAif2DBRbS-tFY3q
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDAzMCBTYWx0ZWRfX5Lq4ru6wr7K4
 cr6rtaQME/48IdpUfrUbw6f3ZP8gIzHUIuLP2VHUDf/HO/n0hsil3X1r/0lY+TcPDGyr98JH28b
 hIpykew1XAvvCMN3WTOkIuRTSYCQPU4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_01,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_203508_400068_C18572DA 
X-CRM114-Status: GOOD (  12.76  )
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
---
 include/sbi/sbi_hart.h | 5 ++++-
 lib/sbi/sbi_hart.c     | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 543393bb..38aacd70 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -95,8 +95,11 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_F,
 	/** Hart has D extension */
 	SBI_HART_EXT_D,
+	/** Hart has SMMTT - SMSDID extension */
+	SBI_HART_EXT_SMSDID,
+	/** Hart has SMMTT - SMMPT extension */
+	SBI_HART_EXT_SMMPT,
 
-	/** Maximum index of Hart extension */
 	SBI_HART_EXT_MAX,
 };
 
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
