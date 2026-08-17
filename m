Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15CC7C5B572
	for <opensbi@archiver.kernel.org>; Mon, 17 Aug 2026 09:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=STH9a9tdBx0cjP+ZQyoB4+P2FTWQ+UemTieOF6VQt4Y=; b=R5znHW3mgusOYZ
	c6VVFB6nlJAYeFZe6SHAwd/KPkPyMnsGeUg5bULI1vjBoesPDzsbSmrpRRV2tSZO4UIsogaAirts9
	IKoNCmouVVHgq2J7SNeozLNJ6tyb0Vf11VSK/KmVXpf65wOhUMWvJTqCT71Uf9D/ulQfzuUmpfKi3
	hHDexHcJHSUl2FmAxk4nnaE/ai+VaVzahOy3GMdTNaL3b9D0uDNrWY40QYeSV02Y5EZjFzgF/F4yB
	mujWDDbaDl6EP1XVEeu/tVczMLRwi7ln6tX6nY55lYqZDCOa2Kw0aJdGrOdsGmz8HWEiWRMcTAo1v
	d5Tw/yYSAH4YCMZE62Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvtI2-00000005lsJ-096R;
	Mon, 17 Aug 2026 09:05:54 +0000
Received: from mail-pf1-f175.google.com ([209.85.210.175])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvtHt-00000005llK-0i9u
	for opensbi@lists.infradead.org;
	Mon, 17 Aug 2026 09:05:52 +0000
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8487b7b3fc8so3357445b3a.3
        for <opensbi@lists.infradead.org>; Mon, 17 Aug 2026 02:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1786957544; x=1787562344; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YinlMv0QsxVFocJO7j7tdaUm7IglS6R9ehcOw4sTDKs=;
        b=gIDPZFtQoPOs4UHGLkNp6VJjnxLV8SonvPTK1hSg0+eqfTL5J2D1lAP197FCcidSKF
         lvaE0WNBNmukujHtvk7j9xzYgDEzDb4EixWgSAko4YfHRJInt1dbrW6vQOZvinOxWZoz
         6UAY28is10e+zlOUZu9ZIXiISb1cVbwWWL5qlsyai5j9NZREkdPGp+WjmssbQdzYLiD/
         SeGzzw3lOUBt8z0dKnmXHs/oav8n0A98gMxH2rPMXxrvUt57U+E4FZ57RuwbG8p0QPza
         ntPAFjSaAtLCMuxhTdABYNX4ihRqZR55Bra9GprT/vkouy1SmBI8GLpH9jnGFVMVER9a
         qKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786957544; x=1787562344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YinlMv0QsxVFocJO7j7tdaUm7IglS6R9ehcOw4sTDKs=;
        b=V5YfFqnK7CMLOi5jLd8wQCmprkKOt7jOywNzHkhRTHuOcnYOzIkBsqZ3pZViErhdjO
         PEVu1jMewDDpq1dSRpgYy5qtw0OeTweVY8LCRD0q15ENTA5cNJXruIZV9mB9og7bOFht
         UyMexdz6gU0v0bGI84GdERSwOlDO6qxs1tZULYUNaCdKCgm2HBrT2wg0spEHTpDLSuBA
         GCCfz4S6kKpGoqZDWTrJ5yQ/VrT1hmqza+cneIkltqP3qDMaSpkvs0+icJghB+PoS0Xk
         rINK2XPKMpT1vwNSlZjzPg5mY6lJlDP3PUN6zG/3CM4L/D220g1BhXC/4S3fs6o830B5
         at5A==
X-Gm-Message-State: AOJu0YxrL5jzqtQVuV5Rw0+XRZ64quRbGts1diRtxFGjrXPm34O7QYx3
	t24ZS+9ntsmuExgzVUW6PbHJL+cGuFVMXlem1dhY2Khxrzsv4ZdTNnuZRsNLnFjQBa71AOozHR7
	hYB7WO/v8+FAx46H5kbNKr1Hjq1PwqXweK6MUTt/kjDMs2dgJOS0ciA6vlDt5fowNzNxh4ykqlU
	Xqv3gyWGB36QW6KKtv08jQ2NKnJXsZzvoaY/f/+HGX26d4SMORMZE=
X-Gm-Gg: AR+sD114Y3Z+VHjPW1rXAJI+OT51Y6NOTaF+MbkQ29Z5vB+vc/OCShPrcVz/5QBrMYD
	EJiHTJT2cvbJEoyhXnS5cfl36TJUVIPshGrGnvkZPaXNqdVtI2A4DvyxBqjHdT2GxYrBK0puqhW
	QNJQDmOBNyvTk6EU7EKegP94jO7GX8Rh8t+u7lbGsDLrbHTHwZLJtSxeQHqihFrGNlKasNMODi0
	Uv/J7q5jAQuhDJUevgOHVor2//NsMLlPJ/vTCyo0vuqOHMwWf4m5jY/p8n5BtuBhoQHZy1nXpJh
	q5/SblrVSgs6E2w3VrEo4Jrqy7lwhGek9EB+/fx/Bn3iNVFaYcgK/ZzvpH6+rSqUjuWqQ+RkYBm
	R7EXnqUHkX9s03dFHt0rvIvs2L51cACiSM1P9GI6hHQJ3CR6QiUc91vDB0mHbua1MRCzT2lM56H
	OZPoi5ad1ZOWfmsikpTD3mxodIGEo+vzcqy4J8ZECriuRsfSiGmFipUihbe2c0kjjX8oV/lowyu
	uu6I/qEsaUb
