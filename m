Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF741606A31A
	for <opensbi@archiver.kernel.org>; Sun, 25 Oct 2026 14:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LXiT3Ze6;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ro70G0wf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=11/gv6NZylkmVTgOgvSrtXq+3F2Nr+vWYA2GVzAfRLY=; b=LXiT3Ze6sIxAxPYEhbOcapnonr
	LDyz6X8KY8cdfsnR8lXt8SvMh7C7WfhW+Rm9H1V2RrBiMO6W4QZZCSJKOWU7rBkOvahKccmFYbZCv
	cha92efu9y7CLi8MwsrcgDp7seqYf0SiJpyuZL3A8R38Y0lOSNRSZnYnKdSj9a1PwD/NWJhpbIXHH
	BUbp8PpvZfo2qI3uvpeWIHQatzkZvZHXWH0Flp72hwQHe2o1fxv53IEka8UPcXyc2X3iLKdPMZYDt
	2hJOH2ihWIal3Fg/CekmDGXueZm7bzXiO8QewXgibU+U5RHsNy2kutBM85JTZSOTPcBHr3+QKL06a
	+FNjTY+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKzbd-000000018sR-2FtF;
	Sun, 25 Oct 2026 14:53:53 +0000
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKzbb-000000018rm-1iUY
	for opensbi@lists.infradead.org;
	Sun, 25 Oct 2026 14:53:53 +0000
Received: by mail-vk1-xa34.google.com with SMTP id 71dfb90a1353d-5c9e7731b34so1716202e0c.2
        for <opensbi@lists.infradead.org>; Sun, 25 Oct 2026 07:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792940030; x=1793544830; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8TNCCFBgea6F63K3kfOUp7XQxeoDrw/uRPH+nrwxBUc=;
        b=Ro70G0wfFbQvoxYYpzOfOQaZd/X4fncp3Yechz1bZ8j81l7UYWplJlZbpWzBcSR26X
         5QDnSCQiK+gOrOS8Ark/ki1qrWE0VApSIpEy2BLe536/PVQv2rCYyHZGHsLUxHjp+l+Q
         oXXzTehtIZ3Pa7m5h1Rfd3rvoHVlhFMdFuQD0a/ElqX2OSv0WvV6TyM3lbGj2vVimqAo
         SShFdy7nUSmybg2HIlMEQ5FNDZEEEk/aWLlb0lWa3jgdh/d57TjvpOIq+jB85ZN313FC
         WhbMLt7v4G+PHvgLZz/noP+g4R2SR2RLyCGgYp3hTvo0iF1mXj5/o1XcqZoUbqBU+fXL
         qmlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792940030; x=1793544830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8TNCCFBgea6F63K3kfOUp7XQxeoDrw/uRPH+nrwxBUc=;
        b=Dg0hwOb9bFkfoYJmaKvz6m/zr9MdknrArdeBQlebLIMN8elPn0pTVfWkMBvVOIahkB
         lKNL2Df+SSqVlXMErhbM8thk/KzmSb7IpAIQioPv8KL3YcXzivJCKII33O7VyhoY9jib
         vXq0ETC5T7fPutZKMI7x+1dY+HznBUjw8wQzA+Qb6T2CGHyK6CwyzIHNSd7GQYmdPxgx
         qmJyM4KjUz8wZwP0avmLjmRSl/IvNzGVDq86kJfzlbsTLBzQ7zvS9wdoujEXru+mKtnw
         97hYfOAV027C7c+UAUghSUlg8wOtMVDvoePp38qfvcp1/XlbbkI+dIqCR6nlXTcZgYtT
         4TdA==
X-Gm-Message-State: AFq9FYI8lbBYWWp2b4OU0Lpbru7X4hChnGdDUSZEclrrkI9Ngj/VlsXB
	Ji+3cYqn5SrWfcJ1DBbBopGG9ossf+oo4Ie6EDWyKxzFLRJ7Tg+81SqU0F/nPA==
X-Gm-Gg: AYBFou2O3uTiSYIuHYdvZuwuGIo/rvI7d1wL+FaJ6+QL7ZMN0F4+uvNGVa20BRGzq+N
	+673U7h3ZfYdPahfxMN8+lCMGJ1PF0DZ5Tv5t8cwVpij5ImEEgj3j7Pvws30nLHZybHOZoVnHN+
	KKicb40qu+JyNjNjqjs8ggU+AqoM8l4j9EgndMWzPKurIaAe21tXtbsXEaWQHusCRLmtxD9grWj
	v31VM9n2Mp/9yh0l9wv6woFntmQ8iw03/bbq5QjMi4nGpb92vxGwOxWCAVoLOuVxzvEUAgDmocn
	g7Fgpx2VpweH8fwDV1gJ7y6kMYLbAkfmqj5e0Kob4fiZ2SxLS6aL94krdJ+n+bY8KAclhXytsIR
	yfVtj8Kmaosjh+Cmud0P1g0Jqb5DGNCcpuFNkADn54gPO5axwnNWRXIpv5nR1oygUzlyf6IdDB1
	TiR3e49eW2QOay8/wKa2wAtaBKkl7CAMS0dsnKD5r0p+p5Jd28lBmTd2CK97+vIy/WuhtswvZk2
	kJ3oKnRV5+8diGvgcbVf9B3aRJsSu1A1+4m0OAkg/vVDxPZRqLXm9cn+gk/0hC2kt0nO+tS5p3L
	yIjrusieiCwGvNkoehtBEqBwHA4TD3caiJNLJl8lGqGD
X-Received: by 2002:a05:6122:e449:b0:5e5:1be6:e12c with SMTP id 71dfb90a1353d-5ec23321cadmr1445241e0c.21.1792940029877;
        Sun, 25 Oct 2026 07:53:49 -0700 (PDT)
Received: from localhost.localdomain ([186.151.100.62])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec234add5dsm5501237e0c.16.2026.10.25.07.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 07:53:49 -0700 (PDT)
From: Sebastian Alba Vives <sebasjosue84@gmail.com>
To: opensbi@lists.infradead.org
Cc: anup.patel@oss.qualcomm.com,
	pengpeng@iscas.ac.cn,
	hppiscas@163.com,
	Sebastian Alba Vives <sebasjosue84@gmail.com>
Subject: [PATCH v2 0/2] lib: sbi_pmu: propagate hardware counter errors
Date: Sun, 25 Oct 2026 08:53:36 -0600
Message-ID: <20261025145338.2569358-1-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_075351_469804_BE30EDE5 
X-CRM114-Status: UNSURE (   7.73  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The two patches Anup asked for in the thread for Pengpeng Hou's
SKIP_MATCH class check. v1 is at

  https://lore.kernel.org/r/20261025062836.2445655-1-sebasjosue84@gmail.com

Changes in v2:
 - patch 1: propagate SBI_EALREADY_STARTED as well, per Anup's review.
   An already running counter may have been configured for a different
   event previously, so the configure must not report success. The
   commit message was reworked around that and the special case is gone.
 - patch 2: unchanged except for the context line that patch 1 touches.
   Picked up Anup's Reviewed-by.

They stay a series because both touch the same if block in
sbi_pmu_ctr_cfg_match() and the second does not apply without the first.

Built clean for rv64 and rv32, PLATFORM=generic, no new warnings.

Sebastian Alba Vives (2):
  lib: sbi_pmu: do not ignore pmu_ctr_start_hw() error in cfg_match
  lib: sbi_pmu: reject out-of-bounds counter index in pmu_ctr_write_hw()

 lib/sbi/sbi_pmu.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
