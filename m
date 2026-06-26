Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E2ECDE00C
	for <opensbi@archiver.kernel.org>; Fri, 26 Jun 2026 10:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZsqRuEJW8LwI+hZafxioS9fC8nfpdV9PdqgE3ceUKeE=; b=wiGyZt1IJB5/Oi
	ODPn7qq5tEmIAkAa1Bq0jUNKcrklQjtAUCHCrWicwlJBrjxo8DGfNllS1jazd2k8YOsmZ+qhIDjaL
	YnwhX0syYNMrLl3HhW5zQ3904ohhdLI156dSaVlSBwSl2JY+NeRG+XmklA/TuEAbHj3VZ3jKqqs7O
	mi+4uo4NAmy+IkAs5QiHC30pMmnxtJqBGAt6udE4NIddikqYY3n9oCSoBZbbpL/KF8vcRmwXOnTgQ
	J5m4xDMzYwVDo1xezhyGeQ0QoPFNNvQwicHbZihcPQYAfzaMwbdqRGVhzPA1+e+A7aWbn0Mfyr1m1
	rO6jkfeEUU0rYebzX7jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd3cT-0000000B4fG-0x2s;
	Fri, 26 Jun 2026 10:17:09 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd3cN-0000000B4Zy-3lcm
	for opensbi@lists.infradead.org;
	Fri, 26 Jun 2026 10:17:07 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c88b7c92577so327822a12.3
        for <opensbi@lists.infradead.org>; Fri, 26 Jun 2026 03:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782469023; x=1783073823; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vs1nn18ErBdE2h3DfjBQkpLvcApCW3HphSSjxOFzRkk=;
        b=Xh+q7idVQY3HvKt8687K/gELC0zxxPksHtXZTv9FZcRAstg2FhgQg3q3HC4xx8a8Z3
         VaTGkrJtOccXa8B/kyi5Z1j7gCkoSJClT+mFaoq/8hrqxbXEfZlpeuSy0SxBUrqC2wP7
         RsCphDUyYC+p3tu3U+gLccCCng2fr3YHxDTA/TFiOhnC+KmlIAbvEINvHh983IHhrhiW
         XwZn3OCoXtV4yKJDnSA5NvtNECDhkqVI4iTzH+GeKXP7QXnDXbH0EbCf3652TBo3ckC+
         3qWpqNzClK67Nu7ZzP8nT5ER5unW8TDWW1/wMjU+yr8a4K09YOJYTE4/4L2GmsyEXKHu
         rvuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782469023; x=1783073823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vs1nn18ErBdE2h3DfjBQkpLvcApCW3HphSSjxOFzRkk=;
        b=Ei1s1nvjxgTFbY3MYlDuzwss2qYDFTExUkqcoS28WATNaxJb9aYq1DN3ebiY/ijdIM
         UCqyg+w+9qP/dEVSdwUyk6ZlLAfz8VR3B8HuKYdsWVKM3VOUW2rq3FfXV8MfLoVyBfpM
         Q2GpzdYrQ5b6QxEY7nuweOV4F5H0ttOY8MNGG+N8Kj2VU3CIzFaLnqTDZERw5v/9P8Rl
         cUP7veAU3fQ6K4AJq9lfe9tSSj1MZV6amprVLVNDsSfoJeVBhTVyGhlVVAs3epDxReUj
         l+5GtnaaiMYCJrVXDOUAS/dZzn2OekQTvz6GYpoxI0pxerbxGbIdElyxCEywRQGy2YV7
         Q27A==
X-Gm-Message-State: AOJu0Yz/T1nvX9yp/liB6sry/4Al530otQHSz4QtgXwIA9+fEeZBLbu8
	AKT2ApKgWEuqb1qQNv7tEHFFqrVeUrmpoaPQDx943PWoCXqbSkq5qtzDerOGeqeFRfopDvraSz5
	xhK7GPG2d0lv0SCYbmOP8Qel7Nu0ihFCd7+cRT2Bv0QY8CQBow0j+Vb4An9ZBgQISJdsjPxgEt9
	4A3DBZyzVmupUN06zod7uMJc/IqRo6u/1hDFt4CV9/AFHKqfBRX1s=
