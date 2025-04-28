Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE86C369DC
	for <opensbi@archiver.kernel.org>; Mon, 28 Apr 2025 13:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ar1RBJNEEx8ITDce1xqz3qsGNgot/m06ttifsaSYFz0=; b=f/CPxjISMFznGe
	3kl7I34QUc+AHMufAbNWAjkXbYsOxrFVDUFkHDZj81nbp1+GA8y5dWkMqAbaCjUySDCMS6wG2LGUy
	FpJyR17ZEyA72/d1tHDE1e6n1mVoa5Za0et8mwrm+ASveHs2I17TpaLfjYAkiqtbvXCHeO8BdQmN2
	k17tPE16LpT5mwPcuzE9mgiDZC/L7it2lLOuiNXhB/fw0ruoGy9Fkwy4Zvu2LTPE+AS5SCVWANBbx
	ZYqyvKsuqKabDdapKSMFPNCHkkk7dhdetyBLL6s7KzZOTaoqz7xCUjMaLS0hZ6qqOzbA8GVzgSvnA
	R5hNfD01GYShxGvaVCeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9OCE-00000006MfQ-1O58;
	Mon, 28 Apr 2025 13:06:54 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Nbu-00000006Bhc-016o
	for opensbi@lists.infradead.org;
	Mon, 28 Apr 2025 12:29:23 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-85db3475637so165292439f.1
        for <opensbi@lists.infradead.org>; Mon, 28 Apr 2025 05:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1745843361; x=1746448161; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kjzk2ED94jHdMxV4xhuKuO4dwJUJSAaLnx1YSVFtWiM=;
        b=Rx+4y/YiHA0oGBPyRQHtTy/zHoIcmdafp2i1tgKvlxL0GAOmzGS+qOV2K+9PiuwHoF
         h7vl6wFMXpNPHmI4xc/01ZVBxz2p5IFQ9nReZ9AKV2jouTWNlNctIERAyerj15CpwEIJ
         jVEEud5YRRNl9J7SavTPu/TxPX27RLXfuzJqMLvlqhQCw7zzLWzciihQlZBCWcuLJjtG
         HV07NAejrkY5dzLZnmkRMz7xVojPeF5DjYGGkYZ8XAJY06jdHVQZPR96qj4YBOq3KHSg
         Vjdur51oIneYTrtaHpiAAkf8/2EGTD0BEF/oyPr6mFff0ZUuS6zzxWsiniRF0DPAPFFc
         I4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745843361; x=1746448161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kjzk2ED94jHdMxV4xhuKuO4dwJUJSAaLnx1YSVFtWiM=;
        b=HrwCl7eoIIqJeETCxcTuLuo0D7bipci1SyvDLSQb7cKO+Lk7XsPt6K6XxZ039x4F7o
         J+Vam7jAHGNR39CWq7hfkcNzmB4B3BCjbzt4Ej7ejwdGB5J7rUfy1BaTS9CFQNHWqqSw
         7VtIgYNkBmE003XsFuIbB4z+EnpyOghpabRIDGiChDq49u290ZMES080zWV4pRGe0EhT
         KQVX4zFjcCzpeUjMsR+0z6pkuITCSC/QUiHq/M+EGDM3/SULpMIeq0x1KN2EiU8EWYL5
         wcrSJyZ/hIdysSMzvi6S5db/r90V4Zo9OVcDcUwE1KaT0NlSt1aHGGHFvRrwlrdglUm7
         Nylw==
X-Gm-Message-State: AOJu0YwW4Mv0+rOPAmGJhD54jaaeSuhh/d9x6E8Bm8lZ+lsGW++7Z5OO
	0H1vtY7wWvNYlhk9ATARAhtq7tq8AOOo5cwvexeVF0lXtIcPPUJO5CuJqOlTNtrNsjAUqAP2Y9+
	ujymTwX3/j1CRYCTa6nooSZN/t69zXr7qw7X1JA==
