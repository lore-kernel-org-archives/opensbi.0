Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFE9C28B20
	for <opensbi@archiver.kernel.org>; Fri, 28 Mar 2025 04:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=85O4m1/yZeypLf6DZnLmmvDCg7qxx6UcK56qR/fTD9E=; b=XVZDVLVLv9mnGT
	8A2jKM/+KRNsCWBYm6FBOJKSgEota3SERGLUedCUNNwfm7f+U0yHfLWTVaSivkmpTjSflHAaXYU4b
	eEV5KkylcEY9wyCDyx/TY172gIB8Se5rHtcYkxNFH/tsSruOsESYirFenRsW/+I1gY5dZQ6YhFpIU
	Z7YNqZ1l/R47OW15XZhwESUknrjSyG9sbc+RFgP9vUC0qSAEhC63r3l0WNfdA742cSy4dpmjE54rI
	E1rolEaXgv9Fg8Uqp/yb7Z3v1aABK/N6EAuho9NiRMxdhw8pEkNTxa2OShFKeoY0QyU3FGrEvy+6B
	auARWXvcP66WM1+xWaxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty1m7-0000000CbKp-2ZSP;
	Fri, 28 Mar 2025 04:56:59 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty1m5-0000000CbKT-1QGC
	for opensbi@lists.infradead.org;
	Fri, 28 Mar 2025 04:56:58 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-85d9a87660fso142196039f.1
        for <opensbi@lists.infradead.org>; Thu, 27 Mar 2025 21:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1743137816; x=1743742616; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kL90qHkx/kZ/TbAbEr1pscRIFNwPN7LISi9JmnwUBFI=;
        b=QeyeFEFf9LPF1eNNbKveAwOdpbs8+5ZGYzXWUGEAOktBm3g5PJd7JlvRWaK8qi48uo
         uC8N/0Ni31fkGX0KhYDoc9DQSeJ8N9KrTmu4aMoWHCgFK6OSDkRb7pP/lWdbIgFt9cCm
         yLOuN4crZGQTMOAklC/MVTDekb3w4lfeGwTuIrlfwhP1zhqvQ3n9DBuuH86zai1RpaLZ
         OI7p47rYaBxuXOqj1NBkj02pwFgttbhjQRykN5GwTqW42k19SLfgMNlLhvVN4KpM+PC0
         EB42nMIGOVDI4amikuEHe1TZd6VGoxsfs3HUh44+HUo75zGVd7tG7/ST7YuLBsRb1fap
         03rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743137816; x=1743742616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kL90qHkx/kZ/TbAbEr1pscRIFNwPN7LISi9JmnwUBFI=;
        b=TR5783Yl24BAMNOYsrDDr2vV9AisDndh2N7/NBECD+j8UXkQyWvTlpE4HWZGELTKa/
         jRhKeB8YDrl7/J75k0QnBzv2OclBF7DJGxFEzj9goWcHd+2REada0K7kgnTJMiv253Y9
         OSGpCjsCRq+d1rznYW8eynefSbhYTpivLe+U3bwPbumEAYvKEiu2yoOTXd/1gusVu4YO
         7MBZVdRf1JKArnwKX1JkFFyrePfPsX9HTyCMW7Sq8FfP30UU7jXJO9pA0xE1sTnVRN/P
         xQ2v9q1kcfzYGRfZKd0/9OMyW2GC2XGnGoanPWWdu+A7f4pmyx4sVLeW/qa+FUXF04Y+
         Aksg==
X-Gm-Message-State: AOJu0YwZAhhkeqhcDfOb5KfwULZG6/WWonfFu6k1aw8A5i6nJxrdUHET
	7FRQTjgFrqT5X0LCwdorQSG4AMRqFaIyfiXRQ/Be9Is/0Ek7LblT67Nbk//ji6ZGzLXPMYPGKn0
	OgcfMTTTpOQTKEGiejEpLsOVcEpa6hKLF56Mdx0cTrLzaGTtx
X-Gm-Gg: ASbGnctg/ewd0eS7eAnkD6zOkGI1Ndqab2ql8F41UxXqxQO8UELeLINDXWEMX3Yqe3W
	c3HsqLGrfA1PxyopRpPm0q9CgT4fnVAQTl8bWe45EYnuzLlkjduB1YdMEN6Vr/tHF9cHLqM7PRj
	WfCTrr9b0qPVBbgq1tN3b1jLbzpi4=
X-Google-Smtp-Source: AGHT+IFBbWJ7uLNlGniaFOHspj+9EtbOT83wPpNwzErYdx/pG7PJqnvLQZDjla8ctneVMge3TlRc+eTJuC5d9cXHm00=
X-Received: by 2002:a05:6e02:1542:b0:3d3:dd60:bc37 with SMTP id
 e9e14a558f8ab-3d5cce2bb29mr76147235ab.22.1743137816205; Thu, 27 Mar 2025
 21:56:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
 <20250226005335.19498-5-cfu@mips.com>
In-Reply-To: <20250226005335.19498-5-cfu@mips.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 28 Mar 2025 10:26:43 +0530
X-Gm-Features: AQ5f1JrtmfvJGZGtL-9HZ5wRMWIhOiIgPuFQ7vpGR415TgyINJ0bYZY40xcOqpU
Message-ID: <CAAhSdy384NhtjrTw5-YntTw7UYNUZKZB+evAc6bnS_nt4Etz0Q@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] platform: generic: mips: add extra scratch space
To: Chao-ying Fu <icebergfu@gmail.com>
Cc: opensbi@lists.infradead.org, Chao-ying Fu <cfu@mips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_215657_376618_B122896A 
X-CRM114-Status: GOOD (  15.51  )
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

