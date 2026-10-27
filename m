Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85648606A31F
	for <opensbi@archiver.kernel.org>; Tue, 27 Oct 2026 10:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q94WnEAp;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=aWspNDbf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zQZJJLyqYyQAvmnzRtTzfhnnbOk5HS9RQp6PlggM8mg=; b=q94WnEAp9eUCkjv4VnwvZzYVAb
	tMbl+O8+Ms1xAaQIWkPXTYuKQEV4LmZgmPyascsgwY0T1ybmNw3okp4jmbalfAtLULxDG/oDEgfdE
	0BibINnGvGJCdr0eyuZf1ojkWdQCEoiDMQzk6tcA2xM4eau2dC8I+pXY1l111dbXPgSzF9SrQdTCt
	LsePoMouhnLcVY3LJfCWJ2vlsJRM7Vw1vD2aya7+NMWWZoA9fjStUClZThRnK4cEv9McKzAFHgR1A
	EMnVVZdNJHzc5ekXtR8f2vAM3Zhw1fF5m49my1Hh8t0wcyI2R0ZQcb/PBMkMJdxeOZgVDtJAYTAJC
	QWv6+o0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLegB-00000004Kqc-01yi;
	Tue, 27 Oct 2026 10:45:19 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLeg8-00000004Ko5-0rGQ
	for opensbi@lists.infradead.org;
	Tue, 27 Oct 2026 10:45:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1793097916; x=1824633916;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=6ueI9Lg5lwugLDaIUhWH508OX+v9/7wKTzKtKCjGPdQ=;
  b=aWspNDbf4tMfWvck3uUR1lfgSwWJukFt4yGrP7fCQgFo7V2Dnu9/2yYC
   1OsYSGRJMCt53ghhwwh559XHZVG1K862EBE+aCvMtDILHMsu0YRbWKKaL
   x49t9Lm1f/OleexkOp4G67f+l28THvraqw76vbLBjG/v1SU8HC9saX9ZL
   bTCoe3ODFhPjCbZRpdQFVApo1QiE6Gvv4PyRimAAbRQt8M23L7uHr22ar
   SgDAt9AGIMo8i3FgpyUnG0QyEyGwSYvg53Z2JD+Z+A8s+vMyUniHJGKwJ
   9bDManuBH3vE/HY7HQsJjDhS/z5qceBi2JzYWRfwRIyz5dEcv8KXilPqs
   A==;
X-CSE-ConnectionGUID: ZO61DUcvRM+B4e2+cNDssQ==
X-CSE-MsgGUID: Bgox8Kb0Qt6a80Um/MjeBA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 12:45:12 +0200
X-CSE-ConnectionGUID: IZ7CxcdlTSC/djmlCMz3xg==
X-CSE-MsgGUID: 2eElBAoQTYS8ePRAMM9XXg==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.3])
  by ces04_data.me-crop.lan with SMTP; 27 Oct 2026 12:52:56 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Tue, 27 Oct 2026 12:45:10 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Tue, 27 Oct 2026 12:44:35 +0200
Subject: [PATCH 1/2] lib: sbi: Add sbi_va_to_pa() to translate S/U-mode
 addresses
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261027-p8700-cm-pmu-v1-1-580515e4bf39@mobileye.com>
References: <20261027-p8700-cm-pmu-v1-0-580515e4bf39@mobileye.com>
In-Reply-To: <20261027-p8700-cm-pmu-v1-0-580515e4bf39@mobileye.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>, 
 Bo Gan <ganboing@gmail.com>, Samuel Holland <samuel.holland@sifive.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Xiang W <wxjstz@126.com>, Chao-ying Fu <icebergfu@gmail.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, opensbi@lists.infradead.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_034516_536971_342B4409 
X-CRM114-Status: GOOD (  20.37  )
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

Trap handlers that act on behalf of a lower privilege mode, such as
platform load/store access fault emulators, receive the faulting
address as a virtual address of the trapped context (mtval). To decide
what was actually accessed they need the physical address, and RISC-V
has no instruction to translate an address on behalf of another mode.

Add sbi_va_to_pa() which walks the page tables referenced by
satp using plain M-mode physical loads, so it is unaffected by the PMP
restrictions applied to S-mode. It supports Sv32 on RV32 and
Sv39/Sv48/Sv57 on RV64, handles superpages, and masks the Svpbmt and
Svnapot bits out of the PPN. Every PTE address is checked against the
current domain before being dereferenced so a corrupt page table
cannot cause a nested M-mode fault. Translation for VS/VU-mode
(two-stage) is not supported and returns SBI_ENOTSUPP.

