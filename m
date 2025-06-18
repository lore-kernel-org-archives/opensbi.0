Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D6AC7115B
	for <opensbi@archiver.kernel.org>; Wed, 18 Jun 2025 05:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0/VB3y6PwhFt46aSOQSeAvriycmXRR/ekQywQ5Z44Nk=; b=FWU0iDjaMqDudz
	baMgedXHLubf79JqVIj0yJWD7x1alijDfFvdu2mic9PtK81dh4NjqcJO0huUhcTpjUty9hy3ewTzY
	ZoC8ldUoy7mmw1qs1HWtKVAXACfzLCQbLo9xNnkIXRzXiHCpNHJ/G8KN4YyYoTweLoLIlcZ9TFsMC
	anJGtthCJINs5HKGX8UXhk5XHy8LIehCbDNvatDVoitpi4gw2eYdl5QyF8tUTo8W8kZ6YnDYXxSqG
	5GIb0VoOFviCQZOkVtWqf4SRrSYcAtSbpOqldSaqWpJkxl67QS3LZdrOMsO6zT30Uh8l3Rp3V2ILv
	KAwt0ag+ra+4zftvOlxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRlVz-000000096Fd-25Dj;
	Wed, 18 Jun 2025 05:39:15 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRlVw-000000096EW-44HX
	for opensbi@lists.infradead.org;
	Wed, 18 Jun 2025 05:39:14 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b31c84b8052so554353a12.1
        for <opensbi@lists.infradead.org>; Tue, 17 Jun 2025 22:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750225152; x=1750829952; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MGR2nsyhJrn4vvr9RoSuZYbwq+jFbt6Thx+Y1jV4IJc=;
        b=pMISaageSfY0wrKXoBiWAYl1e821DWrUDHldg8nr0m4Xbbztp1d4IXJCVga1pTCgYv
         U+PsZm90f0cEziCi5CfFsMGovHKsVolSK5ADuM0y3VjyAIWood2xJs6j5y6OlwfMXd6j
         lPZKJV9+3xw547wHEjY9rK8ywkntVOzaSwzh+S5NhogChoIV7axIyV/n98CtkkgdLVio
         EBaKOniWoP451j/CLwde/RKelWXb1GtvOjaaAx6jEF/0he2I2GMilmzSfzRBlgkDn0p+
         7JnqZswK+qyEpGxLdcHWeu5slbzTyfZAUhrYXG5gLT8W3HYwDUFQaW8nCslL8M4tOuUS
         Uwyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750225152; x=1750829952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MGR2nsyhJrn4vvr9RoSuZYbwq+jFbt6Thx+Y1jV4IJc=;
        b=uNPYJJP3LpELWiZWixFfXsuytKE9Ms8oFG8P9lozchsZofJiDe7IN8WtZe1MHqPkth
         +D0egazZwjbIO0II813ZSG3lRcOvTOF3j+ZzCWbWDV3uK3Ad5UrRUjjh+1TWmaFxeywU
         P7cALOb28+0Auopn3d7JowYvDHxVNY9z/hctYCdJuKgrhLpixACpzWeFMAcgYOtlu+jA
         cC9BEc2s5YUhwXK67AbhdnpSvhB0544CzgXUN2uooOg9QPVTVkzWDQChLXoR5r/aWIbi
         RdwNo0qOrFbaKKc4q9Zp79kY1lE7tYIhpnJ+k4lWOLvUbTT2nvQ+hCc3hGBOHJ255Mjt
         vFUw==
X-Gm-Message-State: AOJu0Yxp6YoCUddyVfnLgyAQSxbQp8WbZs0WTLGQZNVGWg9ljzM/crBr
	wyJUq4I5cQWvJQX2xWPSJcY0ijMUxT+jD+muwkJfIUloqua7cy/JLUVPBtoTpLvRYBmMsZkCHnh
	d5MSGcT4=
