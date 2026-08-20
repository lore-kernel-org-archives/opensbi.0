Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E72C5DF82
	for <opensbi@archiver.kernel.org>; Thu, 20 Aug 2026 07:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FawOGJPxMBeFYIriMfWnvyqHFGmQ/2MT6jWM6rR4IuA=; b=2PXpBdwlkQBOCX
	YWJ4qSlVMlOmX5i6D0Ctr1eMhAeOT2NVfZRbA3xK9YdIVDKugP19JeZqwnWI2K8/VVkTl6GH221j5
	DznlDXAl1ZXbp9QE7RfeHHCsct8NVntUA1ObdWCRXPVl/kfxPImjKkFMlEZHdpLOLjW36AiivaRss
	Kdt8Y0YTUXPeCCRoryAby7haz9tX80kFqZdwiBlWC6wUl8kbwfw+5hDvqIMj2nTSvp28GZ/tkDo6o
	6pIxlhXT9Azk08YEwbx9i+/3GEDB2vAlGA+1ih2aJjGx9SNxobj1JgFionY+s4Af4cbFIQGvsWEwR
	tePGmRka7jmTGQDbesFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwxJi-0000000B4nN-2mEr;
	Thu, 20 Aug 2026 07:36:02 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwxJg-0000000B4md-3zpq
	for opensbi@lists.infradead.org;
	Thu, 20 Aug 2026 07:36:02 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so1595126f8f.1
        for <opensbi@lists.infradead.org>; Thu, 20 Aug 2026 00:36:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787211359; cv=none;
        d=google.com; s=arc-20260327;
        b=ImhUX307m8UYNxTr5Dtw1ZUmEUkKJYg20wZM/pOUR38Bze6yzbOp6+UWLQ81F55Jsx
         AOrXK6K85JOAs2bS1alRZK64PCwkxmyV8EIXzxg22U5guzLQ7v6H26seEr17d5Zitngy
         RAmdYz+ra9FO/eGP7XMZMIQldfmOG4Ep6kwE6RjXyEpYvTFL72t5CcF6fxI13W2tT7XV
         4Q1aJdBhyyxD22KxcZ5xB+6Oqsm7C38UeJ3RwUsrfnvBH6GVjwN++PTv53KbPgGBUUlc
         3XiXDJd15F2XKEBZ9t8yQyuKO+2+55nnKxqMePeHjo+yjfczmdTouPxFCqQL+GZvg/1v
         Mr/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JPCYZYenqzYHtA3Ee+lZG7xjJlaPXBgFEHK4BaAWFLs=;
        fh=7iba1PYumI35x2WONPxi87j9AOvWXc7eyKsk2QZbnvk=;
        b=poqvEWI39VxOKRMA5HJb0bkyRP0F/gfg6W+XijwrIcLmkZ33puHKS6mNAFSiLdOCb/
         /dWET+7V/Pde0U5gRc7ZGlYAFrzP+qAJNhy3GIKM8ASmx7k2WR4BXLducK35MrX+/5jt
         mgESh67dGRuSvz6YTpBHnA5T2xJH+dJttFJZPIV0EzSM9upto6/dziwOq6c1Ktm+WuM+
         eJoWc2aPWvXu5YOZQ3tYUjlSIpyufr2EYWR170a/s5fIg1FP0MyrQWWzDRwyaYG4MkWc
         bmH9NVhdaZ2zTkzaXaP9eIZArlR0i05kVaChl4rd9OOm8G3u+RczH8qoW7APwtxjP6Ry
         nCxQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1787211359; x=1787816159; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JPCYZYenqzYHtA3Ee+lZG7xjJlaPXBgFEHK4BaAWFLs=;
        b=HP3aKWjX6Jgp4L1K4+shpH/F81J20hIbRCSd14G+APG4vRM37sN6VuqemDmEghAUvu
         +v6gXV4z89iEKtkND/UIkD12a6vkpgifgZBJA+pVIcf3q9bn95vZiuslLyHjmdH1/hGM
         DY1qagpLD6tUJoNqYsTQf9hBxy71Ik6eeYmQvHqzQRKtBGLg8vwuZqHttt7B4adcWsgK
         Z+bs5dy8xsoBpT2RYkdw+RdPVNvCdyBIR/soxUNjn+cG1EeIe2/Xgld+rlPLXhxhcICk
         r8oNu+z9ZbIhVbBc9d1t9E/T7NdbdesAKDpVW7gk+7g7anHIsCL2ExHU32fgobRvzd7N
         T08Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787211359; x=1787816159;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JPCYZYenqzYHtA3Ee+lZG7xjJlaPXBgFEHK4BaAWFLs=;
        b=BVJesyTGTsvVa1rf4M74+sai5FsPbkcH/Z+oFnBK9i3v5FXZUQx5JG4S4jvC8UWBAr
         qhdkgk8LtfJE742xiOAa23j/9F2vVBkk/QZPNw3zD9+CxouAlbCEETGO8qyAWkhjK+Lv
         zkGNyuc5K2ch7NDntOZP5J4xCeNtRbgRq3HQ/ac/iVusTK+UgK/pRIWApTBkatDFZ7iq
         QLqZAt28gpi8Ychi/hH2s1G5FlO77sHtQ6j7l2EJB3i7/5Mpg804+Mm/Kod+RXZi/hXb
         5x01rv5uPMurnuGl/h8iro/2pygf7enm8cSGesNLkrc4po0qlPlN4d4SfCZ5Ao9fLGmz
         ZgPg==
