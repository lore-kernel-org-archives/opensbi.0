Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC379606A31A
	for <opensbi@archiver.kernel.org>; Fri, 23 Oct 2026 12:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Lu1vs3W5;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=qMFEvZqZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LXLV4Cbbi76fBi9R9lSBo03c5NmXFH+fAsToMS7sHCc=; b=Lu1vs3W59N1RYwV3LcJaPJ1Aku
	Uq6AitSi5dfxdfeZXexC0AsOXAnZtdC4qEfO3CNF/JeF3YcLofo3Li9FiMjAhEKqtgQhEBrNkT0CR
	MuX2Ia8GprbshVwpOtcBqwLffAIqqcIzWoGR7fJ/g3hC4B9apw69SJBfnpCy4LoMMUhh8fVVfOEdl
	QTejM8CbzgHNoL3g5LPp8MYHHXkROZYiNARCo3ctnfAPQboKKykodbaYekBKSpC3AyM263xeFNyH0
	WTMgofghnudo47yuDD0Jd2qkz+bwb+fUAV7Ve7j2sPvneLqK7lh4dD/aJI69rD4Ob6YxNoRzfm6kZ
	U4miS1Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKDxF-0000000GGMu-2ng1;
	Fri, 23 Oct 2026 12:01:01 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKDxB-0000000GGLh-2XOe
	for opensbi@lists.infradead.org;
	Fri, 23 Oct 2026 12:01:00 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48e20edd106so659963f8f.1
        for <opensbi@lists.infradead.org>; Fri, 23 Oct 2026 05:00:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792756856; cv=none;
        d=google.com; s=arc-20260327;
        b=A4+ZIkO+gEF6rt8rZqEWnZMgsSKWrxT9oGWMIyZ+YVlQCDMmNEFVdIFewdhj9RBxVw
         Vxln9H4oQLwJXcMYZ/kQ/GprLodw36Ur7HJCNUWPm0D+awf83ak1qx4j/J9jnilDteDx
         5pWjDkobr1Tx3nOrjPU9DNz7IVKzg3L6zYBKpmHebX2RYIMSx2n0MU5rt8FSJIjsIS/I
         obOqGQojE2HwyMZJmXaeEHoSK9DjriRY6drJAabTaTPL7ZPmhVJ/j9NqF/Q+NuUkJWOH
         3VAf/CJDRO+WCcehyhcIeqJoigyxdnp/onDKQouGPCpkMjj2Oq6m0SdyHgFF6Jz9/k0A
         Fh/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fEn+2gtLkJf7u/zIICr8OgOe/a+b3OXG9qHzugtApfM=;
        fh=GaiiHVXYXlsjSyXD2+3+gvuGPJn8VKbq9+7e20uYGvo=;
        b=iY9/QA4FA2uYl8uZerKRXnzbxGmMK8QoFEKmcbK1oql4AhUDsqhwVyvcKgdjfp3Yj2
         qnp2WmUe9AgTg4C3MIvJCztkGQRUGrdEjBE1LBaeRI44Faj8eeKWmSgTzZlArrPNUSLv
         NPy0vPjBf59Y7cUO+4+fZ04XRfD1HG0jg++FrGJfxK3l5YM6PEhz7ydgeOXeqMMclbcu
         U4PNehdxsPIdFbuy5X+xHjMrgQQ/zKs1jaMxl1Nei4pY1yi5ei3UDNpFHyWxeX/V/8nh
         /V4bvHXe5PFE1n28USXKDl+HQfrKVSd5iKFasHRRz6FCB5C5MUovp2IJ1eMubTV+XBil
         5SRw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792756856; x=1793361656; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fEn+2gtLkJf7u/zIICr8OgOe/a+b3OXG9qHzugtApfM=;
        b=qMFEvZqZG5OtRYrhANkrRnerm1z4nX2altA6iRzutZfIbYzYXdteFA/UPbVevRilDk
         lE4BpUCrxw37LDNZs5gSqwVC1mfVaRX0PI9rt+oslS9LaON2WG68sxOJcXOE/SgUm3vh
         Xe/X/O4JOwAlmb7e0zPUo0J8mkXFPMyuVzCsICRoVjQFSEw+I1Y42UjU13FUzuzUoPww
         W30mZIP1zip8Gq7rxgbEKPwC7GrRvnFlPDYyzgj3gpeXEmPsjYIdMbSehyGplIc+w8Pw
         HfQ53DCWyITluw+kyFfxTVCRPqbNLs/AaSH2k8FJDkFeKKNd2cuH8OwcoPPKmPILrSca
         h8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792756856; x=1793361656;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fEn+2gtLkJf7u/zIICr8OgOe/a+b3OXG9qHzugtApfM=;
        b=buvi36vw4ZnDPxzW7RbXHu0/M3JdfAZsBGhzv5NqATSkJiwahFDvjcK05FsU2t0qIj
         YatjC2ys11p6DOGaCgyIlI4vBlCra3LKyzIOmKqEh+evWt3XmFB606dqoQE8eOjPFlX5
         optAPgR/Hg05YMgQ/R03An+eKPRsyeNU+XX3D956NJCwKG9aV9l68GitMKIJ9HjmxJlN
         T7VfrWS0DeAkAqXH5STh1Ml/LGa+jUsBPt6hML7+XyLUycGn0uEpdWsrWzZ/hYrn3PCH
         XWEVuErgy3fzRm6BYFNyUPr4DARHOH7/lVgSAiVILpz0T4SSfOWlFdGk08K+sMMyR5nv
         cfjg==
