Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B587DC4452B
	for <opensbi@archiver.kernel.org>; Tue, 21 Jul 2026 06:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aQFO5e31c+vCtQ33uBjLVX+sZHefXcSQcHElR/5O1qA=; b=N3S80y+8TMwsDd
	Is3kTAgqdTFItQAD4U5sgBs7cHG3EyTnMGQbi7CAJFCMbOK8Am3K7lmIVOG37VTWwSzp+IdujCiYH
	pAJosJgeGoqwzdBzpzhc+1Amkkq9BPwehVKYV8/Ts+ZlAhZVixATYBk6dlRwGv8AfUEIaAYekb4Ro
	JpSZwAovuxhYDltHXYDQwce4poGfpiDY6CdlSzrxgr9frn+w6aVTXBGIoihSIvaKGflZO5+sGUAa2
	JjWKm66NlhmcKIV+cAaTNjtdGepzlz8B38PNwUWOmuYenGBfzYWnVgYURT0JNuALm+tn3hbPngYQ1
	U+Jc5EgDowqmBUTSyFsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm3l3-00000008V0d-1tQc;
	Tue, 21 Jul 2026 06:15:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm3l0-00000008UzE-2kJz
	for opensbi@lists.infradead.org;
	Tue, 21 Jul 2026 06:15:11 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L4ShLH526991
	for <opensbi@lists.infradead.org>; Tue, 21 Jul 2026 06:15:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Nx0ZCXlw5Jr
	7X7I929c9Ci+Gk5DE6WhMraCU+QcjRJo=; b=gni498I4XEtiduG5B66RxwdUVrA
	dyzf82zT7kxhhiRTpt611cLZGZDDvfuF4aCWLTf2iNj+Frnq7duMMNpMy+DCV78O
	tQjui8SMxltO+noJ3S3JjgIsBdVicaJA97ft33OclAAdsR4GUzIIVZfvOcmnXrXh
	APjPwAeXc6vrPNQF+PtsG9TfwU0hCyCZyVqKXJrOj83J0WJuH10ytXYKmx4LGzWh
	ycaja4nHxoYiKDZIENWnBUdpJDOJ88iqdJaSZEbOvgqT96mX1Vcib5vFIpDugn3h
	qm7pL7r2H/TOaZW4P4hjU+F4Qg54u+K/c9kAi/vlXNoVZATVr+zfyBTcZMA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1se0bqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 21 Jul 2026 06:15:09 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb7049fa552so1681927a12.2
        for <opensbi@lists.infradead.org>; Mon, 20 Jul 2026 23:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784614508; x=1785219308; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Nx0ZCXlw5Jr7X7I929c9Ci+Gk5DE6WhMraCU+QcjRJo=;
        b=ipSLN+R1bMAx4w+PP4DGZOtGtsjLcjci7BDkGamM4BiLvgAWGt34GJuB0+iIT2AIU7
         ChLg58zAxiBS9iULo0GkqMFZ3Bz4qfMkDiaNWMLx7dO2Fe/zJuqaYbltAAR5UCzFOmsB
         V/fLA+XcQaL1IfA7cPefdD6K7bANvX57TvA0RA3tdZ+bUOpTfgxeglzcz9QMMmO3Ab2F
         pxpZ8qH29gQm5rCHAk1cMmKftwZaGnQjPfU0fFn0UvR1GcKBAcy+vmU2oapmdmeDGKyX
         Zbb6pWg4NUt1cX619o4OPbXHcGd0DXXt1AQn1B52gzFCX4nOoDm2JRQmQMmPtkSFD2yi
         v51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784614508; x=1785219308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Nx0ZCXlw5Jr7X7I929c9Ci+Gk5DE6WhMraCU+QcjRJo=;
        b=rcHlAadq3yvPQfSq/PqxNDo+zJ7E1gDQaEcrFbv0QeJp3BTk4TchK9xDhrRyJ3AGco
         kYDoY31u4tRfRDW9gPxGkMKa26h8VPmlRseL1P9WgLFGUPIqR8wpC2p15aV/mX/aucP1
         lXq0jJN2HAL6FvsxEoXSImn34a2x5f/mx9/587G0tJmEtUxLmvpCZEQ1uu/+PL0pHnMu
         y30KPzgixsImuGtXq2NDpT3AdtRtBQEbO2MzwTmGueFEiPU+UNcjUp3G+NZxD8TZ6VJS
         K52I8QrL5uK0M8FJ1WMwlCAbju8LnuRq78qBxxled3f/ALfCwSwkX6njnZQAfvyxwcOU
         8/7w==
X-Gm-Message-State: AOJu0YzVHD7f0ug9jx+GE12TtWGlm3UuDvOmV4kB1w7gE3KIFRcpUNrY
	xVHCct4mybuq0rl7aoUCa2BESqNNNKHKNd1Daj+DWkHaQQrwuhp2J1hWGBjaaEa+cZiGwubWR6p
	8qTtieHnca77VBtCDhbGRKrfF6qdsvvnVuln2AiAIUip6dHUqkZvMcbrMzGb1GNCe3M9ZE5i7Eg
	==
