Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910C8E784BE
	for <opensbi@archiver.kernel.org>; Sun, 28 Dec 2025 15:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NLI3V7hckLrYgFfVu1uyLSnZ9HJw5ap6mdXuTbhnb78=; b=Qa0C70vohwEtPf
	YULB5cIehQaVdM77+L1SWE+wSh/UD489fI7LqMe3G6jhrXDF29V1H82xMmkACIuYuGT63vNdTxIYj
	Z3eD62QldI1MYS6uDyrGwb+GbbpxT8ogQL9heULad89U3oHnrk61JKr1f0FZ2FmhVIQAhShjdS7oL
	e3OVEpX5S/ydF7NFnRjcL/43BUcjjjha+8wE1pdDSf7nHkpkYytVgZ5P3zJnJk5qOCoo1MkRHn1aY
	b9+dXGlnlpoq1FYqYsYLj4vDd1337NUCgVLH8STnpqjXnf0YrDO6uUy0ZfI2K995klcx3I1wbzB5T
	7Z5WDI/A8z7X81iQ9B8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZsYG-00000002pwF-3eLs;
	Sun, 28 Dec 2025 15:19:24 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZsYE-00000002pvl-0vdU
	for opensbi@lists.infradead.org;
	Sun, 28 Dec 2025 15:19:23 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-65b855fba0fso3299219eaf.2
        for <opensbi@lists.infradead.org>; Sun, 28 Dec 2025 07:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1766935161; x=1767539961; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+jq8SdGyJBaokiBn0GQwHQEl/nevjlhoLTzG4sx/vQ=;
        b=fskXK3CMQTgfhWOH1gQCZV+qcMrnGAYTx2rSce8nPxmvoENC60nDFeN3denc/O9wLb
         P5UZXEqQ+5UnETO/K23YemvXiAuvUNYu/gwNUPWhDKFSLh78vnA8RvFmNgw68vG1kdF8
         pFS+K20w4IxWj0E5VnQNv4fK/dbLwZAv7Gjk/YF3g+0oEetRIS3zHfpi+ureSQbtRzDa
         /Wq0RXi1V4nOK895Xy15gcKwGmXF/By1jj11nvUkKJ56le4DMt0W/qznMlKqUP7J0toe
         YUuZjwJhzVjeY6+4h1eXoNr3a/Bp1lTvlt4JUyl81rpH2tamcuEEVxl4vrLZTJ845BjU
         hysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766935161; x=1767539961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t+jq8SdGyJBaokiBn0GQwHQEl/nevjlhoLTzG4sx/vQ=;
        b=l3nFi/RPsnQ/i+ODOr/8APWkTr6TMsOIH77jP3xSWsZycHXxX9xYeec9Uw/vxG60lE
         w6yMPx/QI1rfy6ck3szpafIwqGlQ7+ZGyvQpEFNNNXuTb5g7lFei8yKXTKszQlUXj9lL
         Ay4rCFThmUOymlLXB69sdQ1llGxAmXHNzoMv6WJpltke+gNKBQEzlXeJHopc/+vbNsGc
         DEkpIuhi2Dsac6yGJFpYnXidQby6UGaJHAlX5xnN0tAuzUc09joHYbpM2C+NQ95OR4q3
         c7svEdpzrSjkyfEwk/A3ZWcBpKPbWnC+9kKsd1c9AXd9w1ZE7MQYfe3CZBIjF03IAT1y
         giTg==
X-Forwarded-Encrypted: i=1; AJvYcCUIKaYuhkwXd3wEiZ+fDkqvOWiy1FZWyw9GaqN59Ysa51oYmajBT+f5jFYc6tzAvzrwuApL2ysv@lists.infradead.org
X-Gm-Message-State: AOJu0YzfHo8AkvJn1xKHyU21/L35Epp15xZPVW3Nr7S2AjQpb0kwPAhW
	mSeKOcNUdN/snbSmHt6JaVPwkCAMgjpZRonkvqq3UGPqKBGqnHpWyANzs/j62gz3mEtzMz+MONO
	LqFqjP+tHFNMlhVuI5q3d6DJ/SsvnJIArjiukpSCOOg==
