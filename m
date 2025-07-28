Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEE2C87FCF
	for <opensbi@archiver.kernel.org>; Mon, 28 Jul 2025 08:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=90CVBTJ1d43EpoKjEDBBW0sibQ/shtDLkWIMfTNrf2U=; b=tyHjGRMA5URZbY
	M0qxNo39E8zs5l3XW0K6Aw7MCP6TWd0eMVxrljOxlneVaoTUp6eQiLC1icPGlkFSPcL3cDpgN5Slw
	YmdZqiMlaPpt3V2b8/GVuNLBuXw1rdB6agoPZtWgiH632V/GuT5dAiVPPvAp0jBgXRqVmRmUb+jQM
	Z5hOOw8KlhswRjRv3QsOY4DxBVt5gl9IzZq24kLZFokyEUjl6rvkZ0ClFkQKCC2dEwUkjpaUBZvc+
	9pCG51Ia3gVpBAgXUJUX+sxDwptDjUMlExZft47xDzntyOEi8LZNCdJoLB55OSMiTx1c4Gg7tZfsY
	b9hIm/+tbi9VDCNZd0QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugInu-0000000DvFy-0uFc;
	Mon, 28 Jul 2025 08:01:50 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugI8s-0000000Dqge-2cCi
	for opensbi@lists.infradead.org;
	Mon, 28 Jul 2025 07:19:29 +0000
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 56S7IshX030549
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Mon, 28 Jul 2025 15:18:54 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from atctrx.andestech.com (10.0.15.173) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Jul
 2025 15:18:54 +0800
Date: Mon, 28 Jul 2025 15:18:54 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: Xiang W <wxjstz@126.com>
CC: <opensbi@lists.infradead.org>, <anup@brainfault.org>,
        Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Yu Chien Peter Lin
	<peterlin@andestech.com>,
        Hui Min Mina Chou <minachou@andestech.com>,
        "Jessica Clarke" <jrtc27@jrtc27.com>
Subject: Re: [PATCH] Fix license to compatible BSD-2-Clause
Message-ID: <aIckXoj8OPoPb1Jh@atctrx.andestech.com>
References: <20250728052713.361094-1-wxjstz@126.com>
 <b2363cfd71e26656b6160ba05fa151ebbf4cadfc.camel@126.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b2363cfd71e26656b6160ba05fa151ebbf4cadfc.camel@126.com>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-Originating-IP: [10.0.15.173]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 56S7IshX030549
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_001927_170233_3C42D013 
X-CRM114-Status: GOOD (  13.69  )
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

