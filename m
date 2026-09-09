Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E19C79FB6
	for <opensbi@archiver.kernel.org>; Wed,  9 Sep 2026 16:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t8h6jbnKuToSDRWG+x/CRG1IQez771ELJwApywP/T7I=; b=r0iN4//PxAY7Dt
	Gl4hvuVP3/adWdTLuPBM8EytN0aB4n2PkrjAb9ifJgwe4vmxLl9NrCw3mn6Ao8bPdQSROFD9bJ0CB
	puADNcixz7skupfcb4uABMXxm8N84htuSCU1wkuT+/5cNaAAiEvpcbbrNr80cMxaRNW0vPdVh08tE
	zVGC3EhuwxMKxl99ZAWAJUZEhyFzGpHx53sFjYWEjdTzdeJ+UPfhXBpexWDIa5rZk4IQQVGpNF537
	/2tVIUICam+ED/S8XiBzfaYPUmKORcYgUICHCcG+32RFxCj/8sfgVnrl0QWFzLJ8k93P4P4DaBbGl
	92usFMK5v6bTm302rwyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LCo-0000000CJea-1RzC;
	Wed, 09 Sep 2026 16:31:26 +0000
Received: from mail-wm2-x0a.google.com ([2a00:1450:4864:31::a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LCl-0000000CJan-2TgW
	for opensbi@lists.infradead.org;
	Wed, 09 Sep 2026 16:31:24 +0000
Received: by mail-wm2-x0a.google.com with SMTP id 5b1f17b1804b1-49cd3d0f150so28253255e9.1
        for <opensbi@lists.infradead.org>; Wed, 09 Sep 2026 09:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788971482; x=1789576282; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JWaCfIhsI79tG2kum+UW1v5KPAC9pDehWxou4MG5t18=;
        b=Av2pEEhzbd9xyjzaopbTN3ExkK1tWQDOzq90cEA8Nq0Xr9U+37wxhzLJppVVz1Vg0h
         NoRaOdk5AqjDajWVjPP04ZwmuHIhFG2cui4+qz9Q2+YaHsAuvkh/rBqp1ix30bRVTq5w
         kADU+6Y72FZwTbyPS9GEIZ1QKu+Jb98mkePuPji2P3XoZn1qzPwND3tMAxb4RQG+KnuK
         W8K8tDd4ii4yio6YjZ4ODdiAVnpWZrrmXfbw1+sDcaiMLtd1M+90YzSeVkoyDmyIatgi
         RDjPxkJHTbAc2DTKcFJ75vS6Vaar3CcVKQKLNI36ILBytkkIOrMSd5eS77OdwdN8qLj0
         FcDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788971482; x=1789576282;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JWaCfIhsI79tG2kum+UW1v5KPAC9pDehWxou4MG5t18=;
        b=G7Nmv4uz+qVi+YGNSVPcCGkZnxSU7q+bAm17neP54eZhAgPCzlEhTpwT3kRjLZ34oq
         dCQIhbwXSJncHRhuYEP4X4YWctMjQedTgHWrYXxGFoLgtVGxzcrqJmvuWu8xYpxR2d6D
         gtUDsyDZ9FgsNsdlMmoG1CUO/OOTeuz5E/ecDyDYvUlM+p2R626AvIgnLibypUtDRgUx
         /jbVC7BOhCtDXF/tuUnBBFGEZs17SeutVkhE+d4lcs8CEgch6bXj0vdsJHSU1CVcsRxk
         j2LGflodyC0/moj12rv2y6iePJtD+kVboGw5kMqGMAF0KWFhTeqvWeXs+5RPagQQPX0V
         I++g==
X-Gm-Message-State: AFuF++k6R7E9XeV0Bgvu9Dz7WLjlC27MrxBT0qk0N7Q/EQPp9Su888ow
	DdQwLooTSHhGrzbRd8ggx1FQjrz9HkrOem2wSaPajIIt5JabAMM0cx3Wnjv6nXjQ
X-Gm-Gg: AYBFou3I5VGrZ2aaLccDQQxkZogALHFu7yyds4W3erHvGYf/0dnLniVmv6IpuVcEqoe
	IAuJJgzp7KT4unDgdKqzHPumR9u1YkTRxYhXeBwVfZjk7EiTI8y7qlu8sBgUsvKZr0NhGBGEQBi
	S9Z9wwNP23s1UGDeLhMk6WRRk66yelX3niXeu5ku1EBNCoNVDVbKO9/RVgcRR29CQeWi5Ki1Jo3
	7NhmT5p5NlJD3V6ZLwQs0IqliVc2CcSc7WzL8x3Y7PYGmy5ohi/meaBxubTCz/djkIk1SPGyFCj
	sdDvgIDP4pjAKRZxz62IzqkEXUIkXfeZyhWZxB2IcqMGrslUiMGSIm2AyxWnwhh0cwbcYH4Rtef
	YptqL3CWZN7OAwfE7N7C6iUcEvpdJlr6DOl+8f1wC2v1ZihjLcqpQW+HPynyqyYSrscCAwgOpvE
	DUnOWtVFSk6unRoivsKnxMxv+pks/Yphs12UVF0r5YBgERw8ZS35ZAwpIP0G3Ewu6Fno64/YcNb
	TbIbH/HhxtVysaejBe7ra2l8xTgqR7jNLh+vJPbq17xhYj1+RERHijY6RuZwLGyyc4FkSch9aR3
	JNhJKMK5mc5tzUE=
X-Received: by 2002:a05:600c:3544:b0:49c:f5c0:aa79 with SMTP id 5b1f17b1804b1-49cf8244bd0mr372723545e9.9.1788971481775;
        Wed, 09 Sep 2026 09:31:21 -0700 (PDT)
Received: from localhost.localdomain ([84.77.88.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c06f04sm2763705e9.13.2026.09.09.09.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 09:31:20 -0700 (PDT)
From: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
To: opensbi@lists.infradead.org
Cc: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
Subject: [PATCH v2 05/14] lib: sbi_scratch: add TSA annotations
Date: Wed,  9 Sep 2026 18:23:14 +0200
Message-ID: <20260909162322.29778-7-carlos.lopezr4096@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260909162322.29778-2-carlos.lopezr4096@gmail.com>
References: <20260909162322.29778-2-carlos.lopezr4096@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_093123_639169_DB6A613C 
X-CRM114-Status: UNSURE (   9.99  )
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

QWRkIFRocmVhZCBTYWZldHkgQW5hbHlzaXMgKFRTQSkgYW5ub3RhdGlvbnMgZm9yIHRoZSBzY3Jh
dGNoIHNwYWNlCmltcGxlbWVudGF0aW9uLiBUaGlzIG9ubHkgY29uc2lzdHMgb2YgYW5ub3RhdGlu
ZyB0aGF0IHRoZSBleHRyYV9vZmZzZXQKZ2xvYmFsIG11c3QgYmUgYWNjZXNzZWQgdW5kZXIgdGhl
IGV4dHJhX2xvY2sgc3BpbmxvY2suCgpTaWduZWQtb2ZmLWJ5OiBDYXJsb3MgTMOzcGV6IDxjYXJs
b3MubG9wZXpyNDA5NkBnbWFpbC5jb20+Ci0tLQogbGliL3NiaS9zYmlfc2NyYXRjaC5jIHwgMyAr
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9saWIvc2JpL3NiaV9zY3JhdGNoLmMgYi9saWIvc2JpL3NiaV9zY3JhdGNoLmMKaW5k
ZXggYmIxNGExYTI1ZmViLi4yMTEyMGIxNDUyMDIgMTAwNjQ0Ci0tLSBhL2xpYi9zYmkvc2JpX3Nj
cmF0Y2guYworKysgYi9saWIvc2JpL3NiaV9zY3JhdGNoLmMKQEAgLTIxLDcgKzIxLDggQEAgdTMy
IGhhcnRpbmRleF90b19oYXJ0aWRfdGFibGVbU0JJX0hBUlRNQVNLX01BWF9CSVRTXSA9IHsgWzAg
Li4uIFNCSV9IQVJUTUFTS19NQVgKIHN0cnVjdCBzYmlfc2NyYXRjaCAqaGFydGluZGV4X3RvX3Nj
cmF0Y2hfdGFibGVbU0JJX0hBUlRNQVNLX01BWF9CSVRTXTsKIAogc3RhdGljIHNwaW5sb2NrX3Qg
ZXh0cmFfbG9jayA9IFNQSU5fTE9DS19JTklUSUFMSVpFUjsKLXN0YXRpYyB1bnNpZ25lZCBsb25n
IGV4dHJhX29mZnNldCA9IFNCSV9TQ1JBVENIX0VYVFJBX1NQQUNFX09GRlNFVDsKK3N0YXRpYyB1
bnNpZ25lZCBsb25nCisJZXh0cmFfb2Zmc2V0IEdVQVJERURfQlkoJmV4dHJhX2xvY2spID0gU0JJ
X1NDUkFUQ0hfRVhUUkFfU1BBQ0VfT0ZGU0VUOwogCiAvKgogICogR2V0IHRoZSBhbGlnbm1lbnQg
c2l6ZS4KLS0gCjIuNTEuMAoKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9vcGVuc2JpCg==
