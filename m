Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F695C9830E
	for <opensbi@archiver.kernel.org>; Wed, 30 Sep 2026 05:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qFpUkDcw2tkttYnEX5DqWX+GAd9phO/jSXX9k6Q+yt8=; b=fmdCrfNN3RCoNb
	eHR9hz1gKTX+L+e4XJoElWxMg9nwFYp3V9bxiY/0mqb7zm4WOzpkwNZYB++175BcjiQiLojKwq8Qo
	mPRku2qiKHjdQWs6n1PgX5JmDZ+6SWG7fBKk5MNoOQ+QQxcZw5K+hS0PyweB+opWrs/6hvTEffGY6
	+iat6DXrsyvLOc+gY5OZwYhoX6Z8CiZ1MZwnW3AvXVr/g4YHKYfCfJLVE2ip20Kv0b7dbuQo8uEfI
	hcFTkdF+e/b3EVfIaIiEBSdirHfjae94wqPkbIvmfaL8T/dP8NgS/zVqAgk1Zdteb+afS1CQTIkhC
	H78yv3NPL9Bu966T+3Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBn5R-000000054Ho-0Nqy;
	Wed, 30 Sep 2026 05:42:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBn5K-000000054FD-0Czr
	for opensbi@bombadil.infradead.org;
	Wed, 30 Sep 2026 05:42:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ZdNV/gMmCQOgnQ0XX2gNwvXXDTqxEyd4Yknna8+UXlg=; b=b/vOeqpqccwW3mHktPujFytMFH
	DLfN0eXnm8CbkaSfKbclz7f822mgnm8wcIlMc020t7lDc5bkRsrrLj5TVWXaxLVYxzO7G44gPTKv3
	cDK2UM/HXiLEVX+WSnkC7anV4rTfWzX0zJhInr9bgauAjyRiwlJ2ti35fnSS84eXw6uMpLtAqvPr/
	KgIHGO6jJ2jzqNH5KhzTBhcTw+tb55y5UY/Iu5HBWJL8pJoaUs10YVwY2tmas16aDsP1HQKWa76dN
	qw2mVuTY5MFKuoph1grRjM2n98Y6Xjmf3H2ehwBZmEpuLWmTmnwm6uL7dUxukhka5eLjbHPmfgYsr
	wGTRZ2Ig==;
Received: from mail-dy2-x0d.google.com ([2607:f8b0:4864:36::d])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBn5H-00000003Nul-1AZ8
	for opensbi@lists.infradead.org;
	Wed, 30 Sep 2026 05:42:29 +0000
Received: by mail-dy2-x0d.google.com with SMTP id 5a478bee46e88-34cde269e1bso145783eec.0
        for <opensbi@lists.infradead.org>; Tue, 29 Sep 2026 22:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1790746945; x=1791351745; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZdNV/gMmCQOgnQ0XX2gNwvXXDTqxEyd4Yknna8+UXlg=;
        b=I9REZoFnye2RFFps+aHfMiOno+SpaIwBAkZo+DmdEBnu3Tn+XIdRJXg0bTAzSEv9Vr
         yC7jZjmpgo9tTQI10yoxVCEnaO6osPZASedJyfFNU++YTuUzuiHTlDyeRgofX/5YBpYw
         SicYJ5UbB/5MAgvFhRqZ/leCALv88yAj3idiLmx8nAKBiGgJEp0c8zzNgBm7dWPUZCQT
         56J7jIRMkSlVnuBfpmaclCVEShkRNudZLjZFdUDstqb5xl6eIsOnmXCq2Enmt0/kdpTn
         z7iPLE0rDbTp+cFs/v2Rwak3Bk8e80R2+CRbRU0WkaQlrKbymZLb2V6bSsXFWstoWlPf
         1nBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790746945; x=1791351745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZdNV/gMmCQOgnQ0XX2gNwvXXDTqxEyd4Yknna8+UXlg=;
        b=0qpYio3DHxmxz39OGf8JzJo6eOCFGaUet/9hUxGo3JsvKGjubFjoorcv4UaMMPCL7T
         O5sly3YPwJhVkOSY7Z3Hndo3Mt45w9SouwkJn/rU7msIJdNKAil3fqGwCWgsr17J9Gug
         ZwIW/LhGNS4nHPfoc3kgR/TRDvchJ5ALd9SCLxnXX9GHj29v+oQohKKlDgHoj3gbZUl5
         nD4AmNB69qIdB6JCZbGc2cjSGV3sjTFJ0ZAX7S/g+f8jgZSoZ6tqHYjj8oD/Dum1KXjO
         YJr2EvXd4a3Ji3cUbD656Gm2Yv1KQrESsRb714egEavqt4trcG7d32IJE+9RLmbj9aRB
         4zIQ==
X-Gm-Message-State: AFq9FYKq1WBZyOC0Jbch9PWzQ9twnFw2Y7Pp+tiBBvi37PZ6FABFfUmS
	kX8JYzpPUH5NRRENWZKitreUhANyG/+IXAcwTwM9W3gjtHH5IrJP2uTIpNsIgctUOZ7X4bc9xej
	6YGhJzkA+ohibyeESJR6VunzGDw/pJSIZ1EmWGaavMjnrfDl4GuX+0Sn+DXXzBJK+KmKm+QWfy/
	XIgsK4cmXB+HP0sSOcr7ZGEGfin6dTLWHGOIzWWgItNIbMlGAamlY=
