Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC3ECD3423
	for <opensbi@archiver.kernel.org>; Fri,  1 May 2026 18:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y1hKQ1Izma4dWXhNAQby8p3Y3O9sdMK5aZz5k9oE6oc=; b=L4sXnMuFfVt8Kz
	Q0F6NCOFt0eOa8KGkvstIdzp/kbngjJKe8rWz43KizZXC9DMzxdZL+EYapPFYww+ehwVOa2W8cQE0
	nmJl80OIsmBwngkqcuza28pQ0JFr0wxnR/5e58Afaw6Xg1RR5ybwDDIXy5VDx+B5Y6mwLgKsyC86t
	D3H/S+cu5M9hppv3bXL1XptLQroBqeO9aTBkkV7wtCPL8e10XtXZTkvkukkOaf/b+Rns9PAr6AQyz
	9pWA92AlTP+Ul+NRGrPaHDMCwRcDn8UJXMG42avwemBtAiMmaNRNtFEizeW2eNYqw8q5KQW3NcfUM
	r/xed/4OIG2BKUSs1N6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIsgo-00000007ZmA-208f;
	Fri, 01 May 2026 18:34:15 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIsgm-00000007ZkR-1N4R
	for opensbi@lists.infradead.org;
	Fri, 01 May 2026 18:34:13 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-8b3fe2f19a4so20083846d6.2
        for <opensbi@lists.infradead.org>; Fri, 01 May 2026 11:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777660451; x=1778265251; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0U4em0sroFReNzax6pOfkO7oBtK1P9Y3THmOnYMP9as=;
        b=MC797YCKQCByciRBD3634gFsjtKQ0E6Q2fjc8cuDkUTBTG/Ri2kaL+6b54DUTXmlg3
         cRoPnvDmJWn8GsebLgY+nnT1/2uWeK9j4hJgJlRhaRkqXyRWPJxjfvPh+HLGm3Xtb0Q5
         rig7nhMYjIKSTmAW9uUNJF7/nB5jm3RT84tMyeZQ662Pw0CFhduOvhSLmDLWz/gQ6ZZ4
         XvZHtZWgRROA4a18BGiR2d35RPEcSI5NYE3idQfPNuGlIj7pdFQETJO9iDVbZgbse1jq
         a/U6TbNJrHJGJGvjxcxA3yVogpxlZ4XAQUVvY9knG7S0Dr0PL3C+O5DBAI81bo5GZTNu
         WqQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777660451; x=1778265251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0U4em0sroFReNzax6pOfkO7oBtK1P9Y3THmOnYMP9as=;
        b=LAD/8wCOmqEe0cy/CSjgXvn8RSQJDm8OAYiOSEE6Qm323nfioEUpaZOEkZMWlZAxFL
         rKQLHUUNQ0X5hgN9qMNTiK2wUlDrj9U1m5mOGDZDMxRgac/GsxiAhr7RYG4MLLeHal7Z
         JJGRKqwLWDfd85xpn8LFQ+xDK0jsP3K9K7PddWVAbtFCoiuv6bJO0Oh+MgCBw0PwcSXn
         fGiEPW0b2CBjSQqf+9URSEGYTg8F99tS27fZtnQelWVEwkaudcccS66ir9Pfs5O9aPmh
         g9Q/kfi/zHgtTrBIWB0rRF1Evy3zTEruXIkFHYFnZc5xIUeumDZwLrrAKOi7EOBI6MYR
         meWA==
X-Gm-Message-State: AOJu0Ywqj/D6iSeyo04+Nf41u3GujMRoxWdROXEpugCs963SmhI874Lq
	DR4gI80IbnPERTzR9STAE8mxGy8g0cFBf+xxKGZUy4hqU7ERDsUXTrk4BFiIhvWk
X-Gm-Gg: AeBDieu56wMNYWqxeEtuosef4I5As9SLssGJJmLLvN8fQKgLpoN7uSilduxeqKk6toC
	bjy6Wr/0M24MNHxOEIJwpCwLrYVw8BphAxewm3yQn7z5nnOJUrU8oNunWn93n5EYh02bdznGLCy
	DB84CEmmB0E5ny1HLS/CHKqllrzyJQpgcaWnm2oRDApRZTU3gNlJSmjXIUgkoiot5rA9HVABZHj
	9o8HpE2EINvopxlpLRpFb4o1LOto7K/mP97NFDZkQMOq4I+/gpaFkTnUdWZimIigrtKZIBqxnXY
	K3BDI1yY9Ibk84TsyiXgbA3bPFC40Y15omx+wOSYX4ehKyrhBhFab2BK+eDF2Z0zFVn3UkDkfo8
	NzEy7fht9Sj3x9gyuOhkZ/A7qTqk3w2c1+z7TdD4z6JfOIOVU/y9uluHYIwQ+ImnrEaXTGYxri+
	1rPQ+QB7EHUXq1ZuR1llzutzN+j7XyInawIEVTCbe3cqeqxr/ZbHy3YjlpBiKROJoENClJxmAiZ
	lW1JqW/LxfkWbpR3rn2rQ==
X-Received: by 2002:a05:6214:3012:b0:89c:ac72:2f6e with SMTP id 6a1803df08f44-8b6691f764amr11136456d6.43.1777660450740;
        Fri, 01 May 2026 11:34:10 -0700 (PDT)
