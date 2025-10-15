Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5169ACCD192
	for <opensbi@archiver.kernel.org>; Wed, 15 Oct 2025 14:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OjMNhPWU6Ui/wvsE6nWZ8To1/Zkwxm938wjDgDBXYr8=; b=DNPQ88i0BWQ8sl
	WnPSq7uyk5Udj4fv1PAL3CABDK9HGQlrdqbj3dQLB6qCAA+AKdZmfinr7wP5h3eC+U9qq8x28b0xI
	XO2vrUf1kWqbtdfdr8obchCXVbFJg/MZQNJ+MUhmm/ORehyRpGzuQYxf9Tv/kn/UOKtl5yTvPnYde
	pq5buOy2qy23SVnnhH70TpXYZDxGKvFc6homyLPNxBD66nUe79jbNObCE4g+SNr+eidslG3qnnb0o
	N1DYjrlX8d+GDCSpophmDOId3m8ETHuSPvcGetLOAHeXM/QMQSDUa5fTDyc/GQM9vIX2IEiynuoCR
	ijPKjBXHOxQoRIZiYH8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92L6-00000001qAJ-1ugv;
	Wed, 15 Oct 2025 14:18:52 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92L3-00000001q7s-1hRA
	for opensbi@lists.infradead.org;
	Wed, 15 Oct 2025 14:18:50 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5818de29d15so8255716e87.2
        for <opensbi@lists.infradead.org>; Wed, 15 Oct 2025 07:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1760537924; x=1761142724; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uOHuMY6DLdNVFSfR66Pn+DtHfdJs+CgmYpWBJcIxgno=;
        b=F2UoABWd+ZOGVU5CDKQ3R1MaSHusb/KjLRs+ctKW09xRhn8y9aIw2Hz52wZYAxHF0F
         MPela6dmi4TFV2xHicIi5it3B1+w3PmOVBtSOSn0kfWkEqJrx/hiR7Bt5KWVou63D+Hr
         NPFlCwej9lwzIrfb27MGqFBYkO0k5GZMEG8p0dokMfdazdYUAZhUklklZxdMRC74KNPW
         c4bKf158VJao3CGafzsD/tzhlK0Jt7474wGLoIXMizMsXgNUnfaxGUNws9VSCt7GgSSq
         SrKOuIfRmor9aIEFUsUzAwq1c+tkeT6crWgNUghtOD0cvoHcjD9tWOMUmVcCyQv7PAgb
         zsFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760537924; x=1761142724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uOHuMY6DLdNVFSfR66Pn+DtHfdJs+CgmYpWBJcIxgno=;
        b=FpzGdO4+l7aFeEZTz3k7K1/x7moeLIhHO47QQ44awqlwodSZToCMCP912QSB0Ws5GD
         mPuj3z5y3ArUzumi9TAdNXkRSF+USb6hGqzvmEAAEzkYLCJyNLUXZx/Uj02cYC89f3Q3
         CgmKOzwAbAPDkdjl6i6jSIfL1d+a7GiTAjibHokv809ZMKonJI6k/xA/wpxY+f8SqZWG
         3tGQijU8aUJKVeF6T1BQgBp3KOMUVJuxw+bwsDqBosacK0v+T1xQ1wnYXsodIcje8vyc
         oLzy1bD5FW8TrDIkzuIE4CZqL2vczsPhfEraZ4tFCrmisXcw41QkBUKOkudIG50hGvfa
         A8Og==
X-Gm-Message-State: AOJu0YzidaPfczRkacoHdJWOdqIokgJ7vzcWpu3+wofNnmb+3bbWifTj
	y8F6Y++91zN8JVto2gzdARyWK7f7pUqpmT8RNaLYE4cYSDV+rk3D6mFIwD6Z2K6HlS4mYVhPQho
	3jF1nPs0ZFvdJ+3NF2WseRT4Qzf2327SSa2UzcCroV27iFwOZPrvX
X-Gm-Gg: ASbGncvOn5+f0VyY7Nff9hAeueJyt56xD0tKZ/wCvQok2cY7VWofnStyTD4y+CelfUS
	7Ff7K+uyB/aQs2Tk4zYUc1jhKFSJucRYQu3Md2gcsIzRc0qwyc4pvx2je2N+LPVT6FTPWjcK1Md
	xXMdUvgaxCy60x0S9BUIyZMKQ9wsxP0p+fu2kZdw8HItLOdHEiJvaGg2JDb4gYgpINVkdnJOmC8
	4Ev0AVdGJ1zBTu3gDoc7FuFQIXVMkty+pukD4fbVVeeUQ==
