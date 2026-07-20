Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9FB6C44515
	for <opensbi@archiver.kernel.org>; Mon, 20 Jul 2026 05:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K/0xj0dUpUg1Dgy+rWwPzcrQOf/D4Lkc3gvWt1Vhxag=; b=pTkz+pQe1UPMp/
	znrBpKqfE5Rm2fBw3vhv+Egf9ZE7/wY2bBtWxwKS6pXfPLVJhv6k7O8lyEl+tI7qVoJLjdkMPopW/
	BAiBm/WI/i3VAKfGzoetJXO17reSxvXJWPtNuxbcFBS7kPCr0r05WUnp7bEVbVL8Rzdm0wtzUwX6x
	SKXOC4R7fkLRRHxDhUARYKgBDDk3ODSZ3fFj11QeDRg4j9WJIr558eDpnHZDLtuliOOyX2ziRx2nF
	fNLim6JBKVpAmlrf+IsoDvz3HrArJAhCIba0zRkkPIwgSqOvQj5k7HhJ6TmlEiQM9in0tg9FK/aBu
	e8sLBRjdCC1v6xQPlNdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlgyA-00000005uAQ-0FO9;
	Mon, 20 Jul 2026 05:55:14 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlgy6-00000005uA0-3nJw
	for opensbi@lists.infradead.org;
	Mon, 20 Jul 2026 05:55:12 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2cae1a3a744so73340765ad.3
        for <opensbi@lists.infradead.org>; Sun, 19 Jul 2026 22:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1784526908; x=1785131708; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mtwFEdPMcq9O2b2rxb73HU8/RvMb6UcEKhBb1lCBrx8=;
        b=cTIQ1Ou62sCFJQqiitwHw6geRqRE2BPCeYZSOada+zOOA2De7noc8Kw+TFSBMnGd3i
         ZAXqSzg9Xvb5EHuQ1Z8pJjtgRx80aL+n5OWAgTiQA6CSyhMbgjkSrqCKZpoEJHQ2+YSI
         gHyeKwfKvAW3bONeeFSm27ySNUJ/19EwLCnoNgJaazz2IOjEF9tayfHdQuCrX7vFIk5b
         z/TrA+Bo7x8T4MD0MGjDvKxITfDH1cHJ0WhlY3AmJ8/KmciU05vAznMa6HtmZyYu+xBH
         V+DO5pJTVgI956AC7DYOGN+YepVRAF3ZPsZ/exwcrGxWAoa77nsOLGQALo12UrY+0Hl2
         fBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784526908; x=1785131708;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mtwFEdPMcq9O2b2rxb73HU8/RvMb6UcEKhBb1lCBrx8=;
        b=E8SfNsO7jeApgetxz9WQj6AqZQX58lXDsgQ2DtUhmdhD4WyGnZRSuytrtyirkIDsXx
         yEyJdObZOygGD4V0ZY/f1d3dtxeYJ91cvAOFdec1ksaWGAUnEQdc2HUDkE0cGElsXYpI
         8ptK+CkaBgaJ5jElzbhpvkmKhNEM9AYInm9hZEsbTbSCJx8RQ/7zZtAHoI7PkQc79P8f
         ASU5X6nwsmRg7XwP1C2O8DwN0x9SUnAnqkuOaG0PjiqozVXg0qDLPWWnGr4jtlL3AEuf
         pSkegxKC50PVfvZ5RfqYpHrlizh3Tbx/z4JW/NMdpDfGmHrojqDZ0gm279G61yPvyZXv
         26PQ==
X-Gm-Message-State: AOJu0Yw6qnqZayHvY4Yg/Se0RzEYZiaqlcj5LdVdVK5BlF/XrpZ6BqXa
	CPfQeZ2UN9dxt4Rs0GJoyx2z7GaiyppF8Enr9Y6zRIk19E7yEq5QrCJ57EnCPiTBKIk=