X-Gm-Message-State: AFuF++n3NtKZJDxb7kHCCf4ibFk0WEe0y5yxlfpRgbACjieOd72cKjmH
	XHjnkHW1SW2yrpl+bbFQ8GzDENJz8viE+njZ3av7ppa4qHJiLI7DPh8/+hGF5ZgAi+WvPTLlm3c
	OkwcNLhGu18p5+RkXA76HsbPU7n7JOOvKMBiU4QwXPg==
X-Gm-Gg: AR+sD12lSsGEhTpJg+uDFRPmlMoxalHEcYYD9qV9BZpNq+nyVtI1HPmgOhf3CLTfWFr
	e5IsZ+VNWHI5PNe3I42WROYDo2aHYanigiHMEudS4dXwNyFIWuO7Jy18Cnir6W+Wd7vM7YxWzS6
	OqVl+M6aop1vYkSygR8/TvB/tZEgcsYYkLOSyGIWUU5KNODsM8AHenbYc+yqebI0lvcirpuGE2U
	I2PT9po97POonQRkd3Bqt9zokeYpI0vrRSyLTjPiasmCCsLmMzMM3WyX6kEYdchvb0fAkQO3S9j
	JZyhgp0VkvtvAqv2Iu53Q0vRPXJl1cdFxV5Tbdnplp1YNIBcfh8Bg/6u6AbDoKl4B7kQoo+wY3t
	XkbKE58xfmrBrwfptwTv3jWA3lvR/qYRPY0fhXvlq6y647WQsavniV7ruBRap1JTU/QvxmOCynQ
	==
X-Received: by 2002:a05:6000:382:b0:482:aa2a:52f7 with SMTP id
 ffacd0b85a97d-482b1e92974mr19626767f8f.6.1787211359149; Thu, 20 Aug 2026
 00:35:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260724-mt5824-v3-0-9a7d17d69974@bootlin.com> <20260724-mt5824-v3-2-9a7d17d69974@bootlin.com>
