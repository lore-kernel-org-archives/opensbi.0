Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE43CD98F2
	for <opensbi@archiver.kernel.org>; Mon, 22 Jun 2026 13:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UAlKYB2DYH0IkaPhNYxKzhSJvvsBhs82Xw9eBMwyuhU=; b=C64e/JCFhKI7iQ
	SnByLBwCTwsCkDTHYa6Kb/MPWZj2WgGsnm04S0ArUYD0e/8Bdh6bQeo3I7vChhTlz8DbWci7vN9hw
	7P/2ln9RXCOc4OgQWU+uS6OdDHoYw+0U3dCCBDQRje+Epw/z2BxKGOSncBqx6TzRuqnRIGQyGZr3K
	Nq1/N5mKvC4sWvhsT4R1hmQLJBGv826PSSA+c2t2d85DRWgU4Q3qR1TQrhTHWucuj98AC1Q2SiRnA
	OaHWKLBIVKjsOp9LU3KLlIqRX+auW6arWi5tQbFi8U2fQKnzgUCOHZkrZKUu4SmZblC52nSvYO+IR
	fPc3RaQCkLT2ppQGPEOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbefJ-000000051Fx-3ueV;
	Mon, 22 Jun 2026 13:26:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbefH-000000051FV-346m
	for opensbi@lists.infradead.org;
	Mon, 22 Jun 2026 13:26:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BB219601F0
	for <opensbi@lists.infradead.org>; Mon, 22 Jun 2026 13:26:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCB261F000E9;
	Mon, 22 Jun 2026 13:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782134773;
	bh=tgFGH3KB3OfozDNBuMlAFFbiwBcN9PIGNidQ7wr8L+0=;
	h=From:Date:Subject:To:Cc;
	b=DVAwEqCFz8NohVNWstEUvLZIzAidpugmRPvTMVyFEW7KMT7WRA2d+23sB0klFIc1m
	 4Se+Gk5JXbOcsghb34CqvKYg18fi/Np6lFDFQDLb4iEsHEfvvr57XHS+q7YXW0h3Ls
	 xFiEelOkaAHezCr84F7Q65wTX6/FegHIHTyHBMKj64ZwBGH++Km2nrdMvD98UymfJL
	 iCv2ytkn7EuoOfFUanZp4lxjnOI1j6uUXHnk0kIaQOqRSYe6ZaXtf+YBcbcfrr6cMp
	 cG0FJeTPhdseIzS+nZwiANshbgkDsWvxXgkQFjTKUsphFlxf0YPDUPAdQRCBL0c1HA
	 i0RFn32vSNHhw==
From: Michael Ellerman <mpe@kernel.org>
Date: Mon, 22 Jun 2026 23:26:00 +1000
Subject: [PATCH] Makefile: Support make -s to silence the build
MIME-Version: 1.0
Message-Id: <20260622-upstream-v1-1-792e1847e96e@kernel.org>
X-B4-Tracking: v=1; b=H4sIAOc3OWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMyMj3dKC4pKi1MRcXQsLC8tkc8OUJEOTVCWg8oKi1LTMCrBR0bG1tQA
 jKZ5jWgAAAA==
To: opensbi@lists.infradead.org
Cc: Michael Ellerman <mpe@kernel.org>
X-Mailer: b4 0.13.0
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

Add support for silencing the build with make -s, which means nothing is
printed unless there is an error. Similar to the way Linux does it.

Signed-off-by: Michael Ellerman <mpe@kernel.org>
---
Tested with make v4.0 and v4.3.
---
 Makefile | 47 ++++++++++++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 19 deletions(-)

diff --git a/Makefile b/Makefile
index 54eb15bc..c57aa452 100644
--- a/Makefile
+++ b/Makefile
@@ -480,17 +480,26 @@ endif
 define dynamic_flags
 -I$(shell dirname $(2)) -D__OBJNAME__=$(subst -,_,$(shell basename $(1) .o))
 endef
