Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B2DCD37B6
	for <opensbi@archiver.kernel.org>; Wed, 13 May 2026 08:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5EK0FIAQmtLZ6Pv1XYJCv953YxafumHta0dCMUXNKaI=; b=wI/IShzXUgQRBP
	pcFLi6KHhUd9XL9xmI1v3V+XSWP3r2WBsr/mlrvtsiHH+QWZskin4CkHsGtXwtMXi8BQAJwl/zrat
	io+g7c6jZs1DFE4KxGFEJN9U0P9ZJfpJK2XZq2Vteydv42SsRAWTQx7gCQ0m3rqIDkPsJpSxqIAlO
	MifwVlqg8NQ52xLWO+RtQk3XhQdsppvGZwNHxfkA0KInh5WGhix8gqi3cknBoEMgie+7y8vqqwkCh
	mnfrtxn+TRfiTRJm8A8J52BP2os+aFaFnec45aAuvf2sNgNGC02k2MDs3fy3FdgWaWl/rsRPT2HIL
	E5Naq5FaJ8cge3OJFivA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4f4-00000001gtn-1g1d;
	Wed, 13 May 2026 08:09:46 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4f1-00000001gtE-4AGe
	for opensbi@lists.infradead.org;
	Wed, 13 May 2026 08:09:45 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so77065845e9.0
        for <opensbi@lists.infradead.org>; Wed, 13 May 2026 01:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778659782; x=1779264582; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ehyx1jS9RjWVt4Oo2Fwlr8gN6vBlbClmf/HPyE3vAxA=;
        b=nRftjhd2z6obIZ4LcqAacNT5PKHlCUWkNxlsPO1YpikJ7jEQKbycFy8KfthPTTrzXo
         nqxbaip338CGDkw8LBhgmjMoF2ZhQuinYMG6ehxpRo+5/D5sucXZex77Be6sjsOCcFkM
         fpezbYkq+xkktXm9VQVjNAJZ85v8QFlgc7Sr0nmEBNNDZlvTEA2DRoMUhYlyQxsrxymY
         +4ypgdK3fIPY0V+oAWSfXz/h7raPVgKDsev7Lro1kcVx+PQCOHtPmVOEvrGOmZwBoA64
         ZABZlBeXSKpp70QCoY8GV+5JxA6QanqRIWdGX95X2y8ceLYFm9yEIEy8akKuM3YoHuOj
         tq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778659782; x=1779264582;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ehyx1jS9RjWVt4Oo2Fwlr8gN6vBlbClmf/HPyE3vAxA=;
        b=XDXWt1KYgxftuWHrelOPqenmQcKInMlNvJ/Ul8FqseLqWrt9iYT+8zRNLXLbUdHa+4
         xbK20f97z54vqNRMB/YB51sAnSWyfjsQBzZBEAHwiRanF3sj8DH9KPl7y0Znxic2fWdZ
         AOs3Gz5lX8K5/JAwl+7AoC+eq1DPcBgH//fHFFPy0bsCOPwSLFuuWaCrUPv8B/tGnRJc
         CqZiLxz2BoJwzmDfrwpdRIByXnl5BukYL8J2maYrcWoD5Mg3wHEk/Ffkup6xGSf2Ru21
         IBrQC7s9o5dnUhsf/Qm5nQ7ZPsfyR0ZC71nWe2JXYhfjMrOSyxL3IUVbRFMdTvNY6c1p
         gKSA==
X-Forwarded-Encrypted: i=1; AFNElJ863AuNh2IZYiP++5Fos9DZpOuLPoQJO28BZ5KGQSyq/QsUedtlxYLciBEWn1IEAbAzfEjLdGKy@lists.infradead.org
X-Gm-Message-State: AOJu0YxLiQXKQmUHms9MXqtsO+kRw6zcHJSinAJMiPBlWp3vKKeoPbRm
	EwSNgQJGsxbJ+zEZ6DNMAfgKzWlcvJn3V25uzoZis2aU4lpOIxMudNwSbjAB4lcayW4=
