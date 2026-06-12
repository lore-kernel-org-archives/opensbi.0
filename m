Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD3AECD98CC
	for <opensbi@archiver.kernel.org>; Fri, 12 Jun 2026 03:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZgH6vHTYqq2Y/W+izXo3hdTvKSRm3YsdzYlg5PX1xUI=; b=UFTPv0cFGqsi1Q
	m++90gWh6EiK9w50jOQt73badc+1HOFPw+yFgjWOaU9l7yRn+ctWkIhN+0ZFGllZjRDHdsBAH+jdm
	rpg/5QgSSdJ35Us5WkMGGVq86OOYmfVdQmim6a45PdJN9YJ0ud/Hj44GIYsKGNUodm0ab6UnAHxYN
	pmjAFa8yR7Ahn+vwoYK7W/TSpoJS+iicXLB1l1qXIUiIQpxh0BVMxnzY5j+IOtJa9X8GIltLI0Nyz
	hI1HaXNztw6uNaYLFG1CZktMW3sDv+IAEitxSbzoPQgKS9MhODNDdNoTa9zexL1aqtFJvVfwy2rJP
	oZ77fRnbYqn+ApUo+Xzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXsZj-0000000AJsS-3Wbc;
	Fri, 12 Jun 2026 03:28:55 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXsZg-0000000AJs8-21G7
	for opensbi@lists.infradead.org;
	Fri, 12 Jun 2026 03:28:54 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-69e1f777bcaso445324eaf.1
        for <opensbi@lists.infradead.org>; Thu, 11 Jun 2026 20:28:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781234931; cv=none;
        d=google.com; s=arc-20240605;
        b=jk9VPq+XeUp7OZ7VeJZ2bMSywh2cDQT3IqbaW7OEI4DT4u5iIYl71/ZS5ip0KbSqFG
         qqUSlFeSt4Cwuj9I9Z1wgE+dF+ZcFMLs+cb33dTTpnAMcw/yAhRuZsoUOcPqyjOs4dYL
         ID5dGZtsv31aJf23QtG8IYplBRLFXBvaQJqkglErc63+uvwtBt/MBq7/DQOk9y2oWRHz
         oie+uPH6hlEeMk353X5GX8JLaw1pCbluVhzwIv5zhX1Ch1dWL+AQG6PiGRP8NSVYMvno
         +b7m5PT/siX6ljy9PGh0ehXsJ5OLDsCygNvHJy1nYPcIHHn91LsmWSx41uy2wfYegtuG
         6r3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xK7yOk5fPIvwV355gRBenLkU8aQ8qPUmiG05mpl7XCU=;
        fh=QVHxqCLHqs0bJdh6Vn6svZuGVfPNrZYw0jiyM3V3dlQ=;
        b=O+jgFwr97KfkOMv2Nw2cz8KDxXM072n4LvJzA0cuptm9GiTzMh6xGQHhwGAZj746Lt
         cJI8hhE5RNdnlokP/xa+QXss9fH+ZHfFB1lfVxP9LYbDMoSHozhohtuL3O3ZvsZaz1Uz
         7xvAJ1JOYDW3XNTV7pU5Sie0eaI/TlhXdKhwwmSRzoMB2yDfZW1dtbfjQPkwIgV4BFsR
         bFsA90jNleDso0855EuLPWexn5xHVePxs0jt+bUHsCelxRzQKLflL1Vn7BR6ndaIKpoU
         2JV+hrAat0zNB0QmE8SE4KFEIDuYYnLtdABIT+pW+unO7fz1IW4Tdt0yxwZXf7gpj4gh
         xl5A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1781234931; x=1781839731; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xK7yOk5fPIvwV355gRBenLkU8aQ8qPUmiG05mpl7XCU=;
        b=jHrmqzQX/Ymg7Ko8NgxEkRVIpPPGmcGBTI1EeLgR+Cx04H39pfvjd0Kj5RkyHLPoXU
         WnOxVFhWdhbn+h2LBDo+Ep2O/KWFmAm4O6F2aWvrhI/JiOtwhSxVNbb7+qDk6vGTAGP8
         6Yw6wa+su89vwwl2eBIMon2NnWUoBfas08LgcQBmVdgj4Wq1M99XdfIz3Y8asCgtm3jB
         1+7rZpLjRnYfPgZwht0x9/StL/Mqi8/omQ2IiWVvAYl4HAA7Axf1+UDTy3/6WR2fytBs
         Y6kp1sg8gTMa7rCU2Wxs3QeegmPF7nblVJwdxWPoFSR5Gk4gGzrRwTe7EyyFyX1/u0tw
         uXdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781234931; x=1781839731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xK7yOk5fPIvwV355gRBenLkU8aQ8qPUmiG05mpl7XCU=;
        b=oqTpcGNj1B7NGOo3Fn2ZuNS6XQ4cFz21o4EmOfpWR065DbJ/ScXLfRmFbWpvdnFfd3
         e7aBxZh3wZ83cfgeLbi0h5xzcok2ryoxxEdXVwporuQ5yU3kT8WEkZJHcfp/lmuMq8mO
         vVkZaWnWBUeJzqqyIAVHrgU3ajMmw3b3UMD4izp3JQAkMW3aHnnKNHen/Rrz+5bjrDpz
         dP95S54ZDlG4s/ampakca/mpoH9gyVtrfvjUYyDkns3km8pEMzLq1N7rNHP2uNhhD68+
         Znt4eqN5dtZ8sInSQYPGfrRyQgYFEC8ldu9vUoepMW5mwYp1yvnfWLLG/WEGfwXSvpr/
         bk8w==
