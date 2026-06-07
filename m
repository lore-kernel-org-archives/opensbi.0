Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7CC9CD8C8C
	for <opensbi@archiver.kernel.org>; Sun,  7 Jun 2026 16:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3bYVARiysTU52Cs0X543YxbDDitxdYy0YeutUkMJV3g=; b=pIr9HIqCOh5JOs
	UFyHnN6uzF/MytUyMPEyDTU2z6LDARgh1EaZWOCJpImZv5vxPRgiVTJGNJsiF9UMTixcUXkL8uvrC
	DSbRoqr8RkndxfncMx8o8MXsJ/8CkHIq2THjWY2ekP8S8NjG29ZZwroFxqVrXERRtlT8c+2XVFth/
	DjDNnzw9BUqdjxw6p/3kEfsaKmpkE4AVxVbEEORBbc2QLqYKmlBLCk5Cp8ANd7W9k1MlCsqOkAb2l
	G2IvfqcmCdi/f6CikW6jRcMvwt8rV2LucLCZrBaQCzKYQzTu1NLMHvGzFCkWd10cEvr6MVrRNDfBT
	1q4TdU6/ak57kZ16lv+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWG91-00000002KnU-2UaJ;
	Sun, 07 Jun 2026 16:14:39 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWG8x-00000002Kn5-2NVI
	for opensbi@lists.infradead.org;
	Sun, 07 Jun 2026 16:14:37 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-7e6ec655c80so1894389a34.0
        for <opensbi@lists.infradead.org>; Sun, 07 Jun 2026 09:14:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780848874; cv=none;
        d=google.com; s=arc-20240605;
        b=Q8q1hd4HPhE7UTN4wIVg8N3uAxdkr1DnlJfZr62//lbXCD3GRhGu27467m/jbKQj/w
         R8RdZ0fkwGYrq7hQbsxccRXEKmdEYODnnEd3ATNneJvaB07woS2WN4Yi3OHtgN3OEuK3
         H//KWRUW5tsyhvgLIPJj0m/XPJVvnHhCIIgDDUm/d4qdYgIXiZ6/OVjWG7y8TAk7CqWF
         c74Xw48iBj4K39GrwT2QjfCVQR/dwb+cOElVx3p3nXVWYe4aqP5gaYyjDXROovPa0B3H
         pc9vLj6ObkIp/wJ6dGNRt62HCnLvC2AGdRbF5Zc/gE/RZKg4GFNNrXzxpZEW/i26/9UW
         aPHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a3XiZupAlKLoMKVF1R1OXSEJKa+NRs8wriFKMlc23J0=;
        fh=KFL2ZnSEuyOnR/Qh1iesqX1KcdxrnTrRWFET+qVGlVQ=;
        b=JzrjCj0iMr5q6R/ED1s8oyC4632xHWB/AlECMVADeTRScdXcC7dY7nTQjUa9JdIxjM
         w3X6TTUpwpKGoNy6nocP5JmJr4a5VV4JW84SxS+PUh2nzAwTZxUmgvySw40BZ3ysqPUV
         ynC2ornuzxt5V6YHZSZju5otUHKGKSGMYwesWNohKR20FEtWstHJy5A5iRAsuR3P6wQi
         14vKvbYwFf4/ldXiuxHIHaMIHOtECH1OG4uoPBEZg49aIvytdb9901AgwiMpyDrB5hya
         q6mRHHPpkmGwunVx8g7xXfmirf9Vr6TuOmI4F83QgonnJEVcqatNQOqxpdnhZk2MGBq4
         Q1Xg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780848874; x=1781453674; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a3XiZupAlKLoMKVF1R1OXSEJKa+NRs8wriFKMlc23J0=;
        b=CQzu1ki98j08xqI93VoBHuKYF1/TdcdUv16WGJ1tyWpJja+jxURfSj4C5lfIikYv6d
         7faHZgLLb1uSm7O9oDnCbEPSoEBksGyDAVslwta9jR6UjuUhLq5vEr3xe40iTmOVJDr+
         Mg5i4aB8hETB4GSgOUT/XLw5qcfrHxAJ5pj8sTMKgbGeWnRh5TMUrG7FREzOlmMO419z
         /8FdVSytb/nYnA+CXGIN+XVJo1ZIoV4TsoLcAPae13pjQXOKnVehfGGP5MpnBYk/S7Jl
         FrPCTz5Bry290TPAblBVwPwZXBHtexnMtmkrou+dsj8xwpiYWnOBxP9C0auy2eUg5em2
         XCdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780848874; x=1781453674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a3XiZupAlKLoMKVF1R1OXSEJKa+NRs8wriFKMlc23J0=;
        b=YDh74UXtJ7VtSneSZnz6wCcmgjzq9u4lmZQnByJwz7cKnWlqqwCPMprNG7t3vipvts
         3nnuzb4j+OLoVtD8OXOW4WEDSI4SyVqsYXcHA+1q7YxQh3vf6EBTG/Tzxjrp+xk/TUfz
         85t5kMCHLFkQskpcv5Pd42MIRE3HS3p9/ByL+K4vd5NfN1vk+oBwloz10yGKdG6j/Pu/
         L557+UaKdiYCfLXa+AGsBJdWS6TWq5ex+jFIoRxEiPNCILJD/kzXOfbpUN1LgK0RHw2F
         jCJMYcnDC+r8Lx8VN7zQKnowS7RWxKtWaFMUngt/oim0sxy2q8ki+k7Iap/cHlReCWqS
         O2/A==
