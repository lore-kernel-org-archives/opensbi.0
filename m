Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6BE606A31E
	for <opensbi@archiver.kernel.org>; Thu, 29 Oct 2026 06:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=opuN1AWY;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=nDvq1tLf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VC/FBsvotUAsqnumcLXIglyj4xJw9rT3makj69ssL/U=; b=opuN1AWYTPPiHYXhvWGsgf65EQ
	gUepnLc+yTt1JiODGsEiv4niu2Ls++oAkd10jUBoWhpQo6Fs6nxNJOZP8N+LzQ5BIE5yun6a41Prn
	bbSVZaY8mnYiBbm8wYFXpOTpVWU25qXZ1Wrk6Ko4JZEwkX4FtM04dXsPM9Xvpuj59GvorWHTe7wR2
	/EOxjAyBpoof8gtUED8SmKnLeY2HFOz3vaDMFYGA0ZCgS+oj1htJYz+uBAglJuxcPH81L7/O0NsBF
	msPzJqS0Fv0GvoPmcS1xXlesCpc+BxBk9tEJaxU+7i9/2dGO0upiUYX+HI3rr9qBxzSq/KEdAF+p+
	KILNOJFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMJNZ-00000008S7f-1d4R;
	Thu, 29 Oct 2026 06:12:49 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMJNV-00000008S4B-35Mt
	for opensbi@lists.infradead.org;
	Thu, 29 Oct 2026 06:12:47 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so1023891f8f.3
        for <opensbi@lists.infradead.org>; Wed, 28 Oct 2026 23:12:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793254363; cv=none;
        d=google.com; s=arc-20260327;
        b=e5fUut8YqU0aKFjebrfRrNqTFVrKspj17mHE2j8yn45GhsExVeBjnWmFxD1g61fj3y
         jjumQHFmBqh3GzFpQ0qaYoQz6/HDa+heWOCGaltcHr2SvxT4MpxCEC43IUzKLIkwkryM
         hZNdA1oV+GML5BLATWELQwx6UOGMrD+0SIvU+Gbu6Op4msBnUeZI9bfax16aBSN8SICp
         FB/skK57ubEqFzi62eHZQbSNhlY/OS68yU7i+Y9U9Y0pt7UbP280QFsT9eL9ngEeLQcV
         o+n8TAcGKqK4EyajGvlNuC+w8iSEBwvaUdbzF78EyxPYVwza2IE9blLSzDOmZARjIvIk
         eikQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oSoTZQHsLsYjb+bhgZjTz9wiub9cPfsGApmDbC12Cow=;
        fh=+EDDzzDQfvPZN85odfTiHK8xpoC+kwoG2lg9DCuSZIU=;
        b=UkY4q5BbtrM3BEeVZSwDlS4R2G2jXIHOncpa9LqmixTHv1+/B1sTt032bBj1U0oIx0
         XHtwNqFeSYprTbGkNdFvIFt4D7bFiGwoaxbM1wtstpXiafTKn3Lbd2LK4yV255ktVH/o
         S2/fJftrwkztpsyY0i0Ng3Nwh6JtDdNXzMA39HBypZ25FFTFHfOPsdKG9xWB7IqiqpzH
         /ygm5F6eJriCAoYUDSSxCyRr288ontuNzrLFutuUXveRcKvMUbadv3/O7PQW14a7eRvg
         vE/r4LyyV4u5K78osJCnubEuNJN9qfIJUF6jg9Ht8Frp2SM0Trfv7Yr6R+/fbeDUQ+xQ
         uyQA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793254363; x=1793859163; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oSoTZQHsLsYjb+bhgZjTz9wiub9cPfsGApmDbC12Cow=;
        b=nDvq1tLfYWYhe+8vOfKA8yU7bSHAkaIQfU87i0KrR88l9kLEd9lN3eZ92v7Atvhcql
         fyoGqElv6v7A+v5eJVICbB3vjwM2Su9fGaZRYymzCNv6J1e0OHBJcQPNHM3wYuC/Tj3O
         mWFzYCpO/dtuC6Mr12bLioIYL1wJi7CFDCvQ4IzS8+jWsNBovF+j5vUMhteUEiwP/iGI
         GrsVavzbbss4dK0+fLqVPBHU45rC6byLsoisds2qpvetTa3ts6WsvuE3MzS/K9PwzKO4
         Q9phtrwCtStTQDZh5jR97mET5E8o3Ql95gqBCeoWASSn7St/wTovplRsz5KDYWUTayBD
         1ISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793254363; x=1793859163;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oSoTZQHsLsYjb+bhgZjTz9wiub9cPfsGApmDbC12Cow=;
        b=zQjo1tvQ1VgFYRSrkz29Cua4GApVY8fvc8bh3oWOC7acHZFDJNmzKfY2SUyakD3OVp
         LnU9IcdJ2Zyw8r2pdz0ttHM0II63yi4mVb8mo/S1hnV/d45N/wr5XnRGFkuzd8PDM6lf
         rXvQtxZDlTMZ/RNjmg00wzWS3TvaOgyIKxtLfLAH5R0ERSqJ+91EiI43nW3qOSAwKECb
         OL6IcSApNzRjLA86cgyovZXZwuc8oUO4Fjc01GieEMBXj6Jw+glRDPICxCO3ku0AD8Ba
         d3Cy+yGyMa+bhh0Cp/JsOE/ughkDtjl+RLBduJkScC20RAceswv/O7kc1BBj4rd4Yt4p
         iUHw==
