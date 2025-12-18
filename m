Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E00CD6D22D
	for <opensbi@archiver.kernel.org>; Thu, 18 Dec 2025 14:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M7ZZek/qrFFhP2wgb3PT2aBGT2fHKtgiyNCxHyYUvnc=; b=NwONfGZrxgMyXg
	+9k+794gJTRP+zmUb5vBgrrnhhpg1s9yccA+ukMX5sGvq+lnfEwwbauIE4Q9bqxyn9GTn+4HoFmrq
	dBVFWdPAFqeM74lurHNdQeeeVeTH1eosMfy3dPbLjAKUeQWrZ6JAtDl/8Fnq5vFhL330TGWRFkGH5
	ZLfMV/a1taYtaf8SxQjtLPIj0o1K0V6c6Frf9t1+Sp30hl8yz1qVK/kAPEyH7qCvYfQGNZhELMWIJ
	mdCmK5LkHq+n8898NSUptuQCEd5wHyDC/J1dugIz4LDKv+LsfI95sVcFygqBC3nsFIe1klMKtWFjK
	ILxjx1Vyl8T/LTMF+ToQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWF9m-00000008cpZ-3BXh;
	Thu, 18 Dec 2025 14:39:06 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWF9j-00000008cp0-1iZf
	for opensbi@lists.infradead.org;
	Thu, 18 Dec 2025 14:39:04 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-7c75fc222c3so309743a34.0
        for <opensbi@lists.infradead.org>; Thu, 18 Dec 2025 06:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1766068742; x=1766673542; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IvhIEY892+uNxvtPwa0Nk3hioyN7NALwo8LVS6w7XYU=;
        b=afwWxl2G8V8sY9WsQzkLqtH6PHGKyPH1gxSf2kafCUOcueM7FE0dFsxLL067Hd2nbZ
         w3rzTGOzws//XR7IhlEsD9OGJ75y/OOQuivYxPK7DLRPNFTVy0APKmUf0CwYvRgNthmz
         6EepHsu7xetfM8JCr1WdvxkCeofNnypsatHd6Cn9H9E2oUKI5/wmmRDxcwcT/EN+0o7n
         Y3q9ah999HcDkEQ3CXaciV2vtSwjoYVe4uy+kuy4qixmUNcaBSA4cQjcL7xcjthjZfgd
         U+qwEhJ25FLaE8Z1VcM60pz534NYlqF3yYcAZqudfjQtlI+HTAWLYCUDJDLkTipaUtB2
         xtzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766068742; x=1766673542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IvhIEY892+uNxvtPwa0Nk3hioyN7NALwo8LVS6w7XYU=;
        b=qBPKp8xazu4BHhik2BSlMIRd8x395bv1M7XbBWrfMuhrdX25aaZ3NbtS7vS4mv1HLb
         w1W/iXgeu6PRXIPEaDmNhQjqgHACucmpO01amqRMiN7hVN2iTDTsTF1PwoIY/8d0n7lQ
         Y5etEKCn+jl7NBTMOiK0h0e6F9hJISYB7CuexucZ/i6stOZInvux+CUb3OtN3nJ1oVOV
         bGyK+D6URJWwJ2LGXaOj7maM4tQaC9JK0BjCsG4V1+GfFmosRTkne6ASBRhh1Fi+JLql
         5fuYH/FliCuj3D2PktiZKp/bismLxnHc4aQ5bcIihnHa3aGyaLxOeXOK4qAlqFsWBfdO
         LlkA==
X-Gm-Message-State: AOJu0YwONs+IvOwGHGeh5YyifhMZFCjfC9nDPvmpJpsTbHIXbIlRd8dn
	mYamIwCYp5pY8K0ZX+E7+H1THa1LNujYjvQTJ8XJz3x0ftOhFJ9b46f8fr6YN4GbT4Oob2O9QHJ
	YMYXMzgp3GTSizUDyO9a40pa2X0HY5KIkQFb6rPicUg==
