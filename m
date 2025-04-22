Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29460C369C2
	for <opensbi@archiver.kernel.org>; Tue, 22 Apr 2025 15:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1aAg9EF3wqdsUHZ60skJwLkMpoaPHXtRCGycq99nBws=; b=u+5wbNNzlq2SKn
	6DIEFuC8OJk/DqHqhPexmRp1VQqEremXzfCV6tZljbcU9KNbb6DV6Rv66r4Eg067y+zAoQYeDO9XB
	Ptc0m/E2YH98/EFguFcBTw11/fPe5gss1QuXx/8zO0jx+3EM3O2pG0xA2EvZSXBuI3Nsqy9A6g9T7
	8Iqx4p8GPs9SnPm4MhM9leHgVx0oxFxSJilJ/a3GwsAVZjdwrupBg9xelyTSDEZuaMInao6QA3ubj
	+zGcuoQvny+uZBXCHbSj43FKPkT3HTUfUWZpIHn4+E7yBVjT4wZRBSXhtvihKx0bYFXv/EZ1UigDF
	2JiS2AthVz/edS9bpnlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7FGF-00000007e7J-1GwG;
	Tue, 22 Apr 2025 15:10:11 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Ds7-00000007LRN-3vHi
	for opensbi@lists.infradead.org;
	Tue, 22 Apr 2025 13:41:13 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3d91db4f0c3so4343305ab.3
        for <opensbi@lists.infradead.org>; Tue, 22 Apr 2025 06:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1745329271; x=1745934071; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qWWuE192Rj8MKsnApNRzXRxAKAVWx2s9wWlThYMBEu4=;
        b=pFgA+IW2+uIMpaAnvgYhWm+HgCMmRH0GTNmFFZgkFE5i7ImUs2FHre3iqHBV5Cgt4E
         yJds5YE2I6mvPnYWLCaWxoLCPZ1WuGVvC2b/O2EzJUv5rbyQHggRApj/rL6wgx7YEZh1
         iO9l2ip4p9j3JQYlMEx+E54/kDy3ZXyY/u7VCE/Jq1VT82E3SCYwuVDqBLCyrsljdUAc
         h4exDMGVzYxevbaqsRA64XlpgIbGVdw1XPV6bX1xAbSnU3Cwf8Q8DkvktyRJD7fMn5uz
         A3YRw6jYqAyGvmQhmMCYPtLDO7behO7E3HwFJfy0gfjrShkHYqEHc6blDKv2Vq5EE79P
         +DsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745329271; x=1745934071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qWWuE192Rj8MKsnApNRzXRxAKAVWx2s9wWlThYMBEu4=;
        b=MiHqcug3ooU2goIjcwPb7vK74dgU9cZ5a9dQ/NfPCc+POhTVGc/ZU4gLJRyhyWiCqX
         EV0n/ChpcHxKIcE4pFv0ZmDH9bdl0Ahla4b6NCjSODRwRWe3s5/criTMHttA2HfBOSbO
         GTjs2cegSpK+xybg9fpOrgk62YwZikkQiiIXrbq4tC5YI7NHYoSFdK0G2+E0uy7/PXGK
         48lqVeWUP+SGgfFa160E/u4vhqPz0SEYfFNQSTqqacuCwMNyoTQfRHAkUIT3DymRqfn9
         drnrL0OMIZzoIFBQRc5JCIC4qUQZ8EFUn7p11j16CdD3YO9a/Fru4jqQgg/F2t4WMzu/
         qOSA==
X-Gm-Message-State: AOJu0YxMnyRO/UwyLZs+asYWgzMJIZSY75zRXPKSHIhz0et7WeD7XTFd
	gu+nJIKPgidNKa/QpnnH96ihogj5UGk3+ZkPkf69zp4xYX1ahW4vp9D4MUrel7pWiWRJws29zAm
	lEWZQxN95adw5T8Ghdl6HLPVQUMmbEL4w1rsEvLvH9hOX4nGM
X-Gm-Gg: ASbGncuA4zZEbuYYBl2h9SlHg4FWBdGrm7VzbcvfVb7JkwwmQ1M+F5l8paoqpTawf6g
	+0BWrVU7T2cu+YWMHbWdjSu9pR9sZXgfPo0H8j4iq+lLhKQdok0SIV8OCcpZlaWHxyEgzpuqKkJ
	spP4Lq22GNOp7nGEyPaJJwdGs=
X-Google-Smtp-Source: AGHT+IHG8R0QG3xmKYG6e7DKlAsScda9VTJN9gMsynM4VkKx8xUmn6sh3HdbWv2h+MEczcntqXELgjiLKHxPlq1GlUw=
X-Received: by 2002:a05:6e02:154d:b0:3d0:4e57:bbda with SMTP id
 e9e14a558f8ab-3d88ed79bfemr132448105ab.1.1745329270754; Tue, 22 Apr 2025
 06:41:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250325234342.711447-1-samuel.holland@sifive.com> <20250325234342.711447-5-samuel.holland@sifive.com>
