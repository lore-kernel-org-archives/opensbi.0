Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39432CCD1AA
	for <opensbi@archiver.kernel.org>; Mon, 20 Oct 2025 06:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7i5fZa+w//pRdS9cq6gNKsmkglso2LjKOOV03LLauGQ=; b=4yXCtvy8WsC7HQ
	w20FRenClvPgPXLMsNcUg9qPbDsvJAmejvgOWQ7M7pNUhiAgYGrP7iZb7ndz+kJ06TOw/WNWFZhmx
	cewoc7kxJ+4dz8AKz/b9qS9tKp+xFcI96gdnYueSvUR7wihKkkt9e2TDtcgx+23iif9uC/MNsvwYz
	vwnKuHtNlaSI8l4I0AnsN33xiaepliMBvqN2xsfE7xl3J14Op+OOgwGAa9DfkoGSdjFXdovRqI4uN
	HL/oC6uVhJWncXHTdK69MdzMBC2E1wv4A8bC5k3MwYX32nV1/94UjsesDKQcznddFcxfU2zGa5GMd
	/09uw3hij5R/XAWtJ6FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjMI-0000000C298-3OO5;
	Mon, 20 Oct 2025 06:27:06 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjMF-0000000C23g-3waS
	for opensbi@lists.infradead.org;
	Mon, 20 Oct 2025 06:27:05 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7833765433cso5075793b3a.0
        for <opensbi@lists.infradead.org>; Sun, 19 Oct 2025 23:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1760941623; x=1761546423; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zSDUg6XOo23wexjnKx+5WbbwwS8t5QcwC4kFvzPWT84=;
        b=NbMD9rs2Wa3y+fttbjyNIku20luh1X1keTaM/4VTc364yO8ua90zcmq30jjrAJIzsY
         e3+nxF1zY442zMgfN7UPzkehRIvXRBs6KAILOOdoc254SiyEGOmk8R6HxZtJZeTVfZhw
         cBDA3W/MXm/wU2XandsQznmAizIJvJK1f2hxs3/mA18k7lbOo6ziyA1FqfFxYuPdBbWp
         7XVlpy6I+NKj+BSWhB+TVNiB7tTWZCD8MhECdCDBlfHUOYLL704vDoXxxRC325IGGuRs
         MqUw8ZF1aUtZg4fsiEk/jj/gM1ypPaA2gLPzNijdlaJkY8sLeitODyUx91arvcgWutuj
         Hzuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760941623; x=1761546423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zSDUg6XOo23wexjnKx+5WbbwwS8t5QcwC4kFvzPWT84=;
        b=wNNI4y47vnrKPMXw7DOrP3KqkcSx4AZjG56IBTIcSLfZf5lQFDfg7LVukopV6E7k7q
         euyElEGbU0GLVpSU+TGujTSwcdAJOkCW9zLi57skoCuQjkT57W2rRdc/13TtWcP0IPK4
         YJ4KjcXuZ+Z6nwarQv4iP+P5kzNYVTAFxtV3hGJs7bbF6SeV49Jb2XuhE4GtY79QPHxt
         jLFRpLWKLZt7Qrk24WfakAGvm0zQXSMlIFrF8vYuCn9bPSs++WF05BNfSrzTTmkBJrw4
         kE8HqMhGeW5GcgvL3TQtLWvPA4k6h5Md1hmMzAko0uaLq9SlTeW6cWQTBMNEBrzGdH//
         ol+A==
X-Gm-Message-State: AOJu0YxROKdpsu1VcaFgt7F+0FzfpY4gjDlvtOVEw8RzOpSJ8L+aDjHN
	onHjADTxl4gI2Os6/zsDmiBou+PHVvcpI5OPKgJlMOtI+/3MRZcVDMTWJSXczqq+E3w=
X-Gm-Gg: ASbGnct4qB1B1vFkDiuVIpS6So+2WROXAz5XU6+/57i6wba4d2QrzbEG0GWHwPR6cfV
	RitexRonMVFU63nARdv4MB5wTeLhHm5j8ZVLGmJRghWZWfm2vEF1EYLrxk1QMH5IBLMg6R29uHG
	rjt7CKk0gWF00V6XuZv13LlLgDJzvjAPThvxdxjyeKVyFwqoi6CP5l3zJKeqtR2a407R8yfUW6Q
	BRiX8SgVr9hgtr7ElS6cg+xL1iYCskugTRZaOKrvNFoik8Yxt30KPGznOs7D/yZW+pYv9Kyw1pD
	b1+IHNXEs7ASJkJEU7/shvMOi1srpkarnzeXiNQJrACBa0wZF4mB5nmi6x9mReJ8wS1ws6hLRqi
	J0S59KRl7GHQ51TzxcazMf0lf1DGJduraDTihvy7mNZcmdAk89kkmDdEZAkMViNUybXllS+L91Q
	==
