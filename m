Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51547EF06E3
	for <opensbi@archiver.kernel.org>; Sun,  8 Feb 2026 13:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VFKfrchhFQVciugq+mbbOZqVx+lZJ7SmDeLRddvMoAE=; b=z4KzUEpSHGqofz
	XFUPqKzy0c6wnt1F8yMgvlrMwa5OWEzMvyf/9t8DVrHkUsNv6YFzqQ4cBAUxv5nXfXQzPVvpW0372
	WR9f1/yCe968vPu3WONgAG5AmmUw1CwbBTMfrBAB3dSYOSByFoZf/XJYRIVSglrWccip1u7sG7EDM
	9uxAuJYlCSdszzjT6VhfQA/cdXKFYICvZAS3gVKL7sCjOQubI0Gl0Nrk+4Yq2kaXZrO5bS6vOUAon
	FK378SrBHKQDeY32LvRy2X01lRfqpV3JbqEHO5n64Ktg1NP2Mh0pY55AzW10sMGiYYoelKQp3G66f
	vj2laNgdQXZwl2MDzENA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vp4ls-0000000DLgN-3SXJ;
	Sun, 08 Feb 2026 13:24:16 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vp4lo-0000000DLfd-2O0l
	for opensbi@lists.infradead.org;
	Sun, 08 Feb 2026 13:24:14 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-66a2278a37dso1127667eaf.0
        for <opensbi@lists.infradead.org>; Sun, 08 Feb 2026 05:24:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770557050; cv=none;
        d=google.com; s=arc-20240605;
        b=N7MBTpVXhyebD+d+Z65/NCFAdZXZHTNlM4C7r1DDj3aj7ojXqYQ8sirIi3Re15ODV6
         JG8ihR7xSEk39saz5BU5ok0Fm9hsIV4wZF3DgA6k5gsc3ng/pkACh1TqmCCNlTE1o2it
         l+DiK1ksN5PuUQlQ8x9bpUechIwwXBbF4Dtc6yWi3aJ1YEkTY0Wbpu2dfrF4evILvHsU
         Cp88sTqdAVdjesOT9hea81/6ME0Q2XelXXVUgQ1hILs0mWaTAFcvdNSYGcvbHb+P+ItW
         W/ywk3jMwXRN7q/gS2C/CZiElcwWMjCfUrsMHsIhTb3ce4/YuPTkxcOGg2oPZpIKP9uF
         FO0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lF9s2nQkoKRnV51OmtgwwbGsoKkc3XO/J1113nxJ+74=;
        fh=Sch92qKkux4AeucvC2KlvargZk/jQktzKzrRc6CJlNk=;
        b=aK+oGa1UvshSfhPfsYFlRxM1/bq/OeEqixMeVaft0o8IQ97DqXpH4/Yhbj8WGDkWXv
         Rei+2rDV5GE/zKZ18+3632KcdXBIXIdd51fkK8NObDMxk+Qo11JDLz9TRFShv7ah/Mt/
         PwE4JY899UwXke9JRGLJg4GbVrX7pr4lLEQ11Z7djiQ70aMe7iJBjtAxFzBid/XrvRbb
         RMS1sXqj/UprtrLhqAKKLoGEoebmBgHgAayJf4ieLOdN5Y+uLWXdvyKDoe4hffpyGcZj
         JNbvwPdI4VQuOYM485Xryf6Dvq0cAfL5sMAFZ8cFZ9EKaoSztcQDUgxRLu7U1NSWk78k
         KHGg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1770557050; x=1771161850; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lF9s2nQkoKRnV51OmtgwwbGsoKkc3XO/J1113nxJ+74=;
        b=LlI3BgqBeEDgk7YYDXHOPXMN2Sy9fF+3p05opUTqw+jTFJsZYRRxtGO1lSaFc3bSrQ
         o/LuipaqTKbcpHQSyJ8OFcJVKkA+4xQLUyLk4OAmT8tpk6bubIN++Acbvc/OPifJI/UI
         cNMtM3CW1zLugwplvyHnMu4s2nClwTLvNmvVKxnS+gFEg7BNXXAnOlmVQhtvsuleWERM
         AuYJwc4XhkmgZJrB3L4GGQ3AIbNZfxczUtpcmkQ9PcNKT823FJIdORb+8sYlpGPFIcw8
         NjBjjKwUlniQ3xOQP6VbGxhk0aXeeZClOO8vHE4QGyQZc8jLvObkk0AjMIBzI2djEwcS
         sJfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770557050; x=1771161850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lF9s2nQkoKRnV51OmtgwwbGsoKkc3XO/J1113nxJ+74=;
        b=h21r3peLPqfA5Io9zyhojR/aM26Od0bMjeiDorFDvjed2PizG2mTbG1Wfof9jBuWZS
         BKkC99BcYizJQil5QISrRukfLwq6w99j3YoMiFCjAl5z3oOPLC8Y0UpgtrnT73qf0byQ
         0NQPdtYRA/FLmXnUc8L3Pzyru1kak6C3bZR2f0/nRpGNJsyzKsw6p5f4bU4K2WmqiQv/
         zoDCU6SpI5nBw3M1NXXeKDwEjxdFREuy4ucgpBPbEVNv4XntQgYRYouUTbRsRuNkyCZL
         zTVTy2UxC+jdmul3Dwcen/Ov+A0gCryFvzWEfOjPFkySvvxt24PSMiq+2kOPYS/JEVal
         AI7Q==
