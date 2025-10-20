Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB07BCCD1AB
	for <opensbi@archiver.kernel.org>; Mon, 20 Oct 2025 06:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+hIpjADbpEVDsUt7lobBvcj3mH/Gpv8sT3A2IB2zL3A=; b=cqouHFDp9VjYGx
	KAJzKcOkpMDUgpLIcE2sqjGWhgXseTe2umyMgpvSbu2sN4hvn2c43cqZz6/xasweROgU4arOjPmv3
	l/vRfzJdF0poFAhgrk0SUPXIk4YHZrl35a4dNE6RLgtk2Nw3PlKsz+zarE1UK2mcUXF+uNLGWhObd
	MM2RoO1yB6PDyPtCJkjS1wYVCKE96B5mCNCMzsvKwl8R9kETrUIQicvWIYuXpEcayZiPgRcc3AcuC
	6I1SsL0wP3rBU8lWkXSQPW7/DCZzIbkWn/GOoR3QWWzbb0YlifVfevMgTiJSC6im0gvBdYuqgoVDr
	k9v0G1AEXZHaoOieOv2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjMB-0000000C1yH-0tJS;
	Mon, 20 Oct 2025 06:26:59 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjM8-0000000C1ud-3rbo
	for opensbi@lists.infradead.org;
	Mon, 20 Oct 2025 06:26:58 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-782bfd0a977so2900292b3a.3
        for <opensbi@lists.infradead.org>; Sun, 19 Oct 2025 23:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1760941616; x=1761546416; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TOr6orZZi2voU9c2gnc+smUiwPqtZwoZI043heR5KAM=;
        b=bGqPDpP/wvS4lbRXkSPRJ/FluMcFh5QSirowHItEiVP3pGLNiwR/Ol8GV+F9tW6Llq
         v9VQAGgmYpKPWoV/ubJMN2MeQuoHkR/5iP0UbkWoFRst/LGOEZxKdr7rLfAwSR8ou8lC
         jpMJcIxVpZkX4G0fSrYujARlN4ZE8wsBTC1MlzYbNnZ9JWkTpFemE5djwsGv1w9gyznf
         qlmKVBENxlWs17sQgrrcYRfE2MSAgC1AEi3WvqlOqR5g88Tq1RO0R9sqzagaIpMGbl9k
         uUPF/v2p/7foi2LK5ZRFYQ5p5B9E0eKgYYRU0fRA+Lso/2gPnZqjLQtMl/OrklQ/IMVa
         MzSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760941616; x=1761546416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TOr6orZZi2voU9c2gnc+smUiwPqtZwoZI043heR5KAM=;
        b=DFcmxwS7EBC3MmycH3rqg6OaGyqh6KJXDUtrkkD/1uSmw1YN4A22o4B9JMuOhvnYy0
         jr9A9atF1nzw4JC6aqqqu82i5YjqjWshy8t2X75v6w94MjD1ULfHkPJ+AQfNX4OCu1Mh
         sJOMvnXvJGxftu7iuODW/egVGFWNULNsNTJaa7yj87O5m0bt5j/PIIeUyuPY7eqzxTX1
         7FtXjcwj3Oyu/g4HBJ1XsrftM7zxiDNzkMNfzKkcH2O17kGtAUYOeUuGX8poztfuFPlf
         /7G4y+Y3+whBu9qpxhn4+B8lqCjb67JAB1M9p22Pbqbui/G0rQSsyfN9EI84makTuWKD
         6xZw==
X-Gm-Message-State: AOJu0YwqHe3V3ZbXleYFafGo1oFTsfYAuwbT8Ae2bA4SmCqWqFreDfCZ
	zZGTu65CHpA9pLPdFTOHRbK7B1MtIRM2EDLMcCw23WCgQy0ehmumniMB+W4saE77jTI=
