Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18651CD37BE
	for <opensbi@archiver.kernel.org>; Tue, 12 May 2026 04:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j/ywZrNaK7tWmKiDGJnEAp0kx+39+WdbFKCC1HEFtiE=; b=OlI84NW6JHD2IE
	dTKOc6pOLPpCug/b8f+UBB6LUcmb5rKmGkHa3Fybt2dLNgUcG9qG4sYo5YOtYoS8/13DakztkqgKV
	63gApf/Uah6pTi9DR8A+fg2BMO+1YFC3/rRrUJ4GbDLFCZcnt4gAEhnZof4ZC2aXKUmH58SbSrpbl
	GQ57dLOpj8sLryPNFkAdpLlN5hlbtCJrhox0A9Um37B+vqKJmW5p5RGwmb63VRHT+Q1dVtBqSfxLt
	svslQ5qMDCtI0UUKleJGN6l9P0Fq6lA12xkY4h+BXBSE/PuDT7oggs5Avqs45GDvOG4WFs1DFf5K0
	4w67GoM0ANMn+7ZWyMyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMejq-0000000FT6r-148T;
	Tue, 12 May 2026 04:28:58 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMejm-0000000FT6C-3msk
	for opensbi@lists.infradead.org;
	Tue, 12 May 2026 04:28:56 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-66f747175d8so3043354eaf.0
        for <opensbi@lists.infradead.org>; Mon, 11 May 2026 21:28:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778560133; cv=none;
        d=google.com; s=arc-20240605;
        b=MnjtVyh09O3L1NFxb4sPQLeTHUUtsedGmH7Qfs4ht1npiEjf33rhJse0+e71VbgFUn
         tN++pmJT8d5nVDZ3NKBJ7PTu6spGgORK5syDByyrmRo/0ixluuUs1BMdsnTKkGulEjAP
         EJEe7sTp1e77aXH+iO1NctRs0KtdH2Zm6b1MngefBSljWFwBx0dP9cfzn5dhfOsLIyEA
         HmB5x32tcOw9541ytoYauYbadxbfFI48/QS6JQWrE5wPrTj3NIBVci3wGh+us96SWC/L
         UwjSd4hY3g6dqDEsTZD0MNR3d/ycCjKhATYkc3hqhaLxt5baWggRLxfiIeztl2X0IyIk
         SGMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=29GrXyqnDnQ9CTTK6qsbDUAggCHwWlETiYTkPHmSd1I=;
        fh=kPsIZpzjf2qnaMtgdYtfw4kbK6ctQu+9EfCvlb1Rwnc=;
        b=JBfWS0M5/EzrRR3NvDfKr3TbWOKF3NAMF3sSvPh1RvBVgY/aMPmM+KvQFzE8tbpEYP
         71f/Zl7JGKCCCIGcTxwEZhSDnopxiYZMxwOc6fbnHza5AxCb9AlPawcF4afQl8YgtnbU
         zzaWTDsi5fT4Kv4lEVTk0wPHeKjGeEZHXWPMsReavASpppabgXfEcZ01Yf/08rqlgZYr
         lPP0kijxXgr39EB8MJ7RduTmaeZaDQI/FM4/MHkWCsppEPzFOHAqNh7f/vHtDxHQV9Wh
         FsXmnMpRc0FMDhng9OeKM8lgTlPvKS0XibAIWl2iJ+rIudq5fJc7eSlr6dhKs2J5cZLF
         wrFw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1778560133; x=1779164933; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=29GrXyqnDnQ9CTTK6qsbDUAggCHwWlETiYTkPHmSd1I=;
        b=S0RkR4j+2UbNS0xPff7rqcOa2sy02Ous78V3rShFUUahZhEYxtGQalVlj+pdZ1cwVR
         SNdYbvm43lwYIyThO4py8gI2DPyph3pwUuPJY8Elz2WV/EMa9GyEfZ7TW1UI3SjjcSNO
         zfQQ1cRV21KR2ogE1MhzkUVxxACT3+ulMptfhvVqFwsplzbokZXFgTGTwSICBNythqHu
         EagBoLbyDCTuAuGJxH5xy/EF7gvBouiZt71X6PbCv7zOGUNgK1faTDXprCXfqLvzjd3z
         tB+bw+W7itAmsR3YuZpxirwl0Z/WUG1nIK28ndL8pta/mPsnXz+WSV+ZSoCKy1EPX7dM
         aJDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778560133; x=1779164933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=29GrXyqnDnQ9CTTK6qsbDUAggCHwWlETiYTkPHmSd1I=;
        b=A7xSB9nv6bHniziRQww4MJ//UzQpKDBLVbgn2dg5NoAdzkTzyF2KffcTcMbdvmt0Vh
         SltPWTMZFBcYEH+rpT9GmO+uVqSPSrVUFB3N54UdWAvAso0guF+FKlaU4U/4txsD2+4u
         urCbfWkuDyLWfYlj4b3ST+k5etqoIw6d7f565+qfFglFJVTRcEy/EpbTUO4a5Zre6u4r
         qxw1sMprf36oU3MGHOqrCVO5m45MKYzuuaLJAUKrmQFLkJz+yJeBHz1MbIzUCDjgMFs5
         6UdnFTJtItKPaaZOKvpcxHJqJImWt3vCcAoyRyFQPkEXFQBlGkVwDNaN9lj3G1JtUxFF
         IX8Q==
