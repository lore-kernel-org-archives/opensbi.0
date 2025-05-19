Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C39C5479B
	for <opensbi@archiver.kernel.org>; Mon, 19 May 2025 21:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7QAVg6KiNulfgvjx7jxIlQt2tAvAOC13wyOu6b1Y+Sc=; b=KrYAjUPD7S7d9a
	HMr4l0ldebxO/uO8macJaQUzEiZgv5+3t/4DiqDu5f+t/9wIr8XTE5MLMWuzm41g86vSV2ukUNnjq
	jUB9C+xKWHsREQ1Dh/OSIYcwo289Y1ArLaQntJPguAgx6yQNEz2jXgQlrLF5FDEHCYJVwuqUE87K9
	NPpSsanGdr8NrlOpTTiewnTxgbM+wggz4/L6HveZITesH4leu2me3fiKQTefomrqUm3mBvzXkEVoo
	oQxZnRoN9yszUy1BJmJ3ZyRizlmK9KVEIZ28SdzoaUYY3+rWG/iaq6gqh/rcVUmaI+KoR+BalC/ET
	EfaXYRJzABybpWJULLeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH8Vr-0000000AgEe-2h1t;
	Mon, 19 May 2025 21:59:11 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH8Vn-0000000AgAC-2kCM
	for opensbi@lists.infradead.org;
	Mon, 19 May 2025 21:59:08 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-231ecd4f2a5so27596985ad.0
        for <opensbi@lists.infradead.org>; Mon, 19 May 2025 14:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747691946; x=1748296746; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFKcLe5tL/ZEyJHa/4h2SSRWYLj97t0SPbVGDouvJGU=;
        b=f30l1KyAPYn4IEyMBQICCPSQ7Tw/17mJUxX6v/IAaD1B/SZn85BoG9D/ILdmJKbgdS
         hLz1jsEvj3nsDdNQuXpDB2UF876KtABlSa1+6M9RA3HwvH8dNB4yrvAxna7ChKY2tsOv
         WlYhoM4pEIMY3FOyViXiDJHBAN/NaaeFOH17rX+19r3ot20nNQCA/KLWkZjbEgbXAdkw
         K8S52q3zf8eGU3Qc0ROx4Up7xy4nHPiqzua2Ka+P7i51tFqqWC5n0FA9l1oQPJW8YtTb
         3TXdcATMV6TtGiM9uqzMJbobsaXD0pN4Ld3RmbxN2vgoB7p8GV4rnTeu7/qHHiSupoiB
         0Riw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747691946; x=1748296746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kFKcLe5tL/ZEyJHa/4h2SSRWYLj97t0SPbVGDouvJGU=;
        b=SR6wT7GbAuMKX+KdEJkSMz20YIkzdSq52/bgzMYg1wN6XGVV4KsGVXfv2IJ30b0rhz
         jA5fPQ0rC4EzpdqPuifE7QBkGQKcYT2CFb09+xOeJpgavn+qrZ8RaDqxNAMXje+PNOkb
         MhyL8tyeEWJf9Ry1jFT504odezFPaIyw9vP8yeqzAM+W52g5o9/h5ED2KBiW9OILqNA2
         IjtJR/LuR2xzSQNqC9JdWfN8UiXwfuOxTQU9+Vi1OTrjMvHQYquMzAFLJLKwhSNGXaic
         8TMlKp7rVT6p0vuz8PIFgwkG0Dy8CxHzutvAgFeg6Hs8jTetRuvI39SBEi7e9zae2eR/
         aSzQ==
X-Gm-Message-State: AOJu0YxWQseMAtS9AZQlFM1oTSfMNwWMKnmJj6k4nwctsWJpDquFaeuG
	9wlPYdOndkCf759CAnZYj8d8mH2wKTkeTUqHKeq0neJiXTWOwnVfzmmB5mk4mWlC
