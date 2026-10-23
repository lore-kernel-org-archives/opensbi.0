Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA599606A31A
	for <opensbi@archiver.kernel.org>; Fri, 23 Oct 2026 07:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A95U2Tjy;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=Ro5guV9G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ASMqLBq62YDC/ol6l4hB2m4RsfO67Xhe2MYPKTYjADk=; b=A95U2Tjy/4uVTLyxD3KsccRCtz
	AbD+TaT/ug0iMpv/VYIRX6e1U22UOf0oJNbujLekfpItE+XZFRtHfyRSzjzpaPMN9psNsfq541hn6
	Fiu5r9R1xmqYfn6o/tkkJ98ySzPXyzvLmGNjD6mMMz5DGySGO2Voy69sCEpHY/zTrc0wRU0xVTupU
	lX8y3y+67O2OJV4gYGwT/+OkYGvtQjvBkGP7MaxJWpxr+ekosWjzlA3ht3+EQ4LJoGeMlbMjuCNwp
	K/gQojfyz5GeSAad/yH2QhbpNVRNt0X66x0dyn8ExXHef9YCgYz7h5Zz10V94duNOMkwkEcxHxvQA
	CEMyoLAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9lZ-0000000FkxC-3sdn;
	Fri, 23 Oct 2026 07:32:41 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9lY-0000000FkwC-0JKB
	for opensbi@lists.infradead.org;
	Fri, 23 Oct 2026 07:32:41 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48df54150dfso256303f8f.0
        for <opensbi@lists.infradead.org>; Fri, 23 Oct 2026 00:32:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792740758; cv=none;
        d=google.com; s=arc-20260327;
        b=MN3NuFFnjqBerM53b0fYs9lnJUDj0Pcj8ZpESTRhQ1wBBM5LrMvxX1xUb3VJ31UKjH
         mzggCjaIgNeTm9+2ML019ooA78mBQys4T2zBIw/V8lvehQUDPqpmPfKQs56S+E+w1dwi
         9Kbgoy8LPNXDSQat0AYvP0H32c4/nblAhNT8T+lkDf8mEKSJdPH9HC4kdOPzEptf6MWh
         ERshOSG/7AcjiCQddaVIJ6c3v7sKbXnwbltdyi96DhCJA3OByGB2aXAy8FJzUpuArddJ
         iXHfCsdcnArzCfVhLqn2RBueDA72zlgae0hvZfI4+QR2mVaslm13NKXH8ZOtOd4wVRJ2
         VSEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wEEOS0m+HcUQe+kok39D9JUQaPadDSeao1fqZprM8dQ=;
        fh=lK/KTU26W6wgu1ADaxpRrpX5U/CVEcDveBZxEYdzEMM=;
        b=GLxAJ/+582ucUZkugCG+eQjvCCkLDmz0YkmDH2exaB5Q//MuRgMW3UTuFrg1s4m9Dh
         bUsREpbUShshQTb2Z1b0SQa1iBFw9P6traQlVFheRCXCIxR0zT5w+/NSuACf53EuxL7U
         Z6GnBbvIp0X0SCd5yYsjB9z/pKuSPzaApBSqm9PnhEWxKSXIDqKdRMxJm2TVpOMTirRD
         IpbVI06JTAAPYbc8TtuFhnQHO8Cr8DsmW2bSDoSaImPQ9nemMn/hTS9QgDszaLDwsD3e
         4KjJk6i24Yl3hR5295f1Dw8AHP+0tbiQ0FiK1MDaYp8q136AZDUtBcvs3AKe9OoGAj9l
         0ugw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792740758; x=1793345558; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wEEOS0m+HcUQe+kok39D9JUQaPadDSeao1fqZprM8dQ=;
        b=Ro5guV9GhBxmkdevlFSVtLotujoWckkkpQNBt971J6M/JUatiCT3hOoFpKoxEtiMSz
         /w36G5a/Yoc9gWIo3rW/+XCuHRjWl30prwDNSLuMyOFUma3OsOfaBGt1sqV8rD8Qn9Tv
         j2aiF61ef4tXDVXCq6TpKUSxN/3FwGJgkwWQetpnnj0AbySbO0FVTBTEX+CVW2+9/qIf
         LLDYJ+l5J+TKk0kCdCKuw3LL99eojbjlReFZ8neJF0J3Adb43zhv4pEECACd3JY2lRWO
         ECRu4Pe3RF8STH6l+GGIB73faaaORBm5OY16BHNNZDxYdt51tICDgOvp/ff6Q8VP/bRg
         OzuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792740758; x=1793345558;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wEEOS0m+HcUQe+kok39D9JUQaPadDSeao1fqZprM8dQ=;
        b=Fhyj4baWIgUpGu1+O0g6jHWlFpvuCBHO+yY3Kx6kO6YZb4iomN0OEKXyKfhR8419HC
         Ok/5uKk8Ex5NbTVhayRkoe897WJhBqn9fUqfoQLx611DuR0kdBCtlzYz3o3oEMsGlpUU
         hE+kM2mlDvi7vf76kvZrqqaCNUcUIFE3585RkwC6Om4f3lA3L0Ar4PYw97Z4ZI0awrGP
         KSeN/rjP+MCVs0fwnWv4flgaGpunyGI+mfvP8MS/gwxIkHznkx+/oyQH0ZVW8Q+cKXcE
         8U7l+FbzirFdjY9Hpml/F1VfBpLOSROYW6WyoF5+OlMiVOnMmIComeCpVq3SryvPw5g+
         d1mg==
