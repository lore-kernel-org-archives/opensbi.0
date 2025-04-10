Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADDC1C369A6
	for <opensbi@archiver.kernel.org>; Thu, 10 Apr 2025 23:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gnWYEE+ujWhiOHC1SqtF6pCRe6Y+65L7HlLBq8hyofY=; b=Welbc7NRTMZeVB
	r2BGbn6RQ5jmImX1SjrJTnHBuNMBivJbx49bEfGldkWY00NR3bAzhJl6mdtVnFEVXpQpXeUq9o6Tw
	y6siFGT6J1SCnmTr2/AwxLp4ezMaB7MsZ6PUt8vPKOrBFdV8s16/99RhR98vJ7zhU0It1ctmcOEcH
	ab7NT11gaiFsdD06WveMKH3iPhzcy6oAcO48YJOknMMDJzseC6GT3zicgQ1P4uwj81yfxSjQurKmX
	KRUv2FmB4o2mhCTHDjqN0KQ58T6KD4ys8332Dk9UzyamtqUybBAT1VsjobupxzakTmNOpEGnCzI7/
	HlyzR38wLoS8oCZoHPbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u31Rg-0000000C49i-35YN;
	Thu, 10 Apr 2025 23:36:32 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u31Rd-0000000C46P-41CU
	for opensbi@lists.infradead.org;
	Thu, 10 Apr 2025 23:36:31 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-30572effb26so1314445a91.0
        for <opensbi@lists.infradead.org>; Thu, 10 Apr 2025 16:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744328188; x=1744932988; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TNlcA2BwzetvICtrh32pQqFiVj3UF+/sGZ67m33sX1s=;
        b=m3E1pSm4oNrblj5fh2WMETv2s7Qo8nPhFr012WPF2D5JYDmSItOjoX0TUsnDfcHh5v
         yznoMcL9o2w4XKZ/3HnAd5fNGBEoZ237xi4o/FJ2NfoV2WBhzXtQ2cu92Nxn9p1U4Wi1
         NKeLMTs6VuuTGqQP1T+8M4Vc+zb7NgJXNzI3gGBHkm2AQHa3I3+6YYnPOX3rhX5GuXcK
         mGsOKxZaz+azsWU04bcRNsdxXFi8cZbW0Ar6uzDWdnbaX0kOrQAJimEAM8CKHvG14HjH
         aUOrUmKXhbOp01T1kX6sefnDrgnLo4PkDlERpUhRYmIx4zdyTu1tg8gmsGWKhAkWJ1Zr
         /5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744328188; x=1744932988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TNlcA2BwzetvICtrh32pQqFiVj3UF+/sGZ67m33sX1s=;
        b=Pm3n47/mC4EEDLWMoAwBh/Gbf35ddC1BWSqCPAi+0nJBgc/KrJPP0dVnnPXTrlCL1z
         HkSTf0SkZwaEm4jVFdfEO3VAqNrZoABuzh7o+1bVXYEa0fz12Q+kydJu87xl9zdNQsb4
         Sz/3GklOZTjHKLYsvrMiKET4tO+6b3YO0x1lo6idaZBxubQiZYTSqQ8eTDyqaghP7Nwl
         DsEZgudyMpYrrjEJOjXxtvqs+pWwwlec0CwPszD63OS+GfpeiVTnJm6IwpcN+PaLHwhU
         YB4tr/E2vIcnu3LfDeKoz/WUwUsSafqW0E/ndZDA1uy34nX8CEBWRHwPV7MtP70+d6Kl
         q9cA==
X-Gm-Message-State: AOJu0YyMbfAZJ3znp+1PbWRdkAv6jcZTvYbJpDpm1LaD3YwyqJPihGaR
	9KnjIYW6PjT4Fx9bHI2pPjgrT9Gd4tyTzb9L0oHH2bNxnBOQtZI5T6nAmc0o
X-Gm-Gg: ASbGnctBV1UwAtDG13JC3CYP8cfB+b4JnaepkPX+mwWSmacLI9bQ7SCAjj9sc7hmmlH
	+594gPsWbHTHBgNPAA+ExYuwnqgEfIo9c0dlT1RHvfp1LRqGC02ifnQTvGrzlz22GVtHVAhdouI
	qlxn8IZDliFbKj1CuXr1UcHxk6B5m74xiMCs5QKE4KsgfRdXOSCZuXn34FxY75ERyJrBsrtXm9P
	2fOlrY0zh6V2mOkPLYymXnVtfOs1Yy4oQJuk/sqHEwfsJxX/jKpwpOa79MhOxPupWcLT5I+vBpb
	KTpTpz8eqsc6VEfwtJb0RRUNoeLrCtzPWz2qW0Wur1bntyarjnQlWoGnducVR7ORJ57SSbUYD21
	Q3ZkbVzb6GXhn
X-Google-Smtp-Source: AGHT+IGOe0TAyQSluxJuuvIJV/qQK2BRRZEOY0eKJ8hueBMt5dSbCZGjhpngUSl1afUmuL6slOGtjg==
X-Received: by 2002:a17:90b:5403:b0:301:9f62:a944 with SMTP id 98e67ed59e1d1-308237cde17mr1285225a91.33.1744328188359;
        Thu, 10 Apr 2025 16:36:28 -0700 (PDT)
Received: from localhost.localdomain (36-231-65-80.dynamic-ip.hinet.net. [36.231.65.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c992aasm36686985ad.157.2025.04.10.16.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 16:36:27 -0700 (PDT)
From: Chao-ying Fu <icebergfu@gmail.com>
X-Google-Original-From: Chao-ying Fu <cfu@mips.com>
To: opensbi@lists.infradead.org
Cc: Chao-ying Fu <cfu@mips.com>
Subject: [PATCH v3 7/9] platform: generic: mips: add a dts file
Date: Thu, 10 Apr 2025 15:45:33 -0700
Message-ID: <20250410224536.25021-8-cfu@mips.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_163629_998651_D87A6C56 
X-CRM114-Status: GOOD (  12.06  )
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
 platform/generic/mips/mips,boston-p8700.dts | 339 ++++++++++++++++++++
 1 file changed, 339 insertions(+)
 create mode 100644 platform/generic/mips/mips,boston-p8700.dts

diff --git a/platform/generic/mips/mips,boston-p8700.dts b/platform/generic/mips/mips,boston-p8700.dts
new file mode 100644
index 0000000..a8de86e
--- /dev/null
+++ b/platform/generic/mips/mips,boston-p8700.dts
@@ -0,0 +1,339 @@
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
