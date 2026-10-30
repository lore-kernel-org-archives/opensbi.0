Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB8160A2600
	for <opensbi@archiver.kernel.org>; Fri, 30 Oct 2026 10:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Rl/Ud5Ig;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=TISgIuMA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nVe53covkwrsmNjVpnNu5NUqrq9pSCw0U2uyhVqIp6I=; b=Rl/Ud5IgLDIxO9NVypzo6I+asy
	7w8ecsfCiPHr0JYxhXjvGoByYmVjEgrnpognU6zoBPvnscEQuyNi+66feBlcwlPCon/Tfog79T7EC
	PD+IwsupjXn1Htpqk6dJ7Q3gkNSZUz2+QIH2Q1g6N/Vz6Sy+h2bWiAYEmVUSuTYSy3mXuIKn8PmN4
	LygSu83xWehsNLYZIE3zikcYR1QBJuvV7wSSZuyETzaUQf+vW9yuXuNpxdF30u3LCC1KUVU+Gn8oK
	NZG/Wc308PfpjwReNDAumh8i7sIn9C6KPOWXDA2KwKwLpWPLUfR8efLEOoaY+yRC5NO/rxC3a3UFf
	rgEAqrXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMk75-0000000BQcu-2Fpf;
	Fri, 30 Oct 2026 10:45:35 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMk73-0000000BQbi-0tAH
	for opensbi@lists.infradead.org;
	Fri, 30 Oct 2026 10:45:34 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-cd5cd8d89a7so190703a12.1
        for <opensbi@lists.infradead.org>; Fri, 30 Oct 2026 03:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1793357132; x=1793961932; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/aqIkBDpVtxXheXBij7swu/4/NpXPSnTFx0i8PwH8Mk=;
        b=TISgIuMA2ExcS83KGgWrLQsbx/fTFaXiLPePhpoHPzOKeolyWKy3ewQgSQsGKT3ij/
         JLLW7YiGLJWwZ3whRlN9z33Ib3qYUmgSLDJDTkV5/0H5QLDBEB04Ce75NKwUpPpnOj+L
         sH+Kye8AC1hmhnnEbIpNf9DpplI0WXhu8b+f7V1UYu3k2UWNi7X7BFMFx49JfpPP5DRE
         YBia3VXr6Jgzfrw5v/wgdsQ86nghs4MMm4GNXcz2JfhyjlmU9NED/D7Ebr1ACTtSx271
         yi1lfYQ0ulp5Hrcin5Auc+ZNtfpmJ9oBrTsfQCGfj38yK3EfgLNmAOdh0M4j9vLay+mC
         ZGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793357132; x=1793961932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/aqIkBDpVtxXheXBij7swu/4/NpXPSnTFx0i8PwH8Mk=;
        b=Mf9gRkSuMw927bchyS80cXkaajsWePdFb589EMZvNJOep31yyCapUeRgBdmmxWBMYT
         P1LONaymG462QHDuD3RPnibEprx9AOfWBClnePBEjk4+r0OMfHdyNUh08AeqnE7qxOYC
         h1NB0DTAoT3Wo7w62exlRni4lT3I5K946vrhfLaGjBWqOW8+y1pvycaqeO1gZ8nPHwOm
         mOHDCL9YNG58XWjJtNviD5ck7LdB84DhOttPQr2VrF7od3Scp7FMau/RzwRbnaKPwqLZ
         SwDJA7zjgKI0R2juSp3G9YFVEJfILa2KJUPd/zaL8II0EiXGEoC4/3LI22Osj4rFXCbg
         AKaQ==
X-Gm-Message-State: AFq9FYID4CUYCcovLNytc2wUrcYd2fWPPaud4fsQqLu6Kv+3o1gAljXa
	bgUxjfFWFoF+gb5oRSq6OMR3bKp7cEQtLjTrr4VW6YnyA+iryrddkKS/PC0uSJVkBlUPLYXC+Sp
	BGtFBkUyNDkARu7lZzesSYz8Z54u3cEhBSUfrwiUpTJdr5VuIvcib0eG0NBwEf9TtRoLuw296iP
	PrUpRIWADfKrLt1KErn/+JTrFla4w8vz+6ZEj1yfQaf3VWm3fBuYo=
X-Gm-Gg: AYBFou2T/x8TbhMtEK84p7GOUnYIyGONHwyOZ/5XlYi0CZg+jAISm+npJnuRTy4v8TP
	lasShBVaF/6aiQO8gts3wPA8CuIuOf+ULwBZNzn6RTAXMrIAoyw/T+1IuaGYRFbwOf/jdGu1gpQ
	siOjkFHj+wwyEpBRRKgybFgqOXODjvAQC3JPoreqltRmA3GTr5TUlRhSq17+riDPoNhf8WhcyP5
	sbYso9GuWAshIPc6bZUNXhP91v+KMj/7yQJyd3Mc20FvCM510BgV6U8Zy+aDQYuQU7gMTOijCpg
	xhgpgnq4rCC77jUv7H+DYOjPxMq+5+VhelbhCH4varj6NfPrhQIION0F6d8L8cbrP4BwQkZu6jx
	ZpbOVn/rcDy5oT0FRKlFqIZzSPi9ZHULWSSZ3sCFKb4MjU2iM55US5VMIiGnQrae/EbDLuqW0wL
	C7wI1PLPSb0fuux+qi4gOFRgHb/NGvQLzKOXuUBdDSxGnaVjTGEUX15WvDGdHmBsByhNL72MnE6
	iRXl5fYSIioQ8cvEnw4z/WHlP0HCGdBaBSxULoaLMxoFYHEg+n3CDqMFpvFlYgUmPqIaTS98+AK
	kRN7LBOKFYr+Zyxae63lY9uAjNUOH/zdTXKtx/uQ40/juOiv
X-Received: by 2002:a17:90b:17c1:b0:3a6:fc30:ce16 with SMTP id 98e67ed59e1d1-3ae897dc114mr1218274a91.51.1793357131613;
        Fri, 30 Oct 2026 03:45:31 -0700 (PDT)
Received: from localhost ([136.226.240.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7d429fsm8096849a91.2.2026.10.30.03.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:45:30 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	pawandeep.oza@oss.qualcomm.com,
	rkrcmar@qti.qualcomm.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	zong.li@sifive.com,
	greentime.hu@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v4 2/9] lib: utils: fdt_helper: parse RISC-V Worlds per-hart WID properties
Date: Fri, 30 Oct 2026 18:45:11 +0800
Message-Id: <20261030104518.3297875-3-peter.lin@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030104518.3297875-1-peter.lin@sifive.com>
References: <20261030104518.3297875-1-peter.lin@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_034533_259216_E845D6B2 
X-CRM114-Status: GOOD (  13.16  )
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
---
Change v3->v4:
- Parse Worlds properties in fdt_parse_isa_extensions_all_harts()
  instead of a separate fdt_parse_worlds_all_harts() (Anup).
- Drop RB-tag from Oza
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
