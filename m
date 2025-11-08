Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE2E4CCFA13
	for <opensbi@archiver.kernel.org>; Sat,  8 Nov 2025 11:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5RZ0m0LupctH/Gj3b/BJScZK3P6Ejy9cAUzmISiK0Q8=; b=Z/CW+HoSkRJiST
	26w0fifcTRGyYBkkln5aeci02gmUQqSKLIflAM5bq5w1fZCF5sdjemb0Qys8Yhyh34lqWwkeJ8NpJ
	h9zdmJYHYSewWYu1bPo1YKSkXAXkT3i9/VL79tRRdDOHBpmLZZ0lhNPxTloFNcClKHhI6dNKKP9wl
	eDOmnEcr17WLyGtgK8+zfOBJjj3LpjHkmkhhWSBWREwVPMQTS75oTt0l/Ix3pOBbBiUvk4OFdxnVY
	+Bv1DBhIspvaSYP0Q6duO5L75oTTuIzf0U2ctUg0C7WI4m50l5oSjoRi+tyl7l3sc5w1JQShOieFk
	tAHtAe7f5QVQFSFikrkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHh1N-000000033lq-2Jxz;
	Sat, 08 Nov 2025 11:22:17 +0000
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHh1K-000000033kq-2Bgd
	for opensbi@lists.infradead.org;
	Sat, 08 Nov 2025 11:22:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1762600929; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=h7YWCsWdXU+7RqIDDvxcH7yOBzjEx+p21I9xsmn6twM=;
	b=LdpEMkjo++mY+ygTmlH8sYv8iJF7apbs+gF8h9g1riKaJEADtFctwmD3/INVo+RdC/TE368vecMYA3xgxuocSBblbm0GUE05toIvJ1HEs8IAaizDtAlfJDQpXk8zi+6YhgtpmtZfLY4wLg1hwtUZjhawu6/3Xd35I5MRaDYYUpM=
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0WrviPER_1762600922 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 08 Nov 2025 19:22:06 +0800
From: cp0613@linux.alibaba.com
To: rkrcmar@ventanamicro.com
Cc: anup@brainfault.org,
	guoren@kernel.org,
	opensbi@lists.infradead.org
Subject: Re: [PATCH v3] lib: sbi: Enable Ssqosid Ext using mstateen0
Date: Sat,  8 Nov 2025 19:22:00 +0800
Message-ID: <20251108112202.26154-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DE2F2HVBYSBZ.13JTA8B6XR1W2@ventanamicro.com>
References: <DE2F2HVBYSBZ.13JTA8B6XR1W2@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_032215_346921_3247AD7D 
X-CRM114-Status: GOOD (  15.79  )
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

