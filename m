Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B0FCCF9E3
	for <opensbi@archiver.kernel.org>; Tue, 11 Nov 2025 09:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tGB7NsS9N1OmqN65bnSLo5V3X9qUxm3P+VqiynNyhQs=; b=I4GC+C3vao2tbp
	vzCBhakrd2rMHg2ofWu5ZTY4CvmnZLsrFbGp1rIdrbVxqHvGRQH9xPsjI99Z9aLGiTnhSpTrRluxT
	M8HotEifmyXkPApVnOg7Ib7fuhAz5cWp/59hQKjB/b3JtnTBqJ7qUY7aIqhZHn+ImlAe57wdw+WQ6
	Kg3UCdWhZN2J13PaqDJpOEiJRnl8Q7cZnT9INdnaohXj2rhw7POiQ6UCx83Ke5LDrLoAJnFSCyVos
	gJL8OXE1lUM6Dh05USVlWmR3o2ZvvOh1SwNT0iaKNhHpNT2B6BdplLhNciPWEkohh+cEJHhjJVvZy
	clzg550g+0QgLwWT1dcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIl0a-00000006sQG-2bFF;
	Tue, 11 Nov 2025 09:49:52 +0000
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIl0Y-00000006sPQ-3PEM
	for opensbi@lists.infradead.org;
	Tue, 11 Nov 2025 09:49:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1762854587; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=ig4eSxqbx6fUBDGsrErYTuCNfnNOV4I/jl1P8nz6DrI=;
	b=kYh65wh98HtzsJYa98UpOkNnNMCoyK+z0ZQ6nu8zQE4ujdE/QzckAoKNP0U8Vdlb/WltokFOUYS5WRMLLCMFcL9j5UvUoHMaCW1vNyMfxWiu1efLsHbKVrUGTaOsK3FgX3/5aNHzo4Rlf8R6FTCaG7kfQ931ba6/xq6esEk6cyo=
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0WsBJyAm_1762854578 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 11 Nov 2025 17:49:41 +0800
From: cp0613@linux.alibaba.com
To: rkrcmar@ventanamicro.com
Cc: anup@brainfault.org,
	guoren@kernel.org,
	opensbi@lists.infradead.org
Subject: Re: [PATCH v3] lib: sbi: Enable Ssqosid Ext using mstateen0
Date: Tue, 11 Nov 2025 17:49:36 +0800
Message-ID: <20251111094938.1492-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DE53DAU3LAAK.2FGKTU66OSUEX@ventanamicro.com>
References: <DE53DAU3LAAK.2FGKTU66OSUEX@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_014951_036759_DB56C3FA 
X-CRM114-Status: GOOD (  23.76  )
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

