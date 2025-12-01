Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D2AD116E2
	for <opensbi@archiver.kernel.org>; Mon,  1 Dec 2025 06:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M7pFBsCBIYAr60k4BgEV76nyfBrM0FhXPVqJ48A0gkA=; b=RxD59/fgvSDatZ
	N1AsnGqQ7HnrJG4JtVxsqWAM7QoWSxB+t/mO6slbLf380LfTEKPR11xpHxhcO56Z79vBZEp0q6KJ5
	XZXeOKGmgHN/LOmlx35cbIwB604N3sUyYIChiIZEf7cYp0MvqqAramMmtuiR4n5c+1opTJ9n3vDZu
	qoNHemijNNZLgxPOAQiVAQ3sIlQiHpgUJp843+/l8cUciWABbRh4yPqbAGHuhrVR0y/i4dafGuwT6
	j2wJMS4qIMyFrBeT+s1sICBhtVzA7T6Afzg2/BR1mJQZNqBVdclvGmhFyOWsazci/Ra+EIZOQOqwM
	ZXJDLPzpVIL7N2IpziAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPxUL-00000002zXJ-3g4K;
	Mon, 01 Dec 2025 06:34:21 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPxUK-00000002zWh-0Tey
	for opensbi@lists.infradead.org;
	Mon, 01 Dec 2025 06:34:21 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-4331d3eea61so16271335ab.2
        for <opensbi@lists.infradead.org>; Sun, 30 Nov 2025 22:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1764570859; x=1765175659; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejWyCY9VSOo24aus4ETEhWTSjRi8s6uF9TtckaVzYrA=;
        b=L9dskc/MoKGxoCwKowy5Tfvharl4MzQQnxBhUCNmfaNwfPBlrwopk8idnz3YDmGn+1
         qjkn4Qg4o0YbqRmkM/fX1ltPndo+/p1Gbe1FI3qAwzPKSafwhtdViVwNAer0tuIKa5nj
         iMZTEchOMuThFC02zvajHgjV+c9zJXD7cpCDaO8KKJwNXdhEHX+jMZkJ7usaPCI9A/oA
         3a9MnLLd9YR8kogd0Sx+13+uf1qqCV6elghVfVAgb3CnfrLqXkupynzvqXtzzOkQ/2sR
         OXjwpJnkk3PwqaPUD9TL/6SR36Si1A02LvZ3RlAxybdg/tZcXsJ9A44UEkgHdj0yXm8n
         xSmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764570859; x=1765175659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ejWyCY9VSOo24aus4ETEhWTSjRi8s6uF9TtckaVzYrA=;
        b=qPkhsVQDHxkrkoFt7JSxD0AFiLb/dQfDL3lox5BXQeioZLSC4x64DnDK9mJXtNUo/7
         tXXvjFBdv+shxAHAUIEhaVZc3eiFWHb4jJRjXdiltqFsD8Ok16kKFYTesEU6doiiH5M2
         jHYGmP6Ne03Qr0n70wL6rUnvPwDLQxPyUiRdfVrhpH4WiZEzM4lZk/U9YIuRQ8X0025U
         nPwmb8i5PlATrPCXz3ANnb6IsaPFY66q1RmE39FzG9HqfsFhgfAmJUXF0Vw0s/TBVktK
         AHf3zSO2ta7bp37BnjiugFgwcWcesWxNNYNOicRUsXXi7/lLU6mzgD9XGhbkAajcZMB+
         NySw==
X-Gm-Message-State: AOJu0Yxs9gvVcg+7/FiIqRXikhr08d9fFCqd6adL3IKv6Jy56HHv1+ak
	aNA4PnQj4sdjZibakLyl5fOlt0d1J1OVgUVHwvpeKrlkXkgulKTQgYpvjxdbhZXWpG2YD3owP/L
	G739voh6Szq45OqIExr9x1z3gvP5l8Lizl0QWAVA+tbENvwErHsPJ
X-Gm-Gg: ASbGnctNH18k6SsOhJWStx7IuVWYR8jVfuthgoi2HKdkNPsi0uOcD+WTv6da3xPPLiO
	drQcX8LKgP5LJ6HfIvLXQoTUnNAN8GJ2ckxkheOAB2e1FZd4/r9zK/IjE8V/GxKZ914+21p8t9Y
	JFu9jua5XALn30ougM2wPHV2r2hyH3qoOuB+k2LqaDti1+DU8jt1uv7Bm1JIaNW1WPRK9YdNUnk
	IcwergksVgCL2vVyU8B1Mu09DBCkMuAtlOz9kVBlUdsRzd2DA9lg6dTuJEL8pbQpCgBOg==
