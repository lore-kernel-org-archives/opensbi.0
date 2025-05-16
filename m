Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B065FC54754
	for <opensbi@archiver.kernel.org>; Fri, 16 May 2025 15:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K9JN04onqML7R5GeuPy8CcUrreS+XVGrhKcw4F8kQdY=; b=AgALTDqj7CIwPv
	TvyIUXcvCb/jcPWdAvC9/6NVUardrqOVO92FeP2wDPL+HtDms0+B77WvJ/ud9Ep6WF1XFSaMD3Rlx
	7TDGcnrlPNcSzGWaNlWmnzLiFoNaNHoiH9lRPpm2uQaKdKVBDcEniw1yeBJDWIt/0LJV8GXV2LyLl
	Y+5wWf+psC/ECE1PYuN1AuqMO9rsnW2rjcXpgA3iPX/bToujtHDm9juW72Dgp7tOvDjO8ize4hOcZ
	ZrWktURr4zatmkjlUro71Iz+6iB5oP/J88xOEt6kiaOjtccqpQoIxXsfMDWl/nYum8fOCmH/ZrJ3x
	HaU+pRm/J+p17gYfKTcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFxQ9-00000003v7t-0Og9;
	Fri, 16 May 2025 15:56:25 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwsD-00000003pnF-1bHo
	for opensbi@lists.infradead.org;
	Fri, 16 May 2025 15:21:22 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-30e8f4dbb72so534537a91.1
        for <opensbi@lists.infradead.org>; Fri, 16 May 2025 08:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747408879; x=1748013679; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/1C2gjEdI26e9ljiUMDYFLP0898QYHSBS1HCdRqC4CU=;
        b=lUJns5PoUqbIxUMlC2rcntCd8YdDKLlp4ZTIeusPAWORjVh5Qy5JklzjTAB5J+eH1d
         7gKztWG2Ehc4KJhxVVOLGnp3uTi29Q+zKB1gdMMyUeYajuDbVYvrgcpJ8b9pGid95+gU
         PuWdWUXHyVI9Eo91r1zfo6nIcKB2Uj5wKjI4ixQAm0JAdqlUkC8FhWYbAeg0B3fumieb
         tUC6wtvgBZBx2Id/xYTzBtIESevjHk/KDpydyg9ZuTBuN+A9za7r5rYVaDyHyPr3YEJb
         mykRPjl2DzaZvhpeiXFMbfJCfadI8Z+4SLsbDvHeCPuGkLid5l8oZP2pVWZk8y6ndmJo
         zkaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747408879; x=1748013679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/1C2gjEdI26e9ljiUMDYFLP0898QYHSBS1HCdRqC4CU=;
        b=ICkQB10PdWcYIV6X3UV7W9tBnLVCYyOSwCsVXMaXSqE+er86yoT8UNvHyxG0XIOYJ2
         kqYeF3kkecZOiPH7uFZZPBogC8Mhnzae5MIXcXhTUblShxM9XRgUlznB6knj+w7URaDK
         7JUFjRw39pL86BxXpu3dX4+0mVSm5Ft6O78Q4Nb6T/2jG49C+aQuQQYUwFXWbC2m5dRr
         HHejCTfZ+02T02w9e8QikjpHnyr5kB38JGVjEmWN3Psnd9sm7q5KLCWuh0hD0fXG0c3V
         p7mgtxDWzW+mAiVgVbh/rDPa7UNGyx7yl7ktZ0uOu7obQK3Nz2/Kpx5epENsx/DYgprt
         foXA==
X-Gm-Message-State: AOJu0YxVmf3edzLdD+/PWuiIm6eqFVHkGGdM9QxwAeYoH6LrGPNgXuD9
	Q250KGrl9rBaYaNiWlw9IOqAI0CeP5wlKLajUJz/YYy7RN+31dzm20LKRTU8ICagkkBqKsOPFaT
	qHcBsChA=
