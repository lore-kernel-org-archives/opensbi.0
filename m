Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 666BFCA5FC4
	for <opensbi@archiver.kernel.org>; Fri,  2 Oct 2026 08:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PeStl7idPoUN1BSlGlQoslmMU9CyFgQagfk3Ai9X0d0=; b=GFkKnZ1VbUOQT6
	z6RB4xPC+dTAAeBoj+ZApw19h9CIrv2oRqcxeMT2nCuoWmSN4oS8BwvA3xFnZAVsJyolEd5pFgfLZ
	j+EaeRI7pxui+CvOI4697szu9WRc8gwRIPGjBtCSO1cfTCnp3GwARd4dYrUzvBvnV8c2mMg3LraXb
	rsamsSbz7a2o6OGRJwFjMmjMW/ssT5sucQAmMZZpWSYHitzmdDwfSMdafy3ByN+6+rFd4dEUFDmZa
	tLlTYxC/fpWVboQtQHYruK37mn4xjsbsbjFtZHZH+mr4RbtnBuzdyuwA4C7ImRvRXlQJ40JCvgPck
	3RFpCxqytJkCt5tZx67w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYfM-0000000AzIx-0VoA;
	Fri, 02 Oct 2026 08:30:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYfJ-0000000AzIQ-1Qkr
	for opensbi@lists.infradead.org;
	Fri, 02 Oct 2026 08:30:50 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6925jMv74020603
	for <opensbi@lists.infradead.org>; Fri, 2 Oct 2026 08:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=B+a0nDiv0/0xDHr5lyh2WBiZA4c5Lti2wj9
	g8XJSzUE=; b=fsO0kqnZwzcZPEo+Me/EmjbBGyKVWSdk3EM5yFJG3TkJiNq6Fx3
	T3qUugpNybrScFtTUnAgq06vPu/kMePnyTVCh+/VfNNcDC+JrQz7V7qHZpU5F4BT
	t9C1R7mjiYnbLNKfrMLAA/rIzDWFoEIQu0U6vOkswfRN8wRzCX0DQQgunhWP5w3h
	abggbJLEpaoh3C4+MjUQeNsnATQ4D9FT/IHDU2WLxAYyNcF65YQUaZfmCOHaB0jo
	NcKBQ0e5zJAswOib90TiTqAmxwIrakkmeyRxcjvny6wOqSfewLEUkY+PZZu8pZNL
	3MJQqeSAo/3F4R9f3yUXI4nYJCPx2gmOx9A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1rvqbtdf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Fri, 02 Oct 2026 08:30:48 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34ef5fd7934so1176917eec.0
        for <opensbi@lists.infradead.org>; Fri, 02 Oct 2026 01:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790929847; x=1791534647; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B+a0nDiv0/0xDHr5lyh2WBiZA4c5Lti2wj9g8XJSzUE=;
        b=CwGN97xpNHIwD9NfadUguiTDjnk6Vbw7XMDkAaLp4KB7CDKySvLSAQd15km6DgduPF
         I6quC1+iErvdFjgwVroaWAzx9876LRnZcQcmaEWH8ntE5xNgvr+BuANJYr4BOVvE3W64
         eLi2aRWazn7qe6fmBefvER4auIHMdOSKxgau9u1ENm8JftlWMwbKtIlZ1vZkmfa1D7jR
         AVeyu93TKVgB8X+/4CuJHK7HJNfBSGFDucEx+mdQwj6akFKh/+YSHJzRF1aVgexCOtjF
         9ZVyKBXPF43wQltouCnRqzw6D2u3lzjyysOosL2xC7A92A0Rs3qkQM/2br06vkqpASYX
         Pfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929847; x=1791534647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B+a0nDiv0/0xDHr5lyh2WBiZA4c5Lti2wj9g8XJSzUE=;
        b=B7F/KncM07jj8nCuqdmeCctxVZW+mZQzN3Yd14rZv8SHluZmH8Y0DBvd/NqrWUiqUw
         9zNO++iWGfXMjYJaQ4JLRJXdQ8Ennw3QGtx/KMNdPQLM4mAhjkIIDctAxCIfdaK4Yw8B
         wIpaP17bQtTevpecXpX8UxsfA/+5VX6LJYvubyzvbNj0wUh6LKEnEQBoWCeoolmqUUp6
         6GIcslBkM7IsauzvSikUatqAp7GCM4ZF5potE/yUlyTwUcww8Z48GdVVsHY+5EgUhrRH
         YeU7eKUgu0K13KLKrPC+a6jw/egrwPGIs7jzy+81EWeo1T8x5lR5TNtMJDIkdX2P11Gu
         bV3Q==
