Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD4DC54756
	for <opensbi@archiver.kernel.org>; Thu, 22 May 2025 05:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LJknxi6sJ8cdcW0MDqh1tj3vG0jdgKKrOb5ZMA3Qo/s=; b=fGrTN0FLk4rv0P
	yePtgRouEwxXDIcmVH38d/tKMpb4eFkc/aDfSGJdRSk937pbN8WIEz5/jamKy4zkrFIK5fhtpDa1V
	UGeJDj0gSETCKwD0RjYUE3QX9By4CAUNC6dLVlkFgwEYjDCCSNjuBqZtNZgpGY7he3Gle9ZSvnjRg
	l+Cz/FPqrfTigG13h0KU1ftR13UM1ImJcTSY74iXKY1CZ5FJoAWEsQH/2LSS2jqXFNTwNmzx7uFBs
	ZuTozyEZ6sPv2IzzZKq2ryzIcL6RE0a71y7YbJJLPpz6QoA2URpTn7dNbtvayix/dncv77ISV5Y5C
	KMhlwKyK7kQ7T0R82CPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHysR-0000000HXDc-2nlH;
	Thu, 22 May 2025 05:53:59 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHysP-0000000HXD9-0sam
	for opensbi@lists.infradead.org;
	Thu, 22 May 2025 05:53:58 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-70def1ca059so21784207b3.2
        for <opensbi@lists.infradead.org>; Wed, 21 May 2025 22:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747893235; x=1748498035; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6o0q89esnjnt/YWscEyMkxgrt8NCrl+gMMc3+fHK+kQ=;
        b=g6jf8X04B2FHNUuRS9BIJpLr//x0mSVal0KbVniM7lMJOzC/HDI+EuzwbOcnYrxMQ2
         IiotiuDNQLxdsO4nAInpcGEwYnFQbEzro2t0GQStRyxeG5AEpPOC8QlqEpONmepN6UkC
         n6qX4PlmB8MBLFPQbxRb5Tk/XKNicM71rh97zw2V/3A9vM+U5+Dh1bL0aSTFd8zTvH7p
         GP908jMcfyK+AwLrzm1N0m17oX6deezpOcJx487TBUDSzMhjQ7E6U/ijkSB00Yyj5XK0
         chNWNndaiKDsW4OMvarnoR+CTfALHFrvEFph6df8pkoK+iEU1TrIH5uoCirXB7SM0eYi
         GnxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747893235; x=1748498035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6o0q89esnjnt/YWscEyMkxgrt8NCrl+gMMc3+fHK+kQ=;
        b=Ji6hTr0T1fzURrHd8sirvuYRX9J4HcFsmk1D70bTaCgm3HZkkfAWx5792p3LpqlgWj
         2HKjhUyIFzNebx+UDAS5ppqwBNVfOxEekQYB5nmnVxD0lGOvn06jvV0BxroeL04GS8/S
         mUFS1BTw5zgW7uxRR5/VqsqMgxXRWm+c0EigjhBX8ZYwf8AzkLZHnsts4EVi6zpSTkDP
         uL3sc9KBgVe5HI/CD+3QlkYGu1S9xhLxKf2BgYtIilpEJORf/fFtwaRAfpoRowCVcyB1
         2b3tVNZzOs0Pw9oKIQNZDmBJUnQtuMe4FyDbBZFQU9RYsghktmxJJi+8wXlczFSaxRgO
         JN8A==
X-Gm-Message-State: AOJu0Yy2Ke2sY9oJ9TEGdZfOXzFgrMsjQEih6bdOr9mmTeVSf/fAC7Pf
	89Hq+1tCKWdyQLTkB/X7AxHPnEH4ZPHS7JqdnOBq6dlvejiGFfWqYxy9nxk0mPxh5X2ne0HxMvC
	wHt4RTJ4LA7PRO0jiwzV41VoS74ZMS7OM8rHnUBFFnw==
X-Gm-Gg: ASbGncs0Fd6gAt9EWYe9iIk2WFnZxj7xmnuE6PTY3SWqZcLlFtQzryDs1fsHhGavCU6
	ZYRiS2UznDgKXZcEUsizwOc4S3q9ijJ9LGLDrwOwzWz7UMORyKBm/6hRUpeI6hTBwTqC/Y2FLNI
	0HK4muBfqrlMEnTusQmbAXqWmC5IY9ENSZFAOYc5ERis4SWQ==
