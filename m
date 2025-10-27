Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88892CCF9E5
	for <opensbi@archiver.kernel.org>; Mon, 27 Oct 2025 11:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KfhHPZr00Lut2wyGBxZUDGn9oydEcnG248GBxjI+81k=; b=n9j2+Gg/q+cSka
	4B9G2CMWFnRofgDwmQJ/VJiSWjLCCIeywFFGLfjILtKw+Kh7GFTo01cB6BqKAIsnL/p9lftfpTULg
	roVbLD6HeiQYSgut9l/Q9+W2Ug/h6KcO0bX1poamCo8RX2L/M9BG3P+p72lRO8dQlCWdfXOEwNox0
	pqkLG9QgAa6Q6GkdkFBEqPdwhZdh/YNQBKxD1BdlRv/ctSaRc+c/1ugpsFDdEAf7sVlNYbQlg/zD+
	S5H8b1LLaw2suLaIGBd6D0SpRWNdtrhKTYSCD0+q+baChbabzCkCv+DSF7IhKRMUWGqaDALd57Kev
	DLf/Uye3oXtlzC07rhRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLTS-0000000DlrD-2bJr;
	Mon, 27 Oct 2025 11:33:18 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLTQ-0000000DlqQ-0LdT
	for opensbi@lists.infradead.org;
	Mon, 27 Oct 2025 11:33:17 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-93e2c9821fcso414220939f.3
        for <opensbi@lists.infradead.org>; Mon, 27 Oct 2025 04:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1761564795; x=1762169595; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2P49IMWaVshxPznnO9AKKu+/9ML2ccJ69NUoyPBN4Hg=;
        b=d7SPCxcpyjyjNKEN1F9bhwcGXKYxp+mD+Q1RvXY58PMjQNr/dfVqkhY9DgtxtAKoqZ
         n4VjNnyJ/5UEXKRYfTOyb3l9Juwh4vcHS67etGFyq8dcT/3zxiRv1VXWd9+AFDYh9y8r
         StJIsph3kuSrcI4yFoAtZJzF9JXjsj7dxbBkEoaN7S3KiKzuRlUP3oqT9KlEUYRUCQEp
         8g3FMuVdt1g7FIfwKQNJ7KIy7zTV3BvNYwqIrQ6iOh9BBfnXDKFNt09Qc4I+TdgvRI02
         CUM82V5A0H+K6DIFTpQ75d0RJZAzzuDWQQ+OiBGdJGaDb7kdUQhxWvbaJh0BZicfzRLw
         8fEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761564795; x=1762169595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2P49IMWaVshxPznnO9AKKu+/9ML2ccJ69NUoyPBN4Hg=;
        b=mtRvvo2kLcgfnFBkk2fYwOaCLRGUXa5ncH+5LFkxYZmI17CFDTPKNRrBU4xQSNUQI7
         xvWHJctHCylVCyATyfQUpCuYS7wfIn47h4MszPrXrZ1WiDt36sDrL94Y9bdf52PN6fZU
         NSCpqyOXROTsY4HfLntEZNNcMuSp+n2qnVgiIEpKFvprVk5+9SxEeNFED2GL0tcvET5w
         z7/FV+tY5EMB8GcoFhNG0Bt+u6AumooGgXwIiSCx0HNGFjGrvvQFogU2h22Skhj2rVSQ
         w5PLCEsXWQrDwZz8mnWaRaWoEzPSnzD0OnDpacUvJdkiMcU7Cic0kprMKUPArDw7u31F
         AtLQ==
X-Gm-Message-State: AOJu0Yz04fptffMl8Bnf9ktkWCD4w7mXihz5Mw4/F7+YlC7yBDcmj3xV
	+BwYWVyi8WHqTIWUM46ey8USz0pZTOflNfdPfOWI21VNVZhWAOF+rGe0NhdqqzWQkOez0tlcrS/
	KB5Qcl8NeNNwVUJRtgIB/ID38oqX232WZaB/Z9G9hQbRvO/YBD9+2phk=
X-Gm-Gg: ASbGncuC1VvFGXgjSuwujWsgneL7lGyF7bFc/rZuVqHtnrzbyQOPnIlhnw7dZ3ywvYy
	E+cb2JfeyoEWnFEnk2bJOjgER6N/+EVqGnH3LhGy3+XbJC/5tpEJxGyshidHhK3FNZqPYAQXngk
	tSS0tKUKeCkbgj+MT82NBe/5WwTCfzj2r35BgO/1U4U57dwYxcZNdAnZFJ80BMSQ6oQt2gfDdsh
	WxXM/z/tzLk8fNqmHODwoC89zzs8gv0A0pTHGR3jHePqq3E+FiW3FNgsM8hFWjPNlcgOql7RxGW
	b00D/oTPhavaW6tPEheIMjRMXOgrfUAYxzdO3X8=