X-Gm-Message-State: AFq9FYLN0wqfdsenXdHxLosf0uueUOnpLO5tfYjQTjzEvIteuMAH/Shf
	Q1acorxbGIRCyeDXt6zKJAVEY7s3DoSK7MGCBqBBWMh7kKCGIVS6/pXF2B5XHGU5zwflNH2Qcb7
	33E4orVw1SoZSuWfl5CQ3gDjFmyXGEPU7y+EFDNdTP6gW5elFi07aWhUNYvPb1LTbvBuq1kf8Cw
	==
X-Gm-Gg: AYBFou3KkQVOjTNdeVnbL8tFCiJyWVO+/YAdU+4v114rOyk39W03xZYFBKGNoPP7yJ3
	MPrOMDzXuA5FpT/twvbsAma6i4+FocRN40wmM26R38q1JqL/1CDwxh4uHl0Kq2xMhyZZa3OvAVN
	mRM1pYTGoOueJOphRlHWSDY2Ac+awGk7M/cfSJjMj+QnClcENa3bA3bkJVdcDF57I463SBxwkwv
	87Z+IIYV9wKRJ2hf71zAbk+0zQF1QGKMbEvij71GulmDiqh2k7gip1JNvBGNKYQolMJrZ5NeON+
	rPTnl3aoO+bPRsqFHdDnx1lNwX6yV1VY/36kNYoP6rhuPZWzp6F4vm8N83lIti6fXEl1Og15bwZ
	AIetGiZK8WUgKKI68yM1WUfDtPmNdOInfyfvkpGJ9c4dx3HtQPsjwoWdJhd5rIcMnkLasQU4cor
	3Bf52ZLjQQV2u9
X-Received: by 2002:a05:7300:4352:b0:33b:f8f9:c8e8 with SMTP id 5a478bee46e88-34f14f0d996mr3444640eec.1.1790929847251;
        Fri, 02 Oct 2026 01:30:47 -0700 (PDT)
X-Received: by 2002:a05:7300:4352:b0:33b:f8f9:c8e8 with SMTP id 5a478bee46e88-34f14f0d996mr3444587eec.1.1790929846587;
        Fri, 02 Oct 2026 01:30:46 -0700 (PDT)
Received: from hu-prajn-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f067301b5sm5208850eec.1.2026.10.02.01.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 01:30:46 -0700 (PDT)
From: Prajwal N <prajwal.n@oss.qualcomm.com>
To: anup@brainfault.org
Cc: opensbi@lists.infradead.org, prajwal.n.oss@gmail.com,
        Prajwal N <prajwal.n@oss.qualcomm.com>