X-Gm-Gg: ASbGncu32vN2EWqxWFaV+ekGCc8XW/UDH8GpWKtUOMo2SdDY03CqujTfzwXtRtv81bT
	/dqHO8qei0T7A/63Yej6RefsVNMAhCRiHV/X0TRgDevVsMSc3mPF4fiqR2LMa+/qSxwVk/fH8RW
	RxziTkxtzUVVDKUxEYIdfrCXg/hbNPhWSrlzShzv/v5HR5rzzTCsfGi4qAHGJY+YhGx6qWpehtm
	gNmUWJ/ibFIs9MqkrEThVKzROF5luAMegksaKzszuvOStrcsuxik9kihFY/tEMTLGCLLjHDVNX/
	jxdYdOFYuzkzdRhBiMQoXp/R+TUzF2s4D0u5WOU6f4xN8Tkb8jLq26evlbKBp2I7jg==
X-Google-Smtp-Source: AGHT+IGkcBzQcDCay1VQunXK9+/8YhewnwP9Q3DElsfNgRbU4Ix8qIs1v74Nsn/Qmd5sMqzK7mf3VA==
X-Received: by 2002:a17:902:d4ce:b0:229:1619:ab58 with SMTP id d9443c01a7336-231de37e895mr192103225ad.43.1747691945759;
        Mon, 19 May 2025 14:59:05 -0700 (PDT)
