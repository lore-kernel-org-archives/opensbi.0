Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1469CD3427
	for <opensbi@archiver.kernel.org>; Mon,  4 May 2026 17:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6rNnbSjVyfEa/MRt5sgvnf+3qcs32wbMPzpCC1Q+9ZI=; b=oBrvld5rqX7VuH
	wdXul5jTZYJJxTUsGzKJ6v8apOd9EaV+eOfWiLWyWsnK0i8Op2XCTPs7HmfXJqGJXM5BYoGFNqZCF
	NVcupthmtXT7XGWYr5qu+OUSOcjawEPdxZMNkRW7kcf4uUFRG2z0XSCbUIAuOWM77BmJI5KqKq5x6
	VeCwRUCDkJR6ZOA1ZAq5uHUl9gHuhZMScT6CknTZuo9XUuhjEr7wPiKNa/hT3lorRbyESOgYjEtYN
	uJhx9maoR8lYBsg1SOE30/6uiMTCf+Tw4BJfOsmKDP/gtKQZU/Lu08Q7757qBi4gUe/Htp0371DhB
	SNEx3E62efBzIGiZfZ2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJxH2-0000000DsOx-3x2D;
	Mon, 04 May 2026 17:40:04 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJxH0-0000000DsNi-36eT
	for opensbi@lists.infradead.org;
	Mon, 04 May 2026 17:40:03 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-8b4000e51fdso41791746d6.1
        for <opensbi@lists.infradead.org>; Mon, 04 May 2026 10:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777916401; x=1778521201; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4YQPDoHpiJeQxU3obhCG31jLnUD3j5n+F9vM0AJlLYc=;
        b=WNGTHHp3/l/oPICLkC9bnhwyM/C8zkWzPCuJIKvr3mGy6VUFpcxnkrVr/Sheg8vqxB
         g1ToKPE2Y9Tol1a++KsHKikbO8d24kQdvNUcMphQaiJLCswk+9ks9+35Obf1B3yz6j8a
         nIPm0ZhZ4Iz9zLZabOwoxCoAhP8sAnEjhzUiLeJaFQzs2DCuqzSiwwSOeSF0HaxxYJoE
         w3Ud+mVGjJdIyyNetOpWLbRG1OW73KAVylzsByomNetmVDfEiqxtQINuLM3NqQ+TY+D9
         goI1F+s6rq2dae4UgroB+fCn4dM6hBZ/JCCuaioksNkquwdAFZTvm33hSbzx/9Mypwlg
         i+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777916401; x=1778521201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4YQPDoHpiJeQxU3obhCG31jLnUD3j5n+F9vM0AJlLYc=;
        b=omYQmJcHjqspvDxbPgZCacatzA4GdxS9/uNttY3UZJxrL6FisfvjLmNZnVq3Br8GKU
         nJvtW1Zjk0gNeWTPzMYqhW+Dheu3zQJZMhxhGOd8g+dOxHt/RTmEhHzvMzhwxb+QvIOY
         pQD+95kHyh6kIxSclWAygMkrsddIHh/K76cfx51euHO5ljoeOe8aciLHQFynXCvIvhk5
         UhB2I3ei9rLv2ru1oe+eZEn1KvHkl6ZrqrlrPLoCvxT/dQWo058dYa+kcftF0tld4VM9
         NCKXws3A/zlD8tyl2gXTiD+Hzr9XO5nckCWz9oJTwHAKXPXxF6XpkxBlovH4KFqksYbt
         4LAA==
X-Gm-Message-State: AOJu0YysrtXDfCYaIe278X0UP4X1fiCdYNy+Z7ibpPGrY3BJtBWvO4m0
	fqFWx496OMsVLmVWaL0R2e58ub8l0WjNmnegMjUrLRZVdcT0TscJ4stneAvBdhryxj4=
