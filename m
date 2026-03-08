Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD98F55107
	for <opensbi@archiver.kernel.org>; Sun,  8 Mar 2026 04:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+xvZq6d9EJPJo/29x6lDW+G9soTiZOHg+x7DqfkdjhM=; b=2OaAPylay7HdR/
	zEOyTcqf4lrTNaJAU6gLAaxHw1iDtRElMtqyHLVEorr6foB4pskR1yhbG75OlyuewpjGJo/keQ/g3
	xACIGCtSbNgxaIUlIvisLsX3Gg1lR7bTUNbioxW0g9kTMpyU0PdQIJD/RjG01pjnS+ZD5JqeN8s60
	T5M5ryvN7DgPLsKdl0N8u33GTo04l36nDhYO+9+FvF6FmfJNw5Qdq3Scvgo4UEAYkQHqZEYolYP3z
	H9NpMJtwrjJEs0iA7vftOJ3dD5UpZzpa4czDB0wIgP3Rfc0oWBV+tSqVu3kZqZrAAbLenR1mWIeBW
	caxIfm0u787aE3HbOKoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vz5kE-00000005hEq-0H32;
	Sun, 08 Mar 2026 04:27:58 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vz5kA-00000005hEU-0oKl
	for opensbi@lists.infradead.org;
	Sun, 08 Mar 2026 04:27:55 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-67bb19ac35aso958eaf.1
        for <opensbi@lists.infradead.org>; Sat, 07 Mar 2026 20:27:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772944072; cv=none;
        d=google.com; s=arc-20240605;
        b=BVqZFHuXE2jo6rUt76ah8MvfV15j3ukAveJSVjgRvDXcv0UgqgL1BYLT78qcs1H0Sf
         Zi/KDXPteNAn2kpxbSArs+dt8XKzH9jVxvOFk213B8Ehi6F/G5IlthvI39xTKoSz6QTb
         XHmvkUz7bw/JR0QJ7uBQbc/y36zeRcGsZXX+Es6cawQpRrN5We8GeLOo9RQ9sQ365dn4
         Z19TtJNeE/fmNrzgnhJzJXfGirH2emBaEhyBnc68iR6dAsL8b0cKt30WU0clrny51qII
         26W/SeSWIzSFQmYZdvS4vfjoFRtZyC2zNEYlg/1t6a1qjzKMbDkvtRzD29pfiAEM7c7b
         6Ilw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RB/BSuHUylHl2NL6hezJ4t2DXTrDLJkWBKXZg8rfNSw=;
        fh=EqS1Zu/gSM9O/RIUDVoEdGcgcqG6nuU3RBXhJR4WCNI=;
        b=N3S+syUxCvxUOzOUh8nKjtJlFzLoK9bUKYHWvbmQR7dHTD8PrO9VCsekYwa32VRxm5
         bh0aNw1slYTK2a5wv+5hRTl8lZVJ5bVwvc0iVT/Fe3gM550k3GAEDjmgQ7StEzH9S/jw
         9mlMBSLNFCj1eTuNpu9IEK4iNqxoyL6YqBImpF+KA11QM74e3EnZ5type+PSb1z6fkmE
         FmCKM0qthbRMFPLlr9nm7sPkVjab83neeZGhs8F+dHvXXobEEMmiU03X1Kcd+Don+4xw
         Hgc0xPfu8XEJjAMYKUBjmw0R9GOJN6+VZijpif1z9iFgftatrY10XUAvfEHBGxwUqyiA
         aRUQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1772944072; x=1773548872; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RB/BSuHUylHl2NL6hezJ4t2DXTrDLJkWBKXZg8rfNSw=;
        b=pxe6mfrLytQQDXrbZDf8YL60hTYhxCgB1yzgjyOI9HTiAxohqFzKfy/rGQg0X9+ZEx
         jlxgxXHMYcISCq82LeIxePEDIwQOxRLTZvqvtbPMwy1whgPrSbzPalquxUQY1Ip/PInD
         oI7rle+xb9L0y275X2W6V9QwtGZHNZ6vsW08RKUrtJ9MosIxigVo8oDJ8NK/UhOFUZvi
         qCX4/MGbGjTCoUftQ5qEZBMF50i3MPIUSIUBx9jr9Sbl1/AIuXETYjW/7BgJv4q06UTQ
         KTQJpZD1Bi06+fL79sJjaO7ED/eCaqVtdp3iaidyDLDH+gXZpXw7YNjpSZV7R+ZKeSyB
         eksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772944072; x=1773548872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RB/BSuHUylHl2NL6hezJ4t2DXTrDLJkWBKXZg8rfNSw=;
        b=WNtxWsD71AfBNPVdV9+kNwZVePXtYi5DMACyZP5ZHDsIiI76g284Q2lfNAqAMJYHNg
         kCTnmCn6cdV7a05oxxdnt4hnX2jP2spC3kDcmZ5E7FSxohwxGzrxCvPqW6toeQAlRX4q
         BVHA5Ep91PS0pzaCjo7hy9D9OzP5GUiCyJQiQ9EG8T9PFI8luLukErJTJTNJlPqRcy03
         zPJBm3ftHNOl/am2cFWafidyWbiUee/AdNKW3xWMeSahpssdFw72HXxQHliv3G1tVJvM
         4qG0cLTj6PrZicACDLQkHt+9FbArPpUrxDkLOK8+unJbSkc1dqYJAY+Z3m/1d1RLZ8Si
         b6XA==
