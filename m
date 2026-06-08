Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E6E2CD8C9D
	for <opensbi@archiver.kernel.org>; Mon,  8 Jun 2026 12:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=swqIerxSq9jrFJ6HGfIyq+weeWtHjkW3zOJZBXY8BkQ=; b=3l9n6dHsw7d7uB
	YhkQV+vwC0xCZsHz9Z+9Cw2FIR6AK0Y0QQunaAXPUwLCcbc842rQKEcWUVi2Wri3y/Qfqw5Oi2sZB
	pDOH+7y40dCseilpWahMe7bb7p55Je9DNxHBN6FmOyFWValujL8oGL/N4x9uL+NNRriLuwbikYcZ7
	YmcTv0c2L2sjQy4BF0EIuSJGG4sIffZtf4gMiZPqpuygnohIGqbyzePiG8so5KTyFnFO1Pgt6K4je
	rgDJnGbQzsXyml4s9AbICyb1f6GkwehDD5Ix3EJ14jxFSElduoXkHTOLK8P4Fo24oSK+yAS9JCPZ4
	0hpF9gs4fD1emPvGYSlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZ6K-00000003VrI-1VgB;
	Mon, 08 Jun 2026 12:29:08 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZ6H-00000003Vqb-1qSZ
	for opensbi@lists.infradead.org;
	Mon, 08 Jun 2026 12:29:07 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5aa7a7ad475so4242476e87.1
        for <opensbi@lists.infradead.org>; Mon, 08 Jun 2026 05:29:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780921742; cv=none;
        d=google.com; s=arc-20240605;
        b=V72TJ6sqnOgs8Tvl7sQdzLx3or3M4L1uMrEQ4Lsk+aJVhNMz91dEgDAviD9yJWiWvO
         iWdttsT0ysJ+zIsXm0gX6Tc6LkPWJPMsSi8ZX4+o/Tae438PWgimEeZau2tY8bKP2KoV
         RGP3cPvCJHUAspHyzFSmN1i8V/e0fWfbcQgOsEy2MkWAF5S7yrn2rCOnmMUBjN/4wHRg
         aL09COT0SiK2SC3LcfU1GdgFfSXbJ0eOZ/JwnzoiifW5uiFfqpkRF00NfyFQyYaCfYVI
         cN22WzwlYD9fRzdn9pTee72vnutykA1RWqRLk+OCWxlxkVP1D8t9Msv/nFzFMYlS3Kgx
         mPUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5u25ahaMc+FWLM56JOrteSJPjd9vqI2G+6H1mHXhAE0=;
        fh=KFL2ZnSEuyOnR/Qh1iesqX1KcdxrnTrRWFET+qVGlVQ=;
        b=VrPf5LcH7Siy3gC1ZSQPnfrKXSrhnNkN/DQIpVpITOwKdYgoJqUo+tsgSkZxFnw2tR
         dtz1tUaR6XAmwWuLB/iuBQYn1t/qO29WjhTHwyNaSI8Hvcen3XaqvHejxrWA9wscmrSI
         jB/pNkPh5dVFCUNfDlRk1oukICuRTeTZ2pvVD7OeYFcpq5REdSxYdTMQjjOYAyf+k8ih
         FWOtehWn08j1kB4M2zeHA3KKQW5xU0vmxmvzmMlw+gbx0MosPQfsIwPsfzpGsKDZeoy5
         4oAk/tk1OOjmIhUsgn64d3MhAixcz1QoCkSDJ6bXnPgWLl/TVmCqNwB7LJeQURBjX7SR
         110A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1780921742; x=1781526542; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5u25ahaMc+FWLM56JOrteSJPjd9vqI2G+6H1mHXhAE0=;
        b=ov+6sh/RVcNSpAEzTMlNltu902Lvyb2nU49t0dvfURx4cBD1bNEQYc7f5yIzWlgy31
         6+ZshN9/B3tkVCRR26vjPK/kgACdcEuJq8Lq1IDRPjQp/d39KjCTBjTW+d8sBcFuSF55
         jGLWqpNvLwvdo47C9VuX8rwPOIA9jZhio5Y+I7eUlBzaoH/iA9aAUwdiAuyN9sNfwDUH
         KS/hohv3WQE/8l9tkeSBx1jhASoWBX2rAm//up2W0qUQRh7QPfvK6YP0jP3McU4rssi1
         jSZQfsKToyR1F3ghPIcA7TxNUVDU9BfCSkOQAvOoPyQ9XixR+wr9ff8AbWym0/xg62HF
         nqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780921742; x=1781526542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5u25ahaMc+FWLM56JOrteSJPjd9vqI2G+6H1mHXhAE0=;
        b=pRMAJbTh8zXkR9qIv+cfivbv9iOsVbiuQWb2op3Q+5/tq1ygzQNnu8oy/LUHg92wIC
         S6UqPi6jKfjZqk8KQxB7kESJh1Ydw+pXWGmnEFl250nVYt2DWvwsYPxPVA6kRcOIE1Ka
         aOwo5HyOF2vOjmnwITEw1u5nlv4jbOR195E7FSruJy0OOk3QIK4RoTdK7JRzmzNNcPk8
         t1/bBJsXFYNXrczuPgDNar/BRQybe5yos97MLLJaQLpnhQ5eMXqrrA5DUcqXTFA3sl8L
         dwacujFPbOuJcdH2Eos9TY2cWtrpCxd6se72wJ4+YAqkoKFSgc2okppThBovI/gYnWmb
         7oOw==
