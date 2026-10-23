Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA9D606A31B
	for <opensbi@archiver.kernel.org>; Fri, 23 Oct 2026 07:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Mzzj9sRP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=koicrbJI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=nZ9YCKHGZB6fw9TAZvXWQfXHCj5aUXFYv5XzKhN72hA=; b=Mzzj9sRP2TExPs4fZuUdQBW6rC
	TvVBMn+PjOFAfcxYL3CTivJXcz8tiqmZhj4yMPy2KzMTxbQdv67ZGEIIF0q+7dLQuVlgT4T42o+Tn
	0ozgZvhOYFQnqnjjUGOiGmfxBKkWcxhm2cNdpP/qp8cTmp2hA/Oosj0wWka0CzeE43e836I/EPoMV
	cZzYguFx8SE2BeoLDiLZ0cvdj9R/IJ17CLH/BCddDScG5EDsM3K416RBA2+evERiHrcchvcYHylse
	Rk8oWqqzOx4oy73TydNoWiD0h+j9KwQy328rWR12HsG4tqj88pfhbkz74nRFvP09lv/nbEyO83cdU
	/cmqRbUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9P9-0000000FibL-4Ar7;
	Fri, 23 Oct 2026 07:09:31 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9P7-0000000Fiai-2D1j
	for opensbi@lists.infradead.org;
	Fri, 23 Oct 2026 07:09:30 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-35c76e9614aso967576eec.0
        for <opensbi@lists.infradead.org>; Fri, 23 Oct 2026 00:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792739369; x=1793344169; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bQ0lAG++kVCWUeoFMbmB6dACeI9xwS8RECOB4DUA404=;
        b=koicrbJIxSccB/qnemW0Ow2Sk+Mory8JcOb6OlMLojB4F+CCBOqgMcc3k6eoiNd+vV
         uSEGlmE/zJUqJ8bgOQ/SACipahuRlS18gXxhSHOCjUTTsXgFvOX7w8eKZJ0LsUIxk41V
         VHMNjgfUXhiAOrGYNj+k6I1yMg09VmrmRe0tjazVXkaaIpk3cABegWneA8BKWVc3lyhO
         Dv7BpXogwnKkjq0M1mt0g7fVAyfTVn/yw23/nnIkaMfA2wuy4zK1hFWLHoLQKfkgkKao
         5HeekrTiHcdGIM/aveDvVCyND2akq5fs8bdVNJmchNw88CnG9p7zpZRBKBzfsDIlJz8M
         m1zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792739369; x=1793344169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bQ0lAG++kVCWUeoFMbmB6dACeI9xwS8RECOB4DUA404=;
        b=1muyL/Rl+B5xW31QDRS5Wj4G1g7HLjSHcjHJuUpN6n7wT+g+IflJVZUF1puC5AWTob
         TpQ483cvLUSQwEynTa9bK1f1di5wUGlmWq+hQJxQYG5dZaHmh5qbXnztnvsjHyWXfPAZ
         G4zmN6wdB17Mb2OLQ3WMgVVkI2jG2sMgXc5nOwyLmY/kbKlSrK8JoPfcbHLwKyzz5aEG
         1sYMdS6cE2y5QV2IfBB36Mo7RLP/AhiB9KcxAUGXnnynYLBlbiJTZsrDhkPWFJOsjo7Q
         Mcp3KR853pQUIxsvNbn5CLAJfZqqMgM7q7fNI4u24PrSKOblcyBO+ISYVLqTSu/rDiLP
         28sw==
X-Gm-Message-State: AFq9FYLPGpf2BU0PKa7j+T5QWgST/oB8xAJ278d4nd1WvImhdXJtBhbX
	coUhidJPxUu4psW79i3YZG9HZtuiu5M7S5XkiANdDKTC261unefvSwSE3KDNde/d
