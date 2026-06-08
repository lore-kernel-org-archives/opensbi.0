Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BCACD8C9D
	for <opensbi@archiver.kernel.org>; Mon,  8 Jun 2026 12:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/zd2N+mhcL/XNPmiyR7Q1i1jcVWemXoWfV5qNmS0zL0=; b=QN/StJOrMuKFAn
	p3rQ/4lTXCc0TxzZ8B+3cHmTSHcOPCuRfca/e9n8nZsCPEiI3hqQhXKVkJMnqDcuSQdyo7SdQ+b3C
	vvVXHoYfbohAsoiM/5JfXrodyrGPLD7gbtUCAKl6OtefdoTnpq520sQrOkq9gtWfuzm194KK9mzHv
	sVTXwctnewRo6R4VmhlCZvbrUc9pZcLq8GVgbgRqtm8/BQwrWllkeXXNdimHXNDJaMf1XbdqE37MC
	DFOrbQSqPk28LflWVGTediKZgN5NgfpRejpDne8kOCqaa1VCqmd9pvMRWqxCjFdKKMzyqwxo1Y5hw
	CWA75tgvsaeWcuhPbRYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZC2-00000003WOr-12l5;
	Mon, 08 Jun 2026 12:35:02 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZBz-00000003WNF-1u11
	for opensbi@lists.infradead.org;
	Mon, 08 Jun 2026 12:35:00 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5aa6c66e6c5so2562868e87.2
        for <opensbi@lists.infradead.org>; Mon, 08 Jun 2026 05:34:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780922097; cv=none;
        d=google.com; s=arc-20240605;
        b=L4umAZ+NVHQwVj+LAD+w19R5Q9ShJy2oLyt6MLusmDJf/4fSIRcI4uHBPpd+LTt+i8
         Bpwcglf8tZNJiJOFT+Ll/cvfAuOUnaB+M8OlWBlfkmwtk2DZev+w3enfiGizosYiv7Dl
         GQC3hY5Drvm8RndhHUCGEteKGCogwO6cQWnkhLtt+GjZ6yec/601w3/RQrIvIiW4laml
         M05jsne/ma53dhFuWvu6AMebZQ89OdRMkHoi48EzDKVT/amv2F5+J2viuD1eQPxhNpau
         KLJVmlR4pdwCtTPeZXPYloX9LKpYHIqOpnIqPEDy3gjX+DGEqc6J2iVCHnhyyYTSSEHb
         ps0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QycRufy10Z64668fBxXzGYcED9A/nNkWS70xVbsmlLs=;
        fh=KFL2ZnSEuyOnR/Qh1iesqX1KcdxrnTrRWFET+qVGlVQ=;
        b=H3/gSC3uijLmndLY5l7m26qnitJInZaoCE7JixZtVOwo2uyNB4EW/g0PxS/UYXCE0P
         AzjYxwR+lma+H15qNjHBlhc/5CXZrEtuRu9kiiHzkLHfcANE6UIdCOwA4ECKjAiLcZry
         mtDw3xGpMm4nGD4JrO+9uNLfPwX/pNStmHOg+T5RF3E0IUfJcHXggYJ6zOsGxZL2P+D/
         tVbyANyXFFffsPn2QnMWeaeozqVKRrY9aFxCVIChV3VmpFeh2RctZFt45tEMCO8HJopq
         qDYUZ3UDPr5GH6lVY/jsjAhRCfJX68t8Miij4RqauwK1bQnAN/4KeuSm67tCfdG9H5ch
         KYbw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1780922097; x=1781526897; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QycRufy10Z64668fBxXzGYcED9A/nNkWS70xVbsmlLs=;
        b=WwBlLQR/Ljcis3dDSZKjWPpJseiI6ScS9IbxBNAxKudJo0vop1T1EeoCl8vGgxY/sG
         HeVc7QHnvABAiZAy/kyBIQrS/Fe+l07+8z8OdAC8T9QtY+Nw45PLwc0HfROa2In1g+ge
         dYX73c2M2jP8HJlEjoDUZhGvvfIIaPCkjl/bMPP/X7Hv8txXzb7gMfuiCZgYOorwc6Q7
         TSHWXyPQ5wb2fm6m4+R7Xk6Em5ZXgjTclmMD3m6lOI6mfM7m/M+OsK1e5QGE7TI3i/Sr
         cPq7wTNJzlylHrYdLsgKB5uIZ8C5ihtUcv1LnBmlqm1ylqA3fiTwoyIAFjx3h+BfPFZB
         Gmgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780922097; x=1781526897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QycRufy10Z64668fBxXzGYcED9A/nNkWS70xVbsmlLs=;
        b=r9tlgD/vfYlxdTlm/PPFKOybVI7RDUAkMjqAa7ULH8oe5Y3BlC9530x0Uw7otpBDyy
         Vn5TW2ZAEwmPTwAI0PzZnsEkO1L5wVMy740uDrI4c/wmHQmmMjw1NeHKnawV1umO/8fK
         Uh+ELMa8x55DfTY14mUaBRy8IyuZR18xzJtyMhDJSsIa7RHHpJzHNqxKYN7kwYFBDeKA
         EbPa+urOhoadB/NkwXQ0enpi49RWq44TZrbiGGYrMs1F0zEASAvOwNVEyLU9NaKYzgkk
         fUj8OX+6SinVnv2yKcjps2Te/e2/bhpKc93kMC0hbDjyfS3RgsS0HA4QFDJVcRGnA0Kf
         TqBg==
