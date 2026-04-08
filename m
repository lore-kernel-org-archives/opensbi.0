Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A971073CAB
	for <opensbi@archiver.kernel.org>; Wed,  8 Apr 2026 12:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iVFnWk6CTvwh2Vy+C7aHOEaqHEuu+G8hcFVw/qMUKxM=; b=wNbrCDSXjmD8gT
	JtNFm8WFul+fUL3uLHPdAF5W0J7BvCbqR+gY2e96ixZrbkQF/vK6a+tU2YpDfdVhJcimB+s88bTd3
	SdFByvIOyAKbV4OeCrP2JYd8J+IxjyM/1/OviQT9dtaQfOkxYHKYiGLc8DC62FwKCrTsJZQcFCOUQ
	50zCc1Em/37xXHsSousjEHlAlsWyUqhIIjJWJqKlz/tfSX3yulVVX3IuAWomibZQpvAzwvhBDtE/K
	BFDCAM7bj5My+CeR9LV15gZFEoy8iWNkhRNh49x6wxKK0P/Nh+xMJWHjckULOrshqFeAvxn0BBgoy
	kP8XnKGfJxdhjYhklRkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wASAg-00000008rdX-1lhw;
	Wed, 08 Apr 2026 12:38:14 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wASAd-00000008rcf-3Wqp
	for opensbi@lists.infradead.org;
	Wed, 08 Apr 2026 12:38:13 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-687baff8fc3so397343eaf.0
        for <opensbi@lists.infradead.org>; Wed, 08 Apr 2026 05:38:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775651890; cv=none;
        d=google.com; s=arc-20240605;
        b=j5rjDAMDcL6pzeo1/eoot6psn/SHWcrT3iluhHQjiLbNZj0vAvCeXQ/cya4Sihmiee
         riBVv8yA9xvUZMwwGAQ3u2aRdIkqLr72XkoT73alqmWThCL+9JGZqMfJm2ljWvDj11SD
         dxJkzLnhXi/cVdOyukQC8xct3OQH9J7bLAVLpsTEM0yiNfM1G7SEzqDUJ8lW7qIoaX/x
         fbZeo0JQvinNRDuCQqPD7Be/vh9f9j9LN/mz0BZimu/M+1uOL1w9M7g2S2abUKaqyuH6
         bkhwjOn58kCpWFrM0rmUqBJnE8mEmq/xsR/2NZtvMEGxiPciAt8yap24eEI+h8aZ+F00
         lnRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lpzPgfEjXMVluUZLfLoQ/ufD3+RVYvfBhE+g8U46SAQ=;
        fh=quIBDCwyL+NdS19WyrXWv/i7j0ls8eORWbpFbsrsN/o=;
        b=NSKTkyFoSuWeRRWhRfZZsZ7ZF+8jz6OJaE08sAPyBIby1rI3sZiSndoireyypUlHO0
         RP6tYZDzY8qvpAq1vRU8SErwb5pB42xpgCcfOJkLvDjxAyC1Pod3V79KyynhJRALnlxG
         nYw0TAvfmdwFlDNmfZdRG7WObsf44FPJ7HZxk1KQtUiqiWMG3Zqd0K8b8Heo2SoHhFYa
         6L1kHdhG9ZxpbYT9gTM9T2NdhqeNKYlxmcXUPPUERpOm20iM3S9qs7b3OA8aKsEyLIB8
         JTRmn1VRcoLRzmZTLfAICiBOJB7Gz1A6SxGQ+AP+3609AFNAPtHc3IerQ7dZvQ+sSAJq
         20Mw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1775651890; x=1776256690; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lpzPgfEjXMVluUZLfLoQ/ufD3+RVYvfBhE+g8U46SAQ=;
        b=iZFlo4IplJyn0lF/xNEJBoTOFBzz/KG9Imt/APqxYJTc6EhRzfG/aCgk1YCnqjXeyg
         HPpWm+bkJ62FSgBaxswTBhYveA8vvlWnrHsiEGhdFLx50WSgcDgsXvI0ru/phb5CKRkM
         qXhzZJoQUxu5a8C3taO4PZ16e2TcYZZx/5PfdOQbv00z4x0wYI0BYVExLZwfNznPw4ZR
         rGdCIHWPgEWVRzu/q+SfMTWuZZbr2WCnemyvZHaofuDfPrn1MeNaSdk35qtpXh8v4rUG
         wMlg/MqW4VRToEowY62fXzv6gQbQr5RSoogmHGklCYTBADmH9IT0NIpLbdf936v7Mesu
         SLEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775651890; x=1776256690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lpzPgfEjXMVluUZLfLoQ/ufD3+RVYvfBhE+g8U46SAQ=;
        b=UY9Wpaum3bSlDgMKnMWZPj71oUBhuAyQkHNOoQKyWGobH9dA86BqstCJpBV5gTLovn
         BSS39GdKwGYYmB5PzjI5OB/fzYNU57x0+rz4P4Af/lotE9pvFYjV4O1ihFTZeF1212QD
         2pCjJWkBYqTweawM3Rh9auFTB4x1RPXMWypqj2crWRtmqkvjuWJMQsZdpw3Gx2SQDThM
         H9nVB7WXHdacYHgIlYD6P0U8Svhy6jgBF+IUIytFIy4ItZRh2Go8d0rFZvw6GTCpNJqp
         3zIKf1wJcKwK9narr8ncyjzvRTojq/zn2BnDCEWvpvB6J5+HHRBfnN+yjJiH2Tmj+mjX
         RqOA==
