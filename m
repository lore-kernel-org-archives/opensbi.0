Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CD7C43602
	for <opensbi@archiver.kernel.org>; Fri,  3 Jul 2026 05:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rgYk181l3NHGa+lrzTjcD42euIpB7tJdwVG6nyShcq8=; b=TVNJi8qjv7F4cZ
	0Wlq89z2FfYs8UU7ZvPue3PlFm4pWhrnup6OjxU02Og5ncuS6K+YNUmTKKp+tg4D5Xi71IEZMi1ST
	eL9rkGyQmkgm4ZrF7P5QzFIFU+kcK7cxeSSb9WCtJXwdr5vi5ED5dniegoPnPo2MhJKcN9fY8ughq
	k+s6a3zMLLr86Yws9zeMTgV0rMTjzfOpegBDczROf9Lv6z052vFnqZXR3siPLK1qnXvQyyAuedPD0
	FixB/MhAn+W9nmyZrKRgJ4ZHvfuIaKbcXi5fANY03w7Oq7ux4zH5MK5cTtpPskH94RT+xUrddU3ni
	MuTqfk7DqhLZNiLf5OyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfW5x-000000062uQ-1ee3;
	Fri, 03 Jul 2026 05:05:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfW5u-000000062tY-12e4
	for opensbi@lists.infradead.org;
	Fri, 03 Jul 2026 05:05:44 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66342rHH2706140
	for <opensbi@lists.infradead.org>; Fri, 3 Jul 2026 05:05:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:sender:subject:to; s=qcppdkim1; bh=wtOM
	n+Fj2kuVtpfxeHD1BbWE4v0WXhcGhzp2ft2gCdI=; b=ovl/ZZh424cbVrxwpTUz
	x+hXuHHZiE/C+qqLugxegWmzH3k+mWjbQPlXua4RYpCSFJxIPWX8vgqAkFTZ2I/c
	QvmlkIeNWtPVefXjEU0kUDY+PmW/dNPPPY6unXnqItaACJdJm3ZEEm/enV6DqAcZ
	Lg/Z/SulbuPmcP4z7GnAGX80CxS0PgEeE1/G2TM9pGXQa2TufCj7XZ7AidXnu9FK
	PhCTU/tA8sn3lNUHJRa1apzxV17sZuJvT/+Ha1aUnb5igVg/aERntvgHRW8n7SXa
	GKfWPlG0oEghWN8NSju7Mb76ZLGvwTrBwQyQl91K5I8floZN7QTKYHGxwWsxNW1i
	YA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n944a9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Fri, 03 Jul 2026 05:05:41 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88da04b719so166019a12.2
        for <opensbi@lists.infradead.org>; Thu, 02 Jul 2026 22:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783055141; x=1783659941; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wtOMn+Fj2kuVtpfxeHD1BbWE4v0WXhcGhzp2ft2gCdI=;
        b=CGJ6T2mzBRNUJbce8xdxGQOpaMHSpyIjQXm60qS4xpS9IuIQHfX+W825CaXMb9ZWv0
         kmfTYhv9VvkOrzaiUX+xooECtn/hYVD5aPWg8emOguH42liVJQdoQ7VosQ9o4ERrmbXb
         rAafLwk/SUEX2TNsR69xu3bbljaySorSDnNqiCMt4ZFqL+h6gVRZLnB6VM4CtXKv+MCR
         155GWOM38JEK/cBQgtoDVXa9BSAxtJ7X8SaLjVkBTMuBKd7p5/bdvR9WOXJ9pKAnpCI4
         YlkDpKa6j6Ejd0zYbXAcMoKB54HElyyyODg+DwelWjNrqzpaRKVJCSAUW7yAbL24Cnwy
         d56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783055141; x=1783659941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wtOMn+Fj2kuVtpfxeHD1BbWE4v0WXhcGhzp2ft2gCdI=;
        b=YsFtaHjnZiQAAnUDNP5t8Bz2GDt+n+Hq//cylsk27//OB+NIT4g0CHtxRU/96oumui
         BczbNUE/eB3eYSp/v71c4Uh3ujc7DaWNxkL7p/xNmYZb8gNZE5mgUxFAxPphilYOeaUP
         yOEkhkVBMrJDzxIylnS4n904f8SUTUNlM1mX0rp0P0Fuu5ZWX5p6UH052qUULWrXAdbb
         Xbo9HtEOyNaZA59y8whJW+1LouxpzMqjq05HF92QUpswylt6Y62gP+BYiod5PFMXWgTA
         gTqkqHvVGk4HRaxDoMQibMXX2vzNOQ5NXJmKpo9LdN12FLwWPQTbMD+NEB4GFjEAuyQk
         iGAw==
X-Gm-Message-State: AOJu0Yw6SebwSeksNWcbLUKQ3xfOp116rQmuLgqosPGhKeO+u3nnfrLC
	Eqyv95vRPHr41hUinLQmfOa2wQ/AaUx43g+BGl+4TfZPJg4QuCDH7EW0SwhlNQvuZWdAwj2N40o
	m/AthtxPXWpWgHBwhRqiUL3NAqJDPlrV6DPBftaVrHNEr0T93rJInnIuSp3R0flGcfe1EQGaDBQ
	==
