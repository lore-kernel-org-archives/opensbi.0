Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC027606A324
	for <opensbi@archiver.kernel.org>; Tue,  3 Nov 2026 07:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GfEm4WTJ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=PlzY5INt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=D0xY4ZYWdH+Xw1gVzw3oiotqi3h9WnH1WeP6ByMROG8=; b=GfEm4WTJJ+89Iqz3syisjwcps5
	9AFUvOEtADMJA6JABx6pvecIu7HAHUXBSfFmtUADvN7Yu4iMYELCO7mPFdc7kUoQUj63moIgM+sdv
	BoKwL2+8crQtJ4WANK/To9dP6NlIOekXIyEKqNmVreYrkR0MTDvLMec3k92t+8618MgfuX7VBIHod
	2mINJc29NDUXROJSGYseU9LqAcBZb94e2OqcRVCycm8/VR0wrVlR4jiq99leSMPZbS26ldVRDyDwM
	NPgDDep0tEThBIYY9QHooB/GZlXychQsDX+AkCBTw5ok0oMWKNvEU2XlRwRwBXw7e8m+8QQR/UF1V
	dcnXW4Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9L9-00000001SHH-3vDy;
	Tue, 03 Nov 2026 07:53:55 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9L5-00000001SGL-3Gj9
	for opensbi@lists.infradead.org;
	Tue, 03 Nov 2026 07:53:53 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-48c45111bebso1634220f8f.0
        for <opensbi@lists.infradead.org>; Mon, 02 Nov 2026 23:53:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793692430; cv=none;
        d=google.com; s=arc-20260327;
        b=kbFbqBtci3qifgr2yV4qBVbRTPoc9Zj6r1fiJU/xW9aNzN6fAXVnpZkawJdjhdqbt5
         GXiplMhrEy01xbEM48mb/umzDRKzBEYFRAtzvuAT4UwOdROyT6nld6W7lEVLz82pG9Yr
         Fmv63Ih6J4Q3khNjOqdWiZhlW3n1XW5FXjOPDoaDtWnm12d3HjuZKMFV7HVj9kb9BcOE
         zA02wnxWdfxt32W9RVQLSEcytd6OLV0Nr6GvHRWkm3v63XzuGvQvh1LXGAblo6QAeUEN
         USGEoHxq0+OHvPmOJF2U3yR8///y67WVqx8I3U7SfNo0QyJ8F2vSCl+uhJzAeA/lwh2i
         Y1cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tWNVIPIoRMmFowLev1pqmwCxfSZ7n1BpxWydohRgIZg=;
        fh=Ox7raT5WwbcYVo7VoX1vlXCgLiwv7L8rZyTfkJyXchk=;
        b=FTEoc5oKADVqAwo0GSy/f4OkooJ5saS3D5EqkC92TdyeYlGLzuJoE66sCxbtBrAMMv
         5kErHYl3qLhePzJKg03jhhnGD6iYwz4YugAn0BqebSKL+EbXul273YYViXKU5/rJrI2h
         5Qi/NKI+Zeu8h6eQeSFZMxJpZ3FdT6MDMJBkHlaqQrNf2tKRCFOOxAMj7LgBstV0zOMN
         t0QtSQsz78LmmcmlH6CFiBGqKKIPx/LEE9h1xeWhkebDoN30dy+6Ce9Ihqpa5HQWa8L/
         aDDX+PRkCNh3m1d8kfRAwjXs0euhkhffLSTQ4qYni+BJbxemWM0TulVL6Ey4eDkxw4Mz
         dYcw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793692430; x=1794297230; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tWNVIPIoRMmFowLev1pqmwCxfSZ7n1BpxWydohRgIZg=;
        b=PlzY5INt4RRqi9a5VM2BludorEn1TiMF2/48faAzqJlID6ZsT/f9CXRBmYBOFEcTgT
         ndilx8iBSE/I7XDMxRX8Mor7yT0Lx/UGiBD3ijuYojWUgzzDjfnWSQfaBngbOZfeZDmX
         ff7zLNgeXsEOpeIEixULu/sBIeESz5K5LvfwljOWoElTdRSiXfG+z3zikjA7L7F9rD7e
         iAoNKplE8YLbFTtXO0TN8rbcxKxDktQh0IqwyLTGdnsdCx0fWde8f1ZyaDm/aRxiT7xc
         ALIkpKXTALcnov/KdElpVcxSp9QnVsFhycWGJQNqq0oEjn1Q72nQKR7eVK7x1nZeox3+
         c/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793692430; x=1794297230;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tWNVIPIoRMmFowLev1pqmwCxfSZ7n1BpxWydohRgIZg=;
        b=n6Kyvh0WoV2CYuBAqM18TX5wB2+iyGsTucy2BbjjRzIMpZO4JOIRiZnxfIzrk1LwfT
         UcczFG52HRDjKn3ucQ/ejY90v90FKEXMGvToT4v5VqltWj/1QLBZu9g9Qlz6UVS+Tpue
         M91fJ09fe+C+PFBM5MyR8RsxfroogH7WOZaiqgLPEZilR/NwDcZ9piRamEOu/h5ZeifK
         MmInQBv6xLbNLRQ0/W3xTlka142ZWtGATBO0XySV4GeyjuK2Cx5erNfv7zzaLST5hVD9
         BF3Vb4JSaTzhN1+HMDYdL8QP/NdQpND+N942ODl6Tv8CybLzg89/XfK18nfAUgw4zQGA
         G+LA==