X-Gm-Message-State: AOJu0YxSFzDoh7fJnB/N8A9M/Qj5Yo9Gaa8KzAQsDcH/gQqBbzgkpAev
	60ik5VqeYlhT3UQYcD8be77U/4EpWsxt6XrN33u0U5AjnZFp2sECbdQ4Zniy+8g8ZT8H4Fk7uDh
	wdqgQBL88/5+ENseEEA9RmAahrxk+owlxZ9kp/wQ0ODGRpt/Xhh/HuxV5/w==
X-Gm-Gg: AeBDietNeUJCvZRILRxZIHrYYMc3p6UvbKVcoVlNAiz9WPFg7sszs4tpj/0+me/C/H7
	HF9CZkArZfzyfy5KzIuEoeu7AlwBCG1ph7L9fIKMGNH3gy+u49d7xoj4kivaCLD+X+AOTQcq7Wc
	3TTdnnXxLQje3cEiVnWoJYc3hnlmmJe/YM7B7gyjn4UjRZjYrnDen2yfeD2PP1D5ZRypgMdd4qy
	yxmDj/q+6jM3qDM/MfBJ5xbT94epVFngVNQa1z5EMG0BJXaTlknToAnV9ehIUKKruJXEMgXPR2l
	gY0i1pz4tIlhyNO1JdcfRx5XKRHKL2jMCTmu7SJMYlNOGdOnaJWxoYf9GTTAW3mrOdcblt7U94c
	MvWSwM4rRo0P5dp0+4muyuhwx7UE=
X-Received: by 2002:a05:6820:780b:b0:687:cce4:6f7e with SMTP id
 006d021491bc7-687cce47238mr3132805eaf.33.1775651890558; Wed, 08 Apr 2026
 05:38:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260311125116.1401002-1-peter.lin@sifive.com> <20260311125116.1401002-2-peter.lin@sifive.com>
In-Reply-To: <20260311125116.1401002-2-peter.lin@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 8 Apr 2026 18:07:59 +0530
X-Gm-Features: AQROBzA9Pw6Et63rbPh8nxo0Y45SKKisLLPss5h4lA9URkUWa9-liqLh7G1K6XE
Message-ID: <CAAhSdy1UB-ABThcHeaqpznt9_V2-1QqXihmukpyRXqzk1B6nxg@mail.gmail.com>
Subject: Re: [PATCH 2/2] lib: sbi_bitmap_test: add tests for bitmap_empty()
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_053811_943912_095A8F65 
X-CRM114-Status: GOOD (  15.76  )
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

