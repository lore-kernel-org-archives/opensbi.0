Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B97BCA100B
	for <opensbi@archiver.kernel.org>; Wed,  3 Sep 2025 06:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GHXcCpF7Ss7MWZLVZkUaLCmcGGdXdCoCf6ABSIZhviw=; b=hCsZjY7rZazhPv
	9ZzX1sZ4s9lnwju/ROEJO5Ff2nuLyYLWxJe2vw9lpwBy59KxCZEhbN3J30cum4Tyz8qOH+ly/oSOS
	N8IOVnW+OwSfdvM8bU7lnhrdciPawH7muEGs5QSUCzRYWNZumYbnTmQ/6vCSZGasDS5w1iZ+Bz8nq
	L/VIYCNY8ZN9K1zdCUPwAK5hh7Gb+3Fdhrg0WYQNA18RBgWi9oNGMkQv3KnvIgpnqu2G1DTkU+Q9H
	+aZ63+5JJqQsLXalZ3BdBJp9r9/0BvqtTPtnPGasT6mYrliUbD7cJj7LSQBMY7ZIwB8ICQLHGXNo1
	Yxznn5n5jD7O/QWjTEdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uthML-00000004oMW-0E65;
	Wed, 03 Sep 2025 06:52:45 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uthKW-00000004ndU-20xE
	for opensbi@lists.infradead.org;
	Wed, 03 Sep 2025 06:50:53 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-55f76454f69so3164025e87.0
        for <opensbi@lists.infradead.org>; Tue, 02 Sep 2025 23:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1756882251; x=1757487051; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8BombTbkS5na9wimRFj+ue9DON+iiRQXcVB6PWImTs4=;
        b=iG90TT9uTiLSO+VyKiLv8zsRp7Ag/sMR+csiXvB3Uoz8CishBDzBwJDqUsctOwz98+
         zzFiR6XIfdzSpjzpT0J9v1fAYv+RO+jCgts+bQwXmdG2cSqY38sNwGC8KaC5L5zcPDP6
         4JOCwjSrD/ZDzAbFkDWkxDBuGoAUdroKX5V+eTeZYCah2MCDrNvc0lyLa4W2xJgKwQbC
         vQ0jMnRFFNfcWuoidytTAeu6njK0VLc8WDgneOuTGA6jEhQnEuS98wG3kknZbEZrUlg0
         KRITki9XJhA9hdvinILcWTZFe4FoRd7+bIyLVPuGSGo4Hfzo5WbLgoetgtGyF3aTatZX
         XGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756882251; x=1757487051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8BombTbkS5na9wimRFj+ue9DON+iiRQXcVB6PWImTs4=;
        b=JCES9oRzBCYvyO/1TdUsPcep4CCiHZkU7BErl7T/rIDMygN7dsEDfM8NxJVgzXfzGu
         lYr/GkflFDB1aOW0crNgMjsyrA2wOWjTUmeEIxjWmPVDx/L39z8/pbAKNr3MT9xPa16j
         RX93bnX93Fs7km/1jciQDaCqmZerZv4x9YHBjMTzMrkGk0nFkquEFIyZfW9n/rL0h+aW
         lzwPMSNHz4DXK5pJieb7t8SxqbhXxj2iUuLpUxmlY3Z3QUEFhVlvi9RuauH06No97IML
         LfiutAIoeSOwMx5M6t5cqv74Vm3gqNf8NQ6ATpV+Kdyd151snrhEUQpQFcMtzByQ8qTe
         pIJQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0opIkDVysjJj4mXwxTPBbzGbNlzi6v0Z7uPbqjPtBfa6CyOs3XKIoHjUttWOSxeH3GbhgIfti@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3ONp4lSWklNTF+tIj6oXZjFus7xqlI0XFag6pAxUcH9W7JmBO
	wjNeCPwecGbYpGU6W3QG7AeldwUhcR1aWFno+MEKAAZipb+dFRmIc0vw12XxHB88N8nZSVpQ0YT
	3NjiWLsgX8iw2qUkQWaTjIqfu+BT0pNWOinj/yWB6ew==