X-Forwarded-Encrypted: i=1; AFNElJ/DGTrOLdsOoI9detYxD7j2MqwPbEx0x89wddyRPKQgUDjceMTTz/3rdRV8s8pZ9TK9loB/sCOO@lists.infradead.org
X-Gm-Message-State: AOJu0YxKuaMQ0OX+oFPMDkIUNUZCIB6AOpNsb7wcDIJ2HKm33gbPg6X6
	qwQyrfOiu534IrKrl+tBZaIr11TwRyPdn8MqhTj5rRDBoyd+zWEfcmBg6ZRpPPHkxzGKCHZS0S6
	BwENbXtf/zVkCkQLEV+62s5dZ9jKZQBUtDJwDIeVfbg==
X-Gm-Gg: Acq92OHbSQ8L1S0Jx6oHYpU/7MChbebfI2bLK8zlZWw24hl838M0+LkrcCxAT+leeVf
	7jYtmw1oSs3D9g3foKytlqPLjGRGd1KGjxJGC5A4xPuFMWWoDazp0J1x/akeYMqlAS/+XSqZvm/
	eWypME2OnspZn17GB4kBQZjUXlQM099PXbRa0tVsYBmWqnYr5S8i5VZOayCYVJX5XaXL6hnU0L/
	7KXTry9eR2L+CKyhU77QPDY9bV06A/nWn1tXJXPqI0tzNfazP8kGCTn/i+2kqseJD3Pz7bVLsWX
	G2Toyilz7xxiULJwNPlxb3UQ4w3XGe7ZyMkW2BwwkNqOeJqaq/dzEHyC8j7/qPG5tqMITt2uKws
	w1gZ/Pf2DXLyFXq+2ZDknhFrhgQ==
X-Received: by 2002:a05:6820:1c86:b0:696:2674:8a18 with SMTP id
 006d021491bc7-69998d0dbd8mr14343489eaf.35.1778560133569; Mon, 11 May 2026
 21:28:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260423052339.356900-1-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260423052339.356900-1-anup.patel@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 12 May 2026 09:58:41 +0530
X-Gm-Features: AVHnY4K8-74clceGU5U4Y0IIBBDbKQdCclXRIhmCPKx8Bfk1Tkb6mcq2gQOgcGY
Message-ID: <CAAhSdy0GDQ3Sb9=yf07OJ1mw6T_QhO4bf5K6kDCUSn9QHcPN8g@mail.gmail.com>
Subject: Re: [PATCH 0/6] Extend irqchip framework for MSIs and line sensing
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	Raymond Mao <raymond.mao@riscstar.com>, Dave Patel <dave.patel@riscstar.com>, 
	Evgeny Voevodin <evvoevod@tenstorrent.com>, Samuel Holland <samuel.holland@sifive.com>, 
	opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_212855_205199_194E208E 
