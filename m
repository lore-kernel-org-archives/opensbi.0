Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2913C624DE
	for <opensbi@archiver.kernel.org>; Fri,  4 Sep 2026 16:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Yg83azLJu+IBQg7JldUwoAr1AN6rtRbsxpKYy6/lp8=; b=ABYgc/ycAmkKy+
	FsgbYZ0hZC7t5D1OirpkkorSc4wQ/yDpENmw/BN/8+qZ93ZMDdy3RCuoqUlPGc7sdBhRRaOJsOHzj
	+5cmWFerZMwLFDnewLrb4uhIEl0eUv1zdEqWj4wpyK1qMhUeNmknsaMRALCWXx8n3l9ik4O+GO6Jg
	Bef/7AdfxY7u7OndfnxwiaRgW732fBjZP643n4d/ZAkDUuqTxzgkugVkcuG7rI65WSgog9Uoo5c3m
	w2JhueBwx+osdAUC18hg14as0nXprRO+ynWtUfrBA3yF61PWZfhWEFGgm25xweQrD4dvgrqMjIluy
	Z5Be3e8wfwctX6LOwGEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WnJ-00000002jaq-3b67;
	Fri, 04 Sep 2026 16:29:37 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WnH-00000002jZ7-3boH
	for opensbi@lists.infradead.org;
	Fri, 04 Sep 2026 16:29:37 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-90e7bde5596so13173206d6.1
        for <opensbi@lists.infradead.org>; Fri, 04 Sep 2026 09:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788539375; x=1789144175; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BKad5OeiAmhj1JLeaZ2lfVYjA7QTq0EGG9QPvipL6a4=;
        b=KWcuzDeqnY63gXX8OL98g4VcmJXLefMyvk9CgC0ozq7OTGdtSeQLwq6GPO0JP+ywiP
         0OI9Z3uXUYEAIpcVYCf8YlilsGpBlFZrEOEEc2Jz/HnQGTRoBW1YeFCh7vZcMPkhj4Nz
         WYTJFMupz0sjp3KcpDolnv0cYcnV8YJgca+NHPigDoQsYMVFPYpiszzHBkLoEz4r+FKf
         xwwjMprUyZRwbjDfzzN48ghdTlHntR/Tz/HiiC/OGSbWNjYNXrUXsqI4NJ0HfVtIMUAr
         f7jmSYGdcwA/uJnoDtTUOiUJjFmHpqxLSWb4Ry3oN2oLRg+y7oOqL0fgKnnmhhWrR1k3
         YrtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788539375; x=1789144175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BKad5OeiAmhj1JLeaZ2lfVYjA7QTq0EGG9QPvipL6a4=;
        b=KkwZWkei0UMhex4TsBTUR2Th1/nQeC9GHXTKFgmibAmtTvlp+S7YMslYQAnGpsgIPd
         +r5/BP9rEkITElTLK4Hx9dAlYPK5DufJ1+1cd0/ZJi3Yd4pd81xQtp5YfO8FUbH52Ovn
         GB/ie8omoPrct9DlnHqCy7yXF1nBEr4V9e8Wb1RFzJwacNYFpJfLAOB3o/vW3RPjqex7
         dk6fqkKImTnsWSQcuMtnb1NxKSOJcHqp0WN+cuzuJ9T6iOrk29iCpZj/LaMn5XWWa/Iw
         WPeEJIOaFRM6/w/VyY8adfVlCkeZLdXPYd6uzLOniAWDjxQEcD5GY6YPgRTgcGE6U70w
         2A+w==
X-Gm-Message-State: AFuF++nPRbb0QZyXz4tfEWGy8Dnlh68TWybkgThwAOj0+ITeZ08BxGgj
	HZHWh49OVQVapPmriqVeJvu/GlERf+dfFv7IF7uNpUzkrtaQC+phdjfd/UuQqg==
X-Gm-Gg: AYBFou298PBhGmOT8jKMSSZPxccwLKRKqWu8227vMgsJVV9uqMCH54EMkBaITP3MYef
	9fCrmjN8twCRdrtSk9Hr66cLYI/+QC1EuH3s23qgMkyJgY3fZIRhIRSQZZdyPjHqBJp24l0BvUk
	xRUEJ7D+A1N8RZ1mLd1buIIv8fwXfdH3KW/Upr5g1tnPbmShn2IvSO1J6jfwiZw7SWFaquH5SWQ
	8mECshvF8jFuhLZkkxAvr352BryVlQ9lZ77U1D9DKQYAe8P+kEWu/WBbgt+kgE831lKRD7+Vy+o
	P9BsTnRF16Zw18U06hnn9G96CWPSKgw+//ehmdB1My0WpkexBwGm0Pillaxb2MqC1KuzG3za9LL
	VJLoFo2hwnQBncln9A/TwOfFLw9Xydi3meLHBp6BU6YHY3TwnIxzGC/EX+22/+V2hWvUxlESq8l
	lpjILkaJsiqHI8/wj+hv5OkAAcG8V7vCUVII6zZ2hb7DDnXLhUJPfd7Q0/GRFNOz5J5eqmEhsJW
	aA36h1C4PI=