T24gMjAyNS0xMS0xMCAwMjo0MSBQTSwgUmFkaW0gS3LEjW3DocWZIHdyb3RlOgoKPj4gSSB0aGlu
ayBpdCdzIGJlY2F1c2Ugc3JtY2ZnIGhhcyBlZmZlY3Qgb24gTS1tb2RlLCBzbyB0aGUgZXh0ZW5z
aW9uIGlzCj4+IGNvbXBsZXRlbHkgaW5kZXBlbmRlbnQgdG8gYWxsb3cgaXQgaW4gcHVyZSBNIHN5
c3RlbXMuCj4+IAo+PiAoV2UgZW5hYmxlIHNybWNmZyBpbiBtc3RhdGVlbiByZWdhcmRsZXNzIG9m
IFMgdmVyc2lvbiwgc28gdGhlcmUgaXMgYQo+PiAgcG90ZW50aWFsIGJ1ZyB3aGVyZSB3ZSB3b3Vs
ZG4ndCBjb3JyZWN0bHkgY29udGV4dCBzd2l0Y2ggdGhlIGNzciwgZ2l2ZW4KPj4gIGEgc3lzdGVt
IHdpdGggd2VpcmQgY29tYmluYXRpb24gb2YgZXh0ZW5zaW9ucy4pCgo+IFdlIG1pZ2h0IGhhdmUg
dGFrZWQgcGFzdCBlYWNoIG90aGVyIGhlcmUuCj4gCj4gSSdtIGFyZ3VpbmcgdGhhdCBSSVNDLVYg
YWxsb3dzIGEgaGFydCB3aXRoIElTQSBTMXAxMV9Tc3Fvc2lkIHRvIGV4aXN0LAo+IGJlY2F1c2Ug
U3Nxb3NpZCBkb2Vzbid0IGRlcGVuZCBvbiBTLCBzbyBvcGVuc2JpIHNob3VsZCBjb250ZXh0IHN3
aXRjaAo+IHNybWNmZyBvbiBzdWNoIHBvdGVudGlhbCAoYWxiZWl0IHVubGlrZWx5KSBtYWNoaW5l
Lgo+IAo+IE90aGVyd2lzZSBkb21haW5zIGNvdWxkIG9ic2VydmUgc3JtY2ZnIHNldCBieSBvdGhl
ciBkb21haW5zLgo+IAo+ID4gSSBoYXZlIGEgZGlmZmVyZW50IG9waW5pb24gb24gdGhpcyBwb2lu
dC4gVGhpcyBleHRlbnNpb24gaXMgYmFzaWNhbGx5IHVucmVsYXRlZAo+ID4gdG8gTS1tb2RlLCBp
bnN0ZWFkLCBpdCBydW5zIGluIFMtbW9kZS4gSXQgbWF5IGJlIG5lY2Vzc2FyeSB0byBjb25zaWRl
ciB0aGUgYmFja2dyb3VuZAo+ID4gb2Ygc3Nxb3NpZCdzIGludHJvZHVjdGlvbi4gVGhpcyBpcyB0
byBlbnN1cmUgdGhhdCBjZXJ0YWluIGNyaXRpY2FsIGJ1c2luZXNzIHByb2Nlc3Nlcwo+ID4gY2Fu
IG9idGFpbiBzdWZmaWNpZW50IGhhcmR3YXJlIHJlc291cmNlcyB0byBydW4gYW5kIHRodXMgZ3Vh
cmFudGVlIHNlcnZpY2UgcXVhbGl0eS4KPiA+Cj4gPiBTaW1pbGFyIHRlY2hub2xvZ2llcyBpbmNs
dWRlIEludGVsLVJEVCBhbmQgQVJNIE1QQU0uIE9uIHRoZSBMaW51eCBzaWRlLCBEcmV3IGhhcyBh
bHJlYWR5Cj4gPiBzdWJtaXR0ZWQgcmVsZXZhbnQgcGF0Y2hlcyBbMV0uIEl0IGNhbiBiZSBzZWVu
IHRoYXQgaW4gdGhlIGZ1dHVyZSwgaXQgd2lsbCBpbmV2aXRhYmx5IGJlCj4gPiB1c2VkIGluIGNv
bmp1bmN0aW9uIHdpdGggTGludXggcmVzY3RybCwKPiAKPiBZZWFoLCBJJ20gcGxhbm5pbmcgdG8g
bG9vayBhdCB0aGUgcGF0Y2hlcyBhcyB3ZWxsLCBiZWNhdXNlIFNzcW9zaWQncwo+IGRlc2lnbiBo
YXMgYSBsb3Qgb2YgcG90ZW50aWFsIGZvciBzaWRlLWNoYW5uZWxzLgo+IAo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNvIHRoZXJlIGlzIG5vIG5lZWQgdG8gY29u
c2lkZXIgdGhlIGV4ZWN1dGlvbgo+ID4gc2l0dWF0aW9uIGluIE0tbW9kZSwgaXQgaXMgb25seSBu
ZWNlc3NhcnkgdG8gZW5hYmxlIHRoZSByZWxldmFudCBwZXJtaXNzaW9ucy4KPiAKPiBUaGUgZXhl
Y3V0aW9uIG9mIE0tbW9kZSBpcyBhZmZlY3RlZCBieSBzcm1jZmcsIHNvIHdlIGhhdmUgdG8gYmUK
PiBleHRyZW1lbHkgY2FyZWZ1bCBhYm91dCBpc29sYXRpb24gaW4gb3BlbnNiaSB0b28sIGVzcGVj
aWFsbHkgd2hlbgo+IGp1Z2dsaW5nIG11bHRpcGxlIGRvbWFpbnMuCj4gCj4gKEkgdGhpbmsgd2Ug
bWlnaHQgYmUgZmluZSBub3csIGJ1dCBoYXZpbmcgb3BlbnNiaSBzd2l0Y2ggdG8gYSBzcm1jZmcK
PiAgdGhhdCBpc24ndCBjb250cm9sbGVkIGJ5IFMtbW9kZSB3aWxsIHJlc3VsdCBpbiBhIGxvdCBs
ZXNzIGhlYWRhY2hlcy4uLikKPiAKPiBUaGFua3MuCgpJbmRlZWQsIHN0cmljdGx5IHNwZWFraW5n
LCB0aGUgZXhlY3V0aW9uIG9mIE0tbW9kZSBpcyBhbHNvIGFmZmVjdGVkIGJ5IHNybWNmZy4KV2hl
biBkZWFsaW5nIHdpdGggbXVsdGlwbGUgZG9tYWlucywgYXR0ZW50aW9uIG5lZWRzIHRvIGJlIHBh
aWQgdG8gaXNvbGF0aW9uIGFuZApjb250ZXh0IHN3aXRjaGluZyBpc3N1ZXMuIEkgdW5kZXJzdGFu
ZCB5b3VyIHBvaW50IG9mIHZpZXcuCgpIb3dldmVyLCBJIHdvbmRlciBpZiBpdCBjb3VsZCBiZSBk
b25lIGluIGEgbGF0ZXIgc3RhZ2Ugb2YgdGhlIHdvcmssIGJlY2F1c2UgdGhlcmUKaXMgY3VycmVu
dGx5IGEgZHJhZnQgc3BlY2lmaWNhdGlvbiBzbW10dFsxXSB0aGF0IGlzIGFsc28gcmVsYXRlZCB0
byB0aGlzLiBUaGlzCmV4dGVuc2lvbiBpbnZvbHZlcyBtdWx0aXBsZSBTdXBlcnZpc29yIERvbWFp
bnMsIGFuZCBhdCB0aGlzIHRpbWUsIGl0IGlzIG5lY2Vzc2FyeQp0byBpbXBsZW1lbnQgY29udGV4
dCBzd2l0Y2hpbmcgb2Ygc3JtY2ZnIGJldHdlZW4gZGlmZmVyZW50IGRvbWFpbnMuCgpUaGFua3Ms
ClBlaQoKWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1zbW10dAoKLS0gCm9wZW5z
YmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
