Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31575C369D5
	for <opensbi@archiver.kernel.org>; Mon, 28 Apr 2025 13:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z2HWbuh9DharVQwIo2RwZ3+IQr9LbUNmcjhRv919pYg=; b=lq9gJdt98CkwdR
	VmiaQkoAJsN4ijFuTKrDB6vK4YobVFPZmojhDuPvSwZcqEU9VqacToRrdcpblaEtc3nMB8WIvZgJG
	ksIW/HWkgXuhHoSShkmU6NPtuL/QCP9on6isZaKm/N+a1GskAoHa0gQWWYyoneWaQAkSO2fevjQho
	gjQTzHlYNcxYs1ILsjEKA9cQ2pZt5AwJdEOYZaxQn/IRsPd4Kkapmx5BwRHrgDW7JzWbVtpKixgeX
	O2Wq8DSEHta1GYasody5QbtpkOGPY11NMGuTJB1Q+6ypzoj4JBCEzwhROVF89htLH9Xlq0ubL2Zxe
	orMJiyBToc2i5KXfQA5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9OCI-00000006MkI-1mT9;
	Mon, 28 Apr 2025 13:06:58 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Ncb-00000006BwS-0rhw
	for opensbi@lists.infradead.org;
	Mon, 28 Apr 2025 12:30:06 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3d450154245so43923125ab.2
        for <opensbi@lists.infradead.org>; Mon, 28 Apr 2025 05:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1745843404; x=1746448204; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yxxLjd+/h6rTWhH9M8d1a030lm49BV6MT9SqDkKRvaw=;
        b=PR7WkpuasZ1PVRPgtzIfCnDMNdlUJCaT0DhS+u2Zwgn+DPKbBj0oosF7s0CL9A3ZuC
         8QC7Puf2TC3+WTpRyZNCQJDyGmtxAnI5O11R1kGxxo3Up7PqmwPVu/AlOzCveKWWmkJT
         bRWrnGYHG8pr+nMdPJZxUGPFA3gERfvMjttZvMWQxVmIu4ItT1A0Jsv+zqNVak2EVsSS
         X5OjCa7RF707b4tIXx93mhAvW5EYqt4ufsD5LsLcUOJv0n0bU4z3gJMgpSkD6S1NIXHu
         lHdwe6N8nWt/UmuWfAJyN/JZ9PszajB6OtPXVfBXXMTcVfNu+lFg+9GAb6pVB/NUWEsg
         APMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745843404; x=1746448204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yxxLjd+/h6rTWhH9M8d1a030lm49BV6MT9SqDkKRvaw=;
        b=HsTIVHpTlzDBs3Ac1Sl4cJGzQBg2VKXyf5do4N7pomoWrwZO8qg0CTp5nTKHDjK57f
         KyP/tYyUmX2Ns0gzm6qiDfP0P7yTTZ+fSE6jqnJWdYfeBTeQDBtgpH1QKyOW8xSmcXWF
         oHYtkV+IbolGWOWo8Z/afPS0D7n3If1RCJsQdJ8bBrE1/8DxYnoRlzIbjT0WQaJHJzA7
         XEX9XGz+a/b2vYbTr2EPdhu+MO81aYjXQZdNRsqYhKArlzYjT6YQyeMm+E4CGb6CRLFz
         vRNABRi1Om8Y6dZ8EYfhCFoIin7Y/uVisIrD1ZYgzsQzVwzxLNKNgNGPeW8AC0eUx14s
         oIUw==
X-Gm-Message-State: AOJu0YyCTo5XMj10ksNamOCN5H51z/JXknJoyrA44NOE1z7Gj68VODzM
	OJihpS8VaT3bxYP907yX2mVGLz+s3h6Jm00yA7W8KPzrWQSBhK86LkG1CaWgTNIaEnuk/XeGZCx
	dc5oFOc8yfphpWsufTGqUT10E9xY3fMlhKprQ0FAztXFW6Kxbjr0=
X-Gm-Gg: ASbGnct/tCrXp15nzr0ET04ekhgXCyuEPKIFtNRAes2PaWxal026wWu3XFy7wnqtrf0
	lQtkr3aTqF3FvlhV7jhPzlvardeW0tSThdrJRj7U3wZtBQeOKMTTRkuRYRQQWbqV3+Hc7PgyXN8
	c0/VPHY1H0zxLWFWacj0MGgRE=
