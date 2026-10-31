Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026B6606A31A
	for <opensbi@archiver.kernel.org>; Sat, 31 Oct 2026 12:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mC2EA/vm;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MSv89lgh;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Udq/Wo3W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pu84ZWyLAlO3uaUdodfM6aX57Oxz0affxqAmkxwIpMs=; b=mC2EA/vmPtX8DTtwP1C+t0+8Wd
	bH42TBppQdiCq+gx+MAmYrlJaN5C9HdLrU94fiSiNRxFY55Z2C3CCfh1Np+Y4qaHJUxVrCAdOGR0L
	DDhjpR2L4SdYpJt95D2e9CFV1CSOJBYOJnTSiFToGLna7ZAp1m4FJu9xHdKsh84Y6d7AuOmU6rfKf
	n1GV5scnl2ysSrM67i0LdOtWxOyEfNGK/PjmvSWXbROMx7fCcuLUJOhIqY/3sUIsfuz1E5GDxmNFr
	5QLEy4Cv54Jdgv5ZwGrZvaAKvqTd2ijV6Od8cTOlSZpprY2tiuHNFZUBFMI9o2TA54sXWqZKKOZnI
	RdCsWGAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN8C4-0000000DIv3-3TBC;
	Sat, 31 Oct 2026 12:28:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN8C2-0000000DIu7-0xK8
	for opensbi@lists.infradead.org;
	Sat, 31 Oct 2026 12:28:19 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69V4a6BB595305
	for <opensbi@lists.infradead.org>; Sat, 31 Oct 2026 12:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tg1P+RBQgiz
	SSukuaTnMFtKzAjEomiO8cXn2/5w7j1Y=; b=MSv89lghPWizt6oVqvPoG/1HNE5
	mZF2hiDZJNPrHwQzuRhdDiXnAjxHnSRndTwdIuJcbKsUAU/N3sXT+kgm93yRrc2I
	xlaK4ju1C+9jX2olfjJYBQLpa5+jWi0EH+lMRFCNTvYJm/iWbS6+s+AEr1Hp5NmD
	mJ2D/gHu/vtOSeWG2Pr8ClF7sK4OHslirkwhxYL2iDS0ADEdrP4dM1a2xEANgSyR
	CCs3lKT3EcXSx4RQTaqwljncSDERXxudDl3rrZI48jbSW+MXG80quZAGaVOKCiW9
	Fhp8yK8PHoZq8TR+htj8pJTHCBzPjXh7W4KXDM9tFYkuKOSWf2RWcwkioKg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn93egymm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Sat, 31 Oct 2026 12:28:17 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so3119044eec.1
        for <opensbi@lists.infradead.org>; Sat, 31 Oct 2026 05:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793449697; x=1794054497; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tg1P+RBQgizSSukuaTnMFtKzAjEomiO8cXn2/5w7j1Y=;
        b=Udq/Wo3WwEjGwH+zpB7rVSZXdgxnu/oBSBWoWd013S8K03Mqus+KBE2/ITJOnAFW4A
         kaour7PUEBUUFYoE7P9mORtMAEkqSNrzbS1iZ4uiU2eHZy6CRHcdmlVxqAumCqBN56Fr
         4mQ5AGwAAo9344E8vsQuQjy3RDeeYx1IuJV8vX508jFTJi9fGwKVnPKZ5RzF0ZZavK30
         HwMQVpM48OlC3h6PuJsZRiKwj2to2yWnCoJ02cRvG+KkgsdS4XiQqosc2UjfMb4NDtO3
         FeHcRON1INEzwC+VAqdXg39h7OgspRbNlaBvfpFyOvNlu+O4zvCptGXQwUIcO3RrLQ4g
         GS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793449697; x=1794054497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tg1P+RBQgizSSukuaTnMFtKzAjEomiO8cXn2/5w7j1Y=;
        b=Rxl9bMh9w4X5Q5Rv3uT4TYGrrOHZ8wpNijwYzBUoyqWt7i2F+VpfNc+7U7IHI8O/sZ
         k6uhpK+WTk+D/LyNk08p3HrxJOz8uuFPWiWrKMH5G9KZr71HHjoB/Yy6CvXQ2JI2rYuz
         LEgzAj5QAQlMcySGzA/nCqMCCndDXh/sYJG2uBuyPHJUz/TB9b0M7Otxn4rojjS5fr55
         PVybu/3UZJ7OhKyZF4oX0QMdk4EoVCXL79ynKlaO48uxsimnIBa2TNtSs8FLPYG/FnNf
         sW6GThrHVwZfEd7g4468zsnZL7roBOPwzXO/eNlgUCLFuMSRaBYlgkZFDoUlBOU3h6fB
         iNWA==
X-Gm-Message-State: AFq9FYIkhInisudeK/yznO6jgSTSjouKIRsJx105bz7blN7IXYHT0mDA
	BAJrKJ/LEJd3Xj+Z3rfd6flMAv+iorPPZzpvczHo/IaLH92RhAcdZypIrtWt4YlSq6KGbUoHiEL
	nv3DmuZ1eOC+446Q3ELEC74PgRbzdib0rRRgKZAm09cCmTYHAQ/Pl3Edee8C0/3noRZ0sYVd32w
	==
