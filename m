Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD7DEE368C
	for <opensbi@archiver.kernel.org>; Thu, 12 Feb 2026 14:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ftQdhexqegO97dp3fIqcV1pa+FFbSZ9Aa2gGUshGaMo=; b=ikgMOdQB9nm20e
	wuPyiqcwBz4CWHHEX4LY2TbpBxUyanIKCaCJHgd3zl5L6JJVYBjc6y0ANR+4qD1js22zzrp4enYKS
	MHQZ4FPbJwXe0f5vVBhZKVj7QWukI32wPSskQ9kS4bigNcgqHvsm1V9t/c8vsz32Jm8jivtE64PRe
	1K0eNfZU5s1tdYv4LneyEKjb8WyKwAXUcF3Uem8d4z4IgGhhMsuY8HeA1CxoZbskrr7ArD3mUz8t8
	D3/EgOmW6chxw9nu+k+NhbTHKIB68LPo91Xt87qlx52pMyz99OfGwrMvJ6nKQgj5Ro4kGP4Ku1bFI
	oE1X2bSLiEHIyu16Iu/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqY9m-00000002EYE-49xf;
	Thu, 12 Feb 2026 14:59:02 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqY9i-00000002EXV-3Rb2
	for opensbi@lists.infradead.org;
	Thu, 12 Feb 2026 14:58:59 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-386b4c28ad6so54631821fa.0
        for <opensbi@lists.infradead.org>; Thu, 12 Feb 2026 06:58:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770908336; cv=none;
        d=google.com; s=arc-20240605;
        b=gwdDAPSc3jrCmt21n09HHFHlCjB/kfQ7iNWcnNN/JhRNxRXxx5ORTQYsq71Xn3boLv
         oWhmdxG5klD17ywXQKdu+aRDNXGypfaeqro1zv015tBuj56++sOG+q5qnT1SKp6t3VRd
         2I4bIDdhp2lcUTxsvZnCfd9ahRG0cYSF9h7zQawhWzgpAulHDXkWazd9igCUhwpDxD57
         E5Cjb4tzYNdXyEhrCs4e/EmyA6jkVTV/GhcGxFuP8INU5uKMZBN/lFI5MYivursawC0t
         JuYEx8uemrR2EoagDfHdG+TXAblqIe7UTscPQk7Ft3cPcOuYtKhmJ+P+RcP4b0aBvaXi
         v+dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bsBQH518PDPW+fMyOgg4WalKg/5vK0eRA1cZ1yB6f2o=;
        fh=dwIr1zaVp0ffbAbmPbY3EAbyv1MVjlO49CVzXQ+H2pg=;
        b=IclX1PY4YDd+F9DvE5ycQm9bWxfgP38e++Ru6FPDLWGdzMNSVA2RVUTyyLc3QEf91R
         XzknC6NltX32p8JafVphefwMoYALpR3yBHGv1VAHTQyvFYTCdSKxPT8Q1snhRgfTWsas
         Y4Pi9k4tK0s8lBjFvKmqb/wU5UgUoJEDxzT7oYFsFcMXSze2B/NKaREmQiE/e8W3x94S
         WbTMy1rRHhTLJamWxW+6PWVq9eaPviq3HsvswXOSpo71lxor+v5VdYT9ZovgVv231T1X
         ybc1VSr46TaEjZst8f3UpD0XCxj6IDIBPyMQWusqBDeZYwPrkuKetmSSKN/Q1RhhvqoK
         w2zA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1770908336; x=1771513136; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bsBQH518PDPW+fMyOgg4WalKg/5vK0eRA1cZ1yB6f2o=;
        b=E/a83MGmZwVwzeJ46H+g26r0Mb/pMRSKIlF0IUiE+qa+8vRCdEDzN2azZP3FcZCsYQ
         J+E0RJQ29EmC/vmkuJC8u/jl5WltGSZp/Onm9GG+64IO+hnRb9vhHMMwRtt589jprkXE
         TMcctAIwpdBn4nctA30/N/ucvPwrsdvGq8zxNFo0LnWY3ledmah7j9OesCh15JEPr0e+
         9IlTBC0E5bU+S+ARFvNqPykOYkIReCRKUGxmYzJXBgVei7LsYVXtf1WdFfhBCqZnf99Z
         OB4qsZIqnEuxVz/PILkpz5oK9fu5RXVz2DenkmqYvQxSv0RCJueoUPM5uYoQ1QgAonZv
         rxww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770908336; x=1771513136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bsBQH518PDPW+fMyOgg4WalKg/5vK0eRA1cZ1yB6f2o=;
        b=Z493v8YJr4hkZ0Fec/JWsh/NC5iTnm9PscQM4KnttEK6L2jaBnTVMXtlo4WNOhePnK
         UbjEMxYSMYB3lnZALWlb5QYOIfCKKrk9d5znSeYfIn6rI/OWMuyarVePCBnEnoyatvAR
         LNAJly+k0Iq6wMjDHyB8kiH4oXU76NjZqpfVycWMgfbbte3ct9YTFBzMcJ4hCmpXjH04
         omyaIxHRupe0LBSaplwyETcCOR7r/+yZmbD5A0zWqb3+zXhnkD23/BTjnwvW09G4xD6+
         EgPAR58vz7trby+C0Fsoy3l7qqtKuBZUVKDv6qasYavWhUCPcPBL04RWAFjU9Kzjnw7u
         hlwQ==