X-Received: by 2002:a05:6214:2d44:b0:910:3179:733d with SMTP id 6a1803df08f44-9103efa0f2dmr87558696d6.25.1788539374468;
        Fri, 04 Sep 2026 09:29:34 -0700 (PDT)
Received: from ubuntu.localdomain ([209.227.130.181])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-910405966f0sm24432386d6.6.2026.09.04.09.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 09:29:34 -0700 (PDT)
From: Raymond Mao <raymondmaoca@gmail.com>
To: opensbi@lists.infradead.org
Cc: anup.patel@oss.qualcomm.com,
	scott@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	peter.lin@sifive.com
Subject: [PATCH v3 3/5] docs: document WorldGuard DT bindings
Date: Fri,  4 Sep 2026 12:29:13 -0400
Message-Id: <20260904162915.1092353-4-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260904162915.1092353-1-raymondmaoca@gmail.com>
References: <20260904162915.1092353-1-raymondmaoca@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_092935_946479_777BCB75 
X-CRM114-Status: GOOD (  15.83  )
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

From: Raymond Mao <raymond.mao@riscstar.com>

Document the WorldGuard device-tree metadata used by the current
hart protection runtime flow on WorldGuard-enabled platforms.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 docs/domain_support.md | 212 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 212 insertions(+)

diff --git a/docs/domain_support.md b/docs/domain_support.md
index e267a9f7..de413a41 100644
--- a/docs/domain_support.md
+++ b/docs/domain_support.md
@@ -204,6 +204,218 @@ The DT properties of a domain instance DT node are as follows:
   whether the domain instance is allowed to do system reset.
 * **system-suspend-allowed** (Optional) - A boolean flag representing
   whether the domain instance is allowed to do system suspend.
