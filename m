Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFB9CCF9E3
	for <opensbi@archiver.kernel.org>; Sun,  2 Nov 2025 10:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hu0N7As050HJSm+x8Gu5AXuZlPJemjDW/Uj4e3SDJiA=; b=Nn00lVTN9HRw3B
	X7G8HKiG1CCHHLY1GxCkBDe911w8U+TROyT/0cGn9YcMXtRk9wCc4s65Vv51yCkHG3+XehRVnCZaz
	6MWnq7iP16pc5t6mhtVBF4vLhBSfBpHNkLAuhpWiHr/l4+/Z7z+Apo0Ddqkj9ENQ9dasldJeEVnlR
	T7vpX3jykYT6/rmdhqmnvNsjK5Buy2HpWlVkjIgKNrSIU5un5SyJ4x3UE7T3qYac/rD+qkSefJuyY
	snkuV8aTErxLfbCuIAnyLYy9WjAn2qKpP2bmF+EN3tZ14KbG4OFZPwtQKr/QtIKD8vT965eniltB+
	GIWlVXmtuI5vD3B6/9AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFVO4-00000008TJa-16MW;
	Sun, 02 Nov 2025 10:32:40 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFVO1-00000008TIy-1qsz
	for opensbi@lists.infradead.org;
	Sun, 02 Nov 2025 10:32:38 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-4330eb0f232so8028915ab.0
        for <opensbi@lists.infradead.org>; Sun, 02 Nov 2025 02:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1762079556; x=1762684356; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i+dzJcmD4PxUYDVM/ZzpxaYtigAJDe119hmapjkSA0g=;
        b=WwY2cNnDa83+1baN1g0BGnuEX/UddJ+AXwI97BJSIB701EfHH4T9qflaa3pL4tL8gA
         9t+m/rOcfjyyTgG/txsViUbRHc091ngzh/lR9NbhBc2clMySMSn2gLtrEkkt8RMDZBnj
         OYqNeyoeukr7eBow1yv2M+SGNlgfDpbwTCaK5UGMxWdy6/2g9mnqpfC8teGW1cAVtXry
         Q37t3khkrespaN3lVC/fSsDALKsieN2qft1MZ/R0cO0rlYO4y71KxoTO+jVlZD1bXOqD
         O90r3F1krTJYP2ZjWheG05V024zvtj5YxriUpX1RKL9Nq5IacBD2ybk5Fnlqu6aeJ2UM
         UqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762079556; x=1762684356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i+dzJcmD4PxUYDVM/ZzpxaYtigAJDe119hmapjkSA0g=;
        b=u6ZW+j3Nccy5WKkVMhQJ8d7T6nzfzxGLG9BKAnvIVkx46/1EQVUwTye8m+MMnarVuN
         92yu3wECMeDlMWJsgWuFSsbaC210C4YBwzO+YSNKGNPtiSH96VJoiFt0kHhKDJ21riPk
         oygDW0VJI7C+6sO6VZtMUwvLFbqgC+X7tf7aBiCW+lLZAYWvWIb5mUOKd3HrMrokfrjm
         JalC9SFV4/nrbtVv8xllSmydsleFVw5qwQ2YCu1OJ4DKvpdb3veNz8hlJZKnlDUhOYbL
         4jH9uXn4gMzV50SG2H/+EWj5QOAlrnoMcyGPMfCGTAo20aC7N6ITle32OOrvq52RutaA
         LDFg==
X-Gm-Message-State: AOJu0YwcvUvlvGyumQ/xdAOs4+t9mdAgJizTfSqQdxJy77r6nwBrn00V
	3fl5KJuunHRQkRgQHWa+uTg3r6sHdTpWJ6sqWa9C1Mn+BzsXsH+PgwhF8ScpB9YlaPdmsOyT3Ip
	UW/gcXjNi7+kh/kcXoEQKy+tCAYXf6Uq0P5h+k5DGNQ==
X-Gm-Gg: ASbGncsHVLnVyq8fE5vzyiHOa7gmDjQhiR25MBXdBZstADRV5onhqjozZ3TTNNZ8Epx
	9bRtJaCNjAgl5OlES7oTVZJF5F9jGuwrtqxFKJncb7kfmDAqSVIw9nh5l/i9zW2daDQihUQZP9X
	r1zIdRXZeG1sMQVHkiAYbdnlobC2n/gIrzh5pZVKSJvtAp3RXyhUrfU4wMVyBYXV9x7CIMeXOx4
	WmuCquWiy7czai3FGJzdBAMGhU5bbqFnmneMWDLcoPjkloy+PDXMBCL8wjF4yJYFaO5fLkXs0oG
	A/0OxHMm9xzDZJND3AJmArs1uOE=
