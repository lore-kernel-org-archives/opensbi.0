Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731CAC88E50
	for <opensbi@archiver.kernel.org>; Mon, 14 Sep 2026 08:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IG1grccqqvh8mtUJ7cS3EW9E26djE+oK/Kt8dg325FA=; b=EEV18Nnpgx7F4Q
	WwH5dlGcqMI5BxkjKApDmYYm8q0bWw24YxxRfiC1AMpQo9wc3TYZtwQiboCcUCegEPZRTcliCeKxf
	imt1G6K+usFZQ90NPiEVneJ1Cnv+a/NWlrnRgOGhdE/swlqe52l7X6LgjFLAxqFRKrTvwYVWhfqlj
	ffFFzaxyE+IwbgrJVqDN9xUGIc2LHZ9WJPFY7+NoW8YGB0M2RpRd9A98bTCBXM/U2GbPyEh/kPzC0
	/2liPtbDQbnL/njzkzkl3WpQPKHFjewoGQ1bhYORPyqo/RAcqZnAKNt7QTpPRxFiM+a01HXxDzeJX
	DzfHzlhJkBEKvsTZBn+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62E0-00000002m8i-3cGo;
	Mon, 14 Sep 2026 08:39:40 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62Dx-00000002m6a-3yxK
	for opensbi@lists.infradead.org;
	Mon, 14 Sep 2026 08:39:39 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747f01363so11992315ad.2
        for <opensbi@lists.infradead.org>; Mon, 14 Sep 2026 01:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1789375177; x=1789979977; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0yZ4rj2HwupoTFNsJXwhT0qGtaGIsy3xhePLW7yiN2c=;
        b=Jj+z0bbdsqLAgVBMvvtC2CAYM1RUgy8k+k2h+wR50QArk9qlcpltkVLNc2JSwtZyNI
         kQqL0JjpnXJE4TgasKKdAlskVGUNrlrNcOA9nyWkiQTNPbo6aZTWfA5w2UYT3JJnEcpK
         e0gkDZESYyQFi5Nr/6wNyZ5GMdiITLr/LyjSynIbCmnGXBum4FiMpq3BhWZyls4ItdMW
         qStQh795LOfo+/xG956T4rOX77PmNSDsxqTiuOIM5YXt1aEAk/gdOrKn1sPRlTRcCpTo
         DdtgQ5s0+BKW/4eEWpmxf4JZkQ4XeRjcf+L3QauwKC4jXRoZ/ItewieXDoFU6IWrIWSO
         XUJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789375177; x=1789979977;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0yZ4rj2HwupoTFNsJXwhT0qGtaGIsy3xhePLW7yiN2c=;
        b=ELiW3Z6kqRjEaFZ+Wyfp3LkEO61QWIIBZX49sODPTJRL8NXK1cFAK2fzAlJR53Wj9A
         QgunUDu3cEFiRciKPwh+m/5upE5zu9gFKoQlXwVUXPRX4ReBnPr+g3LszJIggfmP2Xb4
         sycs0kdzF52hkP6yPYwW1LjRPcC/owiN5YQHMbFHGDMNHUky/N9Cw4YGmzL4DrBJHazF
         jzQHPzVoAWi/UyHKQkr4pgefT+1csoqHSgUg6/+wPdpNVbCR1v1NVRa77HPcsXsq/A2V
         StJoKAHY4H7CP+wlL4iQfRYQ7d+mS7U/lmcYtP1e2t7A4ThxzpOEBz8j3KGTmw7iIPqJ
         hQ1w==
X-Gm-Message-State: AFuF++nz4kwQC59V9tLy5yrUfNgOsdAHcTi6wZrZ6pyKqptlmeIkgl5u
	NAhLli7flyPS2p9pgwUvgs7wKEZHLju+dOqWXF3uHP7jI+YvBsJwoO51fT1f+El0et8=
X-Gm-Gg: AYBFou2LohYgnslmDF13/wrmjV19KlV/Wm5jF3Nqsbsn1Wzxn64Ay0XZJOKRLk5rnyd
	sK0vmJrOdzMKx0gzhDT7Rzl+snp1dySygVZkv61rDu4IxYhpwKxXvK55sii5H3A3C08xHGgl+3d
	pe+20Bmt66JcL4OCWtjRZAwcGa5xN8P9BKTgCJ6TUFpHfy3uq7JIhTEJvY5txCSxovqHu+0OvBH
	RJwAHyJs4u3jmZhhcDoLrng/zSitD2X/25fGLrsFhUSpVNgMouU7fj9ufIUkUZovJ9gDzMpIlNg
	nnLHO8vkgz4OOhodzyeoWD20IeRAji7hFdH1gm330V4KWFxxD4UKU/tGbhmAi6pD2Qo/+ret0up
	gJm/tIrPfLIdMxzWAUBcuuMqdfkSZqsxs6JkyOyHq8L5kos6MiAGI3BV1pAhop/AHDEwYh7LBGz
	TAJPQRwXY0kFyymgU+c483D13GHorBtWxIw7U22tn6Btb4SzzDQl1CXhT4dHLADX2Yud99HKVjJ
	0cZcyXuUg==