+* **hw-isolation** (Optional) - A child node used by platform-specific
+  isolation mechanisms. The current OpenSBI WorldGuard implementation uses
+  this node only as a container for per-domain WorldGuard execution metadata.
+
+WorldGuard Device Tree Binding
+------------------------------
+
+The current OpenSBI WorldGuard support is built from:
+
+* **sbi_hart_protection** for hart-local runtime reconfiguration during
+  domain transitions
+* **sbi_domain_data** for per-domain WorldGuard state
+* platform-specific setup code that parses and programs WorldGuard checkers
+  before domains are populated
+
+The WorldGuard-specific DT state is split across two places:
+
+* under a domain instance node, for per-domain execution metadata
+* in the normal system DT topology, for CPU defaults and checker policy
+
+### Domain-local WorldGuard Metadata
+
+The optional **hw-isolation** child node under a domain instance may contain
+one WorldGuard child node:
+
+* **compatible = "sifive,wgchecker2"**
+* **worldguard,wid** - Machine world ID selected when entering the domain
+* **worldguard,widlist** - List of world IDs delegated to the domain
+
+The current implementation looks up the domain node in the FDT, finds its
+**hw-isolation** child, and parses the first child node compatible with
+**sifive,wgchecker2**.
+
+### System-level WorldGuard Metadata
+
+The current implementation also parses the following system-level DT state:
+
+* **/cpus/cpu@X**
+  * **riscv,pmwid** - Default machine world ID for the hart
+  * **riscv,pmwidlist** - Optional M-mode WID bitmap for the hart
+  * **riscv,pmlwidlist** - Optional delegated lower-privilege WID bitmap
+* **sifive,wgchecker2** nodes
+  * **reg** - Checker MMIO base/size
+  * **#address-cells = <1>**
+  * **#size-cells = <0>**
+  * **#access-controller-cells = <1>**
+  * **partition@N** child nodes with:
+    * **reg** - Partition identifier
+    * **sifive,wg-region** - Protected base/size pair
+    * **sifive,slot-permissions** - 64-bit WID permission bitmap
+    * **sifive,slot-config** - DT-visible **ER/EW/IR/IW/LOCK** policy bits
+* protected resource nodes with **access-controllers** properties that point
+  to a checker and reference one or more partition IDs
+
+For the current implementation, checker policy is parsed from **partition@N**
+children under each checker node. Consumer-side **access-controllers**
+references are carried for DT-binding alignment, but the OpenSBI platform code
+programs the checker from provider-local partition metadata.
+OpenSBI validates that each checker has exactly one cell for each required
+provider property and that their values are **#address-cells = <1>**,
+**#size-cells = <0>**, and **#access-controller-cells = <1>**.
+
+### Runtime Behavior
+
+At boot:
+
+* platform setup detects whether checker programming and/or runtime WID
+  switching are present in the DT
+* if runtime WID support is present, OpenSBI registers a WorldGuard
+  **sbi_hart_protection** mechanism and a **sbi_domain_data** provider
+* per-hart default WID state is parsed from **/cpus**
+* checker instances are parsed, validated, and programmed before domain
+  population completes
+
+During a domain transition:
+
+* the WorldGuard **sbi_domain_data** provider supplies per-domain
+  **worldguard,wid** and **worldguard,widlist** state
+* the WorldGuard **sbi_hart_protection** implementation reprograms
+  **MLWID**
+* when **smlwidlist** is present, it also reprograms **MLWIDLIST**
+* when **smwiddeleg** and **sswid** are present, it also reprograms
+  **MWIDDELEG** and **SLWID**
+* when a domain is quiesced, the hart is returned to its per-hart fallback
+  machine world state
+
+**MLWIDLIST** is restored from the hart's **riscv,pmwidlist** value. Domain
+**worldguard,widlist** metadata controls lower-privilege delegation through
+**MWIDDELEG** and is constrained by **riscv,pmlwidlist**.
+
+Runtime WID switching is enabled only when the CPU runtime properties are
+present. A DT that only describes checker hardware does not, by itself,
+enable hart-local WorldGuard reconfiguration.
+
+WorldGuard Examples
+-------------------
+
+Domain instance with WorldGuard execution metadata:
+
+```text
+    chosen {
+        opensbi-domains {
+            compatible = "opensbi,domain,config";
+
+            example_domain: domain@1 {
+                compatible = "opensbi,domain,instance";
+                possible-harts = <&cpu2>;
+                regions = <&mem0 0x3f>;
+                boot-hart = <&cpu2>;
+                next-addr = <0x00000000 0x80200000>;
+                next-mode = <0x1>;
+
+                hw-isolation {
+                    worldguard {
+                        compatible = "sifive,wgchecker2";
+                        worldguard,wid = <0x1>;
+                        worldguard,widlist = <1 3>;
+                    };
+                };
+            };
+        };
+    };
+```
+
+CPU default state, checker, and protected resource example:
+
+```text
+    memory0: memory@80000000 {
+        reg = <0x0 0x80000000 0x0 0x80000000>;
+        access-controllers = <&wgchecker0 0>, <&wgchecker0 1>, <&wgchecker0 2>;
+    };
+
+    flash0: flash@20000000 {
+        reg = <0x0 0x20000000 0x0 0x04000000>;
+        access-controllers = <&wgchecker1 0>;
+    };
+
+    uart0: serial@10000000 {
+        reg = <0x0 0x10000000 0x0 0x00001000>;
+        access-controllers = <&wgchecker2 0>;
+    };
+
+    wgchecker0: wgchecker@6000000 {
+        compatible = "qemu,wgchecker2", "sifive,wgchecker2";
+        reg = <0x0 0x06000000 0x0 0x1000>;
+        #access-controller-cells = <1>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        phandle = <0x100>;
+
+        partition@0 {
+            reg = <0>;
+            sifive,wg-region = <0x0 0x80000000 0x0 0x40000000>;
+            sifive,slot-permissions = <0x0 0x000000cf>;
+            sifive,slot-config = <0x0f>;
+        };
+
+        partition@1 {
+            reg = <1>;
+            sifive,wg-region = <0x0 0xc0000000 0x0 0x01000000>;
+            sifive,slot-permissions = <0x0 0x000000cc>;
+            sifive,slot-config = <0x0f>;
+        };
+
+        partition@2 {
+            reg = <2>;
+            sifive,wg-region = <0x0 0xc1000000 0x0 0x3f000000>;
+            sifive,slot-permissions = <0x0 0x000000cf>;
+            sifive,slot-config = <0x0f>;
+        };
+    };
+
+    wgchecker1: wgchecker@6001000 {
+        compatible = "qemu,wgchecker2", "sifive,wgchecker2";
+        reg = <0x0 0x06001000 0x0 0x1000>;
+        #access-controller-cells = <1>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        phandle = <0x101>;
+
+        partition@0 {
+            reg = <0>;
+            sifive,wg-region = <0x0 0x20000000 0x0 0x04000000>;
+            sifive,slot-permissions = <0x0 0x000000c3>;
+            sifive,slot-config = <0x0f>;
+        };
+    };
+
+    wgchecker2: wgchecker@6002000 {
+        compatible = "qemu,wgchecker2", "sifive,wgchecker2";
+        reg = <0x0 0x06002000 0x0 0x1000>;
+        #access-controller-cells = <1>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        phandle = <0x102>;
+
+        partition@0 {
+            reg = <0>;
+            sifive,wg-region = <0x0 0x10000000 0x0 0x00001000>;
+            sifive,slot-permissions = <0x0 0x000000c0>;
+            sifive,slot-config = <0x0f>;
+        };
+    };
+```
+
+The test overlay used in this tree is at:
+
+* **platform/generic/virt/qemu-virt-wg-overlay.dts**
+
+That overlay supplies the current QEMU virt test metadata for OpenSBI
+domains and protected resources. The base DTB must still provide the checker
+nodes and the CPU-level WorldGuard properties consumed by the runtime code.
 
 ### Assigning HART To Domain Instance
 
-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