X-Gm-Message-State: AOJu0YzGj/EU01DbOlsIqUNCxJJhZDcmG9BTjRGV2qLk2tccINvJdGoy
	c7XwcDvyqdE7yO8F0x67kfu8lo9OMwfgSCsnvg+lwBGv7XR+dJEqKXmp0bm8lcEaAZirny1LdGj
	UdXvvDL74FyEnsE6Nlp1E6VH8j71yU98TAvSbY0uGJw==
X-Gm-Gg: ATEYQzzuRLcaZSKzhdcpuDRZulVFzvcvAMHc1LGrZxbEDNo5thbYZ3poDwPPHwr2qqi
	j4eVkWTqtNPpewZz8Oshx1c5wVbjfhbIUlSnRQ1h7JtUOhyFrNpzp4MsuHyUiQZ8ekUv6f7NpBm
	6CJ9OBhBL79Aoww0u/URd8W+g4cCRPtBHnud35TcYoyIKvucTKgI/QmbEzuMKJyyUX2YMwHDFha
	Gw8nNpm8fX5uA66VIDapdcyqflpxJnlQPMcf5wFMW5WKBNPX75WZVytdHzr9vabMK2H5jxpaUXa
	5Eg8cNuw6GftvyCGdN671PGTfNRkhQxJfkAjXoIV+WtQIYAC7X7d/GWRsiIbxUT2Orug+9JOuNN
	msj+t/jUzL/zrWNm5N+T309HejeVJMS4+Wl/W
X-Received: by 2002:a4a:e842:0:b0:677:4fc0:a852 with SMTP id
 006d021491bc7-67b9bcd4c6fmr4863130eaf.34.1772944072094; Sat, 07 Mar 2026
 20:27:52 -0800 (PST)
MIME-Version: 1.0
References: <20260129-smrnmi-v3-v1-0-5d297d3e2027@sifive.com> <20260129-smrnmi-v3-v1-1-5d297d3e2027@sifive.com>
In-Reply-To: <20260129-smrnmi-v3-v1-1-5d297d3e2027@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 8 Mar 2026 09:57:38 +0530
X-Gm-Features: AaiRm52XFQ4FQDQu4SaHaXOiuD_19JL7LSeY9s4A8b2-Fk_8cu8uHGdN-Hx2UYM
Message-ID: <CAAhSdy2Pz4VtpBrr2oYL9B8S89CELH=eR8shMyfTaucjoYegRQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] lib: sbi: Add Smrnmi extension detection
To: Nylon Chen <nylon.chen@sifive.com>
Cc: opensbi@lists.infradead.org, Zong Li <zong.li@sifive.com>, 
	Nick Hu <nick.hu@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_202754_552155_C6BF31A4 
