Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51102CCA471
	for <opensbi@archiver.kernel.org>; Mon,  6 Oct 2025 05:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hqwfmifuMxZPqiqGeAsXiYdhXw+GsheO+I66wGHRlnc=; b=YZVMzbV29O6R8C
	8oSe/IaGwjP8XtUGlNlYDZoWhNqj0y7uTPKVL8NZCo00oT31jGocIFlg/BZtGyhNF2EfRKKYkRqGP
	k4txnKuCPEWC7wgZVSaWg0kqTxFydl5sF1Kd6Q82/8wCmiprqwToMpzkV+3uebL3CX9SGI1FuDuuD
	pwfELktJfCs5Ff2QZFhk+Y3NtGrjFen310Zj7JcM9atwS0P39psUrhaa1LBuIxY8cFjXSRn7LQzbv
	T0glm15nc0oyqVL3IlLAruhKOgYRzus8QRUYbOf2DFfzi932SJQ5sE7Xsefa0ts5P+Uno/x8RwTFG
	/nV5wpMjup907fm4oThg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5dew-0000000Gxbb-07nv;
	Mon, 06 Oct 2025 05:21:18 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5des-0000000Gxb8-1mxE
	for opensbi@lists.infradead.org;
	Mon, 06 Oct 2025 05:21:16 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-4248b34fc8eso49713025ab.3
        for <opensbi@lists.infradead.org>; Sun, 05 Oct 2025 22:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1759728073; x=1760332873; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6aFO4Sa/y+oNad9tpTxhWf4N1LJ+8pUqSD+LkD3iWKI=;
        b=fqFeLeeK7vyxDbOvmB0vgEBoZEzeC11iNJhxy76Lq3kQNThbf1pFPop/+jStNgGreX
         6Nn/ZTr8yxwL8Lr8E5CXXMvXJayZEjpgHbYiCX2/ZcKrX3JNXzIBF+WrIf0dqhpq1g/j
         43AjaDi+RovpLMNxBiPnomYtS+m1nGOZZdqorbGOhLakPpoXpqDgbLOKkl5klFglbnst
         etLflTpSiCVNJqCzvPlAqaBe+ZmxUf3YMz2pqZwSG+r/sQzQeCfXmvKp9mxwD6ahAEe1
         A4dWHE0h3q1CdANOV2S46DxojQ8CEvBoFxC84lymZXVZUJI+inwlExuNNmfFcpbelECv
         YcGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759728073; x=1760332873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6aFO4Sa/y+oNad9tpTxhWf4N1LJ+8pUqSD+LkD3iWKI=;
        b=A1tUtDexwtY+5nO/nHDOVNArlu67TPYrjrE+oIq8s0ogRrSla7iO/dql0o9jphu9Ev
         qbrdiklLvrgAfuOkpfobQWC/Wn0PclG659SaGPyRsVynRcbBApVo1OdBHzN8BGtJreaV
         7cYGrKBRRpO1r0Tj44T7ieGyxNefBJyf6qlLN1j2gn5EH4J/w5AkUP3vei7nx8FBiaU0
         HRoiRvVNWzZYpQxLVpOSSwNKsuLhdup4hC2JKwYsppiPDj2Hb38PkVo5r6W/+x9557Qy
         8vahtPLEgWtRZgsZcnNzS3jf6i47IUhi3DCqsc3ulZprd67E6KXkABi1tuBPTxfW4gOv
         +j8g==
X-Gm-Message-State: AOJu0YyG5+6AVCPTnqXsllHs2IAzZbGmfkzkKJcVcqZml2xDzIJaUqZk
	UmWzVC/SryeDu9bkleuigr1xX6pj5M9iTJz1G398Nz88K3w4M9bcPtRIo6uOMHacRBR3Ufezatj
	xyDcmjsNAzV7kNjYvQNpVm5u8UJTy6nJ6WHO20/E9UUc+vGWiaRZCDQEtKw==
X-Gm-Gg: ASbGncvTQS2YKQUsAgDeS86VXoDPqQJKXyincxG+0AVXX5ikkEtvjgaw30auVTY6URa
	iB6ia6PY7mjinANfI3fWPdJsBkOrp9nh2NgHHlrtl8gMltcUSFqagIAJtb5wqpPPAKQSwVc0Q0g
	mgy3K0PeWuz3Ln7oU2GZdEf7un24POglVcVmm+UzyP6SGJg/PK3pUGZsN3FBhBUPMw8W2AKPZcY
	SFhvtpImp6nPGwN5xYkQRBdxJ/YY/d4CR6syzohvKV45aPff1qYjoS+F5NeO/Ds
X-Google-Smtp-Source: AGHT+IEb6XitedDzDxUCXzvlKykO7ABf/OCgZlLDf0w6HW2TRfo9Y5J29QNlucU2tTbl7rRuo6v/oftMMFIbYCLje7M=
X-Received: by 2002:a05:6e02:1885:b0:42d:84ec:b5e5 with SMTP id
 e9e14a558f8ab-42e7ad04f91mr167341335ab.3.1759728072936; Sun, 05 Oct 2025
 22:21:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250814110522.18809-1-peter.lin@sifive.com>
