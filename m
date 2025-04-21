Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E528C369D2
	for <opensbi@archiver.kernel.org>; Mon, 21 Apr 2025 04:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n1DhD/c8C2dour01JbAdle1FUm1WK6lNwJumOHivC5w=; b=ZvYh8EBJjg1+hF
	bah9H4ZT1Tdek2nIs/laupkI3BmqCM9amGoJR3HqxG0WwodAXgVisnO8Km+VTn7gWEKG+RckgI2JT
	Y0qLhHrPnd7v7ICXLvMvJBYle108F9EoC2eYFAZ1EOmc8ej2j1mhj5QOVqlpksbhDYlavlgC+Xj3h
	tbPQBxz58i2d6D88AB/Y7WoDTXQt/o/iHQd88Ze3LwmQVs2wtFMXtvWcejrxS2pzjvVJzkndK1lvd
	YwQnTqT9Ev6/oJ0Tf88/wmxNYQnU1TuL8td6077SE4XcSgJFaqQnx1FI5jUicmrhdIEJuUA/PQTbM
	bocm8E319IFF6HMrRlxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6ijD-00000003ZSh-4BDt;
	Mon, 21 Apr 2025 04:25:55 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6ijB-00000003ZS2-1cFN
	for opensbi@lists.infradead.org;
	Mon, 21 Apr 2025 04:25:54 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-85b3f92c8f8so373693939f.1
        for <opensbi@lists.infradead.org>; Sun, 20 Apr 2025 21:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1745209552; x=1745814352; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/1aj5cqSYoixH6TzCkbWWTrtmzO58spMcGGmnbC9HcU=;
        b=qHGRqC6l7Kuwweg8b34oKcTmPDFLwtHLOlzYCUiIKFQZBT/eDIxPrMU3uyOwmYYSOg
         KY0mJVVXjKXXS8oR6T4tXY6sbvewpnzNfKiJ/ZiGyAG+ljC9RvDTh+iRIQsy1RZE+Auj
         CuANPQr1EacJdSndw8tcYWfnewCeY05aUD8KOzsAWymqh7SF4pZPArWZY1oWjfl1O52T
         I52aTYek9yxxG9B7s1jJ1sgtYzhwclW4eLKWDQTuZEbMZx3y9JaLmUTeWChF35E+m4qE
         4qhLeyVZ9eOa0Xpwb9VhVjR2n2RTD38TeiI3sS8lvsX2EKUqJ627+HJDg1/erMRt3PmH
         kS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745209552; x=1745814352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/1aj5cqSYoixH6TzCkbWWTrtmzO58spMcGGmnbC9HcU=;
        b=s2x/7n2kOPzUBaDwppGTcRV9WqF0GAongBILcxWD26Y1jqiNwQ4evgCxh0ZwLMXxya
         oSL+RCdcPyZiFIjBNJ1lcjY9QV5GeoPBui/SBjwfknPMQeQe4Ww6TozSjUW5nOZe4R9P
         bU4g7JACwAlxI5gtRd1Wp/pQOUY8iqjoV6NFabieX3O5Mvn30ARlKqMunwyRTPpcBJPi
         d1ffmvDyARx5d3oxKlDxJ6TfJiFAjp4T7fNtPLCrO/xVEe/nBO11iLaJTo3ehORUGPnp
         1EDHF5prbKuPVXKC7ppOv2bWYKMxtcqDEAPRo/IS5nQitx967IMGjct39GeztSHrChoZ
         1z+g==
X-Gm-Message-State: AOJu0YzN4JuMIhgS01zdkWnPMPV6p+Di+L23uBX5RnRQ/sqLh+XkBR/6
	YwyyXRo//slArN+e6kaTmZnJGGaxdLECn+cMbpJL9v2fl8itsU2ji5/inin9vJiJqOl25UeduQK
	ohMDwSgm8zcnr2beciAov9C3OOaj4Z+jJ5Zro8kvSgkOtIvgr
