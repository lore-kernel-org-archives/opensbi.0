Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C98C54F55
	for <opensbi@archiver.kernel.org>; Wed, 29 Jul 2026 16:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x2KeRbIVFCJ4swSmARFqalj8sB9KEhADD0g+EDtmTSA=; b=i++8xUhBl2+Dez
	PQn4ZRww9YoXyf2f3espXUQxdKM79b2NGzPUmg1dv1ZapTa0YbqQp4JRIjs1MTRSeQ9bfJii4j4+p
	fJbI04ltmJQrqJP9QfJzpoqXSvKIkdm8u4DQ4cd/wIH1VxJCv3YxGL0iLi1DSQwPTXQ6o9ku9gqoT
	i1U70bfSsDYU1w1H6AyOPaWFpbOLAsTl9Rw+LfYatUcGl3r9L9Y6lMfwrjy6D6lm7nRptDQIBlI7F
	IxbqyqZas4vmxfPruJShzd8J8luBb9knbSUfXNOd08GwsQmtAGuXLHF3YJPDhtbZos9u28EGGN3xR
	iMn2KVZ1Two7VTw5RXhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7Oi-00000008bUv-0VRm;
	Wed, 29 Jul 2026 16:44:48 +0000
Received: from mail-wm2-x08.google.com ([2a00:1450:4864:31::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7Oe-00000008bM0-1uZE
	for opensbi@lists.infradead.org;
	Wed, 29 Jul 2026 16:44:45 +0000
Received: by mail-wm2-x08.google.com with SMTP id 5b1f17b1804b1-4955e5274cdso1757255e9.0
        for <opensbi@lists.infradead.org>; Wed, 29 Jul 2026 09:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785343483; x=1785948283; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e9WKiKByLReFIwoaVXWdVaNo+dXwq8d/s+e3D4ddPTk=;
        b=fImLOqfhl2pZX6zgv1ITLtnrGAhDHFq9Mfzt6g1bw9N5qXhEO72NHjyFoKHiFlhK3C
         ZnB3oO+VF53GW45umdnC+gS2U9HgBR7ohUzhHAk43IqK0UqF+1/FRCr6kcxjXzVXPyCc
         dYwRRqSanvYWUQsUs/YyyCOYF+AUhTmeS+cbMrfHXWD23epr7dzFQesLs5wZ88IRk0LP
         I30XOHQbWLdio1zjgW2xz4ZoVVMwVEVIgNJhlsjd58y7ts1wmKFY3vdpkCb7s9ByknJy
         tqGad2RZCOTJu/EdpnRvaR5Xr3h9fKhTAunhXndjSGZTX285F9ksWMvQEdEpjyubB4Dy
         O9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785343483; x=1785948283;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e9WKiKByLReFIwoaVXWdVaNo+dXwq8d/s+e3D4ddPTk=;
        b=mwXNTzfZ1YYU4Qio4cneIzCOO6Jda5VRYJ/PruSW5ubdIDz0h1789GAueI/EfA4y4X
         h6i4TnmbaR+jbJ4EBkCHOnWoNCOMvbhMvrbWFk3OH9yJspB/tTES8sILC/LM+IxKyyjH
         waDXdpkRZSjd3mObZEa7khX/szPkvuJm76gg588L0A1f2A8kX2AynKqWuKWInDV4FuyC
         ZYiUORslOOr8lTwUNXCKlZ08/EiqSIyByLtJzWzyZGAQm/D1/1q0XKitR+GAsb9Em9rH
         Y3zfwvF8wgApCIpPFjMTmAmnrjK/d7pDXW5/8iDIjWHnUbtgvyoqi66utc2cn76dLnhY
         czSQ==
X-Gm-Message-State: AOJu0Yx412msLZ6PeGiNcryZdmXmujkyMvPPWXKOcMdJXlwMtgXU+bGi
	yG+g2oN55A2lcWY7U7xc0uBJIds61OYTOOr4a5Z7hlc+1Xf4b+W7Uq5676+3jFlTZgg=
X-Gm-Gg: AR+sD11zQHhkJr73MeV7zsz+tcTrjnsiwg833mcSE0IQn0/66Z9FjzolUjuiobJoOVQ
	bZ3wsDB5Tb1tzN1+ity5/jMoUw2WmmEFMbgGDn1FuXnV+C0Jlh/00jQ0kvKooBK1an0fjJmxBCy
	qhOVHUeLI1ky6mWk2165fJPDV69jLWrWHuGwYdIWgz1uHLnyGm+XrZyP5q+4zBgLV02x5ARNOky
	GRVBXTQZaiC1vzHtrYGpv24bwhHEMjgflWfqpzoAqwSTU0k3xmtG72duV1X8etunrqZMZbGRJJ7
	4ANgle3TQuNff7Aj4RpyQROsfKkbVs+QhmQFppO8Dbz4RVTa0n2ebtA5G3YYT/Dqa6xXmCy7qq7
	/CpPqqv0kuCjvdWEpS4sNlAM/rXBCGhz2u+jQ5C3QCqOTngZjASTqj6mgx14h6549wuRHrlAsvD
	eTLkE4z99wEyM9xbjXtnVpKtVu+H/0Alj0shO0lA6C5A+DszuRhU8Hq312k/uqgZWe/Tmunc/e1
	LSYSgNiwDSahSS4CqvVql48NC0NgZiQL0jdG9plLJmpDJlY9yjkjNXm4BRb/wDv7pUZ
X-Received: by 2002:a05:600c:6095:b0:495:6022:5a14 with SMTP id 5b1f17b1804b1-496c65802a3mr81815725e9.34.1785343482674;
        Wed, 29 Jul 2026 09:44:42 -0700 (PDT)
Received: from leap.suse.de ([84.77.88.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6aa3a88sm8474869f8f.6.2026.07.29.09.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 09:44:42 -0700 (PDT)
From: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
To: opensbi@lists.infradead.org
Cc: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
Subject: [PATCH 10/14] lib: sbi_sse: inline enable event locking
Date: Wed, 29 Jul 2026 18:35:37 +0200
Message-ID: <20260729163540.3162978-12-carlos.lopezr4096@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260729163540.3162978-2-carlos.lopezr4096@gmail.com>
References: <20260729163540.3162978-2-carlos.lopezr4096@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_094444_556379_D1ADA2AC 
X-CRM114-Status: GOOD (  11.30  )
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

SW4gcHJlcGFyYXRpb24gdG8gYWRkIFRTQSBhbm5vdGF0aW9ucywgaW5saW5lIHNzZV9lbmFibGVk
X2V2ZW50X2xvY2soKQphbmQgc3NlX2VuYWJsZWRfZXZlbnRfdW5sb2NrKCkuIFRoaXMgd2lsbCBo
ZWxwIHRoZSBjb21waWxlciByZWFzb24gYWJvdXQKbG9ja2luZyBvZiB0aGUgaGFydCBzdGF0ZSBi
eSBleHBsaWNpdGx5IGFjcXVpcmluZyB0aGUgc3BpbmxvY2sgaW4gdGhlCmNhbGxlcnMuCgpTaWdu
ZWQtb2ZmLWJ5OiBDYXJsb3MgTMOzcGV6IDxjYXJsb3MubG9wZXpyNDA5NkBnbWFpbC5jb20+Ci0t
LQogbGliL3NiaS9zYmlfc3NlLmMgfCAzNCArKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAyNiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9saWIvc2JpL3NiaV9zc2UuYyBiL2xpYi9zYmkvc2JpX3NzZS5jCmluZGV4IDgx
OGFmYjg3MWUwMS4uMjFhNDI0NzA5NmFkIDEwMDY0NAotLS0gYS9saWIvc2JpL3NiaV9zc2UuYwor
KysgYi9saWIvc2JpL3NiaV9zc2UuYwpAQCAtMjY1LDI4ICsyNjUsNiBAQCBzdGF0aWMgc3RydWN0
IHNzZV9nbG9iYWxfZXZlbnQgKnNzZV9nZXRfZ2xvYmFsX2V2ZW50KHN0cnVjdCBzYmlfc3NlX2V2
ZW50ICplKQogCXJldHVybiBjb250YWluZXJfb2YoZSwgc3RydWN0IHNzZV9nbG9iYWxfZXZlbnQs
IGV2ZW50KTsKIH0KIAotLyoqCi0gKiBJZiBldmVudCBpcyBnbG9iYWwsIG11c3QgYmUgY2FsbGVk
IHVuZGVyIGVuYWJsZWQgZXZlbnQgbG9jawotICovCi1zdGF0aWMgdm9pZCBzc2VfZW5hYmxlZF9l
dmVudF9sb2NrKHN0cnVjdCBzYmlfc3NlX2V2ZW50ICplKQotewotCXN0cnVjdCBzc2VfaGFydF9z
dGF0ZSAqc2hzOwotCi0Jc2hzID0gc3NlX2dldF9oYXJ0X3N0YXRlKGUpOwotCXNwaW5fbG9jaygm
c2hzLT5lbmFibGVkX2V2ZW50X2xvY2spOwotfQotCi0vKioKLSAqIElmIGV2ZW50IGlzIGdsb2Jh
bCwgbXVzdCBiZSBjYWxsZWQgdW5kZXIgZW5hYmxlZCBldmVudCBsb2NrCi0gKi8KLXN0YXRpYyB2
b2lkIHNzZV9lbmFibGVkX2V2ZW50X3VubG9jayhzdHJ1Y3Qgc2JpX3NzZV9ldmVudCAqZSkKLXsK
LQlzdHJ1Y3Qgc3NlX2hhcnRfc3RhdGUgKnNoczsKLQotCXNocyA9IHNzZV9nZXRfaGFydF9zdGF0
ZShlKTsKLQlzcGluX3VubG9jaygmc2hzLT5lbmFibGVkX2V2ZW50X2xvY2spOwotfQotCiBzdGF0
aWMgdm9pZCBzc2VfZXZlbnRfc2V0X3N0YXRlKHN0cnVjdCBzYmlfc3NlX2V2ZW50ICplLAogCQkJ
CXVuc2lnbmVkIGxvbmcgbmV3X3N0YXRlKQogewpAQCAtODcwLDE0ICs4NDgsMTYgQEAgaW50IHNi
aV9zc2VfZW5hYmxlKHVpbnQzMl90IGV2ZW50X2lkKQogewogCWludCByZXQ7CiAJc3RydWN0IHNi
aV9zc2VfZXZlbnQgKmU7CisJc3RydWN0IHNzZV9oYXJ0X3N0YXRlICpzaHM7CiAKIAlyZXQgPSBz
c2VfZXZlbnRfZ2V0KGV2ZW50X2lkLCAmZSk7CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAot
CXNzZV9lbmFibGVkX2V2ZW50X2xvY2soZSk7CisJc2hzID0gc3NlX2dldF9oYXJ0X3N0YXRlKGUp
OworCXNwaW5fbG9jaygmc2hzLT5lbmFibGVkX2V2ZW50X2xvY2spOwogCXJldCA9IHNzZV9ldmVu
dF9lbmFibGUoZSk7Ci0Jc3NlX2VuYWJsZWRfZXZlbnRfdW5sb2NrKGUpOworCXNwaW5fdW5sb2Nr
KCZzaHMtPmVuYWJsZWRfZXZlbnRfbG9jayk7CiAJc3NlX2V2ZW50X3B1dChlKTsKIAogCXJldHVy
biByZXQ7CkBAIC04ODcsMTQgKzg2NywxNiBAQCBpbnQgc2JpX3NzZV9kaXNhYmxlKHVpbnQzMl90
IGV2ZW50X2lkKQogewogCWludCByZXQ7CiAJc3RydWN0IHNiaV9zc2VfZXZlbnQgKmU7CisJc3Ry
dWN0IHNzZV9oYXJ0X3N0YXRlICpzaHM7CiAKIAlyZXQgPSBzc2VfZXZlbnRfZ2V0KGV2ZW50X2lk
LCAmZSk7CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAotCXNzZV9lbmFibGVkX2V2ZW50X2xv
Y2soZSk7CisJc2hzID0gc3NlX2dldF9oYXJ0X3N0YXRlKGUpOworCXNwaW5fbG9jaygmc2hzLT5l
bmFibGVkX2V2ZW50X2xvY2spOwogCXJldCA9IHNzZV9ldmVudF9kaXNhYmxlKGUpOwotCXNzZV9l
bmFibGVkX2V2ZW50X3VubG9jayhlKTsKKwlzcGluX3VubG9jaygmc2hzLT5lbmFibGVkX2V2ZW50
X2xvY2spOwogCiAJc3NlX2V2ZW50X3B1dChlKTsKIAotLSAKMi41MS4wCgoKLS0gCm9wZW5zYmkg
bWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
