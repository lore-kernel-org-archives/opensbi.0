Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2F4FD5F8C
	for <opensbi@archiver.kernel.org>; Wed,  8 Apr 2026 07:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RvOMv681whMrnKCgGtTu5bEZrmCgTwcCuQjywTnRGVY=; b=sbzxPzxmHaArTR
	bpKsn5oL40ReyFciQdpeFcgIEilORV1NdX/LWqGr1pv7w6GqwqUjYXh/XwFUytvPuL0/GZfcVB3MA
	G4tNkdG1MOmlSUQqZjgku8fwxnqjGqYE6XtvBddVU6DK3ELdk5QjkUmFcjqPR3cYpZo/6ALy5z2A1
	tjO4FL7UL7vOXW9vJwJrJRSMP/2mwLo8VhHsNZg46KUoBrPrB5dqzPqtLqBh4FcEgpuD7iB0JmeQO
	jTul0nrT316+64QjSDxAxSvmKfFBfZBfrmn+v7anKgi/7kUTT97qRglgtOoBDX1ba6kdvxNxYBqmK
	d8IX0bEWTDptUGmX2q4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wANBM-00000008PLq-1J7H;
	Wed, 08 Apr 2026 07:18:36 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wANBK-00000008PLJ-0Bro
	for opensbi@lists.infradead.org;
	Wed, 08 Apr 2026 07:18:35 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-488ad135063so26830505e9.0
        for <opensbi@lists.infradead.org>; Wed, 08 Apr 2026 00:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1775632712; x=1776237512; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T7Gl2hXjK+gFaZJ27vj26joNdS5LUjxJXZlomYLzjq8=;
        b=IXv7kvlA0fW1lQWG2cN+2L4EGhWYAOlZo+Rdw8rj5MalsLWHKgx/o1vjEqPL5yOGfG
         5PQM8OIzkZvqXtITzEvat6DQckN2JEFRdwXDQSw/Ai+pqIbm7HJM7FJW/NcTae0bHijN
         zdgLX7DiJIZelkjpkkwGexLLfjHYPCx/0C8oDdVgxR/z6ygBPvBBHYzHbn73/qPzv4oE
         ObJS+wK6AZZbkhpKYT8obgbJZW34p/Eyr+q+BR3gByFhsTJaEz1reWCvG6E8vIIUKePO
         PBPxGsSXr5X/fdUIns53nCN9gZ0LbWbhVoP3otGfx1eKDV9AWaN84flSQnbvYzI/FqCk
         QOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775632712; x=1776237512;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T7Gl2hXjK+gFaZJ27vj26joNdS5LUjxJXZlomYLzjq8=;
        b=d4SsFC0hmxAJ8ladYLCQvlPaUTnV33XkGbxUqy3XwDVAjLEebBxO0+5+EAQ+5CIozq
         zha0gdkpzziVqJc0pM/Kp64yUCanu4J70TwVJ7SCqlCQshzVOGNRpLYOIgKjLLomA2EE
         wygT2jq7tjAGm8aFVkT/Y7eORpWfdTD0codNF0FR3g1b9oEqwk3S7uBFzi9G8pY7mh+e
         EBjPqNLTwnF2MOTC/qvJ+Km6ABGFcRPnlniZzeA7tHYIsmvyu7Uvt3f5xwhKg8BIQlri
         9zIg2MeFHUIt7B/wLzRGFCplvFrXzmxOsbk+OBwDK2tnbbMXJF7RAZ6ZiY8pnyr9RYfe
         iQZA==
X-Forwarded-Encrypted: i=1; AJvYcCX7x2+nt36ivXuxnQmUqPbg4FtGulw5KLTltS0aLoC3/Tf6uYActnUGPP1PXj1vZ9wLwEMGqwXT@lists.infradead.org
X-Gm-Message-State: AOJu0YzD+aelEafRQRvEUpvZ6isguUO09DY60GNK2/ZLH5BCBBCm5eFF
	oH4jO73qZDWxPUy4RSdWeYGR8duFNfsv2FHauiq7GZxOKE3sxjrbAmpTkbyz1CG80kk=
X-Gm-Gg: AeBDieuj3yxwey3q+u8/EMhNlzHXxH3PEDHCCLKzD/ZRvxVnCD+V+qhlkfEKc+1kVPw
	HgbZCSW4t44gMkLzxCukaUjacycu05xv9eyeXIszdvqf+bGvjv5c8PNvAa11uE81iUIGoiEtS+u
	BAOyAtLf4/e5v+ODE9cbFV8tWj7vNFwUF1UzVrkhSC0VNhiyqmHZIooQv7J2GBqY8pF8aSmMxOt
	Z5ETv6v0Zfea0ovcCcU1IsTBD3ZRBh/+w78E/1VPnuUO7IbjdCxLWEyHkaxWAAqS9YFcufGuzfw
	Dik+rFwk8VsSOFwwCHEgE9xP2ac3wZcFHe/uUcQQqZGQV1rzk9OVOh43eFv1lelbykdtGlr1Has
	FKvoQT7yvRkBE+wyShxRWkq1nAeT0E6DmQoLk2uzi0OHCCnw/9JqqndSxvdc/LgYwFnN5ICM+G2
	7wrHdXpT+z1aI+leYQjJvu4pxKyHnhBDS3g03Ub5d+H+GSaqv6hhyaOmHFi0YdHg==