X-Gm-Message-State: AOJu0YxQ/vCdB9Y87LOi3+UO+cge8EQwdFGMuxKYuRDqeOp9Pi4/txo4
	+Sn3Hm/biUVx8wC4TvR0ebkZ1ZY709nrb/c1KSN16coE0t0gaWV9sdjK5XOR6uLV0uc5Lw7Wscr
	ZZgEsQDArSruAvP8DlMQkeZbYvu3VQHw6xckA4hUeFQ==
X-Gm-Gg: Acq92OHO3XYQtIxN9RHmUvSg609xRxiJtn6sXhxW2DqFqwgPat8jqzgCRvB/o4w/bAc
	Gh1oOo/epnR5iGUObcp3FRFqZRWkevxwG/i4eFkHWJzVwKpjlHZTYcjZQXM1wuGZZOTFu09cZry
	33aABeWVPVbZFXRcVcpqaDs0E+h3m7F3htFEcpdVk48+fdokHH+o5+C8s0KucGx+QG3toocDQXa
	lUjOO9XpnYKXDy1Qu+AAkFjxJbFzEu4xt4CAaLJ/b17MBaDqGRT7n51jWQqxuNAcs+mZ+EpwWuZ
	i08CAsSxv6GWH9nhU41tOR5lL6sJ78BIUptlL7XL4Y3fqekG0Dhx
X-Received: by 2002:a05:6512:33ce:b0:5aa:6db6:537 with SMTP id
 2adb3069b0e04-5aa87b7803cmr3904212e87.16.1780922097277; Mon, 08 Jun 2026
 05:34:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260409145716.2611852-1-david.garcia@aheadcomputing.com> <20260409145716.2611852-3-david.garcia@aheadcomputing.com>
In-Reply-To: <20260409145716.2611852-3-david.garcia@aheadcomputing.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 8 Jun 2026 18:04:45 +0530
X-Gm-Features: AVVi8Cday79hgDewSMXCHWbSQdPdVg88NoB2UFuCDcNkWc91zZtnRqxBKtYOn6g
Message-ID: <CAK9=C2WSG=f0QN8Dcxt-Tpvou6gJd_mtLQiK2Wu2vXw3kd3-Tg@mail.gmail.com>
Subject: Re: [PATCH 2/2] include: mailbox: Update RPMI notification structs
 and add Performance event definitions