X-Gm-Gg: ASbGnctaNDMWymjwzqpBuUQ9F2g4u65nIgWAnrFKsojQGyZQupLc5lK/upab+xaOY1t
	pFoC6eCMgEwVp0NCaN1KOZ9tWEF/yTx79zv2QSS3W4x+aIkRFBZ+8PTBDvZ15rcF0uEg7Rsz8+D
	fX3YcqFsJmzneQq/4eMwnArQrR2o0ubzXKCuaiyfWQ2XkZice63bBL81VmmilEZWK1tRbwcsoM7
	ELov/rTKnwR8FJ50O91pQp3PuLQ1Ron3XwJ0v+LvcX+rvF6myx9gA3KZCUMIQP3COMsRDbQIJ+Q
	pHJ40loRamXZxqxNjWY06yRCa5cq0dewDt6DUrb02BZyIVLIlyk4
X-Google-Smtp-Source: AGHT+IG9ss+Gd0YSU0PGH91QCKCMEi9yeA3PUScF/91+S/DVuZwzji2aUPorRGWhEvZuB2UI1bo9lg==
X-Received: by 2002:a17:90b:1dc2:b0:2ee:b2e6:4276 with SMTP id 98e67ed59e1d1-30e8322593dmr4151663a91.27.1747408879307;
        Fri, 16 May 2025 08:21:19 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e7d489fa1sm1738715a91.13.2025.05.16.08.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 08:21:18 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: opensbi@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH] lib: sbi: pmu: Rework SSE callbacks
Date: Fri, 16 May 2025 17:21:05 +0200
Message-ID: <20250516152107.556643-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_082121_418532_6B6D3007 
X-CRM114-Status: UNSURE (   9.74  )
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

