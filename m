Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E729C44529
	for <opensbi@archiver.kernel.org>; Tue, 21 Jul 2026 06:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PsFFd8i2NtldUF7Dk4duEztguiTupHRt2bokCC0jG/E=; b=Ws4ITIPyFZ1Hvi
	NinF3jwBvuIN8GmSZTZfqxMgrNUSPARaNpGsmz0RgOu6FF2Ni/tZET1VCwZFtxvi5kqUp38Al46VX
	tp/SFKFKD/GLDBu6TM4AyTa6ejkEHvQm+rfC3bKM8kcD5sffhurfHp/CAA4P9c3tO5+VZEjOIw4CW
	WAWpucRZ0yvarpo3xRt9gZDoBlpbjjl6+o6VQkcMTylr1LXpPjhrNF1vJ440zJqJIPkq611e1o6y7
	7Aq6RCfANr+Im/LnnP2Y5A7ba4kswsLYwAMbEUDxW07CrKBDdDtASsn8KIPTTM2DWkaat+ZQ1Q6kU
	TtqIsdwdP4LIfac7OxjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm3kz-00000008Uyr-15N1;
	Tue, 21 Jul 2026 06:15:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm3kx-00000008Uy8-0IOi
	for opensbi@lists.infradead.org;
	Tue, 21 Jul 2026 06:15:08 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNDDWc4150322
	for <opensbi@lists.infradead.org>; Tue, 21 Jul 2026 06:15:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oozROOMWxoGNGHlg3qSdzOQQSbziQr4SlZR
	5EXjXBqA=; b=cFvg6EcJOrhLd5RqqWGhqJyNa54WlbkB7W/BZ1rY4TxCVuswqis
	Bwv0amqKoGESMhPw8sCB04WzZTZfpBT6irHgrFp64UgR5icjG7yfpLyvR++5Pcvi
	2lNAEQKKyw7c1QShpmgKjhF6TEiW6OPs4+D7V67UGW6CtBSQ0+3nLy4mu6bIfKXa
	5O5/cODX9cErQ2SJUJQ4WNynEl8G1DYpn1ZQSAj1hGKhXF6GU1W0j98xXLKFuFTE
	j7kxMt+4G+nC7q02iU8JX0u8jhMP9VzQwxEZ+FH1O4uWUAn+cVpnILIZgcj2oQAV
	+ECwKhxa6uePuCKmSDUCf99m7EvmfgQd7QA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqff2u7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 21 Jul 2026 06:15:05 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb7049fa552so1681898a12.2
        for <opensbi@lists.infradead.org>; Mon, 20 Jul 2026 23:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784614505; x=1785219305; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oozROOMWxoGNGHlg3qSdzOQQSbziQr4SlZR5EXjXBqA=;
        b=K3oLp+xwsd9qXh2BbScdJ1sFGLoByKdfTyDYgywwHL4thSEjVEKmOplD/zyVkErZft
         /dr1coj6uNBnQWlc84V9FXrSrDq0RMdJpKIyeoFQiieFC3qgg1W2nJDJdXfaM5Ja0XEe
         qnd+LouifWqhqge8e+8nbP5wlOe3FFSqprg/sd/s7f+HZK+VtGveo4XYjbSGqZrGyhoZ
         COgy/ZeDsiwZHSiOHPeS/rmISDGhGDPr3EciUo2cuvGTMYDjUjlofWD1wXjYCp1fonX5
         +BFw5y5rRU1VwUiPpxxT4uh39FKnvluGAF3jP9PYTchlr6GyXGFlZsOL5zfN0FZrr6xi
         mpMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784614505; x=1785219305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oozROOMWxoGNGHlg3qSdzOQQSbziQr4SlZR5EXjXBqA=;
        b=pp7R5KnT2v3jXRAMX1cYS0+fgg8Xjm4W48/L4++CosrgKDoMfGA7eNSfhspBNrczt0
         1dy+k5iTYH58qWw4/pjVyzcVM4yP8JUEj2IJFNFsOzvydYaknn3496aELsboycvIXPzm
         wyKuwn33akJSywiI+yWlNPIsEjQ8T89nCBdd/1dbS3SWOPdQD3RV2HjPQfayfQD/xYQF
         8UfAH87lpjw0RCfMJm1w4zcPiqqw5f250c0Py0cJL25Asgr6gSiArLVxbCHylHQCq/D2
         bYh7dHp61C1tCrDTkTyO6XKmu/xpPAEGpdb7UWwnT5hxQCflf9PO0rXYKCgUCBfBmZwT
         649A==
X-Gm-Message-State: AOJu0YxywAidMLcDwLvokU5taIW9pyXSQ696N0u7h0JzBZb6d0N7rU5P
	CTV1oYbIGruQAlPbk/jo+6OBhT0S9SaGQCFAAGIdEnKfYsvBnu7Pq7ibD+/KAWpBVko1HJVSkpt
	4AuhVxLLosXlVdmSUVajJkISyDArgJY4mzKyiEsgRUDEZP+uU3mf9EmUBtlG1oGXDxpaI5Yn7Qg
	==
