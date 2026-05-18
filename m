Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808A9CD4F3C
	for <opensbi@archiver.kernel.org>; Mon, 18 May 2026 08:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZrrZsCwYBSooBz4ruBLeeplhaOS5EyAsB1PkYEvemrg=; b=FXi7NkykMtw+Pt
	VQ7RRosgoN5g6eILg4MgaVdax/rKDeSR/t5TH7k0gKqllaz3i4E0HOhquHMl7EBE/w9ncHr8UkdAJ
	JualuGO9kwuZ2EWDwomlstOvUMSYTHG8ioB3W5zyMt/S+RHuevdKe35sq9gU/nHgU/Bcra+kUYXNJ
	TNrUY3UXqaYjfxnp+EE6YrJIgN87pAUg6jW+A4ij1Y1gnNp3t9W5cjjUwEX2wtxjlxbTs2BQ2l3NW
	PtNP4oe3cY7PCZIh//yG9t0jzLrCJOr3iqE/OsNseIRvFhLUt9+kHmF1zBL5Q8eewWYzC8Y9UX9i0
	YRZKTpuIixqIiiKprtsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtIq-0000000EnIO-29Go;
	Mon, 18 May 2026 08:26:20 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtIj-0000000EnFC-3glA
	for opensbi@lists.infradead.org;
	Mon, 18 May 2026 08:26:17 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-69b94acd958so946352eaf.3
        for <opensbi@lists.infradead.org>; Mon, 18 May 2026 01:26:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779092773; cv=none;
        d=google.com; s=arc-20240605;
        b=adDnmDAUzk3y+0aWgj6smAhXQFIFNbdnJW4EiNfkrXIAeerrJXV7kFjmMy0rxwtMvh
         iHWXCdD/7DzMK6v36Ni83Fdhzp+0obxtzkUQDU0ns81XkOAfANPB7SYmVf1dwo1caQIh
         l1N4JFJ5t0beMFWIHW/9Welx061uC/8G8sHAvKxtXqWNTWWrytxZFAOCLh9YEx8qkoEA
         1abC/+eG1z3Yg2i5esH9ws/SG5/CKRFqlwtUoCAwHE36VmiDNHGFXh5iwY0hd0XxjPeP
         lfLca+mICVPfdTs7imxTXhxTMUd1zl7T+xzYbZR8Jo86Y03u3bZd/Py4FD0GoRiwdwRm
         4Bow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hHkPCE0QJS96tqA/IIVLbMpN2tWRJ9syT42CDCr0QIw=;
        fh=PnyCQWksEHrMb3K9gCJByClOWR1eU9GvokWs+OyimUA=;
        b=U7LUVsrhNnbGwrN3eNt6JCKyju6sd5PKZoJNqe22MsMYQO27kLdZNNo+Stha4fFbbE
         fp1quvx6C6/mOWLIhFbu2clru4D/Tqx7VCPjHJPNUl4ULYDJJDMEmdXbCdMeGosOY8fR
         BOdZpWFJ2UlalCh6W1D8FsbbhvPl3y01uQoCywwM9n5dkBP8UfoX7J229ZC77rsUDxCa
         rKAb8xgnhuKYVjprAilQ3yIkV0tUEhuHjMENZiE80hPKVy7j3e3a5GtwqWX7NvnZFcUp
         SVVumj9lhbism2csv45aGt/cMfEmxUYP86aHMlybHnyvy+mSqjbUfxWW510YeHXzNFP8
         qNvA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1779092773; x=1779697573; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hHkPCE0QJS96tqA/IIVLbMpN2tWRJ9syT42CDCr0QIw=;
        b=vgtPMnoRIsv6Kvh3YQdozlvxB3DiyW/xt8/l6AQfSUPsHR77CG8dkk7iurHYGmm/mG
         2UFlfl8UsgUv+vPRy4GNh4AO/HosQaRyZGdsB6Zw82XUxo4UTvcHNlnJEeRkJCvuJQtk
         sIjPfL6BH8xlzWYA1cKJCvZnUHycjD8CLWEI9O87eqhLYCq9mT5xZHCIpwhyI3nZxp5K
         xLvZR9ws1FC7RSV+n94g8nrmZQ1XaQnlMNFkED9+jU4iLi1JDuKp16ujuvM6QYvKPNYF
         P5vJkkBsvj1v2oUq8XdXm+wyXOLzVZz7/n2+ABXRG8ujU7OF4OVJ2dJBO9zq1SWokhy9
         g3BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779092773; x=1779697573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hHkPCE0QJS96tqA/IIVLbMpN2tWRJ9syT42CDCr0QIw=;
        b=hKVryt67lfZ9FUSr8yWrIkHikGyLaj9CpEiBlZm3It3RLlqPp4SkGkCf9snxDhEGKq
         zgmO0PlcKh3GWBRR6bi/kylqAWMGRg/c9ygJ9py99tzdoi4sefUbMjPSFa4y4iW987+b
         I3aSv09uNjcc4FYHYD1loIJ16uJ/vG8XnKBIFGrV6YDIHh+PB1faZHae1b08RDVgvNi+
         eaF62LqcLKiwOzyGwAhhhXwjPr+CVfivZ6UehRIeiLV3eJEtFTSX4ZTIU0nFg3saduFE
         0Ko3PWjdlsVW8eizClJTvPewy++SRLAxhv0kI1Z2JRTkN4bGfc01hiDeWCijPfaLc/ga
         6lxQ==