VGhlIFMtbW9kZSBQTVUgZHJpdmVyIG1pZ2h0IG5lZWQgdG8gZW5hYmxlL2Rpc2FibGUgU1NFIGV2
ZW50IHJlZ3VsYXJseQppbiBvcmRlciB0byBtYXNrIFNTRSBldmVudHMuVGhpcyBjb21taXRzIHJl
d29ya3MgdGhlIFBNVSBTU0UgY2FsbGJhY2suClNTRSByZWdpc3Rlci91bnJlZ2lzdGVyIG5vdyBq
dXN0IHNldHMgdGhlIE1JREVMRUcgcmVnaXN0ZXIgYW5kCmVuYWJsZS9kaXNhYmxlIG5vdyBzZXQv
Y2xlYXIgTUlFLiBNSVAgY2xlYXJpbmcgaXMgYWxzbyByZW1vdmVkIGZyb20KcG11X3NzZV9lbmFi
bGUoKSBzaW5jZSBpdCBjb3VsZCBsZWFkIHRvIGxvc2luZyBwZW5kaW5nIGludGVycnVwdHMuCgpT
aWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ci0tLQog
bGliL3NiaS9zYmlfcG11LmMgfCAyOSArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2xpYi9zYmkvc2JpX3BtdS5jIGIvbGliL3NiaS9zYmlfcG11LmMKaW5kZXggNTk4M2E3ODQu
LjQ2YzBlMGZiIDEwMDY0NAotLS0gYS9saWIvc2JpL3NiaV9wbXUuYworKysgYi9saWIvc2JpL3Ni
aV9wbXUuYwpAQCAtMTA5NywyNCArMTA5NywxNSBAQCB2b2lkIHNiaV9wbXVfZXhpdChzdHJ1Y3Qg
c2JpX3NjcmF0Y2ggKnNjcmF0Y2gpCiAKIHN0YXRpYyB2b2lkIHBtdV9zc2VfZW5hYmxlKHVpbnQz
Ml90IGV2ZW50X2lkKQogewotCXN0cnVjdCBzYmlfcG11X2hhcnRfc3RhdGUgKnBocyA9IHBtdV90
aGlzaGFydF9zdGF0ZV9wdHIoKTsKLQl1bnNpZ25lZCBsb25nIGlycV9tYXNrID0gc2JpX3BtdV9p
cnFfbWFzaygpOwotCi0JcGhzLT5zc2VfZW5hYmxlZCA9IHRydWU7Ci0JY3NyX2NsZWFyKENTUl9N
SURFTEVHLCBpcnFfbWFzayk7Ci0JY3NyX2NsZWFyKENTUl9NSVAsIGlycV9tYXNrKTsKLQljc3Jf
c2V0KENTUl9NSUUsIGlycV9tYXNrKTsKKwljc3Jfc2V0KENTUl9NSUUsIHNiaV9wbXVfaXJxX21h
c2soKSk7CiB9CiAKIHN0YXRpYyB2b2lkIHBtdV9zc2VfZGlzYWJsZSh1aW50MzJfdCBldmVudF9p
ZCkKIHsKLQlzdHJ1Y3Qgc2JpX3BtdV9oYXJ0X3N0YXRlICpwaHMgPSBwbXVfdGhpc2hhcnRfc3Rh
dGVfcHRyKCk7CiAJdW5zaWduZWQgbG9uZyBpcnFfbWFzayA9IHNiaV9wbXVfaXJxX21hc2soKTsK
IAogCWNzcl9jbGVhcihDU1JfTUlFLCBpcnFfbWFzayk7CiAJY3NyX2NsZWFyKENTUl9NSVAsIGly
cV9tYXNrKTsKLQljc3Jfc2V0KENTUl9NSURFTEVHLCBpcnFfbWFzayk7Ci0JcGhzLT5zc2VfZW5h
YmxlZCA9IGZhbHNlOwogfQogCiBzdGF0aWMgdm9pZCBwbXVfc3NlX2NvbXBsZXRlKHVpbnQzMl90
IGV2ZW50X2lkKQpAQCAtMTEyMiw3ICsxMTEzLDI1IEBAIHN0YXRpYyB2b2lkIHBtdV9zc2VfY29t
cGxldGUodWludDMyX3QgZXZlbnRfaWQpCiAJY3NyX3NldChDU1JfTUlFLCBzYmlfcG11X2lycV9t
YXNrKCkpOwogfQogCitzdGF0aWMgdm9pZCBwbXVfc3NlX3JlZ2lzdGVyKHVpbnQzMl90IGV2ZW50
X2lkKQoreworCXN0cnVjdCBzYmlfcG11X2hhcnRfc3RhdGUgKnBocyA9IHBtdV90aGlzaGFydF9z
dGF0ZV9wdHIoKTsKKworCXBocy0+c3NlX2VuYWJsZWQgPSB0cnVlOworCWNzcl9jbGVhcihDU1Jf
TUlERUxFRywgc2JpX3BtdV9pcnFfbWFzaygpKTsKK30KKworc3RhdGljIHZvaWQgcG11X3NzZV91
bnJlZ2lzdGVyKHVpbnQzMl90IGV2ZW50X2lkKQoreworCXN0cnVjdCBzYmlfcG11X2hhcnRfc3Rh
dGUgKnBocyA9IHBtdV90aGlzaGFydF9zdGF0ZV9wdHIoKTsKKworCXBocy0+c3NlX2VuYWJsZWQg
PSBmYWxzZTsKKwljc3Jfc2V0KENTUl9NSURFTEVHLCBzYmlfcG11X2lycV9tYXNrKCkpOworfQor
CiBzdGF0aWMgY29uc3Qgc3RydWN0IHNiaV9zc2VfY2Jfb3BzIHBtdV9zc2VfY2Jfb3BzID0gewor
CS5yZWdpc3Rlcl9jYiA9IHBtdV9zc2VfcmVnaXN0ZXIsCisJLnVucmVnaXN0ZXJfY2IgPSBwbXVf
c3NlX3VucmVnaXN0ZXIsCiAJLmVuYWJsZV9jYiA9IHBtdV9zc2VfZW5hYmxlLAogCS5kaXNhYmxl
X2NiID0gcG11X3NzZV9kaXNhYmxlLAogCS5jb21wbGV0ZV9jYiA9IHBtdV9zc2VfY29tcGxldGUs
Ci0tIAoyLjQ5LjAKCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3Bl
bnNiaQo=
