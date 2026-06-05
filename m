Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F2BCD6E74
	for <opensbi@archiver.kernel.org>; Fri,  5 Jun 2026 07:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qlOuLyofeGckInIkp0T8ERG2YdAVxMh1UuvEghfFzu4=; b=vqI2Ki/8fas3Uz
	CmkgD/5VPwZM+D7Qb0OUUNTDocdYDbNijvk2CtFTFyTgeyREegcSt4pkZTebF7Dmr5hooHw3lFT/v
	h8ZrD5rW3RxKEA9i6kbGSBpkPlFsUSLIqAbcIzk+L7rxof1x+DQmDBSm+zOR1aBlAS9de2W1LMppa
	Ugu6DLLjginH2eY/rMuD5tvvt2Mwye/0Tje9SOU2q4tIWENgMt6FtQ8ASwuVuMoaY7EjVWOHblI2j
	0+hlwPV1uzzeRnrzWpbR/acqEomqishx0euwp+4lXyAaO5CYvCkNLZ4ZNVo1PUWf0AcYcz9W/zsJO
	8vTh05ZfoXCBDQdwJi9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPSy-00000000H0T-2zwn;
	Fri, 05 Jun 2026 07:59:44 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPSv-00000000GzA-2kda
	for opensbi@lists.infradead.org;
	Fri, 05 Jun 2026 07:59:42 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-c857fba35cfso838171a12.1
        for <opensbi@lists.infradead.org>; Fri, 05 Jun 2026 00:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780646378; x=1781251178; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UTOxTVEQdK1FrHDRVqBgpkhCK7Bq7JCCCICXJcgjmks=;
        b=lWke5fEsa7xcs73aihloZZJL4f5hwvW4PWywYAHlpPBDBhSldvkkzzXhZMQ90crdMV
         +kKSCEiK2RyTVypi0whLc+K4P+2vH2ewBCriT/LO0dIc9SLkQbPlcUhOLRmLeUauj7pr
         VHSO15Jb0GoG6kwtqq2rTztpCVX0ezM3SDaOn9I8h2aZLLOwU8HxvvLcAkA9ryPKhaF4
         kZKpTBoy2twuV8XnDNKkk2a0mJ4lCVc/KctjBFsoUezAR0sknD0W6Xcv6vZZ4N/1D4Qc
         X9G12vFZA2tkjMVVGuQCueR1X/hn9lZm9IffXtlHJ4JlAc+zQu3GoL94tfzdSxfePf4f
         WkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780646378; x=1781251178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTOxTVEQdK1FrHDRVqBgpkhCK7Bq7JCCCICXJcgjmks=;
        b=IhvNH5VYYRzEzrynSK2LxUzc8C0+g3l5NdPqDb3H16AE0SuNGHnXip7nihqTY1vg7u
         05uoRsLdX43DHvLcYDztRy/1//X25ZbychDbAZsIoODFzKVBMBbnC3dBkd01l0oLRDex
         8u0vDgYcbw0OwITW9ecMIPVlHZONabJ1UAE51B7Qpog+VStLJ7Z6Vy5PHcT7gM3GuOdD
         bV2daiOY7DAA8ZAGai3Ko0XAw9wAHAcVA8zytZTFrr8fHWBt0o2z0ozXpbyFieSIr8JB
         KmYZUmO8wyQ2zSVM6lehTTA2prfBvHRN9ad9zp2s5vFJNS8JZmJ5H/xfxp7A2eldT2lu
         wBhQ==
X-Gm-Message-State: AOJu0YyQGYrMym5LNbn/Jo47hQAzsGsTb0PmfpMf1kzEm2K2+knDxIS6
	E6hzynI6Ti1AQP4HG0zYvtR1QHLin90G73EU4T1Vh9R1mWYCNjA0FjO8lmrZHA==
X-Gm-Gg: Acq92OGJscRWCeUBdCq7A9+3QK073mQwBW9HLtyVDV2WDL1AIuFG8tkgGUSYoZaH32r
	8gxxFwf4r/zI9gqgf0pA5JJHKSNBKynnMwlaIaJtDQCstI5iUYYkvRewvdoh6zWd7d4C+YrWUNd
	6t/1RyvtSqtdpLYtM4tX8UjCfovo8ldDHPEG5tEfMi6w3VkOPbra5uWwY7n7zjFieYVKh/wuPs4
	ynWlCGLDO1uq7bIdOMLwhbk38Tf59eaOmF5Gosf6y98tbba6zd/8fXtCfIfb+yyfGwBjErU3ytc
	YZ29rwspdqY9Hi52Td6rYmWDfZhfcWg0Gv8Hc0YQQhbl3+1V0yuzJRlLTt/Opz1I+oItx2Gpjsc
	270c9F24H+rJXGCWMB7gcDbOa28as+/+9YTS8uoF4jXth3q/Yecus4rCMdLKBTYzr6/y6kXndB9
	W1ZdKmDotAoNfOV0605tjSfpfT0di5Tp+MxlM=
X-Received: by 2002:a05:6a21:6b8b:b0:3a3:327:c5c8 with SMTP id adf61e73a8af0-3b4cc9b68damr3360003637.0.1780646378037;
        Fri, 05 Jun 2026 00:59:38 -0700 (PDT)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0b315esm6883862a12.26.2026.06.05.00.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 00:59:37 -0700 (PDT)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org
Cc: nick.hu@sifive.com,
	linmin@eswincomputing.com,
	gaohan@iscas.ac.cn,
	me@ziyao.cc
Subject: [PATCH v2 0/2] Fix eic770x warm reset
Date: Fri,  5 Jun 2026 00:57:06 -0700
Message-Id: <20260605075708.96-1-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_005941_699788_0DE0F281 
X-CRM114-Status: UNSURE (   8.16  )
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

Use the CEASE instruction as documented in the SoC datasheet to fix
the warm reset issue observed on my EIC7700/Hifive P550. Refer to
PATCH 2/2 for a more detailed description.

Signed-off-by: Bo Gan <ganboing@gmail.com>
---
Changes in v2:
 - Clear the disableDCacheClockGate bit in EIC770X_CSR_FEAT0
   See more detailed comments in function eic770x_hart_stop

---
Bo Gan (2):
  include: utils/hsm: Add __noreturn attribute for sifive_cease
  platform: generic: eswin: Add eic770x_hsm and fix warm reset issues

 include/sbi_utils/hsm/fdt_hsm_sifive_inst.h |   3 +-
 platform/generic/eswin/eic770x.c            | 118 ++++++++++++++++++--
 platform/generic/eswin/hfp.c                |   4 +-
 platform/generic/include/eswin/eic770x.h    |  20 +++-
 4 files changed, 128 insertions(+), 17 deletions(-)

-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
