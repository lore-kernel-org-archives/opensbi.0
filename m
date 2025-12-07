Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FE6D3B7E7
	for <opensbi@archiver.kernel.org>; Sun,  7 Dec 2025 16:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=txGDC+vehu3sW/yPa1aQdAFB0OzX6sQRy78BtWYKh54=; b=EGsQxLhd4U5z93
	vdfanc/Y/x/arfHllYnVaNDmkbna3BsutUOO3bYowBEwMllRTZqWAw53JFuQVOoehtUef4kctVcvw
	+LvP3tN6K3CsX4jb4BxSNTCy/l3l4K9pLhxWHrPslzgEg4KF8K0D8j6a3aST2SU6t9gI91Qv9QQ7e
	HIJvW2e4JK8imQQwK/xtMwu6b7lpNeCIsXHYTXxhQ0kO87F0DDQOmcOtgG8mD/sTEny3SsBY/Kp7t
	JtDyc0/HiZ7JwLytYw7W0QfxYattUG7Qw4Ck6uhmiSgqpauPb4mWN4+IBD+pz8qXlO1DDABp5Q+d7
	uYdQv9BIn05rvPcZgaYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSHDX-0000000C4jw-2BL4;
	Sun, 07 Dec 2025 16:02:35 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSHDV-0000000C4jR-03Kv
	for opensbi@lists.infradead.org;
	Sun, 07 Dec 2025 16:02:34 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-7c75178c05fso1428710a34.0
        for <opensbi@lists.infradead.org>; Sun, 07 Dec 2025 08:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1765123352; x=1765728152; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+jrsJ1V2U+tEIYYkZs73tmXrPSBEWDC38cyigHBs7vE=;
        b=v2lPQVLojpHko00qt/b5SoNREHBVEFsiY5LdIwG4hO6qZsFnDSIk3tAiFYu9oaG88x
         8IWcVINALZ0a2B/WFqhkd09s8wAVITN+SIkHouzGK3u/sBfW7DdeaVYQl/i+4ryvl5UC
         PlN+0DK43XUnRs+e0mShHcN+dShA/wLyu2FrVzHulawgbfAJQOugEDwOIJ8GVEnyc0tT
         5Hqc2yYQdmPAaDf2jDI8gZ3R7nUJ/CxvVqFEymvdS6GJisF8mbwbpGnElER6ZngcRX/5
         ieId0SZ5dj4/i+H3pcTRYcyFIu8V5LeaFtbQgNieS4NhLsurT71XmShXcurKX9Y2E3kM
         Zq+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765123352; x=1765728152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+jrsJ1V2U+tEIYYkZs73tmXrPSBEWDC38cyigHBs7vE=;
        b=vWJZL1FEw7rQ2Z3kkThJk+Zv4qb7eNHMUtlX75Y7pRJvsO/1adhodgMMg5ZYslBmx6
         /SbPJ495U5gxBoSLomsNCrnWk/UFv0+8uMVsp/yJwosr6y0/df9sFRKfgcXnyI9RyFNh
         yxkEkvWyP9CmYPa1wdYXBv5sO203bPCSzy+xOx/cqjBva/WRIFwhjsS0zvKRDvigPkZc
         2U2mtPK/tS3U6ww+/w7MHgQwn/dqJz2DhWDYGb4Zi8zqwcOLRwC9ss3riciJgFLIDuip
         mU3LYnYZQqCX98oNelyg791xTrNpFM/5rv1MlX8Fo9T+fQURtoA+uBdKF8GJncE+wN2z
         6KNQ==
X-Gm-Message-State: AOJu0YzVofNaRoSWlRExCkru/QABjmw2y7yW5RCezydzwd6/Tn+ZUGeo
	z7fHmMCy5Ke6v1wIn3Wm67X/ef6AD+9Q92ki2vN0fljYoGJ4wDpr7lW6mHMdmLGekZa2MNa9sdf
	X426p9ydot+0PGfHaHf1J5QZBjBJ8dtVZWUFE3mm8NmFfOISIxhBJ
X-Gm-Gg: ASbGncse6UlQ4Ap4OZYpWZTdSg+EesfIdHw5l7AX9nJuBYDYy8b/qz6yIYJFg1zcedL
	upb1EoYuPSjnLCH1pMWUc3RBWO+fwbCcl84KLWLCBlyF4iXXRKmd4jtKxYTkz6VSrjzWZ1siQwX
	9VFA2q4AQOhqH3Sb2blfZxPwinFobHtkKmyEHJrgUhX3+9DByTRMUjFgDhmycL7Bt18iNCjj5br
	n+tXXbbKdNBSX6hDCfruk9ioOOQxSLkN0AgepF9z8SE9nr0Vlou/7Uqqgn8xwoRbu45toUd