X-Gm-Message-State: APuU4Z94g7govW4Ktt2D/Kh6qwB5xu3dD0XVTXWTaZYjGMzMGvJl365R
	geS5i2EyF1vNbX0PjioeZab0FWYjDAA9da0u6a+oJ2uFGTYN21xnwXA+i8cfUbmf/zHChAiEVNs
	GqnCOjK4uxABayxI9lPpc8+NOqykl12p7BRDbxigbwQO6pbTKbd05jGcpsg==
X-Gm-Gg: AYBFou260xZfzQ2t+qsfsJX3l9PSgL0C4HAmC1uqu/dpA0jcqY20LyAnF5lQPODy/Pi
	xoQzvW5rc4lxs/xuxBtt/XMtbmCRmOEBkJgmdi6/vcI9LSo+RvUDxDLX2lNpAzFzMRLPW0O3vt5
	aOkDcYMr5rZkdV8erbmaz/ozl76KXVUr/rB0DgwmsSyygX+W4XIl+fnbAF1xQ5H9XpUPRKBfJwx
	2BPniZgktjYTeLO9huwmCJ8ZT+VvLzkeoYhx4Nzr9Ii2xNZUGDhJziWMdrHvg1573M2getphIlf
	K9aTE03/JrqymBLDPFMxE/Ke5jW43RTdCYmBaDGuZSmdwIRx0s7xY1dtBnOPKanOFnJO/Kt0joR
	N/pLcMbuvxyY0+NED9f3InrdqsCkavhGu7k2cJuUXDPzBqMI2wKhf87rEOtisO2YSmYQcOE/2I5
	cwFpq9yNWV6fZw8/zJSTsWrM963E9xvt1TaXK6QRcVaXKONc8MA8M5f5g=
X-Received: by 2002:a05:6000:22c8:b0:487:15a3:1cab with SMTP id
 ffacd0b85a97d-48e6e307164mr27239853f8f.18.1793692428899; Mon, 02 Nov 2026
 23:53:48 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260915-smrnmi-context-restore-v3-0-e9dd31152515@sifive.com>
In-Reply-To: <20260915-smrnmi-context-restore-v3-0-e9dd31152515@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 3 Nov 2026 13:23:36 +0530
X-Gm-Features: AclHuK_E32wZj-re9yJilzUnVqW21E0lnoG7OERHXAKAPG1Q4y_k_ESfLSXob9Q
Message-ID: <CAAhSdy00ir_VomX6yU=4oxu5MD2x6xogwJ_+8ca7dijmr1j5pg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] lib: sbi: Fix Smrnmi resume init and optional
 platform callback
