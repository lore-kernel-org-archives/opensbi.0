Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B91C369B2
	for <opensbi@archiver.kernel.org>; Mon, 14 Apr 2025 10:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PgrDJ9qLEq+dePRI7urwlbD14zALH92klF3H/FNHv9U=; b=g1d5wJwjXyRTS0
	1fRBZZ7P11Ra2Ym7ERsHFhQL1FRU/ESiGJT6mTwpWMKnKCeCw5LwX8WAUOSEKxV1Ri7i0bAbMt7fz
	DuKJy1+TIH23nYotHX1I7EdC5bC3X4v7aDqPwpOmW890F4QTgj/D7AaAt9ty4DMRcVpueOT9nqWu/
	jZ/2HmkZcPFS2M5SHtlmipjHQWspHzjI+wfn0r7Ef997VanlV1XE02Z5xHY6kryuM4LS2XTnoK5KS
	jaRi2a/F4gSrfj6sqRoPVUeE5/k9noMWQH9T/Ik1IHMli2+Lr86q+LVIKf7U2yAQUR0yM8HQCGoph
	eeZ18t0Wq+aYQbdJNjpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Gos-00000001S6E-2Lbe;
	Mon, 14 Apr 2025 10:13:38 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4GdX-00000001Nzz-19m5
	for opensbi@lists.infradead.org;
	Mon, 14 Apr 2025 10:01:57 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3d5ebc2b725so12737105ab.3
        for <opensbi@lists.infradead.org>; Mon, 14 Apr 2025 03:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1744624914; x=1745229714; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FIfdysjVE/0KgOKPkcgQIcjGOnPoHAWhHmLHOOYVEEs=;
        b=bWQlLiqOwwuf+sr+TPnHjnPZu6PMsSlhg05qH4j86jwuS3UO9ED+PqJfAqXkeE8ltL
         Z/hLuuq0jUZ3FVRMaFl4ExN3tEgnYH7ikk0wub74A/BGjJCj7A3C9sa8MBIXMHN1uCYJ
         IuGdxUuzGN+cSNnpQ2xGQIQY1uAfY8fslOJnnv5rCTes5+hX6BR9kthVrKzUBkUDAbql
         CeT14NfMdn6mi6/qzMUpAMa/rtwqDWYf+aHl244PQNDA917fUY6skG7bMdo5UA28C2Bb
         vwXwl8xy9ZR7zavvHgiAno1Het2WjuFKw7vW/ilssLcrW+nyemDrV35qjJgmV3JSzhJj
         jNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744624914; x=1745229714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FIfdysjVE/0KgOKPkcgQIcjGOnPoHAWhHmLHOOYVEEs=;
        b=J1OJogwKzGbzGwVCmIlUKcDGtO4alDpU/T8tNdk+CXb8m9wvEFhOvcJtsM8OlJaW0C
         H27mV7t5VltdlkkWuWx6SV9N/YYhF9F2JQYeQ18TsEz5+0nqavik0GMyDCDpGq8GywpH
         uzNIHsGODphyfpIR/Lnkxz5kO4R8OjVq8UiyuOUK9C2J34lAE97Eo8QnBhhOxUqNHMbn
         6P9fM4HOGBFbxRFqQIlSq/mldyv2pdoVd+HO4NNEbKbguyq08uOu/jBDOhEACbN9DRgx
         AGWri40yqA7jMlH+73waIYrZyJooOSKTR1WkuoEty40cq13V6T94bCd63oOS1VRvWRt8
         D6GQ==
X-Gm-Message-State: AOJu0Yy3ihjVccPwOqObbgW+cQ9kkw5nInYpAABsGD3JWMT4c4noYwkM
	iAkd/9qxahv7zPY3L2tX/Uj/t03FSb4s/OsVVCLfhWXTIor6Jgqjj/kG52me7rh2rpseC0rOhld
	bLsFwEZHlY1YkYWR4NeqdNxkVP7LSuiXRXOBhzQ==
X-Gm-Gg: ASbGncutLDrj67I48IGQB1KTneNelpxqnJMoNZkZhUz5EJjqetapJZ/ARnzrHIN1VZu
	HskujIOOPkoaawmJqtekhyvnokbn4i3bo+9+KCYQ4z6FAxI0H3Jw6Fe0aUss9/in3mS9JbqV6rn
	y/dAowg4vRYTkLFMxNiim3Ig==
X-Google-Smtp-Source: AGHT+IHK4IiXHaHPckNbmt+6U9speZgOnzBEo72PhdFdImJLHhkazw0CGNapZiROOrw4p6IlYvIccHvp/HwqNPYHLyo=
X-Received: by 2002:a05:6e02:184f:b0:3d6:d3f7:8813 with SMTP id
 e9e14a558f8ab-3d7ec26fbf2mr118961865ab.22.1744624913737; Mon, 14 Apr 2025
 03:01:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250314163021.154530-4-ajones@ventanamicro.com>
In-Reply-To: <20250314163021.154530-4-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 14 Apr 2025 15:31:41 +0530
X-Gm-Features: ATxdqUF6JhzuGUR23gWjyaya3D6KCQ3RdaJ_mhs0GD_6Rz7zkcz8yyqsuJiyS5Y
Message-ID: <CAAhSdy1Ck0jvJshwUkTdjhO4t8kSMDhTDh0J-gEFZDALA3mOMw@mail.gmail.com>
Subject: Re: [PATCH 0/2] lib: sbi_ipi: Return error for invalid hartids
To: Andrew Jones <ajones@ventanamicro.com>
Cc: opensbi@lists.infradead.org, Anup Patel <apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_030155_579085_75A671F7 
X-CRM114-Status: GOOD (  10.13  )
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

T24gRnJpLCBNYXIgMTQsIDIwMjUgYXQgMTA6MDDigK9QTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2
ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IEFkZCBzYmlfaGFydG1hc2tfd2VpZ2h0KCkgYW5k
IHVzZSBpdCB0byBjaGVjayBmb3IgaW52YWxpZCBoYXJ0aWRzCj4gaW4gU0JJIElQSS4gRml4ZXMg
YSBidWcgZm91bmQgd2l0aCB0aGUga3ZtLXVuaXQtdGVzdHMgU0JJIHRlc3RzLgo+Cj4gQW5kcmV3
IEpvbmVzICgyKToKPiAgIHNiaTogSW50cm9kdWNlIHNiaV9oYXJ0bWFza193ZWlnaHQKPiAgIGxp
Yjogc2JpX2lwaTogUmV0dXJuIGVycm9yIGZvciBpbnZhbGlkIGhhcnRpZHMKCkFwcGxpZWQgdGhp
cyBzZXJpZXMgdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywKQW51cAoKPgo+ICBp
bmNsdWRlL3NiaS9zYmlfYml0bWFwLmggICB8IDEzICsrKysrKysrKysrKysKPiAgaW5jbHVkZS9z
Ymkvc2JpX2JpdG9wcy5oICAgfCAyMiArKysrKysrKysrKysrKystLS0tLS0tCj4gIGluY2x1ZGUv
c2JpL3NiaV9oYXJ0bWFzay5oIHwgMTEgKysrKysrKysrKysKPiAgbGliL3NiaS9zYmlfaXBpLmMg
ICAgICAgICAgfCAgOSArKysrKysrKysKPiAgNCBmaWxlcyBjaGFuZ2VkLCA0OCBpbnNlcnRpb25z
KCspLCA3IGRlbGV0aW9ucygtKQo+Cj4gLS0KPiAyLjQ4LjEKPgo+Cj4gLS0KPiBvcGVuc2JpIG1h
aWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFpbGlu
ZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