X-Gm-Gg: ASbGnctC9rcd0aAMDM1uQ8guvnKuLFaP7BY905vdIJxa5twe9f78WDod8KYJwfU/w1B
	ag2PHv6m0pog1GjuAHtrs52DL+NjmAayS2MKpQTdSrOzQy9KGsCvsI0k8r2roVIEqEKI+0wU9sK
	7hPDkhHRMrUzFndBa2hakxFyI=
X-Google-Smtp-Source: AGHT+IHaX08cIAUDIcPYPThtLYshlS6MagbK9kAmLriR6tzYgUMQGXkgSTGiuFJ+FSUbTHFMTMaJFHTlKEzYSuc+MUU=
X-Received: by 2002:a05:6e02:1745:b0:3d9:2992:6708 with SMTP id
 e9e14a558f8ab-3d93b80a168mr117348315ab.2.1745843360971; Mon, 28 Apr 2025
 05:29:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250415131908.2699782-2-rkrcmar@ventanamicro.com> <20250415131908.2699782-4-rkrcmar@ventanamicro.com>
In-Reply-To: <20250415131908.2699782-4-rkrcmar@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Apr 2025 17:59:10 +0530
X-Gm-Features: ATxdqUE0gYAtDCO36G32TB3CfVsTHSyaff9W2nmEx5S8X5QMUuvAHNwaVJq-UV0
Message-ID: <CAAhSdy0fFQnsrT85YdmeWbyCOY0mvw4ACBKVh2CP=5_OLvmkPg@mail.gmail.com>
Subject: Re: [PATCH 2/8] lib: sbi: use 64 bit csr macros
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_052922_048515_CB4E8DE1 
X-CRM114-Status: GOOD (  15.65  )
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
ckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFN3aXRjaCB0aGUgbW9zdCBvYnZpb3VzIGNh
c2VzIHRvIG5ldyBtYWNyb3MuCj4KPiBTaWduZWQtb2ZmLWJ5OiBSYWRpbSBLcsSNbcOhxZkgPHJr
cmNtYXJAdmVudGFuYW1pY3JvLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8
YW51cEBicmFpbmZhdWx0Lm9yZz4KClJlZ2FyZHMsCkFudXAKCj4gLS0tCj4gIGxpYi9zYmkvc2Jp
X2hhcnQuYyAgfCAyMCArKysrLS0tLS0tLS0tLS0tLS0tLQo+ICBsaWIvc2JpL3NiaV90aW1lci5j
IHwgIDcgKy0tLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMjIgZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfaGFydC5jIGIvbGliL3NiaS9z
YmlfaGFydC5jCj4gaW5kZXggYzM0MzgwNWM1N2NiLi4yZDllZTYwZmQzNmMgMTAwNjQ0Cj4gLS0t
IGEvbGliL3NiaS9zYmlfaGFydC5jCj4gKysrIGIvbGliL3NiaS9zYmlfaGFydC5jCj4gQEAgLTg2
LDEwICs4Niw3IEBAIHN0YXRpYyB2b2lkIG1zdGF0dXNfaW5pdChzdHJ1Y3Qgc2JpX3NjcmF0Y2gg
KnNjcmF0Y2gpCj4gICAgICAgICB9Cj4KPiAgICAgICAgIGlmIChzYmlfaGFydF9oYXNfZXh0ZW5z
aW9uKHNjcmF0Y2gsIFNCSV9IQVJUX0VYVF9TTVNUQVRFRU4pKSB7Cj4gLSAgICAgICAgICAgICAg
IG1zdGF0ZWVuX3ZhbCA9IGNzcl9yZWFkKENTUl9NU1RBVEVFTjApOwo+IC0jaWYgX19yaXNjdl94
bGVuID09IDMyCj4gLSAgICAgICAgICAgICAgIG1zdGF0ZWVuX3ZhbCB8PSAoKHVpbnQ2NF90KWNz
cl9yZWFkKENTUl9NU1RBVEVFTjBIKSkgPDwgMzI7Cj4gLSNlbmRpZgo+ICsgICAgICAgICAgICAg
ICBtc3RhdGVlbl92YWwgPSBjc3JfcmVhZDY0KENTUl9NU1RBVEVFTjApOwo+ICAgICAgICAgICAg
ICAgICBtc3RhdGVlbl92YWwgfD0gU01TVEFURUVOX1NUQVRFTjsKPiAgICAgICAgICAgICAgICAg
bXN0YXRlZW5fdmFsIHw9IFNNU1RBVEVFTjBfQ09OVEVYVDsKPiAgICAgICAgICAgICAgICAgbXN0
YXRlZW5fdmFsIHw9IFNNU1RBVEVFTjBfSFNFTlZDRkc7Cj4gQEAgLTExMCwxNyArMTA3LDExIEBA
IHN0YXRpYyB2b2lkIG1zdGF0dXNfaW5pdChzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gpCj4g
ICAgICAgICAgICAgICAgIGVsc2UKPiAgICAgICAgICAgICAgICAgICAgICAgICBtc3RhdGVlbl92
YWwgJj0gflNNU1RBVEVFTjBfQ1RSOwo+Cj4gLSAgICAgICAgICAgICAgIGNzcl93cml0ZShDU1Jf
TVNUQVRFRU4wLCBtc3RhdGVlbl92YWwpOwo+IC0jaWYgX19yaXNjdl94bGVuID09IDMyCj4gLSAg
ICAgICAgICAgICAgIGNzcl93cml0ZShDU1JfTVNUQVRFRU4wSCwgbXN0YXRlZW5fdmFsID4+IDMy
KTsKPiAtI2VuZGlmCj4gKyAgICAgICAgICAgICAgIGNzcl93cml0ZTY0KENTUl9NU1RBVEVFTjAs
IG1zdGF0ZWVuX3ZhbCk7Cj4gICAgICAgICB9Cj4KPiAgICAgICAgIGlmIChzYmlfaGFydF9wcml2
X3ZlcnNpb24oc2NyYXRjaCkgPj0gU0JJX0hBUlRfUFJJVl9WRVJfMV8xMikgewo+IC0gICAgICAg
ICAgICAgICBtZW52Y2ZnX3ZhbCA9IGNzcl9yZWFkKENTUl9NRU5WQ0ZHKTsKPiAtI2lmIF9fcmlz
Y3ZfeGxlbiA9PSAzMgo+IC0gICAgICAgICAgICAgICBtZW52Y2ZnX3ZhbCB8PSAoKHVpbnQ2NF90
KWNzcl9yZWFkKENTUl9NRU5WQ0ZHSCkpIDw8IDMyOwo+IC0jZW5kaWYKPiArICAgICAgICAgICAg
ICAgbWVudmNmZ192YWwgPSBjc3JfcmVhZDY0KENTUl9NRU5WQ0ZHKTsKPgo+ICAgICAgICAgICAg
ICAgICAvKiBEaXNhYmxlIGRvdWJsZSB0cmFwIGJ5IGRlZmF1bHQgKi8KPiAgICAgICAgICAgICAg
ICAgbWVudmNmZ192YWwgJj0gfkVOVkNGR19EVEU7Cj4gQEAgLTE1NiwxMCArMTQ3LDcgQEAgc3Rh
dGljIHZvaWQgbXN0YXR1c19pbml0KHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCkKPiAgICAg
ICAgICAgICAgICAgaWYgKHNiaV9oYXJ0X2hhc19leHRlbnNpb24oc2NyYXRjaCwgU0JJX0hBUlRf
RVhUX1NWQURFKSkKPiAgICAgICAgICAgICAgICAgICAgICAgICBtZW52Y2ZnX3ZhbCAmPSB+RU5W
Q0ZHX0FEVUU7Cj4KPiAtICAgICAgICAgICAgICAgY3NyX3dyaXRlKENTUl9NRU5WQ0ZHLCBtZW52
Y2ZnX3ZhbCk7Cj4gLSNpZiBfX3Jpc2N2X3hsZW4gPT0gMzIKPiAtICAgICAgICAgICAgICAgY3Ny
X3dyaXRlKENTUl9NRU5WQ0ZHSCwgbWVudmNmZ192YWwgPj4gMzIpOwo+IC0jZW5kaWYKPiArICAg
ICAgICAgICAgICAgY3NyX3dyaXRlNjQoQ1NSX01FTlZDRkcsIG1lbnZjZmdfdmFsKTsKPgo+ICAg
ICAgICAgICAgICAgICAvKiBFbmFibGUgUy1tb2RlIGFjY2VzcyB0byBzZWVkIENTUiAqLwo+ICAg
ICAgICAgICAgICAgICBpZiAoc2JpX2hhcnRfaGFzX2V4dGVuc2lvbihzY3JhdGNoLCBTQklfSEFS
VF9FWFRfWktSKSkgewo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV90aW1lci5jIGIvbGliL3Ni
aS9zYmlfdGltZXIuYwo+IGluZGV4IDg2ZTBkYjVhYjM5OS4uOTk4YTlhNjdjMmYwIDEwMDY0NAo+
IC0tLSBhL2xpYi9zYmkvc2JpX3RpbWVyLmMKPiArKysgYi9saWIvc2JpL3NiaV90aW1lci5jCj4g
QEAgLTEzOSwxMiArMTM5LDcgQEAgdm9pZCBzYmlfdGltZXJfZXZlbnRfc3RhcnQodTY0IG5leHRf
ZXZlbnQpCj4gICAgICAgICAgKiB0aGUgb2xkZXIgc29mdHdhcmUgdG8gbGV2ZXJhZ2Ugc3N0YyBl
eHRlbnNpb24gb24gbmV3ZXIgaGFyZHdhcmUuCj4gICAgICAgICAgKi8KPiAgICAgICAgIGlmIChz
YmlfaGFydF9oYXNfZXh0ZW5zaW9uKHNiaV9zY3JhdGNoX3RoaXNoYXJ0X3B0cigpLCBTQklfSEFS
VF9FWFRfU1NUQykpIHsKPiAtI2lmIF9fcmlzY3ZfeGxlbiA9PSAzMgo+IC0gICAgICAgICAgICAg
ICBjc3Jfd3JpdGUoQ1NSX1NUSU1FQ01QLCBuZXh0X2V2ZW50ICYgMHhGRkZGRkZGRik7Cj4gLSAg
ICAgICAgICAgICAgIGNzcl93cml0ZShDU1JfU1RJTUVDTVBILCBuZXh0X2V2ZW50ID4+IDMyKTsK
PiAtI2Vsc2UKPiAtICAgICAgICAgICAgICAgY3NyX3dyaXRlKENTUl9TVElNRUNNUCwgbmV4dF9l
dmVudCk7Cj4gLSNlbmRpZgo+ICsgICAgICAgICAgICAgICBjc3Jfd3JpdGU2NChDU1JfU1RJTUVD
TVAsIG5leHRfZXZlbnQpOwo+ICAgICAgICAgfSBlbHNlIGlmICh0aW1lcl9kZXYgJiYgdGltZXJf
ZGV2LT50aW1lcl9ldmVudF9zdGFydCkgewo+ICAgICAgICAgICAgICAgICB0aW1lcl9kZXYtPnRp
bWVyX2V2ZW50X3N0YXJ0KG5leHRfZXZlbnQpOwo+ICAgICAgICAgICAgICAgICBjc3JfY2xlYXIo
Q1NSX01JUCwgTUlQX1NUSVApOwo+IC0tCj4gMi40OC4xCj4KPgo+IC0tCj4gb3BlbnNiaSBtYWls
aW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0tIApvcGVuc2JpIG1haWxpbmcg
bGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