X-Gm-Message-State: AOJu0Yy/h1FPAC1Bh1nSt0ur09qJc9qvPkPEWb5ZudeK2lBbwXQiAlhR
	OPRiTDZgefuR4vq2ODME5hWnMWE6Q80bF19TeT+PXhRf2HSaKJNOVS7du2YvL0Fj/9BTTePH5hE
	NwWCQexG6LGdWgz9sI3uS+48M/Gdpi6jGdnOx7wtKIQ==
X-Gm-Gg: AZuq6aIcPYZq5i5DJW6jqyuZFdsACnqrYIdyAfn0OdSsNMcv8FUYt/4tuue8p9XdJnx
	fCstk/CiPU9kyUjVVjgZBTO+mG0LFyroz65YRv+6rvWaQEhDHdIXy++7RzphWUS+MCA5YTIz34S
	kQ/06LfkNo15CZvcZgfD6Pk9kWu+bhErDxD8QHwz9YWRgGKwnv7geIsmRj+IdF5DULFempM9ZlR
	JsuQMoGNDUjVl4RJH7tgEkc2fAQuosvTzHc3zn40jsBs6DGL1QEX7j3FiTCKY21yOOYyvvv2jA7
	/ZB7ErnUTJs5ZPuPkXvhtpCkVBL5ivpPY3C5Xwx3XnJioG6wwU2+JUut1qo=
X-Received: by 2002:a05:6820:210b:b0:662:c7ca:6f72 with SMTP id
 006d021491bc7-66d0cc369d8mr4496125eaf.70.1770557050323; Sun, 08 Feb 2026
 05:24:10 -0800 (PST)
MIME-Version: 1.0
References: <20260202150207.1331811-1-raymondmaoca@gmail.com>
 <CAAhSdy1VQp5RtgR+uK6Wv6+RTw0Ja3-Oa-YnR17--0jmerjOcQ@mail.gmail.com> <CAMDkj5zgcR1Jyspp9qFme7cmS73tcxScY9CpunnPiNUHG9To1g@mail.gmail.com>
In-Reply-To: <CAMDkj5zgcR1Jyspp9qFme7cmS73tcxScY9CpunnPiNUHG9To1g@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 8 Feb 2026 18:53:57 +0530
X-Gm-Features: AZwV_QjEKuSuQbtlpAz0cnwsZQDHLrYu7ylvF8XzArcm4r_XomehDTXI4V2guio
Message-ID: <CAAhSdy3QGDY1k+M6O2aBz4=KvoTmvUmWRUXAkK--irMyZjzeoA@mail.gmail.com>
Subject: Re: [RFC v2 PATCH 0/2] Introduce irqchip and VIRQ layer prototypes
To: Raymond Mao <raymondmaoca@gmail.com>
Cc: opensbi@lists.infradead.org, scott@riscstar.com, dave.patel@riscstar.com, 
	raymond.mao@riscstar.com, robin.randhawa@sifive.com, 
	samuel.holland@sifive.com, anup.patel@qti.qualcomm.com, 
	anuppate@qti.qualcomm.com, dhaval@rivosinc.com, peter.lin@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_052412_924447_5FEB241A 
