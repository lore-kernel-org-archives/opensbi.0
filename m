Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4A1CCA468
	for <opensbi@archiver.kernel.org>; Tue, 30 Sep 2025 11:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vW432tFXOV25ySRnqp2KgQe8rKTxlYQhLcqsKIGKN3Q=; b=OC0sxwX7zGyHEl
	s8eX96dGVyHlcnzlt2EkjOTegoDGTXrZnFI3/HNJeZ/KvyvDiy+lKTEXnIdoQ6mQq/N/n+XmJoJE9
	M+e+k/E6vuVq0GTJjGo344cfV1+phb0RUUXXkyptbDRVizu5vJzMlkmQoOPu7aALVtqOElI7H2Ull
	w1HzO0DQo/SioQ7UQQsnIAv8RIeUpxWdoOPf9tPA5TU1GeoHMnYvY92u6MmMDthEaMNv3gRsDbx6Z
	wJuvBfUkfwdJ5XqHn4v1rKjAWBHK2S7msYk2Kc1iIKjGzRcGJY4Rk+oXWNAKlMpxpWxH2vsrVAPpX
	srNBqvRcblOxgXd2owhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3YeX-000000059p2-11Xq;
	Tue, 30 Sep 2025 11:36:17 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3YeU-000000059of-2irA
	for opensbi@lists.infradead.org;
	Tue, 30 Sep 2025 11:36:15 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-4286b90e3b8so29170895ab.1
        for <opensbi@lists.infradead.org>; Tue, 30 Sep 2025 04:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1759232174; x=1759836974; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jvXzax8IQmnKuQTTp6+/PU/A+++EQV7QQl4jQmQoI/k=;
        b=Ae9BXofmJSZLbH2PfHyatrHJMQJT3FmZvKUg/qoGJhTHuJUpA1s0jGIiZSdByeUVC6
         9RYTtpaMf3dCHtH+9TL+G4NVOLzREb26BUkKaet5wpZV8QFd0egp4bUYXIQyb19HH7A3
         osGC0ADC3XX3JyAmIxf1ztLSjw5OffLckDdpUZ7h44eN4aAeQb2mTkt/90MvGJUzFPCk
         jS/IdvOm8ruOD167q5pwdECK2R+Bg+nwo8DXhanGsT8rnRJgvRN2gp3peVmn6Hn2BFiN
         NWq+10NYPQ6/0vML9Z5ua71hG9QTepkjTTNXkGaNz6flA02tOlUg7r9w+qDJtXS8eCrO
         OsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759232174; x=1759836974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jvXzax8IQmnKuQTTp6+/PU/A+++EQV7QQl4jQmQoI/k=;
        b=R5JwOw6dadtgqmasgkX0ULRprMrgExHcL3BBtzRW6ya5UKCFH3y7VjFgyUxOdNt/Ua
         n3iLWK4isPVR1NxEK96KhTioPMsYdldF4cH4zt93sY7lI3VFGEA6zP4mFExuQdlJupkH
         VfjWRYsaaCUWBmv9XYYbocVIrLLJul1vLiBKSsluKSllPwj9BRr27RLSr1pePqHKCEny
         fM97gwzKkNeWpGXyIFhQtkRdWbK2e/qu/fUKdictcaKeB9Blzq7G9T6ElcF5AfZv5V5s
         GuDtJf1vBxSLY+kGCMKGeih4TJCO1iwMC/aqKMv76xJrBN035NwI+EPnQhUUJCLOP7IR
         Xa6Q==
X-Gm-Message-State: AOJu0Ywv3lr30azEd0qLuo0kO2CBvzyc/xdWYYpx+aRx/dS+0/q0XgFf
	xAbaVvadC6QnwdCFyiKdzYVGMj2JyP7sCGfmjXvwp27kqayMtSaX70z5ZopzMiBSnRqAALYf5L0
	U0GkYf4ZhAdTGrjhmkDP1eSZ87Na8CIFvQBbDeei7AmIispzIOniwpSE=