X-Gm-Message-State: AOJu0YwUfMNFX4eqHkSiBsNpDdppMhSPej9mJoZnFGJknZPqkNjmCQJI
	KuTs4/ythPJxG2lthfjcwz7TUJVzVDQZQtgeYH5AZWgutSmNsFtStViNai4EB1e6yG8dzEIwYN9
	7A/blm0js0e7hd7rFcuZpt60mrUHzxxE30EZxB8OvIA==
X-Gm-Gg: AZuq6aJ7alcorD90AsZU/7QUbgUCqEGjm0Sv72GzfbiJbU6TnzmLDxnFea81T4nnHSi
	//FN/qabbBs3ER+sIkhdc+qbgwqBK65fpNjrZwStimFmZZABJRbVUymaTCHjEn4n02h7dJNjhhC
	A1Ju8R1DkVXE+vC+NXICyAzx3ZqBcDRgKNAQ5rf8N5DIDoozjy11eB4VF2LYXTCD5mysqkWIcGX
	g6zqTcD2ibw+vWj9DicUcaGne7xl69DytHHHehWLKGMGLhAPBPRhB8g3I6LoUienICKbBMumakt
	/6WcFkwyWjgkXKT/n6O3jv34ybdS6NRdp0OzmPY2CA==
X-Received: by 2002:a05:651c:41ca:b0:387:da4:1664 with SMTP id
 38308e7fff4ca-3871112ba90mr10261591fa.36.1770908335557; Thu, 12 Feb 2026
 06:58:55 -0800 (PST)
MIME-Version: 1.0
References: <20260211100010.4082-1-dave.patel@riscstar.com>
In-Reply-To: <20260211100010.4082-1-dave.patel@riscstar.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 12 Feb 2026 20:28:41 +0530
X-Gm-Features: AZwV_QjPNLimNmcvaUvXqExNdxKTNRvW95i6xC-xMq_liV6GhLXKsax-3SM4ITc
Message-ID: <CAK9=C2UN2kAhXx0RvL07T+a31bYKS=sOnHhmkOBpkmXKproxMg@mail.gmail.com>
Subject: Re: [PATCH] Trap and Emulate changes
To: dave.patel@riscstar.com
Cc: opensbi@lists.infradead.org, Scott Bambrough <scott@riscstar.com>, 
	Ray Mao <raymond.mao@riscstar.com>, Robin Randhawa <robin.randhawa@sifive.com>, 
	Anup Patel <anup.patel@qti.qualcomm.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Anup Patel <anuppate@qti.qualcomm.com>, Dhaval <dhaval@rivosinc.com>, 
	Peter Lin <peter.lin@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_065858_882462_AAD0193D 
X-CRM114-Status: GOOD (  17.91  )
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

