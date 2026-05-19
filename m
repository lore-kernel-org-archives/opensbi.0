Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41176CD4F5B
	for <opensbi@archiver.kernel.org>; Tue, 19 May 2026 20:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wOkQH79eS8RkmGlGwn5aSx4bhDrypyRpfGtgLNJP2NU=; b=haZshboWHnzddX
	HMZwOUzvDdL+oq+zYJ4FW6GpJK9iTTT5GMZkg3nxtzXSlEj1ma1NCeO1QvQ+9cuuBcmSZ/x3eDnif
	rt+qo6AJOMwwdwqbkoSfAS3YQGz7+0JleeIWyX2MtiiIA2/Ac1MbOdfWjobA99PW8PJVtrJ8i1jvd
	wzY9/ZjrK65TAQih1imGmxgLSHak3aqFlE1atIQIyPKo45byYMZlgx0FZoy4AIXJLfXEtevrxzthY
	8rLyXvDSaJowx2+Gr14RaBdXT/QXIjsXarIGWxfKEpagf/AoL+Ua2tOr+uQcEBLZDKNiOxTACTuzN
	ZVaSgWNr6gRGSozN3Rww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPR8W-00000002j0q-0pfT;
	Tue, 19 May 2026 20:33:56 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPR8T-00000002izO-0ONP
	for opensbi@lists.infradead.org;
	Tue, 19 May 2026 20:33:55 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-514ae601df2so18100121cf.0
        for <opensbi@lists.infradead.org>; Tue, 19 May 2026 13:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779222832; x=1779827632; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQoKuC/t+emSHV2TaY2lRWZGlpsyUFbqbo+pTSy46i0=;
        b=ptpFp6pkuwWAFplhnAFfsRNjlt3jmC4igTo05XBEqMgypVg1fNQzMgszit8TOCovJc
         kCSWYFgBdtrWOLM/wA2v5lrDSUyQasH7J3bL+VO6LyEA6hZ32rZHq6CMoJ5iMpWT1Soc
         8taGwqq59nzOi8w+tDHUfpICQFKMs9nHDsphLXmTjDx/G9pv7dJCNV7omPA2pZtBR7SV
         Y9tqg4o4bznCEvNq7xABuuTD+UDDxJZk1AqDjDupUrYpwDqza/IIDC5Z2DYFhuecy15s
         2Js2sG7fbfDct5vS4O7MTLXQx6XrkNR7Jgw4YY0V9XDXJ6iLbpt6sfqEG0lPiNC1VTX9
         mdzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779222832; x=1779827632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qQoKuC/t+emSHV2TaY2lRWZGlpsyUFbqbo+pTSy46i0=;
        b=Zx/HtI66qxfssPvmMzFxGjp5z41cBVjc5c2ZoLOCEDizz5HkGhgmNY31/YWIVVZN5+
         aZcFzHOTFPobNHBPtVz/svi6BmdVuhiUbNzyHkIIKsqf7ofAVHkHSUCNm3KvH+uoZgPI
         F+TbXHQ0fTtlObdvDPsMANFXFYw1XTinv8AtR2cSEX7yjdJN4wEfRDKdaEtQapWkVbk4
         jGuD0aJVTpJH7dVdqAqO+0I8PxvzeR8FRl1ZZ0mCcosBDN6Oa0tU81fEbY1xOUCLOCLy
         7YoetYw0oIbjLhgTBXvLbQqRmU3gfu83aPyIEaIVJ+VBBWrvN97SdDzfNJpAL9oZ6cUA
         pAsw==
X-Gm-Message-State: AOJu0Yw7zuY+OiZVhdU849TZSuGdVnLRJfnf48s97rZtg462RcKFgeOE
	6buLDMKEHygSy/B5GaVASBM0jq+8SJFtFfV219jPvNDPBquIyZbIBt0xwUM79Q==