X-Gm-Gg: AfdE7cn8o5AA8y1HibKF9wW8Yk4fCpwcGFvdbuZSa91Tqk3i1U8WViuwEDTOQrn60ZY
	ngckvTiiEvXnMaaIcGwoKGW2Bw11Iph1IJia3iWmmViInP2HHzcFIZ0D4SLrTpEaofprNJDFX3k
	Xyg67sbGPGWitlza4TBWtxdGBMctNk0+jbQBXpUTJpziP3EH1J1wg0w3ze+/F1prtg9U7Q0kJ5Q
	tyIP2lnJQDsThfhf8Pm6FRMaisSECuotn5CGyZn31VgipLeXj7sr8aCGSTCMGHdoT+wT1NqzXQE
	Z2Rxo6DE9WvIfbRVP+6ZnyUJesCqlYttZD/robuAmR6Dn5gtcYcM5WHZbwMXSEg/eVnhwrGNX+u
	yhTr0YrCEInCbB8BsPwFwNCCcvZwtJec4mqbFcEkwrFB7xKkb23ySQjvvfSL7BP9s7HUAMgeUt4
	YV
X-Received: by 2002:a17:902:f549:b0:2cc:9e99:55c9 with SMTP id d9443c01a7336-2cf3495fe8emr148702305ad.26.1784526908496;
        Sun, 19 Jul 2026 22:55:08 -0700 (PDT)
