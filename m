Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B4AF0181A
	for <opensbi@archiver.kernel.org>; Fri,  6 Mar 2026 09:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L7Nmna6Vs1T3cGCFOUKmsY+Y0KTqpvAThqeGttu16Fg=; b=xF1eMPsP+RMseq
	Xs8BxJpeADtt+4Cw9NW3lOY1UGklp4eMaXlsNPzeHJUghHOU8Q9W9+88iVMH0Yt+yPz+0kzOnlfJE
	RMz0a+dwJfz+IwkltIfLwl2M895qC2rRHXyLIzLtEwrOWPXe8/neyfUYDj10VHQ5a2TYnHhN+ly5C
	zZlBSYHb9E88/klOwhIWu/DyTQDBpAsSoZD5IerYfGBgfMX9ScQhy5/RK2ep46W/ojeQYbwwx+9p2
	j3QW0Ire9h2Bqf0YTmuVNKY4YN4YfnddvuJsRg56j5hWMiMbLlopwP7RmI3OjL5fQyK8LlJKw7DLv
	dJxwrqoIo5AUAWTbUx3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyRoP-00000003NQj-11FP;
	Fri, 06 Mar 2026 09:49:37 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyRoJ-00000003NOC-3Hh6
	for opensbi@lists.infradead.org;
	Fri, 06 Mar 2026 09:49:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1772790289; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=UmbrHzvy/790V4icGzTTkj7w6t4FLj3OzAVJVm53umg=;
	b=rV3UvSMX7I/eFntUHUmpkxqRIp8wjujW+6A5oEuO6bbIaUBDYK4vCJVpHvJFxlFZZW6KddJwlnf2E7JAYT1aXpXAS2hCDu/rjj5dQsHSTGMTOijr7a/Vt/7vmzlRTaeYOmPx0M3AM1JSJ6VLMZOkWiIaJjDmf3ASaEeKsz3tXHQ=
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0X-N0CMJ_1772790286 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 06 Mar 2026 17:44:46 +0800
From: cp0613@linux.alibaba.com
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	guoren@kernel.org,
	Chen Pei <cp0613@linux.alibaba.com>
Subject: [PATCH 2/2] lib: Fix sbi_strchr to correctly handle null terminator search
Date: Fri,  6 Mar 2026 17:44:25 +0800
Message-ID: <20260306094425.1918-3-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306094425.1918-1-cp0613@linux.alibaba.com>
References: <20260306094425.1918-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_014932_553709_91846A16 
X-CRM114-Status: UNSURE (   9.93  )
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

From: Chen Pei <cp0613@linux.alibaba.com>

The original sbi_strchr implementation did not conform to the C standard
behavior. According to the C standard and POSIX specification, strchr(s, 0)
should return a pointer to the null terminator at the end of string s.

The previous implementation used a while loop that would terminate when
either reaching the end of string or finding the character, but it would
return NULL when searching for the null terminator instead of returning
a pointer to the null terminator itself.

The fixed implementation uses a do-while loop that ensures even when
searching for the null terminator, the function correctly returns a
pointer to the null terminator position rather than NULL.

This fix ensures sbi_strchr behavior aligns with standard library
function semantics, making it more predictable and safe for users
expecting standard C library behavior.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 lib/sbi/sbi_string.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/lib/sbi/sbi_string.c b/lib/sbi/sbi_string.c
index f4f13942..3a10c254 100644
--- a/lib/sbi/sbi_string.c
+++ b/lib/sbi/sbi_string.c
@@ -88,13 +88,12 @@ char *sbi_strncpy(char *dest, const char *src, size_t count)
 
 char *sbi_strchr(const char *s, int c)
 {
-	while (*s != '\0' && *s != (char)c)
-		s++;
+	do {
+		if (*s == (char)c)
+			return (char *)s;
+	} while (*s++ != '\0');
 
-	if (*s == '\0')
-		return NULL;
-	else
-		return (char *)s;
+	return NULL;
 }
 
 char *sbi_strrchr(const char *s, int c)
-- 
2.50.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
