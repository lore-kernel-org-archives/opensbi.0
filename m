Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F2E2CCD184
	for <opensbi@archiver.kernel.org>; Tue, 14 Oct 2025 05:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4H6kJQDqBGBl9nUSiYxFLW+itgtjtPjd0mbc0NIxUFo=; b=vosL2L9q2AkDiQ
	u0qIrk8LbWSW4k0pVvmufb3yIm3NdfplmdONvyk9iBkM1ADwOjzzxqIpWx32B7nNsEZM6Nqc2lM73
	PuEdut3gM0OJP1HQKH0DHcIh+dMyjTSP/P2ShyGAdrKRUyFfFvqVzy1DasajsU6FArOQYIfRBlAB4
	0bIq7V45/3oHrdA1rUk8LvXxzruFOrHxZ5HP/6+UQqiFqDaEkNI97a7hRB5n1PPxJkLXPm+nGBjqp
	gfa9e7tBYhY0JwyQ69PYJjw5WbD7nLOE2XZEpSTBEuM08RWr66SM6kmR71KR9GinOy/wJvhCFnhiV
	QwIThx2oZ94S+5f1JgbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Xz2-0000000FFMs-0KGh;
	Tue, 14 Oct 2025 05:54:04 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Xyz-0000000FFM7-2yi2
	for opensbi@lists.infradead.org;
	Tue, 14 Oct 2025 05:54:03 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-781db5068b8so3936572b3a.0
        for <opensbi@lists.infradead.org>; Mon, 13 Oct 2025 22:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1760421240; x=1761026040; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R86/44DvbgRIT819+tlaXsEXghlt2hmGE7mKwP5iVDc=;
        b=gBXNp6FP0Koio0NBYfCjDA9n/B6o4rc+CkhfyXFDqe80OOQnJT8YngbxD0jNX5OMcL
         VT4Wl4T9LGd8fJd1LMeJSaVanqHpbvkraG7Fm4G1Y3Msgki7EZzlhO++9oETOsqlNZDX
         4Pr2/jjVNHanEGJvTeYRSSxgLkIsyxEqTsCt25jkZJ1a5+zg1KihKINuhyB/R8rlRFS2
         VQ1gPtcAX4APhU3SsUrNmgfKfIZfoqXDygXBjpTRhcW6F+W06v/oHmI+OJbbTz5w02Ji
         c5jnrLShEC6v2hqjJMGWSEQq25WGOOn/Csj+s+Tv7F/ko631FLWaFnJqDApcXiAqBHQS
         V8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760421240; x=1761026040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R86/44DvbgRIT819+tlaXsEXghlt2hmGE7mKwP5iVDc=;
        b=VFiJ4AWcLWSS81GfDWCf6cr6UijddARPzo3QqYtzlCiZVa85tf8TgOpaito3ATnSH/
         x8fXZFPRiKJGYgFJeWwKK/TfXXDD+wWJcuo2zhB3fX/kI/33Xc2UKbZ9trclffkZ1i+l
         nr65ZGL/dz0eHiljd8as3dzt5si7sGlW17ooMU/vbpgZdQjd15lYr74/HN9KUt1/2O74
         cRvWQ5bRGBfXA8yDJnv5oCSjMrXcl5Dj1mSFna0mb4IEb0FKx0yaiKt4au/aV0OVq+G5
         ru7DTTT/NjQusv+86fmQWzSYw9F5CgRN07bhLZI4aviwWc+GX53yto2xyTQNkxFuhfun
         Mslw==
X-Gm-Message-State: AOJu0YxJH6M1TPVzfEFtdwPSUeyRvo98uK26jSTFjryGwdjJ8UjjiQ8Q
	asaXdsmERDAbVqzMrj2dJ7aITpEh4gn/HAqrH3CRXg2YELFamEtUoU8zYaD9X30CGUuYYQVUs5f
	bdh6Ve3s=
X-Gm-Gg: ASbGncsqLW0QrjXlnsXkuCdlscdVlrTYgLKovAdZ2mUKKPgJbSRCIqvlNjdlfgWJ3Pn
	NCxi6ipvh9Q1K1OAwKhIVg33+qiDKtAqHAUVQ49q6vXwNcj7V8am3lCpV2W5FsIalhVZ01gUHlZ
	rXvFwdloLfm/sDZgWXWDxkVPuAs4q3B1z30l2kPzB8Ex+fiaHJbkvNnhvt1eyK2FHdnLFCzrMu1
	cHu5tZdEVxwtpan20RO/0GSwCZXxmcnMVceL2/fH/i8jovR71S1RGd3biGd6gWUUAlwKyJKI5Ln
	54Z1YrkwB57SpozEUJ3Uw0wrpOikw9bSqyzF2T2IDUwLdsirI1ZBpQkAYxoXd0guwmrqOs5K37A
	fupNFYePRNnfq4Ky0lPo9Tl6ypEoOM/H2g7akAdVaVmALgt6iXFfDvtmz30RX79Q67pJ7wjtPq8
	TWdGPG4erHRLApHWMBPpMYJK5U3GqwG8XKV8VuClc=