X-Google-Smtp-Source: AGHT+IGSDQPmQW0Yp4fijEughxTFQQIS7lrBdCSzAc71HthixyD+ToRjxkW4bU7K0CVD2Y0exdc1ADR19VxYf76Ui7E=
X-Received: by 2002:a05:6512:3a8e:b0:585:b05f:9459 with SMTP id
 2adb3069b0e04-5906dd6f9ccmr7795297e87.27.1760537924245; Wed, 15 Oct 2025
 07:18:44 -0700 (PDT)
MIME-Version: 1.0
References: <20251014055330.59506-1-weidong.wd@bytedance.com>
In-Reply-To: <20251014055330.59506-1-weidong.wd@bytedance.com>
From: dong wei <weidong.wd@bytedance.com>
Date: Wed, 15 Oct 2025 22:18:33 +0800
X-Gm-Features: AS18NWBedsTE9NM3mOooJxDj0dx02lNwGCKOk0negL8TzBX8uPBMebYR74k6ewI
Message-ID: <CAHLiX_G1m-9R--j3T0V5zdTmEkCUjaxRCn-cEk-2_ZSeLHA0ZQ@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: sse: add local unknown nmi event
To: opensbi@lists.infradead.org
Cc: cuiyunhui@bytedance.com, heshuan@bytedance.com, wangziang.ok@bytedance.com, 
	atishp@rivosinc.com, anup@brainfault.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_071849_482644_B50E86B6 
X-CRM114-Status: GOOD (  15.36  )
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