T24gMjAyNS0xMS0wNyAxMToxMyBBTSwgUmFkaW0gS3LEjW3DocWZIHdyb3RlOgoKPiA+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL3NiaS9zYmlfaGFydC5oIGIvaW5jbHVkZS9zYmkvc2JpX2hhcnQuaAo+
ID4gQEAgLTc5LDYgKzc5LDggQEAgZW51bSBzYmlfaGFydF9leHRlbnNpb25zIHsKPiA+ICAgU0JJ
X0hBUlRfRVhUX1NNQ1RSLAo+ID4gICAvKiogSEFSVCBoYXMgQ1RSIFMtbW9kZSBDU1JzICovCj4g
PiAgIFNCSV9IQVJUX0VYVF9TU0NUUiwKPiA+ICsgLyoqIEhhcnQgaGFzIFNzcW9zaWQgZXh0ZW5z
aW9uICovCj4gPiArIFNCSV9IQVJUX0VYVF9TU1FPU0lELAoKPiBEb24ndCB3ZSBhbHNvIG5lZWQg
c29tZXRoaW5nIGxpa2UKCj4gICBfX2NoZWNrX2V4dF9jc3IoU0JJX0hBUlRfUFJJVl9WRVJfVU5L
Tk9XTiwKPiAgICAgICAgICAgICAgICAgICBDU1JfU1JNQ0ZHLCBTQklfSEFSVF9FWFRfU1NRT1NJ
RCk7Cgo+IHRvIGRldGVjdCB0aGUgU1NRT1NJRCBleHRlbnNpb24/CgpIaSBSYWRpbSwKCkkgYWRk
ZWQgdGhpcyBkZXRlY3Rpb24gbWVjaGFuaXNtIGluIHRoZSBmaXJzdCBwYXRjaCwgYnV0IEFudXAg
c2FpZCwgIkZvciBuZXdlcgpleHRlbnNpb25zLCBkZXRlY3RpbmcgZnJvbSBJU0Egc3RyaW5ncyBp
cyBzdWZmaWNpZW50LCBzbyB0aGVyZSdzIG5vIG5lZWQgdG8KdHJhcC1uLWRldGVjdCBoZXJlLiIg
VGhlcmVmb3JlLCBpdCBoYXMgYmVlbiByZW1vdmVkIGhlcmUuCgo+ID4gZGlmZiAtLWdpdCBhL2xp
Yi9zYmkvc2JpX2RvbWFpbl9jb250ZXh0LmMgYi9saWIvc2JpL3NiaV9kb21haW5fY29udGV4dC5j
Cj4gPiBAQCAtMTQzLDggKzE0NSwxMSBAQCBzdGF0aWMgaW50IHN3aXRjaF90b19uZXh0X2RvbWFp
bl9jb250ZXh0KHN0cnVjdCBoYXJ0X2NvbnRleHQgKmN0eCwKPiA+ICAgY3R4LT5zYXRwID0gY3Ny
X3N3YXAoQ1NSX1NBVFAsIGRvbV9jdHgtPnNhdHApOwo+ID4gICBpZiAoc2JpX2hhcnRfcHJpdl92
ZXJzaW9uKHNjcmF0Y2gpID49IFNCSV9IQVJUX1BSSVZfVkVSXzFfMTApCj4gPiAgICBjdHgtPnNj
b3VudGVyZW4gPSBjc3Jfc3dhcChDU1JfU0NPVU5URVJFTiwgZG9tX2N0eC0+c2NvdW50ZXJlbik7
Cj4gPiAtIGlmIChzYmlfaGFydF9wcml2X3ZlcnNpb24oc2NyYXRjaCkgPj0gU0JJX0hBUlRfUFJJ
Vl9WRVJfMV8xMikKPiA+ICsgaWYgKHNiaV9oYXJ0X3ByaXZfdmVyc2lvbihzY3JhdGNoKSA+PSBT
QklfSEFSVF9QUklWX1ZFUl8xXzEyKSB7Cj4gPiAgICBjdHgtPnNlbnZjZmcgPSBjc3Jfc3dhcChD
U1JfU0VOVkNGRywgZG9tX2N0eC0+c2VudmNmZyk7Cj4gPiArICBpZiAoc2JpX2hhcnRfaGFzX2V4
dGVuc2lvbihzY3JhdGNoLCBTQklfSEFSVF9FWFRfU1NRT1NJRCkpCj4gPiArICAgY3R4LT5zcm1j
ZmcgPSBjc3Jfc3dhcChDU1JfU1JNQ0ZHLCBkb21fY3R4LT5zcm1jZmcpOwo+ID4gKyB9Cgo+IFdo
eSB3b3VsZCB3ZSB3YW50IFNzcW9zaWQgdG8gZGVwZW5kIG9uIFMgPj0gMS4xMj8KCkknbSBndWVz
c2luZyB5b3UgcmVhZCB0aGUgUklTQy1WIEluc3RydWN0aW9uIFNldCBNYW51YWwsIHdoaWNoIGRl
c2NyaWJlcyBzc3FvaWQgYXMKcmVxdWlyaW5nIHByaXYgdmVyc2lvbiAxLjE0LiBIb3dldmVyLCB0
aGUgaGlnaGVzdCBwcml2IHZlcnNpb24gY3VycmVudGx5IHN1cHBvcnRlZApieSBPcGVuU0JJIGlz
IDEuMTIuIFRoZXJlZm9yZSwgdGhpcyBpbXBsZW1lbnRhdGlvbiBpcyBiYXNlZCBvbiB0aGUgY3Vy
cmVudCBzaXR1YXRpb24sCmFuZCB0aGUgcHJldmlvdXMgaW1wbGVtZW50YXRpb25zIHN1Y2ggYXMg
Q1RSIGFsc28gZm9sbG93IHRoaXMgYXBwcm9hY2guCgo+ID4gZGlmZiAtLWdpdCBhL2xpYi9zYmkv
c2JpX2hhcnQuYyBiL2xpYi9zYmkvc2JpX2hhcnQuYwo+ID4gQEAgLTExMiw2ICsxMTIsMTEgQEAg
c3RhdGljIHZvaWQgbXN0YXR1c19pbml0KHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCkKPiA+
ICAgIGVsc2UKPiA+ICAgICBtc3RhdGVlbl92YWwgJj0gflNNU1RBVEVFTjBfQ1RSOwo+ID4gIAo+
ID4gKyAgaWYgKHNiaV9oYXJ0X2hhc19leHRlbnNpb24oc2NyYXRjaCwgU0JJX0hBUlRfRVhUX1NT
UU9TSUQpKQo+ID4gKyAgIG1zdGF0ZWVuX3ZhbCB8PSAoU01TVEFURUVOMF9TUk1DRkcpOwoKPiAo
U3R5bGUgbml0OiBwbGVhc2UgcmVtb3ZlIHBhcmVudGhlc2VzIGFyb3VuZHMgU01TVEFURUVOMF9T
Uk1DRkcuKQoKVGhhbmsgeW91IGZvciBwb2ludGluZyB0aGlzIG91dC4KCj4gPiArICBlbHNlCj4g
PiArICAgbXN0YXRlZW5fdmFsICY9IH4oU01TVEFURUVOMF9TUk1DRkcpOwoKPiBUaGUgZWxzZSBi
cmFuY2ggaXMgcG9pbnRsZXNzLCBiZWNhdXNlIHRoZSBiaXQgaXMga25vd24gdG8gYmUgMC4KCj4g
VGhhbmtzLgoKSGVyZSB3ZSBuZWVkIHRvIGNvbnNpZGVyIHRoZSBmb2xsb3dpbmcgc2NlbmFyaW86
IGV2ZW4gaWYgSEFSVCBzdXBwb3J0cyB0aGUgU1NRT1NJRApleHRlbnNpb24sIGJ1dCB0aGUgdXNl
ciBkb2Vzbid0IHdhbnQgdG8gdXNlIHRoaXMgZmVhdHVyZSBhbmQgcmVtb3ZlcyB0aGUgc3Nxb3Np
ZApmaWVsZCBmcm9tIHRoZSBJU0Egc3RyaW5nLCB0aGVuIHRoaXMgYml0IG5lZWRzIHRvIGJlIGV4
cGxpY2l0bHkgY2xlYXJlZC4KClRoYW5rcywKUGVpCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QK
b3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