X-Gm-Message-State: AFq9FYJACbp/8Tqyo669h9FDoSkzt9lxkDY6RqXVAIgKYpjd69u9S8H7
	g2lLvXpQc3rRKczRQsLi1wa4ijQ5NPuCSH/yc+2+uubd1ejCXQo6PsM3GdSQgWOnIjMDNaDdInh
	DY2Ov1kDIjMeRcGmUuAH/9pLxNceBsy/4pnLKqNH+0w==
X-Gm-Gg: AYBFou2HupRyeo534HECw3ywovOcOqm1tdOGo+BbgGaaDr/Pe2UJDLxkCD3pUUiIwo/
	fPxxRPb76q44JqXQzI9soUxpstPEqR0mYwvGWDY2FpZ8zAY8/XueJ4gkAmxgEpTTzOgYdMXl1uO
	rac/7Nwa/ufjHmuC4lD8a5FG3XDmILxbE3EreVLP6hMfxKx5nBmDiz7hCt9jKKAXZL7FDBJ1sEO
	vTiqlQHTsaF2qLi145vJmQwn34sb0aJLUAbiakOPdrSd8p/oZMYTuP2bueO5cd0iu/nxnjWvI6r
	iXQvHXYZA+3rng/zjY2uwqUXRjheahfGt5Fax+4I5wDxXVyojnOp1z2kNAQexq/nAmrKmA48ceU
	fLIN2FpxGUdroHYcWIwHilql3EVZpecvRpRUpOEQ9AYHSk+NrEcruWY1H7o4V5VFaLvDm1haA6H
	sOnvBIorEg3pmT1tgoS2xXUrc6Muhor3pFP6tJhbhV17cOiUqUVNRPyvWJ
X-Received: by 2002:a05:6000:2488:b0:486:f6dc:52c8 with SMTP id
 ffacd0b85a97d-48e5d5a4030mr10582505f8f.37.1793254363344; Wed, 28 Oct 2026
 23:12:43 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261028-spacemit-k3-v6-0-01d984f60941@linux.spacemit.com> <20261028-spacemit-k3-v6-3-01d984f60941@linux.spacemit.com>
In-Reply-To: <20261028-spacemit-k3-v6-3-01d984f60941@linux.spacemit.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 29 Oct 2026 11:42:32 +0530
X-Gm-Features: AclHuK8_W1_GclPSQzq-_x9Yn2hsM6Qjt5lk917SnQD802DstGq3AIkCIGjx0Vg
Message-ID: <CAAhSdy0ohDyRWp8uoJsm5ynifypLTeyxCUnoDCdheg7iD4qxBA@mail.gmail.com>
Subject: Re: [PATCH v6 3/6] platform: generic: spacemit: k1: move hart init to
 nascent hook
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: opensbi@lists.infradead.org, Xianbin Zhu <xianbin.zhu@linux.spacemit.com>, 
	Bo Gan <ganboing@gmail.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
	Kevin Zhang <zhangmeng.kevin@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_231245_795545_38BC6180 