X-Received: by 2002:a05:6a00:2d9c:b0:848:4d4f:d477 with SMTP id d2e1a72fcca58-84fde2cb205mr23722096b3a.18.1786957543839;
        Mon, 17 Aug 2026 02:05:43 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d223f1bsm2487386b3a.38.2026.08.17.02.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 02:05:43 -0700 (PDT)
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
	pawandeep.oza@oss.qualcomm.com,
	krzk@kernel.org,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v2 9/9] docs: document WID DT properties
Date: Mon, 17 Aug 2026 17:05:03 +0800
Message-ID: <20260817090503.2104998-10-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20260817090503.2104998-1-peter.lin@sifive.com>
References: <20260817090503.2104998-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_020545_223874_A71F9763 
X-CRM114-Status: GOOD (  12.72  )
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

Add "wid" and "widdeleg" properties to domain instance node
documentation and example DT. Add a "Root Domain Node" section
describing the "root" subnode under the domain configuration
node for root domain WID configuration

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 docs/domain_support.md | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/docs/domain_support.md b/docs/domain_support.md
index e267a9f7..c35a1d9a 100644
--- a/docs/domain_support.md
+++ b/docs/domain_support.md
@@ -93,6 +93,8 @@ following manner:
   is the next mode for the ROOT domain
 * **system_reset_allowed** - The ROOT domain is allowed to reset the system
 * **system_suspend_allowed** - The ROOT domain is allowed to suspend the system
+* **wid** - Configurable World ID for the ROOT domain
+* **widdeleg** - Configurable World ID delegation bitmask for the ROOT domain
 
 Domain Effects
 --------------
@@ -126,6 +128,23 @@ The DT properties of a domain configuration DT node are as follows:
 * **compatible** (Mandatory) - The compatible string of the domain
   configuration. This DT property should have value *"opensbi,domain,config"*
 
+### Root Domain Node
+
+The root domain WID configuration is described in a **root** subnode under
+the domain configuration DT node. This subnode does not have a compatible
+string.
+
+The DT properties of the root domain node are as follows:
+
+* **wid** (Optional) - The 32 bit World ID for lower-privilege modes
+  (S/U-mode) for the ROOT domain. If present, OpenSBI writes this value
+  to **mlwid** when entering the ROOT domain (requires Smlwid extension).
+  If absent, OpenSBI uses the M-mode WID as fallback.
+* **widdeleg** (Optional) - The 64 bit World ID delegation bitmask for
+  the ROOT domain. If present, OpenSBI writes this value to **mwiddeleg**
+  when entering the ROOT domain (requires Smwiddeleg extension). If absent,
+  clears **mwiddeleg** to disable S-mode WID delegation.
+
 ### Domain Memory Region Node
 
 The domain memory region DT node describes details of a memory region and
@@ -204,6 +223,14 @@ The DT properties of a domain instance DT node are as follows:
   whether the domain instance is allowed to do system reset.
 * **system-suspend-allowed** (Optional) - A boolean flag representing
   whether the domain instance is allowed to do system suspend.
+* **wid** (Optional) - The 32 bit World ID for lower-privilege modes
+  (S/U-mode) for the domain instance. If present, OpenSBI writes this value
+  to **mlwid** on context switch into this domain (requires Smlwid extension).
+  If absent, OpenSBI uses the M-mode WID as fallback.
+* **widdeleg** (Optional) - The 64 bit World ID delegation bitmask for
+  the domain instance. If present, OpenSBI writes this value to **mwiddeleg**
+  on context switch into this domain (requires Smwiddeleg extension). If absent,
+  clears **mwiddeleg** to disable S-mode WID delegation.
 
 ### Assigning HART To Domain Instance
 
@@ -260,6 +287,11 @@ be done:
                 order = <64>;
             };
 
+            root {
+                wid = <3>;
+                widdeleg = <0x0 0x0>;
+            };
+
             tdomain: trusted-domain {
                 compatible = "opensbi,domain,instance";
                 possible-harts = <&cpu0>;
@@ -268,6 +300,8 @@ be done:
                 next-arg1 = <0x0 0x0>;
                 next-addr = <0x0 0x80100000>;
                 next-mode = <0x0>;
+                wid = <1>;
+                widdeleg = <0x0 0x6>;
                 system-reset-allowed;
                 system-suspend-allowed;
             };
@@ -276,6 +310,8 @@ be done:
                 compatible = "opensbi,domain,instance";
                 possible-harts = <&cpu1 &cpu2 &cpu3 &cpu4>;
                 regions = <&tmem 0x0>, <&tuart 0x0>, <&allmem 0x3f>;
+                wid = <0>;
+                widdeleg = <0x0 0x1>;
             };
         };
     };
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