T24gV2VkLCBNYXIgMTEsIDIwMjYgYXQgNjoyMeKAr1BNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gQWRkIHRlc3RzIGZvciBiaXRtYXBfZW1wdHko
KSwgY292ZXJzIGVtcHR5L25vbi1lbXB0eSBiaXRtYXBzIGFuZAo+IGVkZ2UgY2FzZSBuYml0cz0w
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogWXUtQ2hpZW4gUGV0ZXIgTGluIDxwZXRlci5saW5Ac2lmaXZl
LmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9y
Zz4KCkFwcGxpZWQgdGhpcyBwYXRjaCB0byB0aGUgcmlzY3Yvb3BlbnNiaSByZXBvLgoKVGhhbmtz
LApBbnVwCgo+IC0tLQo+ICBsaWIvc2JpL3Rlc3RzL3NiaV9iaXRtYXBfdGVzdC5jIHwgMjkgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlv
bnMoKykKPgo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3Rlc3RzL3NiaV9iaXRtYXBfdGVzdC5jIGIv
bGliL3NiaS90ZXN0cy9zYmlfYml0bWFwX3Rlc3QuYwo+IGluZGV4IGQyYzM1OTk2Li5iNjU4NmZl
MSAxMDA2NDQKPiAtLS0gYS9saWIvc2JpL3Rlc3RzL3NiaV9iaXRtYXBfdGVzdC5jCj4gKysrIGIv
bGliL3NiaS90ZXN0cy9zYmlfYml0bWFwX3Rlc3QuYwo+IEBAIC05MiwxMCArOTIsMzkgQEAgc3Rh
dGljIHZvaWQgYml0bWFwX3hvcl90ZXN0KHN0cnVjdCBzYml1bml0X3Rlc3RfY2FzZSAqdGVzdCkK
PiAgICAgICAgIFNCSVVOSVRfRVhQRUNUX01FTUVRKHRlc3QsIHJlcywgZGF0YV96ZXJvLCBEQVRB
X1NJWkUpOwo+ICB9Cj4KPiArc3RhdGljIHZvaWQgYml0bWFwX2VtcHR5X3Rlc3Qoc3RydWN0IHNi
aXVuaXRfdGVzdF9jYXNlICp0ZXN0KQo+ICt7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nIHJlc1tE
QVRBX1NJWkVdOwo+ICsKPiArICAgICAgIC8qIEFsbCB6ZXJvcyA9IGVtcHR5ICovCj4gKyAgICAg
ICBTQklVTklUX0VYUEVDVF9FUSh0ZXN0LCBiaXRtYXBfZW1wdHkoZGF0YV96ZXJvLCBEQVRBX0JJ
VF9TSVpFKSwgdHJ1ZSk7Cj4gKwo+ICsgICAgICAgLyogTm9uLXplcm8gZGF0YSA9IG5vdCBlbXB0
eSAqLwo+ICsgICAgICAgU0JJVU5JVF9FWFBFQ1RfRVEodGVzdCwgYml0bWFwX2VtcHR5KGRhdGFf
YSwgREFUQV9CSVRfU0laRSksIGZhbHNlKTsKPiArICAgICAgIFNCSVVOSVRfRVhQRUNUX0VRKHRl
c3QsIGJpdG1hcF9lbXB0eShkYXRhX2IsIERBVEFfQklUX1NJWkUpLCBmYWxzZSk7Cj4gKwo+ICsg
ICAgICAgLyogYml0bWFwX3plcm8gY3JlYXRlcyBlbXB0eSBiaXRtYXAgKi8KPiArICAgICAgIGJp
dG1hcF96ZXJvKHJlcywgREFUQV9CSVRfU0laRSk7Cj4gKyAgICAgICBTQklVTklUX0VYUEVDVF9F
USh0ZXN0LCBiaXRtYXBfZW1wdHkocmVzLCBEQVRBX0JJVF9TSVpFKSwgdHJ1ZSk7Cj4gKwo+ICsg
ICAgICAgLyogYml0bWFwX2ZpbGwgY3JlYXRlcyBub24tZW1wdHkgYml0bWFwICovCj4gKyAgICAg
ICBiaXRtYXBfZmlsbChyZXMsIERBVEFfQklUX1NJWkUpOwo+ICsgICAgICAgU0JJVU5JVF9FWFBF
Q1RfRVEodGVzdCwgYml0bWFwX2VtcHR5KHJlcywgREFUQV9CSVRfU0laRSksIGZhbHNlKTsKPiAr
Cj4gKyAgICAgICAvKiBTaW5nbGUgYml0IHNldCA9IG5vdCBlbXB0eSAqLwo+ICsgICAgICAgYml0
bWFwX3plcm8ocmVzLCBEQVRBX0JJVF9TSVpFKTsKPiArICAgICAgIGJpdG1hcF9zZXQocmVzLCAw
LCAxKTsKPiArICAgICAgIFNCSVVOSVRfRVhQRUNUX0VRKHRlc3QsIGJpdG1hcF9lbXB0eShyZXMs
IERBVEFfQklUX1NJWkUpLCBmYWxzZSk7Cj4gKwo+ICsgICAgICAgLyogWmVybyBuYml0cyA9IGVt
cHR5ICovCj4gKyAgICAgICBTQklVTklUX0VYUEVDVF9FUSh0ZXN0LCBiaXRtYXBfZW1wdHkoZGF0
YV9hLCAwKSwgdHJ1ZSk7Cj4gK30KPiArCj4gIHN0YXRpYyBzdHJ1Y3Qgc2JpdW5pdF90ZXN0X2Nh
c2UgYml0bWFwX3Rlc3RfY2FzZXNbXSA9IHsKPiAgICAgICAgIFNCSVVOSVRfVEVTVF9DQVNFKGJp
dG1hcF9hbmRfdGVzdCksCj4gICAgICAgICBTQklVTklUX1RFU1RfQ0FTRShiaXRtYXBfb3JfdGVz
dCksCj4gICAgICAgICBTQklVTklUX1RFU1RfQ0FTRShiaXRtYXBfeG9yX3Rlc3QpLAo+ICsgICAg
ICAgU0JJVU5JVF9URVNUX0NBU0UoYml0bWFwX2VtcHR5X3Rlc3QpLAo+ICAgICAgICAgU0JJVU5J
VF9FTkRfQ0FTRSwKPiAgfTsKPgo+IC0tCj4gMi41My4wCj4KPgo+IC0tCj4gb3BlbnNiaSBtYWls
aW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0tIApvcGVuc2JpIG1haWxpbmcg
bGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