QWRkIG1vcmUgcmV2aWV3ZXJzLgoKT24gVHVlLCBPY3QgMTQsIDIwMjUgYXQgMTo1NOKAr1BNIHdl
aWRvbmd3ZCA8d2VpZG9uZy53ZEBieXRlZGFuY2UuY29tPiB3cm90ZToKPgo+IEFkZCB0aGUgaWQg
b2YgbG9jYWwgdW5rbm93biBubWkgZXZlbnQgYW5kIGFkZCB0aGlzIGV2ZW50IHRvIHRoZQo+IGxp
c3Qgb2Ygc3VwcG9ydGVkIGV2ZW50cy4KPgo+IFNpZ25lZC1vZmYtYnk6IHdlaWRvbmd3ZCA8d2Vp
ZG9uZy53ZEBieXRlZGFuY2UuY29tPgo+IC0tLQo+ICBpbmNsdWRlL3NiaS9zYmlfZWNhbGxfaW50
ZXJmYWNlLmggfCAzICsrLQo+ICBsaWIvc2JpL3NiaV9zc2UuYyAgICAgICAgICAgICAgICAgfCA4
ICsrKysrKystCj4gIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3NiaV9lY2FsbF9pbnRlcmZhY2UuaCBi
L2luY2x1ZGUvc2JpL3NiaV9lY2FsbF9pbnRlcmZhY2UuaAo+IGluZGV4IGFmN2EwNWEuLjhiYjBk
MzkgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9zYmkvc2JpX2VjYWxsX2ludGVyZmFjZS5oCj4gKysr
IGIvaW5jbHVkZS9zYmkvc2JpX2VjYWxsX2ludGVyZmFjZS5oCj4gQEAgLTQzNiw3ICs0MzYsOCBA
QCBlbnVtIHNiaV9zc2Vfc3RhdGUgewo+Cj4gIC8qIFJhbmdlIDB4ZmZmZjAwMDAgLSAweGZmZmZm
ZmZmICovCj4gICNkZWZpbmUgU0JJX1NTRV9FVkVOVF9MT0NBTF9TT0ZUV0FSRSAgICAgICAgICAg
MHhmZmZmMDAwMAo+IC0jZGVmaW5lIFNCSV9TU0VfRVZFTlRfTE9DQUxfUkVTRVJWRURfM19TVEFS
VCAgIDB4ZmZmZjAwMDEKPiArI2RlZmluZSBTQklfU1NFX0VWRU5UX0xPQ0FMX1VOS05PV05fTk1J
ICAgICAgICAgICAgICAgIDB4ZmZmZjAwMDEKPiArI2RlZmluZSBTQklfU1NFX0VWRU5UX0xPQ0FM
X1JFU0VSVkVEXzNfU1RBUlQgICAweGZmZmYwMDAyCj4gICNkZWZpbmUgU0JJX1NTRV9FVkVOVF9M
T0NBTF9SRVNFUlZFRF8zX0VORCAgICAgMHhmZmZmM2ZmZgo+ICAjZGVmaW5lIFNCSV9TU0VfRVZF
TlRfTE9DQUxfUExBVF8zX1NUQVJUICAgICAgIDB4ZmZmZjQwMDAKPiAgI2RlZmluZSBTQklfU1NF
X0VWRU5UX0xPQ0FMX1BMQVRfM19FTkQgICAgICAgICAweGZmZmY3ZmZmCj4gZGlmZiAtLWdpdCBh
L2xpYi9zYmkvc2JpX3NzZS5jIGIvbGliL3NiaS9zYmlfc3NlLmMKPiBpbmRleCA5ODZiNzcwLi5l
NzcxZWZlIDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkvc2JpX3NzZS5jCj4gKysrIGIvbGliL3NiaS9z
Ymlfc3NlLmMKPiBAQCAtMTgyLDkgKzE4MiwxNCBAQCBzdHJ1Y3Qgc3NlX2V2ZW50X2luZm8gZ2xv
YmFsX3NvZnR3YXJlX2V2ZW50ID0gewo+ICAgICAgICAgU0JJX1NMSVNUX05PREVfSU5JVChOVUxM
KSwKPiAgfTsKPgo+ICtzdHJ1Y3Qgc3NlX2V2ZW50X2luZm8gbG9jYWxfdW5rbm93bl9ubWlfZXZl
bnQgPSB7Cj4gKyAgICAgICAuZXZlbnRfaWQgPSBTQklfU1NFX0VWRU5UX0xPQ0FMX1VOS05PV05f
Tk1JLAo+ICsgICAgICAgU0JJX1NMSVNUX05PREVfSU5JVCgmZ2xvYmFsX3NvZnR3YXJlX2V2ZW50
KSwKPiArfTsKPiArCj4gIHN0cnVjdCBzc2VfZXZlbnRfaW5mbyBsb2NhbF9zb2Z0d2FyZV9ldmVu
dCA9IHsKPiAgICAgICAgIC5ldmVudF9pZCA9IFNCSV9TU0VfRVZFTlRfTE9DQUxfU09GVFdBUkUs
Cj4gLSAgICAgICBTQklfU0xJU1RfTk9ERV9JTklUKCZnbG9iYWxfc29mdHdhcmVfZXZlbnQpLAo+
ICsgICAgICAgU0JJX1NMSVNUX05PREVfSU5JVCgmbG9jYWxfdW5rbm93bl9ubWlfZXZlbnQpLAo+
ICB9Owo+Cj4gIHN0YXRpYyBTQklfU0xJU1RfSEVBRChzdXBwb3J0ZWRfZXZlbnRzLCBzc2VfZXZl
bnRfaW5mbykgPQo+IEBAIC0yMDIsNiArMjA3LDcgQEAgc3RhdGljIGNvbnN0IHVpbnQzMl90IHN0
YW5kYXJkX2V2ZW50c1tdID0gewo+ICAgICAgICAgU0JJX1NTRV9FVkVOVF9MT0NBTF9MT1dfUFJJ
T19SQVMsCj4gICAgICAgICBTQklfU1NFX0VWRU5UX0dMT0JBTF9MT1dfUFJJT19SQVMsCj4gICAg
ICAgICBTQklfU1NFX0VWRU5UX0xPQ0FMX1NPRlRXQVJFLAo+ICsgICAgICAgU0JJX1NTRV9FVkVO
VF9MT0NBTF9VTktOT1dOX05NSSwKPiAgICAgICAgIFNCSV9TU0VfRVZFTlRfR0xPQkFMX1NPRlRX
QVJFLAo+ICB9Owo+Cj4gLS0KPiAyLjIwLjEKPgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9w
ZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL29wZW5zYmkK
