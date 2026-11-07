Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F944606A326
	for <opensbi@archiver.kernel.org>; Sat,  7 Nov 2026 06:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GJy3i+bY;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TvKJprZd;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h1vRdE88
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=QSItZ9lur/MVfcKtGyesRuht4U7y1b401daMJxNyFl4=; b=GJy3i+bYcq+4cIRqwhy1ApyeZM
	iR8bDYiC05AO8Owo7TJg55BZ4XdcV2soUruhGXvGaw6HjVnor/NmvMIUldHYAfocVXkLMsi+aMP23
	NwsSMncFDJU3ziU5Bz0Ww0U0vYaNgm135GvKMFbtogJRiBB/+geb8MoLG1oDg2+9CV4W1X6TRBJRQ
	NmNdlqlUmfcotghYFS7BxvpTL7ssqgjLHVJG6qYVots62ax3zg4+jwEOuxUHb7xO+UGtmioJR8XoA
	Taa1i7MigjRs1gZlXaKsbHzMEuK+4RTPU1IrcGNzJY8CpCslhBlq/QPbmP4k+x+EOEHeTCVtRoV2k
	Er7j/WVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPZWc-0000000EFt0-0rOV;
	Sat, 07 Nov 2026 06:03:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPZWZ-0000000EFsf-3PuW
	for opensbi@lists.infradead.org;
	Sat, 07 Nov 2026 06:03:37 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A75e2tY1942443
	for <opensbi@lists.infradead.org>; Sat, 7 Nov 2026 06:03:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qDRYhuLdNsLRlNAa0J2W+r9KDbcTCLBUMao
	GUHuneM4=; b=TvKJprZd5yhWf+UC2zH09p204NnDaoUEFhKY899a9nOV7tDQio4
	QO+eFckJbARDzM9cv2fmJudrejojtJDc04jpvXnaoKCvjWjCPiHYExhurtYgJLbM
	jD8idgo5xgZK8xKJjon1qoqfLIguFoxLQKqQ3UfPVJ2meVSZnlqF4YAY4dzB4Kqd
	YvRJ6aXCK9tTHmWPty8YEyUROW3pE3BxBkRRaWgZdEt3fKCW/fKumjaNH32vocNq
	zi+RXcV9nyu65xMdj74MfNHUEplf3KqwCVo9jh1YZl8XoSL/EcrWq9GtqZwc0T9X
	zb60rxH6woecIhvtHinvM5reSZqTI0BkW+g==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hssbnrn62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Sat, 07 Nov 2026 06:03:34 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b20a4b5f2bso1875175c88.1
        for <opensbi@lists.infradead.org>; Fri, 06 Nov 2026 22:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794031413; x=1794636213; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qDRYhuLdNsLRlNAa0J2W+r9KDbcTCLBUMaoGUHuneM4=;
        b=h1vRdE88GjmFiGVuIcXkGqPjyyeRXjEf8AZmmv+NcyPgjrrGLePq2liNhZ4x3gg20k
         H32I8PX09AApgd5Yze4rIOAPAdBUA1VdEcu+LIiepQXqt8iBclVZUb/si94H8UVMcEhY
         5+31EaoT6Gv9yKe9WIIlwyFTQqBjP9g3sbgQ4lBDiF9yzz8YJYoc1TOgSXozdg+dKVLg
         jL2h7pJET3xxmUGalkzbo2HK5yNFtbGy7M9wVZAPIcT/Hhk/lepzxQvstsPVhjuPnvpa
         JypBvbCAsmx+YYnmTsAAkv6swQ5veYF7Bv7UCmvevw7Lv0dZgr8CuEIOUwKtMvjwNcNv
         AUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794031413; x=1794636213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qDRYhuLdNsLRlNAa0J2W+r9KDbcTCLBUMaoGUHuneM4=;
        b=LDUJOkFWXJWP5T5sblQHUw/wyO5bIahWMHA0pueWodlvxNrQnj8FQpZgMyd2obFdMC
         Lj3Od+PC8HF4az9h+0ID2g/3y8YAV2kH6DXsWjYoG2XU34V9a8nDuD8yYmtUW5xEJVsi
         Oa7N76amX4hxxP21XHAC//ksVZgQkavam/YB9p6nd1jqCv4TlvuLyoE5r9Vsft6JpLS5
         lJ/TAZkOeX/THT4UAR9LtOLWAIkRGw89LyZHi81PDtqNeD23nG7z8cv60gK9B7n7MfTQ
         F7PdeO3awzTLL05elOBUoRAWBbxDbKE5M8a2TOD6d1VY0NOBNilHhYHpOeoTGBAPlyPy
         YvQA==
X-Gm-Message-State: APuU4Z9K4i4bVcaBlnMLHI8sH9SNrdS1odMJQnSyct9Q/JsEyeGx2Fi1
	tMxKGEDVsfd64IUc0HWMtS6I1jKN+fLvVk8CasqJDuWWtG32P7uGFqhQyh8L7RueT6caQ5Iwx2+
	dtYHepfp3lCxJodLvIpwoXia4x9W/QytAEboeMUjQa+1yyZljVr7o01vJE6EMRM21JFoYt7eVyg
	==
