Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7ECFC72AA
	for <opensbi@archiver.kernel.org>; Sun, 22 Mar 2026 05:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u8jfK0sH5rlR4XL5kvbWCNLBE6pYD9be35Tt5//lANs=; b=seuVlcL5yvdASl
	40EcOaqYhuD//KaRnSS+m62IUOu46WPkw8zT/llRi5r38yDqn4Mj5yGxS/IbYLFnOMmDekh1QMlx5
	sz/5WOScR6BRe4Dq04KMIIIUQI2/3BRfUEwR98Hb8xDbYwbgryh+d8D+4PtwJcOrwvWaZ+hdwrOGK
	7OLAI0Q6V1tOHuiw8taipJK6XSOWjrXtx7iZ+jOyElLkjXyb0C3MBIxSBWZmNkQk/DJcTO6RAwFAe
	28KuRnlH9xgTrW09Elq01ZRxl2G8PxpVGWHKeT+ZCN+Zw87EXDTt9VKV5deDhj+FxYQovaYDnkav2
	uRZGRJqM4MvgSa0W/MYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4BG1-0000000F5lO-38ii;
	Sun, 22 Mar 2026 05:21:49 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4BFy-0000000F5l1-2a9H
	for opensbi@lists.infradead.org;
	Sun, 22 Mar 2026 05:21:48 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-463a0e14abfso1699689b6e.2
        for <opensbi@lists.infradead.org>; Sat, 21 Mar 2026 22:21:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774156905; cv=none;
        d=google.com; s=arc-20240605;
        b=F4cWO2fXmjCAfjidXCTOng3I6qBYM5p+z66Tr7tEKqlt0DSLS5FzFkLAAj/pKuLY07
         bse3gX23Uc4/P2LTsGw+KWBjZB8jxYZKLf/gpW2z8Jt0Sl7DT534J3zL4fIBr/F0uVh1
         kT5/AxPPqQ/FaJSdIu/SBhmBkJWwoCV/oCO3CHGSbmeSv4oQ77q0I7YpcNfLGbREak9I
         eCUOmU5IltBtFGuLwNCoZ/RuVewM8zBvgxMW3LaMIWk+HTLW4+3dHQU75UuIyp6HZfKv
         VwuTFeR1mcniZFY4P8ZIbpxNeC1BiQSVZeJiqEoVEkK/NomoP+2dve/LmMrmLRqHUJKO
         sxDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TfXdCqP4HR7ToqvMt18IKOpvcuCJf0qm9hhZoygxoJc=;
        fh=GowJL5nZ0oJPi5+0I03vLpYlWqMooTiJjrylBMiHy3w=;
        b=ISUuKzrXtpsmxL1bGYo55f4XLh5z9zbp50MbFhEUckgKnwwMy9Cuyd7Rn8OzQ2BPEn
         mnWpSBQyrcMPfwNP0N2FAsKUeLdcbMk1XuH2j0tI0e8VgVbwgcaIezPA2zjxrAxnx7Sx
         5q+7f5VulD13fhNx7CkHcnNJkUaGHjXwMOTZRYSJY6a3Kbij1DmGIpS4HBawjr5ClmQG
         BmSKRj1/MGohXODWDiV8QZvGrkn1o5BLbo34oJ8tmNnc5Cg1ssOKnMhDMDlOv/2bf2zw
         nD3kAoXn46IjJeqBTvyURnZgY/HaJBwZdB3RrH1qCGvjI7YTEaL0C95YivJEG+T6kq0T
         grtg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1774156905; x=1774761705; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TfXdCqP4HR7ToqvMt18IKOpvcuCJf0qm9hhZoygxoJc=;
        b=EZIGJFrfFCVNZLs2GCWbICHm6STNRs4HOuKkiUaZ20lmE1YQVYQyz8o54KYQ2aMKoR
         coLh4mIJak3wCydL3Whdo+JYR+6hp1uojUyevRZoV+U2yNmPMLfcTb9bIxdslwNU4QD0
         D2MkaONOO2sHcHei4XrM4NqhW2wtHwFjsZGGPhy007EI9J3MOmv788O2RevKlqu6jABt
         tJIBl/YX7bLyD4Wezt98R7XkLf80TSbB0QnUJ/Tefb2eM368Ah7meAQB8I8D5PGKhsxg
         q0LHSb0VQjJBMNw94SO/wlKoneq1mQWpcMvM3/eGfpo6MAfKWeZ+q2ia3PArx5D/7Im5
         cmGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774156905; x=1774761705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TfXdCqP4HR7ToqvMt18IKOpvcuCJf0qm9hhZoygxoJc=;
        b=PuPS4YXzbKqjSx1m8vxs8scycpxf3TJs9xq1JHTGcLlV08jI12kw8QW9QanW0M8DHL
         fgpAAzRIrc8sI6hqk3iWkk2BuqLxW19RQH0tHn0OKjf6aHbNuCQr0H63rkyid6YJSD77
         NbMFRrN2+SUQOs6ZzAt1VNPTecRxouhn9DBfITJgFdqRj41HT1xYnLVLgO/5W2Wws1Sv
         cZ55UskxzwPYEKcsMNEirDjN+2YICAM/Mz3VZS+4GPa5dbMP4dm4AZxKiroEho8Z0jYq
         rAUPlZ5SSqNszYzdKg5/TFPibtZCK/1rYmtTYBBN93uV0o4tRRqoLFj4hDMgaxClZLhJ
         b0Kw==
