Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9294C79F80
	for <opensbi@archiver.kernel.org>; Fri,  4 Sep 2026 08:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=38ztfqKHh1RQkR7mTRrwM4de57oiGA4QCJyFjFN11BY=; b=vDjbW2nJTymw73
	U+gkKMmRqtdTLzPvuyVCJr2hEKAwxe9a4wO5XPP5XWEPBcPwDn0QYumGbKX1sXeeiW0n1jBSzqjR5
	Pz0N4c2FOvIGD13SjujuxISvPEsCv+eXhS+3YirmGd4Z3DKWfQxFKludf/K+Upc0qSg8YMYv1ptw1
	1DlalRpmjdtp9nVbX3q1hErfb6BDD1moZNRV8m2Kh15A05g3udikEU1ywtisOjhdILM3Z2kYWyL12
	vca2HAzgdBT7pAMRDxLctgPtUWaSZWBKuqfMmfhJxExjNagWk2p9H8lmwGpUCqKNq5kBmLZN+2znr
	hjSIGVY78ri8hH/r64iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2P6z-00000001M4Z-2jKT;
	Fri, 04 Sep 2026 08:17:25 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2P6x-00000001M3f-2yB4
	for opensbi@lists.infradead.org;
	Fri, 04 Sep 2026 08:17:24 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-cc147d86bebso776490a12.0
        for <opensbi@lists.infradead.org>; Fri, 04 Sep 2026 01:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1788509843; x=1789114643; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IvJeV4Q9rfohhB9e9Un1KkjF5cgowECDeun2Cq6r3hU=;
        b=dO3j27VUeqEuBrCfzHhDfcWEefLh5wHs6RZ4EV4jctumxbSSSmPJB+gJLEnQPYcBcA
         KucNKeRU831jDI+dwwHWc3DhE0ajg3pWHN2P/Kxu8dH/L6ghxrxWVTgbjpfyZGaDl1y0
         ab/rmYVVFJJ2XQXsenYbgYdbYJCTA18/IPzl46IoVrBw0J28CU1yGudzzF/x426A980p
         UhOtyZALS8VfJg/5+8X6m17zQoC0HPEHZPeY3YqEjns4SSPS7nMRSQfeF+BFnIw+V2Ci
         hTQURELt+WmCPLlMsTuB49gPNJWk0spOVj0LUiEcznnpAqdn0uxJjGAwRSLEXaV9qHQL
         KWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788509843; x=1789114643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IvJeV4Q9rfohhB9e9Un1KkjF5cgowECDeun2Cq6r3hU=;
        b=qjyaJ759ji60gjg9SIsNY7jxB8Kf//mDqigzGsu4dpi0mQ6iv5YF2M3eDRuq7uP6w8
         EsoveDhPRQTz5cocbjSzPBmnjUT1r4NMOWEJfD/P6RoTr+xu5ZC/Lkhmpqbre1zXA7/f
         fsAkJe5zB8V/yNYS2eR48glg2wWqxOzRGbsn+1i0ZwR42vbYP7Zx6zfD2v9DjezR8tfX
         1atdCHC759R7ntDOPkoMQOL99PFaPI2awyNNdU4a+HTo9TfDxUHVchgiIS4/Mx2fQWKQ
         Abi58eGz8RXej2v3sw5KA/Ea/2UZf9YuNNyL0DLtinKjAlNiCn4s/dlUMPkkHWO0NskZ
         AJEA==
X-Gm-Message-State: AFuF++nTVKSsLrJ2rf64fTJK5C4ovdq1cCMiy/O7mBE3NYZqHPOZLwCB
	HVxSf0SQPWcSNaSwo0xCP2OaE/lX1wAPhoiFfWJGVvamF6rkrafXQtPSWmUMJXTIgxs=
X-Gm-Gg: AYBFou0sEkJ2FGICG3x2KuDO89LtS+i+uYqsay9x2O5WU3Va6bz2z7mJZT7QX121J5G
	DqvlBSyyhCu6Y8RKNIndmk+VfTrcnUVBPHXA8KB+nqv3abWVcfy6e3L44jcYqicKSda7Uv/TlHq
	PoSL1Vtzmr6J/sMbV+F4YBY+lpqtLEK4UKM5fPbSUL/hv0IQlLNBA+wIse9K/aGLYAw6/7M1Yq7
	VZTF/S2qYNluP4BwH4MseIsK1eY11EfilIXzVbie8gXGaNEl+VOm3IeW8vTRCMIPjstfjnWKnTa
	IENJOtO+FloTuDgrMtsethcbkkl/B6qkrYKVrOe5L8dbYagpshYoTkwZRbQQY5iGo3WP5MWzjVQ
	X88FftQN9TNJpGINOOYxS9qZIQUM/G5wK5KgSpV7128JAqT/n5Fe9YZmFWfb0af3Z2iW9SGFIQz
	NvLpx7vW7Xk5TKhF7csZhH8Sohh0XiUk0cCAC6eAxzcBjiy0MsSnfQRhEoQeB9LYTlSB8ce1k=