X-Gm-Gg: AY/fxX76IY+cVGBfM9jV/pTYUwIPxD8O7QDrV/3sihSluJmGDf7bNU3pRtc9nifjLBx
	EWb51VFGWQxHOtVYd/5eU18/LFajM+jS6EUEHvocRKGOODpTZTg6ngpAXBOEPFxrNOl/odtpflh
	t0HjGvPaScGE/pjszfshff4XtVqRAKYOaCRpmzSMH8W9/NveWD0PefkWvh5RhlIJRYDmN24ERYf
	oy5oiBDiACj1OqpLCSHzQsjood6Z8UHwOVg1JZV+zl26nP7QiM/N5WNkze2mCAwzU6CvLMH
X-Google-Smtp-Source: AGHT+IFLh7bpkWfQf8V/h9J0097gz8OPQ/7PIeahcoQewIhjDrDhYO9HD7pIEMHhwFi4V6qW29s3IL/zJroK5Xc0GRg=
X-Received: by 2002:a05:6820:609:b0:65d:c8e:8408 with SMTP id
 006d021491bc7-65d0c8e8683mr76023eaf.46.1766068742320; Thu, 18 Dec 2025
 06:39:02 -0800 (PST)
MIME-Version: 1.0
References: <20251218104243.562667-1-ganboing@gmail.com> <20251218104243.562667-4-ganboing@gmail.com>
In-Reply-To: <20251218104243.562667-4-ganboing@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 18 Dec 2025 20:08:51 +0530
X-Gm-Features: AQt7F2odx2_cDe1tAIGQD6kXWt-vl_6KhkW36upHCnVpNk4hPbOGQkXEJQ06rpo
Message-ID: <CAAhSdy2QA6P8ncANEEM422e1uBOLq+c=VaPv0rfOowuTowGyCw@mail.gmail.com>
Subject: Re: [PATCH v6 3/7] lib: sbi_domain: make is_region_subset public
To: Bo Gan <ganboing@gmail.com>
Cc: opensbi@lists.infradead.org, linmin@eswincomputing.com, 
	pinkesh.vaghela@einfochips.com, gaohan@iscas.ac.cn, samuel@sholland.org, 
	wangxiang@iscas.ac.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_063903_453298_7F2C2862 
