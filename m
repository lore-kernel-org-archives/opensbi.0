Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FEB7E8FDD8
	for <opensbi@archiver.kernel.org>; Sat, 27 Dec 2025 12:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1x5pyvCi3H572+IUnru9kMtpZ4D47QRaBovRLfRw/wo=; b=2D7U/t7KHi27CH
	IZ4MNw/BnY8GtVWhQd1HIJWTiFb65EIrRbmwvHaoUKC8ri0Shq/0tkBosVVESh/roXizkjkoLAKWR
	NYEjLUs0KKYZhMEHMbIsclMAjTOXzltMAv4Vtc9TyJIydVfaPDSHxkoX/1LD1D9/REW95DPQ91w47
	bygVR39kesgrkh/+vB8+GDUaM1QJbdcvNHYUPssENQtKJ5AxaLTyljJxhGKjcWMBfvlnKSCfCf55c
	fzcFA1UhQolpzdl8PmNarkPUrks3hRDF2/pv0WXbyZfYE3qgr68URsFobO2MEaLYlSv+lK7JhCd8p
	Du35DSyKh2C58nNwiK4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTG6-00000001wjg-0KfE;
	Sat, 27 Dec 2025 12:18:58 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTG1-00000001wcE-0TeS
	for opensbi@lists.infradead.org;
	Sat, 27 Dec 2025 12:18:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1766837928; x=1767442728; i=b.freisen@gmx.net;
	bh=VipAjsxt/8HAG0yMUHX7CLzXIJsTWUCp1Qgq/cwyxpY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=hyiGE3B7AZji2XJhsMkLOJtgsMV5h8cLXZFaPRr+0wHEGLFtndzsZNxxvKz7A90z
	 kmv+gmCl4P14zRiraqzJBETZyFsdoFs5r9DRlEwTxKHc/ortqq9AT731I1cZliGfo
	 tDQeKfr6GFgkZK1vkyLOtuMpB9tjSbuUFZfPCiZzb0m5PHqYp12a15emLEup+2TXQ
	 7CS9e38qYNfj5+9+98sk6APnH4fYy5kcYQilBO/CL5s+H55QmmPaCOoUnVNhZMIx+
	 +CwsFKrT4cUoLWrnqAN8whyalxJEXZZh36+/dhEbGYsWlprJwvSYusSvSwjNS4G7o
	 8P7BaP8WTEcYDJonRQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from blackbox ([95.223.79.117]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MfpSb-1wASu10gjB-00fl4t; Sat, 27
 Dec 2025 13:18:48 +0100
From: Benedikt Freisen <b.freisen@gmx.net>
To: opensbi@lists.infradead.org
Cc: Benedikt Freisen <b.freisen@gmx.net>
Subject: [PATCH v3 0/3] Add trap-based ISA extension emulation
Date: Sat, 27 Dec 2025 13:17:59 +0100
Message-ID: <20251227121802.15703-1-b.freisen@gmx.net>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:+2A4sr3nQxjl/b+pbDLxMLEDCZrZ/TRlbbhlDBded5lBzsfqD+4
 wbfEfyrKj4PgG9v7KRKyollJ4cGzKS3uyzpHsJzMvg4SeGBipXMwUsR0n4Mbw5wtvN5ZIMj
 3PRQh7tO1pyUmRQtiUa4ghtoRjSS239o9H1iYHanT4uYoabjZELKnpx/x4RQ/VfLBLEj57W
 RPUrsclL25BnIngHTSfqA==
UI-OutboundReport: notjunk:1;M01:P0:pv6fUmLAKws=;Lul964IiMJfleDkNac+5MYnf6Sy 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_041853_560914_EC645DF5 
X-CRM114-Status: GOOD (  10.89  )
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

Introduction (copy-pasted from previous versions)

This patch series seeks to add trap-based emulation functionality for various ISA extensions relevant to RVA22, RVB23 and RVA23.
The emulation functionality contained herein has been demonstrated to e.g. allow the VisionFive 2's JH7110 to run software using the RVA22U64 and RVB23U64 profiles, allow the Orange Pi RV2's Ky X1 (a SpacemiT K1 derivative) to run Ubuntu 25.10 (RVA23U64) in a docker container, and allow the Tenstorrent Blackhole's SiFive X280 (Gen. 1) to boot into Ubuntu 25.10.

Changes in this version, omitting patches already applied

Patch 1 drops the CONFIG_THEAD_C9XX_ERRATA ifdef present in patch v2 5/7, as requested by Anup Patel.
Patch 2 is the unmodified patch v2 6/7.
Patch 3 adds the early-clobber annotation missing in patch v2 7/7, reported by Vivian Wang, to some inline assembly operands.

P.S.:
I am aware that the rather niche and transitionary character of ISA extension emulation's use case ultimately makes the bulk of it more suitable for a fork than for mainline OpenSBI.
Pursuing the formal review process, anyway, has however already proven to be very valuable for quality assurance and diff minimization, and can also serve archival purposes.

Benedikt Freisen (3):
  lib: sbi: Workaround for FENCE(.I) errata on C906, C910.
  lib: sbi: ISA extension emulation.
  lib: sbi: ISA extension emulation (Zvbb).

 CONTRIBUTORS.md                          |    2 +
 include/sbi/riscv_encoding.h             |  181 ++++
 include/sbi/riscv_fp.h                   |   47 +
 include/sbi/sbi_hart.h                   |    2 +
 include/sbi/sbi_illegal_insn.h           |    1 +
 include/sbi/sbi_insn_emu.h               |   65 ++
 include/sbi/sbi_insn_emu_fp.h            |   29 +
 include/sbi/sbi_insn_emu_v.h             |   21 +
 include/sbi/sbi_platform.h               |    6 +
 include/sbi/sbi_scratch.h                |   12 +-
 include/sbi/sbi_trap.h                   |    2 +
 include/sbi_utils/cache/fdt_cmo_helper.h |    7 +
 lib/sbi/Kconfig                          |    7 +
 lib/sbi/objects.mk                       |    3 +
 lib/sbi/sbi_emulate_csr.c                |   14 +
 lib/sbi/sbi_fwft.c                       |   34 +
 lib/sbi/sbi_hart.c                       |    4 +
 lib/sbi/sbi_illegal_insn.c               |  148 ++-
 lib/sbi/sbi_insn_emu.c                   |  624 ++++++++++++
 lib/sbi/sbi_insn_emu.conf                |  175 ++++
 lib/sbi/sbi_insn_emu_fp.c                |  974 ++++++++++++++++++
 lib/sbi/sbi_insn_emu_v.c                 | 1146 ++++++++++++++++++++++
 lib/sbi/sbi_trap.c                       |   72 ++
 lib/sbi/sbi_trap_ldst.c                  |   10 +-
 lib/utils/cache/fdt_cmo_helper.c         |   15 +
 25 files changed, 3558 insertions(+), 43 deletions(-)
 create mode 100644 include/sbi/sbi_insn_emu.h
 create mode 100644 include/sbi/sbi_insn_emu_fp.h
 create mode 100644 include/sbi/sbi_insn_emu_v.h
 create mode 100644 lib/sbi/sbi_insn_emu.c
 create mode 100644 lib/sbi/sbi_insn_emu.conf
 create mode 100644 lib/sbi/sbi_insn_emu_fp.c
 create mode 100644 lib/sbi/sbi_insn_emu_v.c

-- 
2.52.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
