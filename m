Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB22C2D0CD
	for <opensbi@archiver.kernel.org>; Mon, 19 May 2025 20:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QqGQlmteb1N003EgGzG49u/yl3SakPiXD1oIsmiqgz0=; b=hsg3KSu1XkT54+
	yB1fN2Ugq3diV8ZTsDOiAmr4RWhW9VfNjFECF1bD6ak1UVQN7FTGfHhx9JXjGiNcnsUMpAOVvW1qE
	FdIQKdf1Oi0Q1a9ZtakcaMpE0tkA5yEdFzT0zVc99xzcHcG+qONA17cvnsQ4DkABC0BA0szP3Xv6M
	Y/deAMQASqu29YDBR1MYRedDGimhy87ATyEJrgsw5uZMCms2W/6yQzYlKCH53g11twFvJb2KxJEje
	lboChBcNJfSYjzvXLf3jCcNTRjTRigxV+1TCs6ZrpOqBNAx9M+TvjICQLZVuekBMgnfWff3GO1jpD
	xOeEAzeyW6L4ewKC+sOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH73G-0000000AOQD-2OnX;
	Mon, 19 May 2025 20:25:34 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH73D-0000000AOPa-13i1
	for opensbi@lists.infradead.org;
	Mon, 19 May 2025 20:25:32 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-742c5f3456fso1545998b3a.0
        for <opensbi@lists.infradead.org>; Mon, 19 May 2025 13:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747686330; x=1748291130; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TwyHgfW94CnCOoq9CKhjKdHZO8Hd1lb88ScXhgGS2pQ=;
        b=Nj1q8b8VPSNBX41EV4uj3Mq0F30kqOdlQ7/DfZrGjaA5mRIxbyLxnknAHHbG4F73mB
         ATIKUk/7KZjtejm0Wl9nyQWiFBLFJZklGlVL/QVkpV7KK//08ll/ZnbAwMn2nSOBUrzs
         n6484Xq29xdMT4EyjsqnvYOkqQSKxohpmSS4wrCVSgp+objQljCz6njGdR27Nqx/iugo
         s2pf1sN41Bs/GVks6hm2G+qNurWriEozBaMKmxHsXKeB97bhI9Rwn1xSv+f94fKkiuVi
         pVU35q/mu55blTch4+XF2ozobqrIvLj/iz8qC0YW1s2S6w5M3cVZ4WzFOwIL7EwnuxGV
         HAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747686330; x=1748291130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TwyHgfW94CnCOoq9CKhjKdHZO8Hd1lb88ScXhgGS2pQ=;
        b=irQrkbsgU+4xj4xZ7WF+T2pEMqS0i7KvJezOZ/ZgTFwvLKY57+TZTBql+P1t/3k1eV
         fSwxfp8ukXHHKlla/jfCtvu4QQASaOwQScOHL6UM658E7FfXw1h5TRWND4q5VNACMcSz
         +Q62bgbZ1t4x09SarNOmV6Cm7bEcWF/+DOxbB0f/QlPrgKTCqNLqzdPklZ3Exh82pC4H
         jCrN426Cyxb9o+WpEfWOelE4KDZaMyhyedVm3akTplbs9amCcIztBTkuzfp7rIhdmtE6
         DcXSBhSgv8eZ+l8fyzhQtF1vzQDpFCl3fgHkXP0+WwwXJrvPnLpvqr8Hx171WZWaKOuX
         g2iA==
X-Gm-Message-State: AOJu0YyShsFGXt6Js6L3aSoGUoQC9vFBB5tbeHxMQT3lXq0wj0inL4YJ
	xlUeO5JaE3kBhPCBd0cAwItfLsz4B0HTs9AzRbljN94qorIQpkHV0oXWPqVDDH6lpObm/7aVIMU
	gBgx/18EF16YkPeENe9XP7V3NnOj9OvjjOt5kVUrh7w==
X-Gm-Gg: ASbGncu/ZKd1ikqP9RO7vmOCFcFO3AWj/tuBtvZSWUB8BTeTTP65Ev1uBKhcofdpLW8
	7Wr8Dj13VEgz3mPGeQ+v/Fl3vWWHZzU6R5Mc/CpENtZUxicKTEq79MmMZCwwohc/CEq7qgP/erx
	A6+V5QdZ+XSXl9B/nbFiFlqxW8STBbE1Q=
X-Google-Smtp-Source: AGHT+IE+vxlJNA/NWElKaNZNq7kN6A807hHoxOf5dj1yijKXk0ZevKnJk8i4zIgfF+vgCxJCfJkAxEZNnFHSE+Jiv5c=
X-Received: by 2002:a05:6a00:4143:b0:73e:23be:11fc with SMTP id
 d2e1a72fcca58-742a98b4cacmr17932991b3a.22.1747686329993; Mon, 19 May 2025
 13:25:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250519083950.739044-1-cleger@rivosinc.com> <20250519083950.739044-3-cleger@rivosinc.com>
In-Reply-To: <20250519083950.739044-3-cleger@rivosinc.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Mon, 19 May 2025 13:25:19 -0700
X-Gm-Features: AX0GCFur3lxPIZL-3c6ZPVgZepsZyZBLl_GX4e9SuMnpOS93NHz78u1gMotaSvk
Message-ID: <CAHBxVyFLrZM99XTh3TCDvuT+ZSX5UECzv+rjy37EcthyEnciUQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] lib: sbi: pmu: Remove MIP clearing from pmu_sse_enable()
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: opensbi@lists.infradead.org, Anup Patel <apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_132531_528737_7E9311E6 
X-CRM114-Status: GOOD (  14.49  )
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

T24gTW9uLCBNYXkgMTksIDIwMjUgYXQgMTo0MOKAr0FNIENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBDbGVhcmluZyBNSVAgYXQgdGhhdCBwb2ludCBtZWFu
cyB0aGF0IHdlIGNhbiBwcm9iYWJseSBsb3NlIGEgcGVuZGluZwo+IGludGVycnVwdC4gVGhpcyBz
aG91bGQgbm90IGhhcHBlbiwgcmVtb3ZlIE1JUCBjbGVhcmluZyBmcm9tIHRoZXJlLgo+Cj4gU2ln
bmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgo+IC0tLQo+
ICBsaWIvc2JpL3NiaV9wbXUuYyB8IDEgLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigt
KQo+Cj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX3BtdS5jIGIvbGliL3NiaS9zYmlfcG11LmMK
PiBpbmRleCBkZWU1MGI5Yi4uNTA0NzZkN2EgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfcG11
LmMKPiArKysgYi9saWIvc2JpL3NiaV9wbXUuYwo+IEBAIC0xMDk5LDcgKzEwOTksNiBAQCBzdGF0
aWMgdm9pZCBwbXVfc3NlX2VuYWJsZSh1aW50MzJfdCBldmVudF9pZCkKPiAgewo+ICAgICAgICAg
dW5zaWduZWQgbG9uZyBpcnFfbWFzayA9IHNiaV9wbXVfaXJxX21hc2soKTsKPgo+IC0gICAgICAg
Y3NyX2NsZWFyKENTUl9NSVAsIGlycV9tYXNrKTsKPiAgICAgICAgIGNzcl9zZXQoQ1NSX01JRSwg
aXJxX21hc2spOwo+ICB9Cj4KCgpSZXZpZXdlZC1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZv
c2luYy5jb20+Cgo+IC0tCj4gMi40OS4wCj4KCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVu
c2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9vcGVuc2JpCg==