X-Gm-Message-State: AFq9FYLU7Ke7X9s+d8aTM6tMRqJn2ByuCV2oFpCXbBmcJE0a+0S3vKak
	eu3kULiWerS0NYGkmPMnbvl/aWfIzTFAOHFOJolpFzTDvAF1UFgoTHBJCTpOmeOUxaCnLQqsTIp
	mZ7RVn41M6gEhkX9nLSBTCAvrE3JRrCNiCp+00E4FWA==
X-Gm-Gg: AYBFou2FCayBCeL94QIxPpO7xJ/yC9+3sI38R7vbODvdMspII0C99S8CHLvfxRtVXfQ
	krg4G5PL7Hpg7PbB6EWrZC+Ug6OOswHV6JeGucU5p1aeo7/6wnkk/30XCxyd/pDbynP5ECkWCcl
	4saHRxE9UYEmFqysuhH5v7/TDOW/vnbGT79NmHUuCKQFgmuDu33KH65gBE4dZ8qvPf9ECLpEGyy
	GFglE2TFaZtgvSvKsJFIUZyV7y6lnAxDACJfbOn7Iy/Xi461pVsGnw0WdE6AeevwO+2Mlmf1kZm
	XC4NQJentPh7qUiTah7n0sYUJyzZGAgaFRNBhVZbB1r8yAhOv/DWqVvOWCUyfsIKe1NWrgBCbyA
	FKwVJactkBM30Ovvt+npeXsoZOsp7bUzv29ahiWhkmdFyh1iW1qzH6G/OAFFyb2h4dNrnEi0HSg
	FR4hwvCOP7bRNwr/ZSUMbvh2Difqm0g7iKGDVRJcLaBuqMF7fuGzfW0Nw=
X-Received: by 2002:adf:e004:0:10b0:48d:f7f9:6a29 with SMTP id
 ffacd0b85a97d-48e385a28bfmr1266800f8f.20.1792740758121; Fri, 23 Oct 2026
 00:32:38 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260828142354.13035-1-pengpeng@iscas.ac.cn>
In-Reply-To: <20260828142354.13035-1-pengpeng@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 23 Oct 2026 13:02:26 +0530
X-Gm-Features: AclHuK9GZKRZqoc1H6yMm1rAGMMqgZegmHwtgYsXzmjjK8rynTEZSWklpOYaeEE
Message-ID: <CAAhSdy2FJpJ=Ru-5a96scY81OT1KSiCxu8H4vfuOyXZpeWq=hg@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: use unsigned masks for HPM counter 31
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: opensbi@lists.infradead.org, Anup Patel <anup.patel@oss.qualcomm.com>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Atish Patra <atishp@rivosinc.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, Inochi Amaoto <inochiama@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_003240_148169_EB3AC859 
X-CRM114-Status: GOOD (  16.27  )
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

