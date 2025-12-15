Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B181BD5B841
	for <opensbi@archiver.kernel.org>; Mon, 15 Dec 2025 15:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z/tPMFi1CbpX5knljT2oCUqoyFGowPCYJeoDZhytHEM=; b=pOHKmZy1ddUvZz
	puydf3jbk/fCy8W6QV05UdA6pV9ZOhqRgsNAllp79VDKnkmMuZApW0ISCOJZdoQiUqQEGoYGj20m8
	1thiKIP7oJgGqS4ZX7lmi26BF/X0OIeg7yW9skxpyi11UsXEkPOvsrOWb04EpnPB9oTkCtxo/Ug7G
	RwgZZ5uPep/w6MxFz9ccYvm3++OZf0o8hCnEz6awMYoEPliUtPsIqmtJ7tL6iJ0gdDu8LKMgN5MhF
	0GfvmiG7n9I81EkeJzzLJvYjdtjRy5hYuAdsvvdVc+/KvKZr7lZXCqH8mNa3gY0LLHSCa5EV03lX/
	/VjG37LUqLWu1Noll2zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAol-00000003vub-1BlV;
	Mon, 15 Dec 2025 15:48:59 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAoi-00000003vu9-0pJP
	for opensbi@lists.infradead.org;
	Mon, 15 Dec 2025 15:48:57 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-7c52fa75cd3so3253343a34.3
        for <opensbi@lists.infradead.org>; Mon, 15 Dec 2025 07:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1765813735; x=1766418535; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0N3R3c/482OaJKwjINepNZLZGE/7yiExeJS7N+LqIs=;
        b=Hqrq6/zuEjSde6LqCQbsW9wR6ShITrqgmDobbMRVz4BkAQlw/T271L7FpHAVB5UuoC
         KvNmAyyU20asezYDQiprZjv8l78G11SBB5BdeBhdrVny8aGm28ch6bTiuHqn0Q2u/Qay
         OC07GEjflMIHoxy6cjtraaI3Bc3wiNT5ZMNQfO46dcLzfMC84WCOJVPRAYfl+zhOHoyD
         YfaYURe+uOup9m3eyWsz0KhqWbYo8U6kG+MMU/THQoOgaJaZFmJ8UpNrmPpD42X2T/o3
         LsWUCaIZRfoUgsUNxDW3B28/r5GY+tcFZhTrpv253yGfIfkPePi7n8ZTD47foE20V/Cv
         uOVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765813735; x=1766418535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q0N3R3c/482OaJKwjINepNZLZGE/7yiExeJS7N+LqIs=;
        b=RGKuq33Mg5mtsW9Vblj5I0pPFqmaTqN+8uoZ2Ru+ApZ8GW8XyWdi23kGS/+VudDcLe
         saGts3ea0t3RazYKnhDw8Hk6jpgb/98+0hvhCbDZYWK6ErcA5GEgOUfrJaFAOHEY3MSa
         Dj0XW6ZVNt47FMhknV9m/7u7fdLH1LJJDB/y4Hy0y+QoquQ3S0Wt6C+56XrcmnaPpaxX
         4KeyJVl1IEmGuMwQF8Tl9pC8ybkdLQ9jgqoKEHAgXQlzmxmnPgEXKKOVQvHrpb55BeMr
         xqLHwclrmEvm1BjLEqaFhYg/R7nxz7TQD55Z04VEF3ol0VCPaIszFG2Z6qTbNui8rBuk
         6nTQ==
X-Gm-Message-State: AOJu0YzqPItWzSIpcdEqlhMNL99x4YfEd6y4Eb1xkrhGDL0wyZWnuig/
	2vWw8gXAIeToB3NXf2nRW4QZZiNJg14CF02tEeHk99DUkRkywXNo+RL31+bj0nmXn9TdzAaZ+Sr
	utjxBbU+jWpCFuo+L8RvvCY4IDpgSVXnklHs3HVUnww==
X-Gm-Gg: AY/fxX4iab8Ghrz1yczZxIh7xaYAjKDw7frKUcAJmMnQdL8dMxraAPiKtTlgsnQMz/q
	CMFImbqXGL4cQ3gz4M1COrk0VPbL1kaOHLT43nFTAQ3xwtKX3Fmkij6sVfXIFbdY9G9MP7MZIz1
	przkC0IC1tecYj10Xu80lPf1X4K1ZnQJK/iQvkfw+5BGwyHKxUscBbj6oN1whcbMEEDntb8URP9
	ks88N9E02bIUZcN2TpVrgLRv4rcLbd6iA9szgV1LbWD9goTCiP1TV8DWV5DlpA8dJVsiq0=
