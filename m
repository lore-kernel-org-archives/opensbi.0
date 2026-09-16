Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D50C982C1
	for <opensbi@archiver.kernel.org>; Wed, 16 Sep 2026 05:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q908+5ORfWkOq60ccZQfXfrQazhSBNbJsPX12Bq/A44=; b=Z6MTU3V9VZCVo/
	svuTsfdV38UPGEPizACRyIVhk4a7VFh6D7GdL0UP5xhugcbGX/vIh1uha4c1qMa+HiMEKCjHsddVg
	ZMBmoIfCMpk/y66LR3IXrJwA//PtRVX1jCm/pmLoqeT/ebIfeOSFrR5/JCR84xpCcuYJdc7Wi79aA
	XrUY58QN6MpUfmZi/CyLPvZ0GYJ9YfO4NohfiQyLg/Wzxv9xCTZjZ4B9L1P8nxl5zGJ/Dii8EXE4a
	FzFUB4AnfxG5MZbtLfkgc4upJQ6YOMAD0lkybT2S2SX+wfhHaL/8r55bW53P6SclSVH4PV59kzmH+
	NWXiqw/bnXNvUZCST42A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6i3h-00000008NNc-2BcJ;
	Wed, 16 Sep 2026 05:19:49 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6i3c-00000008NLU-1mM6
	for opensbi@lists.infradead.org;
	Wed, 16 Sep 2026 05:19:45 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-48437356d60so194210f8f.3
        for <opensbi@lists.infradead.org>; Tue, 15 Sep 2026 22:19:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789535982; cv=none;
        d=google.com; s=arc-20260327;
        b=G+9bmUxA3uPOq0PDteLC77oo8K+PnBIRHditb8/CqcBPP/bTdbS06j6VoR9vrhvx4/
         +UMEMMQ+S5dI+I91l5f7MW64VO7R7TzdEyphgsDPF7EzALvFB7XHM34SN/tghC3tZO9s
         4CKGYp4hPVul07d8SwwIsBX8dueKbHxfuTo/YHGrWBKqz40+TzuPhhEmkFivoknlnV2o
         Hcv4gCg221gR2FWPUXQfiB2dTImvGVCG3JXavP24JruSjeGvYcfgSKw7m/AZh1rZuTFf
         Ti7DjVamwlC9ytsPx3Y/2Jq5+WO++BYO3FcQaURycGp65XbACpID/kMcMW5Y9P547XJe
         ySOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1oWBn1iSnqsK0QolJ9G35tX7TJnKqI1Pm8lI+gt3IIA=;
        fh=zSKhKLhozNbRw/jvGs8nN9IzvF3I3/vXlewdugb4UXw=;
        b=UnrN/jJ3+61kt0dwlpMIsTTA72N5nOIlbuVrX39yYUT7S7GGQUaqz5o6riulatCowC
         Q9A9bBdLjgH8CzijX1uKtfJOhQJYQLseuxLBvciNiZ4+CAvympLYmlqyXA/iUQGFHkDt
         B+YPVdGgIL52Vb1JlPxebMc5M6CLrECmztRKGelujS7J4OFN84SVHTtxWRn32TDMFzSB
         UmgdpSm291NyoOC0LoRUSOZDcN3uBtP1g8KSTccEXBm95/crNwmRyki7HN0RhzvUISUP
         +zQ7Ch8fhNrE1HgDB2z8JIdcENVRxBRxV/dCRSu7oiiAdB5C5Yu8tydHhXDJh20cpTjh
         oI3Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789535982; x=1790140782; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1oWBn1iSnqsK0QolJ9G35tX7TJnKqI1Pm8lI+gt3IIA=;
        b=khrFOh5zOA+MWcZsQBGACU4BSqU+JObQQzC93xzuRGarI7UM9ChiXXEqvSoD1t14EO
         XoH0adERWqp+oaPMcdxoYvGQP3qOhcvA8uz9kcomeUiz49KHhI1zsfpCikIgiIw43LAM
         UyKpYtyQNliqF2utmQNWJ13F+677ahgSrKEdUPL5MaeSL6mpONAQRtTyZwOoh1hbctVx
         JskJRP7xJAZ0Jmn3v7qBHli/Y6nHppbEAIulnXh3B843XVIphzmhGwG7XXbWrn9rZcDR
         P9U/glFnn33DIEzGTDNjImE2ipO5JZgHCwcg1aji/hrYXSv8mIAv34QSoPb6z0uX3E7J
         QPVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789535982; x=1790140782;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1oWBn1iSnqsK0QolJ9G35tX7TJnKqI1Pm8lI+gt3IIA=;
        b=Q4vIeKE1mFqQK8qVK1109IUM6NA7pwd6Vwn170r6nOHIQP2ErDskL8xleDJR3cT2AF
         MQtl0ONHnIwMZwasQHPF2GgR1iW0LevFxf94LwwhHn9AK1KsezsuDKWaQNpX1kmwoE9y
         hGgqhTfO2W4qgjREFQrRjtKB9hTNHnE4VWbNMZr7kiB+qMHO6z3tbXAOWNdQ2jbvynaH
         TxLHYmlYWkscybPpMov59lutZP0hpWLwyyuF15TPpjJo8lomSpY70gUgo77PQ68fyEhY
         wALprFcaTSj+txopox5NzpmABJLizgcgktkKU87bh8Q9d5fQPOZi4cvrJ6YUUWczWcLq
         XMXA==
