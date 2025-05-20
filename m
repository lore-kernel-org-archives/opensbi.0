Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82AA0C54756
	for <opensbi@archiver.kernel.org>; Tue, 20 May 2025 08:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=08hWrWkU8YEVhBaLCCjcU78bgzJbOvabzerzjmRJBIo=; b=PCyaPCFsRpKn3R
	6oNW6eEEOOZos17bz4DVR+UuCnynhqbdeeLznHiHdxdF3VYuF97lu+ctDTSilPfQh2TkkZjUxFFr7
	rfwNDJtvHxy3cNfJB9CgZ6nNNREm929oEsRdLSRme68JrE7GJ1ZP95KaXgaYM8dGmqfxSe+GiQdXK
	X84XqS8EfSQm5zzKorTDaDfc64n/xBrCwPZRAf7bkWzYbXhq8Bm1xGv1LnNx4QR+7JZvVD2dZLsjU
	bGkWDriiitNxslagErfULuw386XkHPoLHDg5FQKediWNFGYUX8VLXETouWqGopBKv8Xpa1+SmDCFe
	fr4wHQrOGxvngtF/pfPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHI8d-0000000BzFc-2Y0S;
	Tue, 20 May 2025 08:15:51 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHI5K-0000000Bypf-3pGs
	for opensbi@lists.infradead.org;
	Tue, 20 May 2025 08:12:28 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3da6fb115a6so42383225ab.1
        for <opensbi@lists.infradead.org>; Tue, 20 May 2025 01:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1747728746; x=1748333546; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CXs2U2b5nwrbiiHH8KLXioR0fh+qXVbGrU4LREssuZM=;
        b=YzZtSMiX0H5j6AZB5/bf5tRk+QkSk3u6whFBtwFP5XJsjc2Riz6HlnG6U3vT3X/OO3
         T4flM4vBpYlyyEun0gel09fUvpG2hIl3Xsy2efW6yUwn0n4SU0QmL3sCu/88xVvUfBOC
         7WQlcqAZtyiewXZ4p8v2VVzA5nEpfL/yJjlNbmGHIdmiPnaEHhKlVhSRh8qcGFhiEwqn
         VrCTfYiBs5EmVkbeTJOhr1sP9QiDv7qo9P3rXYDO5c1IhYQxA3RkGU+xyl7wcgYWDnXL
         Kpq9LeVUZbqEOLx2R1Dj7qN/1YtuE1pG5P0xxmgXMdvtDdwMVHcH3pwmxmGj9TbiPWHN
         BviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747728746; x=1748333546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CXs2U2b5nwrbiiHH8KLXioR0fh+qXVbGrU4LREssuZM=;
        b=lHRXtvVQ8pk3iTqP7+WBRzBxiyVBV5X18M7N6gVYyYL03D/bAG3hYYP9NeCRtS9DQs
         Qm20sdWdTpYJUwdaFTMqm43djqOmeJPn+KXdqOVcQQkbYq1eN3FtPlRP75teC0vqEmNM
         DNKvaY+aEvPCDlXPkIZ8bTDAIbSdVjYo3Pj2jUk1IbCgD8xP+FXLvV/lBoUipon7Jld7
         /K63xRXMRxV7Fk0rfTS3SxIRHxYg3gwqhK4Yci44QJ6/b8Waos15IXXqAzE6hj9UDKtY
         ifvn3IyOyJiZebit8Ou6irwteT+8IEtylbCNWGE/uTVXmw/WxW+M7obfFrAXm5v5ftSE
         ST/g==
X-Gm-Message-State: AOJu0YzmvvgmLC4AWg9PaRIqQcGm6UurVsrMDonPMt56+3FhEFPzMyt/
	4z1w8z7yK4dIgv5t+CBQnnYgEECnf51kSF4BPm4hX3cpVOjf8z6RzIRP2q0OoK4Q3joAfvjPcQQ
	rTwCBwNlwlmxavKJ8/gPq5TpPEsSbeSElyN7PX6gRdQ==
X-Gm-Gg: ASbGncsPbLhwFiFuXjMJYvOglbncDv5QCiXo3NHaep7Lcs3pSHpHnhydPqI/yzp7aM1
	dyzBrCiMn/l8/lKGbaagW4pRFYsdb9qGvdc7v53D3oXc8toJe+r34yOfYti5m+eImNcJEOmtRAU
	866e/URqwXUHegXxlFk7BM5ggLp8d/ZmbwX3AzQu0WTxBK
X-Google-Smtp-Source: AGHT+IEfpW95cFqVXQ0nSAYR3LDy2Q2hwQzurdoXxDXVmF7MU4IjYAGODD9+DG0sZTt+iK2i7tSRRDgVJi/4J5ZO/UA=
X-Received: by 2002:a05:6e02:3c02:b0:3d8:2085:a188 with SMTP id
 e9e14a558f8ab-3db842976abmr177477675ab.1.1747728745795; Tue, 20 May 2025
 01:12:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250516133352.36617-2-ziyao@disroot.org> <20250516133352.36617-4-ziyao@disroot.org>
