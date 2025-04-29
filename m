Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862E1C3ABA9
	for <opensbi@archiver.kernel.org>; Wed, 30 Apr 2025 00:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7QAVg6KiNulfgvjx7jxIlQt2tAvAOC13wyOu6b1Y+Sc=; b=XSAxKRiHT8q4pB
	whkvtRxnLoxu+dtkLNdASrpb5jB+kA9dFmCXF4yid90lg79rU40xSaa6Bj3+LJG0Ekot92LmVKpfz
	fSFzmnpAmFq7+A83zcA0of8CnDPKd7LZWWN7cZOQRbCuAD2AvtgpWVpt/QpCxVX/ETSFScv0CpI0c
	YkaIrw+JpQJaesbc4vIG7QWH527BuauwqJtthsrhiCxg3TGZ4jvkB2Pwtb++aN6wejA4V1VoGSiR9
	Vfe7SJJE/8wRU4Fg/YND7HQmU62htlzbMQDP77nI5okaOs67G4f8t5CH1fwMKlTEQlVeDLG7XBZDd
	wQHHv2/htTfxc+m9J5Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9uyt-0000000BDmE-3qpv;
	Wed, 30 Apr 2025 00:07:19 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9uyr-0000000BDi9-0Xkn
	for opensbi@lists.infradead.org;
	Wed, 30 Apr 2025 00:07:18 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-227d6b530d8so73935265ad.3
        for <opensbi@lists.infradead.org>; Tue, 29 Apr 2025 17:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745971635; x=1746576435; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFKcLe5tL/ZEyJHa/4h2SSRWYLj97t0SPbVGDouvJGU=;
        b=CCYIRN1ImqvKIzXNKGPivqEaO3/Cgxea3CxX0ZzQ30ev2BvXJCUxk6JYXSM8lVp3hQ
         nbvAn37ltyWkRelnjx/WXW13+v7xWy18W2DdrFP5nnQWbnHvWvLcEMqs8n6nIDJtHY9q
         yYAtCQggGAOGUNNxwYfyNX+ZJCjK72o4rdSd8XNcM0fxxKIJNMBNyHmNSOHp0aL83VMp
         miegLWSWEbP32Az5XpsVqI3bd7PHFhTmidFR/8YGyIkPJx+2N6BT4/T1XGaAkVTdxEYk
         cK632QlatSRCIa92MzZQOrbyFUlufPJHmRXqgsKkQlk39IeRIgsZ23pLaWWBIyadXJ5W
         6NkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745971635; x=1746576435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kFKcLe5tL/ZEyJHa/4h2SSRWYLj97t0SPbVGDouvJGU=;
        b=a0GjNYNcAuuvm/+aAx5vOueBZO3CUrHqsHgSXKI59slDkqhB6rr8YJXMoWqAPuKWeT
         yaGkaMv4aPLYt6aVJqrukQQrUjA9zxd5KeUMYmPbgKPnflg0TctpU759FYmGDy1zP4RW
         0uOg0NVouypZK5b7DCM7GFxouproTJ7QKeItrodSOJuEgDTo5qtL0n1D996lhCkRJHuv
         5Im4A937pp2HepP26znLcy8vlP+pY4UkROUUiC8g4HAUFIihXNSDeI+o4JbOdlPTJrjJ
         RtmjLLJGHr+YEgOJt9corP+JnJFfdsKeZlL8fLxtZZF9dpdfdQ2YFJBNooeSiLsS+WkE
         SNEQ==
X-Gm-Message-State: AOJu0Yzy0jhCMkM1C4+JPZz7ju/rN4QAP3LTV5HomuU94bGl+k6X/Icd
	RZZkNr5evbMd+YhFZhhZD66sCk4Qew7HvYSxITk9o9aQExgvWPRjn36dCA==
X-Gm-Gg: ASbGncupNh0E3OIlsm4EfxR8BSkOIrdcaNo2S+SsxQaYCBvYlbUa2mpP2hIdQaLsacx
	BcFNcQN4hg1vdewKz4EN/wq9McTZ4b1eSo59WBIaYfnLFVdfuwUVQXFPREKMym7Frwsy48AR2nf
	PJnH9koUpwoURa54goLlWAzimP6AQ4fPOvmT/aarwGAsLzyKFJfCPxP+A5CKnqFw7d8GU/WJNzu
	1yVjbJ9/FxfZSs0ViMbTGUEwmsTkAWFBTDE+aySs+xWZLpsKY6fMNK/p+4sIzP5WTojFXhvrrrO
	c51qMpXW88hMhytc3eYfXRbYLvYguNpy0km7Piu6W14onLJTE5BqLA==
X-Google-Smtp-Source: AGHT+IFEN3FAHLvGa06/1OZd0O30d4A01gXtoniq1Ftr4rSHmAkaFPDrhgsbH8dIcooz5/R6++C8nA==
X-Received: by 2002:a17:903:24e:b0:224:910:23f6 with SMTP id d9443c01a7336-22df35ca98fmr15840135ad.45.1745971634861;
        Tue, 29 Apr 2025 17:07:14 -0700 (PDT)
Received: from localhost.localdomain ([50.247.98.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7b08sm108953815ad.114.2025.04.29.17.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:07:14 -0700 (PDT)
From: Chao-ying Fu <icebergfu@gmail.com>
X-Google-Original-From: Chao-ying Fu <cfu@mips.com>
To: opensbi@lists.infradead.org
Cc: Chao-ying Fu <cfu@mips.com>
Subject: [PATCH v4 6/8] platform: generic: mips: add a dts file
Date: Tue, 29 Apr 2025 16:29:26 -0700
Message-ID: <20250429232928.6499-7-cfu@mips.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_170717_171043_46C4D9A1 
X-CRM114-Status: GOOD (  12.42  )
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
