Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA79CD4F54
	for <opensbi@archiver.kernel.org>; Tue, 19 May 2026 20:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ih6Js31uBkR/+v5/m3pewkkt6qLE4AwU+1A/qN/089U=; b=ZygxapALKK1h2k
	k43oYs1ZEXBUgDfAMQH3GflK/oWaiF+cnvaUc+7qZZaH63yEYkei3O4udbeBeLTOzqUhrk07lA+vf
	5vAOT6j2Ls5wuJ7230N9Bk42aaiUCbdg3/jAwmqkcnvSoYODAM6QAsaewyGMaVVy9K9khsnFPn9vo
	ULagUU0o4ogviMzyG1CDlI0f++ExEmG4HuGoQnB7hO6e+WLO2AUF4oYxfARIBbcYHzZ1WrFCHMrL1
	KBrxlby0BfgpbmmkOuABioJIaRcW/nHe2xpXIk0RO0MAo5P7kCUO+yJT0XRPqvU2twNcCXm7cmMHa
	eafm5GphyZkj5vwtG3oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPR8Y-00000002j25-1UeO;
	Tue, 19 May 2026 20:33:58 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPR8V-00000002j0R-48o4
	for opensbi@lists.infradead.org;
	Tue, 19 May 2026 20:33:57 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-50d880e6fbbso54850931cf.0
        for <opensbi@lists.infradead.org>; Tue, 19 May 2026 13:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779222835; x=1779827635; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jn33eIm4i+2EmOp2MrE6u0WuGU4vmh+lmWQwiZr+TYY=;
        b=AIusHvpCVuLoNtKZICko42GEIRkard/JZ3vfX0DJ549ovKuBPff+lbhb0OWmg1iOfa
         s0IAtzAvXmUxJ63CqyaoOSD6zD3oYDixsSXzJ78//i+rHwYBeX53yfCed83YhjsJYqZ2
         WTUNN3z5PVLQfiesVOOypAo3oWx8GvXSur6WCVJDdu+JStRGIKfDAQsOSshTvr6dzNgg
         YCKSmSQYstG1rkqIaHAXWhh1rl5idn0XHcNzIYSfaVIQkZW673Y1s8Rq85U0J48qHfyV
         qP8tM12PNSYFJGFJPwnrcKi5Tnjlq6dbULoF5pYjR7g+wNlA1e0eFMDimcQB6eq1urtJ
         AkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779222835; x=1779827635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jn33eIm4i+2EmOp2MrE6u0WuGU4vmh+lmWQwiZr+TYY=;
        b=luvAiRaoYOFfX8Yn00k/jL0rp4lnSPfGUFJxnGuaGwdlZbU6vceVe7e9l2HBz9LEga
         s1OfOG/wieT1e+U0aunC4dc8qbL7yUVHmLiJmWFGkfTvUZUa8G8Po67W06r4i0lNtVmW
         DBLwixU7pNGl7hTbYPDg1PuJs773qMQ3NUn+ny7Yqo3FWCt+6WBqGWaHb6jd4WxrhEzB
         wk9myynXaZTvdf/eiP7mbh4trslM8UXRKjRD35sgTC0dAkM9zd4RTkC6ezqUM5DOakoq
         N9Lzi4PPHBm6EUwPHVhN3c7PYhYmcWZlJ2jcBzuSWhhw0Tw3zPZaJ8xke4g+BfNQeUWA
         29Sg==
X-Gm-Message-State: AOJu0Yymj8mznAI/jZ4f8S6XIIgxQWDBvvIatFfSkrNJgqihG2AfghIx
	blJnbwxrjSmmmlFB7DFARyobD4sKunXbcbI6x95goAHpn1Ga7/h6JRQKRunm5g==
X-Gm-Gg: Acq92OGL64M/VDkkF6iA6L+Xp7GLBFmSOWS6T7HqUIWyXM2wEXqc098AlfOyIZDG8Fz
	p2O4CV+weOfvkuG5WyjeibaYd/fNPZ4fJjddqjVWpl1NskWQ1QQDsaE/bBVwa+LTUtMlp9X5eWG
	O6DXQodowtg9nXujgWmCUBPeSXMbfEipcb3ZPkzTP+XwG2P2f29/5zL5BLD2eVZttXraS4mQRFr
	24cBj9lKMld8hwpZUj52tQNS/x9yg3islbwirnBghGqt0hRVtau4Lvi+PHwPOc0LkKzz6eb6Bir
	eQ/VXu9IDOfpILJqv120DF4XdQ290+uRhPhET137F18QTZi8cbvdGooGNdQ2LlDYOqcnDo1jqSI
	F7ie0hLxrKBjNLcjqmVNvuwGWwnuWnDQIkwU/h0mBUsoYG2pRGxq1Bla1qUPvQak5Xko55ffiQy
	gwEwCtHgM65G4+27BA3/Eao4UNylk5TU00OGniaaYtd4I30YjoN1UmsoNE92fxOQYzvp+tDuK2i
	uISJb3EObnsoyMXyJH3lw==
X-Received: by 2002:a05:622a:3c9:b0:50f:b732:202f with SMTP id d75a77b69052e-516598b83bamr248577001cf.30.1779222834893;
        Tue, 19 May 2026 13:33:54 -0700 (PDT)
Received: from ubuntu.localdomain (172-97-209-197.cpe.distributel.net. [172.97.209.197])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5164581aed3sm173787461cf.23.2026.05.19.13.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 13:33:54 -0700 (PDT)
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
Subject: [PATCH 3/7] [NOT-FOR-UPSTREAM] platform: virt: add QEMU WorldGuard hwiso overlay
Date: Tue, 19 May 2026 16:33:27 -0400
Message-Id: <20260519203331.2773185-4-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260519203331.2773185-1-raymondmaoca@gmail.com>
References: <20260519203331.2773185-1-raymondmaoca@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_133356_040118_859DB313 
X-CRM114-Status: GOOD (  11.35  )
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

Add a QEMU virt device-tree overlay that describes OpenSBI domain
WorldGuard metadata and checker permission policy for the current
HWISO test and demo flow.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 .../generic/virt/qemu-virt-hwiso-overlay.dts  | 121 ++++++++++++++++++
 1 file changed, 121 insertions(+)
 create mode 100644 platform/generic/virt/qemu-virt-hwiso-overlay.dts

diff --git a/platform/generic/virt/qemu-virt-hwiso-overlay.dts b/platform/generic/virt/qemu-virt-hwiso-overlay.dts
new file mode 100644
index 00000000..e44d85b7
--- /dev/null
+++ b/platform/generic/virt/qemu-virt-hwiso-overlay.dts
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: BSD-2-Clause
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