To: Nia Su <nia.su@sifive.com>
Cc: opensbi@lists.infradead.org, Nick Hu <nick.hu@sifive.com>, 
	Zong Li <zong.li@sifive.com>, Nylon Chen <nylon.chen@sifive.com>, 
	Evgeny Voevodin <evvoevod@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_235352_368845_4D811777 
X-CRM114-Status: GOOD (  17.81  )
X-Spam-Score: -2.1 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBTZXAgMTYsIDIwMjYgYXQgMTE6MjbigK9BTSBOaWEgU3UgPG5pYS5zdUBzaWZpdmUu
Y29tPiB3cm90ZToKPgo+IE9uIG5vbi1yZXRlbnRpdmUgc3VzcGVuZCByZXN1bWUsIHRoZSBoYXJ0
IG5ldmVyIGluaXRpYWxpemVzIHRoZQo+IFNtcm5taSBDU1JzIHRoZSB3YXkgaGFydF9kZXRlY3Rf
ZmVhdHVyZXMoKSBkb2VzIGF0IGJvb3QsIHNvIGEgaGFydAo+IHdha2luZyBmcm9tIG5vbi1yZXRl
bnRpdmUgc3VzcGVuZCByZXN1bWVzIHdpdGggTk1JcyBkaXNhYmxlZCBhbmQgbm8KPiBSTk1JIGhh
bmRsZXIgaW5zdGFsbGVkLgo+Cj4gUGF0Y2ggMSBleHRyYWN0cyB0aGUgc2V0dXAgaW50byBzYmlf
c21ybm1pX2hhcnRfaW5pdCgpIGFuZCBjYWxscyBpdAo+IGZyb20gYm90aCBoYXJ0X2RldGVjdF9m
ZWF0dXJlcygpIGFuZCBzYmlfaGFydF9yZWluaXQoKS4KPgo+IFBhdGNoIDIgY2hhbmdlcyBzbXJu
bWlfaGFuZGxlcnNfaW5pdCB0byByZXR1cm4gaW50LCBzbyBhIGZhaWxlZAo+IGNhbGxiYWNrIG5v
IGxvbmdlciBnZXRzIGlnbm9yZWQgYmVmb3JlIE5NSUUgaXMgZW5hYmxlZCBhbnl3YXkuIEl0Cj4g
YWxzbyBkb2N1bWVudHMgdGhlIFNCSV9PSy9lcnJvciByZXR1cm4gY29udmVudGlvbiBhbmQgYWxp
Z25zIHRoZQo+IG5laWdoYm9yaW5nIHJubWlfaGFuZGxlciBjb21tZW50IHRvIHVzZSBTQklfT0sg
YXMgd2VsbC4KPgo+IFBhdGNoIDMgYWxsb3dzIGEgTlVMTCBzbXJubWlfaGFuZGxlcnNfaW5pdCBv
bmx5IHdoZW4gdGhlIHBsYXRmb3JtCj4gc2V0cyB0aGUgbmV3IFNCSV9QTEFURk9STV9IQVNfRklY
RURfU01STk1JX1ZFQ1RPUiBmZWF0dXJlIGZsYWcsIHNvIGEKPiBwbGF0Zm9ybSB3aXRoIGEgZml4
ZWQgb3IgbXR2ZWMtYmFzZWQgTk1JIHZlY3RvciBjYW4gc2F5IHNvCj4gZXhwbGljaXRseSBpbnN0
ZWFkIG9mIGEgYmFyZSBOVUxMIGJlaW5nIGluZGlzdGluZ3Vpc2hhYmxlIGZyb20gYQo+IGNhbGxi
YWNrIHRoZSBwbGF0Zm9ybSBzaW1wbHkgZm9yZ290IHRvIHNldC4gSXQgYWxzbyByZXBvcnRzIHRo
ZSBpbml0Cj4gbW9kZSAoIlBsYXRmb3JtIiBvciAiRGVmYXVsdCIpIGluIHRoZSBib290IEhBUlQg
YmFubmVyLgo+Cj4gU2lnbmVkLW9mZi1ieTogTmlhIFN1IDxuaWEuc3VAc2lmaXZlLmNvbT4KPiAt
LS0KPiBDaGFuZ2VzIGluIHYzOgo+IC0gUGF0Y2ggMTogY2FsbCBzYmlfc21ybm1pX2hhcnRfaW5p
dCgpIGVhcmx5IGluIHNiaV9oYXJ0X3JlaW5pdCgpOwo+ICAgZG9jdW1lbnQgdGhhdCBzbXJubWlf
aGFuZGxlcnNfaW5pdCBtYXkgcnVuIHR3aWNlIG9uIGNvbGQgYm9vdC4KPiAtIFBhdGNoIDI6IGRv
Y3VtZW50IFNCSV9PSy9lcnJvciByZXR1cm4gY29udmVudGlvbiBvbgo+ICAgc21ybm1pX2hhbmRs
ZXJzX2luaXQ7IGFsaWduIHJubWlfaGFuZGxlciBjb21tZW50IHRvIHVzZSBTQklfT0sgdG9vLgo+
IC0gUGF0Y2ggMzogZ2F0ZSBOVUxMIHNtcm5taV9oYW5kbGVyc19pbml0IGJlaGluZCBuZXcKPiAg
IFNCSV9QTEFURk9STV9IQVNfRklYRURfU01STk1JX1ZFQ1RPUiBmbGFnIGluc3RlYWQgb2YgYWNj
ZXB0aW5nIGl0Cj4gICB1bmNvbmRpdGlvbmFsbHkuCj4gLSBMaW5rIHRvIHYyOiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9yLzIwMjYwOTAzLXNtcm5taS1jb250ZXh0LXJlc3RvcmUtdjItMC0xMGIx
NzUwNmQyNTdAc2lmaXZlLmNvbQo+Cj4gQ2hhbmdlcyBpbiB2MjoKPiAtIEJyZWFrIHYxJ3MgcGF0
Y2ggMSBpbnRvIHRocmVlIHNtYWxsZXIsIHNlbGYtY29udGFpbmVkIHBhdGNoZXMgZm9yCj4gICBh
IGNsZWFyZXIgc3RydWN0dXJlLgo+IC0gRHJvcHBlZCB2MSdzIHBhdGNoIDIsIHdoaWNoIGlzIHVu
cmVsYXRlZCB0byB0aGlzIGZpeCBhbmQgd2lsbCBiZQo+ICAgc2VudCBzZXBhcmF0ZWx5Lgo+IC0g
TGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb3BlbnNiaS8yMDI2MDgyNy1ybm1p
LXRyYXAtZml4ZXMtdjEtMC1kZjM3MWNmOTIzMDFAc2lmaXZlLmNvbS8KPgo+IC0tLQo+IE5pYSBT
dSAoMyk6Cj4gICAgICAgbGliOiBzYmk6IGV4dHJhY3Qgc2JpX3Ntcm5taV9oYXJ0X2luaXQoKSBh
bmQgY2FsbCBvbiBub24tcmV0ZW50aXZlIHJlc3VtZQo+ICAgICAgIGxpYjogc2JpOiByZXBvcnQg
c21ybm1pX2hhbmRsZXJzX2luaXQgZmFpbHVyZXMgaW5zdGVhZCBvZiBpZ25vcmluZyB0aGVtCj4g
ICAgICAgbGliOiBzYmk6IGFsbG93IE5VTEwgc21ybm1pX2hhbmRsZXJzX2luaXQgYW5kIHJlcG9y
dCBpbml0IG1vZGUgYXQgYm9vdAoKSSBoYXZlIHJlbmFtZWQgc2JpX3Ntcm5taV9oYXJ0X2luaXQo
KSB0byBzbXJubWlfaGFydF9pbml0KCkgYXQgdGhlIHRpbWUKb2YgbWVyZ2luZy4gT3RoZXJ3aXNl
LCBMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpB
cHBsaWVkIHRoaXMgc2VyaWVzIHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8uCgpUaGFua3MsCkFu
dXAKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
