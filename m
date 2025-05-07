Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9F5C3ABC0
	for <opensbi@archiver.kernel.org>; Wed,  7 May 2025 08:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u8pegQvMFCnHmEzztw9+MzcC4lUcgdZoBxNf8PTyp4E=; b=2aeqD42vB3Et9X
	0Hfe++gvO0uQQ+jfFMf07imhUgAFuSYY/IK6q4ZZefwJmDKll9zPDqd+29pyr/NVdfO2CalBAX1Yz
	ttNmFwgJ776hVhKkSIXoNeuID2hZl8MGm8ZbLrCX7zKqatH20qGLbZzpOlX8awFQaNf3TftMrShAk
	M+Z4P5CecHu/X7j+tytEvDqT9JP0mqIwUTzedRLGOVWzCrSBw73KmcviLo04rX/FSGsHsWCnpGDUG
	mewEUBwXFVG5toa7gruB2aJljkcn+OSksppBIm0+GW4XuEQqo/Y3+yG/51OHNJABWMrr2vHYC/KrW
	TMp5/pV9Xhv4wGTncS9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCaKz-0000000EnAB-3BEg;
	Wed, 07 May 2025 08:41:09 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCZUB-0000000Eaga-1bbt
	for opensbi@lists.infradead.org;
	Wed, 07 May 2025 07:46:37 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-22e6880d106so2253755ad.1
        for <opensbi@lists.infradead.org>; Wed, 07 May 2025 00:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1746603989; x=1747208789; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Emw2cinBQ5B51XGfmpsjTqLW6li7/7gzxoeYGZ7f42w=;
        b=RtbZE3ZV/w2E17MeSDQFhJvg5VI8KsLbzBZDRYKOWyz87owcDVw/KD6LbBpUblTuF0
         AmQ1CUVz1v8qVpryCNUQfr6mm7TZKRvR02Ut5ez8qtyEkLIQxgPzPbUjfxeFQ4IY1M5/
         LkVK93edVC172z1NGVVhx322KkpPeE6KaFkDzEbu/x7lB+6lXKDTbT8JwbEd5WuNzbiz
         q9KmcZl3Yu+KqkXhjVBtJo7QwZJE+fMpPPJJAZSYgC92TrTndR4M8CNaSoWL8FKV5pXw
         OJ8hgMerP6T4uwIOX32ESI4gl4o7Y052saJ7ajXw0JtxSWiWOSB6NlnwmjnuurHzy8QZ
         rF9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746603989; x=1747208789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Emw2cinBQ5B51XGfmpsjTqLW6li7/7gzxoeYGZ7f42w=;
        b=gugXSzU1585XNxUhwonDU91F5Z9cYi5aXSAyXUKjgrQfnhuBQq+32lCbp6jeM4hvC0
         5ohwG9Ye0HedVYdsIqd4qfXQUzFamqXQ05uKJrYRo/ehgBvg7kogloLZEUOpTgnf+GMO
         pwsnLit3wI1mjQ8uJ9Pblx2H73k7h8/fuUvIlel3cSpvu32m+FLkqTJUzmwpGquu7paw
         MDa6pLSbV45pul0IciVUEFTzkVMUOEbHB0TEYzuPddRwQJ4pmUApepVizmKAG0IO0Hab
         JwF+QYcs31q5JOji4KQiTevpfKu5bgRlPoog9+rzuUf0rP3bYpGP/S8LKZENgYfKnSmk
         G49w==
X-Gm-Message-State: AOJu0YxQq5aPe0tGBvl973eXwtXa9/iOEvINYPqvUNBF6wBcyRsGW1Bd
	gmzi92q4yquK708qNUf7ugEOxphPTbpnxtlZVcr3BpexVzHsVgrkowtlDe5Uvko1yX7R6r8l7cM
	RVndNlw==
X-Gm-Gg: ASbGncv+7c6fxfjiJOuUHeRG80TDN3v3vUNAr8fkaS7uloah7Pa6+W+SqhCPT+lAKS/
	kCC3hcshG3NB6j/KMJ7ILxm9jZFG/qRc5JMeWkI8PvNnP+zinFAntMhjNEFGtalBkngKVhaknQy
	hKjCqPKDVqijBwyJoYQPwvYRZ0wDiDQ+YNU18fgyAs9yvnMccgJ6D2bS5kqn41D6rNMICkT2ELV
	9IzgcQFjTsLIH7h6u+BmTEHpGy1dBo+o2ipYRc74UAt3lXCVomEnHS18MsbZb7WBwW/wbelsstV
	mVjimfGHGtP/d1J4DGjDMUpicqzfXggicNihkhgMj2GR77jYGwHXf72PSLMUP6Q=
X-Google-Smtp-Source: AGHT+IGnMXMyjMg3LIBum8+TZAjo5JZoMYmNVqLTTnLIPsTOJDeuRdVCWenfQMdr8WKL4n1QnUx4VQ==
X-Received: by 2002:a17:903:190d:b0:22e:450c:ab59 with SMTP id d9443c01a7336-22e5ee1761cmr36529245ad.48.1746603989381;
        Wed, 07 May 2025 00:46:29 -0700 (PDT)
Received: from n37-114-103.byted.org ([115.190.40.12])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522f06dsm87098155ad.212.2025.05.07.00.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 00:46:29 -0700 (PDT)
From: Ziang Wang <wangziang.ok@bytedance.com>
To: opensbi@lists.infradead.org
Cc: Ziang Wang <wangziang.ok@bytedance.com>
Subject: [PATCH] lib: utils: hsm: Do not fail on EALREADY in rpmi-hsm fixup.
Date: Wed,  7 May 2025 15:46:20 +0800
Message-Id: <20250507074620.3162747-1-wangziang.ok@bytedance.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_004635_756453_64C31980 
X-CRM114-Status: UNSURE (   9.90  )
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

In case harts are divided into groups that use different
rpmi-hsm channels in different mailboxes, the suspend
state fixup function will return EALREADY on secondary
entry, simply skip on this error.

Signed-off-by: Ziang Wang <wangziang.ok@bytedance.com>
---
 lib/utils/hsm/fdt_hsm_rpmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/utils/hsm/fdt_hsm_rpmi.c b/lib/utils/hsm/fdt_hsm_rpmi.c
index cc78436..09d0c91 100644
--- a/lib/utils/hsm/fdt_hsm_rpmi.c
+++ b/lib/utils/hsm/fdt_hsm_rpmi.c
@@ -330,7 +330,7 @@ skip_suspend_states:
 
 	/* Register HSM fixup callback */
 	rc = fdt_register_general_fixup(&rpmi_hsm_fixup);
-	if (rc)
+	if (rc && rc != SBI_EALREADY)
 		goto fail_free_susp_state_names;
 
 	/* Register HSM device */
-- 
2.39.5


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