Received: from ubuntu.localdomain (172-97-209-197.cpe.distributel.net. [172.97.209.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53c1dceddsm29696886d6.30.2026.05.01.11.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 11:34:10 -0700 (PDT)
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
Subject: [RFC PATCH 2/3] docs: document hwiso WorldGuard DT bindings and add QEMU overlay example
Date: Fri,  1 May 2026 14:33:45 -0400
Message-Id: <20260501183346.1596027-3-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260501183346.1596027-1-raymondmaoca@gmail.com>
References: <20260501183346.1596027-1-raymondmaoca@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_113412_394178_06622970 
X-CRM114-Status: GOOD (  18.88  )
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
by the HWISO framework, and provide a QEMU virt overlay example showing
domain WID/WID list assignment and checker permission policy.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 docs/domain_support.md                        | 159 ++++++++++++++++++
 .../generic/virt/qemu-virt-hwiso-overlay.dts  | 120 +++++++++++++
 2 files changed, 279 insertions(+)
 create mode 100644 platform/generic/virt/qemu-virt-hwiso-overlay.dts

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
 
diff --git a/platform/generic/virt/qemu-virt-hwiso-overlay.dts b/platform/generic/virt/qemu-virt-hwiso-overlay.dts
new file mode 100644
index 00000000..63676abb
--- /dev/null
+++ b/platform/generic/virt/qemu-virt-hwiso-overlay.dts
@@ -0,0 +1,120 @@
+/dts-v1/;
+/plugin/;
+
+/*
+ * Test-only overlay for exercising HWISO with WorldGuard metadata.
+ *
+ * This overlay only adds OpenSBI domain metadata and worldguard_cfg resource
+ * policy. The base DTB is expected to already provide the WG checker nodes
+ * and per-CPU worldguard child nodes.
+ *
+ * Usage:
+ * Domain hart phandles are filled in after merge because fdtoverlay does not
+ * reliably resolve CPU-node references against QEMU dumpdtb output here.
+ * See below steps for filling the domain hart phandles (assume the dumped dtb
+ * and merged dtb are represented by 'qemu.dtb' and 'qemu-merged.dtb'
+ * respectively):
+ *   cpu0_phandle=$(fdtget -t x qemu.dtb /cpus/cpu@0 phandle)
+ *   cpu1_phandle=$(fdtget -t x qemu.dtb /cpus/cpu@1 phandle)
+ *   fdtput -t x qemu-merged.dtb /chosen/opensbi-domains/domain@0 \
+ *     possible-harts "$cpu0_phandle" "$cpu1_phandle"
+ *   fdtput -t x qemu-merged.dtb /chosen/opensbi-domains/domain@0 \
+ *     boot-hart "$cpu0_phandle"
+ *   fdtput -t x qemu-merged.dtb /chosen/opensbi-domains/domain@1 \
+ *     possible-harts "$cpu1_phandle"
+ *   fdtput -t x qemu-merged.dtb /chosen/opensbi-domains/domain@1 \
+ *     boot-hart "$cpu1_phandle"
+ */
+/ {
+	fragment@0 {
+		target-path = "/chosen";
+		__overlay__ {
+			opensbi-domains {
+				compatible = "opensbi,domain,config";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				memregion0: memregion@0 {
+					compatible = "opensbi,domain,memregion";
+					base = <0x00000000 0x80000000>;
+					order = <0x1f>;
+				};
+
+				guest0: domain@0 {
+					compatible = "opensbi,domain,instance";
+					regions = <&memregion0 0x3f>;
+					next-addr = <0x00000000 0x80200000>;
+					next-arg1 = <0x00000000 0x82200000>;
+					next-mode = <0x1>;
+
+					hw-isolation {
+						worldguard {
+							compatible = "sifive,wgchecker2";
+							worldguard,wid = <0>;
+							worldguard,widlist = <0 1 3>;
+						};
+					};
+				};
+
+				guest1: domain@1 {
+					compatible = "opensbi,domain,instance";
+					regions = <&memregion0 0x3f>;
+					next-addr = <0x00000000 0x80200000>;
+					next-mode = <0x1>;
+
+					hw-isolation {
+						worldguard {
+							compatible = "sifive,wgchecker2";
+							worldguard,wid = <1>;
+							worldguard,widlist = <1 3>;
+						};
+					};
+				};
+			};
+		};
+	};
+
+	fragment@1 {
+		target-path = "/cpus/cpu@0";
+		__overlay__ {
+			opensbi-domain = <&guest0>;
+		};
+	};
+
+	fragment@2 {
+		target-path = "/cpus/cpu@1";
+		__overlay__ {
+			opensbi-domain = <&guest0>;
+		};
+	};
+
+	fragment@3 {
+		target-path = "/memory@80000000";
+		__overlay__ {
+			worldguard_cfg {
+				reg = <0x00000000 0x80000000 0x00000000 0x40000000
+				       0x00000000 0xc0000000 0x00000000 0x01000000
+				       0x00000000 0xc1000000 0x00000000 0x3f000000>;
+				perms = <0x0 0xcf 0x0 0xcc 0x0 0xcf>;
+			};
+		};
+	};
+
+	fragment@4 {
+		target-path = "/flash@20000000";
+		__overlay__ {
+			worldguard_cfg {
+				perms = <0x0 0xc3>;
+			};
+		};
+	};
+
+	fragment@5 {
+		target-path = "/soc/serial@10000000";
+		__overlay__ {
+			worldguard_cfg {
+				perms = <0x0 0xc0>;
+			};
+		};
+	};
+};
-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
