Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE233C53209
	for <opensbi@archiver.kernel.org>; Sat, 25 Jul 2026 02:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SzoUPQ2OseBl8zB1B7xivBQiZP8aSq3SRZ/TsyLA8XA=; b=kOUhewyiy+8mCx
	g2JLL2YsOe0QzBf7fkbtG/vwqkB28nkC8DI68saM65fIjwbHX1veWwOGtKuIDwEb/UVPYF2sCQQ6L
	IpjPzcTYkMx+DTjnVawL9mnFvVwAyQ2j2QHjpKdIpyncpFyvTQCHW03NNbagSvRwmLAn2q2FDBvsF
	ydmY5hGQoeUI0EES6OBT6w/gsFOro2QHO7rF30mSLmZUHthUDobz8ldF0ZggcX6T9Bkg8Tz8FEiRu
	BRzhrCDFtz3d/hdz32srKhJXmQ8pTCBE4ezHJ+lQZQktR0QsEZUKThutITUZVyRXZFFB5wDWNiUrb
	79msZb2OKjMj/LvjuzcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnSI7-0000000HUXp-1KLX;
	Sat, 25 Jul 2026 02:39:07 +0000
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnSHm-0000000HUW7-1JGQ
	for opensbi@lists.infradead.org;
	Sat, 25 Jul 2026 02:39:05 +0000
Received: by mail-vk1-xa30.google.com with SMTP id 71dfb90a1353d-5bfa99f8ef8so1381097e0c.0
        for <opensbi@lists.infradead.org>; Fri, 24 Jul 2026 19:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784947125; x=1785551925; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ViNXAqwjL7XvtjjwK45TEWn7DWccrgFNltUeEp2QmjM=;
        b=iOLfVhB/aZZQ41rtW4H2k20pa2j2pQwD+u0CeevHbFe/Q7eBWkVI0Fs4OjluwT7BBl
         rHZ2pgr+0GRBKflyCCVRxkA5BCtxHoAbWpIlFWzx482Hs30DVUlck8wItCyyxaSoWY78
         eYMeeMo1SZrlmgAxcgFqQLjBa8PcBLTYY/zS4cXbDQ0BW/COmXr5heRUYM5H5vXWDua+
         BFbnYKx4eQJeYdc7dGPjpzkXi+RhIegBsVlmkrqEgO97Xcn3JVzudjBWMYWg2ypWOLC6
         41+EIFHV1QFQ55NW7duMzf5S1Q8QYZ0o9zn1x4O2kfXYmx71zMyQZB8UjglbYhNFLtR7
         kNbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784947125; x=1785551925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ViNXAqwjL7XvtjjwK45TEWn7DWccrgFNltUeEp2QmjM=;
        b=LppB+4D5hfzpVJPoLHnGq9/LzAoMFyyKZ8v+aAe986Kag7+i9h7uXWalRFcYbW5WQQ
         VA6Pt6p2oAGCPysBPWmLsk8dyhfCTmNXQ+vXqipUHTVmXZcFSeuD7aBzRl1h3L6DT4BP
         V6XyADh2sqGS8t9EgIjQIBcOGz43azh0qJuQ2XcGN3JUU5fWI704NCMFqe3nOAZ95D69
         Pxgukw4cqS36blrtVrZMPAI389v8ZXMplJ9gIzY8X6YdIbKHtCc2iNqvpxGr00aTC6lZ
         A+/2PZ4S3H6Zf380KKfJHJtcfiMeXOrzXxKE5kea8XpX+gFBl2MHWSJdvT/qr2ubZ6bh
         ay6A==
X-Gm-Message-State: AOJu0YwSvfOt4TRTYxXsomaApQdGSHV+U9NEm3TsYj5KzccmzSZAxNNZ
	RqbT9kh8/E8POO6QXvFJbrL3mdKI4TFl/aG14zFsskmBdr3l0mVOngKNS+xOEg==
X-Gm-Gg: AR+sD130bEhFlISEP+JwFrZbyeSoP4rojyFm5yvoS5HMV0gkika5f87nIczXxHDWL8D
	eFF0J9NGL5CrOJGoYSwzDQGifGWF/nqBJoKwF3QmQ1XuVuMAG1TTKvzM79QBhxOLhfwQWT6O5U0
	I3dUiG2bq0lNstD7gPim6gw2r0aPnB852HA9XeobDDNXAIpVw7ihXe2yQw7QvZZlrjBulRKk6Je
	1br174gu179bmnMiM2Y35A824MDaw7Fij2Fd0lbMNfsb3PHm0R3kjYZIjzPQAkVGnoutLF4K2jR
	hWLQ/TIEl6ejSWrFZyatJfb2UngN5Qf3OAkIyQvsssmIRC3phQAK/LcjTSmfIGZVF61W1c5y+Zc
	kzBf025q4vAYYmPeMcNtk9XUOlq55x9WWnUCNP8QRH2C2Wd0FxAXNhINe3yBvTLY/oN56oXypIq
	Vy/gOPZaNlT0kFonMRM0aF668RDf8P6WREjYN7WAUQCWGHpfje/cwx4WK2EVG5pw7VIc9FPA==