X-Gm-Gg: AeBDiesvLIp+1Bvq76nvVtt8tFGrT8Ll2TpAkZX/9hWNpiz6/kAzAfvBGKehU471QyA
	qZciZi0LX5Zc0lkIYNo+XwyUh3SzN4znmAyhSOLt9+hepMdAc09fKeu6+BOU+YXcnfI47lqw7yQ
	ONFZXgwR2yw9u8I++SPleeii14AMQcbEPgW+nE4oU3x9YMpA69RPhtl5Q5u18r95FivAqdCUeig
	X38dOAZPkgi+Kg6VdW5utBi9GmLGZMAM5I2Oz8dvjD4MyHK5PB+XQ5hopyMt83lDfZ0w0cx+aX4
	gnV5rjfrC/FAZMC/UFQ4HrP1l1yqbtvfMpnBoKTYJuaoRQRFhqXndJk6qC5pC3aazXzhAg34l9J
	ZwxNFUCL1nTzwLKkU905toUz03ABRWljIWAznWGy5k+9/ZwMqI/1EH5Z7bbXmNNyaHoEQTk/fwB
	j9pl+FQoTjPhXNoYvkcGp5IZOp7iaXo1nzbOQx2gKLsYeCHonyBBFBO4zCpI1iuax0y2pQ5WlAT
	3FR2y0kKOGBlq2HYmxOg3WVtnlTg5K0
X-Received: by 2002:a05:6214:c2e:b0:8b1:f2b7:cfba with SMTP id 6a1803df08f44-8b665ffee1amr173260846d6.1.1777916400374;
        Mon, 04 May 2026 10:40:00 -0700 (PDT)
