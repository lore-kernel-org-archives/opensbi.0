Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59760C79F80
	for <opensbi@archiver.kernel.org>; Fri,  4 Sep 2026 16:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=urjvdy6wZWqsWECmArc/0y/LOvAswnZkiGQDDax0OME=; b=Q7Ep3Eg+Wrk4gI
	MRVlj8jZ37a7uHrk+pl/z/an/QDslkdg2S+V29WS4XOk7IEgQfeUjxEVrLjRbeOLw5vSc9ElAVGqH
	uKG4Nvx0MFW9BXA+oy+DMUfqP19Yx7HdrNH9n4ytDVmlDkCLbnKynv/4HTPJyjAft+GiHYaPt+sWh
	cZjL38yJ9DXcHcOFbmKMelHpXdda4Dt88GutNlUIy+FKktxDuEnzQp86VCVKU750hu2USzJqIEK0Z
	FN/N9JMUsq9WXu9NsTEQGW66siA4dcrd4Mx4i1g/PBR0NjhfOEowbFUm707hySGjE6rjrWEBiMs5s
	HD2EuuXyQ89QtGz8I8ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WnO-00000002jey-1cV9;
	Fri, 04 Sep 2026 16:29:42 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WnL-00000002jc9-3VIS
	for opensbi@lists.infradead.org;
	Fri, 04 Sep 2026 16:29:41 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-90cd8e45460so17717686d6.1
        for <opensbi@lists.infradead.org>; Fri, 04 Sep 2026 09:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788539378; x=1789144178; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=46C4/72A6wHXO+NhWcwDblqnRorgmnqfvELjKSDGp38=;
        b=Ha1qfRb1JE59ti4CKNmP/POjP8C2LqBcnGXOEACqYQzQxVTCfUHEVTGpNJBKaYiu0w
         FUjQZuyrpbHyWMJWyafQolYq3k5M0zn9QDubIZQu4T/EzFIRMas3T/Pkd1civzVJvwn7
         lrnTSqe0XNB7+PcO+8IRXx3UdL1CUSq9EtmDYGSLXc44pM/LfNRLyL6GvMFUttjSvIxg
         qPftYKo2vtLy6yqmU2IhDCazQABdtm837sd36K6Cxrx0fokJy8H0Bg0D4NHhZryoEEA/
         OpV93dEq5MZt4Yy8cs/tkudSwNPv1hhzH4l9iM5AdNkBC0GSPHeiEQyoqFKV3nlTwd98
         j+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788539378; x=1789144178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=46C4/72A6wHXO+NhWcwDblqnRorgmnqfvELjKSDGp38=;
        b=CxxeyjFlgFPtuZI4x7fHQTarY5ZcfH6PY76YjeH4TF9FSNk4snZxsHEORIOYEs4ryo
         svER070J1liITyQra+3bWyLrBlyaAKZ/8J+1/53sQtRVqatauJGT4ByYXpXcmuTnwv/R
         hW1wX9F+7leSXvjiFAdHkwC8AjSx33DwoYLAKd7KF2EBmR+3Blg3eLP0Xo3fe6jfrSWt
         kPYfVd+OraOnsoloyOBb2IRNJb3cTWUznwY9NTRuDu0X9LiWFFeq7As11jcDooJb3Jy/
         mwCEhTxox7ajA/c0KWtKKv3j9rK+a3hzfW1DYGBfSsX+KC5srh3IQIs6PsIEK/hpmzZR
         HBow==
X-Gm-Message-State: AFuF++kUNUVXASdCFz+GB0fsoihWb60NUCpkESq6XhM3311MfLHiMMbf
	tzwQp+e4hwKDH2Jcd6yIeBiZ6EtqFow4FRIc7xlcN/tYZfDNNbDbdiIo9ts0iA==
X-Gm-Gg: AYBFou1pGCzg3GffjODXnnC+FSigyk+S4z/7JHDGgXOIM3gME45N1zOAf7SurzIWXGG
	+JMLbHM/z42wrNSEDPGZx/be0yS9TE6kv0WkpwLZK6hHHTKz62JyCQqj/aAke/3NaC5IKHk+qnE
	MeDY49SjgrVTc32nKFAJaPTpvxRj8Rdi262YvGCH7AUooFp6E5YPzhdyFnaUWoBBwt57jxY94zd
	cui6YvvnJofvYEvpumJEhSY27AzY3Byxr8JWqgmB6yFSwAVy1bwSzK9uGsqu1YVIgi2rUuE5CaY
	d8yyFZFMV4wcCCYiyM0y/J1dZebQVggysMsGiRoYRPXExwfD72wad0DbVlUQDwYFCb0VtdjlBzk
	QKWrcdlRilCP4Zt3zBu/5sI8c+D6lRgI9MfxtZmUEx4z82LtmQY/G6SIDOpgUYMjBmX94Bqevc+
	LjtsznZAc3MSYY+q9EmyKVbB4g0DvgkWKi3gY6LF8ZcgcRJiC1SGe93TrjJWitss1U5901sgfsb
	60Z8uumzgc=
