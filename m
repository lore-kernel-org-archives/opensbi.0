Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8A9C83F09
	for <opensbi@archiver.kernel.org>; Wed,  9 Jul 2025 10:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hghe0B2vAG86LbAtrVW3j7v+FPMI/TuuUQeAQWEmFzU=; b=gLEZ/8B7k+ECnc
	gc8NR18vF2cYCl7Gxo3OHiF0UcJOH2KJhQ31t/GIsVW0WF85Es4pimnPy1ACqT1YPFUQRqO/7x+SU
	x5OQQnQuxSMdDD8H7EFY3sqxngQ2p411nBaGC6KmQzHT70wNsyLfQuzyl1exDeuD0Ce6uTp2F6Dms
	C7GeSX8bEdCc8uLcnvsEuoKTCqIBxwdxHEwIdRafKRAjwElZDVu4Y2WrVd6bcn+q4rTE2WN77lYyv
	SSsgF3Qz4byX7eyfnu95mbTjO7wIcTP8W/WzKZNlK+YQ6WcAJ08n0FT0kEH54jJODPurY9SfIR42t
	6ssntvyOcXaqTQx0g/Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZSKR-00000008MRZ-2pNE;
	Wed, 09 Jul 2025 10:47:07 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZR10-000000087LL-0ieI
	for opensbi@lists.infradead.org;
	Wed, 09 Jul 2025 09:23:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5wbXjhnrRVr3GKHf7moZN1gcnIsLkGvI6SBgTzXfD58=; b=BCF92jxpWg+6HbkxdpLqNC35mE
	+oTddIZkOczutTwJt/+a4an7OgP061qWnNYGrGJxF0nOTEh6tzF1J+wnaEp/m76eawgZbAPBerDFS
	UtBc00/89vTo3PoeBpGXDGHxM5sLPKGjByn0AUWJQyj2bxoCr2GgZWZVC3n0H4PUjVGQdYvogSh8c
	By0GTcAtSwn80GY8xS9nwAv18WalEu1dPPOGMzlLXytsX1EbqrdsDzYZ3XaCnqpeT2EaEbi5xNTQ4
	gBM/GmXo8e6a8HayrWyaNfpox1iZ/iGRKCdjBghJ0CMcSKilDkrsQjVWuHEa/GGFDFUwxS8vrJHOD
	JVnQSftw==;
Received: from [63.135.74.212] (helo=[192.168.1.249])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1uZR0v-00DubF-NC; Wed, 09 Jul 2025 10:22:54 +0100
Message-ID: <36b2031a-9123-43be-a66c-cecbdb626c8a@codethink.co.uk>
Date: Wed, 9 Jul 2025 10:22:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] include: sbi: fix swap errors with newer gcc
 -Werror=sequence-point
To: Rahul Pathak <rahul@summations.net>
Cc: opensbi@lists.infradead.org
References: <20250704122938.897832-1-ben.dooks@codethink.co.uk>
 <CABdD5xnyfwv3u7pBLwVfUWhpH0cr+SzFMOQKdWb3OgUgLDNB_g@mail.gmail.com>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <CABdD5xnyfwv3u7pBLwVfUWhpH0cr+SzFMOQKdWb3OgUgLDNB_g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_022258_294460_2266F18F 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
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

T24gMDkvMDcvMjAyNSAwMzoxNSwgUmFodWwgUGF0aGFrIHdyb3RlOgo+IE9uIEZyaSwgSnVsIDQs
IDIwMjUgYXQgNTo1OeKAr1BNIEJlbiBEb29rcyA8YmVuLmRvb2tzQGNvZGV0aGluay5jby51az4g
d3JvdGU6Cj4+Cj4+IFRoZSBCU1dBUHh4KCkgbWFjcm9zIGFyZSBub3cgdGhyb3dpbmcgdGhlIGZv
bGxvd2luZyB3YXJuaW5ncyB3aXRoCj4+IG5ld2VyIGdjYyB2ZXJzaW9ucy4gVGhpcyBpcyBkdWUg
dG8gdGhyb3dpbmcgYW4gYXJndW1lbnQgaW4gdGhhdCBtYXkKPj4gYmUgZXZhbHVhdGVkIG1vcmUg
dGhhbiBvbmUgKEkgdGhpbmspIGFuZCB0aGVyZWZvcmUgdGhpbmdzIGxpa2UgdGhlCj4+IGV4YW1w
bGUgYmVsb3cgc2hvdWxkIGJlIGF2b2lkZWQuCj4+Cj4+IEZpeCBieSBtYWtpbmcgYSBzZXQgb2Yg
QlNXQVB4eCgpIHdyYXBwZXJzIHdoaWNoIHNwZWNpZmljYWxseSBvbmx0Cj4gCj4gbml0OiAlcy9v
bmx5L29ubHQgPwo+IAo+PiBldmFsdWF0ZSAneCcgb25jZS4KPj4KPj4gSW4gZmlsZSBpbmNsdWRl
ZCBsaWIvc2JpL3NiaV9tcHh5LmM6MjE6Cj4+IGxpYi9zYmkvc2JpX21weHkuYzogSW4gZnVuY3Rp
b24g4oCYc2JpX21weHlfd3JpdGVfYXR0cnPigJk6Cj4+IGliL3NiaS9zYmlfbXB4eS5jOjYzMjo2
MzogZXJyb3I6IG9wZXJhdGlvbiBvbiDigJhtZW1faWR44oCZIG1heSBiZSB1bmRlZmluZWQgWy1X
ZXJyb3I9c2VxdWVuY2UtcG9pbnRdCj4+ICAgIDYzMiB8ICAgICAgICAgICAgICAgICAgICAgICAg
IGF0dHJfdmFsID0gbGUzMl90b19jcHUobWVtX3B0clttZW1faWR4KytdKTsKPj4gICAgICAgIHwg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH5+
fn5+fn5efgo+Pgo+IAo+IE1heSBJIGFzayB3aGljaCBnY2MgdmVyc2lvbj8KCmdjYyAxNS4xIChy
ZXF1aXJlZCBhcyBpdCBpcyB0aGUgb25seSBvbmUgdGhhdCBjdXJyZW50bHkgYnVpbGRzIGEKYmln
LWVuZGlhbiByb290ZnMgd2l0aCBnbGliYyBvbiBidWlsZHJvb3QpCgo+IExHVE0KPiAKPiBSZXZp
ZXdlZC1ieTogUmFodWwgUGF0aGFrIDxyYWh1bEBzdW1tYXRpb25zLm5ldD4KCgotLSAKQmVuIERv
b2tzCQkJCWh0dHA6Ly93d3cuY29kZXRoaW5rLmNvLnVrLwpTZW5pb3IgRW5naW5lZXIJCQkJQ29k
ZXRoaW5rIC0gUHJvdmlkaW5nIEdlbml1cwoKaHR0cHM6Ly93d3cuY29kZXRoaW5rLmNvLnVrL3By
aXZhY3kuaHRtbAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5z
YmkK