X-Gm-Message-State: AOJu0YylOjnKxrYSXudzAHBCwwToogXX3qKB13QZvHXgO+3MJ6QULa1o
	UqLVlRFSLYS5HBkXVLW/wFkjS7vXYtSBVxh04DnXEEIqYmouNz2m/B7HGvNbODkB4LfhBD/XwGM
	bypWCuT97DYrft4paAyMZ9dTbKOc+bWIhrj2j/uMtVYGFbDZ4g9oq
X-Gm-Gg: Acq92OEjOMyubrtCNRP/57lcWpy/HaLwiDzIYzLYKG1ovfXCc3b4L/YlxtTt8LuUV/4
	fzgcraXYr16NfKPiXSxSFwAMq7pRacpBjTJemZuV03lHsRVeMKMHZFwr+ZW4Ewv3k69MUjOJbaR
	I1HyH2iVSXphJMD/YMNRyH/XYgyA2MqOlcXOMyDcVvKgUDIqkrFa2Y2S3sg7siRmmIm2jO+448E
	ghq0neA0zOdjW+wSGZHuH8AMeYc3oqPyjJl9sV7BVA0VSuq3bsYvgYTTaM6wKuI6WuQ3qIqKvY8
	Gy90TjCcSDjbkmkzm83+Xs1X1kpGtvix8ff8l/Ev7hgr8O8bRS4y
X-Received: by 2002:ac2:4e10:0:b0:5aa:6c89:72d8 with SMTP id
 2adb3069b0e04-5aa87b7ee90mr4164210e87.19.1780921742532; Mon, 08 Jun 2026
 05:29:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260409145716.2611852-1-david.garcia@aheadcomputing.com> <20260409145716.2611852-2-david.garcia@aheadcomputing.com>
In-Reply-To: <20260409145716.2611852-2-david.garcia@aheadcomputing.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 8 Jun 2026 17:58:50 +0530
X-Gm-Features: AVVi8CevFtSWaK2vz8jcn4EWtZciTvblAlNvBwz8VtOtJ8mO8JhLPuDTQiKSyuo
Message-ID: <CAK9=C2X_75QEt=krfEm0aan4Ffg2bj38MpAAgQ8ix+hjGLJixA@mail.gmail.com>
Subject: Re: [PATCH 1/2] lib: sbi_mpxy: Enable MPXY channel MSI availability determination
To: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_052905_511381_08CDC3E6 
X-CRM114-Status: GOOD (  21.12  )
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