X-CRM114-Status: GOOD (  15.69  )
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

T24gVGh1LCBKYW4gMjksIDIwMjYgYXQgMTo0NOKAr1BNIE55bG9uIENoZW4gPG55bG9uLmNoZW5A
c2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiBBZGQgZGV0ZWN0aW9uIHN1cHBvcnQgZm9yIHRoZSBSSVND
LVYgU21ybm1pIChSZXN1bWFibGUgTm9uLU1hc2thYmxlCj4gSW50ZXJydXB0cykgZXh0ZW5zaW9u
Lgo+Cj4gQ28tZGV2ZWxvcGVkLWJ5OiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPgo+IFN1Z2dlc3RlZC1ieTog
TmljayBIdSA8bmljay5odUBzaWZpdmUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IE55bG9uIENoZW4g
PG55bG9uLmNoZW5Ac2lmaXZlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBZb25nLVh1YW4gV2FuZyA8
eW9uZ3h1YW4ud2FuZ0BzaWZpdmUuY29tPgo+IC0tLQo+ICBpbmNsdWRlL3NiaS9yaXNjdl9lbmNv
ZGluZy5oIHwgMTEgKysrKysrKysrKysKPiAgaW5jbHVkZS9zYmkvc2JpX2hhcnQuaCAgICAgICB8
ICAyICsrCj4gIGxpYi9zYmkvc2JpX2hhcnQuYyAgICAgICAgICAgfCAgMSArCj4gIDMgZmlsZXMg
Y2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3Jp
c2N2X2VuY29kaW5nLmggYi9pbmNsdWRlL3NiaS9yaXNjdl9lbmNvZGluZy5oCj4gaW5kZXggYjVh
NGNlODEuLmViNTU2MzgwIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvc2JpL3Jpc2N2X2VuY29kaW5n
LmgKPiArKysgYi9pbmNsdWRlL3NiaS9yaXNjdl9lbmNvZGluZy5oCj4gQEAgLTIxNSw2ICsyMTUs
MTEgQEAKPgo+ICAjZW5kaWYKPgo+ICsvKiBTbXJubWkgZXh0ZW5zaW9uIHN0YXR1cyBiaXRzICov
Cj4gKyNkZWZpbmUgTU5TVEFUVVNfTk1JRSAgICAgICAgICAgICAgICAgIChfVUwoMHg4KSkKPiAr
I2RlZmluZSBNTlNUQVRVU19NTlBWICAgICAgICAgICAgICAgICAgKF9VTCgweDgwKSkKPiArI2Rl
ZmluZSBNTlNUQVRVU19NTlBQICAgICAgICAgICAgICAgICAgKF9VTCgweDE4MDApKQoKUGxlYXNl
IGFkZCBkZWZpbmUgZm8gbW5zdGF0dXMuTU5QRUxQIGJpdCBhcyB3ZWxsLgoKPiArCj4gICNkZWZp
bmUgTUhQTUVWRU5UX1NTQ09GX01BU0sgICAgICAgICAgIF9VTEwoMHhGRjAwMDAwMDAwMDAwMDAw
KQo+Cj4gICNkZWZpbmUgRU5WQ0ZHX1NUQ0UgICAgICAgICAgICAgICAgICAgIChfVUxMKDEpIDw8
IDYzKQo+IEBAIC03ODAsNiArNzg1LDEyIEBACj4gICNkZWZpbmUgQ1NSX01WSVBIICAgICAgICAg
ICAgICAgICAgICAgIDB4MzE5Cj4gICNkZWZpbmUgQ1NSX01JUEggICAgICAgICAgICAgICAgICAg
ICAgIDB4MzU0Cj4KPiArLyogU21ybm1pIGV4dGVuc2lvbiByZWdpc3RlcnMgKi8KPiArI2RlZmlu
ZSBDU1JfTU5TQ1JBVENIICAgICAgICAgICAgICAgICAgMHg3NDAKPiArI2RlZmluZSBDU1JfTU5F
UEMgICAgICAgICAgICAgICAgICAgICAgMHg3NDEKPiArI2RlZmluZSBDU1JfTU5DQVVTRSAgICAg
ICAgICAgICAgICAgICAgMHg3NDIKPiArI2RlZmluZSBDU1JfTU5TVEFUVVMgICAgICAgICAgICAg
ICAgICAgMHg3NDQKPiArCj4gIC8qIFZlY3RvciBleHRlbnNpb24gcmVnaXN0ZXJzICovCj4gICNk
ZWZpbmUgQ1NSX1ZTVEFSVCAgICAgICAgICAgICAgICAgICAgIDB4OAo+ICAjZGVmaW5lIENTUl9W
TCAgICAgICAgICAgICAgICAgICAgICAgICAweGMyMAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3Ni
aS9zYmlfaGFydC5oIGIvaW5jbHVkZS9zYmkvc2JpX2hhcnQuaAo+IGluZGV4IGE3ODhiMzRjLi43
ZDAzOGExOCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3NiaS9zYmlfaGFydC5oCj4gKysrIGIvaW5j
bHVkZS9zYmkvc2JpX2hhcnQuaAo+IEBAIC04Nyw2ICs4Nyw4IEBAIGVudW0gc2JpX2hhcnRfZXh0
ZW5zaW9ucyB7Cj4gICAgICAgICBTQklfSEFSVF9FWFRfWFNJRklWRV9DRkxVU0hfRF9MMSwKPiAg
ICAgICAgIC8qKiBIYXJ0IGhhcyBYc2ZjZWFzZSBleHRlbnNpb24gKi8KPiAgICAgICAgIFNCSV9I
QVJUX0VYVF9YU0lGSVZFX0NFQVNFLAo+ICsgICAgICAgLyoqIEhBUlQgaGFzIFNtcm5taSBleHRl
bnNpb24gKiovCj4gKyAgICAgICBTQklfSEFSVF9FWFRfU01STk1JLAo+Cj4gICAgICAgICAvKiog
TWF4aW11bSBpbmRleCBvZiBIYXJ0IGV4dGVuc2lvbiAqLwo+ICAgICAgICAgU0JJX0hBUlRfRVhU
X01BWCwKPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfaGFydC5jIGIvbGliL3NiaS9zYmlfaGFy
dC5jCj4gaW5kZXggNjBlOTViY2EuLjQ5NWFkMWQ4IDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkvc2Jp
X2hhcnQuYwo+ICsrKyBiL2xpYi9zYmkvc2JpX2hhcnQuYwo+IEBAIC0zOTYsNiArMzk2LDcgQEAg
Y29uc3Qgc3RydWN0IHNiaV9oYXJ0X2V4dF9kYXRhIHNiaV9oYXJ0X2V4dFtdID0gewo+ICAgICAg
ICAgX19TQklfSEFSVF9FWFRfREFUQShzc3N0YXRlZW4sIFNCSV9IQVJUX0VYVF9TU1NUQVRFRU4p
LAo+ICAgICAgICAgX19TQklfSEFSVF9FWFRfREFUQSh4c2ZjZmx1c2hkbG9uZSwgU0JJX0hBUlRf
RVhUX1hTSUZJVkVfQ0ZMVVNIX0RfTDEpLAo+ICAgICAgICAgX19TQklfSEFSVF9FWFRfREFUQSh4
c2ZjZWFzZSwgU0JJX0hBUlRfRVhUX1hTSUZJVkVfQ0VBU0UpLAo+ICsgICAgICAgX19TQklfSEFS
VF9FWFRfREFUQShzbXJubWksIFNCSV9IQVJUX0VYVF9TTVJOTUkpLAo+ICB9Owo+Cj4gIF9TdGF0
aWNfYXNzZXJ0KFNCSV9IQVJUX0VYVF9NQVggPT0gYXJyYXlfc2l6ZShzYmlfaGFydF9leHQpLAo+
Cj4gLS0KPiAyLjQzLjcKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlA
bGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vb3BlbnNiaQoKT3RoZXJ3aXNlLCBMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0
ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRzLApBbnVwCgotLSAKb3BlbnNiaSBtYWls
aW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