X-Gm-Gg: ASbGnctqESVcL8KjsBLJGeqZyK+bQ2IYIwIaKHn0mI9yXuBCLYWi2wjGlxcijZ3JbMu
	b9V+UqJ010lFSlm8Q8CzHff73HoxfyXB79Iqn+G0S8vrdXsgX/ecZ1zZJA/tEKE5CBubFzfWdlS
	MZY7gcgltKWnO33+Uabb8k0aD2HTXPuRElRbf0FmM5k0IZEuK7IKHHJ1MLzS8RwMYvxboF9kgsK
	UKEALxvDnnPPF2tHB3/iWXKqWBj32zi/a81VqcBNgpL/lPGLv2YiXxQKnbuD5isYqWCiMNWuV5G
	3Pf0EMKLXEVJYVooQnIWqtHtrrKgyLkh2FYV5UMyDZLw0C/3PyedKIjUHGWOLh1KQlM2bT9CmEr
	r1WNCB8QVQiw=
X-Google-Smtp-Source: AGHT+IHBMYfpKvhVi6qmDjApYGiQ++W0ADC1ivAvRB62jllvEE+lrMQHRVhlqjH4C2JxP4m1TE4Pqw==
X-Received: by 2002:a17:90b:35c6:b0:311:abba:53d2 with SMTP id 98e67ed59e1d1-313f1ce5d4cmr28302505a91.17.1750225151611;
        Tue, 17 Jun 2025 22:39:11 -0700 (PDT)
Received: from rpathak-ThinkPad-T490.. ([2402:e280:3e81:5eb:e7f2:d849:97c7:f37f])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-313c19b84e5sm13272553a91.2.2025.06.17.22.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 22:39:11 -0700 (PDT)
From: Rahul Pathak <rpathak@ventanamicro.com>
To: opensbi@lists.infradead.org
Cc: rpathak@ventanamicro.com,
	rahul@summations.net
Subject: [PATCH 1/2] lib: utils: Add Implementation ID and Version as RPMI MPXY attributes
Date: Wed, 18 Jun 2025 11:08:53 +0530
Message-ID: <20250618053854.2577299-1-rpathak@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_223913_008898_3F375718 
X-CRM114-Status: GOOD (  13.08  )
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

The latest frozen RPMI spec has added Implementation ID
and Implementation Version as message protocol specific
mpxy attributes. Add support for these.

Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
---
 include/sbi_utils/mailbox/rpmi_msgprot.h    |  2 ++
 include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h |  8 +++++++-
 lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c  |  6 ++++++
 lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c         | 15 +++++++++++++++
 4 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/include/sbi_utils/mailbox/rpmi_msgprot.h b/include/sbi_utils/mailbox/rpmi_msgprot.h
index e317ba097c17..c79070a6f121 100644
--- a/include/sbi_utils/mailbox/rpmi_msgprot.h
+++ b/include/sbi_utils/mailbox/rpmi_msgprot.h
@@ -198,6 +198,8 @@ enum rpmi_channel_attribute_id {
 	RPMI_CHANNEL_ATTR_RX_TIMEOUT,
 	RPMI_CHANNEL_ATTR_SERVICEGROUP_ID,
 	RPMI_CHANNEL_ATTR_SERVICEGROUP_VERSION,
+	RPMI_CHANNEL_ATTR_IMPL_ID,
+	RPMI_CHANNEL_ATTR_IMPL_VERSION,
 	RPMI_CHANNEL_ATTR_MAX,
 };
 
diff --git a/include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h b/include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h
index 068a1a557fe2..3a1c11774851 100644
--- a/include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h
+++ b/include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h
@@ -22,7 +22,9 @@
 enum mpxy_msgprot_rpmi_attr_id {
 	MPXY_MSGPROT_RPMI_ATTR_SERVICEGROUP_ID = SBI_MPXY_ATTR_MSGPROTO_ATTR_START,
 	MPXY_MSGPROT_RPMI_ATTR_SERVICEGROUP_VERSION,
-	MPXY_MSGPROT_RPMI_ATTR_MAX_ID,
+	MPXY_MSGPROT_RPMI_ATTR_IMPL_ID,
+	MPXY_MSGPROT_RPMI_ATTR_IMPL_VERSION,
+	MPXY_MSGPROT_RPMI_ATTR_MAX_ID
 };
 
 /**
@@ -33,6 +35,8 @@ enum mpxy_msgprot_rpmi_attr_id {
 struct mpxy_rpmi_channel_attrs {
 	u32 servicegrp_id;
 	u32 servicegrp_ver;
+	u32 impl_id;
+	u32 impl_ver;
 };
 
 /** Make sure all attributes are packed for direct memcpy */
