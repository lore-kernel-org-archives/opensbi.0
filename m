Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A412C369D9
	for <opensbi@archiver.kernel.org>; Wed, 30 Apr 2025 04:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Fa2DOA/MmBjKc9SJ9lh5v4QzaNZu4kU+8GhZiZLg0ek=; b=wBrk0zTd0a7fGvfokQft9zmy4T
	F/awTRlTUM1JqrLS73SJ8BRic2dTi5/PlJKJ98V/jsHkwa05s6WSKkEizXRl6M2eg5t2myFD8uSBw
	oHWe2XcnKF7/FJLqdNeQEPGsAaNNCGrQFxNDNzts1ePy3htf50hA1GI0L7G55P9j1GO5lFopxnYLK
	PZnWplDskCKvGULdsKni8B3XodAKMbh5XlRupIlaTfzqwqh6KvVztTb41XBfeHtuM74Ij+IpImQqd
	ygXsPL89f64Ahu97ASLzye+rOF3ZVt7Jf8aHqSfNIiIYCpVKhwF+wRAKC+x2iOC5J2GyIAu/sFlbw
	YBZiUx4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9zKu-0000000Bgys-4BwD;
	Wed, 30 Apr 2025 04:46:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9x8j-0000000BVos-0beN
	for opensbi@bombadil.infradead.org;
	Wed, 30 Apr 2025 02:25:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=tn+SXRvjz2Bvfep0eGfbLiGNUmSGOGl2iH3eqD/Vibg=; b=nZABYwWGgmpGvG4+ygXinUzBRW
	RmgLijOx9R8SF5YgFcwOThXSNvs/FhoOv2t/sPJ3h8QRzAW/id1WA4XYJKv6jlKYMaji9TXpfCyL2
	zBePPPKoG/UewjieEGs2P0xsYuFh8wKIi3dLBmbfA82mV1LlUgHJyredXwAUXrHxg8Ztcio7yWpw/
	8b4B3hqaBGEoHZyunCCtICYO0TRGykaTzi4ku24PHrJpQVMatyBPZMsT0wjRVjVPEZHzF+ahFEWGv
	UNdWbzy31xXXqzhhN6xaBvV5jf57LO/j1IEBXEBBvcBbr9jJ2c8l49MdQfMlpsnKUL33DZI0EHo1B
	zDmxGi/g==;
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9x8f-0000000DdzS-2UN1
	for opensbi@lists.infradead.org;
	Wed, 30 Apr 2025 02:25:35 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-e637edaa652so5076804276.1
        for <opensbi@lists.infradead.org>; Tue, 29 Apr 2025 19:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1745979930; x=1746584730; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tn+SXRvjz2Bvfep0eGfbLiGNUmSGOGl2iH3eqD/Vibg=;
        b=X3eg6csM7+G72Bsj09XFTJfsC/Ii+GhFHgTnKu7izdcuqZ+QtaS3vhh/1v4zyQIbj5
         115WiJ12cHBE4J9oCzdGiNjFuEiA6LG7zxBJGJKVE3FAQkEvQ24TmMfvLJaNm5FwRV73
         /ClnKTYQhENEslE/KVUNKehqlclSyqz23jujg1+WZrnjEoyyDAnKeQwsaJFPyIxmn9wR
         K3OBvd7oQsuxy1zHmkgo6r5s30fqifjm7i503JBhbts5K41+ahG4ltWTcHeCXgeSZOcI
         7E4zDOC0L7MYIlib56lYmwFqJw7GcM+ZTPkIglmIERZ/ESJ/HNdkgG1UzjkFgQZAgsPW
         0o/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745979930; x=1746584730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tn+SXRvjz2Bvfep0eGfbLiGNUmSGOGl2iH3eqD/Vibg=;
        b=WSOrwA7OwhFmasAJ7QiR6jOQMKpZNSPgNPz5aAX58HH8AW31UFzaNbpzuXGR3FgsoE
         ojW5WJ58X3meoK0Ua9JAyRS9wP5WxtKj74hYzoyeu9vzLcd0KOQBnw8/V8FoBa6/ky4E
         t80y1m4THAATk3MykPt+RmwEbrYr80HJIraTXl0c0kfSfzXF3jg0cJbla9//Yi8cMJVk
         p7Fv/G5OatTnDE9p8X9F3eU3OjyKF5bbcAkFIYGtWVFgRNLgYR295eofW5AZGLejkqfB
         2pVwP0XkHpsNckhdGKs58xooXnP/wgpRphkP6qSbOLPQiRXlFLu3MPnW7T0U1p7ni+Ah
         ZQRA==