Add the corresponding satp and PTE field definitions to
riscv_encoding.h.

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 include/sbi/riscv_encoding.h | 28 ++++++++++++++++
 include/sbi/sbi_unpriv.h     | 23 +++++++++++++
 lib/sbi/sbi_unpriv.c         | 78 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 129 insertions(+)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index ffe7666c176b..367a8eb55649 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -127,12 +127,32 @@
 #define PRV_M				_UL(3)
 
 #define SATP32_MODE			_UL(0x80000000)
+#define SATP32_MODE_SHIFT		31
 #define SATP32_ASID			_UL(0x7FC00000)
 #define SATP32_PPN			_UL(0x003FFFFF)
 #define SATP64_MODE			_ULL(0xF000000000000000)
+#define SATP64_MODE_SHIFT		60
 #define SATP64_ASID			_ULL(0x0FFFF00000000000)
 #define SATP64_PPN			_ULL(0x00000FFFFFFFFFFF)
 
+/* Page table entry */
+#define PTE_V				_UL(0x001)
+#define PTE_R				_UL(0x002)
+#define PTE_W				_UL(0x004)
+#define PTE_X				_UL(0x008)
+#define PTE_U				_UL(0x010)
+#define PTE_G				_UL(0x020)
+#define PTE_A				_UL(0x040)
+#define PTE_D				_UL(0x080)
+#define PTE_PPN_SHIFT			10
+/* Sv32: PPN is bits 31:10 */
+#define PTE32_PPN_MASK			_UL(0x003FFFFF)
+/* Sv39/48/57: PPN is bits 53:10; excludes Svpbmt (62:61) and Svnapot (63) */
+#define PTE64_PPN_MASK			_ULL(0x00000FFFFFFFFFFF)
+/* VPN field width per page table level */
+#define PTE32_VPN_BITS			10
+#define PTE64_VPN_BITS			9
+
 #define SATP_MODE_OFF			_UL(0)
 #define SATP_MODE_SV32			_UL(1)
 #define SATP_MODE_SV39			_UL(8)
@@ -176,6 +196,10 @@
 #define MSTATUS_SD			MSTATUS64_SD
 #define SSTATUS_SD			SSTATUS64_SD
 #define SATP_MODE			SATP64_MODE
+#define SATP_MODE_SHIFT			SATP64_MODE_SHIFT
+#define SATP_PPN			SATP64_PPN
+#define PTE_PPN_MASK			PTE64_PPN_MASK
+#define PTE_VPN_BITS			PTE64_VPN_BITS
 
 #define HGATP_PPN			HGATP64_PPN
 #define HGATP_VMID_SHIFT		HGATP64_VMID_SHIFT
@@ -185,6 +209,10 @@
 #define MSTATUS_SD			MSTATUS32_SD
 #define SSTATUS_SD			SSTATUS32_SD
 #define SATP_MODE			SATP32_MODE
+#define SATP_MODE_SHIFT			SATP32_MODE_SHIFT
+#define SATP_PPN			SATP32_PPN
+#define PTE_PPN_MASK			PTE32_PPN_MASK
+#define PTE_VPN_BITS			PTE32_VPN_BITS
 
 #define HGATP_PPN			HGATP32_PPN
 #define HGATP_VMID_SHIFT		HGATP32_VMID_SHIFT
diff --git a/include/sbi/sbi_unpriv.h b/include/sbi/sbi_unpriv.h
index be2196267413..245ad4a6e817 100644
--- a/include/sbi/sbi_unpriv.h
+++ b/include/sbi/sbi_unpriv.h
@@ -14,6 +14,7 @@
 
 struct sbi_scratch;
 struct sbi_trap_info;
+struct sbi_trap_regs;
 
 #define DECLARE_UNPRIVILEGED_LOAD_FUNCTION(type)           \
 	type sbi_load_##type(const type *addr,             \