+
+# If the user requested silent operation (make -s), hide the
+# pretty command output by turning the echo into ":" (nop).
+ifneq ($(findstring s,$(firstword $(MAKEFLAGS))),)
+pretty_echo := :
+else
+pretty_echo := echo
+endif
+
 merge_objs = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
-	     echo " MERGE     $(subst $(build_dir)/,,$(1))"; \
+	     $(pretty_echo) " MERGE     $(subst $(build_dir)/,,$(1))"; \
 	     $(LD) $(MERGEFLAGS) $(2) -o $(1)
 merge_deps = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
-	     echo " MERGE-DEP $(subst $(build_dir)/,,$(1))"; \
+	     $(pretty_echo) " MERGE-DEP $(subst $(build_dir)/,,$(1))"; \
 	     cat $(2) > $(1)
 copy_file =  $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
-	     echo " COPY      $(subst $(build_dir)/,,$(1))"; \
+	     $(pretty_echo) " COPY      $(subst $(build_dir)/,,$(1))"; \
 	     cp -L -f $(2) $(1)
 inst_file =  $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
-	     echo " INSTALL   $(subst $(install_root_dir)/,,$(1))"; \
+	     $(pretty_echo) " INSTALL   $(subst $(install_root_dir)/,,$(1))"; \
 	     cp -L -f $(2) $(1)
 inst_file_list = $(CMD_PREFIX)if [ ! -z "$(4)" ]; then \
 	     mkdir -p $(1)/$(3); \
@@ -498,62 +507,62 @@ inst_file_list = $(CMD_PREFIX)if [ ! -z "$(4)" ]; then \
 	     rel_file=`echo $$file | sed -e 's@$(2)/$(subst $(install_firmware_path),platform,$(3))@@'`; \
 	     dest_file=$(1)"/"$(3)"/"`echo $$rel_file`; \
 	     dest_dir=`dirname $$dest_file`; \
-	     echo " INSTALL   "$(3)"/"`echo $$rel_file`; \
+	     $(pretty_echo) " INSTALL   "$(3)"/"`echo $$rel_file`; \
 	     mkdir -p $$dest_dir; \
 	     cp -L -f $$file $$dest_file; \
 	     done \
 	     fi
 inst_header_dir =  $(CMD_PREFIX)mkdir -p $(1); \
-	     echo " INSTALL   $(subst $(install_root_dir)/,,$(1))"; \
+	     $(pretty_echo) " INSTALL   $(subst $(install_root_dir)/,,$(1))"; \
 	     cp -L -rf $(2) $(1)
 compile_cpp_dep = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
-	     echo " CPP-DEP   $(subst $(build_dir)/,,$(1))"; \
+	     $(pretty_echo) " CPP-DEP   $(subst $(build_dir)/,,$(1))"; \
 	     printf %s `dirname $(1)`/  > $(1) && \
 	     $(CC) $(CPPFLAGS) -x c -MM $(3) \
 	       -MT `basename $(1:.dep=$(2))` >> $(1) || rm -f $(1)
 compile_cpp = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
-	     echo " CPP       $(subst $(build_dir)/,,$(1))"; \
+	     $(pretty_echo) " CPP       $(subst $(build_dir)/,,$(1))"; \
 	     $(CPP) $(CPPFLAGS) -x c $(2) | grep -v "\#" > $(1)
 compile_cc_dep = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
-	     echo " CC-DEP    $(subst $(build_dir)/,,$(1))"; \
+	     $(pretty_echo) " CC-DEP    $(subst $(build_dir)/,,$(1))"; \
 	     printf %s `dirname $(1)`/  > $(1) && \
 	     $(CC) $(CFLAGS) $(call dynamic_flags,$(1),$(2))   \
 	       -MM $(2) >> $(1) || rm -f $(1)
 compile_cc = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
-	     echo " CC        $(subst $(build_dir)/,,$(1))"; \
+	     $(pretty_echo) " CC        $(subst $(build_dir)/,,$(1))"; \
 	     $(CC) $(CFLAGS) $(call dynamic_flags,$(1),$(2)) -c $(2) -o $(1)
 compile_as_dep = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
