Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3B2606A321
	for <opensbi@archiver.kernel.org>; Wed, 28 Oct 2026 11:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0zCSIJ27;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=kNNSvvv3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rIftY84L2eGmpQTRl2MJWWoD8GR3Yg5sPau9qJp5sqw=; b=0zCSIJ27Ey0Tg9kstH4oBkXKBL
	iAhzgvq+w/Z+0WsU+NgswG4G3ltRf6eM3Pkji6HbZ1fV2ikjmPDZMEli44xeEc7yZe96O55Flj0fY
	pUMDlPZjhTTCs2FlcNp62k/BcBFt8HMO1wWzTxVxZRbzyAqb2VygkPQXZlH6y/Nc768vVKll9oI2b
	mKsmvgSOfqoi8fovJu/L7E6FsaXApq/bt/iojkup7Dt1UIsDyRobiPPAeuQI0mDzWy0dWZZNTy7On
	re/4B6nxURIycqvn2V8jY+5GfzILNZkXDADwGnCNFtPbu3ntb1eKz/Ry7NrPiSobpq/DARVO1nK5W
	kyaMW76A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1ZF-00000006q3m-27jI;
	Wed, 28 Oct 2026 11:11:41 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1ZD-00000006q3I-0Vj9
	for opensbi@lists.infradead.org;
	Wed, 28 Oct 2026 11:11:40 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48e47347279so612526f8f.1
        for <opensbi@lists.infradead.org>; Wed, 28 Oct 2026 04:11:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793185897; cv=none;
        d=google.com; s=arc-20260327;
        b=E04XBlI5HKWRpShvbTfGCMTJVvZU/lwf9OKu4wOL2fKku7d92SNcEi/VDOTr49aXkf
         9LVJqApLIf3Ki8z6fuc+w0h901ah59WwYWYX8JF/VNJdMWtSKHIlwYhMLY6SZmxjLa3N
         +xgBGm5zDpaxVdV2wHiwujMiYzJ4s2xpg9IC2yMYldl5w4oSTwkSMqAH2solXWCurSrB
         GCGylccFl2KMG6wHbs5eK+tUYv+lWR+miOwIlWWdSuXnzjIXZ0AcC9ZZcCwUKkZi+QBS
         1/CySCJuqAlFhV6JHBErS25JzjukIO+w1u1faDOdZIgyj9vxFoYVmNCBFYqorWAPW582
         oH9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mviJtMK/TW7pT4OYdUkgED2GuSn4rD96vK6/Xh+kvaU=;
        fh=s0V2QxfkZ31uI08A+gYD94xQ3QEn9NHnxJRAVF9iZzc=;
        b=mQNkiCVCeEfQe5hXWmglpgFlmiCPTHiwexERlxEwHCiksZaB7HN3zF/vOGhRaWxYes
         JlB82PorDFE/l8SOgLTujRptBhY54SFAMtDxlaO2vaF/9A2SYf5/w6Y5ZuKWuj5so1tg
         IIsPYXkLUplI27aSekqegZ+2AeKJ80p7T7ADSK8ePLK1g64Pdb1lr5RKv4SjZiSA1rKO
         OQ4cmiajFriJ9jvTds9vqQfNE7FDLDHYd44HcBO1mSSOgdJXAGI4fHX4tlBbx3Zd/kRo
         vJ8OLxp7G5FPT0Ji6DR/L8Z6vox22OcU52z09FsmQCx4JapVtIN0EEYVDXpKymMDULCl
         6FCA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793185897; x=1793790697; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mviJtMK/TW7pT4OYdUkgED2GuSn4rD96vK6/Xh+kvaU=;
        b=kNNSvvv3vQJR7ozI/Y53Sm6wwcXR8hyifc6yBvkp7zn9jBSDB2Fy/4Pe6kcQGdwWba
         x7YZwot56HGib2XdhEFEzjEPWQC4Bo8+4HVe9PdydWy+Az3ef/i1ViCIF3OKfmUT0/Tm
         AG84OdyQ6OZ/YlloAVlZeLBKWYr+yAZPjBTsCiTehQuq6I/ZuHFvyYKttgRUsIzZb2dY
         O9RkX3qp8EDCrWMV2XwXJ2QiXIm80v38RKwvnEUIjc0wZi7LU/a79IEuzqdysPvDmv7f
         2LrUl58sve+XNN4U7Qq79eos6pcX5keSyE0Sf1oFySixttpgiP0pSPh0ja4+PZo29WAA
         Ju9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793185897; x=1793790697;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mviJtMK/TW7pT4OYdUkgED2GuSn4rD96vK6/Xh+kvaU=;
        b=AEUHzpFOQOFNUH03zmXaTH8yRr3QrLM2ASZr5tM/hfGtoehaYEAAmqBMscabUyxtwb
         OtK+B3Z6DGza9VgC91LNgCCkduA3GHTa28fbMh7E5lrJsmlZY5mNaP5vSHcqmFnsGUjd
         T/Qf43ELZKOMfwYyZQoVlpWawMpLDN3cbXRYIWyqNXYJxdlkGMRNKok2J6jubl1G8pDr
         1/6vRUQ/p0cgw4Vq1+kPaXDlK54FlnkzcBK8a7tkovj2QsMGfzJ7m8WIvyY5ZtsDcYlb
         n2lPNbAetiezx6VjMDPAtjwJo/V/aAQ20ZXM8HJO9BK0bj8wPtJrnuYgTdMDKhUCJE9C
         T5Iw==