X-Gm-Message-State: AOJu0Yx1BBb+19jrKKauE/OQzSKeo26e0k916+IlF0rRRQH8Uq2r0vgL
	tWOdqM9h+TVItMujRspT2CFtJceW9MKxVLeJQNte10T4x4chqyy9Npk9z+r43zF9fbhavJH3yH+
	R32Bo+JoS7hvY7alxBjQCxNlXlAeAEgXohzoZo3L18tzFxpKQr7rehNc=
X-Gm-Gg: Acq92OEwjkKTaA8fLHIY4nre1ooDQiBNWm6+qfUZcVOpg5qCgV5uv0bTLE5op3JLxF1
	XAxig4IvuFuQhxYqsEcp+kAaNL5UpCVapHGlZBzcS6pgRkTEbjEeNbGQSuxd8C0/n+0G2o+BVUO
	0OOl2af6lkI0n8Gq3qSLGQm1aQ03S/3zi/q0flebkUAAAjVVquy6OfrgAXy3UbgwAv2PzwZGnvE
	BYOyxG88/8Q3VBANMto8RW1dtSNiVgmxd02NHKP980tkg4WDIrfzKD7qNDg8ihsjqHd+S8qujg5
	GM+AeEy0jX46pa40rLatxyrJXD3jYTh9oo8L/mdKXdLnE/CM9l830zNTkCt6qUMsSw0GXslj7xt
	9msij7m58G5XdQ03yYo8W82elRA==
X-Received: by 2002:a05:6820:2915:b0:69e:708e:ba91 with SMTP id
 006d021491bc7-69edab3aea6mr961749eaf.30.1781234930947; Thu, 11 Jun 2026
 20:28:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260508-payload_alignment-v1-1-6628b4ec1ed3@oss.tenstorrent.com>
In-Reply-To: <20260508-payload_alignment-v1-1-6628b4ec1ed3@oss.tenstorrent.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 12 Jun 2026 08:58:39 +0530
X-Gm-Features: AVVi8CeNm6ON5CTHBvGDjsKafYmf1nsJDf9mM-i2XPs6SHf00yUG6nfiZ7JbTq4
Message-ID: <CAAhSdy2Szq+ER882cdOR3VYgxLioXMh_f2LND=7X3GmzhoOtag@mail.gmail.com>
Subject: Re: [PATCH] platform: Fix payload alignment when FW_TEXT_START isn't
 2M/4M aligned
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_202852_797308_7A9BAA10 
X-CRM114-Status: GOOD (  21.66  )
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