X-CRM114-Status: GOOD (  11.96  )
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

T24gVGh1LCBBcHIgMjMsIDIwMjYgYXQgMTA6NTPigK9BTSBBbnVwIFBhdGVsIDxhbnVwLnBhdGVs
QG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gVGhpcyBzZXJpZXMgZnVydGhlciBleHRlbmRz
IHRoZSBPcGVuU0JJIGlycWNoaXAgZnJhbWV3b3JrIHRvOgo+IDEpIEFsbG93IGludGVycnVwdCBj
bGllbnRzIHNwZWNpZnkgbGluZSBzZW5zaW5nIHR5cGUKPiAyKSBTdXBwb3J0IE1TSSBjb250cm9s
bGVyIChha2EgSU1TSUMpIGFzIGlycWNoaXAgZGV2aWNlCj4KPiBUaGVzZSBwYXRjaGVzIGNhbiBh
bHNvIGJlIGZvdW5kIHRoZSBpcnFjaGlwX2ltcDJfdjEgYnJhbmNoCj4gYXQ6IGh0dHBzOi8vZ2l0
aHViLmNvbS9hdnBhdGVsL29wZW5zYmkuZ2l0Cj4KPiBBbnVwIFBhdGVsICg2KToKPiAgIGxpYjog
c2JpX2lycWNoaXA6IENoZWNrIGZ1bGwgcmFuZ2UgZm9yIGV4aXN0aW5nIGhhbmRsZXJzIGluCj4g
ICAgIHNiaV9pcnFjaGlwX3JlZ2lzdGVyX2hhbmRsZXIoKQo+ICAgbGliOiBzYmlfaXJxY2hpcDog
S2VlcCB0aGUgaGFuZGxlciBsaXN0IGluIHNvcnRlZCBvcmRlciBmb3IgaXJxY2hpcAo+ICAgbGli
OiBzYmlfaXJxY2hpcDogQWxsb3cgaW50ZXJydXB0IGNsaWVudCB0byBzcGVjaWZ5IGxpbmUgc2Vu
c2luZwo+ICAgbGliOiBzYmlfaXJxY2hpcDogQWxsb3cgbWFya2luZyBoYXJkd2FyZSBpbnRlcnJ1
cHRzIGFzIHJlc2VydmVkCj4gICBsaWI6IHNiaV9pcnFjaGlwOiBBbGxvdyBzZXR0aW5nIGhhcmR3
YXJlIGludGVycnVwdCBhZmZpbml0eQo+ICAgbGliOiBzYmlfaXJxY2hpcDogQWRkIHN1cHBvcnQg
Zm9yIHJlZ2lzdGVyaW5nIE1TSSBoYW5kbGVycwo+Cj4gIGluY2x1ZGUvc2JpL3NiaV9pcnFjaGlw
LmggfCAgNDkgKysrKysrKy0KPiAgbGliL3NiaS9zYmlfaXJxY2hpcC5jICAgICB8IDI1OCArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLQo+ICBsaWIvdXRpbHMvaXJxY2hpcC9p
bXNpYy5jIHwgICA5ICstCj4gIDMgZmlsZXMgY2hhbmdlZCwgMjkyIGluc2VydGlvbnMoKyksIDI0
IGRlbGV0aW9ucygtKQo+Cj4gLS0KPiAyLjQzLjAKPgoKVGhpcyBzZXJpZXMgaXMgYSBjcml0aWNh
bCBkZXBlbmRlbmN5IGZvciBBUExJQyBhbmQgSU1TSUMgZHJpdmVycwppbiBPcGVuU0JJIGhlbmNl
IG1lcmdpbmcgaXQgc29vbmVyLgoKQXBwbGllZCB0aGlzIHNlcmllcyB0byB0aGUgcmlzY3Yvb3Bl
bnNiaSByZXBvLgoKVGhhbmtzLApBbnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNi
aUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vb3BlbnNiaQo=
