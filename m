Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F000A606BF19
	for <opensbi@archiver.kernel.org>; Tue, 10 Nov 2026 09:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gLXuumTR;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=cdKbmZdR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VG8uAEFfu4GPscJmOLSubXl1fx6maOvN7YEU71d/B7o=; b=gLXuumTRszda0EUGuaUpVJSu2r
	0x9UAHx+Unc/RM/srAg2go42gL/0FEdR0SKfuxgWDcd5XAdi8ZsShl5+pyLjDL4g/hqmETpnzmO3n
	cVBhckiHfkQrNgvRrtjEb7H5m1i7Otk5Ra+pfUn1QGHyPZ38/kWYMhznZj0G2AJ3/wqvmsvzVHctW
	UUiCc3YiOSrbxu4ZOG4B3JlQlmwefTFb3tlnGk6mSRtUQjEn7cJ+F6ak1s4NYMv4D4kQSMmQAZeKo
	Y77kwTpScJDXK4HWyQUTZgIuRiDy2t7mhTsnPxr+Myf13vNL31J8/kVKDDjPxyhn/2tHrKWltSGMi
	k0oCNFHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiUy-00000003LM5-4BIh;
	Tue, 10 Nov 2026 09:50:40 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiUw-00000003LL4-39en
	for opensbi@lists.infradead.org;
	Tue, 10 Nov 2026 09:50:39 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-cd69954c755so1250816a12.3
        for <opensbi@lists.infradead.org>; Tue, 10 Nov 2026 01:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1794304238; x=1794909038; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=je/UrNZBIK0ugMoDbfdWj1nBhkt7aiDsQyURBDsE1q4=;
        b=cdKbmZdRKPSd1Q75uq/Hn8EojiVGUiTCk3kkPR3wuOeX6P1SsJ4mbcYZtxqixM+VG1
         ioqYU1cFWrms58skGk/2RO5r7rBkSyHZuiT/PDcwdPY1Z6V4+qz/OSRW5rvvgMgX3foA
         NM/mG0K1WlMiPLLKXiDXkmzwXo1WsgFESvnGE+VAoXZGMF0IwuhwQj60/IEnt/gjYS84
         AG7blBrnB6jPr/TvbJFOkXRmiYe3bV+jkzXNwBTi17ZOy7alICtJscwt6HdkW/0ePDtU
         V4/Z8wYJBdjJTswbcSxpaeaas+mq5oFr3NYb6wnaUSdNOdzDVNDa5q8P2cBiUBH1yh+P
         46Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304238; x=1794909038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=je/UrNZBIK0ugMoDbfdWj1nBhkt7aiDsQyURBDsE1q4=;
        b=m0emL+eNlgZfhZ4hbsGrnfVoxuaeAKxWaPVKOMDF9a440tBNj+up2XNW8Y368expLj
         AyFGrOHe55wU06XtHO2riSgT9SAR0cqCbBFhO8VezEgCVwZbcVGyJo+JK0zWl2elNMYQ
         bI+bPYYcCK6U/IjxPi7sD/a12G+v91BF/k4KhnOlqy4Gu9Q/FrFzyFQIIaLn1T2qn225
         j7gzJ2P4FZUbxs7sUgOjXrOoX/sY1dv7uSP7Caus1aFD/UUTXT4egyVcMsL1Up6u0jJi
         wWWZfwijG1utBqzWVx14RdOU4g5FTh7eEosPiT6F5GzvP73VuakUM4D2y7h8nWrU2F6T
         d+oA==
X-Gm-Message-State: APuU4Z8lIZyLuNCuyEJUDxrc7S/f4mwjts+/ojjhlwj1SO3N2h39HIpG
	bCk3Rtc7He3/NiBr6KQ7Ld7AQwRAXUev3bjAjf/N8Rt6f2v/5j9OAtp7nkJcd0HgDOEg9fsqFgo
	VQjuqSh5XLaNFKy93QtyQC9cc4vQ75naghJMWDvs1wBkuVJjKxfeP5ZCn/+5JpNGhLRbxHKjttd
	11FQRcXL+3cmMkzDRrWGzyKZ+Pmkvy7DLnocMiJr2pXRyMAXK3AL4=
