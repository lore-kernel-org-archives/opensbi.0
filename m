Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06879606A31A
	for <opensbi@archiver.kernel.org>; Sat, 31 Oct 2026 12:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WeZdGN6w;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=oZxqkNW5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tKT149TSlzBQ450g5RvOq7U97djetdXBAQyOjfG0Uyc=; b=WeZdGN6w+uOXen1xWdJkLkzzrf
	ykW3dJD8KK+I7RtYCRGqau/REe+gB8PJIRXeZOWGSZg1RUk0bIQmnTihiRBKXFJCtJQwEQMklcvD6
	SCtJKh8iz7tkbApTA7j7rQa6VaLu8/8EFK9HIendxisE9ZSBxBcph41jdoK3kqTe1bHptwmtKBMiM
	ijkh4TgvzmXheLt0lUY1cGruSL03g8J1LHYAdQnztEvVZvEmrm98ptLrnZYSnfeF2mHqcx8DRnmYv
	EgV/8PvzqFTNhQ6lFniSud3rDyCnZh068JKurv1ABs3kJ8ue4NpUK/mIOFSbucBzc7YTJ3blje7NI
	+7ZRJRQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN8WL-0000000DKyG-2C2j;
	Sat, 31 Oct 2026 12:49:17 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN8WJ-0000000DKwR-1o1S
	for opensbi@lists.infradead.org;
	Sat, 31 Oct 2026 12:49:16 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48e0d885929so1282804f8f.3
        for <opensbi@lists.infradead.org>; Sat, 31 Oct 2026 05:49:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793450953; cv=none;
        d=google.com; s=arc-20260327;
        b=qBKH9crKIA7zNIbQQVqOmznE7d+pvj3yPOFz/knIJ7HSZYZqczpct4sToE71Nwjis5
         ePLBTN1n4sYxXnZOAkTChx43Zi6j17GAGOJQ3ITtPXU0uN/WJe7KqtnB+WF07pSyZfIJ
         gjQWjl/Vx7A9iQ74GbEhEw41w8rzu8j+usKyFHqLqf57p2VyykeemRiBsm8lRYIN4EyX
         8jGddxgNcYFqVO8ORNSG3L6ZkklRaHslasJsi7LJ/iwOJzbl6AflWG7ld0McxV5QnZyS
         UAd9Xyy+gUujpwuv6DFjZC+iEs9pvum7+MYmdzKAUPqn6eZMotXU9XXEo00o8VmAT5dh
         Cn6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IYYE8G9s4TFh8K4Hv3h/7cWmgHjRu4F2GT/2fF+TCvM=;
        fh=s0V2QxfkZ31uI08A+gYD94xQ3QEn9NHnxJRAVF9iZzc=;
        b=VkEZqvQ9ZzdK7Xfku7TWQSocHt9X1zZppCLazqQJI3xWQjMBGaYi9Og2YfYhfFVa3V
         +xCFRnBSWEJBMSqZ+UNpFBlwSG4P4cqqKrV07D4Rg3bckPvo73/5j53BeOdmqH9zqQk5
         TkHbS2wKWFdXxmXpZUy9X70dU4nlSgR2NO0C5fRBWxcjRxu/vedIiWsHmLaU2fA5ug1T
         TKpNPIzq/SOjn1Nz6Lo2kC5lFNjlE/Fam8XL8BBvjUDYXcC6KFFet0QkgFUHvIhTdMdL
         Tvp0oI0Tni+YlLFESGtar8EQrTjMZfKFNIkVjMMUbbNL5A6dvR6jWt7rS45k56t9Pqz/
         VHBQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793450953; x=1794055753; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IYYE8G9s4TFh8K4Hv3h/7cWmgHjRu4F2GT/2fF+TCvM=;
        b=oZxqkNW57yo6Z15roF0IhW3ADKFuzB2cQpv0eWL4D8tfQVS6HrOPtinmFHETurQr3X
         96XoFbFJQcZvdtGbX1MHw0btAwVQuE9w0krozs/tkevEbj9IKjINjQCv3/FoZrlyuoKG
         c6eQfMgapJavnGID0MCN5ZYfd8mVE0cdngTKWPGZIr3J1XHe7f4JfymbgymMXIo9PU8v
         TgUv3P5q8ujZ8SMpzA7t0NwZOnKdAtfiekMZ4XgvHfvFOSOF4oWaS2/JHA1NdNG2/d1Z
         Whj0ZdyC9GTghebBPNwhi27SOEHPBBK5VdtSHDORPmQdbjI9b/qo4K31MQ3xiUQxh6fG
         Cehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793450953; x=1794055753;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IYYE8G9s4TFh8K4Hv3h/7cWmgHjRu4F2GT/2fF+TCvM=;
        b=VEwZCd2Sa+z3rV1uh3I9rLLltE09GyneirGMaULiwMVgid/3W5oXiGbRc6A6JBKXX7
         mfuHz+e3UN4xybRv35hOiwhe/We5ku6lOJg9klPboKI9jBhaCPHlsmoMM9SwkjU7kLZR
         VklGNj3wB/mat5f5WgXL4JbbR9TbeipVoc3mkrfGEjsk2JgJuecvoihLKAC59NTd6g0a
         WtMHDcYtrRNX5HN9Bu2LMWk9YrQZmNN9DbNkqVUaROOVzePbebEDxDqwMqXwoggh6nQk
         jFam8okWcQ/WTeMP6ntSasoykE4aA4LcH0viHB7zo1PxXXlEVjdq8b5lcmkoWUetDP2D
         W3Wg==
