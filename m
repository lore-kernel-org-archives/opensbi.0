Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81334CCF9E3
	for <opensbi@archiver.kernel.org>; Mon, 10 Nov 2025 08:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LBC5hhuo/pcSrcLtokxU0mxT1wWWOaFIMzrE3wias1M=; b=EntcNOUga3cMJC
	Z72G02jx5w/F7LEnHY3AEDbBKxzr0iUR26gDAz7eeIkT9NKYLOrttB+uBh3cF1JHrfLN7mW3Zuprg
	+RCZ0Eu35VAUId3ncoAxwhzxSsIKYghij2rl6xGt3PG6PdYjJqFE5nL0zURMW9Jk3EvgQ0qIyyP00
	jTUXUNJo1sOtMNYDhVqOEYeGP6edSWO8UCINYL8tLNRuK+EeMafBfm+o4klQLDND9Y7ZvEDsPxT+O
	0RmXafmxvWdBKe0Zix+VhwTPl9ggAwet2JVH07UAIo8bwXXuixUz1TaC9CTginD8d4FK7OTUfPn+F
	sZ/8992A3haAYZpo2ljA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vINKj-00000004zha-1if5;
	Mon, 10 Nov 2025 08:33:05 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vINKc-00000004zgB-04Rf
	for opensbi@lists.infradead.org;
	Mon, 10 Nov 2025 08:33:04 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-6415bc0cab2so129403a12.3
        for <opensbi@lists.infradead.org>; Mon, 10 Nov 2025 00:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1762763576; x=1763368376; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2k0kMnR2MQrnItSrP9EpyKXIHwbCasZPD7nyheRJCY=;
        b=XHntwQ4wJIvJcvN9a8b8v2t7tSa98JcIhgboIGWtQICF9xwGn46ke0iSS0iXOAi33d
         lBsIGvm0J9QCYfSob4NN/MtlSOnYTM5VF9c6IMqJyG+GNt9+UHL73aZQRKFe4DKZN25T
         BP5XZHql0fm4UYEaRhNan5Vlu3zvKG4pWr62G9t3MFAVqekoSZjYv5N2Ew5IocTNqcEH
         L8Y0t03Boe0BOFpor5O/QaMX1bHxhECTihz1KdeV06NmJRryMsu+/G5R24q9viryXMLc
         2LBtwJ4LiDgL6RnyJ6SaD9z0jp1TCfA/58Hb+4XwXbfjk0IgqQaXCBKQvjRfNHrdxR23
         oOJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762763576; x=1763368376;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q2k0kMnR2MQrnItSrP9EpyKXIHwbCasZPD7nyheRJCY=;
        b=IX8dy0ZgpnjoKnxGy4fTfPhWZEufan3TMvCk+i5eVh/dyoi79wU2IgKYPtjk2kZjve
         tSj1VL3PbHe9Ov6Eo8F2fFMg2/vcdQ6wpz+zQmfQnUJzA6FKB9olubf+jII2DlYRuF/c
         bGsv6DQs0s8bJ0Hbx6AEUQQ5251P2EQLa1iJwFZ1dtBp+c5zXhlrkdhPVF+aPZ66mHRO
         ujBx8Ybu6H7aDZGaklHHVWFQUen1ZlTe+xZJOHSHd2He+L5MIRaWKj06sD5/CIT/y+Xl
         XGIkgzX6qyzuwW8mqefCxTxRAXq//lAONOdPX7VzJWkn0IOP/PNeyX3nvhmtr+wYbCaY
         RCug==
X-Forwarded-Encrypted: i=1; AJvYcCVWJk7nnR2jrS3sFpwJdcew7+RFCBHJUkgSm9jKwbMqHC70e5le1BFAHQJajzQWkGhwFZNNQs5p@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6r7N6vCzO56K7bGWipJpX8FPxj5IerMkUdG3nE/Mq7LomM+1u
	XrvIQ/4rG2296O4dyJK+Jl2WlLCkCZUB0bQc5aGL/S+BcODpC2SVup7836xzo62duEU=
