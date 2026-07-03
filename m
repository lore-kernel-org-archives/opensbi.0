Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF43C43458
	for <opensbi@archiver.kernel.org>; Fri,  3 Jul 2026 05:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4BTx/drg3kfiucBM1TCELj58wZGmRauLoI4WSpU98EA=; b=Aum1FIFX9x/n+0
	hwPDdVuWZPzCXPovZeHav/LkBMHmd4vaB/kOJoscgf/qEIueUGxr/Ki/++cjVcb00Jf8yipmnh7Mq
	VK1iV5obUxU6PzeMS+jz+ZNCPzFo9t+C70B9n9t7cUVZA0LY7233rcnFeJD7M7UD/y9x4hiv/cXlJ
	zjFQiVUG5ZF4m5FiiY6/hkCNyF8Au4+R47x7thJqmkYT67w9RctCuf2JfqwWs4/oqLK7nVPTUo0zr
	cQp/v+fDJkQlJGhcqH/YkCilcmOezAoVwxBOs8TkMOqY02WtiTYRFwxK8885jWXJZLYsMqdIsSEcD
	IEaa4gNgBOEcvoUI//9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfW5u-000000062tZ-1Cnk;
	Fri, 03 Jul 2026 05:05:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfW5r-000000062tE-0pji
	for opensbi@lists.infradead.org;
	Fri, 03 Jul 2026 05:05:40 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66342asD2686994
	for <opensbi@lists.infradead.org>; Fri, 3 Jul 2026 05:05:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:sender:subject:to; s=qcppdkim1; bh=FSiGbyEpi7Ois6aR62Q5RvdkpZxU
	ioizVB8I3Bo6hkM=; b=ZO+KIPsfJTwAjcoEZhM/jN1SHEv8E5KCERaL/FwIUotc
	yV3U2PwfdH3D3TfXEF9H96lKFiH69z7x9kNXFwpgGb535c159dC/tOmPO5FpREL4
	ymehAo88Lnk7cY/IWd6NmrX34gNCIQ0T2RQNnOOAQHvAThrkTBSGENkL/SwLD32o
	6pgrLsFZaFZcvnhrFWzfRXQXYU2T1mqFZllt0WLqwCliSmgxNI9++qXO17a3qNIv
	Oq+LNNl8b7MXWTZmyhHv+/8tXGYBqm/kwIvz4p0Umto0KXgjkOBCeTw2VrPNpnFu
	CzNb2dmx3Y4DZw3CveZvwOsMWODU/CnKYIhu3LpDLg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n0j2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Fri, 03 Jul 2026 05:05:37 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c80f89b64bso2997335ad.2
        for <opensbi@lists.infradead.org>; Thu, 02 Jul 2026 22:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783055137; x=1783659937; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=FSiGbyEpi7Ois6aR62Q5RvdkpZxUioizVB8I3Bo6hkM=;
        b=JfKjCBs0ym8D99AKHFwC+An2mUP5LpP+KTvBF7YajrhIVaIz40xC4iuwQxyGj1Yj8n
         ZRUkYp8HzlB/D7ZBGMAROdCkutKHt8FCdIOY/ZY2y4Vym6n8X/+FaFttJeM6LeS+V5RT
         6h20+QBJZI90KKt7/oRZ25GHXK0Bta40IJbK6o0E1SqRaxDJ81Jkxv7L4ZPc25dn+Og5
         0cRYXkdgqOMjIyNrajhEDefLM1GEz5iIxL/kY+AyVywxIuzx+M/6Y+HorrfjviepEgci
         06K2OfoemdBydth9gBcntmj+quTvxBJl6slpyGvFgAA17g3j5nTl0T86BJCHiOpWxYCj
         znNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783055137; x=1783659937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FSiGbyEpi7Ois6aR62Q5RvdkpZxUioizVB8I3Bo6hkM=;
        b=Zg+n5Wi1ZuCnTbgcEUx0wBYIIQgy9bf0qh4Jcd7Nd32NR0b/pO1sIdDKvR8PysCr8L
         xGRwuTbKBYzM+PU9PIJlmFQ5Lp2/IIsTdKSmDzUXVAMIDnFdN+s/Kp1/BDzG5+wzxw/B
         tqvjgFETLWs7MEBDas5Xa5b2ZGoVjVSAkqGX8McQVswGWfrkFM/d8lVP8R97qQRJG2Nr
         inPjNienPb0x99LGUJyZGucbTt19yRY2f9mpFD4xjqqIN4+x7idETl54Fdy8vll6i2Hx
         uJ+64l+fsQy7NCRoDuAlaGfVufxlrsJlKoe42i9cibr4K6FBPqwoDeiFPCl5poU/Mpsb
         UuJg==
X-Gm-Message-State: AOJu0YwYQttWoTYOYEZMj7oarqw0tlufMMnC7AQGGCyiyt7We9lkxP18
	vd+TnURMrfTcGWc8/r90+U2Fz/ZqVxZNsV366u/J1EF9z4Y+Er7O18vbx/NAz82a+PCSEpqQkjn
	Ju+/4oQAjk1+Fx4AT3XBV/bsxseMnlfBLyZ2nnrEwJfVVWq/xWNaBqAnVY1S0RGEDKSatNOfVNA
	==
