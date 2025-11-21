Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC36CFC29A
	for <opensbi@archiver.kernel.org>; Fri, 21 Nov 2025 19:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YlyiY75hA4Ot0vPISFpduxvldkhyoerrioxzPr9fUtI=; b=yUR5ImYrx+5z2Z
	iwUIfye2r0G1zl/UF7ze3TEcAaWawx/r8S/UHf/OIPVH4H2hgzLlPxqty+H/RrWKIpKeq75oQQahB
	oumxp3/n92xpBBZmJJ1BcYaI2Hvz/fixjb6Ud+ykDm++n9A2XkCysnmVN02GRLoxRnCQHRQW+02b4
	9Ij6IcRZmj79aos9pPARqt+h+B563564MISU0I77U27ZFlJx6eSoP4reQpUP+2r2mZeWkOiOcA8I8
	K1r9v0CqKUCGXQUAiqZDGBvH1i0SYhiscuVuzX2tslFLPjUnMEDJhpJ/Xmvyg9hGHh99i2rJsohmj
	XZ6UfmV39YN2VVtsKn8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMWxR-00000008ukT-3teb;
	Fri, 21 Nov 2025 19:38:13 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMWxO-00000008ujc-3ntA
	for opensbi@lists.infradead.org;
	Fri, 21 Nov 2025 19:38:12 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-bb2447d11ceso1437799a12.0
        for <opensbi@lists.infradead.org>; Fri, 21 Nov 2025 11:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1763753890; x=1764358690; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Usl7edOP1NMOMdqSsQEGKiShC9Q6cuLW3kidN5Cwo4=;
        b=M3WKF/A851TUkWjPpq6mpdJ1Wl909yUvB3T0z+xNT8nrli2k2AyEi3usDlHETCLUR2
         wRS0cNX/QQizOjV1a63R2+RXy7T4HQQ21ZsqedlgsjOTXUbv0DctUnVKd35lsmvftQ0+
         ff16AbALm4ZwdlhFha7uvru3c/JDE4oLf41ct5g5wJRJUYzPs/kLCLlsmC+Y82EmazOb
         D2LEq6az6Xn1plN5pAArRVBUOcpMMqv5sft8hqdZD3sYy5m9rZzJZTbVVaVjldpMOum+
         yzB3sHW9IdZd00mK4XZSmrDIMK5OGHVyV/F+MDG8s8WCcK9TncWShjYQfg93anFjJkCJ
         EcsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763753890; x=1764358690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Usl7edOP1NMOMdqSsQEGKiShC9Q6cuLW3kidN5Cwo4=;
        b=B0vEmizWuhymaKREVja0lBCEa2+6xqMZ33bpXS4yRw3XFuvkyVTi+vciLVXVFg5trG
         n19YKTFbw8x7NrD6d5bdyrRQZ9foJ+d/VLTjRKeYM2vFa21EB/onlf/eO+e5EulnJWID
         7uEJvtzfHLldPIQcWUlNPY8k/j+0eFDOgJFcN7xvTwqm+jWAajNyLqqJGV1dPFM/ZKuO
         Zd50qCy612uoRPyEZGO32a9NwqfT3kuLAGPH2AL9AfBdjIvfKmxjC7RvbcWu36oPBcAU
         T02VGq+JfippGLf6nyheiBKMu47gze+MWQVTsMIS5wdfL7xAnMizvOQD9Hhv7zyVmQDv
         GaVA==
X-Gm-Message-State: AOJu0Yy7O1pFvDDXIfCvdHN3uWH7DPPa0I8C7d/8BxC3EMrKHFjU35Qb
	X28pSvd9AxAPTm7JpugRMeDzEoGUppaUyCPzgKgeMHNb529sarSzzyHK+Z+xR4oPkXLvvSJnzne
	52JqHtue4FI/8SWidu9pv+fGhLpcEn20IcCvmwJOA0iFDhJHy2mjU9E8v8UomRgWc9kpdMDdCiW
	9nUzc2+TJRRVOEuEBtKgPtwNVV4StlZxNXf92VxxLUzv7Of3/OFRcAupo=
X-Gm-Gg: ASbGnctBjo6fBELxoHMyDfYw8KscG/HCI7Ieek5LuOCjLqWHeWK+aPdfDh1X5NgpIDC
	qLZIHI+sUy5M9kxv0FsWcpHwsNJZyA+tOiqJfSoI33F3la6MPhruzEUTrWyykSGzHIKMWGxsYa1
	t7QK9G+VLwx9xRMRbz/ijcOWjIFTiGSliUyXSS8GL1F22uSamVDgLwlVct7x1UflInJuCjdLhvv
	GgNx28XMqAC38nrNiDWvOmnU9I7ngOMI13Xhi5oS03IRa/vGCKPigQK8KjwTPb1RG4TebqqfEsN
	7R8P2pBvtYnX52Twui8JCQRU9SrE2PxoblHmrVTNbVi8fnsgqy5LDaKQxqk4keUsmdrnY2v8z1L
	X2Czezr+Tbku3Awb758iK/1giV7X3VZTWrdEVPzKG0Mz157wSj2H3tvhfa93VHuPzYSpzOlthBU
	DW+aVLpX56vAGeT16dtQ1g7g3cGDt4bOvT
X-Google-Smtp-Source: AGHT+IH87N3IwRZ5vSEuC3yIsqbDr5kKRBdBBeZ+QtxXiUlnKRapHgjIu1xj1Te67IYQbNYXjqZ31g==
X-Received: by 2002:a05:693c:8096:b0:2a7:343:399c with SMTP id 5a478bee46e88-2a7190f8340mr1015670eec.16.1763753889398;
        Fri, 21 Nov 2025 11:38:09 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a6fc204881sm25505480eec.0.2025.11.21.11.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 11:38:09 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: opensbi@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 0/2] Fix permission checks for S-mode MMIO memregions
Date: Fri, 21 Nov 2025 11:37:50 -0800
Message-ID: <20251121193808.1528050-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_113810_964603_A92B9103 
X-CRM114-Status: UNSURE (   8.29  )
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

This series fixes a bug where, if a driver or platform creates a
memregion covering an MMIO range shared with S-mode, the fdt_fixup code
would erroneously consider the device as inaccessible to S-mode and
disable its DT node. While fixing this bug, I noticed that the RPMI
sysmsi driver has the same problem, so that fix is also included.


Samuel Holland (2):
  lib: sbi_domain: Allow MMIO access to non-MMIO ranges
  lib: utils: Use SBI_DOMAIN_MMIO to check MMIO device permissions

 lib/sbi/sbi_domain.c                  | 6 +++++-
 lib/utils/fdt/fdt_fixup.c             | 2 +-
 lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c | 3 ++-
 3 files changed, 8 insertions(+), 3 deletions(-)

-- 
2.47.2

base-commit: fade4399d2a47a3ff9c5ecd5dd4c3cba7a4eace7
branch: up/memregion-mmio

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