X-Gm-Gg: ASbGnctpRYd8uiOc8HO+05GN2VLrp/WhA4pXA/mzdewO0avK3GtB8iNscSq8mLUxIwD
	0c3SNkWBazhKJCDWE8XlI2JKBJ7EVIK28I4XI9C9bEawjqm4qtPE9zLw82V96tx3xERR/mI4/Q9
	LctkqEeBpuSLebV1SP8NtqZRvHao2fiu3uwkFMpPFUAOsbfA7gEx218topAw3krWzWhPyZrtc+p
	nvgbxQJb+coEL2KIltmFydSEjJt8nRnML54xmXscQZPCr4XeVIYuESDyjnHH1S5g8lTUddzJcy6
	Ko5CsOBLPPzGu7Zd/VaVo5BTYjcGp9ntgl4c6aF+kzSrZJmMpVh6am7idnw2CAaFkGeocS5dKpX
	cGzVega4XK13epSn3kqMVkp68O7C/+IUjv6fLYluKJKXMQ/MhkRtRM/ojKESp0CT3oB+2GKas3D
	SRMgNi4hPlWwBGIHJdfFA=
X-Google-Smtp-Source: AGHT+IEdfPDPmCxfa9cSHgcau6+mdtQA9V9njOJSi85kLHrzTzMSvZLviTsVXDBcfp55XSyYVpW0Wg==
X-Received: by 2002:a05:6a21:999e:b0:32d:b925:2517 with SMTP id adf61e73a8af0-334a85223d2mr14994882637.5.1760941615995;
        Sun, 19 Oct 2025 23:26:55 -0700 (PDT)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff349bcsm7301244b3a.17.2025.10.19.23.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 23:26:55 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
Date: Mon, 20 Oct 2025 14:34:07 +0800
Subject: [PATCH v7 05/12] lib: sbi: Add SiFive proprietary xsfcflushdlone
MIME-Version: 1.0
Message-Id: <20251020-cache-upstream-v7-5-69a132447d8a@sifive.com>
References: <20251020-cache-upstream-v7-0-69a132447d8a@sifive.com>
In-Reply-To: <20251020-cache-upstream-v7-0-69a132447d8a@sifive.com>
To: opensbi@lists.infradead.org
Cc: Cyan Yang <cyan.yang@sifive.com>, Anup Patel <anup@brainfault.org>, 
 Nick Hu <nick.hu@sifive.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_232657_017221_974130A5 
X-CRM114-Status: UNSURE (   7.86  )
X-CRM114-Notice: Please train this message.
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

Using ISA string "xsfcflushdlone" to detect the support of the
SiFive L1D cache flush custom instruction.

Reviewed-by: Cyan Yang <cyan.yang@sifive.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 include/sbi/sbi_hart.h | 2 ++
 lib/sbi/sbi_hart.c     | 1 +
 2 files changed, 3 insertions(+)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 82b19dcfd4582b39e1dafb6bdb41d2fbe77dc419..fdcf400aa8c494cd941c412294bd0c118c5ec2af 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -81,6 +81,8 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_SSCTR,
 	/** HART has Ssstateen extension **/
 	SBI_HART_EXT_SSSTATEEN,
+	/** Hart has Xsfcflushdlone extension */
+	SBI_HART_EXT_XSIFIVE_CFLUSH_D_L1,
 
 	/** Maximum index of Hart extension */
 	SBI_HART_EXT_MAX,
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 1b50f67198d5c2416b3db988c4ac05eba6b9cd53..4159dff54387f677d4fddcf115ebc9f9ed9be86d 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -715,6 +715,7 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
 	__SBI_HART_EXT_DATA(smctr, SBI_HART_EXT_SMCTR),
 	__SBI_HART_EXT_DATA(ssctr, SBI_HART_EXT_SSCTR),
 	__SBI_HART_EXT_DATA(ssstateen, SBI_HART_EXT_SSSTATEEN),
+	__SBI_HART_EXT_DATA(xsfcflushdlone, SBI_HART_EXT_XSIFIVE_CFLUSH_D_L1),
 };
 
 _Static_assert(SBI_HART_EXT_MAX == array_size(sbi_hart_ext),

-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
