Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC43C5AD4E
	for <opensbi@archiver.kernel.org>; Mon, 10 Aug 2026 06:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KSxpoFq/6hrlHMpxii65rU8z2gcnWNjLqowxZ6kDCdc=; b=tgQfsUDuQNz+lp
	1dMz51ICKxzHaePfmdiaT2p7QNHCZOHPwCiwfvitRrmshuN0/yH/Q/iZlJuos8TsrWBKdBYIIR372
	19F6TRABlawH8uXlm5niS4zlswy/es2VpBjbqzPUyHCLvgr6VcH3m8k5ACZw0mNszDhMG6cMgm80e
	MZzSRgDJNzJrvF5AtM7hvIfW4n7VWPjlOqkHKtWNvwh9lQv0Xik7LYNyFS/aC+qf+rvT0CLoxSVgO
	Q/+kO07EDHyU0ui5LEGicanXRG77dz3Dc7/W2Wx0iIm/iZxhSgsh+5b7orKTD+PdjfL6UyFfNHlui
	iIFJTwqsCxWuwIjKO/Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtJEl-0000000B4fe-2Pbt;
	Mon, 10 Aug 2026 06:11:51 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtJEi-0000000B4fC-1Ers
	for opensbi@lists.infradead.org;
	Mon, 10 Aug 2026 06:11:50 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6a0a4a18180so2148451a12.0
        for <opensbi@lists.infradead.org>; Sun, 09 Aug 2026 23:11:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786342305; cv=none;
        d=google.com; s=arc-20260327;
        b=W0JaBWFWnMQhPpMQNM199vK4V44bcnpMbfT7rx25D1R/zqu91l5gZ5npCH8BSA+6kd
         DCK2cRbxoyliokFRKNS1TMR4i3YoOF8RR0jiRhlQpVO9FpyxD56gFHYMRsSR9GP3IN7P
         djFDsRS7CO9IUSXNfQFZuMtPHF8PMiG93z8/Th/a4vVlZdbvVI5ISGh76KQZS3YtfkDx
         avxNKtBPOUPy1yldp5JAtdnrzdPSMBlPi+YVGRGfWQfG69FkCgPUJGV02XvpIhX26Qq0
         Ym7L6Lgntk5wQmXQ4m7nesxPAQDSsqDLDwEuZoUTaYLhpThnEGn8TuvZZQoLzwLiKbtE
         MI6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NOqe7Zm2vbauxUw+p25BfGf9UtOYz4kIl2N0X/A74hA=;
        fh=4LsF/ppNCopxa++F+clEpaQ9pDe2uFpwioOKXs1mzNk=;
        b=fwhUr8Hv3G7WejM1VEUCyGwl8syhpGDjOGUsVxAgddAoyrPH9LxYx+J0wn8uN9XlUV
         8OPZIG3ilXpODIkCevhx38FiFihVkdXxW6pyMSN3CmIDs3TDSph+1SPx6bloHhUTCNZ4
         9pdI8Z/y5Z4dMMaLmx2XgzkHb5UzHXr/fJHW1B9WLDqLKkQj2GUZHhxbJxFsYGoGGNDC
         CcbAhlv8HPzLWcrZ9+ttBfUrTKAOBthKtXrlLlaz/DW925GG/eBR/iuuOz2w/scqDFo4
         E7OZv6oJctZqzeCNwOJpuD9tdc2Q7vE4aIWbQtdSsYR/YFS97Gdke+wA/dinYZ8roewM
         BqTg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1786342305; x=1786947105; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NOqe7Zm2vbauxUw+p25BfGf9UtOYz4kIl2N0X/A74hA=;
        b=FXwD9a+eIzSciYC6QbO7Zf5QsDbT91EaGbJu4T7pijQVP2hZN1An6U4t6gasrqMLoL
         AEm92BYDS7R4lIlWByfQxqYlLzXzqL1sy8mMaHFPgTcQAH8zQNZMj/2twOXrlS6X63Wz
         uhaKlUUiescId8Hi79suO4FJp6qR/NWBykliGRdpyagBYih6JPcZl65Pwm5xOkZ8BdBZ
         I8lQY8mKpW/o/1SFQyEElSK3vUF0yRHqxS1a8tRs0K8ZJoEJ/zMcnuxh056/9wD6cyPg
         WzuVFrNFWRrLZwbVebPlf429JsoF4O14a90U2bmzKdpqdVkZ81ob6eEv5uwjG3QDE9QZ
         ct0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786342305; x=1786947105;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NOqe7Zm2vbauxUw+p25BfGf9UtOYz4kIl2N0X/A74hA=;
        b=fl85V9eQrcvvGMNAIXc1Qn0hyvd4n81bqkmtfXYcI2lSg7FQYPEMjSCDGg8GstCb7J
         WOwVWIVq2Wy+xn5e/CPQapCUxQ16gmZW2hFLgszeaTXGXvmpWgxyR/7+GRZXj+PAZ1kd
         FFtXQAyh0iI0NNDvpi25CP0mrp4HPKANSDG15pdMB+KJ1yLJg9mztqM+7eFV6yjzvXv8
         fvR5BImH2LeqRRvOYPw5O0Sm08GFXNudeTBccP0hMq1LnIiBO9EUuN3aWmW1FdNM/0QM
         MGl2ZZuPbJCSNdR+05eCzHnuW/LNQ2v+tvhNNIRedRuU4u4vf49xMrKzKYBHAfStYhDc
         druQ==
