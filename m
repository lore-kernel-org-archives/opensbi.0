Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6629AD6ACF0
	for <opensbi@archiver.kernel.org>; Thu, 18 Dec 2025 11:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u16lB2cnIUmYsk7wcUwnMzJ0Ew/Pu9qBXrxnvJOuHvM=; b=TIqhPqBs8nkIJe
	bQNi66tIAUzDAePxZdH9DDU3vRBDhjm/W17hd0+Vd7Tp0TCZCYvWNW5TCdCrwREAa4OGpUo3V/pvA
	QwIIr2L2QYaXkxPuKgZiB3js07JLAmXJuiZ9QuEsGsZ7WgXafo62AmtgoZkeqwHWPTFjixfmQ4V4V
	Do5lvvtoHMK2wgXf5yx5E39NIrychCRhFJZY44N6NvGPvuCJMtjdmLPEfpcTNvoSWqw5ZvYMZUq54
	2LyM2rOhlkN7/W7Hfcw2rMv3oy6KLEs+927GtRXRZgPqi5mGq4GusyiVhSJNVzw8Tk/kLrhpR72EM
	MQPlOsVe9iwzXVlmv4hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWCTV-00000008NY4-2qHg;
	Thu, 18 Dec 2025 11:47:17 +0000
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWCTS-00000008NX2-1tZx
	for opensbi@lists.infradead.org;
	Thu, 18 Dec 2025 11:47:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1766058434; x=1797594434;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fLVxS/Sc0HGQkitH8FJKVEreW12mRUJphN9RUR1EkT4=;
  b=cszRL2B4bsejZl0BbYrpdvVXR11VofFqKSxbWW+m195xZ+ziuqXaFg3x
   MF6mAe07DPnxjYxCPu1FSckOe74XKzKKknqUDYS3FU0EzNixz57Oov4as
   WF8noNUN/oPR56QIVzKNpUpaNc4ukidjwxQpJFhJNlEAF5UwFXKtrV9BQ
   08osrokBHoz/cq3EsRdTQwp9nfrOHWCjzq1PHJbPd3htCgstst9HAkot9
   qdCCBpG9Sd1fDsqnpvCFcogSLRe56bV7CDyLtJB4Bw17pnuA/9EoBuIsu
   auovt9S3FLtJLA7Y6U+6vesrugEDlsMP9NB5rQGiYyzGS4hlizqdImaxR
   g==;
X-CSE-ConnectionGUID: 40Iha40ESf68ZqB/YcOxSw==
X-CSE-MsgGUID: HNnNpbruSQmzv8JPy7Te2w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 13:47:10 +0200
X-CSE-ConnectionGUID: JSoGQDXPQQuncsdSmn5NwQ==
X-CSE-MsgGUID: YKp0uR/nR/mZq+6qT8XDKQ==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.6])
  by ces03_data.me-corp.lan with SMTP; 18 Dec 2025 13:48:18 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Thu, 18 Dec 2025 13:47:08 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: vladimir.kondratiev@mobileye.com,
	opensbi@lists.infradead.org
Subject: [PATCH] p8700: don't use AMO instructions
Date: Thu, 18 Dec 2025 13:47:05 +0200
Message-ID: <20251218114705.1650842-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_034714_966688_9A9E279F 
X-CRM114-Status: UNSURE (   8.43  )
X-CRM114-Notice: Please train this message.
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

P8700 supports LR/SC but not AMO instructions.
Tell this to the compiler, it will in turn
define __riscv_zalrsc and undefine __riscv_atomic
that used in the code to generate appropriate instructions

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 platform/generic/mips/objects.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/platform/generic/mips/objects.mk b/platform/generic/mips/objects.mk
index a08c4c632997..84e21b7995bc 100644
--- a/platform/generic/mips/objects.mk
+++ b/platform/generic/mips/objects.mk
@@ -5,4 +5,5 @@
 ifeq ($(PLATFORM_RISCV_XLEN), 64)
 carray-platform_override_modules-$(CONFIG_PLATFORM_MIPS_P8700) += mips_p8700
 platform-objs-$(CONFIG_PLATFORM_MIPS_P8700) += mips/p8700.o mips/mips_warm_boot.o
+PLATFORM_RISCV_ISA = rv64imfdc_zalrsc_zicsr_zifencei
 endif

base-commit: 111738090c6cdf2d852717b3ad15b65e2085d237
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
