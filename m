Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34189CA100A
	for <opensbi@archiver.kernel.org>; Mon,  1 Sep 2025 13:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=koDlRmpgXsKpAtnubcOuYTBEA98OZB9HyeZdNlJSmoY=; b=pvBhczbUJ4hsPb
	oSsfJw+h7dlVIXITVsh6BDbQcwwHfiBSg0km5LpMVWhGrhy/7cxKrcaPdxKNU7aYXkrb3qjB23Xlt
	R4xP6WvoLTAJhuAIxFKqgfozEKtdux3nk1LPG/vOgAZwWEcCFfRhb8LDM6dfPonJVFUlu3Ouuf1/N
	/HP/TNsryRJYBJIyXCKikWIpSBx/VKXY55WXd2VP35IUaCz+H8jv7SIeSxHxYXNkgJ0S3GE0WNXYG
	4OU3EUQKFnJqPpSrzmdTILQHKq/zbwPEigzrX5nWcrMmGR/d1bn1gRaW7W9QjgLABKw7lHiVCOey7
	Jldv5T6tRH+QztjgQ4vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut4uT-0000000CkAS-1IXf;
	Mon, 01 Sep 2025 13:49:25 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut2jh-0000000C3km-3o80
	for opensbi@lists.infradead.org;
	Mon, 01 Sep 2025 11:30:11 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3f1012f85beso43963495ab.1
        for <opensbi@lists.infradead.org>; Mon, 01 Sep 2025 04:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1756726208; x=1757331008; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CZqv+qoP3nZf1LZYL1i/OJ1jZcWGugXliZUnpSsi67A=;
        b=ntExR4h1bZK6NRvKQIV3GfPixe3pznm+kg0X6Vv3L7SYoh12md9oyAxaeFE/x7WFCP
         w5iEDGnJQhby9uHjhpxW45MdEdupbx80905vvdQgxhg/eHvpkWrXn6bEA+GZotQwfShX
         Ds/PMZEaYxMckAcoeyItRwNqZcjxkDQ/GwAYMJMHGe0n7wnk6roDn3Od3+NjM5XuStC6
         ZANJgsgRQE/STy319MJ81YE+uVX8ZiB1cziskS6M5K7kmxyd147H+25kV8yMFT0idcco
         1Hqrl6zJJA5sMp8E40/bos8cIGKME8/7eBCocpF+HRT4MtNFzhRf6khu0W4ilKCCy+iu
         PYZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756726208; x=1757331008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CZqv+qoP3nZf1LZYL1i/OJ1jZcWGugXliZUnpSsi67A=;
        b=CXTNDzGWUhCQYgBVdj+3smI/iRG0Sas3by0zT30abCfOCR1jHQH0L7AFUsF0vtYc9L
         jiqMJeDcKv6MDLdjYhfQeWc9x+ehJ/gqGJ8+l4nzGoRL1D6dmRvq1EJfqHIuyvftqfBQ
         +HYqTl/oHAK59WLT62woW4nIRCuUKt3l4O9eeYWEH62S4xdLusdTONNah9miNUOGRjCQ
         mBkAXtpDoiJiwTrKV/QaxnyLyvqhq3fZg10I6SBrmTDr41Zy+DhWOaL62kfdlLypA/hE
         DhD+bngdLCwXhe36dWiQUNt7AeZJsnxG+Y0Th5P7mFvH3BAhufWiHkMPmw03YELzT1k+
         z7yg==
X-Gm-Message-State: AOJu0Yy9eDd6vLtyn1gAmKfmp6StQ+HZmaQpaxEaIt6NGozsVPy3YuS5
	FVNasqcf1LrM5KKxpRDu3RZukx1AsPci7h0aBkB5FXPQYeVl8g688dXHocEl5CeUpUmJODqMLgb
	Fnd9fFPj8pVAAIhcUi9wGA9xpAhLvpUMVZFHAiYlqAA==
X-Gm-Gg: ASbGncvBmibwjzPLSx1S0eXXv9SXlKIlWByUFJE87oBdgcACisgcPoNHXU4z9gAVfdp
	42ofGVt9l04aH9QIbwUOnknJJWtJ3B154KgsRBCkSjvCcARiwrJLI04501V5gKSHH4J7rbVw/ft
	kpCDcPV+2WhT2dBJx6J8B3NBjW8Q7hRyXa0+9BolhdMg7Q6eG4FAZnbAG17fdTTVlfEiFyskevU
	Vj0/dcRw9nhpVF9aiBMtE0mWl3UoKNZMenfqBVGHmqP7ppypQ==
