Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A23C606A31C
	for <opensbi@archiver.kernel.org>; Thu, 29 Oct 2026 16:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dL4PMnZc;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YmmOfGFD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xc8JD0ybLK3qG0HQS3w60qE5+eaJgnvOOLofmylJYK4=; b=dL4PMnZcyQdjl/iRCMdLodAbJV
	RoucOETiPWPhJ4HMjfcdNd5/mhfPQTaFvcfykyFz0auXnkUGOcLbwW5TERMaJR3Ov/xQisN6AewxG
	6Y373rfnJtYC5pLCRjurrMzwub2RudMwzVgjpBnn6r1d78+N6aHPlzpmeCvQvq1m9Tuq9zoy3kbk3
	JEvASlwLg9AfBulH/4xkD4hChb3n1uKNmWaYOKo92Y5Jpz42fHCZuSohqdQtnkIkSbCzjLsUkOd2B
	/ZtZJ14DKoVrdFWIDSzjNOOoSg+lIGqldH+vU0OCc7XbXyeGDS6kBKNzRCHZgpj3JLNIPnnVlFS2L
	LkHNasiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSYA-00000009ifA-0qHR;
	Thu, 29 Oct 2026 16:00:22 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSY7-00000009ibc-3DEU
	for opensbi@lists.infradead.org;
	Thu, 29 Oct 2026 16:00:21 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-53664b4860bso25720351cf.1
        for <opensbi@lists.infradead.org>; Thu, 29 Oct 2026 09:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793289618; x=1793894418; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hvoA0a/dCv/8bteYHYa9BK4H9hAe5PJC6QfkTDcUZmo=;
        b=YmmOfGFDrFfNLPCmnisr4if7m/uZKqHdfdKnWMib7UxjahOnF8YY7mxYA+raOzhhkf
         ObGL1tu/3zs77Tx7hNM5nbS2VIlfD+a4BATzaIW02PcRuBXKH2MxKvXnO0+ericxLMpK
         2EXhXZyK7EL+lIvD5wl4L+K6b41ILzLOUuyUUj7shvmFHlwBAtX9H9AvcyDoS+bqoiw6
         ukTanNz3ioh73y3aORBasSgNL+5fZ3j0ODovo6nb4Qm9TeGuEI3j3PX5x2IzD4Y4Z9Yb
         ItP4buvfC9uLHpcLLghElv04aQBFlPqws4JtPsH8cIoRwcRzJBo8lhi6FSY2MXgUiGbk
         Xz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793289618; x=1793894418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hvoA0a/dCv/8bteYHYa9BK4H9hAe5PJC6QfkTDcUZmo=;
        b=JkP73Y9QnZIshhRtAqAc33RQ0xH8ldFqJNuTLabpxIIC52NaDkoj7D2EwF+t64w5X6
         tUMMRorZB4CgmQwpGUsAIPKcUckuu8yS5ihPHIQAMcmPfvoXiGQWJKJmXJmIw8pY1VrB
         81lZJ9LFDkAP0HEh7J4Sr8kjQvJ/jBWbAFgtgsn0xWcGpJHzP1xdRy/LbAFWEK6PL+gl
         1hP8Oy+vN7/wWRClxIea0Hl5lBtUJ1QrikCzwoYU2RX7Dmh1F/ftBXS16DFSFH5AMHVE
         TuuT6/DyuzPqAUHYRBeAIOw9tkvrtkpRidPhNy1M08j3SB5VNy5ZUJxeqbUGBH6hvjQ+
         Duxw==
X-Gm-Message-State: AFq9FYLI3vD3Wc3T5Uq7w6qA+KsxySy1jiepl4eHbV0EZYEfZ+0M0xep
	t+cS1ao7FtDgDPmgvB5eVkVm6HbaYEV1FDND45nQG/akLcanEMGbHJnilXXqaA==
