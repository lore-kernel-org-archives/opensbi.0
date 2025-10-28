Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD3ECCF9E0
	for <opensbi@archiver.kernel.org>; Tue, 28 Oct 2025 05:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8mtgIdEBY/HZ3TfG9CTVKeujP5VmT37Wxm9evmSzmj0=; b=VURO3+BpTXw1/o
	GPBeJYWOUJO/8dED0OAtEuggfFXhnyok5CnEDn8ZgOkAGkGcguDCmyKRz81lVH+kqWfxPVKSCcwLv
	b4PJzkut4vjXmMVKUSf6vlldmMssR/9zNq6efJqqrSqC+2SEo41+E+zREToXtj3mzEZN+RH8PraNt
	1rL9cayAnXIWb4TAHb/37dxFexDqvoEa7uaVvfSiED/2gLzH1nOtAF+RS/s7vIdSvsVPbRmVldDjZ
	P/bG5hG239FS5IhfZAMBIHtC0PJdQE9dDc7Xdoe/AddVtFbwDEfVrfIIAS2pcnt9Ky+PzDdA+F0Gc
	4oiNgPb99HgRp3JS4tiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDbqB-0000000FEF8-3xUK;
	Tue, 28 Oct 2025 05:01:51 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDbq9-0000000FEEf-3qEz
	for opensbi@lists.infradead.org;
	Tue, 28 Oct 2025 05:01:51 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-430c773eec6so53898365ab.0
        for <opensbi@lists.infradead.org>; Mon, 27 Oct 2025 22:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1761627709; x=1762232509; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrl+ZA4mtxD9nrPYaxMfO4MIZ0am+GXKM6FAxSHtY7g=;
        b=h0MdIJl8D7/87JdCVqxKMW/U3CJpAw1aZGMp2VM3ogYHYdczQYYpcdZQvV9rOUjJ0X
         QVnJuX8rMu7umJxEInXN8gHtpoPjDdzK6rSEJWSfkZ7AbCnbzu4Pmn4/zN4m7DqG/I7D
         kzcakXwS55lu6PxxMXfA47wCUrOfhMOyqYrkraPOb+dCmNGoF1d7P3I3kGm8q0tECwhy
         WBv3y4vVpratJKQDK+Mq676oaMaWrMCHUkWcoQienGEHlmxa5e3d3FdIodBWzOyp6R6W
         F7m751oclel3HejNc4tTI9gkq7MNxMoPK8who2C4Jc7Sd8QcRd9aM3JJyaUp5h9RF2Ru
         wqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761627709; x=1762232509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mrl+ZA4mtxD9nrPYaxMfO4MIZ0am+GXKM6FAxSHtY7g=;
        b=EFS6RQiAaijGrleQYldlYxisq1p7lKWHwA3wqR4LgBxr3czmKAxvbHmGqZK/T1x8nP
         VSG/huFn/Pm6w6tAfHFnpIO9bmmHtlgmJBDamzgQkjD6MbqLMsC9WX2sjfQrMKw4u8C9
         rUdVrrzDGt46fzBVAhJtYl6x8KHPWLgRTngAby6cn/UvdJiwrzDo9aqfV9iisRTmQVpp
         sFL2rdv860bsZwjOtAUPYiCAesiGAMNPSx6xzFWS3x2kOhbFxAq//YGdAu9J1b5G8y3z
         e3xMBCQpMp7xhj3sJKRSQ4Y3dWppRlNwOoYhz3gBCoQ/bwtCRNpmgwNrWmTN6uzOKVba
         dbkA==
X-Gm-Message-State: AOJu0YwZZKSW7HXkmd0ZMIII0KVxTg9tIdnmBBV3//pDeMDHtZvDHYl0
	IrcTRAtv5y5y4EZvPi7qk0qElH2qzHR/l5EhT8OFMbA7uBddnx6Wum/IwHfEgdZo/BQUlxrYmZS
	BI2CzDIiIidFMZJDqeEzIT+crQfRDsCCeGNz0SgJS9LYpf4yIBJohs8s=
X-Gm-Gg: ASbGnctYGzEcNARc7HyDHrdbI3oYmmHwZrf+88cC3m44IdvNQcz7oqYytP5rc8qumGg
	2Vhl3UIWcEkovbDWfpsZt1XLOK+yzkGCr2rfh8Dz2XHyvhM5PRgVb0qn93CT189iJ1R09eRof8L
	UiqDncaV2SpiVdmy7m5lG1FGN9EI0kXNCKq1xJL3OD1k1hHtDvkn6RdUAf9GKB3cpDYzcOZ6l9U
	0cwzBpweDeIhIsaJ0GULunGksc526yJQFv5WZAoATM281bjoP385zVrn7BKpn+UTrubZ8H2BBSJ
	eRg1nwe5ZnbE3x5lbQ==
