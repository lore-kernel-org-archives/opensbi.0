Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE20C4451B
	for <opensbi@archiver.kernel.org>; Mon, 20 Jul 2026 08:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3CGSpG6v18urV0dWPtc3JFykIYhXyUyUP1Q6ZGC+cgs=; b=hkW/kRBXbNr8K1
	dlOL4AX8Wl8VJOpx+ltQ1M72ga8Vlu3oS1IlBwwYkzpv1QlsPtV4gb6AIlz4bHvqfdOOC3o6kFGZa
	QwK4bxZo30CnQwIvRWs5utIlMoC/Kp6Q0JzC/i4UbJPIZm3wUpvyEduH90QopTnxzDyRf9GDu4dQw
	GZMR1WCK2JjMKc+N1g/xHwJuNIzlhRMuLaQIAVyFEPvDW5iaUcRRipJ4tE1VfNRUWG3XlhEuXHE4e
	SiUIXZzDyh5qGGxjozTYKbF4DfUjywlxnTIphbpgJF5rW9jT0lb/mMTU2f4PRhbwJ3qZx9mBDKVs/
	lfdtZKZZZGBEEGzWXbtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wljZM-00000006DkI-3755;
	Mon, 20 Jul 2026 08:41:48 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wljZK-00000006DjW-0m1t
	for opensbi@lists.infradead.org;
	Mon, 20 Jul 2026 08:41:47 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-47db714766aso1904408f8f.0
        for <opensbi@lists.infradead.org>; Mon, 20 Jul 2026 01:41:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784536904; cv=none;
        d=google.com; s=arc-20260327;
        b=OUzC84g3tI8+0DOyldGBYlgAA5/QGZQz1azy9lE19jvNPSA+dmIuj+F7p7nNnGhLns
         j6C6fXOn5Qj8RVjBdFu/mvIr55hOMC67+hgQtteZl4s/A+NkegXTmq4wyApj7o2ckruH
         wyFhAqC/DS1urvoDcyKhey62odgNj/LY9c8EXec3spGJ2kl0ZglnaW8VRF3xeovrT/8Z
         eRNT091rFB+Wfb0yeiwsKfCr4e67dogJSCWVMd2Lzv8cHXI0BasQwfEsmloAYqH1pJEr
         z9XeGW3I6AYT4kn4AYQl5+0uhVJGSd54xmnycj2dA+A0PWDOTq0sUnDJDQiAalxwGyyY
         979A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fRJ1/umY4JRHvEFM8UufCMEicVBcfhq//sX5e1AbaFQ=;
        fh=Sch92qKkux4AeucvC2KlvargZk/jQktzKzrRc6CJlNk=;
        b=GMW20T+vFsjYuyR9Gtk6xZ3uUuMEaiYzMiOchPXXhzJUT/8Q61yl719isaZ6weDT8G
         coOVwRbjdY+STwSeq07m4q8aYOIbPWEyJ+dFSLbuSwcN/RIYsO9PuSr2MJCI3locAotv
         Eg1awDuXsZK2GEUIeryWxGxW2VDaUH+TTZabvnjMTB55bPgnYDbHqnEx2/auJel5PJ4g
         C9pSlAk8Tm0yno5ONBfqxtrmX4kwnUrvW4w8xc4aYny6zJ2YydiadX6MJYDWBGMjhuYq
         fSqTFxUBdnUpZRDhehPGiUOC1klIUb4ycgvuAgKBpZC11jSilxmlSOsugNm3XbKFlwKd
         r5pg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1784536904; x=1785141704; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fRJ1/umY4JRHvEFM8UufCMEicVBcfhq//sX5e1AbaFQ=;
        b=yf4jXAA4BmdD4Kqx/pF17BuauKmKKkCGzoWiHm1sfVmOBec9IpCMTVbpLLwaQgoF3N
         UwuYTzYfvsCBiA5S9jARZOKhHqr6BB/KBqEqNHdD78ewJf3PC46lHauPY7veS2eKm64N
         rSb3NIw/V4d0ZFszfP8Ilxqrk8VeS+5oTwZlgNY4uUhwvG/mVA3h878njckV+mhd/17E
         9fP8uiIRkbv9XiuMbcI+l6/UacmPTPOVx/JB5EX0QcxHrtnmTAi9fpjHQFgK6+5tTnRU
         imHJUUnI2vl3MtP9LlPdFNu2iSaO3dnrKhlMAFPGxXO5kihDrg1BOziCObYAwwilFIbR
         kGfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784536904; x=1785141704;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fRJ1/umY4JRHvEFM8UufCMEicVBcfhq//sX5e1AbaFQ=;
        b=KcVFNbdYJrnkgSEpd8PNUQ79wF/I8cif3c8y3k/AB7+0mUqPbWya8DV87vVIIcGs2C
         odIJFi3kip2l27upFXB+otTRIlDF3Qrp0YWE5XZy8QBkX7JsdooMDsiAfQakh5Ai4OxM
         MXdO4uUdamh4AxF8p6FDg85b0g0llPkl5R4j1JGzQ1mjv6Xn4JINSHaTs4jfrIfTJO/G
         wpqGr3Il67faRGSgokDuNGZc/UzSQuX0jBGgw4X29+7bTypCBW9X85Jns9hU1t/zB+wF
         JQu2c5seTAVxsxy+FuIW8mbJ0xClFIPdpzNJ5gippob+k2vxgt1IedrGS9XPoYa9ICB6
         q/9w==
