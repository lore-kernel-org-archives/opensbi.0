Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0D1C44520
	for <opensbi@archiver.kernel.org>; Mon, 20 Jul 2026 15:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KHvabp1MEXg8Y8QOVOxRIZGL1AzrYxo/pVXnr8wruQs=; b=IuZxskuGcLxLBn
	hVNdSdQkLEdeAtD+XbNsi5Vof3DzZXhNHiwAxMCgn6kQUyOydeeWj1iJPuVerXHrqGFE37RyvTcOk
	D48ex6e6vZKUSZJwj7J9K99Qn2tOSf4kcMSmGOITmXtz2TF2Vgp9etWF7ihUs3NiOOxn1bGD//C/S
	kQOr9RGBJXO7H4oDu2RGElK/EJGJOxLXzRdst9ILKxTXb0alJGx94q0ggeIiJ27l4x8pcE4q2qxKi
	R0NQmrt3q7oqlVugqW+qZsuwfwWHGsmlVTdvnqufWFseXPzg2p/zpjgsnulZo6rn1oyN0ljNiSxhs
	57xbrrIEajz7kZdHiUjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpuG-00000007BoC-1PH8;
	Mon, 20 Jul 2026 15:27:48 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpuE-00000007Bm2-0Neb
	for opensbi@lists.infradead.org;
	Mon, 20 Jul 2026 15:27:47 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-475417f010dso5712445f8f.2
        for <opensbi@lists.infradead.org>; Mon, 20 Jul 2026 08:27:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784561264; cv=none;
        d=google.com; s=arc-20260327;
        b=r70fImTNyfUap/elFALMNterNatRPZdDPWF6Nsu78rIwQZpyVw/PEOsidVOmrnMjmS
         kZ+kpHP5jrdAenApyiUBQbzCww18ZQrXGWM6Q+MLvfPZ9tbQY7CZdUykyidGa3A+eXUW
         VHAI9wrxDRwETmERZ1HfVy5gTRwAklBdy1wavsIiGpK4bMsA/Lwytem8aevEERe1VYE7
         sTx0MuF5xtSAxuDsFVfCzdRfn9HpOMPBHyhNlYrK0OYXN4dRW6WtrESOMzWzpo6yc6+K
         gxGv1MFNVzPW2xmwjh41SplWPkvZe0FJs8AzM3vxHIrKS7s3t71ZlUtlviyWGGfsqyz/
         PKeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RmWViC2JODMr/D6qxww2BtQRfMWWdxOm5wzLmJzMjvI=;
        fh=Sch92qKkux4AeucvC2KlvargZk/jQktzKzrRc6CJlNk=;
        b=RHE7DOfeDwkQqPH+qo3yhNSm/IwyXqcZ00k+PWY5RyXxr6YCXOvBwg/IqBI0N6DFhL
         GLEAFRv0axs6CwtLa3IDr7BxZl+6IpP+V3HBJrx2PxLaL/kRYom54RxfCpvRBQGYu/SI
         ocAkXTH9us+kYug3sPmuCYF01amWxTUtxe/EgGqpnBEyM5X+eigdMvqb8jwrznfdUWj9
         szGDn9kHXAxDGSR+mjPXoy5NWB+LfhPUgYe+Z78WHDamNhqjL+wBnS7pK+bme+P6xVe8
         3AkHaZs3SXC/3IIBBCXWw56IBQP8Ehy4MIJeFZnc12cQGJOg8pPervYVqxLoDd7yguAd
         HvXg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1784561264; x=1785166064; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RmWViC2JODMr/D6qxww2BtQRfMWWdxOm5wzLmJzMjvI=;
        b=VLx2wJSQ5Xyb1cim5+sykdu2WodUqVuyXeNDbClBfvVsnDTeWhiQCStzyVq2+0zH5P
         dFn9EZFp8LhULKDADrs348N/Ccnb/GmlY6ofJcRkqde/DoUSyAML4xxLZAQctxdS4xno
         0czfG2Hvd40Bj7ImZo1mfu632h4jGOyV+qfb3Lj/d9DPp9y2tzoqCj2GfiuCuK7T5b4k
         SqL20ixe5cmAhjIsTO7AZYctrilNiZJnnjdizbpcMWrO3uBobarOj0vBEDPB92T07JcG
         Ls/EtU+eiPAYnjWivmvQsP+uPAiXP7Wq+RpffIZv2gS+wz3FJ2u7wKGPEaVFdG0/5lAb
         K6AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784561264; x=1785166064;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RmWViC2JODMr/D6qxww2BtQRfMWWdxOm5wzLmJzMjvI=;
        b=qaQmlfngM7Nci0suP5ucir9aY1ZlwUDmxwhAPwdymXtf0uRK4czVFyMzr4Aa2KHGyr
         VP1/KnJp6Bi9a0EwESRJ0tmIimhE9N39J+nrwHGZYHfccgcJgRUIYIp1iM+wPfugyQny
         Wt7oGNUdjAhBTqMEGuw02GUCFWeet13Xf7mV5C1X73IOtQTGR4QAtWcMcbuWO3NKuWdV
         ucAvpORmHRx1AmnGACc47SHElZtIADT8u79izFvqGSbo0ONOaXBj2bdbndTIlAhGJuW/
         AjR9dxx6dIxll7hrYg6148zrazY7gOLEfS/jTRCRS9vKV+QTtwVwotgicGdScPtADxiU
         T97Q==