X-Gm-Gg: AYBFou2DAHxT2pWaMX2DkV7zlZ+mhfItxLdj5VsFJPXUX3grvkQBD6LtaqtyzeAyZvB
	Qsoh5B3jgpuaXHuO5vYzkLARLO53X2LSqDCJauipBZuYifyYPePI5jPpxOWYBcq70897RAeKSB1
	P4JTQUz2RySn5aZ4xrStqSzops/INx8euhuHYjSYgP/Sf/sS8av4OfwBJ6PXp8J5yyOQjAGgMYK
	oHRqCn6FLYHsuuhsMUEUxKwfksdCSRTGiw1shQ4ZwXG4kEL498FnyvP1Qt9siG2IQ0P0ILRphsF
	d8XOTxec/TGhYVsRpvjNEnwtzCA/PhHCswE0o1LgB229a3xFBez+MfzgtyXLxZTY18LEeEsL1ya
	/4ypFavE1DA702ENroqC5FYxDgYXKdf/Q57Gg/az/M93GNiOHrZDvytBI7L37zO0r7/Px/0cIuE
	2ggq3czeZhy9y5FU4w0qmuYu5AVXHnFc/qH7dmT1M73SSkYvL8kOt3C2Rg7MFvypYhBqxke72Il
	PD9xQKSKAvHuaWPs7qV8NCA2rRxGKh/gtCI3H4SUy+Lo91r22chqI+LlP4Xgu8JogpcDxPtKxU3
	PQVO32hoFAs+/JbVVqqCJQeNP8XLTaHKNafCrmY9j9BfAWFtAQyObUg+buYeuZmrqHib6aYH6cB
	1JAipTMwt9gW1rg==
X-Received: by 2002:a05:622a:5e10:b0:531:17a2:4e4a with SMTP id d75a77b69052e-53fcc3cfdbamr86014441cf.47.1793289618105;
        Thu, 29 Oct 2026 09:00:18 -0700 (PDT)
Received: from ubuntu.localdomain (69-171-141-154.rdns.distributel.net. [69.171.141.154])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-538394f82cfsm133231001cf.13.2026.10.29.09.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:00:16 -0700 (PDT)
From: Raymond Mao <raymondmaoca@gmail.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	anup.patel@oss.qualcomm.com,
	scott@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	peter.lin@sifive.com
Subject: [PATCH v2 12/12] [NOT-FOR-UPSTREAM] platform: generic: Add sample dts overlays for testing hwirq/domain route rules
Date: Thu, 29 Oct 2026 11:59:29 -0400
Message-Id: <20261029155929.586597-13-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261029155929.586597-1-raymondmaoca@gmail.com>
References: <20261029155929.586597-1-raymondmaoca@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_090019_832753_FD495F51 
X-CRM114-Status: GOOD (  15.52  )
X-Spam-Score: -2.1 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Raymond Mao <raymond.mao@riscstar.com>

Introduce rpmi_sysirq_intc nodes with interrupts-extended property
for VIRQ testing.
- Routing rules are derived from sysirq nodes by:
      interrupts-extended =
         <&aplic HWIRQx IRQ_TYPE>, // virq 0
         <&aplic HWIRQy IRQ_TYPE>, // virq 1
         ...;
- VIRQ numbers are allocated from zero, implicit from the order
  of the entries in the interrupts-extended property.

During cold boot, route rules are converted and cached for VIRQ
routing/couriering purpose, and DT IRQ entries activate courier delivery.

hwirq_bind_domain.dts is for testing with a single domain/hart.
Domain1 owns UART hwirq 10 via 'interrupts-extended'.

hwirq_bind_domain_linux_bmapp.dts is for testing with multiple
domains/harts. It models two BM domains alongside the root domain
on 'QEMU virt -smp 4'. Domain1 and domain2 share hart2 as boot hart
and each maps its own bm-app RAM region and the UART region;
domain2 owns UART hwirq 10 via 'interrupts-extended'.
Bind CPU hart2 to domain1 and set explicit init-order values to keep
hart2 in domain1 for initial execution. Load the BM payloads at
0x88000000 and 0x89000000 to exercise domain1 -> domain2 -> domain1.

Keep the configured courier sources 10, 20 and 21 in the M-mode APLIC
and delegate the remaining sources to its S-mode child. This preserves
Linux interrupt delivery without delegating the BM domains' IRQs.

Usage:
1. Compile the overlay.
   $ dtc -@ -I dts -O dtb -o <dto_file> \
         platform/generic/virt/<dts_overlay_file>
2. Dump the base dtb from QEMU via arg
   '-machine dumpdtb=<dtb_qemu_base>'
3. Apply the overlay on the base.
   $ fdtoverlay -i <dtb_qemu_base> -o <dtb_qemu_merge> <dto_file>