T24gRnJpLCBNYXkgOCwgMjAyNiBhdCAxMDowMuKAr1BNIEFuaXJ1ZGggU3Jpbml2YXNhbgo8YXNy
aW5pdmFzYW5Ab3NzLnRlbnN0b3JyZW50LmNvbT4gd3JvdGU6Cj4KPiBUaGUgcGF5bG9hZCBmb3Ig
RldfUEFZTE9BRCBuZWVkcyB0byBiZSBwbGFjZWQgYXQgYSAyTS80TSBhbGlnbmVkIGFkZHJlc3MK
PiAoZm9yIDY0LzMyIGJpdCBzeXN0ZW1zKSBhbmQgdGhlIGN1cnJlbnQgbWFrZWZpbGUgdXNlcyBG
V19QQVlMT0FEX09GRlNFVAo+IHRvIGFjaGlldmUgdGhpcy4gVGhpcyBvbmx5IHdvcmtzIGlmIEZX
X1RFWFRfU1RBUlQgaXMgYWxyZWFkeSAyTS80TQo+IGFsaWduZWQuIE1vc3QgZXhpc3RpbmcgcGh5
c2ljYWwvdmlydHVhbCBwbGF0Zm9ybXMgaGF2ZSB1c2VkIGEKPiBGV19URVhUX1NUQVJUIG9mIDB4
MCBvciAweDgwMDAwMDAwLCBzbyB0aGlzIGhhc24ndCBiZWVuIGFuIGlzc3VlIHNvIGZhci4KPiBJ
ZiwgZm9yIGV4YW1wbGUsIEZXX1RFWFRfU1RBUlQgaXMgMHg4MDAwMCwgdGhlIHBheWxvYWQgd291
bGQgZW5kIHVwCj4gcGxhY2VkIGF0IDB4MjgwMDAwIG9uIGEgNjQgYml0IHN5c3RlbSwgd2hpY2gg
aXNuJ3QgYSAyTSBhbGlnbmVkCj4gYWRkcmVzcy4KPgo+IFVwZGF0ZSB0aGUgbWFrZWZpbGUgdG8g
dXNlIEZXX1BBWUxPQURfQUxJR04gaW5zdGVhZC4gVGhpcyB3aWxsIGVuc3VyZQo+IHRoYXQgdGhl
IGFkZHJlc3MgcGlja2VkIGZvciB0aGUgcGF5bG9hZCBpcyAyTS80TSBhbGlnbmVkIGlycmVzcGVj
dGl2ZSBvZgo+IHdoZXJlIEZXX1RFWFRfU1RBUlQgaXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbmly
dWRoIFNyaW5pdmFzYW4gPGFzcmluaXZhc2FuQG9zcy50ZW5zdG9ycmVudC5jb20+CgpMR1RNLgoK
UmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpBcHBsaWVkIHRo
aXMgcGF0Y2ggdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywKQW51cAoKPiAtLS0K
PiBUbzogb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gLS0tCj4gIHBsYXRmb3JtL2dlbmVy
aWMvb2JqZWN0cy5tayAgfCA0ICsrLS0KPiAgcGxhdGZvcm0vdGVtcGxhdGUvb2JqZWN0cy5tayB8
IDYgKysrLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL3BsYXRmb3JtL2dlbmVyaWMvb2JqZWN0cy5tayBiL3BsYXRm
b3JtL2dlbmVyaWMvb2JqZWN0cy5tawo+IGluZGV4IGM0YThmZWUyLi5jYTdmYjhiNyAxMDA2NDQK
PiAtLS0gYS9wbGF0Zm9ybS9nZW5lcmljL29iamVjdHMubWsKPiArKysgYi9wbGF0Zm9ybS9nZW5l
cmljL29iamVjdHMubWsKPiBAQCAtMzUsOSArMzUsOSBAQCBGV19KVU1QX0ZEVF9PRkZTRVQ9MHgy
MjAwMDAwCj4gIEZXX1BBWUxPQUQ9eQo+ICBpZmVxICgkKFBMQVRGT1JNX1JJU0NWX1hMRU4pLCAz
MikKPiAgICAjIFRoaXMgbmVlZHMgdG8gYmUgNE1CIGFsaWduZWQgZm9yIDMyLWJpdCBzeXN0ZW0K
PiAtICBGV19QQVlMT0FEX09GRlNFVD0weDQwMDAwMAo+ICsgIEZXX1BBWUxPQURfQUxJR049MHg0
MDAwMDAKPiAgZWxzZQo+ICAgICMgVGhpcyBuZWVkcyB0byBiZSAyTUIgYWxpZ25lZCBmb3IgNjQt
Yml0IHN5c3RlbQo+IC0gIEZXX1BBWUxPQURfT0ZGU0VUPTB4MjAwMDAwCj4gKyAgRldfUEFZTE9B
RF9BTElHTj0weDIwMDAwMAo+ICBlbmRpZgo+ICBGV19QQVlMT0FEX0ZEVF9PRkZTRVQ9JChGV19K
VU1QX0ZEVF9PRkZTRVQpCj4gZGlmZiAtLWdpdCBhL3BsYXRmb3JtL3RlbXBsYXRlL29iamVjdHMu
bWsgYi9wbGF0Zm9ybS90ZW1wbGF0ZS9vYmplY3RzLm1rCj4gaW5kZXggZjI0MGE1NTcuLjliNGJj
OTI4IDEwMDY0NAo+IC0tLSBhL3BsYXRmb3JtL3RlbXBsYXRlL29iamVjdHMubWsKPiArKysgYi9w
bGF0Zm9ybS90ZW1wbGF0ZS9vYmplY3RzLm1rCj4gQEAgLTg1LDExICs4NSwxMSBAQCBGV19QQVlM
T0FEPTx5fG4+Cj4gICMgVGhpcyBuZWVkcyB0byBiZSA0TUIgYWxpZ25lZCBmb3IgMzItYml0IHN1
cHBvcnQKPiAgIyBUaGlzIG5lZWRzIHRvIGJlIDJNQiBhbGlnbmVkIGZvciA2NC1iaXQgc3VwcG9y
dAo+ICBpZmVxICgkKFBMQVRGT1JNX1JJU0NWX1hMRU4pLCAzMikKPiAtRldfUEFZTE9BRF9PRkZT
RVQ9MHg0MDAwMDAKPiArRldfUEFZTE9BRF9BTElHTj0weDQwMDAwMAo+ICBlbHNlCj4gLUZXX1BB
WUxPQURfT0ZGU0VUPTB4MjAwMDAwCj4gK0ZXX1BBWUxPQURfQUxJR049MHgyMDAwMDAKPiAgZW5k
aWYKPiAtIyBGV19QQVlMT0FEX0FMSUdOPTB4MTAwMAo+ICsjIEZXX1BBWUxPQURfT0ZGU0VUPTB4
NDAwMDAwCj4gICMgRldfUEFZTE9BRF9QQVRIPSJwYXRoIHRvIG5leHQgYm9vdCBzdGFnZSBiaW5h
cnkgaW1hZ2UgZmlsZSIKPiAgIyBGV19QQVlMT0FEX0ZEVF9PRkZTRVQ9MHgyMjAwMDAwCj4gICMK
Pgo+IC0tLQo+IGJhc2UtY29tbWl0OiAyMjU3ZTk5NTcxMDNhYWM3ZGY4MDg5YTU5YjlkNGJkZGE3
YzU5MmNlCj4gY2hhbmdlLWlkOiAyMDI2MDUwOC1wYXlsb2FkX2FsaWdubWVudC01NTg1YTg2ZWM3
ZTQKPgo+IEJlc3QgcmVnYXJkcywKPiAtLQo+IEFuaXJ1ZGggU3Jpbml2YXNhbiA8YXNyaW5pdmFz
YW5Ab3NzLnRlbnN0b3JyZW50LmNvbT4KPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+
IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5z
YmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL29wZW5zYmkK
