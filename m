Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7829C61DFD
	for <opensbi@archiver.kernel.org>; Wed,  2 Sep 2026 08:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xwibmtoXyHp5C8WWV/N7vUZjLIefx5V0oue9yqeqIpI=; b=zv37655gyUGWAp
	E3C/YcxbDmqyCGBtD4yO0K517HeQXVBzfHZUqr0dxnMoVhukpR9D7OnyCqaxp2KAmRgUGLKlw4/yL
	mLqj6QwSHY7Rdx5wSH722NP+CLydNJnEu1GSktEPYyCHVHET7iCCIOW2d5dlZVVCKjEzLknrgrsvX
	eFN1EE379AoITbol3EPXBXEma+QhAPXL5gUCp+pqCCqP3XmCZvHRfSfTOVeqg/DUCN8J5YC3NeSIJ
	ha4E74pBwy2pfsViPsKM4WbXyJstnCviVxDnAbfZnm2p+lZyk0KI3emBL31WNef9cO3SisRIkfRtw
	bn8Qrr4kO2Z0vOhzYnZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1gVY-0000000E7O8-2SF7;
	Wed, 02 Sep 2026 08:39:48 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1gVV-0000000E7NX-1CVV
	for opensbi@lists.infradead.org;
	Wed, 02 Sep 2026 08:39:46 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so6817405e9.0
        for <opensbi@lists.infradead.org>; Wed, 02 Sep 2026 01:39:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788338383; cv=none;
        d=google.com; s=arc-20260327;
        b=Bxgfvo+T9NiVBKO3QnET/lCYywDPLPnLqhx2bBNGLjil9Xc/jlAS0GRFafNyif5pUn
         iS4RHx+0LCqQmHf3qONCa2YlayWYU6i7fO4hknCOErNs1L1GeODFG+X7SNIw+dKbACc9
         13I8aX23gqOTRnZ06e81A6SjQyExI27GZKLaUZeUGek0icWqtOecRt0QyhI9Q94E0Al3
         CG8k3vKBTP02i4xNvRgKwcmKbqnN6wLpzL29NvWfr4oUQpGrA5fz2ymotpJDUFEG4EiE
         5B2geg3j0QzjT/FS/ptALNslAK0MO/b7PqEF/uHJtG/0zYApMyRKx65eJW5bMLwft/UL
         i64g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J9RrfgxsViPetbhrvTYOmaT7UJfg7V/iLlNVD7YCkwA=;
        fh=zSKhKLhozNbRw/jvGs8nN9IzvF3I3/vXlewdugb4UXw=;
        b=r7XppBs786H2nBPgJOYCTMkiIM6CkNykl7wh36YXV4wcN4VDg4LHa5wYx1o0Ka25cI
         pYBdA5RoQBiCojCDjVFdeulu7C9X6IkzRzZ8Nsi6QX0dfjyS4VamCwlhaSTBinUZsron
         aE8oUg4cE6HYSwe51xHFgr8jsmmS0vNwwvnUpKMYZbRhhN+Ve1jQIrTnnM+6bZn54LZa
         9A/pDK/4n5pICIC+nzpydAhr6CFS2iJDGx+fEGC2CJCIYaVjsj//nddTannD/IyUGrlQ
         UhRfHkZxUnb6d2wk+VLLquH/Mj0f7iFjqvyJlKdGQ31sz4aBqlVVJtY2Tm2tJgtPv+ea
         tALA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1788338383; x=1788943183; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J9RrfgxsViPetbhrvTYOmaT7UJfg7V/iLlNVD7YCkwA=;
        b=npe2cr4GRzTnDbjN3bz4lxPJFY9kKoUagGg9JsFhIWDOWcwNbmwtEy7+6fov0IbvlI
         RDQXjrLc01UMZwKtQTDQsBns3zuWZeKSw9qCND4lQEKlmzfjn5FNd9PvofJoKZu7O1gW
         eXatjqJ8Qokl3/pJbKbPxEzef5pavukBXTHPE9wHvivovn2T8Te+bWQdVOvuyO4ntXnW
         26hogWMLnsBB7ztZRTzWu6cGVOib3TYAfRxXxHUkXzpK3ogf2jzW8rgEx31LebMFvWgc
         VvN1S/iGKO00mzEHtaJ/4FAgeP9SNjy97c6lNB0uZmQQges1YaXS6WJAej6xaTFWBia2
         X5Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788338383; x=1788943183;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J9RrfgxsViPetbhrvTYOmaT7UJfg7V/iLlNVD7YCkwA=;
        b=aWPIe7mhCL9Y4UUjT0w3aT2/bsmimLMu3C9+XEV3oMT1ZHGocFoYPYPnCdOxAcZrVq
         Wbq22svRe4zlp7XCoGqDhDEg3VgUR5hmYCM8JZ+GlKtYqYxy0On72S1ZgWKTeCi83Xdl
         Uy0bhtdffSP5QE+16ufcZsJXDkhrudUQnWY4jk44U4wdBjkH3+KjyapU7ut+QSxSw84T
         n/g+IYJeUlR/NWN5jgiDtSptG2Hp3qfOztEGTvZPkeeC/23H5szWrdcbvO3HeV4rG7lH
         a4feGU5a3it0oaMkJU/iGP3ogjpNHrRsAPxiIuCHLLzcUNUXcJtdQI86AWGeKREgy7td
         0H1w==
