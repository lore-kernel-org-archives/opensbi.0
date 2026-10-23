Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA02606A319
	for <opensbi@archiver.kernel.org>; Fri, 23 Oct 2026 03:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KTr+59v+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=chTwhLHB;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HL9LVQ7k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=E9cjnysCxj0pAXn6nM94EW/RX+3B9/bgMuGPbFP7gCk=; b=KTr+59v+/fwflGKTyMDrnOKpBK
	2dLCqqvjkSzxH6MkGgZx1slYas0PfdhuCrJ6KLLWgKdiVYi+b50oiNVlkQq3yjOdQrbQb2AHWpe0C
	S2/MgwPIl5jeuh9oMaA4wtGp4b0yC2KzF+CH/NB6utwfCoijas4E1MB/sIl5f+qWTheQZ0Vu9GYkv
	mdqfZ2N2PbJ9h+1baO0GVPMvU84BNqTGDEpriyZJdHJOgqq9qXj41XvmHrUO+S/xIR0x/YZhGTySV
	HV7wksZ8fZ1OtFo0t1ASzX7zC6R8jjHBznnu5/sRs39FlJbT4/2o47HO/1P0Nbj5NBjssKY5byo+d
	rC+z0l3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK67O-0000000FQuT-0gPa;
	Fri, 23 Oct 2026 03:38:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK67M-0000000FQt6-3EMs
	for opensbi@bombadil.infradead.org;
	Fri, 23 Oct 2026 03:38:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=mKyS4R99EYK0BUrcIQ9wA622zbROCwz7+X8nyNQbBfw=; b=chTwhLHBW6iuFQ51cL1APOVJaU
	RktrJ5cgeBSrhCgd87t6ILGuIX+ae2+0YHOTYdgjwxn9l3G55aDUIEvsrvI9rIEMVR0Zp5ApQ0mNx
	H3r9T1qlRj1mQkYomZnLdHQk2yv9ZIpXuWnG9PaM73DKJQEfw8XKOxk8iaWjfWgAkuRMO2JbEvrSB
	arsOIBUQNPQDZvH6bOfoXPLi1NTbcZji9fedFIu5s8hczkHyXIKjTlkT2Wr37xM29hMfl2LfZcbAQ
	qVQn3lcCRw1Vfca657LmCmyDxSVFi7JrRueByZ8zLD1T7IitmtlbvRV1EIbPbu8Hb/iih4JfYkzi0
	S+lBJvEw==;
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK67I-00000008emX-0REd
	for opensbi@lists.infradead.org;
	Fri, 23 Oct 2026 03:38:55 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-35b2c599f43so1081992eec.0
        for <opensbi@lists.infradead.org>; Thu, 22 Oct 2026 20:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792726730; x=1793331530; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mKyS4R99EYK0BUrcIQ9wA622zbROCwz7+X8nyNQbBfw=;
        b=HL9LVQ7kGI3ftb3te8A5P2+DDk/gsDBdqdolE8yCEUziMV9f8ezXC1GC/Q4HGgGqag
         qui9+IyAv5d31ZYLl6eea9dwNfHXjduPHz1UWe6NOytyvgYkMZPyMX2yyGQwzz7KaWbn
         zT4viRHHw5w81efM8eooH9HUFcVacjSSad/s5V5vCNurBvs7UGSBjHlHFB1yC3dflegs
         JfeWjKw+xNpnPtPWnCYlyxVoSsECORSIuB5VWSyEwBTf3Dv4IABfjo61kMMf80GTIRIN
         vCGYq49VD2uSNU30njXX6o/rsyij2d6z4BTa8P/nqXcBVDdQEYGSFmNLXg6TDHXIts7Y
         mzhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792726730; x=1793331530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mKyS4R99EYK0BUrcIQ9wA622zbROCwz7+X8nyNQbBfw=;
        b=Sk/4JzKThxvrEU5PoxaLCDSZKA7xNSiNaIXkuT1HUzOD3JeqxXNnIBI1h44P8uyd12
         gkj2IZoFnXloYizrSkqfrvN3QMMJ4cjDghDewqy+IH0yb7mCE/w6f4MRwnibmaoToHmy
         3G9niXBulBLGnerh7kU9yaD1RLlRfHYsoXYoPXNlXaCSCQbaMVF9BZkhYVDur7hwwIfA
         S1Z5YQflqXYSWFIYVtRIMm33gnXt6MsKzo21x/4O4ks3uZDqXeQgVil+7RGh+ISELtQE
         2G/NhvyT+c1L5vf4MaqsaeI9lyrD7u0uRJGAjFl975t8wOfQKoZIzdO2RiIgbG2TXNIi
         R/MA==
X-Gm-Message-State: AFq9FYI2s6zau/7/S+lHruqrrO6svGKpbCeSOxPzQNs/jshs2yctdatn
	uuSnNvyQRmYeGOzK6GRJy1eYRHiIf2FfWYIonka1nMmZciacdzlHr5i0ghhPQ+PU