X-Gm-Message-State: AFq9FYJ5aZwueBDXAmYtscvpUdehOJyhphGgfkeBrfksmJ6wpNm97y2s
	c6zj6sUr6oUrKiRpIRToSYjbSpDB0m91WV5kZMGm7SfBi6rLnXExDset+wwEctMcKa5PscIBSg9
	TkvuTZv8/AtNeTrY+YJcqTrO6/IPTFf7/EqWX8P+gdbiXugX2WTsb
X-Gm-Gg: AYBFou1lTkcVK7SUJK22z1MTWkODm2/aJVk1OA/2/aYR+HoIY04hkjZHNpkIfagn4pX
	CNnYPYqaB0n1td5pSEXEl0kOC5ScXSUv5U4GfixOaEJsR1jgapCFLaPRgjaLcEA86gX17mXkhh/
	MHmka41I8IEnndqtEBKCDq9Z9XIvDL6Jk8pGVnSQ/onX9jmgQQmVC3mgswIEK0gsbP5Myfb6bmt
	J83I59mBzuur85KMXqfMAWslLGm7PzY6DwszPwx91lu9aVHQV2nqqnSz+vecZ8N/T3z7n9vi9KE
	RpEQNiOF/rOKgsdlUjt9NmLb45IvvyhnOWzjfUxttiRhyMx8vmqoHBxgfW1zqJ/PISPcWmZ4ZQv
	xJSOjncOvu2KKP3HrxcaZYii0JCdROycPLtaioEqRKG+TPe1JeKxzdPB61HkVVo2HgXEAfLzJNN
	HEf4zxB03aGpQEZIKr/7vRG/w06rAZKQq7+xrfSqNKpd6gHEeStaWkAvUW
X-Received: by 2002:a05:6000:469c:b0:48e:202:6718 with SMTP id
 ffacd0b85a97d-48e5d5c6d53mr3318149f8f.25.1793185897148; Wed, 28 Oct 2026
 04:11:37 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027083509.1076577-1-peter.lin@sifive.com> <20261027083509.1076577-9-peter.lin@sifive.com>
In-Reply-To: <20261027083509.1076577-9-peter.lin@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 28 Oct 2026 16:41:24 +0530
X-Gm-Features: AclHuK8MF8AtkVrnHRmnA1yGFtDp8bfB91ZvDGw8ynQ68WhMto6hhZvmEFQi8Co
Message-ID: <CAAhSdy2YO5zDG3pX3JXr7TzARVsFxFu7=iRfYuRJp9qRH5Ku2A@mail.gmail.com>
Subject: Re: [PATCH v3 8/9] lib: sbi: display World ID configuration at boot
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, pawandeep.oza@oss.qualcomm.com, 
	rkrcmar@qti.qualcomm.com, raymond.mao@riscstar.com, robin.randhawa@sifive.com, 
	samuel.holland@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_041139_188814_8B1B2091 