X-Gm-Gg: AYBFou04oeg1f5aUjiaHgCZMPVAxLHy05WRtpWq1csjwK2htgw3LFzcx9GUUoQCuIn3
	n9Yhsey54uF2ZY9to5jKC7BQhpShanIwPHLC+qcimwOXJ/nwVW6bMkCxBO4I8YphkZcepP75HKw
	qO8ZMzGhZ9LHZm+axO6tl81eD7i1nVsh3it16AJn3R1Fv361nLxf2LDAzrBKBjtf6Bq1Kc94lT0
	tNdhCIHVT0rDkQvOXXNb2zg0E4OlPUgrjjQKWL0SlQEeeuhIXF3zQOxWqUTA4mNy8PqB5jAjdaa
	/sLUPDF8a8Gvm+sUvl0RsuiXtZiseT2LmL7/XppMFCI5bK1Vp2m7N4a1KIcwDcs20eGYwE9gq6S
	NNKe4iSCuKww7Z6YS/3dG1SgC89STeWEPWxhP8ncddI5AtVjEt7L6MWqPrUtx9AXqmkRjKSSrnZ
	M6w/mppOjSAiyy8reh5L55TxX4QFJOU4mGBxCmWpLE5BqSZd34NrjsbQ4FREgDVO1aIT07
X-Received: by 2002:a05:7300:cf92:b0:35d:ea6f:b85e with SMTP id 5a478bee46e88-36a42225501mr7621255eec.1.1793449697062;
        Sat, 31 Oct 2026 05:28:17 -0700 (PDT)
X-Received: by 2002:a05:7300:cf92:b0:35d:ea6f:b85e with SMTP id 5a478bee46e88-36a42225501mr7621209eec.1.1793449696305;
        Sat, 31 Oct 2026 05:28:16 -0700 (PDT)
Received: from hu-rahupath-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4293b651sm15515168eec.17.2026.10.31.05.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 05:28:15 -0700 (PDT)
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: rahul.pathak@oss.qualcomm.com, rahul@summations.net,
        Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>,
        Ranbir Singh <ranbir.singh@oss.qualcomm.com>,
        Anup Patel <anup@brainfault.org>
Subject: [RFC PATCH v6 4/6] riscv: Add Smsd (supervisor domain) hart extensions
Date: Sat, 31 Oct 2026 17:57:53 +0530
Message-ID: <20261031122757.2572125-5-rahul.pathak@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261031122757.2572125-1-rahul.pathak@oss.qualcomm.com>
References: <20261031122757.2572125-1-rahul.pathak@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA0OSBTYWx0ZWRfX2PmrO0vOQcDK
 NOLIaNssqN+cUD/RJ3UAngaCf9VKwpR+fhXzgL7PsDo7ouezIAt/QmpZ1ZS+d/4bwVWiguyW74K
 pi71EKrTN6FicCmUwy1ppSH7/t8LUuFqtiz02Ztxj74UQKnPP04gtYS8r6SvqNA2DK/Fm8lSOUg
 HOdJYpjK0anP0UPYBWygzO3vBvyJDElEurh0iW37ExaeV4LtqQ6hCmuJgk5TbFpGYpjKbmC+9GN
 F5ALjftp+o1gqtu+ELauTKSEWCZGAxDYQEZmM8yQr2SVlxdfUNSIR+JkM8WBaSOtPc1TJS6APaw
 hAYT9lchsAbcdmmvwCHT+WOFLGaY0zqFVwqsb8V51egUE75hok9Qor1jGwJxZm/W0VFEjZVwFc6
 2H0+mDG280LWPD+4V6xGf/2guq+xealSgq+hFgww1JRMmySqgzhw5L07EpytSjnV3ulW5jTuqe0
 WHR21f6eJ9zowc17z0w==
X-Authority-Analysis: v=2.4 cv=FciiV5+6 c=1 sm=1 tr=0 ts=6ae5dee1 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=W-_n0kkjAAAA:8 a=Di_9Og4mI3HmhrfaDXMA:9 a=scEy_gLbYbu1JhEsrz4S:22
 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-ORIG-GUID: qQPZusNaig2J0QEYtsvsn9WXnWUEpKog
X-Proofpoint-GUID: qQPZusNaig2J0QEYtsvsn9WXnWUEpKog
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA0OSBTYWx0ZWRfXw7hV6lI4ljQQ
 lGvrtJGBezBPXe7abNWXIP1M0sI9FmEP/q8tO5cL/ggUDVrgbsKK1bse9obMBQSNMSqFkCQRtGM
 JNwoFwHXGXQpd4z6sCMEtuW821dc9Wo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_052818_271453_B9BF47C6 
X-CRM114-Status: GOOD (  10.09  )
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

Add hart extension identifiers for the RISC-V Smsd
(supervisor domain) extension.

Reviewed-by: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Reviewed-by: Ranbir Singh <ranbir.singh@oss.qualcomm.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
---
 include/sbi/sbi_hart.h | 2 ++
 lib/sbi/sbi_hart.c     | 1 +
 2 files changed, 3 insertions(+)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 543393bba415..eb202750788c 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -95,6 +95,8 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_F,
 	/** Hart has D extension */
 	SBI_HART_EXT_D,
+	/** Hart has Smsd extension */
+	SBI_HART_EXT_SMSD,
 
 	/** Maximum index of Hart extension */
 	SBI_HART_EXT_MAX,
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 7fc49cf7a8d2..b80a13d16670 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -360,6 +360,7 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
 	__SBI_HART_EXT_DATA(v, SBI_HART_EXT_V),
 	__SBI_HART_EXT_DATA(f, SBI_HART_EXT_F),
 	__SBI_HART_EXT_DATA(d, SBI_HART_EXT_D),
+	__SBI_HART_EXT_DATA(smsd, SBI_HART_EXT_SMSD),
 };
 
 _Static_assert(SBI_HART_EXT_MAX == array_size(sbi_hart_ext),
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