X-Gm-Message-State: AFuF++n3UOjSQdfAJ26bBz4kV2a3NYeQGrG3du6kvau+jJFUGeH3sgpu
	bPuV6TAfQsUPRuCJMfzBpgpF/BTxm/c+vpA2AiG95gY/wvtYIfppCpK/dxjmFzA8hx3AJqGnCeC
	RohvQ1gdMeNwej7SaCpfG1IXrnZSIUdAiAGpbnS4DIw==
X-Gm-Gg: AR+sD10RyAvGOQcph6g07tkiFxeMA60u+c1kR0aa2GizZE3OgNeqqdwmaYfDyBurm6F
	X1w8zqRsESK2gwMbUhjv4qvQvM92vyXRX8MGAqUOulGFxI8ezDyvSAf0Qiek8SzwGwygNaxKglQ
	cRxwX6+r0oNDZ+6BtHWZdtVyWdSKb4AiwaFqksPzF08oX2r3s/w83rtjiWLSUmWsgfYQnA2SL3+
	xNwxSI8lmc6EgQlfXEXgPb9ldLfej7IUvVksoE/uGh8f67bKgKvj6uuLaDBMRy8oFkGPr5bhtMO
	AqoyPMg1zKRKa4wUMnB1oBzOUWtCfk03WamCVNLC11BC21cXiKM+zyPmJcPdIXEa2aHgw0oeR0n
	gVtigLbk1vvGG8QTPig+l8ye2mTdwTIYNR+ZoanpY2jZXioaKW9o/quedq2EbSbxp
X-Received: by 2002:a05:600c:8a17:20b0:49c:d818:8771 with SMTP id
 5b1f17b1804b1-49ce5808d4dmr41381295e9.7.1788338382454; Wed, 02 Sep 2026
 01:39:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260729163540.3162978-2-carlos.lopezr4096@gmail.com>
In-Reply-To: <20260729163540.3162978-2-carlos.lopezr4096@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 2 Sep 2026 14:09:30 +0530
X-Gm-Features: AcwNN1Ux0KZDVAKpsk1vuBM06zgSZwzbM1vedqBcrWr0nfzCySmRfilNPywXR4E
Message-ID: <CAAhSdy25G62pZFb-zHJ22wotvzuEp+6XGF3mRHFhnQXH4cDcvg@mail.gmail.com>
Subject: Re: [PATCH 00/14] Add clang Thread Safety Analysis (TSA) support
To: =?UTF-8?Q?Carlos_L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_013945_380253_C4BBA30E 
X-CRM114-Status: GOOD (  22.59  )
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

