Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A99BCFD2F6
	for <opensbi@archiver.kernel.org>; Tue,  2 Dec 2025 06:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pGGSixCazHUltRxmyPK9osOZBruzLkZhMqXM29RGdTs=; b=OQOMGkcQWoCbm8
	6uYU+fZLxh+noyTIsai2+TxL7WT0pRbtLzeP+TALsBCKQ38/TIzOXHgwlEKsU36UeMzemsrwwoidY
	+SMWpz1+iwG1HZyy7GmfkacpaYDxzxD6L7N0JxCbS68+0O+vpzeS79Nk+BOY0/4aXmErrl+ggGy9c
	FUTGi/KaXzuSjdprb/zlrLViPGy4VAX/eNFSfe4bvabpVGB3qkuHvywJOEf7KVb9c3LrZr2Mp/Q36
	QYw3V4rwuEm++yZ4JaeUgVUOK1tnjfbL+K6J8/R7RztcvVjOMaYMpumFxfBQ4yXsos4VbZfANjOqG
	i0wpcv16543AYqfE4oGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQKDu-00000004vPU-1hEP;
	Tue, 02 Dec 2025 06:50:54 +0000
Received: from m16.mail.126.com ([220.197.31.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQKDr-00000004vPA-3Sxx
	for opensbi@lists.infradead.org;
	Tue, 02 Dec 2025 06:50:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=bu
	Wak+rYYUNLEtkV1+r3JGT1flxzoJOPI1W6SR45/TE=; b=ou7HbeKvMRQtdN+Jb+
	/qU2iYgDUTcm9cQfL7WsJEo0jOqxsPgn+mCLCY5fnWHuy1chGkW7ElhkawSOohrw
	gAnDy2tpmF9c648PYDJD3B8VyH1A7FkORGJdfO9T7DfNUubthewFOS53Dr+IEFc1
	EwcasUK+kFztNQPAmhq7yeCMk=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3N4A6jC5ppbY5AA--.32212S2;
	Tue, 02 Dec 2025 14:50:35 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	Xiang W <wxjstz@126.com>,
	Xiang W <wangxiang@iscas.ac.cn>
Subject: [PATCH] Makefile: Add -fuse-ld for merge_objs
Date: Tue,  2 Dec 2025 14:49:37 +0800
Message-ID: <20251202065025.1162973-1-wxjstz@126.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CM-TRANSID: _____wD3N4A6jC5ppbY5AA--.32212S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KryruryrtFy3WF4DKF1UGFg_yoW8Xw45pa
	1S9FyUZa4kGw4xtayxJay3ZwnxJw48t3yUWF15ZF1rZF1Utwn8A34xt3WIkFn7WF97Ca13
	Gw4aqr13Jr4rtwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRbTmhUUUUU=
X-Originating-IP: [2408:823c:b211:2949:db98:1913:e9e:6e1a]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbi1woYOmkuc01HRQABsF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_225052_231317_C447AD57 
X-CRM114-Status: UNSURE (   6.56  )
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

On some platforms, the default linker is `mold`, which can cause the
following error. Adding the `--fuse-ld` option can prevent this problem.

    MERGE     platform/generic/firmware/payloads/test.o
    mold: fatal: unknown command line option: -b elf64-littleriscv

Signed-off-by: Xiang W <wangxiang@iscas.ac.cn>
---
 Makefile | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index eb95164c..a8d702a1 100644
--- a/Makefile
+++ b/Makefile
@@ -433,13 +433,16 @@ ELFFLAGS	+=	-Wl,--no-dynamic-linker -Wl,-pie
 ELFFLAGS	+=	$(platform-ldflags-y)
 ELFFLAGS	+=	$(firmware-ldflags-y)
 
-MERGEFLAGS	+=	-r
+MERGEFLAGS	+=	$(USE_LD_FLAG)
+MERGEFLAGS	+=	-no-pie
+MERGEFLAGS	+=	-nostdlib
+MERGEFLAGS	+=	-Wl,-r
 ifeq ($(LD_IS_LLD),y)
-MERGEFLAGS	+=	-b elf
+MERGEFLAGS	+=	-Wl,-b,elf
 else
-MERGEFLAGS	+=	-b elf$(PLATFORM_RISCV_XLEN)-littleriscv
+MERGEFLAGS	+=	-Wl,-b,elf$(PLATFORM_RISCV_XLEN)-littleriscv
 endif
-MERGEFLAGS	+=	-m elf$(PLATFORM_RISCV_XLEN)lriscv
+MERGEFLAGS	+=	-Wl,-m,elf$(PLATFORM_RISCV_XLEN)lriscv
 
 DTSCPPFLAGS	=	$(CPPFLAGS) -nostdinc -nostdlib -fno-builtin -D__DTS__ -x assembler-with-cpp
 
@@ -459,7 +462,7 @@ define dynamic_flags
 endef
 merge_objs = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
 	     echo " MERGE     $(subst $(build_dir)/,,$(1))"; \
-	     $(LD) $(MERGEFLAGS) $(2) -o $(1)
+	     $(CC) $(MERGEFLAGS) $(2) -o $(1)
 merge_deps = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
 	     echo " MERGE-DEP $(subst $(build_dir)/,,$(1))"; \
 	     cat $(2) > $(1)
-- 
2.47.3


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