X-Google-Smtp-Source: AGHT+IEQrm8haNA2VwhyadWst5RsEszqWuQ1sbKLVxgf0KyZCsxvZrqU++8eKC0q2sMLI3rYQqnJHwBfxKc0v7tSMM4=
X-Received: by 2002:a92:cdaa:0:b0:430:a530:ede2 with SMTP id
 e9e14a558f8ab-4320f842c93mr34084675ab.24.1761627708870; Mon, 27 Oct 2025
 22:01:48 -0700 (PDT)
MIME-Version: 1.0
References: <20251020-cache-upstream-v7-0-69a132447d8a@sifive.com> <20251020-cache-upstream-v7-11-69a132447d8a@sifive.com>
In-Reply-To: <20251020-cache-upstream-v7-11-69a132447d8a@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 28 Oct 2025 10:31:38 +0530
X-Gm-Features: AWmQ_bm1if0wLxq6HyPrrEcZc8s4RDzVBhpwcFHjXAwESIGVowzhtgw7h55OaDQ
Message-ID: <CAAhSdy0g+rMypEzzSJvNQOHibKopWOY-tvF=dxTZrtb6VUbNUQ@mail.gmail.com>
Subject: Re: [PATCH v7 11/12] lib: sbi: Add system_resume callback for
 restoring the system
To: Nick Hu <nick.hu@sifive.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_220149_963442_E8922951 
X-CRM114-Status: GOOD (  19.68  )
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

