Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84BBD6D22D
	for <opensbi@archiver.kernel.org>; Thu, 18 Dec 2025 14:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lBNVyYNPFPO9G0NGoQQQad/843wF+95CcxPehpbsADs=; b=jp32xTLIhivefR
	BwzZwhTbx4cGGI6ADYMJgZPY2cIgT+A507fJt4OxP75NxmNSGmKaDaZj2gCEW88t6+HRQWqqQ7sBI
	M2T/numWPd3qNT1RCIJLx4zGvGqsXC3nnnBuJGJExx5W1PxaW2EPnfAb1dZOA6FIxxncF/tVgncmn
	n1mdXIG00aUkeDMDXKR5Wcq0VVfrteN3cOxBIacWUFMsmMz57GhuNshM5sWSovvdWBx8RgcFzC8O7
	WR+2cu5czXicJImlPTZEI5Ut4moCIFCW1wnBb0XsmPUdhAzrZSYZ/qMn+8EnGzK9eW6usQ+e/C3Lo
	lLnZyys4ghYcU/YVnroQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWF7o-00000008cgF-11tI;
	Thu, 18 Dec 2025 14:37:04 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWF7l-00000008cfq-2wT6
	for opensbi@lists.infradead.org;
	Thu, 18 Dec 2025 14:37:02 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-657c68a08a7so351722eaf.1
        for <opensbi@lists.infradead.org>; Thu, 18 Dec 2025 06:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1766068620; x=1766673420; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mo8bnFywkAuqnEodnaKreZxRn7+7FOKk3cGnADdF3GQ=;
        b=iDypy01LzJubnsv3QEugtXWQfGfyupPgWgpUrQp9PlFKAwcQESP6zUgtdiduy8Rsp8
         4mu1PcD1inLbRPE7jBxgRNnB730NVzwH3GiLYPSANC15ONi5zjVqqfJVfX1ytjgbaOAN
         L+shhRjtQgTqeKcFn3J0HcSsEj0iCZY8YIXo8jIbqyAFaNrI2cApIblgyKaxc8iQDFZP
         FILeb7EQOqEathBdD1KuP9N+9omIXzmg2fJGo++Gcqi/P3sTRd2oGAjVdk54lTV5pTTP
         5PohgYZvHsQ9prPoGymcN+9oQe/SSZA29rUVkpD2rq0cvcpF1HRijRQU31JVT4YdTA+C
         M5tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766068620; x=1766673420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mo8bnFywkAuqnEodnaKreZxRn7+7FOKk3cGnADdF3GQ=;
        b=O1vpxDiYVxzQZNZmyiMVyaydQWaAA6mC/eXcJnRFvMDHb1Q4D3vG51JxFDC7pzUCb4
         ATXvJjJiIJtSAqWleJ/UrOexSsNR+8cvIQxOufT+b1MIBtn3ZdT0JS3gFvd3CyQ7mck+
         FUmmGrO8o0IwDQy9oIkh29Ja5y55CTn1zSPDbdviDNm5IK6yBeZpFb6X/g4+KU8vIPxB
         E2x5OQMhkN6DA+E1L6gSteIsTYimJCCc8svbH1ZLB3/7tlHo/PgyPweQftLEQqM0iQ59
         NQcyK4cudbJjuRXGqeacp77IWt2AOJXfA79lmwFy0Pf3saySdxuZl9myBbNN0yverTrW
         /Dmg==
X-Gm-Message-State: AOJu0YwhORxSyekfjA3ogpa3lZO1xklyrIBEOcKL0lPJgYB8zdZKbls8
	xHM46wfJN1RxtwCfAJi0MpkpLjNwKg+U+j5En1j9dNfBT4ud/VwOluqUFJaYbTcPMXRq+COPA38
	Z0M8TZ4i7tMxGUQ4WM3cpr6Xp24NopAoov9ee0okFfw==
X-Gm-Gg: AY/fxX7V9L9RgdGyKL5uLdKY5MMjxbFKRVWNH8uGaBvBC1Fv9Faldlrh7eaWadnJqrO
	7ZytnYmn2aUC93FuKaXpv+CsLoKfZloF1TIfURXaXy7Hv2QEHeRsRufcL+V+YIEZwsPDmXdn0Ok
	yG1VOBuELQk8yEjeg4Ho09oV6bQFag6jMvEsHPywrZyeg5igqrvPli5BLzZn4ih1whfig+yuMBW
	Mnk1fZZMKH1nrLNSYnitlxbA6+txBniMVbGszpCrHx4HTQsB1RRniKA35seCmm7kd3AZymG
