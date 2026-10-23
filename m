Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E3C606A319
	for <opensbi@archiver.kernel.org>; Fri, 23 Oct 2026 04:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OW22KQbo;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tGVdMTyJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=7zPaqJSKrNhh/Ebbek0S6CJPKvWE1qFdUDgjBKLG6X8=; b=OW22KQboN4heYKfpB5gDSyvtFn
	8Bmdr7FO8Fa3ATZgYIh9kwgfhQrme784IvaJDPAUGlriEUuYeIzEOoyGEek3NxTrCVdQP1p/tjz27
	AJ8NGFHqYTfCJ76uSVdKOIinBo4KkGK36rmGQyrm1uW7uwX9Qo6KC90KyIha1DB++koMQGe3sdSDw
	pzDnxQDz63LJkMjldg1RuJSPSyfA+9y5O/XvFlW5JWR5quA00WfDT+MOuP76+z2rDxj48CeVQHL5V
	l5V4AXAtzGPf8Qf4I3MX4EPol24P+XEnYj2wRFUkj94euPes9eLQguncE4UM49dEnLC7sgP2Id9dX
	/M+YEVZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK73W-0000000FUZT-0LNx;
	Fri, 23 Oct 2026 04:39:02 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK73T-0000000FUZ7-3OOo
	for opensbi@lists.infradead.org;
	Fri, 23 Oct 2026 04:39:00 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-14394530ec6so655220c88.1
        for <opensbi@lists.infradead.org>; Thu, 22 Oct 2026 21:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792730339; x=1793335139; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kcuSwzwu33jYDfEwQH0p8UQA5rgkhUlop1CR8bD0nI8=;
        b=tGVdMTyJwos9SzxNQUMDYGvnxtfbvs8fcFfDGizYX7OaZgZd3zjE60Ht+LdHgAedGZ
         oD9pEmPK5EbT2e6JXKfvJ53cr8kswYjdqVs1skgFOEmIWfyUNCk8G4Obb56xRi0phQSU
         3mcVojqboZjXHsofqumxcOH0dEcKY8K8PqCX2rnYdXGe0eDvPn8Yc3jdK89fTSJOHtY7
         b7GWbPbABV2M0cPuOw4PM9Tjeo9c9tXzM6E7NtTV7bkBJetG7/YBCL+GSgDNcAK0mzfA
         WjFZPKrTTkKMAD8LqNFjV9txz+und/6+6qOgOv5g/vqy8c6IEPjQ82tooOYzhCc5xzfV
         hNVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792730339; x=1793335139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kcuSwzwu33jYDfEwQH0p8UQA5rgkhUlop1CR8bD0nI8=;
        b=rZmrQPo1VyWFkLJp+Q/3JnJKI4VfUgeynPo02vTNds8w+bl3BoXgje/bc2Q1LLA5TB
         BWsUy7vFehrUcq0Eq9/fG7lVERMz9DpA1VfWfC/L+By42K6RyGV2NVsTqqy5FRQjgd9x
         W2a1/7gcfEgxkYh2TzWkJU7vkXF8/VrRxx1RGoX8Ay4zf6w8t4wQ50Ecw5ShhuoTDibI
         OfvFTfIFZ4mumMXPLT+hySnhCJd22RbDMksc/WuE3clvZeIpjO1xQxrJOCZjwh+ImDhx
         6R/qE2LTcGPh+g19CG85DBh6fIGN6szhSeiW9xoTqi3e4qKnHlH89kel+Rw/+y+plKbU
         hbVQ==
X-Gm-Message-State: AFq9FYKMEDwFxWsjWQZ781h+tyhQFoZyDpuRKAShhbVPy+47B4AO43ht
	S8QMIgD/nVMjLnZj7T9fuh6p1JP8x2PWzDZ5paEermx/AtyHVpDQUe94lWzaSK6E