X-Gm-Gg: ASbGnct8r1iSEocUUBcRCQUUbUNGcla6uHhBCZIL+iGoRKPK2S8coixbi3HlbhsF6oY
	QBP5cANFnnRHbHrKwh4Xw2Bv4hhzRrTa/mHfABymmpniFNhAbPa4FV7CS5MoVycA/8jS0pmyYn/
	Noj6vLwTFQfawjd8HI9m26ZXJ/yI9mepvsoA==
X-Google-Smtp-Source: AGHT+IErbVBq/nfuykd1MkEGZ5wWz4HnY7JSM6T3O7r9iPQUMOfJCHm6EkuPGdyLfu9StMGl9BrJmGgqGjXMQuyrK6U=
X-Received: by 2002:a05:6e02:160f:b0:3d2:b72d:a502 with SMTP id
 e9e14a558f8ab-3d8941890f8mr97609235ab.22.1745209552427; Sun, 20 Apr 2025
 21:25:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250324154858.4147529-1-samuel.holland@sifive.com>
In-Reply-To: <20250324154858.4147529-1-samuel.holland@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 21 Apr 2025 09:55:39 +0530
X-Gm-Features: ATxdqUF9AAZmeNc8DM3BgvgMAQiQpJupVYFQMRVKX9fOxpFghTODWZ1Hi_P_uog
Message-ID: <CAAhSdy1NoBM+sWhgP7MkokDSro0L6dEBfGO3EuvF-qhViL5eZg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Cache CPU information from the DT
To: Samuel Holland <samuel.holland@sifive.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_212553_424512_75CEEDA6 
X-CRM114-Status: GOOD (  21.92  )
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