X-Google-Smtp-Source: AGHT+IEcmC7awJUdycjc17nh6JYzkzpgtpOxNlT7NHPAy0DVc7L0jslhuIPtQlQs16pwwIdBzqwHfmvFUavL3UUAhtI=
X-Received: by 2002:a05:690c:3613:b0:70c:aa28:d8c1 with SMTP id
 00721157ae682-70cab0995a0mr316698927b3.25.1747893235641; Wed, 21 May 2025
 22:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250424034003.28522-1-nick.hu@sifive.com> <CAAhSdy0-KvzhSmf6-aUxexMTOJF-wD0io1NLHgpfn8dBLSs2uA@mail.gmail.com>
In-Reply-To: <CAAhSdy0-KvzhSmf6-aUxexMTOJF-wD0io1NLHgpfn8dBLSs2uA@mail.gmail.com>
From: Nick Hu <nick.hu@sifive.com>
Date: Thu, 22 May 2025 13:53:45 +0800
X-Gm-Features: AX0GCFs3X2WAn_PURMIyuuaqFETtie87D4kJN6eFNe_9PVTv53h7KRs5e9nGIZo
Message-ID: <CAKddAkBBghbHDfPAEWFdA3_zwjk91boAvxAjO5bMWs5TGDqygw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Support external CMO to flush entire cache
To: Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_225357_262587_B81E953A 
X-CRM114-Status: GOOD (  16.33  )
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
Cc: vincent.chen@sifive.com, opensbi@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBNYXkgMTUsIDIwMjUgYXQgMTA6NDXigK9QTSBBbnVwIFBhdGVsIDxhbnVwQGJyYWlu
ZmF1bHQub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgQXByIDI0LCAyMDI1IGF0IDk6MTDigK9BTSBO
aWNrIEh1IDxuaWNrLmh1QHNpZml2ZS5jb20+IHdyb3RlOgo+ID4KPiA+IFNvbWUgZmVhdHVyZXMs
IHN1Y2ggYXMgcG93ZXIgbWFuYWdlbWVudCwgbWF5IHJlcXVpcmUgZmx1c2hpbmcgdGhlIGVudGly
ZQo+ID4gY2FjaGUgYmVmb3JlIGVudGVyaW5nIGEgbm9uLXJldGVudGlvbiBwb3dlciBzdGF0ZS4g
VG8gc3VwcG9ydCB0aGlzLCBhCj4gPiBzaW1wbGUgY2FjaGUgZnJhbWV3b3JrIGlzIGludHJvZHVj
ZWQgdG8gYWxsb3cgdGhlIGV4dGVybmFsIENNTyB0bwo+ID4gcGVyZm9ybSBhIGZ1bGwgY2FjaGUg
Zmx1c2guCj4KPiBUaGlzIHNlcmllcyBzaG91bGQgYWxzbyBpbmNsdWRlIHBhdGNoZXMgd2hpY2gg
dXNlIHRoZSBjYWNoZV94eXooKQo+IEFQSXMgdXBvbiBwb3dlciBtYW5hZ2VtZW50IG9wZXJhdGlv
bnMgIChlLmcuIHN1c3BlbmQgdG8gUkFNKS4KPgpXaWxsIGFkZCBpdCBpbiB0aGUgbmV4dCB2ZXJz
aW9uLiBUaGFua3MuCgo+IFJlZ2FyZHMsCj4gQW51cAo+Cj4gPgo+ID4gQ2hhbmdlcyBpbiB2MjoK
PiA+IC0gU2luY2UgdGhlIHBsYXRmb3JtIG92ZXJyaWRlIGhvb2tzIHdhcyBkZXByZWNhdGVkLCB1
c2UgdGhlIGZkdF9kcml2ZXIKPiA+IGZvciBpbml0aWFsaXppbmcgdGhlIHNpZml2ZV9kZXZfcGxh
dGZvcm0uCj4gPgo+ID4gTmljayBIdSAoMyk6Cj4gPiAgIGxpYjogdXRpbHM6IEFkZCBjYWNoZSBm
bHVzaCBsaWJyYXJ5Cj4gPiAgIGxpYjogdXRpbHM6IEFkZCBGRFQgY2FjaGUgbGlicmFyeQo+ID4g
ICBsaWI6IHV0aWxzL2NhY2hlOiBBZGQgZmR0IGNtbyBoZWxwZXJzCj4gPgo+ID4gVmluY2VudCBD
aGVuICgyKToKPiA+ICAgdXRpbHM6IGNhY2hlOiBBZGQgU2lGaXZlIGNjYWNoZSBjb250cm9sbGVy
Cj4gPiAgIHBsYXRmb3JtOiBnZW5lcmljOiBBZGQgU2lGaXZlIGRldmVsb3BtZW50IHBsYXRmb3Jt
Cj4gPgo+ID4gIGluY2x1ZGUvc2JpX3V0aWxzL2NhY2hlL2NhY2hlLmggICAgICAgICAgICAgICB8
ICA2OSArKysrKysrCj4gPiAgaW5jbHVkZS9zYmlfdXRpbHMvY2FjaGUvZmR0X2NhY2hlLmggICAg
ICAgICAgIHwgIDM0ICsrKysKPiA+ICBpbmNsdWRlL3NiaV91dGlscy9jYWNoZS9mZHRfY21vX2hl
bHBlci5oICAgICAgfCAgMzQgKysrKwo+ID4gIGxpYi91dGlscy9LY29uZmlnICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgMiArCj4gPiAgbGliL3V0aWxzL2NhY2hlL0tjb25maWcgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDIzICsrKwo+ID4gIGxpYi91dGlscy9jYWNoZS9jYWNoZS5j
ICAgICAgICAgICAgICAgICAgICAgICB8ICA0NiArKysrKwo+ID4gIGxpYi91dGlscy9jYWNoZS9m
ZHRfY2FjaGUuYyAgICAgICAgICAgICAgICAgICB8ICA4NyArKysrKysrKysKPiA+ICBsaWIvdXRp
bHMvY2FjaGUvZmR0X2NhY2hlX2RyaXZlcnMuY2FycmF5ICAgICAgfCAgIDMgKwo+ID4gIGxpYi91
dGlscy9jYWNoZS9mZHRfY21vX2hlbHBlci5jICAgICAgICAgICAgICB8IDExMiArKysrKysrKysr
Kwo+ID4gIGxpYi91dGlscy9jYWNoZS9mZHRfc2lmaXZlX2NjYWNoZS5jICAgICAgICAgICB8IDE3
NSArKysrKysrKysrKysrKysrKysKPiA+ICBsaWIvdXRpbHMvY2FjaGUvb2JqZWN0cy5tayAgICAg
ICAgICAgICAgICAgICAgfCAgMTQgKysKPiA+ICBwbGF0Zm9ybS9nZW5lcmljL0tjb25maWcgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDUgKwo+ID4gIHBsYXRmb3JtL2dlbmVyaWMvY29uZmlncy9k
ZWZjb25maWcgICAgICAgICAgICB8ICAgMyArCj4gPiAgcGxhdGZvcm0vZ2VuZXJpYy9zaWZpdmUv
b2JqZWN0cy5tayAgICAgICAgICAgIHwgICAzICsKPiA+ICBwbGF0Zm9ybS9nZW5lcmljL3NpZml2
ZS9zaWZpdmVfZGV2X3BsYXRmb3JtLmMgfCAgNDIgKysrKysKPiA+ICAxNSBmaWxlcyBjaGFuZ2Vk
LCA2NTIgaW5zZXJ0aW9ucygrKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL3NiaV91
dGlscy9jYWNoZS9jYWNoZS5oCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvc2JpX3V0
aWxzL2NhY2hlL2ZkdF9jYWNoZS5oCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvc2Jp
X3V0aWxzL2NhY2hlL2ZkdF9jbW9faGVscGVyLmgKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgbGli
L3V0aWxzL2NhY2hlL0tjb25maWcKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgbGliL3V0aWxzL2Nh
Y2hlL2NhY2hlLmMKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgbGliL3V0aWxzL2NhY2hlL2ZkdF9j
YWNoZS5jCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGxpYi91dGlscy9jYWNoZS9mZHRfY2FjaGVf
ZHJpdmVycy5jYXJyYXkKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgbGliL3V0aWxzL2NhY2hlL2Zk
dF9jbW9faGVscGVyLmMKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgbGliL3V0aWxzL2NhY2hlL2Zk
dF9zaWZpdmVfY2NhY2hlLmMKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgbGliL3V0aWxzL2NhY2hl
L29iamVjdHMubWsKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGxhdGZvcm0vZ2VuZXJpYy9zaWZp
dmUvc2lmaXZlX2Rldl9wbGF0Zm9ybS5jCj4gPgo+ID4gLS0KPiA+IDIuMTcuMQo+ID4KClJlZ2Fy
ZCwKTmljawoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