To: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_053459_528656_2F336D21 
X-CRM114-Status: GOOD (  18.10  )
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
ZGF2aWQuZ2FyY2lhQGFoZWFkY29tcHV0aW5nLmNvbT4gd3JvdGU6Cj4KPiBBZGQgUlBNSSBub3Rp
ZmljYXRpb24gaGVhZGVyIHNpemUgYW5kIG9mZnNldCBtYWNyb3MsIGFuZCBldmVudCBoZWFkZXIK
PiBjb21wb3NpdGlvbiBtYWNyby4gQWRkIHJwbWlfZXZlbnRfbm90aWZpY2F0aW9uX3N0YXRlIGVu
dW0gd2l0aCBkaXNhYmxlLAo+IGVuYWJsZSwgYW5kIHJldHVybiBjdXJyZW50IHN0YXRlIElEcy4g
QWRkIHJlcV9zdGF0ZSBmaWVsZCB0bwo+IHJwbWlfZW5hYmxlX25vdGlmaWNhdGlvbl9yZXEgYW5k
IGN1cnJlbnRfc3RhdGUgZmllbGQgdG8KPiBycG1pX2VuYWJsZV9ub3RpZmljYXRpb25fcmVzcCBm
b3IgUlBNSSBzcGVjIGNvbXBsaWFuY2UuCj4KPiBBZGQgbm90aWZpY2F0aW9uIGV2ZW50IElEIGVu
dW0gYW5kIGRhdGEgc3RydWN0dXJlcyBmb3IgUlBNSSBQZXJmb3JtYW5jZQo+IHNlcnZpY2UgZ3Jv
dXAgZXZlbnRzOiBwb3dlciBjaGFuZ2UsIGxpbWl0IGNoYW5nZSwgYW5kIGxldmVsIGNoYW5nZS4K
Pgo+IFNpZ25lZC1vZmYtYnk6IERhdmlkIEUuIEdhcmNpYSBQb3JyYXMgPGRhdmlkLmdhcmNpYUBh
aGVhZGNvbXB1dGluZy5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvc2JpX3V0aWxzL21haWxib3gvcnBt
aV9tc2dwcm90LmggfCA0OSArKysrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5n
ZWQsIDQ5IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3NiaV91dGlscy9t
YWlsYm94L3JwbWlfbXNncHJvdC5oIGIvaW5jbHVkZS9zYmlfdXRpbHMvbWFpbGJveC9ycG1pX21z
Z3Byb3QuaAo+IGluZGV4IGMzNTc4OGYwLi44NTI2YWNlMyAxMDA2NDQKPiAtLS0gYS9pbmNsdWRl
L3NiaV91dGlscy9tYWlsYm94L3JwbWlfbXNncHJvdC5oCj4gKysrIGIvaW5jbHVkZS9zYmlfdXRp
bHMvbWFpbGJveC9ycG1pX21zZ3Byb3QuaAo+IEBAIC04Nyw2ICs4NywxOCBAQAo+ICAjZGVmaW5l
IFJQTUlfREVGX1RYX1RJTUVPVVQgICAgICAgICAgICAgICAgICAgIDIwCj4gICNkZWZpbmUgUlBN
SV9ERUZfUlhfVElNRU9VVCAgICAgICAgICAgICAgICAgICAgMjAKPgo+ICsvKiogUlBNSSBOb3Rp
ZmljYXRpb24gaGVhZGVyIHNpemUgKi8KPiArI2RlZmluZSBSUE1JX05PVElGX0hEUl9TSVpFIDE2
Cj4gKwo+ICsvKiogUlBNSSBOb3RpZmljYXRpb24gaGVhZGVyIG9mZnNldHMgKi8KPiArI2RlZmlu
ZSBSUE1JX05PVElGX0hEUl9SRU1BSU5JTkdfT0ZGU0VUIDB4MDAKPiArI2RlZmluZSBSUE1JX05P
VElGX0hEUl9SRVRVUk5FRF9PRkZTRVQgMHgwNAo+ICsjZGVmaW5lIFJQTUlfTk9USUZfSERSX0xP
U1RfT0ZGU0VUIDB4MDgKPiArI2RlZmluZSBSUE1JX05PVElGX0hEUl9SRVNFUlZFRF9PRkZTRVQg
MHgwQwoKVGhlc2UgYWJvdmUgUlBNSV9OT1RJRl9IRFJfeHl6IGRlZmluZXMgYXJlIG5vdCBwYXJ0
Cm9mIHRoZSBSUE1JIHNwZWNpZmljYXRpb24uIFJhdGhlciB0aGVzZSBhcmUgZGVmaW5lZCBieSB0
aGUKU0JJIE1QWFkgZXh0ZW5zaW9uLiBQbGVhc2UgYWRkIHRoZXNlIGFzIHBhcnQgb2YgdGhlCnNi
aV9lY2FsbF9pbnRlcmZhY2UuaCBhbmQgZHJvcCBmcm9tIHRoaXMgcGF0Y2guCgo+ICsKPiArLyoq
IFJQTUkgTm90aWZpY2F0aW9uIGV2ZW50IGhlYWRlciBjb25zdHJ1Y3RvciAqLwo+ICsjZGVmaW5l
IFJQTUlfTk9USUZfRVZFTlRfSERSKGVpZCwgZGxlbikgKCh1MzIpKGVpZCkgPDwgMTYpIHwgKCh1
MzIpKGRsZW4pICYgMHhGRkZGKQo+ICsKPiAgLyoqCj4gICAqIENvbW1vbiBtYWNybyB0byBnZW5l
cmF0ZSBjb21wb3NpdGUgdmVyc2lvbiBmcm9tIG1ham9yCj4gICAqIGFuZCBtaW5vciB2ZXJzaW9u
IG51bWJlcnMuCj4gQEAgLTIzMiwxNCArMjQ0LDI0IEBAIGVudW0gcnBtaV9zZXJ2aWNlZ3JvdXBf
aWQgewo+ICAgICAgICAgUlBNSV9TUlZHUlBfVkVORE9SX0VORCA9IDB4RkZGRiwKPiAgfTsKPgo+
ICsvKiogUlBNSSBldmVudCBub3RpZmljYXRpb24gc3RhdGUgSURzICovCj4gK2VudW0gcnBtaV9l
dmVudF9ub3RpZmljYXRpb25fc3RhdGUgewo+ICsgICAgICAgUlBNSV9FVkVOVF9OT1RJRl9ESVNB
QkxFX1NUQVRFID0gMCwKPiArICAgICAgIFJQTUlfRVZFTlRfTk9USUZfRU5BQkxFX1NUQVRFID0g
MSwKPiArICAgICAgIFJQTUlfRVZFTlRfTk9USUZfUkVUX0NVUlJfU1RBVEUgPSAyLAo+ICsgICAg
ICAgUlBNSV9FVkVOVF9OT1RJRl9NQVhfQ09VTlQgPSAzLAo+ICt9Owo+ICsKPiAgLyoqIFJQTUkg
ZW5hYmxlIG5vdGlmaWNhdGlvbiByZXF1ZXN0ICovCj4gIHN0cnVjdCBycG1pX2VuYWJsZV9ub3Rp
ZmljYXRpb25fcmVxIHsKPiAgICAgICAgIHUzMiBldmVudGlkOwo+ICsgICAgICAgdTMyIHJlcV9z
dGF0ZTsKPiAgfTsKPgo+ICAvKiogUlBNSSBlbmFibGUgbm90aWZpY2F0aW9uIHJlc3BvbnNlICov
Cj4gIHN0cnVjdCBycG1pX2VuYWJsZV9ub3RpZmljYXRpb25fcmVzcCB7Cj4gICAgICAgICBzMzIg
c3RhdHVzOwo+ICsgICAgICAgdTMyIGN1cnJlbnRfc3RhdGU7Cj4gIH07Cj4KPiAgLyoqIFJQTUkg
QmFzZSBTZXJ2aWNlR3JvdXAgU2VydmljZSBJRHMgKi8KPiBAQCAtODQ2LDYgKzg2OCwzMyBAQCBl
bnVtIHJwbWlfcGVyZm9ybWFuY2Vfc2VydmljZV9pZCB7Cj4gICAgICAgICBSUE1JX1BFUkZfU1JW
X01BWF9DT1VOVCwKPiAgfTsKPgo+ICsvKiogUlBNSSBQZXJmb3JtYW5jZSBTZXJ2aWNlR3JvdXAg
Tm90aWZpY2F0aW9uIEV2ZW50IElEcyAqLwo+ICtlbnVtIHJwbWlfcGVyZm9ybWFuY2VfZXZlbnRf
aWQgewo+ICsgICAgICAgUlBNSV9QRVJGX0VWRU5UX1BPV0VSX0NIQU5HRSA9IDB4MDEsCj4gKyAg
ICAgICBSUE1JX1BFUkZfRVZFTlRfTElNSVRfQ0hBTkdFID0gMHgwMiwKPiArICAgICAgIFJQTUlf
UEVSRl9FVkVOVF9MRVZFTF9DSEFOR0UgPSAweDAzLAo+ICsgICAgICAgUlBNSV9QRVJGX0VWRU5U
X01BWF9DT1VOVCwKPiArfTsKPiArCj4gKy8qKiBSUE1JIFBlcmZvcm1hbmNlIHBvd2VyIGNoYW5n
ZSBub3RpZmljYXRpb24gZGF0YSAqLwo+ICtzdHJ1Y3QgcnBtaV9wZXJmX2V2ZW50X3Bvd2VyX2No
YW5nZSB7Cj4gKyAgICAgICB1MzIgZG9tYWluX2lkOwo+ICsgICAgICAgdTMyIHBvd2VyX3V3Owo+
ICt9Owo+ICsKPiArLyoqIFJQTUkgUGVyZm9ybWFuY2UgbGltaXQgY2hhbmdlIG5vdGlmaWNhdGlv
biBkYXRhICovCj4gK3N0cnVjdCBycG1pX3BlcmZfZXZlbnRfbGltaXRfY2hhbmdlIHsKPiArICAg
ICAgIHUzMiBkb21haW5faWQ7Cj4gKyAgICAgICB1MzIgbWF4X2xldmVsOwo+ICsgICAgICAgdTMy
IG1pbl9sZXZlbDsKPiArfTsKPiArCj4gKy8qKiBSUE1JIFBlcmZvcm1hbmNlIGxldmVsIGNoYW5n
ZSBub3RpZmljYXRpb24gZGF0YSAqLwo+ICtzdHJ1Y3QgcnBtaV9wZXJmX2V2ZW50X2xldmVsX2No
YW5nZSB7Cj4gKyAgICAgICB1MzIgZG9tYWluX2lkOwo+ICsgICAgICAgdTMyIGxldmVsOwo+ICt9
Owo+ICsKPiAgc3RydWN0IHJwbWlfcGVyZl9nZXRfbnVtX2RvbWFpbl9yZXNwIHsKPiAgICAgICAg
IHMzMiBzdGF0dXM7Cj4gICAgICAgICB1MzIgbnVtX2RvbWFpbnM7Cj4gLS0KPiAyLjQzLjAKPgo+
Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9y
Zwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoK
T3RoZXJ3aXNlLCB0aGlzIGxvb2tzIGdvb2QgdG8gbWUuCgpSZXZpZXdlZC1ieTogQW51cCBQYXRl
bCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClRoYW5rcywKQW51cAoKLS0gCm9wZW5zYmkgbWFpbGlu
ZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