@@ -45,6 +49,8 @@ struct mpxy_rpmi_channel_attrs {
 
 assert_field_offset(servicegrp_id, MPXY_MSGPROT_RPMI_ATTR_SERVICEGROUP_ID);
 assert_field_offset(servicegrp_ver, MPXY_MSGPROT_RPMI_ATTR_SERVICEGROUP_VERSION);
+assert_field_offset(impl_id, MPXY_MSGPROT_RPMI_ATTR_IMPL_ID);
+assert_field_offset(impl_ver, MPXY_MSGPROT_RPMI_ATTR_IMPL_VERSION);
 
 /** MPXY RPMI service data for each service group */
 struct mpxy_rpmi_service_data {
diff --git a/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c b/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c
index aad68b5a996b..fdb04915ba70 100644
--- a/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c
+++ b/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c
@@ -523,6 +523,12 @@ static int rpmi_shmem_mbox_get_attribute(struct mbox_chan *chan,
 	case RPMI_CHANNEL_ATTR_SERVICEGROUP_VERSION:
 		*((u32 *)out_value) = srvgrp_chan->servicegroup_version;
 		break;
+	case RPMI_CHANNEL_ATTR_IMPL_ID:
+		*((u32 *)out_value) = mctl->impl_id;
+		break;
+	case RPMI_CHANNEL_ATTR_IMPL_VERSION:
+		*((u32 *)out_value) = mctl->impl_version;
+		break;
 	default:
 		return SBI_ENOTSUPP;
 	}
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c b/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
index 48dfe4762799..84b7a67dc7a4 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
@@ -213,6 +213,7 @@ static int mpxy_mbox_send_message_withoutresp(struct sbi_mpxy_channel *channel,
 int mpxy_rpmi_mbox_init(const void *fdt, int nodeoff, const struct fdt_match *match)
 {
 	u32 channel_id, servicegrp_ver, pro_ver, max_data_len, tx_tout, rx_tout;
+	u32 impl_id, impl_ver;
 	const struct mpxy_rpmi_mbox_data *data = match->data;
 	struct mpxy_rpmi_mbox *rmb;
 	struct mbox_chan *chan;
@@ -270,6 +271,18 @@ int mpxy_rpmi_mbox_init(const void *fdt, int nodeoff, const struct fdt_match *ma
 	if (rc)
 		goto fail_free_chan;
 
+	/* Get channel implementation id */
+	rc = mbox_chan_get_attribute(chan, RPMI_CHANNEL_ATTR_IMPL_ID,
+				     &impl_id);
+	if (rc)
+		goto fail_free_chan;
+
+	/* Get channel implementation version */
+	rc = mbox_chan_get_attribute(chan, RPMI_CHANNEL_ATTR_IMPL_VERSION,
+				     &impl_ver);
+	if (rc)
+		goto fail_free_chan;
+
 	/*
 	 * The "riscv,sbi-mpxy-channel-id" DT property is mandatory
 	 * for MPXY RPMI mailbox client driver so if this is not
@@ -316,6 +329,8 @@ int mpxy_rpmi_mbox_init(const void *fdt, int nodeoff, const struct fdt_match *ma
 	/* RPMI service group attributes */
 	rmb->msgprot_attrs.servicegrp_id = data->servicegrp_id;
 	rmb->msgprot_attrs.servicegrp_ver = servicegrp_ver;
+	rmb->msgprot_attrs.impl_id = impl_id;
+	rmb->msgprot_attrs.impl_ver = impl_ver;
 
 	rmb->mbox_data = data;
 	rmb->chan = chan;
-- 
2.48.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