X-Google-Smtp-Source: AGHT+IEY0zHScJ53pSp1JKMsNJBU8UEURl4OO7wq6fxLiL9f8BOpNkhY5yQDGiHXdgJTpjCMjceG/54R1VR/y0qHkW8=
X-Received: by 2002:a92:c262:0:b0:430:afae:fe24 with SMTP id
 e9e14a558f8ab-4330bdaa062mr128968075ab.8.1762079556454; Sun, 02 Nov 2025
 02:32:36 -0800 (PST)
MIME-Version: 1.0
References: <20251008084444.3525615-1-peter.lin@sifive.com> <20251008084444.3525615-3-peter.lin@sifive.com>
In-Reply-To: <20251008084444.3525615-3-peter.lin@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 2 Nov 2025 16:02:23 +0530
X-Gm-Features: AWmQ_bkYGDCrunTIzSO03QjMHw6KwNwCqbHRXHVxp3KYzeT6Sr30y-HQS5bM4Fk
Message-ID: <CAAhSdy100tiw+SSBiWDDNXAXkUTkAepEBXbUqcVwScZxNww7uw@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] lib: sbi_domain: allow specifying inaccessible region
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com, greentime.hu@sifive.com, 
	wxjstz@126.com, alvinga@andestech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_023237_482109_8C9B0A4A 
X-CRM114-Status: GOOD (  18.86  )
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