X-Gm-Message-State: AOJu0YwgQyHfhTgokb0aKoI6gaPisamKqC6BqKivyxRyhEO9l6CqnVW+
	aCInkxFUZC2M5AUxNY0LaOMp3mC0G7NlW997nKJM76HrmTSJB5aiv+BVFSxzkRNSW8LvQ/4zMfT
	YtNdBIfjAwyQw6WkYW+NCwVrZkXi+C/p/LIYBiKcNrw==
X-Gm-Gg: Acq92OGlqZEJsDPcr7nKdea7AIyq4C2lkxGunwGLLITIRNDor8z/jp9V5z3HY7cbMQa
	AGJHUgyK1P7XpBvKbCvg7vY6saLZHKt0uuJZGEHBYX6Wu2vAyaP1kptKgySMdQqakBPgs89G1ow
	OwEmk8FE0lJmivRgEOskPfdq1Qp94vffdmHC5xnNOk1wocnqaO/Gw12f7IeJn5SEWWNH8jhi4F0
	quqjvFaKhyqtjSonFpy+ECGUwHVGvW/GMABKMcvWOdpFHACXwRETwz52ZYc3jzZF1bg8vINf1Ok
	717sivZ2zKtH9JRS3GnvpsW57GJ2jAmzpwZVdbdyU4HVP7PT5wIF0jfA7CtygmAQs3HqeZjXN0W
	4hEiqeNNr633jQtAKfXGVtI3zilejMGR73ME0yQ==
X-Received: by 2002:a4a:e053:0:b0:69e:6606:d137 with SMTP id
 006d021491bc7-69e68b5f73emr5537628eaf.22.1780848874089; Sun, 07 Jun 2026
 09:14:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260328054347.3706029-1-david.garcia@aheadcomputing.com>
In-Reply-To: <20260328054347.3706029-1-david.garcia@aheadcomputing.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 7 Jun 2026 21:44:22 +0530
X-Gm-Features: AVVi8CcEzNtVTr_fTEW42lf0U1wOGVRFiqdve95s6DwfwtTp8E3dUtXr_Xstaqw
Message-ID: <CAAhSdy3OTy5UsBGhHiJbnD2Qh0zZz+ERMfVu8yygft-1qr3r5A@mail.gmail.com>
Subject: Re: [PATCH 0/4] irqchip/rpmi: Expose APLIC/IMSIC interfaces for
 platform use
To: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_091435_754520_E906AEAB 
X-CRM114-Status: GOOD (  21.75  )
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