X-Google-Smtp-Source: AGHT+IEUZKRdc7MVIXTvyAMgT6QS5JPmyF4yyq7K9OG5UxIx45BDZGBTq0f/lz4dQsg62dC1XCMplg==
X-Received: by 2002:aa7:9067:0:b0:781:17ee:610 with SMTP id d2e1a72fcca58-7a220b070a4mr16183298b3a.17.1760941623166;
        Sun, 19 Oct 2025 23:27:03 -0700 (PDT)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff349bcsm7301244b3a.17.2025.10.19.23.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 23:27:02 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
Date: Mon, 20 Oct 2025 14:34:12 +0800
Subject: [PATCH v7 10/12] lib: utils/timer: Expose timer update function
MIME-Version: 1.0
Message-Id: <20251020-cache-upstream-v7-10-69a132447d8a@sifive.com>
References: <20251020-cache-upstream-v7-0-69a132447d8a@sifive.com>
In-Reply-To: <20251020-cache-upstream-v7-0-69a132447d8a@sifive.com>
To: opensbi@lists.infradead.org
Cc: Cyan Yang <cyan.yang@sifive.com>, Anup Patel <anup@brainfault.org>, 
 Nick Hu <nick.hu@sifive.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_232704_020132_2B37B95B 
X-CRM114-Status: GOOD (  11.93  )
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

Exposing the ACLINT timer update APIs so the user can update the mtimer
after waking up from the non-retentive suspend.

Reviewed-by: Cyan Yang <cyan.yang@sifive.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 include/sbi_utils/timer/aclint_mtimer.h |  5 +++++
 lib/utils/timer/aclint_mtimer.c         | 28 +++++++++++++++++++++-------
 2 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/include/sbi_utils/timer/aclint_mtimer.h b/include/sbi_utils/timer/aclint_mtimer.h
index a245e13e285f2ad658fce7db6366fe8b7bae8c2a..f8d2e5b4c210164c8a737e82643e5e49807753c4 100644
--- a/include/sbi_utils/timer/aclint_mtimer.h
+++ b/include/sbi_utils/timer/aclint_mtimer.h
@@ -42,6 +42,11 @@ struct aclint_mtimer_data {
 	void (*time_wr)(bool timecmp, u64 value, volatile u64 *addr);
 };
 
+struct aclint_mtimer_data *aclint_get_mtimer_data(void);
+
+void aclint_mtimer_update(struct aclint_mtimer_data *mt,
+			  struct aclint_mtimer_data *ref);
+
 void aclint_mtimer_sync(struct aclint_mtimer_data *mt);
 
 void aclint_mtimer_set_reference(struct aclint_mtimer_data *mt,
diff --git a/lib/utils/timer/aclint_mtimer.c b/lib/utils/timer/aclint_mtimer.c
index 3db3c3be2575e4ddd0180c90f254f7733b7c1daa..fd6189aaa52ad92ca28330fcf0f701ac0b8c337f 100644
--- a/lib/utils/timer/aclint_mtimer.c
+++ b/lib/utils/timer/aclint_mtimer.c
@@ -109,28 +109,42 @@ static struct sbi_timer_device mtimer = {
 	.timer_event_stop = mtimer_event_stop
 };
 
-void aclint_mtimer_sync(struct aclint_mtimer_data *mt)
+struct aclint_mtimer_data *aclint_get_mtimer_data(void)
+{
+	return mtimer_get_hart_data_ptr(sbi_scratch_thishart_ptr());
+}
+
+void aclint_mtimer_update(struct aclint_mtimer_data *mt,
+			  struct aclint_mtimer_data *ref)
 {
 	u64 v1, v2, mv, delta;
 	u64 *mt_time_val, *ref_time_val;
-	struct aclint_mtimer_data *reference;
 
-	/* Sync-up non-shared MTIME if reference is available */
-	if (mt->has_shared_mtime || !mt->time_delta_reference)
+	if (!mt || !ref || !mt->time_rd || !mt->time_wr || !ref->time_rd)
 		return;
 
-	reference = mt->time_delta_reference;
 	mt_time_val = (void *)mt->mtime_addr;
-	ref_time_val = (void *)reference->mtime_addr;
+	ref_time_val = (void *)ref->mtime_addr;
 	if (!atomic_raw_xchg_ulong(&mt->time_delta_computed, 1)) {
 		v1 = mt->time_rd(mt_time_val);
-		mv = reference->time_rd(ref_time_val);
+		mv = ref->time_rd(ref_time_val);
 		v2 = mt->time_rd(mt_time_val);
 		delta = mv - ((v1 / 2) + (v2 / 2));
 		mt->time_wr(false, mt->time_rd(mt_time_val) + delta,
 			    mt_time_val);
 	}
+}
 
+void aclint_mtimer_sync(struct aclint_mtimer_data *mt)
+{
+	struct aclint_mtimer_data *reference;
+
+	/* Sync-up non-shared MTIME if reference is available */
+	if (mt->has_shared_mtime || !mt->time_delta_reference)
+		return;
+
+	reference = mt->time_delta_reference;
+	aclint_mtimer_update(mt, reference);
 }
 
 void aclint_mtimer_set_reference(struct aclint_mtimer_data *mt,

-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