T24gTW9uLCBNYXIgMjQsIDIwMjUgYXQgOToyMOKAr1BNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEl0IHR1cm5zIG91dCB0aGF0IE9wZW5TQkkg
c3BlbmRzIGEgbG90IG9mIHRpbWUgcmVwZWF0ZWRseSBwYXJzaW5nIHRoZQo+IEZEVCB0byBnZXQg
aW5mb3JtYXRpb24gYWJvdXQgdGhlIENQVXMgYW5kIGxvY2FsIGludGVycnVwdCBjb250cm9sbGVy
cy4KPiBDYWNoaW5nIHRoaXMgaW5mb3JtYXRpb24gY2FuIHNpZ25pZmljYW50bHkgc3BlZWQgdXAg
Y29sZCBib290LiBGb3IKPiBleGFtcGxlLCBvbiB0aGUgSGlGaXZlIFByZW1pZXIgUDU1MCBib2Fy
ZCAoNCBjb3JlcywgUExJQywgQ0xJTlQpLAo+IGFwcGx5aW5nIHRoaXMgc2VyaWVzIGRlY3JlYXNl
ZCBib290IHRpbWUgYnkgYSB0aGlyZCwgZnJvbSA2LjM1IG1zIHRvCj4gNC4yMyBtcyAod2l0aCBT
QklfU0NSQVRDSF9OT19CT09UX1BSSU5UUyBzZXQpLiBUaGUgaW1wYWN0IHdvdWxkIGJlIGV2ZW4K
PiBsYXJnZXIgb24gc3lzdGVtcyB3aXRoIG1vcmUgY29yZXMuIEFuZCB0aGlzIHNlcmllcyBjb21l
cyB3aXRoIGEgbmV0Cj4gZGVjcmVhc2UgaW4gY29kZSBzaXplIGZvciB0aGUgZ2VuZXJpYyBwbGF0
Zm9ybS4KPgo+IFRvIGJlIGNvbnNlcnZhdGl2ZSwgSSBhdm9pZGVkIHVzaW5nIGNhY2hlZCBpbmZv
cm1hdGlvbiBpbnNpZGUgRkRUIGZpeHVwCj4gZnVuY3Rpb25zLCBhcyBjaGFuZ2VzIHRvIHRoZSBk
ZXZpY2V0cmVlIG1heSBpbnZhbGlkYXRlIHRoZSBvZmZzZXRzCj4gKHRob3VnaCB0aGUgcGhhbmRs
ZXMgd291bGQgc3RpbGwgYmUgYWNjdXJhdGUpLgo+Cj4gU2luY2UgdGhlIGNhY2hlZCBpbmZvcm1h
dGlvbiBpcyBzdG9yZWQgaW4gdGhlIHNjcmF0Y2ggc3BhY2UsIEkgZGlkIG5vdAo+IGZpbmQgYSBn
b29kIHdheSB0byBjb21iaW5lIHRoZSBwYXJzaW5nIHdpdGggdGhlIGdlbmVyaWMKPiBmd19wbGF0
Zm9ybV9pbml0KCkuCj4KPiBDaGFuZ2VzIGluIHYyOgo+ICAtIFJlbmFtZSBmb3JfZWFjaF9oYXJ0
aW5kZXgoKSB0byBzYmlfZm9yX2VhY2hfaGFydGluZGV4KCkKPiAgLSBBZGQgbWlzc2luZyBpbmNs
dWRlIG9mIGZkdF9jcHUuaCBpbiBmZHRfaGVscGVyLmMKPgo+IFNhbXVlbCBIb2xsYW5kICg1KToK
PiAgIGxpYiB1dGlscy9mZHQ6IERyb3AgZmR0X3BhcnNlX21heF9lbmFibGVkX2hhcnRfaWQoKQo+
ICAgbGliOiB1dGlscy9mZHQ6IENhY2hlIENQVSBpbmZvcm1hdGlvbiBmcm9tIHRoZSBEVAo+ICAg
bGliOiB1dGlscy9mZHQ6IFVzZWQgY2FjaGVkIENQVSBEVCBpbmZvcm1hdGlvbgo+ICAgbGliOiB1
dGlsczogVXNlIGZkdF9jcHVfaW50Y19waGFuZGxlX3RvX2hhcnRpbmRleCgpCj4gICBsaWI6IHV0
aWxzOiBVc2UgZmR0X2NwdV9nZXRfdGltZWJhc2VfZnJlcXVlbmN5KCkKCk92ZXJhbGwsIHRoZXNl
IGFyZSBnb29kIG9wdGltaXphdGlvbnMgYnV0IHRoZSBkb3duc2lkZSBpcwp0aGlzIGNhY2hlZCBp
bmZvcm1hdGlvbiBpcyBub3QgYXZhaWxhYmxlIGJlZm9yZSBmZHRfY3B1X2luaXQoKQphbmQgaXQg
YmVjb21lcyBzdGFsZSBvbmNlIHdlIHN0YXJ0IGZpeGluZy11cCAvIHBhdGNoaW5nIHRoZSBEVC4K
CkkgaGF2ZSB0aGUgZm9sbG93aW5nIHN1Z2dlc3Rpb25zOgoKMSkgT25seSB1c2UgZmR0X2NwdV94
eXooKSBmdW5jdGlvbnMgaW4gRkRUIHBhcnNpbmcgLyByZWFkaW5nCiAgICByZWxhdGVkIGNvZGUg
YW5kIHJlbW92ZSB1c2FnZSBvZiB0aGVzZSBmdW5jdGlvbnMgZnJvbQogICAgIEZEVCBmaXh1cHMu
IFRoaXMgb25seSBpbXBhY3RzIFBBVENIMyB3aGlsZSBvdGhlcgogICAgIHBhdGNoZXMgc2VlbSBm
aW5lLgoKMikgVGhlcmUgc2hvdWxkIGJlIGEgZmxhZyBmZHRfY3B1X2NhY2hlX3ZhbGlkIGluIGZk
dF9jcHUuYwogICAgIHdoaWNoIHRlbGxzIHVzIHdoZXRoZXIgY2FjaGVkIENQVSBpbmZvcm1hdGlv
biBpcyB2YWxpZAogICAgIG9yIG5vdC4gQWxsIGZkdF9jcHVfeHl6KCkgZnVuY3Rpb25zIHNob3Vs
ZCBmYWlsIHdoZW4KICAgICBmZHRfY3B1X2NhY2hlX3ZhbGlkID0gZmFsc2UuIFRoZSBmZHRfY3B1
X2luaXQoKSB3aWxsCiAgICAgc2V0IGZkdF9jcHVfY2FjaGVfdmFsaWQgd2hlcmVhcyB0aGlzIGZs
YWcgd2lsbCBiZQogICAgIGNsZWFyZWQgZnJvbSBwbGF0Zm9ybV9maW5hbF9pbml0KCkganVzdCBi
ZWZvcmUgZG9pbmcKICAgICBGRFQgZml4dXBzLiBUaGlzIG9ubHkgaW1wYWN0cyBQQVRDSDIuCgpS
ZWdhcmRzLApBbnVwCgoKCj4KPiAgaW5jbHVkZS9zYmlfdXRpbHMvZmR0L2ZkdF9jcHUuaCAgICAg
ICB8ICA1NyArKysrKysrKysrKwo+ICBpbmNsdWRlL3NiaV91dGlscy9mZHQvZmR0X2hlbHBlci5o
ICAgIHwgICA0IC0KPiAgaW5jbHVkZS9zYmlfdXRpbHMvaXJxY2hpcC9pbXNpYy5oICAgICB8ICAg
MiArLQo+ICBsaWIvdXRpbHMvZmR0L2ZkdF9jcHUuYyAgICAgICAgICAgICAgIHwgMTEwICsrKysr
KysrKysrKysrKysrKysrKwo+ICBsaWIvdXRpbHMvZmR0L2ZkdF9kb21haW4uYyAgICAgICAgICAg
IHwgMTE3ICsrKysrKystLS0tLS0tLS0tLS0tLS0KPiAgbGliL3V0aWxzL2ZkdC9mZHRfaGVscGVy
LmMgICAgICAgICAgICB8IDEzMyArKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBsaWIvdXRp
bHMvZmR0L29iamVjdHMubWsgICAgICAgICAgICAgIHwgICAxICsKPiAgbGliL3V0aWxzL2lycWNo
aXAvZmR0X2lycWNoaXBfaW1zaWMuYyB8ICAxOSArLS0tCj4gIGxpYi91dGlscy9pcnFjaGlwL2Zk
dF9pcnFjaGlwX3BsaWMuYyAgfCAgMjEgKy0tLQo+ICBsaWIvdXRpbHMvaXJxY2hpcC9pbXNpYy5j
ICAgICAgICAgICAgIHwgICA2ICstCj4gIGxpYi91dGlscy90aW1lci9mZHRfdGltZXJfbXRpbWVy
LmMgICAgfCAgIDcgKy0KPiAgbGliL3V0aWxzL3RpbWVyL2ZkdF90aW1lcl9wbG10LmMgICAgICB8
ICAgOCArLQo+ICBwbGF0Zm9ybS9mcGdhL29wZW5waXRvbi9wbGF0Zm9ybS5jICAgIHwgIDExICsr
LQo+ICBwbGF0Zm9ybS9nZW5lcmljL3BsYXRmb3JtLmMgICAgICAgICAgIHwgICA1ICsKPiAgcGxh
dGZvcm0va2VuZHJ5dGUvazIxMC9wbGF0Zm9ybS5jICAgICB8ICAxMCArKwo+ICAxNSBmaWxlcyBj
aGFuZ2VkLCAyNjQgaW5zZXJ0aW9ucygrKSwgMjQ3IGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgaW5jbHVkZS9zYmlfdXRpbHMvZmR0L2ZkdF9jcHUuaAo+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgbGliL3V0aWxzL2ZkdC9mZHRfY3B1LmMKPgo+IC0tCj4gMi40Ny4yCj4KPgo+IC0tCj4g
b3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0tIApvcGVu
c2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