X-Google-Smtp-Source: AGHT+IG1+OyFuemRgKg2ABQo9UaTaYNRcSd9d8rKR7pMGz05L1T2FA6NDf/iZzbDCnCHX6SKaI5MF5n3B5Evu/v8Cco=
X-Received: by 2002:a05:6e02:4510:b0:430:c77c:cc35 with SMTP id
 e9e14a558f8ab-430c77ccd47mr480500945ab.29.1761564795137; Mon, 27 Oct 2025
 04:33:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250918090706.2217603-1-alexander.chuprunov@syntacore.com> <20250918090706.2217603-3-alexander.chuprunov@syntacore.com>
In-Reply-To: <20250918090706.2217603-3-alexander.chuprunov@syntacore.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 27 Oct 2025 17:03:02 +0530
X-Gm-Features: AWmQ_bnK8y_8Y96kqp8Wh0Q6adgKyC-E7jVIDonZp23_bppA7ylF-GfA2RkkHh8
Message-ID: <CAAhSdy1xeztxC6XMK1Nn58641Y2E5QybunuWc8971maiM2=8kw@mail.gmail.com>
Subject: Re: [PATCH 2/3] lib: sbi: sbi_pmu: fixed alignment
To: Alexander Chuprunov <alexander.chuprunov@syntacore.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_043316_121931_8EEE2562 
X-CRM114-Status: GOOD (  14.90  )
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

T24gVGh1LCBTZXAgMTgsIDIwMjUgYXQgMjozN+KAr1BNIEFsZXhhbmRlciBDaHVwcnVub3YKPGFs
ZXhhbmRlci5jaHVwcnVub3ZAc3ludGFjb3JlLmNvbT4gd3JvdGU6Cj4KPiBEZWxldGVkIHNwYWNl
cyBiZWZvcmUgYnJhY2UgaW4gcG11X2N0cl9zdGFydF9mdygpIGZvciBjb3JyZWN0IGFsaWdubWVu
dC4KPgo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBDaHVwcnVub3YgPGFsZXhhbmRlci5jaHVw
cnVub3ZAc3ludGFjb3JlLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51
cEBicmFpbmZhdWx0Lm9yZz4KCkFwcGxpZWQgdGhpcyBwYXRjaCB0byB0aGUgcmlzY3Yvb3BlbnNi
aSByZXBvLgoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICBsaWIvc2JpL3NiaV9wbXUuYyB8IDIgKy0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvbGliL3NiaS9zYmlfcG11LmMgYi9saWIvc2JpL3NiaV9wbXUuYwo+IGluZGV4IDA3
MThiM2VkLi41ZDk4YTUzMiAxMDA2NDQKPiAtLS0gYS9saWIvc2JpL3NiaV9wbXUuYwo+ICsrKyBi
L2xpYi9zYmkvc2JpX3BtdS5jCj4gQEAgLTQzMiw3ICs0MzIsNyBAQCBzdGF0aWMgaW50IHBtdV9j
dHJfc3RhcnRfZncoc3RydWN0IHNiaV9wbXVfaGFydF9zdGF0ZSAqcGhzLAo+ICAgICAgICAgICAg
ICAgICAgICAgIXBtdV9kZXYtPmZ3X2NvdW50ZXJfd3JpdGVfdmFsdWUgfHwKPiAgICAgICAgICAg
ICAgICAgICAgICFwbXVfZGV2LT5md19jb3VudGVyX3N0YXJ0KSB7Cj4gICAgICAgICAgICAgICAg
ICAgICAgICAgcmV0dXJuIFNCSV9FSU5WQUw7Cj4gLSAgICAgICAgICAgICAgICAgICB9Cj4gKyAg
ICAgICAgICAgICAgIH0KPgo+ICAgICAgICAgICAgICAgICBpZiAoaXZhbF91cGRhdGUpCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgcG11X2Rldi0+ZndfY291bnRlcl93cml0ZV92YWx1ZShwaHMt
PmhhcnRpZCwKPiAtLQo+IDIuNDMuMAo+Cj4KPiAtLQo+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4g
b3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNi
aUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vb3BlbnNiaQo=
