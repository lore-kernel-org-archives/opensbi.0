Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA023CD37AC
	for <opensbi@archiver.kernel.org>; Mon, 11 May 2026 14:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kt4RyDscrXf1ubh6oSN7MpnV2RR3OAsSVFk3KSYLKCY=; b=xelGTFaeb6cGZg
	f/bixnDF/CIWY7uKN1jvknpSXABrwNG/jW80Eoyg+scBIxjhyaj5jgS1rOxpE7GfkvbY8mVQSOdth
	CmxZrgNMYJi777ztvWRZAobYW/0gC5ddPCBCY9ovRsPJSZpFjhIsjk1qyjDdCkpD1Kt46YfYRtRlY
	Bs3J5n8FqcsY1/R4u/nOW4lBidFkhYO5ec5GjBQHpbmDBFuHroILn23s23I9TnjfhL7+Mnvp+aHIk
	vg2mYPK2i/WAKHSB0dglL9y79wWDMbOnpQIaeoH3ctn0QKGBmF9h56iDiYPkcOJjjEWRKLiyU5zqG
	x7FJAxIMMsvmsg3Wka9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMS4u-0000000DyDK-3Shl;
	Mon, 11 May 2026 14:57:52 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMS4r-0000000DyCB-2t8J
	for opensbi@lists.infradead.org;
	Mon, 11 May 2026 14:57:51 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-7dcd689829eso4022887a34.3
        for <opensbi@lists.infradead.org>; Mon, 11 May 2026 07:57:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778511468; cv=none;
        d=google.com; s=arc-20240605;
        b=Y4Q7sjCvxr/hBFwuj/CqLhHYsuCLMih+gJb4SSC0Gczu341qROuMBOBg+M1FRoiUuF
         +PPWAxZSiNtKxgl9vsKOOaloCxXSZFhiEghbZZVOR1ESflaPGp4Up2MPmkeD5Z3+Pbyg
         n1M3EVK3s5ItwqHswqMfMx7ZfUmHdUq9OoF+HD710fBhCWANM6uDuYI/04oEyVKn2Ing
         54c3Ttu7xBeJUJaeJlTc3GJW9B+j2D+jXm1b0KOE1o0nLDX29CnhGgozlQu31b7DTNJN
         xklwhVndF6YJ5gruA7+k4ROyJmHwOlz+9ahIDIJm8xZJ7QN5DLdlBeLw6I7JXuCMsRAe
         jb9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zfjYaxmtuCK2/UBGyWRVLkYnpg6MkYclNkSZYEKt2ho=;
        fh=ptzNB7g9a30gS3iMdXy8hchchj5+04tEpHu43QD535Q=;
        b=bW1BtlfWTT6sk+HOcd2aeaLYrRfRFdXE/Tz4/fzEl5faDqFAb2G1RKQReeCUy5wg4f
         iuc1cXpoGiMUqpRgUqdpqKK3HfKLZlHudIZQwH8AScGH4tPjyqAyEphdbaiMMnrn1tPs
         dRBkW6BHgvNZIbEWnjKz6qwMxJHtIahlVZYO2340CffnrzFyx1tXCguW/kulqSLLvsmy
         2WAxPLKvSBcPgv8j6xLyuFQy2A1bfeZ+RCNiseFqWRhCsqx+J7vgZOYlaCuyhzI+CIOi
         dHTTdlBUY3onbHdGLVu2a3zUEPEMPVZINAonlhwJnHp4Ez8LJpN6T05bT7b5W2EZrjPY
         kswg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1778511468; x=1779116268; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zfjYaxmtuCK2/UBGyWRVLkYnpg6MkYclNkSZYEKt2ho=;
        b=TEzHtVdH2eAbkkX7kvRsDEq3BhnEjiHciQWF8hNtx728Up4Y50ugQ5iS1kHjLhSAPX
         SxR541/JIdLqmNUgl+3Q0hB0kDe9p49BVlnF3CBPGksvugbbeEMJ/2T1IPWjOTMzQJy2
         wi+7R4C3Fxng348clmOuU8U4Ac2GIUbAyBfYZIi30NHQkUa6m6SDXD7VEVEejNpf9sdm
         8NUntwqrVhBRNh3ZqX4Z7ocoDb6JbZJDuVETwtYUtrDFJQEVhHP2WfLdJPLw+UgwG2YZ
         OJH8Co51cJIzcFQAMaPszuBZ+lrun6imY+0wKJ/AAbBOzYlUWLihmriCRYKvKpQVxlkv
         QU/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778511468; x=1779116268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zfjYaxmtuCK2/UBGyWRVLkYnpg6MkYclNkSZYEKt2ho=;
        b=bWkvUNzr2ut/WR7ozX4arQjS+3zMQRcmPUsqxqb1viZ6rbNyGyd/78S7yA0bspQsXt
         u0rk0uD4XSOtqrjjuySoep1IOczH2T41PyDGhe5O8QRpKi8CHV8hYqIXDsreU3UgzwzO
         aWj8BtbyTfkZcAaNe/zSCkdhb1eahsnAjCREF4QzByS4cAIUDOcmT56X8ItCL1McXQgm
         P9klcQkzBT6blxK4TJFQFlhSvFgNeKq5/o+UzUsbN7rDPcAre4iE/S+tckD0kLPMchL6
         4v/yi3JHpezvuytjxYXJBhdB4/DeTiMklKaO+4A6nlEOuvdiUc1Deaoy5USBx1nWclzs
         0sXw==
