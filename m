Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0943BCD98E7
	for <opensbi@archiver.kernel.org>; Tue, 16 Jun 2026 15:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dkR4h7QEANEG1mBjJFXRHz+wVrWKEZ3B/BZMCZCLRQw=; b=Gc8Z54+w6BGizl
	wH4uz2BbdcVTm7rKw9PSDa3sY7sTNBlIy53orwR/URmEDWqP91XejwKwzz0KSKx8P7+fsCcFwm1O9
	bgg4wgF/SPiI7c3++imtilEheCa2YGpLqJZlraz6ud+hgXyCjX86pQOyOvm/m8UkkfXNX0EvS7XUE
	w4Oec+Rjx/B9sRVyEjEW6AWg+4HKxvsHCrGnPAU7G0ckJVi8f6QWP0e3Ouv6bLfh0zt6huayOCHsl
	3VcjSXkK8RwOQOZikSdaes2A9GmFDU+S5FhiZSYQV4DHkBr1ZPwpCQnfEff8qPSRm9AleypYrErEP
	HGl/v3TTup5NGAiNzG0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVOY-0000000Fycm-0iUI;
	Tue, 16 Jun 2026 15:08:06 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVOV-0000000Fybd-2tLQ
	for opensbi@lists.infradead.org;
	Tue, 16 Jun 2026 15:08:04 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-69de9bc590aso3732638eaf.1
        for <opensbi@lists.infradead.org>; Tue, 16 Jun 2026 08:08:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781622483; cv=none;
        d=google.com; s=arc-20240605;
        b=fVoS2bfNl4jb0ER/+p08bOTxSVRlb4hChxfgLaZ6PWr71xj0HQebBsVZSMbjMVvoSO
         ZUP6vB4u2qOIzaBPKuXUKRh+FAYPbJDXr7sZhH5DiQrqTDFdwAg1QzNJyAnxlKxRz2ts
         UVPXXHu3FIHvFJ4IYpqxh2p6X+kLVelJ/Nf9WHGvrw4iCjvr4wpZ8oEKaXGvwdIjCUMf
         fLSOfY3pDhxJU7BGeHO2EFslNG8CfXZsRbd6Db/LwSnQJEPjURzn5Qbu66f4iECYX2Mx
         Bc9DHCPCYRN4JUTjwAm0KrKFVMQKygwFj5Waw2BEtmNRG5KUUn4J1X/h5rSRnQrQ77cU
         FQmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hQIw+cYQSGiRViLqHLLRs/h+fTGwtpjHtJtdDXfSNFA=;
        fh=QKVerMppczEW+goPFb88qM2OhE8k/D/Ra/PAplNT9G8=;
        b=f2qZGEzCu/k4VfxbO4pkXRwZF4Xn3nhE2hB74TUA6xdRYZhkbaYoW4qx+QfgZSutLz
         g1NgEb36h1oK+lBPc/uUoAPVJ1IxhttQWuYIbcJqK+aJc7KFmUsmvN9F1T/ZwDNUYLKw
         +4i+0M43tdp3fV6vzp9VKM5yPWjPmxPJdpXbsQ1oUYCVfqTZmXFIvuPidhggU9qbim/V
         +bbN8c/fpTZ7jL27rvM6XElU+qilDp+9zZWgoyjbkp9Rmg/p+4MCrFEr1yCcXsWHwyz/
         UmWDZdeEXLcX3WMdxvUvXkRE6WuJO5d96UJ/unMhmAQA+gKjKI78N4wUPYHBjqf/60aL
         ax3w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1781622483; x=1782227283; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQIw+cYQSGiRViLqHLLRs/h+fTGwtpjHtJtdDXfSNFA=;
        b=Bm8IKyNBpI7jMOdSm87ejJclVpnQqh50k0uLDWOgQJ3REVksMkvU1i+q7k/ZBBJWel
         NuAMUeFbDQ+bIVbfSx97f0xkUtDa141focm/oj+ovc7+08eR/sVJBPGPWXNjy38ObOm5
         JmdlMrsQjun9ABH6Nkmq5fDh0HFWrGWtbS3Q7N8F8/7eS1+f0oN+zUtK166aj1JYX05Y
         xhMRv36cbqJ7q8qK0L1fG83ayAv6vKeRcylSYbDLwkKGMjrCdjD0rY+jNk+h3WCH3Ujp
         vtFYzhOYjRSSHghzUr5nr5IEeSDINbBsP43HOExyB7ksZQfPpAE036I6Ny0iOStuJamv
         7oeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781622483; x=1782227283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hQIw+cYQSGiRViLqHLLRs/h+fTGwtpjHtJtdDXfSNFA=;
        b=AlBfA92Dgw7zAtIRYb4DPxLx6D1Uv9js8ADpXdyHFqCZ7J5R2oo6FrB9rPEkx87tiY
         nSbqOcAInfxyhsltH9hkgL+THnVMkwZnO101j2vcUWW+PsEz+y0jpyDjgLElsczkCnAi
         fjBjVkL47DFapu4ec6nm7o6CcqLlqMT7Ng1BAeZMRKsrg9I4HdKpoRXkClx3oyjfZTIs
         LqKk2Ql6Vk78gZ+ckEmY6oA10bQmtRQIis0ld//AiYnac6HeLb/gs0nVVoRHQdQkRtlN
         eoLXRLjX6p8GPvv24HrBO5ES/GTpTFuO4bAD8IdHAOvg7C8X0xUTTjckp4Hy1LMdkMVs
         Kqog==
