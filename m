Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7C9606A31E
	for <opensbi@archiver.kernel.org>; Tue, 24 Nov 2026 04:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XT8/JCGl;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=ashzqT/v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HlCGgRyiRSA445SsRmLVZF7T970l0kCBPbxfvkmVuYk=; b=XT8/JCGlreOy1jvmVD/gggZBhJ
	qsgUaBt3hASWC2pWEn5lfuX8gh2cdoyvE7ULoOPnuBveMCmMy8weEYexwyd2F3qlThGWiHNj6KHLa
	X64YmgdwJYajASd5FyUDh686o6H0AZryBBYXmf/Sp9LphkYdIzhHc5yHtvU7IvcKf5uh7GahRA9Jx
	Jke3ynznOTzBsALYdLc9+sxd7fhBYI/JcO2GmT4kT1WxiyUOkLT505oO+ER07rKsD/AGbULYVORFa
	zkqmKBGPLmnt4ovdjhXdlVmXNVbnhFtR6WyeyjdzFSebrl5w9NaUsApC15Wmc0wUVN+kxoBQn/Ynj
	0OOfQfYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhxX-00000005VVf-1AUB;
	Tue, 24 Nov 2026 04:16:47 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhxU-00000005VUR-1kMx
	for opensbi@lists.infradead.org;
	Tue, 24 Nov 2026 04:16:46 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2f037bc348dso32830445ad.0
        for <opensbi@lists.infradead.org>; Mon, 23 Nov 2026 20:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1795493803; x=1796098603; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ugfAVYzsvZGcxIsL3NbxngoAZK+lR5CMZrKe9/C2wWM=;
        b=ashzqT/vjnlkj3BQGi1jLXsYkPzj+VJesZo7pfkT6VUa7LsYhch24aPq+TegHdiun6
         QtEJ98bOJUsvhhkn4txw237wTaHAHsqRQtT9ApHcYnJKgTbSCYh1XzubVa6VKorPEKqS
         zFUDQ6EAWnDkj5s9jtZOsguNvTVkfnmsuFAmkgN4Fibvt9WCARy3zFyZLiufkvhogmfI
         gWHQmz9T/I64ABJKwqxm80+Vg72URR4gyq6Y9tszner/v+zhOaxV59B0l0AXE+eWZDex
         xNb/FEC7H8AoBfX15mZ2r2UnQBu9q9roAaTo2uY/1eQ9zeZXNx6YdnZT8FMhfdL3Go9f
         oXuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795493803; x=1796098603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ugfAVYzsvZGcxIsL3NbxngoAZK+lR5CMZrKe9/C2wWM=;
        b=wyW4LOQEw48MWQ3uXmmVwus67+/KxtD6njI1Zez8m8z6msuAsF+zg/kB5YY8HWDvPK
         5n5m1Q/88UOo/2Z8ZkJhJHxj1+N45v9Gf9efGjEMJSqxB71DSy7Wkm7xwxbXjk4QOZe5
         AptvGSHWhDCWdHPtuPOi1UQhzNfrbLTjQsU+lx2ebU3zshAGD+WmOJVdqnhvRDi9UGiX
         3Oqb745O1VJZ4nDDoTSydsjynKmIya7Z2+xZesJ8elOMVhTx40vRa+uKTor2LrsY0UPK
         Zugqw/Qw5eMqRg3EMaUeI+42pK92YYcSRdGbWc1lMc1cS+MBn01k+NkkxdpfE4AAZsPK
         xYbw==
X-Gm-Message-State: APuU4Z9CMBDt64VJ+L5F+7EMlj0Sl2oMua1WbsvHBUCTd5m0UuoG6tog
	CBQPQi2sea+3jewt5TGfbWQPvoA70ajD4GAqdp+hfaYxW+X8z8ojY76q6OTG5obWOC0+/ZauuYJ
	N0YKeuU8VEl7xk/9pOhzbYgs3l1fjAr5x3I5oWu1On4tRmsyj6OYO5V+7YClicR1jhe6Hyic6Xc
	lB0R9+5DGldaTpm5HA4sw3qmUI34l6CZUIXeYKV4ZqqfnaFKQeK2E=
X-Gm-Gg: AZFdTZcvCHnRWX/57HhPjkX0TgmvRY/bveW8T0koZzDTJ+/zUqIo8TKGg9YOSQh5xOQ
	hWjdwAx2dShnVkIelZ/GkjBk67HhnKW3FXcai9aVhWfvTMAW2ayLLexwhQmWuvd3ntR8FKzvtYH
	pGeRV4T+Vij4lpA7f2Ph5vx+xl1Ott3C5T/4uw9YB1h4+F4HJjouW/KGU9DBk17qPebQhRbUmGE
	cWl2y/x6pFOHJQcNHRO/ToC/KwmPNEUdRUZne1sFOrqPWUu6CE+FuJ2g9M2Y5inXocHEigyaGik
	9aL+KmQ51D8u3G5VKTqIgE8MYgvNyXqQqBJGiZrMOIPp6zq9Oh+Svh6HtDzUicHmuCNzxjYczRY
	AVEk39B4HnI8sUSOJgFwNKp/BTITBl2+DlpPyOn0sx6x4dUdwJCK/H1zoYzrP8Q35Iqp6DVwxPh
	or1WQzmFW+fa18SpLd9GQ0Sejx3u+LEEmiymCNFxtK7V6eZ+7UkOL5B/nbSxbJGOJQhjFGay3Pf
	pqEX6wRPQAoflW1Kdz2c4NhYN4USv4FtA1jMXAQaBA3uKnEY6z+NjJqtbW+H9i3E4paeeIuj+Uc
	pbNNEJl/oK3MBA8w2dPBJ0qtLXdPjY8uK0aDlqCpR1D+knNz