X-Gm-Message-State: AFq9FYLdO3xP0Lnp4s7ChwbC18Tb1tBj1kvY8zPvFuIOLa/f3a62e2DZ
	V26V1oTUQNbuXVfeIoQkxl45qyZYD9mUmvIC8dz0guB2sbUMeMaxqNKfps0yea1qSVPjJOtCPIJ
	jAVohgGwXftQV5dbu+ZDAgD+kobe6YPzUiejk9z8TnwI+vPVccPFO
X-Gm-Gg: AYBFou2g+Na+0X5Q9kZEf2dHOIEcfgA3PsgCnnENE6yNHilJxOlwjVfACj+xwyD1bKg
	woptv3Yv39iQEtl4RtxEwGym/ZI45GQF3Ne51jdML/jP2e1eujViS84aNCUuKczkfsToBFhLCSK
	8GMQkohTILJjRT7T6U6fI7+J0/ADnkgDeAqfMNKAwjNuilVRjsMQsDyH5T+00j/NBDdBdIXloh2
	VBncv+SJX9t1iC+JBTOOeA2n0NKenrsac9XHVgS1mM0qQ7Th9LSR2WHKAOlAA8R4C7lkg3wrQqP
	nJE7PchX6vynRLpOqm9bUqgh/tX51U7ZGtFCu7n3Lisqy5qfvotnhOprXW8JmjnswAdNLnqKqpJ
	RTe9BglcACAR5QKvrOjEPNoNofIsFRoA3eLphJJH12+tyP5N7MQwnh/w4yz1UGx3fIW1js+bhkm
	6CDjmkS9NSFgwVPcH1CJHhkLPRmsR7zDkkCttvrHzkfMXSWcL6cxab8xdH
X-Received: by 2002:a05:6000:46c3:b0:48e:f47:273c with SMTP id
 ffacd0b85a97d-48e6e2bcd97mr7903357f8f.8.1793450953482; Sat, 31 Oct 2026
 05:49:13 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030104518.3297875-1-peter.lin@sifive.com> <20261030104518.3297875-4-peter.lin@sifive.com>
In-Reply-To: <20261030104518.3297875-4-peter.lin@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 31 Oct 2026 18:19:01 +0530
X-Gm-Features: AclHuK8X1OHCdVV-GhZFySDGTrW8JJHDiPEuzwUO4ryMYmKCUweiEPJD2J8HZ2g
Message-ID: <CAAhSdy1SV4_hib74L+hzBgBpJzBYGkdyqu=N=x1TQL496sFd6w@mail.gmail.com>
Subject: Re: [PATCH v4 3/9] lib: fdt_domain: parse domain WID properties
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, pawandeep.oza@oss.qualcomm.com, 
	rkrcmar@qti.qualcomm.com, raymond.mao@riscstar.com, robin.randhawa@sifive.com, 
	samuel.holland@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_054915_519342_3A6E1A9D 