Received: from ubuntu.localdomain (172-97-209-197.cpe.distributel.net. [172.97.209.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b5395c5b4csm128087586d6.16.2026.05.04.10.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 10:40:00 -0700 (PDT)
From: Raymond Mao <raymondmaoca@gmail.com>
To: opensbi@lists.infradead.org
Cc: scott@riscstar.com,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	anup.patel@qti.qualcomm.com,
	anuppate@qti.qualcomm.com,
	anup@brainfault.org,
	dhaval@rivosinc.com,
	peter.lin@sifive.com
Subject: [PATCH 2/2] sbi: route domain lifecycle transitions through hwiso hooks
Date: Mon,  4 May 2026 13:39:48 -0400
Message-Id: <20260504173948.1663823-2-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260504173948.1663823-1-raymondmaoca@gmail.com>
References: <20260504173948.1663823-1-raymondmaoca@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_104002_795928_6F229EA8 
X-CRM114-Status: GOOD (  14.70  )
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

From: Raymond Mao <raymond.mao@riscstar.com>

Invoke HWISO boot/domain initialization during domain finalization
and FDT domain population, and call mechanism exit/enter hooks
around domain context switches and secondary hart bring-up.

This makes hardware-isolation state follow the same lifecycle as PMP
and domain assignment.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 lib/sbi/sbi_domain.c         | 19 +++++++++++++++++++
 lib/sbi/sbi_domain_context.c | 10 ++++++++++
 lib/sbi/sbi_hsm.c            |  5 +++++
 lib/utils/fdt/fdt_domain.c   |  7 +++++++
 4 files changed, 41 insertions(+)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 374ac36b..ef308925 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -17,6 +17,8 @@
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_string.h>
+#include <sbi/sbi_hwiso.h>
+#include <sbi_utils/fdt/fdt_helper.h>
 
 /*
  * We allocate an extra element because sbi_domain_for_each() expects
@@ -695,6 +697,15 @@ int sbi_domain_finalize(struct sbi_scratch *scratch, u32 cold_hartid)
 	u32 i, dhart;
 	struct sbi_domain *dom;
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
+	void *fdt = fdt_get_address();
+
+	/* Configure system-level hardware isolation mechanisms at boot */
+	rc = sbi_hwiso_init(fdt);
+	if (rc) {
+		sbi_printf("%s: hw isolation init failed (error %d)\n",
+			   __func__, rc);
+		return rc;
+	}
 
 	/* Initialize and populate domains for the platform */
 	rc = sbi_platform_domains_init(plat);
@@ -704,6 +715,14 @@ int sbi_domain_finalize(struct sbi_scratch *scratch, u32 cold_hartid)
 		return rc;
 	}
 
+	/* Prepare root domain hwiso contexts even without DT parsing */
+	rc = sbi_hwiso_domain_init(fdt, -1, &root);
+	if (rc) {
+		sbi_printf("%s: root hw isolation init failed (error %d)\n",
+			   __func__, rc);
+		return rc;
+	}
+
 	/* Startup boot HART of domains */
 	sbi_domain_for_each(i, dom) {
 		/* Domain boot HART index */
diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index a3d3988d..aa7eb01b 100755
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -11,6 +11,7 @@
 #include <sbi/sbi_hsm.h>
 #include <sbi/sbi_hart.h>
 #include <sbi/sbi_heap.h>
+#include <sbi/sbi_hwiso.h>
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_string.h>
 #include <sbi/sbi_domain_context.h>
@@ -33,6 +34,9 @@ static void switch_to_next_domain_context(struct sbi_context *ctx,
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 	unsigned int pmp_count = sbi_hart_pmp_count(scratch);
 
+	/* Exit first so mechanisms can tear down current domain state. */
+	sbi_hwiso_domain_exit(current_dom, target_dom);
+
 	/* Assign current hart to target domain */
 	spin_lock(&current_dom->assigned_harts_lock);
 	sbi_hartmask_clear_hartindex(hartindex, &current_dom->assigned_harts);
@@ -50,6 +54,12 @@ static void switch_to_next_domain_context(struct sbi_context *ctx,
 	}
 	sbi_hart_pmp_configure(scratch);
 
+	/*
+	 * Enter after PMP reconfiguration so mechanisms can rely on the
+	 * target domain's base isolation being in effect.
+	 */
+	sbi_hwiso_domain_enter(target_dom, current_dom);
+
 	/* Save current CSR context and restore target domain's CSR context */
 	ctx->sstatus	= csr_swap(CSR_SSTATUS, dom_ctx->sstatus);
 	ctx->sie	= csr_swap(CSR_SIE, dom_ctx->sie);
diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index 35c84de2..69d70304 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -19,6 +19,7 @@
 #include <sbi/sbi_hart.h>
 #include <sbi/sbi_hartmask.h>
 #include <sbi/sbi_hsm.h>
+#include <sbi/sbi_hwiso.h>
 #include <sbi/sbi_init.h>
 #include <sbi/sbi_ipi.h>
 #include <sbi/sbi_platform.h>
@@ -145,6 +146,7 @@ void __noreturn sbi_hsm_hart_start_finish(struct sbi_scratch *scratch,
 	unsigned long next_arg1;
 	unsigned long next_addr;
 	unsigned long next_mode;
+	struct sbi_domain *dom = sbi_domain_thishart_ptr();
 	struct sbi_hsm_data *hdata = sbi_scratch_offset_ptr(scratch,
 							    hart_data_offset);
 
@@ -157,6 +159,9 @@ void __noreturn sbi_hsm_hart_start_finish(struct sbi_scratch *scratch,
 	next_mode = scratch->next_mode;
 	hsm_start_ticket_release(hdata);
 
+	if (dom)
+		sbi_hwiso_domain_enter(dom, NULL);
+
 	sbi_hart_switch_mode(hartid, next_arg1, next_addr, next_mode, false);
 }
 
diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
index fa1c3575..ac0074ed 100644
--- a/lib/utils/fdt/fdt_domain.c
+++ b/lib/utils/fdt/fdt_domain.c
@@ -14,6 +14,7 @@
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_hartmask.h>
 #include <sbi/sbi_heap.h>
+#include <sbi/sbi_hwiso.h>
 #include <sbi/sbi_scratch.h>
 #include <sbi_utils/fdt/fdt_domain.h>
 #include <sbi_utils/fdt/fdt_helper.h>
@@ -439,6 +440,11 @@ static int __fdt_parse_domain(void *fdt, int domain_offset, void *opaque)
 	else
 		dom->system_suspend_allowed = false;
 
+	/* Parse per-domain hardware isolation configuration */
+	err = sbi_hwiso_domain_init(fdt, domain_offset, dom);
+	if (err)
+		goto fail_free_all;
+
 	/* Find /cpus DT node */
 	cpus_offset = fdt_path_offset(fdt, "/cpus");
 	if (cpus_offset < 0) {
@@ -483,6 +489,7 @@ static int __fdt_parse_domain(void *fdt, int domain_offset, void *opaque)
 	return 0;
 
 fail_free_all:
+	sbi_hwiso_domain_cleanup(dom);
 	sbi_free(mask);
 fail_free_regions:
 	sbi_free(dom->regions);
-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
