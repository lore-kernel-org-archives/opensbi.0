Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E52E606A32C
	for <opensbi@archiver.kernel.org>; Thu,  5 Nov 2026 04:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wQKw6T40;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ENtTfeFm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=utUXktqjIa2HbBSy69iimRl1iwiOMeWHc21H7bLthuk=; b=wQKw6T40sR4fDLkPz5mZmRnDhS
	1JjpG/qanIeJ/KPkotZusKV+OfIjRU6/Sx9ls4b5Myx3Wa0wQVHlbEpu6cCJlvOys4hD6CFpiiLam
	6hDaPgu8GYMUV2HXabmgp9oW9GY+lumni75fjpeXNReG/8I9d7MvXxh7njhcBzOXUGRf6Y9rjM+pd
	AXIl/tBHbaarFmwXtj1h+bYZ0N4eJ02m6ni5TKYcbdmucizJ77Mn11MTfYsAAGamWB2jjBI7HeSEz
	29zxglgkusCuLDIIvkHxP+ISfka4eJtKkbDXuSKpf7qTL+VDfslYnQ4HCER30EkiwuV8kNfoSPoPn
	rRXaaugA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpKH-00000007nxu-2dLR;
	Thu, 05 Nov 2026 04:43:49 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpKD-00000007nxB-2v0m
	for opensbi@lists.infradead.org;
	Thu, 05 Nov 2026 04:43:47 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so2765779eec.1
        for <opensbi@lists.infradead.org>; Wed, 04 Nov 2026 20:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793853824; x=1794458624; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zcy6vG7q2qB+60Z48Wqfd3y/fC5UTf/N8E0oz0trdRY=;
        b=ENtTfeFmDi+5MuWsngdBbtviWb7THPnt9jj9B03zB+uIpmaBetUXGdtUKnKpLFVsSi
         ny6LnlX48d79xaRhza53HqJfFgtsFoPDsga1nDLTFWwkc3QszoVWXADVsdXchtKtNyoh
         +Nn+gNwthIcKFU4rS89xE8bCgK9hSoB5MPxnTCwrt0c1D97e7gbFtufuWY+y+Dup4HBE
         s2/DvbBF0afzC4ZIXoM3k5ycDOMfkRtdagnuxXJ25sZuYbSsHjela33HfxzTQgdQI0Bx
         rFvY0wRQ5iGo5GGEwqK3tVuk9lQBjjWoTOXo28WghdVYtdtONUBCMOAZ38eIKYaVxKSH
         Kfkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793853824; x=1794458624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zcy6vG7q2qB+60Z48Wqfd3y/fC5UTf/N8E0oz0trdRY=;
        b=qj4I+/xGRPOY1q2prIbl4+k9KeeT9SrhpBmQYAD+gVJ35YY9RYJqdZlp99iejwCPkd
         mnd0HrWzxltQo+cxBxDn8+XFz7puf8yrHu+WFZsWsAlV8YSdJokBeyE/L+0XA4RmRDtc
         mVrX4v9TfTIxO0YpcOKnbv8bvMvvIitf1qxOtFgwN3bh9Sm2aJeptfJ91mjy1uG2hA1P
         OliMGOQCDYkizRuvFIvxL7Nkn0+hB1mkgpQxQ/h0xeNku1yx+o2alGMA2Pgx6xi71GUP
         e98ajbAONJxBK5Y066QmuRwatxtnLOghfqYAP2HtKTLGaW7BAFla7JgHuFk2qRs+IrhH
         vNPw==
X-Gm-Message-State: APuU4Z+xPptyXI00IBm4KlMCo0jipcblUuu8VQ1zdg4S/C2gVmAo5+x1
	qn+uQ/wYdKX2rqeJOPocqVL9nmFuxvTHF+OIFwjJtPdTvDnum6YOGIK6iOwPzDJ2
X-Gm-Gg: AYBFou1VoYnAHpRY/Igskt9Pz87KIVSVISpSn4Mfq+a92Hs5lbjTjfcc/yJZJNAXy54
	AZ1HGbEm/xbXEVW4UV1JcRV0RTPpkNCKluUeeiydRF45T5oPR2C0sRI282Xd+Jec57gX8Zs2KuA
	m23bRhDXgF/Cq/hUTWONX8ASMNgGO1JlPgY1ukMWPE9zjjwNrm0+JGcQSchKEo16migdTM9eDDK
	NveIIFF4QQvoMd/Kbml+4LUKUUeow2M29UhIy5bC6wA8JshNAbD8AQx/2H5uCE1GW5HRy3YFIug
	6Zy06GTf3uh3DpYh2fOZwkYzXwgWhtVqUQJLzGMzTg44yO67YMQII/WbMjHLPL9tYIUnckV/Gzh
	Yv2b8qBC+MAFojiLiPg3fQ3j1QJ7HyMkUGHs7VmuJYXOBRWS+GQWLFGcQWvSYps9+kLxE+kAEvB
	vG0pes5CdDFPpZtkoyEcgBWJ/8+wBCWkLCfBwG3nhjrDkKGNBO+ecvktExDZ+OyDJUfdG7HxJNv
	lhAWpM03F+McBmnHQ3GWK2Exsv+frBaUTlWNKE0E9ir8vjZCcxjoVJz7qzSerpOLMwhGn1k6JGg
	RjjQwXgWLvnROlP9CejYUjgFIp+m+i4JkTCTAdAVRqMdj3Q2967QHArxwyOH/yPBpNbp52JsYkN
	wnWN5LS6wrUrj7773lPJ18QbxLxmI+mtl
