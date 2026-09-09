Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC98DC79FB7
	for <opensbi@archiver.kernel.org>; Wed,  9 Sep 2026 16:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qvvaKeBAuJa7zeKD6POlaNH8MGvZXAWgEuEwZLsVzxM=; b=rbJCGozWDNmahX
	KmQTWqWPo/NKdKOzL4Z1afZ5binhplS/+UbavMCpm4JnqFKAs10939Dk9wzVf5TTFv/Z9o9eDsnfC
	qIREaVHOBGzEnnyCP8JOQHFZeu7+ARKvb2vfVbkh36h6SksyZgvKxRAc/CRmGMQ4UYCeEmcJc8Pr4
	MceyScqwPyQVeyJxs57KURa2jBNSeclUaU33Lgg/tcjd7Q5GFOphG8JYZtiaYnmFSvQhw60nOkobJ
	KYEmBAP788tJCVWgpkEEf95VZY3h/v56OXx3f+oDZooEUMbZVlvNRhgzj4Q3mOR6PlVhmTI5xCTtH
	/qjRXsZgzFpKgfXiKEBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LCi-0000000CJZb-3Buq;
	Wed, 09 Sep 2026 16:31:20 +0000
Received: from mail-wm2-x08.google.com ([2a00:1450:4864:31::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LCf-0000000CJY1-2SOf
	for opensbi@lists.infradead.org;
	Wed, 09 Sep 2026 16:31:18 +0000
Received: by mail-wm2-x08.google.com with SMTP id 5b1f17b1804b1-4956bc73c0eso23552005e9.1
        for <opensbi@lists.infradead.org>; Wed, 09 Sep 2026 09:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788971476; x=1789576276; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IPFYDo0RR9DRoU5+KDuuA/oFhu0TmNikAlANiqQ9w1w=;
        b=h9lLjDoD86kHhfY9CtRIXU8QkzLFlgzVkrBg9D4+pir1GR6MEmUgoMhidCEJNTmwGk
         3+kKKm85b+L+ugk6UUwi5rLVeLUcw6cySSpZnytLdlQxIVSHw+iKUSyBT9yPBg8g5PvT
         vSUdvV1yGD1EWx6kKJtGSm+ToNBpzz6gwLH+rn7kW309oml2rlBgUc/U3E8xMHh1KBLQ
         RGIS+yKXNPUMkEMoZaFqso2xcQpMBjc5i2XsYeQNUhvAh3ebKpIYCrroFI0P/jpjJSVJ
         9f7cSmNgQ9N2y0Vo8xI5f7qptyVI8+mB07nTljXsqK2aXEzx7e9JIUpBwJEgF0gwIvP7
         H0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788971476; x=1789576276;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IPFYDo0RR9DRoU5+KDuuA/oFhu0TmNikAlANiqQ9w1w=;
        b=ZMeCQh6XXkKIkA+1FLgN9llmgAE3JHEjWrktY8zzrv06PgkWB5nlycSvUdqOwnEjJk
         NQg/pWanY+CkMvx8FZw6rsgTCOdYIDIC5OevO0zTgK9a1Y/oUchO8sQ4vRw0x7Vk9dov
         utgIAQxOY9IPhXZP0gNEiwLkXAXb4Frd6zpEBEZj9VWE+c8+YrxE8d1V6NGxkQ0NxvkA
         eQwPBNX26H1XkNvf/QNZigo/eMyltx2MHwnxNBsuaSxkgGoiggUkSOwKUs1OZJ4nQWji
         wDag+DxRsju9vz3K1efJFK1eZkK1RPvd0pwQH6ZrNF+pjSk6J1AJ/ee3xJSMXBlCsfYK
         e+jg==
X-Gm-Message-State: AFuF++mqJR8j6SVIqrAoo5LhXrncKW7nLTbZpapTsoQk6y1tArMcgsPz
	wZzgblaFf3dn7JIes3n6lZljyOyYrycrUhLMC7ZSw7padXfVYPY2Z0pZbcTZlJ2v
X-Gm-Gg: AYBFou2feKtqW9gNmNWAV1hW/+w4hxFOLvp8IemfWSG6e/bZKF+9duK4LBXYw+BbWut
	1OuuYHHZLFLFWDuaBfQndpDowMocKLMbCZa5suTdvxbnd8rvql+2Op9UcjqT9qArLKTJUyOEWxn
	zd59EHugCNGsKu0dNML783M91fKwXrmVOy1HRLe8IBf6UQ73uKiCH9HWRQcXNS7OT4E1BJuur1e
	LhoZXbT7jT3ccWKDBHbnlolsGk1WB19GLJElX77IQunf+gs89/p0yS36pj2FOIioqEA9XWD4Bup
	nXSMMq7cIEsMQyVW43e4ufzHvYU0qYTq+VmZ7n6eU6o3tQK/eNAjiGafcK10HCaIV0ttZR7gJDM
	sJU/K1wm6Qdz8PAUDzip/iOWIMGgFNO4r99ZAfbQdufRkJ96yM6IkbSjZwUSAjOdX56j+JN50Q4
	IP7vil0BlS93+0jvY0YLL3FKxx6ufoFNmvP7iWzRhWfr27TkJTsk0KZgSc2ylFyrbED9cLs9/bF
	MFGeaWECUPNLTkegwPhVndLNDRgXwRul3NzKY/0uhnVuV292rarsAFjoUIt4q4odgrnfyXunrZX
	TkK/Z9l/RXBHYw==
X-Received: by 2002:a05:600c:4714:b0:49d:462:6eda with SMTP id 5b1f17b1804b1-49d04627387mr271410155e9.28.1788971475607;
        Wed, 09 Sep 2026 09:31:15 -0700 (PDT)
Received: from localhost.localdomain ([84.77.88.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c06f04sm2763705e9.13.2026.09.09.09.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 09:31:14 -0700 (PDT)
From: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
To: opensbi@lists.infradead.org
Cc: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
Subject: [PATCH v2 01/14] include: sbi: add thread safety analysis macros
Date: Wed,  9 Sep 2026 18:23:10 +0200
Message-ID: <20260909162322.29778-3-carlos.lopezr4096@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260909162322.29778-2-carlos.lopezr4096@gmail.com>
References: <20260909162322.29778-2-carlos.lopezr4096@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_093117_638476_B9E371C7 
X-CRM114-Status: UNSURE (   8.72  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

QWRkIG1hY3JvcyB0byBwcm9wZXJseSBndWFyZCBjbGFuZydzIHRocmVhZCBzYWZldHkgYW5hbHlz
aXMgYXR0cmlidXRlcwprZWVwaW5nIGNvbXBhdGliaWxpdHkgd2l0aCBHQ0MsIG9uIHRvcCBvZiBt
YWtpbmcgdGhpbmdzIG1vcmUgcmVhZGFibGUuCgpDbGFuZyA8IDE5IGRvZXMgbm90IHN1cHBvcnQg
Z3VhcmRlZF9ieSgpIFswXSwgc28gZG8gbm90IGRlZmluZSB0aGUKbWFjcm9zIGluIHRoYXQgY2Fz
ZS4KClswXSBodHRwczovL2dpdGh1Yi5jb20vbGx2bS9sbHZtLXByb2plY3QvcHVsbC85NDIxNgoK
U2lnbmVkLW9mZi1ieTogQ2FybG9zIEzDs3BleiA8Y2FybG9zLmxvcGV6cjQwOTZAZ21haWwuY29t
PgotLS0KIGluY2x1ZGUvc2JpL3NiaV92aXNpYmlsaXR5LmggfCAxNyArKysrKysrKysrKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9pbmNsdWRl
L3NiaS9zYmlfdmlzaWJpbGl0eS5oIGIvaW5jbHVkZS9zYmkvc2JpX3Zpc2liaWxpdHkuaAppbmRl
eCBmOTAwYzQ0NTY1YTQuLjk5MzU2MWVmNWVlYSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9zYmkvc2Jp
X3Zpc2liaWxpdHkuaAorKysgYi9pbmNsdWRlL3NiaS9zYmlfdmlzaWJpbGl0eS5oCkBAIC0xNSw0
ICsxNSwyMSBAQAogI3ByYWdtYSBHQ0MgdmlzaWJpbGl0eSBwdXNoKGhpZGRlbikKICNlbmRpZgog
CisvKiBUaHJlYWQgU2FmZXR5IEFuYWx5c2lzIChUU0EpIGFubm90YXRpb25zIGZvciB1c2Ugd2l0
aCBjbGFuZyAtV3RocmVhZC1zYWZldHkgKi8KKyNpZiBkZWZpbmVkKF9fY2xhbmdfXykgJiYgX19j
bGFuZ19tYWpvcl9fID49IDE5CisjZGVmaW5lIFRTQV9BVFRSKHgpIF9fYXR0cmlidXRlX18oKHgp
KQorI2Vsc2UKKyNkZWZpbmUgVFNBX0FUVFIoeCkKKyNlbmRpZgorCisjZGVmaW5lIENBUEFCSUxJ
VFkoeCkgVFNBX0FUVFIoY2FwYWJpbGl0eSh4KSkKKyNkZWZpbmUgR1VBUkRFRF9CWSh4KSBUU0Ff
QVRUUihndWFyZGVkX2J5KHgpKQorI2RlZmluZSBQVF9HVUFSREVEX0JZKHgpIFRTQV9BVFRSKHB0
X2d1YXJkZWRfYnkoeCkpCisjZGVmaW5lIEFDUVVJUkUoLi4uKSBUU0FfQVRUUihhY3F1aXJlX2Nh
cGFiaWxpdHkoX19WQV9BUkdTX18pKQorI2RlZmluZSBSRUxFQVNFKC4uLikgVFNBX0FUVFIocmVs
ZWFzZV9jYXBhYmlsaXR5KF9fVkFfQVJHU19fKSkKKyNkZWZpbmUgTVVTVF9IT0xEKC4uLikgVFNB
X0FUVFIocmVxdWlyZXNfY2FwYWJpbGl0eShfX1ZBX0FSR1NfXykpCisjZGVmaW5lIE1VU1RfTk9U
X0hPTEQoLi4uKSBUU0FfQVRUUihsb2Nrc19leGNsdWRlZChfX1ZBX0FSR1NfXykpCisjZGVmaW5l
IFRSWV9BQ1FVSVJFKGIsIC4uLikgVFNBX0FUVFIodHJ5X2FjcXVpcmVfY2FwYWJpbGl0eShiLCBf
X1ZBX0FSR1NfXykpCisjZGVmaW5lIE5PX1RIUkVBRF9TQUZFVFlfQU5BTFlTSVMgVFNBX0FUVFIo
bm9fdGhyZWFkX3NhZmV0eV9hbmFseXNpcykKKwogI2VuZGlmCi0tIAoyLjUxLjAKCgotLSAKb3Bl
bnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