X-CRM114-Status: GOOD (  27.17  )
X-Spam-Score: -2.1 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBPY3QgMzAsIDIwMjYgYXQgNDoxNeKAr1BNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gQWRkIHdpZCBhbmQgd2lkZGVsZWcgZmllbGRz
IHRvIHN0cnVjdCBzYmlfZG9tYWluIHRvIHN0b3JlIHRoZQo+IFJJU0MtViBXb3JsZHMgbWx3aWQg
YW5kIG13aWRkZWxlZyBDU1IgdmFsdWVzIGZvciBlYWNoIGRvbWFpbi4KPiBBbHNvLCBwYXJzZSB0
aGUgcm9vdCBhbmQgdXNlci1kZWZpbmVkIGRvbWFpbnMnIFdJRCBkdXJpbmcKPiBmZHRfZG9tYWlu
c19wb3B1bGF0ZSgpLgo+Cj4gVGhlIHJvb3QgZG9tYWluIFdJRCBpcyBkZXNjcmliZWQgaW4gdGhl
ICJyb290IiBzdWJub2RlLCB3aGljaAo+IGNhcnJpZXMgdGhlICJvcGVuc2JpLGRvbWFpbixpbnN0
YW5jZSIgY29tcGF0aWJsZSBzdHJpbmcuIFNraXAKPiB0aGlzIG5vZGUgaW4gZmR0X2l0ZXJhdGVf
ZWFjaF9kb21haW4oKSBzbyB0aGF0IGl0IGlzIG5vdAo+IHRyZWF0ZWQgYXMgYSByZWd1bGFyIGRv
bWFpbiBpbnN0YW5jZS4KPgo+IFdoZW4gU21sd2lkIGlzIGltcGxlbWVudGVkLCB0aGUgIndpZCIg
cHJvcGVydHkgaXMgbWFuZGF0b3J5Cj4gZm9yIGFsbCBkb21haW5zOyBmYWlsIGRvbWFpbiBwb3B1
bGF0aW9uIGlmIGl0IGlzIG1pc3NpbmcuCj4KPiBTaWduZWQtb2ZmLWJ5OiBZdS1DaGllbiBQZXRl
ciBMaW4gPHBldGVyLmxpbkBzaWZpdmUuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBh
dGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKVGhhbmtzLApBbnVwCgoKPiAtLS0KPiBDaGFuZ2Ug
djMtPnY0Ogo+IC0gU2tpcCB0aGUgInJvb3QiIG5vZGUgaW4gZmR0X2l0ZXJhdGVfZWFjaF9kb21h
aW4oKSBzbyBpdCBpcyBub3QKPiAgIHRyZWF0ZWQgYXMgYSByZWd1bGFyIGRvbWFpbiBpbnN0YW5j
ZSAoc3VnZ2VzdGVkIGJ5IEFudXApLgo+IC0gRHJvcCBSQi10YWcgZnJvbSBPemEKPiAtLS0KPiAg
aW5jbHVkZS9zYmkvc2JpX2RvbWFpbi5oICAgfCAgNiArKysKPiAgbGliL3NiaS9zYmlfZG9tYWlu
LmMgICAgICAgfCAgMiArCj4gIGxpYi91dGlscy9mZHQvZmR0X2RvbWFpbi5jIHwgODcgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCA5NSBp
bnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zYmkvc2JpX2RvbWFpbi5oIGIv
aW5jbHVkZS9zYmkvc2JpX2RvbWFpbi5oCj4gaW5kZXggNTZhMjEzOTcuLjVhMjkxZDFmIDEwMDY0
NAo+IC0tLSBhL2luY2x1ZGUvc2JpL3NiaV9kb21haW4uaAo+ICsrKyBiL2luY2x1ZGUvc2JpL3Ni
aV9kb21haW4uaAo+IEBAIC0xOSw2ICsxOSw4IEBACj4KPiAgc3RydWN0IHNiaV9zY3JhdGNoOwo+
Cj4gKyNkZWZpbmUgSU5WQUxJRF9XSUQgICAgKCh1bnNpZ25lZCBpbnQpfjBVKQo+ICsKPiAgLyoq
IERvbWFpbiBhY2Nlc3MgdHlwZXMgKi8KPiAgZW51bSBzYmlfZG9tYWluX2FjY2VzcyB7Cj4gICAg
ICAgICBTQklfRE9NQUlOX1JFQUQgPSAoMVVMIDw8IDApLAo+IEBAIC0yMTgsNiArMjIwLDEwIEBA
IHN0cnVjdCBzYmlfZG9tYWluIHsKPiAgICAgICAgIGJvb2wgc3lzdGVtX3Jlc2V0X2FsbG93ZWQ7
Cj4gICAgICAgICAvKiogSXMgZG9tYWluIGFsbG93ZWQgdG8gc3VzcGVuZCB0aGUgc3lzdGVtICov
Cj4gICAgICAgICBib29sIHN5c3RlbV9zdXNwZW5kX2FsbG93ZWQ7Cj4gKyAgICAgICAvKiogV29y
bGQgSUQgZm9yIHRoaXMgZG9tYWluIChtbHdpZCB2YWx1ZSkgKi8KPiArICAgICAgIHUzMiB3aWQ7
Cj4gKyAgICAgICAvKiogV29ybGQgSUQgZGVsZWdhdGlvbiBiaXRtYXNrIGZvciB0aGlzIGRvbWFp
biAobXdpZGRlbGVnIHZhbHVlKSAqLwo+ICsgICAgICAgdTY0IHdpZGRlbGVnOwo+ICAgICAgICAg
LyoqIElkZW50aWZpZXMgd2hldGhlciB0byBpbmNsdWRlIHRoZSBmaXJtd2FyZSByZWdpb24gKi8K
PiAgICAgICAgIGJvb2wgZndfcmVnaW9uX2luaXRlZDsKPiAgfTsKPiBkaWZmIC0tZ2l0IGEvbGli
L3NiaS9zYmlfZG9tYWluLmMgYi9saWIvc2JpL3NiaV9kb21haW4uYwo+IGluZGV4IDQyZmU1NjMy
Li5iZTkwMjBkMCAxMDA2NDQKPiAtLS0gYS9saWIvc2JpL3NiaV9kb21haW4uYwo+ICsrKyBiL2xp
Yi9zYmkvc2JpX2RvbWFpbi5jCj4gQEAgLTMwLDYgKzMwLDggQEAgc3RydWN0IHNiaV9kb21haW4g
cm9vdCA9IHsKPiAgICAgICAgIC5wb3NzaWJsZV9oYXJ0cyA9IE5VTEwsCj4gICAgICAgICAuc3lz
dGVtX3Jlc2V0X2FsbG93ZWQgPSB0cnVlLAo+ICAgICAgICAgLnN5c3RlbV9zdXNwZW5kX2FsbG93
ZWQgPSB0cnVlLAo+ICsgICAgICAgLndpZCA9IElOVkFMSURfV0lELAo+ICsgICAgICAgLndpZGRl
bGVnID0gMCwKPiAgICAgICAgIC5md19yZWdpb25faW5pdGVkID0gZmFsc2UsCj4gIH07Cj4KPiBk
aWZmIC0tZ2l0IGEvbGliL3V0aWxzL2ZkdC9mZHRfZG9tYWluLmMgYi9saWIvdXRpbHMvZmR0L2Zk
dF9kb21haW4uYwo+IGluZGV4IGU0Y2NlOGMzLi5hMmJjMDAyZSAxMDA2NDQKPiAtLS0gYS9saWIv
dXRpbHMvZmR0L2ZkdF9kb21haW4uYwo+ICsrKyBiL2xpYi91dGlscy9mZHQvZmR0X2RvbWFpbi5j
Cj4gQEAgLTEzLDYgKzEzLDcgQEAKPiAgI2luY2x1ZGUgPHNiaS9zYmlfY29uc29sZS5oPgo+ICAj
aW5jbHVkZSA8c2JpL3NiaV9kb21haW4uaD4KPiAgI2luY2x1ZGUgPHNiaS9zYmlfZXJyb3IuaD4K
PiArI2luY2x1ZGUgPHNiaS9zYmlfaGFydC5oPgo+ICAjaW5jbHVkZSA8c2JpL3NiaV9oYXJ0bWFz
ay5oPgo+ICAjaW5jbHVkZSA8c2JpL3NiaV9oZWFwLmg+Cj4gICNpbmNsdWRlIDxzYmkvc2JpX3Nj
cmF0Y2guaD4KPiBAQCAtMzcsNiArMzgsOSBAQCBpbnQgZmR0X2l0ZXJhdGVfZWFjaF9kb21haW4o
dm9pZCAqZmR0LCB2b2lkICpvcGFxdWUsCj4gICAgICAgICAgICAgICAgIHJldHVybiAwOwo+Cj4g
ICAgICAgICBmZHRfZm9yX2VhY2hfc3Vibm9kZShkb2Zmc2V0LCBmZHQsIHBvZmZzZXQpIHsKPiAr
ICAgICAgICAgICAgICAgaWYgKCFzdHJjbXAoZmR0X2dldF9uYW1lKGZkdCwgZG9mZnNldCwgTlVM
TCksICJyb290IikpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gKwo+ICAg
ICAgICAgICAgICAgICBpZiAoZmR0X25vZGVfY2hlY2tfY29tcGF0aWJsZShmZHQsIGRvZmZzZXQs
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJvcGVuc2Jp
LGRvbWFpbixpbnN0YW5jZSIpKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+
IEBAIC0yOTAsNiArMjk0LDQyIEBAIHN0YXRpYyBpbnQgX19mZHRfcGFyc2VfcmVnaW9uKGNvbnN0
IHZvaWQgKmZkdCwgaW50IGRvbWFpbl9vZmZzZXQsCj4gICAgICAgICByZXR1cm4gMDsKPiAgfQo+
Cj4gK3N0YXRpYyB2b2lkIGZkdF9wYXJzZV9kb21haW5fd2lkX3Byb3BzKGNvbnN0IHZvaWQgKmZk
dCwgaW50IG9mZnNldCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
dHJ1Y3Qgc2JpX2RvbWFpbiAqZG9tKQo+ICt7Cj4gKyAgICAgICBjb25zdCBmZHQzMl90ICp2YWw7
Cj4gKyAgICAgICBpbnQgbGVuOwo+ICsgICAgICAgdTY0IHZhbDY0Owo+ICsKPiArICAgICAgIHZh
bCA9IGZkdF9nZXRwcm9wKGZkdCwgb2Zmc2V0LCAid2lkIiwgJmxlbik7Cj4gKyAgICAgICBpZiAo
dmFsICYmIGxlbiA9PSBzaXplb2YoZmR0MzJfdCkpIHsKPiArICAgICAgICAgICAgICAgZG9tLT53
aWQgPSBmZHQzMl90b19jcHUodmFsWzBdKTsKPiArICAgICAgIH0KPiArCj4gKyAgICAgICB2YWwg
PSBmZHRfZ2V0cHJvcChmZHQsIG9mZnNldCwgIndpZGRlbGVnIiwgJmxlbik7Cj4gKyAgICAgICBp
ZiAodmFsICYmIChsZW4gPT0gKDIgKiBzaXplb2YoZmR0MzJfdCkpKSkgewo+ICsgICAgICAgICAg
ICAgICB2YWw2NCA9IGZkdDMyX3RvX2NwdSh2YWxbMF0pOwo+ICsgICAgICAgICAgICAgICB2YWw2
NCA9ICh2YWw2NCA8PCAzMikgfCBmZHQzMl90b19jcHUodmFsWzFdKTsKPiArICAgICAgICAgICAg
ICAgZG9tLT53aWRkZWxlZyA9IHZhbDY0Owo+ICsgICAgICAgfQo+ICt9Cj4gKwo+ICtzdGF0aWMg
aW50IHZhbGlkYXRlX2RvbWFpbl93aWQoY29uc3Qgc3RydWN0IHNiaV9kb21haW4gKmRvbSkKPiAr
ewo+ICsgICAgICAgaWYgKGRvbS0+d2lkICE9IElOVkFMSURfV0lEKQo+ICsgICAgICAgICAgICAg
ICByZXR1cm4gMDsKPiArCj4gKyAgICAgICBpZiAoc2JpX2hhcnRfaGFzX2V4dGVuc2lvbihzYmlf
c2NyYXRjaF90aGlzaGFydF9wdHIoKSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFNCSV9IQVJUX0VYVF9TTUxXSUQpKSB7Cj4gKyAgICAgICAgICAgICAgIHNiaV9wcmludGYo
IiVzOiBkb21haW4gXCIlc1wiOiBtaXNzaW5nIFwid2lkXCIiCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgIiBwcm9wZXJ0eSAocmVxdWlyZWQgYnkgU21sd2lkKVxuIiwKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICBfX2Z1bmNfXywgZG9tLT5uYW1lKTsKPiArICAgICAgICAgICAgICAg
cmV0dXJuIFNCSV9FSU5WQUw7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgcmV0dXJuIDA7Cj4g
K30KPiArCj4gIHN0YXRpYyBpbnQgX19mZHRfcGFyc2VfZG9tYWluKGNvbnN0IHZvaWQgKmZkdCwg
aW50IGRvbWFpbl9vZmZzZXQsIHZvaWQgKm9wYXF1ZSkKPiAgewo+ICAgICAgICAgdTMyIHZhbDMy
Owo+IEBAIC0zMDYsNiArMzQ2LDcgQEAgc3RhdGljIGludCBfX2ZkdF9wYXJzZV9kb21haW4oY29u
c3Qgdm9pZCAqZmR0LCBpbnQgZG9tYWluX29mZnNldCwgdm9pZCAqb3BhcXVlKQo+ICAgICAgICAg
ZG9tID0gc2JpX3phbGxvYyhzaXplb2YoKmRvbSkpOwo+ICAgICAgICAgaWYgKCFkb20pCj4gICAg
ICAgICAgICAgICAgIHJldHVybiBTQklfRU5PTUVNOwo+ICsgICAgICAgZG9tLT53aWQgPSBJTlZB
TElEX1dJRDsKPgo+ICAgICAgICAgcHJlZy5kb20gPSBkb207Cj4gICAgICAgICBwcmVnLnJlZ2lv
bl9jb3VudCA9IDA7Cj4gQEAgLTQ0OSw2ICs0OTAsMTIgQEAgc3RhdGljIGludCBfX2ZkdF9wYXJz
ZV9kb21haW4oY29uc3Qgdm9pZCAqZmR0LCBpbnQgZG9tYWluX29mZnNldCwgdm9pZCAqb3BhcXVl
KQo+ICAgICAgICAgfQo+ICAgICAgICAgZG9tLT5uZXh0X21vZGUgPSB2YWwzMjsKPgo+ICsgICAg
ICAgLyogUmVhZCAid2lkIiBhbmQgIndpZGRlbGVnIiBEVCBwcm9wZXJ0aWVzICovCj4gKyAgICAg
ICBmZHRfcGFyc2VfZG9tYWluX3dpZF9wcm9wcyhmZHQsIGRvbWFpbl9vZmZzZXQsIGRvbSk7Cj4g
KyAgICAgICBlcnIgPSB2YWxpZGF0ZV9kb21haW5fd2lkKGRvbSk7Cj4gKyAgICAgICBpZiAoZXJy
KQo+ICsgICAgICAgICAgICAgICBnb3RvIGZhaWxfZnJlZV9hbGw7Cj4gKwo+ICAgICAgICAgLyog
UmVhZCAic3lzdGVtLXJlc2V0LWFsbG93ZWQiIERUIHByb3BlcnR5ICovCj4gICAgICAgICBpZiAo
ZmR0X2dldF9wcm9wZXJ0eShmZHQsIGRvbWFpbl9vZmZzZXQsCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAic3lzdGVtLXJlc2V0LWFsbG93ZWQiLCBOVUxMKSkKPiBAQCAtNDc3LDEyICs1
MjQsNTIgQEAgZmFpbF9mcmVlX2RvbWFpbjoKPiAgICAgICAgIHJldHVybiBlcnI7Cj4gIH0KPgo+
ICtzdGF0aWMgaW50IGZkdF9yb290X2RvbWFpbl9vZmZzZXQoY29uc3Qgdm9pZCAqZmR0KQo+ICt7
Cj4gKyAgICAgICBpbnQgb2Zmc2V0Owo+ICsKPiArICAgICAgIG9mZnNldCA9IGZkdF9wYXRoX29m
ZnNldChmZHQsICIvY2hvc2VuIik7Cj4gKyAgICAgICBpZiAob2Zmc2V0IDwgMCkKPiArICAgICAg
ICAgICAgICAgcmV0dXJuIG9mZnNldDsKPiArCj4gKyAgICAgICBvZmZzZXQgPSBmZHRfbm9kZV9v
ZmZzZXRfYnlfY29tcGF0aWJsZShmZHQsIG9mZnNldCwKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICJvcGVuc2JpLGRvbWFpbixjb25maWciKTsKPiArICAg
ICAgIGlmIChvZmZzZXQgPCAwKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gb2Zmc2V0Owo+ICsK
PiArICAgICAgIHJldHVybiBmZHRfc3Vibm9kZV9vZmZzZXQoZmR0LCBvZmZzZXQsICJyb290Iik7
Cj4gK30KPiArCj4gK3N0YXRpYyBpbnQgZmR0X3BhcnNlX3Jvb3RfZG9tYWluKGNvbnN0IHZvaWQg
KmZkdCkKPiArewo+ICsgICAgICAgaW50IG9mZnNldDsKPiArCj4gKyAgICAgICBpZiAoZmR0KSB7
Cj4gKyAgICAgICAgICAgICAgIG9mZnNldCA9IGZkdF9yb290X2RvbWFpbl9vZmZzZXQoZmR0KTsK
PiArICAgICAgICAgICAgICAgaWYgKG9mZnNldCA+PSAwKQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGZkdF9wYXJzZV9kb21haW5fd2lkX3Byb3BzKGZkdCwgb2Zmc2V0LCAmcm9vdCk7Cj4gKyAg
ICAgICB9Cj4gKwo+ICsgICAgICAgLyoKPiArICAgICAgICAqIEVuc3VyZSByb290IGRvbWFpbiBo
YXMgYSB2YWxpZCBXSUQKPiArICAgICAgICAqIGV2ZW4gaWYgRkRUIG9yIHJvb3Qgc3Vibm9kZSBp
cyBhYnNlbnQKPiArICAgICAgICAqLwo+ICsgICAgICAgcmV0dXJuIHZhbGlkYXRlX2RvbWFpbl93
aWQoJnJvb3QpOwo+ICt9Cj4gKwo+ICBpbnQgZmR0X2RvbWFpbnNfcG9wdWxhdGUoY29uc3Qgdm9p
ZCAqZmR0KQo+ICB7Cj4gKyAgICAgICBpbnQgZXJyOwo+ICsKPiAgICAgICAgIC8qIFNhbml0eSBj
aGVja3MgKi8KPiAgICAgICAgIGlmICghZmR0KQo+ICAgICAgICAgICAgICAgICByZXR1cm4gU0JJ
X0VJTlZBTDsKPgo+ICsgICAgICAgLyogUGFyc2Ugcm9vdCBkb21haW4gY29uZmlnIGZyb20gInJv
b3QiIHN1Ym5vZGUgKi8KPiArICAgICAgIGVyciA9IGZkdF9wYXJzZV9yb290X2RvbWFpbihmZHQp
Owo+ICsgICAgICAgaWYgKGVycikKPiArICAgICAgICAgICAgICAgcmV0dXJuIGVycjsKPiArCj4g
ICAgICAgICAvKiBJdGVyYXRlIG92ZXIgZWFjaCBkb21haW4gaW4gRkRUIGFuZCBwb3B1bGF0ZSBk
ZXRhaWxzICovCj4gICAgICAgICByZXR1cm4gZmR0X2l0ZXJhdGVfZWFjaF9kb21haW5fcm8oZmR0
LCBOVUxMLCBfX2ZkdF9wYXJzZV9kb21haW4pOwo+ICB9Cj4gLS0KPiAyLjQzLjcKPgoKLS0gCm9w
ZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
