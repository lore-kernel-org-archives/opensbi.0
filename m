Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C61DC71155
	for <opensbi@archiver.kernel.org>; Tue, 17 Jun 2025 03:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Wsw7LsvPTEHThzk8xQqbXC5Oan0oTd4eIW9qNe2JiYc=; b=Ev7n8fd6Kj4hNx
	sezTWr2fF+DfBOhAB84RYCTMmFGKcvVkkkugfjfbpTAAXVvvJL/PFySU4aRcNSjC2e7ZP6/Efj8mW
	mOOlQKW2VGnyGB/d4ShZ4cbq6SwRWVPIUnH2M1dwZDjS9n0JQr1W9k9FGs8/9FdEv16U48X46qcph
	OvsPUEJMR0g8P7OuiN6Q6kGJv8NnGlEDGxIdwBR99o3+MHoB1mGY3+aykrnwe45bil8L8SDp5kkiI
	AKLrrthdrRbbSV5Wj+I1YOSJMudi55Q4TCDtpl86BONBEnsXGxs9R12YNjMmUTYQenaYvQBkbECBv
	dcyBshHjRTn0NpxAT6AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRMum-000000065n7-2FKa;
	Tue, 17 Jun 2025 03:23:12 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRMuj-000000065m0-17nf
	for opensbi@lists.infradead.org;
	Tue, 17 Jun 2025 03:23:10 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2353a2bc210so44868805ad.2
        for <opensbi@lists.infradead.org>; Mon, 16 Jun 2025 20:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1750130588; x=1750735388; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fiuof2jx268qo/nzm6Xp012/B+nX2lYKej/l3BpOGzU=;
        b=OLujF5vzjcedBXzZJHj2HcMdcoa/SCUhiyNKlb8xSlyKQgEC6uJ5BEaHNOVjy5JwQp
         bgAXB65AgA5u6Dt9UJ7c0ghUwdzPCKZ7FWL6skHoXJWkm/o6tFNFNlF2NKQ56e9XMmk3
         3nhFpQ4pbaU2IS+ltAkCQ6LCRkdmhrRK04L++nkPWa3shE5c0bIGppRKLSmUNrFgUqHU
         YMNW9zFrc3sMnu2lar2vsHBZ5l2pBz9WgH7z4sSDZE9sp1g17MrtjsuaRtxjmYwcg6Ud
         k4hPaXU3TC9nXsO3vOL/ZOfO6Z/wojFZngseFcSTqAaB6TxltfV4eWVdJkK7po0IGElY
         DgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750130588; x=1750735388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fiuof2jx268qo/nzm6Xp012/B+nX2lYKej/l3BpOGzU=;
        b=u0vNCy3dF0yth5crEfPs0Yi9cMUOVjygr2qbYcECvDXew2mEXApDe6YXwWj78S/GNA
         CprcPt6MK7KGEhqVzaN7jM8iYhXfzs0elnEwVfDYryZmPz6pr5lI9Qnla1AZURD2Q6xI
         6k4hwKQZETm2ab5BMLpLE+sk2DoXSl99MZx2H5R9Op0zRcyf8v6aOn7ID3dc00aApl3e
         C0EKVADi+T1OmYLYLQo4SWNYsblExlHd3RY6QoqoneMIzc8duXDeQGICUpg4ZgT9eoGm
         PxYqLVj4mJ3GgU74sMKRuRw995w+OMzPBwsUzz3F5ofvK3nyV6SNfTN8f3iTNjySerxF
         LERQ==
X-Gm-Message-State: AOJu0Yw5FXw1TtnZLZyR5t/6NA1/+eIwo/as608Q6nfLqehsFDOC/6iT
	o5SImBo5wOPruYAP0qCtQjq3V+Fz3nbT4NYtzeQfYgyt9IW/ly8d+wiD9mqQoe2FOdCwWdshITj
	1erxl/ypHbIaCtJ9vvZeQG5y/zRwcZN6X64OQ9dVbOqzBbonWywtdpw4z1QGUuWRjOaN4+nClBu
	D7NYtx12PvfMiud17KG3OviNAEwE2N27oO92GZk3f4gy1brGMuvAJATp4=
X-Gm-Gg: ASbGnctOp0aWhOyhAgkswe249KwHPK62ZZ+Jv35SvFexNgcnA4hFbkbE2qCufhTGJRa
	YaIBei0qHVz4g3ZDSfuYEoPsdffvZ72Y7cC3lNxY3s7oHsMdOTYLnx2ThZaaqEJtDpoOAA8FM/Q
	W5+gI4Di/g/d6l+QV2h+3PgUezCANBydTfUb41n5Ir2JnA6NEObjSx5o3MH8axmtwkyjzjebxAv
	v0kJRNCZeyPJNdhYiixhZrZQlojuyMHoi51W/sfJk0U2cvNSi7tLEN314Jj/ttJQLL/xOUMGU5j
	I/JF/aYpij8F/yM3rVXaGq2iITdQE0sQW4hkyva9XZoW8k4gMkLYHkoQzXp7jXrPHqElHN6klj8
	fUPfoOWb5
X-Google-Smtp-Source: AGHT+IGru31Ic8lDoOTrQn17LeRQ/nEaTSQwf1g+H2uUixdP+HE4YgrGpzLiXAxprkEuyE4x89eQCw==
X-Received: by 2002:a17:902:7d81:b0:236:7079:fb0e with SMTP id d9443c01a7336-2367079fd64mr109305905ad.36.1750130587776;
        Mon, 16 Jun 2025 20:23:07 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31429aae8eesm244821a91.40.2025.06.16.20.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 20:23:07 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: opensbi@lists.infradead.org
Subject: [PATCH 0/3] Heap Enhancements
Date: Mon, 16 Jun 2025 20:21:34 -0700
Message-ID: <20250617032306.1494528-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_202309_342780_CC8A4D3C 
X-CRM114-Status: UNSURE (   6.28  )
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

This series fixes an issue observed where allocations can fail, even
when there is sufficient free space in the heap, because the heap runs
out of list nodes. A follow-up commit simplifies the code and helps to
keep the free space list sorted by address.


Samuel Holland (3):
  lib: sbi_list: Add a helper for reverse list iteration
  lib: sbi_heap: Allocate list nodes dynamically
  lib: sbi_heap: Simplify allocation algorithm

 include/sbi/sbi_list.h |  11 ++++
 lib/sbi/sbi_heap.c     | 129 +++++++++++++++++++++--------------------
 2 files changed, 77 insertions(+), 63 deletions(-)

-- 
2.47.2

base-commit: 324021423d063702a5cb2d4207a3a9c4e999549f
branch: up/heap-fix

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
