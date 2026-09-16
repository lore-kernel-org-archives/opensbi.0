Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8331C88E7F
	for <opensbi@archiver.kernel.org>; Wed, 16 Sep 2026 18:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kci7DQy5rzN/nZS4j0dQyl/5X3JfIejKk4oE18G0ioQ=; b=kPXGbqxEtwwYDU
	sunss1XYnFwfmr7q7oDxNEVql3OEcBHG0lk7KBJWKcMRT+bET97AA3dFIO+qKxLl6xswcAjtViKlk
	QxoJzjRtWUoPdRNijUfbjv7tsCjCTrcQsGvXcD+XJisiMczhY+2wkkrKxZaSOZIp1ko1fHgOh5/bH
	nhh3rPAfCH6nzY763P9yiT3RDoUIqAl6ZuNw7oSZOW3wsds2r2oYZOXYa74NtcuJoAX7BlDV6AeX0
	Ip4AWy2EddbMPref/c7QTJV+dIyl6qRFCkRKTbFGhLa6eGYjXe76udzTBqixEkNudPmH2/g5tf+t6
	XNKOH1Yc7Cq5R0ONxBOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6uGw-00000009wlz-147t;
	Wed, 16 Sep 2026 18:22:18 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6uGt-00000009wld-3WGZ
	for opensbi@lists.infradead.org;
	Wed, 16 Sep 2026 18:22:16 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-39d67a9ae5bso161602a91.0
        for <opensbi@lists.infradead.org>; Wed, 16 Sep 2026 11:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1789582935; x=1790187735; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6qdYqqJqNal0UmKB0VUxb+7O27e+qKE/VD3h6XknRs0=;
        b=Te94JpCPcK5go35AIEaEiPDg2OlrzSbXdbdJtfvf5pCgM0pWUD4xdQLfFkbLT/NkVo
         v4Bm7/Mlun86FQ8XzlNnWpypxYaNMDxVZ/9KxXrG0lBHQn4+FSSymi7eMkLPuBySoieF
         hAh1cSInn1PHxTj+DUS2P4Uf8B+h+KLbq2dNwE6Tqpaj8zapPfzSMzCjhuY7WjYn8wYx
         hKYIHNnNSTIh7EwV1DGdoUBLANIk/xNCQrxO5uUo6mRragSDc63l5dEn9IjyxQB+aT/A
         1WN9nAir+afOduWeLv3nDtCxN0BconcvkrYwzvxnAAniNX5I6IYhaYWjosmpZf/gaomA
         T4Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789582935; x=1790187735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6qdYqqJqNal0UmKB0VUxb+7O27e+qKE/VD3h6XknRs0=;
        b=fqMqBshzWv6gx3MzwXxLLzdXG2KR46/pWQcjp+BewwnDMktNnIcsbj+STDl6jSJ1nu
         GbgXp6uFwBPl+rLjM7VulQgRLrR4viiSyDODB3fJzE1cdmuqZgHWZzIeFcD7HvpsH8fo
         T3fAOyTmIloz7+yixh99OvQHcq1yU09yHPGUTw3qXmDyv2L4S0KLM0P4rMG3pyWNoOxZ
         qjaQPfTYiuAt7RJcrfiTUk1EfOnTHgE9KEFAgkLYYVkquBwk+WhLdhXVVHhy3XVYbzKw
         bhhLu5BFRgRF130vJjmpwXW8cNpMMjFKgnJMVOAjXkBk7oe1amkxuCCUXVTP6ohE9l7E
         l+4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwc1gaiiaHObcqqaWl9RvIopnpij15dtYXgiQhYKy8vo6DZaMdgVP8IOjRwsYxwg0EQX1BnKWm0@lists.infradead.org
X-Gm-Message-State: AFuF++ltct1wghKgNqWxPioJsnecC+p7eIQFCHNgMaHxZ/mOctBqhP22
	NIgpyzmitPW13VNKketDiiKmDNDYD+NDy9GPcmzmDjqtbReMqMepBVA/GTwd7a5ol9w=
X-Gm-Gg: AYBFou2NdiXE9cyserGjDJFzVP145t2/IQU2nOLynHjvTnUHpQzlRCqw6dFiSupmfaA
	9cpmNHNZLfn76kGjv0CJdFzSax+gnZ5v/RTg9Pk04yvKa+1QDWSldhjTjP5lM6/bfFoS3i8C/9K
	cXRotZdQzWn1hMoRlPqbWULsh0h2C/HA1fE8cYUVjxUU2p0P+zVOGjbtHviawREEFEHMI4isjXW
	d6LcivgJ/pY279fJXE6amhDt1LMDfduTFwfqm6ACZAP3TQwDDOmiYgfV9A84M9ITj3NIrDLx5x5
	ugcGzzaN2uQ0ocmZGGYYrPTInYrQvpxCWa1GTXjdhlTx1ylMBRUap9oqZBUvqkhhoO9EkWAUknv
	L5eXpM3ZaJ0XGTa1zNABQWIIprOewRSCSYABgNC64EmW1eFFZg87alt5V/irM2kadKiI76dwqr+
	SQR3+qdPBKRZyRD93exeVzWgIeZsq57Vlq8YIx6fyKWZe4AHgc8x28kmCyHmBVoSNgP/3Lvoit7
	qSIYG4TAUHlEDWrIimcvAOl6Sk=
X-Received: by 2002:a17:90b:2544:b0:39e:3728:3b11 with SMTP id 98e67ed59e1d1-39e37284837mr492624a91.3.1789582934962;
        Wed, 16 Sep 2026 11:22:14 -0700 (PDT)
Received: from ausc-rvsw-c-02.tail89d63.ts.net ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c011378f1sm6856231eec.29.2026.09.16.11.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 11:22:14 -0700 (PDT)
From: Evgeny Voevodin <evvoevod@tenstorrent.com>
To: Nia Su <nia.su@sifive.com>
Cc: Evgeny Voevodin <evvoevod@tenstorrent.com>,
	opensbi@lists.infradead.org,
	Nylon Chen <nylon.chen@sifive.com>,
	Nick Hu <nick.hu@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v3 3/3] lib: sbi: allow NULL smrnmi_handlers_init and report init mode at boot
Date: Wed, 16 Sep 2026 18:21:58 +0000
Message-ID: <20260916182159.107806-1-evvoevod@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915-smrnmi-context-restore-v3-3-e9dd31152515@sifive.com>
References: <20260915-smrnmi-context-restore-v3-0-e9dd31152515@sifive.com> <20260915-smrnmi-context-restore-v3-3-e9dd31152515@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_112215_870054_1A5625F8 
X-CRM114-Status: UNSURE (   3.88  )
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

Reviewed-by: Evgeny Voevodin <evvoevod@tenstorrent.com>

  Thanks,
  Evgeny

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