X-Gm-Message-State: AOJu0YxWM3M0gIODvAhhu4cxRnwXD+bN73APsg92BTW6ZXDjnxVsoQLd
	Dro0jXw3R85T5g1jVsvvJX0V6sumTOh9CEPAb43xVb6qjIIkObXXazjVJYm9q8CnG62iR/0ptK7
	2OIOvIB5vbiDH00Km8mBMDCYc64Su+92rp2gc63JZm/th+c+HCME=
X-Gm-Gg: ASbGncumeVCp4M2JnWySIxqyYRrKHFPKvuX53h5Y8q5JTInJFOUdITtG0ilGCSkrYDE
	4lUswkrGQ41lxS0WH8oeUgJLvQG9RULVTouTRLfq4oawWDsm/ol+toXn6mgUldgGHbeXqvPPBPT
	PmXl1sHc7lldauhR8NTYhdUK67
X-Google-Smtp-Source: AGHT+IHPVyFOpnZnOlnMGg63jMZhpUfTGJHIUFCC9NPsl9cdM67ysBl0tprZ7+fh9n7Jx4Zz0Vx0A0eSDS2T1r+YJKk=
X-Received: by 2002:a05:6902:2304:b0:e6d:ec5e:b5ed with SMTP id
 3f1490d57ef6-e73eade490dmr2138530276.21.1745979929848; Tue, 29 Apr 2025
 19:25:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250418064506.15771-1-nick.hu@sifive.com>
In-Reply-To: <20250418064506.15771-1-nick.hu@sifive.com>
From: Nick Hu <nick.hu@sifive.com>
Date: Wed, 30 Apr 2025 10:25:19 +0800
X-Gm-Features: ATxdqUGoZkm_5BjemlA8zzMl0uI3fRIvuqIHMGsJAI_81vizWWijuc6KlcYw-7U
Message-ID: <CAKddAkC6Xp0o=YHHyBxBdpdJnpjjxGOhDcS7_hRZ+OVTKYyMvg@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: Use hsm stop for hsm wait
To: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_032534_045044_DEDA3E46 
X-CRM114-Status: GOOD (  21.85  )
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

