Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE0FAC61DBD
	for <opensbi@archiver.kernel.org>; Fri, 28 Aug 2026 06:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=22tUmR+/szcJcqc+24fFxDTtKk3nU/wqFZdh6poEgU8=; b=h6e4+KqoULj5Wa
	KNVRKdn55vbYk+JlcTo8TQnW7ABY83eQWhdxytTeZiM15VIy/AjcA4zUgmsVz64mno3lE+J/tiMSk
	FXaotriyDK1FBQJUTkeD8TT2fdH4lfFtqeViVL5uQGaS4EzjUt/mZXk4voPoy8Mm96D+niLsnPtw+
	TJKJjTVQb+hFSu9ydV+/oIATR9F3c6eDRC7paf1CcfjlWhBgK70HUQlse9MSBp9fNcgAw1/veQIXn
	3mE7wt6PxUCI/zXb/sh2m0xNHCcSpqsfTyJ3Dc7ZAs+Dzb7GpAfzRLGFffEhz0Vd5M5t2Jwt92Zvv
	eaRJSnehAdkFJtYT0zkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzpmW-00000005BQG-1Inh;
	Fri, 28 Aug 2026 06:09:40 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzpmT-00000005BPM-3Hqe
	for opensbi@lists.infradead.org;
	Fri, 28 Aug 2026 06:09:39 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2d7200b2e15so7437105ad.3
        for <opensbi@lists.infradead.org>; Thu, 27 Aug 2026 23:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1787897377; x=1788502177; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XLOAIA/ALK2N24S3DbM0+X80X6fyZweeVKn8xjFLrRs=;
        b=SXzlpZ6iqhQZCMRK9IfyG5zpiFdi7wD4p/DlzE2mDpB08bTiOLMH/26jolUbHUE9Jl
         wbEv0kyAvv+1CFoFSpj+RvkSWU/3oXQOXiNCvH4Gfqvf7IyyG2H41Gz2s2RYnqUDdbPB
         2/ZELDnj7W6d7HD3CupnSPpeN8tSLbTGzz1h+pFjbtUTnIXBNsfnlcfCzwMbSO9v1Lt8
         nN/cu3JF/os4B1zO3tfq2zZJmgWhLeSsBY0SJs0PT5NIgjr1ZzKk77uh5tcA3tdK9xey
         aXPwYwM1OklcfrpP142R5k1lD5m3CUL0eDo1v3dMlZo79dzZm8dSsrZ+Sxdsnyxp0eYA
         f3HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787897377; x=1788502177;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XLOAIA/ALK2N24S3DbM0+X80X6fyZweeVKn8xjFLrRs=;
        b=gd5EBYWF+3lPan4z6Rb/EM3A9R6PD94x1N0sRoC7+Q1Oa7vX/u1EG9WGpFMIgXoZ5H
         D0cqPv/J/s9D5mLaU0RbH6o0auWaSCRjKUF1shAdgPBK/o406weHiG9PglEzEtEVdMTu
         9qXOBsYYqg725PzAfucpggGdKH33OzOBbJROc4hOEZvRz+PkZSjkJ7LRQ7ylxAQS4EQT
         rtOftlmYPDyYLB7J8zGfn0bu8KaXDsDz5qe1VwaukRrv18v23vz3uMu51HpZ32ZR77px
         BU6TlYaRzK2YscdWq+C622PmounHcmrlVS4/uts94Qu8UnmQzRbFBRb0sX+9eSqLicuE
         rsOQ==
X-Gm-Message-State: AFuF++nLQuCqkSqDY0aQQX52Z4ulUiGNEe+Dx13WJ1DN22+dVt4pIMj9
	lNcee5mW9uSjaObXs1MAx6Y0EMWJJ5soDoARCVLO/vPPX26zQTkJUeGjr0P1E5h0pmqkVaFqO/j
	bizryTYpN1f6FhShGQvxuWeBrdageO6GO7RxhogVtX5W+8XWCHtqPI0lT68vZEw/HrqNCxbTWAe
	dpTQZjISNBhJ7nr2g3vQbk1yP3q9B1z4e+TNFnqhM2wFa1o04=