X-Received: by 2002:a05:600c:8b32:b0:487:1c2:6a56 with SMTP id 5b1f17b1804b1-488996afe1cmr272683085e9.3.1775632712240;
        Wed, 08 Apr 2026 00:18:32 -0700 (PDT)
Received: from [172.27.130.2] (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a5e2sm613970065e9.1.2026.04.08.00.18.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 00:18:31 -0700 (PDT)
Message-ID: <3613f137-cb61-4d3f-80dd-8ec1905d2cfe@riscstar.com>
Date: Wed, 8 Apr 2026 08:18:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Dave Patel <dave.patel@riscstar.com>
Subject: Re: [PATCH v4 0/3] Add eager FP and RISC-V vector context switching
 support
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Scott Bambrough <scott@riscstar.com>,
 Robin Randhawa <robin.randhawa@sifive.com>,
 Anup Patel <anup.patel@qti.qualcomm.com>, Ray Mao
 <raymond.mao@riscstar.com>, Anup Patel <anuppate@qti.qualcomm.com>,
 Dhaval <dhaval@rivosinc.com>, Peter Lin <peter.lin@sifive.com>,
 "opensbi@lists.infradead.org" <opensbi@lists.infradead.org>,
 radim.krcmar@oss.qualcomm.com
References: <20260406193133.658066-1-dave.patel@riscstar.com>
 <3f13a0c7-f3ad-4c4e-8209-abc205326ae1@sifive.com>
Content-Language: en-US
In-Reply-To: <3f13a0c7-f3ad-4c4e-8209-abc205326ae1@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_001834_103008_4AD9859C 
X-CRM114-Status: GOOD (  12.90  )
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

Ck9uIE1vbiwgNiBBcHIgMjAyNiwgMjM6MzMgU2FtdWVsIEhvbGxhbmQsIDxzYW11ZWwuaG9sbGFu
ZEBzaWZpdmUuY29tPiB3cm90ZToKCiAgICBIaSBEYXZlLAoKICAgIE9uIDIwMjYtMDQtMDYgMjoz
MSBQTSwgZGF2ZS5wYXRlbEByaXNjc3Rhci5jb20gd3JvdGU6CiAgICA+CiAgICA+IEhpIFJhZGlt
LCBTYW11ZWwsCiAgICA+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBUaGFuayB5b3UgZm9yIHRh
a2luZyBvdXQgdGltZSBhbmQgcmV2aWV3aW5nIHRoZQogICAgcGF0Y2hlcywKICAgID4gaGFzIGJl
ZW4gc29tZSBpbnNpZ2h0ZnVsIGNvbW1lbnQgYW5kIGFwcHJlY2lhdGUgeW91ciBpbnB1dHMgYW5k
CiAgICBmZWVkYmFjay4KICAgID4KICAgID4gSSBoYXZlIGNvdmVyZWQgYWxsIHlvdXIgY29tbWVu
dHMsIHBsZWFzZSBjYW4geW91IGhhdmUgYSBsb29rIGFuZAogICAgbGV0IG1lIGtub3cuCgogICAg
WW91IG5lZWQgdG8gaW5jbHVkZSBhIGNoYW5nZWxvZyBpbiB5b3VyIGNvdmVyIGxldHRlciB3aGVu
IHNlbmRpbmcgYQogICAgbmV3IHZlcnNpb24KICAgIG9mIGEgcGF0Y2ggc2VyaWVzLCBkZXNjcmli
aW5nIHRoZSBjaGFuZ2VzIHlvdSBtYWRlIHRvIGVhY2ggcGF0Y2guCiAgICBZb3UgY2FuJ3QKICAg
IGV4cGVjdCByZXZpZXdlcnMgdG8gZ28gYmFjayBhbmQgZmluZCB5b3VyIHByZXZpb3VzIHNlcmll
cyBhbmQgZGlmZgogICAgdGhlbSB0byBmaW5kCiAgICBvdXQgd2hhdCB5b3UgY2hhbmdlZC4KCiAg
ICBSZWdhcmRzLAogICAgU2FtdWVsCgogICAgPiBJIGhhdmUgdGVzdGVkIHRoaXMgYWNyb3NzIHRo
ZSAyIHMtbW9kZSBkb21haW5zIGRvaW5nIGNvbnRleHQKICAgIHN3aXRjaCBhbmQgYm90aAogICAg
PiBmbG9hdGluZyBwb2ludCBhbmQgdmVjdG9yIHJldGFpbnMgdGhlIHZhbHVlcyBhY3Jvc3MgdGhl
IGNvbnRleHQuCiAgICA+CiAgICA+IFRoYW5rcyBhbmQgUmVnYXJkcywKICAgID4gRGF2ZQogICAg
PgogICAgPiBTaWduZWQtb2ZmLWJ5OiBEYXZlIFBhdGVsIDxkYXZlLnBhdGVsQHJpc2NzdGFyLmNv
bT4KCiAgICBIaSBTYW11ZWwsCgogICAgVGhhbmtzLCBJJ3ZlIHVwZGF0ZWQgd2l0aCB0aGUgY2hh
bmdlIGxvZyB0byB0aGUgY292ZXIgbGV0dGVyIG5vdy4KCiAgICBUaGFua3MKICAgIERhdmUKCgot
LSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