-	     echo " AS-DEP    $(subst $(build_dir)/,,$(1))"; \
+	     $(pretty_echo) " AS-DEP    $(subst $(build_dir)/,,$(1))"; \
 	     printf %s `dirname $(1)`/ > $(1) && \
 	     $(AS) $(ASFLAGS) $(call dynamic_flags,$(1),$(2)) \
 	       -MM $(2) >> $(1) || rm -f $(1)
 compile_as = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
-	     echo " AS        $(subst $(build_dir)/,,$(1))"; \
+	     $(pretty_echo) " AS        $(subst $(build_dir)/,,$(1))"; \
 	     $(AS) $(ASFLAGS) $(call dynamic_flags,$(1),$(2)) -c $(2) -o $(1)
 compile_elf = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
-	     echo " ELF       $(subst $(build_dir)/,,$(1))"; \
+	     $(pretty_echo) " ELF       $(subst $(build_dir)/,,$(1))"; \
 	     $(CC) $(CFLAGS) $(3) $(ELFFLAGS) -Wl,-T$(2) -o $(1)
 compile_ar = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
-	     echo " AR        $(subst $(build_dir)/,,$(1))"; \
+	     $(pretty_echo) " AR        $(subst $(build_dir)/,,$(1))"; \
 	     $(AR) $(ARFLAGS) $(1) $(2)
 compile_objcopy = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
-	     echo " OBJCOPY   $(subst $(build_dir)/,,$(1))"; \
+	     $(pretty_echo) " OBJCOPY   $(subst $(build_dir)/,,$(1))"; \
 	     $(OBJCOPY) -S -O binary $(2) $(1)
 compile_dts = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
-	     echo " DTC       $(subst $(build_dir)/,,$(1))"; \
+	     $(pretty_echo) " DTC       $(subst $(build_dir)/,,$(1))"; \
 	     $(CPP) $(DTSCPPFLAGS) $(2) | $(DTC) -O dtb -i `dirname $(2)` -o $(1)
 compile_d2c = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
-	     echo " D2C       $(subst $(build_dir)/,,$(1))"; \
+	     $(pretty_echo) " D2C       $(subst $(build_dir)/,,$(1))"; \
 	     $(if $($(2)-varalign-$(3)),$(eval D2C_ALIGN_BYTES := $($(2)-varalign-$(3))),$(eval D2C_ALIGN_BYTES := $(4))) \
 	     $(if $($(2)-varprefix-$(3)),$(eval D2C_NAME_PREFIX := $($(2)-varprefix-$(3))),$(eval D2C_NAME_PREFIX := $(5))) \
 	     $(if $($(2)-padding-$(3)),$(eval D2C_PADDING_BYTES := $($(2)-padding-$(3))),$(eval D2C_PADDING_BYTES := 0)) \
 	     $(src_dir)/scripts/d2c.sh -i $(6) -a $(D2C_ALIGN_BYTES) -p $(D2C_NAME_PREFIX) -t $(D2C_PADDING_BYTES) > $(1)
 compile_carray = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
-	     echo " CARRAY    $(subst $(build_dir)/,,$(1))"; \
+	     $(pretty_echo) " CARRAY    $(subst $(build_dir)/,,$(1))"; \
 	     $(eval CARRAY_VAR_LIST := $(carray-$(subst .carray.c,,$(shell basename $(1)))-y)) \
 	     $(src_dir)/scripts/carray.sh -i $(2) -l "$(CARRAY_VAR_LIST)" > $(1) || rm $(1)
 compile_gen_dep = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
-	     echo " GEN-DEP   $(subst $(build_dir)/,,$(1))"; \
+	     $(pretty_echo) " GEN-DEP   $(subst $(build_dir)/,,$(1))"; \
 	     echo "$(1:.dep=$(2)): $(3)" >> $(1)
 
 targets-y  = $(build_dir)/lib/libsbi.a

---
base-commit: e134d5210680cf24eea85dc287036e343f176642
change-id: 20260622-upstream-8889c71db14e

Best regards,
-- 
Michael Ellerman <mpe@kernel.org>


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