X-Gm-Gg: Acq92OGgAKuZ7QxfFZrgX2tHOz77bNghR3UmRcJfRKaHguJFstpF7bX3Sc8biHsnF+G
	NczJZT7GUAdKpkfkVbrD7r5shRuvBBRrBg3HG/puTP2Nr/EsFmx/Bi6h/0PCOvn+VUhe3KsP/qC
	GtVJRKG3Im2MmkRAV5AiDIlH+g8IAWybHM55Tm6j7CUFm5ne9BiTDNmSVDB0+iFxZrDGl90k84d
	lWphA8J2vAyDPsnsEtWc6XWBiHRCSXGa/LPMjo7y4vtIu3cHX8fbkkWk3QZ/hZUsC20v8upGj6m
	y+gPRW7/mfHLpqSxjSeS85rrZce26hcrMBhP+BXo+/zr9WxifMiaMRemLjMuogSEoX1m9tAxfzF
	UuHY60iUFZuXkZL7Q8zo3toz3+S8GCmBuhQ17xNh2yguWMX1c0AMalM6NYYUF0puGvd9cmr2YaL
	v5hcI+Qi8sVcGzS6bHswVRMGiZOMaOhBcmaigkQobyFu7ef/QNR94ie3mrPjrfFg==
X-Received: by 2002:a05:600c:4f53:b0:48e:8974:c377 with SMTP id 5b1f17b1804b1-48fc9a53d16mr27391125e9.29.1778659781880;
        Wed, 13 May 2026 01:09:41 -0700 (PDT)
Received: from [172.27.130.2] (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d624fbsm125834975e9.10.2026.05.13.01.09.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 01:09:41 -0700 (PDT)
Message-ID: <a9a7eefc-acd5-4b66-b858-2be5c244c4e8@riscstar.com>
Date: Wed, 13 May 2026 09:09:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] lib: sbi: domain FP/Vector context support for
 context switch
To: Anup Patel <anup@brainfault.org>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>,
 Anup Patel <anuppate@qti.qualcomm.com>, Scott Bambrough
 <scott@riscstar.com>, Robin Randhawa <robin.randhawa@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Ray Mao <raymond.mao@riscstar.com>, Dhaval <dhaval@rivosinc.com>,
 Peter Lin <peter.lin@sifive.com>, opensbi@lists.infradead.org
References: <20260513071418.50957-1-dave.patel@riscstar.com>
 <20260513071418.50957-4-dave.patel@riscstar.com>
 <CAAhSdy2M2kxyLD6+JFDmsN5-vr6FtZy-B0mSXk45AusgGs8dyw@mail.gmail.com>
Content-Language: en-US
From: Dave Patel <dave.patel@riscstar.com>
In-Reply-To: <CAAhSdy2M2kxyLD6+JFDmsN5-vr6FtZy-B0mSXk45AusgGs8dyw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_010944_063785_43C986E8 
X-CRM114-Status: GOOD (  24.45  )
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