X-Gm-Message-State: AOJu0YyyGXz7QFixoQdODK2ELqkCYJ6xhi89wg6FCVWt2ekfD8cBwbTS
	ICipH5A2rJIhRpghteb5WuSb6W0rEJKS4R00lTJb2Vm8ztcJBGBayPqZ1jK70XJEQK9pgBO/SJ5
	06SStX13aA6j0HBys6Ji2CbN5tCktmKMpipNRZHs5dQ==
X-Gm-Gg: Acq92OHiMo8pTKBNuXd+ZQBnniyhX3pbNAQH9PjDKD0x6Ky077x57+LxJHh0akePP3x
	OAYfEnw3RP0nC56eZz8Cj34GdFtHcXmmF+MoDqGuMQLfLbXya5zOfBr99Rr4ibwkmL4vvPHUiOe
	8EJmJAu5Nvpf8lxHoU62gHYRaz+wksVerSTelyYGj1aGYVGsIhyo/tMVA3MIB5TqG+O34pXD5qt
	96hJ34F1Y0VIv9HGacqmeMVyxDl1Z6L7EqA9SFNErOml5wEZ0IIkUQJvWDLtPEkt9+cOT+EUnM8
	CCMgauI0UbUrbDrXrC7FQnnYXm6lPCoUFN2/KBksDN/p0miDgqzX+N/ygeHHHoMmaYqFHo+T1u4
	TFBNiESuXAUDT76Bley5RNk4Djg==
X-Received: by 2002:a05:6820:1746:b0:69e:df26:ad45 with SMTP id
 006d021491bc7-6a0a447a65bmr2814842eaf.43.1781622482548; Tue, 16 Jun 2026
 08:08:02 -0700 (PDT)
MIME-Version: 1.0
References: <VI0P192MB3062735A6194BB6DA72083499E002@VI0P192MB3062.EURP192.PROD.OUTLOOK.COM>
In-Reply-To: <VI0P192MB3062735A6194BB6DA72083499E002@VI0P192MB3062.EURP192.PROD.OUTLOOK.COM>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 16 Jun 2026 20:37:48 +0530
X-Gm-Features: AVVi8CeVLM2VsrGY6eGnmuoH1uvoC4ClC55QNQz0vw4AZpJYHDYdqSCw9NuJPtk
Message-ID: <CAAhSdy0yOJV9mY2q9TE5_S7g6TK=kGpne9gQukCe7hxjFP_JeQ@mail.gmail.com>
Subject: Re: lib: sbi: Make per-HART stack size configurable via Kconfig
To: "Oriol Catalan | OPENCHIP" <oriol.catalan@openchip.com>
Cc: "opensbi@lists.infradead.org" <opensbi@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_080803_829402_48D78D96 
X-CRM114-Status: GOOD (  16.87  )
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