X-Forwarded-Encrypted: i=1; AFNElJ8SfMaog5vU1YQmNIPkGpOA6Nfc6YWMTQlrB1igHIW7gf9W3nAvtYtFOeFVCpab+Sf4clMT+zoV@lists.infradead.org
X-Gm-Message-State: AOJu0YxDfodjaqPeokz02236xfXXZUR2PbmkukStJsLAERK7LTRvT4jy
	aYRJ+/VC0stB10C5qT0wcHWIt07XkJ+Vb76lZkcn00ByLlnqQQmTl5K13hf3IHedpVOSP0yofzs
	pijcUqPINUzahQgrUNnArH1P003JIiSih/VkZ9PMzvA==
X-Gm-Gg: Acq92OH+kbXbAzWz4b+FhWvyZ2DqwSNLBvlkcaqnPCSn/7XGeLt4LebidJC0mUe6fqY
	Fa5cKxELv4L5gvYPH+JW4Oci3kAV7JLtEH8UfW/xMMVfDPThmOz/fPc79V7HgKvgUwNaM/4E5hf
	E5LAFQaR5lofFEpgS+7Ok9j8WqEEqzeEPiNF+qHmiNO9oCbzjt0pIPlssQGvBG4CIQNDXNPLvLF
	LZoadmQzZj6ZBmbINrydwK3BxJ1BZFHlEoNejWSOVfGOOEYeQohmU6TRcTVN5jMJoxDSiRxlY2T
	KJVPtiXzQ63sJjidwliIVMCA46K89w1v7atNP5C4NrQY5IZWJl0u9qORAmf+8V4IEmgy+FQWlIk
	Y2/tO35PajmpgIZ7utTfVKCDahg==
X-Received: by 2002:a05:6820:6ac4:b0:696:2b09:5988 with SMTP id
 006d021491bc7-69c9458354dmr9220989eaf.40.1779092772948; Mon, 18 May 2026
 01:26:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260518054219.58708-1-dave.patel@riscstar.com> <20260518054219.58708-4-dave.patel@riscstar.com>
In-Reply-To: <20260518054219.58708-4-dave.patel@riscstar.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 18 May 2026 13:55:59 +0530
X-Gm-Features: AVHnY4K2B_4odboRlRpXBVFzyIC5xcq6mj-DEYmc5n4sVN7OyK1VrAZ1RwPA47s
Message-ID: <CAAhSdy11VUWJE_XDTZ_BxTr6Dh3jSri0o5mT2VtVS3FKJh5oUQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] lib: sbi: domain FP/Vector context support for
 context switch
To: dave.patel@riscstar.com
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Anup Patel <anuppate@qti.qualcomm.com>, 
	Scott Bambrough <scott@riscstar.com>, Robin Randhawa <robin.randhawa@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Ray Mao <raymond.mao@riscstar.com>, 
	Dhaval <dhaval@rivosinc.com>, Peter Lin <peter.lin@sifive.com>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_012613_934800_034A5168 