X-Gm-Gg: ASbGncvE0pMWm5C+1wU5Mp/ALrLliJMJkgsP3m/YeDM02d6gGXPnesRp7q9qoZZodKi
	U7y1iqtXH4y/upfUoUrWmKHhUkacLQrg2pEl2Oo3RCbgtiDh9WvDAygDpW2CuCQ/TYPS24NoBoa
	F+20fuAHRMk0whtkKF0O7L3caPXZQYOGidr+mSjaCvdPgk4ehQREcaUI20MMZN4c9izhrwm3HFH
	AbyIyT0EqKkdYYQvKaNHl0FdbLwVX3D+3OXBrwTFquHC8bT/dLa1n3iM01f4objIkKpzUxSMLwl
	20vqUVeuoNscTfth7ntm+Xcai5Mz2b8RV7w5ZdZzQRM9NtXMwlwldSLiRO+zMmAU6Hnj7f8Sf99
	v7ODGwPLGz/WCB7BP4sVammHPzaICPKftBsFjZVsE180Zo38l8KpkwYtqW0HDiyA0Th2gWgu49/
	UpO5JDTXY1Go9audsHTlUVrxV3/83gLU5ubyKEXKlpeEpYHQ==
X-Google-Smtp-Source: AGHT+IG6Rc1iyWD2ZW30ov8omUMRSOLhsv2S1yBA1MXCW9ARXPB9uzNW+voVMJIv5bThyxHXHkLV7Q==
X-Received: by 2002:a17:907:9409:b0:b72:b205:6a2b with SMTP id a640c23a62f3a-b72e02ca10dmr360628266b.4.1762763575584;
        Mon, 10 Nov 2025 00:32:55 -0800 (PST)
Received: from localhost (ip-89-103-73-235.bb.vodafone.cz. [89.103.73.235])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b72bdbcadb5sm1068183766b.9.2025.11.10.00.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 00:32:55 -0800 (PST)
Mime-Version: 1.0
Date: Mon, 10 Nov 2025 09:32:49 +0100
Message-Id: <DE4VJ8FBXUYQ.1L6AZ87OOAMPT@ventanamicro.com>
Subject: Re: [PATCH v3] lib: sbi: Enable Ssqosid Ext using mstateen0
Cc: <anup@brainfault.org>, <guoren@kernel.org>,
 <opensbi@lists.infradead.org>, "opensbi"
 <opensbi-bounces@lists.infradead.org>
To: <cp0613@linux.alibaba.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <DE2F2HVBYSBZ.13JTA8B6XR1W2@ventanamicro.com>
 <20251108112202.26154-1-cp0613@linux.alibaba.com>
In-Reply-To: <20251108112202.26154-1-cp0613@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_003258_077645_312EF4A4 
X-CRM114-Status: GOOD (  23.68  )
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