T24gNS8xMy8yNiAwODo1NCwgQW51cCBQYXRlbCB3cm90ZToKPiBPbiBXZWQsIE1heSAxMywgMjAy
NiBhdCAxMjo0NOKAr1BNIDxkYXZlLnBhdGVsQHJpc2NzdGFyLmNvbT4gd3JvdGU6Cj4+Cj4+IEZy
b206IERhdmUgUGF0ZWwgPGRhdmUucGF0ZWxAcmlzY3N0YXIuY29tPgo+Pgo+PiBUaGlzIHBhdGNo
IGFkZHMgcHJvcGVyIHN1cHBvcnQgZm9yIHBlci1kb21haW4gZmxvYXRpbmctcG9pbnQgKEZQKSBh
bmQKPj4gdmVjdG9yIChWKSBjb250ZXh0cyBpbiB0aGUgZG9tYWluIGNvbnRleHQgc3dpdGNoIGxv
Z2ljLiBFYWNoIGRvbWFpbgo+PiBub3cgbWFpbnRhaW5zIGl0cyBvd24gRlAgYW5kIHZlY3RvciBz
dGF0ZSwgd2hpY2ggaXMgc2F2ZWQgYW5kIHJlc3RvcmVkCj4+IGR1cmluZyBkb21haW4gc3dpdGNo
ZXMuCj4+Cj4+IENoYW5nZXMgaW5jbHVkZToKPj4KPj4gLSBBZGRlZCBgZnBfY3R4YCBhbmQgYHZl
Y19jdHhgIG1lbWJlcnMgdG8gYHN0cnVjdCBoYXJ0X2NvbnRleHRgLgo+PiAtIEludHJvZHVjZWQg
ZHluYW1pYyB2ZWN0b3Igc3RydWN0IGFsbG9jYXRpb24gZm9yIHZsZW5iIGluICdzdHJ1Y3QgaGFy
dF9jb250ZXh0Jwo+PiAgIHRvIGFsbG9jYXRlIGFuZCBmcmVlIHBlci1kb21haW4gRlAgYW5kIHZl
Y3RvciBjb250ZXh0Lgo+PiAtIE1vZGlmaWVkIGBzYmlfZG9tYWluX3JlZ2lzdGVyKClgIHRvIGlu
aXRpYWxpemUgRlAvVmVjdG9yIGNvbnRleHQgcGVyIGRvbWFpbi4KPj4gLSBVcGRhdGVkIGBzd2l0
Y2hfdG9fbmV4dF9kb21haW5fY29udGV4dCgpYCB0byBzYXZlL3Jlc3RvcmUgRlAgYW5kIHZlY3Rv
cgo+PiAgIGNvbnRleHRzIHNhZmVseToKPj4gICAgIC0gRW5zdXJlcyBGUy9WUyBmaWVsZHMgaW4g
YG1zdGF0dXNgIGFyZSBlbmFibGVkIChzZXQgdG8gSW5pdGlhbCkgb25seSBpZiBPZmYuCj4+IC0g
QWRkZWQgcnVudGltZSBjaGVja3MgZm9yIEZQIGFuZCB2ZWN0b3IgZXh0ZW5zaW9ucyB3aGVyZSBu
ZWVkZWQuCj4+Cj4+IFRoaXMgaW1wcm92ZXMgc3VwcG9ydCBmb3IgbXVsdGktZG9tYWluIHN5c3Rl
bXMgd2l0aCBGUCBhbmQgVmVjdG9yCj4+IGV4dGVuc2lvbnMsIGFuZCBwcmV2ZW50cyBjb3JydXB0
aW9uIG9mIEZQL1ZlY3RvciBzdGF0ZSBkdXJpbmcgZG9tYWluCj4+IHN3aXRjaGVzLgo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBEYXZlIFBhdGVsIDxkYXZlLnBhdGVsQHJpc2NzdGFyLmNvbT4KPj4gLS0t
Cj4+ICBpbmNsdWRlL3NiaS9zYmlfZG9tYWluLmggICAgIHwgIDIgKysKPj4gIGxpYi9zYmkvc2Jp
X2RvbWFpbl9jb250ZXh0LmMgfCAyOCArKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+ICAy
IGZpbGVzIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvc2JpL3NiaV9kb21haW4uaCBiL2luY2x1ZGUvc2JpL3NiaV9kb21haW4uaAo+PiBpbmRleCA4
ODJiNjJjMi4uMDVhNWQ4NmMgMTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUvc2JpL3NiaV9kb21haW4u
aAo+PiArKysgYi9pbmNsdWRlL3NiaS9zYmlfZG9tYWluLmgKPj4gQEAgLTE2LDYgKzE2LDggQEAK
Pj4gICNpbmNsdWRlIDxzYmkvc2JpX2hhcnRtYXNrLmg+Cj4+ICAjaW5jbHVkZSA8c2JpL3NiaV9k
b21haW5fY29udGV4dC5oPgo+PiAgI2luY2x1ZGUgPHNiaS9zYmlfZG9tYWluX2RhdGEuaD4KPj4g
KyNpbmNsdWRlIDxzYmkvc2JpX3ZlY3Rvci5oPgo+PiArI2luY2x1ZGUgPHNiaS9zYmlfZnAuaD4K
Pj4KPj4gIHN0cnVjdCBzYmlfc2NyYXRjaDsKPj4KPj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2Jp
X2RvbWFpbl9jb250ZXh0LmMgYi9saWIvc2JpL3NiaV9kb21haW5fY29udGV4dC5jCj4+IGluZGV4
IDE1OGY0OTkwLi41ZTE4MDY5OCAxMDA2NDQKPj4gLS0tIGEvbGliL3NiaS9zYmlfZG9tYWluX2Nv
bnRleHQuYwo+PiArKysgYi9saWIvc2JpL3NiaV9kb21haW5fY29udGV4dC5jCj4+IEBAIC0xOCw2
ICsxOCw5IEBACj4+ICAjaW5jbHVkZSA8c2JpL3NiaV9kb21haW5fY29udGV4dC5oPgo+PiAgI2lu
Y2x1ZGUgPHNiaS9zYmlfcGxhdGZvcm0uaD4KPj4gICNpbmNsdWRlIDxzYmkvc2JpX3RyYXAuaD4K
Pj4gKyNpbmNsdWRlIDxzYmkvc2JpX3ZlY3Rvci5oPgo+PiArI2luY2x1ZGUgPHNiaS9zYmlfZnAu
aD4KPj4gKwo+Pgo+PiAgLyoqIENvbnRleHQgcmVwcmVzZW50YXRpb24gZm9yIGEgaGFydCB3aXRo
aW4gYSBkb21haW4gKi8KPj4gIHN0cnVjdCBoYXJ0X2NvbnRleHQgewo+PiBAQCAtNTUsNiArNTgs
MTEgQEAgc3RydWN0IGhhcnRfY29udGV4dCB7Cj4+ICAgICAgICAgc3RydWN0IGhhcnRfY29udGV4
dCAqcHJldl9jdHg7Cj4+ICAgICAgICAgLyoqIElzIGNvbnRleHQgaW5pdGlhbGl6ZWQgYW5kIHJ1
bm5hYmxlICovCj4+ICAgICAgICAgYm9vbCBpbml0aWFsaXplZDsKPj4gKwo+PiArICAgICAgIC8q
KiBmbG9hdCBjb250ZXh0IHN0YXRlICovCj4+ICsgICAgICAgc3RydWN0IHNiaV9mcF9jb250ZXh0
IGZwX2N0eDsKPj4gKyAgICAgICAvKiogdmVjdG9yIGNvbnRleHQgc3RhdGUgKi8KPj4gKyAgICAg
ICBzdHJ1Y3Qgc2JpX3ZlY3Rvcl9jb250ZXh0ICp2ZWNfY3R4Owo+PiAgfTsKPj4KPj4gIHN0YXRp
YyBzdHJ1Y3Qgc2JpX2RvbWFpbl9kYXRhIGRjcHJpdjsKPj4gQEAgLTE0Myw2ICsxNTEsMTUgQEAg
c3RhdGljIGludCBzd2l0Y2hfdG9fbmV4dF9kb21haW5fY29udGV4dChzdHJ1Y3QgaGFydF9jb250
ZXh0ICpjdHgsCj4+ICAgICAgICAgaWYgKHNiaV9oYXJ0X2hhc19leHRlbnNpb24oc2NyYXRjaCwg
U0JJX0hBUlRfRVhUX1NTUU9TSUQpKQo+PiAgICAgICAgICAgICAgICAgY3R4LT5zcm1jZmcgICAg
ID0gY3NyX3N3YXAoQ1NSX1NSTUNGRywgZG9tX2N0eC0+c3JtY2ZnKTsKPj4KPj4gKyAgICAgICAv
KiBNYWtlIHN1cmUgRlMgYW5kIFZTIGlzIG9uIGJlZm9yZSBjb250ZXh0IHN3aXRjaCAqLwo+PiAr
ICAgICAgIGNzcl9zZXQoQ1NSX01TVEFUVVMsIE1TVEFUVVNfRlMgfCBNU1RBVFVTX1ZTKTsKPj4g
Kwo+PiArICAgICAgIC8qIEVhZ2VyIGNvbnRleHQgc3dpdGNoIEYgYW5kIFYgKi8KPj4gKyAgICAg
ICBzYmlfZnBfc2F2ZSgmY3R4LT5mcF9jdHgpOwo+PiArICAgICAgIHNiaV9mcF9yZXN0b3JlKCZk
b21fY3R4LT5mcF9jdHgpOwo+PiArICAgICAgIHNiaV92ZWN0b3Jfc2F2ZShjdHgtPnZlY19jdHgp
Owo+PiArICAgICAgIHNiaV92ZWN0b3JfcmVzdG9yZShkb21fY3R4LT52ZWNfY3R4KTsKPiAKPiBV
bmNvbmRpdGlvbmFsIHNhdmUvcmVzdG9yZSBvZiBGUCBhbmQgVmVjdG9yIGlzIG5vdCBnb2luZyB0
byBmbHkKPiBiZWNhdXNlIHRoZSBnZW5lcmljIHBsYXRmb3JtIGZpcm13YXJlcyBhcmUgZXhwZWN0
ZWQgdG8gd29yawo+IG9uIG11bHRpcGxlIHBsYXRmb3JtcyAoYm90aCB3aXRoIG9yIHdpdGhvdXQg
dmVjdG9yKS4KPiAKPiBUbyBhZGRyZXNzIHRoaXMsIGRvIEZQIHNhdmUvcmVzdG9yZSBvbmx5IGlm
IHVuZGVybHlpbmcgaGFydAo+IGhhcyBGL0QgaGFydCBleHRlbnNpb24uIFNpbWlsYXJseSwgZG8g
VmVjdG9yIHNhdmUvcmVzdG9yZQo+IG9ubHkgaWYgdW5kZXJseWluZyBoYXJ0IGhhcyBWZWN0b3Ig
ZXh0ZW5zaW9uLgo+IAo+IEFzIGEgc2VwYXJhdGUgcGF0Y2gsIGludHJvZHVjZSBTQklfSEFSVF9F
WFRfRiwKPiBTQklfSEFSVF9FWFRfRCwgYW5kIFNCSV9IQVJUX0VYVF9WIGluCj4gZW51bSBzYmlf
aGFydF9leHRlbnNpb25zIGFuZCBzYmlfaGFydF9leHRbXS4gT25jZSwKPiB0aGlzIGlzIGRvbmUg
eW91IGNhbiBjaGVjayBmb3IgU0JJX0hBUlRfRVhUX0YsCj4gU0JJX0hBUlRfRVhUX0QsIGFuZCBT
QklfSEFSVF9FWFRfViB1c2luZwo+IHNiaV9oYXJ0X2hhc19leHRlbnNpb24oKS4KPiAKCk9rIHdp
bGwgZXh0ZW5kIHRoZSBlbnVtIHNiaV9oYXJ0X2V4dGVuc2lvbnMgYW5kIHNoYWxsIGRvIGNoZWNr
IGJlZm9yZQpzYXZlL3Jlc3RvcmUgb2YgdGhlIGNvbnRleHQKCj4+ICsKPj4gICAgICAgICAvKiBT
YXZlIGN1cnJlbnQgdHJhcCBzdGF0ZSBhbmQgcmVzdG9yZSB0YXJnZXQgZG9tYWluJ3MgdHJhcCBz
dGF0ZSAqLwo+PiAgICAgICAgIHRyYXBfY3R4ID0gc2JpX3RyYXBfZ2V0X2NvbnRleHQoc2NyYXRj
aCk7Cj4+ICAgICAgICAgc2JpX21lbWNweSgmY3R4LT50cmFwX2N0eCwgdHJhcF9jdHgsIHNpemVv
ZigqdHJhcF9jdHgpKTsKPj4gQEAgLTE3MCw2ICsxODcsMTAgQEAgc3RhdGljIGludCBoYXJ0X2Nv
bnRleHRfaW5pdCh1MzIgaGFydGluZGV4KQo+PiAgewo+PiAgICAgICAgIHN0cnVjdCBoYXJ0X2Nv
bnRleHQgKmN0eDsKPj4gICAgICAgICBzdHJ1Y3Qgc2JpX2RvbWFpbiAqZG9tOwo+PiArICAgICAg
IHVuc2lnbmVkIGxvbmcgdmxlbmIgPSB2ZWN0b3JfdmxlbmIoKTsKPj4gKwo+PiArICAgICAgIC8q
IENhbGN1bGF0ZSBzaXplOiBiYXNlIHN0cnVjdCArIDMyIHJlZ2lzdGVycyBvZiB2bGVuYiBzaXpl
ICovCj4+ICsgICAgICAgc2l6ZV90IHZlY19zaXplID0gc2l6ZW9mKHN0cnVjdCBzYmlfdmVjdG9y
X2NvbnRleHQpICsgKDMyICogdmxlbmIpOwo+Pgo+PiAgICAgICAgIHNiaV9kb21haW5fZm9yX2Vh
Y2goZG9tKSB7Cj4+ICAgICAgICAgICAgICAgICBpZiAoIXNiaV9oYXJ0bWFza190ZXN0X2hhcnRp
bmRleChoYXJ0aW5kZXgsCj4+IEBAIC0xODAsNiArMjAxLDEzIEBAIHN0YXRpYyBpbnQgaGFydF9j
b250ZXh0X2luaXQodTMyIGhhcnRpbmRleCkKPj4gICAgICAgICAgICAgICAgIGlmICghY3R4KQo+
PiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VOT01FTTsKPj4KPj4gKyAgICAg
ICAgICAgICAgIC8qIEFsbG9jYXRlIHRoZSB2ZWN0b3IgY29udGV4dCBwb2ludGVyICovCj4+ICsg
ICAgICAgICAgICAgICBjdHgtPnZlY19jdHggPSBzYmlfemFsbG9jKHZlY19zaXplKTsKPj4gKyAg
ICAgICAgICAgICAgIGlmICghY3R4LT52ZWNfY3R4KSB7Cj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgIHNiaV9mcmVlKGN0eCk7Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBTQklf
RU5PTUVNOwo+PiArICAgICAgICAgICAgICAgfQo+PiArCj4+ICAgICAgICAgICAgICAgICAvKiBC
aW5kIGNvbnRleHQgYW5kIGRvbWFpbiAqLwo+PiAgICAgICAgICAgICAgICAgY3R4LT5kb20gPSBk
b207Cj4+ICAgICAgICAgICAgICAgICBoYXJ0X2NvbnRleHRfc2V0KGRvbSwgaGFydGluZGV4LCBj
dHgpOwo+PiAtLQo+PiAyLjQzLjAKPj4KPj4KPj4gLS0KPj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QK
Pj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo+IAo+IFJlZ2FyZHMsCj4gQW51cAoKSGkgQW51
cCwKICAgICAgICBUaGFua3MsIE9rIHVuZGVyc3Rvb2QgSSB3aWxsIGV4dGVuZCB0aGUgZW51bSBz
YmlfaGFydF9leHRlbnNpb25zCmFuZCB3aWxsIGFkZCBhbm90aGVyIHBhdGNoIG9uIHRvcCBvZiB0
aGlzIDNyZCBwYXRjaCB0byBhZGQgYW5kIGNoZWNrIHRoZQpleHRlbnNpb24uCgpUaGFua3MKRGF2
ZQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