X-Received: by 2002:a05:6122:3111:b0:575:f155:8cd4 with SMTP id 71dfb90a1353d-5c30613d5ebmr602889e0c.0.1784947124938;
        Fri, 24 Jul 2026 19:38:44 -0700 (PDT)
Received: from ubuntu.localdomain (23-91-246-209.cpe.distributel.net. [23.91.246.209])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c305734410sm602529e0c.16.2026.07.24.19.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 19:38:44 -0700 (PDT)
From: Raymond Mao <raymondmaoca@gmail.com>
To: opensbi@lists.infradead.org
Cc: scott@riscstar.com,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	anup.patel@qti.qualcomm.com,
	anuppate@qti.qualcomm.com,
	anup@brainfault.org,
	dhaval@rivosinc.com,
	peter.lin@sifive.com
Subject: [PATCH v2 3/4] docs: document WorldGuard DT bindings
Date: Fri, 24 Jul 2026 22:38:20 -0400
Message-Id: <20260725023821.3795618-4-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260725023821.3795618-1-raymondmaoca@gmail.com>
References: <20260725023821.3795618-1-raymondmaoca@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_193846_371824_F3437210 
X-CRM114-Status: GOOD (  14.44  )
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
 docs/domain_support.md | 186 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 186 insertions(+)

diff --git a/docs/domain_support.md b/docs/domain_support.md
index e267a9f7..596d4dae 100644
--- a/docs/domain_support.md
+++ b/docs/domain_support.md
@@ -204,6 +204,192 @@ The DT properties of a domain instance DT node are as follows:
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
+* **/cpus**
+  * **riscv,nworlds** - Total number of supported worlds
+  * **sifive,trustedwid** (Optional) - Default trusted machine world ID.
+    If omitted, the highest valid world ID is used.
+* **/cpus/cpu@X**
+  * **riscv,pmwid** - Default machine world ID for the hart
+  * **riscv,pmwidlist** - Machine-visible world IDs allowed for the hart
+  * **riscv,pmlwidlist** - World IDs that may be delegated by the hart
+* **sifive,wgchecker2** nodes
+  * **reg** - Checker MMIO base/size
+  * **#access-controller-cells** - Must match the expected checker cell count
+* protected resource nodes with **access-controllers** properties that point
+  to a checker and encode protected address range, permission bitmap, and slot
+  configuration data
+
+For the current implementation, checker policy is parsed from
+**access-controllers** references on protected resources and applied during
+platform-specific WorldGuard setup.
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
+* when **sswg** is present, it also reprograms **MWIDDELEG** and **SLWID**
+* when a domain is quiesced, the hart is returned to its per-hart fallback
+  machine world state
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
+                        worldguard,wid = <0x0 0x1>;
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
+    cpus {
+        riscv,nworlds = <4>;
+        sifive,trustedwid = <3>;
+
+        cpu0: cpu@0 {
+            reg = <0>;
+            riscv,pmwid = <0x0 0x3>;
+            riscv,pmwidlist = <0x0 0xb>;
+            riscv,pmlwidlist = <0x0 0xb>;
+        };
+    };
+
+    memory0: memory@80000000 {
+        reg = <0x0 0x80000000 0x0 0x80000000>;
+        access-controllers =
+            <0x100
+             0x00000000 0x80000000 0x00000000 0x40000000
+             0x00000000 0x000000cf 0x0f>,
+            <0x100
+             0x00000000 0xc0000000 0x00000000 0x01000000
+             0x00000000 0x000000cc 0x0f>,
+            <0x100
+             0x00000000 0xc1000000 0x00000000 0x3f000000
+             0x00000000 0x000000cf 0x0f>;
+    };
+
+    flash0: flash@20000000 {
+        reg = <0x0 0x20000000 0x0 0x04000000>;
+        access-controllers =
+            <0x101
+             0x00000000 0x20000000 0x00000000 0x04000000
+             0x00000000 0x000000c3 0x0f>;
+    };
+
+    uart0: serial@10000000 {
+        reg = <0x0 0x10000000 0x0 0x00001000>;
+        access-controllers =
+            <0x102
+             0x00000000 0x10000000 0x00000000 0x00001000
+             0x00000000 0x000000c0 0x0f>;
+    };
+
+    wgchecker0: wgchecker@6000000 {
+        compatible = "sifive,wgchecker2";
+        reg = <0x0 0x06000000 0x0 0x1000>;
+        #access-controller-cells = <7>;
+        phandle = <0x100>;
+    };
+
+    wgchecker1: wgchecker@6001000 {
+        compatible = "sifive,wgchecker2";
+        reg = <0x0 0x06001000 0x0 0x1000>;
+        #access-controller-cells = <7>;
+        phandle = <0x101>;
+    };
+
+    wgchecker2: wgchecker@6002000 {
+        compatible = "sifive,wgchecker2";
+        reg = <0x0 0x06002000 0x0 0x1000>;
+        #access-controller-cells = <7>;
+        phandle = <0x102>;
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
