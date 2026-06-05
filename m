Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1797CD6E7B
	for <opensbi@archiver.kernel.org>; Fri,  5 Jun 2026 18:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4+AwG3k+FDLV1e3CxMZgFhtQz1PrUs+Dz+8Wd2qZZN8=; b=lgumx875Baakz0
	oeGuzyFNNhmP7R2N5/G2kjoZm43UINDyuAD3ZP44urWS8MF7ejUL3QPp67/OqX9Ch/4xd50gOk4SX
	/yJKczGxuZqaNha6pRUNFC2nEn5Y3NWV7//PUV+fhvE/ttok5V9YxR38ky+cvO3+8pIy9/dN/CanL
	OtvZSW+m+AlBtzUxu42WvGlBn56E98NoF64ioOLMOFgSy+8iDP4BIJyn/zT463FLvtHovi9yu9v/Q
	emAuvDWUGSpK6XldNzcl4fd3nbPafw34+v9RZT8M0utmxwNK8WYcQJJnAqCvrN9ZJxDN/P66ogiUe
	m0lrVBAYya17WtQORYwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVZlj-0000000151u-0ryd;
	Fri, 05 Jun 2026 18:59:47 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVZlg-0000000151V-2N4F
	for opensbi@lists.infradead.org;
	Fri, 05 Jun 2026 18:59:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=emhorsUZQSUxuQRlN9i+zPQ95YeghyyvK2+eWZMJS7Q=; b=lmjgXNomF+sLldkI+8WHLE56E5
	iIMVyZXAsIs6ZzTktQOs/Z7FQ7EORG2p8UbZgv9ECF7a7gF7Td2OnsyJdGVSwoi39/YeBP/DwEeto
	KCRd5nDtfA4P3bAREI402TRsWptx/uzC3Qtifqr9cOIV67vhtwsNSD7hmRP0afxjfDQ8G8NsHqP0g
	zTmAZ3U849W2EGXnhwbm11TiTxt3pdczKkJLM+b2Y4bnKoLotG7ZNwOlSqSeyHprdY5m9d54eVSmR
	Sck0EpWxSg4hYyVjViCrhPXaIDDqCrLtt2ohh0uU0rxRFSEDvqePvfDglZkPuqv2Cf/qqUE0KmaP4
	eM/kMWXw==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wVZlc-0000000GPVG-1ip3;
	Fri, 05 Jun 2026 20:59:40 +0200
Date: Fri, 5 Jun 2026 20:59:40 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Vivian Wang <wangruikang@iscas.ac.cn>, opensbi@lists.infradead.org,
	Michael Ellerman <mpe@kernel.org>, Bo Gan <ganboing@gmail.com>
Subject: Re: [PATCH] include: sbi_platform: Increase default stack size
Message-ID: <aiMcnMDXt4kfszIh@aurel32.net>
References: <edbce78c-71a7-41d7-aa81-3fa57241644a@iscas.ac.cn>
 <ah8rCkntd95JPfti@aurel32.net>
 <CAEev2e9yixsoPSp4dQZdVXH=JTC3GKKkiOAOvuPgqykPzGz0FA@mail.gmail.com>
 <aiHxbW-UV4TGnTIv@aurel32.net>
 <CAEev2e_+npo7t9UVAXtggDQ1XOE0JOy2VVSGrppRb9LmSckkxg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEev2e_+npo7t9UVAXtggDQ1XOE0JOy2VVSGrppRb9LmSckkxg@mail.gmail.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_115944_611027_4DEB3E32 
X-CRM114-Status: GOOD (  11.18  )
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

