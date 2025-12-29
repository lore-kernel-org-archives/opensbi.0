Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76DFE8FDB1
	for <opensbi@archiver.kernel.org>; Mon, 29 Dec 2025 07:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zrVScimkLoAt7nhVCzkjYkJ70YCVfl9VxpG4L7/QL7U=; b=jZuzkrhUi7pvr8
	LrKZpY2owScVSGmA87ZBC3jSbQrxTGvATaUlqcBUGOjFCgM1rZXkwRDaAVnqESzsfRHwDnI30S3E8
	dUbUIKQHasPKicJcyfsBGOe49rOupYPHExOsP7CmaJWlUgOX7JQ8yPgXx2g7/jr8k2mz8pLW7NsrY
	Yqu7XomRM7hB7lSNysI6AzrlzWi6tLe+PV4Pmkomy7aQM2jM0ArWlwTLdwj43XgeVGMtdDbsA811m
	n0Dmwt3vyl3+D9CHz3/80v8n35L33HkG8XCf2CJEsbQe1URGOHpmulyKfQZC1gsaFTCuvTDLLxRZs
	G82lfuuSSuX098LiQoYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va7XQ-00000003PvS-3YnM;
	Mon, 29 Dec 2025 07:19:32 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va7XN-00000003PuG-3TW0
	for opensbi@lists.infradead.org;
	Mon, 29 Dec 2025 07:19:31 +0000
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 5BT7JH0x084255
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <opensbi@lists.infradead.org>; Mon, 29 Dec 2025 15:19:17 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Mon, 29 Dec 2025
 15:19:17 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: <opensbi@lists.infradead.org>
Subject: [PATCH 0/5] Add hart state management and system suspend support for AE350
Date: Mon, 29 Dec 2025 15:19:09 +0800
Message-ID: <20251229071914.1451587-1-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 5BT7JH0x084255
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_231930_206555_82C70B2B 
X-CRM114-Status: GOOD (  12.18  )
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

This patch series introduces support for hart state management and
system suspend functionalities on the Andes AE350 platform. For the hart
state management, AE350 platform supports CPU hotplug. For the
system suspend, there are two platform-specific low-power modes,
including deep sleep (suspend to RAM) and light sleep (suspend to standby).

Below is the patch summary:
[1/5]: The Andes System Management Unit (ATCSMU) logic is factored out into
       a dedicated FDT-based HSM driver, improving code reuse and
       maintainability.
[2/5]: Implement the functions to save and restore platform-specific CSRs
       which are lost during CPU hotplug or deep sleep.
[3/5]: Add the functions to enable/disable the cache.
[4/5]: A new Last Level Cache (LLC) driver is introduced to handle required
       cache operations for deep sleep.
[5/5]: An ATCSMU-based suspend driver is implemented to support Andes deep
       sleep and light sleep, providing the OS with access to standardized
       SBI system suspend extensions.

Ben Zong-You Xie (5):
  lib: utils/hsm: factor out ATCSMU code into an HSM driver
  platform: generic/andes: add CSR save and restore functions for AE350
    platform
  lib: utils/cache: add cache enable function
  lib: utils/cache: add Andes last level cache controller
  lib: utils/suspend: add Andes ATCSMU suspend driver

 include/sbi_utils/cache/cache.h              |  11 +
 include/sbi_utils/cache/fdt_cmo_helper.h     |  13 ++
 include/sbi_utils/hsm/fdt_hsm_andes_atcsmu.h |  65 ++++++
 include/sbi_utils/sys/atcsmu.h               |  59 ------
 lib/utils/cache/Kconfig                      |   5 +
 lib/utils/cache/cache.c                      |  11 +
 lib/utils/cache/fdt_andes_llcache.c          | 166 +++++++++++++++
 lib/utils/cache/fdt_cmo_helper.c             |  23 ++
 lib/utils/cache/objects.mk                   |   3 +
 lib/utils/hsm/Kconfig                        |   4 +
 lib/utils/hsm/fdt_hsm_andes_atcsmu.c         | 210 +++++++++++++++++++
 lib/utils/hsm/objects.mk                     |   5 +-
 lib/utils/reset/Kconfig                      |   2 +-
 lib/utils/reset/fdt_reset_atcwdt200.c        |  22 +-
 lib/utils/suspend/Kconfig                    |   5 +
 lib/utils/suspend/fdt_suspend_andes_atcsmu.c | 119 +++++++++++
 lib/utils/suspend/objects.mk                 |   3 +
 lib/utils/sys/Kconfig                        |   4 -
 lib/utils/sys/atcsmu.c                       |  89 --------
 lib/utils/sys/objects.mk                     |   1 -
 platform/generic/Kconfig                     |   1 -
 platform/generic/andes/ae350.c               | 147 +++++--------
 platform/generic/andes/objects.mk            |   2 +-
 platform/generic/andes/sleep.S               |  70 -------
 platform/generic/configs/defconfig           |   3 +
 platform/generic/include/andes/andes.h       |  84 +++++++-
 26 files changed, 791 insertions(+), 336 deletions(-)
 create mode 100644 include/sbi_utils/hsm/fdt_hsm_andes_atcsmu.h
 delete mode 100644 include/sbi_utils/sys/atcsmu.h
 create mode 100644 lib/utils/cache/fdt_andes_llcache.c
 create mode 100644 lib/utils/hsm/fdt_hsm_andes_atcsmu.c
 create mode 100644 lib/utils/suspend/fdt_suspend_andes_atcsmu.c
 delete mode 100644 lib/utils/sys/atcsmu.c
 delete mode 100644 platform/generic/andes/sleep.S

--
2.34.1

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