In-Reply-To: <20260724-mt5824-v3-2-9a7d17d69974@bootlin.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 20 Aug 2026 13:05:47 +0530
X-Gm-Features: AcwNN1VYDy_6zqAqyqvBwS1PNIM3-ONmk25yhaX7FrasVq_c_rWtHe1Hznl5qLM
Message-ID: <CAAhSdy0wikDjM=5e8N=yuCz1zTeRvw6P0uxmhgz11T6+8fXnNg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] lib: utils/reset: Add Metanoia MT2824 system reset driver
To: =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Cc: opensbi@lists.infradead.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	=?UTF-8?B?UmFuZG9scGggU2hlbmctS2FpIExpbijmnpfogZblh7Ep?= <randolph@andestech.com>, 
	Jun Chang <jun.chang@metanoia-comm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_003601_035088_D9FBB20F 
X-CRM114-Status: GOOD (  25.11  )
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

T24gRnJpLCBKdWwgMjQsIDIwMjYgYXQgOTowNeKAr1BNIEJlbm/DrnQgTW9uaW4gPGJlbm9pdC5t
b25pbkBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBBZGQgYSBkcml2ZXIgZm9yIHRoZSBzeXN0ZW0g
cmVzZXQgZnVuY3Rpb24gZm91bmQgaW4gTWV0YW5vaWEgTVQyODI0IFNvQwo+IGFuZCBlbmFibGUg
aXQgaW4gdGhlIGdlbmVyaWMgcGxhdGZvcm0gY29uZmlndXJhdGlvbi4KPgo+IE9yaWdpbmFsbHkt
Ynk6IEp1biBDaGFuZyA8anVuLmNoYW5nQG1ldGFub2lhLWNvbW0uY29tPgo+IFNpZ25lZC1vZmYt
Ynk6IEJlbm/DrnQgTW9uaW4gPGJlbm9pdC5tb25pbkBib290bGluLmNvbT4KPiAtLS0KPiAgbGli
L3V0aWxzL3Jlc2V0L0tjb25maWcgICAgICAgICAgICAgIHwgIDQgKysKPiAgbGliL3V0aWxzL3Jl
c2V0L2ZkdF9yZXNldF9tZXRhbm9pYS5jIHwgNzIgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrCj4gIGxpYi91dGlscy9yZXNldC9vYmplY3RzLm1rICAgICAgICAgICB8ICAzICsr
Cj4gIHBsYXRmb3JtL2dlbmVyaWMvY29uZmlncy9kZWZjb25maWcgICB8ICAxICsKPiAgNCBmaWxl
cyBjaGFuZ2VkLCA4MCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvbGliL3V0aWxzL3Jl
c2V0L0tjb25maWcgYi9saWIvdXRpbHMvcmVzZXQvS2NvbmZpZwo+IGluZGV4IGIyYWMxMjBlLi44
OTg4NTQ4YyAxMDA2NDQKPiAtLS0gYS9saWIvdXRpbHMvcmVzZXQvS2NvbmZpZwo+ICsrKyBiL2xp
Yi91dGlscy9yZXNldC9LY29uZmlnCj4gQEAgLTI5LDYgKzI5LDEwIEBAIGNvbmZpZyBGRFRfUkVT
RVRfTElURVgKPiAgICAgICAgIGRlcGVuZHMgb24gRkRUX0dQSU8KPiAgICAgICAgIGRlZmF1bHQg
bgo+Cj4gK2NvbmZpZyBGRFRfUkVTRVRfTUVUQU5PSUEKPiArICAgICAgIGJvb2wgIk1ldGFub2lh
IEZEVCByZXNldCBkcml2ZXIiCj4gKyAgICAgICBkZWZhdWx0IG4KPiArCj4gIGNvbmZpZyBGRFRf
UkVTRVRfUlBNSQo+ICAgICAgICAgYm9vbCAiUlBNSSBGRFQgcmVzZXQgZHJpdmVyIgo+ICAgICAg
ICAgZGVwZW5kcyBvbiBGRFRfTUFJTEJPWCAmJiBSUE1JX01BSUxCT1gKPiBkaWZmIC0tZ2l0IGEv
bGliL3V0aWxzL3Jlc2V0L2ZkdF9yZXNldF9tZXRhbm9pYS5jIGIvbGliL3V0aWxzL3Jlc2V0L2Zk
dF9yZXNldF9tZXRhbm9pYS5jCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAw
MC4uNjI4Y2Q4YjYKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvbGliL3V0aWxzL3Jlc2V0L2ZkdF9y
ZXNldF9tZXRhbm9pYS5jCj4gQEAgLTAsMCArMSw3MiBAQAo+ICsvKgo+ICsgKiBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogQlNELTItQ2xhdXNlCj4gKyAqCj4gKyAqIENvcHlyaWdodCAoYykgMjAy
NiBNZXRhbm9pYSBDb21tdW5pY2F0aW9ucyBJbmMuCj4gKyAqCj4gKyAqLwo+ICsKPiArI2luY2x1
ZGUgPHNiaS9yaXNjdl9pby5oPgo+ICsjaW5jbHVkZSA8c2JpL3NiaV9wbGF0Zm9ybS5oPgo+ICsj
aW5jbHVkZSA8c2JpL3NiaV9zeXN0ZW0uaD4KPiArI2luY2x1ZGUgPHNiaV91dGlscy9mZHQvZmR0
X2hlbHBlci5oPgo+ICsjaW5jbHVkZSA8c2JpX3V0aWxzL2ZkdC9mZHRfZHJpdmVyLmg+Cj4gKwo+
ICsjZGVmaW5lIFNXUlNUUkVRX0NUUkxfUkVHX09GRlNFVCAweDAwCj4gKyNkZWZpbmUgU1dSU1RS
RVFfUkVHX09GRlNFVCAweDA0Cj4gKwo+ICtzdHJ1Y3QgcmVzZXRfbWV0YW5vaWFfZGF0YSB7Cj4g
KyAgICAgICB1OCAqcmVnX2Jhc2U7Cj4gK307Cj4gKwo+ICtzdGF0aWMgc3RydWN0IHJlc2V0X21l
dGFub2lhX2RhdGEgcmVzZXRfZGF0YTsKPiArCj4gK3N0YXRpYyBpbnQgbWV0YW5vaWFfc3lzdGVt
X3Jlc2V0X2NoZWNrKHUzMiB0eXBlLCB1MzIgcmVhc29uKQo+ICt7Cj4gKyAgICAgICBzd2l0Y2gg
KHR5cGUpIHsKPiArICAgICAgIGNhc2UgU0JJX1NSU1RfUkVTRVRfVFlQRV9XQVJNX1JFQk9PVDoK
PiArICAgICAgIGNhc2UgU0JJX1NSU1RfUkVTRVRfVFlQRV9DT0xEX1JFQk9PVDoKPiArICAgICAg
ICAgICAgICAgcmV0dXJuIDE7Cj4gKyAgICAgICBjYXNlIFNCSV9TUlNUX1JFU0VUX1RZUEVfU0hV
VERPV046Cj4gKyAgICAgICBkZWZhdWx0Ogo+ICsgICAgICAgICAgICAgICByZXR1cm4gMDsKPiAr
ICAgICAgIH0KPiArfQo+ICsKPiArc3RhdGljIHZvaWQgbWV0YW5vaWFfc3lzdGVtX3Jlc2V0KHUz
MiB0eXBlLCB1MzIgcmVhc29uKQo+ICt7Cj4gKyAgICAgICB3cml0ZXcoMHgxLCByZXNldF9kYXRh
LnJlZ19iYXNlICsgU1dSU1RSRVFfQ1RSTF9SRUdfT0ZGU0VUKTsKPiArICAgICAgIHdyaXRldygw
eDEsIHJlc2V0X2RhdGEucmVnX2Jhc2UgKyBTV1JTVFJFUV9SRUdfT0ZGU0VUKTsKPiArfQo+ICsK
PiArc3RhdGljIHN0cnVjdCBzYmlfc3lzdGVtX3Jlc2V0X2RldmljZSBtZXRhbm9pYV9yZXNldCA9
IHsKPiArICAgICAgIC5uYW1lICAgICAgICAgICAgICAgPSAibWV0YW5vaWEtbXQyODI0LXJlYm9v
dCIsCj4gKyAgICAgICAuc3lzdGVtX3Jlc2V0X2NoZWNrID0gbWV0YW5vaWFfc3lzdGVtX3Jlc2V0
X2NoZWNrLAo+ICsgICAgICAgLnN5c3RlbV9yZXNldCAgICAgICA9IG1ldGFub2lhX3N5c3RlbV9y
ZXNldCwKPiArfTsKPiArCj4gK3N0YXRpYyBpbnQgbWV0YW5vaWFfcmVzZXRfaW5pdChjb25zdCB2
b2lkICpmZHQsIGludCBub2Rlb2ZmLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBj
b25zdCBzdHJ1Y3QgZmR0X21hdGNoICptYXRjaCkKPiArewo+ICsgICAgICAgdTY0IHJlZ19hZGRy
Owo+ICsgICAgICAgaW50IHJjOwo+ICsKPiArICAgICAgIHJjID0gZmR0X2dldF9ub2RlX2FkZHJf
c2l6ZShmZHQsIG5vZGVvZmYsIDAsICZyZWdfYWRkciwgTlVMTCk7Cj4gKyAgICAgICBpZiAocmMg
PCAwIHx8ICFyZWdfYWRkcikKPiArICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FTk9ERVY7Cj4g
Kwo+ICsgICAgICAgcmVzZXRfZGF0YS5yZWdfYmFzZSA9ICh1OCAqKXJlZ19hZGRyOwoKVGhpcyBu
ZWVkcyB0byBiZSAiKHU4ICopKHVsb25nKSIgdHlwZWNhc3QgdG8gYXZvaWQgY29tcGlsZSBlcnJv
cnMgZm9yIFJWMzIuCkkgd2lsbCB1cGRhdGUgYXQgdGhlIHRpbWUgb2YgbWVyZ2luZyB0aGlzIHBh
dGNoLgoKPiArCj4gKyAgICAgICBzYmlfc3lzdGVtX3Jlc2V0X2FkZF9kZXZpY2UoJm1ldGFub2lh
X3Jlc2V0KTsKPiArCj4gKyAgICAgICByZXR1cm4gMDsKPiArfQo+ICsKPiArc3RhdGljIGNvbnN0
IHN0cnVjdCBmZHRfbWF0Y2ggbWV0YW5vaWFfcmVzZXRfbWF0Y2hbXSA9IHsKPiArICAgICAgIHsg
LmNvbXBhdGlibGUgPSAibWV0YW5vaWEsbXQyODI0LXJlYm9vdCIgfSwKPiArICAgICAgIHsgLyog
c2VudGluZWwgKi8gfQo+ICt9Owo+ICsKPiArY29uc3Qgc3RydWN0IGZkdF9kcml2ZXIgZmR0X3Jl
c2V0X21ldGFub2lhID0gewo+ICsgICAgICAgLm1hdGNoX3RhYmxlID0gbWV0YW5vaWFfcmVzZXRf
bWF0Y2gsCj4gKyAgICAgICAuaW5pdCAgICAgICAgPSBtZXRhbm9pYV9yZXNldF9pbml0LAo+ICt9
Owo+IGRpZmYgLS1naXQgYS9saWIvdXRpbHMvcmVzZXQvb2JqZWN0cy5tayBiL2xpYi91dGlscy9y
ZXNldC9vYmplY3RzLm1rCj4gaW5kZXggMzhiNGUzMDYuLmE5YjZlZGFkIDEwMDY0NAo+IC0tLSBh
L2xpYi91dGlscy9yZXNldC9vYmplY3RzLm1rCj4gKysrIGIvbGliL3V0aWxzL3Jlc2V0L29iamVj
dHMubWsKPiBAQCAtMjAsNiArMjAsOSBAQCBsaWJzYml1dGlscy1vYmpzLSQoQ09ORklHX0ZEVF9S
RVNFVF9IVElGKSArPSByZXNldC9mZHRfcmVzZXRfaHRpZi5vCj4gIGNhcnJheS1mZHRfZWFybHlf
ZHJpdmVycy0kKENPTkZJR19GRFRfUkVTRVRfTElURVgpICs9IGZkdF9yZXNldF9saXRleAo+ICBs
aWJzYml1dGlscy1vYmpzLSQoQ09ORklHX0ZEVF9SRVNFVF9MSVRFWCkgKz0gcmVzZXQvZmR0X3Jl
c2V0X2xpdGV4Lm8KPgo+ICtjYXJyYXktZmR0X2Vhcmx5X2RyaXZlcnMtJChDT05GSUdfRkRUX1JF
U0VUX01FVEFOT0lBKSArPSBmZHRfcmVzZXRfbWV0YW5vaWEKPiArbGlic2JpdXRpbHMtb2Jqcy0k
KENPTkZJR19GRFRfUkVTRVRfTUVUQU5PSUEpICs9IHJlc2V0L2ZkdF9yZXNldF9tZXRhbm9pYS5v
Cj4gKwo+ICBjYXJyYXktZmR0X2Vhcmx5X2RyaXZlcnMtJChDT05GSUdfRkRUX1JFU0VUX1NHMjA0
Ml9IV01PTl9NQ1UpICs9IGZkdF9yZXNldF9zZzIwNDJfbWN1Cj4gIGxpYnNiaXV0aWxzLW9ianMt
JChDT05GSUdfRkRUX1JFU0VUX1NHMjA0Ml9IV01PTl9NQ1UpICs9IHJlc2V0L2ZkdF9yZXNldF9z
ZzIwNDJfaHdtb25fbWN1Lm8KPgo+IGRpZmYgLS1naXQgYS9wbGF0Zm9ybS9nZW5lcmljL2NvbmZp
Z3MvZGVmY29uZmlnIGIvcGxhdGZvcm0vZ2VuZXJpYy9jb25maWdzL2RlZmNvbmZpZwo+IGluZGV4
IDgyMGM5OGI2Li5hYzc2ZWIyNyAxMDA2NDQKPiAtLS0gYS9wbGF0Zm9ybS9nZW5lcmljL2NvbmZp
Z3MvZGVmY29uZmlnCj4gKysrIGIvcGxhdGZvcm0vZ2VuZXJpYy9jb25maWdzL2RlZmNvbmZpZwo+
IEBAIC01Miw2ICs1Miw3IEBAIENPTkZJR19GRFRfUkVTRVRfQVRDV0RUMjAwPXkKPiAgQ09ORklH
X0ZEVF9SRVNFVF9HUElPPXkKPiAgQ09ORklHX0ZEVF9SRVNFVF9MSVRFWD15Cj4gIENPTkZJR19G
RFRfUkVTRVRfSFRJRj15Cj4gK0NPTkZJR19GRFRfUkVTRVRfTUVUQU5PSUE9eQo+ICBDT05GSUdf
RkRUX1JFU0VUX1JQTUk9eQo+ICBDT05GSUdfRkRUX1JFU0VUX1NHMjA0Ml9IV01PTl9NQ1U9eQo+
ICBDT05GSUdfRkRUX1JFU0VUX1NQQUNFTUlUX1AxPXkKPgo+IC0tCj4gMi41NS4wCj4KPgo+IC0t
Cj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCk90aGVy
d2lzZSBMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+
CgpBcHBsaWVkIHRoaXMgcGF0Y2ggdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywK
QW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