X-CRM114-Status: GOOD (  19.83  )
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
Y29tPiB3cm90ZToKPgo+IFRoZSBoZWxwZXIgZnVuY3Rpb24gaXMgcmVuYW1lZCBhcyBzYmlfZG9t
YWluX21lbXJlZ2lvbl9pc19zdWJzZXQsCj4gYW5kIG1hZGUgcHVibGljIGluIGhlYWRlciBmaWxl
Lgo+Cj4gQWxzbyBhZGQgYSBjb252ZW5pZW50IGhlbHBlciBvZiBzYmlfZG9tYWluX2Zvcl9lYWNo
X21lbXJlZ2lvbl9pZHguCj4KPiBTaWduZWQtb2ZmLWJ5OiBCbyBHYW4gPGdhbmJvaW5nQGdtYWls
LmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9y
Zz4KClJlZ2FyZHMsCkFudXAKCj4gLS0tCj4gIGluY2x1ZGUvc2JpL3NiaV9kb21haW4uaCB8IDIy
ICsrKysrKysrKysrKysrKysrKysrKysKPiAgbGliL3NiaS9zYmlfZG9tYWluLmMgICAgIHwgMjMg
KysrLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25z
KCspLCAyMCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3NiaS9zYmlfZG9t
YWluLmggYi9pbmNsdWRlL3NiaS9zYmlfZG9tYWluLmgKPiBpbmRleCAzMzYwZTA5MC4uYzhhNmRh
OTkgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9zYmkvc2JpX2RvbWFpbi5oCj4gKysrIGIvaW5jbHVk
ZS9zYmkvc2JpX2RvbWFpbi5oCj4gQEAgLTE2NCw2ICsxNjQsMjUgQEAgc3RydWN0IHNiaV9kb21h
aW5fbWVtcmVnaW9uIHsKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4gIH07Cj4KPiAr
LyoqIENoZWNrIGlmIHJlZ2lvbkEgaXMgc3ViLXJlZ2lvbiBvZiByZWdpb25CICovCj4gK3N0YXRp
YyBpbmxpbmUgYm9vbCBzYmlfZG9tYWluX21lbXJlZ2lvbl9pc19zdWJzZXQoCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3Qgc2JpX2RvbWFpbl9tZW1yZWdpb24g
KnJlZ0EsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3Qgc2Jp
X2RvbWFpbl9tZW1yZWdpb24gKnJlZ0IpCj4gK3sKPiArICAgICAgIHVsb25nIHJlZ0Ffc3RhcnQg
PSByZWdBLT5iYXNlOwo+ICsgICAgICAgdWxvbmcgcmVnQV9lbmQgPSByZWdBLT5iYXNlICsgKEJJ
VChyZWdBLT5vcmRlcikgLSAxKTsKPiArICAgICAgIHVsb25nIHJlZ0Jfc3RhcnQgPSByZWdCLT5i
YXNlOwo+ICsgICAgICAgdWxvbmcgcmVnQl9lbmQgPSByZWdCLT5iYXNlICsgKEJJVChyZWdCLT5v
cmRlcikgLSAxKTsKPiArCj4gKyAgICAgICBpZiAoKHJlZ0Jfc3RhcnQgPD0gcmVnQV9zdGFydCkg
JiYKPiArICAgICAgICAgICAocmVnQV9zdGFydCA8IHJlZ0JfZW5kKSAmJgo+ICsgICAgICAgICAg
IChyZWdCX3N0YXJ0IDwgcmVnQV9lbmQpICYmCj4gKyAgICAgICAgICAgKHJlZ0FfZW5kIDw9IHJl
Z0JfZW5kKSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIHRydWU7Cj4gKwo+ICsgICAgICAgcmV0
dXJuIGZhbHNlOwo+ICt9Cj4gKwo+ICAvKiogUmVwcmVzZW50YXRpb24gb2YgT3BlblNCSSBkb21h
aW4gKi8KPiAgc3RydWN0IHNiaV9kb21haW4gewo+ICAgICAgICAgLyoqIE5vZGUgaW4gbGlua2Vk
IGxpc3Qgb2YgZG9tYWlucyAqLwo+IEBAIC0yMjIsNiArMjQxLDkgQEAgZXh0ZXJuIHN0cnVjdCBz
YmlfZGxpc3QgZG9tYWluX2xpc3Q7Cj4gICNkZWZpbmUgc2JpX2RvbWFpbl9mb3JfZWFjaF9tZW1y
ZWdpb24oX19kLCBfX3IpIFwKPiAgICAgICAgIGZvciAoKF9fcikgPSAoX19kKS0+cmVnaW9uczsg
KF9fciktPm9yZGVyOyAoX19yKSsrKQo+Cj4gKyNkZWZpbmUgc2JpX2RvbWFpbl9mb3JfZWFjaF9t
ZW1yZWdpb25faWR4KF9fZCwgX19yLCBfX2kpIFwKPiArICAgICAgIGZvciAoKF9fcikgPSAoX19k
KS0+cmVnaW9ucywgKF9faSkgPSAwOyAoX19yKS0+b3JkZXI7IChfX3IpKyssIChfX2kpKyspCj4g
Kwo+ICAvKioKPiAgICogQ2hlY2sgd2hldGhlciBnaXZlbiBIQVJUIGlzIGFzc2lnbmVkIHRvIHNw
ZWNpZmllZCBkb21haW4KPiAgICogQHBhcmFtIGRvbSBwb2ludGVyIHRvIGRvbWFpbgo+IGRpZmYg
LS1naXQgYS9saWIvc2JpL3NiaV9kb21haW4uYyBiL2xpYi9zYmkvc2JpX2RvbWFpbi5jCj4gaW5k
ZXggNzRjYzFlM2YuLmExOWJmMjViIDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkvc2JpX2RvbWFpbi5j
Cj4gKysrIGIvbGliL3NiaS9zYmlfZG9tYWluLmMKPiBAQCAtMjg1LDI5ICsyODUsMTIgQEAgc3Rh
dGljIGJvb2wgaXNfcmVnaW9uX3ZhbGlkKGNvbnN0IHN0cnVjdCBzYmlfZG9tYWluX21lbXJlZ2lv
biAqcmVnKQo+ICAgICAgICAgcmV0dXJuIHRydWU7Cj4gIH0KPgo+IC0vKiogQ2hlY2sgaWYgcmVn
aW9uQSBpcyBzdWItcmVnaW9uIG9mIHJlZ2lvbkIgKi8KPiAtc3RhdGljIGJvb2wgaXNfcmVnaW9u
X3N1YnNldChjb25zdCBzdHJ1Y3Qgc2JpX2RvbWFpbl9tZW1yZWdpb24gKnJlZ0EsCj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3Qgc2JpX2RvbWFpbl9tZW1yZWdpb24g
KnJlZ0IpCj4gLXsKPiAtICAgICAgIHVsb25nIHJlZ0Ffc3RhcnQgPSByZWdBLT5iYXNlOwo+IC0g
ICAgICAgdWxvbmcgcmVnQV9lbmQgPSByZWdBLT5iYXNlICsgKEJJVChyZWdBLT5vcmRlcikgLSAx
KTsKPiAtICAgICAgIHVsb25nIHJlZ0Jfc3RhcnQgPSByZWdCLT5iYXNlOwo+IC0gICAgICAgdWxv
bmcgcmVnQl9lbmQgPSByZWdCLT5iYXNlICsgKEJJVChyZWdCLT5vcmRlcikgLSAxKTsKPiAtCj4g
LSAgICAgICBpZiAoKHJlZ0Jfc3RhcnQgPD0gcmVnQV9zdGFydCkgJiYKPiAtICAgICAgICAgICAo
cmVnQV9zdGFydCA8IHJlZ0JfZW5kKSAmJgo+IC0gICAgICAgICAgIChyZWdCX3N0YXJ0IDwgcmVn
QV9lbmQpICYmCj4gLSAgICAgICAgICAgKHJlZ0FfZW5kIDw9IHJlZ0JfZW5kKSkKPiAtICAgICAg
ICAgICAgICAgcmV0dXJuIHRydWU7Cj4gLQo+IC0gICAgICAgcmV0dXJuIGZhbHNlOwo+IC19Cj4g
LQo+ICAvKiogQ2hlY2sgaWYgcmVnaW9uQSBjYW4gYmUgcmVwbGFjZWQgYnkgcmVnaW9uQiAqLwo+
ICBzdGF0aWMgYm9vbCBpc19yZWdpb25fY29tcGF0aWJsZShjb25zdCBzdHJ1Y3Qgc2JpX2RvbWFp
bl9tZW1yZWdpb24gKnJlZ0EsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29u
c3Qgc3RydWN0IHNiaV9kb21haW5fbWVtcmVnaW9uICpyZWdCKQo+ICB7Cj4gLSAgICAgICBpZiAo
aXNfcmVnaW9uX3N1YnNldChyZWdBLCByZWdCKSAmJiByZWdBLT5mbGFncyA9PSByZWdCLT5mbGFn
cykKPiArICAgICAgIGlmIChzYmlfZG9tYWluX21lbXJlZ2lvbl9pc19zdWJzZXQocmVnQSwgcmVn
QikgJiYKPiArICAgICAgICAgICByZWdBLT5mbGFncyA9PSByZWdCLT5mbGFncykKPiAgICAgICAg
ICAgICAgICAgcmV0dXJuIHRydWU7Cj4KPiAgICAgICAgIHJldHVybiBmYWxzZTsKPiBAQCAtMzY3
LDcgKzM1MCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc2JpX2RvbWFpbl9tZW1yZWdpb24gKmZp
bmRfbmV4dF9zdWJzZXRfcmVnaW9uKAo+Cj4gICAgICAgICBzYmlfZG9tYWluX2Zvcl9lYWNoX21l
bXJlZ2lvbihkb20sIHNyZWcpIHsKPiAgICAgICAgICAgICAgICAgaWYgKHNyZWcgPT0gcmVnIHx8
IChzcmVnLT5iYXNlIDw9IGFkZHIpIHx8Cj4gLSAgICAgICAgICAgICAgICAgICAhaXNfcmVnaW9u
X3N1YnNldChzcmVnLCByZWcpKQo+ICsgICAgICAgICAgICAgICAgICAgIXNiaV9kb21haW5fbWVt
cmVnaW9uX2lzX3N1YnNldChzcmVnLCByZWcpKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGNv
bnRpbnVlOwo+Cj4gICAgICAgICAgICAgICAgIGlmICghcmV0IHx8IChzcmVnLT5iYXNlIDwgcmV0
LT5iYXNlKSB8fAo+IC0tCj4gMi4zNC4xCj4KPgo+IC0tCj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QK
PiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVu
c2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9vcGVuc2JpCg==