X-Received: by 2002:a05:6214:268e:b0:910:4702:23ed with SMTP id 6a1803df08f44-9104702269bmr6671646d6.27.1788539378388;
        Fri, 04 Sep 2026 09:29:38 -0700 (PDT)
Received: from ubuntu.localdomain ([209.227.130.181])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-910405966f0sm24432386d6.6.2026.09.04.09.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 09:29:38 -0700 (PDT)
From: Raymond Mao <raymondmaoca@gmail.com>
To: opensbi@lists.infradead.org
Cc: anup.patel@oss.qualcomm.com,
	scott@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	peter.lin@sifive.com
Subject: [PATCH v3 5/5] [NOT-FOR-UPSTREAM] platform: virt: add QEMU WorldGuard overlay
Date: Fri,  4 Sep 2026 12:29:15 -0400
Message-Id: <20260904162915.1092353-6-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260904162915.1092353-1-raymondmaoca@gmail.com>
References: <20260904162915.1092353-1-raymondmaoca@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_092939_900427_5085EB2E 
X-CRM114-Status: GOOD (  12.00  )
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
test and demo flow.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 .../generic/virt/qemu-virt-wg-overlay.dts     | 198 ++++++++++++++++++
 1 file changed, 198 insertions(+)
 create mode 100644 platform/generic/virt/qemu-virt-wg-overlay.dts

diff --git a/platform/generic/virt/qemu-virt-wg-overlay.dts b/platform/generic/virt/qemu-virt-wg-overlay.dts
new file mode 100644
index 00000000..e629df89
--- /dev/null
+++ b/platform/generic/virt/qemu-virt-wg-overlay.dts
@@ -0,0 +1,198 @@
+// SPDX-License-Identifier: BSD-2-Clause
+/dts-v1/;
+/plugin/;
+
+/*
+ * Test-only overlay for exercising WorldGuard domain metadata and
+ * WorldGuard checker access-controller rules.
+ *
+ * This overlay adds:
+ * 1. OpenSBI domain metadata for domain-local WID policy
+ * 2. access-controllers partition metadata and consumer references
+ *
+ * The base DTB is expected to already provide:
+ * - WorldGuard checker nodes
+ * - /cpus worlds properties
+ * - per-hart worlds properties
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
+			opensbi,worldguard-sbiunit;
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
+			access-controllers =
+				<0x100 0x0>,
+				<0x100 0x1>,
+				<0x100 0x2>;
+		};
+	};
+
+	fragment@4 {
+		target-path = "/flash@20000000";
+		__overlay__ {
+			access-controllers = <0x101 0x0>;
+		};
+	};
+
+	fragment@5 {
+		target-path = "/soc/serial@10000000";
+		__overlay__ {
+			access-controllers = <0x102 0x0>;
+		};
+	};
+
+	fragment@6 {
+		target-path = "/soc/wgchecker@6000000";
+		__overlay__ {
+			compatible = "qemu,wgchecker2", "sifive,wgchecker2";
+			#access-controller-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			phandle = <0x100>;
+			linux,phandle = <0x100>;
+
+			partition@0 {
+				reg = <0>;
+				sifive,wg-region =
+					<0x00000000 0x80000000 0x00000000 0x40000000>;
+				sifive,slot-permissions = <0x00000000 0x000000cf>;
+				sifive,slot-config = <0x0f>;
+			};
+
+			partition@1 {
+				reg = <1>;
+				sifive,wg-region =
+					<0x00000000 0xc0000000 0x00000000 0x01000000>;
+				sifive,slot-permissions = <0x00000000 0x000000cc>;
+				sifive,slot-config = <0x0f>;
+			};
+
+			partition@2 {
+				reg = <2>;
+				sifive,wg-region =
+					<0x00000000 0xc1000000 0x00000000 0x3f000000>;
+				sifive,slot-permissions = <0x00000000 0x000000cf>;
+				sifive,slot-config = <0x0f>;
+			};
+		};
+	};
+
+	fragment@7 {
+		target-path = "/soc/wgchecker@6001000";
+		__overlay__ {
+			compatible = "qemu,wgchecker2", "sifive,wgchecker2";
+			#access-controller-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			phandle = <0x101>;
+			linux,phandle = <0x101>;
+
+			partition@0 {
+				reg = <0>;
+				sifive,wg-region =
+					<0x00000000 0x20000000 0x00000000 0x04000000>;
+				sifive,slot-permissions = <0x00000000 0x000000c3>;
+				sifive,slot-config = <0x0f>;
+			};
+		};
+	};
+
+	fragment@8 {
+		target-path = "/soc/wgchecker@6002000";
+		__overlay__ {
+			compatible = "qemu,wgchecker2", "sifive,wgchecker2";
+			#access-controller-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			phandle = <0x102>;
+			linux,phandle = <0x102>;
+
+			partition@0 {
+				reg = <0>;
+				sifive,wg-region =
+					<0x00000000 0x10000000 0x00000000 0x00001000>;
+				sifive,slot-permissions = <0x00000000 0x000000c0>;
+				sifive,slot-config = <0x0f>;
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