X-Gm-Message-State: AOJu0Yygmi6cvK/hkU68NX9e00Z5pkgaBhNNyzJaDymdvMhL59p1RkOK
	tsNSNrAzpfOpEHecCKmHkTNPjpUSViHEmdJlRKFd5nutKt1I4Q242gABb0uKBBXQmXrNGRwTX04
	kCHo456L88AXN6Wr6ZHZPNMu6K3vgMnGdn5qGJiElCo6r8489QIMlTNQHBA==
X-Gm-Gg: AR+sD11UgsBCTZXTWw3y2SbelxeAQsuuSip8rf4x4IueydbLw0T25YX92uS8qFwdTkh
	2YWaa0AcCPbAXGEi2QXivBcA839lzq+reZ890D0RbH9baLRv5H4OTHphkB/x3N+CcyaVz39s7J+
	wUeORpNsL6P3kFLbSRJwQp2UfSN7575HzjeyN52u/h/WyiZDXOSrMTjvllyvTFFKxwVEN6OvyMr
	lC2QA1QiRwHu8qG3+bJwcZGW2qg4ZCEXbKf6aYsn1ATBcsko39ZuCCjKEpAFOEV1DDf3zH2dvFr
	j8XNnUTUKRh6PpmUazIaCkr4ZIM0n/2/tmt0r7j+O6nWci4=
X-Received: by 2002:a05:6402:28cb:b0:6a1:8fff:1590 with SMTP id
 4fb4d7f45d1cf-6a1e62d7f80mr9438706a12.19.1786342305552; Sun, 09 Aug 2026
 23:11:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260707033954.2054859-1-zong.li@sifive.com> <CANXhq0qx=gryXgWKnrc7XuaJnPwhw0wqNB=NWYzgjv3h2hk4jA@mail.gmail.com>
In-Reply-To: <CANXhq0qx=gryXgWKnrc7XuaJnPwhw0wqNB=NWYzgjv3h2hk4jA@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Mon, 10 Aug 2026 14:11:33 +0800
X-Gm-Features: AUfX_mxhCdB7FDCcLYNCew8R9ch-EoD26VdDi4TmmKpxAIKrwfPL0dWjD-bFcOY
Message-ID: <CANXhq0qQVVZCEaVQe5v7grk=KVMMPwkKfP-B=quhPOnF3GK_YQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] firmware: add FW_DYNAMIC_APPEND firmware type
To: opensbi@lists.infradead.org, Anup Patel <anup@brainfault.org>
Cc: anup.patel@oss.qualcomm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_231148_378816_9C37B668 
X-CRM114-Status: GOOD (  31.87  )
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

