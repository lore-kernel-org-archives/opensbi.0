Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB860606A31E
	for <opensbi@archiver.kernel.org>; Tue, 24 Nov 2026 04:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I+Gl6f7B;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=GZKyrD7e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iQg9Y6bCZ6ovwfQvkrD9GPVGtb51qJcVT23YOFYG+h8=; b=I+Gl6f7BWccilXFEUR98R06JtS
	3dwDeD10NrY7jq3Ml7XU+fKY++1OpPhK54fUha37EvE2qMa7H3YRcfdRe1hz35syr4PjI6E8NlJhp
	9UqYg5pQiW4aP9VJJSoRaJY8tZgJ/Eh6fNGhUyVRBLUCiuguY5VxG9H1wN/PDm/krX6eQV3xddFwj
	yGdaGv7tNd6OPSl03eh5mItq3XxfZXsatvm0Yw9skzCtgaWjyhU+903qlqnvC6Kq9GX4A3OMiVqQY
	PYGqM7PkY+5y0nRC05TMTZu1UXgv2r8Sp0YIJ/HWNCbM6FNopTiiL6FucQ3gh0KsaisWro8uoVkYA
	1myPaqHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhxl-00000005Vfi-0Eoi;
	Tue, 24 Nov 2026 04:17:01 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhxj-00000005Vdb-1vjs
	for opensbi@lists.infradead.org;
	Tue, 24 Nov 2026 04:17:00 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-8a07078200fso2024228b3a.2
        for <opensbi@lists.infradead.org>; Mon, 23 Nov 2026 20:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1795493818; x=1796098618; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ctmuaFprpTS+fRA0vl0VcD5+9wJUUbE5SgRjU0A9ZMY=;
        b=GZKyrD7eJPi8GIe4/yYVlzcAY07Uqf+7o03dcbojYgIOVlIqaxHkbM+mWmN9JgKFL2
         JfinlWGDooBLxrcEJ+Yjam0ogIjin0/ioGl0+bcYE3SkfIPpCfAsSrczSI6iFIuEgXrW
         AThADzDTrnnrm8TnlqRyvyRa/bt6oQE1xsR7elY8OLHoJ7lH7UK56/mONgLujJYzITMH
         gsB5Vv3h82koL48euZ++w2cHqIDiKPNmvGONzPk1NOjMwgng2gwt8AjFe0A9Uv3h2aB6
         pn6DhZXXgoOILnajrPiqOZfdXnTBZpS+op6oQWNGDXcF2UaARXAFAz4Lk0ksIJQjke8g
         2xxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795493818; x=1796098618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ctmuaFprpTS+fRA0vl0VcD5+9wJUUbE5SgRjU0A9ZMY=;
        b=raZ974iZ7cl7sk0SoExaAmtJALMSrA/s3gl3ZDLUuI1cc7kZZ83fyavVOUfh0wXlSC
         5u0MX7+wHigdgYZmx6ABObIPbbRbM41sfh9oz3iqUkYxPXgxGNISER6AqfcGGPeJ4Pv/
         ydoEoHTA/pESiPtNtjuDM76X3XnW45FAc7qAWRFfwJKDq0BUsKSNtgRX7f7I/y8udxvj
         Gsx5P2TO5YWMJg2IymLceS6hpAQHrCG9qM6ioMmXaaBdhmaXF3arE2h1l9U7EfD45Mq2
         h/VrGBR3RQaexNEYVv9el5Vvyzc7Fj1pKLGeaMpPPL/q9ubS/Spxn9cTQD1YB+7b5yB+
         kPyQ==
X-Gm-Message-State: APuU4Z8fJc4LuQXlNneWbecegJA9O8kbC102adB+c49qP2e7TjKBxXhk
	pt3Lp6jvr4BtxUnpyVcwCZhMMEVj9b232IoCOODtmKXE+RQSXKVKyFd5L1jSskkRJP/Wh9gF3kQ
	6+xboviPbEwXK6pQN5NF8ancqyXRVZC8FT6zv5b9xbRf6NrHpX85CxZnCs7VjZnKxTuepS6Qmjk
	cNCf8mRRSq9yHaQFoXyPji9X8jW/r4ajiL+z2XvWsoG12PCuR+xJs=
X-Gm-Gg: AZFdTZew0Tl/sHnYv/bifjtnFZxGRu5uv6d6ZzRT+WDtbxFAAp+uxFEd3JtY5fW95kS
	xl2BGf7Km9oGiqmQmClX59O8hZEOl79bjZ7tH2ymWllcTvWD6s7vnjJIe5e4Cu3f2y2gSp+RNIL
	zbTesHQqIIfC/ftbAm9MAXSRSNXimFDY5QWIdXr6QMYszaQ3vUgd685nFvpvsInCT8FRr3+kpF0
	8TzhobpG+YJXPSOki2MRP0WkIC/d8jfOQ7fRox0RaNASTqFwmQ67LZjYrQ75j3/Fs40VQqnyn0a
	b+xLcI/TH1d310pLvc9ryKx+ecPvz6BKO1ep89bjrSck+a2vVMPaC3cisciPQ6ExI5/BdC+SCv9
	pqld86GeXextx22GLfJgHqLV8jtMTJhfb7o8OC9gixReDnK90FbAkZtiz+8/t66bEWltcKtI9ga
	tIC9I1rBDsQ7sxC1UDdU/ckwo0Tzay4ah+hqdZN6t50mflAz2E81jyqq+r6J27RcrbuD4nQo3l6
	7975UNrw30V31+vpfPXxzjChuhAKezzZHT59KwKHb3XMqYeHGoOWwUcLnrbMCW4AYSgg+bY4FdK
	YrUN6YV7cxBdU+t7FebbrSszpcRpqARs3LVy/yr3HM5Qr4ev
