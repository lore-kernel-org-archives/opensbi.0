Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC118C79FB6
	for <opensbi@archiver.kernel.org>; Wed,  9 Sep 2026 16:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h87WomyC4s2NI+TdyPOz8AJrrnaHb+5AwTx152uV/O8=; b=KDnlM4iXtKk01H
	SXu4GBhoVfy88sNCHxoknaWFVO0YeBtpOqovSSTTwLcaTGo89j19XhR15lsq/ZTt08n27xbr6JIap
	e7S8ebY3YIf/P/tcjlHIuahiDtXy+/AdvcuwG15c5JW6/060qpqtwQxHljMVcih79tJx5Cy6OlXll
	bNIhok6M9MwI0g9EtNY8PcEL+Jip6Q2ErYxn9Kv7WEkWvFRMbDMSSCCVwdb6yTjZYDm8XpP5NoIu5
	Kb0gpIbbPksEcSX81mL5PLCrYdTaheeVtYuryEUVzneCUt1PU9gCtwpQ5TqmI8brsJJKfP7/i8Sy7
	s8gpW3ZA3hRwBXTGtIFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LD4-0000000CJqx-1wht;
	Wed, 09 Sep 2026 16:31:42 +0000
Received: from mail-wm2-x01.google.com ([2a00:1450:4864:31::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LD0-0000000CJo3-3mJu
	for opensbi@lists.infradead.org;
	Wed, 09 Sep 2026 16:31:40 +0000
Received: by mail-wm2-x01.google.com with SMTP id 5b1f17b1804b1-49ced856e8dso26538385e9.0
        for <opensbi@lists.infradead.org>; Wed, 09 Sep 2026 09:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788971497; x=1789576297; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iOzgoNwkP2aSPugnvHZmgteg0B4P2MWwvkPZlOL3kDg=;
        b=sm64aHtPW0MqMOBmdw2LIxcJ5JyTulbbL2nlr2PX5vMHjeBrrM/h6wQX2FORnd7jYq
         sxKFiGUAmel+eua4u5FWoWkNq3EybIhZVM+ATj9ps1aXauA4EoRkaGiFqTtGFuQxcXlr
         vdPkS4SWO4HTacWAY1rWu9G8KEi4xTp+aNSYLJ1axREpMrgxqQDCiFuhH/zM9YQ8YUBo
         NYb6XIhF5/vEHrUC5jLQFAYxg36fHOGANsJ93jpqToKnucOnzO+imLSPktOgleYcJfZd
         VdHYhgWDRRShPi20+jgf0j1Di7M5qH31/AJsRtK3VxF8C653fwkle9jdpam0jmIjOp3g
         1zwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788971497; x=1789576297;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iOzgoNwkP2aSPugnvHZmgteg0B4P2MWwvkPZlOL3kDg=;
        b=G4+nqSeK8G7G+7hnqiOpI612YWZ2JSHOTQGxaoah7gP+k9kVBQtggjOky2MFx6C0tX
         0urXq06JOL8Eu9vEtBQ5CYsGIxeO6hpEbPgjPVFTqh5Z6pi8aTWCeknFH3xfpQ9uTzb0
         oX7Uo0QvAiae1j05muWI9NarTpzt5QWvNiz8LKZd65CpUJ8ComKk0wCkdLFzJnH3AOJ6
         VDEa0P4SlnSs+Z5jXMo8nXUnxoVnn2OCwWRSJMTb54ero/BsMt7JdYg8g/VBS+IpI78c
         GCND/ojw+HGMNulaRDeUJ+EI+elHhnqdVDU5JOI1B/ZhoDhXG+p7bLMd/BSKxGOwDDLo
         nRxw==
X-Gm-Message-State: AFuF++mHIEGl0rA/5RksPVj5UDQq9IBxB379ULJ49wnixfKWs0kU4IqF
	cQQ5NW0AzevhHua1+mE08lR75Mrdu6ZL6xeKfxecyQXjtlMG6gLIY2Ae4Q1DJPDl
X-Gm-Gg: AYBFou31uXjjLxDwFVAJu80qJuW51GY+8+9ppo5/VNrvhayLh1Mi8sRVRJ0VWLMYRnj
	nmrMfqSEF2JamhUf6CiENFrd0boCmd6s9VtnXNxp4hTLahxegaqfK/CvYPCgjEJeGU2wEzwtQ3W
	hE2uKdwgN46Eg1V0gic/It93LAPcPAKPkubSDX47n0T/AAweTKZwO52QcmvGYukLx5BEovaG1Jh
	YPUlTNBQ4CYME04laGBHf2Ob7xewoW/TCjz3He3O28zX004eMAGAuaQ+Z6rgiMJVV1iHJYOPmDq
	IdrGKloqtP+e1LCzqY1Wd80yACfCfdK36JIyl6D0fA3cQFGnZqOzd4SrCPY1qkUkbTvuRdk0ae9
	GK8OxL+EjeMRKqnMf3l5hR3Zkr4SvLYyTTJDlsYe9pK/CDvTXFcHpvInuGUsWzHjQRdP0VlCE1h
	fb4/URsiIFiApUxYhZlwHgVfGwdSzkyg2uXJbUvzAm10Q9Z56zHFTAArMZB0ocucdgI/XCWhwkp
	MSJuukjGmUCnvsonq2MkSVlEqDzugWrBAcyLZ67dTkAJfjSIvFk1ZcvmAI0UpOiJeWZj9rAk1oH
	KIs=
X-Received: by 2002:a05:600c:1e24:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-49d259502f1mr43402455e9.16.1788971497198;
        Wed, 09 Sep 2026 09:31:37 -0700 (PDT)
Received: from localhost.localdomain ([84.77.88.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c06f04sm2763705e9.13.2026.09.09.09.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 09:31:35 -0700 (PDT)
From: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
To: opensbi@lists.infradead.org
Cc: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
Subject: [PATCH v2 10/14] lib: sbi_sse: inline enable event locking
Date: Wed,  9 Sep 2026 18:23:19 +0200
Message-ID: <20260909162322.29778-12-carlos.lopezr4096@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260909162322.29778-2-carlos.lopezr4096@gmail.com>
References: <20260909162322.29778-2-carlos.lopezr4096@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_093138_957238_EF8EF03C 
X-CRM114-Status: GOOD (  11.94  )
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
ZmYgLS1naXQgYS9saWIvc2JpL3NiaV9zc2UuYyBiL2xpYi9zYmkvc2JpX3NzZS5jCmluZGV4IGY2
ZDAxMTFkYzFlNy4uM2QxNjAxNjc0ZTA3IDEwMDY0NAotLS0gYS9saWIvc2JpL3NiaV9zc2UuYwor
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
CXVuc2lnbmVkIGxvbmcgbmV3X3N0YXRlKQogewpAQCAtODY1LDE0ICs4NDMsMTYgQEAgaW50IHNi
aV9zc2VfZW5hYmxlKHVpbnQzMl90IGV2ZW50X2lkKQogewogCWludCByZXQ7CiAJc3RydWN0IHNi
aV9zc2VfZXZlbnQgKmU7CisJc3RydWN0IHNzZV9oYXJ0X3N0YXRlICpzaHM7CiAKIAlyZXQgPSBz
c2VfZXZlbnRfZ2V0KGV2ZW50X2lkLCAmZSk7CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAot
CXNzZV9lbmFibGVkX2V2ZW50X2xvY2soZSk7CisJc2hzID0gc3NlX2dldF9oYXJ0X3N0YXRlKGUp
OworCXNwaW5fbG9jaygmc2hzLT5lbmFibGVkX2V2ZW50X2xvY2spOwogCXJldCA9IHNzZV9ldmVu
dF9lbmFibGUoZSk7Ci0Jc3NlX2VuYWJsZWRfZXZlbnRfdW5sb2NrKGUpOworCXNwaW5fdW5sb2Nr
KCZzaHMtPmVuYWJsZWRfZXZlbnRfbG9jayk7CiAJc3NlX2V2ZW50X3B1dChlKTsKIAogCXJldHVy
biByZXQ7CkBAIC04ODIsMTQgKzg2MiwxNiBAQCBpbnQgc2JpX3NzZV9kaXNhYmxlKHVpbnQzMl90
IGV2ZW50X2lkKQogewogCWludCByZXQ7CiAJc3RydWN0IHNiaV9zc2VfZXZlbnQgKmU7CisJc3Ry
dWN0IHNzZV9oYXJ0X3N0YXRlICpzaHM7CiAKIAlyZXQgPSBzc2VfZXZlbnRfZ2V0KGV2ZW50X2lk
LCAmZSk7CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAotCXNzZV9lbmFibGVkX2V2ZW50X2xv
Y2soZSk7CisJc2hzID0gc3NlX2dldF9oYXJ0X3N0YXRlKGUpOworCXNwaW5fbG9jaygmc2hzLT5l
bmFibGVkX2V2ZW50X2xvY2spOwogCXJldCA9IHNzZV9ldmVudF9kaXNhYmxlKGUpOwotCXNzZV9l
bmFibGVkX2V2ZW50X3VubG9jayhlKTsKKwlzcGluX3VubG9jaygmc2hzLT5lbmFibGVkX2V2ZW50
X2xvY2spOwogCiAJc3NlX2V2ZW50X3B1dChlKTsKIAotLSAKMi41MS4wCgoKLS0gCm9wZW5zYmkg
bWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