X-Forwarded-Encrypted: i=1; AJvYcCXrb6KlWeob9U9XyrE8mZPZ1DIfKqzEpgrSz6c89et838+OCHWvTU7m9s4OFFUz/q/wDc2GfS1T@lists.infradead.org
X-Gm-Message-State: AOJu0Yxfp1lOfgk1zXeWzuR2jHwOYplE73TrynxbiUpgJOkglEJt2xLc
	+x+fkJ8biTtKyEXGCIUG9HCWbT1lMMeULljcYppo09xr/oGn2SqIZwrP8fZwo5zOIxH2lkTyuwh
	wtrIoOC1oZ/tNlCjP8OzZzZBoCiz2AXjE2Z/r2AEatQ==
X-Gm-Gg: ATEYQzz0lyDopJRPI4J/nTXaDPPhTmsEM22YieRuQzTA5B/NheIfWtAXLysDTGm0UOG
	l43dGxSbsu+KcFhhM5pF8gnDKm02BKF+09l4UJTYgnIcZD6YazFNZCfzZruOuZoZyg6RDHsfEaG
	jzmWsTvw6TJvC2Rs+OnVLYcBuDXwXwN3HzlfQmtAAtgmnc7bYneqiNiBClY2+LJI/1S6uCHQjVX
	woI27FZEb7Otp2e6zLdj4SRgYsgiUjyIMnl/dVHEUHfAOHqTKHYnm9lkUtL2Cdy4ucS199P1FrS
	rlV+TFEEY87Ox+bWOse1Z/k5b2PGkLJ0taX8wPbYWoOSjequApi/IcJuFuAiUalBqfeq695yAvD
	DPhKJLscQBPpucpX2U48LTzbVtw==
X-Received: by 2002:a05:6808:e315:20b0:467:880:743b with SMTP id
 5614622812f47-467e5e07813mr3624102b6e.22.1774156904765; Sat, 21 Mar 2026
 22:21:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260213055342.3124872-1-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260213055342.3124872-1-anup.patel@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 22 Mar 2026 10:51:33 +0530