X-Gm-Message-State: AFq9FYI0+GbvqQppTJWq77wpN6KU+2nIgQjjiXRYE8WqrqfkNvTspFZv
	2pq3dqICVrIaxskD7ZR79ZYNK4hPoXqmXApDPduahgYSwFW/s3709gDbcliOFu1maVDmd9+vnnk
	w7QIAjYsqABFMQ8Xw86vgC2gCYM+YdQ0eJ3BLw+Bs5A==
X-Gm-Gg: AYBFou3hzqXeSNTpRRgg9gj8vp1N3KeuJmhaM8Wm1zLnwx9o0fZMcwIehNlC2iK02Sz
	l51PILSQZcFjSqNvdDnzQP40JQONuOj5KRrlIf7koO0gD69JCmKWmjkIeW0ZE3XV3Xkq/PTZA7b
	3OV0scm6Jk0UYFIKLRSRA38JHjyD1yZcu/YA674qlDk0yVeazvsmpQZOihMRa+r6+hfVzOPYI6+
	cft7VC8F8sfwRaRoDCVCY4WVxtCCagPPkJqFXWP+H/zlRsLwmbGMSXLBBHH/emyf6aVBo+huIAF
	AqE+6hpMvHvPsFzlmKc2PiDXgzIR12Y5UUotoFxGg9sgTdp+SeiJg/M5adxRB2bzAbVAYEf/mhN
	zNS7vDKhFAfu85B2if8KsDIE2Ke/T3G5G5GxLJkfg0tL04qmwQJvXZSNoQpUdycrDjVphdwud4u
	PbzwZDawj/QLjfththw5ds2TH4Y9T1w1oQzHNaMAmhcYCZmCmB77gzKvX/
X-Received: by 2002:a5d:43c3:0:b0:48d:e62f:db70 with SMTP id
 ffacd0b85a97d-48e385a24f5mr2670179f8f.48.1792756855358; Fri, 23 Oct 2026
 05:00:55 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260831130817.54625-1-pengpeng@iscas.ac.cn>
In-Reply-To: <20260831130817.54625-1-pengpeng@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 23 Oct 2026 17:30:43 +0530
X-Gm-Features: AclHuK-XTustIdduVgwI5fxC95cL9KwB5hR5uEzkRZ7GfUP5BqUzp9273B_LXnM
Message-ID: <CAAhSdy2fJ71=Eu1rArBuqjt4+YMObxaHuu0=V44h0ntytMskdA@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi_hsm: Validate state before updating start context
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: opensbi@lists.infradead.org, Anup Patel <anup.patel@oss.qualcomm.com>, 
	Evgenii Shatokhin <e.shatokhin@yadro.com>, Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_050057_720562_DCA59A1C 