X-Gm-Gg: AfdE7ckA81QLsKaEQYQmNXjTh3A3iUaLi5ABm2J+uAnHGEO7BlY71Pepoa+11zkK6BC
	AJxLfhHE2yjLtoJGdSnXU5DU5t7V1bSisLtn0xYPqm0V3SkUxE0XkOSXkse1/r6/nvvJsMrbUC8
	+MLcmQ6/YvLblB8F9UsBijN/tci3iMLtcBplNbeEbTzs1y7wZeNY9ySq79ao5F10wWwJj1VdZdb
	hvcoxQ7nkrB0C3z/ZW02WYaTb2dHH5WwYY4PLv0nd1JYk+tCwNdDc3kjFcFMMLAOFso1zODN9Uj
	o6fy436U9Yr/rliWGj3///JHJkK17cxr94NslJFMJ+XzahDjef4Y58NLufPUxNBVEg7MJbd8jZd
	TCawHafFTqpkaCFgnfnLBEHkHwX0h9e8bY8clnN246wkqDc8t9HcqUE63K/ylugt5aBuSmpxHtB
	ZGCIXqskWn0rddXWx+ALo=
X-Received: by 2002:a05:6a20:6a08:b0:3b7:807b:3cd3 with SMTP id adf61e73a8af0-3c3ad80cb0dmr18614855637.23.1784614504784;
        Mon, 20 Jul 2026 23:15:04 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a08:b0:3b7:807b:3cd3 with SMTP id adf61e73a8af0-3c3ad80cb0dmr18614828637.23.1784614504295;
        Mon, 20 Jul 2026 23:15:04 -0700 (PDT)
Received: from hu-ranbirs-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20cfe3sm46059054eec.30.2026.07.20.23.15.02
        for <opensbi@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:15:03 -0700 (PDT)
From: Ranbir Singh <ranbir.singh@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Subject: [PATCH 0/2] Fix Enable Notification
Date: Tue, 21 Jul 2026 11:44:57 +0530
Message-ID: <20260721061459.1422227-1-ranbir.singh@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA2MyBTYWx0ZWRfX4Kz8A4kFtm+D
 c6SdsZAyfuCX12aJ6a8tZSvDaHBzpohyGDdWbdsbAsTgQGVsCHHhYafhhPGQGS77IYEtmfZB7W2
 rbhViyZNfaboBKNuDppotqpSnTjuI2Q=
X-Proofpoint-GUID: hUJUhoP7enXn4rdNmoweIkiuDUOlB8Eb
X-Authority-Analysis: v=2.4 cv=FJErAeos c=1 sm=1 tr=0 ts=6a5f0e69 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=m6x0EkPDG9ZYS6MSRIcA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA2MyBTYWx0ZWRfX6GEsx4+H+UuY
 rzzPo1EHuvULm8gOcVq7gYCLkgfJuDpSsOuoXWoktvplImn/nigHatgqr2WVWme6I3JNACavrbV
 y93Sa7lNSZEmYBJWCr5KcXXeZ+xWiggHAp6EBP7gkKIfJlALh+vDJJm48bfrnqBvNpc65KJb8A5
 gqdSGVUTN3vZy1SnxSE7h3IDQpnr4eBRkfvJs2FBrB2dxvFWLiIaA28E95V/yWekJv/haKsMGT6
 YOgq7suX/uu1itBG07zft18P3hT5l8xPgfjeTqkoHVrYA9dAMykD++wLx1zKBoegYK+zhspsEXw
 78rHGjzo6Q5+DyOWpRyULCDp3dC+U+jR8IHQbs/9N+3t2rULEuIw9TIV5Iv0ckiAtSFx3ds36cL
 gt8g1hE27a/Gjd5K1pf+xFTIYOxgIUHTgwEB72KYsjv2t9TbBEJNajj49SZoKaskJ3i35sytkKk
 Q3CeH5RTGpVp2kuU8Hw==
X-Proofpoint-ORIG-GUID: hUJUhoP7enXn4rdNmoweIkiuDUOlB8Eb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0
 clxscore=1011 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_231507_230237_80237472 
X-CRM114-Status: UNSURE (   8.86  )
X-CRM114-Notice: Please train this message.
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

Add missing RPMI_MM_SRV_ENABLE_NOTIFICATION entry in MM MPXY client
driver and enum correction in Logging MPXY client driver.

Ranbir Singh (2):
  lib: utils/mpxy: mm: Add missing RPMI_MM_SRV_ENABLE_NOTIFICATION entry
  lib: utils/mpxy: logging: Use correct enum for enable notification

 lib/utils/mpxy/fdt_mpxy_rpmi_logging.c | 2 +-
 lib/utils/mpxy/fdt_mpxy_rpmi_mm.c      | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