X-Gm-Message-State: AFuF++nNjXJihzdFhMjqxkx2Du0Q+LUYNSnmTxbNtdG/aa1hFIZFgw1L
	kDRzZMarBpw0uqBrfuOyIjJ9EGn1n6gYirDoGrs/Y+LcLY6mJlBbPmJu3DzJmnO2/TXK8ItnFuq
	uwJv47yuIWuM5qQjDGSLpl0q3IQF6os1N5mKcRrF4NhoKnVpbv+ugiP4=
X-Gm-Gg: AYBFou0k9Ipb78Dht/9y3uAGctSdhO7TmzEAmtzc/DZnhWVTdpqeB/ZOeshzs5zGxvZ
	zFUSvtSzZiy6DPGanmPcXsO7aJs8WuSsrDFa5eez603Vek7LS9XfaIxW4vmAkU08oXSj75i75EY
	EQnoKZBxXPiEDbkk1uerip+satPVtAVdyVSWnM/WhMjLaiJWGARHXdjRZheYzBmRJ5SC19DMArf
	0kY5I5vgmklVRayHi8xb31Mf5S/UbP56hQy2HUvREXoBdcHdtXxQLVuXPVmSsCaBu3fdH3rdPP1
	8XmKK8j2U4eqTyNiaF6FU7+SLNZ0GP5UZ8ReeOrNpdwgbA8PgVBlJUk0GD3djRParSi6xQPMSIc
	G7dvLMZAIkQY7om4946++y/q0W8SpKoU6VpWjGirRyyfiKlxLsvos6WcF7GmsfUn2a4sYY3jbbQ
	==
X-Received: by 2002:a05:6000:4918:b0:487:bef:31a8 with SMTP id
 ffacd0b85a97d-4870cd9fe64mr1312402f8f.0.1789535982511; Tue, 15 Sep 2026
 22:19:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260909162322.29778-2-carlos.lopezr4096@gmail.com>
In-Reply-To: <20260909162322.29778-2-carlos.lopezr4096@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 16 Sep 2026 10:49:30 +0530
X-Gm-Features: AcwNN1UmijdPvYPkw8fh7uA5kTFqzgpPKeAphNQaKJ7qszSEcuEGVMKJLv8W2JA
Message-ID: <CAAhSdy2_T2Pxq54ZP0EfsOBbk_F-CSOeQA=vZC0OQCi-LVv+1Q@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] Add clang Thread Safety Analysis (TSA) support
To: =?UTF-8?Q?Carlos_L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_221944_505874_BB78723A 
X-CRM114-Status: GOOD (  25.67  )
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