T24gTW9uLCBPY3QgMjAsIDIwMjUgYXQgMTE6NTfigK9BTSBOaWNrIEh1IDxuaWNrLmh1QHNpZml2
ZS5jb20+IHdyb3RlOgo+Cj4gVGhlIGxhc3QgY29yZSB3aG8gcGVyZm9ybXMgdGhlIHN5c3RlbSBz
dXNwZW5kIGlzIHJlc3BvbnNpYmxlIGZvcgo+IHJlc3RvcmluZyB0aGUgc3lzdGVtIGFmdGVyIHdh
a2luZyB1cC4gQWRkIHRoZSBzeXN0ZW1fcmVzdW1lIGNhbGxiYWNrIGZvcgo+IHJlc3RvcmluZyB0
aGUgc3lzdGVtIGZyb20gc3VzcGVuZC4KPgo+IFN1Z2dlc3RlZC1ieTogQW51cCBQYXRlbCA8YW51
cEBicmFpbmZhdWx0Lm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBOaWNrIEh1IDxuaWNrLmh1QHNpZml2
ZS5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5v
cmc+CgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+ICBpbmNsdWRlL3NiaS9zYmlfc3lzdGVtLmggfCAg
NyArKysrKysrCj4gIGxpYi9zYmkvc2JpX2hzbS5jICAgICAgICB8ICA1ICsrKystCj4gIGxpYi9z
Ymkvc2JpX3N5c3RlbS5jICAgICB8IDE3ICsrKysrKysrKysrKysrKysrCj4gIDMgZmlsZXMgY2hh
bmdlZCwgMjggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvc2JpL3NiaV9zeXN0ZW0uaCBiL2luY2x1ZGUvc2JpL3NiaV9zeXN0ZW0uaAo+IGluZGV4
IDBmZGNjOThjY2U1ZGFjNDM1ODNlNjhmZmE4Yzk4ZTc5ZmQ5NWRhZDQuLmY0OGEwMTlhMDZiNjk1
N2I1YWI5Y2I0YjllZjc5NWE4OTlhMzRmZjkgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9zYmkvc2Jp
X3N5c3RlbS5oCj4gKysrIGIvaW5jbHVkZS9zYmkvc2JpX3N5c3RlbS5oCj4gQEAgLTY5LDExICs2
OSwxOCBAQCBzdHJ1Y3Qgc2JpX3N5c3RlbV9zdXNwZW5kX2RldmljZSB7Cj4gICAgICAgICAgKiAg
ICAgcmV0dXJuIGZyb20gc3lzdGVtX3N1c3BlbmQoKSBtYXkgaWdub3JlIHRoaXMgcGFyYW1ldGVy
Lgo+ICAgICAgICAgICovCj4gICAgICAgICBpbnQgKCpzeXN0ZW1fc3VzcGVuZCkodTMyIHNsZWVw
X3R5cGUsIHVuc2lnbmVkIGxvbmcgbW1vZGVfcmVzdW1lX2FkZHIpOwo+ICsKPiArICAgICAgIC8q
Kgo+ICsgICAgICAgICogUmVzdW1lIHRoZSBzeXN0ZW0gZnJvbSBzeXN0ZW0gc3VzcGVuZAo+ICsg
ICAgICAgICovCj4gKyAgICAgICB2b2lkICgqc3lzdGVtX3Jlc3VtZSkodm9pZCk7Cj4gIH07Cj4K
PiAgY29uc3Qgc3RydWN0IHNiaV9zeXN0ZW1fc3VzcGVuZF9kZXZpY2UgKnNiaV9zeXN0ZW1fc3Vz
cGVuZF9nZXRfZGV2aWNlKHZvaWQpOwo+ICB2b2lkIHNiaV9zeXN0ZW1fc3VzcGVuZF9zZXRfZGV2
aWNlKHN0cnVjdCBzYmlfc3lzdGVtX3N1c3BlbmRfZGV2aWNlICpkZXYpOwo+ICB2b2lkIHNiaV9z
eXN0ZW1fc3VzcGVuZF90ZXN0X2VuYWJsZSh2b2lkKTsKPiArdm9pZCBzYmlfc3lzdGVtX3Jlc3Vt
ZSh2b2lkKTsKPiArYm9vbCBzYmlfc3lzdGVtX2lzX3N1c3BlbmRlZCh2b2lkKTsKPiAgYm9vbCBz
Ymlfc3lzdGVtX3N1c3BlbmRfc3VwcG9ydGVkKHUzMiBzbGVlcF90eXBlKTsKPiAgaW50IHNiaV9z
eXN0ZW1fc3VzcGVuZCh1MzIgc2xlZXBfdHlwZSwgdWxvbmcgcmVzdW1lX2FkZHIsIHVsb25nIG9w
YXF1ZSk7Cj4KPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfaHNtLmMgYi9saWIvc2JpL3NiaV9o
c20uYwo+IGluZGV4IDBkOTdiNDNlMGNkOGY3YjRmYzk3NDA3ZWYwMTAwNzQ4NWUzZjVhMjQuLjBh
MzU1ZjljMjM3MjA3NWFhZjMwM2NiYTJhYTU2ODM5OTNjNGMwNzkgMTAwNjQ0Cj4gLS0tIGEvbGli
L3NiaS9zYmlfaHNtLmMKPiArKysgYi9saWIvc2JpL3NiaV9oc20uYwo+IEBAIC00NTUsNyArNDU1
LDEwIEBAIHZvaWQgc2JpX2hzbV9oYXJ0X3Jlc3VtZV9zdGFydChzdHJ1Y3Qgc2JpX3NjcmF0Y2gg
KnNjcmF0Y2gpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTQklf
SFNNX1NUQVRFX1JFU1VNRV9QRU5ESU5HKSkKPiAgICAgICAgICAgICAgICAgc2JpX2hhcnRfaGFu
ZygpOwo+Cj4gLSAgICAgICBoc21fZGV2aWNlX2hhcnRfcmVzdW1lKCk7Cj4gKyAgICAgICBpZiAo
c2JpX3N5c3RlbV9pc19zdXNwZW5kZWQoKSkKPiArICAgICAgICAgICAgICAgc2JpX3N5c3RlbV9y
ZXN1bWUoKTsKPiArICAgICAgIGVsc2UKPiArICAgICAgICAgICAgICAgaHNtX2RldmljZV9oYXJ0
X3Jlc3VtZSgpOwo+ICB9Cj4KPiAgdm9pZCBfX25vcmV0dXJuIHNiaV9oc21faGFydF9yZXN1bWVf
ZmluaXNoKHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCwKPiBkaWZmIC0tZ2l0IGEvbGliL3Ni
aS9zYmlfc3lzdGVtLmMgYi9saWIvc2JpL3NiaV9zeXN0ZW0uYwo+IGluZGV4IGNkMGY0YmE0MmJi
ZTY3ZTYwNmJjODIxODcwNzE2ZjczNDJlYWYwZDIuLjU1MDBiMDVkMjI4ODJiZDQzZDg0YTFiNzE1
NTI5Y2Q4YTI2YmVlM2YgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfc3lzdGVtLmMKPiArKysg
Yi9saWIvc2JpL3NiaV9zeXN0ZW0uYwo+IEBAIC04Nyw2ICs4Nyw3IEBAIHZvaWQgX19ub3JldHVy
biBzYmlfc3lzdGVtX3Jlc2V0KHUzMiByZXNldF90eXBlLCB1MzIgcmVzZXRfcmVhc29uKQo+ICB9
Cj4KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBzYmlfc3lzdGVtX3N1c3BlbmRfZGV2aWNlICpzdXNw
ZW5kX2RldiA9IE5VTEw7Cj4gK3N0YXRpYyBib29sIHN5c3RlbV9zdXNwZW5kZWQ7Cj4KPiAgY29u
c3Qgc3RydWN0IHNiaV9zeXN0ZW1fc3VzcGVuZF9kZXZpY2UgKnNiaV9zeXN0ZW1fc3VzcGVuZF9n
ZXRfZGV2aWNlKHZvaWQpCj4gIHsKPiBAQCAtMTM3LDYgKzEzOCwxOSBAQCBib29sIHNiaV9zeXN0
ZW1fc3VzcGVuZF9zdXBwb3J0ZWQodTMyIHNsZWVwX3R5cGUpCj4gICAgICAgICAgICAgICAgc3Vz
cGVuZF9kZXYtPnN5c3RlbV9zdXNwZW5kX2NoZWNrKHNsZWVwX3R5cGUpID09IDA7Cj4gIH0KPgo+
ICtib29sIHNiaV9zeXN0ZW1faXNfc3VzcGVuZGVkKHZvaWQpCj4gK3sKPiArICAgICAgIHJldHVy
biBzeXN0ZW1fc3VzcGVuZGVkOwo+ICt9Cj4gKwo+ICt2b2lkIHNiaV9zeXN0ZW1fcmVzdW1lKHZv
aWQpCj4gK3sKPiArICAgICAgIGlmIChzdXNwZW5kX2RldiAmJiBzdXNwZW5kX2Rldi0+c3lzdGVt
X3Jlc3VtZSkKPiArICAgICAgICAgICAgICAgc3VzcGVuZF9kZXYtPnN5c3RlbV9yZXN1bWUoKTsK
PiArCj4gKyAgICAgICBzeXN0ZW1fc3VzcGVuZGVkID0gZmFsc2U7Cj4gK30KPiArCj4gIGludCBz
Ymlfc3lzdGVtX3N1c3BlbmQodTMyIHNsZWVwX3R5cGUsIHVsb25nIHJlc3VtZV9hZGRyLCB1bG9u
ZyBvcGFxdWUpCj4gIHsKPiAgICAgICAgIHN0cnVjdCBzYmlfZG9tYWluICpkb20gPSBzYmlfZG9t
YWluX3RoaXNoYXJ0X3B0cigpOwo+IEBAIC0xODksMTEgKzIwMywxNCBAQCBpbnQgc2JpX3N5c3Rl
bV9zdXNwZW5kKHUzMiBzbGVlcF90eXBlLCB1bG9uZyByZXN1bWVfYWRkciwgdWxvbmcgb3BhcXVl
KQo+ICAgICAgICAgX19zYmlfaHNtX3N1c3BlbmRfbm9uX3JldF9zYXZlKHNjcmF0Y2gpOwo+Cj4g
ICAgICAgICAvKiBTdXNwZW5kICovCj4gKyAgICAgICBzeXN0ZW1fc3VzcGVuZGVkID0gdHJ1ZTsK
PiAgICAgICAgIHJldCA9IHN1c3BlbmRfZGV2LT5zeXN0ZW1fc3VzcGVuZChzbGVlcF90eXBlLCBz
Y3JhdGNoLT53YXJtYm9vdF9hZGRyKTsKPiAgICAgICAgIGlmIChyZXQgIT0gU0JJX09LKSB7Cj4g
ICAgICAgICAgICAgICAgIGlmICghc2JpX2hzbV9oYXJ0X2NoYW5nZV9zdGF0ZShzY3JhdGNoLCBT
QklfSFNNX1NUQVRFX1NVU1BFTkRFRCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFNCSV9IU01fU1RBVEVfU1RBUlRFRCkpCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgc2JpX2hhcnRfaGFuZygpOwo+ICsKPiArICAgICAgICAgICAgICAgc3lzdGVtX3N1
c3BlbmRlZCA9IGZhbHNlOwo+ICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ICAgICAgICAg
fQo+Cj4KPiAtLQo+IDIuMzQuMQo+CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vb3BlbnNiaQo=