X-Gm-Gg: AfdE7ck3FrKkmiIjzgPXMuf21AysEOFF8sYZEFdbITxXJHCp92f0VwmpAAl9O3TX2al
	daWoWWyrA0tHru4sUbdQ8w5gGnAdOmG+Okjz/F/NSY0MHiNN+pnpLp7BR8p72A9gPmMt+OBwOlb
	uH/8gByV62MipS28aIckWBAMmKBAlf79oE/qkkYUQm5QRLLTByLR/ZOW1NAsWlDfGMgNHtOig+V
	a9cJEmaU13Bil8MydJALsHRwocPFtktInWqt6AEIfsT5neeelzOdFxJGgs6ILMuYABFPnKh4HLE
	2BX4sngyX9YtCfGYGFopZ9cVrAruzH3onngfL16LImuHykE3bUeyx347XRLzmxR4b6CI0p/9QL1
	26cuQiIXC+p4SvMA7wtkgYk8k0uAGUiBg10m1UlMxVlPuiz7nCM7SY3DtMJfRnH32/GI=
X-Received: by 2002:a17:90b:35d1:b0:37f:ce2e:32ea with SMTP id 98e67ed59e1d1-380aa184bcfmr10134180a91.19.1783055136822;
        Thu, 02 Jul 2026 22:05:36 -0700 (PDT)
X-Received: by 2002:a17:90b:35d1:b0:37f:ce2e:32ea with SMTP id 98e67ed59e1d1-380aa184bcfmr10134138a91.19.1783055136339;
        Thu, 02 Jul 2026 22:05:36 -0700 (PDT)
Received: from hu-sunilvl-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bbdc4eesm16850587eec.24.2026.07.02.22.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:05:36 -0700 (PDT)
From: Sunil V L <sunilvl@oss.qualcomm.com>
X-Google-Original-From: Sunil V L <sunilvl@oss.qualcomm.com
To: opensbi@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>, Sunil V L <sunilvl@oss.qualcomm.com>
Subject: [PATCH 0/2] Improve CPPC counter scalability via local emulation
Date: Fri,  3 Jul 2026 10:35:28 +0530
Message-ID: <20260703050530.2460037-1-sunilvl@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfX7+7oKrzac1YF
 goRO21iBowN3bQLLsUZRRbvB4xMxqvCyFQrUxChEoctHEIvX8eKl0d+OWJ1m7KQI5IYAoaboIDp
 f6UD8U2WEyTdy0/+Mr5/Sz2pWlBZyR8=
X-Proofpoint-ORIG-GUID: 9vpFGWtji09NSknwXhvjtCWUGeU6fPNT
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a474321 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=s5c9iYN7IAwNKurCKYYA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 9vpFGWtji09NSknwXhvjtCWUGeU6fPNT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfXxJhwim8JUf0k
 pcvjPDTZG4bMEnTr3G5h7LxNV0nntdpRFBEHJ6wGH+Ed6IY/k2CYviBBLk6wbvBDAWQj2deAvvK
 j4tXRIGSegwl/7xSvX00vJr2onYKk8ynNjh7nuT6k94m+s3yFZv42+gulaOjTcIGybdtIRcouup
 KYxiH06txCDZDhwzBTsQhmdOUtA09bVZlBZslMcw1zuu7nP5urmyUhCdOPXXAX9XpuELMmFIipZ
 JxTpcEMN3mXGhxshunUlZNCPAfuwS1SemytN/ghkrIl2p1RbXmhUPY7aoCssMmyAQd6crtU1de0
 SjIGYXPdvOcV5M3ckTeQzWjtRnKXMNv33lrbPeSSNe8RD8ZLmUqHW5RFmpxltzzDulcuHMeZ6rQ
 DKnsBcf1AV/qhVgBXM55ojSVSDl/VvHOE43zgvTzvrrLzp4KBdtzMOYuz38Sud3OymvzBD7eQS5
 7t/aWnyNLBrw4btL68Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1011 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_220539_354605_3C83698D 
X-CRM114-Status: UNSURE (   9.91  )
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

From: Sunil V L <sunilvl@oss.qualcomm.com>

This series improves the scalability of the RPMI-based CPPC driver's
REFERENCE_CTR and DELIVERED_CTR registers, which are read frequently
by CPU frequency governors.

Currently, every read of these counters sends an RPMI message to the
controller. Since REFERENCE_CTR can be just the TIME csr and, when the
fast channel is supported, DELIVERED_CTR can be derived from the
current frequency exposed via the fast channel, both can instead be
emulated locally without a round trip to the controller.

Sunil V L (2):
  lib/sbi/sbi_timer: Add sbi_timer_frequency() function
  lib/utils/cppc: Emulate REFERENCE_CTR and DELIVERED_CTR locally

 include/sbi/sbi_timer.h        |  3 +++
 lib/sbi/sbi_timer.c            | 12 ++++++++++
 lib/utils/cppc/fdt_cppc_rpmi.c | 44 +++++++++++++++++++++++++++++-----
 3 files changed, 53 insertions(+), 6 deletions(-)

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
