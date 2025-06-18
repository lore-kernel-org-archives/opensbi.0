Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 337E4C71155
	for <opensbi@archiver.kernel.org>; Wed, 18 Jun 2025 03:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dEOETk4Mp80C6eDtLZrcbepCR9DYEYal+1hIQjCNMus=; b=qclNR9lekvWAAi
	fTBcN/0rN+MYYjRx8ornu4trHBj5V3fWvNVi5eIliQlscRYQEh5i7vvgXbvxFV14D+wi/nZqpu6ca
	BU6RB3U8RGdD7o+gB3WdjIyVv4oNqG2SfoRm8k8/DOeLlskhaF8yiff+D/DThCqasZx2a1itKwv4v
	nFpDU8cCP3pSAekLsiM3VwaYjgMkipBvGzgpA8CZ9hGImkV1GoyJsVkeypa3CGsLB5xaFioWECis1
	6lD5weIhlRTlITCQ65KMSLhldHZdvgIue/KsnouhzpcidoEaByDuveLeCFUEcU68fVUTsJUDkNgoK
	i8P+DzvMPIeO0z47NkvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRj5U-00000008rup-4BGn;
	Wed, 18 Jun 2025 03:03:44 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRiwY-00000008rJ4-1jOU
	for opensbi@lists.infradead.org;
	Wed, 18 Jun 2025 02:54:31 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-6fae04a3795so68367686d6.3
        for <opensbi@lists.infradead.org>; Tue, 17 Jun 2025 19:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1750215269; x=1750820069; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A1tVvnbjtsexocNqbLVb9+4PMccWrl4Rg/u9Pfcgznw=;
        b=WwhGfFJyzG9OVKhBEUgs4hyjAjcMSU3MdqaN/fDk1YrpYjlIwJw3DbG5N3P3zM8lpm
         FnRkCW2ostWnerzDGeRjbNaia3fnC5svqYwenUTWOm5Iyboq11aymfBN48JC+6xLTOyz
         YbArlGGUzmQ85DJ00dkqvTg5iJqoXQKsdSe87ihKR9hHtqp0AT9cXPCPfsBCtzbQZL0L
         U+yeJO6Qg4s2hm7OGFAQFdw9KZlW47CP8p/7kHXOP0gIZv4x8tRYGaGLEhU9oxfeTWTc
         M/T4KIfV2kQvy1kgItjbX/F0FIIvCe+qdFaVn7+rju8DeWKD+ZZBJYsh0OTJAuYwa0rg
         G+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750215269; x=1750820069;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A1tVvnbjtsexocNqbLVb9+4PMccWrl4Rg/u9Pfcgznw=;
        b=raSdYNAEsl72eEy+BEWW6hgDjZH6YqalUVKRM5/EoKySesjVLa8yOPV8JJbFoDzsCO
         /qiIi7mxoFmFY57+Dzav4MHf5puljzXsr4V44vQgSTffT23smM2C63QEioIm8xb2i0Lt
         6/zfODLf8Vkh0x9OTZuzLOzoxp+Sj0ks7neuSap9xjbdbrgilZEqy7ofdu2swF24rkWy
         LuatdNyfR9nPXMcVYneeAsNQd+H3IIVyuLSaAtzpDWsIk9weiXEW4ZsRUtc9hHjsc3EO
         ENkqpaDX6144883JGjwvs9b3TB9axbyqWYcw267m479yL2T3edkNQGfVttCLTRJDyeKG
         aV0w==
X-Gm-Message-State: AOJu0YyZZJhTmNOvqJmoqR5tZT6EHUw9VgdWJgelex1oJG8t6ZCuidpg
	AzEzNOn5j/Nblxi4SN/ptv7RhTVNuAtFSO8rhwQY8B8nXBrnrjFodPb1tQR9mmOT97J+HNfMwhK
	kaJsv0M2ArGjgFAUCd0BjfHcIpKtdn/Q21/214QA87Fu7uTkjUpjSoFOLmo/SRV6Q9I4ZpFltrW
	iZj06tTYClrMl0NWY99kdC+s7kV/j1sT3psQiiZ0r+LPtWl0feIYipmSWA
X-Gm-Gg: ASbGncvX3aU7H1STXLJwr7ChGfL1NEQ+8YyPIAHksaRqVZsPK1NqDnpw4vEwM3loMOZ
	HWEwWC+jGhWhsoLdyJu3IffGLvdalxvs25/LaIv+SU4F+BkzFOLYf20Ju5RkvwCq5VDqZ3eTJqj
	QkzHjMF373k4G8RpMzX3GVltKoRluHYFwR1bVVucbn1tnNEeFqmTugso0hsMyMByjRnCM4oTbPN
	ZiqyOG8a1twexumdAoYInLVEcO/Qsd8qwsult0JJbIamIzYUq/JnGING4EETt5+sTMFz+a6NVtd
	A/9OKauM/I8PxCiM5s5AfqDSwvpIHRJz1oekQN0A1N4GN5/wW6FSDgC/xyKp9ALM3ElYIbhvQKX
	s6OIU555E5ZO+YD5ZhbnC7dTCxvo=
X-Google-Smtp-Source: AGHT+IGrEfffpHO5hJgDVj0xWWquGYIa7CicqIBDs50RtdfLIBS9Tw+WoR4r7QCMSBfWApchSB7xzQ==
X-Received: by 2002:ad4:5b83:0:b0:6eb:2fd4:30a7 with SMTP id 6a1803df08f44-6fb4777724cmr240550426d6.33.1750215268697;
        Tue, 17 Jun 2025 19:54:28 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb35c31566sm68562536d6.61.2025.06.17.19.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 19:54:28 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: opensbi@lists.infradead.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	anup@brainfault.org,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [PATCH 1/1] lib: sbi_list: add a helper for safe list iteration
Date: Wed, 18 Jun 2025 10:54:16 +0800
Message-Id: <20250618025416.5331-1-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_195430_473611_86369054 
X-CRM114-Status: UNSURE (   8.70  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

Some use cases require iterating safe against removal of list entry.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 include/sbi/sbi_list.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/sbi/sbi_list.h b/include/sbi/sbi_list.h
index 9e56c526faf2..be69fc4314e0 100644
--- a/include/sbi/sbi_list.h
+++ b/include/sbi/sbi_list.h
@@ -160,4 +160,17 @@ static inline void sbi_list_del_init(struct sbi_dlist *entry)
 	     &pos->member != (head); 	\
 	     pos = sbi_list_entry(pos->member.next, typeof(*pos), member))
 
+/**
+ * Iterate over list of given type safe against removal of list entry
+ * @param pos the type * to use as a loop cursor.
+ * @param n another type * to use as temporary storage.
+ * @param head the head for your list.
+ * @param member the name of the list_struct within the struct.
+ */
+#define sbi_list_for_each_entry_safe(pos, n, head, member) \
+	for (pos = sbi_list_entry((head)->next, typeof(*pos), member),	\
+	     n = sbi_list_entry(pos->member.next, typeof(*pos), member);	\
+	     &pos->member != (head);	\
+	     pos = n, n = sbi_list_entry(pos->member.next, typeof(*pos), member))
+
 #endif
-- 
2.17.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
