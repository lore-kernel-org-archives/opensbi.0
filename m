Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F1DC5DF87
	for <opensbi@archiver.kernel.org>; Fri, 21 Aug 2026 11:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vcffZ51kZIwK/KutKD1puwBUU/OyDG50xgNYAQyyrkQ=; b=RxiPmpO3HH36Sq
	saXIoqSK7XxHwHQPo4P7yaeixBSTa5lEgVmw16w01ieOIp3Dmyd7GMh5TPno+c2auAax2gQcOxu8g
	dFMw3SZzqO1wX7DNLn8B97pLhF6ueMLexbGQt+fNJm7aMKVtrkRX2IW0ynq+9FuF+QrJCMlNdNIMq
	33ucJ9plCKISO2+3QAYGbJBL9j+McbUKB//zpjExmoIU4e4i6ZHxzcIhzMPLAxpYefzf0PoESPrr5
	GT5iCIZyQstkH+YD9qt2dg0Uv5twblx6962e0kkyW0UJ4NWXzkNG/iUgOM7ctlhjq1ZHl3TlNj9p6
	ov8FiWYv2xF6htTuMp3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxN65-0000000D9Jk-3K1o;
	Fri, 21 Aug 2026 11:07:41 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxN63-0000000D9J0-1dcj
	for opensbi@lists.infradead.org;
	Fri, 21 Aug 2026 11:07:40 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4956242332dso7353195e9.2
        for <opensbi@lists.infradead.org>; Fri, 21 Aug 2026 04:07:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787310457; cv=none;
        d=google.com; s=arc-20260327;
        b=h+6hSO5WAF9utKfgYDB5g817gko3EMzEo2eUBm1//7s3WNYomieU7rx06rm9RVSwF4
         m7jwyC7aP+aERaoSzMwxvsRa3zfi3bSnXXYO8IckHNW+mT5DS3BRQNRZ6TYVnRFt2u2B
         bvlkhLHMUVC4fJu6I0CAomdu/Jj01uD0FhIzA7FOBmJ5rT0C0K2UU/vj5JB/2DvvMCOk
         JuGl1KFKoAx9htjBKL/KbZ/camZgaDShlLol+1pjniYirNazyO0maV+DNnPSJ30ove13
         6MLPFVEy1JfZE90o+hUhaxwIgwhk63+QXSnSrhm8D4+W/MXg3fdsP/5xHLYpr5KlkIMB
         hnLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i6cyfuoI/35SXpFFejX8DzIFqzz3jyqyBMT2CvtZNTI=;
        fh=eQRLnJNeHQBGvSQQ3K81dsZjCFpV01l3b0rpGkosk9o=;
        b=YP6IYj+j6NdBhHaQNYVpRBl0Kz0vVWd4lsjbQSzffXatiUFB8eKI6AuJkG1Q0hktc5
         hQhi2y9HJgFS4zR0FMV2AMcmFxcYWIBDYAlS54vUwMA7N1Xx7ltaQDeShAQZIYxdPsX6
         KefRSvAUYedKaOjPYcYhFajOaWL4SnRaK80zC9u5Tf9ZOI7DnH6azf/hUVKq24CLEM2j
         39mnSe2099ETjrZT7XiQZ780QxIBFA7jL0iUK0ccz42PxSxg7sabORPQFS6gcxugYz1s
         MUru73Qnyln/Qh07kW4fyxKk0T+6Nbrvq3G6VCBUAWbzF6kyWvWKnHp7OBXeD/AU6FlM
         c9mQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1787310457; x=1787915257; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i6cyfuoI/35SXpFFejX8DzIFqzz3jyqyBMT2CvtZNTI=;
        b=KE16gl54JHtDdzqKmqiUD7eKb1HnToinLV9aQH0p3VjLg9cKeh3T244KsvClhwjdSw
         ZiWyHYMO6ijBBX+vKkhAGg9SxRRrxv0t9OIu5UGOk6BCeA1vSU5svdupTs6BhOGyO1YN
         51+BajCKAN+Ro7iNoJmpF3CI33/4wP0gJmLEXEmVAkuCM0INXrJ21J/l2rvAYI2IqmKM
         7jJSNpzUeSjYlDPeVm37soLyqmFT9JSMvUKiycVXQaI9l1lksQJsOQ2G0iwUQIDAMpxH
         6mUeXzA046cLpXjf98uonV0ncJUtUwmYtzh/t87OSdjvsuTZqxW4Tz9M7B0eJCOGBoWE
         oxlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787310457; x=1787915257;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i6cyfuoI/35SXpFFejX8DzIFqzz3jyqyBMT2CvtZNTI=;
        b=bmxhjpWH3ceCEtmWSDr0BZavKznPAW3TkY4m5W+7C2ut2aDBtXPlkFbTDClnl7VtG6
         6QUV/LG443jRo29s1u+3pTjD439eOWN5ivsV4XRZPwWkeGt/SrP63K2O8JZ9Klv45Ksx
         DXkI7+PEb/Pcs9Ln2j3Z53OK9VIJGR/qT0gawJwFexyB6lt6hqqgcqtErb4mHcJB1zA8
         0bgj5z0CsZCPVUbpJbOZQmKfnvSP9ITazjoFJyZFQUIuQhbQATXqTLR912LH+c8vHhoz
         X/sOJTtECo+tBimeAxBb45eLLgagOuCesl+r2PB1rogV4cXTx+Csky0RZJ8BSq2iuMAA
         IqLg==
