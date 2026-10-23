Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D94606A31A
	for <opensbi@archiver.kernel.org>; Fri, 23 Oct 2026 07:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TFjeB+wO;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=oWo4bcnV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VOkzVzDi4zH6J6umW2LNfa0b+Nq19LkEvjTyDxsHNd4=; b=TFjeB+wOD9lLebISXyA/mqstGm
	V47zUmqXMO4oGTy3k5WErQ09Bf+FLdo2PAN3ISq7qQTDgxCBdCN3EPfJywwja5rjfzZa1FXf81O2h
	LgVxCZgvu32C0OaW46O61F7+FHRU8dPF9xHgNCX/1e/1S4U8wjY4KyIEDZXhZNl2WIxQBA6GXLGik
	EHbdYyQwONIPNlJQuj1iT+YL2rQCX+rrCW9vCGy1Y2JeYI/Jx11UDMBMT79pdRybXCv47oKKVKjsS
	8X70EgM5YrzYFE659MjrIhQNAvT4JUC/3NPFrkvbdcLdFrnMw12qof+mpphovJZNjCIMM5P2+csRE
	Q0mL7o1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKA2y-0000000Fnu6-2q5e;
	Fri, 23 Oct 2026 07:50:40 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKA2w-0000000Fntj-1txW
	for opensbi@lists.infradead.org;
	Fri, 23 Oct 2026 07:50:39 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48afbd2c386so278811f8f.3
        for <opensbi@lists.infradead.org>; Fri, 23 Oct 2026 00:50:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792741836; cv=none;
        d=google.com; s=arc-20260327;
        b=I6yHK/YUjzABNDDMhVQYkIqBgk9awoxeLNtqmfWqNfwoh/eeNaEimCpbzI42lz0Or4
         Y+756H+8XL17Lw19ocm5lYZ58xl7Q6zGgpStNSxMWWAJUy6fkaknOn5DO1aVYiuj0Bui
         TCBlVi7//spF9G+lgd/DIN98gBkuojnFl/uq1FLTr8HasMk3rAAgmhTgKNgJSAqbQzVI
         MJZrD3KmRb19CmlgNVSeKFehVVEEIuge27+87AnDh+csRHjFXatj1w+U05RYDTW6Wpnm
         LGC6PoKJ2bXg0EkHy2jJpm2GrTv+YKXiNlgbW9Fw7TtaVo0RcYriNI1hFrCJ5VYGIVgd
         Hqag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MC1iKuVFLzRVzrNO6zmAcB/PWFNCwnG1VpX7SpS+mLg=;
        fh=JU/8e/U2lsxU6FcHv2RmplRykuLAG/aCOwx5VDrrj7Q=;
        b=pqNVLaua3k2SF+w27a2uCfrtkH5fl7+u2Bqu481jzErZQQSv1jvmcOXeBhuxXaIAHR
         +dv9AKg7J/enmydkIZ8qAdlOZcwxctstpJ2Q7Gg//ltpdC10sIGZOcY/w03+QP7ZQc6M
         x2nLq/XMsNEx0+JMjeTHoqkuQ5Qk4CGFJkwgtywc2eHeWIPlm0F+Vq6oSq/rmZKMl2WV
         mLLhnQfa8ZmYqESNnxZ4RrXhV5bJFvjVOiHwwZTi45Te3s6wBaXfHGOYUJkHS8SmNgna
         sLmCgrYr+31NX9dFuwAyFonD4pl3sJIRLn+fOxCn1l0tjdcWqkqgiN0ZCqM8irfDtR08
         HGFA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792741836; x=1793346636; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MC1iKuVFLzRVzrNO6zmAcB/PWFNCwnG1VpX7SpS+mLg=;
        b=oWo4bcnVtj10DGBatox2HMKggYchGCzPYWUMzQYozsuHDrDGdeQlvuB4bJW9fxIqoS
         u1fqPh9lq2t3km68tIBBfijDFpVJZGBrAEG/CE1ZwE9dnaU+R6vJDi/Baj39rHGlMoPs
         d2DUCNBRodXhk427teFbRG/vRm6BB3boueyb1L9P8qOaQxKRDqg2KDsW6kSdYrPDMr+9
         nBZsHMALssTDucDABLFMxI71vRH9bW/ypAUI/aZPlmm08IgmigvsSMJDfKbNv3WQIrzQ
         y8ZsN/XT+GJmpwxtfyDyWHkRXZqJPgJZtBTau28Vry7y91Sd9ZWdRZmrpFTPRsj4POpo
         cd5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792741836; x=1793346636;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MC1iKuVFLzRVzrNO6zmAcB/PWFNCwnG1VpX7SpS+mLg=;
        b=kdrS9GYkx/qZTCFNJP3gHmkPRl8uHy+EsATefwqmjAXTpLtk5rmsMR3svx4OmqkDTL
         ZzIsLnbXV8wwWEs17emVa+yNxQRGLIbjxfwWmhjVAT11xQxnUmQrFjGITuQs6fghqlJy
         E1VhnIblufsL4fd+DSAjkt+MRg0LX43CTeeVCyLhIE9/a6BgQqZY4YHOSs6QF3LaxT9M
         b4lu9iYfKVH+ncEJHexJ3mFTAvpTRaINOrFRgSgmxA2SZ19yetu+rNHu2havR8r9rKEO
         UFKaRVZ7NJoYAsVer0eWcXFH3hTYswPdYNJkeAr/349QaJB2HXoI4RBrAXP2rgTj+tL9
         D7jQ==