X-Received: by 2002:a05:6300:614a:b0:3d3:ae1f:d7f8 with SMTP id adf61e73a8af0-4014cb3ef9cmr13038966637.24.1795493818351;
        Mon, 23 Nov 2026 20:16:58 -0800 (PST)
Received: from localhost ([136.226.240.203])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cea748csm6138074a12.4.2026.11.23.20.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 20:16:57 -0800 (PST)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org,
	anup@brainfault.org,
	pawandeep.oza@oss.qualcomm.com,
	rkrcmar@qti.qualcomm.com
Cc: raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	zong.li@sifive.com,
	greentime.hu@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v6 8/9] lib: sbi: display World ID configuration at boot
Date: Tue, 24 Nov 2026 12:16:30 +0800
Message-Id: <20261124041631.1049169-9-peter.lin@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124041631.1049169-1-peter.lin@sifive.com>
References: <20261124041631.1049169-1-peter.lin@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_201659_502235_521C6F5B 
X-CRM114-Status: GOOD (  10.34  )
X-Spam-Score: -2.1 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Print per-domain Wid/Widdeleg and boot HART's M-mode
World ID (mwid/pmwid fallback).

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
Reviewed-by: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 lib/sbi/sbi_domain.c | 18 ++++++++++++++++++
 lib/sbi/sbi_init.c   | 13 +++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index be9020d0..f92ebc2f 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -10,6 +10,7 @@
 #include <sbi/riscv_asm.h>
 #include <sbi/sbi_console.h>
 #include <sbi/sbi_domain.h>
+#include <sbi/sbi_hart.h>
 #include <sbi/sbi_hartmask.h>
 #include <sbi/sbi_heap.h>
 #include <sbi/sbi_hsm.h>
@@ -613,6 +614,7 @@ void sbi_domain_dump(const struct sbi_domain *dom, const char *suffix)
 	u32 i, j, k;
 	unsigned long rstart, rend;
 	const struct sbi_domain_memregion *reg;
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 
 	sbi_printf("Domain%d Name        %s: %s\n",
 		   dom->index, suffix, dom->name);
@@ -691,6 +693,22 @@ void sbi_domain_dump(const struct sbi_domain *dom, const char *suffix)
 		break;
 	}
 
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMLWID)) {
+		sbi_printf("Domain%d Wid         %s: %u\n",
+			   dom->index, suffix, dom->wid);
+	} else {
+		sbi_printf("Domain%d Wid         %s: unsupported\n",
+			   dom->index, suffix);
+	}
+
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMWIDDELEG)) {
+		sbi_printf("Domain%d Widdeleg    %s: 0x%" PRIx64 "\n",
+			   dom->index, suffix, dom->widdeleg);
+	} else {
+		sbi_printf("Domain%d Widdeleg    %s: unsupported\n",
+			   dom->index, suffix);
+	}
+
 	sbi_printf("Domain%d SysReset    %s: %s\n",
 		   dom->index, suffix, (dom->system_reset_allowed) ? "yes" : "no");
 
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 64b8c777..16dd79d7 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -167,6 +167,7 @@ static void sbi_boot_print_hart(struct sbi_scratch *scratch, u32 hartid)
 	int xlen;
 	char str[256];
 	const struct sbi_domain *dom = sbi_domain_thishart_ptr();
+	struct sbi_hart_features *hf = sbi_hart_features_ptr(scratch);
 
 	if (scratch->options & SBI_SCRATCH_NO_BOOT_PRINTS)
 		return;
@@ -208,6 +209,18 @@ static void sbi_boot_print_hart(struct sbi_scratch *scratch, u32 hartid)
 			   (ops && ops->smrnmi_handlers_init) ?
 			   "Platform" : "Default");
 	}
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMWID)) {
+		ulong mwid = csr_read(CSR_MWID);
+
+		sbi_printf("Boot HART M-mode World ID   : %lu (%s)\n",
+			   mwid & ~MWID_LOCK,
+			   (mwid & MWID_LOCK) ? "locked" : "unlocked");
+	} else if (hf->has_pmwid) {
+		sbi_printf("Boot HART M-mode World ID   : %u (pmwid)\n",
+			   hf->pmwid);
+	} else {
+		sbi_printf("Boot HART M-mode World ID   : unsupported\n");
+	}
 }
 
 static unsigned long coldboot_done;
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
