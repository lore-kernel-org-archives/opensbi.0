Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F04EC3ABB2
	for <opensbi@archiver.kernel.org>; Wed, 28 May 2025 04:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WS94XpoKzxu+wx7bvI5d+HS9I9VtSxgWnwRBv3YsLHY=; b=Lqui8ybhEhRUsW
	3nIHgzz9ko33Fyc7/2XZ69Ehjku17zPCkts1JYNE00F+nme7GpwTNZlPL+ymFyPvWwjdHOP7PVIi6
	z5geaLGhL6yUQg4koVGqqUoihrKxixpjeUwTXk5Q2mMCPHG8nll86x/EYB+ERgL1fQWnkar0O4koU
	rLdxUtuLdL3dGl8nzwiKNfv6+Uu8IRB9r6/D6IETPWmINqaRIchEjQAbV8d9VCpJ7pLWT2lwUODB1
	yZg4yMorcBps0DdZRJ65XT1ltKa67W/pxQEsUGzytAhRG/JcJqy7KEW3GXnGI/RCLI4S8F/iob40j
	aW73/wvwqwYQlYhfOVlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK8Gc-0000000C89Q-1svx;
	Wed, 28 May 2025 04:19:50 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK8ES-0000000C7em-3V2o
	for opensbi@lists.infradead.org;
	Wed, 28 May 2025 04:17:38 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-4768f90bf36so34578831cf.0
        for <opensbi@lists.infradead.org>; Tue, 27 May 2025 21:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748405855; x=1749010655; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YXYIDuAG5wfjDu7mC14zHcT+5czVzA7ics2Qv6pWY2s=;
        b=gn4Eso++iUlYbspyzIcfOZ8anMtVhiAn4ZDrYkc4dlvhO333l5MbjL3Mj1ExHUFI+w
         g6zbTaNwFWe5xqdXYDfpXGFpH2vCzEsSqIuDO3eJi2Vk2h2MEQ34myC3L4aUlznB7D7M
         i4SHScI3P//M+EH9PTOcixm3cvZvnA+FSJIIhIHT4q4z1h8lmONrtNh7T2Q7OGwjYzgs
         kmgNZuC3DOAF0+C4wfvNROCX616GcCwxFd8l1WbrI38rU2EjlacQ0+aRerPvB7Z8I/j1
         4AlilEMMC/wJNmJXtpHKoV92etZqNc+BXiTM8cobL8tJAaCjFMSHGEbmNYjmXsX5mRMR
         7XCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748405855; x=1749010655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YXYIDuAG5wfjDu7mC14zHcT+5czVzA7ics2Qv6pWY2s=;
        b=Tm+Wm9VXFSHGLYW4O3jeNRQyve4/9imp8IK5Y6+hLJUBBZIjYQvpZiMSgOlgqdMF6X
         gZMcnpPgNx/b693DvkH2nKEBUH1uk7Uzh0W4H19j2n6m185I8k02f2FiwEa2/alUuufF
         XkCE5cmV0MQ3JNQf/2RSWlcupEWykVZf7dXeIwmZiOsVMbrIiWPvSwwPnWMpkWr2r38s
         b2nFl0vmGxy2aqe62Sa3OJ7R5Q4XumuAs3WUxT8Gv9w+rubDfWU2AGYwC599muyuf9Ik
         xDfHMaUl0B3wwX0H+ZH4lBNSzKwxhmM7mhchWYuJHA+X6EdixjSexDoJJSCR/MTGsZsu
         FRcg==
X-Forwarded-Encrypted: i=1; AJvYcCWxBZCvGAodGUgyZZ9aWSOp6mh6yGjtoSnovKRmLGhQbX74nCN14aijwfJV8W65Uboz8IEz2DwE@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5/iUhVsrDuMSH01M8TN7m5O5RCFbCC15pQs+OMWxBJA4Tv3WN
	7sekHr4qx+qRRE7aybIzksPbUXk/WGtk+fSXDNDmfvretUohL4GEZtyVxWDxJT15mBo0Ug//nR8
	0YJ+lZy99+Z+MdJmQD8z4PoB+BQrn65R1F0Sp3ppNsbn5CNvPM+JP
X-Gm-Gg: ASbGnctm8fNYI4j85lEL9fajAY+aNWHfO5Ee2gaqJ8xfmoYZy/G0ccnSDeDiCzrFIpv
	UR0nUf5c29+1khC5wDo9K5WCgUzJhcCdS/teJrYpdOFjAsxLUiXxXg4uZ8bvrDGiDVV+OZ+6T2q
	6LmWL/EhwvS5Yv2hw+M+cUAyPc8190L7QlX7ZL9d3lMUe3nO+n4nFlwRtQP0oYbw/mHA==
X-Google-Smtp-Source: AGHT+IGGHa4aeMS5G1WZkuQpUp+K8F5v/+gXgnFqMjhm1/BDl8fnubHZCscwM5pNP/GJM8KCi1Ds88bhMHNTcL+IRP4=
X-Received: by 2002:ac8:57c8:0:b0:4a2:719b:122e with SMTP id
 d75a77b69052e-4a2719b1290mr121603201cf.18.1748405855189; Tue, 27 May 2025
 21:17:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250527182713.527202-1-jesse@rivosinc.com> <aDZ_y3vX31nCLa30@ghost>
