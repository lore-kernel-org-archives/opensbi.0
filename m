Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071C2606A31C
	for <opensbi@archiver.kernel.org>; Fri, 13 Nov 2026 09:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CYIlRYAF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5ZPbOeFXCv4stlvoonKO4nLRqAVDw1cBUli8sYZ5S3g=; b=CYIlRYAFfoQ+q2MockzCpfNqf1
	a/nrUo0haQlDPJyz1aPhAtZogmV3Dv5A0dKj6vtAo0cBC38jInkbxwTiYf9yLUpZgxKn6oACfdLEm
	SPZ+qBqLBfvxizUefmjcUbu1KcHBzDDyZVs5eW4tDmAnMdi/hteZprZqS187eyzHNhtTCzpZINOSX
	BEgLJ/VEu8UixkURVKgLW9zmpD6IIujJ5bqPpAwKEjPlrvDPYtCTnfP9bswQxWP6+63Er66Dl+h2k
	5WVcgjWb1LgO9j0wvG4SUCIRr4T8pAJ/3mjTTeUTDaeVcprFbEV7xxWLCFKk5GqBAtgbYZMqk3QU3
	ljkezr6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRnf2-0000000CEF7-42j0;
	Fri, 13 Nov 2026 09:33:32 +0000
Received: from atcsqr.andestech.com ([220.128.198.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRnez-0000000CEEN-39T1
	for opensbi@lists.infradead.org;
	Fri, 13 Nov 2026 09:33:31 +0000
Received: from mail.andestech.com (atcpcs55.andestech.com [10.0.1.155])
	by Atcsqr.andestech.com with ESMTPS id 6AD9WKl5020974
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Nov 2026 17:32:20 +0800 (+08)
	(envelope-from randolph@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs55.andestech.com
 (10.0.1.155) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Fri, 13 Nov
 2026 17:32:20 +0800
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Nov
 2026 17:32:20 +0800
From: Randolph Lin <randolph@andestech.com>
To: <opensbi@lists.infradead.org>
Subject: [RFC PATCH 5/5] docs: describe the PMA regions DT node
Date: Fri, 13 Nov 2026 17:32:12 +0800
Message-ID: <20261113093212.3816428-6-randolph@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113093212.3816428-1-randolph@andestech.com>
References: <20261113093212.3816428-1-randolph@andestech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs55.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: Atcsqr.andestech.com 6AD9WKl5020974
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_013330_155476_45AF9EAA 
X-CRM114-Status: GOOD (  17.98  )
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
Cc: Anup Patel <anup@brainfault.org>, Lad
 Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Samuel Holland <samuel.holland@sifive.com>, Randolph Lin <randolph@andestech.com>, Randolph Lin <randolph.sklin@gmail.com>, Jun Chang <jun.chang@metanoia-comm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Describe the "riscv,pma-regions" DT node and the encoding of "attr" in
the OpenSBI DT configuration guideline, and which values of "attr"
select each memory type of the Andes PMA device in the AE350 platform
guide.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Randolph Lin <randolph@andestech.com>
---
 docs/opensbi_config.md       | 85 ++++++++++++++++++++++++++++++++++++
 docs/platform/andes-ae350.md | 39 +++++++++++++++++
 2 files changed, 124 insertions(+)

diff --git a/docs/opensbi_config.md b/docs/opensbi_config.md
index 104d82c9..5a9174b1 100644
--- a/docs/opensbi_config.md
+++ b/docs/opensbi_config.md
@@ -89,3 +89,88 @@ The OpenSBI Configuration Node will be deleted at the end of cold boot
         ...
     };
 ```
+
+### PMA Regions Node
+
+On some platforms, OpenSBI can set the physical memory attributes (PMA) of
+memory regions at boot, for example to make a memory region that other bus
+masters use non-cacheable. The platform must register a PMA device, which
+supports some of the attributes. See the platform documentation.
+
+The **/chosen** DT node is the preferred parent of the PMA regions DT node.
+The DT properties of the PMA regions DT node are as follows:
+
+* **compatible** (Mandatory) - The compatible string of the PMA regions.
+  This DT property should have value *"riscv,pma-regions"*
+
+Each subnode describes one region, with the following DT properties:
+
+* **base** (Mandatory) - The physical start address, as two 32-bit cells.
+
+* **order** (Mandatory) - The region size as log2. The base must be aligned
+  to the size: a region is always NAPOT.
+
+* **attr** (Mandatory) - The attributes, as one 32-bit cell. Bits 15:8 use
+  the encoding of the flags in the *riscv,physical-memory-regions* DT binding
+  proposed for Linux, which describe the memory type. Bits 19:16 choose among
+  the memory types that a PMA device may offer for the same attributes. The
+  other bits must be zero.
+
+| Bits  | Attribute                                                       |
+|-------|-----------------------------------------------------------------|
+| 9:8   | Ordering: 0 for relaxed I/O, 1 for strong I/O, 2 for memory     |
+| 10    | Reads are idempotent                                            |
+| 11    | Writes are idempotent                                           |
+| 12    | Cacheable                                                       |
+| 13    | Coherent                                                        |
+| 15    | Unsafe: accesses must fault                                     |
+| 16    | Bufferable (PMA_BUFFERABLE)                                     |
+| 17    | Write-through (PMA_WRITE_THROUGH)                               |
+| 18    | No read allocate (PMA_NO_READ_ALLOC)                            |
+| 19    | No write allocate (PMA_NO_WRITE_ALLOC)                          |
+
+When bits 19:16 are zero, a region is non-bufferable, and a cacheable region
+is write-back with read and write allocate. The common values of bits 15:8
+are:
+
+| attr   | Memory type                                              |
+|--------|----------------------------------------------------------|
+| 0x0000 | I/O, relaxed ordering (PMA_IO)                           |
+| 0x0100 | I/O, strong ordering (PMA_ORDER_IO_STRONG)               |
+| 0x0e00 | Non-cacheable memory (PMA_NONCACHEABLE_MEMORY)           |
+| 0x1e00 | Cacheable, non-coherent memory (PMA_NONCOHERENT_MEMORY)  |
+| 0x3e00 | Cacheable, coherent memory (PMA_NORMAL_MEMORY)           |
+| 0x8000 | Unsafe (PMA_UNSAFE)                                      |
+
+A PMA device may not support every attribute. The boot fails if it cannot
+set the attributes of a region.
+
+OpenSBI ignores the **reg** DT property, which only gives the unit address.
+
+The cold boot hart parses the PMA regions DT node, prints each region and
+what its attributes mean, and then deletes the node (replaces it with nop
+tags). Every hart then sets the same regions.
+The boot fails if a region is invalid, if two regions overlap, if the
+platform has no PMA device, or if a hart cannot set the regions.
+
+A memory region that the OS must not use as normal RAM also needs a
+*no-map* node in **/reserved-memory**.
+
+### PMA Regions Example
+
+```text
+    chosen {
+        pma-regions {
+            compatible = "riscv,pma-regions";
+            #address-cells = <2>;
+            #size-cells = <2>;
+
+            region@40000000 {
+                base = <0x0 0x40000000>;
+                order = <20>;
+                attr = <0x10e00>; /* non-cacheable, bufferable memory */
+                reg = <0x0 0x40000000 0x0 0x100000>;
+            };
+        };
+    };
+```
diff --git a/docs/platform/andes-ae350.md b/docs/platform/andes-ae350.md
index 8fc8ec6a..039d3a5d 100644
--- a/docs/platform/andes-ae350.md
+++ b/docs/platform/andes-ae350.md
@@ -26,6 +26,45 @@ AE350's dts is included in https://github.com/andestech/linux/tree/RISCV-Linux-5
 make PLATFORM=generic FW_PAYLOAD_PATH=<linux_build_directory>/arch/riscv/boot/Image FW_FDT_PATH=<ae350.dtb path>
 ```
 
+PMA Regions
+-----------
+
+The AE350 platform registers the Andes PMA device. On cores with programmable
+PMA (PPMA), a board can then set PMA regions at boot from a
+`riscv,pma-regions` DT node, as *docs/opensbi_config.md* describes. Every
+hart sets the regions in its first PMA entries, and the PMA_FREE SBI call
+cannot free them.
+
+The Andes PMA device sets the memory type (MTYP) of a PMA entry from the
+**attr** property of a region:
+
+| MTYP | Memory type                                    | attr    |
+|------|------------------------------------------------|---------|
+| 0    | Device, non-bufferable                         | 0x00000 |
+| 1    | Device, bufferable                             | 0x10000 |
+| 2    | Memory, non-cacheable, non-bufferable          | 0x00e00 |
+| 3    | Memory, non-cacheable, bufferable              | 0x10e00 |
+| 4    | Memory, write-through, no allocate             | 0xe1e00 |
+| 5    | Memory, write-through, read allocate           | 0xa1e00 |
+| 6    | Memory, write-through, write allocate          | 0x61e00 |
+| 7    | Memory, write-through, read and write allocate | 0x21e00 |
+| 8    | Memory, write-back, no allocate                | 0xc1e00 |
+| 9    | Memory, write-back, read allocate              | 0x81e00 |
+| 10   | Memory, write-back, write allocate             | 0x41e00 |
+| 11   | Memory, write-back, read and write allocate    | 0x01e00 |
+| 15   | Empty hole, where accesses fault               | 0x08000 |
+
+MTYP does not encode the I/O ordering or the coherence, so the device ignores
+them: strong I/O ordering (bit 8) and coherent memory (bit 13) select the same
+MTYP as the values above. On Andes cores, coherence is enabled per core with
+mcache_ctl.DC_COHEN, not per region, so a PMA entry cannot change it.
+
+The device rejects other values of **attr**. A region has at least 4 KiB
+(order 12).
+
+Do not list a region that S-mode software sets itself with the PMA_SET SBI
+call: that call fails on the overlap.
+
 DTS Example: (Quad-core AX45MP)
 -------------------------------
 
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
