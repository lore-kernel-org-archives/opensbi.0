Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A590CC71136
	for <opensbi@archiver.kernel.org>; Mon, 16 Jun 2025 04:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UawD24DNODpvoRCBuun0132PBj8PY8C1y3aO21DrsuE=; b=DdABlNLBZ0f1Uz
	6kmGojF2D77ZvnXVH7Mbxhu5prcIYs+9hO0VBsDsEJZSgyG/5jyYEnSKCbNOT1NW972iuyg6DTAOQ
	V+DqSSu+9Mp9Qz6EBUaeZLAfMHVpP40BoeOBFb+aQoce1PHqh6z1nL/95go6OTxHiYp4k0v7n8V7R
	tiuuMzo6akf94rB47v+sC6OZDH9RWGpsVPmS6Xx5D2n256HBSi36m/s+tU+Iyv+7dCOE7HpyE0VTZ
	Oi3k/UwyPQqajwpqvVlCQ8XExQP95UPIBz0a2KJY7KkgqzMsOdlPtfrH/aqjicDpEcP5f9TOEUSL6
	YXFZ9Am5vU9wpvPLBOYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR1Ir-00000003Kgx-47qo;
	Mon, 16 Jun 2025 04:18:38 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR1Iq-00000003KgZ-0NDC
	for opensbi@lists.infradead.org;
	Mon, 16 Jun 2025 04:18:37 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-86efcef9194so134765839f.0
        for <opensbi@lists.infradead.org>; Sun, 15 Jun 2025 21:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1750047515; x=1750652315; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e8HC0x6E5o+HplaZ6/Yf70Dj0ucYyEAwyTOLhsojtqw=;
        b=UaRTBbAp3CkXIQBTXac9m+jVLa4BRDh0FXqsXd7O5tx2LxY7L/HEJy+EejMttJ5Qeq
         KI3EQrgDRsLwhyK8LNLaARb+OYSh9iYXrj8xtOY6h5sPXBv/2nt2e1fdAB2umLh0+uSh
         W90aaOtuzwv5ptV0xU4/CWJB8KrEJe7Z45pwxpbw0nspsNHoQhz0jxdleNg1gH9eL+Zs
         chs34by4W6NeKf4eYpLNR+1NgE0aiFa8be8Fu8jDmHZro7dbUwUDFx491Uh+WYqcdeAg
         MUB3mmkkn6AZv+pgFRnKPP7NtE7aLtlyEbh84GazScBM5tXGWDfPP6kCphqqkCR8dZcB
         SSbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750047515; x=1750652315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e8HC0x6E5o+HplaZ6/Yf70Dj0ucYyEAwyTOLhsojtqw=;
        b=PcBb8R+epe658WmYLjMSLu8cc1E0N82JtGbDqoljoIdPFLXZjzTq8maI04JDrrqk+y
         SOK3JfO30plQDhg2Ae4kBBOM18JqKdEouh20SmuJzZOpXExnE2gb8bW1g6Fl6Xk6WqsE
         Ygskw+mY2TLVR4idf901b9WphLhLw/FTMKxy/6/51FxlyVMDPRX9fF2nlHzZbhUH7WQh
         9pDzei/QY/AKNJINvLeS+JivyKOnMKtRNAWsO88DjjOUQ68adjBPLKLdkshur+JMNW8y
         Qc6AIWLwYS7+S7yiIkJA8yNNRG339R6pxgH2L7JIeEMvpaIe6T2uYpR38A5Ucu+LrCbf
         z2Xw==
X-Forwarded-Encrypted: i=1; AJvYcCXbINUBw/sOYtpiVp5e8cH+f0l/EL5hJM/cUjGAzvOqyo44jGsbwG7H3YSd5+zsIRwuySd4yS2G@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/C9OvM+j2BqBeiQMLYUc6vFKRX7805cFWygA+P8lJgpMiHz5i
	562l+ieNxa2piNYHRGPdn6O2SZuM/3BrIgnqRFJ8DTmgj+c3OCD75HW0KeSG3iNUqO30wvk/wxk
	UsudM/tYPOwUVWAQWIzn5PXDkKk535DGFN+VbUTDV9A==