T24gV2VkLCBPY3QgOCwgMjAyNSBhdCAyOjE04oCvUE0gWXUtQ2hpZW4gUGV0ZXIgTGluIDxwZXRl
ci5saW5Ac2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiBBY2NvcmRpbmcgdG8gdGhlIFJJU0PigJFWIFBy
aXZpbGVnZWQgU3BlY2lmaWNhdGlvbiwgU21lUE1QCj4gcmVnaW9ucyB0aGF0IGdyYW50IG5vIGFj
Y2VzcyBpbiBhbnkgcHJpdmlsZWdlIG1vZGUgYXJlCj4gdmFsaWQuIEFsbG93IHN1Y2ggcmVnaW9u
cyB0byBiZSBzcGVjaWZpZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBZdS1DaGllbiBQZXRlciBMaW4g
PHBldGVyLmxpbkBzaWZpdmUuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxh
bnVwQGJyYWluZmF1bHQub3JnPgoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICBsaWIvc2JpL3NiaV9k
b21haW4uYyB8IDEyICsrKysrKysrKysrLQo+ICBsaWIvc2JpL3NiaV9oYXJ0LmMgICB8ICA0IC0t
LS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX2RvbWFpbi5jIGIvbGliL3NiaS9zYmlfZG9tYWlu
LmMKPiBpbmRleCAxZmE1NmI2YS4uODkyNTBkNGMgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlf
ZG9tYWluLmMKPiArKysgYi9saWIvc2JpL3NiaV9kb21haW4uYwo+IEBAIC0xMjYsNyArMTI2LDE3
IEBAIHVuc2lnbmVkIGludCBzYmlfZG9tYWluX2dldF9zbWVwbXBfZmxhZ3Moc3RydWN0IHNiaV9k
b21haW5fbWVtcmVnaW9uICpyZWcpCj4gIHsKPiAgICAgICAgIHVuc2lnbmVkIGludCBwbXBfZmxh
Z3MgPSAwOwo+Cj4gLSAgICAgICBpZiAoU0JJX0RPTUFJTl9NRU1SRUdJT05fSVNfU0hBUkVEKHJl
Zy0+ZmxhZ3MpKSB7Cj4gKyAgICAgICBpZiAoKHJlZy0+ZmxhZ3MgJiBTQklfRE9NQUlOX01FTVJF
R0lPTl9BQ0NFU1NfTUFTSykgPT0gMCkgewo+ICsgICAgICAgICAgICAgICAvKgo+ICsgICAgICAg
ICAgICAgICAgKiBSZWdpb24gaXMgaW5hY2Nlc3NpYmxlIGluIGFsbCBwcml2aWxlZ2UgbW9kZXMu
Cj4gKyAgICAgICAgICAgICAgICAqCj4gKyAgICAgICAgICAgICAgICAqIFNtZVBNUCBhbGxvd3Mg
dHdvIGVuY29kaW5ncyBmb3IgYW4gaW5hY2Nlc3NpYmxlIHJlZ2lvbjoKPiArICAgICAgICAgICAg
ICAgICogICAtIHBtcGNmZy5MUldYID0gMDAwMCAoSW5hY2Nlc3NpYmxlIHJlZ2lvbikKPiArICAg
ICAgICAgICAgICAgICogICAtIHBtcGNmZy5MUldYID0gMTAwMCAoTG9ja2VkIGluYWNjZXNzaWJs
ZSByZWdpb24pCj4gKyAgICAgICAgICAgICAgICAqIFdlIHVzZSB0aGUgZmlyc3QgZW5jb2Rpbmcg
aGVyZS4KPiArICAgICAgICAgICAgICAgICovCj4gKyAgICAgICAgICAgICAgIHJldHVybiAwOwo+
ICsgICAgICAgfSBlbHNlIGlmIChTQklfRE9NQUlOX01FTVJFR0lPTl9JU19TSEFSRUQocmVnLT5m
bGFncykpIHsKPiAgICAgICAgICAgICAgICAgLyogUmVhZCBvbmx5IGZvciBib3RoIE0gYW5kIFNV
IG1vZGVzICovCj4gICAgICAgICAgICAgICAgIGlmIChTQklfRE9NQUlOX01FTVJFR0lPTl9JU19T
VVJfTVIocmVnLT5mbGFncykpCj4gICAgICAgICAgICAgICAgICAgICAgICAgcG1wX2ZsYWdzID0g
KFBNUF9MIHwgUE1QX1IgfCBQTVBfVyB8IFBNUF9YKTsKPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9z
YmlfaGFydC5jIGIvbGliL3NiaS9zYmlfaGFydC5jCj4gaW5kZXggMmRjYTI2OTkuLmQwMTg2MTli
IDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkvc2JpX2hhcnQuYwo+ICsrKyBiL2xpYi9zYmkvc2JpX2hh
cnQuYwo+IEBAIC0zNTgsOCArMzU4LDYgQEAgc3RhdGljIGludCBzYmlfaGFydF9zbWVwbXBfY29u
ZmlndXJlKHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCwKPiAgICAgICAgICAgICAgICAgfQo+
Cj4gICAgICAgICAgICAgICAgIHBtcF9mbGFncyA9IHNiaV9kb21haW5fZ2V0X3NtZXBtcF9mbGFn
cyhyZWcpOwo+IC0gICAgICAgICAgICAgICBpZiAoIXBtcF9mbGFncykKPiAtICAgICAgICAgICAg
ICAgICAgICAgICByZXR1cm4gMDsKPgo+ICAgICAgICAgICAgICAgICBzYmlfaGFydF9zbWVwbXBf
c2V0KHNjcmF0Y2gsIGRvbSwgcmVnLCBwbXBfaWR4KyssIHBtcF9mbGFncywKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBwbXBfbG9nMmdyYW4sIHBtcF9hZGRyX21heCk7Cj4g
QEAgLTM4NCw4ICszODIsNiBAQCBzdGF0aWMgaW50IHNiaV9oYXJ0X3NtZXBtcF9jb25maWd1cmUo
c3RydWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoLAo+ICAgICAgICAgICAgICAgICB9Cj4KPiAgICAg
ICAgICAgICAgICAgcG1wX2ZsYWdzID0gc2JpX2RvbWFpbl9nZXRfc21lcG1wX2ZsYWdzKHJlZyk7
Cj4gLSAgICAgICAgICAgICAgIGlmICghcG1wX2ZsYWdzKQo+IC0gICAgICAgICAgICAgICAgICAg
ICAgIHJldHVybiAwOwo+Cj4gICAgICAgICAgICAgICAgIHNiaV9oYXJ0X3NtZXBtcF9zZXQoc2Ny
YXRjaCwgZG9tLCByZWcsIHBtcF9pZHgrKywgcG1wX2ZsYWdzLAo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHBtcF9sb2cyZ3JhbiwgcG1wX2FkZHJfbWF4KTsKPiAtLQo+IDIu
NDguMAo+CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