T24gRnJpLCBBcHIgMTgsIDIwMjUgYXQgMjo0NuKAr1BNIE5pY2sgSHUgPG5pY2suaHVAc2lmaXZl
LmNvbT4gd3JvdGU6Cj4KPiBJZiB3ZSBob3RwbHVnIGEgY29yZSBhbmQgdGhlbiBwZXJmb3JtIGEg
c3VzcGVuZC10by1SQU0gb3BlcmF0aW9uIG9uIGEKPiBtdWx0aS1jb3JlIHBsYXRmb3JtLCB0aGUg
aG90cGx1Z2dlZCBDUFUgbWF5IGJlIHdva2VuIHVwIGFsb25nIHdpdGggdGhlIHJlc3QKPiBvZiB0
aGUgc3lzdGVtLCBwYXJ0aWN1bGFybHkgb24gcGxhdGZvcm1zIHRoYXQgd2FrZSBhbGwgY29yZXMg
ZnJvbSB0aGUKPiBkZWVwZXN0IHNsZWVwIHN0YXRlLiBXaGVuIHRoaXMgaGFwcGVucywgdGhlIGhv
dHBsdWdnZWQgQ1BVIGVudGVycyB0aGUKPiBzYmlfaHNtX3dhaXQgV0ZJIHdhaXQgbG9vcCBpbnN0
ZWFkIG9mIHRyYW5zaXRpb25pbmcgaW50byBhCj4gcGxhdGZvcm0tc3BlY2lmaWMgbG93LXBvd2Vy
IHN0YXRlLiBUbyBhZGRyZXNzIHRoaXMsIHdlIGFkZCBhIEhTTSBzdG9wIGNhbGwKPiB3aXRoaW4g
dGhlIHdhaXQgbG9vcC4gVGhpcyBhbGxvd3MgcGxhdGZvcm1zIHRoYXQgc3VwcG9ydCBIU00gc3Rv
cCB0byBlbnRlcgo+IGEgbG93LXBvd2VyIHN0YXRlIHdoZW4gdGhlIENQVSBpcyB1bmV4cGVjdGVk
bHkgd29rZW4gdXAuCj4KPiBTaWduZWQtb2ZmLWJ5OiBOaWNrIEh1IDxuaWNrLmh1QHNpZml2ZS5j
b20+Cj4gUmV2aWV3ZWQtYnk6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUu
Y29tPgo+IC0tLQo+ICBsaWIvc2JpL3NiaV9oc20uYyB8IDkgKysrKysrKysrCj4gIDEgZmlsZSBj
aGFuZ2VkLCA5IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9oc20u
YyBiL2xpYi9zYmkvc2JpX2hzbS5jCj4gaW5kZXggZGZlODQwOGQuLmU4MTI4YTM5IDEwMDY0NAo+
IC0tLSBhL2xpYi9zYmkvc2JpX2hzbS5jCj4gKysrIGIvbGliL3NiaS9zYmlfaHNtLmMKPiBAQCAt
MzcsNiArMzcsOCBAQAo+Cj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc2JpX2hzbV9kZXZpY2UgKmhz
bV9kZXYgPSBOVUxMOwo+ICBzdGF0aWMgdW5zaWduZWQgbG9uZyBoYXJ0X2RhdGFfb2Zmc2V0Owo+
ICtzdGF0aWMgYm9vbCBoc21fZGV2aWNlX2hhc19oYXJ0X2hvdHBsdWcodm9pZCk7Cj4gK3N0YXRp
YyBpbnQgaHNtX2RldmljZV9oYXJ0X3N0b3Aodm9pZCk7Cj4KPiAgLyoqIFBlciBoYXJ0IHNwZWNp
ZmljIGRhdGEgdG8gbWFuYWdlIHN0YXRlIHRyYW5zaXRpb24gKiovCj4gIHN0cnVjdCBzYmlfaHNt
X2RhdGEgewo+IEBAIC0xNzAsNiArMTcyLDEzIEBAIHN0YXRpYyB2b2lkIHNiaV9oc21faGFydF93
YWl0KHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCkKPgo+ICAgICAgICAgLyogV2FpdCBmb3Ig
c3RhdGUgdHJhbnNpdGlvbiByZXF1ZXN0ZWQgYnkgc2JpX2hzbV9oYXJ0X3N0YXJ0KCkgKi8KPiAg
ICAgICAgIHdoaWxlIChhdG9taWNfcmVhZCgmaGRhdGEtPnN0YXRlKSAhPSBTQklfSFNNX1NUQVRF
X1NUQVJUX1BFTkRJTkcpIHsKPiArICAgICAgICAgICAgICAgLyoKPiArICAgICAgICAgICAgICAg
ICogSWYgdGhlIGhzbV9kZXYgaXMgcmVhZHkgYW5kIGl0IHN1cHBvcnQgdGhlIGhvdHBsdWcsIHdl
IGNhbgo+ICsgICAgICAgICAgICAgICAgKiB1c2UgdGhlIGhzbSBzdG9wIGZvciBtb3JlIHBvd2Vy
IHNhdmluZwo+ICsgICAgICAgICAgICAgICAgKi8KPiArICAgICAgICAgICAgICAgaWYgKGhzbV9k
ZXZpY2VfaGFzX2hhcnRfaG90cGx1ZygpKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGhzbV9k
ZXZpY2VfaGFydF9zdG9wKCk7Cj4gKwo+ICAgICAgICAgICAgICAgICB3ZmkoKTsKPiAgICAgICAg
IH0KPgo+IC0tCj4gMi4xNy4xCj4KCkFueSBmZWVkYmFjayBhYm91dCB0aGlzIHBhdGNoPwoKUmVn
YXJkcywKTmljawoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5z
YmkK
