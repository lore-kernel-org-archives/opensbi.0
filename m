Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABA0606A31A
	for <opensbi@archiver.kernel.org>; Fri, 23 Oct 2026 05:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oKKYZehI;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=AtfmngEh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VlK0a9B9ev5a1YxuZqppvGatHGKcWxVxOFTtgBKDw5s=; b=oKKYZehI79EPQvkQFMMVh84djp
	kTbZAN8/Ly9B0UqZxFd97loT9geIYn43r0GmCHv3wOFV4I70IrzB7yBLc0jduNCeHd+DLKsjJ/Ake
	fA88zlvs0IgglYX7MsnxGGKof8FyAVnELNYmNs0SPle2wFU5GTOfBz5fIbtzNHeVXLb8c6yqbnWdy
	3q/MVp0Dmd+hKHMa0Jp1d4P/D+3wjwOc8JZiTWJW94I3KKStATiaxsxcO2HK7Nyil67jtjn/fuM0b
	mQEEbOq8xt4650i2Nk3j3QsF6kVmHAaz7nZ796S/3jgUDL9d5vBA6O/T3FU8CCNQJIaTBRKd33ltl
	yEivzy3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8Ic-0000000FYJx-39VI;
	Fri, 23 Oct 2026 05:58:42 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8Ia-0000000FYJU-3J8Z
	for opensbi@lists.infradead.org;
	Fri, 23 Oct 2026 05:58:42 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-487049569b6so235956f8f.1
        for <opensbi@lists.infradead.org>; Thu, 22 Oct 2026 22:58:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792735118; cv=none;
        d=google.com; s=arc-20260327;
        b=nKOkMyFk3b2yl0B4qFsqrBOyjHbnwWuiLrbPlLKiUI5TFqT+cilQe3KjP1V+/tNRUJ
         TwnnadZtQ3i8G5hkkqkz4YVcfYeMtUFTE81AeyeEoX8GIUM/ND/nHid/h55W04BKK1ZV
         6Xs3XwGTzukMD3Ay+wPd8VTNBJ0y9PKHBcVCrEN3U3AWJVg9jBc02jrM8V7UI8sS1CHb
         Wb7vK1zG7a2EWNm2fnzzYAKznl/4vO/C12J36ODUsWkapyTTrvpI0oS7FMhzQ09L277u
         AiKqjU/YkOdJtn1j4XC7LTpZCCoCttRDqqTsoVmmxtS0h1Xsg0jPnvzaAdhEYloHwMh+
         hxrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RjOpZSRCHYSnMoPuWtBZw9WagpbUjcyWjhPkTqt/vGg=;
        fh=DvUZaCZeGFM/iKDgemEdcvjZTXBGU6zmoXACXNg+ctg=;
        b=nhW8ZyaxtfeQ1Ns3hfRS+RYSoKMl82z5Bg+WiiflwLN9ld9DNYsZoR1oBNkubRgby7
         vW/iIlcn4908vZE62qbGI8JD2uazYc5umoDXUS1fw7EPihGUYxqFxtjNdY4iRFAQKSMI
         eMGlV0ORLeSdmCPDabGonp0mkJx+5VEJ3b1H7NuXb92n5iGVIH8IpydCRBNK1Wp57CHL
         frUSAYHZZPZO1O6AQO4J7dL82jqSWFotV8+utEUtA1T++Uo3T4wFrcBHDe0/iX300rOf
         xeMf5zDiyTv1xNGhh58HuzyQHnhyDYB9rZMtIeeAAdC4vExIip/ojJp3I5JG6Z21gi6z
         WPSw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792735118; x=1793339918; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RjOpZSRCHYSnMoPuWtBZw9WagpbUjcyWjhPkTqt/vGg=;
        b=AtfmngEh2S6sS5ig6e2dOD8uVU0y5d8RlEq3LM+2bJrO6XnxP1Cx0BPkp2XviWG9F/
         +Y56M84I/bOffuasF4hLk1JxwK9uvTalvctmsZWInaVjMOm9/y3hYQ2Pviee44eh8ZtP
         gOiR0y3Sx2lSxx6WjPsTGbtPgbVX+IKJtLKkLsN31T7qotcOPhtzp5Inix76iAc7lV6v
         CfV7ED5RuleytmIMuwNTtOObypNyDMNDCLMbxvRa3Pr4g5O7+5ZCCin7Cj7vi+yhKgQT
         dyZaJKHqV/udjt0BfSro+hwQeILd0GbnmhGpKWxhWu6qup/EYFNMyc95lFGAr35N/0bL
         0mfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792735118; x=1793339918;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RjOpZSRCHYSnMoPuWtBZw9WagpbUjcyWjhPkTqt/vGg=;
        b=rjZHSzHEeI/I6A90NzzSLj3uSqlZRnq19lhh7McKT0TxB1lp8TxUuMeKnXOncD6yA1
         MjdLQga4JwY3CqLd+sbzij4tUnBc4M9Vh+3k2gJjQQEomuowm2I4kLK/e6fo5XWN53DD
         zFkXdwF/c2Xq5UJiIgzDii4pzOG1s7Vz/0FtDSvlx4Ik14dmUtRyvN9DcnyI1NBDF9kF
         bMRCze/Dp9/+Wk3TZMYTHcW8kEEpvcxkV08Qc8e1Bes6KoZFkKauphRuBkrVzZUQvVsZ
         e5+O9Ul4IG22X50uoBR2o5fevv1Tqgdo70j/UFjyZLooHzCyw83e6Oc2ZEGVpE8XhGOH
         h2Aw==