X-Google-Smtp-Source: AGHT+IFwWiM45YDml7yNnPyVQmIOm0ExEH07Ecuj14OkN2lSS0DL4/GYpCnr9UUsITNWDghos30hzM8ai0BY+MPWVpU=
X-Received: by 2002:a05:6820:22a9:b0:65b:32b4:83f9 with SMTP id
 006d021491bc7-65b455f7aaamr9098738eaf.20.1766068620399; Thu, 18 Dec 2025
 06:37:00 -0800 (PST)
MIME-Version: 1.0
References: <20251218104243.562667-1-ganboing@gmail.com> <20251218104243.562667-3-ganboing@gmail.com>
In-Reply-To: <20251218104243.562667-3-ganboing@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 18 Dec 2025 20:06:48 +0530
X-Gm-Features: AQt7F2puU5Zvs05vSz5fZeW9vKzUtOBRWfHHbwzS_fde5j3M2PTyRsVPP4XKig8
Message-ID: <CAAhSdy2m6PA304hqA8sgYZBrewo_voRU9yG7uO=pkvAY27vryg@mail.gmail.com>
Subject: Re: [PATCH v6 2/7] lib: sbi_domain: add sbi_domain_get_oldpmp_flags
To: Bo Gan <ganboing@gmail.com>
Cc: opensbi@lists.infradead.org, linmin@eswincomputing.com, 
	pinkesh.vaghela@einfochips.com, gaohan@iscas.ac.cn, samuel@sholland.org, 
	wangxiang@iscas.ac.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_063701_747964_B008B5F9 
X-CRM114-Status: GOOD (  19.42  )
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