X-CRM114-Status: GOOD (  29.26  )
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

T24gTW9uLCBNYXkgMTgsIDIwMjYgYXQgMTE6MTLigK9BTSA8ZGF2ZS5wYXRlbEByaXNjc3Rhci5j
b20+IHdyb3RlOgo+Cj4gRnJvbTogRGF2ZSBQYXRlbCA8ZGF2ZS5wYXRlbEByaXNjc3Rhci5jb20+
Cj4KPiBUaGlzIHBhdGNoIGFkZHMgcHJvcGVyIHN1cHBvcnQgZm9yIHBlci1kb21haW4gZmxvYXRp
bmctcG9pbnQgKEZQKSBhbmQKPiB2ZWN0b3IgKFYpIGNvbnRleHRzIGluIHRoZSBkb21haW4gY29u
dGV4dCBzd2l0Y2ggbG9naWMuIEVhY2ggZG9tYWluCj4gbm93IG1haW50YWlucyBpdHMgb3duIEZQ
IGFuZCB2ZWN0b3Igc3RhdGUsIHdoaWNoIGlzIHNhdmVkIGFuZCByZXN0b3JlZAo+IGR1cmluZyBk
b21haW4gc3dpdGNoZXMuCj4KPiBDb25kaXRpb25hbGl6ZSBGUCBhbmQgVmVjdG9yIHNhdmUvcmVz
dG9yZSBiYXNlZCBvbiBleHRlbnNpb25zLCB1bmNvbmRpdGlvbmFsCj4gc2F2ZSBhbmQgcmVzdG9y
ZSBvZiBmbG9hdGluZy1wb2ludCAoRlApIGFuZCBWZWN0b3IgcmVnaXN0ZXJzIGZhaWxzIG9uCj4g
Z2VuZXJpYyBwbGF0Zm9ybSBmaXJtd2FyZS4gVGhpcyBmaXJtd2FyZSBtdXN0IHJ1biBvbiBtdWx0
aXBsZSBwbGF0Zm9ybXMKPiB0aGF0IG1heSBsYWNrIHRoZXNlIGV4dGVuc2lvbnMuCj4KPiBBZGRy
ZXNzIHRoaXMgYnkgY29uZGl0aW9uYWxseSBleGVjdXRpbmcgRlAgc2F2ZS9yZXN0b3JlIG9ubHkg
aWYgdGhlIHVuZGVybHlpbmcKPiBoYXJ0IHN1cHBvcnRzIHRoZSBGIG9yIEQgZXh0ZW5zaW9ucy4g
U2ltaWxhcmx5LCBwZXJmb3JtIFZlY3RvciBzYXZlL3Jlc3RvcmUKPiBvbmx5IGlmIHRoZSBoYXJ0
IHN1cHBvcnRzIHRoZSBWZWN0b3IgZXh0ZW5zaW9uLgo+Cj4gQ2hhbmdlcyBpbmNsdWRlOgo+Cj4g
LSBBZGRlZCBgZnBfY3R4YCBhbmQgYHZlY19jdHhgIG1lbWJlcnMgdG8gYHN0cnVjdCBoYXJ0X2Nv
bnRleHRgLgo+IC0gSW50cm9kdWNlZCBkeW5hbWljIHZlY3RvciBzdHJ1Y3QgYWxsb2NhdGlvbiBm
b3IgdmxlbmIgaW4gJ3N0cnVjdCBoYXJ0X2NvbnRleHQnCj4gICB0byBhbGxvY2F0ZSBhbmQgZnJl
ZSBwZXItZG9tYWluIEZQIGFuZCB2ZWN0b3IgY29udGV4dC4KPiAtIE1vZGlmaWVkIGBzYmlfZG9t
YWluX3JlZ2lzdGVyKClgIHRvIGluaXRpYWxpemUgRlAvVmVjdG9yIGNvbnRleHQgcGVyIGRvbWFp
bi4KPiAtIFVwZGF0ZWQgYHN3aXRjaF90b19uZXh0X2RvbWFpbl9jb250ZXh0KClgIHRvIHNhdmUv
cmVzdG9yZSBGUCBhbmQgdmVjdG9yCj4gICBjb250ZXh0cyBzYWZlbHk6Cj4gICAgIC0gRW5zdXJl
cyBGUy9WUyBmaWVsZHMgaW4gYG1zdGF0dXNgIGFyZSBlbmFibGVkIChzZXQgdG8gSW5pdGlhbCkg
b25seSBpZiBPZmYuCj4gLSBBZGRlZCBydW50aW1lIGNoZWNrcyBmb3IgRlAgYW5kIHZlY3RvciBl
eHRlbnNpb25zIHdoZXJlIG5lZWRlZC4KPiAtIEFkZGVkIFNCSV9IQVJUX0VYVF9GLCBTQklfSEFS
VF9FWFRfRCwgU0JJX0hBUlRfRVhUX1YgdG8gZW51bQo+ICAgc2JpX2hhcnRfZXh0ZW5zaW9ucyBh
bmQgdGhlIHNiaV9oYXJ0X2V4dFtdIGFycmF5LiBVc2Ugc2JpX2hhcnRfaGFzX2V4dGVuc2lvbigp
Cj4gICB0byBjaGVjayBmb3IgdGhlc2UgY2FwYWJpbGl0aWVzIGJlZm9yZSBwZXJmb3JtaW5nIHRo
ZSBjb250ZXh0IHN3aXRjaGVzCgpJIGNsZWFybHkgbWVudGlvbmVkIGxhc3QgdGltZSB0aGF0IGNo
YW5nZWxvZyBuZWVkcyB0byBiZSBpbiBjb3Zlci1sZXR0ZXIuCkl0J3MgdmVyeSBmcnVzdHJhdGlu
ZyBhcyByZXZpZXdlciB3aGVuIG9ubHkgc2VsZWN0IGNvbW1lbnRzIGFyZSBiZWluZwphZGRyZXNz
ZWQuCgo+Cj4gVGhpcyBpbXByb3ZlcyBzdXBwb3J0IGZvciBtdWx0aS1kb21haW4gc3lzdGVtcyB3
aXRoIEZQIGFuZCBWZWN0b3IKPiBleHRlbnNpb25zLCBhbmQgcHJldmVudHMgY29ycnVwdGlvbiBv
ZiBGUC9WZWN0b3Igc3RhdGUgZHVyaW5nIGRvbWFpbgo+IHN3aXRjaGVzLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogRGF2ZSBQYXRlbCA8ZGF2ZS5wYXRlbEByaXNjc3Rhci5jb20+Cj4gLS0tCj4gIGluY2x1
ZGUvc2JpL3NiaV9oYXJ0LmggICAgICAgfCAgNiArKysrKysKPiAgbGliL3NiaS9zYmlfZG9tYWlu
X2NvbnRleHQuYyB8IDM2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBs
aWIvc2JpL3NiaV9oYXJ0LmMgICAgICAgICAgIHwgIDMgKysrCj4gIDMgZmlsZXMgY2hhbmdlZCwg
NDUgaW5zZXJ0aW9ucygrKQoKVGhpcyBkb2VzIG5vdCBhcHBseSBvbiBsYXRlc3QgT3BlblNCSSBt
YXN0ZXIgd2hpY2ggbWVhbnMKeW91IGFyZSBub3QgcmViYXNpbmcgeW91ciBzZXJpZXMgdXBvbiBs
YXRlc3QgT3BlblNCSSBiZWZvcmUKc2VuZGluZyBpdC4KCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9zYmkvc2JpX2hhcnQuaCBiL2luY2x1ZGUvc2JpL3NiaV9oYXJ0LmgKPiBpbmRleCBhNzg4YjM0
Yy4uNjhhMDFiOTcgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9zYmkvc2JpX2hhcnQuaAo+ICsrKyBi
L2luY2x1ZGUvc2JpL3NiaV9oYXJ0LmgKPiBAQCAtODcsNiArODcsMTIgQEAgZW51bSBzYmlfaGFy
dF9leHRlbnNpb25zIHsKPiAgICAgICAgIFNCSV9IQVJUX0VYVF9YU0lGSVZFX0NGTFVTSF9EX0wx
LAo+ICAgICAgICAgLyoqIEhhcnQgaGFzIFhzZmNlYXNlIGV4dGVuc2lvbiAqLwo+ICAgICAgICAg
U0JJX0hBUlRfRVhUX1hTSUZJVkVfQ0VBU0UsCj4gKyAgICAgICAvKiogSGFydCBoYXMgViBleHRl
bnNpb24gKi8KPiArICAgICAgIFNCSV9IQVJUX0VYVF9WLAo+ICsgICAgICAgLyoqIEhhcnQgaGFz
IEYgZXh0ZW5zaW9uICovCj4gKyAgICAgICBTQklfSEFSVF9FWFRfRiwKPiArICAgICAgIC8qKiBI
YXJ0IGhhcyBEIGV4dGVuc2lvbiAqLwo+ICsgICAgICAgU0JJX0hBUlRfRVhUX0QsCj4KPiAgICAg
ICAgIC8qKiBNYXhpbXVtIGluZGV4IG9mIEhhcnQgZXh0ZW5zaW9uICovCj4gICAgICAgICBTQklf
SEFSVF9FWFRfTUFYLAo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9kb21haW5fY29udGV4dC5j
IGIvbGliL3NiaS9zYmlfZG9tYWluX2NvbnRleHQuYwo+IGluZGV4IDE1OGY0OTkwLi5lMDYxMDNj
MyAxMDA2NDQKPiAtLS0gYS9saWIvc2JpL3NiaV9kb21haW5fY29udGV4dC5jCj4gKysrIGIvbGli
L3NiaS9zYmlfZG9tYWluX2NvbnRleHQuYwo+IEBAIC0xOCw2ICsxOCw4IEBACj4gICNpbmNsdWRl
IDxzYmkvc2JpX2RvbWFpbl9jb250ZXh0Lmg+Cj4gICNpbmNsdWRlIDxzYmkvc2JpX3BsYXRmb3Jt
Lmg+Cj4gICNpbmNsdWRlIDxzYmkvc2JpX3RyYXAuaD4KPiArI2luY2x1ZGUgPHNiaS9zYmlfdmVj
dG9yLmg+Cj4gKyNpbmNsdWRlIDxzYmkvc2JpX2ZwLmg+Cj4KPiAgLyoqIENvbnRleHQgcmVwcmVz
ZW50YXRpb24gZm9yIGEgaGFydCB3aXRoaW4gYSBkb21haW4gKi8KPiAgc3RydWN0IGhhcnRfY29u
dGV4dCB7Cj4gQEAgLTU1LDYgKzU3LDExIEBAIHN0cnVjdCBoYXJ0X2NvbnRleHQgewo+ICAgICAg
ICAgc3RydWN0IGhhcnRfY29udGV4dCAqcHJldl9jdHg7Cj4gICAgICAgICAvKiogSXMgY29udGV4
dCBpbml0aWFsaXplZCBhbmQgcnVubmFibGUgKi8KPiAgICAgICAgIGJvb2wgaW5pdGlhbGl6ZWQ7
Cj4gKwo+ICsgICAgICAgLyoqIGZsb2F0IGNvbnRleHQgc3RhdGUgKi8KPiArICAgICAgIHN0cnVj
dCBzYmlfZnBfY29udGV4dCBmcF9jdHg7Cj4gKyAgICAgICAvKiogdmVjdG9yIGNvbnRleHQgc3Rh
dGUgKi8KPiArICAgICAgIHN0cnVjdCBzYmlfdmVjdG9yX2NvbnRleHQgKnZlY19jdHg7Cj4gIH07
Cj4KPiAgc3RhdGljIHN0cnVjdCBzYmlfZG9tYWluX2RhdGEgZGNwcml2Owo+IEBAIC0xNDMsNiAr
MTUwLDIyIEBAIHN0YXRpYyBpbnQgc3dpdGNoX3RvX25leHRfZG9tYWluX2NvbnRleHQoc3RydWN0
IGhhcnRfY29udGV4dCAqY3R4LAo+ICAgICAgICAgaWYgKHNiaV9oYXJ0X2hhc19leHRlbnNpb24o
c2NyYXRjaCwgU0JJX0hBUlRfRVhUX1NTUU9TSUQpKQo+ICAgICAgICAgICAgICAgICBjdHgtPnNy
bWNmZyAgICAgPSBjc3Jfc3dhcChDU1JfU1JNQ0ZHLCBkb21fY3R4LT5zcm1jZmcpOwo+Cj4gKyAg
ICAgICAvKiBFYWdlciBjb250ZXh0IHN3aXRjaCBGICovCj4gKyAgICAgICBpZiAoc2JpX2hhcnRf
aGFzX2V4dGVuc2lvbihzYmlfc2NyYXRjaF90aGlzaGFydF9wdHIoKSwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFNCSV9IQVJUX0VYVF9GKSB8fAo+ICsgICAgICAgICAgIHNi
aV9oYXJ0X2hhc19leHRlbnNpb24oc2JpX3NjcmF0Y2hfdGhpc2hhcnRfcHRyKCksCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTQklfSEFSVF9FWFRfRCkpIHsKClRoZSAic2Ny
YXRjaCIgbG9jYWwgdmFyaWFibGUgYWxyZWFkeSBwb2ludHMgdG8gc2JpX3NjcmF0Y2hfdGhpc2hh
cnRfcHRyKCkKCj4gKyAgICAgICAgICAgICAgIHNiaV9mcF9zYXZlKCZjdHgtPmZwX2N0eCk7Cj4g
KyAgICAgICAgICAgICAgIHNiaV9mcF9yZXN0b3JlKCZkb21fY3R4LT5mcF9jdHgpOwo+ICsgICAg
ICAgfQo+ICsKPiArICAgICAgIC8qIEVhZ2VyIGNvbnRleHQgc3dpdGNoIFYgKi8KPiArICAgICAg
IGlmIChzYmlfaGFydF9oYXNfZXh0ZW5zaW9uKHNiaV9zY3JhdGNoX3RoaXNoYXJ0X3B0cigpLAo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU0JJX0hBUlRfRVhUX1YpKSB7CgpT
YW1lIGFzIGFib3ZlIGNvbW1lbnQuCgo+ICsgICAgICAgICAgICAgICBzYmlfdmVjdG9yX3NhdmUo
Y3R4LT52ZWNfY3R4KTsKPiArICAgICAgICAgICAgICAgc2JpX3ZlY3Rvcl9yZXN0b3JlKGRvbV9j
dHgtPnZlY19jdHgpOwo+ICsgICAgICAgfQo+ICsKPiAgICAgICAgIC8qIFNhdmUgY3VycmVudCB0
cmFwIHN0YXRlIGFuZCByZXN0b3JlIHRhcmdldCBkb21haW4ncyB0cmFwIHN0YXRlICovCj4gICAg
ICAgICB0cmFwX2N0eCA9IHNiaV90cmFwX2dldF9jb250ZXh0KHNjcmF0Y2gpOwo+ICAgICAgICAg
c2JpX21lbWNweSgmY3R4LT50cmFwX2N0eCwgdHJhcF9jdHgsIHNpemVvZigqdHJhcF9jdHgpKTsK
PiBAQCAtMTY4LDYgKzE5MSw3IEBAIHN0YXRpYyBpbnQgc3dpdGNoX3RvX25leHRfZG9tYWluX2Nv
bnRleHQoc3RydWN0IGhhcnRfY29udGV4dCAqY3R4LAo+Cj4gIHN0YXRpYyBpbnQgaGFydF9jb250
ZXh0X2luaXQodTMyIGhhcnRpbmRleCkKPiAgewo+ICsgICAgICAgc2l6ZV90IHZlY19zaXplOwo+
ICAgICAgICAgc3RydWN0IGhhcnRfY29udGV4dCAqY3R4Owo+ICAgICAgICAgc3RydWN0IHNiaV9k
b21haW4gKmRvbTsKPgo+IEBAIC0xODAsNiArMjA0LDE4IEBAIHN0YXRpYyBpbnQgaGFydF9jb250
ZXh0X2luaXQodTMyIGhhcnRpbmRleCkKPiAgICAgICAgICAgICAgICAgaWYgKCFjdHgpCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FTk9NRU07Cj4KPiArICAgICAgICAgICAg
ICAgaWYgKHNiaV9oYXJ0X2hhc19leHRlbnNpb24oc2JpX3NjcmF0Y2hfdGhpc2hhcnRfcHRyKCks
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNCSV9IQVJUX0VY
VF9WKSkgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIHZlY19zaXplID0gc2JpX3ZlY3Rvcl9j
b250ZXh0X3NpemUoKTsKPiArCj4gKyAgICAgICAgICAgICAgICAgICAgICAgLyogQWxsb2NhdGUg
dGhlIHZlY3RvciBjb250ZXh0IHBvaW50ZXIgKi8KPiArICAgICAgICAgICAgICAgICAgICAgICBj
dHgtPnZlY19jdHggPSBzYmlfemFsbG9jKHZlY19zaXplKTsKPiArICAgICAgICAgICAgICAgICAg
ICAgICBpZiAoIWN0eC0+dmVjX2N0eCkgewo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc2JpX2ZyZWUoY3R4KTsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVy
biBTQklfRU5PTUVNOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIH0KPiArICAgICAgICAgICAg
ICAgfQo+ICsKPiAgICAgICAgICAgICAgICAgLyogQmluZCBjb250ZXh0IGFuZCBkb21haW4gKi8K
PiAgICAgICAgICAgICAgICAgY3R4LT5kb20gPSBkb207Cj4gICAgICAgICAgICAgICAgIGhhcnRf
Y29udGV4dF9zZXQoZG9tLCBoYXJ0aW5kZXgsIGN0eCk7Cj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkv
c2JpX2hhcnQuYyBiL2xpYi9zYmkvc2JpX2hhcnQuYwo+IGluZGV4IDYwZTk1YmNhLi5iNWUwZWUx
MCAxMDA2NDQKPiAtLS0gYS9saWIvc2JpL3NiaV9oYXJ0LmMKPiArKysgYi9saWIvc2JpL3NiaV9o
YXJ0LmMKPiBAQCAtMzk2LDYgKzM5Niw5IEBAIGNvbnN0IHN0cnVjdCBzYmlfaGFydF9leHRfZGF0
YSBzYmlfaGFydF9leHRbXSA9IHsKPiAgICAgICAgIF9fU0JJX0hBUlRfRVhUX0RBVEEoc3NzdGF0
ZWVuLCBTQklfSEFSVF9FWFRfU1NTVEFURUVOKSwKPiAgICAgICAgIF9fU0JJX0hBUlRfRVhUX0RB
VEEoeHNmY2ZsdXNoZGxvbmUsIFNCSV9IQVJUX0VYVF9YU0lGSVZFX0NGTFVTSF9EX0wxKSwKPiAg
ICAgICAgIF9fU0JJX0hBUlRfRVhUX0RBVEEoeHNmY2Vhc2UsIFNCSV9IQVJUX0VYVF9YU0lGSVZF
X0NFQVNFKSwKPiArICAgICAgIF9fU0JJX0hBUlRfRVhUX0RBVEEodiwgU0JJX0hBUlRfRVhUX1Yp
LAo+ICsgICAgICAgX19TQklfSEFSVF9FWFRfREFUQShmLCBTQklfSEFSVF9FWFRfRiksCj4gKyAg
ICAgICBfX1NCSV9IQVJUX0VYVF9EQVRBKGQsIFNCSV9IQVJUX0VYVF9EKSwKPiAgfTsKPgo+ICBf
U3RhdGljX2Fzc2VydChTQklfSEFSVF9FWFRfTUFYID09IGFycmF5X3NpemUoc2JpX2hhcnRfZXh0
KSwKPiAtLQo+IDIuNDMuMAo+Cj4KPiAtLQo+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gb3BlbnNi
aUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9vcGVuc2JpCgpSZWdhcmRzLApBbnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxp
c3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