X-Google-Smtp-Source: AGHT+IGMLtttbX69IVYaSCSHu25Qa2spzYbkqui+zCDnqna5U5ZEV0raJGxxTKkF8Q7iuDf9zXh5ltkjjn9/ADlYCqc=
X-Received: by 2002:a92:cd8b:0:b0:430:c90d:10ae with SMTP id
 e9e14a558f8ab-435dd119d26mr258397865ab.32.1764570859162; Sun, 30 Nov 2025
 22:34:19 -0800 (PST)
MIME-Version: 1.0
References: <20251113081648.2708990-1-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20251113081648.2708990-1-vladimir.kondratiev@mobileye.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 1 Dec 2025 12:04:08 +0530
X-Gm-Features: AWmQ_bkDYEvBB-vTNWsP_EgX2QOyIianyLoDLNmbMlVrogll0PDurKpZJg1dODs
Message-ID: <CAAhSdy0JrHP15ejqpsnZkN_7P5icNJpcxR7-s3k_JoU4pp4DHg@mail.gmail.com>
Subject: Re: [PATCH] Makefile: define C language standard to "gnu11"
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_223420_392144_DD4A6437 
X-CRM114-Status: GOOD (  12.80  )
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

T24gVGh1LCBOb3YgMTMsIDIwMjUgYXQgMTo0NuKAr1BNIFZsYWRpbWlyIEtvbmRyYXRpZXYKPHZs
YWRpbWlyLmtvbmRyYXRpZXZAbW9iaWxleWUuY29tPiB3cm90ZToKPgo+IEMgbGFuZ3VhZ2Ugc3Rh
bmRhcmQgd2FzIG5vdCBzcGVjaWZpZWQsIGltcGx5aW5nIGRlZmF1bHQgdGhhdCBpcwo+IGRlcGVu
ZGluZyBvbiB0aGUgY29tcGlsZXIgdmVyc2lvbi4gRm9yY2UgImdudTExIiwgc2FtZSBhcyBmb3Ig
dGhlCj4gTGludXgga2VybmVsCj4KPiBTaWduZWQtb2ZmLWJ5OiBWbGFkaW1pciBLb25kcmF0aWV2
IDx2bGFkaW1pci5rb25kcmF0aWV2QG1vYmlsZXllLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTog
QW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KCkFwcGxpZWQgdGhpcyBwYXRjaCB0byB0
aGUgcmlzY3Yvb3BlbnNiaSByZXBvLgoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICBNYWtlZmlsZSB8
IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9N
YWtlZmlsZSBiL01ha2VmaWxlCj4gaW5kZXggMzk4ZWFiZThjOTY0Li45YWE3ZjA2MGY1MWMgMTAw
NjQ0Cj4gLS0tIGEvTWFrZWZpbGUKPiArKysgYi9NYWtlZmlsZQo+IEBAIC0zNzQsNiArMzc0LDcg
QEAgR0VORkxBR1MgICAgKz0gICAgICAkKGZpcm13YXJlLWdlbmZsYWdzLXkpCj4gIENGTEFHUyAg
ICAgICAgID0gICAgICAgLWcgLVdhbGwgLVdlcnJvciAtZmZyZWVzdGFuZGluZyAtbm9zdGRsaWIg
LWZuby1zdGFjay1wcm90ZWN0b3IgLWZuby1zdHJpY3QtYWxpYXNpbmcgLWZmdW5jdGlvbi1zZWN0
aW9ucyAtZmRhdGEtc2VjdGlvbnMKPiAgQ0ZMQUdTICAgICAgICAgKz0gICAgICAtZm5vLW9taXQt
ZnJhbWUtcG9pbnRlciAtZm5vLW9wdGltaXplLXNpYmxpbmctY2FsbHMKPiAgQ0ZMQUdTICAgICAg
ICAgKz0gICAgICAtZm5vLWFzeW5jaHJvbm91cy11bndpbmQtdGFibGVzIC1mbm8tdW53aW5kLXRh
Ymxlcwo+ICtDRkxBR1MgICAgICAgICArPSAgICAgIC1zdGQ9Z251MTEKPiAgQ0ZMQUdTICAgICAg
ICAgKz0gICAgICAkKFJFUFJPRFVDSUJMRV9GTEFHUykKPiAgIyBPcHRpb25hbGx5IHN1cHBvcnRl
ZCBmbGFncwo+ICBpZmVxICgkKENDX1NVUFBPUlRfVkVDVE9SKSx5KQo+IC0tCj4gMi40My4wCj4K
Ci0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