X-Google-Smtp-Source: AGHT+IF2ZC49y+E1zaU1xZN1FfP/kBdKWL4weWJK3kDe0rl/q6hk9/tpLq8955ApW9a/ceDf5XLKnO36TnHm5ylSuXc=
X-Received: by 2002:a92:cd86:0:b0:3f2:558:9cd1 with SMTP id
 e9e14a558f8ab-3f4019f33c8mr135534515ab.17.1756726207904; Mon, 01 Sep 2025
 04:30:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250617032306.1494528-1-samuel.holland@sifive.com>
In-Reply-To: <20250617032306.1494528-1-samuel.holland@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 1 Sep 2025 16:59:57 +0530
X-Gm-Features: Ac12FXz0dJErtxkkxsvXYjHSz5iyy-PVHsdiC2s_SFXMVThihM5-s7TlcJI4UmI
Message-ID: <CAAhSdy0FKn8_yM645vBdeVicZzm8WVd-g_MRD_TO6vV+XXRvSg@mail.gmail.com>
Subject: Re: [PATCH 0/3] Heap Enhancements
To: Samuel Holland <samuel.holland@sifive.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_043010_183682_0522C402 
X-CRM114-Status: GOOD (  12.35  )
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

T24gVHVlLCBKdW4gMTcsIDIwMjUgYXQgODo1M+KAr0FNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IFRoaXMgc2VyaWVzIGZpeGVzIGFuIGlzc3Vl
IG9ic2VydmVkIHdoZXJlIGFsbG9jYXRpb25zIGNhbiBmYWlsLCBldmVuCj4gd2hlbiB0aGVyZSBp
cyBzdWZmaWNpZW50IGZyZWUgc3BhY2UgaW4gdGhlIGhlYXAsIGJlY2F1c2UgdGhlIGhlYXAgcnVu
cwo+IG91dCBvZiBsaXN0IG5vZGVzLiBBIGZvbGxvdy11cCBjb21taXQgc2ltcGxpZmllcyB0aGUg
Y29kZSBhbmQgaGVscHMgdG8KPiBrZWVwIHRoZSBmcmVlIHNwYWNlIGxpc3Qgc29ydGVkIGJ5IGFk
ZHJlc3MuCj4KPgo+IFNhbXVlbCBIb2xsYW5kICgzKToKPiAgIGxpYjogc2JpX2xpc3Q6IEFkZCBh
IGhlbHBlciBmb3IgcmV2ZXJzZSBsaXN0IGl0ZXJhdGlvbgo+ICAgbGliOiBzYmlfaGVhcDogQWxs
b2NhdGUgbGlzdCBub2RlcyBkeW5hbWljYWxseQo+ICAgbGliOiBzYmlfaGVhcDogU2ltcGxpZnkg
YWxsb2NhdGlvbiBhbGdvcml0aG0KCkdvb2QgaW1wcm92ZW1lbnRzLgoKUmV2aWV3ZWQtYnk6IEFu
dXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+ClRlc3RlZC1ieTogQW51cCBQYXRlbCA8YW51
cEBicmFpbmZhdWx0Lm9yZz4KCkFwcGxpZWQgdGhpcyBzZXJpZXMgdG8gdGhlIHJpc2N2L29wZW5z
YmkgcmVwby4KClRoYW5rcywKQW51cAoKPgo+ICBpbmNsdWRlL3NiaS9zYmlfbGlzdC5oIHwgIDEx
ICsrKysKPiAgbGliL3NiaS9zYmlfaGVhcC5jICAgICB8IDEyOSArKysrKysrKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDc3IGluc2VydGlvbnMo
KyksIDYzIGRlbGV0aW9ucygtKQo+Cj4gLS0KPiAyLjQ3LjIKPgo+IGJhc2UtY29tbWl0OiAzMjQw
MjE0MjNkMDYzNzAyYTVjYjJkNDIwN2EzYTljNGU5OTk1NDlmCj4gYnJhbmNoOiB1cC9oZWFwLWZp
eAo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNi
aQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