T24gV2VkLCBKdWwgMjksIDIwMjYgYXQgMTA6MTTigK9QTSBDYXJsb3MgTMOzcGV6CjxjYXJsb3Mu
bG9wZXpyNDA5NkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gRW5hYmxlIHRoZSB1c2Ugb2YgY2xhbmcn
cyBUaHJlYWQgU2FmZXR5IEFuYWx5c2lzIFswXS4gVFNBIGlzIGEgY2xhbmcKPiBsYW5ndWFnZSBl
eHRlbnNpb24gdGhhdCBhbGxvd3MgZGV0ZWN0aW5nIHBvdGVudGlhbCBpbnZhbGlkIGxvY2tpbmcK
PiBwYXR0ZXJucyBhbmQgcmFjZSBjb25kaXRpb25zIGF0IGNvbXBpbGUgdGltZSwgd2l0aCB6ZXJv
IHJ1bnRpbWUKPiBvdmVyaGVhZC4gVFNBIHJlbGllcyBvbiBhbm5vdGF0aW9ucyB0byBleHByZXNz
IHRoZSByZWxhdGlvbnNoaXBzIGJldHdlZW4KPiBkYXRhIGFuZCBsb2NrcywgYW5kIHRoZSBleHBl
Y3RlZCBzdGF0ZSBvZiBhIGxvY2sgYXQgY2VydGFpbiBwb2ludHMgaW4KPiB0aGUgcHJvZ3JhbS4K
Pgo+IFRoZSBmaXJzdCB0d28gY29tbWl0cyBpbnRyb2R1Y2UgdGhlIGJhc2ljIGluZnJhc3RydWN0
dXJlIHRvIHVzZSB0aGUgVFNBCj4gYW5ub3RhdGlvbnMuIFRoZSBsYXN0IGNvbW1pdCBlbmFibGVz
IFRTQSBieSBkZWZhdWx0IGluIHRoZSBNYWtlZmlsZS4KPiBDb21taXRzIGluIGJldHdlZW4gYWRk
IHRoZSBuZXcgYW5ub3RhdGlvbnMgdG8gcGFydGljdWxhciBPcGVuU0JJCj4gc3Vic3lzdGVtcy4K
Pgo+IFRoZSBnZW5lcmFsIHBhdHRlcm4gaXM6Cj4gKiBTdHJ1Y3QgZmllbGRzIGFyZSByZWFycmFu
Z2VkIHNvIHRoYXQgbG9ja3MgYXBwZWFyIGJlZm9yZSB0aGUKPiAgIGZpZWxkKHMpIHRoZXkgcHJv
dGVjdC4gVGhpcyBpcyBuZWVkZWQgZm9yIHRoZSBjb21waWxlciB0byBiZSBhYmxlIHRvCj4gICBw
ZXJmb3JtIGFuYWx5c2lzLiBQcm90ZWN0ZWQgZmllbGRzIGFyZSBhbm5vdGF0ZWQgd2l0aCBHVUFS
REVEX0JZKCkgLwo+ICAgUFRfR1VBUkRFRF9CWSgpLgo+ICogRnVuY3Rpb25zIHRoYXQgYWNjZXNz
IHNwaW5sb2NrLXByb3RlY3RlZCBmaWVsZHMgYXJlIGFubm90YXRlZCB3dGgKPiAgIE1VU1RfSE9M
RCgpLgo+ICogRnVuY3Rpb25zIHRoYXQgYWNxdWlyZSBhIHNwaW5sb2NrLCBhbmQgd2hpY2ggbWF5
IHBsYXVzaWJseSBiZSBjYWxsZWQKPiAgIHdpdGggdGhhdCBzcGlubG9jayBoZWxkLCBhcmUgYW5u
b3RhdGVkIHdpdGggTVVTVF9OT1RfSE9MRCgpIHRvIHByZXZlbnQKPiAgIHBvdGVudGlhbCBmdXR1
cmUgZGVhZGxvY2tzLgo+ICogSW5pdGlhbGl6ZXIgZnVuY3Rpb25zIGFuZCBvdGhlciBzcGVjaWFs
IGNhc2VzIGFyZSBleGNsdWRlZCB2aWEKPiAgIE5PX1RIUkVBRF9TQUZFVFlfQU5BTFlTSVMuCj4K
PiBUaGlzIHN1Y2Nlc3NmdWxseSByZXN1bHRzIGluIGRldGVjdGluZyBpbmNvcnJlY3QgbG9ja2lu
Zy4gRm9yIGV4YW1wbGUsIHRoZQo+IGZvbGxvd2luZyBjaGFuZ2U6Cj4KPiBkaWZmIC0tZ2l0IGEv
bGliL3NiaS9zYmlfZmlmby5jIGIvbGliL3NiaS9zYmlfZmlmby5jCj4gaW5kZXggODhiODg4OGQy
ZTgxLi41MzQ4Yjc0NTJmNjQgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfZmlmby5jCj4gKysr
IGIvbGliL3NiaS9zYmlfZmlmby5jCj4gQEAgLTM3LDkgKzM3LDcgQEAgdTE2IHNiaV9maWZvX2F2
YWlsKHN0cnVjdCBzYmlfZmlmbyAqZmlmbykKPiAgICAgICAgIGlmICghZmlmbykKPiAgICAgICAg
ICAgICAgICAgcmV0dXJuIDA7Cj4KPiAtICAgICAgIHNwaW5fbG9jaygmZmlmby0+cWxvY2spOwo+
ICAgICAgICAgcmV0ID0gZmlmby0+YXZhaWw7Cj4gLSAgICAgICBzcGluX3VubG9jaygmZmlmby0+
cWxvY2spOwo+Cj4gICAgICAgICByZXR1cm4gcmV0Owo+ICB9Cj4KPiBSZXN1bHRzIGluIGEgYnVp
bGQgZXJyb3I6Cj4KPiAgIGxpYi9zYmkvc2JpX2ZpZm8uYzo0MToxNDogZXJyb3I6IHJlYWRpbmcg
dmFyaWFibGUgJ2F2YWlsJyByZXF1aXJlcyBob2xkaW5nIHNwaW5sb2NrICcmc2JpX2ZpZm86OnFs
b2NrJyBbLVdlcnJvciwtV3RocmVhZC1zYWZldHktYW5hbHlzaXNdCj4gICAgNDEgfCAgICAgICAg
IHJldCA9IGZpZm8tPmF2YWlsOwo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICBeCj4gICAx
IGVycm9yIGdlbmVyYXRlZC4KPgo+IFRlc3RlZCB3aXRoIGNsYW5nIDE5LjEuNyBhbmQgMjIuMS44
Lgo+Cj4gWzBdIGh0dHBzOi8vY2xhbmcubGx2bS5vcmcvZG9jcy9UaHJlYWRTYWZldHlBbmFseXNp
cy5odG1sCj4KPiBDYXJsb3MgTMOzcGV6ICgxNCk6Cj4gICBpbmNsdWRlOiBzYmk6IGFkZCB0aHJl
YWQgc2FmZXR5IGFuYWx5c2lzIG1hY3Jvcwo+ICAgbGliOiBzYmlfbG9ja3M6IGFubm90YXRlIHNw
aW5sb2NrIEFQSXMgZm9yIFRTQQo+ICAgbGliOiBzYmlfZmlmbzogYWRkIFRTQSBhbm5vdGF0aW9u
cwo+ICAgbGliOiBzYmlfaGVhcDogYWRkIFRTQSBhbm5vdGF0aW9ucwo+ICAgbGliOiBzYmlfc2Ny
YXRjaDogYWRkIFRTQSBhbm5vdGF0aW9ucwo+ICAgbGliOiBycG1pOiBhZGQgVFNBIGFubm90YXRp
b25zCj4gICBsaWI6IHNiaV90aW1lcjogYWRkIFRTQSBhbm5vdGF0aW9ucwo+ICAgbGliOiBodGlm
OiBhZGQgVFNBIGFubm90YXRpb25zCj4gICBsaWI6IHNiaV9kb21haW46IGFkZCBUU0EgYW5ub3Rh
dGlvbnMKPiAgIGxpYjogc2JpX3NzZTogaW5saW5lIGVuYWJsZSBldmVudCBsb2NraW5nCj4gICBs
aWI6IHNiaV9zc2U6IHBhc3MgU1NFIGhhcnQgc3RhdGUgZXhwbGljaXRseQo+ICAgbGliOiBzYmlf
c3NlOiBhZGQgVFNBIGFubm90YXRpb25zCj4gICBsaWI6IHRlc3Q6IGRpc2FibGUgVFNBIGZvciBz
cGlubG9jayB0ZXN0cwo+ICAgTWFrZWZpbGU6IGVuYWJsZSBUaHJlYWQgU2FmZXR5IEFuYWx5c2lz
CgpPdmVyYWxsLCBUU0Egc3VwcG9ydCBpbiBPcGVuU0JJIGlzIGEgdmVyeSBnb29kIGFkZGl0aW9u
CmJ1dCBJIGFtIGZhY2luZyB0aGUgZm9sbG93aW5nIGNvbXBpbGUgZXJyb3I6CgogQ0MgICAgICAg
IGxpYi9zYmkvc2JpX2VjYWxsX2hzbS5vCkluIGZpbGUgaW5jbHVkZWQgZnJvbSBvcGVuc2JpL2xp
Yi9zYmkvc2JpX2VjYWxsX2hzbS5jOjEwOgpvcGVuc2JpL2luY2x1ZGUvc2JpL3NiaV9kb21haW4u
aDoxOTk6NDk6IGVycm9yOiB1c2Ugb2YgdW5kZWNsYXJlZAppZGVudGlmaWVyICdhc3NpZ25lZF9o
YXJ0c19sb2NrJwogIDE5OSB8ICAgICAgICAgc3RydWN0IHNiaV9oYXJ0bWFzayBhc3NpZ25lZF9o
YXJ0cwpHVUFSREVEX0JZKCZhc3NpZ25lZF9oYXJ0c19sb2NrKTsKCgpJcyB0aGVyZSBhbnkgcGFy
dGljdWxhciBjbGFuZyB2ZXJzaW9uIHJlcXVpcmVkIGZvciB0aGlzID8KSSBhbSB1c2luZyAiVWJ1
bnR1IGNsYW5nIHZlcnNpb24gMTguMS4zICgxdWJ1bnR1MSkiCgpSZWdhcmRzLApBbnVwCgotLSAK
b3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
