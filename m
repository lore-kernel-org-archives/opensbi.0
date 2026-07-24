Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9282CC531FA
	for <opensbi@archiver.kernel.org>; Fri, 24 Jul 2026 08:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yBKGTjZ9EFWo/z0pduHe1iZ2UTgd0IL3/JAPj97WAlU=; b=JOougF9EULgj3n
	PtgC60JYex5oiakVDUXUyjKFJtGg6dqu8wWil5abQBqzTMk1C5zkSZwydT7bkMD0mhFrZAQAUlMuK
	AYOuLdM1D48Pmd//U1B86I0XdSAOLk3P7yphiinGUvdMRriLducbizZot0FKhuI734DnzLJuXCr/z
	EVvwevMnqmoRzLgkDxhRTPAkGeRwKnQIUKP2h78IdOr8jAcSROahPdRLd6sByZNLd338HUEBqhbBi
	W0sUcQ4HTtP3M5rL92jVY2oyZpHtGfv/40KjNxWg8HukakrXBxUrcLW7p0DIyJtQBYDBIrlQGKvDA
	tr3LWSuVixTyOEhu3ayg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnAyI-0000000Flht-1eAv;
	Fri, 24 Jul 2026 08:09:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnAyE-0000000Flep-2An6
	for opensbi@lists.infradead.org;
	Fri, 24 Jul 2026 08:09:28 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lLT92276413
	for <opensbi@lists.infradead.org>; Fri, 24 Jul 2026 08:09:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=IaeqKbVqWV1dZ+kpBQl3N02Nn43cwKek7lC
	bKCcw8lg=; b=X5C3XK1B8+kn00mlCFO6/eFYH4QtEeAQPYdtPv4MvpDJgfenfk/
	PLJhyzC3FMtbSNY0nDfselY8Ct51AKEOOUmmfXJnuSJkruPw3oc9v7zTkCgDjcLy
	2SbTnEPlRGrdSLpyff42H/ns+rjtsKyF+SR9XN2Q+SQJNXuilRJSY5TzNqyWQsYU
	mL2caMqOs91AQefR8k7HYb9NL7zm3HsLXSYI9irzIpwc5SPkjt+enPDXp6n2qt/r
	57IxrpsSpvfXSlZQVg49T+jdGcXRqM8pNl9hV7ZKsfs+ZH2g3I43uN7dSSy5lYlH
	f10EeOrFA1EIt8mCRjpXzuatAWti89KKO6Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa0as0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Fri, 24 Jul 2026 08:09:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cd01a14e81so3049855ad.1
        for <opensbi@lists.infradead.org>; Fri, 24 Jul 2026 01:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784880565; x=1785485365; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IaeqKbVqWV1dZ+kpBQl3N02Nn43cwKek7lCbKCcw8lg=;
        b=Cp3JzkckwNyHAPbwAUZ+3l+Lrviq3J0x+9nB4d82vnZOHzu3u94OdP2AeSQGdyIEeT
         8MqgujWPkiPxV47nKBSSNs0r9j8UsewHiKiL9Sw075xFdyEC6ZTqvPg88EttcVNrZLPF
         wrP3MNKaCGyprBoGA7aDQRQZmH0Pl43B+qxxLjAEXVmX9ayNKvuzF3JetRRLQVrGwiM+
         Z8bmUmRjrTvEeFZ89DfU0HdjpmGZbpIZ2LkBIBcHFvfaOguqOaYooL9VclBiwg/zWC4k
         R2H2TA0Ud9Zimgb1KarhARFjmed+0GoSHSGC3pkFT5bttMMMVytjpIPyhlaCkG2VKH4X
         J/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784880565; x=1785485365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IaeqKbVqWV1dZ+kpBQl3N02Nn43cwKek7lCbKCcw8lg=;
        b=dxRQK4qfntS+PvpReklKNoxlBLxYjULDaKzi/jTQ4WhJozGgfv7q3TRglUHOxLJ07x
         VYUF1pOjy9GPgol6dnv+3D8EmfFL+Q7H0I6ygM9axOCuayzWyYw1Pqpl8CODg3piBzZ1
         pTwvp7dd2suQR48E+F2kvPy8Qf7voz44kVLDbcQ+TdN4jTbx9TApcKc/uKlu+zFnVMlW
         dUd+krHd0NabnQiTeTIgR+ANr1jBlcglMc/sLyW03iPFEME4iyIaI9cN70tMyEplQvds
         Ojs0PtZk2hgxq7ztxfU7aVx5vym0kPrgU8DR+y1gUHjJ1ErxmFDcIBW5oXTOboK7dLJH
         tdzA==