X-CRM114-Status: GOOD (  14.98  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCBPY3QgMjcsIDIwMjYgYXQgMjowNuKAr1BNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gUHJpbnQgcGVyLWRvbWFpbiBXaWQvV2lkZGVs
ZWcgYW5kIGJvb3QgSEFSVCdzIE0tbW9kZQo+IFdvcmxkIElEIChtd2lkL3Btd2lkIGZhbGxiYWNr
KS4KPgo+IFNpZ25lZC1vZmYtYnk6IFl1LUNoaWVuIFBldGVyIExpbiA8cGV0ZXIubGluQHNpZml2
ZS5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5v
cmc+CgpUaGFua3MsCkFudXAKCj4gLS0tCj4gQ2hhbmdlIHYyLT52MzoKPiAtIERpc3BsYXkgZG9t
LT53aWQgZGlyZWN0bHkgd2hlbiBTbWx3aWQgaXMgcHJlc2VudC4KPiAtLS0KPiAgbGliL3NiaS9z
YmlfZG9tYWluLmMgfCAxOCArKysrKysrKysrKysrKysrKysKPiAgbGliL3NiaS9zYmlfaW5pdC5j
ICAgfCAxMyArKysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygr
KQo+Cj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX2RvbWFpbi5jIGIvbGliL3NiaS9zYmlfZG9t
YWluLmMKPiBpbmRleCBiZTkwMjBkMC4uZjkyZWJjMmYgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9z
YmlfZG9tYWluLmMKPiArKysgYi9saWIvc2JpL3NiaV9kb21haW4uYwo+IEBAIC0xMCw2ICsxMCw3
IEBACj4gICNpbmNsdWRlIDxzYmkvcmlzY3ZfYXNtLmg+Cj4gICNpbmNsdWRlIDxzYmkvc2JpX2Nv
bnNvbGUuaD4KPiAgI2luY2x1ZGUgPHNiaS9zYmlfZG9tYWluLmg+Cj4gKyNpbmNsdWRlIDxzYmkv
c2JpX2hhcnQuaD4KPiAgI2luY2x1ZGUgPHNiaS9zYmlfaGFydG1hc2suaD4KPiAgI2luY2x1ZGUg
PHNiaS9zYmlfaGVhcC5oPgo+ICAjaW5jbHVkZSA8c2JpL3NiaV9oc20uaD4KPiBAQCAtNjEzLDYg
KzYxNCw3IEBAIHZvaWQgc2JpX2RvbWFpbl9kdW1wKGNvbnN0IHN0cnVjdCBzYmlfZG9tYWluICpk
b20sIGNvbnN0IGNoYXIgKnN1ZmZpeCkKPiAgICAgICAgIHUzMiBpLCBqLCBrOwo+ICAgICAgICAg
dW5zaWduZWQgbG9uZyByc3RhcnQsIHJlbmQ7Cj4gICAgICAgICBjb25zdCBzdHJ1Y3Qgc2JpX2Rv
bWFpbl9tZW1yZWdpb24gKnJlZzsKPiArICAgICAgIHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRj
aCA9IHNiaV9zY3JhdGNoX3RoaXNoYXJ0X3B0cigpOwo+Cj4gICAgICAgICBzYmlfcHJpbnRmKCJE
b21haW4lZCBOYW1lICAgICAgICAlczogJXNcbiIsCj4gICAgICAgICAgICAgICAgICAgIGRvbS0+
aW5kZXgsIHN1ZmZpeCwgZG9tLT5uYW1lKTsKPiBAQCAtNjkxLDYgKzY5MywyMiBAQCB2b2lkIHNi
aV9kb21haW5fZHVtcChjb25zdCBzdHJ1Y3Qgc2JpX2RvbWFpbiAqZG9tLCBjb25zdCBjaGFyICpz
dWZmaXgpCj4gICAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgfQo+Cj4gKyAgICAgICBp
ZiAoc2JpX2hhcnRfaGFzX2V4dGVuc2lvbihzY3JhdGNoLCBTQklfSEFSVF9FWFRfU01MV0lEKSkg
ewo+ICsgICAgICAgICAgICAgICBzYmlfcHJpbnRmKCJEb21haW4lZCBXaWQgICAgICAgICAlczog
JXVcbiIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgZG9tLT5pbmRleCwgc3VmZml4LCBk
b20tPndpZCk7Cj4gKyAgICAgICB9IGVsc2Ugewo+ICsgICAgICAgICAgICAgICBzYmlfcHJpbnRm
KCJEb21haW4lZCBXaWQgICAgICAgICAlczogdW5zdXBwb3J0ZWRcbiIsCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgZG9tLT5pbmRleCwgc3VmZml4KTsKPiArICAgICAgIH0KPiArCj4gKyAg
ICAgICBpZiAoc2JpX2hhcnRfaGFzX2V4dGVuc2lvbihzY3JhdGNoLCBTQklfSEFSVF9FWFRfU01X
SURERUxFRykpIHsKPiArICAgICAgICAgICAgICAgc2JpX3ByaW50ZigiRG9tYWluJWQgV2lkZGVs
ZWcgICAgJXM6IDB4JSIgUFJJeDY0ICJcbiIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ZG9tLT5pbmRleCwgc3VmZml4LCBkb20tPndpZGRlbGVnKTsKPiArICAgICAgIH0gZWxzZSB7Cj4g
KyAgICAgICAgICAgICAgIHNiaV9wcmludGYoIkRvbWFpbiVkIFdpZGRlbGVnICAgICVzOiB1bnN1
cHBvcnRlZFxuIiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICBkb20tPmluZGV4LCBzdWZm
aXgpOwo+ICsgICAgICAgfQo+ICsKPiAgICAgICAgIHNiaV9wcmludGYoIkRvbWFpbiVkIFN5c1Jl
c2V0ICAgICVzOiAlc1xuIiwKPiAgICAgICAgICAgICAgICAgICAgZG9tLT5pbmRleCwgc3VmZml4
LCAoZG9tLT5zeXN0ZW1fcmVzZXRfYWxsb3dlZCkgPyAieWVzIiA6ICJubyIpOwo+Cj4gZGlmZiAt
LWdpdCBhL2xpYi9zYmkvc2JpX2luaXQuYyBiL2xpYi9zYmkvc2JpX2luaXQuYwo+IGluZGV4IGFj
ZDJmOGI2Li5mNzcxZjU0OCAxMDA2NDQKPiAtLS0gYS9saWIvc2JpL3NiaV9pbml0LmMKPiArKysg
Yi9saWIvc2JpL3NiaV9pbml0LmMKPiBAQCAtMTY3LDYgKzE2Nyw3IEBAIHN0YXRpYyB2b2lkIHNi
aV9ib290X3ByaW50X2hhcnQoc3RydWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoLCB1MzIgaGFydGlk
KQo+ICAgICAgICAgaW50IHhsZW47Cj4gICAgICAgICBjaGFyIHN0clsyNTZdOwo+ICAgICAgICAg
Y29uc3Qgc3RydWN0IHNiaV9kb21haW4gKmRvbSA9IHNiaV9kb21haW5fdGhpc2hhcnRfcHRyKCk7
Cj4gKyAgICAgICBzdHJ1Y3Qgc2JpX2hhcnRfZmVhdHVyZXMgKmhmID0gc2JpX2hhcnRfZmVhdHVy
ZXNfcHRyKHNjcmF0Y2gpOwo+Cj4gICAgICAgICBpZiAoc2NyYXRjaC0+b3B0aW9ucyAmIFNCSV9T
Q1JBVENIX05PX0JPT1RfUFJJTlRTKQo+ICAgICAgICAgICAgICAgICByZXR1cm47Cj4gQEAgLTE5
OSw2ICsyMDAsMTggQEAgc3RhdGljIHZvaWQgc2JpX2Jvb3RfcHJpbnRfaGFydChzdHJ1Y3Qgc2Jp
X3NjcmF0Y2ggKnNjcmF0Y2gsIHUzMiBoYXJ0aWQpCj4gICAgICAgICBzYmlfcHJpbnRmKCJCb290
IEhBUlQgRGVidWcgVHJpZ2dlcnMgICAgOiAlZCB0cmlnZ2Vyc1xuIiwKPiAgICAgICAgICAgICAg
ICAgICAgc2JpX2RidHJfZ2V0X3RvdGFsX3RyaWdnZXJzKCkpOwo+ICAgICAgICAgc2JpX2hhcnRf
ZGVsZWdhdGlvbl9kdW1wKHNjcmF0Y2gsICJCb290IEhBUlQgIiwgIiAgICAgICAgICAgIik7Cj4g
KyAgICAgICBpZiAoc2JpX2hhcnRfaGFzX2V4dGVuc2lvbihzY3JhdGNoLCBTQklfSEFSVF9FWFRf
U01XSUQpKSB7Cj4gKyAgICAgICAgICAgICAgIHVsb25nIG13aWQgPSBjc3JfcmVhZChDU1JfTVdJ
RCk7Cj4gKwo+ICsgICAgICAgICAgICAgICBzYmlfcHJpbnRmKCJCb290IEhBUlQgTS1tb2RlIFdv
cmxkIElEICAgOiAlbHUgKCVzKVxuIiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICBtd2lk
ICYgfk1XSURfTE9DSywKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAobXdpZCAmIE1XSURf
TE9DSykgPyAibG9ja2VkIiA6ICJ1bmxvY2tlZCIpOwo+ICsgICAgICAgfSBlbHNlIGlmIChoZi0+
aGFzX3Btd2lkKSB7Cj4gKyAgICAgICAgICAgICAgIHNiaV9wcmludGYoIkJvb3QgSEFSVCBNLW1v
ZGUgV29ybGQgSUQgICA6ICV1IChwbXdpZClcbiIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgaGYtPnBtd2lkKTsKPiArICAgICAgIH0gZWxzZSB7Cj4gKyAgICAgICAgICAgICAgIHNiaV9w
cmludGYoIkJvb3QgSEFSVCBNLW1vZGUgV29ybGQgSUQgICA6IHVuc3VwcG9ydGVkXG4iKTsKPiAr
ICAgICAgIH0KPiAgfQo+Cj4gIHN0YXRpYyB1bnNpZ25lZCBsb25nIGNvbGRib290X2RvbmU7Cj4g
LS0KPiAyLjQzLjcKPgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29w
ZW5zYmkK