X-Google-Smtp-Source: AGHT+IE3cFi0mfC3C89tVjYMNp8l3+ceDc/CMCliYF1TWuA4X2HlDxy+WQ6+32N04OAMiDycw9Aw59gwj65K9/ZDeQw=
X-Received: by 2002:a05:6e02:184c:b0:3d8:1885:837d with SMTP id
 e9e14a558f8ab-3d93b61578cmr120631595ab.22.1745843404181; Mon, 28 Apr 2025
 05:30:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250415131908.2699782-2-rkrcmar@ventanamicro.com> <20250415131908.2699782-6-rkrcmar@ventanamicro.com>
In-Reply-To: <20250415131908.2699782-6-rkrcmar@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Apr 2025 17:59:51 +0530
X-Gm-Features: ATxdqUFfKJgtGb78cH7HowXQmHXwU48ITgbhT1GXVoG7P4r2rdfj7sXbzEj7MEY
Message-ID: <CAAhSdy2fDFyhUv7pOYe3a8fsttqO0VrCMuRAyT8KCiOGfL35Zg@mail.gmail.com>
Subject: Re: [PATCH 4/8] lib: sbi_hart: reset sstateen and hstateen
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_053005_251841_81FFCFEA 
X-CRM114-Status: GOOD (  13.91  )
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

T24gVHVlLCBBcHIgMTUsIDIwMjUgYXQgODoxM+KAr1BNIFJhZGltIEtyxI1tw6HFmSA8cmtyY21h
ckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IE5vdCByZXNldHRpbmcgc3N0YXRlZW4gaXMg
YSBwb3RlbnRpYWwgc2VjdXJpdHkgaG9sZSwgYmVjYXVzZSBVIG1pZ2h0IGJlCj4gYWJsZSB0byBh
Y2Nlc3Mgc3RhdGUgdGhhdCBTIGRvZXMgbm90IHByb3Blcmx5IGNvbnRleHQtc3dpdGNoLgo+IFNp
bWlsYXIgZm9yIGhzdGF0ZWVuIHdpdGggVlMgYW5kIEhTLgo+Cj4gU2lnbmVkLW9mZi1ieTogUmFk
aW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+CgpMR1RNLgoKUmV2aWV3ZWQt
Ynk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRzLApBbnVwCgo+IC0t
LQo+ICBsaWIvc2JpL3NiaV9oYXJ0LmMgfCA2ICsrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfaGFydC5jIGIvbGliL3Ni
aS9zYmlfaGFydC5jCj4gaW5kZXggYjY2Yjg5ZjZiYzUxLi5jMjgwYzBiM2U4NWUgMTAwNjQ0Cj4g
LS0tIGEvbGliL3NiaS9zYmlfaGFydC5jCj4gKysrIGIvbGliL3NiaS9zYmlfaGFydC5jCj4gQEAg
LTExMSw2ICsxMTEsMTIgQEAgc3RhdGljIHZvaWQgbXN0YXR1c19pbml0KHN0cnVjdCBzYmlfc2Ny
YXRjaCAqc2NyYXRjaCkKPiAgICAgICAgICAgICAgICAgICAgICAgICBtc3RhdGVlbl92YWwgJj0g
flNNU1RBVEVFTjBfQ1RSOwo+Cj4gICAgICAgICAgICAgICAgIGNzcl93cml0ZTY0KENTUl9NU1RB
VEVFTjAsIG1zdGF0ZWVuX3ZhbCk7Cj4gKwo+ICsgICAgICAgICAgICAgICBpZiAobWlzYV9leHRl
bnNpb24oJ1MnKSkKPiArICAgICAgICAgICAgICAgICAgICAgICBjc3Jfd3JpdGUoQ1NSX1NTVEFU
RUVOMCwgMCk7Cj4gKwo+ICsgICAgICAgICAgICAgICBpZiAobWlzYV9leHRlbnNpb24oJ0gnKSkK
PiArICAgICAgICAgICAgICAgICAgICAgICBjc3Jfd3JpdGU2NChDU1JfSFNUQVRFRU4wLCAodWlu
dDY0X3QpMCk7Cj4gICAgICAgICB9Cj4KPiAgICAgICAgIGlmIChzYmlfaGFydF9wcml2X3ZlcnNp
b24oc2NyYXRjaCkgPj0gU0JJX0hBUlRfUFJJVl9WRVJfMV8xMikgewo+IC0tCj4gMi40OC4xCj4K
Pgo+IC0tCj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5v
cmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
Ci0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
