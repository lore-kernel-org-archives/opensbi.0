Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E99FD5F91
	for <opensbi@archiver.kernel.org>; Wed,  8 Apr 2026 07:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1OKrLgpoHjkd+AQbCmSOSe2LidtlNysifYEywXt2+IY=; b=hZgT0efaQ/cHT1
	0y6Wsi6EAbkFspFnzIYAkVB8nA9HUVQEUOARdHcAqxmMo/C6WL7yp+SQNsHlk2m6Wpy315ZDVUOxI
	+KnT0xYWwKcbsYRFMtqZZD5e6y+pfMpJWaD/13R0LCrrK1gR2gVcu621h9D+SM1Z/m/NoLxM1TH2b
	7eAASRZT6kB/zEMNNGqbIkceo9Bj6P5R614yuGooNij8Bp20vouxlE1lQ/C8C9sg/zjDzTjfoQQYx
	8u9309Tuef8wxcuf4oKAF878AExED2YjoK8KUq31kZRDyE25mLKOGyvuwazLVrB11xrIL+0cGR1im
	NMtpwbHYWk89upqVelew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wANFR-00000008Pn4-0Oxj;
	Wed, 08 Apr 2026 07:22:49 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wANFO-00000008Plp-3GKW
	for opensbi@lists.infradead.org;
	Wed, 08 Apr 2026 07:22:47 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-43b949bf4easo337553f8f.0
        for <opensbi@lists.infradead.org>; Wed, 08 Apr 2026 00:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1775632965; x=1776237765; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1B/IcaaYHVEgyDE929r79UQEAIYqo5kDm0Dmd+IzSHg=;
        b=bhaLfK0RaJTglEz5ZnC/FWrno+3IEJzl3u+wVG7gb6m1jm/O7Xw0tCMlX7Qr+HGG7d
         PyN8lWcnJEoSOad+KH3iJkRahA3gg70DY7TGYpgs1xPPCzHxB9jvV90J2hqnpj6VZedc
         w+vXqRjV1LP/uwrxuCLlN6xKbNzFBGjXDhWEwZf9gaLDFSpdLHdnYi8tTX0hftx5vi3Q
         1ifR9LB3Z3b7w2r8hg9bjS1DEbY3weFUI5An+2NDVQIV9BcWlTCOeNmL/OW6Vm/Nascl
         BpWRpdvQY3rqePkm1QWzPt9w2e7fvutL5I2IIeacvKPvdrZy1/VMHg3HbrtxKDFXFHva
         VxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775632965; x=1776237765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1B/IcaaYHVEgyDE929r79UQEAIYqo5kDm0Dmd+IzSHg=;
        b=H0Rr19GhgUmB1qE3dYLXp5PtogZvCcBkW78oluWvhn6JQzNWurZVSr7nK7di5K1ngX
         9wmM1HSwigfJygz6IXZw0CzUarDBBaCizdS0VL+PIRlofp7fxRGlB8OPTOJehp2NCHJC
         Lu+Re62qpCmm+XLPespRw0NXtSxx8eF/Sv7V/Ebcz5uC1k3vCElWhB/lxG+XPugSzw+D
         BUvpIaVP3PItCpsdD5EmwBVIeuH9sbF05IgG8P80/Nln0QAyCXqwLRcNHpoc177E6W1P
         KF6iXkbeRlRihg2bhDTe3mGketPJDy/PEKburf/FuE7SQLsW9YYpUvqwZGsusrk5NA3e
         Cb+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVz51WJTQeFNbeoORoMjTrkpVMdG2B41+RwJqrp9UapM+Gv0xy6X/dYazO/IIbKCQjgTcw2PICR@lists.infradead.org
X-Gm-Message-State: AOJu0Yx26nARlt2x5CKbZz1hQ5TX/PLtfyq51wzeThW7pFPF0hO+T+tA
	5eMrtWjWbVp3TL4SKMqdAO+ZMX7XHk5cwxLPsxKy8YGuhGaZvLoADzdi/ULg5qSCtWA=
X-Gm-Gg: AeBDiet1OyEvy2DxFofzPjYiykVof7g10vylfY9RddnaSIepMOQsD31mfmszh0RfZx/
	J6IV+XfDFLor6y8cWYLjvgkaDA6Pl/gY0Aehm2eWbJ+4WH6rmTzcZ3G566DxXVvx31tqFS2gr4U
	heHpA8c92j9p55N7dtPzUWju0A7o4MIDuKJrbIFCUppEVUSXgmA1KN8tdNCthMmnd9gcGRXU8S2
	lv3EibQxUsOJl9EBfOkBVBhzBW7FoGRPIofCgqtVUKQKUoOuNjied0QXnxTzDOrwldQGEvmKmWP
	2tVIHfhQqZ0n++g0EafniIHrnWrCbJ4N9uI9BvukFk0IkEQlkGhNeelcDINoxmtj5KJqIDAZXWO
	T9tkV12sDmfijQQKEH3CXMhwYhEys6AKGl7MC/DtLGV4XcpybG5zSOXWxV3tDvdCzjy0z+fb/Wh
	M/V9zsFcyPI0nHJbMLurQ6n+kL/P15+p+m0emf5oMtIGfcA1AmWYoE6y0G6ZTDzNpLgpb/BVf0q
	H1VMA==
X-Received: by 2002:a05:6000:186f:b0:43c:f1da:487d with SMTP id ffacd0b85a97d-43d28f8cd5fmr28426379f8f.2.1775632964787;
        Wed, 08 Apr 2026 00:22:44 -0700 (PDT)
Received: from Dev-EliteBook.Home (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c5419sm66188083f8f.11.2026.04.08.00.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 00:22:44 -0700 (PDT)
From: dave.patel@riscstar.com
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Scott Bambrough <scott@riscstar.com>,
	Robin Randhawa <robin.randhawa@sifive.com>,
	Anup Patel <anup.patel@qti.qualcomm.com>,
	Dave Patel <dave.patel@riscstar.com>,
	Ray Mao <raymond.mao@riscstar.com>,
	Anup Patel <anuppate@qti.qualcomm.com>,
	Dhaval <dhaval@rivosinc.com>,
	Peter Lin <peter.lin@sifive.com>,
	opensbi@lists.infradead.org,
	radim.krcmar@oss.qualcomm.com
Subject: [PATCH v4 0/3] Add eager FP and RISC-V vector context switching support
Date: Wed,  8 Apr 2026 08:21:20 +0100
Message-ID: <20260408072123.7543-1-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_002246_818458_A18BB8D1 
X-CRM114-Status: UNSURE (   8.32  )
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


Hi Samuel, Radim,
                Thank you for taking out time and reviewing the patches,
has been some insightful comment and appreciate your inputs and feedback.

I have covered all your comments, please can you have a look and let me know.

Changes since v3:

Patch 1 :
	-- Added whole registers vs8r/vl8r instead of vse8/vle8 for save/restore.
	   So removed vse/vle to improve security.
	-- I have removed vl/vtype which only save the used registers and instead
	   using vs8r/vl8r.
	-- Init check for vlenb with SBI_MAX_VLENB
	-- Updated license information to match with other source files.
	-- decluttered all the dependencies of vector related dependencies in
	   patch 2 and 3 for eg. adding "({ ... })" is a superior macro wrapper.
Patch 2 :
	-- Vector related changes moved to patch 1.
Patch 3 :
	-- removed random artifacts and removed vector related changes to patch 1.


I have tested this across the 2 s-mode domains doing context switch and both
floating point and vector retains the values across the context.

Thanks and Regards,
Dave

Signed-off-by: Dave Patel <dave.patel@riscstar.com>

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
