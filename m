Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A3C606BF07
	for <opensbi@archiver.kernel.org>; Tue, 10 Nov 2026 09:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I5C1c48q;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=Z5ouRI3f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zpU/bpfufZKddlGVmFnGI/WOqC831+uYZ7cmQ7prg7Y=; b=I5C1c48qG+JUIFnvkIsXuiHMdo
	+MpWQUL+1ZxV5eaco6+SvCZVWFKwamMrdOUN58v33UGRIWOYy1aqIdUWb+CHnAlOeH/ikKPgEgGJO
	VkIqMrOwTiigK6qPRJSEB8t2TLen2xK47YThMSI4PKfhOVKV5d6kr6/7Kb0hd7QAnK+SGPDd9bB5v
	rCZODp6I4OMyI6uIRIHfa0RNj3rKNha4KEtIbFLj43ySmZH1k/b0YXCyka+RfovaQ0Cl03zwbnd7n
	CDBiK6UlDVOUMaUcvB8n5QvqEWsgBVLtClf+HdJ512ZZLigRS9FyMsCZUiCx/y7IKuvOwkdAlqqYs
	/Hj0jq5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiV7-00000003LSL-1NQz;
	Tue, 10 Nov 2026 09:50:49 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiV4-00000003LPR-2E3B
	for opensbi@lists.infradead.org;
	Tue, 10 Nov 2026 09:50:47 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3b0b3438540so1123713a91.0
        for <opensbi@lists.infradead.org>; Tue, 10 Nov 2026 01:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1794304246; x=1794909046; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cjiabiZ8tTe11cyGbQLK5ahLCbMNUtjc1ZiN0raBHtg=;
        b=Z5ouRI3fYYff0Mxm9fZPXvBSmVLykb6Vj5atj1dUw44XpnC7O6ij63n7Bi9zlfU/y4
         p6Q41MvG7eGTV2/yLjf/wP4/axs2ZGnu6EWiFMApjrh3BPVTWiYemklPLU8k7O5UspN6
         dgUyGqfVO6QluCcIZXELaxsosoUyTxc5aH8BTU/Wh7Q0aMeoyxNJsFxmGj3RKX1fvNHJ
         fv3SJJKA/Adzvbdp985NsA9PB3I4dWjnNZl0zL0DbCUrxBSyWavnXJxedwrOM7Pt0lZd
         SZqUgssSn6u351X0Rd7wf1GO6cg+lXf6xFEuczCjMjgWwdvX8SzfvTYA3SbSXcyrUyPE
         8Sew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304246; x=1794909046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cjiabiZ8tTe11cyGbQLK5ahLCbMNUtjc1ZiN0raBHtg=;
        b=rGzYdUdo/cTnFHPmWn8Ybqjn4IiLgs0cVIvPTL9n0bQ//WD+w+4OaVXp6vFUTOnkqM
         svXIgTUOFYmmrIuJobEv2CmpwlV8VqQ3rkYZvvRy+hzEL8vSfCHEG4tBw9Yd03B305T+
         ZviYOpyoeP7FD8yMmakFj3eOYNZMn/mN8IufNYGIkI/8ZcIhQ8ujxeAot5zds6gdFQue
         rShi5Jw5W+zVuHLgZ11U2dAAzOzkGouEk4cN9z/7ezxzjQ0U1lKiWvMpatUJjzeMOxhh
         qu9sICJmI5gx/R0CB3Y2nxBvMKyUrLFIGteqDxbqtIXWEzpChOgqBkIzY94/qR58dvCJ
         //pw==
X-Gm-Message-State: APuU4Z8d9J2Huh3Ks3S0TFBd07v4rWWc1vwN9bfd43+27Wu5dx4T/7+a
	Fzgf3YqAVkqR7+xBLnd4mwjOicAbssfd46pPwQXYHdbMB/WhAuwQYZMn+oqELd4Dz6YbSnF6hAT
	FRUQJbGEAB2US+peZvnzLIFiCTqV8Vz2KX+5f7RAD127CqpMxyByS3NgNnOl4idjr6+PCtmedxo
	6NufW+5C1kJfEV5s/+yBnlSrE+nbvkCaCesxq3TO0uCot0DREc