T24gTW9uLCBKdWwgMjgsIDIwMjUgYXQgMDM6MDE6NTRQTSArMDgwMCwgWGlhbmcgVyB3cm90ZToK
PiBbRVhURVJOQUwgTUFJTF0KPiAKPiDlnKggMjAyNS0wNy0yOOS4gOeahCAxMzoyNiArMDgwMO+8
jFhpYW5nIFflhpnpgZPvvJoKPiA+IE9wZW5CSSBpcyBhIEJTRCBwcm9qZWN0LiBXZSBuZWVkIHRv
IG1vZGlmeSBzb21lIGNvZGVzIHRvIGNvbXBhdGlibGUKCnMvT3BlbkJJL09wZW5TQkkKCj4gPiB3
aXRoIEJTRCBwcm90b2NvbC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBYaWFuZyBXIDx3eGpzdHpA
MTI2LmNvbT4KClJldmlld2VkLWJ5OiBCZW4gWm9uZy1Zb3UgWGllIDxiZW43MTdAYW5kZXN0ZWNo
LmNvbT4KCj4gPiAtLS0KPiA+ICAuZWRpdG9yY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAyICstCj4gPiAgcGxhdGZvcm0vZ2VuZXJpYy9hbmRlcy9hbmRlc19wbWEuYyAgICAg
ICAgIHwgMiArLQo+ID4gIHBsYXRmb3JtL2dlbmVyaWMvaW5jbHVkZS9hbmRlcy9hbmRlcy5oICAg
ICB8IDIgKy0KPiA+ICBwbGF0Zm9ybS9nZW5lcmljL2luY2x1ZGUvYW5kZXMvYW5kZXNfcG1hLmgg
fCAyICstCj4gPiAgcGxhdGZvcm0vZ2VuZXJpYy9yZW5lc2FzL3J6Zml2ZS9yemZpdmUuYyAgIHwg
MiArLQo+ID4gIDUgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQo+ID4KPiA+IGRpZmYgLS1naXQgYS8uZWRpdG9yY29uZmlnIGIvLmVkaXRvcmNvbmZpZwo+ID4g
aW5kZXggZTY2YjFjYTMuLjI2ZjkwNTM0IDEwMDY0NAo+ID4gLS0tIGEvLmVkaXRvcmNvbmZpZwo+
ID4gKysrIGIvLmVkaXRvcmNvbmZpZwo+ID4gQEAgLTEsNCArMSw0IEBACj4gPiAtIyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5Cj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogQlNELTItQ2xhdXNlCj4gPiAgIyBTZWUgaGVyZSBmb3IgbW9yZSBpbmZvcm1hdGlvbiBh
Ym91dCB0aGUgZm9ybWF0IGFuZCBlZGl0b3Igc3VwcG9ydDoKPiA+ICAjIGh0dHBzOi8vZWRpdG9y
Y29uZmlnLm9yZy8KPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvcGxhdGZvcm0vZ2VuZXJpYy9hbmRlcy9h
bmRlc19wbWEuYyBiL3BsYXRmb3JtL2dlbmVyaWMvYW5kZXMvYW5kZXNfcG1hLmMKPiA+IGluZGV4
IDA5ZTVhMzBjLi5lZWViMTEwZSAxMDA2NDQKPiA+IC0tLSBhL3BsYXRmb3JtL2dlbmVyaWMvYW5k
ZXMvYW5kZXNfcG1hLmMKPiA+ICsrKyBiL3BsYXRmb3JtL2dlbmVyaWMvYW5kZXMvYW5kZXNfcG1h
LmMKPiA+IEBAIC0xLDQgKzEsNCBAQAo+ID4gLS8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBH
UEwtMi4wCj4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEJTRC0yLUNsYXVzZQo+ID4g
IC8qCj4gPiAgICogQ29weXJpZ2h0IChDKSAyMDIzIFJlbmVzYXMgRWxlY3Ryb25pY3MgQ29ycC4K
PiA+ICAgKiBDb3B5cmlnaHQgKGMpIDIwMjQgQW5kZXMgVGVjaG5vbG9neSBDb3Jwb3JhdGlvbgo+
ID4gZGlmZiAtLWdpdCBhL3BsYXRmb3JtL2dlbmVyaWMvaW5jbHVkZS9hbmRlcy9hbmRlcy5oIGIv
cGxhdGZvcm0vZ2VuZXJpYy9pbmNsdWRlL2FuZGVzL2FuZGVzLmgKPiA+IGluZGV4IDM0MDNhNThi
Li5iZmVkZjAzNCAxMDA2NDQKPiA+IC0tLSBhL3BsYXRmb3JtL2dlbmVyaWMvaW5jbHVkZS9hbmRl
cy9hbmRlcy5oCj4gPiArKysgYi9wbGF0Zm9ybS9nZW5lcmljL2luY2x1ZGUvYW5kZXMvYW5kZXMu
aAo+ID4gQEAgLTEsNCArMSw0IEBACj4gPiAtLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjAgKi8KPiA+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogQlNELTItQ2xhdXNlICov
Cj4gPiAgLyoKPiA+ICAgKiBDb3B5cmlnaHQgKEMpIDIwMjQgQW5kZXMgVGVjaG5vbG9neSBDb3Jw
b3JhdGlvbgo+ID4gICAqLwo+ID4gZGlmZiAtLWdpdCBhL3BsYXRmb3JtL2dlbmVyaWMvaW5jbHVk
ZS9hbmRlcy9hbmRlc19wbWEuaCBiL3BsYXRmb3JtL2dlbmVyaWMvaW5jbHVkZS9hbmRlcy9hbmRl
c19wbWEuaAo+ID4gaW5kZXggYmU2MTQ5NjQuLjRhNjZlMWI2IDEwMDY0NAo+ID4gLS0tIGEvcGxh
dGZvcm0vZ2VuZXJpYy9pbmNsdWRlL2FuZGVzL2FuZGVzX3BtYS5oCj4gPiArKysgYi9wbGF0Zm9y
bS9nZW5lcmljL2luY2x1ZGUvYW5kZXMvYW5kZXNfcG1hLmgKPiA+IEBAIC0xLDQgKzEsNCBAQAo+
ID4gLS8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovCj4gPiArLyogU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEJTRC0yLUNsYXVzZSAqLwo+ID4gIC8qCj4gPiAgICogQ29weXJp
Z2h0IChDKSAyMDIzIFJlbmVzYXMgRWxlY3Ryb25pY3MgQ29ycC4KPiA+ICAgKi8KPiA+IGRpZmYg
LS1naXQgYS9wbGF0Zm9ybS9nZW5lcmljL3JlbmVzYXMvcnpmaXZlL3J6Zml2ZS5jIGIvcGxhdGZv
cm0vZ2VuZXJpYy9yZW5lc2FzL3J6Zml2ZS9yemZpdmUuYwo+ID4gaW5kZXggNDRkYjM2NzEuLjZj
M2RhMDk1IDEwMDY0NAo+ID4gLS0tIGEvcGxhdGZvcm0vZ2VuZXJpYy9yZW5lc2FzL3J6Zml2ZS9y
emZpdmUuYwo+ID4gKysrIGIvcGxhdGZvcm0vZ2VuZXJpYy9yZW5lc2FzL3J6Zml2ZS9yemZpdmUu
Ywo+ID4gQEAgLTEsNCArMSw0IEBACj4gPiAtLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjAKPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogQlNELTItQ2xhdXNlCj4gPiAg
LyoKPiA+ICAgKiBDb3B5cmlnaHQgKEMpIDIwMjIgUmVuZXNhcyBFbGVjdHJvbmljcyBDb3JwLgo+
ID4gICAqCj4gPiAtLQo+ID4gMi40Ny4yCj4gPgo+IAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0
Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