X-Gm-Gg: AR+sD11b4MjcZI1GOem16lZkCp4UL66PUzdB7L/PufxGDVvxlaPSLPgxKVR/lF50OJT
	S9KLZD39+RTd4j/jjw3lNYghpZWPp/zCtYjH0I99NiHlWrm6QjV6OBxcKWjdXEwGqMG7bia06rF
	SdtMmRlpJTuyRYkYO+bDI92DImhFD9Kfg1YoUJrQqEgRByh+RM881+xRWRY90Mhcwde+k1Babb7
	Jd+QkyVRGJMtp8z1c1ssfAhOZ41Ft5+V3Fk3mSnKM1QeU4iz+uTkp2oM5LmvrtBb42GqobXEyMW
	S4h59VEimeUAIhW+cAWTkhFpStDLlnlYdTgqFV3S5KmWqj3WHA+BHJwDYTyyG0UMduHYz38CVCh
	gmvH753BDnONKqbV1PTJ6Hf6YP0iDvT+Gwy0tavqYSpUwW7Io/TFEX6QzMtIxuux1jJZRjOhAWQ
	SnRp88C/zp13mCsGJxvs8z3XeqCt13UFsz4rOsZ/kRBWAVlAnkGZADW2Oy0fGbnc8v/OcJ9bM=
X-Received: by 2002:a17:903:13c7:b0:2cc:f5aa:9513 with SMTP id d9443c01a7336-2d74dee93acmr5925635ad.10.1787897376533;
        Thu, 27 Aug 2026 23:09:36 -0700 (PDT)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f95a847sm1995864eec.17.2026.08.27.23.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 23:09:36 -0700 (PDT)
From: Nia Su <nia.su@sifive.com>
Date: Thu, 27 Aug 2026 23:09:32 -0700
Subject: [PATCH 2/2] lib: sbi: Fix stale prev_context in RNMI handler
MIME-Version: 1.0
Message-Id: <20260827-rnmi-trap-fixes-v1-2-df371cf92301@sifive.com>
References: <20260827-rnmi-trap-fixes-v1-0-df371cf92301@sifive.com>
In-Reply-To: <20260827-rnmi-trap-fixes-v1-0-df371cf92301@sifive.com>
To: opensbi@lists.infradead.org
Cc: Nia Su <nia.su@sifive.com>, Nick Hu <nick.hu@sifive.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3010; i=nia.su@sifive.com;
 h=from:subject:message-id; bh=Mo/43u74GjoCcJRmdRRONaIUpogHYxGcN+YTKsNu6bU=;
 b=owEBbQKS/ZANAwAIAYihNJa3+YfgAcsmYgBqkSYeEWu3syfQs3TnWzyPTtt6PTjKoab0rBkAH
 hp0nZfJcq2JAjMEAAEIAB0WIQThGl/T4FqBBU9NhIeIoTSWt/mH4AUCapEmHgAKCRCIoTSWt/mH
 4CQID/92UZSCLndIIdA+W7GwFbzNroq0vwhclyywIClatPtE4oqeOoxixv2ZeaSEM9SKwWf0VlG
 Ip6vtXzFLmP+M3jiQ2erOUcajZMQiX3gGUQad5+XotSQDSLA9RtBOw8kTIdcuzHV+6RtbyVIGt+
 LdPBqk1hftDETm1Bq/nY30xznonTP8UKS8MG1v2J9B2pcfQeXQDTx6GESKR1ePpHMAO1798bio8
 K1dnF81zjA3A09hr1FSXONMZKAZKXIUlWxGUngpWyfP1CPusOf9RndqI+3R1zrl5RWVpJ3tv8mX
 cCudSBXm1eU4Bx8Ih1I+w8jJZjrra/5+UvwEPzKnDNquSgCLLCAsxX6WoIpK8eNW2yjDmNt2Hql
 PWNk09xLICKhYvymiKpqQ3pCEGa5g85qsFSWoPf5qPJys0QW6E2fSWg9yj51X85c8if9c3Iu63O
 Avynth7/d4ZY1evjKTKY3nwtkgLEqAxeC0LC7dZ+2r0jGmoo7A+XromNVlh2BAr9ewAmWbJvdVD
 1wikG/qQ4Jod9rZGPPZc4dUdNHvFk802rwRLNOGXSibwGrGj9vnYppyHsqhZPtPNB6r7V/2ammJ
 ittszosHEzy4rllEQLACuUYbJj8Lskcynh+IC9XWae1FLUpAYvgWTaKZabFlI8nabROL5A1A4QU
 TF3ut78As9WRqHg==