X-Gm-Message-State: AFq9FYIspNoI3u0dOML6sbimXJ7MRbpvr6TDGJ/6zES+aZ51GnjFzpfs
	kQCo6CsVXW4F/Xv0pPQ3N3XFxmK7IGuRXneLZ0B8bm7P7aZquO5EgWB4s8mtLgOuEcm9zb8hxe4
	tr8FvDCnifq/VDl27XTtdxF98YQrjmxrhWCZn3E7oIw==
X-Gm-Gg: AYBFou0BWKnwsQy64ZP1B8S/+F0wqODDXA0UFFw2xyRpayMrKz6eQ7b8PUxUA8kWFJE
	MME/UoPvhbEuEXgIwDGTPBz9VlSeh+Jzpf0NUU4nCNyn7P0KMcRz6fbH4yoTOEOnajcVdMFAoBj
	dcXOX3h+p1dtaTaCNE3SvPAPIWxHgL2ONHXXVIP59pIjbGrJC1AKjY/Cd2kwOkzKDpDfzfCw+k5
	KxZvmd7WGVXbV4bOn6Ww2fywUtEy5/Rd0qAejDkVyGq1vd5SsFxFgirlaUuChB/j1mH1IW7pIvF
	eFPYR7B+bOitxN2b7vQYs4awDHW6SFL4S5phcdQENV/pg63vVmn1WgLTdM3z9RxbuZhoMITdMCx
	f70q7Ea4VQoHD/wgjV7pchKqFZZb87xPZ0Eo25cuz9NrZKHoGEdDwaxJjYOn33GUkAB+nwnWmDE
	eKvJM0udx4gfgbBkvSSGrOuaYondJA0y+NBz52aHJk7H9Hmbx0k4ACEWg=
X-Received: by 2002:a05:6000:1884:b0:48e:932:af01 with SMTP id
 ffacd0b85a97d-48e38598945mr2236127f8f.31.1792741836407; Fri, 23 Oct 2026
 00:50:36 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260831130444.53629-1-pengpeng@iscas.ac.cn>
In-Reply-To: <20260831130444.53629-1-pengpeng@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 23 Oct 2026 13:20:25 +0530
X-Gm-Features: AclHuK83MLnhcMAsSRJtPWRaP7S17zDf6402vX4yYGVJhTDpgauZMLhe3gHtpxc
Message-ID: <CAAhSdy0MDABJewR1eycKoNGd7q7T283aSysUmm9RnbbKbtf0zg@mail.gmail.com>
Subject: Re: [PATCH] lib: utils/mailbox: Reject invalid RPMI queue indices
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: opensbi@lists.infradead.org, Rahul Pathak <rpathak@ventanamicro.com>, 
	Subrahmanya Lingappa <slingappa@ventanamicro.com>, Anup Patel <anup.patel@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_005038_520403_6E72168E 
X-CRM114-Status: GOOD (  18.02  )
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

