Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621DCC54F4C
	for <opensbi@archiver.kernel.org>; Tue, 28 Jul 2026 08:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pJFHMO8KHC4I7vAjvgNaDJSFIXBDqFodPxtKVz3+d+k=; b=GI4DENf8yK5y2N
	wA4OT8i6FSRzsTgPfQXYwDM68+Heuk/m8WOZeqHUo9QhwVuTKKC7eOTPAmEwEkezmieRNBLUS50fe
	0xRR+wmaF9z0mM/of1XlP9YRZ5aaMZpnLfufjAi+beLCkLUsj+hZNrVIIbnodL/TOYMbfi0BmwVC+
	ti2T2xxgcB4FoPpwvX71AiFVioO1zZrp87wnQPyYNnzxeTA8lgekuwg6Hln9fC+o5zvytT8Z7iiBz
	Q8U7Ey4aZczvCQJmFxLU+GtaDA2Ie/I7SuO+E4CFV0RpYjZ9bROpofNrCY4sSLntebU4mjRlnp4SE
	L3FqbytUiqW9AY+MPecw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woctu-00000004gMj-06rM;
	Tue, 28 Jul 2026 08:10:58 +0000
Received: from 220-128-198-181.hinet-ip.hinet.net ([220.128.198.181] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woctq-00000004gM5-0y2o
	for opensbi@lists.infradead.org;
	Tue, 28 Jul 2026 08:10:56 +0000
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 66S8AhX4069147
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK)
	for <opensbi@lists.infradead.org>; Tue, 28 Jul 2026 16:10:43 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 28 Jul
 2026 16:10:43 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: <opensbi@lists.infradead.org>
Subject: [PATCH 0/7] Fix and improve the Andes ATCSMU and LLC drivers
Date: Tue, 28 Jul 2026 16:10:34 +0800
Message-ID: <20260728081041.2724668-1-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 66S8AhX4069147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_011054_626575_0BC0D2BB 
X-CRM114-Status: UNSURE (   7.85  )
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

Fixes and cleanups for the Andes last level cache, HSM and suspend
drivers, collected while bringing up suspend to RAM on the AE350
platform.

Below is the summary of this patch set:
- Patch 1 makes andes_llcache_enable() return 0 on success, as the
  cache_enable() callback is documented to. Nothing checks it today, but
  patch 7 does.
- Patch 2 puts the SMU and LLC register regions in the root domain, so
  the supervisor can reach them under Smepmp.
- Patch 3 pairs the non-retentive CSR save and restore with an explicit
  flag instead of inferring it from the boot count and sleep type.
- Patch 4 restores those CSRs on the system-suspend resume path, which
  never reached the old call site.
- Patch 5 wakes a sleeping hart with a plain IPI and drops the SMU
  WAKEUP_CMD path.
- Patch 6 polls the secondary harts until they are really asleep instead
  of checking once.
- Patch 7 arms the SMU last and unwinds an aborted suspend rather than
  leaving the hart half configured.

Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>

Ben Zong-You Xie (7):
  lib: utils/cache: fix andes_llcache_enable() return value
  lib: utils/andes: add the SMU and LLC registers to the root domain
  platform: generic/andes: pair non-retentive CSR save/restore with a
    flag
  lib: utils/suspend: restore Andes CSRs on system-suspend resume
  lib: utils/hsm: wake sleeping Andes harts with an IPI
  lib: utils/suspend: wait for the secondary Andes harts to sleep
  lib: utils/andes: arm the SMU sleep command last

 include/sbi_utils/hsm/fdt_hsm_andes_atcsmu.h |  8 ++-
 lib/utils/cache/fdt_andes_llcache.c          | 23 +++++--
 lib/utils/hsm/fdt_hsm_andes_atcsmu.c         | 64 ++++++++----------
 lib/utils/suspend/fdt_suspend_andes_atcsmu.c | 70 ++++++++++++++------
 platform/generic/andes/ae350.c               | 26 ++++++--
 platform/generic/include/andes/andes.h       |  4 ++
 6 files changed, 129 insertions(+), 66 deletions(-)

--
2.34.1

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
