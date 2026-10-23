Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9678B606A31A
	for <opensbi@archiver.kernel.org>; Fri, 23 Oct 2026 02:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=joO9JV9Q;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cLgAchzs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gjDrvA1zZWtTjd5gQQDAPInwj7JKryuksozYIGCZ4Xc=; b=joO9JV9QgUbCsubrKEp0+7xLK0
	5VmcNoP9740LPF84hQhn4QdzO+vATvsO090hBqcL42zlVx/RsfXP9f57hc3l6MyvEs2HFpxX+uout
	imZ4h3ISachwNx+2SkKjPDGvTNGp9eO58Kor1+0UIxdeTgPeQMa9WcleR4QzT7JHh+YDEgaFUPMVs
	y2F/pbjeWIDZcfPFH6vFbI8YGduDaxChgdlZ11jwDvwdcZQEZMJBcZllTRlg1tpod7NYI3ZqfXuLl
	keJQeKs3pHENCmgglNhXR9NIxqRpI3ojvKmLrddzQBfrjIfJVSKTPNA0O4Tnu/3T4py1AKGHq16vP
	bflMCczA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5GC-0000000FL2P-204A;
	Fri, 23 Oct 2026 02:44:00 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5GA-0000000FL0P-09pb
	for opensbi@lists.infradead.org;
	Fri, 23 Oct 2026 02:43:59 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-14394530ec6so557889c88.1
        for <opensbi@lists.infradead.org>; Thu, 22 Oct 2026 19:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792723437; x=1793328237; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=35im5kftI7eO97WZwxxV+514yGMgvPQBWmjfRs5kEdk=;
        b=cLgAchzsEJElDR0eTAjFxO20WcV6zY0Z7Rvbhm7rpdpQ1J7nX8agUicr4M3HfO2C2Z
         Q16VL01F8ZEsRYR1u9aJdeGlNTeXy1XymdQIMdUvEq01TT13/lhXiSUiH24hlnQReMHl
         E2LjuvgzAYOoJKZD7ro72FA8qxDZkD+L3WU4YCBD4K6FACzrpx3b4V7PeW99BTIR01ab
         laZcO6K1Lo3gl65oUNr0vVPWeIKHej8k1a0T0MhCum2etxjuGZ1EFEBAJXFl+sBiiXmI
         8YjKe7eJPwHt61seSzgU5U/EttE2l0r08fjBucHSnc8QtfytkC1ScngxoWlIi5k8vI0D
         s+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792723437; x=1793328237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=35im5kftI7eO97WZwxxV+514yGMgvPQBWmjfRs5kEdk=;
        b=bI6kvL/qCUo2i8G1mA+JyxbqpXKArV4bjblB1p8dfMGYfEZRPUzHnPMv5Mf+qq4zH0
         KlwVQT4G+AIj62YU2LBBfER4CPuhpzqOIHi0YdRI7ZqZHt1RFyNee0Rb0kUe9kwGSn+b
         4SoLGrRUsfdng6rpCY59tHL0mGrmh7ifUdJp7bgxWMl5wJEvbhfTLnrapK9la2mSZuji
         Xlhi1oh/jOkywj+PAXt6js7Wh3QqYzBrVDDJkWACZPckWRSg8kYGdB6ppg6cNp9LZ4Q7
         opEcOtrinZ84IDYLmDnGJteE+icoPb+n7vgPmYxpoSvieAxBMLPvyco14it5a9o+IBAb
         6UKA==
X-Gm-Message-State: AFq9FYIWXZ15VbNaqLYbUl6Cw/j/Qbqo7bDAejYQFFkmvkkRllX5iW4d
	oM8lU84v4pznr3kt5pH2Jquygs9E0QXVK+ruBKDa+HjY+VXaSeDISZwiOCNnpljQ