X-Gm-Gg: ASbGncsomRrUUcdal7vXM8y3IeYakRMMswqJMr6jis7s+CM8LqhCBDdCU2frsY0Txk6
	PrlIdtFf1Aoj5k+YLmkVeZ2eBWM08oHikkCOPsGi3VIk01xWDUsQzSjmWM1BzCpja1B5bNbLIyw
	dAqXz9Pd077fj119uMLbeoPbehiwx7Pz5T+9p9RmPATD9LcQ==
X-Google-Smtp-Source: AGHT+IHqe/UE06clhbf1yyxsb5sob0/RWGJGIB7SyBO6WbNrTt7rW31UHTdBlK0/768smT45/uc8xzGXfO5RrMZlXeg=
X-Received: by 2002:a05:6e02:338c:b0:3dd:cacd:8fe2 with SMTP id
 e9e14a558f8ab-3de07cd8000mr97850895ab.18.1750047515050; Sun, 15 Jun 2025
 21:18:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250527124821.2113467-1-apatel@ventanamicro.com>
In-Reply-To: <20250527124821.2113467-1-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 16 Jun 2025 09:48:24 +0530
X-Gm-Features: AX0GCFtoPG7M4wdN9f9-J1XHnpPfPgw_MP8CtZNOn8xZ1bdzMqNLYlNENUrI2FA
Message-ID: <CAAhSdy2aQqJCH5nqv98sr7TMzJerKv8gVOddiRs3wW=2ELtuCQ@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: Revert entry_count before doing hsm stop in hsm
 wait loop
To: Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atishp@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Nick Hu <nick.hu@sifive.com>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_211836_135201_A6E0DC76 
X-CRM114-Status: GOOD (  24.71  )
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