X-Received: by 2002:a17:902:ce0b:b0:2ef:e59b:f56f with SMTP id d9443c01a7336-2f03f270e50mr124956035ad.51.1795493803336;
        Mon, 23 Nov 2026 20:16:43 -0800 (PST)
Received: from localhost ([136.226.240.203])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0dc13fsm62470115ad.29.2026.11.23.20.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 20:16:42 -0800 (PST)
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
Subject: [PATCH v6 2/9] lib: utils: fdt_helper: parse RISC-V Worlds per-hart WID properties
Date: Tue, 24 Nov 2026 12:16:24 +0800
Message-Id: <20261124041631.1049169-3-peter.lin@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124041631.1049169-1-peter.lin@sifive.com>
References: <20261124041631.1049169-1-peter.lin@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_201644_463796_F04B0095 
X-CRM114-Status: GOOD (  12.65  )
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

Extend fdt_parse_isa_extensions_all_harts() to also parse the
platform-defined RISC-V Worlds DT properties in /cpus/cpu@X:
- riscv,pmwid: M-mode World ID
- riscv,pmwidlist: bitmap of permitted M-mode WIDs
- riscv,pmlwidlist: bitmap of permitted lower-privilege WIDs
and store the parsed values in struct sbi_hart_features.

These platform-defined values serve as the root-of-trust constraints
for per-domain WID assignment during domain creation and context
switching.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
---
 include/sbi/sbi_hart.h     |  5 +++
 lib/utils/fdt/fdt_helper.c | 69 ++++++++++++++++++++++++++++++++++----
 2 files changed, 67 insertions(+), 7 deletions(-)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index ed344783..629e3f64 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -138,6 +138,11 @@ struct sbi_hart_features {
 	unsigned int mhpm_mask;
 	unsigned int mhpm_bits;
 	unsigned long expected_trap;
+	u32 pmwid;
+	u64 pmwidlist;
+	u64 pmlwidlist;
+	bool has_pmwid;
+	bool has_pmlwidlist;
 };
 
 extern unsigned long hart_features_offset;
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index 747ba028..fdd25648 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -442,16 +442,71 @@ int fdt_parse_isa_extensions_all_harts(const void *fdt)
 		if (val && len > 0) {
 			fdt_parse_isa_extensions_one_hart((const char *)val,
 							  hfeatures->extensions, len);
-			continue;
+		} else {
+			val = fdt_getprop(fdt, cpu_offset, "riscv,isa", &len);
+			if (!val || len <= 0)
+				return SBI_ENOENT;
+
+			err = fdt_parse_isa_one_hart((const char *)val,
+						     hfeatures->extensions);
+			if (err)
+				return err;
 		}
 
-		val = fdt_getprop(fdt, cpu_offset, "riscv,isa", &len);
-		if (!val || len <= 0)
-			return SBI_ENOENT;
+		val = fdt_getprop(fdt, cpu_offset, "riscv,pmwid", &len);
+		if (val && len == sizeof(fdt32_t)) {
+			hfeatures->pmwid = fdt32_to_cpu(*val);
+			hfeatures->has_pmwid = true;
+		}
 
-		err = fdt_parse_isa_one_hart((const char *)val, hfeatures->extensions);
-		if (err)
-			return err;
+		val = fdt_getprop(fdt, cpu_offset, "riscv,pmwidlist", &len);
+		if (val && len == 2 * sizeof(fdt32_t)) {
+			hfeatures->pmwidlist = ((u64)fdt32_to_cpu(val[0]) << 32) |
+						fdt32_to_cpu(val[1]);
+			if (!hfeatures->pmwidlist) {
+				sbi_printf("%s: hart%u riscv,pmwidlist is empty\n",
+					   __func__, hartid);
+				return SBI_EINVAL;
+			}
+		}
+
+		val = fdt_getprop(fdt, cpu_offset, "riscv,pmlwidlist", &len);
+		if (val && len == 2 * sizeof(fdt32_t)) {
+			hfeatures->pmlwidlist = ((u64)fdt32_to_cpu(val[0]) << 32) |
+						 fdt32_to_cpu(val[1]);
+			hfeatures->has_pmlwidlist = true;
+		}
+
+		/* Sanity checks */
+#if __riscv_xlen == 32
+		if (hfeatures->pmwidlist &&
+		    (hfeatures->pmwidlist >> 32)) {
+			sbi_printf("%s: hart%u riscv,pmwidlist has bits beyond XLEN\n",
+				   __func__, hartid);
+			return SBI_EINVAL;
+		}
+
+		if (hfeatures->has_pmlwidlist &&
+		    (hfeatures->pmlwidlist >> 32)) {
+			sbi_printf("%s: hart%u riscv,pmlwidlist has bits beyond XLEN\n",
+				   __func__, hartid);
+			return SBI_EINVAL;
+		}
+#endif
+
+		if (hfeatures->has_pmwid &&
+		    hfeatures->pmwid >= __riscv_xlen) {
+			sbi_printf("%s: hart%u riscv,pmwid (%u) exceeds max WID\n",
+				   __func__, hartid, hfeatures->pmwid);
+			return SBI_EINVAL;
+		}
+
+		if (hfeatures->pmwidlist && hfeatures->has_pmwid &&
+		    !(hfeatures->pmwidlist & BIT_ULL(hfeatures->pmwid))) {
+			sbi_printf("%s: hart%u riscv,pmwid (%u) not in pmwidlist\n",
+				   __func__, hartid, hfeatures->pmwid);
+			return SBI_EINVAL;
+		}
 	}
 
 	return 0;
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