T24gV2VkLCBGZWIgMjYsIDIwMjUgYXQgNzozOOKAr0FNIENoYW8teWluZyBGdSA8aWNlYmVyZ2Z1
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBXZSBuZWVkIGV4dHJhIHNjcmF0Y2ggc3BhY2UgdXNlZCBi
eSB0aGUgY3VzdG9tIGV4Y2VwdGlvbiBoYW5kbGVyLgoKVGhlIGN1c3RvbSBNSVBTIHNwZWNpZmlj
IGV4Y2VwdGlvbiBoYW5kbGVyIGl0c2VsZiBpcyB1bmp1c3RpZmllZCBzbwp0aGlzIGV4dHJhIGN1
c3RvbSBzY3JhdGNoIHNwYWNlIG1ha2VzIG5vIHNlbnNlIGF0IHRoZSBtb21lbnQuCgpJbWFnaW5l
LCBtb3JlIHBsYXRmb3JtcyBhZGRpbmcgdGhlaXIgb3duIGN1c3RvbSBzY3JhdGNoIHNwYWNlLgoK
UmVnYXJkcywKQW51cAoKPiAtLS0KPiAgaW5jbHVkZS9zYmkvc2JpX3NjcmF0Y2guaCB8IDEyICsr
KysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvc2JpL3NiaV9zY3JhdGNoLmggYi9pbmNsdWRlL3NiaS9zYmlfc2NyYXRj
aC5oCj4gaW5kZXggMGQxODhkMS4uZmY4Yjc1ZSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3NiaS9z
Ymlfc2NyYXRjaC5oCj4gKysrIGIvaW5jbHVkZS9zYmkvc2JpX3NjcmF0Y2guaAo+IEBAIC00NCw4
ICs0NCwxNiBAQAo+ICAjZGVmaW5lIFNCSV9TQ1JBVENIX09QVElPTlNfT0ZGU0VUICAgICAgICAg
ICAgICgxMyAqIF9fU0laRU9GX1BPSU5URVJfXykKPiAgLyoqIE9mZnNldCBvZiBoYXJ0aW5kZXgg
bWVtYmVyIGluIHNiaV9zY3JhdGNoICovCj4gICNkZWZpbmUgU0JJX1NDUkFUQ0hfSEFSVElOREVY
X09GRlNFVCAgICAgICAgICAgKDE0ICogX19TSVpFT0ZfUE9JTlRFUl9fKQo+ICsjaWZkZWYgQ09O
RklHX1BMQVRGT1JNX01JUFNfUDg3MDAKPiArI2RlZmluZSBNSVBTX1A4NzAwX1NUV19TSVpFICAg
ICAgICAgICAgICAgICAgICAzNAo+ICsvKiogT2Zmc2V0IG9mIHN0d190bXAgaW4gc2JpX3NjcmF0
Y2ggKi8KPiArI2RlZmluZSBTQklfU0NSQVRDSF9TVFdfVE1QX09GRlNFVCAgICAgICAgICAgICAo
MTUgKiBfX1NJWkVPRl9QT0lOVEVSX18pCj4gKy8qKiBPZmZzZXQgb2YgZXh0cmEgc3BhY2UgaW4g
c2JpX3NjcmF0Y2ggKi8KPiArI2RlZmluZSBTQklfU0NSQVRDSF9FWFRSQV9TUEFDRV9PRkZTRVQg
ICAgICAgICAoKDE1ICsgTUlQU19QODcwMF9TVFdfU0laRSkgKiBfX1NJWkVPRl9QT0lOVEVSX18p
Cj4gKyNlbHNlCj4gIC8qKiBPZmZzZXQgb2YgZXh0cmEgc3BhY2UgaW4gc2JpX3NjcmF0Y2ggKi8K
PiAgI2RlZmluZSBTQklfU0NSQVRDSF9FWFRSQV9TUEFDRV9PRkZTRVQgICAgICAgICAoMTUgKiBf
X1NJWkVPRl9QT0lOVEVSX18pCj4gKyNlbmRpZgo+ICAvKiogTWF4aW11bSBzaXplIG9mIHNiaV9z
Y3JhdGNoICg0S0IpICovCj4gICNkZWZpbmUgU0JJX1NDUkFUQ0hfU0laRSAgICAgICAgICAgICAg
ICAgICAgICAgKDB4MTAwMCkKPgo+IEBAIC04Nyw2ICs5NSwxMCBAQCBzdHJ1Y3Qgc2JpX3NjcmF0
Y2ggewo+ICAgICAgICAgdW5zaWduZWQgbG9uZyBvcHRpb25zOwo+ICAgICAgICAgLyoqIEluZGV4
IG9mIHRoZSBoYXJ0ICovCj4gICAgICAgICB1bnNpZ25lZCBsb25nIGhhcnRpbmRleDsKPiArI2lm
ZGVmIENPTkZJR19QTEFURk9STV9NSVBTX1A4NzAwCj4gKyAgICAgICAvKiogZm9yIHN0dyAqLwo+
ICsgICAgICAgdW5zaWduZWQgbG9uZyBzdHdfdG1wW01JUFNfUDg3MDBfU1RXX1NJWkVdOwo+ICsj
ZW5kaWYKPiAgfTsKPgo+ICAvKioKPiAtLQo+IDIuNDcuMQo+Cj4KPiAtLQo+IG9wZW5zYmkgbWFp
bGluZyBsaXN0Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCgotLSAKb3BlbnNiaSBtYWlsaW5n
IGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