SGkgT3Jpb2wgQ2F0YWxhbiwKCk9uIFR1ZSwgTWF5IDE5LCAyMDI2IGF0IDI6MjnigK9QTSBPcmlv
bCBDYXRhbGFuIHwgT1BFTkNISVAKPG9yaW9sLmNhdGFsYW5Ab3BlbmNoaXAuY29tPiB3cm90ZToK
Pgo+IGxpYjogc2JpOiBNYWtlIHBlci1IQVJUIHN0YWNrIHNpemUgY29uZmlndXJhYmxlIHZpYSBL
Y29uZmlnCgpObyBuZWVkIHRvIHJlcGVhdCB0aGUgc3ViamVjdCBpbiBwYXRjaCBkZXNjcmlwdGlv
bi4KCj4KPiBUaGUgcGVyLUhBUlQgc3RhY2sgc2l6ZSBmb3IgZXhjZXB0aW9uL2ludGVycnVwdCBo
YW5kbGluZyBpcyBjdXJyZW50bHkKPiBoYXJkY29kZWQgdG8gODE5MiBieXRlcyBpbiBTQklfUExB
VEZPUk1fREVGQVVMVF9IQVJUX1NUQUNLX1NJWkUuIFRoaXMKPiBtYXkgbm90IGJlIHN1ZmZpY2ll
bnQgZm9yIHBsYXRmb3JtcyB3aXRoIGRlZXBlciBjYWxsIHN0YWNrcyAoZS5nLiwgdGhvc2UKPiBl
bmFibGluZyBhZGRpdGlvbmFsIFNCSSBleHRlbnNpb25zKSBvciBtYXkgYmUgd2FzdGVmdWwgZm9y
IG1pbmltYWwKPiBwbGF0Zm9ybXMuCj4KPiBJbnRyb2R1Y2UgYSBIQVJUX1NUQUNLX1NJWkUgS2Nv
bmZpZyBvcHRpb24gaW4gbGliL3NiaS9LY29uZmlnIHdpdGggYQo+IHZhbGlkIHJhbmdlIG9mIDgx
OTIgdG8gMTA0ODU3NiBieXRlcyBhbmQgYSBkZWZhdWx0IG9mIDgxOTIgYnl0ZXMgdG8KPiBwcmVz
ZXJ2ZSBleGlzdGluZyBiZWhhdmlvci4gVGhlIFNCSV9QTEFURk9STV9ERUZBVUxUX0hBUlRfU1RB
Q0tfU0laRQo+IG1hY3JvIG5vdyByZXNvbHZlcyB0byBDT05GSUdfSEFSVF9TVEFDS19TSVpFLCBh
bGxvd2luZyBhbGwgcGxhdGZvcm1zCj4gdG8gYmVuZWZpdCBmcm9tIGEgc2luZ2xlIGNvbmZpZ3Vy
YXRpb24ga25vYiB3aXRob3V0IGFueSBzb3VyY2UgY2hhbmdlcy4KPgo+IFNpZ25lZC1vZmYtYnk6
IE9yaW9sIENhdGFsYW4gPG9yaW9sLmNhdGFsYW5Ab3BlbmNoaXAuY29tPgo+Cj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvc2JpL3NiaV9wbGF0Zm9ybS5oIGIvaW5jbHVkZS9zYmkvc2JpX3BsYXRmb3Jt
LmgKPiBpbmRleCBmZTM4MmI1Ni4uN2VhOWI5NjEgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9zYmkv
c2JpX3BsYXRmb3JtLmgKPiArKysgYi9pbmNsdWRlL3NiaS9zYmlfcGxhdGZvcm0uaAo+IEBAIC0x
NjAsNyArMTYwLDcgQEAgc3RydWN0IHNiaV9wbGF0Zm9ybV9vcGVyYXRpb25zIHsKPiAgfTsKPgo+
ICAvKiogUGxhdGZvcm0gZGVmYXVsdCBwZXItSEFSVCBzdGFjayBzaXplIGZvciBleGNlcHRpb24v
aW50ZXJydXB0IGhhbmRsaW5nICovCj4gLSNkZWZpbmUgU0JJX1BMQVRGT1JNX0RFRkFVTFRfSEFS
VF9TVEFDS19TSVpFICAgODE5Mgo+ICsjZGVmaW5lIFNCSV9QTEFURk9STV9ERUZBVUxUX0hBUlRf
U1RBQ0tfU0laRSAgIENPTkZJR19IQVJUX1NUQUNLX1NJWkUKPgo+ICAvKiogUGxhdGZvcm0gZGVm
YXVsdCBoZWFwIHNpemUgKi8KPiAgI2RlZmluZSBTQklfUExBVEZPUk1fREVGQVVMVF9IRUFQX1NJ
WkUoX19udW1faGFydCkgICAgIFwKPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9LY29uZmlnIGIvbGli
L3NiaS9LY29uZmlnCj4gaW5kZXggYzZjYzA0YmMuLjJmNmZhM2E0IDEwMDY0NAo+IC0tLSBhL2xp
Yi9zYmkvS2NvbmZpZwo+ICsrKyBiL2xpYi9zYmkvS2NvbmZpZwo+IEBAIC0yLDYgKzIsMTEgQEAK
Pgo+ICBtZW51ICJHZW5lcmljIFNCSSBTdXBwb3J0Igo+Cj4gK2NvbmZpZyBIQVJUX1NUQUNLX1NJ
WkUKPiArICAgICAgIGludCAiUGVyLUhBUlQgc3RhY2sgc2l6ZSAoYnl0ZXMpIgo+ICsgICAgICAg
cmFuZ2UgODE5MiAxMDQ4NTc2Cj4gKyAgICAgICBkZWZhdWx0IDgxOTIKPiArCgpJIGFtIG5vdCBz
dXJlIGhvdyB5b3Ugc2VuZCB0aGlzIHBhdGNoLiBJdCBzZWVtcyBhbGwgdGFicyBhcmUgY29udmVy
dGVkCnRvIHNwYWNlcyBhbmQgSSBhbSB1bmFibGUgdG8gYXBwbHkgdGhpcyBwYXRjaC4gSSB3aWxs
IG1hbnVhbGx5IGRvIHRoZQpjaGFuZ2VzIGF0IHRoZSB0aW1lIG9mIG1lcmdpbmcuCgpQbGVhc2Ug
dXNlIGdpdCBmb3JtYXQtcGF0Y2ggZm9yIGdlbmVyYXRpbmcgcGF0Y2hlcyBhbmQgdXNlIGdpdCBz
ZW5kLWVtYWlsCnRvIHNlbmQgcGF0Y2hlcyB0byB0aGUgT3BlblNCSSBtYWlsaW5nIGxpc3QuCgpS
ZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KCkFwcGxpZWQgdGhp
cyBwYXRjaCB0byB0aGUgcmlzY3Yvb3BlbnNiaSByZXBvLgoKVGhhbmtzLApBbnVwCgotLSAKb3Bl
bnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
