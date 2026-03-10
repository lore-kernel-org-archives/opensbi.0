Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E44FCC9C4
	for <opensbi@archiver.kernel.org>; Tue, 10 Mar 2026 05:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qp/bnJdtMffwwF7sIzTbBRKOBVkrt0AYv/BhME/13o0=; b=QUMoMzZeBX4hRO
	vV/vzMSubCCQ5W58oN7X5IZc+sIWNjGgAYwPybKOWvt0jIoDQZqPviRuWFJOIrsidOZqCZy7/7BUY
	IxDfE1qDWf2/wu971B19308SIuvaRalUl6kXN1bv0PAieDQMo5ViAB77g1ZVG/5AQCZN256i4RMw/
	rNNhtvVUT1rBUxhb8o5GFas1QootWUhgrI6L/Xl4PiC95md9p/JInFygU3xUv+e/hUFp4wuToV6zQ
	8zpKQ3TAIZ5k7blU3r1nSM5iewtLxbsU7KQLP5yWLaiGuLNn9poNl5pl0H6tJkwolsiXlck9Ax/BK
	73xUCs9mYuNaPUjcum1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzpWE-00000008js8-0QXI;
	Tue, 10 Mar 2026 05:20:34 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzpWB-00000008jrl-0Twx
	for opensbi@lists.infradead.org;
	Tue, 10 Mar 2026 05:20:32 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-7d74c1157a4so1618923a34.1
        for <opensbi@lists.infradead.org>; Mon, 09 Mar 2026 22:20:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773120030; cv=none;
        d=google.com; s=arc-20240605;
        b=kTrZiTeREsHuxW4MnB+AEqtHl24e5BQfXkkpABX+6P06V2KGBcYOUDZmnWSHlozH79
         Vs6m9w9dyc1i84jai1q5G4n8uUToeuOm+dtBSUyVk1D82kRc8r4OJg6x5RbVAEt+85Iz
         e/s/RWd4KVG/xE9RHtCEi1+1YVR85jdTlqIhGzJsxxpL/DsaOGdlF7/kdzfaAkV0WAog
         xXnbLL+rtHvUKdYsU6V119GEjU10TNq8cVGOWwU3eiWg9awKYRUDbAvHPM5fYqWkcTCz
         XVppK9Hf5A9pTrvVJ2QejLU5oU1GYpeUOuTDZIC9tjsxMqPe/D8fIGOKiq15GI2Ri2Ar
         GpLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xmWHOaqi204GEJbP+y6eRbRB9od+gJznq41v9uEmWLY=;
        fh=u/8hqMWk+hOgQtL13cajmaqvQ3O3H9qzXfXfkaJenEM=;
        b=OwlKPpoSxjTjlp8k4Y22p/gllj5FBz/KW+bEC6JCaUG3SVkmfA3xcNQbDZ9dQ0OuhG
         QGNBpig81uh2IMWK/z0RlyCeNBUGehcsd2z1YH6CSVEWeE8QwAvurvxhJfIEgWhxluVN
         GEWvkASZV/OA8dkommYvE9SfIjCIsc1cBjs5kHZvlvx16Bi0aGi1HZHewI2dBGD6QqnB
         DV4LbTloGwjdrO1Vr1Oz9nyMSFeu+0iNYq9rG7M0lF2ErxndrsmNZl1FnsX8p998BWqc
         Pr3Ar0mkcy/fFkQK7jikYGp448zoiQqQqSeA+aeV9W/DPUaQU8M+gEjqxSMLpZd6ui5b
         Bfug==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1773120030; x=1773724830; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xmWHOaqi204GEJbP+y6eRbRB9od+gJznq41v9uEmWLY=;
        b=YHRy3QUHYs0nwkOaPe9fN/iLcCsTc9s1ubQpWZOKdBGypK6lHpHXarZpuXq+g9mlEy
         Ncdj2gr+xvlLf0oDrs3pU4yKs6XJQZedB00B4KPGaHGC2v10ZIUiG0hFZw3395Eu0bNy
         X+dvd3Eg6TmjyktpJhaL7pKPFzcbF+YSMU6GSoyo26AWggAK/FvD+x43CzNuBCvcAa6a
         MsyxaUPWZq2M78MUuvPP5wJq59BsYubfKXna99qxafgUvlbycQ/NqQbpbOA55jxcxx0Y
         b4OPSKuPtSyvDo2k27YmlLiL5mpbJn2LYBrX6j9Rj8qxKwgTcvvNIuM5nSQntzbvYY8u
         KjzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773120030; x=1773724830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xmWHOaqi204GEJbP+y6eRbRB9od+gJznq41v9uEmWLY=;
        b=e7FKqCNoz5xp03+6EP3n2TIA7FICK0AdzTw1UajrxYq3oDHijtpf8JbDWpKYde2w+K
         EIF7VXQhb1qbiNTqfvDg0CEhQhq/7vBEecBo+OCFSaulApbNxnG7nUyPShl64jEOtTGu
         Bk4iJYRphcx3psBlUFsjPbFdOu4plRVm83WVc6jGjv1mMPLDAowrMJ3NKfJgg5JHHolP
         Nt6F20sgOEDdJrrq5NQDd7HzdHl/bvjOy56JvrOlb8pdGbklc7FFd55AX3rUTAq0Kl2K
         GZnrKC96OchxppjdiB1F/+VNd+EFXcXl1hq+rhxsV/Z3AzrNgIydLYxJvBisiOcWCx0v
         SMiw==