X-Received: by 2002:a17:90b:3fd0:b0:36b:de66:92c3 with SMTP id 98e67ed59e1d1-39b07fed101mr13113167a91.10.1788509842666;
        Fri, 04 Sep 2026 01:17:22 -0700 (PDT)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f44d7sm4767183eec.22.2026.09.04.01.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:17:22 -0700 (PDT)
From: Nia Su <nia.su@sifive.com>
Date: Fri, 04 Sep 2026 01:16:43 -0700
Subject: [PATCH 1/2] firmware: Clear scratch->trap_context on warm boot
MIME-Version: 1.0
Message-Id: <20260904-trap-context-fix-v1-1-6bf7fa45d5f1@sifive.com>
References: <20260904-trap-context-fix-v1-0-6bf7fa45d5f1@sifive.com>
In-Reply-To: <20260904-trap-context-fix-v1-0-6bf7fa45d5f1@sifive.com>
To: opensbi@lists.infradead.org
Cc: Nia Su <nia.su@sifive.com>, Nylon Chen <nylon.chen@sifive.com>, 
 Nick Hu <nick.hu@sifive.com>, Zong Li <zong.li@sifive.com>, 
 Evgeny Voevodin <evvoevod@tenstorrent.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1246; i=nia.su@sifive.com;
 h=from:subject:message-id; bh=KNA/bY2NVZrBvERcpfI+r5KhjyYT1Wx59BRfxQihT7I=;
 b=owEBbQKS/ZANAwAIAYihNJa3+YfgAcsmYgBqmn6Q+OaQ04Vh9WMTRGeSHYezt+sPHHNHM1+ii
 L+4kvifzyGJAjMEAAEIAB0WIQThGl/T4FqBBU9NhIeIoTSWt/mH4AUCapp+kAAKCRCIoTSWt/mH
 4NaEEADDy9pn9Wt8z0JgX6j6soycwSef8jtpkHi3HiL6yM4/2yrUbsOqZhAXrrbk9GeY12GNVN+
 DYUBiVTaO79ifYsu14JK8D8pNGcr8oDFpfnXNbq9zxic4hd1q2HfhbKNvGi0pjV3+BW5n8jrrR5
 0xM7PK+/lAKcjtZYA3XAIfdnb19ncNJaa4Bkbkmp8frzdVvoGeEn36NNR5JUZf3bQOoXer4hLkf
 zbjzpgYa3cs57hXc0ulBKBoRJHbRXS09OQyDQfP3eglLfUU9ODurA3zN+n+7SE1b8jmDbQqo0zp
 juhm5CkAVBfeE0Y+GEnwyF0KF/tfRJDEcGofVJHwK12/pLHEo75IjjCHrbf4z+2g5s2UEiHCWsq
 Eq+0WyhcCyw8Cga13FPJuaU2QFn4VGSDw5OcUdhEy5GAkMvaJcxDTo2GimhQfbn9ED+cpx9GpOI
 AOkxbwxCvmHTaf93LGnYvFkujv2p/P/uJ3MiwUJmos+e588RL2rXRTHvogEofv0SQOWqh7RPSy5
 Js25xC/wrYVWOKKplKEki+gg3dhNLFWtqm02FM2q9kGOOPh1bNjPq66+dXU51FOcBRjl4u5epUA
 vkgyuWkIqgk9p27SwHuUuJHFk4UTmPlYSk0ZG2lD3B3aNVhw4McLS8pEUNhtHmMYyiM8AnxLZ9L
 3IC2YtLIN1RmpVA==
X-Developer-Key: i=nia.su@sifive.com; a=openpgp;
 fpr=55235C875092ACC578EFCE6CD1699E646B29B1AF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_011723_752883_069B4CE8 
X-CRM114-Status: UNSURE (   8.58  )
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

sbi_trap_handler() links tcntx->prev_context on entry and restores
scratch->trap_context on exit, forming a stack that unwinds through
the same path it was pushed from.

Non-retentive suspend/resume breaks that unwind: the SBI call
requesting suspend jumps straight to warm boot (jump_warmboot())
instead of returning through the normal exit path, leaving
scratch->trap_context stale. Since each hart's scratch space sits at
a fixed address, the next trap taken after warm boot resume reads
that same stale scratch->trap_context as its prev_context.

Clear trap_context in the scratch space on warm boot entry,
mirroring what cold boot's _scratch_init already does.

Signed-off-by: Nia Su <nia.su@sifive.com>
---
 firmware/fw_base.S | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index 0c5c65c10e5cf38d1cc6d0b3a66ffac661e7bacf..8ccca5e91c09f9c4cfcbab9c31c7e77afe7a96ab 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -364,6 +364,9 @@ _start_warm:
 	/* update the mscratch */
 	csrw	CSR_MSCRATCH, tp
 
+	/* Clear trap_context in scratch space */
+	REG_S	zero, SBI_SCRATCH_TRAP_CONTEXT_OFFSET(tp)
+
 	/* Setup stack */
 	add	sp, tp, zero
 

-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
