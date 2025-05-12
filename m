Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B3FC3ABBC
	for <opensbi@archiver.kernel.org>; Mon, 12 May 2025 08:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bf/mYBofQy229hCddVngSeT7+81VSchUec38ZvM3jeg=; b=aQJ5zhjp2qhpN5
	RuDRNbqU9CPz1/UQvGcjrn37LiPhdpJE2+bDm3UTP5+BIBjMN9i1OPA/Sx+JnpWqPrF5Dm028XWw+
	nXxy8OC++Ov//MsT8XMy0SjV3dc5nfEZ59icugU0lDcOwePf7yBKd1LvueFhUEw1wiBCb7Qv4P4Ey
	0YRCSlhAxznzyrUUCGAFgWSxL/oFfrFNY6dw7ojs14Kt+sohYeD7v2ELBcQjptVjHDUn2Sdg+S7iN
	veRaGB2aZoaTGRse8q6QVeQ0TClk1xqNJy1x/vbyq1duBnB9ddbFvaFnYdL+W21Ox6SM90ZoHvLj6
	/2RTTIpRw3/4ZP0kT6Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOj0-00000008mro-3Tvj;
	Mon, 12 May 2025 08:41:26 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOgF-00000008mPw-3zRU
	for opensbi@lists.infradead.org;
	Mon, 12 May 2025 08:38:37 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-740b3a18e26so3246146b3a.2
        for <opensbi@lists.infradead.org>; Mon, 12 May 2025 01:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747039115; x=1747643915; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oScVbrfF9marxzWDnq6/U3J9FR7vwN/FaTnuAVuVc5Y=;
        b=hQqvBd9mH25pVNZls0SnCGgQRhaJI09FIOEYYh1VQVfwz9Kvx/oHF+FeOguWRZ9uFT
         A7M+cqI8cgG8M1prEeLGlZWasY5SWKaAZRt87xaalEgUd7R3joncyBUpNY03oex/siQT
         b3+zvTM5Tmgbpwqy5Seq9k3ObnHFOWF2V/Z7RNhlGPZfEyNRiyaN6Zo5FXA7QWkRoxIG
         9vZLSt+yjd6iGUKyOecv3KCRV8NnopBXR2UwZQoeRANxemsvW3yUa8/elosEWG95NiDE
         Q4WZ+OMbuGTfbyHy28+fxVXuPlLKUk48IUC+godTIidNEKqNiOynnoTzJaHrHh/f9BO1
         JaGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747039115; x=1747643915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oScVbrfF9marxzWDnq6/U3J9FR7vwN/FaTnuAVuVc5Y=;
        b=nJcwgSGSImCfv96MwR8bshwicUOaIwUHFl9BcDgQJEA+/Vo7PXQDmOBefGBE7DMOSB
         urwWS5NklkzE+kmi/Uy9bFHvzQPAVl8jrAula2a6N61Ynxc+V1WEwI6jSUfB6XBWS7LN
         RPzWChhDLRP/TzHUpV2cqkkTX52EzhQ4TMDvC0p5kOckJTVKor9e2cUFNpjJGDwPeYXl
         PMW8w4LTk2ix4BUKPUsULlTNmfptlV9saQSOYQB6lzLILbCXHNN73p+YKB09PZ/v/46A
         uM4Vb2PsYyp9GqmQOBPsYTnwAlms/qemScXeZqgo7nyO0rDM+u9WTidBGJH2dtO8vfRi
         vT5w==
X-Forwarded-Encrypted: i=1; AJvYcCVo36fM5Kv4jZVAFg9y5Cp7rAxktVaeChr2YUAlGNj23niqUBGCgg4HKdZn8hEuEi1c06TD++YV@lists.infradead.org
X-Gm-Message-State: AOJu0YxjjS64Xu8gLJNqQIvXl4Xi02CAXISA5oHEs8za8tgTgy51go6Q
	JfxtD26moVS03IzIXMx40brUmCEKCp+CNrzTvyCfZOwpXfxRGD/y/AwWRptBOj0=
X-Gm-Gg: ASbGncuRi8cTIw8lguhKlOK3lylQ4eDorGOcQS4K4/uZlYN12ipzgAep79CmP84YS+L
	1PUHrvrUOviCMheqwCDpCXy+9TIg2avQLm/5G8bVfxPsFzm2xQT3YkLFHWGAfYcWZNh1pqVLkXD
	O78HAhL0uYPtkayOwohyJ9QMSZkX2Jov5GunSbR7cWkEEe0s3pkcMYWSunVaEJgiIniWX0BdjRk
	LTjpx35r2YSpGnjA4PQT5/WLlnWrJQzVgPXauFc1K9Bca/RNLR7V0TtMng5CeBsXRleyY0XmJgS
	T3kST91AW7DQUPt6bHRQL+Yc2mHo0r0VA6zlDVOKRHpoyWXCIMhPA7npbi/DXzclguR4ySbYzQH
	9LOLLAvWoXEgNkQ==
X-Google-Smtp-Source: AGHT+IEZwEHHvcEirFVG7cOiyCNv6AEMq15OPCeH4i+LzHPICIVeROur2avD4eyyR8aROrIBdUJ7gw==
X-Received: by 2002:a05:6a20:149f:b0:215:df57:8fde with SMTP id adf61e73a8af0-215df579056mr1251826637.25.1747039114824;
        Mon, 12 May 2025 01:38:34 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.16.16])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7423773dedfsm5520943b3a.72.2025.05.12.01.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 01:38:34 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	opensbi@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 0/4] Driver updates to match frozen RPMI specification
Date: Mon, 12 May 2025 14:08:23 +0530
Message-ID: <20250512083827.804151-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_013835_988348_9A9B7206 
X-CRM114-Status: UNSURE (   7.60  )
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

The RPMI v1.0 specification is frozen and in public review so update
RPMI drivers to match last minute specification changes which were
based on ARC feedback.

These patches can also be found in the rpmi_fixes_v1 branch at:
https://github.com/avpatel/opensbi.git

To test these patches, use the dev-upstream branch of the following repos:
* https://github.com/ventanamicro/qemu.git
* https://github.com/ventanamicro/linux.git

To enable QEMU RPMI emulation (using librpmi) for virt machine, use
"virt,rpmi=on,aia=aplic-imsic" as the QEMU machine name.

Anup Patel (4):
  lib: utils/mailbox: Update DT register name of A2P doorbell
  lib: utils/mailbox: Parse P2A doorbell system MSI index from DT
  lib: utils/mailbox: Parse A2P doorbell value from DT
  lib: utils/mpxy: Remove p2a_db_index from RPMI system MSI attributes

 include/sbi_utils/mailbox/rpmi_msgprot.h   |  2 +-
 lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c | 34 +++++++++++++++-------
 lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c      | 13 ++++++---
 3 files changed, 34 insertions(+), 15 deletions(-)

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