X-Gm-Message-State: AOJu0Yx1ttQa2czHLDlnW32NXBmOubeulLzWmq3dKvEzl1UmSRQBPHw2
	IxR/LtBJpogAs8TFUGuvgxUBATsJS94FCjQjPquH2lmDRve5HRK6rAyJ+ukq7i1qKCH+XbhC3DT
	2UqtY7+R6GeX3fIFeBpyXZ+FH+dvyN4sxm4J3yjKhqvUQM8LFLrRFhjQ=
X-Gm-Gg: Acq92OFNB8tDGvynNfqDLlFO90waFDsi2trcnae+GVGQhhgwHH5gJxNs5vXu9GxfGSx
	vM50XkrsdG6vMtQer3OcbkOu+RgS75WwPZ6ayt8N0sh3ei4cmgRAsb/HSM1/y9cdX2CVpi0MPq0
	5/GL+Glb/Thcu/f4aWPrV1G8XyGxz+xEzxk97iBvZ1R+qf5qKF5UGbqPTyKB9OjOofToC09+pwa
	7lo1iYOftZPUBaP4M2iCCrjGvieug+UFaCKfOVZC+AYxTmhw+X93ULUe8Ut+Db1jv+IHKTh8cO2
	UlSj5pVPsrXxyQR2NcVP20lMH6BYgIR8T7vo//Cv9IQ74RnYp7v1j05VK5nJYi1QPxEfCD/Hnn1
	gfGu13JS7Ms1tjZ54Y5+FVaByszWlffQSOJTC
X-Received: by 2002:a05:6820:1b05:b0:694:9156:9b97 with SMTP id
 006d021491bc7-69b25b78f91mr6990682eaf.22.1778511468392; Mon, 11 May 2026
 07:57:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260422151750.3794520-1-liutong@iscas.ac.cn>
In-Reply-To: <20260422151750.3794520-1-liutong@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 11 May 2026 20:27:37 +0530
X-Gm-Features: AVHnY4KKjoAI4RoNxJVJ_Dy38lml9WJaC3U2aBd8_K3mtjvo6Z1hGo4EOVAHil0
Message-ID: <CAAhSdy2K64qHDPUrD8WryaXGbO11QaouUsaUFCbL-EWWjX43MQ@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi_domain: reject zero-size and overflowing ranges
 in sbi_domain_check_addr_range
To: liutong <liutong@iscas.ac.cn>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_075749_870769_430EA7C5 
X-CRM114-Status: GOOD (  19.44  )
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

