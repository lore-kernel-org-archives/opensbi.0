Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD42ACD8CAD
	for <opensbi@archiver.kernel.org>; Mon,  8 Jun 2026 21:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=glz3QnRdG/lA4VdsTRuDQIe9KBQm1uIHzt21KTg9OtI=; b=pEfU9Tbr7/Pgdx
	NmR65KhDHwhLNWvVxFfl2OKxM6QpkU064Yva2zQsvwP6oSHPZS9Vp4fY08qPHammnO6qDYIYeeMc9
	evhhl1/cDJNQrpkax5RBwQGel045Za8D/JZhDLvMRsGw37KCGtZOxIKH75lr1svpiNVo/BJQ359bn
	7ybIe2Dg9TQzlg+JbrUE4QbtonP+HzJnVoqeP+b1f8v9RhDR3YGx+aI6LpjrJqqW7XhGN3XjlkX9e
	HB1h6BVGQ1H8GlexDSElYEmjHevH+2PDTvh5dCpMJ0loaRKobrDhvbtUe6tk6wqQoeoa/zaPkMXKk
	OD66bjCR7QQf1rSPolOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWhNb-00000004Q6H-3mTR;
	Mon, 08 Jun 2026 21:19:31 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWhNY-00000004Q4R-3OWQ
	for opensbi@lists.infradead.org;
	Mon, 08 Jun 2026 21:19:30 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2c0c3546924so31454135ad.3
        for <opensbi@lists.infradead.org>; Mon, 08 Jun 2026 14:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780953567; x=1781558367; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EfuKv6COcoSQuuhQ43q2QtH6GwIH8JyG4GJpJSLwVTs=;
        b=EEZXmZLs2pyj7qZTYee2VaTRBB7IFOrc06vGQcktV6o2oO7d4E8g1OF4YjxC3bNDoj
         IMpHECYOTyJwsbJXFDfIUa1+eezj1T5KpjvTX/RH2UXr4SwQcT5vJHyGrBsIId5J6/X2
         MQV1NJJjxW00/yc+Ml8r23skDz9Hw+tLYZPKIoURhKyTzQM2G4IRTREuKhpNmep41xoC
         t1hPF0T58I1+GbLC+LuWBMYuH2Uppxb0+znBAl1AG9JWU32m9f3hYoEBIoljHOPGIjqe
         uus1rcrS/4nliQEzjTQ3fH2WQ3zYCz5RC8Qyvl7MU0SpZs8NAi+wGPbsfKmF3QxeXa0F
         XhRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780953567; x=1781558367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EfuKv6COcoSQuuhQ43q2QtH6GwIH8JyG4GJpJSLwVTs=;
        b=sScCpg/inpWvrk+gVNEMg/8eQ7Z7PPuQhqx03G9UWsS+LCazxPEcJnigG1ta1AQjfZ
         XrjjXZiA8LBDZYTb7eqv++oZfEacsb/sqeHfTF7C172pQTQkGYSme9fv8+MDH/n4yWrr
         QyL0e/uOySjTWrMutB5zU22zKnxLkbF+YOuB2pZZcGqi6o3FBaoyTjHD8KTlzPFr3w7N
         45QoBQcb7fywdhtX7Bix56oKs1k1GljIpUG6M15GKTzZaiL6HMk4at+J611bV2qFTnQv
         DfcLH5ecy1Ew2NqwpmJcCpmTPSjedSLVgA8Q/QHCQHJMQ7QWxeK4TKgRLilRdHjqmm+8
         RX+g==
X-Gm-Message-State: AOJu0YyO8PfmV2dxprESkFGUfL7wSUT6rHl59kU0lumhT24i8NN756tm
	NUSht2JE4/1WIMwP/s1L2UoYv2TM3ZUVjY6nbDoVnmrQpPxuBgRhisLUaUHVRA==
X-Gm-Gg: Acq92OHEmH2Y9WXvQwg9v7tg7YZ5Z/kEIBCL4PQHFbpvWCTTeYjgokGSBF3aVWkFK9J
	XzjgiW5TFOQ1Y4nMYaMQ6Man9KqB8Amk9MRAdMoBCReJZYTy9DTXlNOSobS3FzkcE/jcLeZQoRj
	0oYqlG7/TetTQcJ4zD4/3ilKV9fNWdlzL1QSwuxzSiVnxarnWxyqNfETvXFQy5OKQaWj5ElKfux
	ZBtN+vzT96iJFVw1gyiI27Q9SrzbVxyIPzPYGNtdI2ypTKmFagXoRfui7F9ouCM/C+ke+xrng3L
	CAvlFv/OkOwyACg6hkKQex5MrTA9Cfaqz9uDud/An0mQMaDMXgk8fR/vBycHndzl1Nt6SmSUp5n
	rQnyt/zdNYUvcJhmhY6Sqm/kzqOJs0cR0Jnj7r+jmbOcT1J6UgLQOJv65w8W3zXIgVBVqJF5+2P
	5+KJykeJQzRofHNQf2dwgEdkIyNWzahusm7YQ=
X-Received: by 2002:a17:903:2450:b0:2be:fefc:d5b9 with SMTP id d9443c01a7336-2c1e80f9eaemr195793975ad.5.1780953567620;
        Mon, 08 Jun 2026 14:19:27 -0700 (PDT)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa00b3sm182789005ad.32.2026.06.08.14.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 14:19:27 -0700 (PDT)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org,
	wangruikang@iscas.ac.cn,
	dramforever@live.com,
	andrew.jones@oss.qualcomm.com
Cc: cleger@rivosinc.com,
	pjw@kernel.org,
	asrinivasan@oss.tenstorrent.com
Subject: [PATCH 0/4] Fixes for vector misaligned load/store handlers
Date: Mon,  8 Jun 2026 14:16:59 -0700
Message-Id: <20260608211703.571-1-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_141928_848107_20AE263D 
X-CRM114-Status: UNSURE (   7.81  )
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

Re-visit the vector misaligned load/store handlers and fix:

a. Avoid stack overflow by using a small sliding mask[] buffer,
   thus optimizes stack usage *IMPORTANT* (correctness). There's no-
   longer a need to have a pre-defined vlen maximum, and worry about
   whether the stack can hold the mask[] variable.

b. Maintain the value of vstart when redirecting uptrap. (optmization)
   Avoids doing duplicate work when the instruction gets restarted.

c. Explicitly set VS dirty in (V)SSTATUS. (correctness), VS in
   VSSTATUS must be set dirty if coming from V=1.

d. Zero out tinst in uptrap if not guest-page fault (correctness).

This is a follow up patch to [1] and should be applied on top.
[1] https://lore.kernel.org/opensbi/CAEev2e_Vg1mMP4mOKanFX_EGeUzpczRcWW++vBBuN1CfyM0BJw@mail.gmail.com/T/#t

Bo Gan (4):
  lib: sbi: cosmetic changes to reduce indentation
  lib: sbi: Rework and split sbi_misaligned(_v)_tinst_fixup
  lib: sbi: Add variable-length unprivilege access functions
  lib: sbi: Rework misaligned vector load/store

 include/sbi/sbi_trap_ldst.h |   3 -
 include/sbi/sbi_unpriv.h    |  16 +++
 include/sbi/sbi_vector.h    |   6 ++
 lib/sbi/sbi_trap_ldst.c     |  66 +++++++-----
 lib/sbi/sbi_trap_v_ldst.c   | 198 +++++++++++++++++++++++-------------
 lib/sbi/sbi_unpriv.c        |  88 ++++++++++++++--
 6 files changed, 269 insertions(+), 108 deletions(-)

-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
