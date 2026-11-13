Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B68606A321
	for <opensbi@archiver.kernel.org>; Fri, 13 Nov 2026 09:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k4zR/o9D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=0Uj7f/uO2jXxHISVS9+TL712XAD/36R+A6GmHv7GY2k=; b=k4zR/o9De+0JwwuBWVq9Hy8n2r
	OQRcYcm5wMsQ2WHcwB/df2vYL76gh1BgJ6IHYYs9cSjEnqPM2Vu0kkB3X6KYibITlH8in7eA+8pFc
	MSVqiKBAwhMMVZOrmlEgHIvGfq713DX3xK9YRyl4yEBBaGwK94FSjRa2lITH5j5V1M2CCPRXu8lzt
	wnFsJMzh6CPjbEi4KpwKCPgbt7Y8CW/f4aFIArvG5LsL9QEIfy3weO+8ZobyKKuvQTLeUd53nqbOh
	k/HDt/A7Y8rCnDNT7mC+1dSvFCYUyX3X7qy2C57N6MDx8XFYogKAHGOHl5xo4FpxoAy5dgcZHycPj
	Q1ZfegGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRnfM-0000000CEHH-0QNV;
	Fri, 13 Nov 2026 09:33:52 +0000
Received: from atcsqr.andestech.com ([220.128.198.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRnfI-0000000CEGa-26s0
	for opensbi@lists.infradead.org;
	Fri, 13 Nov 2026 09:33:50 +0000
Received: from mail.andestech.com (atcpcs54.andestech.com [10.0.1.154])
	by Atcsqr.andestech.com with ESMTPS id 6AD9WJ3J020970
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Nov 2026 17:32:19 +0800 (+08)
	(envelope-from randolph@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs54.andestech.com
 (10.0.1.154) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Fri, 13 Nov
 2026 17:32:19 +0800
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Nov
 2026 17:32:19 +0800
From: Randolph Lin <randolph@andestech.com>
To: <opensbi@lists.infradead.org>
Subject: [RFC PATCH 0/5] lib: utils: add a PMA framework and set PMA regions from the DT
Date: Fri, 13 Nov 2026 17:32:07 +0800
Message-ID: <20261113093212.3816428-1-randolph@andestech.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs54.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: Atcsqr.andestech.com 6AD9WJ3J020970
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_013348_901672_6C4639AF 
X-CRM114-Status: GOOD (  14.56  )
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SoCs from several vendors use Andes cores with programmable physical
memory attributes (PMA), and each sets its boot-time regions in its own
platform code: RZ/Five from Renesas and MT2824 from Metanoia from C
tables, and QiLai from Andes with andes_sbi_set_pma() calls. So each new
board needs its own platform file. This series adds a small PMA
framework in lib/utils/pma, and lets a board describe the regions in a
"riscv,pma-regions" DT node instead. The Andes AE350 platform is the
first user.

Patch 1 adds the framework: a platform registers a PMA device, the cold
boot hart adds the regions, and every hart sets them. Patch 2 parses the
DT node and calls the framework from generic_final_init(). Patch 3 adds
a PMA device for Andes PPMA, and patch 4 registers it on AE350. Patch 5
documents the DT node.

The attributes reuse the encoding of the flags in the
"riscv,physical-memory-regions" DT binding that Samuel Holland proposed
for Linux [1], limited to the memory type bits. Each vendor encodes PMAs
differently, so the PMA device maps the attributes to its own format and
rejects the ones it cannot set. Bits 19:16, which that encoding does not
use, choose among the memory types that a device offers for the same
attributes: bufferable, write-through, and the allocation. With them,
the Andes PPMA device can select every MTYP of pmaxcfg.

I tested the framework on QEMU virt, with 4 harts and a test PMA device:
every hart sets the regions, and an invalid, overlapping or extra region
stops the boot.

Open questions:

1. Should the framework live in lib/utils, or stay in the Andes
   platform code until another vendor needs a PMA device?

2. The DT node uses the "riscv,pma-regions" compatible, but no RISC-V
   specification defines it. Would "opensbi,pma-regions" be better?

3. "attr" reuses bits 15:8 of the flags in the proposed
   "riscv,physical-memory-regions" binding [1], and adds bits 19:16 for
   bufferable, write-through and allocation. Is it fine to reuse an
   encoding that Linux has not merged yet, and to extend it?

[1] https://lore.kernel.org/all/20251113014656.2605447-20-samuel.holland@sifive.com/

Randolph Lin (5):
  lib: utils: add a PMA framework
  lib: utils/pma: set PMA regions from the device tree
  platform: generic/andes: add a PMA device for PPMA
  platform: generic/andes: ae350: register the Andes PMA device
  docs: describe the PMA regions DT node

 docs/opensbi_config.md                     |  85 +++++++++++
 docs/platform/andes-ae350.md               |  39 +++++
 include/sbi_utils/pma/fdt_pma.h            |  33 ++++
 include/sbi_utils/pma/pma.h                | 119 +++++++++++++++
 lib/utils/Kconfig                          |   2 +
 lib/utils/pma/Kconfig                      |  15 ++
 lib/utils/pma/fdt_pma.c                    | 167 +++++++++++++++++++++
 lib/utils/pma/objects.mk                   |   9 ++
 lib/utils/pma/pma.c                        |  80 ++++++++++
 platform/generic/andes/Kconfig             |   1 +
 platform/generic/andes/ae350.c             |   4 +-
 platform/generic/andes/andes_pma.c         | 111 ++++++++++++++
 platform/generic/configs/defconfig         |   1 +
 platform/generic/include/andes/andes_pma.h |  11 ++
 platform/generic/platform.c                |   6 +
 15 files changed, 682 insertions(+), 1 deletion(-)
 create mode 100644 include/sbi_utils/pma/fdt_pma.h
 create mode 100644 include/sbi_utils/pma/pma.h
 create mode 100644 lib/utils/pma/Kconfig
 create mode 100644 lib/utils/pma/fdt_pma.c
 create mode 100644 lib/utils/pma/objects.mk
 create mode 100644 lib/utils/pma/pma.c


base-commit: 332798211e7232da60158b0545b23c61b5338516
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