X-Gm-Message-State: AFq9FYL4ecjEEztkyjGyLDzL0S1vMOiNgiH8A6oFEOrCqMKtvd4hQM8T
	yJBxCx0n6ZodKSCsqNqhW4ikn5gnhpgxCxTXGBE20jwTZ0izdGiT4+Jz5/wS7VfJUokfRP8Lxo3
	my6FoOouEm8WUVf0RYAi0bP3LOPkPJ6J70h7s5xUH0SE3IKdDCjpo
X-Gm-Gg: AYBFou3n2jndlv8gvaT0afEV2FHNU+6eC6AmWY3D2Un9a1VZHuLPWHngjBflD1Sa/HM
	eVYIxRZS8aX0oVbIDN1Q0/wST1KgVc1hoylsnQDnQA7zBSDt6xIXKg2iGm0DgeHBEXTKhKL/A0z
	RkCfB4aHTWUlnhZxl/aFRcJyreHf1KbeePf0uhmoBBmv6VkCThTe+QMUak49AghXfAtmD7RX5Uy
	CKD3AnFTpkXaVD8+A6EjlpqDHqMAWeg4la0Oi75fnWzdT85wvcoN3lvV3oAAI/MPfvK36r1AxK+
	1pI/PqdB8phup2E8ieZh1NpX+QE8NXhCcaxmU7BZ17NlAj6UdamD7PU6GI/DcQo3gusG9pS/ZUf
	NPFGlmaxskscNKL1vez66YJm5YcfJyYXVRynIZporEbw1/36zErBnHmqGiKIJQV7qcw03DgFYy5
	dcT2pAaDL/A1i+pxzhzuxGs2aHi47A1DzN4y9xOEQ10Sk3fcljSh4By/Y=
X-Received: by 2002:a05:6000:2308:b0:48c:5304:5e50 with SMTP id
 ffacd0b85a97d-48e384dd425mr1516327f8f.0.1792735118575; Thu, 22 Oct 2026
 22:58:38 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261023024345.16779-1-theodoruswensanfebruanto025@gmail.com> <20261023024345.16779-3-theodoruswensanfebruanto025@gmail.com>
In-Reply-To: <20261023024345.16779-3-theodoruswensanfebruanto025@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 23 Oct 2026 11:28:27 +0530
X-Gm-Features: AclHuK8DLM1o2K6GqaK7baUNMGk2WDSA6Gd5fnYEIkiH-BeNIXn4p9UKwuuKE1U
Message-ID: <CAAhSdy0dVaUtFFYWHNRsHKJNk=B6kd95TAkrnFt+1hu5eKonYQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/5] lib: sbi: Save core hypervisor state across
 domain switches