X-Gm-Message-State: AOJu0YwBMAunJCjgAe+fSz4MJJHTdkocqpUHD52GRj7eJKz7CI8zhSMq
	vF1Kz3eU3+cVCxxbvD4tDO16ETfh3KaLPJvgfQoI1dkmC0QPPH7XY3/56PT+JUqxbJ4ceEXdUWV
	QNpbW9i8is87swEpDbuaTxPPvYNDg66uA6OmBVmHLY9dmMYxS/9l5j26LfG9obX2hbvh8xoLiCw
	==
X-Gm-Gg: AR+sD133bcpXLERrOjQbYzszOeMAEfQW9BUziulmoNFwrXSOTdaStw0D4FVtn5kQ/iw
	UexKUNVRXNY/iOAEqCwtN8ozQbbT/ixPzfaWUd5a7F0kO6odcgkiNBasR8BYj+niJx0+9/b69f9
	vVO4p4OPOtX0uvClL7b/K6q+tye0rq9KLuiMC0s6PS8VMT+7qOSiuWpfmc6xTXkyI+x05bdRcDB
	I8i36n5ZUCq3oFtT7Uqd4CZDTADkpMCsPJYyZWuQ4Ytylwcae3n434cPUnowdWxMklBSzl4SEgi
	jfoKm2d5O8VvCfWKTXsvDi+CUrjwl2EAkT34vK4TcHXODhFDjttnuGdpNo8VKDpCfdlmzJ6XOHc
	0kvzHX4GoWmtzjCFGT5pb2GkTWQDhTaTdkvEpw3vW1O+Wht6+Kaj/pQcSllB2m9cYY9t/cpaleO
	a2g+QyzrW83PFuHD0IbHQ=
X-Received: by 2002:a17:902:f68c:b0:2c9:97a7:b1eb with SMTP id d9443c01a7336-2cfa6f963c6mr71986385ad.42.1784880565381;
        Fri, 24 Jul 2026 01:09:25 -0700 (PDT)
X-Received: by 2002:a17:902:f68c:b0:2c9:97a7:b1eb with SMTP id d9443c01a7336-2cfa6f963c6mr71986185ad.42.1784880564923;
        Fri, 24 Jul 2026 01:09:24 -0700 (PDT)
Received: from hu-ranbirs-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc193f8sm45810741eec.1.2026.07.24.01.09.22
        for <opensbi@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:09:24 -0700 (PDT)
From: Ranbir Singh <ranbir.singh@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Subject: [PATCH v2 0/2] Fix Enable Notification
Date: Fri, 24 Jul 2026 13:39:18 +0530
Message-ID: <20260724080920.1629065-1-ranbir.singh@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: N140RVuCV_u9vd0fz0A7D9NUOApoCwL2
X-Proofpoint-GUID: N140RVuCV_u9vd0fz0A7D9NUOApoCwL2
X-Authority-Analysis: v=2.4 cv=e/k2j6p/ c=1 sm=1 tr=0 ts=6a631db6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=m6x0EkPDG9ZYS6MSRIcA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA3MyBTYWx0ZWRfX7+qQhNGFofOo
 2sGXwlO3N7DYeo+aBNVjYwdAaS5Yk1Sc2nzGxX5ZwGT1LDIEfJ9pSrdNGgGGSZqeSwM0fptpA3E
 VShhC7L/xFl5XywKsbvKFiVdLGt+Aq4RcyI0NhOWHzi2a5iK2b9EMrO8aMplWRYDyW14ojS19fR
 vuEFrAvozvMFQD/kPXQx/1+/qPCD9/vB4NSHQEEgghc5JrbmCT9IxlFx/R0hFSOKY8oeeCX5Yx+
 mApyuqKyB5PqDpYCQ6NrCROoIiJbfxnWF9bBQOFZWako0OcHmT7TcyO7NwKuLzGTPFc9VxgaQuk
 yPoQDQoI2upotbdvZIIsc/TAtWQMRJ1mkY5FZGPTVrjoFJwAEow+IBcgtDYWZhngZ9td0nG30/Z
 zzf1lY9VXW1lL6Oc7zBnIu3p6ftbZEu+xKfD9MhP/XpQZ3UUKn72G+xT8IEdvUV1wrqQ9xPLbsz
 aiOcxvFSuyTXE7KeJfw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA3MyBTYWx0ZWRfX/XD3TOGBYDwL
 zNb7SbguYaSyaj0oE0X+YnwXe1pzMxf+bsc7+8AR/VoazV0FPCj1aXjunmxPVcVCqEDfN/dCkku
 7TbOu8z2H5ikTXzz2NrXcbaH5bnYmfk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_010926_579115_A2049BA8 
X-CRM114-Status: UNSURE (   9.26  )
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

Changes since v1:
        Added short commit description in patch 2
        Added Reviewed-by tag in both patches

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