T24gVGh1LCBEZWMgMTgsIDIwMjUgYXQgNDoxNOKAr1BNIEJvIEdhbiA8Z2FuYm9pbmdAZ21haWwu
Y29tPiB3cm90ZToKPgo+IEZhY3RvciBvdXQgbG9naWMgaW4gYHNiaV9oYXJ0X29sZHBtcF9jb25m
aWd1cmVgIGludG8gZnVuY3Rpb24KPiBgc2JpX2RvbWFpbl9nZXRfb2xkcG1wX2ZsYWdzYCwgYW5h
bG9nb3VzIHRvIGBzYmlfZG9tYWluX2dldF9zbWVwbXBfZmxhZ3NgLgo+IFBsYXRmb3JtIHNwZWNp
ZmljIGhhcnQtcHJvdGVjdGlvbiBpbXBsZW1lbnRhdGlvbiBjYW4gbm93IGxldmVyYWdlIGl0Lgo+
Cj4gU2lnbmVkLW9mZi1ieTogQm8gR2FuIDxnYW5ib2luZ0BnbWFpbC5jb20+CgpMR1RNLgoKUmV2
aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRzLApBbnVw
Cgo+IC0tLQo+ICBpbmNsdWRlL3NiaS9zYmlfZG9tYWluLmggfCAgNyArKysrKysrCj4gIGxpYi9z
Ymkvc2JpX2RvbWFpbi5jICAgICB8IDIyICsrKysrKysrKysrKysrKysrKysrKysKPiAgbGliL3Ni
aS9zYmlfaGFydF9wbXAuYyAgIHwgMTcgKy0tLS0tLS0tLS0tLS0tLS0KPiAgMyBmaWxlcyBjaGFu
Z2VkLCAzMCBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL3NiaS9zYmlfZG9tYWluLmggYi9pbmNsdWRlL3NiaS9zYmlfZG9tYWluLmgKPiBpbmRl
eCAxMTk2ZDYwOS4uMzM2MGUwOTAgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9zYmkvc2JpX2RvbWFp
bi5oCj4gKysrIGIvaW5jbHVkZS9zYmkvc2JpX2RvbWFpbi5oCj4gQEAgLTI1Myw2ICsyNTMsMTMg
QEAgdm9pZCBzYmlfZG9tYWluX21lbXJlZ2lvbl9pbml0KHVuc2lnbmVkIGxvbmcgYWRkciwKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3MsCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgc2JpX2RvbWFpbl9tZW1yZWdpb24g
KnJlZyk7Cj4KPiArLyoqCj4gKyAqIFJldHVybiB0aGUgb2xkcG1wIHBtcGNmZyBMUldYIGVuY29k
aW5nIGZvciB0aGUgZmxhZ3MgaW4gQHJlZy4KPiArICoKPiArICogQHBhcmFtIHJlZyBwb2ludGVy
IHRvIG1lbW9yeSByZWdpb247IGl0cyBmbGFncyBmaWVsZCBlbmNvZGVzIHBlcm1pc3Npb25zLgo+
ICsgKi8KPiArdW5zaWduZWQgaW50IHNiaV9kb21haW5fZ2V0X29sZHBtcF9mbGFncyhzdHJ1Y3Qg
c2JpX2RvbWFpbl9tZW1yZWdpb24gKnJlZyk7Cj4gKwo+ICAvKioKPiAgICogUmV0dXJuIHRoZSBT
bWVwbXAgcG1wY2ZnIExSV1ggZW5jb2RpbmcgZm9yIHRoZSBmbGFncyBpbiBAcmVnLgo+ICAgKgo+
IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9kb21haW4uYyBiL2xpYi9zYmkvc2JpX2RvbWFpbi5j
Cj4gaW5kZXggOTZkMTBjNzYuLjc0Y2MxZTNmIDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkvc2JpX2Rv
bWFpbi5jCj4gKysrIGIvbGliL3NiaS9zYmlfZG9tYWluLmMKPiBAQCAtMTIxLDYgKzEyMSwyOCBA
QCB2b2lkIHNiaV9kb21haW5fbWVtcmVnaW9uX2luaXQodW5zaWduZWQgbG9uZyBhZGRyLAo+ICAg
ICAgICAgfQo+ICB9Cj4KPiArdW5zaWduZWQgaW50IHNiaV9kb21haW5fZ2V0X29sZHBtcF9mbGFn
cyhzdHJ1Y3Qgc2JpX2RvbWFpbl9tZW1yZWdpb24gKnJlZykKPiArewo+ICsKPiArICAgICAgIHVu
c2lnbmVkIGludCBwbXBfZmxhZ3MgPSAwOwo+ICsKPiArICAgICAgIC8qCj4gKyAgICAgICAgKiBJ
ZiBwZXJtaXNzaW9ucyBhcmUgdG8gYmUgZW5mb3JjZWQgZm9yIGFsbCBtb2RlcyBvbgo+ICsgICAg
ICAgICogdGhpcyByZWdpb24sIHRoZSBsb2NrIGJpdCBzaG91bGQgYmUgc2V0Lgo+ICsgICAgICAg
ICovCj4gKyAgICAgICBpZiAocmVnLT5mbGFncyAmIFNCSV9ET01BSU5fTUVNUkVHSU9OX0VORl9Q
RVJNSVNTSU9OUykKPiArICAgICAgICAgICAgICAgcG1wX2ZsYWdzIHw9IFBNUF9MOwo+ICsKPiAr
ICAgICAgIGlmIChyZWctPmZsYWdzICYgU0JJX0RPTUFJTl9NRU1SRUdJT05fU1VfUkVBREFCTEUp
Cj4gKyAgICAgICAgICAgICAgIHBtcF9mbGFncyB8PSBQTVBfUjsKPiArICAgICAgIGlmIChyZWct
PmZsYWdzICYgU0JJX0RPTUFJTl9NRU1SRUdJT05fU1VfV1JJVEFCTEUpCj4gKyAgICAgICAgICAg
ICAgIHBtcF9mbGFncyB8PSBQTVBfVzsKPiArICAgICAgIGlmIChyZWctPmZsYWdzICYgU0JJX0RP
TUFJTl9NRU1SRUdJT05fU1VfRVhFQ1VUQUJMRSkKPiArICAgICAgICAgICAgICAgcG1wX2ZsYWdz
IHw9IFBNUF9YOwo+ICsKPiArICAgICAgIHJldHVybiBwbXBfZmxhZ3M7Cj4gK30KPiArCj4gIHVu
c2lnbmVkIGludCBzYmlfZG9tYWluX2dldF9zbWVwbXBfZmxhZ3Moc3RydWN0IHNiaV9kb21haW5f
bWVtcmVnaW9uICpyZWcpCj4gIHsKPiAgICAgICAgIHVuc2lnbmVkIGludCBwbXBfZmxhZ3MgPSAw
Owo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9oYXJ0X3BtcC5jIGIvbGliL3NiaS9zYmlfaGFy
dF9wbXAuYwo+IGluZGV4IDdmOTcwY2EzLi5iZTQ1OTEyOSAxMDA2NDQKPiAtLS0gYS9saWIvc2Jp
L3NiaV9oYXJ0X3BtcC5jCj4gKysrIGIvbGliL3NiaS9zYmlfaGFydF9wbXAuYwo+IEBAIC0yNzIs
MjIgKzI3Miw3IEBAIHN0YXRpYyBpbnQgc2JpX2hhcnRfb2xkcG1wX2NvbmZpZ3VyZShzdHJ1Y3Qg
c2JpX3NjcmF0Y2ggKnNjcmF0Y2gpCj4gICAgICAgICAgICAgICAgIGlmICghaXNfdmFsaWRfcG1w
X2lkeChwbXBfY291bnQsIHBtcF9pZHgpKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVy
biBTQklfRUZBSUw7Cj4KPiAtICAgICAgICAgICAgICAgcG1wX2ZsYWdzID0gMDsKPiAtCj4gLSAg
ICAgICAgICAgICAgIC8qCj4gLSAgICAgICAgICAgICAgICAqIElmIHBlcm1pc3Npb25zIGFyZSB0
byBiZSBlbmZvcmNlZCBmb3IgYWxsIG1vZGVzIG9uCj4gLSAgICAgICAgICAgICAgICAqIHRoaXMg
cmVnaW9uLCB0aGUgbG9jayBiaXQgc2hvdWxkIGJlIHNldC4KPiAtICAgICAgICAgICAgICAgICov
Cj4gLSAgICAgICAgICAgICAgIGlmIChyZWctPmZsYWdzICYgU0JJX0RPTUFJTl9NRU1SRUdJT05f
RU5GX1BFUk1JU1NJT05TKQo+IC0gICAgICAgICAgICAgICAgICAgICAgIHBtcF9mbGFncyB8PSBQ
TVBfTDsKPiAtCj4gLSAgICAgICAgICAgICAgIGlmIChyZWctPmZsYWdzICYgU0JJX0RPTUFJTl9N
RU1SRUdJT05fU1VfUkVBREFCTEUpCj4gLSAgICAgICAgICAgICAgICAgICAgICAgcG1wX2ZsYWdz
IHw9IFBNUF9SOwo+IC0gICAgICAgICAgICAgICBpZiAocmVnLT5mbGFncyAmIFNCSV9ET01BSU5f
TUVNUkVHSU9OX1NVX1dSSVRBQkxFKQo+IC0gICAgICAgICAgICAgICAgICAgICAgIHBtcF9mbGFn
cyB8PSBQTVBfVzsKPiAtICAgICAgICAgICAgICAgaWYgKHJlZy0+ZmxhZ3MgJiBTQklfRE9NQUlO
X01FTVJFR0lPTl9TVV9FWEVDVVRBQkxFKQo+IC0gICAgICAgICAgICAgICAgICAgICAgIHBtcF9m
bGFncyB8PSBQTVBfWDsKPiAtCj4gKyAgICAgICAgICAgICAgIHBtcF9mbGFncyA9IHNiaV9kb21h
aW5fZ2V0X29sZHBtcF9mbGFncyhyZWcpOwo+ICAgICAgICAgICAgICAgICBwbXBfYWRkciA9IHJl
Zy0+YmFzZSA+PiBQTVBfU0hJRlQ7Cj4gICAgICAgICAgICAgICAgIGlmIChwbXBfbG9nMmdyYW4g
PD0gcmVnLT5vcmRlciAmJiBwbXBfYWRkciA8IHBtcF9hZGRyX21heCkgewo+ICAgICAgICAgICAg
ICAgICAgICAgICAgIHNiaV9wbGF0Zm9ybV9wbXBfc2V0KHNiaV9wbGF0Zm9ybV9wdHIoc2NyYXRj
aCksCj4gLS0KPiAyLjM0LjEKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5z
YmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL29wZW5zYmkK
