Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E342CD37AC
	for <opensbi@archiver.kernel.org>; Mon, 11 May 2026 13:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DKZazwlvavqtk60WUFMgRvnB4JngX1oZF5rYTI41/+I=; b=X/QVASFiPBvfxX
	opTq77GYhKYOmxn9F5LmEOO2kNDa8A/tRoa6oMxonI+GVEMAb/QTpH2lRAvMOmu82+TzmbDpX5PsB
	IcYI8SKRM5Sa14XYKjpIflBlV946fxTzfKsu83i0GFmQze2S5wZericf2uPSdaIwv6drVE3x0pS88
	1s8JP6kEZpFKHrqfu+KPOGwsAvlrizspDHAfT2ZZ2z/GeqNV+IqeKSM0ehbCGo4B2fYHyqMvu45EB
	UEyPPXMSc3XSnHDXi46o8rI52HHByjgYN+zLaUXDHc7AN8FbL6Arb0JuLrhYNXdtbnlYo+tpMUV1c
	nDAiCDxGbjtq90i7PsHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQzq-0000000DoYD-0f88;
	Mon, 11 May 2026 13:48:34 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQzn-0000000DoXY-3okI
	for opensbi@lists.infradead.org;
	Mon, 11 May 2026 13:48:33 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5a884815606so4276087e87.0
        for <opensbi@lists.infradead.org>; Mon, 11 May 2026 06:48:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778507310; cv=none;
        d=google.com; s=arc-20240605;
        b=MX5tMZxqKoLlMfnRAI9lBTsZrBp1S9VpeK5/tZhD4tt4rAC3glAP8YIWPpSjQCyovQ
         F7iE4fm3cKD3mTXvaxF8Gz0o3XVmHIvwvAhYvxTx6Ac+0hUSJGuWEbQcxcebiakyMbqr
         ceoPEihqpIkHXRWNk2bVcXSwOB2u8Kvnaknoizdc7tDxNerDVXQZFfGYBA09bAhfEOSb
         TyVn12cyrkSf+uR0D7kIZAcCihNT+q6AfvIA2849t5NQEYVD1NEiaD28bysI9y7FKL2J
         PXqtfuz68QGQ3W1fRklKvd7NU4dxLkdSiMn6B3SjX3aHcNAfMWM4Kg6vUnNVK7MQXGDW
         EVFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tzJR7nZyr9p9ZuW/v4w+u7lsY7BHbwD5qefCumAOJyw=;
        fh=DeMsF28etu9wNX6sHYMuW25NELlHbtle/4McEu0nW/k=;
        b=PpS1H/i4rveHWgcNvTqFRSZAP1f7WZGQ2BTMCIBMYFmC7C4wLchCHApXELjU2J8g+y
         P4XZWASiplnveHYQveglr3r5Vsuz7I1c3ZUhxAS4G1PyQwmma5xPpXDMXS5BNcpDtPpl
         4iW3TS6/vp7Cnuf8tTH3OhAtkr/nUBi5gc81bjhPFnmafQPFJccwusViBr/vmjOdiWqv
         rBAC+UD/Pvhnu/FTM0FyaXzGg2dNTEt58YTv62kLjpwT4neHQU81NbXzjq9YtIAO+dCa
         FCoyMkoSq72qwZNQsIJeicZJLOffXEeNbHj0SRp5bXVIvXEOCZvJF+5SBdnrRNThdr/s
         Q3KQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1778507310; x=1779112110; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tzJR7nZyr9p9ZuW/v4w+u7lsY7BHbwD5qefCumAOJyw=;
        b=BMtea44fgq2yC/9bQZM1I4ByzuE8rKg+KNp5S1Lc8kv49BCFmfOjmqozwueqxO3sV3
         0XrLy98xfiX9LBi3KeUjumk0c2SfryiYqfGX4UnqdugKZR05j7gJzJe8L/lsLXSknOU0
         +1W1/UpRLrTRdgMH+mM3fpluiBdWHEla9s8YzuBXGA9b8FJYGIrCGq0pPgCIL1uwdu7b
         Hej/cczVuofoxurUW3mNHJpoGe4hnT91jThxdGBtNK8c5W0xXfy+mt44Kg+vHyJAZjY0
         r5X2HLDzpxQp/NUohGEt8jn4bm2lRMtDdc7r6rwfTrrDcA99G00Uyu1u0N+a2UcTx1Ih
         KTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778507310; x=1779112110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tzJR7nZyr9p9ZuW/v4w+u7lsY7BHbwD5qefCumAOJyw=;
        b=b/rHetP4y/Z/eFYbF5anbAd1mO/YGggwZerTCF+aU3pqNrLtxJ9cYu7rGJRNnzRW9t
         Q9D4YLoTX4fXtQZiDjzn7O9XQiKizX+ZOrOyJ9TMSn+vv3lSDCuPg7N7o4YLK3Zgr2Ff
         QcP6FeSA7oRWPyevJTWWFYlj9GYL7QmBWpwnAh+7frLTR7TKtTrtHu7NE0KDViMS+7Ed
         yTql+BGfyefq7pnsMIIFLi9btW0X/glfxw5a+woFOjhixoYWal1mADmJiaUnIPZVuMXj
         Tgkiq/MHigVbHdR8IruyRF+bkqrPbtTaxcmrqkzU/WQowuIunPV1DPUFzWOsWAzR096A
         ZPLg==