X-Gm-Gg: AfdE7cmvYyD5RBdFiww4JTWfpZ2v5qZDqHaC0Qd8qHQOapPJaaihcoiFl5OEUj3hA1u
	cHgujr1H/ykMPzSI7l5TMV4tFj3yOBRNFjZ1e6F7yus00lfUMaH2ZsJS1kcKN/aGpROkjDqshTZ
	zYt9vVvCKDBdGK0pltH6AjYyD+ytcR9e1SFW9t68ZwEPMBktVbZ86jiUCihVZjOKZN+/r5EenQy
	UkMrez336XR6j0dxVLd0DnYYVl3+0ovoUR2NibOVj9i41qwFO8mEadXqRK5prUMEYEIQkzK/vXT
	idSQXEyIyB7RBxM9jNSsuNlhS9RaeQ2oeAcjpZdmnpWhLgHkgf3sc2bkdGr7jqxFKzGl9P8i2a3
	p2DGdVmQJhLb6GhHnMinqyL55qFNb35XT0Ye17N3Z634KInNTUChb6SgDkNhpQahAfsYik/5C4+
	dYwyGIGJh7iyKYJLm5LnxljpiDv3KwwLX5DXpt
X-Received: by 2002:a05:6a00:a210:b0:845:2ff5:b66d with SMTP id d2e1a72fcca58-845b3b8e27bmr7324402b3a.35.1782469022877;
        Fri, 26 Jun 2026 03:17:02 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3ec0ec9sm6414226b3a.0.2026.06.26.03.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 03:17:02 -0700 (PDT)
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
Subject: [RFC PATCH 09/12] platform: generic: parse root domain WID config from DT
Date: Fri, 26 Jun 2026 18:14:30 +0800
Message-ID: <20260626101433.3133466-10-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20260626101433.3133466-1-peter.lin@sifive.com>
References: <20260626101433.3133466-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_031705_678989_7FB1BD9D 
X-CRM114-Status: GOOD (  10.59  )
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

Parse root-domain-next-wid (32-bit) and root-domain-next-widlist
(64-bit) properties from /chosen/opensbi,config node during
generic_domains_init(). Sets root.next_wid/has_next_wid and
root.next_widlist.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 platform/generic/platform.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 51e9f342..de12deb5 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -11,6 +11,7 @@
 #include <platform_override.h>
 #include <sbi/riscv_asm.h>
 #include <sbi/sbi_bitops.h>
+#include <sbi/sbi_domain.h>
 #include <sbi/sbi_hartmask.h>
 #include <sbi/sbi_heap.h>
 #include <sbi/sbi_platform.h>
@@ -276,7 +277,9 @@ int generic_extensions_init(bool cold_boot)
 int generic_domains_init(void)
 {
 	const void *fdt = fdt_get_address();
-	int offset, ret;
+	const fdt32_t *val;
+	int len, offset, ret;
+	u64 val64;
 
 	ret = fdt_domains_populate(fdt);
 	if (ret < 0)
@@ -290,6 +293,21 @@ int generic_domains_init(void)
 		if (offset >= 0 &&
 		    fdt_get_property(fdt, offset, "system-suspend-test", NULL))
 			sbi_system_suspend_test_enable();
+
+		if (offset >= 0) {
+			val = fdt_getprop(fdt, offset, "root-domain-next-wid", &len);
+			if (val && len == sizeof(fdt32_t)) {
+				root.next_wid = fdt32_to_cpu(val[0]);
+				root.has_next_wid = true;
+			}
+
+			val = fdt_getprop(fdt, offset, "root-domain-next-widlist", &len);
+			if (val && (len == (2 * sizeof(fdt32_t)))) {
+				val64 = fdt32_to_cpu(val[0]);
+				val64 = (val64 << 32) | fdt32_to_cpu(val[1]);
+				root.next_widlist = val64;
+			}
+		}
 	}
 
 	return 0;
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
