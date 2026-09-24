Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7768CC98310
	for <opensbi@archiver.kernel.org>; Thu, 24 Sep 2026 06:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jzc1z8L7xtAx+RFjAA0ubrh3apA1Zi+dvUP2J8yddPQ=; b=0cw/O+PBR0PD3w
	pM/BBWIp7wXXYliz5LTbBOUP/Xy4yN6OUM2uyDSHVSW3h+XpMaIr9mwyB5P6GjHX/pv7FUWnNC9DU
	EShB07ObYxL1ktv/0NGRyzEihO8/paKUDyHz5t40EFplfLd7AVNhhvviZqaQI1XGBVH2TAnfsOTVb
	3sUEZyPfCYXnSarMMBoJVWhW8LrINeuVFF5W1Z/vT1Uqi3K+xe1/dCTi2/7ByrRbhqG8uAieo5MZE
	Hwl/VHsr7VprhOBF7cs3mNllzlqU4jnfsh1X6dpIlrs4L2bmUuIyeQUaf8AFRqHCyRnS+SebYOK6r
	TdyLNm4+f3gpLJcE950g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9cWi-0000000A6HP-29Ig;
	Thu, 24 Sep 2026 06:01:48 +0000
Received: from send278.i.mail.ru ([95.163.59.117])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9cWe-0000000A6GZ-3qxV
	for opensbi@lists.infradead.org;
	Thu, 24 Sep 2026 06:01:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
	To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=FnQ+iORK7r5yWTgNAXOywgAjAep6Rp/UvlL7Ahr9pHI=; t=1790229704; x=1790319704; 
	b=HisytvRFxer6G91JbNOVpC2t7XRafjNTj3E/njaQ2WdFG+m7LYHSnvxh1NvMCK7KdyXcaQEQRqq
	rnLwV6ZV0KUlohuhj6vs1zi8Czlisv1u7mDKgcNVoZ7bA01LBh7c1qUpPmgDdSNdNSGxpT2LG8mu0
	qgLSVyTKXb92X0VisZ69J8cQkIkMPBhLw1xO/5PylHbWRghTV+/LCxViVzw4pasjgreoNYTRxxyMK
	fau8r7K+h1e3vCfjQQy7m9AJ/xD3jT2YTx6tlimHTyJkD6tWv61SOeF7tuqSqKt7POt1PX4369v6q
	LgaHYRPu5hdiQJH43ATCmGUBVPpu4R6p85Fw==;
Received: by exim-smtp-7cfc745659-2cqls with esmtpa (envelope-from <fido_max@inbox.ru>)
	id 1x9cWW-00000000Wji-1Y4H; Thu, 24 Sep 2026 09:01:36 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: opensbi@lists.infradead.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Subject: [PATCH 1/1] Makefile: Speed up parallel build
Date: Thu, 24 Sep 2026 09:01:33 +0300
Message-ID: <20260924060133.294142-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Authentication-Results: exim-smtp-7cfc745659-2cqls; auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9F6609298D81718F4DFA35B9F9BA5817E6C7F417FFBD60938182A05F538085040AF0019D62B8D08D83DE06ABAFEAF6705656D960AFEFBF2D3003C74A113A0B0C92DE1B2618FB08109
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7DA26CB0764DFC5B8EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB55337566D216EB99429A6A60EF267FD9F4624A2C097BE776DCB96ECDD65D23FEE7CBAD1A8EEF46B7454FC60B9742502CCDD46D0D034D30FDF2F620DBF6B57BC7E64490618DEB871D839B73339E8FC8737B5C2249D082881546D93491CC7F00164DA146DAFE8445B8C89999729449624AB7ADAF37F6B57BC7E64490611E7FA7ABCAF51C92176DF2183F8FC7C0F60A601881DBAB3C8941B15DA834481F9449624AB7ADAF372E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C34B08FA16E56A400835872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-87b9d050: 1
X-C1DE0DAB: 0D63561A33F958A54C37F60F1A326D7F5002B1117B3ED696F75CEC91DCF3CFF1C638DF663A625AFA823CB91A9FED034534781492E4B8EEAD13926AAAFEFA6645C79554A2A72441328621D336A7BC284946AD531847A6065A17B107DEF921CE79BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE191716CD42B3DD1D34C77DD89D51EBB774225B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D659DC4256C3A3747B147F408FF898B2CBF484CE3E8257CF9FD3868A42DB4747359DC23416504EA66F32B8341EE9D5BE9A0AF6C228675A13988FF410C901F05BF957DDC0F9669DC959B28CD93680B12512CF4C41F94D744909CEE921556F0E976A29E6EC0772259F8F8F8815B87D7EC76CB9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXOcIETfglQORZ0zpDET4ZrlAo0bq3TDyw5v+G6YiroYw8WNWj9AP4B4=
X-Mailru-Sender: 689FA8AB762F73937C9FA53A4753B313359759DE08FD495FE60987E25D495F82CA6AAF5E36973FB690DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_230145_306211_1318A225 
X-CRM114-Status: UNSURE (   6.10  )
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

Parallel build is extremely slow when using vars (O, I,
PLATFORM_DIR+PLATFORM). And all this is because the variables are
calculated continuously, with the simultaneous invocation of
the $(shell ...). So use "Simply expanded variables" to
calculate value and call $(shell ...) just once.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 Makefile | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index 1b3333f3..da6751fd 100644
--- a/Makefile
+++ b/Makefile
@@ -22,18 +22,18 @@ endif
 # Find out source, build, and install directories
 src_dir=$(CURDIR)
 ifdef O
- build_dir=$(shell $(READLINK) -f $(O))
+ build_dir:=$(shell $(READLINK) -f $(O))
 else
- build_dir=$(CURDIR)/build
+ build_dir:=$(CURDIR)/build
 endif
 ifeq ($(build_dir),$(CURDIR))
 $(error Build directory is same as source directory.)
 endif
 install_root_dir_default=$(CURDIR)/install
 ifdef I
- install_root_dir=$(shell $(READLINK) -f $(I))
+ install_root_dir:=$(shell $(READLINK) -f $(I))
 else
- install_root_dir=$(install_root_dir_default)/usr
+ install_root_dir:=$(install_root_dir_default)/usr
 endif
 ifeq ($(install_root_dir),$(CURDIR))
 $(error Install root directory is same as source directory.)
@@ -42,12 +42,12 @@ ifeq ($(install_root_dir),$(build_dir))
 $(error Install root directory is same as build directory.)
 endif
 ifdef PLATFORM_DIR
-  platform_dir_path=$(shell $(READLINK) -f $(PLATFORM_DIR))
+  platform_dir_path:=$(shell $(READLINK) -f $(PLATFORM_DIR))
   ifdef PLATFORM
     platform_parent_dir=$(platform_dir_path)
   else
-    PLATFORM=$(shell basename $(platform_dir_path))
-    platform_parent_dir=$(shell realpath ${platform_dir_path}/..)
+    PLATFORM:=$(shell basename $(platform_dir_path))
+    platform_parent_dir:=$(shell realpath ${platform_dir_path}/..)
   endif
 else
  platform_parent_dir=$(src_dir)/platform
-- 
2.55.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