In-Reply-To: <20250516133352.36617-4-ziyao@disroot.org>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 20 May 2025 13:42:15 +0530
X-Gm-Features: AX0GCFtXF1m6Fw0wpbK9RT3WG85ahWYUJT-ws72asRJq3E52raFkNQ8N2DxMb0Q
Message-ID: <CAAhSdy0ENjhV4ogO6Om-AB-7y+HLH4X1CM=WjidfquHW1O5n4w@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] lib: utils: fdt: Claim Zicntr if time CSR
 emulation is possible
To: Yao Zi <ziyao@disroot.org>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_011226_951250_37F1B302 
X-CRM114-Status: GOOD (  23.23  )
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

T24gRnJpLCBNYXkgMTYsIDIwMjUgYXQgNzowNeKAr1BNIFlhbyBaaSA8eml5YW9AZGlzcm9vdC5v
cmc+IHdyb3RlOgo+Cj4gT3BlblNCSSBpcyBjYXBhYmxlIG9mIGVtdWxhdGluZyB0aW1lIENTUiB0
aHJvdWdoIGFuIGV4dGVybmFsIHRpbWVyIGZvcgo+IEhBUlRzIHRoYXQgZG9uJ3QgaW1wbGVtZW50
IGEgZnVsbCBaaWNudHIgZXh0ZW5zaW9uLiBMZXQncyByZWdpc3Rlcgo+IFppY250ciBleHRlbnNp
b24gaW4gdGhlIEZEVCBpZiBDU1IgZW11bGF0aW9uIGlzIGFjdGl2ZS4KPgo+IFRoaXMgYXZvaWRz
IGhhcmRjb2RpbmcgdGhlIGV4dGVuc2lvbiBpbiB0aGUgZGV2aWNldHJlZSwgd2hpY2ggbWF5Cj4g
Y29uZnVzZSBwcmUtU0JJIGJvb3Rsb2FkZXJzLgo+Cj4gU2lnbmVkLW9mZi1ieTogWWFvIFppIDx6
aXlhb0BkaXNyb290Lm9yZz4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBi
cmFpbmZhdWx0Lm9yZz4KCkFwcGxpZWQgdGhpcyBwYXRjaCB0byB0aGUgcmlzY3Yvb3BlbnNiaSBy
ZXBvLgoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICBsaWIvdXRpbHMvZmR0L2ZkdF9maXh1cC5jIHwg
MzMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAz
MiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvbGliL3V0aWxz
L2ZkdC9mZHRfZml4dXAuYyBiL2xpYi91dGlscy9mZHQvZmR0X2ZpeHVwLmMKPiBpbmRleCBlMjM3
ZGQwLi5mM2ZlOGFmIDEwMDY0NAo+IC0tLSBhL2xpYi91dGlscy9mZHQvZmR0X2ZpeHVwLmMKPiAr
KysgYi9saWIvdXRpbHMvZmR0L2ZkdF9maXh1cC5jCj4gQEAgLTE2LDYgKzE2LDcgQEAKPiAgI2lu
Y2x1ZGUgPHNiaS9zYmlfc2NyYXRjaC5oPgo+ICAjaW5jbHVkZSA8c2JpL3NiaV9zdHJpbmcuaD4K
PiAgI2luY2x1ZGUgPHNiaS9zYmlfZXJyb3IuaD4KPiArI2luY2x1ZGUgPHNiaS9zYmlfdGltZXIu
aD4KPiAgI2luY2x1ZGUgPHNiaV91dGlscy9mZHQvZmR0X2ZpeHVwLmg+Cj4gICNpbmNsdWRlIDxz
YmlfdXRpbHMvZmR0L2ZkdF9wbXUuaD4KPiAgI2luY2x1ZGUgPHNiaV91dGlscy9mZHQvZmR0X2hl
bHBlci5oPgo+IEBAIC0xMDcsMTAgKzEwOCwyMSBAQCBpbnQgZmR0X2FkZF9jcHVfaWRsZV9zdGF0
ZXModm9pZCAqZmR0LCBjb25zdCBzdHJ1Y3Qgc2JpX2NwdV9pZGxlX3N0YXRlICpzdGF0ZSkKPgo+
ICB2b2lkIGZkdF9jcHVfZml4dXAodm9pZCAqZmR0KQo+ICB7Cj4gKyAgICAgICBzdHJ1Y3Qgc2Jp
X3NjcmF0Y2ggKnNjcmF0Y2ggPSBzYmlfc2NyYXRjaF90aGlzaGFydF9wdHIoKTsKPiAgICAgICAg
IHN0cnVjdCBzYmlfZG9tYWluICpkb20gPSBzYmlfZG9tYWluX3RoaXNoYXJ0X3B0cigpOwo+ICAg
ICAgICAgaW50IGVyciwgY3B1X29mZnNldCwgY3B1c19vZmZzZXQsIGxlbjsKPiAtICAgICAgIGNv
bnN0IGNoYXIgKm1tdV90eXBlOwo+ICsgICAgICAgY29uc3QgY2hhciAqbW11X3R5cGUsICpleHRl
bnNpb25zOwo+ICAgICAgICAgdTMyIGhhcnRpZCwgaGFydGluZGV4Owo+ICsgICAgICAgYm9vbCBl
bXVsYXRlZF96aWNudHI7Cj4gKwo+ICsgICAgICAgLyoKPiArICAgICAgICAqIENsYWltIFppY250
ciBleHRlbnNpb24gaW4gcmlzY3YsaXNhLWV4dGVuc2lvbnMgaWYKPiArICAgICAgICAqICAxLiBP
cGVuU0JJIGNhbiBlbXVsYXRlIHRpbWUgQ1NSIHdpdGggYSB0aW1lcgo+ICsgICAgICAgICogIDIu
IFRoZSBvdGhlciB0d28gQ1NScyBzcGVjaWZpZWQgYnkgWmljbnRyIGFyZSBhdmFpbGFibGUKPiAr
ICAgICAgICAqLwo+ICsgICAgICAgZW11bGF0ZWRfemljbnRyID0gc2JpX3RpbWVyX2dldF9kZXZp
Y2UoKSAhPSBOVUxMICYmCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICBzYmlfaGFydF9oYXNf
Y3NyKHNjcmF0Y2gsIFNCSV9IQVJUX0NTUl9DWUNMRSkgJiYKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgIHNiaV9oYXJ0X2hhc19jc3Ioc2NyYXRjaCwgU0JJX0hBUlRfQ1NSX0lOU1RSRVQpOwo+
Cj4gICAgICAgICBlcnIgPSBmZHRfb3Blbl9pbnRvKGZkdCwgZmR0LCBmZHRfdG90YWxzaXplKGZk
dCkgKyAzMik7Cj4gICAgICAgICBpZiAoZXJyIDwgMCkKPiBAQCAtMTQwLDYgKzE1MiwyNSBAQCB2
b2lkIGZkdF9jcHVfZml4dXAodm9pZCAqZmR0KQo+ICAgICAgICAgICAgICAgICAgICAgIW1tdV90
eXBlIHx8ICFsZW4pCj4gICAgICAgICAgICAgICAgICAgICAgICAgZmR0X3NldHByb3Bfc3RyaW5n
KGZkdCwgY3B1X29mZnNldCwgInN0YXR1cyIsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICJkaXNhYmxlZCIpOwo+ICsKPiArICAgICAgICAgICAgICAgaWYgKCFl
bXVsYXRlZF96aWNudHIpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gKwo+
ICsgICAgICAgICAgICAgICBleHRlbnNpb25zID0gZmR0X2dldHByb3AoZmR0LCBjcHVfb2Zmc2V0
LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInJpc2N2LGlzYS1l
eHRlbnNpb25zIiwgJmxlbik7Cj4gKyAgICAgICAgICAgICAgIC8qCj4gKyAgICAgICAgICAgICAg
ICAqIEZvciBsZWdhY3kgZGV2aWNldHJlZXMsIGRvbid0IGNyZWF0ZSByaXNjdixpc2EtZXh0ZW5z
aW9ucwo+ICsgICAgICAgICAgICAgICAgKiBwcm9wZXJ0eSBpZiB0aGVyZSBoYXNuJ3QgYmVlbiBh
bHJlYWR5IG9uZS4KPiArICAgICAgICAgICAgICAgICovCj4gKyAgICAgICAgICAgICAgIGlmIChl
eHRlbnNpb25zICYmCj4gKyAgICAgICAgICAgICAgICAgICAhZmR0X3N0cmluZ2xpc3RfY29udGFp
bnMoZXh0ZW5zaW9ucywgbGVuLCAiemljbnRyIikpIHsKPiArICAgICAgICAgICAgICAgICAgICAg
ICBlcnIgPSBmZHRfb3Blbl9pbnRvKGZkdCwgZmR0LCBmZHRfdG90YWxzaXplKGZkdCkgKyAxNik7
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKGVycikKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGNvbnRpbnVlOwo+ICsKPiArICAgICAgICAgICAgICAgICAgICAgICBmZHRf
YXBwZW5kcHJvcF9zdHJpbmcoZmR0LCBjcHVfb2Zmc2V0LAo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAicmlzY3YsaXNhLWV4dGVuc2lvbnMiLCAiemljbnRy
Iik7Cj4gKyAgICAgICAgICAgICAgIH0KPiAgICAgICAgIH0KPiAgfQo+Cj4gLS0KPiAyLjQ5LjAK
Pgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNi
aQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