@@ -44,4 +45,26 @@ void sbi_store_loop(u8 *buffer, ulong addr, ulong len,
 
 ulong sbi_get_insn(ulong mepc, struct sbi_trap_info *trap);
 
+/**
+ * Translate a virtual address of the trapped S/U-mode context into a
+ * physical address by walking the page tables referenced by satp.
+ *
+ * Intended for trap handlers (e.g. load/store access fault emulation)
+ * that need to know which physical address a lower privilege mode
+ * tried to access. The walk is done with plain M-mode physical loads,
+ * so it is not affected by the PMP restrictions applied to S-mode.
+ *
+ * @param regs trap registers of the trapped context, used to determine
+ *             the previous privilege mode
+ * @param va virtual address in the trapped context
+ * @param pa output physical address
+ *
+ * @return 0 on success,
+ *         SBI_EINVAL if the trapped context was M-mode,
+ *         SBI_ENOTSUPP for VS/VU-mode (two-stage translation) or an
+ *         unsupported satp mode,
+ *         SBI_EINVALID_ADDR if the walk hits an invalid or unreadable PTE
+ */
+int sbi_va_to_pa(const struct sbi_trap_regs *regs, ulong va, ulong *pa);
+
 #endif
diff --git a/lib/sbi/sbi_unpriv.c b/lib/sbi/sbi_unpriv.c
index 60becedc2ea4..028d5074fbb8 100644
--- a/lib/sbi/sbi_unpriv.c
+++ b/lib/sbi/sbi_unpriv.c
@@ -9,6 +9,8 @@
 
 #include <sbi/riscv_encoding.h>
 #include <sbi/sbi_bitops.h>
+#include <sbi/sbi_domain.h>
+#include <sbi/sbi_error.h>
 #include <sbi/sbi_hart.h>
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_string.h>
@@ -253,3 +255,79 @@ ulong sbi_get_insn(ulong mepc, struct sbi_trap_info *trap)
 
 	return insn;
 }
+
+int sbi_va_to_pa(const struct sbi_trap_regs *regs, ulong va, ulong *pa)
+{
+	const struct sbi_domain *dom = sbi_domain_thishart_ptr();
+	ulong satp, ppn, pte, pte_pa, mask;
+	int levels, lvl;
+
+	if (sbi_mstatus_prev_mode(regs->mstatus) == PRV_M)
+		return SBI_EINVAL;
+	/* VS/VU-mode would need a two-stage (vsatp + hgatp) walk */
+	if (sbi_regs_from_virt(regs))
+		return SBI_ENOTSUPP;
+
+	satp = csr_read(CSR_SATP);
+	switch ((satp & SATP_MODE) >> SATP_MODE_SHIFT) {
+	case SATP_MODE_OFF:
+		*pa = va;
+		return SBI_OK;
+#if __riscv_xlen == 32
+	case SATP_MODE_SV32:
+		levels = 2;
+		break;
+#else
+	case SATP_MODE_SV39:
+		levels = 3;
+		break;
+	case SATP_MODE_SV48:
+		levels = 4;
+		break;
+	case SATP_MODE_SV57:
+		levels = 5;
+		break;
+#endif
+	default:
+		return SBI_ENOTSUPP;
+	}
+
+	/*
+	 * M-mode runs with MPRV=0 so the dereferences below are physical
+	 * loads. The hardware has already walked these tables to produce
+	 * the trap, so the PTEs we read are the ones it used.
+	 */
+	ppn = satp & SATP_PPN;
+	for (lvl = levels - 1; lvl >= 0; lvl--) {
+		pte_pa = (ppn << PAGE_SHIFT) +
+			 (((va >> (PAGE_SHIFT + PTE_VPN_BITS * lvl)) &
+			   ((1UL << PTE_VPN_BITS) - 1)) * sizeof(ulong));
+
+		/*
+		 * Never dereference memory the trapped mode itself could not
+		 * read: a bogus pointer here would be a nested M-mode fault.
+		 */
+		if (!sbi_domain_check_addr(dom, pte_pa, PRV_S, SBI_DOMAIN_READ))
+			return SBI_EINVALID_ADDR;
+
+		pte = *(volatile ulong *)pte_pa;
+		if (!(pte & PTE_V) || ((pte & PTE_W) && !(pte & PTE_R)))
+			return SBI_EINVALID_ADDR;
+
+		ppn = (pte >> PTE_PPN_SHIFT) & PTE_PPN_MASK;
+		if (!(pte & (PTE_R | PTE_X)))
+			continue;
+
+		/* Leaf PTE. For a superpage the low PPN bits come from VA. */
+		mask = (1UL << (PAGE_SHIFT + PTE_VPN_BITS * lvl)) - 1;
+		if (ppn & (mask >> PAGE_SHIFT))
+			return SBI_EINVALID_ADDR;
+		/* Physical address must fit in ulong (matters for Sv32) */
+		if (ppn >> (__riscv_xlen - PAGE_SHIFT))
+			return SBI_ENOTSUPP;
+		*pa = ((ppn << PAGE_SHIFT) & ~mask) | (va & mask);
+		return SBI_OK;
+	}
+
+	return SBI_EINVALID_ADDR;
+}

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