X-Gm-Message-State: AOJu0Ywo0rsxbLJKcEIwDxWQZDeContCDM4l8ymmM42DFYQ1p341Bzk2
	rkdtrK9JXsHcwzErFNz+El20qSP9WbrGcDFhFqxW4/dhMQ3ZNSFt6Fviqz6CbXEWLLv7/qLHinD
	3dYADTcw5m+NPEttnItLsAH8/PJEMGQAzCDLV8HMtr8okgygJopChc9A=
X-Gm-Gg: ATEYQzxR2VPqcS6Qx1dFbluRrYvj0qJR5sCGjkTyDmCcO02ScMc5/tOX1N/AvzrSsBM
	LYJMnLZy6Jyi2vJePdzmFceAH+P5e9ERMnWRprkXVR60A9TGixewm2IhPcNLeffSAhMN1StCpct
	ALNv/eMh+DQzJP/EKvLPPx8qYl7xxkTC7Uz5HB5wK1bZPmrgipAUZPde9Lbt3Ohf7HZ1K+KJE1n
	oDqhqB1UYYo33+3yPYLFEPLAswxjXS7tFUC6dN6lFdxZMOLhFuWG614dmiy9s973rjze0G61xsN
	Iw1UoWFPZiNJXWAEW3WTCPmCyJAEhzTdFE2KE1KEm4zgiDKpEdmRnYXqsUhhnaGrz04MKE0J1UR
	IvVhXV/PGPJRlHLnFSytfSypTPSYmeOwiZdwS
X-Received: by 2002:a05:6820:4dc8:b0:67a:61f:646b with SMTP id
 006d021491bc7-67b9bd78acamr7874301eaf.74.1773120029705; Mon, 09 Mar 2026
 22:20:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260301205421.2074835-1-martialonso11@gmail.com>
In-Reply-To: <20260301205421.2074835-1-martialonso11@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 10 Mar 2026 10:50:18 +0530
X-Gm-Features: AaiRm51NcdG4u4iWU2mGHN56-OtWOQtgSE1rhBNrTUtDRwZo5DehHIOOXWbZhKY
Message-ID: <CAAhSdy0-4uA2cNX+FefgCKpFP8nkVoHCCA4kFNXECbCApF1rng@mail.gmail.com>
Subject: Re: [PATCH] lib: Use proper add opcode on RV32 with Zalrsc
To: Marti Alonso <martialonso11@gmail.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_222031_319481_CEF8989F 
X-CRM114-Status: GOOD (  15.23  )
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

