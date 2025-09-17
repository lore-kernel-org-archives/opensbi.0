Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930E9CAC598
	for <opensbi@archiver.kernel.org>; Wed, 17 Sep 2025 01:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BTwWXcwjHSZxqsy/fGgPi/oHBqFeeRkEP7LrzCtBrJE=; b=nF+xOu3mOTHYeP
	leBkzqjIGGm18I4AhV+CuoHw8ip+QnyqvtebbgKS4u7kELfCzUNYWQMThzrPsNwTlksCiK+DvU95w
	IozWRKzCXGNxOt81fHFqRNvJUKEe17EAvpm7OmjrB006xciJ9FOsJUOAnhekzxgOWCfJrhHnsbf40
	OgMeIozPaFVijhSuBZ1/uKB1uO/zD+Ktah1htiNoAfWOTe3azAg8+PKRvpdxXk/SP936/JOohxR3G
	vWJayFHuYK7qIlXSRqYBz9tmktFyZ0sPlqGoGew+LwNaO9IbdBpwojp5EobyHtmJeLj0a3Fj6NTb9
	V/LdJG7bGbifLOE1EQ1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uygu1-00000009ptG-045f;
	Wed, 17 Sep 2025 01:24:09 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uygtw-00000009plV-3SQn
	for opensbi@lists.infradead.org;
	Wed, 17 Sep 2025 01:24:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758072221;
	bh=zoaKUBWBEHaIZafIyRIPdcEsN5DaE840rfiHopdWXNA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=wkQiuzJNoP2ffmBDqcLud5jzJAnAumjUmTxTeeSKRKp3kSb1ZaOXfSu3KdrvIXvGB
	 MJca31hrJjM0qo5SUQF2nyJxMb6uwaZjM0n+FPOTb7sgZZNDfbceH899+dlbHYNKMf
	 M3ZyyNr7oWYH3gMu8+dKi4D/p/mfc7Ewav1ew3nE=