X-Gm-Gg: ASbGncuqv2mGSVfvW5UEfmf7gLfwjWSgaxqs85mLjtVg7sUzq3ynA3QbzLkIK+l7zz5
	gqI1hXbEkNMljDvgx6NDnPXiCWVwqhCWRmY9NptpiYV0rllcRs+1IUqLrvI8tPYvTHajrD/SKUx
	7t0iuum1L8+T7NaPwEqOZiU+cgYUZ25ImuxYpHNgrqMmdfPBLjeqaHzOGKYrYtVNiBfjRburNa6
	3eg49mPMQeW3ngaKrHkPfK4C0NxnJonOTw7PLrQK6rKtryABukeTPvPtmqkriKQHVxfPL5d3/M=
X-Google-Smtp-Source: AGHT+IHO1HxOAx7Q3Qy0euGY378qWS7C2pUqqa38xB2Z0+P1ri3fmxgX/e8uK20m3sKn1ZbsyL7yTnNypGIK7AO+Zz0=
X-Received: by 2002:a05:6e02:1649:b0:408:4492:c9c2 with SMTP id
 e9e14a558f8ab-425955fb754mr354208785ab.10.1759232173612; Tue, 30 Sep 2025
 04:36:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250806084123476SCLxg-qQRa8CRuhuY-dwE@zte.com.cn> <202508060106.57616maD072614@mse-db.zte.com.cn>
In-Reply-To: <202508060106.57616maD072614@mse-db.zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 30 Sep 2025 17:06:01 +0530
X-Gm-Features: AS18NWA1sgn_-r-IFyqYQOJCUziRiuTkC0TOHYAD_-V8T-ik0-mWv9yo3POTjLU
Message-ID: <CAAhSdy2N0FQ4+3PR8ksYvi0CMc3m3Rt2Bsv+ABWWcXdWSMtXeQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] include: sbi: Lift the maximum harts to 1024
To: wu.fei9@sanechips.com.cn
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_043614_689189_33FD9C96 
X-CRM114-Status: GOOD (  17.14  )
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

T24gV2VkLCBBdWcgNiwgMjAyNSBhdCA2OjM54oCvQU0gPHd1LmZlaTlAc2FuZWNoaXBzLmNvbS5j
bj4gd3JvdGU6Cj4KPiBJdCBpcyBleHBlY3RlZCB0byBoYXZlIHJpc2N2IHNlcnZlciBib2FyZHMg
d2l0aCBtYW55IGNvcmVzIHZlcnkgc29vbi4KPgo+IFNpZ25lZC1vZmYtYnk6IFd1IEZlaSA8d3Uu
ZmVpOUBzYW5lY2hpcHMuY29tLmNuPgo+IC0tLQo+ICBpbmNsdWRlL3NiaS9zYmlfaGFydG1hc2su
aCB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zYmkvc2JpX2hhcnRtYXNrLmggYi9pbmNsdWRlL3Ni
aS9zYmlfaGFydG1hc2suaAo+IGluZGV4IDIwMGFiNmUuLjJmOTRmMzkgMTAwNjQ0Cj4gLS0tIGEv
aW5jbHVkZS9zYmkvc2JpX2hhcnRtYXNrLmgKPiArKysgYi9pbmNsdWRlL3NiaS9zYmlfaGFydG1h
c2suaAo+IEBAIC0yMCw3ICsyMCw3IEBACj4gICAqIGFsc28gcmVwcmVzZW50cyB0aGUgbWF4aW11
bSBudW1iZXIgb2YgSEFSVCBpZHMgZ2VuZXJpYyBPcGVuU0JJCj4gICAqIGNhbiBoYW5kbGUuCj4g
ICAqLwo+IC0jZGVmaW5lIFNCSV9IQVJUTUFTS19NQVhfQklUUyAgICAgICAgICAxMjgKPiArI2Rl
ZmluZSBTQklfSEFSVE1BU0tfTUFYX0JJVFMgICAgICAgICAgMTAyNAoKSW5zdGVhZCBvZiBtYWtp
bmcgdGhpcyA4eCwgaXQgaXMgYmV0dGVyIHRvIG1vdmUgdG8gYSBtb3JlIHJlYWxpc3RpYwpudW1i
ZXIgbGlrZSAyNTYgb3IgNTEyLiBOTyA/CgpSZWdhcmRzLApBbnVwCgo+Cj4gIC8qKiBSZXByZXNl
bnRhdGlvbiBvZiBoYXJ0bWFzayAqLwo+ICBzdHJ1Y3Qgc2JpX2hhcnRtYXNrIHsKPiAtLQo+IDIu
NDMuMAo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFk
ZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3Bl
bnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