X-Gm-Gg: AY/fxX4E+xRdg4frMLd/SqmWFG5wb8FPY+kHP/aXF2VBM8ITZ0OzZwmeCDiuVDoselk
	bIt8RAG+v4CALt1BmtNy+FvciW8gVv950n0/rzHpvBWiOnfIMhdBgb5rM4HUnam8GdfT9V8mJen
	QfbfuVbV2s5gNi4NJ8XieVhF89vCU38hlGlM/yBox+eKQ1pg7uF5mWGExheWRW8m5inVkpMYAip
	GdXkai3PLrz/F51Ni5haPeEfI6qO7mbUCUjpImKyCWqFHhsqfSe7swVcry0eIlb9G+vs582iQU6
	es9ygemAHZZv2BAN++Tq9Ap3/wVy01w4FCQkTuXMod2p7wqzWXWfwyOgHwGUF17YQxEf
X-Google-Smtp-Source: AGHT+IE+hJvA4Nm9qTTpzT8x/dLa0sQ9BZ2Hb+Om+alCRVhvIgeYQeK0MwA9cQUB9AcfYk9HIZKb2VrdfcThCCrGPa4=
X-Received: by 2002:a4a:d8c2:0:b0:65d:c57:70b0 with SMTP id
 006d021491bc7-65d0eadddbfmr8536421eaf.64.1766935160778; Sun, 28 Dec 2025
 07:19:20 -0800 (PST)
MIME-Version: 1.0
References: <20251227100916.327524-1-anup.patel@oss.qualcomm.com>
In-Reply-To: <20251227100916.327524-1-anup.patel@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 28 Dec 2025 20:49:09 +0530
X-Gm-Features: AQt7F2pL7yiQ5RvagSY0qeDm_9-sOfAMNiQXVQkSfF_XaPSVl8HRNQOsWfxQ8Ts
Message-ID: <CAAhSdy251U+OYEB+tjFQyDk59uBoeUMipoP2YQvb3kbaaCR=WQ@mail.gmail.com>
Subject: Re: [PATCH] include: Fix LLVM compile error in sbi_utils/hsm/fdt_hsm_sifive_inst.h
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_071922_264708_551D3DF8 
X-CRM114-Status: GOOD (  15.15  )
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