In-Reply-To: <20250814110522.18809-1-peter.lin@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 6 Oct 2025 10:51:01 +0530
X-Gm-Features: AS18NWCKN_tn4-JbhU5jNYZEgA7Wla80rGuwcSRcMDIXO7VXRu9cRQKo8ubG_o8
Message-ID: <CAAhSdy3TiKTF-5b_fg5FtctFZVBdxVDxjOYYa5Tg0LMrO_iwEA@mail.gmail.com>
Subject: Re: [PATCH 0/8] SmePMP bugfixes and improvement
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com, greentime.hu@sifive.com, 
	alvinga@andestech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251005_222114_708721_C3DEA723 
X-CRM114-Status: GOOD (  11.72  )
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

T24gVGh1LCBBdWcgMTQsIDIwMjUgYXQgNzo0NuKAr1BNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gVGhpcyBzZXJpZXMgaW1wcm92ZXMgU21lUE1Q
IHJlbGF0ZWQgZnVuY3Rpb25zIGFuZCBmaXhlcwo+IHRoZSBhY2Nlc3MgZmF1bHQgZHVyaW5nIGRv
bWFpbiBjb250ZXh0IHN3aXRjaCB3aGVuIFNtZVBNUAo+IGlzIGVuYWJsZWQuCj4KPiBZdS1DaGll
biBQZXRlciBMaW4gKDgpOgo+ICAgbGliOiBzYmlfaGFydDogbW92ZSBzYmlfaGFydF9nZXRfc21l
cG1wX2ZsYWdzKCkgdG8gc2JpX2RvbWFpbgo+ICAgbGliOiBzYmlfZG9tYWluOiBhbGxvdyBzcGVj
aWZ5aW5nIGluYWNjZXNzaWJsZSByZWdpb24KPiAgIGxpYjogc2JpX2RvbWFpbjogcHJpbnQgdW5z
dXBwb3J0ZWQgU21lUE1QIHBlcm1pc3Npb25zCj4gICBsaWI6IHNiaV9oYXJ0OiBhZGQgZXJyb3Ig
bWVzc2FnZSBmb3IgaW5zdWZmaWNpZW50IFBNUCBlbnRyaWVzCj4gICBsaWI6IHNiaV9kb21haW5f
Y29udGV4dDogc2tpcCB0aGUgcmVzZXJ2ZWQgZW50cnkgZHVyaW5nIGRvbWFpbiBjb250ZXh0Cj4g
ICAgIHN3aXRjaAo+ICAgbGliOiBzYmlfZG9tYWluOiBhZGQgU0JJX0RPTUFJTl9NRU1SRUdJT05f
RlcgbWVtcmVnaW9uIGZsYWcKPiAgIGxpYjogc2JpX2RvbWFpbjogZW5zdXJlIGNvbnNpc3RlbnQg
ZmlybXdhcmUgUE1QIGVudHJpZXMKPiAgIGxpYjogc2JpX2RvbWFpbl9jb250ZXh0OiBwcmVzZXJ2
ZSBmaXJtd2FyZSBQTVAgZW50cmllcyBkdXJpbmcgZG9tYWluCj4gICAgIGNvbnRleHQgc3dpdGNo
CgpJIHRvdGFsbHkgbWlzc2VkIHRoaXMgc2VyaWVzIGJlY2F1c2UgZm9yIHNvbWUgc3RyYW5nZSBy
ZWFzb24sIGl0IGlzIG5vdApzaG93aW5nIHVwIGluIE9wZW5TQkkgcGF0Y2h3b3JrCihodHRwczov
L3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3Qvb3BlbnNiaS9saXN0LykuCgpDYW4geW91IHBs
ZWFzZSByZWJhc2UgYW5kIHJlc2VuZCB0aGlzIHNlcmllcyA/CgpSZWdhcmRzLApBbnVwCgo+Cj4g
IGluY2x1ZGUvc2JpL3NiaV9kb21haW4uaCAgICAgfCAxMSArKysrCj4gIGxpYi9zYmkvc2JpX2Rv
bWFpbi5jICAgICAgICAgfCA5OSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0K
PiAgbGliL3NiaS9zYmlfZG9tYWluX2NvbnRleHQuYyB8IDQ4ICsrKysrKysrKysrKysrKysrCj4g
IGxpYi9zYmkvc2JpX2hhcnQuYyAgICAgICAgICAgfCA4NiArKysrKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCj4gIDQgZmlsZXMgY2hhbmdlZCwgMTcwIGluc2VydGlvbnMoKyksIDc0IGRlbGV0
aW9ucygtKQo+Cj4gLS0KPiAyLjM5LjMKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+
IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5z
YmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL29wZW5zYmkK