X-Gm-Gg: ASbGncts8K6csk6nX9Ocu3/2fwGKYXRaCrIqzDytGZAHQYAkDOIoHX14ZFDKnBEcg8P
	NVbony2f5Uj3XGQS441xPD5B5YePQ4do9wjM66GS56+POvh9FbuJwFgz+qadwuy1a7+0vs9ydtu
	NTX83yAVRgDXBCO6Rb7tOLrCmc9F/i/Yedf9LppA0qLCRlzA17iKgoW5sGr4rS/2zMdzFH5azSg
	FzVsOuE
X-Google-Smtp-Source: AGHT+IEMy+bBQhNUZ1kpeoILPUZaVY/s6Y2Qxu7iI6QMvXOXxqwVkUzzFi38iZ+oO+pY1x4ycC8JF+vjgAeh/q+scl8=
X-Received: by 2002:a05:6512:6410:b0:55f:6d38:cc9f with SMTP id
 2adb3069b0e04-55f708b6b7cmr4316405e87.17.1756882250760; Tue, 02 Sep 2025
 23:50:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250902121721.401933-1-apatel@ventanamicro.com>
 <20250902121721.401933-3-apatel@ventanamicro.com> <9f1737ef-53a9-4a11-93ca-52c7253f17b8@sifive.com>
In-Reply-To: <9f1737ef-53a9-4a11-93ca-52c7253f17b8@sifive.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 3 Sep 2025 12:20:38 +0530
X-Gm-Features: Ac12FXwbWHQn0Pbj0C-20IifaFCmTAEFICH_OLyugmMDdXXIkb6vBT3jcqZwQyA
Message-ID: <CAK9=C2XiQddsHxgi9CoPNbV_QUNv37vBTvj6v_w+yG1QCz9EMQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] include: sbi: Remove platform specific IPI init
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Atish Patra <atishp@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_235052_517695_3583859F 
X-CRM114-Status: GOOD (  23.89  )
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