X-Gm-Message-State: AOJu0YwuZi2fXgSIBqAPYPxLkFuJCr4L9g/4t2oS4JNB/UXNsKGeICAG
	5s+nmAyIPD6HaaKv7b3yaJldXBj5vtCiEedWRn5IKawN2d/OVTrigoGCtRwneeRzfqfTjyaCub4
	j4G4scbbmJUiGVIfiQA85izqtjZykwZtKycCJ3s0XwAmynmj/XJSP
X-Gm-Gg: AfdE7ckKWajrB5iwlF1gYkMSZl1yzqyM8Tjp7b6GbX6gpcJpI2uHgJlvwl7IMUASZnX
	NumAjH89nSQ2FI0Vl16iDn7cZFIqNhHtsynKEFYxP3i1SNI1CHN7iJ9M0jnmsI9aG28QwYtzF4x
	+dTfNOykSJZXNtS1XV+Lk8K9+w3h2otLGQoaKthYbnir3nlY1Mx3qT+h9C+CbZrw5hHPhTk77wK
	aKCORcoBtgn2UEx+C9DDTooXDPOkrkgUbcS6MO7d1q23m8VLBxSD57rG3e4HFPibtmTjLFT62Ek
	IKMvgovJws7KIw4wp7mJJiix5cm3Qak5BGuR7n9TXoiZDIsYSlt6V4u9UuLg6Hk9Btw9AJuLt/J
	JUGnvOg==
X-Received: by 2002:a05:6000:41e4:b0:47a:b6a0:b024 with SMTP id
 ffacd0b85a97d-47f5a419835mr21732059f8f.4.1784536903932; Mon, 20 Jul 2026
 01:41:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260514225756.2255758-1-raymondmaoca@gmail.com>
In-Reply-To: <20260514225756.2255758-1-raymondmaoca@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 20 Jul 2026 14:11:32 +0530
X-Gm-Features: AUfX_mwhYcSE4dpUyQHPn7xMSc14ruO_fiBDOnTdIB197_jNc09RF4J_B6wSUxY
Message-ID: <CAAhSdy257TRRvKMTqxaryFTaY-XFcS-k5mS+9N6s=A1S1n6Xvg@mail.gmail.com>
Subject: Re: [PATCH 00/10] Introduce Virtual IRQ (VIRQ) framework
To: Raymond Mao <raymondmaoca@gmail.com>
Cc: opensbi@lists.infradead.org, scott@riscstar.com, dave.patel@riscstar.com, 
	raymond.mao@riscstar.com, robin.randhawa@sifive.com, 
	samuel.holland@sifive.com, anup.patel@qti.qualcomm.com, 
	anuppate@qti.qualcomm.com, dhaval@rivosinc.com, peter.lin@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_014146_381707_2DD5DE60 
X-CRM114-Status: GOOD (  16.87  )
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