To: whensun <theodoruswensanfebruanto025@gmail.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_225840_879718_1D0E78EE 
X-CRM114-Status: GOOD (  17.04  )
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBPY3QgMjMsIDIwMjYgYXQgODoxNOKAr0FNIHdoZW5zdW4KPHRoZW9kb3J1c3dlbnNh
bmZlYnJ1YW50bzAyNUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogVGhlb2RvcnVzIFdlbnNh
biBGZWJydWFudG8gPHRoZW9kb3J1c3dlbnNhbmZlYnJ1YW50bzAyNUBnbWFpbC5jb20+CgpQYXRj
aCBzdWJqZWN0IHNob3VsZCBiZSAibGliOiBzYmk6IFByZXNlcnZlIGh5cGVydmlzb3Igc3RhdGUg
YWNyb3NzCmRvbWFpbiBzd2l0Y2hlcyIuCgo+Cj4gVGhlIGRvbWFpbiBjb250ZXh0IHN3aXRjaCBz
YXZlcyBzZXZlcmFsIHN1cGVydmlzb3IgQ1NScyBidXQgbGVhdmVzCj4gaHlwZXJ2aXNvciB0cmFw
LCBkZWxlZ2F0aW9uLCBpbnRlcnJ1cHQsIGFuZCB0cmFuc2xhdGlvbiBzdGF0ZSBzaGFyZWQKPiBi
ZXR3ZWVuIGRvbWFpbnMuCj4KPiBFeGNoYW5nZSBjb3JlIHdyaXRhYmxlIEgtZXh0ZW5zaW9uIENT
UnMgd2hlbiBIIGlzIGF2YWlsYWJsZS4gVXNlIGEKPiA2NC1iaXQgZXhjaGFuZ2UgZm9yIGhlbnZj
ZmcgYW5kIGNoZWNrIFNtYWlhIGJlZm9yZSBhY2Nlc3NpbmcgUlYzMgo+IGhpZ2gtaGFsZiBBSUEg
cmVnaXN0ZXJzLgo+Cj4gVGhlIGRvbWFpbiBwcm90ZWN0aW9uIHJlY29uZmlndXJhdGlvbiBwZXJm
b3JtcyBTRkVOQ0UvSEZFTkNFIGFmdGVyCj4gdGhlIENTUiBleGNoYW5nZS4KPgo+IExpbms6IGh0
dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1zb2Z0d2FyZS1zcmMvb3BlbnNiaS9pc3N1ZXMvNDMzCj4g
U2lnbmVkLW9mZi1ieTogVGhlb2RvcnVzIFdlbnNhbiBGZWJydWFudG8gPHRoZW9kb3J1c3dlbnNh
bmZlYnJ1YW50bzAyNUBnbWFpbC5jb20+Cj4gLS0tCj4gIGxpYi9zYmkvc2JpX2RvbWFpbl9jb250
ZXh0LmMgfCAzNiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxl
IGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9k
b21haW5fY29udGV4dC5jIGIvbGliL3NiaS9zYmlfZG9tYWluX2NvbnRleHQuYwo+IGluZGV4IDI2
OTgwNjU4Li5jYWVjNTQ4NiAxMDA2NDQKPiAtLS0gYS9saWIvc2JpL3NiaV9kb21haW5fY29udGV4
dC5jCj4gKysrIGIvbGliL3NiaS9zYmlfZG9tYWluX2NvbnRleHQuYwo+IEBAIC00NCw2ICs0NCwy
MiBAQCBzdHJ1Y3QgaGFydF9jb250ZXh0IHsKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgc2lwOwo+
ICAgICAgICAgLyoqIFN1cGVydmlzb3IgYWRkcmVzcyB0cmFuc2xhdGlvbiBhbmQgcHJvdGVjdGlv
biByZWdpc3RlciAqLwo+ICAgICAgICAgdW5zaWduZWQgbG9uZyBzYXRwOwo+ICsKPiArICAgICAg
IC8qKiBIeXBlcnZpc29yIHN0YXRlICovCj4gKyAgICAgICB1bnNpZ25lZCBsb25nIGhzdGF0dXM7
Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nIGhlZGVsZWc7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25n
IGhpZGVsZWc7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nIGhpZTsKPiArICAgICAgIHVuc2lnbmVk
IGxvbmcgaGdlaWU7Cj4gKyAgICAgICB1NjQgaGVudmNmZzsKPiArICAgICAgIHVuc2lnbmVkIGxv
bmcgaHR2YWw7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nIGh0aW5zdDsKPiArICAgICAgIHVuc2ln
bmVkIGxvbmcgaHZpcDsKPiArICAgICAgIHVuc2lnbmVkIGxvbmcgaGdhdHA7Cj4gKyNpZiBfX3Jp
c2N2X3hsZW4gPT0gMzIKPiArICAgICAgIHVuc2lnbmVkIGxvbmcgaGlkZWxlZ2g7Cj4gKyAgICAg
ICB1bnNpZ25lZCBsb25nIGh2aXBoOwo+ICsjZW5kaWYKClBsZWFzZSBjcmVhdGUgYW5vdGhlciBz
dHJ1Y3QgaGFydF9jb250ZXh0X2hleHQgYW5kIHVzZSBpdApoZXJlLgoKQWxzbywgeW91IG5lZWQg
dG8gcHJlc2VydmUgdmFyaW91cyBWUzx4eXo+IENTUnMgYXMgd2VsbC4KCj4gICAgICAgICAvKiog
Q291bnRlci1lbmFibGUgcmVnaXN0ZXIgKi8KPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgc2NvdW50
ZXJlbjsKPiAgICAgICAgIC8qKiBTdXBlcnZpc29yIGVudmlyb25tZW50IGNvbmZpZ3VyYXRpb24g
cmVnaXN0ZXIgKi8KPiBAQCAtMTQxLDYgKzE1NywyNiBAQCBzdGF0aWMgaW50IHN3aXRjaF90b19u
ZXh0X2RvbWFpbl9jb250ZXh0KHN0cnVjdCBoYXJ0X2NvbnRleHQgKmN0eCwKPiAgICAgICAgIGN0
eC0+c3R2YWwgICAgICA9IGNzcl9zd2FwKENTUl9TVFZBTCwgZG9tX2N0eC0+c3R2YWwpOwo+ICAg
ICAgICAgY3R4LT5zaXAgICAgICAgID0gY3NyX3N3YXAoQ1NSX1NJUCwgZG9tX2N0eC0+c2lwKTsK
PiAgICAgICAgIGN0eC0+c2F0cCAgICAgICA9IGNzcl9zd2FwKENTUl9TQVRQLCBkb21fY3R4LT5z
YXRwKTsKPiArCj4gKyAgICAgICBpZiAobWlzYV9leHRlbnNpb24oJ0gnKSkgewo+ICsgICAgICAg
ICAgICAgICBjdHgtPmhzdGF0dXMgPSBjc3Jfc3dhcChDU1JfSFNUQVRVUywgZG9tX2N0eC0+aHN0
YXR1cyk7Cj4gKyAgICAgICAgICAgICAgIGN0eC0+aGVkZWxlZyA9IGNzcl9zd2FwKENTUl9IRURF
TEVHLCBkb21fY3R4LT5oZWRlbGVnKTsKPiArICAgICAgICAgICAgICAgY3R4LT5oaWRlbGVnID0g
Y3NyX3N3YXAoQ1NSX0hJREVMRUcsIGRvbV9jdHgtPmhpZGVsZWcpOwo+ICsgICAgICAgICAgICAg
ICBjdHgtPmhpZSA9IGNzcl9zd2FwKENTUl9ISUUsIGRvbV9jdHgtPmhpZSk7Cj4gKyAgICAgICAg
ICAgICAgIGN0eC0+aGdlaWUgPSBjc3Jfc3dhcChDU1JfSEdFSUUsIGRvbV9jdHgtPmhnZWllKTsK
PiArICAgICAgICAgICAgICAgY3R4LT5oZW52Y2ZnID0gY3NyX3N3YXA2NChDU1JfSEVOVkNGRywg
ZG9tX2N0eC0+aGVudmNmZyk7Cj4gKyAgICAgICAgICAgICAgIGN0eC0+aHR2YWwgPSBjc3Jfc3dh
cChDU1JfSFRWQUwsIGRvbV9jdHgtPmh0dmFsKTsKPiArICAgICAgICAgICAgICAgY3R4LT5odGlu
c3QgPSBjc3Jfc3dhcChDU1JfSFRJTlNULCBkb21fY3R4LT5odGluc3QpOwo+ICsgICAgICAgICAg
ICAgICBjdHgtPmh2aXAgPSBjc3Jfc3dhcChDU1JfSFZJUCwgZG9tX2N0eC0+aHZpcCk7Cj4gKyAg
ICAgICAgICAgICAgIGN0eC0+aGdhdHAgPSBjc3Jfc3dhcChDU1JfSEdBVFAsIGRvbV9jdHgtPmhn
YXRwKTsKPiArI2lmIF9fcmlzY3ZfeGxlbiA9PSAzMgo+ICsgICAgICAgICAgICAgICBpZiAoc2Jp
X2hhcnRfaGFzX2V4dGVuc2lvbihzY3JhdGNoLCBTQklfSEFSVF9FWFRfU01BSUEpKSB7Cj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgY3R4LT5oaWRlbGVnaCA9IGNzcl9zd2FwKENTUl9ISURFTEVH
SCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkb21f
Y3R4LT5oaWRlbGVnaCk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgY3R4LT5odmlwaCA9IGNz
cl9zd2FwKENTUl9IVklQSCwgZG9tX2N0eC0+aHZpcGgpOwo+ICsgICAgICAgICAgICAgICB9Cj4g
KyNlbmRpZgo+ICsgICAgICAgfQo+ICAgICAgICAgaWYgKHNiaV9oYXJ0X3ByaXZfdmVyc2lvbihz
Y3JhdGNoKSA+PSBTQklfSEFSVF9QUklWX1ZFUl8xXzEwKQo+ICAgICAgICAgICAgICAgICBjdHgt
PnNjb3VudGVyZW4gPSBjc3Jfc3dhcChDU1JfU0NPVU5URVJFTiwgZG9tX2N0eC0+c2NvdW50ZXJl
bik7Cj4gICAgICAgICBpZiAoc2JpX2hhcnRfcHJpdl92ZXJzaW9uKHNjcmF0Y2gpID49IFNCSV9I
QVJUX1BSSVZfVkVSXzFfMTIpCj4gLS0KPiAyLjQzLjAKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxp
bmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKUmVnYXJkcywKQW51cAoKLS0gCm9w
ZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