X-Gm-Gg: AYBFou3L+HYxsRNbVqhVLJmoPwakDzmj8ON7yOBHcBfh83hIIiI0y4My3slBqnhi2qg
	ilY0nN77H3V4AhGL97X1AS0t/jSv1hECegcBSgzIhcpdl1KK2jAQddRLgQ2+ix6llfMLcil7S2C
	34OM2NwLEm+q6NV+5ubgy+YUMiL4wSjaZhsg3YSEWamwX56J60bA+oM5PfOIs/DL3+9Hk1RaYrL
	hLIrZdXAvyOf7nUGPBW4+nBXTSDs+Mg/Muy27i5+5U5aU0f4FLhdK7jauGCXPy5UuFWbqkmGfdv
	1TQNacmCOembFUciOfnWh3js28FgFkQLDrrTlRSRew0jwDXxpZriivrSyW69NggqNWgJT2k3PWv
	sv40PbrGre3NkXlZONdWp1NPDWLpHc+LChCavmE9yJWIUmRl4Ii0LkclQw7bMOjefYQFAXx38sD
	ZD4rmxtweOv+jFuI26RSFHV2lkVDQ1HCZSuSn0CkjUGYgJE9qUk5Q5e5CEwZeeYmEfNSNBPPchh
	MZe6p2BLpXNArilSr4LOklekDP9lDoBhDPRmyq6pDB7KE1FEB/2YvM6/iKFWqa7vU2lDLNNpjbo
	EefQ4jtwZMPkb2JA9td8yZYW6MwfxofhCcyPvmQIMkC5BFKfoi8L8fpMRg==
X-Received: by 2002:a05:693c:6391:10b0:369:d6ed:f2b5 with SMTP id 5a478bee46e88-369d985c947mr1333045eec.39.1792726729614;
        Thu, 22 Oct 2026 20:38:49 -0700 (PDT)
Received: from aster-MS-7D31.tail5febd7.ts.net (209-147-138-26.nat.asu.edu. [209.147.138.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9c15883sm2746414eec.3.2026.10.22.20.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 20:38:49 -0700 (PDT)
From: whensun <theodoruswensanfebruanto025@gmail.com>
To: opensbi@lists.infradead.org
Cc: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
Subject: [RFC PATCH 1/2] lib: sbi: Preserve supervisor AIA interrupt priorities
Date: Thu, 22 Oct 2026 20:38:44 -0700
Message-ID: <20261023033845.89152-2-theodoruswensanfebruanto025@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023033845.89152-1-theodoruswensanfebruanto025@gmail.com>
References: <20261023033845.89152-1-theodoruswensanfebruanto025@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_043853_693808_B2325231 
X-CRM114-Status: GOOD (  13.80  )
X-Spam-Score: 0.1 (/)
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>

The siselect/sireg window exposes supervisor interrupt priority state
at selector values 0x30 through 0x3f.  Save and restore the implemented
bank across domain switches when Smaia is available.

Only sireg is accessed in this selector range.  The other sireg windows
can trap and must not be read.  IMSIC indirect registers at 0x70-0xff
are not handled in this change.

Link: https://github.com/riscv-software-src/opensbi/issues/433
Signed-off-by: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
---
 lib/sbi/sbi_domain_context.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index 15e9f543..14927ff5 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -75,6 +75,8 @@ struct hart_context {
 	unsigned long scountinhibit;
 	/** Supervisor indirect CSR selector */
 	unsigned long siselect;
+	/** AIA supervisor interrupt priority register bank */
+	unsigned long siprio[16];
 
 	/** Float context state */
 	struct sbi_fp_context fp_ctx;
@@ -120,6 +122,26 @@ static void hart_context_set(struct sbi_domain *dom, u32 hartindex,
 	hart_context_get(sbi_domain_thishart_ptr(),			\
 			 current_hartindex())
 
+static void hart_aia_iprio_save(struct hart_context *ctx)
+{
+	unsigned int i;
+
+	for (i = 0; i < 16; i += __riscv_xlen / 32) {
+		csr_write(CSR_SISELECT, 0x30 + i);
+		ctx->siprio[i] = csr_read(CSR_SIREG);
+	}
+}
+
+static void hart_aia_iprio_restore(const struct hart_context *ctx)
+{
+	unsigned int i;
+
+	for (i = 0; i < 16; i += __riscv_xlen / 32) {
+		csr_write(CSR_SISELECT, 0x30 + i);
+		csr_write(CSR_SIREG, ctx->siprio[i]);
+	}
+}
+
 /**
  * Switches the HART context from the current domain to the target domain.
  * This includes changing domain assignments and reconfiguring PMP, as well
@@ -209,8 +231,14 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 	    (csr_read64(CSR_MENVCFG) & ENVCFG_CDE))
 		ctx->scountinhibit = csr_swap(CSR_SCOUNTINHIBIT,
 						 dom_ctx->scountinhibit);
-	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCSRIND))
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCSRIND) ||
+	    sbi_hart_has_extension(scratch, SBI_HART_EXT_SMAIA))
 		ctx->siselect = csr_swap(CSR_SISELECT, dom_ctx->siselect);
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMAIA)) {
+		hart_aia_iprio_save(ctx);
+		hart_aia_iprio_restore(dom_ctx);
+		csr_write(CSR_SISELECT, dom_ctx->siselect);
+	}
 
 	/* Eager context switch for float */
 	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_F) ||
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