X-Gm-Gg: AYBFou1lsCrIQeUe/0fdIi3XMfJwBcjofyQUowMLFnnP2ur4GWzao02JyHeEd12+wP+
	3WhAqbeILXsQh215NQMzY1RV9OsArgau+WM27CH4Zrbmqt+UTQcqWUKJ6gsGpX2RUwb3Vg8q+e+
	Yw6/PjCnHEpvI4FbxbMBMHd3eLCk9g1LoxLiMydhxATnBaiOgqF/3OXjaaX6b7Pcv7hNyYU0bYl
	iS++zju3c61e4a9fwrgIi/KAIKRehseXZHV9p7q24Vnw4Re4XbEOTekdKco+XKy2fcFb/rabPPu
	a0lQwqVoOA8tSLn7dpMXfzlklb/pAD4SRPceca0H5gJriHLBevZaW1j9ASeaW+7EtxGiNO2hJPK
	BHYz0U2yGC6aHbhGMjpGYqdtvfLDUlpNZHrd0bYtBUuaXbpWt7TyBTFm4k+F5jQe2VK1EqxFjZS
	JeWXsL22k2z4xSttB8R96Cdj+a+SaoVBSsA0N+Ie5UHw1gi78dwsvBV2SLMrFVWvVrSG+Sc9Mq
X-Received: by 2002:a05:701b:4246:20b0:1b2:558a:d769 with SMTP id a92af1059eb24-1b25d28c272mr6379885c88.4.1794031413379;
        Fri, 06 Nov 2026 22:03:33 -0800 (PST)
X-Received: by 2002:a05:701b:4246:20b0:1b2:558a:d769 with SMTP id a92af1059eb24-1b25d28c272mr6379812c88.4.1794031412385;
        Fri, 06 Nov 2026 22:03:32 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e407bb5sm11629094c88.1.2026.11.06.22.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 22:03:32 -0800 (PST)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH] lib: sbi: fix trigger read range check
Date: Sat,  7 Nov 2026 11:33:25 +0530
Message-ID: <20261107060325.1117887-1-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-GUID: hzyCYMBjBUHmeQJe8umYo51u376cs4wH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDAyMyBTYWx0ZWRfXyHCxeZeHbmwY
 kehAARK+VbXQ+h2uGnc7TWMFVE0+7TQGD6J/jXQjBjew/OFNaj1glRVCUkvy/0ZQIM6FZfHktys
 8+GlMrZi/dWsrbJUiXDhIP2KpMdxfleHLRYyaL8f0og5sHswNmK5mvY6hbr6FkkDcfk69qVkxTV
 DCcICa6FC7c6ZCykKQiy9ZQOxrEYXErTW8cA1BTTbOCmjNLbl6CrnuvUVo7WzIeL/HR9Rj20S1K
 KbFgP0ZOkdj5fZ9TwFSsSuZnJuyOD2l6YmKUjJXvsPjQR/WvX7BuPEm8Jk0FfpusAy9EWuol23v
 Uf/aV7+i3FnO3qSorlycqx7vRL4cEH3YBq5MevLvcTmqMIhrJEJfk8Ck7fht768ZsxpJ+qZS2/S
 Y4IzH5/H/pI964PYmBXcLc5ZvxgER4JF6t+kAW5ge7kiz49G9W9frF5b3KAk7tPbenhwrS1Y5Bu
 kxBlXSCN6Fhijp43VkA==
X-Proofpoint-ORIG-GUID: hzyCYMBjBUHmeQJe8umYo51u376cs4wH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDAyMyBTYWx0ZWRfX5q3Li8ahFr39
 moptPphNPyqS7kLQzWumQa6HDre8mEZAMtvNH2mtxhyjsPUn8jaYfTnKErkYIkR3e5P7/Ixnh/0
 47z1jMRzA/Mj2craAGQ+DTpPox/2X4c=
X-Authority-Analysis: v=2.4 cv=JtBkP84C c=1 sm=1 tr=0 ts=6aeebf36 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=HHkJKdzK57qAClA3prIA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-07_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1011 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611070023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_220335_997306_86CB395A 
X-CRM114-Status: GOOD (  12.07  )
X-Spam-Score: -2.8 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

sbi_dbtr_read_trig() rejects ranges ending exactly at total_trigs
because it treats trig_idx_base + trig_count == total_trigs as
out of range. This breaks the corner case where supervisor
software reads the last trigger by asking for base total_trigs - 1
and count 1.

Validate the base first, then compare trig_count against
total_trigs - trig_idx_base. This permits exact-end ranges and avoids
relying on unsigned addition that could overflow for a bad count.

Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 lib/sbi/sbi_dbtr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index 5f66b641..967d6af7 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -649,7 +649,7 @@ int sbi_dbtr_read_trig(unsigned long smode,
 		return SBI_ERR_FAILED;
 
 	if (trig_idx_base >= hs->total_trigs ||
-	    trig_count >= hs->total_trigs - trig_idx_base)
+	    trig_count > hs->total_trigs - trig_idx_base)
 		return SBI_ERR_BAD_RANGE;
 
 	if (sbi_dbtr_shmem_disabled(hs))
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