T24gTW9uLCBNYXIgMiwgMjAyNiBhdCAyOjI14oCvQU0gTWFydGkgQWxvbnNvIDxtYXJ0aWFsb25z
bzExQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGUgYWRkdyBvcGNvZGUgaXMgb25seSBkZWZpbmVk
IGluIFJWNjQsIHdoaWNoIHByb2R1Y2VzIDMyLWJpdCByZXN1bHRzLgo+IE9uIFJWMzIsIHRoZSBk
ZWZhdWx0IGFkZCBvcGNvZGUgYWxyZWFkeSBwcm9kdWNlcyAzMi1iaXQgcmVzdWx0cy4KPgo+IEZp
eGVzOiA5OTVmMjI2ZjNmMzMgKCJsaWI6IEVtaXQgbHIgYW5kIHNjIGluc3RydWN0aW9ucyBiYXNl
ZCBvbiAtbWFyY2ggZmxhZ3MiKQo+IFNpZ25lZC1vZmYtYnk6IE1hcnRpIEFsb25zbyA8bWFydGlh
bG9uc28xMUBnbWFpbC5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBA
YnJhaW5mYXVsdC5vcmc+CgpBcHBsaWVkIHRoaXMgcGF0Y2ggdG8gdGhlIHJpc2N2L29wZW5zYmkg
cmVwby4KClRoYW5rcywKQW51cAoKPiAtLS0KPiAgZmlybXdhcmUvcGF5bG9hZHMvdGVzdF9oZWFk
LlMgfCAzICsrLQo+ICBsaWIvc2JpL3Jpc2N2X2F0b21pYy5jICAgICAgICB8IDIgKy0KPiAgbGli
L3NiaS9yaXNjdl9sb2Nrcy5jICAgICAgICAgfCA0ICsrKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZmlybXdhcmUv
cGF5bG9hZHMvdGVzdF9oZWFkLlMgYi9maXJtd2FyZS9wYXlsb2Fkcy90ZXN0X2hlYWQuUwo+IGlu
ZGV4IDlhODdlNTZmY2Y1ZC4uZTRmY2FhY2E5MmM5IDEwMDY0NAo+IC0tLSBhL2Zpcm13YXJlL3Bh
eWxvYWRzL3Rlc3RfaGVhZC5TCj4gKysrIGIvZmlybXdhcmUvcGF5bG9hZHMvdGVzdF9oZWFkLlMK
PiBAQCAtMjIsNiArMjIsNyBAQAo+Cj4gICNkZWZpbmUgUkVHX0wgICAgICAgICAgX19SRUdfU0VM
KGxkLCBsdykKPiAgI2RlZmluZSBSRUdfUyAgICAgICAgICBfX1JFR19TRUwoc2QsIHN3KQo+ICsj
ZGVmaW5lIFJFR19BRERXICAgICAgIF9fUkVHX1NFTChhZGR3LCBhZGQpCj4KPiAgICAgICAgIC5z
ZWN0aW9uIC5lbnRyeSwgImF4IiwgJXByb2diaXRzCj4gICAgICAgICAuYWxpZ24gMwo+IEBAIC0z
NSw3ICszNiw3IEBAIF9zdGFydDoKPiAgI2VsaWYgZGVmaW5lZChfX3Jpc2N2X3phbHJzYykKPiAg
X3NjX2ZhaWw6Cj4gICAgICAgICBsci53ICAgIHQwLCAoYTMpCj4gLSAgICAgICBhZGR3ICAgIHQx
LCB0MCwgYTIKPiArICAgICAgIFJFR19BRERXIHQxLCB0MCwgYTIKPiAgICAgICAgIHNjLncgICAg
dDEsIHQxLCAoYTMpCj4gICAgICAgICBibmV6ICAgIHQxLCBfc2NfZmFpbAo+ICAgICAgICAgbW92
ZSAgICBhMywgdDAKPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9yaXNjdl9hdG9taWMuYyBiL2xpYi9z
YmkvcmlzY3ZfYXRvbWljLmMKPiBpbmRleCBmY2YwN2YyNzMxNDkuLmQ5YWJlMzQzY2IyNiAxMDA2
NDQKPiAtLS0gYS9saWIvc2JpL3Jpc2N2X2F0b21pYy5jCj4gKysrIGIvbGliL3NiaS9yaXNjdl9h
dG9taWMuYwo+IEBAIC00OCw3ICs0OCw3IEBAIGxvbmcgYXRvbWljX2FkZF9yZXR1cm4oYXRvbWlj
X3QgKmF0b20sIGxvbmcgdmFsdWUpCj4gICAgICAgICBsb25nIHJldCwgdGVtcDsKPiAgI2lmIF9f
U0laRU9GX0xPTkdfXyA9PSA0Cj4gICAgICAgICBfX2FzbV9fIF9fdm9sYXRpbGVfXygiMTpsci53
LmFxcmwgICAgICAgJTEsJTBcbiIKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICIgIGFk
ZHcgICAgJTIsJTEsJTNcbiIKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICIgIGFkZCAg
ICAgJTIsJTEsJTNcbiIKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICIgIHNjLncuYXFy
bCAgICAgICAlMiwlMiwlMFxuIgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIiAgYm5l
eiAgICAlMiwxYiIKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDogIitBIihhdG9tLT5j
b3VudGVyKSwgIj0mciIocmV0KSwgIj0mciIodGVtcCkKPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9y
aXNjdl9sb2Nrcy5jIGIvbGliL3NiaS9yaXNjdl9sb2Nrcy5jCj4gaW5kZXggYzI5YTk2NTkwN2Jk
Li5lMjUzYjFiNzIzYWIgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9yaXNjdl9sb2Nrcy5jCj4gKysr
IGIvbGliL3NiaS9yaXNjdl9sb2Nrcy5jCj4gQEAgLTU3LDcgKzU3LDExIEBAIHZvaWQgc3Bpbl9s
b2NrKHNwaW5sb2NrX3QgKmxvY2spCj4gICAgICAgICAgICAgICAgICIgICAgICAgYW1vYWRkLncu
YXFybCAgICUwLCAlNCwgJTNcbiIKPiAgI2VsaWYgZGVmaW5lZChfX3Jpc2N2X3phbHJzYykKPiAg
ICAgICAgICAgICAgICAgIjM6ICAgICBsci53LmFxcmwgICAgICAgJTAsICUzXG4iCj4gKyNpZiBf
X3Jpc2N2X3hsZW4gPT0gNjQKPiAgICAgICAgICAgICAgICAgIiAgICAgICBhZGR3ICAgICUxLCAl
MCwgJTRcbiIKPiArI2VsaWYgX19yaXNjdl94bGVuID09IDMyCj4gKyAgICAgICAgICAgICAgICIg
ICAgICAgYWRkICAgICAlMSwgJTAsICU0XG4iCj4gKyNlbmRpZgo+ICAgICAgICAgICAgICAgICAi
ICAgICAgIHNjLncuYXFybCAgICAgICAlMSwgJTEsICUzXG4iCj4gICAgICAgICAgICAgICAgICIg
ICAgICAgYm5leiAgICAlMSwgM2JcbiIKPiAgI2Vsc2UKPiAtLQo+IDIuNDMuMAo+Cj4KPiAtLQo+
IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCgotLSAKb3Bl
bnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