Received: from plin-1878 ([136.226.240.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf346da139sm49943885ad.40.2026.07.19.22.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 22:55:07 -0700 (PDT)
Date: Mon, 20 Jul 2026 13:55:03 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com,
	greentime.hu@sifive.com, anup@brainfault.org, scott@riscstar.com,
	conor@kernel.org, dave.patel@riscstar.com, raymond.mao@riscstar.com,
	robin.randhawa@sifive.com, samuel.holland@sifive.com
Subject: Re: [RFC PATCH 02/12] lib: utils: fdt_helper: parse RISC-V Worlds DT
 properties
Message-ID: <al24N7+UlmHQX95a@plin-1878>
References: <20260626101433.3133466-1-peter.lin@sifive.com>
 <20260626101433.3133466-3-peter.lin@sifive.com>
 <CAAVgOkJ31PoMz7rkeW9STXWCDGyEU7ttkeJxyyoSK7BCmFd-9w@mail.gmail.com>
 <CAAVgOkJbp9rD1tzQOYda8rvZVT=K5YX=bxdCdS+3XkYi8ktvSg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAVgOkJbp9rD1tzQOYda8rvZVT=K5YX=bxdCdS+3XkYi8ktvSg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_225510_989454_923965BC 
X-CRM114-Status: GOOD (  26.60  )
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

T24gV2VkLCBKdWwgMDgsIDIwMjYgYXQgMDU6NDI6NDRQTSAtMDcwMCwgUGF3YW5kZWVwIE96YSB3
cm90ZToKPiBPbiBXZWQsIEp1bCA4LCAyMDI2IGF0IDU6MzbigK9QTSBQYXdhbmRlZXAgT3phCj4g
PHBhd2FuZGVlcC5vemFAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gRnJpLCBK
dW4gMjYsIDIwMjYgYXQgMzoxNuKAr0FNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0ZXIubGluQHNp
Zml2ZS5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBBZGQgZmR0X3BhcnNlX3dvcmxkc19hbGxfaGFy
dHMoKSB0byBwYXJzZSBSSVNDLVYgV29ybGRzIGRldmljZSB0cmVlCj4gPiA+IHByb3BlcnRpZXMg
ZnJvbSBDUFUgbm9kZXM6Cj4gPiA+ICAgLSByaXNjdixwbXdpZCAodTMyKTogUGh5c2ljYWwgTWFj
aGluZSBXb3JsZCBJRCBmb3IgdGhpcyBoYXJ0Cj4gPiA+ICAgLSByaXNjdixwbXdpZGxpc3QgKHU2
NCk6IEJpdG1hcCBvZiBwZXJtaXR0ZWQgTS1tb2RlIFdvcmxkIElEcwo+ID4gPiAgIC0gcmlzY3Ys
cG1sd2lkbGlzdCAodTY0KTogQml0bWFwIG9mIHBlcm1pdHRlZCBTL1UtbW9kZSBXb3JsZCBJRHMK
PiA+ID4KPiA+ID4gVGhpcyBwYXRjaCBleHRlbmRzIHRoZSBzYmlfaGFydF9mZWF0dXJlcyBzdHJ1
Y3Qgd2l0aCBuZXcgZmllbGRzIHRvCj4gPiA+IHN0b3JlIHRoZSBwYXJzZWQgV29ybGQgSUQgY29u
ZmlndXJhdGlvbiAoaGFzX3Btd2lkLCBwbXdpZCwgcG13aWRsaXN0LAo+ID4gPiBhbmQgcG1sd2lk
bGlzdCkuCj4gPiA+Cj4gPiA+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2
MDYxOTEwNTgzNC4xMjc3MzAyLTMtcGV0ZXIubGluQHNpZml2ZS5jb20vCj4gPiA+IFNpZ25lZC1v
ZmYtYnk6IFl1LUNoaWVuIFBldGVyIExpbiA8cGV0ZXIubGluQHNpZml2ZS5jb20+Cj4gPiA+IC0t
LQo+ID4gPiAgaW5jbHVkZS9zYmkvc2JpX2hhcnQuaCAgICAgICAgICAgICB8IDE1ICsrKysrKysr
Cj4gPiA+ICBpbmNsdWRlL3NiaV91dGlscy9mZHQvZmR0X2hlbHBlci5oIHwgIDIgKwo+ID4gPiAg
bGliL3V0aWxzL2ZkdC9mZHRfaGVscGVyLmMgICAgICAgICB8IDYxICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwo+ID4gPiAgcGxhdGZvcm0vZ2VuZXJpYy9wbGF0Zm9ybS5jICAgICAgICB8
IDEzICsrKysrKy0KPiA+ID4gIDQgZmlsZXMgY2hhbmdlZCwgOTAgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zYmkvc2JpX2hhcnQu
aCBiL2luY2x1ZGUvc2JpL3NiaV9oYXJ0LmgKPiA+ID4gaW5kZXggMjk0MTgwOWUuLjk3MDcyYzA5
IDEwMDY0NAo+ID4gPiAtLS0gYS9pbmNsdWRlL3NiaS9zYmlfaGFydC5oCj4gPiA+ICsrKyBiL2lu
Y2x1ZGUvc2JpL3NiaV9oYXJ0LmgKPiA+ID4gQEAgLTEzNSw2ICsxMzUsMjEgQEAgc3RydWN0IHNi
aV9oYXJ0X2ZlYXR1cmVzIHsKPiA+ID4gICAgICAgICB1bnNpZ25lZCBpbnQgcG1wX2xvZzJncmFu
Owo+ID4gPiAgICAgICAgIHVuc2lnbmVkIGludCBtaHBtX21hc2s7Cj4gPiA+ICAgICAgICAgdW5z
aWduZWQgaW50IG1ocG1fYml0czsKPiA+ID4gKyAgICAgICAvKiogVHJ1ZSBpZiByaXNjdixwbXdp
ZCB3YXMgcHJlc2VudCBpbiBEVCAqLwo+ID4gPiArICAgICAgIGJvb2wgaGFzX3Btd2lkOwo+ID4g
PiArICAgICAgIHUzMiBwbXdpZDsKPiA+ID4gKyAgICAgICAvKioKPiA+ID4gKyAgICAgICAgKiBQ
bGF0Zm9ybS1kZWZpbmVkIGJpdG1hcCBvZiBNLW1vZGUgV0lEcwo+ID4gPiArICAgICAgICAqIChm
cm9tIERUIHJpc2N2LHBtd2lkbGlzdCkuIFplcm8gbWVhbnMKPiA+ID4gKyAgICAgICAgKiBhYnNl
bnQvdW5yZXN0cmljdGVkLgo+ID4gPiArICAgICAgICAqLwo+ID4gPiArICAgICAgIHU2NCBwbXdp
ZGxpc3Q7Cj4gPiA+ICsgICAgICAgLyoqCj4gPiA+ICsgICAgICAgICogUGxhdGZvcm0tZGVmaW5l
ZCBiaXRtYXAgb2YgUy9VLW1vZGUgV0lEcwo+ID4gPiArICAgICAgICAqIChmcm9tIERUIHJpc2N2
LHBtbHdpZGxpc3QpLiBaZXJvIG1lYW5zCj4gPiA+ICsgICAgICAgICogYWJzZW50L3VucmVzdHJp
Y3RlZC4KPiA+ID4gKyAgICAgICAgKi8KPiA+ID4gKyAgICAgICB1NjQgcG1sd2lkbGlzdDsKPiBP
emE6IHBtbHdpZGxpc3QgZGVmaW5lcyB3aGljaCBXSURzIE0tbW9kZSBpcyBwZXJtaXR0ZWQgdG8g
YXNzaWduIHRvCj4gUy1tb2RlLiBCdXQgbmV4dC13aWQgaXMgbmV2ZXIgdmFsaWRhdGVkIGFnYWlu
c3QgaXQuCgpZZXMsIHdpbGwgYWRkIGNoZWNrcyBvbiBEVCBwcm9wZXJ0aWVzLgoKPiA+ID4gIH07
Cj4gPiA+Cj4gPiA+ICBleHRlcm4gdW5zaWduZWQgbG9uZyBoYXJ0X2ZlYXR1cmVzX29mZnNldDsK
PiA+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpX3V0aWxzL2ZkdC9mZHRfaGVscGVyLmggYi9p
bmNsdWRlL3NiaV91dGlscy9mZHQvZmR0X2hlbHBlci5oCj4gPiA+IGluZGV4IDc1YTU2NGQxLi4z
ZjNkMDkxYiAxMDA2NDQKPiA+ID4gLS0tIGEvaW5jbHVkZS9zYmlfdXRpbHMvZmR0L2ZkdF9oZWxw
ZXIuaAo+ID4gPiArKysgYi9pbmNsdWRlL3NiaV91dGlscy9mZHQvZmR0X2hlbHBlci5oCj4gPiA+
IEBAIC01Niw2ICs1Niw4IEBAIGludCBmZHRfcGFyc2VfdGltZWJhc2VfZnJlcXVlbmN5KGNvbnN0
IHZvaWQgKmZkdCwgdW5zaWduZWQgbG9uZyAqZnJlcSk7Cj4gPiA+Cj4gPiA+ICBpbnQgZmR0X3Bh
cnNlX2lzYV9leHRlbnNpb25zX2FsbF9oYXJ0cyhjb25zdCB2b2lkICpmZHQpOwo+ID4gPgo+ID4g
PiAraW50IGZkdF9wYXJzZV93b3JsZHNfYWxsX2hhcnRzKGNvbnN0IHZvaWQgKmZkdCk7Cj4gPiA+
ICsKPiA+ID4gIGludCBmZHRfcGFyc2VfZ2Fpc2xlcl91YXJ0X25vZGUoY29uc3Qgdm9pZCAqZmR0
LCBpbnQgbm9kZW9mZnNldCwKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
dHJ1Y3QgcGxhdGZvcm1fdWFydF9kYXRhICp1YXJ0KTsKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBh
L2xpYi91dGlscy9mZHQvZmR0X2hlbHBlci5jIGIvbGliL3V0aWxzL2ZkdC9mZHRfaGVscGVyLmMK
PiA+ID4gaW5kZXggYWQ0ZWZhYWYuLjhiNDBjZDI4IDEwMDY0NAo+ID4gPiAtLS0gYS9saWIvdXRp
bHMvZmR0L2ZkdF9oZWxwZXIuYwo+ID4gPiArKysgYi9saWIvdXRpbHMvZmR0L2ZkdF9oZWxwZXIu
Ywo+ID4gPiBAQCAtNDU3LDYgKzQ1Nyw2NyBAQCBpbnQgZmR0X3BhcnNlX2lzYV9leHRlbnNpb25z
X2FsbF9oYXJ0cyhjb25zdCB2b2lkICpmZHQpCj4gPiA+ICAgICAgICAgcmV0dXJuIDA7Cj4gPiA+
ICB9Cj4gPiA+Cj4gPiA+ICtpbnQgZmR0X3BhcnNlX3dvcmxkc19hbGxfaGFydHMoY29uc3Qgdm9p
ZCAqZmR0KQo+ID4gPiArewo+ID4gPiArICAgICAgIHUzMiBoYXJ0aWQ7Cj4gPiA+ICsgICAgICAg
Y29uc3QgZmR0MzJfdCAqdmFsOwo+ID4gPiArICAgICAgIHN0cnVjdCBzYmlfc2NyYXRjaCAqc2Ny
YXRjaDsKPiA+ID4gKyAgICAgICBzdHJ1Y3Qgc2JpX2hhcnRfZmVhdHVyZXMgKmhmZWF0dXJlczsK
PiA+ID4gKyAgICAgICBpbnQgZXJyLCBjcHVfb2Zmc2V0LCBjcHVzX29mZnNldCwgbGVuOwo+ID4g
PiArCj4gPiA+ICsgICAgICAgaWYgKCFmZHQpCj4gPiA+ICsgICAgICAgICAgICAgICByZXR1cm4g
U0JJX0VJTlZBTDsKPiA+ID4gKwo+ID4gPiArICAgICAgIGNwdXNfb2Zmc2V0ID0gZmR0X3BhdGhf
b2Zmc2V0KGZkdCwgIi9jcHVzIik7Cj4gPiA+ICsgICAgICAgaWYgKGNwdXNfb2Zmc2V0IDwgMCkK
PiA+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBjcHVzX29mZnNldDsKPiA+ID4gKwo+ID4gPiAr
ICAgICAgIGZkdF9mb3JfZWFjaF9zdWJub2RlKGNwdV9vZmZzZXQsIGZkdCwgY3B1c19vZmZzZXQp
IHsKPiA+IHdoYXQgYWJvdXQgcmlzY3YsbndvcmxkcyA/IEkgdGhpbmsgeW91IHNob3VsZCBwYXJz
ZSB0aGlzIGFuZCBiYXNlZCBvbgo+ID4gdGhhdCBhc3N1bWUgd2lkIHJhbmdlIC0gYW5kIHJlc3Qg
b2YgdGhlIHdpZHMgc2hvdWxkIGJlIHJlamVjdGVkLgo+ID4gPiArICAgICAgICAgICAgICAgZXJy
ID0gZmR0X3BhcnNlX2hhcnRfaWQoZmR0LCBjcHVfb2Zmc2V0LCAmaGFydGlkKTsKPiA+ID4gKyAg
ICAgICAgICAgICAgIGlmIChlcnIpCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbnRp
bnVlOwo+ID4gPiArCj4gPiA+ICsgICAgICAgICAgICAgICBpZiAoIWZkdF9ub2RlX2lzX2VuYWJs
ZWQoZmR0LCBjcHVfb2Zmc2V0KSkKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY29udGlu
dWU7Cj4gPiA+ICsKPiA+ID4gKyAgICAgICAgICAgICAgIHNjcmF0Y2ggPSBzYmlfaGFydGlkX3Rv
X3NjcmF0Y2goaGFydGlkKTsKPiA+ID4gKyAgICAgICAgICAgICAgIGlmICghc2NyYXRjaCkKPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FTk9FTlQ7Cj4gPiA+ICsKPiA+
ID4gKyAgICAgICAgICAgICAgIGhmZWF0dXJlcyA9IHNiaV9oYXJ0X2ZlYXR1cmVzX3B0cihzY3Jh
dGNoKTsKPiA+ID4gKyAgICAgICAgICAgICAgIGlmICghaGZlYXR1cmVzKQo+ID4gPiArICAgICAg
ICAgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VOT0VOVDsKPiA+ID4gKwo+ID4gPiArICAgICAg
ICAgICAgICAgdmFsID0gZmR0X2dldHByb3AoZmR0LCBjcHVfb2Zmc2V0LCAicmlzY3YscG13aWQi
LCAmbGVuKTsKPiA+ID4gKyAgICAgICAgICAgICAgIGlmICh2YWwgJiYgbGVuID09IHNpemVvZihm
ZHQzMl90KSkgewo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBoZmVhdHVyZXMtPnBtd2lk
ID0gZmR0MzJfdG9fY3B1KCp2YWwpOwo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBoZmVh
dHVyZXMtPmhhc19wbXdpZCA9IHRydWU7Cj4gPiA+ICsgICAgICAgICAgICAgICB9Cj4gT3phOiBO
b3RoaW5nIHByZXZlbnRzIGFzc2lnbmluZyB0aGUgc2FtZSBXSUQgdG8gYm90aCBNLW1vZGUgYW5k
IFMtbW9kZQo+IC0gc2hvdWxkIG5vdCBiZSBpZGVudGljYWwgZm9yIGJvdGggd29ybGRzLgoKQWdy
ZWVkLiBXaWxsIGFkZCB2YWxpZGF0aW9uIGluIF9fZmR0X3BhcnNlX2RvbWFpbigpIHRvIHJlamVj
dCBkb21haW5zCndoZXJlIG5leHQtd2lkID09IHBtd2lkLgoKVGhhbmtzLApQZXRlciBMaW4KCi0t
IApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