X-QQ-mid: esmtpgz13t1758072220t72e78e17
X-QQ-Originating-IP: shuLQPwjscQsF9CaQFNuuLbn2xyE/Ab06Z3qO+MxaDs=
Received: from = ( [14.123.253.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 17 Sep 2025 09:23:39 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4010116189723698169
EX-QQ-RecipientCnt: 4
Date: Wed, 17 Sep 2025 09:23:39 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Xiang W <wxjstz@126.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	opensbi@lists.infradead.org
Cc: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>
Subject: Re: [PATCH] platform: generic: spacemit: add K1
Message-ID: <ED02E0F8C03FC257+aMoNm91Uzz89zeJC@LT-Guozexi>
References: <20250916-smt-k1-8-cores-v1-1-5b76e06d12da@linux.spacemit.com>
 <c6902e3138016c92bc413de2e4da4e88b33d176d.camel@126.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c6902e3138016c92bc413de2e4da4e88b33d176d.camel@126.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NSEFX6u+4l+KImU2Y0B630vo6fUy7zyl/ekXIUshv+zVaIavN/MH6szR
	pwGl1sBzFrDbYEJW2L0wtG+WoeXj7YXd1CXBq2fujRDerzk/X6VdZ5PQ3/U6xnRKCoid2ES
	sSH2imRAbB2Kesnt8VNT9FWXpt4t5Pmv7++lCf8OK3+AygODGHVKETemw9PH3BB0UR0t7bB
	fyouJEIG4JCsg5fuPW6lIFk9+1zym8wZDDavKlZX4Rfm4fWjQDBFji5NNjMPrwofXuE8kKr
	tlIpJOmS4S03MrCjRhm94hWGokJvqYe0P/yjOWx0U/3FvsGOHonjc7GmILM0ZhrgrhD2sd/
	YVP/8PcwoOByWRkEBr9+GkHdI1jtmdpwGXqAH7qxnPaGgXlz4y75v4F/xJ7d2T8nnERoMB/
	GdChN0I8Lyot/ZxWjTvx4xjfB6OhJ8jqNiIDd5VVB+Ll0yaDO+s8PYYfUliHtsrX/Vatzt8
	gsoc0GYXO7b3llQAKukAHE8kTrIVAtI0JdYsNgcwd1L2V0BaVatGPBt7EqcKD1FJwiBP0LY
	f6yqIq/1bcp9Klsh53FjhEUEDxX7tq1Fhx8hemexJh98pKD9yB3kgjksGnKDb5A+QzVdwMS
	QZ7Qhw9wonCm6+WHMZseQEhqOVkup5/lAuLIGC3R3TcU2ehIPFv7LU3bME6yIX/MyKgbuhx
	y0ypoHXt14x6d52cpPT+PFCnH1nxHcP/d+KVUxsXed5bMeFOyYRwaMw2dFhj4UN17+ZKqG+
	+AgEDHya/B8iOMRJoDNwrPcLjDINUpI5rtRjbizWqvutZde67ntqWPlO2Miqjb6Ksyfnl8g
	SEkCBl8av4zdYJlEejLjQkzzqTBYwwVYhYjDKYmbqcbbZvG4/pOeYWt/bhCwj/HCyp/6wv1
	60abCUpTCGdue/XFKsUcrUPQLGlub/w5m6wIpYxEShG1X3qWgTWhQ/HtZRfDMATn0mf/iKh
	f2E2V4C5CAnYgMS4s2+KPIkiadGz0nMAyBXcgYt6CW7zipxdA2RpypM26gQoVgUMIuMsip1
	DR9+zrGl71n+yF8gB+PjEhqzgQ/vOCv2iQBNYKSQ==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_182405_923352_96F8722B 
X-CRM114-Status: GOOD (  25.20  )
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

SGkgWGluZyBXLApUaGFua3MgZm9yIHlvdXIgcmV2aWV3LgoKT24gVHVlLCBTZXAgMTYsIDIwMjUg
YXQgMDk6MTE6MTJQTSArMDgwMCwgWGlhbmcgVyB3cm90ZToKPiDlnKggMjAyNS0wOS0xNuS6jOea
hCAxMzo1NyArMDgwMO+8jFRyb3kgTWl0Y2hlbGzlhpnpgZPvvJoKPiA+IEZyb206IFhpYW5iaW4g
Wmh1IDx4aWFuYmluLnpodUBsaW51eC5zcGFjZW1pdC5jb20+Cj4gPiAKPiA+IEV4dGVuZCBnZW5l
cmljIHBsYXRmb3JtIHRvIHN1cHBvcnQgU3BhY2VtaVQgSzEuCj4gPiAKPiA+IE9uIEsxLCB0aGUg
QlJPTSBvbmx5IGJyaW5ncyB1cCB0aGUgcHJpbWFyeSBjb3JlIGFuZCBsZWF2ZXMgdGhlCj4gPiBv
dGhlciBjb3JlcyBpbiBhIGRpc2FibGVkIHN0YXRlLiBUaGlzIHByZXZlbnRzIExpbnV4IGZyb20g
Ym9vdGluZwo+ID4gU01QIGFuZCBvbmx5IG9uZSBjb3JlIGlzIGF2YWlsYWJsZS4KPiA+IAo+ID4g
QWRkIGNvZGUgdG8gYnJpbmcgdXAgYWxsIDggY29yZXMgZHVyaW5nIE9wZW5TQkkgaW5pdGlhbGl6
YXRpb24gc28KPiA+IHRoYXQgdGhlIExpbnV4IGtlcm5lbCBjYW4gZGV0ZWN0IGFuZCB1c2UgYWxs
IGNvcmVzIHByb3Blcmx5Lgo+ID4gCj4gPiBDby1hdXRob3JlZC1ieTogVHJveSBNaXRjaGVsbCA8
dHJveS5taXRjaGVsbEBsaW51eC5zcGFjZW1pdC5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBUcm95
IE1pdGNoZWxsIDx0cm95Lm1pdGNoZWxsQGxpbnV4LnNwYWNlbWl0LmNvbT4KPiA+IFNpZ25lZC1v
ZmYtYnk6IFhpYW5iaW4gWmh1IDx4aWFuYmluLnpodUBsaW51eC5zcGFjZW1pdC5jb20+Cj4gPiAt
LS0KPiA+IMKgcGxhdGZvcm0vZ2VuZXJpYy9LY29uZmlnwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHzCoMKgIDQgKwo+ID4gwqBwbGF0Zm9ybS9nZW5lcmljL2NvbmZpZ3MvZGVmY29uZmlnwqDCoCB8
wqDCoCA1ICstCj4gPiDCoHBsYXRmb3JtL2dlbmVyaWMvc3BhY2VtaXQvazEuY8KgwqDCoMKgwqDC
oCB8IDMzMCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gwqBwbGF0Zm9y
bS9nZW5lcmljL3NwYWNlbWl0L29iamVjdHMubWsgfMKgwqAgNyArCj4gPiDCoDQgZmlsZXMgY2hh
bmdlZCwgMzQ0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1n
aXQgYS9wbGF0Zm9ybS9nZW5lcmljL3NwYWNlbWl0L2sxLmMgYi9wbGF0Zm9ybS9nZW5lcmljL3Nw
YWNlbWl0L2sxLmMKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwLi4xMWU3YmI1MDk0OGRiZTMyODdmNGFmYjI2
OTJkMjhjZTcxZGMxOTA2Cj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9wbGF0Zm9ybS9nZW5l
cmljL3NwYWNlbWl0L2sxLmMKPiA+ICtzdGF0aWMgYm9vbCBzcGFjZW1pdF9jb2xkX2Jvb3RfYWxs
b3dlZCh1MzIgaGFydGlkKQo+ID4gK3sKPiA+ICsJY3NyX3NldChDU1JfTUwyU0VUVVAsIDEgPDwg
KGhhcnRpZCAlIFBMQVRGT1JNX01BWF9DUFVTX1BFUl9DTFVTVEVSKSk7Cj4gPiArCj4gPiArCXJl
dHVybiBfX3NiaV9oc21faGFydF9nZXRfc3RhdGUoaGFydGlkKSAhPSBTQklfSFNNX1NUQVRFX1NV
U1BFTkRFRCAmJgo+ID4gKwnCoMKgwqDCoMKgwqAgIWhhcnRpZDsKPiAKPiBfX3NiaV9oc21faGFy
dF9nZXRfc3RhdGUgY2Fubm90IGJlIGNhbGwgYmVmb3JlIHNiaV9oc21faW5pdC4KPiAKPiBSZWdh
cmRzLAo+IFhpYW5nIFcKV2UnbGwgcmVtb3ZlIF9fc2JpX2hzbV9oYXJ0X2dldF9zdGF0ZSgpIGFu
ZCBqdXN0IHJldHVybiAhaGFydGlkLApiZWNhdXNlIF9fc2JpX2hzbV9oYXJ0X2dldF9zdGF0ZSgp
IGlzIHVzZWQgdG8gY2hlY2sgdGhlIGNvcmUKc3RhdGUoc29ydHdhcmUgc3RhdGUpLCBidXQgd2Ug
ZG9uJ3QgbmVlZCBpdCBub3cuCgpUaGlzIHBhdGNoIG9ubHkgaW50cm9kdWNlcyBvcGVuaW5nIGFu
ZCBjbG9zaW5nIGNvcmVzIHdpdGhvdXQKaWRsZSBzdGF0ZSBzd2l0Y2hpbmcuCgogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0gVHJveQo+IAo+ID4gK30KPiA+ICsKPiA+ICtz
dGF0aWMgaW50IHNwYWNlbWl0X2sxX3BsYXRmb3JtX2luaXQoY29uc3Qgdm9pZCAqZmR0LCBpbnQg
bm9kZW9mZiwKPiA+ICsJCQkJwqDCoMKgwqAgY29uc3Qgc3RydWN0IGZkdF9tYXRjaCAqbWF0Y2gp
Cj4gPiArewo+ID4gKwlnZW5lcmljX3BsYXRmb3JtX29wcy5lYXJseV9pbml0ID0gc3BhY2VtaXRf
azFfZWFybHlfaW5pdDsKPiA+ICsJZ2VuZXJpY19wbGF0Zm9ybV9vcHMuZmluYWxfaW5pdCA9IHNw
YWNlbWl0X2sxX2ZpbmFsX2luaXQ7Cj4gPiArCWdlbmVyaWNfcGxhdGZvcm1fb3BzLmNvbGRfYm9v
dF9hbGxvd2VkID0gc3BhY2VtaXRfY29sZF9ib290X2FsbG93ZWQ7Cj4gPiArCj4gPiArCXJldHVy
biAwOwo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGZkdF9tYXRjaCBzcGFj
ZW1pdF9rMV9tYXRjaFtdID0gewo+ID4gKwl7IC5jb21wYXRpYmxlID0gInNwYWNlbWl0LGsxIiB9
LAo+ID4gKwl7IC8qIHNlbnRpbmVsICovIH0KPiA+ICt9Owo+ID4gKwo+ID4gK2NvbnN0IHN0cnVj
dCBmZHRfZHJpdmVyIHNwYWNlbWl0X2sxID0gewo+ID4gKwkubWF0Y2hfdGFibGUgPSBzcGFjZW1p
dF9rMV9tYXRjaCwKPiA+ICsJLmluaXQgPSBzcGFjZW1pdF9rMV9wbGF0Zm9ybV9pbml0LAo+ID4g
K307Cj4gPiBkaWZmIC0tZ2l0IGEvcGxhdGZvcm0vZ2VuZXJpYy9zcGFjZW1pdC9vYmplY3RzLm1r
IGIvcGxhdGZvcm0vZ2VuZXJpYy9zcGFjZW1pdC9vYmplY3RzLm1rCj4gPiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MC4uNGJmOTczYWFiMWJhNzQ5YjU5Y2ZkYzE0YTU3MjIyNmQ1NGMzZmYxNQo+ID4gLS0tIC9kZXYv
bnVsbAo+ID4gKysrIGIvcGxhdGZvcm0vZ2VuZXJpYy9zcGFjZW1pdC9vYmplY3RzLm1rCj4gPiBA
QCAtMCwwICsxLDcgQEAKPiA+ICsjCj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogQlNE
LTItQ2xhdXNlCj4gPiArIwo+ID4gKyMgQ29weXJpZ2h0IChjKSAyMDI1IFNwYWNlbWlUCj4gPiAr
Cj4gPiArY2FycmF5LXBsYXRmb3JtX292ZXJyaWRlX21vZHVsZXMtJChDT05GSUdfUExBVEZPUk1f
U1BBQ0VNSVRfSzEpICs9IHNwYWNlbWl0X2sxCj4gPiArcGxhdGZvcm0tb2Jqcy0kKENPTkZJR19Q
TEFURk9STV9TUEFDRU1JVF9LMSkgKz0gc3BhY2VtaXQvazEubwo+ID4gCj4gPiAtLS0KPiA+IGJh
c2UtY29tbWl0OiAxNTNjZGVlYTUzNTA4MzdjMTIwNmEyZDJiNjE4OWZkMGJhMDZkMWYyCj4gPiBj
aGFuZ2UtaWQ6IDIwMjUwOTExLXNtdC1rMS04LWNvcmVzLTg5ODVjNWY0MGM1Zgo+ID4gCj4gPiBC
ZXN0IHJlZ2FyZHMsCj4gPiAtLSAKPiA+IFRyb3kgTWl0Y2hlbGwgPHRyb3kubWl0Y2hlbGxAbGlu
dXguc3BhY2VtaXQuY29tPgo+ID4gCj4gCj4gCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3Bl
bnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vb3BlbnNiaQo=
