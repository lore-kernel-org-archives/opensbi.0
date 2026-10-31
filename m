Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9957F606A31C
	for <opensbi@archiver.kernel.org>; Sat, 31 Oct 2026 12:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=liDokUyy;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=G/LQ07kW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=517hSTKxTq6x4m6waxV72HXZjO2FUhW+uKE3lJO9xBM=; b=liDokUyyZKfrdmQSP0i3ALHi2y
	VqNpxQ9OUTIQ0Xeek18R3xx9NHHLTMlihfKgjyfp4i12D5NZxkmzXWFxmQYXTBTK1vqqK7T5Yl+ej
	WFmwTubx1JlojqB4gEVDMikla1psOnojLG0S+L1iycHti60ivruMmJyY+WAuvw+jJdrRcQiGU8y6L
	Y9R9ZCzZE0jUpLRw6oQM5LObWXEsiSF9NZDhJiiHNVfOg36zU00CwhJsn54BXm/SvItxrxJRFAlQ2
	5BeaGta7NIj+Ww8P5maQjxU5HOLMCttbL4KxS9WxxNzVjkoq4ZX/AAEgcjRBKYxiB+3nife9F4ROr
	OUZV+puw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN8WD-0000000DKv6-1UzU;
	Sat, 31 Oct 2026 12:49:09 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN8WB-0000000DKuV-1vj5
	for opensbi@lists.infradead.org;
	Sat, 31 Oct 2026 12:49:08 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48e04773687so499024f8f.2
        for <opensbi@lists.infradead.org>; Sat, 31 Oct 2026 05:49:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793450945; cv=none;
        d=google.com; s=arc-20260327;
        b=I+cEOcFrG0dqJUwUZQ8N9ncds2vXmGb0XAbl7+EHofXEPiL48UjQpnvKQN0/L617VV
         DNvbUYghCkbSDanC+kBGYdcZKCHnlAMa2ZvT0YZs4Yd/dZ0fWHXyPAOUvq2zxkkFEklV
         hcbFQZWbgiclQFIuGSkIHJypbMsZE3RzoyeMCN7rbrhO8wRui+ojVvn5i9VltyOsx2gt
         hAp/jdE6EAl+vz8htlVkUYdza5vwvrLKWczWoHoUTNjq6ujT7jxjGLMkIV5KBSd3fK5b
         PqDz6AjIMi++O1i764/dFLXF+wOHF7D4IDtp3ISAnwJyqD0pkvygqYmoLRG3hOHfQ6pz
         uSxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0AmCq8u4vRTc1gXfD/KnIHqUKDJpckmtr1HKmb7Tw2o=;
        fh=s0V2QxfkZ31uI08A+gYD94xQ3QEn9NHnxJRAVF9iZzc=;
        b=MhNYhIUPiNC5bvLs71++TcpKCiIgiY1mwge7vf3AGYJ7qKH2Jr7eyxBMKg0MQMB0K4
         QDEmxPV44cTjeZyxkFhp85IF7C0x58Q/KZqaHJME9vtseiQUlNkWqiwXpzfps76fCR/3
         BSSSlKSs0U+eLgxUCESSiQr+D+9iAnEFivcZ8amnlj7KhAY6b0RaxI7tIBisT2naK/u+
         MgYOraC8OueIj9efVfN0T+/wUPrYQEeM/TJsrygQfvoWgPzTxiF6ie7ZoTJqHNp8WQ4q
         uRpB3nyPgg6uSe8UgjI7vptbWFgbtQ99lwfWHxH21VM406iwzf+1CvQQg8Ap6m61gFEU
         s+yw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793450945; x=1794055745; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0AmCq8u4vRTc1gXfD/KnIHqUKDJpckmtr1HKmb7Tw2o=;
        b=G/LQ07kWEODA0wQN5doFwtjFT5qQiu+CAckIGrBe+nFnsxEn+9FEr/MKhXUAnu2Shv
         4wHDXXwUdamw632Q3cIEcSehb0nVNnMl3ebp3GoCwSoie4Ix26NQyj7cIRrPyV/qwck4
         Pt313LvAGnitp05Dnmv8PGOtNeCiMiu/vxY0ZCsrOXaky38wcw7vUYfDW2yiDeHBA11i
         uHNrsLOz6i+jv6ZFzKp8qD+KXo/jtJq8QpY0eV6X/wrV16ZAkewgSJDGaTYdDMaGjjQT
         UwPZZ+vWjPIYp10k+IRdhx+/K0rfKq6K18ng2O9on92VszhJzOz314yMDBETOvHSR23v
         JIzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793450945; x=1794055745;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0AmCq8u4vRTc1gXfD/KnIHqUKDJpckmtr1HKmb7Tw2o=;
        b=OwkSnRyarNN2+jPLW3gJwy0aX2OMD8n6ZQJSHGgoojTkbOP3lX1LB23mDY1Jgh6VXX
         Nl3Vq/LKgeR9LEpWSIxC/NFat4mYN2RVK8cMQulCVF2TRLCEJV/kvlMSTMJ5OxXGxiUW
         aUJ1Sm/tU1zwRfFM2HAaBUJotv03VGrRtfYhqj3izM6lDJNPw7ehXf8/sP17Wd44CPAG
         dUFHyBl/0+6ddAV+UyBvaemglm7/wBRnAzb+zwAGQDfOUl1tJcc/tavY6OFDZ91udqc7
         8yd9Y2kwQY9FOQqx3f+uId7CcREhhmPXdrvC7qp845dBUnt5g9rbT9OwiTUVJnADLRu9
         S9hw==