X-Gm-Gg: AYBFou0uNdP5ZFn+OpqOWxy+x+Aq05/VX8R4p0uaQO22Gp/QJ3mrEDs/T2hZO/b5JoA
	of0XZ4a/cq3dXD8bkeSUfFDfIJ9AK1oI/E3lREqILOtZZU5WCVhPfEPNHtq9WFj/TIiOaab+2Oj
	zvoi5xC2KKk2zHFq6y9HzD6o41wjr7NR9UJf3afmjz1FNiBRfTO27i8HFUv+YSNECTp3iBa0psM
	PPhflmr5lmYY3SBvcaEd69wuQRo4mNgFsZNsYLCSF55TNjszx2OIoWTFK1bUw7FNJ5JR6Y5QZFn
	MogwjDqlQT4N0g3Z81oW2htK7G+ZWZ4+UGZnbLHkm/85q741ctfp6eOJ50giu2TW589457GyGYw
	cxU/Ilp+fct9AlLf5XcsObXMQ0zuyr8anVZd9UL8v8SvvrCvB2kerrbl1b1DR1Ld4yvyTr71MWq
	wwYhh3sKWm+Vf4LP8L8QlHDj7TvwdqNhVyZwrWwIOdPb0CCYg2upVwA2ic+p9qyeOxsS/xVFDE5
	8DYsqo9kyV6vQ==
X-Received: by 2002:a05:7301:fa0e:b0:34c:fedf:ec64 with SMTP id 5a478bee46e88-34cfedff2aemr439771eec.30.1790746944761;
        Tue, 29 Sep 2026 22:42:24 -0700 (PDT)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf4a60283sm910797eec.6.2026.09.29.22.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 22:42:24 -0700 (PDT)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	nick.hu@sifive.com,
	samuel.holland@sifive.com,
	leo.liang@sifive.com
Subject: [PATCH 4/5] platform: generic: Enable feature-configuration support
Date: Tue, 29 Sep 2026 22:42:09 -0700
Message-ID: <20260930054210.3498806-5-leo.liang@sifive.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260930054210.3498806-1-leo.liang@sifive.com>
References: <20260930054210.3498806-1-leo.liang@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_064227_462371_491A44DC 
X-CRM114-Status: GOOD (  12.33  )
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

Add generic_feature_config_init(), wired as the generic platform's
feature_config_init operation, which calls feature_config_probe() to
match the current hart against a registered vendor driver.

An unrecognised vendor or core leaves the subsystem inactive and boots
normally.

Enable the SiFive driver in the default configuration.

This completes the feature-configuration framework: the generic
platform can now apply vendor CSR values to supported cores without
platform-specific code, and a platform needing different values can
override them from its own feature_config_init operation after
delegating to generic_feature_config_init() for the defaults.

Signed-off-by: Leo Yu-Chi Liang <leo.liang@sifive.com>
Assisted-by: LLM
---
 platform/generic/configs/defconfig           | 2 ++
 platform/generic/include/platform_override.h | 1 +
 platform/generic/platform.c                  | 7 +++++++
 3 files changed, 10 insertions(+)

diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 98829884..252fd8fa 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -86,3 +86,5 @@ CONFIG_FDT_MPXY_RPMI_PERFORMANCE=y
 CONFIG_FDT_MPXY_RPMI_SYSMSI=y
 CONFIG_FDT_MPXY_RPMI_MM=y
 CONFIG_FDT_MPXY_RPMI_LOGGING=y
+CONFIG_FEATURE_CONFIG=y
+CONFIG_FEATURE_CONFIG_SIFIVE=y
diff --git a/platform/generic/include/platform_override.h b/platform/generic/include/platform_override.h
index 1b8127cb..8e7657a4 100644
--- a/platform/generic/include/platform_override.h
+++ b/platform/generic/include/platform_override.h
@@ -17,6 +17,7 @@
 bool generic_cold_boot_allowed(u32 hartid);
 int generic_nascent_init(void);
 int generic_early_init(bool cold_boot);
+int generic_feature_config_init(bool cold_boot);
 int generic_final_init(bool cold_boot);
 int generic_extensions_init(bool cold_boot);
 int generic_domains_init(void);
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 1df0280d..0ea5dfb7 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -23,6 +23,7 @@
 #include <sbi_utils/fdt/fdt_fixup.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/fdt/fdt_pmu.h>
+#include <sbi_utils/feature/feature_config.h>
 #include <sbi_utils/irqchip/fdt_irqchip.h>
 #include <sbi_utils/irqchip/imsic.h>
 #include <sbi_utils/mpxy/fdt_mpxy.h>
@@ -234,6 +235,11 @@ int generic_early_init(bool cold_boot)
 	return fdt_cmo_init(cold_boot);
 }
 
+int generic_feature_config_init(bool cold_boot)
+{
+	return feature_config_probe();
+}
+
 int generic_final_init(bool cold_boot)
 {
 	void *fdt = fdt_get_address_rw();
@@ -338,6 +344,7 @@ struct sbi_platform_operations generic_platform_ops = {
 	.cold_boot_allowed	= generic_cold_boot_allowed,
 	.nascent_init		= generic_nascent_init,
 	.early_init		= generic_early_init,
+	.feature_config_init	= generic_feature_config_init,
 	.final_init		= generic_final_init,
 	.extensions_init	= generic_extensions_init,
 	.domains_init		= generic_domains_init,
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
