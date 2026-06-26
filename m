Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97418CDE008
	for <opensbi@archiver.kernel.org>; Fri, 26 Jun 2026 10:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wvNpXt3jZZ/I4TU66gFoFqDAwKnn5L1HuGceMu3NMYs=; b=MS4qCEIsm6t5Xy
	zn+mwA0CQalNiEWnAWuQBAGVeGFsfqgbmpy/s4J1YcbSEXXsFmPrFsXj8q6dNz5FI4Jo7ow+uI4Eq
	OygugiWel4HdJVc9TOkkm7EBGjWWY6R1qEuodCM0fTLiBVTPP6OO9MtnS1euBOv5oHCFG3hCepnSf
	qtsdOA29IKEigrUPAkqZAIXF9VoZ9lTlklenLWeT9uKPw8UpX+/zKDWtkZ4TA8k7z525xu/IKsswJ
	rjF8Uy15XZf2bWXzhNP2cMM+YlD9gNxm0RXgY2TFTgBqOpGPv43cy+c0z0Rndu1w7lyO7DlwPRTvM
	YylkxB91DiemlxpvNdXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd3cA-0000000B4Mr-14Tm;
	Fri, 26 Jun 2026 10:16:50 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd3c7-0000000B4LX-0Xd4
	for opensbi@lists.infradead.org;
	Fri, 26 Jun 2026 10:16:48 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-84347ad88edso645186b3a.1
        for <opensbi@lists.infradead.org>; Fri, 26 Jun 2026 03:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782469006; x=1783073806; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=koI9jZGOcZpRkZis+gsUqXx94XFG6SCe/HgrGd9Zxos=;
        b=A98sXzY0Tujatgoz/qzku7om9fkg8EAtTnuNGK0ZO0R6wW9u+ePbA5T4Nw6mNubJfh
         aypmBWq/2hX7vnDEPVuGpGAH3rtLS0BpG8ojcu07W8KDSfH6l2EKsFYlQoXqmUl9ohAp
         0NWX941vhrb4q8N807mAzGtTqlelXBJqhKJfJEwCoFNIs+LanRj++Y4XibVkWvL9gNob
         J86cke5bWLWDVQngzvZH+VRklFRRv1MUnq89Or8je8ndRMziQ8pf3JhYTBpBlqR3wHcf
         8IZvZQHwMhbtOyamtuUj9sAP3/IVijaH2sNq1VBJSGNNsHAeEoaR+H+/OX9pZ9fTTu/i
         /I4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782469006; x=1783073806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=koI9jZGOcZpRkZis+gsUqXx94XFG6SCe/HgrGd9Zxos=;
        b=pDoJo/9aGqmQpdH4jv6w+0O1g4/L4L3a6ogZk2d8oKEUK8Qsnn31dIfXI5CriK9wLC
         EcJm+ftlIKlVUN6A3FWLPpjm7oDgzdVo+eyyk8XP0fyDrN9mtQXCDQfsuXQW/K8ZBTbV
         kkgK3uxtr3WIVjynEErdIIO8wnkfh8fXNSRGjD3U6mJZWBlX0+ZucN2szLeYzHlHYOSH
         9GQSY8aOwee8p0ybXOK7s50MkM82K067N/XvPstzlbLedk4oKNCniduglc/+iv0mRtV5
         1TJMshMiJ1u1ANm50T98dry3EhBgop7FbEQtQBA6HFJ7hYkVZwWtd7arBRjSwAEfHUbA
         GxLg==
X-Gm-Message-State: AOJu0Yy651dNc8bCFbExBGWW097hAuQDfJAFCTR9vVpLUNrELT2YoLuz
	0q99w0BIewVNiHHQ+dH2Y8csUYIrqgA8BnZXNUQA4L4AXcGEaWEkb5GuZ/Fp6tg8R1E6DMc4d+P
	zpghQIFBseDq0SsYpglDNzwLpFp3N+S7Ea8sMUZnBDhstfKiv1AWe2J3ymDZ2yLFFaFsp49Uwom
	dDprzoV4taMtnWSRDEM9K8QT5PE7bcMud4tBLDN8jXOhK4SecAUMo=
X-Gm-Gg: AfdE7cn5EamyTbBY5HcKQyaLa9Yw4/DUmMr98uwBATGmdGUdSGttezbfJuljyoJjI03
	JiAE/h1TdFkt8WMocoY8Z6ISHZCZywXQn7jbMSECDo8pJXqHlAEdYxIRAm0031gS6S+XDwimoU7
	6lfgu10tXFsU3oqrHTGVlrdjRDLTr18Twg3cAVQsS2uL4a2dEPHOvaNncl/ULnHk09HUgZdozy/
	OMj+MOI3E27YAv15ldjTCrzlNnu0hMfovcBaiqxWLRz27VPAcXh0K4GtMurbzodwpg+t57rCgLn
	K3pcHy1qxPn59XCrViHEGrhL3WHNVaSsgASUkuWFaW+P2zTmI8oTXSiJNRPq3ebwXlGVtSn89Wy
	J8nmXPSDkpyoYRvDpi2BK7EeKi+6n6wclypBLK8WBNwWjY+iKtPasUXvQVQkPFTDlVUbEVrsWST
	B+m7tfKOBoWG2/jVDLpwqI39TtFsw3mV8Kpi/N
X-Received: by 2002:a05:6a00:4195:b0:842:7e71:ba2 with SMTP id d2e1a72fcca58-845b3b6752cmr7637550b3a.27.1782469006105;
        Fri, 26 Jun 2026 03:16:46 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3ec0ec9sm6414226b3a.0.2026.06.26.03.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 03:16:45 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	anup@brainfault.org,
	scott@riscstar.com,
	conor@kernel.org,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [RFC PATCH 04/12] lib: sbi_hart: lock mwid CSR for RoT immutability
Date: Fri, 26 Jun 2026 18:14:25 +0800
Message-ID: <20260626101433.3133466-5-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20260626101433.3133466-1-peter.lin@sifive.com>
References: <20260626101433.3133466-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_031647_189917_CFA460C0 
X-CRM114-Status: UNSURE (   9.15  )
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

Lock the M-mode World ID (mwid) CSR during hart re-initialization to
enforce immutability of the WID established by the root-of-trust.

OpenSBI does not assign the WID value itself; it only sets MWID_LOCK
to freeze the value established by prior RoT stage. The MWID_LOCK bit
at XLEN-1 is sticky and makes the CSR read-only until reset, enforcing
a temporal security boundary per the RISC-V Worlds specification.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 lib/sbi/sbi_hart.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index cb0c66ea..4fbe46d7 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -804,6 +804,13 @@ int sbi_hart_reinit(struct sbi_scratch *scratch)
 	if (rc)
 		return rc;
 
+	/*
+	 * Assume MWID is restored by root-of-trust M-mode in previous
+	 * stage. Lock mwid so RoT-defined WID remains immutable.
+	 */
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMWID))
+		csr_set(CSR_MWID, MWID_LOCK);
+
 	return 0;
 }
 
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