X-Gm-Message-State: AFq9FYIparQmb4WFd9hVftk7jCPTRmMveXH74noLNSxtSYakWskaTkTk
	TMStM6kBQ3fS2eM62NP60pqjVkwLKHn0QH9E1VdjrfF0d5bir8vcrvEGyMffdmRfhXr39/l9XbR
	I/q+6f44038UN7OAs1Y8PYjryvBiSqlYRubyuIjzk8NnSzy6Qj0d5
X-Gm-Gg: AYBFou0FNA2Tuu6ERp6D7gpkzOC2lTSvzFplGwt24zKwSUfQmO0Q1u+nmXd2mm1hgN0
	KyBpeLwnKKZiAM9DaNVZuWXv3Tq+DOZ4ezusZrhJenkD/5jl9idmAYRf3lpIU0WFmce4HzMy7Lk
	WvuA1oi7QJKIa0P+ULfVF0TZ7leyBoZV80LuL7CoTypQDrFdBUn+YoYGCpKXF11914FUmtFlBfu
	3ft6LaJnjeHuE2XSys/Ty6Nqbh+frpYXu4qzATPpIT2Qo/KdCXI0AQSOy45v+zxT29XbTUs9a2g
	OnpOY2V97Mzn5/V/tEH5hdgWQ0UoXUn+ysyWiWsW0wG0urdDy1mU5C+BYsZ5hF5dRZ2hWIuMykA
	NfZCJokki/QIqbJMgLEKLOh5nymb5SaSa2sr7I/iIC44QOQloTn4ELEzaZeAtUs6Wg7PmoBxWpP
	daE2uyIOHg4wp2g1zm5VK7w5IGyCc42EfuQqFVNJt7Thpb3iYFnQI5byE9
X-Received: by 2002:a05:6000:46c3:b0:48e:4a8a:e17f with SMTP id
 ffacd0b85a97d-48e6e2bc7f2mr7789311f8f.4.1793450944594; Sat, 31 Oct 2026
 05:49:04 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030104518.3297875-1-peter.lin@sifive.com> <20261030104518.3297875-2-peter.lin@sifive.com>
In-Reply-To: <20261030104518.3297875-2-peter.lin@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 31 Oct 2026 18:18:52 +0530
X-Gm-Features: AclHuK-6c3x0L4KFXjRbwsw19EPeU8WBIdsLXS6L9UH5HcKWL2dc7XCOoeb__fk
Message-ID: <CAAhSdy1Kb8aCv2jRwZV1V-rOtPFYgtq6vWKZGm5t0bJjzMMOzw@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] lib: sbi_hart: add RISC-V Worlds ISA extensions
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, pawandeep.oza@oss.qualcomm.com, 
	rkrcmar@qti.qualcomm.com, raymond.mao@riscstar.com, robin.randhawa@sifive.com, 
	samuel.holland@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_054907_529191_CF764ADC 
X-CRM114-Status: GOOD (  13.76  )
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