T24gV2VkLCBTZXAgOSwgMjAyNiBhdCAxMDowMeKAr1BNIENhcmxvcyBMw7NwZXoKPGNhcmxvcy5s
b3BlenI0MDk2QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBFbmFibGUgdGhlIHVzZSBvZiBjbGFuZydz
IFRocmVhZCBTYWZldHkgQW5hbHlzaXMgWzBdLiBUU0EgaXMgYSBjbGFuZwo+IGxhbmd1YWdlIGV4
dGVuc2lvbiB0aGF0IGFsbG93cyBkZXRlY3RpbmcgcG90ZW50aWFsIGludmFsaWQgbG9ja2luZwo+
IHBhdHRlcm5zIGFuZCByYWNlIGNvbmRpdGlvbnMgYXQgY29tcGlsZSB0aW1lLCB3aXRoIHplcm8g
cnVudGltZQo+IG92ZXJoZWFkLiBUU0EgcmVsaWVzIG9uIGFubm90YXRpb25zIHRvIGV4cHJlc3Mg
dGhlIHJlbGF0aW9uc2hpcHMgYmV0d2Vlbgo+IGRhdGEgYW5kIGxvY2tzLCBhbmQgdGhlIGV4cGVj
dGVkIHN0YXRlIG9mIGEgbG9jayBhdCBjZXJ0YWluIHBvaW50cyBpbgo+IHRoZSBwcm9ncmFtLgo+
Cj4gVGhlIGZpcnN0IHR3byBjb21taXRzIGludHJvZHVjZSB0aGUgYmFzaWMgaW5mcmFzdHJ1Y3R1
cmUgdG8gdXNlIHRoZSBUU0EKPiBhbm5vdGF0aW9ucy4gVGhlIGxhc3QgY29tbWl0IGVuYWJsZXMg
VFNBIGJ5IGRlZmF1bHQgaW4gdGhlIE1ha2VmaWxlLgo+IENvbW1pdHMgaW4gYmV0d2VlbiBhZGQg
dGhlIG5ldyBhbm5vdGF0aW9ucyB0byBwYXJ0aWN1bGFyIE9wZW5TQkkKPiBzdWJzeXN0ZW1zLgo+
Cj4gVGhlIGdlbmVyYWwgcGF0dGVybiBpczoKPiAqIFN0cnVjdCBmaWVsZHMgYXJlIHJlYXJyYW5n
ZWQgc28gdGhhdCBsb2NrcyBhcHBlYXIgYmVmb3JlIHRoZQo+ICAgZmllbGQocykgdGhleSBwcm90
ZWN0LiBUaGlzIGlzIG5lZWRlZCBmb3IgdGhlIGNvbXBpbGVyIHRvIGJlIGFibGUgdG8KPiAgIHBl
cmZvcm0gYW5hbHlzaXMuIFByb3RlY3RlZCBmaWVsZHMgYXJlIGFubm90YXRlZCB3aXRoIEdVQVJE
RURfQlkoKSAvCj4gICBQVF9HVUFSREVEX0JZKCkuCj4gKiBGdW5jdGlvbnMgdGhhdCBhY2Nlc3Mg
c3BpbmxvY2stcHJvdGVjdGVkIGZpZWxkcyBhcmUgYW5ub3RhdGVkIHd0aAo+ICAgTVVTVF9IT0xE
KCkuCj4gKiBGdW5jdGlvbnMgdGhhdCBhY3F1aXJlIGEgc3BpbmxvY2ssIGFuZCB3aGljaCBtYXkg
cGxhdXNpYmx5IGJlIGNhbGxlZAo+ICAgd2l0aCB0aGF0IHNwaW5sb2NrIGhlbGQsIGFyZSBhbm5v
dGF0ZWQgd2l0aCBNVVNUX05PVF9IT0xEKCkgdG8gcHJldmVudAo+ICAgcG90ZW50aWFsIGZ1dHVy
ZSBkZWFkbG9ja3MuCj4gKiBJbml0aWFsaXplciBmdW5jdGlvbnMgYW5kIG90aGVyIHNwZWNpYWwg
Y2FzZXMgYXJlIGV4Y2x1ZGVkIHZpYQo+ICAgTk9fVEhSRUFEX1NBRkVUWV9BTkFMWVNJUy4KPgo+
IFRoaXMgc3VjY2Vzc2Z1bGx5IHJlc3VsdHMgaW4gZGV0ZWN0aW5nIGluY29ycmVjdCBsb2NraW5n
IG9uIGNsYW5nID4xOS4KPiBGb3IgZXhhbXBsZSwgdGhlIGZvbGxvd2luZyBjaGFuZ2U6Cj4KPiBk
aWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfZmlmby5jIGIvbGliL3NiaS9zYmlfZmlmby5jCj4gaW5k
ZXggODhiODg4OGQyZTgxLi41MzQ4Yjc0NTJmNjQgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlf
Zmlmby5jCj4gKysrIGIvbGliL3NiaS9zYmlfZmlmby5jCj4gQEAgLTM3LDkgKzM3LDcgQEAgdTE2
IHNiaV9maWZvX2F2YWlsKHN0cnVjdCBzYmlfZmlmbyAqZmlmbykKPiAgICAgICAgIGlmICghZmlm
bykKPiAgICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4KPiAtICAgICAgIHNwaW5fbG9jaygmZmlm
by0+cWxvY2spOwo+ICAgICAgICAgcmV0ID0gZmlmby0+YXZhaWw7Cj4gLSAgICAgICBzcGluX3Vu
bG9jaygmZmlmby0+cWxvY2spOwo+Cj4gICAgICAgICByZXR1cm4gcmV0Owo+ICB9Cj4KPiBSZXN1
bHRzIGluIGEgYnVpbGQgZXJyb3I6Cj4KPiAgIGxpYi9zYmkvc2JpX2ZpZm8uYzo0MToxNDogZXJy
b3I6IHJlYWRpbmcgdmFyaWFibGUgJ2F2YWlsJyByZXF1aXJlcyBob2xkaW5nIHNwaW5sb2NrICcm
c2JpX2ZpZm86OnFsb2NrJyBbLVdlcnJvciwtV3RocmVhZC1zYWZldHktYW5hbHlzaXNdCj4gICAg
NDEgfCAgICAgICAgIHJldCA9IGZpZm8tPmF2YWlsOwo+ICAgICAgIHwgICAgICAgICAgICAgICAg
ICAgICBeCj4gICAxIGVycm9yIGdlbmVyYXRlZC4KPgo+IFRlc3RlZCB3aXRoIGNsYW5nIDE4LjEu
OCwgMTkuMS43IGFuZCAyMi4xLjguCj4KPiBbMF0gaHR0cHM6Ly9jbGFuZy5sbHZtLm9yZy9kb2Nz
L1RocmVhZFNhZmV0eUFuYWx5c2lzLmh0bWwKPgo+IHYyOgo+ICAgLSBFbmFibGUgVFNBIG1hY3Jv
cyBvbmx5IG9uIGNsYW5nID49IDE5Lgo+Cj4gQ2FybG9zIEzDs3BleiAoMTQpOgo+ICAgaW5jbHVk
ZTogc2JpOiBhZGQgdGhyZWFkIHNhZmV0eSBhbmFseXNpcyBtYWNyb3MKPiAgIGxpYjogc2JpX2xv
Y2tzOiBhbm5vdGF0ZSBzcGlubG9jayBBUElzIGZvciBUU0EKPiAgIGxpYjogc2JpX2ZpZm86IGFk
ZCBUU0EgYW5ub3RhdGlvbnMKPiAgIGxpYjogc2JpX2hlYXA6IGFkZCBUU0EgYW5ub3RhdGlvbnMK
PiAgIGxpYjogc2JpX3NjcmF0Y2g6IGFkZCBUU0EgYW5ub3RhdGlvbnMKPiAgIGxpYjogcnBtaTog
YWRkIFRTQSBhbm5vdGF0aW9ucwo+ICAgbGliOiBzYmlfdGltZXI6IGFkZCBUU0EgYW5ub3RhdGlv
bnMKPiAgIGxpYjogaHRpZjogYWRkIFRTQSBhbm5vdGF0aW9ucwo+ICAgbGliOiBzYmlfZG9tYWlu
OiBhZGQgVFNBIGFubm90YXRpb25zCj4gICBsaWI6IHNiaV9zc2U6IGlubGluZSBlbmFibGUgZXZl
bnQgbG9ja2luZwo+ICAgbGliOiBzYmlfc3NlOiBwYXNzIFNTRSBoYXJ0IHN0YXRlIGV4cGxpY2l0
bHkKPiAgIGxpYjogc2JpX3NzZTogYWRkIFRTQSBhbm5vdGF0aW9ucwo+ICAgbGliOiB0ZXN0OiBk
aXNhYmxlIFRTQSBmb3Igc3BpbmxvY2sgdGVzdHMKPiAgIE1ha2VmaWxlOiBlbmFibGUgVGhyZWFk
IFNhZmV0eSBBbmFseXNpcwo+Cj4gIE1ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICA3ICsrCj4gIGluY2x1ZGUvc2JpL3Jpc2N2X2xvY2tzLmggICAgICAgICAgICAg
ICAgICB8ICA4ICstCj4gIGluY2x1ZGUvc2JpL3NiaV9kb21haW4uaCAgICAgICAgICAgICAgICAg
ICB8IDEwICsrLQo+ICBpbmNsdWRlL3NiaS9zYmlfZmlmby5oICAgICAgICAgICAgICAgICAgICAg
fCAgNiArLQo+ICBpbmNsdWRlL3NiaS9zYmlfdmlzaWJpbGl0eS5oICAgICAgICAgICAgICAgfCAx
NyArKysrKwo+ICBsaWIvc2JpL3Jpc2N2X2xvY2tzLmMgICAgICAgICAgICAgICAgICAgICAgfCAg
NCArLQo+ICBsaWIvc2JpL3NiaV9kb21haW4uYyAgICAgICAgICAgICAgICAgICAgICAgfCAgMyAr
Cj4gIGxpYi9zYmkvc2JpX2RvbWFpbl9jb250ZXh0LmMgICAgICAgICAgICAgICB8ICAyICsKPiAg
bGliL3NiaS9zYmlfZmlmby5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTEgKystCj4gIGxp
Yi9zYmkvc2JpX2hlYXAuYyAgICAgICAgICAgICAgICAgICAgICAgICB8IDI1ICsrKy0tLQo+ICBs
aWIvc2JpL3NiaV9zY3JhdGNoLmMgICAgICAgICAgICAgICAgICAgICAgfCAgMyArLQo+ICBsaWIv
c2JpL3NiaV9zc2UuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCA4OSArKysrKysrKysrLS0t
LS0tLS0tLS0tCj4gIGxpYi9zYmkvc2JpX3RpbWVyLmMgICAgICAgICAgICAgICAgICAgICAgICB8
ICA1ICstCj4gIGxpYi9zYmkvdGVzdHMvcmlzY3ZfbG9ja3NfdGVzdC5jICAgICAgICAgICB8ICAz
ICsKPiAgbGliL3V0aWxzL21haWxib3gvZmR0X21haWxib3hfcnBtaV9zaG1lbS5jIHwgMTQgKyst
LQo+ICBsaWIvdXRpbHMvc3lzL2h0aWYuYyAgICAgICAgICAgICAgICAgICAgICAgfCAyOCArKysr
LS0tCj4gIDE2IGZpbGVzIGNoYW5nZWQsIDE0MCBpbnNlcnRpb25zKCspLCA5NSBkZWxldGlvbnMo
LSkKPgo+Cj4gYmFzZS1jb21taXQ6IDM1OTNhNWZhY2M0YzY5MzhiOTA0MjlhNjk3M2JhOWVlMjFm
YzU4OTkKPiAtLQo+IDIuNTEuMAo+Cj4KPiAtLQo+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gb3Bl
bnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9vcGVuc2JpCgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFu
dXBAYnJhaW5mYXVsdC5vcmc+CgpBcHBsaWVkIHRoaXMgcGF0Y2ggdG8gdGhlIHJpc2N2L29wZW5z
YmkgcmVwby4KClRoYW5rcywKQW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL29wZW5zYmkK