X-Gm-Message-State: AOJu0YyRAY+he0sy/pSNc+ZMJOI5EutiE0FagAbTeBMWXyxfd5iGxCBr
	iG8fNv9arIbXhl+y/zJAT+7/1TD77mLpERiY2kqKmIfIyJEsk4kUapg5kGRU0Xqx3zlHK5V4yr7
	BaxP38r5LBo6SSoCz3va7gvv//wCVuRi2u2UsRSO5eg==
X-Gm-Gg: AR+sD11gIkTbjbJoGp3NcxxaZz/ubIhp7V+w+0HUue9pHXB5YXJO8XTSs5xNmbMQo7I
	HJAT39iLa12oO0CahqHjl0saik3DEa0u+tAONtaBeyxllR7otLr8+RIQB+2oDmqLBfZDAtwcDBG
	qBrS+G0oRYGLCYt0tlS7er2ZmIz8xHIvZqJkvztVH2XLo01B3CW66XF2rT6J9ApsUy7TXpZzKmT
	vZocKRpS+Nx0ykqtghpTSDbMrnx7GlUPPgpyh0d38V1ahwAd4iJX3s4cfVYNoXA3npjgC/IpP56
	dKRv8q8TonGZw8QtCrFpSnu1lEqCutyYvVriP70X1nP9XxJv6AD9o9DWDc4Y1APMRJSTUlQR2Ds
	QZ41S54yxUo/zjOA=
X-Received: by 2002:a05:6000:26ca:b0:47f:73ea:37c0 with SMTP id
 ffacd0b85a97d-47f73ea3983mr7480667f8f.52.1784561263915; Mon, 20 Jul 2026
 08:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260514225756.2255758-1-raymondmaoca@gmail.com>
 <CAAhSdy257TRRvKMTqxaryFTaY-XFcS-k5mS+9N6s=A1S1n6Xvg@mail.gmail.com> <CAMDkj5xFkVzVSgL2Sf7ij8G6Tb+o3GPF=obxG=+khDOLuO5w6w@mail.gmail.com>
In-Reply-To: <CAMDkj5xFkVzVSgL2Sf7ij8G6Tb+o3GPF=obxG=+khDOLuO5w6w@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 20 Jul 2026 20:57:32 +0530
X-Gm-Features: AUfX_mzwmsK4dNRhLwuNvfwKyuIdD9ux8c17wZV_9_dZor9KzF8EbQwfVNdbFE8
Message-ID: <CAAhSdy3Okjm5tfv3LJs3hFtBH=mhcJpc6QVbQ-Qs8wLG0EPzgw@mail.gmail.com>
Subject: Re: [PATCH 00/10] Introduce Virtual IRQ (VIRQ) framework
To: Raymond Mao <raymondmaoca@gmail.com>
Cc: opensbi@lists.infradead.org, scott@riscstar.com, dave.patel@riscstar.com, 
	raymond.mao@riscstar.com, robin.randhawa@sifive.com, 
	samuel.holland@sifive.com, anup.patel@qti.qualcomm.com, 
	anuppate@qti.qualcomm.com, dhaval@rivosinc.com, peter.lin@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_082746_257077_526DC309 
