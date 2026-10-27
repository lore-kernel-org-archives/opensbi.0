Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7EE606A320
	for <opensbi@archiver.kernel.org>; Tue, 27 Oct 2026 10:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tuNQrU93;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=K4RLi8im
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=hKd9RBr6CRj7uLfREfaDKyg1hMTWNvypNr9Dq47QDtM=; b=tuNQrU93ZMk1eViWTh9kcYx3eS
	/psaShoPxv3xHZZ5gp7wiFA5DZynPhkHaz1xYpN+wDzOPvWOqXImqc9qvaOR0iHGmdgE2sjNOModN
	+2/U7CHWkpFM2TIIdiqic8WZwrLwYB1IxCJMElNJr7t6977T9cvotluXMZsCA2gz3aUSsNxLeNCA3
	kOCuCbBcVcKc4jhc9fODGS6OAXs/UHCeU3JuDd54cKuWwAzrrZoW8IJ/k0sxAySyOU/Q/4ZYCWggE
	731kT5ltYLK7N7j86KxQc3RZlX+uSmygKEh9N0dFsz2ordif7sLwcxkgZ9uVzdl9N0I21sygd5IYR
	q+11Dr4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLegA-00000004KqW-3puX;
	Tue, 27 Oct 2026 10:45:18 +0000
Received: from esa1.hc555-34.eu.iphmx.com ([23.90.104.144])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLeg7-00000004Knl-1eBo
	for opensbi@lists.infradead.org;
	Tue, 27 Oct 2026 10:45:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1793097922; x=1824633922;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=I988GpikzMxTObXba+1l6H5bDJ1UnK/Rh0V3gEK55pY=;
  b=K4RLi8imT1I4dJ40yqQz+SEfKGwYBikjL9YY/rJm5W3mcQ9R2XwgghVV
   m8SWbmrY3nRGMoxtW9DcpwskU5PMwOwl3ohec+8OvRjxbVEKBSFjbN1lG
   wrXjI55UV0T7qqR9vcsYKycvgmWJxWiS2O2u1evm6JophXWJp0mt+EOmU
   Vz0cyLZQohqH8kogEwsuv5XpZMoFyTWN9H+J4EJmx+y2HLmJ/9mk0YHYf
   AmiJPVFK1os4sMHY6JkdEjx9eJl/aVn6Xg1HXGdTS7QL1ASZqKSOFLweU
   OiIU5FJsIsjXzVBvhl6momnB2aL4OB0CxI1RPOOMFTDfgnzJWd55DLvju
   w==;
X-CSE-ConnectionGUID: MAhW0KqDQy2/jWTHv+VX7A==
X-CSE-MsgGUID: vxsMd+jxRG+utgJBjMT8lg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
  by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 12:45:17 +0200
X-CSE-ConnectionGUID: rzVS6KLdQSKx2H23aIik/w==
X-CSE-MsgGUID: IC1cglk1Q5Ctm1K1Hv6VEA==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.3])
  by ces01_data.me-corp.lan with SMTP; 27 Oct 2026 12:53:02 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Tue, 27 Oct 2026 12:45:09 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH 0/2] platform: mips: p8700: S-mode access to the CM
 performance counters
Date: Tue, 27 Oct 2026 12:44:34 +0200
Message-Id: <20261027-p8700-cm-pmu-v1-0-580515e4bf39@mobileye.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJKA4GoC/yXMQQqDMBBA0avIrB2YZNFIr1Jc6GTUKSQNiYog3
 r1pXb7F/ycUySoFns0JWXYt+okVpm2AlyHOguqrwZJ9GLIOU+eIkAOmsKE1nhwL+85PUJOUZdL
 jv3v1t8s2voXX3wOu6wsDEw5kcAAAAA==
X-Change-ID: 20261027-p8700-cm-pmu-21d07cecd8df
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>, 
 Bo Gan <ganboing@gmail.com>, Samuel Holland <samuel.holland@sifive.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Xiang W <wxjstz@126.com>, Chao-ying Fu <icebergfu@gmail.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, opensbi@lists.infradead.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_034515_907716_61D04D7B 
X-CRM114-Status: GOOD (  12.65  )
X-Spam-Score: -4.0 (----)
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The MIPS P8700 Coherence Manager (CM3) has a small performance counter
block (GCR.Debug, offsets 0x900-0x9ff of the GCR) which Linux drives
through the mips_p8700_cm_pmu perf driver. These registers live in the
same PMP granule as GCR registers that must stay M-mode only (L2 cache
operations, MMIO region programming, coherence control, ...), so the
whole GCR block is closed to S-mode and the PMU is unreachable from
Linux.

A vendor SBI extension would solve this but needs vendor-specific code
in Linux. Instead, this series uses trap-and-emulate: S-mode accesses
to the GCR already arrive in M-mode as load/store access faults, and
OpenSBI forwards them to the platform emulate_load/emulate_store hooks.
The platform translates the faulting address, checks it is inside the
PMU block of one of the CM instances, and performs the access on behalf
of S-mode. Everything else is redirected to S-mode as a genuine fault.
The Linux driver is a plain MMIO driver and needs no changes.

Patch 1 adds sbi_va_to_pa() to libsbi. The hooks receive the
S-mode virtual address (mtval) and RISC-V has no way to translate an
address on behalf of another mode, so this walks the satp page tables
with M-mode physical loads. It is generic (Sv32 and Sv39/48/57) and
usable by any platform emulator.

Patch 2 implements the P8700 hooks and enables them for EyeQ7H.

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
Vladimir Kondratiev (2):
      lib: sbi: Add sbi_va_to_pa() to translate S/U-mode addresses
      platform: generic: mips: p8700: Emulate S-mode access to CM PMU registers

 include/sbi/riscv_encoding.h          |  28 ++++++++
 include/sbi/sbi_unpriv.h              |  23 +++++++
 lib/sbi/sbi_unpriv.c                  |  78 +++++++++++++++++++++
 platform/generic/include/mips/p8700.h |  34 +++++++++
 platform/generic/mips/eyeq7h.c        |   2 +
 platform/generic/mips/objects.mk      |   2 +-
 platform/generic/mips/p8700_access.c  | 126 ++++++++++++++++++++++++++++++++++
 7 files changed, 292 insertions(+), 1 deletion(-)
---
base-commit: bcf587a987573057968a11b941729d70799947f4
change-id: 20261027-p8700-cm-pmu-21d07cecd8df

Best regards,
--  
Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
