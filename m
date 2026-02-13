Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4DDEF99CF
	for <opensbi@archiver.kernel.org>; Fri, 13 Feb 2026 19:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5e0C/cdPBRUbp6HPqTRJKerVFIOwRlwsBILxGDfDDpY=; b=osm1TCqZhOHeVf
	4OGxGr0xBfqPNATUQV7Nu7u/XRgwfsfClq0fSt1Qx6MABnHIorUUwT9I7xv3HvdDdzP/wA1IxjMsG
	ZBD9/Fr9k2JDow8aQJJjXHTeA6SNpS7f3EUdDkPLPJhy826bP/tyhkP2VUrcVTNvqmqEAfZ+Y9PQA
	jMt6zT0L/MV48QqoaWwwSkUlrQDD9PSn6N5qSWgX5wfxt/QymzSf2tUlhHHkVCMfNoFlpt+xqKG9y
	xDEYD5gvK+SKeYPjx7I2lei3DyIn5PlqpRTxCAh0kCcmFFG0p0f8OZb2GB0Yi67kwH0MGm5qO7DKu
	LLBENGGFlomk/Pr9JuLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqyTX-00000003pCq-2myl;
	Fri, 13 Feb 2026 19:05:11 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqyTV-00000003pBh-26Y3
	for opensbi@lists.infradead.org;
	Fri, 13 Feb 2026 19:05:10 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-895071c5527so16158106d6.1
        for <opensbi@lists.infradead.org>; Fri, 13 Feb 2026 11:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771009508; x=1771614308; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sniyK3wcs5gTAY3FkwDMDQQvPdFT0dn3n9/tPeMD4QI=;
        b=C+p+WdsSdcRdifhIo/+axFutGQ6UPj+USfMLwVGZi+RO7kzJ6vXu68vsQS178d9nMo
         L9vJHTp2tkMP+4qmhRkSBS/noo1JY+1JAMUiYjfeN1ntAkjrGA+1DmTQKUj2MQTrbcfi
         wDiy7yVK95GPRYf5Uh4uRdmLkbmKVQK4Wy1t0JGYE2RaU0jCBpGbXMWtMsc7oT/WLF6R
         K1ip+x4MbYV6u/l7g88dH1dqTjXB33v/bPJv2nH5nLPWmp3wiJsbIcue62kBStaTxBKS
         RL38VwpDbJtmY3bewIKaOTyCPI2zGn3WChu5AQincPCf4e/+Y8EiH9LMfWMHq9/17cxY
         +fgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771009508; x=1771614308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sniyK3wcs5gTAY3FkwDMDQQvPdFT0dn3n9/tPeMD4QI=;
        b=rf1jhLCfFMYAXSY/O7OcWSrga2zQlslY1Z3MBp+O68GUeoc5oXJuWxCHNLHcttRcEC
         C1UIzToHrd/h6v9bSZ1KA2YvW9ouy6nGq+G+f3LRzWikQBV1QVnES1eDPGC2Cw5ohsVw
         +LWHI76hzRSGaNyVJ/WKl4Qr8pMnyEHqrNiocFZxBImVBYtSQwIz68g1DZF9kz+wuZd1
         xDVP4ytf/N2JiIE4V41kZtO3G+eeB7GK+4mUMzGaHyyuaC07Ty6ekcyoaUwGw+wWmrUM
         ST87F3CJmwDNEMUAX4Y0v4eypbjlV8q0Xq3p1BDVgeESEzi+tmgXECnmk15ih7NLDB9R
         X3aA==
X-Gm-Message-State: AOJu0YyV7BhYl1cDB+leyfrNre4z3g+eAsDK1L/ZBE99EPZ5uVhkducG
	mc6UlpKgSp9m2KXI1DnvWOaftyLHZ8LeH5DGw6jOMz68301EqPpC35OdAIwAxw==
X-Gm-Gg: AZuq6aIzI0ZD5MY3dwDrJzG7yUq/B9gLuruQ8s56/ZfaVjdDg/oeKKmYOk8XeMFN6D9
	9y0HkTQH/pmSkwt3tKmdY9Aff2ijCzi6wMMh0eUVZwKzfu5iO9yYwLWoqMBgLmk4C9yCMdCnHfL
	7gSpfrOtpyGJgxgX3EgUJL0Au23wl3wAO6LdIWgB/ZFZMJSXSKmyMXvc3C3U7Gp9xmodmQzkevN
	KLeu7xtsvh9LdtQZBeCfXYUeFMN0hsyvkEJ2IfMrSfxAN3uAgexLvT04y/3T90dLA82KPpBjO3r
	4ZGKtNDSDXMjzxZQiwWefK38cCVfcOhLcd38a090Lnda7Nidget5HpO4ScpYvvKFwzRIcmP4fhY
	gwfnYVADT2Z7xggdTPyWnuy1wcsKyczWw5Dt7GWiUxZFDI/nWZ9Xi+8ZCtD24XYv6dtPN7xjAo+
	z2vXp6dQ3K3xTzfV/AwaDJwRGQFTqxlPCGAHGDPZT0nzNWonfFFMw6ft0iAagffXQtGOzFCDolV
	XiGioORTIo=