T24gU2F0LCBEZWMgMjcsIDIwMjUgYXQgMzozOeKAr1BNIEFudXAgUGF0ZWwgPGFudXAucGF0ZWxA
b3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBDdXJyZW50bHksIE9wZW5TQkkgZmFpbHMgdG8g
Y29tcGlsZSBmb3IgTExWTT0xIHVzaW5nIDIwMjUuMTEuMjcKPiByaXNjdi1nbnUtdG9vbGNoYWlu
IHdpdGggdGhlIGZvbGxvd2luZyBlcnJvcjoKPgo+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSBvcGVu
c2JpL2xpYi91dGlscy9zdXNwZW5kL2ZkdF9zdXNwZW5kX3NpZml2ZV9zbWMwLmM6MjA6Cj4gb3Bl
bnNiaS9pbmNsdWRlL3NiaV91dGlscy9oc20vZmR0X2hzbV9zaWZpdmVfaW5zdC5oOjE3OjIzOiBl
cnJvcjogZXhwZWN0ZWQgaW5zdHJ1Y3Rpb24gZm9ybWF0Cj4gICAgMTcgfCAgICAgICAgIF9fYXNt
X18gX192b2xhdGlsZV9fKCIuaW5zbiAweGZjMDAwMDczIiA6OjogIm1lbW9yeSIpOwo+ICAgICAg
IHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCj4gPGlubGluZSBhc20+OjE6ODogbm90
ZTogaW5zdGFudGlhdGVkIGludG8gYXNzZW1ibHkgaGVyZQo+ICAgICAxIHwgICAgICAgICAuaW5z
biAweGZjMDAwMDczCj4gICAgICAgfCAgICAgICAgICAgICAgIF4KPiBJbiBmaWxlIGluY2x1ZGVk
IGZyb20gb3BlbnNiaS9saWIvdXRpbHMvc3VzcGVuZC9mZHRfc3VzcGVuZF9zaWZpdmVfc21jMC5j
OjIwOgo+IG9wZW5zYmkvaW5jbHVkZS9zYmlfdXRpbHMvaHNtL2ZkdF9oc21fc2lmaXZlX2luc3Qu
aDoxMjoyMzogZXJyb3I6IGV4cGVjdGVkIGluc3RydWN0aW9uIGZvcm1hdAo+ICAgIDEyIHwgICAg
ICAgICBfX2FzbV9fIF9fdm9sYXRpbGVfXygiLmluc24gMHgzMDUwMDA3MyIgOjo6ICJtZW1vcnki
KTsKPiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgo+IDxpbmxpbmUgYXNt
PjoxOjg6IG5vdGU6IGluc3RhbnRpYXRlZCBpbnRvIGFzc2VtYmx5IGhlcmUKPiAgICAgMSB8ICAg
ICAgICAgLmluc24gMHgzMDUwMDA3Mwo+ICAgICAgIHwgICAgICAgICAgICAgICBeCj4gMiBlcnJv
cnMgZ2VuZXJhdGVkLgo+Cj4gVG8gZml4IHRoaXMgY29tcGlsZSBlcnJvciwgdXNlICIud29yZCIg
aW4tcGxhY2UgIi5pbnNuIi4KPgo+IEZpeGVzOiAxNTE0YTMyNzMwNmIgKCJsaWI6IHV0aWxzL2hz
bTogQWRkIFNpRml2ZSBUTUMwIGRyaXZlciIpCj4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8
YW51cC5wYXRlbEBvc3MucXVhbGNvbW0uY29tPgoKQXBwbGllZCB0aGlzIHBhdGNoIHRvIHRoZSBy
aXNjdi9vcGVuc2JpIHJlcG8uCgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIGluY2x1ZGUvc2JpX3V0
aWxzL2hzbS9mZHRfaHNtX3NpZml2ZV9pbnN0LmggfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L3NiaV91dGlscy9oc20vZmR0X2hzbV9zaWZpdmVfaW5zdC5oIGIvaW5jbHVkZS9zYmlfdXRpbHMv
aHNtL2ZkdF9oc21fc2lmaXZlX2luc3QuaAo+IGluZGV4IGRlOGFiYTE5Li43ZTkxODBlYSAxMDA2
NDQKPiAtLS0gYS9pbmNsdWRlL3NiaV91dGlscy9oc20vZmR0X2hzbV9zaWZpdmVfaW5zdC5oCj4g
KysrIGIvaW5jbHVkZS9zYmlfdXRpbHMvaHNtL2ZkdF9oc21fc2lmaXZlX2luc3QuaAo+IEBAIC05
LDEyICs5LDEyIEBACj4KPiAgc3RhdGljIGlubGluZSB2b2lkIHNpZml2ZV9jZWFzZSh2b2lkKQo+
ICB7Cj4gLSAgICAgICBfX2FzbV9fIF9fdm9sYXRpbGVfXygiLmluc24gMHgzMDUwMDA3MyIgOjo6
ICJtZW1vcnkiKTsKPiArICAgICAgIF9fYXNtX18gX192b2xhdGlsZV9fKCIud29yZCAweDMwNTAw
MDczIiA6OjogIm1lbW9yeSIpOwo+ICB9Cj4KPiAgc3RhdGljIGlubGluZSB2b2lkIHNpZml2ZV9j
Zmx1c2godm9pZCkKPiAgewo+IC0gICAgICAgX19hc21fXyBfX3ZvbGF0aWxlX18oIi5pbnNuIDB4
ZmMwMDAwNzMiIDo6OiAibWVtb3J5Iik7Cj4gKyAgICAgICBfX2FzbV9fIF9fdm9sYXRpbGVfXygi
LndvcmQgMHhmYzAwMDA3MyIgOjo6ICJtZW1vcnkiKTsKPiAgfQo+Cj4gICNlbmRpZgo+IC0tCj4g
Mi40My4wCj4KCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2Jp
Cg==