X-CRM114-Status: GOOD (  27.14  )
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

T24gU2F0LCBGZWIgNywgMjAyNiBhdCA5OjQx4oCvUE0gUmF5bW9uZCBNYW8gPHJheW1vbmRtYW9j
YUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGkgQW51cCwKPgo+IE9uIFNhdCwgRmViIDcsIDIwMjYg
YXQgNTowOOKAr0FNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+IHdyb3RlOgo+ID4K
PiA+IE9uIE1vbiwgRmViIDIsIDIwMjYgYXQgODozMuKAr1BNIFJheW1vbmQgTWFvIDxyYXltb25k
bWFvY2FAZ21haWwuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gRnJvbTogUmF5bW9uZCBNYW8gPHJh
eW1vbmQubWFvQHJpc2NzdGFyLmNvbT4KPiA+ID4KPiA+ID4gVGhpcyBSRkMgaW50cm9kdWNlcyBp
cnFjaGlwIGFic3RyYWN0aW9uIGFuZCBWSVJRIGxheWVycyBmb3IgQVBMSUMKPiA+ID4gd2lyZWQg
aW50ZXJydXB0IHN1cHBvcnQgaW4gT3BlblNCSS4KPiA+ID4KPiA+ID4gSW4gdGhlIGN1cnJlbnQg
T3BlblNCSSBpbXBsZW1lbnRhdGlvbiwgQVBMSUMgc3VwcG9ydCBwcmltYXJpbHkgZm9jdXNlcwo+
ID4gPiBvbiBpbml0aWFsaXphdGlvbiBhbmQgZGVsZWdhdGlvbiwgd2hpbGUgZXh0ZXJuYWwgaW50
ZXJydXB0IGhhbmRsaW5nCj4gPiA+IGZvciB3aXJlZCBpbnRlcnJ1cHRzIHJlbWFpbnMgbGFyZ2Vs
eSBzdHViYmVkLiBBcyBhIHJlc3VsdDoKPiA+ID4gLSBUaGVyZSBpcyBubyBnZW5lcmljIG1lY2hh
bmlzbSBmb3IgT3BlblNCSSBkcml2ZXJzIG9yIHBsYXRmb3JtcyB0bwo+ID4gPiAgIHJlZ2lzdGVy
IGhhbmRsZXJzIGZvciB3aXJlZCBpbnRlcnJ1cHQgbGluZXMuCj4gPiA+IC0gSW50ZXJydXB0IGRp
c3BhdGNoIHJlbWFpbnMgdGlnaHRseSBjb3VwbGVkIHRvIHNwZWNpZmljIGlycWNoaXAKPiA+ID4g
ICBpbXBsZW1lbnRhdGlvbnMuCj4gPiA+Cj4gPiA+IFRoZSBnb2FsIGlzIHRvIGludHJvZHVjZSBh
IHNtYWxsLCBleHRlbnNpYmxlIGFic3RyYWN0aW9uIGZvciBpcnFjaGlwCj4gPiA+IHRvIGhpZGUg
dGhlIEhXIGRldGFpbHMgYW5kIHByb3ZpZGUgYWJzdHJhY3Qgb3BlcmF0aW9ucyBsaWtlIGludGVy
cnVwdAo+ID4gPiBwcm92aWRlciByZWdpc3RyYXRpb24sIGNsYWltL2NvbXBsZXRlL21hc2svdW5t
YXNrIG9wZXJhdGlvbnMuCj4gPgo+ID4gV2UgZG9uJ3QgbmVlZCBjbGFpbSgpIGFuZCBjb21wbGV0
ZSgpIGNhbGxiYWNrcyBpbnN0ZWFkIHNpbmdsZSBlb2koKQo+ID4gY2FsbGJhY2sgaXMgc3VmZmlj
aWVudCBiZWNhdXNlIHRoZSBBUExJQyBkcml2ZXIgd2lsbCBoYXZlIHRvIGFueXdheQo+ID4gcmVh
ZCB0aGUgQ0xBSU0gcmVnaXN0ZXIgdG8gZ2V0IHRoZSBoYXJkd2FyZSBpcnEgbnVtYmVyLgo+ID4K
Pgo+IFRoZSBhYnN0cmFjdGlvbiBpcyBub3Qgb25seSBmb3IgQVBMSUMgYW5kIGlzIGZsZXhpYmxl
IGZvciBvdGhlcgo+IGludGVycnVwdCBjb250cm9sbGVycywgdGhhdCBpcyB0aGUgcmVhc29uIHdl
IGhhdmUgY2xhaW0vY29tcGxldGUgYXMKPiBnZW5lcmFsIGludGVyZmFjZXMuCgpUaGUgY2xhaW0v
Y29tcGxldGUgdGVybWlub2xvZ3kgaXMgdmVyeSBzcGVjaWZpYyB0byBQTElDIGV2ZW4gdGhvdWdo
CndlIGNhbiByZXRyb2ZpdCBpdCBmb3IgQVBMSUMgYW5kIElNU0lDLiBJbnN0ZWFkIGEgc2ltcGxl
IGVvaSgpIGNhbGxiYWNrCihqdXN0IGxpa2Uga2VybmVsKSBpcyBzdWZmaWNpZW50LgoKPgo+ID4g
Pgo+ID4gPiBWSVJRIChWaXJ0dWFsIElSUSkgbGF5ZXIgaXMgb24gdG9wIG9mIElOVEMsIHByb3Zp
ZGluZyBJUlEgc3RhdGUKPiA+ID4gbWFuYWdlbWVudCB2aWEgcGVyLShkb21haW4saGFydCkgSVJR
IHBlbmRpbmcgcXVldWUsIHdpdGggY291cmllcgo+ID4gPiBkaXNwYXRjaGluZyBhbmQgaW50ZXJm
YWNlIHRvIGVucXVldWUvcG9wL2NvbXBsZXRlIGFuIElSUSBhbmQgbWFwIGh3aXJxCj4gPiA+IHRv
IHZpcnR1YWwgSVJRIG51bWJlciB0byBhdm9pZCBleHBvc3VyZSBvZiBod2lycS4KPiA+Cj4gPiBU
aGlua2luZyBhYm91dCB0aGlzIG1vcmUsIGEgc2VwYXJhdGUgVklSUSBsYXllciB3aWxsIGNvbnN1
bWUKPiA+IHF1aXRlIGEgYml0IG9mIG1lbW9yeSBmb3IgbWFuYWdpbmcgdGhlIHZpcnR1YWwgSVJR
IHNwYWNlLgo+ID4KPiA+IEluc3RlYWQgb2YgYSBWSVJRIGxheWVyLCBlYWNoIGlycWNoaXAgaGF2
aW5nIGl0cyBvd24gSFdJUlEgc3BhY2UKPiA+IGlzIG11Y2ggbW9yZSBmbGV4aWJsZSBhbmQgc2Nh
bGFibGUuIEkgc3BlbnQgcGFzdCAyIGRheXMgdHJ5aW5nIHRvCj4gPiBjb21lLXVwIHdpdGggdGhp
cyBhYnN0cmFjdGlvbiB3aGljaCBJIHdpbGwgcG9zdCBpbiBhIGZldyBtaW51dGVzLgo+ID4KPiA+
IEkgaG9wZSB0aGlzIHdpbGwgc2F2ZSB0aW1lIGluIHJldmlld3MuCj4gPgo+Cj4gRG8geW91IHBs
YW4gdG8gaGF2ZSB0aGUgcXVldWUgbWFuYWdlbWVudCBpbiBpcnFjaGlwPwoKVGhlIGludGVycnVw
dCBwZW5kaW5nIHF1ZXVlIG1hbmFnZW1lbnQgZm9yIGRvbWFpbnMgbXVzdCBub3QKYmUgcGFydCBv
ZiB0aGUgc2JpX2lycWNoaXAgZnJhbWV3b3JrLiBUaGUgc2JpX2lycWNoaXAgb25seSBmb2N1c2Vz
Cm9uIG1hbmFnaW5nIGhvc3QgaW50ZXJydXB0cyBhbmQgcHJvdmlkaW5nIGEgd2VsbCBkZWZpbmVk
IEFQSSBmb3IKaG9zdCBpcnFjaGlwIGRyaXZlcnMuIFRoZSBzZXJpZXMgd2hpY2ggSSBwb3N0ZWQg
ZG9lcyBleGFjdGx5IHRoYXQuCgo+IE15IG9yaWdpbmFsIGlkZWEgaXMgdG8ga2VlcCBpcnFjaGlw
IGFzIGEgSEFMIGFuZCBhcyBtaW5pbWFsIGFzIGl0Cj4gY291bGQgYmUsIGFuZCBwdXQgb3RoZXIg
aGlnaGVyIGxldmVsIGxvZ2ljcyAoZS5nLiBwZXItKGRvbWFpbixoYXJ0KQo+IElSUSBwZW5kaW5n
IHF1ZXVlIG1hbmFnZW1lbnQpIGFzIGEgaGlnaGVyIGxheWVyIG9uIHRvcCBvZiBpcnFjaGlwLgo+
IE9uY2UgeW91IHNlbmQgeW91ciBwcm9wb3NhbCBJIGNhbiBjaGVjayBob3cgdG8gY29tYmluZSB0
aGUgaWRlYXMuCgpBdCBhIGhpZ2gtbGV2ZWwsIHdlIGhhdmUgYXJlIHRocmVlIHBhcnRzOgoKMSkg
c2JpX2lycWNoaXAgZnJhbWV3b3JrIGZvciBtYW5hZ2luZyBob3N0IGludGVycnVwdHMKMikgSG9z
dCBpcnFjaGlwIGRyaXZlcnMgKHN1Y2ggYXMgQVBMSUMsIElNU0lDLCBQTElDLCBldGMpCiAgICB3
aGljaCB1c2UgdGhlIHNiaV9pcnFjaGlwIGZyYW1ld29yayBBUElzCjMpIFBlci1kb21haW4gcGFy
YXZpcnQgb3IgdHJhcC1uLWVtdWxhdGVkIGlycWNoaXAgd2hpY2ggaXMKICAgIGluc3RhbnRpYXRl
ZCBiYXNlZCBvbiBkb21haW4gY29uZmlndXJhdGlvbiBpbiB0aGUgRGV2aWNlVHJlZQoKVGhlIHBl
ci1kb21haW4gcGFyYXZpcnQgb3IgdHJhcC1uLWVtdWxhdGVkIGlycWNoaXAgKCMzIGFib3ZlKSB3
aWxsCmJlIHJlc3BvbnNpYmxlIGZvciByb3V0aW5nIGhvc3QgaW50ZXJydXB0cyB0byB0aGUgZG9t
YWluIGl0IGlzIGFzc29jaWF0ZWQKd2l0aC4gVGhlIHBlci1kb21haW4gcGFyYXZpcnQgb3IgdHJh
cC1uLWVtdWxhdGVkIGlycWNoaXAgd2lsbCByZWdpc3RlcgpoYW5kbGVycyBmb3IgaG9zdCBpbnRl
cnJ1cHRzIGFuZCByb3V0ZSB0aGVtIGFzIGRvbWFpbiBpbnRlcnJ1cHRzIHRvCnRoZSBkb21haW4g
YW5kIGFsc28gbWFpbnRhaW4gZGF0YSBzdHJ1Y3R1cmVzIHRvIHRyYWNrIHBlbmRpbmcgaW50ZXJy
dXB0cy4KClJlZ2FyZHMsCkFudXAKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9vcGVuc2JpCg==