Subject: [PATCH 0/4] RISC-V SBI watchdog support
Date: Fri,  2 Oct 2026 14:00:36 +0530
Message-ID: <20261002083040.2533097-1-prajwal.n@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzMyBTYWx0ZWRfX+I4KVOsy9hE6
 Q6TDU3RrPiJbrSjLZQw7kbMvgt6Q2qapgV4RLqVDKvzh2rP8oYDRArmwA0WITNViaEnEB4IiKrd
 idzebvWkpIeuo41IOptJYZq1cSumfCzotwwEW6SVlXkjOV4G/7LYae2xZt/DjWYYaGBBeDzAgJG
 hFpcIafTpA2HV1qfN3YJBHJotwS9Ww0h9nAyIbsOFsdHEWPR8vM0h3MpKjVSHbaBnZCDmYfQbYS
 xalGaMDeJ+lqsQIGxd+A5dvUqogcnwZ7CKzgrXAlJT5trTVisjHGeyTUJztutyMY9ppGghgzwpI
 Wy5J4BLtOeppY+anW9UeNqKqhXsm1I4e/f/B3ZOKuIIDCgjC+TBmc3Ld7wZtm77UGD91AJjhoSk
 DtK6s1jrjaeSLCkCmaBHm1ktish8pWjsUKUd87C5TbU0egkbe/GRvrfftemKywduZ+jnWz0IRm/
 uX7dO0SZ85UduEqdxBg==
X-Authority-Analysis: v=2.4 cv=JIauIMKb c=1 sm=1 tr=0 ts=6abf6bb8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=Va65iYnjnw2_XThs2L4A:9
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: Gm4Zldo9k11MmFSFSCgmjUX9_pEj0Rcz
X-Proofpoint-ORIG-GUID: Gm4Zldo9k11MmFSFSCgmjUX9_pEj0Rcz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzMyBTYWx0ZWRfX6L61TYbM+KIV
 bC0Wbewlx8NA0opu1iH5vkhVavi3bfr1cqXt2/2oi4msiihScZ0wFfWLCsS8kC7zvQTdqladu89
 bY/o4bq5MZkDTlGlPonHGPasszcs3zI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610020033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_013049_384486_244F654C 
X-CRM114-Status: GOOD (  14.37  )
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

This series introduces support for the RISC-V SBI watchdog extension,
which provides the watchdog functionality for the Supervisor software.

The SBI watchdog extension exposes watchdog functionality including
start, stop, pat, read and write attributes to the S-mode software via
SBI calls. The extension manages the watchdog timer in M-mode using the
system timer.

The S-mode software can also optionally subscribe for
watchdog pretimeout notification which is delivered as a Message
Signaled Interrupt (MSI) before the current watch period expires.
On watchdog expiry, a platform system reset is triggered.

The series consists of the following changes:

- Patch 1 adds helper function to convert timer tick delta to a
  specified time unit and a wrapper to convert the time tick to
  microsecond.

- Patch 2 adds the SBI watchdog extension ID and function IDs
  for supported operations, including start, stop, pat, and
  atrribute read and write.

- Patch 3 implements the SBI watchdog functionality including
  start, stop, pat, read and write attributes, pretimeout and
  timeout handlers.

- Patch 4 implements ecall handler functionality to delegate
  the ecall to SBI watchdog framework

Prajwal N (4):
  lib: sbi: Add timer tick to time conversion helper
  include: sbi: Add SBI watchdog extension definitions
  lib: sbi: Add SBI watchdog framework
  lib: sbi: Add ecall handler for SBI watchdog

 include/sbi/sbi_ecall_interface.h |  33 +++
 include/sbi/sbi_timer.h           |  12 +
 include/sbi/sbi_wdt.h             |  72 +++++
 lib/sbi/Kconfig                   |   4 +
 lib/sbi/objects.mk                |   4 +
 lib/sbi/sbi_ecall_wdt.c           |  79 ++++++
 lib/sbi/sbi_init.c                |   8 +
 lib/sbi/sbi_timer.c               |   5 +
 lib/sbi/sbi_wdt.c                 | 455 ++++++++++++++++++++++++++++++
 9 files changed, 672 insertions(+)
 create mode 100644 include/sbi/sbi_wdt.h
 create mode 100644 lib/sbi/sbi_ecall_wdt.c
 create mode 100644 lib/sbi/sbi_wdt.c

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