SGkgQW5pcnVkaCwKCk9uIDIwMjYtMDYtMDQgMTc6MjAsIEFuaXJ1ZGggU3Jpbml2YXNhbiB3cm90
ZToKPiBPbiBUaHUsIEp1biA0LCAyMDI2IGF0IDQ6NDPigK9QTSBBdXJlbGllbiBKYXJubyA8YXVy
ZWxpZW5AYXVyZWwzMi5uZXQ+IHdyb3RlOgo+ID4gSSBhbSB1c2luZyB0aGUgY3VycmVudCBPcGVu
U0JJIEhFQUQuIFN1cHBvcnQgZm9yIG1pc2FsaWduZWQgdmVjdG9yCj4gPiBsb2FkL3N0b3JlIHdh
cyBhZGRlZCBpbiB2ZXJzaW9uIDEuNiBpbiBjb21taXQgYzJhY2M1ZTViMGQ4ICgibGliOgo+ID4g
c2JpX21pc2FsaWduZWRfbGRzdDogQWRkIGhhbmRsaW5nIG9mIHZlY3RvciBsb2FkL3N0b3JlIiks
IHNvIGl0J3Mgbm90Cj4gPiBzdXJwcmlzaW5nIHRoYXQgeW91ciB2ZXJzaW9uIGRvZXMgbm90IGhh
dmUgdGhlIGlzc3VlLgo+IAo+IEkgd2Fzbid0IGF3YXJlIHRoYXQgeW91IGNvdWxkIHVzZSB1cHN0
cmVhbSBPcGVuU0JJIG9uIHRoZSBrMSBib2FyZHMuCgpZZXMsIE9wZW5TQkkgaGFzIHN1cHBvcnQg
Zm9yIGl0LCBidXQgeW91IGVpdGhlciByZXF1aXJlIHBhdGNoaW5nIHRoZSAKdmVuZG9yIFUtQm9v
dCBbMV0gb3IgdXNpbmcgdGhlIHNlY29uZCBzdGFnZSB1cHN0cmVhbSBVLUJvb3Qgd2l0aCBhbGwg
dGhlIApjdXJyZW50IGxpbWl0YXRpb25zLiBNb3N0IG5vdGFibHkgaXQgcmVxdWlyZXMgdGhhdCB5
b3UgZW1iZWQga2VybmVsIGFuZCAKcG9zc2libHkgaW5pdHJkIGluIHRoZSBzZWNvbmQgc3RhZ2Ug
YmluYXJ5IFsyXSBhcyB0aGVyZSBpcyBub3QgeWV0IApzdXBwb3J0IGZvciBmbGFzaCBvciBtbWMu
IFRoZXJlIGFyZSBwYXRjaGVzIHBvc3RlZCBbM10gWzRdIHRvIGltcHJvdmUgClUtQm9vdCBLMSBz
dXBwb3J0LCBidXQgSSBoYXZlbid0IHRlc3RlZCB0aGVtIHlldC4KClJlZ2FyZHMKQXVyZWxpZW4K
ClsxXSBodHRwczovL2Jsb2cuYXVyZWwzMi5uZXQvdXBzdHJlYW0tb3BlbnNiaS1zcGFjZW1pdC1r
MS5odG1sClsyXSBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvbWV0YS1yaXNjdi9ibG9iL21hc3Rl
ci9yZWNpcGVzLWJzcC91LWJvb3QvYm9vdC1idW5kbGUvazEvYm9vdC1idW5kbGUuaXRzClszXSBo
dHRwczovL2xpc3RzLmRlbnguZGUvcGlwZXJtYWlsL3UtYm9vdC8yMDI2LU1heS82MjAwNDAuaHRt
bApbNF0gaHR0cHM6Ly9saXN0cy5kZW54LmRlL3BpcGVybWFpbC91LWJvb3QvMjAyNi1NYXkvNjE5
MDQ1Lmh0bWwKCi0tIApBdXJlbGllbiBKYXJubyAgICAgICAgICAgICAgICAgICAgICAgICAgR1BH
OiA0MDk2Ui8xREREOEM5QgphdXJlbGllbkBhdXJlbDMyLm5ldCAgICAgICAgICAgICAgICAgICAg
IGh0dHA6Ly9hdXJlbDMyLm5ldAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL29wZW5zYmkK