T24gV2VkLCBTZXAgMywgMjAyNSBhdCA1OjE04oCvQU0gU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5o
b2xsYW5kQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gSGkgQW51cCwKPgo+IE9uIDIwMjUtMDktMDIg
NzoxNyBBTSwgQW51cCBQYXRlbCB3cm90ZToKPiA+IFRoZSBwbGF0Zm9ybSBzcGVjZmljIElQSSBp
bml0IGlzIG5vdCBuZWVkIGFueW1vcmUgYmVjYXVzZSB1c2luZwo+ID4gSVBJIGRldmljZSByYXRp
bmcgbXVsdGlwbGUgSVBJIGRldmljZXMgY2FuIGJlIHJlZ2lzdGVyZWQgaW4gYW55Cj4gPiBvcmRl
ciBhcyBwYXJ0IG9mIHRoZSBwbGF0Zm9ybSBzcGVjaWZpYyBlYXJseSBpbml0Lgo+ID4KPiA+IFNp
Z25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgo+ID4gLS0t
Cj4gPiAgaW5jbHVkZS9zYmkvc2JpX3BsYXRmb3JtLmggICAgICAgICAgICAgICB8IDE3IC0tLS0t
LS0tLS0tLS0tLS0tCj4gPiAgbGliL3NiaS9zYmlfaXBpLmMgICAgICAgICAgICAgICAgICAgICAg
ICB8ICA1IC0tLS0tCj4gPiAgcGxhdGZvcm0vZnBnYS9hcmlhbmUvcGxhdGZvcm0uYyAgICAgICAg
ICB8IDE1ICsrKysrKy0tLS0tLS0tLQo+ID4gIHBsYXRmb3JtL2dlbmVyaWMvb3Blbmh3Z3JvdXAv
b3BlbnBpdG9uLmMgfCAxMyArKysrLS0tLS0tLS0tCj4gPiAgcGxhdGZvcm0vZ2VuZXJpYy9wbGF0
Zm9ybS5jICAgICAgICAgICAgICB8ICA1ICsrKystCj4gPiAgcGxhdGZvcm0va2VuZHJ5dGUvazIx
MC9wbGF0Zm9ybS5jICAgICAgICB8IDEzICsrKysrKy0tLS0tLS0KPiA+ICBwbGF0Zm9ybS9udWNs
ZWkvdXg2MDAvcGxhdGZvcm0uYyAgICAgICAgIHwgMTEgKysrKystLS0tLS0KPiA+ICBwbGF0Zm9y
bS90ZW1wbGF0ZS9wbGF0Zm9ybS5jICAgICAgICAgICAgIHwgMTYgKysrKysrLS0tLS0tLS0tLQo+
ID4gIDggZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwgNjQgZGVsZXRpb25zKC0pCj4g
Pgo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3NiaV9wbGF0Zm9ybS5oIGIvaW5jbHVkZS9z
Ymkvc2JpX3BsYXRmb3JtLmgKPiA+IGluZGV4IGM2ZDMwMDgwLi5kNzVjMTJkZSAxMDA2NDQKPiA+
IC0tLSBhL2luY2x1ZGUvc2JpL3NiaV9wbGF0Zm9ybS5oCj4gPiArKysgYi9pbmNsdWRlL3NiaS9z
YmlfcGxhdGZvcm0uaAo+ID4gQEAgLTExNiw5ICsxMTYsNiBAQCBzdHJ1Y3Qgc2JpX3BsYXRmb3Jt
X29wZXJhdGlvbnMgewo+ID4gICAgICAgLyoqIEluaXRpYWxpemUgdGhlIHBsYXRmb3JtIGludGVy
cnVwdCBjb250cm9sbGVyIGR1cmluZyBjb2xkIGJvb3QgKi8KPiA+ICAgICAgIGludCAoKmlycWNo
aXBfaW5pdCkodm9pZCk7Cj4gPgo+ID4gLSAgICAgLyoqIEluaXRpYWxpemUgSVBJIGR1cmluZyBj
b2xkIGJvb3QgKi8KPiA+IC0gICAgIGludCAoKmlwaV9pbml0KSh2b2lkKTsKPiA+IC0KPiA+ICAg
ICAgIC8qKiBHZXQgdGxiIGZsdXNoIGxpbWl0IHZhbHVlICoqLwo+ID4gICAgICAgdTY0ICgqZ2V0
X3RsYnJfZmx1c2hfbGltaXQpKHZvaWQpOwo+ID4KPiA+IEBAIC01MjgsMjAgKzUyNSw2IEBAIHN0
YXRpYyBpbmxpbmUgaW50IHNiaV9wbGF0Zm9ybV9pcnFjaGlwX2luaXQoY29uc3Qgc3RydWN0IHNi
aV9wbGF0Zm9ybSAqcGxhdCkKPiA+ICAgICAgIHJldHVybiAwOwo+ID4gIH0KPiA+Cj4gPiAtLyoq
Cj4gPiAtICogSW5pdGlhbGl6ZSB0aGUgcGxhdGZvcm0gSVBJIHN1cHBvcnQgZHVyaW5nIGNvbGQg
Ym9vdAo+ID4gLSAqCj4gPiAtICogQHBhcmFtIHBsYXQgcG9pbnRlciB0byBzdHJ1Y3Qgc2JpX3Bs
YXRmb3JtCj4gPiAtICoKPiA+IC0gKiBAcmV0dXJuIDAgb24gc3VjY2VzcyBhbmQgbmVnYXRpdmUg
ZXJyb3IgY29kZSBvbiBmYWlsdXJlCj4gPiAtICovCj4gPiAtc3RhdGljIGlubGluZSBpbnQgc2Jp
X3BsYXRmb3JtX2lwaV9pbml0KGNvbnN0IHN0cnVjdCBzYmlfcGxhdGZvcm0gKnBsYXQpCj4gPiAt
ewo+ID4gLSAgICAgaWYgKHBsYXQgJiYgc2JpX3BsYXRmb3JtX29wcyhwbGF0KS0+aXBpX2luaXQp
Cj4gPiAtICAgICAgICAgICAgIHJldHVybiBzYmlfcGxhdGZvcm1fb3BzKHBsYXQpLT5pcGlfaW5p
dCgpOwo+ID4gLSAgICAgcmV0dXJuIDA7Cj4gPiAtfQo+ID4gLQo+ID4gIC8qKgo+ID4gICAqIElu
aXRpYWxpemUgdGhlIHBsYXRmb3JtIHRpbWVyIGR1cmluZyBjb2xkIGJvb3QKPiA+ICAgKgo+ID4g
ZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX2lwaS5jIGIvbGliL3NiaS9zYmlfaXBpLmMKPiA+IGlu
ZGV4IGI1N2VjNjUyLi5jOWY1ZDFkMSAxMDA2NDQKPiA+IC0tLSBhL2xpYi9zYmkvc2JpX2lwaS5j
Cj4gPiArKysgYi9saWIvc2JpL3NiaV9pcGkuYwo+ID4gQEAgLTM0MiwxMSArMzQyLDYgQEAgaW50
IHNiaV9pcGlfaW5pdChzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gsIGJvb2wgY29sZF9ib290
KQo+ID4gICAgICAgICAgICAgICBpZiAocmV0IDwgMCkKPiA+ICAgICAgICAgICAgICAgICAgICAg
ICByZXR1cm4gcmV0Owo+ID4gICAgICAgICAgICAgICBpcGlfaGFsdF9ldmVudCA9IHJldDsKPiA+
IC0KPiA+IC0gICAgICAgICAgICAgLyogSW5pdGlhbGl6ZSBwbGF0Zm9ybSBJUEkgc3VwcG9ydCAq
Lwo+ID4gLSAgICAgICAgICAgICByZXQgPSBzYmlfcGxhdGZvcm1faXBpX2luaXQoc2JpX3BsYXRm
b3JtX3B0cihzY3JhdGNoKSk7Cj4gPiAtICAgICAgICAgICAgIGlmIChyZXQpCj4gPiAtICAgICAg
ICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+ICAgICAgIH0gZWxzZSB7Cj4gPiAgICAgICAg
ICAgICAgIGlmICghaXBpX2RhdGFfb2ZmKQo+ID4gICAgICAgICAgICAgICAgICAgICAgIHJldHVy
biBTQklfRU5PTUVNOwo+ID4gZGlmZiAtLWdpdCBhL3BsYXRmb3JtL2ZwZ2EvYXJpYW5lL3BsYXRm
b3JtLmMgYi9wbGF0Zm9ybS9mcGdhL2FyaWFuZS9wbGF0Zm9ybS5jCj4gPiBpbmRleCA0YmMxYzVi
ZS4uNGNhOWNhOTQgMTAwNjQ0Cj4gPiAtLS0gYS9wbGF0Zm9ybS9mcGdhL2FyaWFuZS9wbGF0Zm9y
bS5jCj4gPiArKysgYi9wbGF0Zm9ybS9mcGdhL2FyaWFuZS9wbGF0Zm9ybS5jCj4gPiBAQCAtNzEs
OSArNzEsMTUgQEAgc3RhdGljIHN0cnVjdCBhY2xpbnRfbXRpbWVyX2RhdGEgbXRpbWVyID0gewo+
ID4gICAqLwo+ID4gIHN0YXRpYyBpbnQgYXJpYW5lX2Vhcmx5X2luaXQoYm9vbCBjb2xkX2Jvb3Qp
Cj4gPiAgewo+ID4gKyAgICAgaW50IHJjOwo+ID4gKwo+ID4gICAgICAgaWYgKCFjb2xkX2Jvb3Qp
Cj4gPiAgICAgICAgICAgICAgIHJldHVybiAwOwo+ID4KPiA+ICsgICAgIHJjID0gYWNsaW50X21z
d2lfY29sZF9pbml0KCZtc3dpKTsKPiA+ICsgICAgIGlmIChyYykKPiA+ICsgICAgICAgICAgICAg
cmV0dXJuIHJjOwo+ID4gKwo+ID4gICAgICAgcmV0dXJuIHVhcnQ4MjUwX2luaXQoQVJJQU5FX1VB
UlRfQUREUiwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIEFSSUFORV9VQVJUX0ZSRVEs
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICBBUklBTkVfVUFSVF9CQVVEUkFURSwKPgo+
IEkgd291bGQgcmVjb21tZW5kIHRvIGtlZXAgdGhlIHNlcmlhbCBkZXZpY2UgaW5pdGlhbGl6YXRp
b24gZmlyc3QgaW4gdGhlc2UKPiBmdW5jdGlvbnMgdG8gaGVscCB3aXRoIGFueSBmdXR1cmUgZGVi
dWdnaW5nLgo+CgpTdXJlLCBJIHdpbGwgdXBkYXRlIGluIHYyLgoKUmVnYXJkcywKQW51cAoKLS0g
Cm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