X-Gm-Gg: AfdE7ckryzLdtvYM3uQYE/Ow4nVX9iYT060653N2WMeftVAQ4+DAzGX7naNsNblUeZl
	xDyJPogCIyvzKPn05KhUGgoECyG2xuBWaAVEG6K9/nfcdsNAvPNqT/MFMK5Ah3Akr0AklJNBfjD
	dWQTTa5GbvEtN4uexXDHtrFacqhxRk9afOVu7fK3Ntgy4we2ddlXf0ti+CCnS6WOVUFO8+ykoXl
	+Pv1BI7RC7IVxi0I/9P0nbVWH6lrj8L2SqcHyg6Jc/+B4wz44C8at6FDdPZG0ZYnHBE0sjkEYtB
	irIKS0F4Jou9Fg/Yfa1/ZoXH5+eQLOn1TbhYHArO+u3Qnyv7J9l8R301eQRogAtxLjbCSt72Jq4
	wsD9BQBk9G3MQmky5c2Lt8KWNPd6eSHz52T1xKW9BF/rRi4lrHKtkJ1iqEoaokcmVpJWFhagovv
	XZroWo3SnHhxb2Jdw74Bk=
X-Received: by 2002:a05:6300:8053:b0:3c3:b57b:645e with SMTP id adf61e73a8af0-3c3b57b6909mr14365511637.5.1784614508491;
        Mon, 20 Jul 2026 23:15:08 -0700 (PDT)
X-Received: by 2002:a05:6300:8053:b0:3c3:b57b:645e with SMTP id adf61e73a8af0-3c3b57b6909mr14365483637.5.1784614508004;
        Mon, 20 Jul 2026 23:15:08 -0700 (PDT)
Received: from hu-ranbirs-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20cfe3sm46059054eec.30.2026.07.20.23.15.06
        for <opensbi@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:15:07 -0700 (PDT)
From: Ranbir Singh <ranbir.singh@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Subject: [PATCH 2/2] lib: utils/mpxy: logging: Use correct enum for enable notification
Date: Tue, 21 Jul 2026 11:44:59 +0530
Message-ID: <20260721061459.1422227-3-ranbir.singh@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721061459.1422227-1-ranbir.singh@oss.qualcomm.com>
References: <20260721061459.1422227-1-ranbir.singh@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: gsro0EhYr3L1ff6HjdW4LCM-Kf1Iy6K3
X-Authority-Analysis: v=2.4 cv=TIZ1jVla c=1 sm=1 tr=0 ts=6a5f0e6d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=TUwXktB768aEqdBAUQwA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA2MyBTYWx0ZWRfX4RR52YMtV2gl
 eRC+xJIypKeTan2Lp5Fsdc6E4Ti6cLKbva3Otj5xlUO7UMLsL+oTly32/6DG8bxK7geZLZ5TB3n
 DOB3nRPieg3uyxDqItj2Qt5l71vFBbc=
X-Proofpoint-GUID: gsro0EhYr3L1ff6HjdW4LCM-Kf1Iy6K3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA2MyBTYWx0ZWRfX+9droedk4rSH
 BLTpp5F8OVIawbOaDazMO9Xo8+NBb6YZ+Ytw96NcQfMU0Y29gWLy8LUqNOZE5/oioMXGr9VC9qY
 fhq2AJr4XoQTH4bOWBhtuSa3Io2GgN688/NQyh4tE/4b0GkB/jlYzjKrl1GtlQ2XIsalfC40WOZ
 kiyceFdF37Z8DPMls0bq0P7+JaTvF7nn25Ht1dLCELB3Y9ERSTHDgVZ6XUgjv9UfZ/g+pwNYQnu
 WRZ2aF+8p3OFg+R9SacYT7iQfLpbiKwOGT+uI5G71Ckg75/LiT1OV03X+X38DGme15R8XlvYinN
 /zOFj53SYOAXPTLVGdjiycTyl2dPg8Gk/wD5r2K6YuMkBDZ0LzLSwlXQibxJSXfPVCbOq1YNOZr
 Or5h0e9ljNKhVobBfXrJ9N726pOsw+Q/7Czcbc6wA644mOe30TUQgc0zOIhGvuqRF4mmA74em5y
 6T3TOo3Wz2WVVaF3p6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_231510_811693_9A17C37E 
X-CRM114-Status: GOOD (  13.62  )
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

Fixes: 262571217c75 ("lib: utils/mpxy: Add RPMI MPXY driver for logging
service group")

Signed-off-by: Ranbir Singh <ranbir.singh@oss.qualcomm.com>
---
 lib/utils/mpxy/fdt_mpxy_rpmi_logging.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_logging.c b/lib/utils/mpxy/fdt_mpxy_rpmi_logging.c
index e8f085eb..1e92053d 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi_logging.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_logging.c
@@ -11,7 +11,7 @@
 
 static struct mpxy_rpmi_service_data logging_services[] = {
 	[0] = {
-		.id = RPMI_MM_SRV_ENABLE_NOTIFICATION,
+		.id = RPMI_LOGGING_SRV_ENABLE_NOTIFICATION,
 		.min_tx_len = sizeof(struct rpmi_enable_notification_req),
 		.max_tx_len = sizeof(struct rpmi_enable_notification_req),
 		.min_rx_len = sizeof(struct rpmi_enable_notification_resp),
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