X-Gm-Gg: AYBFou0+4UOubb5gtkO9j2j5SCUProuPJ1ssV02uyTOGCdTe/7bBEoOovTb66tFomqN
	/xpngSlGM3brtkjodX98fbTbn66Szns6R+VLmx0Vd6i4l0PIK6OjBHaTnQJqwRzDnWjsxO3nRF/
	556Q0QJs/h/NaAskd4PbtWuTjRz7b+zT3FX2i6p4t+j7vl8s6+fRO5lc0/ZBuiBDremf+Pg0Vh3
	MLKvUn6F2Jz2g+fvxZpKjZSmJP+ftt7RLIbpaLXuPNhNi0nudmo7x5hQQkMVrxsG9ND73Fm98/E
	TaLDSBHS/Qx1Zi7VmwcG+UWgE4HmivkWnrYVlbKDOXBLWd12p+lKU3iNTrmdt/PIsa8Lt/iqmM5
	zF1uMPzS0kRLf1Nb1dDerGISwuZ+Ga9nIfAIl0ww+1narz5LzAaN7jEyeNikl6JsdQNfis1uxV6
	UumPyg7QEn3QljtRrLyUQ0ouDlXjPK/sRB8+EL60h98rmjM5dVeGYj5RsbOunlhgDj+caaXa+fQ
	nB0p7YII0/RCJNHO3NtjWvV/YFwPt3f5K7B0vUrWseaMh9w+4KxWpw7AVsQYoJvILURhDLeFrTp
	foq1ilzapfGyqWzTZmS/8bUdppsRoA441QAK5PmMW84kGH4IEo60qUmRUQ==
X-Received: by 2002:a05:701b:418a:10b0:144:fdf0:9d91 with SMTP id a92af1059eb24-19598c75581mr1659364c88.24.1792723436911;
        Thu, 22 Oct 2026 19:43:56 -0700 (PDT)
Received: from aster-MS-7D31.tail5febd7.ts.net (209-147-138-26.nat.asu.edu. [209.147.138.26])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195eb6c3fb2sm2877233c88.13.2026.10.22.19.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 19:43:56 -0700 (PDT)
From: whensun <theodoruswensanfebruanto025@gmail.com>
To: opensbi@lists.infradead.org
Cc: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
Subject: [RFC PATCH 3/5] lib: sbi: Save optional H-extension context
Date: Thu, 22 Oct 2026 19:43:43 -0700
Message-ID: <20261023024345.16779-4-theodoruswensanfebruanto025@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023024345.16779-1-theodoruswensanfebruanto025@gmail.com>
References: <20261023024345.16779-1-theodoruswensanfebruanto025@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_194358_082304_57D3ADD1 
X-CRM114-Status: UNSURE (   9.07  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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

Preserve hypervisor interrupt enable state provided by Smaia and
hypervisor state-enable CSRs provided by Smstateen.

Use extension checks so systems without these CSRs are unaffected.
The 64-bit helper preserves the corresponding high-half CSRs on RV32.

Link: https://github.com/riscv-software-src/opensbi/issues/433
Signed-off-by: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
---
 lib/sbi/sbi_domain_context.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index caec5486..32ff365b 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -56,6 +56,9 @@ struct hart_context {
 	unsigned long htinst;
 	unsigned long hvip;
 	unsigned long hgatp;
+	/** Optional hypervisor state */
+	u64 hvien;
+	u64 hstateen[4];
 #if __riscv_xlen == 32
 	unsigned long hidelegh;
 	unsigned long hviph;
@@ -176,6 +179,19 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 			ctx->hviph = csr_swap(CSR_HVIPH, dom_ctx->hviph);
 		}
 #endif
+		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMAIA))
+			ctx->hvien = csr_swap64(CSR_HVIEN, dom_ctx->hvien);
+
+		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMSTATEEN)) {
+			ctx->hstateen[0] = csr_swap64(CSR_HSTATEEN0,
+						dom_ctx->hstateen[0]);
+			ctx->hstateen[1] = csr_swap64(CSR_HSTATEEN1,
+						dom_ctx->hstateen[1]);
+			ctx->hstateen[2] = csr_swap64(CSR_HSTATEEN2,
+						dom_ctx->hstateen[2]);
+			ctx->hstateen[3] = csr_swap64(CSR_HSTATEEN3,
+						dom_ctx->hstateen[3]);
+		}
 	}
 	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_10)
 		ctx->scounteren = csr_swap(CSR_SCOUNTEREN, dom_ctx->scounteren);
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