X-CRM114-Status: GOOD (  21.40  )
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCBBdWcgMzEsIDIwMjYgYXQgNjozOOKAr1BNIFBlbmdwZW5nIEhvdSA8cGVuZ3BlbmdA
aXNjYXMuYWMuY24+IHdyb3RlOgo+Cj4gc2JpX2hzbV9oYXJ0X3N0YXJ0KCkgYWNxdWlyZXMgdGhl
IHRhcmdldCBoYXJ0J3Mgc3RhcnQgdGlja2V0LCB0aGVuCj4gd3JpdGVzIG5leHRfYXJnMSwgbmV4
dF9hZGRyIGFuZCBuZXh0X21vZGUgYmVmb3JlIGNoZWNraW5nIHdoZXRoZXIgdGhlCj4gdGFyZ2V0
IGlzIHN0b3BwZWQuCj4KPiBBIHN0YXJ0IHJlcXVlc3QgZm9yIGEgbm9uLXJldGVudGl2ZWx5IHN1
c3BlbmRlZCBoYXJ0IGlzIHJlamVjdGVkLCBidXQKPiB0aG9zZSB3cml0ZXMgaGF2ZSBhbHJlYWR5
IHJlcGxhY2VkIHRoZSByZXN1bWUgY29udGV4dCBjb25zdW1lZCBieQo+IHNiaV9oc21faGFydF9y
ZXN1bWVfZmluaXNoKCkuIFRoZSBzYW1lIG9yZGVyaW5nIGFsc28gbGV0cyBvdGhlciByZWplY3Rl
ZAo+IHN0YXJ0IHJlcXVlc3RzIG1vZGlmeSB0YXJnZXQgc2NyYXRjaCBzdGF0ZS4KPgo+IENoZWNr
IHRoZSBzdGF0ZSBpbW1lZGlhdGVseSBhZnRlciBhY3F1aXJpbmcgdGhlIHN0YXJ0IHRpY2tldCBh
bmQgYmVmb3JlCj4gdXBkYXRpbmcgdGhlIHNjcmF0Y2ggY29udGV4dC4gVGhlIHRpY2tldCBzZXJp
YWxpemVzIHN0YXJ0IHJlcXVlc3RzIGZvcgo+IHRoZSB0YXJnZXQ7IHJldGFpbiB0aGUgY21weGNo
ZyBhcyB0aGUgcHVibGljYXRpb24gYmFycmllciBhbmQgZGVmZW5zaXZlCj4gc3RhdGUgY2hlY2su
Cj4KPiBGaXhlczogZThlOWVkMzc5MGZlICgibGliOiBzYmk6IFNldCB0aGUgc3RhdGUgb2YgYSBo
YXJ0IHRvIFNUQVJUX1BFTkRJTkcgYWZ0ZXIgdGhlIGhhcnQgaXMgcmVhZHkiKQo+IFNpZ25lZC1v
ZmYtYnk6IFBlbmdwZW5nIEhvdSA8cGVuZ3BlbmdAaXNjYXMuYWMuY24+Cj4gLS0tCj4gIGxpYi9z
Ymkvc2JpX2hzbS5jIHwgMTcgKysrKysrKy0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDcg
aW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9z
YmlfaHNtLmMgYi9saWIvc2JpL3NiaV9oc20uYwo+IGluZGV4IDBhMzU1ZjljLi5hZjgxZTFjMiAx
MDA2NDQKPiAtLS0gYS9saWIvc2JpL3NiaV9oc20uYwo+ICsrKyBiL2xpYi9zYmkvc2JpX2hzbS5j
Cj4gQEAgLTMzMiw2ICszMzIsMTIgQEAgaW50IHNiaV9oc21faGFydF9zdGFydChzdHJ1Y3Qgc2Jp
X3NjcmF0Y2ggKnNjcmF0Y2gsCj4gICAgICAgICBpZiAoIWhzbV9zdGFydF90aWNrZXRfYWNxdWly
ZShoZGF0YSkpCj4gICAgICAgICAgICAgICAgIHJldHVybiBTQklfRUlOVkFMOwo+CgpXZSBuZWVk
IGEgY29tbWVudCBhYm91dCB3aHkgdGhlIGFkZGl0aW9uYWwgY2hlY2sgaXMgbmVlZGVkLiBJIHdp
bGwKYWRkIGl0IGF0IHRoZSB0aW1lIG9mIG1lcmdpbmcuCgo+ICsgICAgICAgaHN0YXRlID0gYXRv
bWljX3JlYWQoJmhkYXRhLT5zdGF0ZSk7Cj4gKyAgICAgICBpZiAoaHN0YXRlICE9IFNCSV9IU01f
U1RBVEVfU1RPUFBFRCkgewo+ICsgICAgICAgICAgICAgICByYyA9IGhzdGF0ZSA9PSBTQklfSFNN
X1NUQVRFX1NUQVJURUQgPyBTQklfRUFMUkVBRFkgOiBTQklfRUlOVkFMOwo+ICsgICAgICAgICAg
ICAgICBnb3RvIGVycjsKPiArICAgICAgIH0KPiArCj4gICAgICAgICBpbml0X2NvdW50ID0gc2Jp
X2luaXRfY291bnQoaGFydGluZGV4KTsKPiAgICAgICAgIGVudHJ5X2NvdW50ID0gc2JpX2VudHJ5
X2NvdW50KGhhcnRpbmRleCk7Cj4KPiBAQCAtMzQ2LDE3ICszNTIsOCBAQCBpbnQgc2JpX2hzbV9o
YXJ0X3N0YXJ0KHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCwKPiAgICAgICAgICAqLwo+ICAg
ICAgICAgaHN0YXRlID0gYXRvbWljX2NtcHhjaGcoJmhkYXRhLT5zdGF0ZSwgU0JJX0hTTV9TVEFU
RV9TVE9QUEVELAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU0JJX0hTTV9TVEFU
RV9TVEFSVF9QRU5ESU5HKTsKPiAtICAgICAgIGlmIChoc3RhdGUgPT0gU0JJX0hTTV9TVEFURV9T
VEFSVEVEKSB7Cj4gLSAgICAgICAgICAgICAgIHJjID0gU0JJX0VBTFJFQURZOwo+IC0gICAgICAg
ICAgICAgICBnb3RvIGVycjsKPiAtICAgICAgIH0KPiAtCj4gLSAgICAgICAvKioKPiAtICAgICAg
ICAqIGlmIGEgaGFydCBpcyBhbHJlYWR5IHRyYW5zaXRpb24gdG8gc3RhcnQgb3Igc3RvcCwgYW5v
dGhlciBzdGFydCBjYWxsCj4gLSAgICAgICAgKiBpcyBjb25zaWRlcmVkIGFzIGludmFsaWQgcmVx
dWVzdC4KPiAtICAgICAgICAqLwo+ICAgICAgICAgaWYgKGhzdGF0ZSAhPSBTQklfSFNNX1NUQVRF
X1NUT1BQRUQpIHsKPiAtICAgICAgICAgICAgICAgcmMgPSBTQklfRUlOVkFMOwo+ICsgICAgICAg
ICAgICAgICByYyA9IGhzdGF0ZSA9PSBTQklfSFNNX1NUQVRFX1NUQVJURUQgPyBTQklfRUFMUkVB
RFkgOiBTQklfRUlOVkFMOwo+ICAgICAgICAgICAgICAgICBnb3RvIGVycjsKPiAgICAgICAgIH0K
Pgo+IC0tCj4gMi41MC4xIChBcHBsZSBHaXQtMTU1KQo+Cj4KPiAtLQo+IG9wZW5zYmkgbWFpbGlu
ZyBsaXN0Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCgpSZXZpZXdlZC1ieTogQW51cCBQYXRl
bCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KCkFwcGxpZWQgdGhpcyBwYXRjaCB0byB0aGUgcmlzY3Yv
b3BlbnNiaSByZXBvLgoKVGhhbmtzLApBbnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3Bl
bnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vb3BlbnNiaQo=