T24gV2VkLCBKdWwgMjIsIDIwMjYgYXQgMTE6NTbigK9BTSBab25nIExpIDx6b25nLmxpQHNpZml2
ZS5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBKdWwgNywgMjAyNiBhdCAxMTozOeKAr0FNIFpvbmcg
TGkgPHpvbmcubGlAc2lmaXZlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gVGhpcyBzZXJpZXMgYWRkcyBh
IGZvdXJ0aCBPcGVuU0JJIGZpcm13YXJlIHR5cGUsIEZXX0RZTkFNSUNfQVBQRU5ELCBuZXh0IHRv
Cj4gPiB0aGUgZXhpc3RpbmcgRldfRFlOQU1JQywgRldfSlVNUCBhbmQgRldfUEFZTE9BRC4KPiA+
Cj4gPiBNb3RpdmF0aW9uCj4gPiA9PT09PT09PT09Cj4gPgo+ID4gRldfRFlOQU1JQyByZXF1aXJl
cyB0aGUgcHJldmlvdXMgYm9vdGluZyBzdGFnZSB0byBidWlsZCBhIHN0cnVjdAo+ID4gZndfZHlu
YW1pY19pbmZvIGluIG1lbW9yeSBhbmQgcGFzcyBpdHMgYWRkcmVzcyBpbiBhMi4gU29tZSBib290
aW5nIHN0YWdlcwo+ID4gY2Fubm90IGVhc2lseSBhbGxvY2F0ZSBhbmQgcGFzcyBzdWNoIGEgc3Ry
dWN0dXJlLCBidXQgdGhleSBjYW4gbG9hZCB0aGUKPiA+IE9wZW5TQkkgaW1hZ2UgYW5kIHBhdGNo
IGEgZmV3IHdvcmRzIGF0IGEga25vd24gbG9jYXRpb24gYmVmb3JlIGp1bXBpbmcgdG8KPiA+IGl0
LiBGV19EWU5BTUlDX0FQUEVORCB0YXJnZXRzIGV4YWN0bHkgdGhhdCBjYXNlOiB0aGUgc3RydWN0
IGZ3X2R5bmFtaWNfaW5mbwo+ID4gaXMgYXBwZW5kZWQgaW50byB0aGUgT3BlblNCSSBiaW5hcnkg
YW5kIHBhdGNoZWQgaW4gcGxhY2UgYnkgdGhlIHByZXZpb3VzCj4gPiBzdGFnZS4gRm9yIGV4YW1w
bGUsIHRoZSBwcmV2aW91cyBib290IHN0YWdlIHJ1bnMgb24gYSBkZWRpY2F0ZWQgaGFydC4KPiA+
IFRoZXJlZm9yZSwgaXQgY2Fubm90IHNldCB1cCBDU1JzIG9mIGFub3RoZXIgaGFydCB0aGF0IHJ1
bnMgT3BlblNCSS4KPiA+IFRoaXMgc2NlbmFyaW8gd2lsbCBvY2N1cnMgaW4gc2VydmVyIHN5c3Rl
bXMgd2l0aCBzZWN1cmUgYm9vdC4KPiA+Cj4gPiBLZXkgZGVzaWduIHBvaW50cwo+ID4gPT09PT09
PT09PT09PT09PT0KPiA+Cj4gPiAgIC0gVGhlIGFwcGVuZGVkIHN0cnVjdCBmd19keW5hbWljX2lu
Zm8gaXMgcGxhY2VkIGltbWVkaWF0ZWx5IGJlZm9yZSAuYnNzLgo+ID4gICAgIC5ic3MgaXMgTk9C
SVRTIGFuZCBpcyBkcm9wcGVkIGJ5ICdvYmpjb3B5IC1PIGJpbmFyeScsIHNvIGEgc3RydWN0dXJl
Cj4gPiAgICAgYWZ0ZXIgaXQgd291bGQgbm90IGJlIHBhcnQgb2YgdGhlIGZsYXQgLmJpbi4gUGxh
Y2luZyBpdCBiZWZvcmUgLmJzcwo+ID4gICAgIG1ha2VzIGl0IHRoZSBsYXN0IFBST0dCSVRTIGNv
bnRlbnQsIGkuZS4gaXQgc2l0cyBhdCB0aGUgdGFpbCBvZiB0aGUKPiA+ICAgICAuYmluIGFuZCBj
YW4gYmUgbG9jYXRlZCBmcm9tIHRoZSBpbWFnZSBzaXplLiBUaGUgcHJldmlvdXMgYm9vdGluZwo+
ID4gICAgIHRhZ2UgY2FuIHRoZXJlZm9yZSBmaW5kIHRoZSBzdHJ1Y3R1cmUgYXQ6Cj4gPgo+ID4g
ICAgICAgICBsb2FkX2FkZHJlc3MgKyBiaW5hcnlfZmlsZV9zaXplIC0gc2l6ZW9mKHN0cnVjdCBm
d19keW5hbWljX2luZm8pCj4gPgo+ID4gICAtIHN0cnVjdCBmd19keW5hbWljX2luZm8gZ2FpbnMg
YSBuZXcgJ2Jvb3RfZHRiJyBmaWVsZCAoaW5mbyB2ZXJzaW9uIDMpCj4gPiAgICAgdG8gY2Fycnkg
dGhlIERUQiBhZGRyZXNzLiBFeGlzdGluZyBvZmZzZXRzIGFyZSB1bmNoYW5nZWQuCj4gPgo+ID4g
ICAtIFRoZSBwcmV2aW91cyBib290aW5nIHN0YWdlIHBhdGNoZXMgZXZlcnkgZmllbGQgYXQgcnVu
dGltZS4gVGhlCj4gPiAgICAgcmVzZXJ2YXRpb24gaXMgYSBLRUVQKCkgUFJPR0JJVFMgc2VjdGlv
biwgc28gdGhlIHplcm8taW5pdGlhbGlzZWQKPiA+ICAgICBieXRlcyBzdGlsbCBsYW5kIGF0IHRo
ZSB0YWlsIG9mIHRoZSAuYmluLgo+ID4KPiA+ICAgLSBPbiB0aGUgY29sZC1ib290IHBhdGggKGd1
YXJkZWQgYnkgRldfRFlOQU1JQ19BUFBFTkQpLCBmd19iYXNlLlMgY2FsbHMKPiA+ICAgICBmd19k
eW5hbWljX2FwcGVuZF9ib290X2FyZ3MoKSBpbiBmd19keW5hbWljX2FwcGVuZC5TLiBUaGUgaGVs
cGVyIHNldHMKPiA+ICAgICBhMCA9IG1oYXJ0aWQsIGEyID0gJmFwcGVuZGVkIHN0cnVjdCwgYW5k
IGExID0gYm9vdF9kdGIsIGFuZCBjbGVhcnMgdGhlCj4gPiAgICAgcmVzZXJ2ZWQgYTMvYTQgdGhh
dCBmd19wbGF0Zm9ybV9pbml0IGNvbnN1bWVzLiBPbmx5IGEwLWE0IGFyZSBoYW5kbGVkCj4gPiAg
ICAgaGVyZSwgdGhlIHJlbWFpbmluZyBHUFJzIGFyZSBhbHJlYWR5IGNsZWFyZWQgYnkgdGhlIGV4
aXN0aW5nIF9yZXNldF9yZWdzCj4gPiAgICAgbGF0ZXIgb24gdGhlIGNvbGQgcGF0aC4gVGhlIGJv
b3RfZHRiIGxvYWQgaXMgZ2F0ZWQgb24gaW5mbyB2ZXJzaW9uIDMsIHNvCj4gPiAgICAgYW4gb2xk
ZXIgbGF5b3V0IGxlYXZlcyBhMSA9IDAgaW5zdGVhZCBvZiByZWFkaW5nIHBhc3QgdGhlIHN0cnVj
dC4KPiA+Cj4gPiBCYWNrd2FyZCBjb21wYXRpYmlsaXR5Cj4gPiA9PT09PT09PT09PT09PT09PT09
PT09Cj4gPgo+ID4gQWxsIGNoYW5nZXMgZm9yIHRoZSBleGlzdGluZyB0aHJlZSBmaXJtd2FyZSB0
eXBlcyBhcmUgY29tcGlsZWQgb3V0OiB0aGUKPiA+IGZ3X2Jhc2UuUyBmaXh1cCBhbmQgdGhlIC5m
d19keW5hbWljX2luZm8gb3V0cHV0IHNlY3Rpb24gYXJlIHVuZGVyCj4gPiAjaWZkZWYgRldfRFlO
QU1JQ19BUFBFTkQsIHdoaWNoIGlzIGRlZmluZWQgb25seSBieSBmd19keW5hbWljX2FwcGVuZC5T
IGFuZAo+ID4gZndfZHluYW1pY19hcHBlbmQuZWxmLmxkUy4gRldfRFlOQU1JQywgRldfSlVNUCBh
bmQgRldfUEFZTE9BRCBiaW5hcmllcyBhcmUKPiA+IGJ5dGUtZm9yLWJ5dGUgdW5jaGFuZ2VkLgo+
ID4KPiA+IEJ1aWxkCj4gPiA9PT09PQo+ID4KPiA+ICAgbWFrZSBQTEFURk9STT08cGxhdGZvcm1f
c3ViZGlyPiBGV19EWU5BTUlDX0FQUEVORD15Cj4gPgo+ID4gT24gdGhlIGdlbmVyaWMgcGxhdGZv
cm0gRldfRFlOQU1JQ19BUFBFTkQ9eSBpcyBzZXQgaW4KPiA+IHBsYXRmb3JtL2dlbmVyaWMvb2Jq
ZWN0cy5taywgc28gaXQgaXMgYnVpbHQgYnkgZGVmYXVsdC4KPiA+Cj4gPiBab25nIExpICg3KToK
PiA+ICAgZmlybXdhcmU6IGZ3X2R5bmFtaWM6IGFkZCBib290X2R0YiBmaWVsZCB0byBzdHJ1Y3Qg
ZndfZHluYW1pY19pbmZvCj4gPiAgIGZpcm13YXJlOiBmd19iYXNlLmxkUzogYWRkIC5md19keW5h
bWljX2luZm8gb3V0cHV0IHNlY3Rpb24gYmVmb3JlIC5ic3MKPiA+ICAgZmlybXdhcmU6IGFkZCBm
d19keW5hbWljX2FwcGVuZCBmaXJtd2FyZSB0eXBlCj4gPiAgIGZpcm13YXJlOiBmd19iYXNlLlM6
IGNhbGwgZndfZHluYW1pY19hcHBlbmRfYm9vdF9hcmdzIG9uIGNvbGQgYm9vdAo+ID4gICBmaXJt
d2FyZTogYnVpbGQgYW5kIGVuYWJsZSB0aGUgRldfRFlOQU1JQ19BUFBFTkQgZmlybXdhcmUgdHlw
ZQo+ID4gICBkb2NzOiBmaXJtd2FyZTogZG9jdW1lbnQgdGhlIEZXX0RZTkFNSUNfQVBQRU5EIGZp
cm13YXJlIHR5cGUKPiA+ICAgZG9jczogZmlybXdhcmU6IGxpc3QgRldfRFlOQU1JQ19BUFBFTkQg
aW4gZncubWQKPiA+Cj4gPiAgZG9jcy9maXJtd2FyZS9mdy5tZCAgICAgICAgICAgICAgICB8ICAx
OSArKysrLQo+ID4gIGRvY3MvZmlybXdhcmUvZndfZHluYW1pY19hcHBlbmQubWQgfCAxMTAgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICBmaXJtd2FyZS9leHRlcm5hbF9kZXBzLm1r
ICAgICAgICAgIHwgICAxICsKPiA+ICBmaXJtd2FyZS9md19iYXNlLlMgICAgICAgICAgICAgICAg
IHwgIDExICsrKwo+ID4gIGZpcm13YXJlL2Z3X2Jhc2UubGRTICAgICAgICAgICAgICAgfCAgMjQg
KysrKysrKwo+ID4gIGZpcm13YXJlL2Z3X2R5bmFtaWNfYXBwZW5kLlMgICAgICAgfCAxMDYgKysr
KysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgZmlybXdhcmUvZndfZHluYW1pY19hcHBlbmQu
ZWxmLmxkUyB8ICAyNCArKysrKysrCj4gPiAgZmlybXdhcmUvb2JqZWN0cy5tayAgICAgICAgICAg
ICAgICB8ICAgMiArCj4gPiAgaW5jbHVkZS9zYmkvZndfZHluYW1pYy5oICAgICAgICAgICB8ICAx
NyArKysrLQo+ID4gIHBsYXRmb3JtL2dlbmVyaWMvb2JqZWN0cy5tayAgICAgICAgfCAgIDEgKwo+
ID4gIHBsYXRmb3JtL3RlbXBsYXRlL29iamVjdHMubWsgICAgICAgfCAgIDkgKysrCj4gPiAgMTEg
ZmlsZXMgY2hhbmdlZCwgMzIyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRvY3MvZmlybXdhcmUvZndfZHluYW1pY19hcHBlbmQubWQKPiA+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgZmlybXdhcmUvZndfZHluYW1pY19hcHBlbmQuUwo+ID4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBmaXJtd2FyZS9md19keW5hbWljX2FwcGVuZC5lbGYubGRTCj4gPgo+ID4g
LS0KPiA+IDIuNDMuNwo+ID4KPgo+IEhpIEFudXAsCj4gQ291bGQgSSBrbm93IHlvdXIgcGVyc3Bl
Y3RpdmUgb24gdGhpcyBzZXJpZXMuIEkgd291bGQgYXBwcmVjaWF0ZSBpdCBpZgo+IHlvdSBjb3Vs
ZCBsZXQgbWUga25vdyBpZiBpdCBpcyByZWFkeSB0byBtb3ZlIGZvcndhcmQuIFRoYW5rcwoKSGkg
QW51cCwKV291bGQgeW91IG1pbmQgdGFraW5nIGEgbG9vayBhdCB0aGlzIHNlcmllcyB3aGVuIHlv
dSBoYXZlIGEgbW9tZW50PwpUaGFua3MKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2Jp
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9vcGVuc2JpCg==