X-Gm-Message-State: AOJu0YzcrzQgMhmiwrPfspT1q0KCzs96IYB4aSOwR3PkOXO6ARScFEeP
	Jq13Jb9DesBYRA0AWBoewt0YQhOSXKbQIOrgUXcymfP33kJ43Mmlo9OdsS88f6YL+CVjLx//6tX
	9x55pcNrDezzq2SOzk0o/aBdSlU23q9RV0TB8VhwB0Wohi38Bl9ktW08=
X-Gm-Gg: AR+sD1340IH0Js2KF385YfavFtMI7MxVHU7gzPfjxTGJIpuoFwxEC4cSU2GMyBcn35i
	+l9EWOo4vfKc6U0Xy7+2Qg6DBjha7MFS3+j9MyAEq1utpwZyuyf/ogE1AVzKt/KeqYKYNChu72R
	U3FjRhG+AX10kebtKG/4+IVfn64uJBR5VYgeW+2y9Qeifw+4tvbChEnxRP4k1eMbr5Q7sut1eNA
	K+4aaSKC04HogsQpKLGO+qhyeLy1eS/pwi+obrFvmRdRNRVWZWrBta5JSU1OXk4UlOoW5Fn8ayr
	C4bg6dW7p4DFdZtvvi/lB1201daxPKV1538UV8TbboOHyz19vV/rnB8vQYoBQOoaNXRQ2PILr0A
	8kMuXCPMExV5zLLaRdes37VUc5HQbSY2Nqr4Nwwq/M2FsFDV/WYyzghzhIsXa1tQ=
X-Received: by 2002:a05:600d:864a:20b0:499:be2d:c290 with SMTP id
 5b1f17b1804b1-499be2dc2d9mr15991725e9.9.1787310456853; Fri, 21 Aug 2026
 04:07:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260707033954.2054859-1-zong.li@sifive.com> <CAAhSdy0ctLCb6AhbQaz-TY2Bb8uGC6ToCaeCsADUJCyR-2WtDQ@mail.gmail.com>
 <CANXhq0pmZd9TYcA5Y1cGwRT8vDWzz3ceia6Zt2hsYa3MVg1uDA@mail.gmail.com>
In-Reply-To: <CANXhq0pmZd9TYcA5Y1cGwRT8vDWzz3ceia6Zt2hsYa3MVg1uDA@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 21 Aug 2026 16:37:25 +0530
X-Gm-Features: AcwNN1VuqhYajYGGc5IQumbvJ59H56VQ9jHdMpA7ttoFhhCS6qaClwZciiaHQkA
Message-ID: <CAAhSdy2VnsSD-U9PG-yucH73ttgR=H7wSK4J_QMBUc9mfySXfA@mail.gmail.com>
Subject: Re: [PATCH 0/7] firmware: add FW_DYNAMIC_APPEND firmware type
To: Zong Li <zong.li@sifive.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_040739_469141_3266EF4E 
X-CRM114-Status: GOOD (  39.28  )
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