Received: from localhost.localdomain ([50.175.154.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2320418f249sm46386625ad.215.2025.05.19.14.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 14:59:04 -0700 (PDT)
From: Chao-ying Fu <icebergfu@gmail.com>
X-Google-Original-From: Chao-ying Fu <cfu@mips.com>
To: opensbi@lists.infradead.org
Cc: Chao-ying Fu <cfu@mips.com>
Subject: [PATCH v5 05/10] platform: generic: mips: add a dts file
Date: Mon, 19 May 2025 14:58:42 -0700
Message-ID: <20250519215848.27569-6-cfu@mips.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_145907_704716_1EFC8BF1 
X-CRM114-Status: GOOD (  12.39  )
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

We add a dts file for 4 cores 2 threads each on a Boston board.

Signed-off-by: Chao-ying Fu <cfu@mips.com>
---
 platform/generic/mips/mips,boston-p8700.dts | 347 ++++++++++++++++++++
 1 file changed, 347 insertions(+)
 create mode 100644 platform/generic/mips/mips,boston-p8700.dts

diff --git a/platform/generic/mips/mips,boston-p8700.dts b/platform/generic/mips/mips,boston-p8700.dts
new file mode 100644
index 0000000..6da646c
--- /dev/null
+++ b/platform/generic/mips/mips,boston-p8700.dts
@@ -0,0 +1,347 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 MIPS
+ *
+ */
+
+/dts-v1/;
+
+#define CM_BASE 0x16100000
+#define APLIC_M_BASE (CM_BASE + 0x40000)
+#define APLIC_S_BASE (CM_BASE + 0x60000)
+#define MSWI_BASE (CM_BASE + 0x50000)
+#define MTIMER_BASE (MSWI_BASE + 0x4000)
+#define CPC_TIMER (CM_BASE + 0x8050)
+
+#define IRQ_TYPE_LEVEL_HIGH 4
+#define UART_INT 4
+#define PCIE2_INT 7
+
+#define BITFILE_FREQUENCY 25000000
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	model = "MIPS P8700";
+	compatible = "mips,p8700";
+
+	chosen {
+		stdout-path = &uart0;
+		// For Qemu
+		//bootargs = "root=/dev/sda rw earlycon console=ttyS0,115200n8r";
+		// For a Boston board
+		bootargs = "root=/dev/mmcblk0p5 rw rootwait earlycon console=ttyS0,115200n8r";
+
+		opensbi-domains {
+			compatible = "opensbi,domain,config";
+
+			tmem: tmem {
+				compatible = "opensbi,domain,memregion";
+				base = <0x0 0x80000000>;
+				order = <31>;
+			};
+
+			allmem: allmem {
+				compatible = "opensbi,domain,memregion";
+				base = <0x0 0x0>;
+				order = <64>;
+			};
+
+			tdomain: trusted-domain {
+				compatible = "opensbi,domain,instance";
+				possible-harts = <&cpu0 &cpu1 &cpu2 &cpu3 &cpu4 &cpu5 &cpu6 &cpu7>;
+				regions = <&tmem 0x3f>, <&allmem 0x3f>;
+			};
+		};
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		timebase-frequency = <BITFILE_FREQUENCY>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "riscv";
+			riscv,cbom-block-size = <64>;
+			opensbi-domain = <&tdomain>;
+			mmu-type = "riscv,sv39";
+			riscv,isa = "rv64imafdcsu";
+			status = "okay";
+			reg = <0x00000000>;
+
+			cpu0_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "riscv";
+			riscv,cbom-block-size = <64>;
+			opensbi-domain = <&tdomain>;
+			mmu-type = "riscv,sv39";
+			riscv,isa = "rv64imafdcsu";
+			status = "okay";
+			reg = <0x00000001>;
+
+			cpu1_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu2: cpu@2 {
+			device_type = "cpu";
+			compatible = "riscv";
+			riscv,cbom-block-size = <64>;
+			opensbi-domain = <&tdomain>;
+			mmu-type = "riscv,sv39";
+			riscv,isa = "rv64imafdcsu";
+			status = "okay";
+			reg = <0x00000010>;
+
+			cpu2_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu3: cpu@3 {
+			device_type = "cpu";
+			compatible = "riscv";
+			riscv,cbom-block-size = <64>;
+			opensbi-domain = <&tdomain>;
+			mmu-type = "riscv,sv39";
+			riscv,isa = "rv64imafdcsu";
+			status = "okay";
+			reg = <0x00000011>;
+
+			cpu3_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu4: cpu@4 {
+			device_type = "cpu";
+			compatible = "riscv";
+			riscv,cbom-block-size = <64>;
+			opensbi-domain = <&tdomain>;
+			mmu-type = "riscv,sv39";
+			riscv,isa = "rv64imafdcsu";
+			status = "okay";
+			reg = <0x00000020>;
+
+			cpu4_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu5: cpu@5 {
+			device_type = "cpu";
+			compatible = "riscv";
+			riscv,cbom-block-size = <64>;
+			opensbi-domain = <&tdomain>;
+			mmu-type = "riscv,sv39";
+			riscv,isa = "rv64imafdcsu";
+			status = "okay";
+			reg = <0x00000021>;
+
+			cpu5_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu6: cpu@6 {
+			device_type = "cpu";
+			compatible = "riscv";
+			riscv,cbom-block-size = <64>;
+			opensbi-domain = <&tdomain>;
+			mmu-type = "riscv,sv39";
+			riscv,isa = "rv64imafdcsu";
+			status = "okay";
+			reg = <0x00000030>;
+
+			cpu6_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu7: cpu@7 {
+			device_type = "cpu";
+			compatible = "riscv";
+			riscv,cbom-block-size = <64>;
+			opensbi-domain = <&tdomain>;
+			mmu-type = "riscv,sv39";
+			riscv,isa = "rv64imafdcsu";
+			status = "okay";
+			reg = <0x00000031>;
+
+			cpu7_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x80000000>;
+	};
+
+	pci2: pci@14000000 {
+		compatible = "xlnx,axi-pcie-host-1.00.a";
+		device_type = "pci";
+		reg = <0x14000000 0x2000000>;
+
+		#address-cells = <3>;
+		#size-cells = <2>;
+		#interrupt-cells = <1>;
+
+		interrupt-parent = <&aplic_s0>;
+		interrupts = <PCIE2_INT IRQ_TYPE_LEVEL_HIGH>;
+
+		ranges = <0x02000000 0 0x16000000
+			  0x16000000 0 0x100000>;
+
+		bus-range = <0x00 0xff>;
+
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &pci2_intc 1>,
+				<0 0 0 2 &pci2_intc 2>,
+				<0 0 0 3 &pci2_intc 3>,
+				<0 0 0 4 &pci2_intc 4>;
+
+		pci2_intc: interrupt-controller {
+			interrupt-controller;
+			#address-cells = <0>;
+			#interrupt-cells = <1>;
+		};
+
+		pci2_root@0,0 {
+			compatible = "pci10ee,7021", "pci-bridge";
+			reg = <0x00000000 0 0 0 0>;
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <1>;
+
+			eg20t_bridge@1,0,0 {
+				compatible = "pci8086,8800", "pci-bridge";
+				reg = <0x00010000 0 0 0 0>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				#interrupt-cells = <1>;
+
+				eg20t_mac@2,0,1 {
+					compatible = "pci8086,8802", "intel,pch-gbe";
+					reg = <0x00020100 0 0 0 0>;
+					phy-reset-gpios = <&eg20t_gpio 6 1>;
+				};
+
+				eg20t_gpio: eg20t_gpio@2,0,2 {
+					compatible = "pci8086,8803", "intel,eg20t-gpio";
+					reg = <0x00020200 0 0 0 0>;
+
+					gpio-controller;
+					#gpio-cells = <2>;
+				};
+
+				eg20t_i2c@2,12,2 {
+					compatible = "pci8086,8817";
+					reg = <0x00026200 0 0 0 0>;
+
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					rtc@68 {
+						compatible = "st,m41t81s";
+						reg = <0x68>;
+					};
+				};
+			};
+		};
+	};
+
+	uart0: uart@17ffe000 {
+		compatible = "ns16550a";
+		reg = <0x17ffe000 0x1000>;
+		reg-shift = <2>;
+		reg-io-width = <4>;
+
+		interrupt-parent = <&aplic_s0>;
+		interrupts = <UART_INT IRQ_TYPE_LEVEL_HIGH>;
+
+		clock-frequency = <BITFILE_FREQUENCY>;
+
+		u-boot,dm-pre-reloc;
+	};
+
+	lcd: lcd@17fff000 {
+		compatible = "img,boston-lcd";
+		reg = <0x17fff000 0x8>;
+	};
+
+	flash@18000000 {
+		compatible = "cfi-flash";
+		reg = <0x18000000 0x8000000>;
+		bank-width = <2>;
+	};
+
+	soc {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "simple-bus";
+		ranges;
+
+		aplic_s0: interrupt-controller@16160000 {
+			#interrupt-cells = <0x00000002>;
+			compatible = "riscv,aplic";
+			interrupt-controller;
+			interrupts-extended = <&cpu0_intc 9>, <&cpu1_intc 9>, <&cpu2_intc 9>, <&cpu3_intc 9>, <&cpu4_intc 9>, <&cpu5_intc 9>, <&cpu6_intc 9>, <&cpu7_intc 9>;
+			reg = <APLIC_S_BASE 0x00008000>;
+			riscv,num-sources = <0x00000035>;
+		};
+
+		aplic_m0: interrupt-controller@16140000 {
+			#interrupt-cells = <0x00000002>;
+			riscv,delegate = <&aplic_s0 0x00000001 0x00000035>;
+			riscv,children = <&aplic_s0>;
+			compatible = "riscv,aplic";
+			interrupt-controller;
+			interrupts-extended = <&cpu0_intc 11>, <&cpu1_intc 11>, <&cpu2_intc 11>, <&cpu3_intc 11>, <&cpu4_intc 11>, <&cpu5_intc 11>, <&cpu6_intc 11>, <&cpu7_intc 11>;
+			reg = <APLIC_M_BASE 0x00008000>;
+			riscv,num-sources = <0x00000035>;
+		};
+
+		mswi0: interrupt-controller@16150000 {
+			compatible = "riscv,aclint-mswi";
+			interrupts-extended = <&cpu0_intc 3>, <&cpu1_intc 3>, <&cpu2_intc 3>, <&cpu3_intc 3>, <&cpu4_intc 3>, <&cpu5_intc 3>, <&cpu6_intc 3>, <&cpu7_intc 3>;
+			reg = <MSWI_BASE 0x4000>;
+			interrupt-controller;
+			#interrupt-cells = <0>;
+		};
+
+		mtimer0: timer@16154000 {
+			compatible = "riscv,aclint-mtimer";
+			reg = <CPC_TIMER 0x8>,
+			      <MTIMER_BASE 0x7ff8>;
+			interrupts-extended = <&cpu0_intc 7>, <&cpu1_intc 7>, <&cpu2_intc 7>, <&cpu3_intc 7>, <&cpu4_intc 7>, <&cpu5_intc 7>, <&cpu6_intc 7>, <&cpu7_intc 7>;
+		};
+	};
+};
-- 
2.47.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