MjAyNS0xMS0wOFQxOToyMjowMCswODowMCwgPGNwMDYxM0BsaW51eC5hbGliYWJhLmNvbT46Cj4g
T24gMjAyNS0xMS0wNyAxMToxMyBBTSwgUmFkaW0gS3LEjW3DocWZIHdyb3RlOgo+Cj4+ID4gZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3NiaV9oYXJ0LmggYi9pbmNsdWRlL3NiaS9zYmlfaGFydC5o
Cj4+ID4gQEAgLTc5LDYgKzc5LDggQEAgZW51bSBzYmlfaGFydF9leHRlbnNpb25zIHsKPj4gPiAg
IFNCSV9IQVJUX0VYVF9TTUNUUiwKPj4gPiAgIC8qKiBIQVJUIGhhcyBDVFIgUy1tb2RlIENTUnMg
Ki8KPj4gPiAgIFNCSV9IQVJUX0VYVF9TU0NUUiwKPj4gPiArIC8qKiBIYXJ0IGhhcyBTc3Fvc2lk
IGV4dGVuc2lvbiAqLwo+PiA+ICsgU0JJX0hBUlRfRVhUX1NTUU9TSUQsCj4KPj4gRG9uJ3Qgd2Ug
YWxzbyBuZWVkIHNvbWV0aGluZyBsaWtlCj4KPj4gICBfX2NoZWNrX2V4dF9jc3IoU0JJX0hBUlRf
UFJJVl9WRVJfVU5LTk9XTiwKPj4gICAgICAgICAgICAgICAgICAgQ1NSX1NSTUNGRywgU0JJX0hB
UlRfRVhUX1NTUU9TSUQpOwo+Cj4+IHRvIGRldGVjdCB0aGUgU1NRT1NJRCBleHRlbnNpb24/Cj4K
PiBIaSBSYWRpbSwKPgo+IEkgYWRkZWQgdGhpcyBkZXRlY3Rpb24gbWVjaGFuaXNtIGluIHRoZSBm
aXJzdCBwYXRjaCwgYnV0IEFudXAgc2FpZCwgIkZvciBuZXdlcgo+IGV4dGVuc2lvbnMsIGRldGVj
dGluZyBmcm9tIElTQSBzdHJpbmdzIGlzIHN1ZmZpY2llbnQsIHNvIHRoZXJlJ3Mgbm8gbmVlZCB0
bwo+IHRyYXAtbi1kZXRlY3QgaGVyZS4iIFRoZXJlZm9yZSwgaXQgaGFzIGJlZW4gcmVtb3ZlZCBo
ZXJlLgoKQWgsIHRoYXQgaXMgYSBncmVhdCBkZWNpc2lvbi4KCihJIG1pc3NlZCB0aGF0IHRoaXMg
aXNuJ3QgdGhlIGZpcnN0IHZlcnNpb24sIHBsZWFzZSB0cnkgdG8gbWFpbnRhaW4gYQogY2hhbmdl
bG9nIHdoZW4gcG9zdGluZyBzdWJzZXF1ZW50IG1vZGlmaWNhdGlvbnMuKQoKPj4gPiBkaWZmIC0t
Z2l0IGEvbGliL3NiaS9zYmlfZG9tYWluX2NvbnRleHQuYyBiL2xpYi9zYmkvc2JpX2RvbWFpbl9j
b250ZXh0LmMKPj4gPiBAQCAtMTQzLDggKzE0NSwxMSBAQCBzdGF0aWMgaW50IHN3aXRjaF90b19u
ZXh0X2RvbWFpbl9jb250ZXh0KHN0cnVjdCBoYXJ0X2NvbnRleHQgKmN0eCwKPj4gPiAgIGN0eC0+
c2F0cCA9IGNzcl9zd2FwKENTUl9TQVRQLCBkb21fY3R4LT5zYXRwKTsKPj4gPiAgIGlmIChzYmlf
aGFydF9wcml2X3ZlcnNpb24oc2NyYXRjaCkgPj0gU0JJX0hBUlRfUFJJVl9WRVJfMV8xMCkKPj4g
PiAgICBjdHgtPnNjb3VudGVyZW4gPSBjc3Jfc3dhcChDU1JfU0NPVU5URVJFTiwgZG9tX2N0eC0+
c2NvdW50ZXJlbik7Cj4+ID4gLSBpZiAoc2JpX2hhcnRfcHJpdl92ZXJzaW9uKHNjcmF0Y2gpID49
IFNCSV9IQVJUX1BSSVZfVkVSXzFfMTIpCj4+ID4gKyBpZiAoc2JpX2hhcnRfcHJpdl92ZXJzaW9u
KHNjcmF0Y2gpID49IFNCSV9IQVJUX1BSSVZfVkVSXzFfMTIpIHsKPj4gPiAgICBjdHgtPnNlbnZj
ZmcgPSBjc3Jfc3dhcChDU1JfU0VOVkNGRywgZG9tX2N0eC0+c2VudmNmZyk7Cj4+ID4gKyAgaWYg
KHNiaV9oYXJ0X2hhc19leHRlbnNpb24oc2NyYXRjaCwgU0JJX0hBUlRfRVhUX1NTUU9TSUQpKQo+
PiA+ICsgICBjdHgtPnNybWNmZyA9IGNzcl9zd2FwKENTUl9TUk1DRkcsIGRvbV9jdHgtPnNybWNm
Zyk7Cj4+ID4gKyB9Cj4KPj4gV2h5IHdvdWxkIHdlIHdhbnQgU3Nxb3NpZCB0byBkZXBlbmQgb24g
UyA+PSAxLjEyPwo+Cj4gSSdtIGd1ZXNzaW5nIHlvdSByZWFkIHRoZSBSSVNDLVYgSW5zdHJ1Y3Rp
b24gU2V0IE1hbnVhbCwgd2hpY2ggZGVzY3JpYmVzIHNzcW9pZCBhcwo+IHJlcXVpcmluZyBwcml2
IHZlcnNpb24gMS4xNC4gSG93ZXZlciwgdGhlIGhpZ2hlc3QgcHJpdiB2ZXJzaW9uIGN1cnJlbnRs
eSBzdXBwb3J0ZWQKPiBieSBPcGVuU0JJIGlzIDEuMTIuIFRoZXJlZm9yZSwgdGhpcyBpbXBsZW1l
bnRhdGlvbiBpcyBiYXNlZCBvbiB0aGUgY3VycmVudCBzaXR1YXRpb24sCj4gYW5kIHRoZSBwcmV2
aW91cyBpbXBsZW1lbnRhdGlvbnMgc3VjaCBhcyBDVFIgYWxzbyBmb2xsb3cgdGhpcyBhcHByb2Fj
aC4KCkRvZXMgaXQ/ICBUaGVyZSBpcyBldmVuIGEgbm9uLW5vcm1hdGl2ZSBub3RlOgoKICBUaGUg
U3Nxb3NpZCBleHRlbnNpb24gZG9lcyBub3QgcmVxdWlyZSB0aGF0IFMtbW9kZSBtb2RlIGJlIGlt
cGxlbWVudGVkLgoKSSB0aGluayBpdCdzIGJlY2F1c2Ugc3JtY2ZnIGhhcyBlZmZlY3Qgb24gTS1t
b2RlLCBzbyB0aGUgZXh0ZW5zaW9uIGlzCmNvbXBsZXRlbHkgaW5kZXBlbmRlbnQgdG8gYWxsb3cg
aXQgaW4gcHVyZSBNIHN5c3RlbXMuCgooV2UgZW5hYmxlIHNybWNmZyBpbiBtc3RhdGVlbiByZWdh
cmRsZXNzIG9mIFMgdmVyc2lvbiwgc28gdGhlcmUgaXMgYQogcG90ZW50aWFsIGJ1ZyB3aGVyZSB3
ZSB3b3VsZG4ndCBjb3JyZWN0bHkgY29udGV4dCBzd2l0Y2ggdGhlIGNzciwgZ2l2ZW4KIGEgc3lz
dGVtIHdpdGggd2VpcmQgY29tYmluYXRpb24gb2YgZXh0ZW5zaW9ucy4pCgo+PiA+IGRpZmYgLS1n
aXQgYS9saWIvc2JpL3NiaV9oYXJ0LmMgYi9saWIvc2JpL3NiaV9oYXJ0LmMKPj4gPiBAQCAtMTEy
LDYgKzExMiwxMSBAQCBzdGF0aWMgdm9pZCBtc3RhdHVzX2luaXQoc3RydWN0IHNiaV9zY3JhdGNo
ICpzY3JhdGNoKQo+PiA+ICsgIGVsc2UKPj4gPiArICAgbXN0YXRlZW5fdmFsICY9IH4oU01TVEFU
RUVOMF9TUk1DRkcpOwo+Cj4+IFRoZSBlbHNlIGJyYW5jaCBpcyBwb2ludGxlc3MsIGJlY2F1c2Ug
dGhlIGJpdCBpcyBrbm93biB0byBiZSAwLgo+Cj4+IFRoYW5rcy4KPgo+IEhlcmUgd2UgbmVlZCB0
byBjb25zaWRlciB0aGUgZm9sbG93aW5nIHNjZW5hcmlvOiBldmVuIGlmIEhBUlQgc3VwcG9ydHMg
dGhlIFNTUU9TSUQKPiBleHRlbnNpb24sIGJ1dCB0aGUgdXNlciBkb2Vzbid0IHdhbnQgdG8gdXNl
IHRoaXMgZmVhdHVyZSBhbmQgcmVtb3ZlcyB0aGUgc3Nxb3NpZAo+IGZpZWxkIGZyb20gdGhlIElT
QSBzdHJpbmcsIHRoZW4gdGhpcyBiaXQgbmVlZHMgdG8gYmUgZXhwbGljaXRseSBjbGVhcmVkLgoK
V2UgemVybyBhIHplcm8gYml0LiAgVGhlIGNvZGUgZmxvd3MgbGlrZSB0aGlzOgoKICBtc3RhdGVl
bl92YWwgPSAwOwogIC4uLgogIG1zdGF0ZWVuX3ZhbCAmPSB+KFNNU1RBVEVFTjBfU1JNQ0ZHKTsK
Ckkgd291bGQgcHJlZmVyIGlmIHdlIGRpZG4ndCBhZGQgdGhlIGVsc2UgYnJhbmNoLCBidXQgSSBk
b24ndCBtaW5kIGl0IHRvbwptdWNoIGVpdGhlciBpZiB0aGF0J3MgdGhlIG9wZW5zYmkgc3R5bGUu
CihPcHRpbWl6aW5nIGNvbXBpbGVyIHNob3VsZCBnZW5lcmF0ZSB0aGUgc2FtZSBjb2RlLikKClRo
YW5rcy4KCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