T24gTW9uLCBBdWcgMzEsIDIwMjYgYXQgNjozNeKAr1BNIFBlbmdwZW5nIEhvdSA8cGVuZ3BlbmdA
aXNjYXMuYWMuY24+IHdyb3RlOgo+Cj4gVGhlIFJQTUkgc2hhcmVkLW1lbW9yeSBoZWxwZXJzIHZh
bGlkYXRlIGEgcXVldWUgaW5kZXggYmVmb3JlIHVzaW5nIGl0Cj4gdG8gc2VsZWN0IHF1ZXVlX2N0
eF90YmwsIGJ1dCB0aGUgY3VycmVudCBjb21wYXJpc29uIGFjY2VwdHMgcXVldWVfaWQKPiBlcXVh
bCB0byBxdWV1ZV9jb3VudC4KPgo+IE9ubHkgZW50cmllcyAwIHRocm91Z2ggcXVldWVfY291bnQg
LSAxIGFyZSBpbml0aWFsaXplZCBmcm9tIHRoZSBkZXZpY2UKPiB0cmVlLiBBY2NlcHRpbmcgcXVl
dWVfY291bnQgY2FuIHRoZXJlZm9yZSB1c2UgYW4gdW5pbml0aWFsaXplZCBxdWV1ZQo+IGNvbnRl
eHQgd2hlbiBhIHByb3RvY29sIG9wZXJhdGlvbiBzZWxlY3RzIGEgcXVldWUgb21pdHRlZCBieSB0
aGUKPiBkZXNjcmlwdGlvbi4KPgo+IFJlamVjdCBxdWV1ZV9pZCBncmVhdGVyIHRoYW4gb3IgZXF1
YWwgdG8gcXVldWVfY291bnQgaW4gYm90aCB0cmFuc2Zlcgo+IGRpcmVjdGlvbnMuCj4KPiBGaXhl
czogOTFmNDZmYjQ3ZWVmICgibGliL3V0aWxzOiBBZGQgUlBNSSBtZXNzYWdpbmcgcHJvdG9jb2wg
YW5kIHNoYXJlZCBtZW1vcnkgdHJhbnNwb3J0IHN1cHBvcnQiKQo+IFNpZ25lZC1vZmYtYnk6IFBl
bmdwZW5nIEhvdSA8cGVuZ3BlbmdAaXNjYXMuYWMuY24+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFu
dXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpBcHBsaWVkIHRoaXMgcGF0Y2ggdG8gdGhl
IHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywKQW51cAoKPiAtLS0KPiAgbGliL3V0aWxzL21h
aWxib3gvZmR0X21haWxib3hfcnBtaV9zaG1lbS5jIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvbGliL3V0
aWxzL21haWxib3gvZmR0X21haWxib3hfcnBtaV9zaG1lbS5jIGIvbGliL3V0aWxzL21haWxib3gv
ZmR0X21haWxib3hfcnBtaV9zaG1lbS5jCj4gaW5kZXggNTIxZTA2NzMuLmM5YjJjNmVmIDEwMDY0
NAo+IC0tLSBhL2xpYi91dGlscy9tYWlsYm94L2ZkdF9tYWlsYm94X3JwbWlfc2htZW0uYwo+ICsr
KyBiL2xpYi91dGlscy9tYWlsYm94L2ZkdF9tYWlsYm94X3JwbWlfc2htZW0uYwo+IEBAIC0zMTMs
NyArMzEzLDcgQEAgc3RhdGljIGludCBzbXFfcngoc3RydWN0IHJwbWlfc2htZW1fbWJveF9jb250
cm9sbGVyICptY3RsLAo+ICAgICAgICAgaW50IHJldCwgcnhyZXRyeSA9IDA7Cj4gICAgICAgICBz
dHJ1Y3Qgc21xX3F1ZXVlX2N0eCAqcWN0eDsKPgo+IC0gICAgICAgaWYgKG1jdGwtPnF1ZXVlX2Nv
dW50IDwgcXVldWVfaWQpIHsKPiArICAgICAgIGlmIChxdWV1ZV9pZCA+PSBtY3RsLT5xdWV1ZV9j
b3VudCkgewo+ICAgICAgICAgICAgICAgICBzYmlfcHJpbnRmKCIlczogaW52YWxpZCBxdWV1ZV9p
ZCBvciBzZXJ2aWNlX2dyb3VwX2lkXG4iLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9f
ZnVuY19fKTsKPiAgICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FSU5WQUw7Cj4gQEAgLTM0OCw3
ICszNDgsNyBAQCBzdGF0aWMgaW50IHNtcV90eChzdHJ1Y3QgcnBtaV9zaG1lbV9tYm94X2NvbnRy
b2xsZXIgKm1jdGwsCj4gICAgICAgICBpbnQgcmV0LCB0eHJldHJ5ID0gMDsKPiAgICAgICAgIHN0
cnVjdCBzbXFfcXVldWVfY3R4ICpxY3R4Owo+Cj4gLSAgICAgICBpZiAobWN0bC0+cXVldWVfY291
bnQgPCBxdWV1ZV9pZCkgewo+ICsgICAgICAgaWYgKHF1ZXVlX2lkID49IG1jdGwtPnF1ZXVlX2Nv
dW50KSB7Cj4gICAgICAgICAgICAgICAgIHNiaV9wcmludGYoIiVzOiBpbnZhbGlkIHF1ZXVlX2lk
IG9yIHNlcnZpY2VfZ3JvdXBfaWRcbiIsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgX19m
dW5jX18pOwo+ICAgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VJTlZBTDsKPiAtLQo+IDIuNTAu
MSAoQXBwbGUgR2l0LTE1NSkKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5z
YmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL29wZW5zYmkK