X-Gm-Gg: AYBFou3hcVj9QsLKSZYedH3kqg9SAx+z4ZXaYcRSI7SNKpp/VMslvOkoO7FTMkxVjgf
	qzDkzKwaZvIsqNgpripFQPQMiQJJSM4CPH7YglR7JzzDBRWvgrPqmpKWPDQMk/YUv7Bf+6SZW2F
	eg4O8akQWMYAoODJ7GnZHU8ZbVaHLmGwOlanDpuhxuiCLfpcbR8uw2KXsCTmKIQLCE8FjrxOJxj
	pSRc8I9KqhR8Ar7OwrNt/pq+xA3Up6kW+6+PLhYwQdnSH1uQc+x0L3UZ9pFjkCcfu0Lh0wv1Me4
	4ZY5GEGA5ZoL3cbOfZY1rFwaI98eC6JSg17DECS53oYwTUJCa+EAPMfEU9zTGGZyaQzPMDScAsI
	/uv96UyW70OcVpX+rr4AfVcM0NSc/VuZhF1A3lLblgGlXw8/DlJL2fmsiN2bg/aXfQos0oPBUS0
	eI+Hl2CR27O0xQMxdXpGpkCnwRu1maBEv4/jmuH8qaTkoGBqtPRnXglgFjmKRI4sC6CSPyMYMOW
	CW8hgLR0tEiRpOzLg1LXiVe1hCyCm4UJch8SY9JK1R4G6w2NdBhmeOea+WLc3tv47YMytAKgP9j
	rJ2pOrpIoaFH6GWQYQ6IS1zPv9gQD4lMNtsfXv+pgfhHgp42tB0dbh5DIJTarsaeRFWeSHvFlIA
	FHvQ=
X-Received: by 2002:a05:7022:607:b0:166:f097:6f12 with SMTP id a92af1059eb24-195982d5671mr2777420c88.15.1792730338797;
        Thu, 22 Oct 2026 21:38:58 -0700 (PDT)
Received: from aster-MS-7D31.tail5febd7.ts.net (209-147-138-26.nat.asu.edu. [209.147.138.26])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195e9ea29e1sm2450266c88.7.2026.10.22.21.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 21:38:58 -0700 (PDT)
From: whensun <theodoruswensanfebruanto025@gmail.com>
To: opensbi@lists.infradead.org
Cc: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
Subject: [RFC] Supervisor IMSIC state handoff across OpenSBI domains needs MSI routing coordination
Date: Thu, 22 Oct 2026 21:38:54 -0700
Message-ID: <20261023043855.159548-1-theodoruswensanfebruanto025@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_213859_890730_41991CEB 
X-CRM114-Status: UNSURE (   7.56  )
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
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>

I am following up on the missing CSR preservation work in OpenSBI issue #433.
The previously submitted AIA interrupt priority and CTR RFC patches pass targeted
A -> B -> A domain-switch tests.

I also prototyped saving and restoring the supervisor IMSIC eidelivery,
eithreshold, EIP, and EIE state in sbi_domain_context.c. The prototype passes
basic CSR and MMIO MSI preservation tests, but a deterministic test exposed a
correctness issue in the EIP restoration path:

  1. Domain A has EIP0 = 0x4 in its saved state.
  2. A test-only MSI with interrupt ID 3 arrives while restoring A.
  3. EIP0 becomes 0x8 before restoration of A's pending snapshot.
  4. Writing EIP0 = 0x4 restores A's bit 2 but drops the new bit 3.

The runtime trace was:

  IMSIC_RACE|AFTER_MSI|0x8
  IMSIC_RACE|AFTER_RESTORE|0x4

The associated regression test expected both bits (0xc), but observed 0x4.
This injection proves a destructive pending-state overwrite in the prototype;
it is not a full test of concurrent device/IOMMU timing.

A simple CSRRS/OR in place of CSRW would avoid this particular lost-pending-bit
interleaving, but it cannot establish whether the new interrupt belongs to
Domain A or Domain B. The supervisor IMSIC interrupt file is shared by the
S-mode domains on the same hart. EIDELIVERY=0 disables delivery, not MSI
recording. Correct state handoff therefore appears to require software
ownership of interrupt identities and coordination with the APLIC/IOMMU/device
MSI routing, including synchronization of straggler writes.

A safe interim behavior is to reject an attempt to switch domains sharing
an IMSIC supervisor file unless such routing coordination is available.
I have verified the guard can be added before any context-switch state is
modified. This intentionally disables that configuration; it does not
constitute a working IMSIC virtualization implementation.

Could you advise whether OpenSBI domain context switching should manage
supervisor IMSIC files at all, or whether ownership/routing and synchronization
should belong to a different layer? If OpenSBI should manage it, is there an
existing platform/irqchip interface for quiescing and rerouting incoming MSIs?

I am withholding the destructive-save/restore prototype from merge review
until there is agreement on the ownership and handoff mechanism.

Thanks,
Theodorus Wensan Februanto

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