T24gVHVlLCBNYXkgMjcsIDIwMjUgYXQgNjoxOOKAr1BNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFVzaW5nIGhzbSBzdG9wIGluIGhzbSB3YWl0IGxvb3Ag
Y2F1c2VzIHNlY29uZGFyeSBoYXJ0cyB0byBiZSBzdHVjawo+IGZvcmV2ZXIgaW4gT3BlblNCSSBv
biBSSVNDLVYgcGxhdGZvcm1zIHdoZXJlIEhTTSBoYXJ0IGhvdHBsdWcgaXMKPiBhdmFpbGFibGUg
YW5kIGFsbCBoYXJ0cyBjb21lLXVwIGF0IHRoZSBzYW1lIHRpbWUgZHVyaW5nIHN5c3RlbQo+IHBv
d2VyLW9uLgo+Cj4gRm9yIGV4YW1wbGUsIGxldHMgc2F5IHdlIGhhdmUgdHdvIGhhcnRzIEEgYW5k
IEIgb24gYSBSSVNDLVYgcGxhdGZvcm0KPiB3aXRoIEhTTSBoYXJ0IGhvdHBsdWcgd2hpY2ggY29t
ZS11cCBhdCB0aGUgc2FtZSB0aW1lIGR1cmluZyBzeXN0ZW0KPiBwb3dlci1vbi4gVGhlIGhhcnQg
QSBlbnRlcnMgT3BlblNCSSBiZWZvcmUgaGFydCBCIGhlbmNlIGl0IGJlY29tZXMKPiB0aGUgcHJp
bWFyeSAob3IgY29sZC1ib290KSBoYXJ0IHdoZXJlYXMgaGFydCBCIGJlY29tZXMgdGhlIHNlY29u
ZGFyeQo+IChvciB3YXJtLWJvb3QpIGhhcnQuIFRoZSBoYXJ0IEEgZm9sbG93cyB0aGUgT3BlblNC
SSBjb2xkLWJvb3QgcGF0aAo+IGFuZCByZWdpc3RlcnMgaHNtIGRldmljZSBiZWZvcmUgaGFydCBC
IGVudGVycyBPcGVuU0JJLiBUaGUgaGFydCBCCj4gZXZlbnR1YWxseSBlbnRlcnMgT3BlblNCSSBh
bmQgZm9sbG93cyB0aGUgT3BlblNCSSB3YXJtLWJvb3QgcGF0aAo+IHNvIGl0IHdpbGwgaW5jcmVt
ZW50IGl0J3Mgb3duIGVudHJ5X2NvdW50IGJlZm9yZSBlbnRlcmluZyBoc20gd2FpdAo+IGxvb3Ag
d2hlcmUgaXQgc2VlcyBoc20gZGV2aWNlIGFuZCBzdG9wcyBpdHNlbGYuIExhdGVyIGFzIHBhcnQg
b2YKPiB0aGUgTGludXggYm9vdC11cCBzZXF1ZW5jZSwgaGFydCBBIGlzc3VlcyBTQkkgSFNNIHN0
YXJ0IGNhbGwgdG8KPiBicmluZy11cCBoYXJ0IEIgYnV0IE9wZW5TQkkgc2VlcyBlbnRyeV9jb3Vu
dCAhPSBpbml0X2NvdW50IGZvcgo+IGhhcnQgQiBpbiBzYmlfaHNtX2hhcnRfc3RhcnQoKSBoZW5j
ZSBoc21fZGV2aWNlX2hhcnRfc3RhcnQoKSBpcwo+IG5vdCBjYWxsZWQgZm9yIGhhcnQgQiByZXN1
bHRpbmcgaW4gaGFydCBCIHN0dWNrIGZvcmV2ZXIgaW4gT3BlblNCSS4KPgo+IFRvIGZpeCB0aGUg
YWJvdmUgaXNzdWUsIHJldmVydCBlbnRyeV9jb3VudCBiZWZvcmUgZG9pbmcgaHNtIHN0b3AKPiBp
biBoc20gd2FpdCBsb29wLgo+Cj4gRml4ZXM6IGQ4NDRkZWFkZWM5NCAoImxpYjogc2JpOiBVc2Ug
aHNtIHN0b3AgZm9yIGhzbSB3YWl0IikKPiBTaWduZWQtb2ZmLWJ5OiBBbnVwIFBhdGVsIDxhcGF0
ZWxAdmVudGFuYW1pY3JvLmNvbT4KCkFwcGxpZWQgdGhpcyBwYXRjaCB0byB0aGUgcmlzY3Yvb3Bl
bnNiaSByZXBvLgoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICBpbmNsdWRlL3NiaS9zYmlfaW5pdC5o
IHwgIDIgKysKPiAgbGliL3NiaS9zYmlfaHNtLmMgICAgICB8ICA0ICsrKy0KPiAgbGliL3NiaS9z
YmlfaW5pdC5jICAgICB8IDEzICsrKysrKysrKysrKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCAxOCBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zYmkv
c2JpX2luaXQuaCBiL2luY2x1ZGUvc2JpL3NiaV9pbml0LmgKPiBpbmRleCBjOTAxM2VhNC4uYWQw
Njg2NzQgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9zYmkvc2JpX2luaXQuaAo+ICsrKyBiL2luY2x1
ZGUvc2JpL3NiaV9pbml0LmgKPiBAQCAtMTYsNiArMTYsOCBAQCBzdHJ1Y3Qgc2JpX3NjcmF0Y2g7
Cj4KPiAgdm9pZCBfX25vcmV0dXJuIHNiaV9pbml0KHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRj
aCk7Cj4KPiArdm9pZCBzYmlfcmV2ZXJ0X2VudHJ5X2NvdW50KHN0cnVjdCBzYmlfc2NyYXRjaCAq
c2NyYXRjaCk7Cj4gKwo+ICB1bnNpZ25lZCBsb25nIHNiaV9lbnRyeV9jb3VudCh1MzIgaGFydGlu
ZGV4KTsKPgo+ICB1bnNpZ25lZCBsb25nIHNiaV9pbml0X2NvdW50KHUzMiBoYXJ0aW5kZXgpOwo+
IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9oc20uYyBiL2xpYi9zYmkvc2JpX2hzbS5jCj4gaW5k
ZXggZTgxMjhhMzkuLjU1N2FiMTMxIDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkvc2JpX2hzbS5jCj4g
KysrIGIvbGliL3NiaS9zYmlfaHNtLmMKPiBAQCAtMTc2LDggKzE3NiwxMCBAQCBzdGF0aWMgdm9p
ZCBzYmlfaHNtX2hhcnRfd2FpdChzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gpCj4gICAgICAg
ICAgICAgICAgICAqIElmIHRoZSBoc21fZGV2IGlzIHJlYWR5IGFuZCBpdCBzdXBwb3J0IHRoZSBo
b3RwbHVnLCB3ZSBjYW4KPiAgICAgICAgICAgICAgICAgICogdXNlIHRoZSBoc20gc3RvcCBmb3Ig
bW9yZSBwb3dlciBzYXZpbmcKPiAgICAgICAgICAgICAgICAgICovCj4gLSAgICAgICAgICAgICAg
IGlmIChoc21fZGV2aWNlX2hhc19oYXJ0X2hvdHBsdWcoKSkKPiArICAgICAgICAgICAgICAgaWYg
KGhzbV9kZXZpY2VfaGFzX2hhcnRfaG90cGx1ZygpKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgc2JpX3JldmVydF9lbnRyeV9jb3VudChzY3JhdGNoKTsKPiAgICAgICAgICAgICAgICAgICAg
ICAgICBoc21fZGV2aWNlX2hhcnRfc3RvcCgpOwo+ICsgICAgICAgICAgICAgICB9Cj4KPiAgICAg
ICAgICAgICAgICAgd2ZpKCk7Cj4gICAgICAgICB9Cj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2Jp
X2luaXQuYyBiL2xpYi9zYmkvc2JpX2luaXQuYwo+IGluZGV4IDYyYzMyNjgyLi44NGE2Mzc0OCAx
MDA2NDQKPiAtLS0gYS9saWIvc2JpL3NiaV9pbml0LmMKPiArKysgYi9saWIvc2JpL3NiaV9pbml0
LmMKPiBAQCAtNTc5LDYgKzU3OSwxOSBAQCB2b2lkIF9fbm9yZXR1cm4gc2JpX2luaXQoc3RydWN0
IHNiaV9zY3JhdGNoICpzY3JhdGNoKQo+ICAgICAgICAgICAgICAgICBpbml0X3dhcm1ib290KHNj
cmF0Y2gsIGhhcnRpZCk7Cj4gIH0KPgo+ICt2b2lkIHNiaV9yZXZlcnRfZW50cnlfY291bnQoc3Ry
dWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoKQo+ICt7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nICpl
bnRyeV9jb3VudCwgKmluaXRfY291bnQ7Cj4gKwo+ICsgICAgICAgaWYgKCFlbnRyeV9jb3VudF9v
ZmZzZXQgfHwgIWluaXRfY291bnRfb2Zmc2V0KQo+ICsgICAgICAgICAgICAgICBzYmlfaGFydF9o
YW5nKCk7Cj4gKwo+ICsgICAgICAgZW50cnlfY291bnQgPSBzYmlfc2NyYXRjaF9vZmZzZXRfcHRy
KHNjcmF0Y2gsIGVudHJ5X2NvdW50X29mZnNldCk7Cj4gKyAgICAgICBpbml0X2NvdW50ID0gc2Jp
X3NjcmF0Y2hfb2Zmc2V0X3B0cihzY3JhdGNoLCBpbml0X2NvdW50X29mZnNldCk7Cj4gKwo+ICsg
ICAgICAgKmVudHJ5X2NvdW50ID0gKmluaXRfY291bnQ7Cj4gK30KPiArCj4gIHVuc2lnbmVkIGxv
bmcgc2JpX2VudHJ5X2NvdW50KHUzMiBoYXJ0aW5kZXgpCj4gIHsKPiAgICAgICAgIHN0cnVjdCBz
Ymlfc2NyYXRjaCAqc2NyYXRjaDsKPiAtLQo+IDIuNDMuMAo+CgotLSAKb3BlbnNiaSBtYWlsaW5n
IGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