In-Reply-To: <20250325234342.711447-5-samuel.holland@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 22 Apr 2025 19:10:59 +0530
X-Gm-Features: ATxdqUF7FMduOHzG8gQYpM_36RrKJaNjUkgsqrFrgb0Dw4-1k3d9w0B6lM3SMyo
Message-ID: <CAAhSdy1PFM92f-nys9ALs1VMzuLdcpLVXQ1Gh77qr4jjCoT32A@mail.gmail.com>
Subject: Re: [PATCH 04/10] platform: generic: Add an init hook matching fdt_driver
To: Samuel Holland <samuel.holland@sifive.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_064111_972041_8EDB8939 
X-CRM114-Status: GOOD (  21.62  )
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

T24gV2VkLCBNYXIgMjYsIDIwMjUgYXQgNToxM+KAr0FNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEluIHByZXBhcmF0aW9uIGZvciByZXVzaW5n
IHRoZSBmZHRfZHJpdmVyIGNvZGUgdG8gbWF0Y2ggcGxhdGZvcm0KPiBvdmVycmlkZXMsIGFkZCBh
IG5ldyAuaW5pdCBob29rIG1hdGNoaW5nIHRoZSB0eXBlIHNpZ25hdHVyZSBmcm9tCj4gZmR0X2Ry
aXZlci4gVGhpcyBob29rIHJlcGxhY2VzIHRoZSBleGlzdGluZyAuZndfaW5pdCBob29rLCBzaW5j
ZQo+IGl0IGlzIGNhbGxlZCBhdCByb3VnaGx5IHRoZSBzYW1lIHBsYWNlIGluIHRoZSBpbml0IHBy
b2Nlc3MuCj4KPiBTaWduZWQtb2ZmLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRA
c2lmaXZlLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZh
dWx0Lm9yZz4KClJlZ2FyZHMsCkFudXAKCj4gLS0tCj4KPiAgcGxhdGZvcm0vZ2VuZXJpYy9pbmNs
dWRlL3BsYXRmb3JtX292ZXJyaWRlLmggfCAgMyArKy0KPiAgcGxhdGZvcm0vZ2VuZXJpYy9wbGF0
Zm9ybS5jICAgICAgICAgICAgICAgICAgfCAxMSArKysrKysrLS0tLQo+ICBwbGF0Zm9ybS9nZW5l
cmljL3N0YXJmaXZlL2poNzExMC5jICAgICAgICAgICB8ICA3ICsrKysrLS0KPiAgMyBmaWxlcyBj
aGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBh
L3BsYXRmb3JtL2dlbmVyaWMvaW5jbHVkZS9wbGF0Zm9ybV9vdmVycmlkZS5oIGIvcGxhdGZvcm0v
Z2VuZXJpYy9pbmNsdWRlL3BsYXRmb3JtX292ZXJyaWRlLmgKPiBpbmRleCA5NDZmYjhmNy4uMDQ5
OWI3ZTYgMTAwNjQ0Cj4gLS0tIGEvcGxhdGZvcm0vZ2VuZXJpYy9pbmNsdWRlL3BsYXRmb3JtX292
ZXJyaWRlLmgKPiArKysgYi9wbGF0Zm9ybS9nZW5lcmljL2luY2x1ZGUvcGxhdGZvcm1fb3ZlcnJp
ZGUuaAo+IEBAIC0xNyw2ICsxNyw4IEBACj4KPiAgc3RydWN0IHBsYXRmb3JtX292ZXJyaWRlIHsK
PiAgICAgICAgIGNvbnN0IHN0cnVjdCBmZHRfbWF0Y2ggKm1hdGNoX3RhYmxlOwo+ICsgICAgICAg
aW50ICgqaW5pdCkoY29uc3Qgdm9pZCAqZmR0LCBpbnQgbm9kZW9mZiwKPiArICAgICAgICAgICAg
ICAgICAgIGNvbnN0IHN0cnVjdCBmZHRfbWF0Y2ggKm1hdGNoKTsKPiAgICAgICAgIHU2NCAoKmZl
YXR1cmVzKShjb25zdCBzdHJ1Y3QgZmR0X21hdGNoICptYXRjaCk7Cj4gICAgICAgICB1NjQgKCp0
bGJyX2ZsdXNoX2xpbWl0KShjb25zdCBzdHJ1Y3QgZmR0X21hdGNoICptYXRjaCk7Cj4gICAgICAg
ICB1MzIgKCp0bGJfbnVtX2VudHJpZXMpKGNvbnN0IHN0cnVjdCBmZHRfbWF0Y2ggKm1hdGNoKTsK
PiBAQCAtMjksNyArMzEsNiBAQCBzdHJ1Y3QgcGxhdGZvcm1fb3ZlcnJpZGUgewo+ICAgICAgICAg
aW50ICgqZXh0ZW5zaW9uc19pbml0KShjb25zdCBzdHJ1Y3QgZmR0X21hdGNoICptYXRjaCwKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHNiaV9oYXJ0X2ZlYXR1cmVzICpo
ZmVhdHVyZXMpOwo+ICAgICAgICAgaW50ICgqcG11X2luaXQpKGNvbnN0IHN0cnVjdCBmZHRfbWF0
Y2ggKm1hdGNoKTsKPiAtICAgICAgIHZvaWQgKCpmd19pbml0KShjb25zdCB2b2lkICpmZHQsIGNv
bnN0IHN0cnVjdCBmZHRfbWF0Y2ggKm1hdGNoKTsKPiAgICAgICAgIGludCAoKnZlbmRvcl9leHRf
cHJvdmlkZXIpKGxvbmcgZnVuY2lkLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc3RydWN0IHNiaV90cmFwX3JlZ3MgKnJlZ3MsCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzdHJ1Y3Qgc2JpX2VjYWxsX3JldHVybiAqb3V0LAo+IGRpZmYgLS1naXQgYS9w
bGF0Zm9ybS9nZW5lcmljL3BsYXRmb3JtLmMgYi9wbGF0Zm9ybS9nZW5lcmljL3BsYXRmb3JtLmMK
PiBpbmRleCBiMmYyOWU4Yi4uZjM0NTIxZDYgMTAwNjQ0Cj4gLS0tIGEvcGxhdGZvcm0vZ2VuZXJp
Yy9wbGF0Zm9ybS5jCj4gKysrIGIvcGxhdGZvcm0vZ2VuZXJpYy9wbGF0Zm9ybS5jCj4gQEAgLTQw
LDcgKzQwLDcgQEAgc3RhdGljIHZvaWQgZndfcGxhdGZvcm1fbG9va3VwX3NwZWNpYWwoY29uc3Qg
dm9pZCAqZmR0LCBpbnQgcm9vdF9vZmZzZXQpCj4gIHsKPiAgICAgICAgIGNvbnN0IHN0cnVjdCBw
bGF0Zm9ybV9vdmVycmlkZSAqcGxhdDsKPiAgICAgICAgIGNvbnN0IHN0cnVjdCBmZHRfbWF0Y2gg
Km1hdGNoOwo+IC0gICAgICAgaW50IHBvczsKPiArICAgICAgIGludCBwb3MsIHJjOwo+Cj4gICAg
ICAgICBmb3IgKHBvcyA9IDA7IHBsYXRmb3JtX292ZXJyaWRlX21vZHVsZXNbcG9zXTsgcG9zKysp
IHsKPiAgICAgICAgICAgICAgICAgcGxhdCA9IHBsYXRmb3JtX292ZXJyaWRlX21vZHVsZXNbcG9z
XTsKPiBAQCAtNTEsNiArNTEsMTIgQEAgc3RhdGljIHZvaWQgZndfcGxhdGZvcm1fbG9va3VwX3Nw
ZWNpYWwoY29uc3Qgdm9pZCAqZmR0LCBpbnQgcm9vdF9vZmZzZXQpCj4gICAgICAgICAgICAgICAg
IGlmICghbWF0Y2gpCj4gICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4KPiArICAg
ICAgICAgICAgICAgaWYgKHBsYXQtPmluaXQpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBy
YyA9IHBsYXQtPmluaXQoZmR0LCByb290X29mZnNldCwgbWF0Y2gpOwo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGlmIChyYykKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRp
bnVlOwo+ICsgICAgICAgICAgICAgICB9Cj4gKwo+ICAgICAgICAgICAgICAgICBnZW5lcmljX3Bs
YXQgPSBwbGF0Owo+ICAgICAgICAgICAgICAgICBnZW5lcmljX3BsYXRfbWF0Y2ggPSBtYXRjaDsK
PiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gQEAgLTE3OCw5ICsxODQsNiBAQCB1bnNpZ25lZCBs
b25nIGZ3X3BsYXRmb3JtX2luaXQodW5zaWduZWQgbG9uZyBhcmcwLCB1bnNpZ25lZCBsb25nIGFy
ZzEsCj4KPiAgICAgICAgIGZ3X3BsYXRmb3JtX2xvb2t1cF9zcGVjaWFsKGZkdCwgcm9vdF9vZmZz
ZXQpOwo+Cj4gLSAgICAgICBpZiAoZ2VuZXJpY19wbGF0ICYmIGdlbmVyaWNfcGxhdC0+ZndfaW5p
dCkKPiAtICAgICAgICAgICAgICAgZ2VuZXJpY19wbGF0LT5md19pbml0KGZkdCwgZ2VuZXJpY19w
bGF0X21hdGNoKTsKPiAtCj4gICAgICAgICBtb2RlbCA9IGZkdF9nZXRwcm9wKGZkdCwgcm9vdF9v
ZmZzZXQsICJtb2RlbCIsICZsZW4pOwo+ICAgICAgICAgaWYgKG1vZGVsKQo+ICAgICAgICAgICAg
ICAgICBzYmlfc3RybmNweShwbGF0Zm9ybS5uYW1lLCBtb2RlbCwgc2l6ZW9mKHBsYXRmb3JtLm5h
bWUpIC0gMSk7Cj4gZGlmZiAtLWdpdCBhL3BsYXRmb3JtL2dlbmVyaWMvc3RhcmZpdmUvamg3MTEw
LmMgYi9wbGF0Zm9ybS9nZW5lcmljL3N0YXJmaXZlL2poNzExMC5jCj4gaW5kZXggY2Q4Y2UyN2Qu
LmNjOWM4MmY3IDEwMDY0NAo+IC0tLSBhL3BsYXRmb3JtL2dlbmVyaWMvc3RhcmZpdmUvamg3MTEw
LmMKPiArKysgYi9wbGF0Zm9ybS9nZW5lcmljL3N0YXJmaXZlL2poNzExMC5jCj4gQEAgLTMwMSw3
ICszMDEsOCBAQCBzdGF0aWMgYm9vbCBzdGFyZml2ZV9qaDcxMTBfY29sZF9ib290X2FsbG93ZWQo
dTMyIGhhcnRpZCwKPiAgICAgICAgIHJldHVybiB0cnVlOwo+ICB9Cj4KPiAtc3RhdGljIHZvaWQg
c3RhcmZpdmVfamg3MTEwX2Z3X2luaXQoY29uc3Qgdm9pZCAqZmR0LCBjb25zdCBzdHJ1Y3QgZmR0
X21hdGNoICptYXRjaCkKPiArc3RhdGljIGludCBzdGFyZml2ZV9qaDcxMTBfcGxhdGZvcm1faW5p
dChjb25zdCB2b2lkICpmZHQsIGludCBub2Rlb2ZmLAo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGZkdF9tYXRjaCAqbWF0Y2gpCj4gIHsKPiAg
ICAgICAgIGNvbnN0IGZkdDMyX3QgKnZhbDsKPiAgICAgICAgIGludCBsZW4sIGNvZmY7Cj4gQEAg
LTMxMiw2ICszMTMsOCBAQCBzdGF0aWMgdm9pZCBzdGFyZml2ZV9qaDcxMTBfZndfaW5pdChjb25z
dCB2b2lkICpmZHQsIGNvbnN0IHN0cnVjdCBmZHRfbWF0Y2ggKm1hdAo+ICAgICAgICAgICAgICAg
ICBpZiAodmFsICYmIGxlbiA+PSBzaXplb2YoZmR0MzJfdCkpCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgc2VsZWN0ZWRfaGFydGlkID0gKHUzMikgZmR0MzJfdG9fY3B1KCp2YWwpOwo+ICAgICAg
ICAgfQo+ICsKPiArICAgICAgIHJldHVybiAwOwo+ICB9Cj4KPiAgc3RhdGljIGNvbnN0IHN0cnVj
dCBmZHRfbWF0Y2ggc3RhcmZpdmVfamg3MTEwX21hdGNoW10gPSB7Cj4gQEAgLTMyMSw3ICszMjQs
NyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGZkdF9tYXRjaCBzdGFyZml2ZV9qaDcxMTBfbWF0Y2hb
XSA9IHsKPgo+ICBjb25zdCBzdHJ1Y3QgcGxhdGZvcm1fb3ZlcnJpZGUgc3RhcmZpdmVfamg3MTEw
ID0gewo+ICAgICAgICAgLm1hdGNoX3RhYmxlID0gc3RhcmZpdmVfamg3MTEwX21hdGNoLAo+ICsg
ICAgICAgLmluaXQgPSBzdGFyZml2ZV9qaDcxMTBfcGxhdGZvcm1faW5pdCwKPiAgICAgICAgIC5j
b2xkX2Jvb3RfYWxsb3dlZCA9IHN0YXJmaXZlX2poNzExMF9jb2xkX2Jvb3RfYWxsb3dlZCwKPiAt
ICAgICAgIC5md19pbml0ID0gc3RhcmZpdmVfamg3MTEwX2Z3X2luaXQsCj4gICAgICAgICAuZmlu
YWxfaW5pdCA9IHN0YXJmaXZlX2poNzExMF9maW5hbF9pbml0LAo+ICB9Owo+IC0tCj4gMi40Ny4y
Cj4KPgo+IC0tCj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVh
ZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5z
YmkKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
