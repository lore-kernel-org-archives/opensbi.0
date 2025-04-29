Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E62EC3ABAF
	for <opensbi@archiver.kernel.org>; Tue, 29 Apr 2025 16:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wg3Q0euKXgdtRmaC2H8JzNptkB0dN9xJS935j/Esvq8=; b=LrGKRkWiUZWeVp
	Zj/oaBMtu5pEhiWDmfhB4y5oreKXMe+cbJNwNb5Xafekn+Z4h3UA3BVF4qgFbvPdDZXCzc6es3Qhr
	HvY8PJa7cAUEQK/uMEId+V4LtcI6PfoC9CE1fRuigqvub/YQjK798AGfLY4fnF8d1XiitosW/OZfK
	sfMxNUtc4BuEQprhkhdP+cug0d1H9VO4LXe+LXtFACID7GL0VU/DSijKvAdYGqrrQK2pmQ8qYQy0N
	4KOxxH8pklnOKiAMWxMYuREuNHxXL9HOKCpmYLTG42a8GyR+qw6N0brT3qOFmwoEB+tuE7b9KvfD7
	pG0cVRv9uilf/zZVqDrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9o68-0000000AIcJ-27ce;
	Tue, 29 Apr 2025 16:46:20 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9lyE-00000009xXo-3Ezs
	for opensbi@lists.infradead.org;
	Tue, 29 Apr 2025 14:30:03 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-39123ad8a9fso411675f8f.2
        for <opensbi@lists.infradead.org>; Tue, 29 Apr 2025 07:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745937001; x=1746541801; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IcXkSjrKRH4ZRQBNlgOg9IRprHImM5uiIBH4ysrHRx0=;
        b=Ril+maeDV9vhDBc7DP2M3tx79Iasc7YAtSxP3PyClMb+GL6xircmGXPAakEmRpQjYv
         jRuOKfGt1sXQWWKHqblmJ18uh7MC9iuGyQULmqJTSrmOGo/s1HV0odmW1ndyspyMklB7
         iwFl0dxYpS4aGy44bSYY82NIvYexSoQY6iLK9U2IxDnfRBBnhitDB7GNwDs781Bc8U3d
         +pXgui1/7FZfnNuplU5gKeFO90W56v74qPbsKym0iAqdm/EhuOObTbgfkCLMF/VWBlze
         e50B1aeHlKP0iXcmwckK3H3dWZi7FN1ZsfSlP9z25a+GFB1R7eVEuQt5ume7xkzs/A5k
         uSgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745937001; x=1746541801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IcXkSjrKRH4ZRQBNlgOg9IRprHImM5uiIBH4ysrHRx0=;
        b=PcCLRHVtIkDqP9O+EEL49D+vnqj9VDabI46LAwVRPCpa9DkYmDa/tX8J108sDu8AUw
         chIaW+79+km7wTdavjXjT+wG9ZdHYAg/tfV3PIVVSmsKSK5PPwfE8TmR+W3KzSsQQtLO
         d9s7CFMWWO0jl51A3RI3+HgWZvl/vwVU6xVd5uInaSADOR38Jh6JrAwofCEBBWqZNpYY
         LOawomcDd2KEkz3ngH1D2UMibidc734oczxbrewqDlwTMuahX4TZn9prJpjB4f4EjGKB
         8ZZW0v2PexzaKxg522ckcll/eHUP05593n6GJzg00URkz4FpeKw8zWp3ck1qghJOJsUq
         DUcQ==
X-Gm-Message-State: AOJu0YwJi9lwyAXi1SEkqiwa0XTqNQ5fm7CyZnr9BBAesEef8usybsXx
	54+54Yt7FUrtDvFdtfO8skpRrQKBOjBNKrLvYTg0YXAU2XvF6+auLZ/xjMSRxvXZfu9zOU4JUpJ
	51mQ=
X-Gm-Gg: ASbGncsJdEc94C4fgFYKwNJp0xio1tnB5PWhCp5Dt3Njvsq86kEtSTSI12dzOmv6sY1
	9sglG9u82GJNAn8+/cCcoNRC1lAFrAJJeSryRDb0R+iYX9Lk2BgDVPfGQCxrPw2o4dlzs+PZOUV
	53T5OVhsA9/hkZaHfCDKDqOiWUhzKvI2kXvESKbXpQZhcwNWVG/3bJghYTRpx4gWLAJRH+9KYXU
	YaxJTLjoFO6S4olQ69XLBQBlZGsxcKbK0Kr3UqSobQR7fvSNqXp2qb6tI0gazbJ+f2TZhMo4tjt
	bJ6bve0M/ZY94VgJCwqTaLhCHlUzyiosnpKhzdnjFGuixLoV