T24gRnJpLCBPY3QgMzAsIDIwMjYgYXQgNDoxNeKAr1BNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gQWRkIENTUiBkZWZpbml0aW9ucyBmb3IgUklT
Qy1WIFdvcmxkcyAobXdpZCwgbWx3aWQsIG1sd2lkbGlzdCwKPiBtd2lkZGVsZWcsIHNsd2lkKS4K
Pgo+IFNpZ25lZC1vZmYtYnk6IFl1LUNoaWVuIFBldGVyIExpbiA8cGV0ZXIubGluQHNpZml2ZS5j
b20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+
CgpUaGFua3MsCkFudXAKCgo+IC0tLQo+IENoYW5nZSB2My0+djQ6Cj4gLSBEcm9wIHRyYXAgYmFz
ZWQgZXh0ZW5zaW9uIGRldGVjdGlvbiAoQW51cCkKPiAtIERyb3AgUkItdGFnIGZyb20gT3phCj4g
LS0tCj4gIGluY2x1ZGUvc2JpL3Jpc2N2X2VuY29kaW5nLmggfCAxMiArKysrKysrKysrKysKPiAg
aW5jbHVkZS9zYmkvc2JpX2hhcnQuaCAgICAgICB8IDEwICsrKysrKysrKysKPiAgbGliL3NiaS9z
YmlfaGFydC5jICAgICAgICAgICB8ICA1ICsrKysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgMjcgaW5z
ZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3Jpc2N2X2VuY29kaW5nLmgg
Yi9pbmNsdWRlL3NiaS9yaXNjdl9lbmNvZGluZy5oCj4gaW5kZXggZmZlNzY2NmMuLmUwMjYyYmZj
IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvc2JpL3Jpc2N2X2VuY29kaW5nLmgKPiArKysgYi9pbmNs
dWRlL3NiaS9yaXNjdl9lbmNvZGluZy5oCj4gQEAgLTQwMCw2ICs0MDAsOSBAQAo+ICAvKiBTdXBl
cnZpc29yIFJlc291cmNlIE1hbmFnZW1lbnQgQ29uZmlndXJhdGlvbiBDU1JzICovCj4gICNkZWZp
bmUgQ1NSX1NSTUNGRyAgICAgICAgICAgICAgICAgICAgIDB4MTgxCj4KPiArLyogU3VwZXJ2aXNv
ciBsb3dlci1wcml2aWxlZ2UgbW9kZSBXb3JsZCBJRCBDU1IgKFNzd2lkKSAqLwo+ICsjZGVmaW5l
IENTUl9TTFdJRCAgICAgICAgICAgICAgICAgICAgICAweDE5MAo+ICsKPiAgLyogTWFjaGluZS1M
ZXZlbCBDb250cm9sIHRyYW5zZmVyIHJlY29yZHMgQ1NScyAqLwo+ICAjZGVmaW5lIENTUl9NQ1RS
Q1RMICAgICAgICAgICAgICAgICAgICAgMHgzNGUKPgo+IEBAIC01MjAsNiArNTIzLDE1IEBACj4g
ICNkZWZpbmUgQ1NSX01USU5TVCAgICAgICAgICAgICAgICAgICAgIDB4MzRhCj4gICNkZWZpbmUg
Q1NSX01UVkFMMiAgICAgICAgICAgICAgICAgICAgIDB4MzRiCj4KPiArLyogTWFjaGluZSBXb3Js
ZCBJRCBDU1JzIChTbXdpZCwgU21sd2lkLCBTbWx3aWRsaXN0LCBTbXdpZGRlbGVnKSAqLwo+ICsj
ZGVmaW5lIENTUl9NTFdJRCAgICAgICAgICAgICAgICAgICAgICAweDM5MAo+ICsjZGVmaW5lIENT
Ul9NV0lEICAgICAgICAgICAgICAgICAgICAgICAweDc0OQo+ICsjZGVmaW5lIENTUl9NV0lEREVM
RUcgICAgICAgICAgICAgICAgICAweDc0OAo+ICsjZGVmaW5lIENTUl9NTFdJRExJU1QgICAgICAg
ICAgICAgICAgICAweDc0QQo+ICsKPiArLyogbXdpZCBsb2NrIGJpdCAqLwo+ICsjZGVmaW5lIE1X
SURfTE9DSyAgICAgICAgICAgICAgICAgICAgICAoX1VMKDEpIDw8IChfX3Jpc2N2X3hsZW4gLSAx
KSkKPiArCj4gIC8qIE1hY2hpbmUgTWVtb3J5IFByb3RlY3Rpb24gKi8KPiAgI2RlZmluZSBDU1Jf
UE1QQ0ZHMCAgICAgICAgICAgICAgICAgICAgMHgzYTAKPiAgI2RlZmluZSBDU1JfUE1QQ0ZHMSAg
ICAgICAgICAgICAgICAgICAgMHgzYTEKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zYmkvc2JpX2hh
cnQuaCBiL2luY2x1ZGUvc2JpL3NiaV9oYXJ0LmgKPiBpbmRleCBhMDIwY2YwMy4uZWQzNDQ3ODMg
MTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9zYmkvc2JpX2hhcnQuaAo+ICsrKyBiL2luY2x1ZGUvc2Jp
L3NiaV9oYXJ0LmgKPiBAQCAtOTcsNiArOTcsMTYgQEAgZW51bSBzYmlfaGFydF9leHRlbnNpb25z
IHsKPiAgICAgICAgIFNCSV9IQVJUX0VYVF9GLAo+ICAgICAgICAgLyoqIEhhcnQgaGFzIEQgZXh0
ZW5zaW9uICovCj4gICAgICAgICBTQklfSEFSVF9FWFRfRCwKPiArICAgICAgIC8qKiBIYXJ0IGhh
cyBTbXdpZCBleHRlbnNpb24gKi8KPiArICAgICAgIFNCSV9IQVJUX0VYVF9TTVdJRCwKPiArICAg
ICAgIC8qKiBIYXJ0IGhhcyBTbWx3aWQgZXh0ZW5zaW9uICovCj4gKyAgICAgICBTQklfSEFSVF9F
WFRfU01MV0lELAo+ICsgICAgICAgLyoqIEhhcnQgaGFzIFNtbHdpZGxpc3QgZXh0ZW5zaW9uICov
Cj4gKyAgICAgICBTQklfSEFSVF9FWFRfU01MV0lETElTVCwKPiArICAgICAgIC8qKiBIYXJ0IGhh
cyBTbXdpZGRlbGVnIGV4dGVuc2lvbiAqLwo+ICsgICAgICAgU0JJX0hBUlRfRVhUX1NNV0lEREVM
RUcsCj4gKyAgICAgICAvKiogSGFydCBoYXMgU3N3aWQgZXh0ZW5zaW9uICovCj4gKyAgICAgICBT
QklfSEFSVF9FWFRfU1NXSUQsCj4KPiAgICAgICAgIC8qKiBNYXhpbXVtIGluZGV4IG9mIEhhcnQg
ZXh0ZW5zaW9uICovCj4gICAgICAgICBTQklfSEFSVF9FWFRfTUFYLAo+IGRpZmYgLS1naXQgYS9s
aWIvc2JpL3NiaV9oYXJ0LmMgYi9saWIvc2JpL3NiaV9oYXJ0LmMKPiBpbmRleCA5MjVjZmU5Ni4u
NzdlZjFhNzAgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfaGFydC5jCj4gKysrIGIvbGliL3Ni
aS9zYmlfaGFydC5jCj4gQEAgLTM1NSw2ICszNTUsMTEgQEAgY29uc3Qgc3RydWN0IHNiaV9oYXJ0
X2V4dF9kYXRhIHNiaV9oYXJ0X2V4dFtdID0gewo+ICAgICAgICAgX19TQklfSEFSVF9FWFRfREFU
QSh2LCBTQklfSEFSVF9FWFRfViksCj4gICAgICAgICBfX1NCSV9IQVJUX0VYVF9EQVRBKGYsIFNC
SV9IQVJUX0VYVF9GKSwKPiAgICAgICAgIF9fU0JJX0hBUlRfRVhUX0RBVEEoZCwgU0JJX0hBUlRf
RVhUX0QpLAo+ICsgICAgICAgX19TQklfSEFSVF9FWFRfREFUQShzbXdpZCwgU0JJX0hBUlRfRVhU
X1NNV0lEKSwKPiArICAgICAgIF9fU0JJX0hBUlRfRVhUX0RBVEEoc21sd2lkLCBTQklfSEFSVF9F
WFRfU01MV0lEKSwKPiArICAgICAgIF9fU0JJX0hBUlRfRVhUX0RBVEEoc21sd2lkbGlzdCwgU0JJ
X0hBUlRfRVhUX1NNTFdJRExJU1QpLAo+ICsgICAgICAgX19TQklfSEFSVF9FWFRfREFUQShzbXdp
ZGRlbGVnLCBTQklfSEFSVF9FWFRfU01XSURERUxFRyksCj4gKyAgICAgICBfX1NCSV9IQVJUX0VY
VF9EQVRBKHNzd2lkLCBTQklfSEFSVF9FWFRfU1NXSUQpLAo+ICB9Owo+Cj4gIF9TdGF0aWNfYXNz
ZXJ0KFNCSV9IQVJUX0VYVF9NQVggPT0gYXJyYXlfc2l6ZShzYmlfaGFydF9leHQpLAo+IC0tCj4g
Mi40My43Cj4KCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2Jp
Cg==