X-Gm-Gg: Acq92OEZz01beBP90AYii4DwF2n7rsuBsh5lr5ptgVrROiOSTHkOiVQRsni70/XgD04
	EbuT5ALoJIM5RlVzGhAsxd/DfDiABq4JGsXNNVqYHhOsfcO2fN3w3bTBb+oMpAaufBzp9s8yG6v
	81WVudFhiBpiNvQpF9DXSoTGucowFobywHiH/IV0FffRXkY9u5dQLV8PcYHp9GrH2cH6zLMR+gs
	LIOOCsGbpHJc5qy+ClX2pQkWdHDYl7XCs3P3S327h4m6GtZXYDuRUgNqk02HZatpuBmovsTpXc+
	r7L8DnUQwFZ3Qff+7x/F0qDbiSPMelGSxdscAb82Jsn7iDZ6vlIk4I3Klr5aSZSiEVebneCV6gm
	CM0Qz08nvY02OqksOzzyHLGXk+lhIwddeMNK8KWqN1z8gjGksbZife+vL8oOyVas7T53IbKRbr9
	hXMZbFe01nwj7u+NMxm+IvcSibyx8iG2lkQFmxOc6Z+3yfVnCbgkfG8+9vDrM6yv1So7hMIpnzu
	/kp+qnyCLQ=
X-Received: by 2002:a05:622a:1b90:b0:516:510f:2ddb with SMTP id d75a77b69052e-5165a05fcabmr308990431cf.22.1779222831503;
        Tue, 19 May 2026 13:33:51 -0700 (PDT)
Received: from ubuntu.localdomain (172-97-209-197.cpe.distributel.net. [172.97.209.197])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5164581aed3sm173787461cf.23.2026.05.19.13.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 13:33:51 -0700 (PDT)
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
Subject: [PATCH 2/7] docs: document hwiso WorldGuard DT bindings
Date: Tue, 19 May 2026 16:33:26 -0400
Message-Id: <20260519203331.2773185-3-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260519203331.2773185-1-raymondmaoca@gmail.com>
References: <20260519203331.2773185-1-raymondmaoca@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_133353_161793_F23736D7 
X-CRM114-Status: GOOD (  14.93  )
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

Document the hw-isolation and worldguard_cfg device-tree metadata used
by the HWISO framework for WorldGuard-enabled platforms.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 docs/domain_support.md | 159 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 159 insertions(+)

diff --git a/docs/domain_support.md b/docs/domain_support.md
index b34e43aa..d81f1bc6 100644
--- a/docs/domain_support.md
+++ b/docs/domain_support.md
@@ -201,6 +201,165 @@ The DT properties of a domain instance DT node are as follows:
   whether the domain instance is allowed to do system reset.
 * **system-suspend-allowed** (Optional) - A boolean flag representing
   whether the domain instance is allowed to do system suspend.