X-Gm-Gg: AYBFou0JRMeYrkQmO2I/igWNb5A3H+HvPkjQd7JMGiWB6BeFgOdb2lU/L/T7zDlgoIZ
	diMCbIB0xSvqsefif4f0OzyYL2BR7N5Ox6l84erItQeNgEZW59lk8yalCoOGf/H6qf0pKDmX0YF
	wovwfAygfZtR5m/Wo0M7U9StIMRJI0TcGAY8UC93mrDu/vVwW2E608miCvMB4Ear6ilzi38NC7O
	zh/KTOsfBaHSFlELwU4F2IAzfIrDCF/GvKYXtFZqUX/SiCs0CgZogwsEoo2GSsRT7q9ICUzgjb2
	NZjzXNsvv8lm3Q926li1oFfubhmV4qlRxYcG0pggaGo84O88pna7UwOIlbahc1MTp8CiAhNNlBL
	xjrowTy1cTF80DBsrdDsAUaIswSJAdHHouEOfV/yag5b4CoyrgxK1BNyH6a6AtOqpII2gWDGng/
	K+kgSYhHcvEKaxXTmjI8INpkVDha2FrY/wj3GeuwxynAiP9IEmY+G4bmhqmZ01RLgHviHwvc+qa
	EfqzLPWd0T0Ss61uYumeFbP8tExpz2tE6C+kMqu3hV2s97upY0rOi0cU0ROuMtPuMICt+XtbIaR
	ZjbFRtvzH5ff4HSFaz26gaaq8tZdOtKeaVDDm2aVTGsgqNXDc1VGkNOjxmE=
X-Received: by 2002:a05:7300:ea0e:b0:368:2548:c07b with SMTP id 5a478bee46e88-369d97c64e5mr1855069eec.13.1792739368539;
        Fri, 23 Oct 2026 00:09:28 -0700 (PDT)
Received: from aster-MS-7D31.tail5febd7.ts.net (209-147-138-26.nat.asu.edu. [209.147.138.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9e10da4sm3863206eec.26.2026.10.23.00.09.27
        for <opensbi@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:09:27 -0700 (PDT)
From: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
To: opensbi@lists.infradead.org
Subject: [RFC PATCH v2 0/8] Preserve more architectural state across domain switches
Date: Fri, 23 Oct 2026 00:09:17 -0700
Message-ID: <20261023070925.241680-1-theodoruswensanfebruanto025@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_000929_567099_68B8D470 
X-CRM114-Status: UNSURE (   4.95  )
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This RFC series extends OpenSBI domain context switching to preserve
additional hypervisor, virtual supervisor, supervisor timer,
counter configuration, AIA priority, CTR, and vector state.

Changes since v1:
- Group hypervisor and VS state in hart_context_hext.
- Fold HCOUNTEREN and HTIMEDELTA preservation into the core patch.
- Group STIMECMP and VSTIMECMP in hart_context_sstc.
- Move Sstc after H-extension state preservation.
- Detect CTR capacity in sbi_hart.c and store it in hart features.
- Include vector VL and VTYPE preservation.

Link: https://github.com/riscv-software-src/opensbi/issues/433
Link: https://github.com/riscv-software-src/opensbi/issues/434

Theodorus Wensan Februanto (8):
  lib: sbi: Preserve hypervisor state across domain switches
  lib: sbi: Preserve optional H-extension state across domain switches
  lib: sbi: Preserve Sstc timer state across domain switches
  lib: sbi: Preserve supervisor count inhibit configuration
  lib: sbi: Preserve the supervisor indirect CSR selector
  lib: sbi: Preserve supervisor AIA interrupt priorities
  lib: sbi: Preserve supervisor CTR records across domain switches
  lib: sbi: Preserve vl and vtype during domain switches

 include/sbi/riscv_encoding.h |   2 +
 include/sbi/sbi_hart.h       |   2 +
 include/sbi/sbi_vector.h     |   2 +
 lib/sbi/sbi_domain_context.c | 239 +++++++++++++++++++++++++++++++++++
 lib/sbi/sbi_hart.c           |  11 ++
 lib/sbi/sbi_vector.c         |  11 ++
 6 files changed, 267 insertions(+)

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
