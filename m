Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7AA1C369B2
	for <opensbi@archiver.kernel.org>; Mon, 14 Apr 2025 12:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=80LGE86m5Wb7SuptrAfd95ag2KWSgMETQARdpmQ9GP4=; b=Ai+sqn34RJt6sC
	tnB0CV64NcFYnux3mlf3WDJQjjiq9ye87vzaChLLMQrnJWuj028GCVeLYIOGffb5+H9VOQ1QqHGig
	qCfdDeyWesFXMZ/r6vW4AZFsAr6Jmbc/t7wtFjVwdTMf5Z2kFeOAIkjMUN48zfS2R2XEgmD+lvuuL
	0EtJsxu3gT5vM99dz2SuXo/6zntOnff4Mda+uvqRX+swM0ceFncwgm/hhKK5NMzrpmgU4kWCft/gV
	VpJKEBLqKGdaoNmXt6IFusMLKSCdiWW8YZrvylFFw1JTKkVev4ziY+68gmNMY0ItZa5jCkEvgsagD
	7shtSX5DK+TNviwn7JMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4IaX-00000001skQ-2dHP;
	Mon, 14 Apr 2025 12:06:57 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4IRJ-00000001rK3-0Rhm
	for opensbi@lists.infradead.org;
	Mon, 14 Apr 2025 11:57:26 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-3d43c972616so11242295ab.0
        for <opensbi@lists.infradead.org>; Mon, 14 Apr 2025 04:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1744631844; x=1745236644; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vppwsdhGFe/KcOjGroXHJeMMugNcOLZIuD5QFDHOx2w=;
        b=KFCHiS7X4mX/3f2kc6joFo/DBR5GW711BX5helezCl5KxszIDe8ikgUFjvKCy99BQB
         YFBIN3nUOwdRKxsV/kLx7/sQhz/3O3/QUzCoWVGubV4wDPemxeMjxvnS0N3px8ES8+da
         AkG1A5nvKk2nqHRBXHmacRKiZrm8YYZo/b0dIo0Yghy96eAarDi9NWqzSXRYn3Ds2IdD
         9BzN/qW8PEukk9wQ9+WbMQjngqawSVWERqI2X7HApB0A0D3xHXEHFcfStDKitijJeubH
         IekTnISxzR/KMfdAauGVIy9sUYxV2ctF/60lJAa3lDtTn1ZOTYhsoOABlQ84szZ1vNJu
         vR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744631844; x=1745236644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vppwsdhGFe/KcOjGroXHJeMMugNcOLZIuD5QFDHOx2w=;
        b=dvP8TV1fSe147lJqKexnoQuqMkPN9OVzZk3Bv0kmb9bHtflumkfcP+S2J7yXAxXx2Q
         agBs/+WePYwsznmWy4qh8NevnZ/uNjRQ/MDxNlwNcJuycus6ONbyzJuHtxuWuVSQpTjQ
         qPnjDeIqighjTXdoU2GeZtxcqs8NXOmirNsI9L4zFqnFKimPQDteB+MiZpyjAQkZQCu3
         ZapdtPdjXFzft3T67oZIy9sJidsLuaT1BfXTa8QI78JIEYr7j5At1AsITU6fGXgckw/6
         sCRP0hb+9izRJgNuVM/k0mNh6HdGIlOxpzcCg4re+jD4ayGo+xgk+ZxGGixiojm3N+GT
         aV6Q==
X-Gm-Message-State: AOJu0YwkfOVjVEPWsYh2/d47d7LhjqvnvrR2+tA46AwOe28GCPjLfLYY
	PeiuHRG3P7SozvVmWSaglFXtDohKgJLPTstpBSIk2mGt9bEHI+TfFBdSD3GxIO3KNkOSFYhnHXS
	1KBYifh5nHiEwc/RkQ44LlZRuNKMxLlsJNbw/Vg==
X-Gm-Gg: ASbGncsjipHMPj1TNUwH+osiQm72sHCQMT1C0G3rfpRhB6D6FWa2HuWHAcgN4uXtEwB
	2f2AGzooJETmY2vQzqSaXattFEvYox1J8oM6tgk6uNG149lhX8Gw5Oaq554yBvfEN3cxpcIBmG1
	Ss09gIi6A8X7JRpN1D+hgzhA==