X-Gm-Features: AaiRm51bX_HwuPXuz6AA2gMoB8J8RVxz2PdiK5HaiMesRXITC579XvEftJeBJgs
Message-ID: <CAAhSdy0CDrBrccWsE-6bQiGfmJoDWs0bDyoFwRQw99OeFCHDtg@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] Extend irqchip framework for M-mode interrupts
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	Raymond Mao <raymond.mao@riscstar.com>, Dave Patel <dave.patel@riscstar.com>, 
	Samuel Holland <samuel.holland@sifive.com>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_222146_932835_3D71E7EE 
X-CRM114-Status: GOOD (  13.30  )
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

T24gRnJpLCBGZWIgMTMsIDIwMjYgYXQgMTE6MjPigK9BTSBBbnVwIFBhdGVsIDxhbnVwLnBhdGVs
QG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gVG8gaGFuZGxlIGludGVycnVwdHMgaW4gTS1t
b2RlLCB0aGUgT3BlblNCSSBpcnFjaGlwIGZyYW1ld29yawo+IG5lZWRzIHRvIHN1cHBvcnQ6Cj4g
MSkgTXVsdGlwbGUgaW50ZXJydXB0IGNvbnRyb2xsZXJzIHdoZXJlIGVhY2ggdGFyZ2V0cyBhCj4g
ICAgc3Vic2V0IG9mIGhhcnRzCj4gMikgSGllcmFyY2hpY2FsIGludGVycnVwdCBjb250cm9sbGVy
cyAoZS5nLiBBUExJQyArIElNU0lDKQo+IDMpIFJlZ2lzdGVyaW5nIGhhbmRsZXIgZm9yIGhhcmR3
YXJlIGludGVycnVwdCBvZiBhCj4gICAgcGFydGljdWxhciBpbnRlcnJ1cHQgY29udHJvbGxlciBv
dXQgb2YgbXVsdGlwbGUKPiAgICBtdWx0aXBsZSBpbnRlcnJ1cHQgY29udHJvbGxlcnMKPgo+IFRo
ZSBuZWVkcyB0byBiZSBhY2hpZXZlZCB3aXRob3V0IG92ZXItY29uc3VtaW5nIG1lbW9yeS4KPgo+
IFRoZXNlIHBhdGNoZXMgY2FuIGFsc28gYmUgZm91bmQgaW4gaXJxY2hpcF9pbXBfdjIgYnJhbmNo
Cj4gYXQ6IGh0dHBzOi8vZ2l0aHViLmNvbS9hdnBhdGVsL29wZW5zYmkuZ2l0Cj4KPiBDaGFuZ2Vz
IHNpbmNlIHYxOgo+ICAtIEZpeGVkIHR5cG9zIGluIFBBVENINCBhbmQgUEFUQ0g1Cj4gIC0gSW1w
cm92ZWQgc2JpX2lycWNoaXBfcHJvY2VzcygpIGFuZCBzYmlfaXJxY2hpcF9hZGRfZGV2aWNlKCkK
PiAgICBiYXNlZCBvbiBTYW11ZWwncyBzdWdnZXN0aW9uCj4KPiBBbnVwIFBhdGVsICg4KToKPiAg
IGxpYjogc2JpX2lycWNoaXA6IFVzZSBjaGlwIGFzIHZhcmlhYmxlIG5hbWUgZm9yIGlycWNoaXAg
ZGV2aWNlCj4gICBsaWI6IHNiaV9pcnFjaGlwOiBSZW5hbWUgaXJxX2hhbmRsZSgpIGNhbGxiYWNr
IHRvIHByb2Nlc3NfaHdpcnFzKCkKPiAgIGxpYjogdXRpbHMvaXJxY2hpcDogRml4IGNvbnRleHRf
bWFwIGluaXQgaW4KPiAgICAgaXJxY2hpcF9wbGljX3VwZGF0ZV9jb250ZXh0X21hcCgpCj4gICBs
aWI6IHV0aWxzL2lycWNoaXA6IEFkZCBJREMgdG8gaGFydGluZGV4IG1hcCBpbiBzdHJ1Y3QgYXBs
aWNfZGF0YQo+ICAgbGliOiBzYmlfaXJxY2hpcDogU3VwcG9ydCBpcnFjaGlwIGRldmljZSB0YXJn
ZXR0aW5nIHN1YnNldCBvZiBoYXJ0cwo+ICAgbGliOiB1dGlscy9pcnFjaGlwOiBBZGQgdW5pcXVl
X2lkIHRvIHBsaWMsIGFwbGljLCBhbmQgaW1zaWMgZGF0YQo+ICAgbGliOiBzYmlfaXJxY2hpcDog
QXNzb2NpYXRlIDMyLWJpdCB1bmlxdWUgSUQgZm9yIGVhY2ggaXJxY2hpcCBkZXZpY2UKPiAgIGxp
Yjogc2JpX2lycWNoaXA6IEFsbG93IHJlZ2lzdGVyaW5nIGludGVycnVwdCBoYW5kbGVycwo+Cj4g
IGluY2x1ZGUvc2JpL3NiaV9pcnFjaGlwLmggICAgICAgICAgICAgICAgfCAgNzQgKysrKystCj4g
IGluY2x1ZGUvc2JpX3V0aWxzL2lycWNoaXAvYXBsaWMuaCAgICAgICAgfCAgIDIgKwo+ICBpbmNs
dWRlL3NiaV91dGlscy9pcnFjaGlwL2ltc2ljLmggICAgICAgIHwgICAxICsKPiAgaW5jbHVkZS9z
YmlfdXRpbHMvaXJxY2hpcC9wbGljLmggICAgICAgICB8ICAgMSArCj4gIGxpYi9zYmkvc2JpX2ly
cWNoaXAuYyAgICAgICAgICAgICAgICAgICAgfCAyODEgKysrKysrKysrKysrKysrKysrKysrLS0K
PiAgbGliL3V0aWxzL2ZkdC9mZHRfaGVscGVyLmMgICAgICAgICAgICAgICB8ICAgMyArCj4gIGxp
Yi91dGlscy9pcnFjaGlwL2FwbGljLmMgICAgICAgICAgICAgICAgfCAgMTQgKy0KPiAgbGliL3V0
aWxzL2lycWNoaXAvZmR0X2lycWNoaXBfYXBsaWMuYyAgICB8ICA1NCArKysrLQo+ICBsaWIvdXRp
bHMvaXJxY2hpcC9mZHRfaXJxY2hpcF9wbGljLmMgICAgIHwgICA1ICsKPiAgbGliL3V0aWxzL2ly
cWNoaXAvaW1zaWMuYyAgICAgICAgICAgICAgICB8ICAxOSArLQo+ICBsaWIvdXRpbHMvaXJxY2hp
cC9wbGljLmMgICAgICAgICAgICAgICAgIHwgICA3ICstCj4gIHBsYXRmb3JtL2dlbmVyaWMvb3Bl
bmh3Z3JvdXAvYXJpYW5lLmMgICAgfCAgIDEgKwo+ICBwbGF0Zm9ybS9nZW5lcmljL29wZW5od2dy
b3VwL29wZW5waXRvbi5jIHwgICAxICsKPiAgcGxhdGZvcm0va2VuZHJ5dGUvazIxMC9wbGF0Zm9y
bS5jICAgICAgICB8ICAgMSArCj4gIHBsYXRmb3JtL251Y2xlaS91eDYwMC9wbGF0Zm9ybS5jICAg
ICAgICAgfCAgIDEgKwo+ICBwbGF0Zm9ybS90ZW1wbGF0ZS9wbGF0Zm9ybS5jICAgICAgICAgICAg
IHwgICAxICsKPiAgMTYgZmlsZXMgY2hhbmdlZCwgNDM3IGluc2VydGlvbnMoKyksIDI5IGRlbGV0
aW9ucygtKQo+CgpBcHBsaWVkIHRoaXMgc2VyaWVzIHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8u
CgpSZWdhcmRzLApBbnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
b3BlbnNiaQo=
