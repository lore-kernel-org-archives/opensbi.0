Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713E7C88E4D
	for <opensbi@archiver.kernel.org>; Fri, 11 Sep 2026 17:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MoD78Y8wOKaUtR/M9rqxbbWabodwTUxfPEInBdmT2XM=; b=mqX4X81UrOHX4r
	jClwLbBD5V4js+eZN93SerIAQhLSmuYeXKTko6TPPjhHZ+CKpFo9HKEJLDu4oDnU+vNK/2KcdASpz
	2Ef2Dz6yi9Vugos6gsvndJZRLOvd5XXIbfA7Os5ARhXQ447D7SrIE4b5UUwCvdzA33xuh5MJj1cmB
	TPJZ0NLB/jHclFwZ4FDXwsLsKsUa10VRZFAeQz5ppt92ULdeJdN3Stn/gO4c/sre5ILBGxC8CqnYF
	XwArPaYeYFa01lKU7CmOACxQyBwiSaSX2qIVB2c0cGKVCWAZF6ayUfC40ln+ERCqgaCTPpmdLNsXA
	CmK/EC2HnMpDRO3xXjLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x54uR-0000000HK7C-1ce8;
	Fri, 11 Sep 2026 17:19:31 +0000
Received: from mail-pz2-x1a.google.com ([2607:f8b0:4864:3b::1a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x54uP-0000000HK6r-1bH6
	for opensbi@lists.infradead.org;
	Fri, 11 Sep 2026 17:19:30 +0000
Received: by mail-pz2-x1a.google.com with SMTP id 41be03b00d2f7-cc1ab16a9ceso22606a12.2
        for <opensbi@lists.infradead.org>; Fri, 11 Sep 2026 10:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1789147168; x=1789751968; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qWdn52XrPNdCmqenXNRBT7K8BpYG8+wemM4Y07OewYI=;
        b=HKuURc/GUfzMPGPpyBOCOrNHMIFy11qtlntz1LOO36ROgEhoCxqxEJHUNJLc0ggw2G
         ESX5DdirzqjY8BW1FcB2SLCO9TUZI5+rJWBSMiUIbxAVHZzmAdTtsqGT4kEGdlpZ82rh
         /249xeI/FoJ8Xji9xdsbQGfGpUALVeGax0tkMXYMdyosJXbNL2to1V3iqeuesV7pZvrS
         JesxWq4JPmL1M2GJqKzINh8fnzvSoXHZ0IExBOOhCA08qflgvmaBFxwOJI16AHnAHawd
         J+mYoYL5Qt8PBYlTr0n8+vHQTNF76aGu5V/OL2QSSqEr1PhyVwMVbu82TqoZNXNQFEdB
         VoDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789147168; x=1789751968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qWdn52XrPNdCmqenXNRBT7K8BpYG8+wemM4Y07OewYI=;
        b=N7X1j6O62ZhIy8U4cGbNiVHJANcduAcLQqZfgjQC+qKTNnfI+J434kM9uSUwEWyFY6
         Fr8ALHabvOXq2nkVJ2Rx/9bZhbuFuJExROLNjlL75nrEavLvGeoDCDUyvbaNfikMe2IS
         jtj4AQpH8EtUZWmPyysArytFc8FYKErlR543FdVT6BLu9QwdhTT4ZFsHyW/YD5AZ23By
         rWL04814ee+PTqjE5N7gwjmo5Yi8MohP6iq5cioJRZPySpcvrg2GwZJyoQmDcovjtUlt
         INtcKyLsuBqN/8aHDKYopGlXhFG+cokWfZpMyoKw1pZM/BsXM0m5dRcL7K19mOswrD85
         xvbw==
X-Forwarded-Encrypted: i=1; AKwUvBzTejt3/w060wxZsbh5F4e+/bC3xYaZ6Xpq7hg5PmPov3yUeH50hlQfDn9s9J070tLy022gQcaR@lists.infradead.org
X-Gm-Message-State: AFuF++m08NNhALYE73SKsphgI/0v3zsNafKvZzj1tg3kDrcO5naenx/i
	hOYaCYMEcJiUXNyLxVq4/fEJHvKOkwm6YDRYIqsCnuXmrpqvjv2FaWoq39FV+qEJ55c=
X-Gm-Gg: AYBFou2W/asKAT76vLKO0opy3r6mxxFEoOiAMAjDhyeL8jOYtpfdaxgYPi4l5MCEa9i
	PspCSVFS2jz2KAiKDj/RDfyS1xZ60XM3b3Zhw3zQQnU9KbHrtXMuyTIqcjccT8J/VW0CJR5Hk5e
	smTsxBiGB1q3YaVNletI/0Fn56gmQPBRI4SXyZ7W4gVFNdMssgBoYvQ7TXVtPa6hF7gzi1AYAx5
	xmYxAm0Xc4mCnYmnFmDuMnZWVbTiCb1dfIiXgxTmMlDcgIVTHVtJz4UyItyKs1Ib5VbuwHqCIMJ
	CgJoMj4A7CZJvFRWuNqqEqt/N0fRxx6kCTFHOoHnLZ6Up2LqE4CollBQp1YsqOMiRnp+lTV2+Au
	ju7oILScl/sAILetVMLQzV8H//8FaTiyw9wNNDztzNtBsP1GU2kcUnIAuEw2VSXATx8pfpBav3L
	6/7kj8JSjndEWWtiJiYr0ekLcie3ocT3V4uWwKZJKYyW9R2KkMXCHcXzaC5LEGcozTzDaDCUl/P
	MH8vAZ4jvIwhQuDVzVqPZwMSz8=
X-Received: by 2002:a17:90b:4c88:b0:390:af7c:fe5e with SMTP id 98e67ed59e1d1-39d9bdaadb4mr5768282a91.2.1789147168379;
        Fri, 11 Sep 2026 10:19:28 -0700 (PDT)
Received: from ausc-rvsw-c-02.tail89d63.ts.net ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f7390csm7906781eec.26.2026.09.11.10.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 10:19:27 -0700 (PDT)
From: Evgeny Voevodin <evvoevod@tenstorrent.com>
To: Nia Su <nia.su@sifive.com>
Cc: Evgeny Voevodin <evvoevod@tenstorrent.com>,
	opensbi@lists.infradead.org,
	Nylon Chen <nylon.chen@sifive.com>,
	Nick Hu <nick.hu@sifive.com>,
	Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH 0/2] lib: sbi: Fix stale trap_context/prev_context linking
Date: Fri, 11 Sep 2026 17:19:12 +0000
Message-ID: <20260911171913.18608-1-evvoevod@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CACpYXwBhoa9uogkNc6GDOrDTStqiiR-JDLZ3kD1PtyFZ610vDw@mail.gmail.com>
References: <20260904-trap-context-fix-v1-0-6bf7fa45d5f1@sifive.com> <20260909193431.5544-1-evvoevod@tenstorrent.com> <CACpYXwBhoa9uogkNc6GDOrDTStqiiR-JDLZ3kD1PtyFZ610vDw@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_101929_418409_659778FF 
X-CRM114-Status: UNSURE (   8.50  )
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

> Regarding the sbi_memcpy()/NULL-check issue, I grepped the current tree,
> but sbi_domain_context_enter/exit() have no callers here, so I couldn't
> connect it to a concrete bug in this series. Did you have a specific caller
> or path in mind? If so, I can adjust it accordingly.

You're right, the path is not reachable currently so maybe not worth to
mention in the comment then.

> Other than this point, everything else looks good. I'll include them in v2.

Ok, sounds good to me.

  Thanks,
  Evgeny

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