X-Gm-Message-State: AOJu0YwHAT25/Y97LxOvl6ZLOJ9tVzCi0zX8na40RSW5e9npDZ6ADGn9
	v0ytYWdAiXxQdy8TKRvVnMKhdP46ndweissA8I4zAjt2OQZaEWBKLwB/qBaoLZd7nIpkb9LeUVH
	Vc5Ak0gt6/XDmx54TC1wIkGf992dk3xgkvRQOYKoCPA==
X-Gm-Gg: Acq92OGVrftcKIp72W2KGrHAOPjOVxMFw3gaLxFH54qEjIJMgfEJ5D/IfaB7OUr+kpf
	64ljjBs+Y/TV9CZpzQr2wx01ZkEErNGeeAcKkwR+k8MxXQtja9ZKLTwhtYXo5ymRAdkmOpISZOt
	0YPjtjziQTo9fXtSYqkNWt0+U9rSKV7j9nRtGN/MNIWLsP4HQQ/Wfpo3m2xg9dnYWhXarBUmQey
	ffmfqj7vD30vnbg+I21xaQwMSbRXFCMKx+FtRr9EPOL5Nuu8wpZg7nBnHshYW9A5iVEBTY/9sDv
	FYV/eEfnU3RPxUkb0C7T06vb6amQlrZbZVmJ5fFy9A==
X-Received: by 2002:a05:6512:1250:b0:5a8:73c3:f270 with SMTP id
 2adb3069b0e04-5a887ad99a7mr7597981e87.8.1778507309055; Mon, 11 May 2026
 06:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260401220845.190680-1-andrew.jones@oss.qualcomm.com>
In-Reply-To: <20260401220845.190680-1-andrew.jones@oss.qualcomm.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 11 May 2026 19:18:17 +0530
X-Gm-Features: AVHnY4Jell-NtG7wDoduVz5n6jb574dwRZDmobiGzOXj_LqNlhJZ_te91tf8q9k
Message-ID: <CAK9=C2VUqzmRLUVaeFTvqmJmc+L5bJXbPSNPUZK2=pb8Hy1jPA@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: Fix hw a/d updating defaults
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, Anup Patel <anup.patel@oss.qualcomm.com>, 
	Atish Patra <atish.patra@linux.dev>, 
	Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, Sunil V L <sunilvl@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_064831_988131_9FF34815 
X-CRM114-Status: GOOD (  22.70  )
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