X-Google-Smtp-Source: AGHT+IGZ7lObmUzLwadhzxX/WYa2s6f5EZV9aNv89JsicV4cEZjCtdHxXQC+z5YdsGlAONIDHMudLFKkn4/MWCPtl+Y=
X-Received: by 2002:a05:6820:2217:b0:65b:34fd:b01f with SMTP id
 006d021491bc7-65b452ad357mr5208356eaf.73.1765813735054; Mon, 15 Dec 2025
 07:48:55 -0800 (PST)
MIME-Version: 1.0
References: <20251114203842.13396-1-b.freisen@gmx.net> <20251114203842.13396-5-b.freisen@gmx.net>
In-Reply-To: <20251114203842.13396-5-b.freisen@gmx.net>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 15 Dec 2025 21:18:44 +0530
X-Gm-Features: AQt7F2qB88gtrcc2xLw25Lwl6TBBqRt5gOUFJ5_ohsl7CJf8bDyiBHkCXsZVxKE
Message-ID: <CAAhSdy0knaC4cuFRQCfe9VaSG9o5uwT_xotTe7RU2QhsF8PeSA@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] include: sbi: Ignore rs1 and rd fields in FENCE.TSO.
To: Benedikt Freisen <b.freisen@gmx.net>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_074856_237987_B6C3CF7A 
X-CRM114-Status: GOOD (  14.98  )
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

T24gU2F0LCBOb3YgMTUsIDIwMjUgYXQgMjowOeKAr0FNIEJlbmVkaWt0IEZyZWlzZW4gPGIuZnJl
aXNlbkBnbXgubmV0PiB3cm90ZToKPgo+IFdoaWxlIEZFTkNFLlRTTyBpcyBvbmx5IHNwZWNpZmll
ZCB3aXRoIHRoZW0gc2V0IHRvIHplcm8sIGl0IGlzIGEgc3BlY2lhbAo+IGNhc2Ugb2YgRkVOQ0Us
IHdoaWNoIG5lZWRzIHRvIGlnbm9yZSB0aGVzZSBvdGhlcndpc2UgcmVzZXJ2ZWQgZmllbGRzLCBi
dXQKPiBpbiBzb21lIGltcGxlbWVudGF0aW9ucywgbmFtZWx5IFh1YW5UaWUgQzkwNiBhbmQgQzkx
MCwgYXBwYXJlbnRseSBkb2VzIG5vdC4KPiBTZWUgdGhlIFJJU0NWdXp6IHBhcGVyIGJ5IFRob21h
cyBldCBhbC4gZm9yIGRldGFpbHMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBCZW5lZGlrdCBGcmVpc2Vu
IDxiLmZyZWlzZW5AZ214Lm5ldD4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51
cEBicmFpbmZhdWx0Lm9yZz4KCkFwcGxpZWQgdGhpcyBwYXRjaCB0byB0aGUgcmlzY3Yvb3BlbnNi
aSByZXBvLgoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICBpbmNsdWRlL3NiaS9yaXNjdl9lbmNvZGlu
Zy5oIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3NiaS9yaXNjdl9lbmNvZGluZy5oIGIvaW5jbHVk
ZS9zYmkvcmlzY3ZfZW5jb2RpbmcuaAo+IGluZGV4IDkyY2JjMjcuLjI5NzBiYTAgMTAwNjQ0Cj4g
LS0tIGEvaW5jbHVkZS9zYmkvcmlzY3ZfZW5jb2RpbmcuaAo+ICsrKyBiL2luY2x1ZGUvc2JpL3Jp
c2N2X2VuY29kaW5nLmgKPiBAQCAtOTQ0LDcgKzk0NCw3IEBACj4gICNkZWZpbmUgSU5TTl9NQVNL
X1dGSSAgICAgICAgICAgICAgICAgIDB4ZmZmZmZmMDAKPiAgI2RlZmluZSBJTlNOX01BVENIX1dG
SSAgICAgICAgICAgICAgICAgMHgxMDUwMDAwMAo+Cj4gLSNkZWZpbmUgSU5TTl9NQVNLX0ZFTkNF
X1RTTyAgICAgICAgICAgIDB4ZmZmZmZmZmYKPiArI2RlZmluZSBJTlNOX01BU0tfRkVOQ0VfVFNP
ICAgICAgICAgICAgMHhmZmYwNzA3Zgo+ICAjZGVmaW5lIElOU05fTUFUQ0hfRkVOQ0VfVFNPICAg
ICAgICAgICAweDgzMzAwMDBmCj4KPiAgI2RlZmluZSBJTlNOX01BU0tfVkVDVE9SX1VOSVRfU1RS
SURFICAgICAgICAgICAweGZkZjA3MDdmCj4gLS0KPiAyLjUxLjEKPgo+Cj4gLS0KPiBvcGVuc2Jp
IG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFp
bGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