X-Received: by 2002:a05:6a21:9187:b0:3c3:a3f4:5485 with SMTP id adf61e73a8af0-3db4047d0d7mr3482087637.6.1789375177002;
        Mon, 14 Sep 2026 01:39:37 -0700 (PDT)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e9a8a9sm24665369eec.13.2026.09.14.01.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:39:36 -0700 (PDT)
From: Nia Su <nia.su@sifive.com>
Subject: [PATCH v2 0/2] lib: sbi: Fix stale trap_context/prev_context
 linking
Date: Mon, 14 Sep 2026 01:39:32 -0700
Message-Id: <20260914-trap-context-fix-v2-0-3a6bedc6fcf0@sifive.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMSyp2oC/2WNQQ6CMBBFr0Jm7Zi2FhBX3sOwKDCVWUhJ2zQY0
 rtbSVy5fC/57+8QyDMFuFU7eEoc2C0F1KmCcTbLk5CnwqCEakQnFEZvVhzdEmmLaHnDoaP2qrX
 s6gtBma2eij6Sj77wzCE6/z4ekvzaX0z/x5JEgc1gW2t0PdVW3gNbTnQe3Qv6nPMHQerFBrEAA
 AA=
X-Change-ID: 20260902-trap-context-fix-b9e78441953e
To: opensbi@lists.infradead.org
Cc: Nia Su <nia.su@sifive.com>, Evgeny Voevodin <evvoevod@tenstorrent.com>, 
 Nick Hu <nick.hu@sifive.com>, Nylon Chen <nylon.chen@sifive.com>, 
 Zong Li <zong.li@sifive.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=967; i=nia.su@sifive.com;
 h=from:subject:message-id; bh=/BnES/XksS+elY3wZH+GiK7Lf0WtW5zCgBjth70NPNM=;
 b=owEBbQKS/ZANAwAIAYihNJa3+YfgAcsmYgBqp7LIgfgmp+Hzf+pP1DeA9Te6LwBDriCuBmadj
 ncVVQ+zaTKJAjMEAAEIAB0WIQThGl/T4FqBBU9NhIeIoTSWt/mH4AUCaqeyyAAKCRCIoTSWt/mH
 4BWdD/404hOgb3rA6Mye9MtvC98Q7JQuwkFmfjLN9vyaLg1SSW8yX7RcBDH6YED8ZNTl3yk6yYC
 uj378bnHfCU9+hTytXP7xJRi8DxHL81C9J5p/oR40IUbjrcyE4gxB18Rv3Os1aLEP3WvfOUKiB1
 Gl1Vgm4FWrH/MhQmFH+6FrOvCsbaEAOdweXDY3Y3zV5TGxJqthttogxT/S/SQjwgknYzUN/UiTB
 6ibqnU8bEGlWjlyJ49YhrcDHyfI6w14pSSz0itHmMn4ZuNR7mIPB0QxY86j3VyovJJzOgX9RpX+
 n67HcShxl4sshd/o4FheEl55s29tFN90kuZZvmeGTj1yWN6na3qe3QBvhrm4YRKOmmgrFhBW4gs
 tyQQX9VC9LycNLofC2yqkgUODNYLwF8ZTuf5o9dRp7xnMRKsb3Y0hwoXfaTSs3LEycSVRry3nrZ
 16spZQDkcY9w8cZKa6FHof9OOUiENrdtTGfN5KftItuLmJp4cA6evbIhNiKnVdNZE9jfr9OEgQB
 n6b3Yzdm/kq41EctiOKpRI30v8ekA27i1pv5+kFqtkgASWibp2Yzd83hCjycCBZZ2Z/X/5D6Mdz
 pc7r52n0/ByeILcPCggqfXtkO8mUcAs8/VGt5NqGC3Rjla8pE5UyDQvbYe/XMe7IR9MNjh/+8sD
 tdhXqyAqjKZ8dmA==
X-Developer-Key: i=nia.su@sifive.com; a=openpgp;
 fpr=55235C875092ACC578EFCE6CD1699E646B29B1AF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_013938_005708_CA084A4B 
X-CRM114-Status: UNSURE (   7.53  )
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

Patch 1 clears scratch->trap_context on warm boot, since
non-retentive suspend/resume jumps straight there without restoring
it, leaving a stale pointer misused as the next trap's prev_context.

Patch 2 fixes sbi_trap_rnmi_handler() to link prev_context on entry
and restore it on exit, the same way sbi_trap_handler() does.

Signed-off-by: Nia Su <nia.su@sifive.com>
---
Changes in v2:
- Patch 1: trimmed the commit message, added a Fixes tag.
- Added Reviewed-by from Evgeny Voevodin.
- Link to v1: https://lore.kernel.org/r/20260904-trap-context-fix-v1-0-6bf7fa45d5f1@sifive.com

---
Nia Su (2):
      firmware: Clear scratch->trap_context on warm boot
      lib: sbi: Fix stale prev_context in RNMI handler

 firmware/fw_base.S |  3 +++
 lib/sbi/sbi_trap.c | 10 ++++++++--
 2 files changed, 11 insertions(+), 2 deletions(-)
---
base-commit: 35511bc6ee1c9c17b6a89b44c52e2044bb51b979
change-id: 20260902-trap-context-fix-b9e78441953e

--


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