In-Reply-To: <aDZ_y3vX31nCLa30@ghost>
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Wed, 28 May 2025 09:47:20 +0530
X-Gm-Features: AX0GCFudHRDWCo6SPVcb4G72eTR8eyzHNICnv6VEVHV6DIipXbpbSiBojh_AuI8
Message-ID: <CAPd4WezB2yMpftQ8H_VsSHCvvJZTHuEqnQ+wyRwgHLqBRTNprw@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: dbtr: Fix shared memory layout
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Jesse Taube <jesse@rivosinc.com>, opensbi@lists.infradead.org, 
	Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_211736_871937_C9E5F5A5 
X-CRM114-Status: GOOD (  18.66  )
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

VGhhbmtzISBJIHdpbGwgdGFrZSBjYXJlIG9mIHRoYXQuCgpPbiBXZWQsIE1heSAyOCwgMjAyNSBh
dCA4OjQ14oCvQU0gQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4gd3JvdGU6
Cj4KPiBPbiBUdWUsIE1heSAyNywgMjAyNSBhdCAxMToyNzoxM0FNIC0wNzAwLCBKZXNzZSBUYXVi
ZSB3cm90ZToKPiA+IFRoZSBleGlzdGluZyBzYmlfZGJ0cl9zaG1lbV9lbnRyeSBoYXMgYSBzaXpl
IG9mIDUgKiBYTEVOIHdpdGggdGhlIGZpbmFsCj4gPiBlbnRyeSBiZWluZyBpZHguIFRoaXMgaXMg
aW4gY29udHJhc3QgdG8gdGhlIFNCSSB2My4wLXJjNyBDaGFwdGVyIDE5Lgo+ID4gRGVidWcgVHJp
Z2dlcnMgRXh0ZW5zaW9uIFswXSB3aGVyZSBpZHggYW5kIHRyaWdfc3RhdGUgc2hhcmUgdGhlIHNh
bWUKPiA+IG9mZnNldCAoMCkgaW4gc2hhcmVkIG1lbW9yeSwgd2l0aCBhIHRvdGFsIHNpemUgb2Yg
NCAqIFhMRU4gZm9yIGFsbCB0aGUKPiA+IFNCSSBjYWxscy4KPiA+Cj4gPiBBZGQgdW5pb24gdG8g
bWF0Y2ggbWVtb3J5IGxheW91dCBkZXNjcmliZWQgaW4gU0JJLgo+ID4KPiA+IFswXSBodHRwczov
L2dpdGh1Yi5jb20vcmlzY3Ytbm9uLWlzYS9yaXNjdi1zYmktZG9jL3RyZWUvdjMuMC1yYzcvc3Jj
L2V4dC1kZWJ1Zy10cmlnZ2Vycy5hZG9jCj4gPgo+ID4gRml4ZXM6IDk3ZjIzNGYxNWM5NiAoImxp
Yjogc2JpOiBJbnRyb2R1Y2UgdGhlIFNCSSBkZWJ1ZyB0cmlnZ2VycyBleHRlbnNpb24gc3VwcG9y
dCIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBKZXNzZSBUYXViZSA8amVzc2VAcml2b3NpbmMuY29tPgo+
Cj4gVGhhbmtzIQo+Cj4gVGhpcyB3aWxsIG5lZWQgdG8gYmUgcmVmbGVjdGVkIGluIHRoZSBsaW51
eCBwYXRjaCBhcyB3ZWxsLgo+Cj4gVGVzdGVkLWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVA
cml2b3NpbmMuY29tPgo+IFJldmlld2VkLWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2
b3NpbmMuY29tPgo+Cj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MDIyMjEy
NTA1OS4xMzMzMS0zLWhjaGF1aGFuQHZlbnRhbmFtaWNyby5jb20vCj4KPiA+IC0tLQo+ID4gIGlu
Y2x1ZGUvc2JpL3NiaV9kYnRyLmggfCA2ICsrKystLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUv
c2JpL3NiaV9kYnRyLmggYi9pbmNsdWRlL3NiaS9zYmlfZGJ0ci5oCj4gPiBpbmRleCBhOGIzYTAy
Li44Y2I3NzZjIDEwMDY0NAo+ID4gLS0tIGEvaW5jbHVkZS9zYmkvc2JpX2RidHIuaAo+ID4gKysr
IGIvaW5jbHVkZS9zYmkvc2JpX2RidHIuaAo+ID4gQEAgLTkxLDggKzkxLDEwIEBAIHN0cnVjdCBz
YmlfZGJ0cl9oYXJ0X3RyaWdnZXJzX3N0YXRlIHsKPiA+Cj4gPiAgLyoqIFNCSSBzaGFyZWQgbWVt
IG1lc3NhZ2VzIGxheW91dCAqLwo+ID4gIHN0cnVjdCBzYmlfZGJ0cl9zaG1lbV9lbnRyeSB7Cj4g
PiAtICAgICBzdHJ1Y3Qgc2JpX2RidHJfZGF0YV9tc2cgZGF0YTsKPiA+IC0gICAgIHN0cnVjdCBz
YmlfZGJ0cl9pZF9tc2cgaWQ7Cj4gPiArICAgICB1bmlvbiB7Cj4gPiArICAgICAgICAgICAgIHN0
cnVjdCBzYmlfZGJ0cl9kYXRhX21zZyBkYXRhOwo+ID4gKyAgICAgICAgICAgICBzdHJ1Y3Qgc2Jp
X2RidHJfaWRfbXNnIGlkOwo+ID4gKyAgICAgfTsKPiA+ICB9Owo+ID4KPiA+ICAjZGVmaW5lIFNC
SV9EQlRSX1NITUVNX0FMSUdOX01BU0sgICAgKChfX3Jpc2N2X3hsZW4gLyA4KSAtIDEpCj4gPiAt
LQo+ID4gMi40My4wCj4gPgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L29wZW5zYmkK