T24gVGh1LCBBcHIgMiwgMjAyNiBhdCAzOjQx4oCvQU0gQW5kcmV3IEpvbmVzCjxhbmRyZXcuam9u
ZXNAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBUaGUgU3ZhZGUgZHQtYmluZGluZyBkZXNj
cmlwdGlvbiBzdGF0ZXMgdGhhdCBTdmFkdSBzaG91bGQgb25seQo+IGJlIGVuYWJsZWQgYXQgYm9v
dCB0aW1lIHdoZW4gb25seSBTdmFkdSBpcyBwcmVzZW50IGluIHRoZSBEVC4KPiBFbnN1cmUgdGhh
dCdzIHRoZSBjYXNlLiBBbHNvLCB3aGVuIG9ubHkgU3ZhZHUgaXMgc3VwcG9ydGVkLAo+IGRpc2Fi
bGUgRldGVC5QVEVfQURfSFdfVVBEQVRJTkcsIGFzIHdlIG5lZWQgYm90aCB0byBzdXBwb3J0Cj4g
dG9nZ2xpbmcuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgSm9uZXMgPGFuZHJldy5qb25lc0Bv
c3MucXVhbGNvbW0uY29tPgoKQXBwbGllZCB0aGlzIHBhdGNoIHRvIHRoZSByaXNjdi9vcGVuc2Jp
IHJlcG8uCgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIGxpYi9zYmkvc2JpX2Z3ZnQuYyB8IDEwICsr
KysrKysrKy0KPiAgbGliL3NiaS9zYmlfaGFydC5jIHwgMTggKysrKysrKysrKy0tLS0tLS0tCj4g
IDIgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS9saWIvc2JpL3NiaV9md2Z0LmMgYi9saWIvc2JpL3NiaV9md2Z0LmMKPiBpbmRl
eCAzNzMxNDBiNzQ2YmQuLjU3NGI4NzVlNDA4ZCAxMDA2NDQKPiAtLS0gYS9saWIvc2JpL3NiaV9m
d2Z0LmMKPiArKysgYi9saWIvc2JpL3NiaV9md2Z0LmMKPiBAQCAtMTYwLDggKzE2MCwxNiBAQCBz
dGF0aWMgaW50IGZ3ZnRfZ2V0X2RvdWJsZV90cmFwKHN0cnVjdCBmd2Z0X2NvbmZpZyAqY29uZiwg
dW5zaWduZWQgbG9uZyAqdmFsdWUpCj4KPiAgc3RhdGljIGludCBmd2Z0X2FkdWVfc3VwcG9ydGVk
KHN0cnVjdCBmd2Z0X2NvbmZpZyAqY29uZikKPiAgewo+ICsgICAgICAgLyoKPiArICAgICAgICAq
IEZXRlQuUFRFX0FEX0hXX1VQREFUSU5HIGlzIG9ubHkgc3VwcG9ydGVkIHdoZW4gYm90aCBTdmFk
ZSBhbmQgU3ZhZHUKPiArICAgICAgICAqIGFyZSBzdXBwb3J0ZWQuIFdlIG5lZWQgYm90aCBpbiBv
cmRlciB0byBzdXBwb3J0IHRvZ2dsaW5nIGFuZCB0bwo+ICsgICAgICAgICogZW5zdXJlIHRoZSBy
ZXNldCB2YWx1ZSBvZiB6ZXJvIGlzIHZhbGlkIChpdCB3b3VsZG4ndCBiZSB3aGVuIG9ubHkKPiAr
ICAgICAgICAqIFN2YWR1IGlzIHN1cHBvcnRlZCkuCj4gKyAgICAgICAgKi8KPiAgICAgICAgIGlm
ICghc2JpX2hhcnRfaGFzX2V4dGVuc2lvbihzYmlfc2NyYXRjaF90aGlzaGFydF9wdHIoKSwKPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTQklfSEFSVF9FWFRfU1ZBRFUpKQo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNCSV9IQVJUX0VYVF9TVkFEVSkg
fHwKPiArICAgICAgICAgICAhc2JpX2hhcnRfaGFzX2V4dGVuc2lvbihzYmlfc2NyYXRjaF90aGlz
aGFydF9wdHIoKSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTQklfSEFS
VF9FWFRfU1ZBREUpKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VOT1RTVVBQOwo+Cj4g
ICAgICAgICByZXR1cm4gU0JJX09LOwo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9oYXJ0LmMg
Yi9saWIvc2JpL3NiaV9oYXJ0LmMKPiBpbmRleCA5OWUxMzk5MGFhNjAuLjBkZjExZDBkMTAyOSAx
MDA2NDQKPiAtLS0gYS9saWIvc2JpL3NiaV9oYXJ0LmMKPiArKysgYi9saWIvc2JpL3NiaV9oYXJ0
LmMKPiBAQCAtMTM3LDYgKzEzNyw5IEBAIHN0YXRpYyB2b2lkIG1zdGF0dXNfaW5pdChzdHJ1Y3Qg
c2JpX3NjcmF0Y2ggKnNjcmF0Y2gpCj4gICAgICAgICBpZiAoc2JpX2hhcnRfcHJpdl92ZXJzaW9u
KHNjcmF0Y2gpID49IFNCSV9IQVJUX1BSSVZfVkVSXzFfMTIpIHsKPiAgICAgICAgICAgICAgICAg
bWVudmNmZ192YWwgPSBjc3JfcmVhZDY0KENTUl9NRU5WQ0ZHKTsKPgo+ICsgICAgICAgICAgICAg
ICAvKiBEaXNhYmxlIEhXIEEvRCB1cGRhdGluZyBieSBkZWZhdWx0ICovCj4gKyAgICAgICAgICAg
ICAgIG1lbnZjZmdfdmFsICY9IH5FTlZDRkdfQURVRTsKPiArCj4gICAgICAgICAgICAgICAgIC8q
IERpc2FibGUgZG91YmxlIHRyYXAgYnkgZGVmYXVsdCAqLwo+ICAgICAgICAgICAgICAgICBtZW52
Y2ZnX3ZhbCAmPSB+RU5WQ0ZHX0RURTsKPgo+IEBAIC0xNTgsMTggKzE2MSwxNyBAQCBzdGF0aWMg
dm9pZCBtc3RhdHVzX2luaXQoc3RydWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoKQo+ICAjZW5kaWYK
PiAgICAgICAgICAgICAgICAgX19zZXRfbWVudmNmZ19leHQoU0JJX0hBUlRfRVhUX1NTVEMsIEVO
VkNGR19TVENFKQo+ICAgICAgICAgICAgICAgICBfX3NldF9tZW52Y2ZnX2V4dChTQklfSEFSVF9F
WFRfU01DREVMRUcsIEVOVkNGR19DREUpOwo+IC0gICAgICAgICAgICAgICBfX3NldF9tZW52Y2Zn
X2V4dChTQklfSEFSVF9FWFRfU1ZBRFUsIEVOVkNGR19BRFVFKTsKPiAtCj4gLSN1bmRlZiBfX3Nl
dF9tZW52Y2ZnX2V4dAo+Cj4gICAgICAgICAgICAgICAgIC8qCj4gLSAgICAgICAgICAgICAgICAq
IFdoZW4gYm90aCBTdmFkZSBhbmQgU3ZhZHUgYXJlIHByZXNlbnQgaW4gRFQsIHRoZSBkZWZhdWx0
IHNjaGVtZSBmb3IgbWFuYWdpbmcKPiAtICAgICAgICAgICAgICAgICogdGhlIFBURSBBL0QgYml0
cyBzaG91bGQgdXNlIFN2YWRlLiBDaGVjayBTdmFkdSBiZWZvcmUgU3ZhZGUgZXh0ZW5zaW9uIHRv
IGVuc3VyZQo+IC0gICAgICAgICAgICAgICAgKiB0aGF0IHRoZSBBRFVFIGJpdCBpcyBjbGVhcmVk
IHdoZW4gdGhlIFN2YWRlIHN1cHBvcnQgYXJlIHNwZWNpZmllZC4KPiArICAgICAgICAgICAgICAg
ICogQXNzdW1lIG9ubHkgU3ZhZHUgaXMgc3VwcG9ydGVkIHdoZW4gaXQgaXMgdGhlIG9ubHkgZXh0
ZW5zaW9uCj4gKyAgICAgICAgICAgICAgICAqIHByZXNlbnQgaW4gdGhlIElTQSBzdHJpbmcuIFN2
YWRlIGlzIGFzc3VtZWQgd2hlbiBuZWl0aGVyIGFyZQo+ICsgICAgICAgICAgICAgICAgKiBwcmVz
ZW50LiBXaGVuIGJvdGggYXJlIHByZXNlbnQgd2UgbXVzdCBkZWZhdWx0IHRvIFN2YWRlIChzZWUK
PiArICAgICAgICAgICAgICAgICogdGhlIHplcm8gcmVzZXQgdmFsdWUgb2YgRldGVC5QVEVfQURf
SFdfVVBEQVRJTkcpLgo+ICAgICAgICAgICAgICAgICAgKi8KPiArICAgICAgICAgICAgICAgaWYg
KCFzYmlfaGFydF9oYXNfZXh0ZW5zaW9uKHNjcmF0Y2gsIFNCSV9IQVJUX0VYVF9TVkFERSkpCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgX19zZXRfbWVudmNmZ19leHQoU0JJX0hBUlRfRVhUX1NW
QURVLCBFTlZDRkdfQURVRSk7Cj4KPiAtICAgICAgICAgICAgICAgaWYgKHNiaV9oYXJ0X2hhc19l
eHRlbnNpb24oc2NyYXRjaCwgU0JJX0hBUlRfRVhUX1NWQURFKSkKPiAtICAgICAgICAgICAgICAg
ICAgICAgICBtZW52Y2ZnX3ZhbCAmPSB+RU5WQ0ZHX0FEVUU7Cj4gKyN1bmRlZiBfX3NldF9tZW52
Y2ZnX2V4dAo+Cj4gICAgICAgICAgICAgICAgIGNzcl93cml0ZTY0KENTUl9NRU5WQ0ZHLCBtZW52
Y2ZnX3ZhbCk7Cj4KPiAtLQo+IDIuNDMuMAo+Cj4KPiAtLQo+IG9wZW5zYmkgbWFpbGluZyBsaXN0
Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3Bl
bnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vb3BlbnNiaQo=