X-CRM114-Status: GOOD (  26.96  )
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

T24gTW9uLCBKdWwgMjAsIDIwMjYgYXQgODo0NeKAr1BNIFJheW1vbmQgTWFvIDxyYXltb25kbWFv
Y2FAZ21haWwuY29tPiB3cm90ZToKPgo+IEhpIEFudXAsCj4KPiBPbiBNb24sIEp1bCAyMCwgMjAy
NiBhdCA0OjQx4oCvQU0gQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4gd3JvdGU6Cj4g
Pgo+ID4gT24gRnJpLCBNYXkgMTUsIDIwMjYgYXQgNDoyOOKAr0FNIFJheW1vbmQgTWFvIDxyYXlt
b25kbWFvY2FAZ21haWwuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gRnJvbTogUmF5bW9uZCBNYW8g
PHJheW1vbmQubWFvQHJpc2NzdGFyLmNvbT4KPiA+ID4KPiA+ID4gVGhpcyBzZXJpZXMgaW50cm9k
dWNlcyBhIFZpcnR1YWwgSVJRIChWSVJRKSBmcmFtZXdvcmsgZm9yIE9wZW5TQkkgdG8KPiA+ID4g
c3VwcG9ydCBkb21haW4tYXdhcmUgd2lyZWQgaW50ZXJydXB0IGNvdXJpZXJpbmcuCj4gPiA+Cj4g
PiA+IFRoZSBtYWluIHVzZSBjYXNlIGlzIHRvIGxldCBPcGVuU0JJIHJlY2VpdmUgYSBob3N0IEhX
SVJRIGluIE0tbW9kZSwKPiA+ID4gbWFwIGl0IGludG8gYSBwZXItY2hhbm5lbCBWSVJRIG51bWJl
ciBzcGFjZSwgcm91dGUgaXQgdG8gYSB0YXJnZXQKPiA+ID4gZG9tYWluLCBub3RpZnkgdGhlIHRh
cmdldCBTLW1vZGUgcGF5bG9hZCwgYW5kIGxldCB0aGF0IHBheWxvYWQKPiA+ID4gcG9wL2NvbXBs
ZXRlIHRoZSBwZW5kaW5nIFZJUlEgdGhyb3VnaCBhbiBTQkkgZWNhbGwgaW50ZXJmYWNlLgo+ID4g
Pgo+ID4gPiBUaGUgaW1wbGVtZW50YXRpb24gaXMgb3JnYW5pemVkIGFzIGZvbGxvd3M6Cj4gPiA+
Cj4gPiA+ICAgLSBhZGQgaXJxY2hpcCBoZWxwZXJzIGZvciBTLW1vZGUgcGVuZGluZyBub3RpZmlj
YXRpb24KPiA+ID4gICAtIGV4dGVuZCBkb21haW4gY29udGV4dCBzd2l0Y2hpbmcgdG8gc3VwcG9y
dCBWSVJRLWRyaXZlbgo+ID4gPiAgICAgY3Jvc3MtZG9tYWluIGNvdXJpZXJpbmcgYW5kIHJldHVy
bi10by1wcmV2aW91cy1kb21haW4gZmxvdwo+ID4gPiAgIC0gYWRkIHRoZSBjb3JlIFZJUlEgbWFw
cGluZywgcm91dGluZywgYW5kIHBlci0oZG9tYWluLGhhcnQpCj4gPiA+ICAgICBwZW5kaW5nIHF1
ZXVlIGZyYW1ld29yawo+ID4gPiAgIC0gYWRkIGEgVklSUSB2ZW5kb3IgZWNhbGwgZXh0ZW5zaW9u
IGZvciBQT1AgYW5kIENPTVBMRVRFCj4gPiA+ICAgLSBwYXJzZSBzeXNpcnEgcm91dGluZyBydWxl
cyBmcm9tIERUIHVuZGVyIC9jaG9zZW4vb3BlbnNiaS1kb21haW5zCj4gPiA+ICAgLSBkZXJpdmUg
QVBMSUMgdGFyZ2V0IGhhcnQgcm91dGluZyBmcm9tIHN5c2lycSBub2Rlcwo+ID4gPiAgIC0gdXBk
YXRlIHRoZSBpcnFjaGlwL0FQTElDIHBhdGggdG8gc3VwcG9ydCBkZWZlcnJlZCBjb21wbGV0aW9u
IGFuZAo+ID4gPiAgICAgcGVyLUhXSVJRIEFQTElDIHRhcmdldHMKPiA+ID4gICAtIGRvY3VtZW50
IHRoZSBEVCBiaW5kaW5nIGFuZCByb3V0aW5nIHJ1bGVzCj4gPiA+Cj4gPiA+IFRoZSBEVCByb3V0
aW5nIG1vZGVsIGlzIGJhc2VkIG9uICJvcGVuc2JpLG1weHktc3lzaXJxIiBub2Rlcy4KPiA+ID4g
RWFjaCBpbnRlcnJ1cHRzLWV4dGVuZGVkIGVudHJ5IGNvbnRyaWJ1dGVzIG9uZSByb3V0ZWQgcGh5
c2ljYWwgc291cmNlLAo+ID4gPiBpdHMgZW50cnkgaW5kZXggYmVjb21lcyB0aGUgVklSUSBudW1i
ZXIgd2l0aGluIHRoZSBzZWxlY3RlZAo+ID4gPiBvcGVuc2JpLG1weHktY2hhbm5lbC1pZCwgYW5k
IG9wZW5zYmksZG9tYWluIHNlbGVjdHMgdGhlIGRlc3RpbmF0aW9uCj4gPiA+IE9wZW5TQkkgZG9t
YWluLgo+ID4gPgo+ID4gPiBUaGlzIHNlcmllcyBkZXBlbmRzIG9uIGEgcHJldmlvdXMgcGF0Y2gg
c2V0Ogo+ID4gPiBbUEFUQ0ggdjIgMS8zXSBsaWI6IHV0aWxzOiBpcnFjaGlwOiBpbXBsZW1lbnQg
QVBMSUMgaHdpcnEgb3BlcmF0aW9uIGhvb2tzCj4gPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L29wZW5zYmkvMjAyNjA1MDQxNzEzNDIuMTY1NTg4Mi0xLXJheW1vbmRtYW9jYUBnbWFpbC5jb20v
I3QKPiA+ID4KPiA+ID4gUmF5bW9uZCBNYW8gKDEwKToKPiA+ID4gICBsaWI6IGlycWNoaXA6IGFk
ZCBTLW1vZGUgbm90aWZpY2F0aW9uIGhlbHBlcnMKPiA+ID4gICBsaWI6IHNiaTogZG9tYWluOiBh
ZGFwdGF0aW9uIGZvciBzdXBwb3J0aW5nIFZJUlEgY291cmllcmluZyBkb21haW4KPiA+ID4gICAg
IGNvbnRleHQgc3dpdGNoCj4gPiA+ICAgbGliOiBzYmk6IEFkZCBWaXJ0dWFsIElSUSAoVklSUSkg
c3Vic3lzdGVtCj4gPiA+ICAgbGliOiBzYmk6IEFkZCBWSVJRIGVjYWxsIGV4dGVuc2lvbgo+ID4g
PiAgIGxpYjogc2JpOiBkb21haW46IGFkZCBkb21haW4gbG9va3VwIGJ5IG5hbWUKPiA+ID4gICBs
aWI6IHV0aWxzOiBmZHQ6IHBhcnNlIHN5c2lycSByb3V0aW5nIGZyb20gRFQKPiA+ID4gICBsaWI6
IHV0aWxzOiBpcnFjaGlwOiBkZXJpdmUgQVBMSUMgdGFyZ2V0cyBmcm9tIHN5c2lycSBub2Rlcwo+
ID4gPiAgIGxpYjogaXJxY2hpcDogc3VwcG9ydCBkZWZlcnJlZCBjb21wbGV0aW9uIGFuZCBwZXIt
SFdJUlEgQVBMSUMgdGFyZ2V0cwo+ID4gPiAgIGxpYjogc2JpOiBkb21haW46IGVuc3VyZSBib290
X2hhcnRpZCBpcyBhc3NpZ25lZAo+ID4gPiAgIGRvY3M6IGRvbWFpbjogZG9jdW1lbnQgc3lzaXJx
IFZJUlEgbWFwcGluZyBhbmQgcm91dGluZyBydWxlcwo+ID4KPiA+IFRoaXMgVklSUSBhYnN0cmFj
dGlvbiBpcyBub3QgbmVlZGVkIHdpdGggdGhlIGltcHJvdmVkIFNCSSBpcnFjaGlwCj4gPiB3aGVy
ZSBlYWNoIGV4dGVybmFsIGludGVycnVwdCAod2lyZWQgLyBNU0kpIGNhbiBiZSB1bmlxdWVseSBp
ZGVudGlmaWVkCj4gPiBieSBhIHR1cGxlIHdoaWNoIFNCSSBpcnFjaGlwIGluc3RhbmNlIGFuZCBo
d2lycSBudW1iZXIgaW4gdGhlIGluc3RhbmNlLgo+ID4KPiA+IEFsc28sIHRoZSBWSVJRIGVjYWxs
IGlzIGFkLWhvYyBhbmQgZG9lcyBub3QgY29ycmVzcG9uZCB0byBhbnkKPiA+IFNCSSBleHRlbnNp
b24uCj4gPgo+ID4gQWxsLWluLWFsbCB0aGUgd2hvbGUgaW50ZXJydXB0IHJvdXRpbmcgZm9yIHN1
cGVydmlzb3IgZG9tYWlucyBtdXN0Cj4gPiBiZSByZS13cml0dGVuIHVzaW5nIFNCSSBNUFhZICsg
UlBNSSBzeXN0ZW0gaXJxIHNlcnZpY2UgZ3JvdXAKPiA+IGFzIHRoZSBpbnRlcmZhY2UgZm9yIHN1
cGVydmlzb3IgZG9tYWlucy4KPiA+Cj4gPiBUaGUgU0JJIE1QWFkgaXMgYWxyZWFkeSBhIHJhdGlm
aWVkIFNCSSBleHRlbnNpb24gYW5kIE9wZW5TQkkKPiA+IGFscmVhZHkgaGFzIGFuIGV4dGVuc2li
bGUgTVBYWSBmcmFtZXdvcmsgd2l0aCBhIG51bWJlciBvZiBNUFhZCj4gPiBkcml2ZXJzIHVuZGVy
IGxpYi91dGlscy9tcHh5LiBUaGUgUlBNSSBzeXN0ZW0gaXJxIGRyYWZ0IHNwZWNpZmNhdGlvbgo+
ID4gd2FzIGFscmVhZHkgc2hhcmVkIGZldyBtb250aHMgYmFjay4KPiA+Cj4KPiBBcyB3ZSBkaXNj
dXNzZWQgaW4gdGhlIFNTV0cgbWVldGluZywgdGhlIHBsYW4gdG8gc3VwcG9ydCB0aGUgU0JJIE1Q
WFkKPiArIFJQTUkgc3lzdGVtIGlycSBzZXJ2aWNlIGdyb3VwIGlzIG9uZ29pbmcuCj4gSXQgd2ls
bCBiZSBtdWNoIGFwcHJlY2lhdGVkIGlmIHlvdSBjYW4gY29uc2lkZXIgdG8gbWVyZ2UgdGhpcyBz
ZXJpZXMKPiB0byBlbmFibGUgdGhlIGludGVycnVwdCByb3V0aW5nIGZpcnN0IGJlZm9yZSBJIHBv
c3QgYSBzZXBhcmF0ZSBzZXJpZXMKPiBmb3IgUlBNSSBvbiB0b3Agb2YgdGhpcy4KPgoKTGlrZSBJ
IGV4cGxhaW5lZCBhYm92ZSwgeW91IGRvbid0IG5lZWQgdGhpcyBzZXJpZXMgZm9yIGltcGxlbWVu
dGluZwpTQkkgTVBYWSArIFJQTUkgc3lzdGVtIGlycSBzZXJ2aWNlIGdyb3VwLgoKUmVnYXJkcywK
QW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