X-Google-Smtp-Source: AGHT+IFqpEcq8+PiFsQ8EN3YacHFhVlzHhYEyAHvc4G+TLi4ErpacqRi6UA6RbvYzaBfQn6SqXpFcg==
X-Received: by 2002:a05:6a20:6a29:b0:2d6:9a15:1394 with SMTP id adf61e73a8af0-32da8130c95mr30611608637.18.1760421240476;
        Mon, 13 Oct 2025 22:54:00 -0700 (PDT)
Received: from VR452476K0.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992bb18e28sm13788253b3a.29.2025.10.13.22.53.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Oct 2025 22:54:00 -0700 (PDT)
From: weidongwd <weidong.wd@bytedance.com>
To: opensbi@lists.infradead.org
Cc: cuiyunhui@bytedance.com,
	heshuan@bytedance.com,
	weidongwd <weidong.wd@bytedance.com>
Subject: [PATCH] lib: sbi: sse: add local unknown nmi event
Date: Tue, 14 Oct 2025 13:53:30 +0800
Message-ID: <20251014055330.59506-1-weidong.wd@bytedance.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_225401_931969_20CAEE9E 
X-CRM114-Status: GOOD (  10.94  )
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

Add the id of local unknown nmi event and add this event to the
list of supported events.

Signed-off-by: weidongwd <weidong.wd@bytedance.com>
---
 include/sbi/sbi_ecall_interface.h | 3 ++-
 lib/sbi/sbi_sse.c                 | 8 +++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
index af7a05a..8bb0d39 100644
--- a/include/sbi/sbi_ecall_interface.h
+++ b/include/sbi/sbi_ecall_interface.h
@@ -436,7 +436,8 @@ enum sbi_sse_state {
 
 /* Range 0xffff0000 - 0xffffffff */
 #define SBI_SSE_EVENT_LOCAL_SOFTWARE		0xffff0000
-#define SBI_SSE_EVENT_LOCAL_RESERVED_3_START	0xffff0001
+#define SBI_SSE_EVENT_LOCAL_UNKNOWN_NMI		0xffff0001
+#define SBI_SSE_EVENT_LOCAL_RESERVED_3_START	0xffff0002
 #define SBI_SSE_EVENT_LOCAL_RESERVED_3_END	0xffff3fff
 #define SBI_SSE_EVENT_LOCAL_PLAT_3_START	0xffff4000
 #define SBI_SSE_EVENT_LOCAL_PLAT_3_END		0xffff7fff
diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
index 986b770..e771efe 100644
--- a/lib/sbi/sbi_sse.c
+++ b/lib/sbi/sbi_sse.c
@@ -182,9 +182,14 @@ struct sse_event_info global_software_event = {
 	SBI_SLIST_NODE_INIT(NULL),
 };
 
+struct sse_event_info local_unknown_nmi_event = {
+	.event_id = SBI_SSE_EVENT_LOCAL_UNKNOWN_NMI,
+	SBI_SLIST_NODE_INIT(&global_software_event),
+};
+
 struct sse_event_info local_software_event = {
 	.event_id = SBI_SSE_EVENT_LOCAL_SOFTWARE,
-	SBI_SLIST_NODE_INIT(&global_software_event),
+	SBI_SLIST_NODE_INIT(&local_unknown_nmi_event),
 };
 
 static SBI_SLIST_HEAD(supported_events, sse_event_info) =
@@ -202,6 +207,7 @@ static const uint32_t standard_events[] = {
 	SBI_SSE_EVENT_LOCAL_LOW_PRIO_RAS,
 	SBI_SSE_EVENT_GLOBAL_LOW_PRIO_RAS,
 	SBI_SSE_EVENT_LOCAL_SOFTWARE,
+	SBI_SSE_EVENT_LOCAL_UNKNOWN_NMI,
 	SBI_SSE_EVENT_GLOBAL_SOFTWARE,
 };
 
-- 
2.20.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