X-Google-Smtp-Source: AGHT+IFaNT6S17jnwOQdOjT2yninFiN2R9mQ9MoW59mZfT79n3OMsSCu5yc3sedzGrSFaujovavLjOmZM82noKdRzxk=
X-Received: by 2002:a05:6e02:2306:b0:3d5:890b:d9e1 with SMTP id
 e9e14a558f8ab-3d7ebf43ce4mr120057575ab.1.1744631843849; Mon, 14 Apr 2025
 04:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250324043943.2513070-1-ycliang@andestech.com>
In-Reply-To: <20250324043943.2513070-1-ycliang@andestech.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 14 Apr 2025 17:27:13 +0530
X-Gm-Features: ATxdqUEWaJPgc57V0PPl2G43IXIaa1Vzk_DERLFEsUgskjQHdBdBZNCsEXnoV0U
Message-ID: <CAAhSdy22V6mRu6zaxzSkTsydgO+yzUFuLoxE5rDANzp3T5pb1A@mail.gmail.com>
Subject: Re: [PATCH 1/1] docs: pmu_support: fix example typos
To: Leo Yu-Chi Liang <ycliang@andestech.com>
Cc: opensbi@lists.infradead.org, atishp@rivosinc.com, peter.lin@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_045725_408149_CD48773F 
X-CRM114-Status: GOOD (  14.68  )
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

T24gTW9uLCBNYXIgMjQsIDIwMjUgYXQgMTA6MDnigK9BTSBMZW8gWXUtQ2hpIExpYW5nIDx5Y2xp
YW5nQGFuZGVzdGVjaC5jb20+IHdyb3RlOgo+Cj4gVGhlIChldmVudCBJRCAmICJzZWNvbmQgY29s
dW1uIG1hc2siKSBzaG91bGQgZXF1YWwKPiB0aGUgImZpcnN0IGNvbHVtbiBtYXRjaCB2YWx1ZSIu
IE1vZGlmeSB0aGUgZXhhbXBsZQo+IHRvIGZpdCB0aGUgZGVzY3JpcHRpb24uCj4KPiBTaWduZWQt
b2ZmLWJ5OiBMZW8gWXUtQ2hpIExpYW5nIDx5Y2xpYW5nQGFuZGVzdGVjaC5jb20+CgpBcHBsaWVk
IHRoaXMgcGF0Y2ggdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywKQW51cAoKPiAt
LS0KPiAgZG9jcy9wbXVfc3VwcG9ydC5tZCB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RvY3MvcG11X3N1
cHBvcnQubWQgYi9kb2NzL3BtdV9zdXBwb3J0Lm1kCj4gaW5kZXggOWI0OGYxZS4uYjU1MmU2NyAx
MDA2NDQKPiAtLS0gYS9kb2NzL3BtdV9zdXBwb3J0Lm1kCj4gKysrIGIvZG9jcy9wbXVfc3VwcG9y
dC5tZAo+IEBAIC03NCwxMCArNzQsMTAgQEAgcG11IHsKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwweDEwMDAwIDB4MTAwMzMgMHgwMDBmZjAwMD47
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIEZvciBldmVudCBJ
RCAweDAwMDIgKi8KPiAgICAgICAgIHJpc2N2LHJhdy1ldmVudC10by1taHBtY291bnRlcnMgPSA8
MHgwMDAwIDB4MDAwMiAweGZmZmZmZmZmIDB4ZmZmZmZmZmYgMHgwMDAwMGY4PiwKPiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLyogRm9yIGV2ZW50IElEIDAtNCAqLwo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiBGb3IgZXZlbnQgSUQg
MC0xNSAqLwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8MHgwIDB4
MCAweGZmZmZmZmZmIDB4ZmZmZmZmZjAgMHgwMDAwMGZmMD4sCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIC8qIEZvciBldmVudCBJRCAweGZmZmZmZmZmMDAwMDAwMGYg
LSAweGZmZmZmZmZmMDAwMDAwZmYgKi8KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgPDB4ZmZmZmZmZmYgMHgwIDB4ZmZmZmZmZmYgMHhmZmZmZmYwZiAweDAwMDAwZmYw
PjsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPDB4ZmZmZmZmZmYg
MHhmIDB4ZmZmZmZmZmYgMHhmZmZmZmYwZiAweDAwMDAwZmYwPjsKPiAgfTsKPiAgYGBgCj4KPiAt
LQo+IDIuMzQuMQo+CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3Bl
bnNiaQo=