X-Received: by 2002:ac8:7d48:0:b0:4ed:64c1:16ec with SMTP id d75a77b69052e-506b3fa5bd8mr7455711cf.23.1771009508118;
        Fri, 13 Feb 2026 11:05:08 -0800 (PST)
Received: from ubuntu.localdomain (174-138-202-16.cpe.distributel.net. [174.138.202.16])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cd8b1bfsm70420096d6.28.2026.02.13.11.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 11:05:07 -0800 (PST)
From: Raymond Mao <raymondmaoca@gmail.com>
To: opensbi@lists.infradead.org
Cc: scott@riscstar.com,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	anup.patel@qti.qualcomm.com,
	anuppate@qti.qualcomm.com,
	dhaval@rivosinc.com,
	peter.lin@sifive.com
Subject: [PATCH RFC 2/3] platform: generic: Add sample dts overlay for testing hwirq/domain route rules
Date: Fri, 13 Feb 2026 14:04:58 -0500
Message-Id: <20260213190459.2540597-3-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260213190459.2540597-1-raymondmaoca@gmail.com>
References: <20260213190459.2540597-1-raymondmaoca@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_110509_548052_4B98180E 
X-CRM114-Status: GOOD (  12.04  )
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

Add sample dts overlay for testing hwirq/domain route rules.
Each domain uses property "opensbi,host-irqs" to describe one hwirq
route rule.
  'opensbi,host-irqs = <first_hwirq count> ...;'

During cold boot, route rules are converted and cached for VIRQ
routing/couriering purpose.

Usage:
1. Compile the overlay.
   $ dtc -@ -I dts -O dtb -o hwirq_bind_domain.dto \
         platform/generic/virt/hwirq_bind_domain.dts
2. Dump the base dtb from QEMU.
   $ qemu-system-riscv64 -M virt,aia=aplic-imsic -cpu rv64,zkr=on -m 4096 \
         -nographic -bios out/platform/generic/firmware/fw_jump.bin \
         -machine dumpdtb=qemu.dtb
3. Apply the overlay on the base.
   $ fdtoverlay -i qemu.dtb -o qemu_merge.dtb hwirq_bind_domain.dto
4. Re-run QEMU with adding argument '-dtb qemu_merge.dtb'

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 platform/generic/virt/hwirq_bind_domain.dts | 79 +++++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 platform/generic/virt/hwirq_bind_domain.dts

diff --git a/platform/generic/virt/hwirq_bind_domain.dts b/platform/generic/virt/hwirq_bind_domain.dts
new file mode 100644
index 00000000..b836901e
--- /dev/null
+++ b/platform/generic/virt/hwirq_bind_domain.dts
@@ -0,0 +1,79 @@
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
+				 * - possible-harts = <cpu0 phandle> (your cpu@0 phandle is 1)
+				 * - regions use label references (fdtoverlay will fixup phandles)
+				 * - opensbi,host-irqs uses <first count> pairs (NO chip phandle)
+				 */
+				domain1: domain1 {
+					compatible = "opensbi,domain,instance";
+
+					/* cpu@0 phandle in your base qemu dtb is 1 */
+					possible-harts = <0x1>;
+
+					/*
+					 * Keep permissive for test.
+					 * access=0x3f: enable all M+SU R/W/X flags (test only).
+					 */
+					regions = <&memregion_dram_2g 0x3f>,
+						  <&uart0_mmio 0x3f>;
+
+					/*
+					 * Route rule: Bind host HWIRQs ranges to this domain.
+					 * Format: <first_hwirq count> ...
+					 * If no route rule matches, HWIRQs default to root domain.
+					 *
+					 * UART RX is hwirq=10 on QEMU virt:
+					 *   fdtget -t i qemu_merge.dtb /soc/serial@10000000 interrupts
+					 *     => "10 4"
+					 *
+					 * Start with only <10 1> for clean bring-up.
+					 */
+					opensbi,host-irqs = <10 1>;
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
+};
\ No newline at end of file
-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