X-Gm-Gg: AYBFou1B6CYfNzQ2voNH5/6IylcdBJvYJvWva81A6Ga1JWNRabka1TkbHMUdKrbf2MS
	1IDCVaFU2ZggKTyJTZoYpDfUNagZyQvKC2652HSD75RWwpOZaooVgOt3wzB81kNya2kaA7zqP8k
	vMJbkF5DiY8p8xxT29mfW9P74pQWlRkKyPT1tleAcSHZCpFUSSedo2zkgVQDzUkx0UXxoqeG6M1
	cC71RHUDiyW3aHFmQZo1ra9lOLT17eMj/IWI/GA4Bnk5PW/eZzUd6Ai/hZlgLzrwNAaZ6VF4EhO
	dersScx1A0RpBw0IZOtMEDRl3ZqrgYlFZwn9TotnWr54UJ0FgHieY20fnY6ElILYUa/nuuF/1oc
	vPtnRlyC963g11HNrcVv1nbdePd0NF00mrSci1BAyQJIpYu/j7BHO8CN0Rq5uT0xcX5YTCLlDAt
	WKHuIBsilwvY2/3Y3SxApKoj7Z8h5G/SadNw1CZPEnkE2SKVPkureFuPKR440EZO9KdhmI43Ikd
	unl89m4DOXsA//uILC72JBFo7pbtKCXoGxb0PdcfyDirCD2gABzjI0gVQAvLxbHlCwLsNAYRysH
	0CSvRGmE2nUQUP1xCK3NC9Jxv+Y=
X-Received: by 2002:a17:90b:3b44:b0:3ac:9259:122c with SMTP id 98e67ed59e1d1-3b166d12825mr2172273a91.40.1794304245457;
        Tue, 10 Nov 2026 01:50:45 -0800 (PST)
Received: from localhost ([136.226.240.177])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1678d1f42sm3330314a91.7.2026.11.10.01.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:50:45 -0800 (PST)
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
Subject: [PATCH v5 4/9] lib: sbi_hart: lock mwid CSR for RoT immutability
Date: Tue, 10 Nov 2026 17:50:24 +0800
Message-Id: <20261110095029.117504-5-peter.lin@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110095029.117504-1-peter.lin@sifive.com>
References: <20261110095029.117504-1-peter.lin@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_015046_578328_23CAABC7 
X-CRM114-Status: GOOD (  11.09  )
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

Lock the M-mode World ID (mwid) CSR during hart re-initialization
to enforce immutability of the WID established by the root-of-trust.

OpenSBI does not assign the WID value itself; it only sets MWID_LOCK
to freeze the value established by prior RoT stage. The MWID_LOCK bit
at XLEN-1 is sticky and makes the CSR read-only until reset, enforcing
a temporal security boundary per the RISC-V Worlds specification.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
Changes v4->v5:
- Move the MWID lock out of sbi_hart_reinit() into smwid_hart_init()
- Drop RB-tags from Oza and Anup
---
 lib/sbi/sbi_hart.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index d86abf07..a721bef4 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -469,6 +469,16 @@ static int hart_mhpm_get_allowed_bits(void)
 	return num_bits;
 }
 
+static void smwid_hart_init(struct sbi_scratch *scratch)
+{
+	/*
+	 * Assume MWID is restored by root-of-trust M-mode in previous
+	 * stage. Lock mwid so RoT-defined WID remains immutable.
+	 */
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMWID))
+		csr_set(CSR_MWID, MWID_LOCK);
+}
+
 static int smrnmi_hart_init(struct sbi_scratch *scratch)
 {
 	const struct sbi_platform *plat;
@@ -721,6 +731,8 @@ int sbi_hart_reinit(struct sbi_scratch *scratch)
 {
 	int rc;
 
+	smwid_hart_init(scratch);
+
 	rc = smrnmi_hart_init(scratch);
 	if (rc)
 		return rc;
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