X-Gm-Gg: AfdE7ckyiC+GleLa+Egky13EGY1kXR80KL93XnLP9KLaw1nhF1LE/czsNsTjZ9mEQQv
	7bolOrH+R04tE6nzP/ElwjpiS4mZ+PhcF2EuqPnlnC34yWFFgcrmvqL+q0h1dyQYZuTsnxQpef9
	CSMMw5AQDftCacyrq6Y6ELBrGpHDKTJ5JSv7xShqftH/ugDoQp/LO7QCpoxoREPR4qYhoQpJgOo
	AyK1Qtz0C1reGDBKtyJqGPNQ+/ZXwkwQzmwqqVYTOH4dulkvUYKMw9a65jm+NAmy78TOyoFXPDP
	0BVhtGJqvXSBUYbbyXYzCwIo9EfQpUHJA7s15LIRetIVQow57bwrq3T5BaoX4oD46Gz+tyLaVOE
	FJwC8YK5NLLBkm3xkZBDYItN/F5UIz7jjNpD7Gyo+ZOpVLDUJJz5IrvMwA4cpMyLq1U8=
X-Received: by 2002:a17:90b:3c0e:b0:380:15fa:c5b2 with SMTP id 98e67ed59e1d1-380ba8d5584mr8310393a91.18.1783055140630;
        Thu, 02 Jul 2026 22:05:40 -0700 (PDT)
X-Received: by 2002:a17:90b:3c0e:b0:380:15fa:c5b2 with SMTP id 98e67ed59e1d1-380ba8d5584mr8310371a91.18.1783055140085;
        Thu, 02 Jul 2026 22:05:40 -0700 (PDT)
Received: from hu-sunilvl-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bbdc4eesm16850587eec.24.2026.07.02.22.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:05:39 -0700 (PDT)
From: Sunil V L <sunilvl@oss.qualcomm.com>
X-Google-Original-From: Sunil V L <sunilvl@oss.qualcomm.com
To: opensbi@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>, Sunil V L <sunilvl@oss.qualcomm.com>
Subject: [PATCH 1/2] lib/sbi/sbi_timer: Add sbi_timer_frequency() function
Date: Fri,  3 Jul 2026 10:35:29 +0530
Message-ID: <20260703050530.2460037-2-sunilvl@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703050530.2460037-1-sunilvl@oss.qualcomm.com>
References: <20260703050530.2460037-1-sunilvl@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfXzlEGnjc5D1mU
 jJPwvjMiO6UIsuz2k0wNgr8jKVFINArrDnm8KwWYUtHMY0+ycjb0vsbG33E1WjT5EkwtTgmTmUY
 Z/SxNSQ2P7srjXm82zPSWQDDAN0RGbihYuSk74ZL/IvUZjw7/rcQBNPcSRF5tzyM5pzbhj8ur3w
 14VksqoLY5TGifWFEdJg+w/nej8agF0w0amNEbfhsqKnmtk6s7E1SnVXWwfAJMeBJbD8LCJVQec
 DycrwBLdBGv7gzdPSB2Rx3oLPQtlQP+n1JMcfpUzgcSb39fyDYfhmems6WIKGYhN6NtLBItRxWB
 9UkLBGHDZcoWmvjdlh0yd1YQ42cbRPsUYpGKOgIDUpzL+Jtpp+tpUtmQhTyo1HHwDGjqULsN8yG
 qRp1wmE/AQzjT3n7FOImdg22Gbo3iQjkS2QAUHf7BKFiYg90GTtGlKr44bs41u0e67dIJZQq3JR
 0cHPXZgFyb3PCSvodug==
X-Authority-Analysis: v=2.4 cv=Lv+iDHdc c=1 sm=1 tr=0 ts=6a474325 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=sAHEFUq9iBPHfa9t1KsA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 76ZD3gjCPICW8CBuQx_tu4DjafBuhLKP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfXzJY8ax1r6y7a
 ajN2GW9+6xGAejYcRld7zYPmrnle2OCtgLHxI/s89GqRJPkI/Z0I77CGreYPWZ2aUH/Qv3CtVk/
 CUUGrcSr6HDjXzOxgVvwHxsSmOwsWCE=
X-Proofpoint-GUID: 76ZD3gjCPICW8CBuQx_tu4DjafBuhLKP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_220542_332875_E0439115 
X-CRM114-Status: GOOD (  12.07  )
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

Drivers and other library code sometimes need the timer frequency
outside of lib/sbi/sbi_timer.c, but there is currently no accessor
for it. Add sbi_timer_frequency() to expose the frequency of the
registered timer device.

Signed-off-by: Sunil V L <sunilvl@oss.qualcomm.com>
---
 include/sbi/sbi_timer.h |  3 +++
 lib/sbi/sbi_timer.c     | 12 ++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/include/sbi/sbi_timer.h b/include/sbi/sbi_timer.h
index 2a0409274dc4..17d6c1dcedba 100644
--- a/include/sbi/sbi_timer.h
+++ b/include/sbi/sbi_timer.h
@@ -140,6 +140,9 @@ bool sbi_timer_waitms_until(bool (*predicate)(void *), void *arg,
 /** Get timer value for current HART */
 u64 sbi_timer_value(void);
 
+/** Get timer frequency for current HART */
+unsigned long sbi_timer_frequency(void);
+
 /** Compute timer value after specified milliseconds */
 static inline u64 sbi_timer_value_after_msecs(ulong msecs)
 {
diff --git a/lib/sbi/sbi_timer.c b/lib/sbi/sbi_timer.c
index 4d737d22a18b..8abb5e7bea20 100644
--- a/lib/sbi/sbi_timer.c
+++ b/lib/sbi/sbi_timer.c
@@ -104,6 +104,18 @@ bool sbi_timer_waitms_until(bool (*predicate)(void *), void *arg,
 	return true;
 }
 
+unsigned long sbi_timer_frequency(void)
+{
+	const struct sbi_timer_device *timer_dev = sbi_timer_get_device();
+
+	if (!timer_dev) {
+		sbi_printf("%s: called without timer device\n", __func__);
+		return 0;
+	}
+
+	return timer_dev->timer_freq;
+}
+
 u64 sbi_timer_value(void)
 {
 	if (get_time_val)
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