T24gRnJpLCBNYXkgMTUsIDIwMjYgYXQgNDoyOOKAr0FNIFJheW1vbmQgTWFvIDxyYXltb25kbWFv
Y2FAZ21haWwuY29tPiB3cm90ZToKPgo+IEZyb206IFJheW1vbmQgTWFvIDxyYXltb25kLm1hb0By
aXNjc3Rhci5jb20+Cj4KPiBUaGlzIHNlcmllcyBpbnRyb2R1Y2VzIGEgVmlydHVhbCBJUlEgKFZJ
UlEpIGZyYW1ld29yayBmb3IgT3BlblNCSSB0bwo+IHN1cHBvcnQgZG9tYWluLWF3YXJlIHdpcmVk
IGludGVycnVwdCBjb3VyaWVyaW5nLgo+Cj4gVGhlIG1haW4gdXNlIGNhc2UgaXMgdG8gbGV0IE9w
ZW5TQkkgcmVjZWl2ZSBhIGhvc3QgSFdJUlEgaW4gTS1tb2RlLAo+IG1hcCBpdCBpbnRvIGEgcGVy
LWNoYW5uZWwgVklSUSBudW1iZXIgc3BhY2UsIHJvdXRlIGl0IHRvIGEgdGFyZ2V0Cj4gZG9tYWlu
LCBub3RpZnkgdGhlIHRhcmdldCBTLW1vZGUgcGF5bG9hZCwgYW5kIGxldCB0aGF0IHBheWxvYWQK
PiBwb3AvY29tcGxldGUgdGhlIHBlbmRpbmcgVklSUSB0aHJvdWdoIGFuIFNCSSBlY2FsbCBpbnRl
cmZhY2UuCj4KPiBUaGUgaW1wbGVtZW50YXRpb24gaXMgb3JnYW5pemVkIGFzIGZvbGxvd3M6Cj4K
PiAgIC0gYWRkIGlycWNoaXAgaGVscGVycyBmb3IgUy1tb2RlIHBlbmRpbmcgbm90aWZpY2F0aW9u
Cj4gICAtIGV4dGVuZCBkb21haW4gY29udGV4dCBzd2l0Y2hpbmcgdG8gc3VwcG9ydCBWSVJRLWRy
aXZlbgo+ICAgICBjcm9zcy1kb21haW4gY291cmllcmluZyBhbmQgcmV0dXJuLXRvLXByZXZpb3Vz
LWRvbWFpbiBmbG93Cj4gICAtIGFkZCB0aGUgY29yZSBWSVJRIG1hcHBpbmcsIHJvdXRpbmcsIGFu
ZCBwZXItKGRvbWFpbixoYXJ0KQo+ICAgICBwZW5kaW5nIHF1ZXVlIGZyYW1ld29yawo+ICAgLSBh
ZGQgYSBWSVJRIHZlbmRvciBlY2FsbCBleHRlbnNpb24gZm9yIFBPUCBhbmQgQ09NUExFVEUKPiAg
IC0gcGFyc2Ugc3lzaXJxIHJvdXRpbmcgcnVsZXMgZnJvbSBEVCB1bmRlciAvY2hvc2VuL29wZW5z
YmktZG9tYWlucwo+ICAgLSBkZXJpdmUgQVBMSUMgdGFyZ2V0IGhhcnQgcm91dGluZyBmcm9tIHN5
c2lycSBub2Rlcwo+ICAgLSB1cGRhdGUgdGhlIGlycWNoaXAvQVBMSUMgcGF0aCB0byBzdXBwb3J0
IGRlZmVycmVkIGNvbXBsZXRpb24gYW5kCj4gICAgIHBlci1IV0lSUSBBUExJQyB0YXJnZXRzCj4g
ICAtIGRvY3VtZW50IHRoZSBEVCBiaW5kaW5nIGFuZCByb3V0aW5nIHJ1bGVzCj4KPiBUaGUgRFQg
cm91dGluZyBtb2RlbCBpcyBiYXNlZCBvbiAib3BlbnNiaSxtcHh5LXN5c2lycSIgbm9kZXMuCj4g
RWFjaCBpbnRlcnJ1cHRzLWV4dGVuZGVkIGVudHJ5IGNvbnRyaWJ1dGVzIG9uZSByb3V0ZWQgcGh5
c2ljYWwgc291cmNlLAo+IGl0cyBlbnRyeSBpbmRleCBiZWNvbWVzIHRoZSBWSVJRIG51bWJlciB3
aXRoaW4gdGhlIHNlbGVjdGVkCj4gb3BlbnNiaSxtcHh5LWNoYW5uZWwtaWQsIGFuZCBvcGVuc2Jp
LGRvbWFpbiBzZWxlY3RzIHRoZSBkZXN0aW5hdGlvbgo+IE9wZW5TQkkgZG9tYWluLgo+Cj4gVGhp
cyBzZXJpZXMgZGVwZW5kcyBvbiBhIHByZXZpb3VzIHBhdGNoIHNldDoKPiBbUEFUQ0ggdjIgMS8z
XSBsaWI6IHV0aWxzOiBpcnFjaGlwOiBpbXBsZW1lbnQgQVBMSUMgaHdpcnEgb3BlcmF0aW9uIGhv
b2tzCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb3BlbnNiaS8yMDI2MDUwNDE3MTM0Mi4xNjU1
ODgyLTEtcmF5bW9uZG1hb2NhQGdtYWlsLmNvbS8jdAo+Cj4gUmF5bW9uZCBNYW8gKDEwKToKPiAg
IGxpYjogaXJxY2hpcDogYWRkIFMtbW9kZSBub3RpZmljYXRpb24gaGVscGVycwo+ICAgbGliOiBz
Ymk6IGRvbWFpbjogYWRhcHRhdGlvbiBmb3Igc3VwcG9ydGluZyBWSVJRIGNvdXJpZXJpbmcgZG9t
YWluCj4gICAgIGNvbnRleHQgc3dpdGNoCj4gICBsaWI6IHNiaTogQWRkIFZpcnR1YWwgSVJRIChW
SVJRKSBzdWJzeXN0ZW0KPiAgIGxpYjogc2JpOiBBZGQgVklSUSBlY2FsbCBleHRlbnNpb24KPiAg
IGxpYjogc2JpOiBkb21haW46IGFkZCBkb21haW4gbG9va3VwIGJ5IG5hbWUKPiAgIGxpYjogdXRp
bHM6IGZkdDogcGFyc2Ugc3lzaXJxIHJvdXRpbmcgZnJvbSBEVAo+ICAgbGliOiB1dGlsczogaXJx
Y2hpcDogZGVyaXZlIEFQTElDIHRhcmdldHMgZnJvbSBzeXNpcnEgbm9kZXMKPiAgIGxpYjogaXJx
Y2hpcDogc3VwcG9ydCBkZWZlcnJlZCBjb21wbGV0aW9uIGFuZCBwZXItSFdJUlEgQVBMSUMgdGFy
Z2V0cwo+ICAgbGliOiBzYmk6IGRvbWFpbjogZW5zdXJlIGJvb3RfaGFydGlkIGlzIGFzc2lnbmVk
Cj4gICBkb2NzOiBkb21haW46IGRvY3VtZW50IHN5c2lycSBWSVJRIG1hcHBpbmcgYW5kIHJvdXRp
bmcgcnVsZXMKClRoaXMgVklSUSBhYnN0cmFjdGlvbiBpcyBub3QgbmVlZGVkIHdpdGggdGhlIGlt
cHJvdmVkIFNCSSBpcnFjaGlwCndoZXJlIGVhY2ggZXh0ZXJuYWwgaW50ZXJydXB0ICh3aXJlZCAv
IE1TSSkgY2FuIGJlIHVuaXF1ZWx5IGlkZW50aWZpZWQKYnkgYSB0dXBsZSB3aGljaCBTQkkgaXJx
Y2hpcCBpbnN0YW5jZSBhbmQgaHdpcnEgbnVtYmVyIGluIHRoZSBpbnN0YW5jZS4KCkFsc28sIHRo
ZSBWSVJRIGVjYWxsIGlzIGFkLWhvYyBhbmQgZG9lcyBub3QgY29ycmVzcG9uZCB0byBhbnkKU0JJ
IGV4dGVuc2lvbi4KCkFsbC1pbi1hbGwgdGhlIHdob2xlIGludGVycnVwdCByb3V0aW5nIGZvciBz
dXBlcnZpc29yIGRvbWFpbnMgbXVzdApiZSByZS13cml0dGVuIHVzaW5nIFNCSSBNUFhZICsgUlBN
SSBzeXN0ZW0gaXJxIHNlcnZpY2UgZ3JvdXAKYXMgdGhlIGludGVyZmFjZSBmb3Igc3VwZXJ2aXNv
ciBkb21haW5zLgoKVGhlIFNCSSBNUFhZIGlzIGFscmVhZHkgYSByYXRpZmllZCBTQkkgZXh0ZW5z
aW9uIGFuZCBPcGVuU0JJCmFscmVhZHkgaGFzIGFuIGV4dGVuc2libGUgTVBYWSBmcmFtZXdvcmsg
d2l0aCBhIG51bWJlciBvZiBNUFhZCmRyaXZlcnMgdW5kZXIgbGliL3V0aWxzL21weHkuIFRoZSBS
UE1JIHN5c3RlbSBpcnEgZHJhZnQgc3BlY2lmY2F0aW9uCndhcyBhbHJlYWR5IHNoYXJlZCBmZXcg
bW9udGhzIGJhY2suCgpSZWdhcmRzLApBbnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3Bl
bnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vb3BlbnNiaQo=