T24gRnJpLCBBdWcgMjEsIDIwMjYgYXQgMzowNeKAr1BNIFpvbmcgTGkgPHpvbmcubGlAc2lmaXZl
LmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIEF1ZyAxOSwgMjAyNiBhdCA4OjU34oCvUE0gQW51cCBQ
YXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gVHVlLCBKdWwgNywg
MjAyNiBhdCA5OjEw4oCvQU0gWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPiB3cm90ZToKPiA+
ID4KPiA+ID4gVGhpcyBzZXJpZXMgYWRkcyBhIGZvdXJ0aCBPcGVuU0JJIGZpcm13YXJlIHR5cGUs
IEZXX0RZTkFNSUNfQVBQRU5ELCBuZXh0IHRvCj4gPiA+IHRoZSBleGlzdGluZyBGV19EWU5BTUlD
LCBGV19KVU1QIGFuZCBGV19QQVlMT0FELgo+ID4gPgo+ID4gPiBNb3RpdmF0aW9uCj4gPiA+ID09
PT09PT09PT0KPiA+ID4KPiA+ID4gRldfRFlOQU1JQyByZXF1aXJlcyB0aGUgcHJldmlvdXMgYm9v
dGluZyBzdGFnZSB0byBidWlsZCBhIHN0cnVjdAo+ID4gPiBmd19keW5hbWljX2luZm8gaW4gbWVt
b3J5IGFuZCBwYXNzIGl0cyBhZGRyZXNzIGluIGEyLiBTb21lIGJvb3Rpbmcgc3RhZ2VzCj4gPiA+
IGNhbm5vdCBlYXNpbHkgYWxsb2NhdGUgYW5kIHBhc3Mgc3VjaCBhIHN0cnVjdHVyZSwgYnV0IHRo
ZXkgY2FuIGxvYWQgdGhlCj4gPiA+IE9wZW5TQkkgaW1hZ2UgYW5kIHBhdGNoIGEgZmV3IHdvcmRz
IGF0IGEga25vd24gbG9jYXRpb24gYmVmb3JlIGp1bXBpbmcgdG8KPiA+ID4gaXQuIEZXX0RZTkFN
SUNfQVBQRU5EIHRhcmdldHMgZXhhY3RseSB0aGF0IGNhc2U6IHRoZSBzdHJ1Y3QgZndfZHluYW1p
Y19pbmZvCj4gPiA+IGlzIGFwcGVuZGVkIGludG8gdGhlIE9wZW5TQkkgYmluYXJ5IGFuZCBwYXRj
aGVkIGluIHBsYWNlIGJ5IHRoZSBwcmV2aW91cwo+ID4gPiBzdGFnZS4gRm9yIGV4YW1wbGUsIHRo
ZSBwcmV2aW91cyBib290IHN0YWdlIHJ1bnMgb24gYSBkZWRpY2F0ZWQgaGFydC4KPiA+ID4gVGhl
cmVmb3JlLCBpdCBjYW5ub3Qgc2V0IHVwIENTUnMgb2YgYW5vdGhlciBoYXJ0IHRoYXQgcnVucyBP
cGVuU0JJLgo+ID4gPiBUaGlzIHNjZW5hcmlvIHdpbGwgb2NjdXJzIGluIHNlcnZlciBzeXN0ZW1z
IHdpdGggc2VjdXJlIGJvb3QuCj4gPiA+Cj4gPiA+IEtleSBkZXNpZ24gcG9pbnRzCj4gPiA+ID09
PT09PT09PT09PT09PT09Cj4gPiA+Cj4gPiA+ICAgLSBUaGUgYXBwZW5kZWQgc3RydWN0IGZ3X2R5
bmFtaWNfaW5mbyBpcyBwbGFjZWQgaW1tZWRpYXRlbHkgYmVmb3JlIC5ic3MuCj4gPiA+ICAgICAu
YnNzIGlzIE5PQklUUyBhbmQgaXMgZHJvcHBlZCBieSAnb2JqY29weSAtTyBiaW5hcnknLCBzbyBh
IHN0cnVjdHVyZQo+ID4gPiAgICAgYWZ0ZXIgaXQgd291bGQgbm90IGJlIHBhcnQgb2YgdGhlIGZs
YXQgLmJpbi4gUGxhY2luZyBpdCBiZWZvcmUgLmJzcwo+ID4gPiAgICAgbWFrZXMgaXQgdGhlIGxh
c3QgUFJPR0JJVFMgY29udGVudCwgaS5lLiBpdCBzaXRzIGF0IHRoZSB0YWlsIG9mIHRoZQo+ID4g
PiAgICAgLmJpbiBhbmQgY2FuIGJlIGxvY2F0ZWQgZnJvbSB0aGUgaW1hZ2Ugc2l6ZS4gVGhlIHBy
ZXZpb3VzIGJvb3RpbmcKPiA+ID4gICAgIHRhZ2UgY2FuIHRoZXJlZm9yZSBmaW5kIHRoZSBzdHJ1
Y3R1cmUgYXQ6Cj4gPiA+Cj4gPiA+ICAgICAgICAgbG9hZF9hZGRyZXNzICsgYmluYXJ5X2ZpbGVf
c2l6ZSAtIHNpemVvZihzdHJ1Y3QgZndfZHluYW1pY19pbmZvKQo+ID4gPgo+ID4gPiAgIC0gc3Ry
dWN0IGZ3X2R5bmFtaWNfaW5mbyBnYWlucyBhIG5ldyAnYm9vdF9kdGInIGZpZWxkIChpbmZvIHZl
cnNpb24gMykKPiA+ID4gICAgIHRvIGNhcnJ5IHRoZSBEVEIgYWRkcmVzcy4gRXhpc3Rpbmcgb2Zm
c2V0cyBhcmUgdW5jaGFuZ2VkLgo+ID4gPgo+ID4gPiAgIC0gVGhlIHByZXZpb3VzIGJvb3Rpbmcg
c3RhZ2UgcGF0Y2hlcyBldmVyeSBmaWVsZCBhdCBydW50aW1lLiBUaGUKPiA+ID4gICAgIHJlc2Vy
dmF0aW9uIGlzIGEgS0VFUCgpIFBST0dCSVRTIHNlY3Rpb24sIHNvIHRoZSB6ZXJvLWluaXRpYWxp
c2VkCj4gPiA+ICAgICBieXRlcyBzdGlsbCBsYW5kIGF0IHRoZSB0YWlsIG9mIHRoZSAuYmluLgo+
ID4gPgo+ID4gPiAgIC0gT24gdGhlIGNvbGQtYm9vdCBwYXRoIChndWFyZGVkIGJ5IEZXX0RZTkFN
SUNfQVBQRU5EKSwgZndfYmFzZS5TIGNhbGxzCj4gPiA+ICAgICBmd19keW5hbWljX2FwcGVuZF9i
b290X2FyZ3MoKSBpbiBmd19keW5hbWljX2FwcGVuZC5TLiBUaGUgaGVscGVyIHNldHMKPiA+ID4g
ICAgIGEwID0gbWhhcnRpZCwgYTIgPSAmYXBwZW5kZWQgc3RydWN0LCBhbmQgYTEgPSBib290X2R0
YiwgYW5kIGNsZWFycyB0aGUKPiA+ID4gICAgIHJlc2VydmVkIGEzL2E0IHRoYXQgZndfcGxhdGZv
cm1faW5pdCBjb25zdW1lcy4gT25seSBhMC1hNCBhcmUgaGFuZGxlZAo+ID4gPiAgICAgaGVyZSwg
dGhlIHJlbWFpbmluZyBHUFJzIGFyZSBhbHJlYWR5IGNsZWFyZWQgYnkgdGhlIGV4aXN0aW5nIF9y
ZXNldF9yZWdzCj4gPiA+ICAgICBsYXRlciBvbiB0aGUgY29sZCBwYXRoLiBUaGUgYm9vdF9kdGIg
bG9hZCBpcyBnYXRlZCBvbiBpbmZvIHZlcnNpb24gMywgc28KPiA+ID4gICAgIGFuIG9sZGVyIGxh
eW91dCBsZWF2ZXMgYTEgPSAwIGluc3RlYWQgb2YgcmVhZGluZyBwYXN0IHRoZSBzdHJ1Y3QuCj4g
PiA+Cj4gPiA+IEJhY2t3YXJkIGNvbXBhdGliaWxpdHkKPiA+ID4gPT09PT09PT09PT09PT09PT09
PT09PQo+ID4gPgo+ID4gPiBBbGwgY2hhbmdlcyBmb3IgdGhlIGV4aXN0aW5nIHRocmVlIGZpcm13
YXJlIHR5cGVzIGFyZSBjb21waWxlZCBvdXQ6IHRoZQo+ID4gPiBmd19iYXNlLlMgZml4dXAgYW5k
IHRoZSAuZndfZHluYW1pY19pbmZvIG91dHB1dCBzZWN0aW9uIGFyZSB1bmRlcgo+ID4gPiAjaWZk
ZWYgRldfRFlOQU1JQ19BUFBFTkQsIHdoaWNoIGlzIGRlZmluZWQgb25seSBieSBmd19keW5hbWlj
X2FwcGVuZC5TIGFuZAo+ID4gPiBmd19keW5hbWljX2FwcGVuZC5lbGYubGRTLiBGV19EWU5BTUlD
LCBGV19KVU1QIGFuZCBGV19QQVlMT0FEIGJpbmFyaWVzIGFyZQo+ID4gPiBieXRlLWZvci1ieXRl
IHVuY2hhbmdlZC4KPiA+ID4KPiA+ID4gQnVpbGQKPiA+ID4gPT09PT0KPiA+ID4KPiA+ID4gICBt
YWtlIFBMQVRGT1JNPTxwbGF0Zm9ybV9zdWJkaXI+IEZXX0RZTkFNSUNfQVBQRU5EPXkKPiA+ID4K
PiA+ID4gT24gdGhlIGdlbmVyaWMgcGxhdGZvcm0gRldfRFlOQU1JQ19BUFBFTkQ9eSBpcyBzZXQg
aW4KPiA+ID4gcGxhdGZvcm0vZ2VuZXJpYy9vYmplY3RzLm1rLCBzbyBpdCBpcyBidWlsdCBieSBk
ZWZhdWx0Lgo+ID4gPgo+ID4gPiBab25nIExpICg3KToKPiA+ID4gICBmaXJtd2FyZTogZndfZHlu
YW1pYzogYWRkIGJvb3RfZHRiIGZpZWxkIHRvIHN0cnVjdCBmd19keW5hbWljX2luZm8KPiA+ID4g
ICBmaXJtd2FyZTogZndfYmFzZS5sZFM6IGFkZCAuZndfZHluYW1pY19pbmZvIG91dHB1dCBzZWN0
aW9uIGJlZm9yZSAuYnNzCj4gPiA+ICAgZmlybXdhcmU6IGFkZCBmd19keW5hbWljX2FwcGVuZCBm
aXJtd2FyZSB0eXBlCj4gPiA+ICAgZmlybXdhcmU6IGZ3X2Jhc2UuUzogY2FsbCBmd19keW5hbWlj
X2FwcGVuZF9ib290X2FyZ3Mgb24gY29sZCBib290Cj4gPiA+ICAgZmlybXdhcmU6IGJ1aWxkIGFu
ZCBlbmFibGUgdGhlIEZXX0RZTkFNSUNfQVBQRU5EIGZpcm13YXJlIHR5cGUKPiA+ID4gICBkb2Nz
OiBmaXJtd2FyZTogZG9jdW1lbnQgdGhlIEZXX0RZTkFNSUNfQVBQRU5EIGZpcm13YXJlIHR5cGUK
PiA+ID4gICBkb2NzOiBmaXJtd2FyZTogbGlzdCBGV19EWU5BTUlDX0FQUEVORCBpbiBmdy5tZAo+
ID4KPiA+IEluc3RlYWQgb2YgaW50cm9kdWNpbmcgbmV3IGZpcm13YXJlIHR5cGUsIHNhbWUgdGhp
bmcgY2FuIGJlIGFjaGlldmVkIGJ5Cj4gPiBzaW1wbHkgaW50cm9kdWNpbmcgYSBmb3JtYXR0ZWQg
aGVhZGVyIGZvciBhbGwgT3BlblNCSSBmaXJtd2FyZS4KPiA+Cj4gPiBJZiB0aGUgcHJldmlvdXMg
Ym9vdGluZyBzdGFnZSBjYW5ub3QgcGFzcyBwYXJhbWV0ZXJzIGluIGEwLCBhMSwgYW5kIGEyCj4g
PiB0aGVuIGl0IGNhbiBzaW1wbHkgb3ZlcnJpZGUgdGhlIHZhbHVlcyBvZiBhMCwgYTEsIGFuZCBh
MiBieSBzZXR0aW5nIGZpZWxkcwo+ID4gaW4gT3BlblNCSSBmaXJtd2FyZSBoZWFkZXIuCj4gPgo+
ID4gRm9yIGV4YW1wbGUsIHdlIGNhbiBoYXZlIDEyOC1ieXRlIE9wZW5TQkkgZmlybXdhcmUgaGVh
ZGVyIGRlZmluZWQKPiA+IGluIGZ3X2Jhc2UuUyBhcyBmb2xsb3dzOgo+ID4KPiA+IGRpZmYgLS1n
aXQgYS9maXJtd2FyZS9md19iYXNlLlMgYi9maXJtd2FyZS9md19iYXNlLlMKPiA+IGluZGV4IDBj
NWM2NWMxLi4wZDYzZmUxZSAxMDA2NDQKPiA+IC0tLSBhL2Zpcm13YXJlL2Z3X2Jhc2UuUwo+ID4g
KysrIGIvZmlybXdhcmUvZndfYmFzZS5TCj4gPiBAQCAtNDQsOCArNDQsNjQgQEAKPiA+ICAgLnNl
Y3Rpb24gLmVudHJ5LCAiYXgiLCAlcHJvZ2JpdHMKPiA+ICAgLmFsaWduIDMKPiA+ICAgLmdsb2Js
IF9zdGFydAo+ID4gKyAuZ2xvYmwgX3N0YXJ0X3JlYWwKPiA+ICAgLmdsb2JsIF9zdGFydF93YXJt
Cj4gPiAgX3N0YXJ0Ogo+ID4gKyAvKiBPcGVuU0JJIGZpcm13YXJlIGhlYWRlciAqLwo+ID4gK19m
d19oZWFkZXJfanVtcDoKPiA+ICsgLm9wdGlvbiBwdXNoCj4gPiArIC5vcHRpb24gbm9ydmMKPiA+
ICsgaiBfc3RhcnRfcmVhbAo+ID4gKyAub3B0aW9uIHBvcAo+ID4gK19md19oZWFkZXJfbWFnaWM6
Cj4gPiArIC53b3JkIDB4NDk0MjUzNGYgLyogQVNDSUkgc3RyaW5nICJPU0JJIiAqLwo+ID4gK19m
d19oZWFkZXJfdmVyc2lvbjoKPiA+ICsgLndvcmQgMHgxCj4gPiArX2Z3X2hlYWRlcl94bGVuOgo+
ID4gKyAud29yZCBfX3Jpc2N2X3hsZW4KPiA+ICtfZndfaGVhZGVyX3NpemU6Cj4gPiArIC53b3Jk
IChfZndfZW5kIC0gX2Z3X3N0YXJ0KQo+ID4gK19md19oZWFkZXJfZmxhZ3M6Cj4gPiArI2RlZmlu
ZSBGV19IRUFERVJfRkxBR1NfT1ZFUlJJREVfQTAgKDEgPDwgMCkKPiA+ICsjZGVmaW5lIEZXX0hF
QURFUl9GTEFHU19PVkVSUklERV9BMSAoMSA8PCAxKQo+ID4gKyNkZWZpbmUgRldfSEVBREVSX0ZM
QUdTX09WRVJSSURFX0EyICgxIDw8IDIpCj4gPiArIC53b3JkIDAKPiA+ICtfZndfaGVhZGVyX292
ZXJyaWRlX2EwOgo+ID4gKyAuZHdvcmQgMAo+ID4gK19md19oZWFkZXJfcmVzZXJ2ZWQwOgo+ID4g
KyAuZHdvcmQgMAo+ID4gK19md19oZWFkZXJfb3ZlcnJpZGVfYTE6Cj4gPiArIC5kd29yZCAwCj4g
PiArX2Z3X2hlYWRlcl9yZXNlcnZlZDE6Cj4gPiArIC5kd29yZCAwCj4gPiArX2Z3X2hlYWRlcl9v
dmVycmlkZV9hMjoKPiA+ICsgLmR3b3JkIDAKPiA+ICtfZndfaGVhZGVyX3Jlc2VydmVkMjoKPiA+
ICsgLmR3b3JkIDAKPiA+ICtfZndfaGVhZGVyX3Jlc2VydmVkOgo+ID4gKyAuZmlsbCA3LCA4LCAw
Cj4gPiArX3N0YXJ0X3JlYWw6Cj4gPiArIC8qIENoZWNrIGFuZCBvdmVycmlkZSBhMCwgYTEsIGFu
ZCBhMiByZWdpc3RlcnMgKi8KPiA+ICsgbGxhIHQwLCBfZndfaGVhZGVyX2ZsYWdzCj4gPiArIGx3
IHQwLCAodDApCj4gPiArIGxpIHQxLCBGV19IRUFERVJfRkxBR1NfT1ZFUlJJREVfQTAKPiA+ICsg
YW5kIHQyLCB0MCwgdDEKPiA+ICsgYmVxIHQyLCB6ZXJvLCBfc2tpcF9vdmVycmlkZV9hMAo+ID4g
KyBsbGEgdDIsIF9md19oZWFkZXJfb3ZlcnJpZGVfYTAKPiA+ICsgUkVHX0wgYTAsICh0MikKPiA+
ICtfc2tpcF9vdmVycmlkZV9hMDoKPiA+ICsgbGkgdDEsIEZXX0hFQURFUl9GTEFHU19PVkVSUklE
RV9BMQo+ID4gKyBhbmQgdDIsIHQwLCB0MQo+ID4gKyBiZXEgdDIsIHplcm8sIF9za2lwX292ZXJy
aWRlX2ExCj4gPiArIGxsYSB0MiwgX2Z3X2hlYWRlcl9vdmVycmlkZV9hMQo+ID4gKyBSRUdfTCBh
MSwgKHQyKQo+ID4gK19za2lwX292ZXJyaWRlX2ExOgo+ID4gKyBsaSB0MSwgRldfSEVBREVSX0ZM
QUdTX09WRVJSSURFX0EyCj4gPiArIGFuZCB0MiwgdDAsIHQxCj4gPiArIGJlcSB0MiwgemVybywg
X3NraXBfb3ZlcnJpZGVfYTIKPiA+ICsgbGxhIHQyLCBfZndfaGVhZGVyX292ZXJyaWRlX2EyCj4g
PiArIFJFR19MIGEyLCAodDIpCj4gPiArX3NraXBfb3ZlcnJpZGVfYTI6Cj4gPiAgIC8qIEZpbmQg
cHJlZmVycmVkIGJvb3QgSEFSVCBpZCAqLwo+ID4gICBNT1ZfM1IgczAsIGEwLCBzMSwgYTEsIHMy
LCBhMgo+ID4gICBjYWxsIGZ3X2Jvb3RfaGFydAo+ID4KPiA+Cj4gPiBQbGVhc2Ugbm90ZSB0aGF0
IE9wZW5TQkkgZmlybXdhcmUgaGVhZGVyIGRlZmluZWQgYWJvdmUgc2hvdWxkCj4gPiB3b3JrIGZv
ciBib3RoIFJWMzIgYW5kIFJWNjQgYW5kIGluIHRoZSBmdXR1cmUgY2FuIGFsc28gYmUgZXh0ZW5k
ZWQKPiA+IGZvciBSVjEyOC4KPiA+Cj4KPiBIaSBBbnVwLAo+IFRoYW5rcyBmb3IgeW91ciBzdWdn
ZXN0aW9uISBJIHdpbGwgc2VuZCBhbm90aGVyIHBhdGNoIHNlcmllcyB0byBpbXBsZW1lbnQgdGhp
cy4KPiBBZGRpdGlvbmFsbHksIEkgbm90aWNlZCB0aGF0IC5vcHRpb24gbm9ydmMgbWlnaHQgbm90
IGJlIGVub3VnaC4gV2UKPiBhbHNvIG5lZWQgLm9wdGlvbiBub3JlbGF4IGZvciB0aGUgcnYzMiBj
YXNlLiBUaGlzIGlzIGJlY2F1c2UgR0FTIHB1dHMKPiBSX1JJU0NWX1JFTEFYIHRvZ2V0aGVyIHdp
dGggUl9SSVNDVl9KQUwuIEFzIGEgcmVzdWx0LCB0aGUgbGlua2VyIHdpbGwKPiBzdGlsbCB1c2Ug
YSBjb21wcmVzc2VkIGp1bXAsIHdoaWNoIGNhdXNlcyB0aGUgb2Zmc2V0IHRvIGNoYW5nZS4gTGV0
IG1lCj4gc3VibWl0IGl0IGZvciBmdXJ0aGVyIHJldmlldy4KPiBUaGFua3MKPgoKU291bmRzIGdv
b2QuCgpSZWdhcmRzLApBbnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vb3BlbnNiaQo=
