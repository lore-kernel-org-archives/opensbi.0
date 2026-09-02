Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E044FC61DD6
	for <opensbi@archiver.kernel.org>; Wed,  2 Sep 2026 17:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UcHuxvE6qsYjOHRk3shHx0Qi2zPA76xjCcumDxhz3KU=; b=q0IXqSoq26/kab
	b95xkGKLCCNyN7PsSNVxE+HDcN1IphFDEOC7Hp4H6KrKQ7LIn/0qa/q7NcgG81D6ukm49fB9muTjL
	lbsWxRCdYZhbiqJP30vQMHlOarr+WI3fybzMar1ZChhs8s2yLtrkJMc9ekuhUfgNdG475/S3W+0W3
	5+7KIGHMpF+HxQaUor+i3BQad+onUyjv6avazmBlQlVgdIBAGoFIFLiDbGeh6IixdESFEDI+d3gVW
	eKs5ZL47VdK7j/RPDu3u4Zf+2rt4fCy16CtEQguB5wQip07nKKp3rXpdd6yI7viwAvSPGNtJ7GwVx
	A3o80RQ6+n9B17ECQfOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1oq6-0000000FRze-3M3p;
	Wed, 02 Sep 2026 17:33:34 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1oq4-0000000FRya-29Ge
	for opensbi@lists.infradead.org;
	Wed, 02 Sep 2026 17:33:33 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-46a43dd41d0so163607fac.2
        for <opensbi@lists.infradead.org>; Wed, 02 Sep 2026 10:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1788370411; x=1788975211; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ovYpsmTbPcRBUnGUUtwVYcJfzuX4tkxVaShFo5ZPoOw=;
        b=cIMHiCkOigF/VOzaxjKIqh3ARkLeexDdsCyK/taGn793r4mpIsx/RhVUkb4tZ5Pg43
         +CR6WeMv8TrQPG4X4athyQbA27lGzT/tymjnEGpf8E4/uRZBGmCkOAZEzWGf/Lf5skqs
         lVHPKOfUKVHgJMjkqGild4mzVQ+4FbGGA5J9pR0rHkRBG9H0EZIj0wIogNvGxhWgBsUk
         s9sG7wJG0gg/Zg2LeqMM04V5nqp9KGPm5Ahh3AF3+D2SOcNQZUmoOeOeo7NG3XwMkvdS
         WJfladRpFEyenGmrCRXjdFVhLT+/RGJAYLr3OGVSxN/A9jztzWgh+yd9H2DkxC6Wlx3L
         X3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788370411; x=1788975211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ovYpsmTbPcRBUnGUUtwVYcJfzuX4tkxVaShFo5ZPoOw=;
        b=SgpnlYHJGKpFr4rKfcXKviESJ7sTpH/LoPY8ErRt38LZ7P+/MDbmAPl4tGtfFStWoA
         tbRTQA1Al+svhVOG3ySgG3+uglwjM9WsT+aWxdJKLUuFHZauBWIfES6+WiOS2c+2xfBC
         mbq2beycjT8LhnSEUjtqM/d7P/LVhTuJncyL6nAjKKUnZVbE5XdwhYIgvCWzA8sRrlNJ
         65q6JMXSB55XLkFcMD86u2UXBDAOLgP5yC7lcQ6RZHoNnUSmRYy0I7w52+DNMam/yHs4
         +hbMxiQI5utMKZhJBFLESKWbL9fGRd0vxq2JymifpUrYTT81eaPDsrZzwqT1CXLpFRZE
         xKfw==
X-Forwarded-Encrypted: i=1; AHgh+RqWpkEJlSieLTli68LpUl946hBjqTlOc9DENtekkCpjSkhmMXmrQwsJtAun2BfuN3VGjHJ49LZc@lists.infradead.org
X-Gm-Message-State: AFuF++m/WteJdtI1Ilz9Vj/HY5et6Je80U4WEJgOO23PFG6f3kaIupdQ
	n9cUzAQYKH3aw+OKK1XO28yTF7WZdq/Bznjhx3RoDStVS436G+diPrZhoQIdUk49/Yg=
X-Gm-Gg: AR+sD13XrKexPV7OKNSSvT0eaw3yXteEtC6CF9EOaoAaew5QA/RZgCZycpY1HseZ1Po
	VgrdKfmXOMRZxpxzDfNd4L71Mi2L5VwDoAhiY1l/hbQVIlwL/gSVkt5V/CrOtEdE6zzayQ1pmtZ
	IYuKHTWwQtktyEtDqJ3S7E6cluckq5ORa1UT00hrlqPasQu941UXoZi3UDwqLY5y1XlUk//CWts
	2+WglL3/iywrYAKfmV4+/enWVRWiJZnpGNeIczoMtejFr/Xia6koLsUksAicS3K7zBqZSRVTJGZ
	jz+F1l2MWnxEvS/K8tSrvd/aEPbZBnVAh6IWeUtnCjLro/LBafN8AjLGnmd2jPpFUcyEHTckvFC
	taPH1rUyUXt3/e2OX8+FGwAI/gIMFMBex13e0Tt6dRSmPzuJK97i1bxlpUjYTbd+z1DP77niDDI
	iNLPvO1Mo2trPW/Zm8ryO0nWSO8jWI28ijVfAjIA+zD9ue4kTe+yzVSQTg4T5aG/EIwVaq3h6mo
	5x7WE+fBhVLHFLP
X-Received: by 2002:a05:6808:f0b:b0:4b5:787f:95b3 with SMTP id 5614622812f47-4b6c27ec5fbmr2894780b6e.6.1788370410779;
        Wed, 02 Sep 2026 10:33:30 -0700 (PDT)
Received: from ausc-rvsw-c-02.tail89d63.ts.net ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-46f3292c435sm4976486fac.11.2026.09.02.10.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 10:33:30 -0700 (PDT)
From: Evgeny Voevodin <evvoevod@tenstorrent.com>
To: Nia Su <nia.su@sifive.com>
Cc: Evgeny Voevodin <evvoevod@tenstorrent.com>,
	opensbi@lists.infradead.org,
	Nylon Chen <nylon.chen@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Nick Hu <nick.hu@sifive.com>
Subject: Re: [PATCH 0/2] lib: sbi: Fix Smrnmi/RNMI trap handling issues
Date: Wed,  2 Sep 2026 17:33:10 +0000
Message-ID: <20260902173312.3364721-1-evvoevod@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CACpYXwCiciQzQo99=f=_wioYb3kHHTZkQm_UAi6FCXYpbJmeog@mail.gmail.com>
References: <20260827-rnmi-trap-fixes-v1-0-df371cf92301@sifive.com> <CACpYXwCiciQzQo99=f=_wioYb3kHHTZkQm_UAi6FCXYpbJmeog@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_103332_548987_29129E79 
X-CRM114-Status: UNSURE (   6.77  )
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

Just to be clear about the split - my suggestion was to keep the current void
return type of ops->smrnmi_handlers_init in patch 1 and change it to int in a
separate patch, so that a platform can indicate that Smrnmi handlers
initialization went wrong. This will make backporting to v1.9 easier if needed.
Is this aligned with what you were going to proceed with?

  Thanks,
  Evgeny

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
