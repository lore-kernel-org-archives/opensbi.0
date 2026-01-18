Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBFBCA5FEF
	for <opensbi@archiver.kernel.org>; Sun, 18 Jan 2026 11:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sqaJOCo2Andi4K6o4yyaALABacrm8sLzBPYjDkJ2zXY=; b=Lc8QfF+IDlGp65
	jwd7WrkxUSdxyZoSnrDk8CnZBgg7c1/hn9LU/d2F+bGcT21H5Zgqrc78zPlN4FfEy6azkJrnOSPLk
	E1fZCq14zKUJ8OkqCN6kmQQbDd9o7phuVqHoyc9kHX15fZMvEkdTdtdGWxELzwV5TvO6nVUqowF6B
	BndKGhroCZQN4x9qYAClf5rdcAYT8ApYMU4wz9QBb6wigcm0tp2Eo/sHx9sphbw4e7DhHvm8sL4Tu
	rdBMEcHvbiDEhZJyy7z9O3W5IvZdsg7yfQQKJ8EcVjHyzAqbCXLDvlzBkAAdgpGoL/oWBQcX4wrS5
	vjRCNwviooCif11Y8XvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhR78-0000000HTDD-2uaM;
	Sun, 18 Jan 2026 11:38:38 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhR6y-0000000HSxE-2GiD
	for opensbi@lists.infradead.org;
	Sun, 18 Jan 2026 11:38:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1768736308; x=1800272308;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jygSk4NLOTBJCZGwq9+NQdIYbSNqx/8moPxL/Q2JTrE=;
  b=s+Eegh7Otp8UlM3H4IHmn3tbdKh3LX6LpahBIwAQmgxumzHgtXPvjFz4
   YMYhjWMpwO2PtGq3BLcpvlmJ2mYxYrV4CuPas/K1OqB2MK9LkoiPzIIz8
   1aL71OH2KFQLrr9p2MGCBIb+ZJZkPiyfEAFbJK8TUXtz7AnyJsHCaVNap
   3NMtNbHY979KQNgUpKXr1OoB9jqCPEQTS3viPJvrPZXipOrG72G3x1yOg
   zuqwU6ekuZAZLOx8iseRhn00fuo2hKl4dGcFYvBWsEV2f+GDJGHsCAUfd
   RvmIi32jy3g/y2WMw7Oz/MOd8n7l24UqH2Vx/w52tVHr/uoR1Z+jNUrCI
   A==;
X-CSE-ConnectionGUID: m8vnIJx0SeypkFAWIKxldA==
X-CSE-MsgGUID: qTqWisTHR2mFD5MwI6Zr2g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 13:38:27 +0200
X-CSE-ConnectionGUID: t8SlmEEfQ2q4RpZ0TOALBg==
X-CSE-MsgGUID: arLO+gZNTOGVVZ2/t3x8GQ==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.6])
  by ces02_data.me-corp.lan with SMTP; 18 Jan 2026 13:40:23 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Sun, 18 Jan 2026 13:38:26 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: vladimir.kondratiev@mobileye.com,
	anup@brainfault.org
Cc: benoit.monin@bootlin.com,
	cfu@mips.com,
	opensbi@lists.infradead.org,
	cc=cfu@mips.com
Subject: [PATCH v2 20/20] platform: generic: mips eyeq7h: prohibit
 accessing memory beyond DRAM
Date: Sun, 18 Jan 2026 13:38:02 +0200
Message-ID: <20260118-for-upstream-eyeq7h-v2-20-71934a5b9756@mobileye.com>
In-Reply-To: <20260118-for-upstream-eyeq7h-v2-0-71934a5b9756@mobileye.com>
References: <20260118-for-upstream-eyeq7h-v2-0-71934a5b9756@mobileye.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_033828_885302_2A8FBF53 
X-CRM114-Status: GOOD (  15.48  )
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

SBI code arranges domain PMP regions in a way that last entry is
all-inclusive "0..~0 RWX" and the rest of entries are not programmed.
This causes 2 problems for the eyeq7h.

1) Remaining entries from the boot loader.
When PMP is actually programmed on the later stage, only defined entries
get programmed. Therefore, if boot code configured some entries beyond
what is set in domain configuration, it will be untouched. Ex: boot code
sets entries 14 and 15, leaving others unconfigured. To prevent such
left over PMP entries, domain should configure all possible PMP regions.

2) speculative prefetches
CPU can issue speculative prefetches to non-existent addresses. If this
access goes to the system NOC, it is mis-interpreted as an access
violation and error is reported, forcing system reset.

To prevent such a speculative transaction to leave a CPU cluster,
block it using PMP, by restricting memory region to physically present
memory.

How is it done:

- on early init, add an all-permissive entry matching DRAM.

- on final init, find the last last PMP entry configured by generic code,
update its flags to inaccessible MMIO memory. MMIO serves to set up
PMA attributes to uncached non-prefetchable. Then duplicate this entry
for the rest of the PMP table

Resulting memory regions:

Domain0 Region00            : 0x0000000800100000-0x000000080013ffff M: (F,R,X) S/U: ()
Domain0 Region01            : 0x0000000800100000-0x00000008001fffff M: (F,R,W) S/U: ()
Domain0 Region02            : 0x0000000048700000-0x000000004870ffff M: (I,R,W) S/U: ()
Domain0 Region03            : 0x0000000067480000-0x000000006748ffff M: (I,R,W) S/U: ()
Domain0 Region04            : 0x0000000067500000-0x000000006750ffff M: (I,R,W) S/U: ()
Domain0 Region05            : 0x0000000048740000-0x000000004875ffff M: (I,R,W) S/U: ()
Domain0 Region06            : 0x00000000674c0000-0x00000000674dffff M: (I,R,W) S/U: ()
Domain0 Region07            : 0x0000000067540000-0x000000006755ffff M: (I,R,W) S/U: ()
Domain0 Region08            : 0x0000000000000000-0x000000007fffffff M: (I,R,W) S/U: (R,W)
Domain0 Region09            : 0x0000000800000000-0x00000008ffffffff M: () S/U: (R,W,X)
Domain0 Region10            : 0x0000001000000000-0x0000001fffffffff M: (I) S/U: (R,W)
Domain0 Region11            : 0x0000000000000000-0xffffffffffffffff M: (I) S/U: ()
Domain0 Region12            : 0x0000000000000000-0xffffffffffffffff M: (I) S/U: ()
Domain0 Region13            : 0x0000000000000000-0xffffffffffffffff M: (I) S/U: ()
Domain0 Region14            : 0x0000000000000000-0xffffffffffffffff M: (I) S/U: ()
Domain0 Region15            : 0x0000000000000000-0xffffffffffffffff M: (I) S/U: ()

Here Region09 covers DRAM, regions 11..15 set to non-accessible
uncached no-prefetch for thw whole address range

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 platform/generic/mips/eyeq7h.c | 56 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/platform/generic/mips/eyeq7h.c b/platform/generic/mips/eyeq7h.c
index 2fb498c1b8f47a5a16d74a2c78fd9dff6dda156c..9341c8beaca25c8c62e19efbdd4a59c726814261 100644
--- a/platform/generic/mips/eyeq7h.c
+++ b/platform/generic/mips/eyeq7h.c
@@ -14,6 +14,7 @@
 #include <sbi/sbi_timer.h>
 #include <sbi/sbi_hart_pmp.h>
 #include <sbi/riscv_io.h>
+#include <libfdt.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/fdt/fdt_fixup.h>
 #include <mips/p8700.h>
@@ -121,6 +122,31 @@ static struct sbi_domain_memregion *find_last_memregion(const struct sbi_domain
 	return --reg;
 }
 
+static int fixup_dram_region(const struct sbi_domain *dom,
+			     struct sbi_domain_memregion *reg)
+{
+	const void *fdt = fdt_get_address();
+	int node;
+	int ret;
+	uint64_t mem_addr, mem_size;
+	static const char mem_str[] = "memory";
+
+	if (!reg || !fdt)
+		return SBI_EINVAL;
+
+	/* Find the memory range */
+	node = fdt_node_offset_by_prop_value(fdt, -1, "device_type",
+					     mem_str, sizeof(mem_str));
+	ret = fdt_get_node_addr_size(fdt, node, 0, &mem_addr, &mem_size);
+	if (ret)
+		return ret;
+	reg->flags = SBI_DOMAIN_MEMREGION_MMIO; // disable cache & prefetch
+	return sbi_domain_root_add_memrange(mem_addr, mem_size, mem_size,
+					    (SBI_DOMAIN_MEMREGION_SU_READABLE |
+					     SBI_DOMAIN_MEMREGION_SU_WRITABLE |
+					     SBI_DOMAIN_MEMREGION_SU_EXECUTABLE));
+}
+
 static void fdt_disable_by_compat(void *fdt, const char *compatible)
 {
 	int node = 0;
@@ -203,10 +229,29 @@ static struct fdt_general_fixup eyeq7h_cache_fixup = {
 
 static int eyeq7h_final_init(bool cold_boot)
 {
+	struct sbi_scratch *scratch;
+	const struct sbi_domain *dom;
+	struct sbi_domain_memregion *last_reg;
+	int pmp_count;
+
 	if (!cold_boot)
 		return 0;
 
 	sbi_hsm_set_device(&eyeq7h_hsm);
+	scratch = sbi_scratch_thishart_ptr();
+	pmp_count = sbi_hart_pmp_count(scratch);
+
+	/*
+	 * clear the rest of regions that may be set by the boot code
+	 * SBI code don't let to disable PMP region, so configure it to
+	 * all-denied and no-cache no-prefetch
+	 */
+	dom = sbi_domain_thishart_ptr();
+	last_reg = find_last_memregion(dom);
+	last_reg->flags = SBI_DOMAIN_MEMREGION_MMIO; // disable cache & prefetch
+	for (struct sbi_domain_memregion *reg = last_reg + 1; reg < &dom->regions[pmp_count]; reg++) {
+		*reg = *last_reg;
+	}
 	fdt_register_general_fixup(&eyeq7h_acc_clusters_fixup);
 	fdt_register_general_fixup(&eyeq7h_cache_fixup);
 
@@ -263,6 +308,8 @@ static void eyeq7h_init_clusters(void)
 
 static int eyeq7h_early_init(bool cold_boot)
 {
+	const struct sbi_domain *dom;
+	struct sbi_domain_memregion *reg;
 	int rc;
 	unsigned long cm_base;
 
@@ -308,7 +355,14 @@ static int eyeq7h_early_init(bool cold_boot)
 					  SBI_DOMAIN_MEMREGION_SU_READABLE |
 					  SBI_DOMAIN_MEMREGION_SU_WRITABLE);
 
-	return 0;
+	/*
+	 * sbi_domain_init adds last "all-inclusive" memory region
+	 * 0 .. ~0 RWX
+	 * Find this region (it is the last one) and update size according to DRAM
+	 */
+	dom = sbi_domain_thishart_ptr();
+	reg = find_last_memregion(dom);
+	return fixup_dram_region(dom, reg);
 }
 
 static int eyeq7h_nascent_init(void)

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