X-Google-Smtp-Source: AGHT+IHYb4Tc7nYBk137KvEFiNSh2NIJe55qZQMOzKTTd2IGZEzQTq3znE/IwRF+XkKX1bPcV51ia+jBuKipVDmBa5k=
X-Received: by 2002:a05:6820:995:b0:659:9a49:90ac with SMTP id
 006d021491bc7-6599a957840mr2085216eaf.43.1765123352006; Sun, 07 Dec 2025
 08:02:32 -0800 (PST)
MIME-Version: 1.0
References: <20251120093440.4533-1-ganboing@gmail.com> <CAAhSdy1fEUk=2GWAWf12SR2r5vc3R+heg7sZMniTgYTjdu5Rjg@mail.gmail.com>
 <018c4467-b637-4de9-9410-27b3de69f455@gmail.com> <9cdb9efb-00e3-4db6-a7fb-cca57ff877b5@gmail.com>
In-Reply-To: <9cdb9efb-00e3-4db6-a7fb-cca57ff877b5@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 7 Dec 2025 21:32:21 +0530
X-Gm-Features: AQt7F2plJxPWpoCjsM4-lu29sEXSduaegQkoiPckMmmBOoBnHJw8huguaozuhXE
Message-ID: <CAAhSdy2fGERYK4Jg4m2W9wx3Y7P9aBp1mDmbvWj1BwDv802mrQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Initial ESWIN/EIC7700 support
To: Bo Gan <ganboing@gmail.com>
Cc: opensbi@lists.infradead.org, linmin@eswincomputing.com, 
	pinkesh.vaghela@einfochips.com, gaohan@iscas.ac.cn, samuel@sholland.org, 
	wangxiang@iscas.ac.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_080233_057101_EB2395A2 
X-CRM114-Status: UNSURE (   8.19  )
X-CRM114-Notice: Please train this message.
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

T24gU3VuLCBEZWMgNywgMjAyNSBhdCAxMTo0M+KAr0FNIEJvIEdhbiA8Z2FuYm9pbmdAZ21haWwu
Y29tPiB3cm90ZToKPgo+IEhpIEFudXAsCj4KPiBJcyB0aGUgaGFydCBwcm90ZWN0aW9uIGFic3Ry
YWN0aW9uIGdvaW5nIHRvIGJlIG1lcmdlZCBzb29uPyBJbiB2MS44PwoKWWVzLCBJIHBsYW4gdG8g
aW5jbHVkZSBoYXJ0IHByb3RlY3Rpb24gYWJzdHJhY3Rpb24gZm9yIHYxLjguCgo+IEknbSBtYWtp
bmcgYSB2NCB3aGljaCBpcyByZWJhc2VkIG9uIHlvdXIgY2hhbmdlLiBMZXQgbWUga25vdyBpZiB0
aGVyZSdzCj4gYW55IG90aGVyIGNoYW5nZSB0byB0aGUgaGFydCBwcm90ZWN0aW9uIGFic3RyYWN0
aW9uLCBzbyBJIGNhbiByZWJhc2UKClRoZXJlIHdvbid0IGJlIGFueSBtYWpvciBjaGFuZ2VzIHRv
IGhhcnQgcHJvdGVjdGlvbiBhYnN0cmFjdGlvbiBmb3IgdjEuOC4KSSBleHBlY3QgaGFydCBwcm90
ZWN0aW9uIGFic3RyYWN0aW9uIHRvIGV2b2x2ZSBvdmVyIHRpbWUgYnV0IHdlIGRvbid0Cm5lZWQg
dG8gZG8gZXZlcnl0aGluZyBpbiB0aGUgaW5pdGlhbCBpbXBsZW1lbnRhdGlvbi4KCj4gYWdhaW4g
YmVmb3JlIHNlbmRpbmcgb3V0LiBBbHNvIGFueSBmZWVkYmFjayBvbiBQZXRlciBMaW4ncyBjb21t
ZW50cz8KClllcywgSSB3aWxsIGxvb2sgYXQgaXQgcHJldHR5IHNvb24uCgpSZWdhcmRzLApBbnVw
CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