T24gV2VkLCBGZWIgMTEsIDIwMjYgYXQgMzozMOKAr1BNIDxkYXZlLnBhdGVsQHJpc2NzdGFyLmNv
bT4gd3JvdGU6Cj4KPiBGcm9tOiBEYXZlIFBhdGVsIDxkYXZlLnBhdGVsQHJpc2NzdGFyLmNvbT4K
Pgo+IFNpZ25lZC1vZmYtYnk6IERhdmUgUGF0ZWwgPGRhdmUucGF0ZWxAcmlzY3N0YXIuY29tPgo+
IC0tLQo+ICBsaWIvc2JpL3NiaV9pbGxlZ2FsX2luc24uYyB8IDI1ICsrKysrKysrKysrKysrKysr
KysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKPgo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9pbGxlZ2FsX2luc24uYyBiL2xpYi9zYmkv
c2JpX2lsbGVnYWxfaW5zbi5jCj4gaW5kZXggZmE4MjI2NGEuLjg4MDc5ZTM5IDEwMDY0NAo+IC0t
LSBhL2xpYi9zYmkvc2JpX2lsbGVnYWxfaW5zbi5jCj4gKysrIGIvbGliL3NiaS9zYmlfaWxsZWdh
bF9pbnNuLmMKPiBAQCAtMTEwLDEwICsxMTAsMzMgQEAgc3RhdGljIGludCBzeXN0ZW1fb3Bjb2Rl
X2luc24odWxvbmcgaW5zbiwgc3RydWN0IHNiaV90cmFwX3JlZ3MgKnJlZ3MpCj4gICAgICAgICBy
ZXR1cm4gMDsKPiAgfQo+Cj4gK3N0YXRpYyBpbnQgc2JpX2dldF9lbXVsYXRlZF9pcnFfaW5zbih1
bG9uZyBpbnNuLCBzdHJ1Y3Qgc2JpX3RyYXBfcmVncyAqcmVncykKPiArewo+ICsgICAgICAgdWxv
bmcgcnMxX3ZhbCAgID0gR0VUX1JTMShpbnNuLCByZWdzKTsKPiArICAgICAgIHVsb25nIHJzMl92
YWwgICA9IEdFVF9SUzIoaW5zbiwgcmVncyk7Cj4gKyAgICAgICAvL3Vsb25nIHByZXZfbW9kZSA9
IHNiaV9tc3RhdHVzX3ByZXZfbW9kZShyZWdzLT5tc3RhdHVzKTsKPiArICAgICAgIHVsb25nIGly
cV92YWw7Cj4gKwo+ICsgICAgICAgLyoKPiArICAgICAgIC8vIFRoaXMgaXMgd2VyZSB0aGUgZW11
YWx0ZWQgaXJxIHZsYXVlIGlzIGZldGNoZWQKPiArICAgICAgIGlmIChwcmV2X21vZGUgPT0gUFJW
X1MgJiYgc2JpX2VtdWxhdGVfaXJxX3JlYWQoJmlycV92YWwpKQo+ICsgICAgICAgICAgICAgICBy
ZXR1cm4gdHJ1bHlfaWxsZWdhbF9pbnNuKGluc24sIHJlZ3MpOwo+ICsgICAgICAgKi8KPiArCj4g
KyAgICAgICAvLyBGb3IgdGVzdGluZwo+ICsgICAgICAgaXJxX3ZhbCA9IHJzMV92YWwgKyByczJf
dmFsOwo+ICsKPiArICAgICAgIFNFVF9SRChpbnNuLCByZWdzLCBpcnFfdmFsKTsKPiArCj4gKyAg
ICAgICByZWdzLT5tZXBjICs9IDQ7Cj4gKwo+ICsgICAgICAgcmV0dXJuIDA7Cj4gK30KPiArCj4g
IHN0YXRpYyBjb25zdCBpbGxlZ2FsX2luc25fZnVuYyBpbGxlZ2FsX2luc25fdGFibGVbMzJdID0g
ewo+ICAgICAgICAgdHJ1bHlfaWxsZWdhbF9pbnNuLCAvKiAwICovCj4gICAgICAgICB0cnVseV9p
bGxlZ2FsX2luc24sIC8qIDEgKi8KPiAtICAgICAgIHRydWx5X2lsbGVnYWxfaW5zbiwgLyogMiAq
Lwo+ICsgICAgICAgc2JpX2dldF9lbXVsYXRlZF9pcnFfaW5zbiwgICAvKiAyICovCgpXZSBjYW4n
dCBwaWNrIGFyYml0cmFyeSBpbnN0cnVjdGlvbiBlbmNvZGluZyBmb3IKdHJhcC1uLWVtdWxhdGlv
biBvZiBhbiBpbnRlcnJ1cHQgY29udHJvbGxlci4KCklmIHRoZSBnb2FsIGlzIHRvIHRyYXAtbi1l
bXVsYXRlIGFuIE1NSU8gZGV2aWNlCnRoZW4gdXNlIFBNUCBiYXNlZCBhY2Nlc3MgZmF1bHRzLgoK
UmVnYXJkcwpBbnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3Bl
bnNiaQo=