X-Developer-Key: i=nia.su@sifive.com; a=openpgp;
 fpr=55235C875092ACC578EFCE6CD1699E646B29B1AF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_230937_828859_1661F4F2 
X-CRM114-Status: GOOD (  14.46  )
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

Before an RNMI is taken, an earlier SBI trap may have already used
the same slot on the M-mode exception stack to save its trap context.
When the RNMI later comes in, it reuses that same stack slot for its
own trap context, but sbi_trap_rnmi_handler() never links prev_context
to the previously active trap context, so it still holds the value
left there by that earlier trap context.

sbi_trap_error() then walks this chain with
`for (tc = tcntx; tc; tc = tc->prev_context) depth++;` to count the
depth before printing anything. If this stale prev_context happens
to point back to tcntx itself, the loop never terminates, hanging
the hart before any diagnostics are even printed.

Update sbi_trap_rnmi_handler() so that sbi_scratch points to the
new trap context on entry, and points back to the previous context
on exit, the same way sbi_trap_handler() does. This serves two
purposes: it makes tcntx->prev_context always point to the correct
previous trap context (or NULL when there isn't one) instead of
stale data, fixing the hang described above; and it lets an
exception taken while already inside RNMI handling correctly chain
back to the RNMI's trap context, instead of the RNMI context being
silently dropped from the chain and never printed. Together, these
let sbi_trap_error() print every nested trap context in the chain,
including the RNMI's own state.

Fixes: 8cdb5b1023df ("firmware: Add RNMI handler infrastructure")
Suggested-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nia Su <nia.su@sifive.com>
---
 lib/sbi/sbi_trap.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
index 16774fd2f73059c1268bfb9f43fdf8e9c460c0b6..e694188c25b7b1715df660206af0a501290389fc 100644
--- a/lib/sbi/sbi_trap.c
+++ b/lib/sbi/sbi_trap.c
@@ -394,9 +394,14 @@ trap_done:
 struct sbi_trap_context *sbi_trap_rnmi_handler(struct sbi_trap_context *tcntx)
 {
 	int rc;
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 	const struct sbi_platform *plat = sbi_platform_thishart_ptr();
 	const struct sbi_platform_operations *ops = sbi_platform_ops(plat);
 
+	/* Update trap context pointer so nested traps chain correctly */
+	tcntx->prev_context = sbi_trap_get_context(scratch);
+	sbi_trap_set_context(scratch, tcntx);
+
 	/* Call platform-specific NMI handler if registered */
 	if (ops && ops->rnmi_handler) {
 		rc = ops->rnmi_handler(tcntx);
@@ -404,14 +409,15 @@ struct sbi_trap_context *sbi_trap_rnmi_handler(struct sbi_trap_context *tcntx)
 			/* Platform handler failed to handle NMI */
 			sbi_trap_error("platform NMI handler failed", rc, tcntx);
 		}
-		return tcntx;
+		goto done;
 	}
 
 	/* No platform handler - treat as unhandled NMI */
 	sbi_trap_error("unhandled NMI (no platform rnmi_handler)",
 		       SBI_ENOTSUPP, tcntx);
 
-	/* Never returns */
+done:
+	sbi_trap_set_context(scratch, tcntx->prev_context);
 	return tcntx;
 }
 

-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
