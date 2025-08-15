Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367C2CA0EE9
	for <opensbi@archiver.kernel.org>; Fri, 15 Aug 2025 13:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=exrWwTWsg+mxBCTF5llTsDEIPn7spq1wOJ5JyZo6q9o=; b=g22+zG3XWQLCqj
	KnPBcjNyhST80o4MNbGeKfY3COT4l+BaG+lATLb5VooPdzukX9d640mDfZtQntgiwRxDcm+2YuPKd
	WAVY4T3QCku4JFTxaMofg076JV9DJNPdYGYRWcb78pvSdpQ2sMR5iUc4aruOY78aOtYhmATHAJbWY
	5lw8qBlKlndQZesXNLYwE9WA0aSqvtHy94WXvUtudSW6dGujPSFDvfbBQ9H01J4G6QFSyF4t6Sc1O
	KQkdO+DcFAkloeE2r223EdxaAjDCM+b+LY0my4z+7IoIKpICjCxtPxDhxUz8jRdN/rpA3WON+QJ5F
	cVY+e4j1OsbCXrcn1log==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umuGb-00000002YO6-2f7k;
	Fri, 15 Aug 2025 13:14:45 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umrFi-000000028lR-2DKn
	for opensbi@lists.infradead.org;
	Fri, 15 Aug 2025 10:01:39 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-76e434a0118so451742b3a.0
        for <opensbi@lists.infradead.org>; Fri, 15 Aug 2025 03:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1755252098; x=1755856898; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYxle48vPkFAm+opreLfoA8tr1MvqGx3kk9OI2IprCI=;
        b=IyNmauDNnv5hlHBsojYd+kHmT0QHbiaBPQhS/0/KFvGPR8T0C6gISiFkAjU3qu6VF4
         1z9A5eQm3jmtQbIyM51U3EebO9/rZ829EdWBOHRrKrSKeA0OKBZjS6SHTxBY33ncg0Zh
         XrRqNDZ0UQEbVF1yUbmVAwUFqTKegdB0qr9OTfbRQZjqRgNoUeLHuzPPRY3X0voPyyxH
         +5OlZAFyRBBVk7/hcX033EdVs71t5hTcSCHlll6hghZAjymZmhjgGa+03vpF80vtG/y4
         MZeFmf0HXe2hN6P6OFzBYu4nCEAStyz+vda+3wEw5HrgmB+LgIdHkJi+tw5AluWJQ35M
         jfIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755252098; x=1755856898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LYxle48vPkFAm+opreLfoA8tr1MvqGx3kk9OI2IprCI=;
        b=oU9TvjBulnlWili2SC/SGfObN+J6ysp6O7B1hTB5XIhrHLglL9JoyYtvAeeg8spw3W
         WJrtd/3WNbT6pLYrqzP6+YIGSZUMCB7p0TMep5JALif1X88t2zPBd9IXBcRubbhlFhbw
         u8lNXdJHkU9RwNSViq+MEE3b62CWRlZCEYKEnGptUpfxJCtDMCYFb4LaeEFnlCtZXlrY
         4yYQ5dLl7th/rYNEJWo/X33pgottj21lIDo3fuItoOMsgr+6zBZaGFCvGX9BC6Q6avN7
         VPRBGl9pHl2mabbsy0hCk21nLdqi250CTKdloaTNvt5m4I0Ct8dG195kmDMSc6rX2iWG
         QT4w==
X-Gm-Message-State: AOJu0YxhOK/cxSmE446+fjyVLfu9HMSeGsRYAzukAx9jhAwLdu6Tpa79
	/y/rny2psfapQofjpWF8kEJopLdtAuNqYpUh2fK99IfKHmH6CjOwPmAxEPdvmjWmi+scBDlz4yC
	oqPbna9VydxZrWiZsRvrTXM2og8/B/POnL1/wZ4tOvRj2ujMv7HZ+YW45Dac57xWVY7IPVSsIcO
	gXjj3XsR65g5hbt6BU9W04vp/hJPDzkr6xiF/AjQawXRyXD9L6NfbEhA==
X-Gm-Gg: ASbGnctfUY3DakaueK+w0BZaljOQuEvzqgqottCLAGeNUTDCaxVZjvUoZ49zemYrTgZ
	jmH9iNZIuo9Ji6jjxLB+a0C+zGJJWK9TVnW9QRbezwORTszNAht3XriE3WE2b7m0Dxv3Wg37IB1
	OaeVALhN8BXjFqVgZ05SMbIhtfAT+73WX/KKzDCPXjuJa6lkILg0Q+0wLp/IfxAajDMUFzEGG0X
	H5RNPJuOIou4WHmwlzVxRP09WhTMJK8WkOkiJn7YA2/Cb81/tlI116iXnRE1lw4csIsYrq8ue3G
	9DXdHBo8hohNaKempxbPNDQvNuSRW+rG2954AN+BT1yueoJeMDU8RTQzsPnmxB5Gqad+awGz4/m
	imCsC0izkjugKcp646pyKh/oRkXrTSk6TlLJ0W+C6Vdc5M/E=
X-Google-Smtp-Source: AGHT+IHAdcjPlJWCHg0Uy6aK9s/W3kGwY7YH6ELHhD8uVXCOh1bdQV2PCq9wptdbmdqP5Q9kdnxqXQ==
X-Received: by 2002:a05:6a20:3d82:b0:20b:a75e:fa32 with SMTP id adf61e73a8af0-240d2f28042mr2793526637.40.1755252097292;
        Fri, 15 Aug 2025 03:01:37 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d5a7a40sm879220a12.9.2025.08.15.03.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 03:01:37 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Subject: [RFC PATCH 7/7] docs: opensbi_config: add description for reserved-pmp-count
Date: Fri, 15 Aug 2025 18:01:15 +0800
Message-ID: <20250815100116.27776-8-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250815100116.27776-1-peter.lin@sifive.com>
References: <20250815100116.27776-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_030138_564060_D36A2EA1 
X-CRM114-Status: UNSURE (   9.53  )
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
Cc: greentime.hu@sifive.com, Yu-Chien Peter Lin <peter.lin@sifive.com>, zong.li@sifive.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

Add documentation for the reserved-pmp-count property, which
specifies the number of additional high-priority PMP entries.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 docs/opensbi_config.md | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/docs/opensbi_config.md b/docs/opensbi_config.md
index 104d82c9..02481800 100644
--- a/docs/opensbi_config.md
+++ b/docs/opensbi_config.md
@@ -26,6 +26,9 @@ The DT properties of a domain configuration DT node are as follows:
 * **heap-size** (Optional) - When present, the specified value is used
   as the size of the heap in bytes.
 
+* **reserved-pmp-count** (Optional) - When present, the specified value
+  is used as the additional number of reserved high-priority PMP entries.
+
 * **system-suspend-test** (Optional) - When present, enable a system
   suspend test implementation which simply waits five seconds and issues a WFI.
 
@@ -40,6 +43,7 @@ The OpenSBI Configuration Node will be deleted at the end of cold boot
             compatible = "opensbi,config";
             cold-boot-harts = <&cpu1 &cpu2 &cpu3 &cpu4>;
             heap-size = <0x400000>;
+            reserved-pmp-count = <2>;
             system-suspend-test;
         };
     };
-- 
2.48.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