X-CRM114-Status: GOOD (  17.71  )
X-Spam-Score: -2.1 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBPY3QgMjgsIDIwMjYgYXQgNzoyNOKAr1BNIFRyb3kgTWl0Y2hlbGwKPHRyb3kubWl0
Y2hlbGxAbGludXguc3BhY2VtaXQuY29tPiB3cm90ZToKPgo+IGNvbGRfYm9vdF9hbGxvd2VkKCkg
aXMgYSBwb2xpY3kgcXVlcnkgYW5kIHNob3VsZCBub3QgbW9kaWZ5IHBlci1oYXJ0Cj4gc3RhdGUu
IFRoZSBLMSBjYWxsYmFjayBjdXJyZW50bHkgcHJvZ3JhbXMgTUwyU0VUVVAgYXMgYSBzaWRlIGVm
ZmVjdC4KPgo+IE1vdmUgdGhlIE1MMlNFVFVQIHByb2dyYW1taW5nIHRvIG5hc2NlbnRfaW5pdCgp
LCB3aGljaCBydW5zIG9uIGV2ZXJ5Cj4gaGFydCBiZWZvcmUgY29tbW9uIGluaXRpYWxpemF0aW9u
LiBDaGFpbiBnZW5lcmljX25hc2NlbnRfaW5pdCgpIHRvIGtlZXAKPiB0aGUgZ2VuZXJpYyBwZXIt
aGFydCBzZXR1cCBpbnRhY3QuCj4KPiBGaXhlczogMWY4NGVjMmFjMjJlICgicGxhdGZvcm06IGdl
bmVyaWM6IHNwYWNlbWl0OiBhZGQgSzEiKQo+IFJlcG9ydGVkLWJ5OiBCbyBHYW4gPGdhbmJvaW5n
QGdtYWlsLmNvbT4KPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzU2MjIwMjkzLTg4
ZTMtNDUxZi04MzNlLTgyNTE2NTZhODNkOUBnbWFpbC5jb20KPiBSZXZpZXdlZC1ieTogQm8gR2Fu
IDxnYW5ib2luZ0BnbWFpbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogVHJveSBNaXRjaGVsbCA8dHJv
eS5taXRjaGVsbEBsaW51eC5zcGFjZW1pdC5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAg
UGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpBcHBsaWVkIHRoaXMgcGF0Y2ggdG8gdGhlIHJp
c2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywKQW51cAoKPiAtLS0KPiAgcGxhdGZvcm0vZ2VuZXJp
Yy9zcGFjZW1pdC9rMS5jIHwgMTIgKysrKysrKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3BsYXRmb3JtL2dl
bmVyaWMvc3BhY2VtaXQvazEuYyBiL3BsYXRmb3JtL2dlbmVyaWMvc3BhY2VtaXQvazEuYwo+IGlu
ZGV4IDdlZTVmMTdhLi41ZTY5OWY4ZSAxMDA2NDQKPiAtLS0gYS9wbGF0Zm9ybS9nZW5lcmljL3Nw
YWNlbWl0L2sxLmMKPiArKysgYi9wbGF0Zm9ybS9nZW5lcmljL3NwYWNlbWl0L2sxLmMKPiBAQCAt
OCw2ICs4LDcgQEAKPiAgICovCj4KPiAgI2luY2x1ZGUgPHBsYXRmb3JtX292ZXJyaWRlLmg+Cj4g
KyNpbmNsdWRlIDxzYmkvcmlzY3ZfYXNtLmg+Cj4gICNpbmNsdWRlIDxzYmkvcmlzY3ZfaW8uaD4K
PiAgI2luY2x1ZGUgPHNiaS9zYmlfaHNtLmg+Cj4gICNpbmNsdWRlIDxzcGFjZW1pdC9rMS5oPgo+
IEBAIC04NiwxNiArODcsMjMgQEAgc3RhdGljIGludCBzcGFjZW1pdF9rMV9lYXJseV9pbml0KGJv
b2wgY29sZF9ib290KQo+ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+IC1zdGF0aWMgYm9vbCBz
cGFjZW1pdF9jb2xkX2Jvb3RfYWxsb3dlZCh1MzIgaGFydGlkKQo+ICtzdGF0aWMgaW50IHNwYWNl
bWl0X2sxX25hc2NlbnRfaW5pdCh2b2lkKQo+ICB7Cj4gLSAgICAgICBjc3Jfc2V0KENTUl9NTDJT
RVRVUCwgMSA8PCAoaGFydGlkICUgUExBVEZPUk1fTUFYX0NQVVNfUEVSX0NMVVNURVIpKTsKPiAr
ICAgICAgIGNzcl9zZXQoQ1NSX01MMlNFVFVQLAo+ICsgICAgICAgICAgICAgICBCSVQoY3VycmVu
dF9oYXJ0aWQoKSAlIFBMQVRGT1JNX01BWF9DUFVTX1BFUl9DTFVTVEVSKSk7Cj4gKwo+ICsgICAg
ICAgcmV0dXJuIGdlbmVyaWNfbmFzY2VudF9pbml0KCk7Cj4gK30KPgo+ICtzdGF0aWMgYm9vbCBz
cGFjZW1pdF9jb2xkX2Jvb3RfYWxsb3dlZCh1MzIgaGFydGlkKQo+ICt7Cj4gICAgICAgICByZXR1
cm4gIWhhcnRpZDsKPiAgfQo+Cj4gIHN0YXRpYyBpbnQgc3BhY2VtaXRfazFfcGxhdGZvcm1faW5p
dChjb25zdCB2b2lkICpmZHQsIGludCBub2Rlb2ZmLAo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgZmR0X21hdGNoICptYXRjaCkKPiAgewo+ICsgICAg
ICAgZ2VuZXJpY19wbGF0Zm9ybV9vcHMubmFzY2VudF9pbml0ID0gc3BhY2VtaXRfazFfbmFzY2Vu
dF9pbml0Owo+ICAgICAgICAgZ2VuZXJpY19wbGF0Zm9ybV9vcHMuZWFybHlfaW5pdCA9IHNwYWNl
bWl0X2sxX2Vhcmx5X2luaXQ7Cj4gICAgICAgICBnZW5lcmljX3BsYXRmb3JtX29wcy5jb2xkX2Jv
b3RfYWxsb3dlZCA9IHNwYWNlbWl0X2NvbGRfYm9vdF9hbGxvd2VkOwo+Cj4KPiAtLQo+IDIuNTUu
MAo+CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