T24gV2VkLCBBcHIgMjIsIDIwMjYgYXQgODo0OOKAr1BNIGxpdXRvbmcgPGxpdXRvbmdAaXNjYXMu
YWMuY24+IHdyb3RlOgo+Cj4gYG1heCA9IGFkZHIgKyBzaXplYCBpcyBjb21wdXRlZCB3aXRob3V0
IG92ZXJmbG93IGRldGVjdGlvbiwgYW5kIGEKPiBzaXplIG9mIHplcm8gaXMgbm90IHJlamVjdGVk
LiBJbiBib3RoIGNhc2VzIHRoZSBgd2hpbGUgKGFkZHIgPCBtYXgpYAo+IGxvb3AgZXhlY3V0ZXMg
emVybyB0aW1lcyBhbmQgdGhlIGZ1bmN0aW9uIGZhbGxzIHRocm91Z2ggdG8KPiBgcmV0dXJuIHRy
dWVgIHdpdGhvdXQgYWN0dWFsbHkgY2hlY2tpbmcgYW55IHJlZ2lvbiBhZ2FpbnN0IHRoZQo+IGRv
bWFpbiBjb25maWd1cmF0aW9uLgo+Cj4gUmVqZWN0IHNpemUgPT0gMCBhbmQgZGV0ZWN0IHVuc2ln
bmVkIG92ZXJmbG93IG9mIGFkZHIgKyBzaXplIGJlZm9yZQo+IGVudGVyaW5nIHRoZSBsb29wLgo+
Cj4gRml4ZXM6IGVhYjQ4YzMzYTEyZCAoImxpYjogc2JpOiBBZGQgc2JpX2RvbWFpbl9jaGVja19h
ZGRyX3JhbmdlKCkgZnVuY3Rpb24iKQo+IFNpZ25lZC1vZmYtYnk6IGxpdXRvbmcgPGxpdXRvbmdA
aXNjYXMuYWMuY24+CgpUaGUgcHJvYmxlbSBvZiBvdmVyZmxvd2luZyByYW5nZXMgaXMgYWxyZWFk
eSB0YWtlbiBjYXJlIGJ5CnRoZSBwYXRjaCAibGliOiBzYmlfZG9tYWluOiByZWplY3Qgb3ZlcmZs
b3dpbmcgYWRkcmVzcyByYW5nZQppbiBjaGVja19hZGRyX3JhbmdlKCkiIHNvIHlvdSBtaWdodCB3
YW50IHRvIGZvY3VzIG9ubHkgb24KInJlamVjdCB6ZXJvLXNpemUiLgoKUmVnYXJkcywKQW51cAoK
PiAtLS0KPiBBcG9sb2dpZXMgZm9yIHRoZSBlYXJsaWVyIG5vbi1zdGFuZGFyZCBzdWJtaXNzaW9u
OyByZXNlbmRpbmcgYXMgYQo+IHByb3BlciBwYXRjaCBwZXIgZG9jcy9jb250cmlidXRpbmcubWQu
Cj4KPiAgbGliL3NiaS9zYmlfZG9tYWluLmMgfCA3ICsrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkv
c2JpX2RvbWFpbi5jIGIvbGliL3NiaS9zYmlfZG9tYWluLmMKPiBpbmRleCA3MDMwODQ4ZC4uNzRh
MDIwNTcgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfZG9tYWluLmMKPiArKysgYi9saWIvc2Jp
L3NiaV9kb21haW4uYwo+IEBAIC00OTksMTIgKzQ5OSwxNyBAQCBib29sIHNiaV9kb21haW5fY2hl
Y2tfYWRkcl9yYW5nZShjb25zdCBzdHJ1Y3Qgc2JpX2RvbWFpbiAqZG9tLAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgbW9kZSwKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGFjY2Vzc19mbGFncykKPiAgewo+IC0g
ICAgICAgdW5zaWduZWQgbG9uZyBtYXggPSBhZGRyICsgc2l6ZTsKPiArICAgICAgIHVuc2lnbmVk
IGxvbmcgbWF4Owo+ICAgICAgICAgY29uc3Qgc3RydWN0IHNiaV9kb21haW5fbWVtcmVnaW9uICpy
ZWcsICpzcmVnOwo+Cj4gICAgICAgICBpZiAoIWRvbSkKPiAgICAgICAgICAgICAgICAgcmV0dXJu
IGZhbHNlOwo+Cj4gKyAgICAgICBpZiAoIXNpemUgfHwgKGFkZHIgKyBzaXplKSA8IGFkZHIpCj4g
KyAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiArCj4gKyAgICAgICBtYXggPSBhZGRyICsg
c2l6ZTsKPiArCj4gICAgICAgICB3aGlsZSAoYWRkciA8IG1heCkgewo+ICAgICAgICAgICAgICAg
ICByZWcgPSBmaW5kX3JlZ2lvbihkb20sIGFkZHIpOwo+ICAgICAgICAgICAgICAgICBpZiAoIXJl
ZykKPiAtLQo+IDIuMzQuMQo+Cj4KPiAtLQo+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gb3BlbnNi
aUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9vcGVuc2JpCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vb3BlbnNiaQo=