T24gVGh1LCBBcHIgOSwgMjAyNiBhdCA4OjI34oCvUE0gRGF2aWQgRS4gR2FyY2lhIFBvcnJhcwo8
ZGF2aWQuZ2FyY2lhQGFoZWFkY29tcHV0aW5nLmNvbT4gd3JvdGU6Cj4KPiBVc2UgaW1zaWNfZ2V0
X2RhdGEoKSB0byBkZXRlcm1pbmUgTVNJIGF2YWlsYWJpbGl0eSBmb3IgZWFjaCBNUFhZCj4gY2hh
bm5lbCBiYXNlZCBvbiBJTVNJQyBwcmVzZW5jZSBwZXIgaGFydCwgaW5zdGVhZCBvZiB1bmNvbmRp
dGlvbmFsbHkKPiBkaXNhYmxpbmcgaXQuCj4KPiBBZGQgYSBzdGF0aWMgaW5saW5lIHN0dWIgZm9y
IGltc2ljX2dldF9kYXRhKCkgd2hlbiBDT05GSUdfSVJRQ0hJUF9JTVNJQwo+IGlzIG5vdCBlbmFi
bGVkLgo+Cj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgRS4gR2FyY2lhIFBvcnJhcyA8ZGF2aWQuZ2Fy
Y2lhQGFoZWFkY29tcHV0aW5nLmNvbT4KPiAtLS0KPiAgaW5jbHVkZS9zYmlfdXRpbHMvaXJxY2hp
cC9pbXNpYy5oIHwgMiArKwo+ICBsaWIvc2JpL3NiaV9tcHh5LmMgICAgICAgICAgICAgICAgfCA4
ICsrKystLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpX3V0aWxzL2lycWNoaXAvaW1zaWMuaCBi
L2luY2x1ZGUvc2JpX3V0aWxzL2lycWNoaXAvaW1zaWMuaAo+IGluZGV4IDg4ZGQzY2ZiLi42OGYz
YzRhZCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3NiaV91dGlscy9pcnFjaGlwL2ltc2ljLmgKPiAr
KysgYi9pbmNsdWRlL3NiaV91dGlscy9pcnFjaGlwL2ltc2ljLmgKPiBAQCAtNTQsNiArNTQsOCBA
QCBzdGF0aWMgaW5saW5lIHZvaWQgaW1zaWNfbG9jYWxfaXJxY2hpcF9pbml0KHZvaWQpIHsgfQo+
Cj4gIHN0YXRpYyBpbmxpbmUgaW50IGltc2ljX2RhdGFfY2hlY2soc3RydWN0IGltc2ljX2RhdGEg
Kmltc2ljKSB7IHJldHVybiAwOyB9Cj4KPiArc3RhdGljIGlubGluZSBzdHJ1Y3QgaW1zaWNfZGF0
YSAqaW1zaWNfZ2V0X2RhdGEodTMyIGhhcnRpbmRleCkgeyByZXR1cm4gTlVMTDsgfQo+ICsKPiAg
I2VuZGlmCj4KPiAgI2VuZGlmCj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX21weHkuYyBiL2xp
Yi9zYmkvc2JpX21weHkuYwo+IGluZGV4IGE4M2NmMTZjLi44ZmY1MmJiNiAxMDA2NDQKPiAtLS0g
YS9saWIvc2JpL3NiaV9tcHh5LmMKPiArKysgYi9saWIvc2JpL3NiaV9tcHh5LmMKPiBAQCAtMjAs
NiArMjAsNyBAQAo+ICAjaW5jbHVkZSA8c2JpL3NiaV9iaXRvcHMuaD4KPiAgI2luY2x1ZGUgPHNi
aS9zYmlfY29uc29sZS5oPgo+ICAjaW5jbHVkZSA8c2JpL3NiaV9ieXRlb3JkZXIuaD4KPiArI2lu
Y2x1ZGUgPHNiaV91dGlscy9pcnFjaGlwL2ltc2ljLmg+Cj4KPiAgLyoqIFNoYXJlZCBtZW1vcnkg
c2l6ZSBhY3Jvc3MgYWxsIGhhcnRzICovCj4gIHN0YXRpYyB1bnNpZ25lZCBsb25nIG1weHlfc2ht
ZW1fc2l6ZSA9IFBBR0VfU0laRTsKPiBAQCAtMjU1LDExICsyNTYsMTAgQEAgc3RhdGljIGludCBk
b21haW5fbXB4eV9zdGF0ZV9kYXRhX3NldHVwKHN0cnVjdCBzYmlfZG9tYWluICpkb20sCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FTk9NRU07Cj4KPiAgICAgICAgICAgICAg
ICAgLyoKPiAtICAgICAgICAgICAgICAgICogVE9ETzogUHJvcGVyIHN1cHBvcnQgZm9yIGNoZWNr
aW5nIG1zaSBzdXBwb3J0IGZyb20KPiAtICAgICAgICAgICAgICAgICogcGxhdGZvcm0uIEN1cnJl
bnRseSBkaXNhYmxlIG1zaSBhbmQgc3NlIGFuZCB1c2UKPiAtICAgICAgICAgICAgICAgICogcG9s
bGluZwo+ICsgICAgICAgICAgICAgICAgKiBUT0RPOiBQcm9wZXIgc3VwcG9ydCBmb3IgY2hlY2tp
bmcgc3NlIHN1cHBvcnQgZnJvbQo+ICsgICAgICAgICAgICAgICAgKiBwbGF0Zm9ybS4gQ3VycmVu
dGx5IGRpc2FibGUgc3NlIGFuZCB1c2UgcG9sbGluZwo+ICAgICAgICAgICAgICAgICAgKi8KPiAt
ICAgICAgICAgICAgICAgbXMtPm1zaV9hdmFpbCA9IGZhbHNlOwo+ICsgICAgICAgICAgICAgICBt
cy0+bXNpX2F2YWlsID0gISFpbXNpY19nZXRfZGF0YShpKTsKCkluc3RlYWQgb2YgZGlyZWN0bHkg
Y2FsbGluZyBpcnFjaGlwIGRyaXZlciBmdW5jdGlvbiBmcm9tIHNiaV9tcHh5IGZyYW1ld29yawpp
dCBpcyBiZXR0ZXIgdG8gY2hlY2sgcHJlc2VuY2Ugb2YgTVNJIGNvbnRyb2xsZXIgdGhyb3VnaCB0
aGUgc2JpX2lycWNoaXAKZnJhbWV3b3JrLgoKSSBhbSB0aGlua2luZyBvZiBleHRlbmRpbmcgInN0
cnVjdCBzYmlfaXJxY2hpcF9kZXZpY2UiIHRvIGFsbG93IGlycWNoaXAKZHJpdmVycyBhZHZlcnRp
c2UgY2FwYWJpbGl0aWVzIG9mIHRoZSBpbnRlcnJ1cHQgY29udHJvbGxlciAoc3VjaCBhcyB3aXJl
ZAppcnFzLCBNU0lzLCBldGMpLiBMZXQgbWUgdGFrZSBhIHN0YWIgYXQgaXQuCgo+ICAgICAgICAg
ICAgICAgICBtcy0+c3NlX2F2YWlsID0gZmFsc2U7Cj4KPiAgICAgICAgICAgICAgICAgc2JpX21w
eHlfc2htZW1fZGlzYWJsZShtcyk7Cj4gLS0KPiAyLjQzLjAKPgo+Cj4gLS0KPiBvcGVuc2JpIG1h
aWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKUmVnYXJkcywKQW51cAoKLS0g
Cm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