X-Google-Smtp-Source: AGHT+IEG89QuehyyHcdoqs+kYe8gy202rayaVWw20nXnDVS5vhxMV4joUCNbeZt0FGSOD+K6TIAjrA==
X-Received: by 2002:a05:6000:1862:b0:3a0:87f1:2f08 with SMTP id ffacd0b85a97d-3a08a20d896mr1131671f8f.2.1745937000836;
        Tue, 29 Apr 2025 07:30:00 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:b996:f7e3:35e8:5091])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5e1c6sm14452853f8f.98.2025.04.29.07.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 07:30:00 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: opensbi@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>
Subject: [PATCH v2 1/8] lib: sbi: add 64 bit csr macros
Date: Tue, 29 Apr 2025 16:25:43 +0200
Message-ID: <20250429142549.3673976-3-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250429142549.3673976-2-rkrcmar@ventanamicro.com>
References: <20250429142549.3673976-2-rkrcmar@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_073002_809100_1DEDDB28 
X-CRM114-Status: GOOD (  10.16  )
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

TW9zdCBDU1JzIGFyZSBYTEVOIGJpdHMgd2lkZSwgYnV0IHNvbWUgYXJlIDY0IGJpdCwgc28gcnYz
MiBuZWVkcyB0d28KYWNjZXNzZXMsIHBsYWd1aW5nIHRoZSBjb2RlIHdpdGggaWZkZWZzLgoKQWRk
IG5ldyBoZWxwZXJzIHRoYXQgc3BsaXQgNjQgYml0IG9wZXJhdGlvbiBpbnRvIHR3byBvcGVyYXRp
b25zIG9uIHJ2MzIuCgpUaGUgaGVscGVycyBkb24ndCB1c2UgImNzciArIDB4MTAiLCBidXQgYXBw
ZW5kICJIIiBhdCB0aGUgZW5kIG9mIHRoZSBjc3IKbmFtZSB0byBnZXQgYSBjb21waWxlLXRpbWUg
ZXJyb3Igd2hlbiBhY2Nlc3NpbmcgYSBub24gNjQgYml0IHJlZ2lzdGVyLgpUaGlzIGhhcyB0aGUg
ZG93bnNpZGUgdGhhdCB5b3UgaGF2ZSB0byB1c2UgdGhlIG5hbWUgd2hlbiBhY2Nlc3NpbmcgdGhl
bS4KZS5nLiBjc3JfcmVhZDY0KDB4MTIzNCkgb3IgY3NyX3JlYWQ2NChDU1JfU0FUUCkgd29uJ3Qg
Y29tcGlsZSBhbmQgdGhlCmVycm9yIG1lc3NhZ2VzIHlvdSBnZXQgZm9yIHRoZXNlIGJ1Z3MgYXJl
IG5vdCBzdHJhaWdodGZvcndhcmQuCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFp
bmZhdWx0Lm9yZz4KU2lnbmVkLW9mZi1ieTogUmFkaW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRh
bmFtaWNyby5jb20+Ci0tLQp2MjoKKiBSZW1vdmUgcmVkdW5kYW50IG5ld2xpbmUuIFtBbnVwXQoq
IEFkZCBSZXZpZXdlZC1ieSBbQW51cF0KLS0tCiBpbmNsdWRlL3NiaS9yaXNjdl9hc20uaCB8IDIw
ICsrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3Jpc2N2X2FzbS5oIGIvaW5jbHVkZS9zYmkvcmlzY3Zf
YXNtLmgKaW5kZXggNDYwNWRiMjBiZDdhLi5lZjQ4ZGM4OWFkZjEgMTAwNjQ0Ci0tLSBhL2luY2x1
ZGUvc2JpL3Jpc2N2X2FzbS5oCisrKyBiL2luY2x1ZGUvc2JpL3Jpc2N2X2FzbS5oCkBAIC0xNTYs
NiArMTU2LDI2IEBACiAJCQkJICAgICA6ICJtZW1vcnkiKTsgICAgICAgICAgICAgICAgICBcCiAJ
fSkKIAorI2lmIF9fcmlzY3ZfeGxlbiA9PSA2NAorI2RlZmluZSBfX2NzcnJ3NjQob3AsIGNzciwg
Y3NyaCwgdmFsKSAodHJ1ZSA/IG9wKGNzciwgdmFsKSA6ICh1aW50NjRfdCljc3JoKQorI2RlZmlu
ZSBfX2NzcnI2NCggb3AsIGNzciwgY3NyaCkgICAgICAodHJ1ZSA/IG9wKGNzcikgICAgICA6ICh1
aW50NjRfdCljc3JoKQorI2RlZmluZSBfX2Nzcnc2NCggb3AsIGNzciwgY3NyaCwgdmFsKSAodHJ1
ZSA/IG9wKGNzciwgdmFsKSA6ICh1aW50NjRfdCljc3JoKQorI2VsaWYgX19yaXNjdl94bGVuID09
IDMyCisjZGVmaW5lIF9fY3Nycnc2NChvcCwgY3NyLCBjc3JoLCB2YWwpICggIG9wKGNzciwgdmFs
KSB8ICh1aW50NjRfdClvcChjc3JoLCB2YWwgPj4gMzIpIDw8IDMyKQorI2RlZmluZSBfX2NzcnI2
NCggb3AsIGNzciwgY3NyaCkgICAgICAoICBvcChjc3IpICAgICAgfCAodWludDY0X3Qpb3AoY3Ny
aCkgICAgICAgICAgICA8PCAzMikKKyNkZWZpbmUgX19jc3J3NjQoIG9wLCBjc3IsIGNzcmgsIHZh
bCkgKHsgb3AoY3NyLCB2YWwpOyAgICAgICAgICAgIG9wKGNzcmgsIHZhbCA+PiAzMik7ICAgIH0p
CisjZW5kaWYKKworI2RlZmluZSBjc3Jfc3dhcDY0KCAgICAgICAgY3NyLCB2YWwpIF9fY3Nycnc2
NChjc3Jfc3dhcCwgICAgICAgICBjc3IsIGNzciAjIyBILCB2YWwpCisjZGVmaW5lIGNzcl9yZWFk
NjQoICAgICAgICBjc3IpICAgICAgX19jc3JyNjQgKGNzcl9yZWFkLCAgICAgICAgIGNzciwgY3Ny
ICMjIEgpCisjZGVmaW5lIGNzcl9yZWFkX3JlbGF4ZWQ2NChjc3IpICAgICAgX19jc3JyNjQgKGNz
cl9yZWFkX3JlbGF4ZWQsIGNzciwgY3NyICMjIEgpCisjZGVmaW5lIGNzcl93cml0ZTY0KCAgICAg
ICBjc3IsIHZhbCkgX19jc3J3NjQgKGNzcl93cml0ZSwgICAgICAgIGNzciwgY3NyICMjIEgsIHZh
bCkKKyNkZWZpbmUgY3NyX3JlYWRfc2V0NjQoICAgIGNzciwgdmFsKSBfX2NzcnJ3NjQoY3NyX3Jl
YWRfc2V0LCAgICAgY3NyLCBjc3IgIyMgSCwgdmFsKQorI2RlZmluZSBjc3Jfc2V0NjQoICAgICAg
ICAgY3NyLCB2YWwpIF9fY3NydzY0IChjc3Jfc2V0LCAgICAgICAgICBjc3IsIGNzciAjIyBILCB2
YWwpCisjZGVmaW5lIGNzcl9jbGVhcjY0KCAgICAgICBjc3IsIHZhbCkgX19jc3J3NjQgKGNzcl9j
bGVhciwgICAgICAgIGNzciwgY3NyICMjIEgsIHZhbCkKKyNkZWZpbmUgY3NyX3JlYWRfY2xlYXI2
NCggIGNzciwgdmFsKSBfX2NzcnJ3NjQoY3NyX3JlYWRfY2xlYXIsICAgY3NyLCBjc3IgIyMgSCwg
dmFsKQorI2RlZmluZSBjc3JfY2xlYXI2NCggICAgICAgY3NyLCB2YWwpIF9fY3NydzY0IChjc3Jf
Y2xlYXIsICAgICAgICBjc3IsIGNzciAjIyBILCB2YWwpCisKIHVuc2lnbmVkIGxvbmcgY3NyX3Jl
YWRfbnVtKGludCBjc3JfbnVtKTsKIAogdm9pZCBjc3Jfd3JpdGVfbnVtKGludCBjc3JfbnVtLCB1
bnNpZ25lZCBsb25nIHZhbCk7Ci0tIAoyLjQ4LjEKCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QK
b3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
