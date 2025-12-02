Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB48CFD376
	for <opensbi@archiver.kernel.org>; Tue,  2 Dec 2025 07:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r4Dwut0BUPepA6skWpeipcSxEFe9vV5eFUxeXyL6vjA=; b=2j5iDZVDkqzYc6
	uIdA+1UpsP5FstiqYXaohUFNVvQZ+thHDQCkRrwXwevX6gYUGZlv4BFXRaTIB18hIT5Ik7BEnyYPm
	0dEbaLZw276AIgalnw1rIWNymeqUs25CxzeqS2angzLKTEzkICxg9pvkfp1efdpB829c9h+XJU+48
	ORQI+VpKpOs4cHOlQGpngNA3JkgzVfWdMw7ajvhzlMSidmAvDm86ymPrexb52g1+513yH8xeo6Fqh
	xGQtMgxuxWaXgFzNsHQStkvNZ06hsqx5SHVSZ6sybSrvMCaCQs9+nOEemQbxkw0I6/3+1xwV3bW1v
	W4AuH8iCcD7mO2y8UOBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQKUx-00000004wTA-4AR1;
	Tue, 02 Dec 2025 07:08:31 +0000
Received: from m16.mail.126.com ([117.135.210.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQKUu-00000004wSS-1oE8
	for opensbi@lists.infradead.org;
	Tue, 02 Dec 2025 07:08:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Lv
	13y70Jl4NXPwaNiMiu4xwzBIjwucS+3GNgES/LPXM=; b=hNv/NUazRHJCPbc/+D
	rKTD7rbi3uj1JywWMtkGa0tCcnSn2YaZAx4yraD8wQnUWmVdTroA6CMcMW1C1PJH
	Xwn91VawWTYSK5W7k3pH2Zpxd5V/91dJ9EpPzNqd7Jv6EVXCEVykz5fLDJsoKVoa
	IXBUx8ZPBOfdtICWvoeGvaL+4=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3DzYwkC5pT1k3AA--.26781S2;
	Tue, 02 Dec 2025 15:07:28 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	Xiang W <wxjstz@126.com>,
	Xiang W <wangxiang@iscas.ac.cn>
Subject: [PATCH v2] Makefile: Add -fuse-ld for merge_objs
Date: Tue,  2 Dec 2025 15:05:55 +0800
Message-ID: <20251202070724.1229991-1-wxjstz@126.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CM-TRANSID: _____wD3DzYwkC5pT1k3AA--.26781S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KryruryrtFy3WF4DKF1UGFg_yoW8XFWkpa
	1S9FyUu3WkGw4xta4xJay3uwnxJa1kt3yUWFy5Zr1fZFy7twn8A3s2q3WIkFn7WF97Cay3
	Gw4aqr13Jr4FywUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRbTmhUUUUU=
X-Originating-IP: [2408:823c:b211:2949:db98:1913:e9e:6e1a]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbiFxgYOmkujeciqAAAsK
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_230828_826231_99D43DD3 
X-CRM114-Status: UNSURE (   6.29  )
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
v2 changes:
- s/-no-pie -Wl,-r/-r/
 Makefile | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index eb95164c..794f6f38 100644
--- a/Makefile
+++ b/Makefile
@@ -433,13 +433,15 @@ ELFFLAGS	+=	-Wl,--no-dynamic-linker -Wl,-pie
 ELFFLAGS	+=	$(platform-ldflags-y)
 ELFFLAGS	+=	$(firmware-ldflags-y)
 
+MERGEFLAGS	+=	$(USE_LD_FLAG)
+MERGEFLAGS	+=	-nostdlib
 MERGEFLAGS	+=	-r
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
 
@@ -459,7 +461,7 @@ define dynamic_flags
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