4. Re-run QEMU with adding argument '-dtb <dtb_qemu_merge>'

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 platform/generic/virt/hwirq_bind_domain.dts   | 107 +++++++++++++++
 .../virt/hwirq_bind_domain_linux_bmapp.dts    | 125 ++++++++++++++++++
 2 files changed, 232 insertions(+)
 create mode 100644 platform/generic/virt/hwirq_bind_domain.dts
 create mode 100644 platform/generic/virt/hwirq_bind_domain_linux_bmapp.dts

diff --git a/platform/generic/virt/hwirq_bind_domain.dts b/platform/generic/virt/hwirq_bind_domain.dts
new file mode 100644
index 00000000..93f21d0b
--- /dev/null
+++ b/platform/generic/virt/hwirq_bind_domain.dts
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: BSD-2-Clause
+/dts-v1/;
+/plugin/;
+
+/ {
+	/*
+	 * Fragment 0: OpenSBI domain configuration under /chosen
+	 */
+	fragment@0 {
+		target-path = "/chosen";
+		__overlay__ {
+			opensbi-domains {
+				compatible = "opensbi,domain,config";
+
+				/*
+				 * DRAM region for domain1 (2GB from 0x8000_0000).
+				 * base is 64-bit: <hi lo>, order is log2(size).
+				 */
+				memregion_dram_2g: memregion_dram_2g {
+					compatible = "opensbi,domain,memregion";
+					base  = <0x0 0x80000000>;
+					order = <31>;
+				};
+
+				/*
+				 * UART MMIO region so S-mode payload can access UART registers
+				 * without fault. 0x1000_0000 size 4KB.
+				 */
+				uart0_mmio: memregion_uart0 {
+					compatible = "opensbi,domain,memregion";
+					base  = <0x0 0x10000000>;
+					order = <12>;
+				};
+
+				/*
+				 * Domain instance:
+				 * - possible-harts = <cpu0 phandle> (cpu@0 phandle is 1)
+				 * - regions use label references (fdtoverlay will fixup phandles)
+				 * - IRQ routing is defined by sysirq nodes under
+				 *   /chosen/opensbi-domains
+				 */
+				domain1: domain1 {
+					compatible = "opensbi,domain,instance";
+
+					/* cpu@0 phandle in base qemu dtb is 1 */
+					possible-harts = <0x1>;
+
+					/*
+					 * Keep permissive for test.
+					 * access=0x3f: enable all M+SU R/W/X flags (test only).
+					 */
+					regions = <&memregion_dram_2g 0x3f>,
+						  <&uart0_mmio 0x3f>;
+
+					/* Route rules are supplied via sysirq nodes. */
+				};
+
+				rpmi_sysirq_intc: interrupt-controller {
+					compatible = "opensbi,mpxy-sysirq";
+					interrupt-controller;
+					#interrupt-cells = <1>;
+
+					/*
+					 * VIRQ numbers are allocated from zero, in order.
+					 * Each entry: <&irqchip hwirq flags>
+					 * flags: IRQ_TYPE_LEVEL_HIGH = 4
+					 */
+					/*
+					 * Base DTB (qemu_linux_test.dtb) phandle:
+					 * /soc/interrupt-controller@c000000 -> 0x09
+					 */
+					interrupts-extended =
+						<0x09 10 4>, /* VIRQ 0: UART RX */
+						<0x09 20 4>, /* VIRQ 1: test */
+						<0x09 21 4>; /* VIRQ 2: test */
+
+					/* MPXY channel id allocated by system designer */
+					opensbi,mpxy-channel-id = <4>;
+
+					/* Route VIRQs to domain1 */
+					opensbi,domain = <&domain1>;
+				};
+			};
+		};
+	};
+
+	/*
+	 * Fragment 1: Assign cpu0 to domain1 using label reference
+	 */
+	fragment@1 {
+		target-path = "/cpus/cpu@0";
+		__overlay__ {
+			opensbi-domain = <&domain1>;
+		};
+	};
+
+	fragment@2 {
+		target-path = "/soc/interrupt-controller@c000000";
+		__overlay__ {
+			/* Keep courier IRQs 10, 20 and 21 in the M-mode APLIC. */
+			riscv,delegate = <0x0a 1 9>, <0x0a 11 19>,
+					 <0x0a 22 96>;
+			riscv,delegation = <0x0a 1 9>, <0x0a 11 19>,
+					   <0x0a 22 96>;
+		};
+	};
+};
diff --git a/platform/generic/virt/hwirq_bind_domain_linux_bmapp.dts b/platform/generic/virt/hwirq_bind_domain_linux_bmapp.dts
new file mode 100644
index 00000000..d26e4237
--- /dev/null
+++ b/platform/generic/virt/hwirq_bind_domain_linux_bmapp.dts
@@ -0,0 +1,125 @@
+// SPDX-License-Identifier: BSD-2-Clause
+/dts-v1/;
+/plugin/;
+
+/ {
+	fragment@0 {
+		target-path = "/chosen";
+		__overlay__ {
+			opensbi-domains {
+				compatible = "opensbi,domain,config";
+
+				d1_uart_mmio: memregion_domain1_uart_mmio {
+					compatible = "opensbi,domain,memregion";
+					base  = <0x0 0x10000000>;
+					order = <12>;
+					mmio;
+				};
+
+				d1_bmapp_ram: memregion_domain1_bmapp_ram {
+					compatible = "opensbi,domain,memregion";
+					base  = <0x0 0x88000000>;
+					order = <24>;
+				};
+
+				d2_bmapp_ram: memregion_domain2_bmapp_ram {
+					compatible = "opensbi,domain,memregion";
+					base  = <0x0 0x89000000>;
+					order = <24>;
+				};
+
+				/*
+				 * Domain instance:
+				 * - possible-harts uses CPU node phandles
+				 * - regions use label references (fdtoverlay will fixup phandles)
+				 */
+				domain1: domain1 {
+					compatible = "opensbi,domain,instance";
+					init-order = <1>;
+
+					/*
+					 * QEMU virt -smp 4 dumpdtb phandles:
+					 * cpu@1 -> 0x05, cpu@2 -> 0x03
+					 */
+					possible-harts = <0x05 0x03>;
+					boot-hart      = <0x03>;
+
+					/*
+					 * Keep permissive for test.
+					 * access=0x3f: enable all M+SU R/W/X flags (test only).
+					 */
+					regions = <&d1_bmapp_ram 0x3f>,
+						  <&d1_uart_mmio 0x3f>;
+
+					next-addr = <0x0 0x88000000>;
+					next-arg1 = <0x0 0x1>;
+					next-mode = <0x1>;
+				};
+
+				domain2: domain2 {
+					compatible = "opensbi,domain,instance";
+					init-order = <2>;
+
+					/*
+					 * QEMU virt -smp 4 dumpdtb phandles:
+					 * cpu@1 -> 0x05, cpu@2 -> 0x03
+					 */
+					possible-harts = <0x05 0x03>;
+					boot-hart      = <0x03>;
+
+					regions = <&d2_bmapp_ram 0x3f>,
+						  <&d1_uart_mmio 0x3f>;
+
+					next-addr = <0x0 0x89000000>;
+					next-arg1 = <0x0 0x2>;
+					next-mode = <0x1>;
+				};
+
+				rpmi_sysirq_intc: interrupt-controller {
+					compatible = "opensbi,mpxy-sysirq";
+					interrupt-controller;
+					#interrupt-cells = <1>;
+
+					/*
+					 * VIRQ numbers are allocated from zero, in order.
+					 * Each entry: <&irqchip hwirq flags>
+					 * flags: IRQ_TYPE_LEVEL_HIGH = 4
+					 */
+					/*
+					 * Base DTB (qemu_linux_test.dtb) phandle:
+					 * /soc/interrupt-controller@c000000 -> 0x09
+					 */
+					interrupts-extended =
+						<0x09 10 4>, /* VIRQ 0: UART RX */
+						<0x09 20 4>, /* VIRQ 1: test */
+						<0x09 21 4>; /* VIRQ 2: test */
+
+					/* MPXY channel id allocated by system designer */
+					opensbi,mpxy-channel-id = <4>;
+
+					/* Route VIRQs to domain2 */
+					opensbi,domain = <&domain2>;
+				};
+			};
+		};
+	};
+
+	fragment@1 {
+		target-path = "/cpus/cpu@2";
+		__overlay__ {
+			opensbi-domain = <&domain1>;
+		};
+	};
+
+	fragment@2 {
+		target-path = "/soc/interrupt-controller@c000000";
+		__overlay__ {
+			/* Keep courier IRQs 10, 20 and 21 in the M-mode APLIC. */
+			riscv,delegate = <0x0a 1 9>, <0x0a 11 19>,
+					 <0x0a 22 96>;
+			riscv,delegation = <0x0a 1 9>, <0x0a 11 19>,
+					   <0x0a 22 96>;
+		};
+	};
+
+};
-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