+* **hw-isolation** (Optional) - A child node acting as a container for
+  system-level hardware isolation mechanisms. Each child node represents a
+  single mechanism configured via its compatible string and properties.
+
+Hardware Isolation Hooks
+------------------------
+
+OpenSBI provides a system-level hardware isolation framework that dispatches
+all registered mechanisms in the following phases:
+
+* **init** - Runs at boot to configure system-level isolation features.
+* **domain_init** - Parses per-domain isolation configuration.
+* **domain_exit** - Runs before switching out of a domain.
+* **domain_enter** - Runs after switching into a domain.
+
+Hardware Isolation Device Tree Binding
+--------------------------------------
+
+The hardware isolation configuration is specified as an optional child node
+named **hw-isolation** under a domain instance node. The **hw-isolation**
+node is a container for one or more mechanism nodes.
+
+The DT properties of a hardware isolation container node are as follows:
+
+* **#address-cells** / **#size-cells** (Optional) - Standard container node
+  properties. They are not interpreted by OpenSBI.
+
+Each hardware isolation mechanism has its own properties and compatible
+string. A mechanism can either use per-domain properties below the domain
+instance node, or parse system-level DT nodes describing isolation hardware.
+
+For the WorldGuard support on QEMU virt, OpenSBI parses the
+following WG-style system nodes:
+
+* **sifive,wgchecker2** - WorldGuard checker node.
+* **reg** - Checker MMIO base/size.
+* **sifive,slot-count** - Number of hardware checker slots.
+* **sifive,subordinates** - List of protected resource phandles owned by the
+  checker.
+* **worldguard_cfg** - Child node of a protected memory or device node
+  describing WorldGuard policy for that resource.
+* **perms** - 64-bit permission bitmap values encoded as **<hi lo>** cell
+  pairs, with either one value for the whole resource or one value per
+  protected range.
+* **reg** - Optional protected address ranges inside a **worldguard_cfg**
+  child. If omitted, the resource node's own **reg** is used. A single
+  subordinate with one **perms** entry and no explicit **worldguard_cfg/reg**
+  is treated as a full-checker rule.
+* **worldguard** - Optional CPU child node compatible with **riscv,wgcpu**
+  providing default WG execution state.
+* **mwid** - Default machine world ID for a hart.
+* **mwidlist** - Valid/delegable world IDs for that hart.
+
+Domain nodes can optionally provide WG execution metadata under the
+**hw-isolation** container:
+
+* **worldguard,wid** - Machine world ID selected when entering the domain.
+* **worldguard,widlist** - World IDs delegated to the domain.
+
+At runtime the WorldGuard implementation uses the hooks as follows:
+
+* **init** - Parses all WG checker nodes, validates the protected ranges, and
+  programs checker MMIO slots at boot when platform checker nodes are
+  present. Runtime WID/WID list support is enabled only when per-CPU WG
+  runtime nodes are present; checker-only DTs do not force runtime
+  switching on.
+* **domain_init** - Parses per-domain **worldguard,wid** and
+  **worldguard,widlist** metadata.
+* **domain_exit** - Quiesces the current hart back to its per-hart default
+  machine WID and clears **MWIDDELEG** before the handoff.
+* **domain_enter** - Reprograms **MLWID**, **MWIDDELEG**, and, when
+  delegation is active, **SLWID** for the destination domain when the hart
+  supports **smwg** / **sswg**.
+
+The CPU **worldguard** defaults are parsed per hart from **/cpus/<cpu>**, so
+platforms may provide different default **mwid** / **mwidlist** values on
+different harts.
+
+Hardware Isolation Examples
+---------------------------
+
+Domain instance with WG execution metadata:
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
+                        worldguard,wid = <1>;
+                        worldguard,widlist = <1 3>;
+                    };
+                };
+            };
+        };
+    };
+```
+
+WG checker, CPU default state, and protected resource example. These nodes
+remain in the normal system DT topology because they describe isolation
+hardware and protected resources, not OpenSBI domain instances:
+
+```text
+    cpu0: cpu@0 {
+        worldguard {
+            compatible = "riscv,wgcpu";
+            mwid = <0>;
+            mwidlist = <0 1 3>;
+        };
+    };
+
+    flash0: flash@20000000 {
+        reg = <0x0 0x20000000 0x0 0x2000000>;
+        worldguard_cfg {
+            perms = <0x0 0xc3>;
+        };
+    };
+
+    uart0: serial@10000000 {
+        reg = <0x0 0x10000000 0x0 0x100>;
+        worldguard_cfg {
+            perms = <0x0 0xc0>;
+        };
+    };
+
+    memory0: memory@80000000 {
+        reg = <0x0 0x80000000 0x0 0x80000000>;
+        worldguard_cfg {
+            reg = <0x0 0x80000000 0x0 0x40000000
+                   0x0 0xc0000000 0x0 0x01000000
+                   0x0 0xc1000000 0x0 0x3f000000>;
+            perms = <0x0 0xcf 0x0 0xcc 0x0 0xcf>;
+        };
+    };
+
+    wgchecker0: wgchecker@10100000 {
+        compatible = "sifive,wgchecker2";
+        reg = <0x0 0x10100000 0x0 0x1000>;
+        sifive,slot-count = <8>;
+        sifive,subordinates = <&memory0 &flash0 &uart0>;
+    };
+```
+
+The test overlay used in this tree is at:
+
+* **platform/generic/virt/qemu-virt-hwiso-overlay.dts**
+
+That overlay only adds per-domain and per-resource metadata. The base DTB
+must still provide the WG checker nodes and per-CPU **worldguard** nodes.
 
 ### Assigning HART To Domain Instance
 
-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
