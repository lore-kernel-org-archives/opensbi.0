Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E09CC3ABDA
	for <opensbi@archiver.kernel.org>; Wed, 14 May 2025 07:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9G5GnekvjC8Ep+GMhTuYQydF6lgcfRt92mxSW8d3xtk=; b=vIIKfxj8RRkPei
	MeIpGNP96fQayaZx9dOiIYu9oaX/Z1Euq0hFsLpB7hh6S+Q7sMdlJf3bMc0FET9k39+WVN3ix6LIB
	U26F3J5prOuR8hhEwwzRtsG6VkVlhcOF7dmdS77dwcVwCrH6zo6xYd7SsG5TKqh27kvaALGmP+VIE
	6nmUDBoWC4DVgfarnYQfxCNubpLmrd1szAi4rusgRdaylBvO2OdjQg44IHfkhSMz8DsUZ3zaJfuOl
	sS8syQrsSTENQTzFCKtRHgjzTecRHMnB7G1juNoKSAlzHQAw0N3dM4QvLaY79lkVwahlzJ8Jxlk3+
	QO9lBYt+5AknC4VGwvSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF6dT-0000000EM4V-0alj;
	Wed, 14 May 2025 07:34:39 +0000
Received: from out-180.mta1.migadu.com ([2001:41d0:203:375::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF6dQ-0000000EM2h-0j7K
	for opensbi@lists.infradead.org;
	Wed, 14 May 2025 07:34:38 +0000
Message-ID: <1069d437-7689-4ca6-9455-13c224ee773d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747208072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jfQDb55mMuiKUPJYNyB8LBZki5lxC7xahtTwHxFowh0=;
	b=C8+8s7dw0s8X9nsDCzF0ptKqvFPUyRS/7g+Ons/HjFSs+t0UeCSXB87NJrv1mBZNrdB5Ta
	Em+4mNQ0xbfhb0iP7BayqJIWS9PtYFCzF6AR1bd7SCuQn0xqlQL1Sde7H8GJ/cJWYXvRIW
	hTT+nd3NkSKNwtet0if1oUrZz4lpWLc=
Date: Wed, 14 May 2025 00:34:28 -0700
MIME-Version: 1.0
Subject: Re: [PATCH] lib: sbi: Only enable TM bit in scounteren
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: anup@brainfault.org, opensbi@lists.infradead.org
References: <20250513-fix_scounteren-v1-1-01018e0c0b0a@rivosinc.com>
 <B1E3B737-3E3D-4FCD-ADA1-136F69433F39@jrtc27.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <B1E3B737-3E3D-4FCD-ADA1-136F69433F39@jrtc27.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_003436_580668_6841B4D4 
X-CRM114-Status: GOOD (  25.06  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

T24gNS8xMy8yNSA1OjM1IFBNLCBKZXNzaWNhIENsYXJrZSB3cm90ZToKPiBPbiAxNCBNYXkgMjAy
NSwgYXQgMDE6MjUsIEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPiB3cm90ZToKPiAK
Pj4gVGhlIFMtbW9kZSBzaG91bGQgZGlzYWJsZSBDeWNsZSBhbmQgaW5zdHJ1Y3Rpb24gY291bnRl
ciBmb3IgdXNlciBzcGFjZQo+PiB0byBhdm9pZCBzaWRlIGNoYW5uZWwgYXR0YWNrcy4gVGhlIExp
bnV4IGtlcm5lbCBhbHJlYWR5IGRvZXMgdGhpcyBzbyB0aGF0Cj4+IGFueSByYW5kb20gdXNlciBz
cGFjZSBjb2RlIHNob3VsZG4ndCBiZSBhYmxlIHRvIG1vbml0b3IgY3ljbGUvaW5zdHJ1Y3Rpb24K
Pj4gd2l0aG91dCBoaWdoZXIgcHJpdmlsZWdlIG1vZGUgaW52b2x2ZW1lbnQuCj4+Cj4+IFJlbW92
ZSB0aGUgQ1kvSVIgYml0cyBpbiBzY291bnRlcm4gaW4gT3BlblNCSS4KPiAKPiBJc27igJl0IHRo
aXMgYSBicmVha2luZyBjaGFuZ2U/IFMtbW9kZSBPU2VzIHRoYXQgYXJlIGhhcHB5IHRvIGFsbG93
Cj4gVS1tb2RlIHRvIHJlYWQgdGhlIGNvdW50ZXJzIGFyZSBub3cgYnJva2VuLCBzdWNoIGFzIEZy
ZWVCU0QuIEJCTCBhbHdheXMKPiBzZXQgc2NvdW50ZXJlbiB0byBhbGwgb25lcyAod2l0aCBiaXRz
IGFib3ZlIDIgYmVpbmcgcG9pbnRsZXNzIHdpdGhvdXQKPiBwcm9ncmFtbWluZyBtaHBtZXZlbnRY
KSwgYW5kIE9wZW5TQkkgZGlkIHRoYXQgdW50aWwgaXQgc3dpdGNoZWQgdG8gdGhpcwo+IGJlaGF2
aW91ciBvZiBDWXxUTXxJUi4gU28gd2hldGhlciBvciBub3QgaXQgd2FzIGV4cGxpY2l0IGluIHRo
ZQo+IHNwZWNpZmljYXRpb24gd2hhdCB0aGVzZSB3ZXJlIGluaXRpYWxpc2VkIHRvLCBTLW1vZGUg
T1NlcyBleGlzdCB0aGF0Cj4gYXNzdW1lZCBDWSwgVE0gYW5kIElSIGF0IGxlYXN0IHdlcmUgYXZh
aWxhYmxlLiBQbGVhc2UgZG8gbm90IGJyZWFrCj4gdGhpbmdzOyB0cmVhdCB0aGUgZmlybXdhcmU8
LT5TLW1vZGUgaW50ZXJmYWNlIGluIHRoZSBzYW1lIHdheSBhcwo+IGtlcm5lbDwtPnVzZXJzcGFj
ZSwgaS5lLiBkb27igJl0IGJyZWFrIHVzZXJzcGFjZS9TLW1vZGUuCj4gCgpBbGxvd2luZyBDWSBh
bmQgSVIgZGlyZWN0IGFjY2VzcyBpcyBhIGJpZyBzZWN1cml0eSBjb25jZXJuIHdoaWNoIHdhcyAK
ZGlzY3Vzc2VkIGluIG11bHRpcGxlIHRocmVhZHNbMV0gYWxtb3N0IHR3byB5ZWFyIGJhY2suIFRo
aXMgcmVzdWx0ZWQgaW4gCnBhdGNoZXMgaW4gTGludXggdGhhdCByZXN0cmljdHMgdGhhdCBiZWhh
dmlvci4gSSBhc3N1bWVkIHRoYXQgb3RoZXIgT1MgCm1pZ2h0IGhhdmUgYWRvcHRlZCBhIHNpbWls
YXIgYmVoYXZpb3IgYnkgbm93LiBIZW5jZSB0aGUgcGF0Y2guCgpbMV0gCmh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LXJpc2N2L0NBT25KQ1VLQ3duT1hHV0tpd1FReFo5MnQ0MTM4SkFPcXpr
a3F0d0FwSFJ5Nll1UzBLd0BtYWlsLmdtYWlsLmNvbS8KPiBPU2VzIHRoYXQgd2FudCB0byBvcHQg
b3V0IGNhbi4gQW5kIGlmIHlvdSByZWFsbHkgd2FudCB0byBwdXNoIGZvciB0aGlzLAo+IHlvdSBu
ZWVkIHRvIHdhaXQgZm9yIE9TZXMgdG8gYmUgY2hhbmdlZCB0byBleHBsaWNpdGx5IGluaXRpYWxp
c2UKPiBzY291bnRlcmVuIGFuZCBvbmx5IGRvIGl0IG9uY2Ugb2xkIHZlcnNpb25zIGFyZSBzdWZm
aWNpZW50bHkgcmFyZS4gQnV0Cj4geW91IGNhbuKAmXQganVzdCBnbyBkb2luZyB0aGlzIHdpdGgg
bm8gd2FybmluZyAvIGRlcHJlY2F0aW9uIHBlcmlvZC4KPiAKCkl0IHNlZW1zIEZyZWVCU0QgY29u
dGludWUgdG8gaGF2ZSB0aGUgbGVnYWN5IGJlaGF2aW9yLiBJdCB3b3VsZCBiZSBncmVhdCAKaWYg
eW91IGNhbiBmaXggdGhlIGZyZWVCU0QgY29kZSBzb29uZXIgdGhhbiBsYXRlci4gUGxlYXNlIGxl
dCB1cyBrbm93IApvbmNlIHRoYXQgaXMgZG9uZS4KCkkgYW0gYWJzb2x1dGVseSBmaW5lIHdhaXRp
bmcgZm9yIHNvbWUgbW9yZSB0aW1lIHVudGlsIHRoZSB0aGUgY29tbW9ubHkgCnVzZWQgUy1tb2Rl
IE9TIGJlaGF2ZSBhcyBleHBlY3RlZC4gSG93ZXZlciwgd2UgY2FuIG5vdCB3YWl0IGZvcmV2ZXIg
YXMgCndlbGwuIFNvIHdlIGhhdmUgdG8gc2V0IGEgZmxhZyBkYXkgaW4gdGhlIGZ1dHVyZSBhdm9p
ZCBjYXJyeWluZyB0aGlzIApmb3JldmVyLgoKSG93IGFib3V0IE9wZW5TQkkgdjEuNyh+Mi0zIG1v
bnRocykgb3IgT3BlblNCSSB2MS44IChwbGFubmVkIHRvd2FyZHMgZW5kIApvZiAyMDI1KSBmb3Ig
dGhpcyBmaXggdG8gYmUgbWVyZ2VkID8KCj4gTkFLLgo+IAo+IEplc3MKPiAKPj4gU2lnbmVkLW9m
Zi1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Cj4+IC0tLQo+PiBUbzogYW51
cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KPj4gQ2M6IG9wZW5zYmlAbGlzdHMuaW5mcmFk
ZWFkLm9yZwo+PiAtLS0KPj4gbGliL3NiaS9zYmlfaGFydC5jIHwgNCArKy0tCj4+IDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQg
YS9saWIvc2JpL3NiaV9oYXJ0LmMgYi9saWIvc2JpL3NiaV9oYXJ0LmMKPj4gaW5kZXggZmM0OTI1
YjU3NjI1Li4xNzdmMzU2YjdiNzcgMTAwNjQ0Cj4+IC0tLSBhL2xpYi9zYmkvc2JpX2hhcnQuYwo+
PiArKysgYi9saWIvc2JpL3NiaV9oYXJ0LmMKPj4gQEAgLTQ5LDEwICs0OSwxMCBAQCBzdGF0aWMg
dm9pZCBtc3RhdHVzX2luaXQoc3RydWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoKQo+Pgo+PiBjc3Jf
d3JpdGUoQ1NSX01TVEFUVVMsIG1zdGF0dXNfdmFsKTsKPj4KPj4gLSAvKiBEaXNhYmxlIHVzZXIg
bW9kZSB1c2FnZSBvZiBhbGwgcGVyZiBjb3VudGVycyBleGNlcHQgZGVmYXVsdCBvbmVzIChDWSwg
VE0sIElSKSAqLwo+PiArIC8qIERpc2FibGUgdXNlciBtb2RlIHVzYWdlIG9mIGFsbCBwZXJmIGNv
dW50ZXJzIGV4Y2VwdCBUTSAqLwo+PiBpZiAobWlzYV9leHRlbnNpb24oJ1MnKSAmJgo+PiAgICAg
c2JpX2hhcnRfcHJpdl92ZXJzaW9uKHNjcmF0Y2gpID49IFNCSV9IQVJUX1BSSVZfVkVSXzFfMTAp
Cj4+IC0gY3NyX3dyaXRlKENTUl9TQ09VTlRFUkVOLCA3KTsKPj4gKyBjc3Jfd3JpdGUoQ1NSX1ND
T1VOVEVSRU4sIDB4MDIpOwo+Pgo+PiAvKioKPj4gKiBPcGVuU0JJIGRvZXNuJ3QgdXNlIGFueSBQ
TVUgY291bnRlcnMgaW4gTS1tb2RlLgo+Pgo+PiAtLS0KPj4gYmFzZS1jb21taXQ6IDMxNmRhYWYx
YzI5OWMyOWFjNDZlNTIxNDVmNjU1MjFmNDhlYzYzYjUKPj4gY2hhbmdlLWlkOiAyMDI1MDUxMi1m
aXhfc2NvdW50ZXJlbi04YjdiNjgyYmI4NjQKPj4gLS0KPj4gUmVnYXJkcywKPj4gQXRpc2ggcGF0
cmEKPj4KPj4KPj4gLS0gCj4+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4+IG9wZW5zYmlAbGlzdHMu
aW5mcmFkZWFkLm9yZwo+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL29wZW5zYmkKPiAKPiAKCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vb3BlbnNiaQo=