T24gRnJpLCBBdWcgMjgsIDIwMjYgYXQgNzo1NOKAr1BNIFBlbmdwZW5nIEhvdSA8cGVuZ3BlbmdA
aXNjYXMuYWMuY24+IHdyb3RlOgo+Cj4gVGhlIEhQTSBmZWF0dXJlIGRldGVjdG9yIGFuZCBDU1Ig
ZW11bGF0b3IgYnVpbGQgbWhwbV9tYXNrIGJpdHMgd2l0aCBhCj4gcGxhaW4gc2lnbmVkIDEuIEJv
dGggbWFjcm8gZmFtaWxpZXMgZXhwYW5kIHRocm91Z2ggY291bnRlciAzMSwgc28gdGhlCj4gbGFz
dCBleHBhbnNpb24gZXZhbHVhdGVzIDEgPDwgMzEgYW5kIHNoaWZ0cyBhIHNpZ25lZCBpbnQgaW50
byBpdHMgc2lnbgo+IGJpdC4KPgo+IFVzZSBCSVQoKSBhdCBib3RoIHNpdGVzLiBUaGUgbWFzayBp
cyB1bnNpZ25lZCBhbmQgYml0IDMxIGlzIHBhcnQgb2YgdGhlCj4gcmVwcmVzZW50ZWQgSFBNIGNv
dW50ZXIgc2V0Lgo+Cj4gRml4ZXM6IGM3NDRlZDc3YjE4YyAoImxpYjogc2JpX3BtdTogRW5hYmxl
IG5vbmNvbnRpZ291cyBocG0gZXZlbnQgYW5kIGNvdW50ZXJzIikKPiBGaXhlczogZWUxZjgzY2E4
NDhkICgibGliOiBzYmlfcG11OiByZW1vdmUgbWhwbV9jb3VudCBmaWVsZCBpbiBoYXJ0IGZlYXR1
cmUiKQo+IFNpZ25lZC1vZmYtYnk6IFBlbmdwZW5nIEhvdSA8cGVuZ3BlbmdAaXNjYXMuYWMuY24+
CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpB
cHBsaWVkIHRoaXMgcGF0Y2ggdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywKQW51
cAoKPiAtLS0KPiAgbGliL3NiaS9zYmlfZW11bGF0ZV9jc3IuYyB8IDIgKy0KPiAgbGliL3NiaS9z
YmlfaGFydC5jICAgICAgICB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfZW11bGF0ZV9j
c3IuYyBiL2xpYi9zYmkvc2JpX2VtdWxhdGVfY3NyLmMKPiBpbmRleCBjMjI1M2M4Mi4uNWQzYTZl
OWQgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfZW11bGF0ZV9jc3IuYwo+ICsrKyBiL2xpYi9z
Ymkvc2JpX2VtdWxhdGVfY3NyLmMKPiBAQCAtMTAzLDcgKzEwMyw3IEBAIGludCBzYmlfZW11bGF0
ZV9jc3JfcmVhZChpbnQgY3NyX251bSwgc3RydWN0IHNiaV90cmFwX3JlZ3MgKnJlZ3MsCj4KPiAg
I2RlZmluZSBzd2l0Y2hjYXNlX2hwbShfX3VyZWYsIF9fbXJlZiwgX19jc3IpICAgICAgICAgICAg
ICAgICAgICAgICAgICBcCj4gICAgICAgICBjYXNlIF9fY3NyOiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+IC0gICAgICAgICAgICAgICBpZiAo
c2JpX2hhcnRfbWhwbV9tYXNrKHNjcmF0Y2gpICYgKDEgPDwgKF9fY3NyIC0gX191cmVmKSkpXAo+
ICsgICAgICAgICAgICAgICBpZiAoc2JpX2hhcnRfbWhwbV9tYXNrKHNjcmF0Y2gpICYgQklUKF9f
Y3NyIC0gX191cmVmKSkgIFwKPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VO
T1RTVVBQOyAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gICAgICAgICAgICAgICAgIGlm
ICghaHBtX2FsbG93ZWQoX19jc3IgLSBfX3VyZWYsIHByZXZfbW9kZSwgdmlydCkpICAgICAgXAo+
ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBTQklfRU5PVFNVUFA7ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfaGFydC5jIGIvbGli
L3NiaS9zYmlfaGFydC5jCj4gaW5kZXggYmVlODg1NTcuLjhlNGMzNmQwIDEwMDY0NAo+IC0tLSBh
L2xpYi9zYmkvc2JpX2hhcnQuYwo+ICsrKyBiL2xpYi9zYmkvc2JpX2hhcnQuYwo+IEBAIC01MTIs
NyArNTEyLDcgQEAgc3RhdGljIGludCBoYXJ0X2RldGVjdF9mZWF0dXJlcyhzdHJ1Y3Qgc2JpX3Nj
cmF0Y2ggKnNjcmF0Y2gsIGJvb2wgY29sZF9ib290KQo+ICAgICAgICAgaWYgKCF0cmFwLmNhdXNl
KSB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICAg
ICAgICAgICAgICAgICBjc3Jfd3JpdGVfYWxsb3dlZChfX2NzciwgJnRyYXAsIDFVTCk7ICAgICAg
ICAgICAgICAgICAgICAgXAo+ICAgICAgICAgICAgICAgICBpZiAoIXRyYXAuY2F1c2UgJiYgY3Ny
X3N3YXAoX19jc3IsIG9sZHZhbCkgPT0gMVVMKSB7ICAgICAgXAo+IC0gICAgICAgICAgICAgICAg
ICAgICAgIChoZmVhdHVyZXMtPl9fbWFzaykgfD0gMSA8PCAoX19jc3IgLSBDU1JfTUNZQ0xFKTsg
XAo+ICsgICAgICAgICAgICAgICAgICAgICAgIChoZmVhdHVyZXMtPl9fbWFzaykgfD0gQklUKF9f
Y3NyIC0gQ1NSX01DWUNMRSk7ICAgXAo+ICAgICAgICAgICAgICAgICB9ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICAgICAgICAgfQo+
Cj4KPiBiYXNlLWNvbW1pdDogNGU3OWZkN2RlNTlmMWIyODk5MDkyYzFhODRjZTY4YzhlYmM2OGY5
Mwo+IC0tCj4gMi40My4wCj4KPgo+IC0tCj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBvcGVuc2Jp
QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL29wZW5zYmkKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9vcGVuc2JpCg==