X-Gm-Gg: AYBFou1VsFnJGMRa/E4QKuI5g3d3ncrz54optDzl60m7gkzj6ugYgHbDdf0ab/JXfEC
	tPs/1FlhW68erikDZ3Ze9RCoekuQ3DKv3DQaiQpTSXm/R8vuXm7xq4xJJ5EUbvAIONb3qyqdfRv
	ZDTX+8fhf3yiJ71DkgGnR93dkDlEXagUyMyv3rcbJVNE8YLMbTQ4hUgDK2PFndmw6yKAzMhwykr
	vEduC0iPz4vEOx67vML6COfd+KCZYkK/mxEHsDw+iCtUFKg7bUtz7WgCNXbbOUFvk5UOeRddU56
	JnNadWPjeYz8yJ6yy7zjgXOsZoLEN3yd+TwOgyovgvxrIRoiCtkx8TuNdmQW9utoY0Pz88vJ2Te
	/v1OVCFT2YzAkodozURkYcW9cPz22jfvZAAB+fH3oIo71A7EPaFDAn9Dg5stzAotjqhPCsMzDKG
	DrQR+Cwv2fuoN9ukNdCTbvDR2n+Z1YjtlvvPM+1Nbkl3Ag4DkWD8ZmOTouq6rMrP2Rg8zw5Gbk4
	nU/BCwzL1vgdnWjdF7WVHXlL3cZqHCdicPwgNeSGHLO6xhxsKLI///jhkbduJ4wmkZxjPlOjzlf
	mfKdjvbLbKBZjLP1+Snxd0kHosibMRjqMV8ate+bsQcgVB0m
X-Received: by 2002:a17:90b:1f8f:b0:3b0:9691:a240 with SMTP id 98e67ed59e1d1-3b166fbbe59mr2223918a91.47.1794304237694;
        Tue, 10 Nov 2026 01:50:37 -0800 (PST)
Received: from localhost ([136.226.240.177])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1672d9160sm3522170a91.0.2026.11.10.01.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:50:37 -0800 (PST)
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
Subject: [PATCH v5 1/9] lib: sbi_hart: add RISC-V Worlds ISA extensions
Date: Tue, 10 Nov 2026 17:50:21 +0800
Message-Id: <20261110095029.117504-2-peter.lin@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110095029.117504-1-peter.lin@sifive.com>
References: <20261110095029.117504-1-peter.lin@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_015038_811222_1160ED60 
X-CRM114-Status: UNSURE (   9.25  )
X-CRM114-Notice: Please train this message.
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

Add CSR definitions for RISC-V Worlds (mwid, mlwid, mlwidlist,
mwiddeleg, slwid).

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
Changes v4->v5:
- No change
---
 include/sbi/riscv_encoding.h | 12 ++++++++++++
 include/sbi/sbi_hart.h       | 10 ++++++++++
 lib/sbi/sbi_hart.c           |  5 +++++
 3 files changed, 27 insertions(+)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index ffe7666c..e0262bfc 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -400,6 +400,9 @@
 /* Supervisor Resource Management Configuration CSRs */
 #define CSR_SRMCFG			0x181
 
+/* Supervisor lower-privilege mode World ID CSR (Sswid) */
+#define CSR_SLWID			0x190
+
 /* Machine-Level Control transfer records CSRs */
 #define CSR_MCTRCTL                     0x34e
 
@@ -520,6 +523,15 @@
 #define CSR_MTINST			0x34a
 #define CSR_MTVAL2			0x34b
 
+/* Machine World ID CSRs (Smwid, Smlwid, Smlwidlist, Smwiddeleg) */
+#define CSR_MLWID			0x390
+#define CSR_MWID			0x749
+#define CSR_MWIDDELEG			0x748
+#define CSR_MLWIDLIST			0x74A
+
+/* mwid lock bit */
+#define MWID_LOCK			(_UL(1) << (__riscv_xlen - 1))
+
 /* Machine Memory Protection */
 #define CSR_PMPCFG0			0x3a0
 #define CSR_PMPCFG1			0x3a1
diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index a020cf03..ed344783 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -97,6 +97,16 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_F,
 	/** Hart has D extension */
 	SBI_HART_EXT_D,
+	/** Hart has Smwid extension */
+	SBI_HART_EXT_SMWID,
+	/** Hart has Smlwid extension */
+	SBI_HART_EXT_SMLWID,
+	/** Hart has Smlwidlist extension */
+	SBI_HART_EXT_SMLWIDLIST,
+	/** Hart has Smwiddeleg extension */
+	SBI_HART_EXT_SMWIDDELEG,
+	/** Hart has Sswid extension */
+	SBI_HART_EXT_SSWID,
 
 	/** Maximum index of Hart extension */
 	SBI_HART_EXT_MAX,
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index d1f5500d..d86abf07 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -355,6 +355,11 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
 	__SBI_HART_EXT_DATA(v, SBI_HART_EXT_V),
 	__SBI_HART_EXT_DATA(f, SBI_HART_EXT_F),
 	__SBI_HART_EXT_DATA(d, SBI_HART_EXT_D),
+	__SBI_HART_EXT_DATA(smwid, SBI_HART_EXT_SMWID),
+	__SBI_HART_EXT_DATA(smlwid, SBI_HART_EXT_SMLWID),
+	__SBI_HART_EXT_DATA(smlwidlist, SBI_HART_EXT_SMLWIDLIST),
+	__SBI_HART_EXT_DATA(smwiddeleg, SBI_HART_EXT_SMWIDDELEG),
+	__SBI_HART_EXT_DATA(sswid, SBI_HART_EXT_SSWID),
 };
 
 _Static_assert(SBI_HART_EXT_MAX == array_size(sbi_hart_ext),
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