SGkgRGF2aWQsCgpPbiBTYXQsIE1hciAyOCwgMjAyNiBhdCAxMToxNOKAr0FNIERhdmlkIEUuIEdh
cmNpYSBQb3JyYXMKPGRhdmlkLmdhcmNpYUBhaGVhZGNvbXB1dGluZy5jb20+IHdyb3RlOgo+Cj4g
VGhpcyBzZXJpZXMgZXhwb3NlcyBleGlzdGluZyBBUExJQyBhbmQgSU1TSUMgaW50ZXJuYWwgZGVm
aW5pdGlvbnMgYW5kCj4gYWRkcyBtaW5pbWFsIGV4dGVuc2lvbiBwb2ludHMgc28gdGhhdCBwbGF0
Zm9ybSBjb2RlIGNhbiBwZXJmb3JtIGN1c3RvbQo+IGludGVycnVwdCBjb25maWd1cmF0aW9uIHdp
dGhvdXQgbW9kaWZ5aW5nIHRoZSBnZW5lcmljIGlycWNoaXAgZHJpdmVycy4KPgo+IFRoZSBtb3Rp
dmF0aW9uIGlzIHRoYXQgYSBwbGF0Zm9ybSB3aGljaCB1c2VzIEFJQSBtYXkgbmVlZCB0bwo+ICAt
IENvbmZpZ3VyZSBBUExJQyBzb3VyY2UvdGFyZ2V0IHJlZ2lzdGVycyBkaXJlY3RseSBmb3IgTS1t
b2RlCj4gICAgaW50ZXJydXB0IHJvdXRpbmcKPiAgLSBJdGVyYXRlIHJlZ2lzdGVyZWQgQVBMSUMg
ZGV2aWNlcyBmb3IgcGxhdGZvcm0tc3BlY2lmaWMKPiAgICBpbml0aWFsaXphdGlvbgo+ICAtIEhh
bmRsZSBNLW1vZGUgZXh0ZXJuYWwgaW50ZXJydXB0cyBiZXlvbmQgSVBJIGluIHRoZSBJTVNJQyBk
cml2ZXIKPiBGdXJ0aGVybW9yZSwgYSBwbGF0Zm9ybSB1c2luZyBSUE1JIFBFUkZPUk1BTkNFIHNl
cnZpY2UgZ3JvdXAgbWF5Cj4gbmVlZCB0bzoKPiAgLSBVc2UgUlBNSSBwZXJmb3JtYW5jZSBkb21h
aW4gYXR0cmlidXRlIGZsYWdzIGZvciBSUE1JIFBFUkZPUk1BTkNFCj4gICAgUEVSRl9ET01BSU4g
YW5kIEZBU1RfQ0hBTk5FTCBhdHRyaWJ1dGUgY29udHJvbAoKUGxhdGZvcm0gc3BlY2lmaWMgY29k
ZSBzaG91bGQgYmUgZG9pbmcgbWluaW1hbCBBSUEgY29uZmlndXJhdGlvbgphbmQgd2Ugd2lsbCBz
b29uIGhhdmUgbW9yZSBmdW5jdGlvbmFsbHkgY29tcGxldGUgSU1TSUMgYW5kIEFQTElDCmRyaXZl
cnMuIFRoZSBpZGVhIGlzIHRoYXQgcGxhdGZvcm1zIHNob3VsZCBiZSBhYmxlIHRvIGNyZWF0ZSBk
ZXNpcmVkCmludGVycnVwdCByb3V0aW5nIHRvIGRvbWFpbnMgdXNpbmcgb25seSBEVC1iYXNlZCBk
b21haW4gY29uZmlndXJhdGlvbgphbmQgZ2VuZXJpYyBBSUEsIE1QWFksIGFuZCBSUE1JIGRyaXZl
cnMuCgo+Cj4gUGF0Y2ggMSBtb3ZlcyBBUExJQyByZWdpc3RlciBkZWZpbmVzIGZyb20gYXBsaWMu
YyB0byB0aGUgcHVibGljCj4gYXBsaWMuaCBoZWFkZXIgKHB1cmUgbW92ZSwgbm8gZnVuY3Rpb25h
bCBjaGFuZ2UpLgo+IFBhdGNoIDIgYWRkcyBhcGxpY19nZXRfbGlzdCgpIHRvIGFsbG93IHBsYXRm
b3JtIGNvZGUgdG8gaXRlcmF0ZQo+IHJlZ2lzdGVyZWQgQVBMSUMgZGV2aWNlcy4KCkJhc2VkIG9u
IGFib3ZlLCBib3RoIFBBVENIMSBhbmQgUEFUQ0gyIGFyZSBub3QgbmVlZGVkLgpJZiBhIHBsYXRm
b3JtIHNwZWNpZmljIGNvZGUgc3RpbGwgbmVlZHMgZGlyZWN0IEFQTElDIGNvbmZpZ3VyYXRpb24K
dGhlbiBiZXR0ZXIgdG8gaGF2ZSB0aGVzZSBwYXRjaGVzIGFzIHBhcnQgb2YgdGhlIHNlcmllcyB3
aGljaAphZGRzIHRoYXQgcGxhdGZvcm0gc3VwcG9ydCBpbiBPcGVuU0JJLgoKPiBQYXRjaCAzIHJv
dXRlcyBub24tSVBJIElNU0lDIGludGVycnVwdHMgdGhyb3VnaCB0aGUgc2JpX2lycWNoaXAKPiBo
YW5kbGVyIGZyYW1ld29yayBhbmQgYWRkcyBod2lycV91bm1hc2svaHdpcnFfbWFzayBjYWxsYmFj
a3Mgc28KPiB0aGF0IHNiaV9pcnFjaGlwX3JlZ2lzdGVyX2hhbmRsZXIoKSB3b3JrcyBlbmQtdG8t
ZW5kIHdpdGggSU1TSUMuCgpUaGUgUEFUQ0gzIGlzIHJlYWxseSBpbmNvbXBsZXRlIGJlY2F1c2Ug
SU1TSUMgZHJpdmVyIG5lZWRzCnRvIGltcGxlbWVudCBsb3QgbW9yZSBzYmlfaXJxY2hpcCBvcGVy
YXRpb25zIGZvciBhIGNvbXBsZXRlIE1TSQpjb250cm9sbGVyIGZ1bmN0aW9uYWxpdHkuIFdlIChR
dWFsY29tbSkgd2lsbCBiZSBwb3N0aW5nIGEgY29tcGxldGUKSU1TSUMgZHJpdmVyIHdoaWNoIHdp
bGwgYWxzbyBpbmNsdWRlIGEgY29tcGxldGUgQVBMSUMgZHJpdmVyCnN1cHBvcnRpbmcgYm90aCBN
U0ktbW9kZSBhbmQgRGlyZWN0LW1vZGUgaW4gdGhlIG5leHQgZmV3IGRheXMKc28gc3RheSB0dW5l
ZC4KCj4gUGF0Y2ggNCBhZGRzIG1pc3NpbmcgUlBNSSBwZXJmb3JtYW5jZSBmbGFnIGRlZmluZXMg
YW5kIGEgc3RydWN0IGZpZWxkLgoKVGhlIFBBVENINCBvZiB0aGlzIHNlcmllcyBsb29rcyBnb29k
IHRvIG1lIGFuZCBzaG91bGQgYmUgbWVyZ2VkLgoKPgo+IEFsbCBjaGFuZ2VzIGFyZSBhZGRpdGl2
ZSBhbmQgcHJlc2VydmUgZXhpc3RpbmcgYmVoYXZpb3IgZm9yIHBsYXRmb3Jtcwo+IHRoYXQgZG8g
bm90IHVzZSB0aGUgbmV3IGludGVyZmFjZXMuCj4KPiBEYXZpZCBFLiBHYXJjaWEgUG9ycmFzICg0
KToKPiAgIGxpYjogdXRpbHM6IGlycWNoaXA6IGFwbGljOiBNb3ZlIHJlZ2lzdGVyIGRlZmluZXMg
dG8gcHVibGljIGhlYWRlcgo+ICAgbGliOiB1dGlsczogaXJxY2hpcDogYXBsaWM6IEFkZCBhcGxp
Y19nZXRfbGlzdCgpIGFjY2Vzc29yCj4gICBsaWI6IHV0aWxzOiBpcnFjaGlwOiBpbXNpYzogRGlz
cGF0Y2ggbm9uLUlQSSBpbnRlcnJ1cHRzIHZpYSBpcnFjaGlwCj4gICAgIGZyYW1ld29yawo+ICAg
aW5jbHVkZTogbWFpbGJveDogcnBtaV9tc2dwcm90OiBBZGQgUlBNSSBwZXJmb3JtYW5jZSBkb21h
aW4gZmxhZwo+ICAgICBkZWZpbmVzCj4KPiAgaW5jbHVkZS9zYmlfdXRpbHMvaXJxY2hpcC9hcGxp
Yy5oICAgICAgICB8IDEwMyArKysrKysrKysrKysrKysrKysrKysrCj4gIGluY2x1ZGUvc2JpX3V0
aWxzL21haWxib3gvcnBtaV9tc2dwcm90LmggfCAgMTggKysrKwo+ICBsaWIvdXRpbHMvaXJxY2hp
cC9hcGxpYy5jICAgICAgICAgICAgICAgIHwgMTA2ICsrLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4g
IGxpYi91dGlscy9pcnFjaGlwL2ltc2ljLmMgICAgICAgICAgICAgICAgfCAgMTUgKysrLQo+ICA0
IGZpbGVzIGNoYW5nZWQsIDEzOSBpbnNlcnRpb25zKCspLCAxMDMgZGVsZXRpb25zKC0pCj4KPiAt
LQo+IDIuNDMuMAo+Cj4KPiAtLQo+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gb3BlbnNiaUBsaXN0
cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9vcGVuc2JpCgpSZWdhcmRzLApBbnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3Bl
bnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vb3BlbnNiaQo=