X-Received: by 2002:a05:693c:65d2:b0:36a:1f4f:3e9 with SMTP id 5a478bee46e88-36a4238badfmr26544087eec.20.1793853824215;
        Wed, 04 Nov 2026 20:43:44 -0800 (PST)
Received: from aster-MS-7D31.tail5febd7.ts.net (209-147-138-26.nat.asu.edu. [209.147.138.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6160sm11547657eec.9.2026.11.04.20.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 20:43:43 -0800 (PST)
From: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	rkrcmar@qti.qualcomm.com
Subject: [RFC PATCH v3 0/6] Preserve more architectural state across domain switches
Date: Wed,  4 Nov 2026 21:43:33 -0700
Message-ID: <20261105044339.435711-1-theodoruswensanfebruanto025@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023070925.241680-1-theodoruswensanfebruanto025@gmail.com>
References: <20261023070925.241680-1-theodoruswensanfebruanto025@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_204345_735627_BCA7FAA0 
X-CRM114-Status: UNSURE (   9.51  )
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
additional architectural state, including hypervisor, virtual supervisor,
supervisor timer, counter configuration, indirect CSR selector,
control transfer recording, and vector state.

Changes since v2:
- Combine the hypervisor and optional H-extension patches.
- Save outgoing VS state before switching H-extension interrupt state,
  then restore incoming VS state afterward.
- Include RV32 vsieh/vsiph and the optional hvien, hvictl,
  hviprio1, and hviprio2 registers.
- Preserve siselect when Sscsrind or Smaia is available.
  Also preserve vsiselect when H is implemented under this condition.
- Remove the supervisor AIA interrupt priority patch pending
  further discussion of per-domain AIA ownership and access control.
- Grow CTR buffers when the active depth exceeds the allocated
  capacity, avoiding silent loss of CTR records.
- Fix the RV32 build warning in the CTR implementation.
- Rebase onto OpenSBI master at 332798211e7232da60158b0545b23c61b5338516.
  The upstream FP state-enable fix is already included in this base.

Testing:
- OpenSBI generic platform builds: PASS on RV64 and RV32.
- QEMU RV64 with H, F, D, V, Smaia, and Ssaia enabled.
- 16 H/VS CSR test cases passed:
  - 7 single-context CSR access and value checks.
  - 9 A -> B -> A domain context-switch checks.
  - Covers hcounteren, hvictl, hvien, hviprio1/2,
    and interactions involving hideleg, hie, hvip,
    vsie, and vsip.
- 2 additional A -> B -> A test cases passed:
  - siselect preservation.
  - vsiselect preservation.
- Total H/VS and selector results: 18 PASS, 0 FAIL.

CTR testing:
- QEMU RV64 with Smctr, Ssctr, Smcsrind, and Sscsrind enabled.
- Verified support for 256 CTR entries through sctrdepth.
- Reproduced loss of CTR entry 16 with the initial buffer
  allocation based on the boot-time depth.
- Added dynamic buffer growth based on the active CTR depth.
- A 37 KiB firmware heap was insufficient for the tested
  256-entry CTR configuration and resulted in SBI_ENOMEM.
- With a 96 KiB firmware heap, CTR entry 16 was successfully
  preserved across an A -> B -> A domain switch.
- QEMU completed the CTR reproduction successfully.

Limitations:
- RV32 runtime behavior has not been tested.
- CTR runtime testing covers selected behavior, not all CTR state.
- Sstc, supervisor count inhibit, and vector preservation
  have not been tested separately.
- CTR heap requirements depend on the number of domains and harts.
- Per-domain AIA ownership and IMSIC state switching are not
  implemented by this series.

AIA scope:
This series preserves selected H/VS interrupt CSRs and indirect CSR
selectors. It does not implement per-domain AIA ownership, IMSIC state
switching, or access restrictions for domains sharing a hart.

Preserving the indirect CSR selectors does not preserve the
indirectly selected register banks.

I would appreciate feedback on whether the remaining Smaia-related
CSR preservation should stay in this series while the per-domain
AIA ownership design remains open.

Link: https://github.com/riscv-software-src/opensbi/issues/433
Link: https://github.com/riscv-software-src/opensbi/issues/434

Theodorus Wensan Februanto (6):
  lib: sbi: Preserve hypervisor and VS state across domain switches
  lib: sbi: Preserve Sstc timer state across domain switches
  lib: sbi: Preserve supervisor count inhibit configuration
  lib: sbi: Preserve S/VS indirect CSR selectors
  lib: sbi: Preserve supervisor CTR records across domain switches
  lib: sbi: Preserve vl and vtype during domain switches

 include/sbi/riscv_encoding.h |   2 +
 include/sbi/sbi_hart.h       |   2 +
 include/sbi/sbi_vector.h     |   2 +
 lib/sbi/sbi_domain_context.c | 291 +++++++++++++++++++++++++++++++++++
 lib/sbi/sbi_hart.c           |  11 ++
 lib/sbi/sbi_vector.c         |  11 ++
 6 files changed, 319 insertions(+)

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
