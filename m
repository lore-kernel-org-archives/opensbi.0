Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40792606A31B
	for <opensbi@archiver.kernel.org>; Mon, 26 Oct 2026 05:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zdgZJ4i7;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=OfLmUlbH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PyIXIM+115QDFa/crZSmwSCbNEeqSZn6yR4Su6LZGxs=; b=zdgZJ4i7icxoAmwoM+thLuDTmA
	OHZ7hjJHHQANa2dSVwYSI4aw3ff7KlA5CYufeRzxfTmh17qJ3eJaQzx1EFsXsEI5WmGBqPvAgd8Xx
	PqzKw2IdKxjfKHCdQZtOQX9/yFp8dHCQry19ageEgtjTJiz5R0mdM4AekW6PAgzmgXqcSt53LIdXv
	z3zwifJtu9q6E2DJJuRABJhjMMIAEr8VpoojkPl7lwqb+pMbei3F2YmAiDneHXclwghfk46froytB
	ojpLcTEc6r7yLNBaqlMPMT5QdNEwXIa2iVHWLT8JuRhtKQrdVIldNPtM8nXKMol6euAWC/r7b9tEZ
	m4LFbnfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLCtz-00000001j6A-0CqP;
	Mon, 26 Oct 2026 05:05:43 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLCtw-00000001j5p-2DA2
	for opensbi@lists.infradead.org;
	Mon, 26 Oct 2026 05:05:41 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48e0d885929so1603489f8f.3
        for <opensbi@lists.infradead.org>; Sun, 25 Oct 2026 22:05:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792991138; cv=none;
        d=google.com; s=arc-20260327;
        b=k/QH1Po3JG0GEBgo8HmNXwCFBbqXN01hNzxKLkiNTZkAkSpkhXH9gZxIqskQpPQQKW
         1OyUGdj92Vz7UXmmh/zDwqx4vvWq8uX0k7n0t2mJoHeecGeiJDicBAM2KFGCR0nU4sfo
         U0DLCLUoJJVLTCB8Fsh3TGpO6i54oagvgW0OPXZbikwiirNnLvPojySBcHkiq9tXiiVH
         jhw5nwXSbD7lD3Li1yAnB6edagyuGWqMmZH8hTkzVH9K7iYpkPkwN9ynCVADZzRCjqVP
         1gClDv/09FMaDM6ukr6C+rp13IilUDTbkOqjmBWi0oOkKA6x6lTiFOuBG3YeStfdMvvn
         ParQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T6uASs8KOZOUvQVoxAxbtzSTEFk6rjhcAoZA64ZxUiE=;
        fh=Dh6aZinx23Z80DMo/g7Tzp0Oq2qhcklt202M/UMjetY=;
        b=pMfmezZLeIWNEbgBNhLL3ArjO3wzr6yANtfoQf62fBtgWWzHhrJsgATpC9S9D24GrQ
         sPnFmmWi+u2P2eb2h1V4POcw/2iesfHNn9g23HDUnI1J+rIt8Zy3iEnpu8tYA6CTS1ba
         huEZI/1onb/2cIB4YeDBCae7lMl27fkxhyfhrbuK+CkyZDSyO3sMrKlc6V2cUKuCT1Tt
         zkt11WPG3rw+S9bv1zHFpiAuIFuj4wQUGDYyPfEMYUFTzFutADquWZihQG74Jg43+Ofm
         zTKQEjpgjzeJP88d5iOgitXZG0jhyzMs3rzH4tvazEZOkXM8FVfk1d2RSVybZn0SlIVw
         76ag==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792991138; x=1793595938; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T6uASs8KOZOUvQVoxAxbtzSTEFk6rjhcAoZA64ZxUiE=;
        b=OfLmUlbHKLHVHnAwCbkNzjTfsbCSGpSc0y12y1JoBueoHIpjVVxbYFIWgcz6eIajRp
         kYNrjAHcQp1dqzoSUtc/8o+RWiXBxSAcPeGthUzAaN9zwYcc9keP18iX0OkRjDHi8tXn
         c0G0nvtTR75h3eSOVwvzFPmKFSU6gjoPFmsIm2mRzOwuUfbREGc62qmfiP3eXGV6Qo3v
         Run7D6WP2YltuptAnRvK3jDeml1t4PvB4SW0YH/sFFBiWLvICdVd9KbuFRcYrUhS7NVo
         lmq7wgCcCU8u+nGl6O5zbz5bOLXECoZkwLXs8MPDKfZBGY05DYcNRHUiYxRVVmi7Ghyg
         3ing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792991138; x=1793595938;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T6uASs8KOZOUvQVoxAxbtzSTEFk6rjhcAoZA64ZxUiE=;
        b=TxkGIFSL2FUzvdO9tGS46jA5WO7rDqe9R0NWjfCI/kzIBjGy7hKOKycjy+UY4QCzgR
         PHYjMgefAo2cPujfBpJJ6K9F4Edj95UvcInPZfadhZa021fC0mgb1XNoIihKDqGS3IXS
         XV7NF4d9tXqMUvf5CJwhASPxViBSpzJaQCSsr+5RcRyw0g4t4whAFRyJPvyNiUmE9/Oz
         QWrrDoO2YOUm/kuhYEsdDDKJhhEUmyVnrDTXutyHsCHC9VsmqNCL2k8uZryhrP5MNno0
         CgT2j7kPge3O5pF6NSEnQ9/v7IXevPMa/U5yAVKqtqYTpfAtoEXF2zwBKwzlleX1pjTF
         0BVg==
X-Gm-Message-State: AFq9FYJtMnd52/fyLsLBPfjjtWRnIt1rGGtCSDCkN3fawjoZCf0q3bRo
	hXMrv9hRi5jMWmb8gGFIJpUx9lacRotPc11irOe64wrtiH9CdXwHgguEpOQees07esuhNck8QLU
	EuGQ4i49gDBXq6Qsq3BD3lzlLW0sPpuyThbmu5c2VSA==
X-Gm-Gg: AYBFou3ZSVpEOI56Fjq8zEoL3f3+ufobeezKsMACdW3yqEhQSvWY7Vbc4ZlFcgzM8ke
	hiRZeJcUO1xaw5K6DGBZjvpC/jcYJGs7toANDrEZjLZNWTBlk2Gd+2NAgPM7jW/EN9Ro2/tugDR
	48N7NF1ko5D98sE1r6JdCkV2OSWx3yMSo2ZrCWOwEeYIrcpuBuFqWIa4NyU/RkloV8vP52clqKg
	5WR6caq5pSFN/rq5iyU2ah8cqvlONgoIG6rCh2+sPN0IJBn0iyq/EkBkaVrvIonu8fhLDl98rbt
	DHCGXmZk4xg8oQklBgXT/YPDUAB7GgHrjpaLJ695WauBPdIpWSko/9gVXm/eemS4ciHqUVmMVkg
	pz8nFahK8tmpK0U8kXFHtLp7+cU6DVENxyfsJ4C2CxMvUblkR/biLFOaS1bIV//Jjd+PstL+dtc
	FH0oarkB9F65arSWqRqHsiN5cRoQMFH8c2xLioo2+LSvL8nzUElBXUxvUiJw==
X-Received: by 2002:a05:6000:400d:b0:48d:ff06:c626 with SMTP id
 ffacd0b85a97d-48e3eba82c9mr8768315f8f.35.1792991138534; Sun, 25 Oct 2026
 22:05:38 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260910052629.3359493-1-liutong@iscas.ac.cn> <20260910052629.3359493-4-liutong@iscas.ac.cn>
In-Reply-To: <20260910052629.3359493-4-liutong@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 26 Oct 2026 10:35:26 +0530
X-Gm-Features: AclHuK8mYI7hrl-O0R9Ra0ah8WktSOjiIVv4E_x1n9ZOx_FubS2cSLNZb0qqJuI
Message-ID: <CAAhSdy2nDjHbvXpcez7ZAakS77XoZzQS73wYjFfbYuxoSHDD4A@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] lib: sbi_pmu: unmap shared memory on the reserved
 event_idx path
To: liutong <liutong@iscas.ac.cn>
Cc: opensbi@lists.infradead.org, himanshu.chauhan@oss.qualcomm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_220540_605165_B446C714 
X-CRM114-Status: GOOD (  21.12  )
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBTZXAgMTAsIDIwMjYgYXQgMTA6NTfigK9BTSBsaXV0b25nIDxsaXV0b25nQGlzY2Fz
LmFjLmNuPiB3cm90ZToKPgo+IHNiaV9wbXVfZXZlbnRfZ2V0X2luZm8oKSBtYXBzIHRoZSBTLW1v
ZGUgc2hhcmVkIG1lbW9yeSBpbnRvIE0tbW9kZQo+IGJlZm9yZSB3YWxraW5nIHRoZSBldmVudCBh
cnJheSBhbmQgdW5tYXBzIGl0IHdoZW4gdGhlIHdhbGsgaXMgZG9uZS4KPiBUaGUgcmVzZXJ2ZWQt
Yml0IGNoZWNrIGluc2lkZSB0aGUgbG9vcCByZXR1cm5zIGRpcmVjdGx5IGFuZCBza2lwcyB0aGUK
PiB1bm1hcCwgc28gYSByZXF1ZXN0IHdpdGggYSBtdXN0LWJlLXplcm8gYml0IHNldCBpbiBldmVu
dF9pZHggbGVhdmVzIHRoZQo+IG1hcHBpbmcgaW4gcGxhY2UgYWZ0ZXIgdGhlIGVjYWxsIHJldHVy
bnMuCj4KPiBVbm1hcCBiZWZvcmUgcmV0dXJuaW5nLCBhcyB0aGUgb3RoZXIgZXJyb3IgcGF0aHMg
aW4gdGhpcyBmdW5jdGlvbiBkby4KPgo+IEZpeGVzOiBkOTdjZmIzM2FlMWEgKCJsaWI6IHNiaV9w
bXU6IFJldHVybiBpbnZhbGlkIHBhcmFtIGVycm9yIGZvciByZXNlcnZlZCBldmVudF9pZHggYml0
cyIpCj4gU2lnbmVkLW9mZi1ieTogbGl1dG9uZyA8bGl1dG9uZ0Bpc2Nhcy5hYy5jbj4KCkFub3Ro
ZXIgcGF0Y2ggZG9pbmcgYSBzaW1pbGFyIHBhdGNoIGlzIGFscmVhZHkgbWVyZ2VkIGhlbmNlCmln
bm9yaW5nIHRoaXMgcGF0Y2guCgpJbiB0aGUgZnV0dXJlLCBwbGVhc2Ugd2F0Y2ggZm9yIGR1cGxp
Y2F0ZSBjaGFuZ2VzIGFuZCBjb21tZW50CnNvb25lci4KClJlZ2FyZHMsCkFudXAKCj4gLS0tCj4g
TmV3IGluIHYzLCBub3QgcGFydCBvZiB0aGUgdjIgc2VyaWVzLgo+Cj4gTm90aWNlZCB3aGlsZSBy
ZWJhc2luZyB0aGUgcGF0Y2ggYmVmb3JlIHRoaXMgb25lIG9udG8gdGhlIGN1cnJlbnQgZXJyb3IK
PiBjb2RlIGhhbmRsaW5nIGluIHRoaXMgZnVuY3Rpb24uCj4KPiAgbGliL3NiaS9zYmlfcG11LmMg
fCA1ICsrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKPgo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9wbXUuYyBiL2xpYi9zYmkvc2JpX3BtdS5j
Cj4gaW5kZXggNTRkYTVjMjQuLmQ4ZTVlYTAxIDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkvc2JpX3Bt
dS5jCj4gKysrIGIvbGliL3NiaS9zYmlfcG11LmMKPiBAQCAtMTEyMCw4ICsxMTIwLDExIEBAIGlu
dCBzYmlfcG11X2V2ZW50X2dldF9pbmZvKHVuc2lnbmVkIGxvbmcgc2htZW1fcGh5c19sbywgdW5z
aWduZWQgbG9uZyBzaG1lbV9waHlzCj4gICAgICAgICBmb3IgKGkgPSAwOyBpIDwgbnVtX2V2ZW50
czsgaSsrKSB7Cj4gICAgICAgICAgICAgICAgIGV2ZW50X2lkeCA9IGVpbmZvW2ldLmV2ZW50X2lk
eDsKPiAgICAgICAgICAgICAgICAgLyogQW55IG11c3QtYmUtemVybyBldmVudF9pZHggYml0cyBz
ZXQgc2hvdWxkIHJldHVybiBJTlZBTElEX1BBUkFNIHBlci1zcGVjICovCj4gLSAgICAgICAgICAg
ICAgIGlmIChldmVudF9pZHggJiBTQklfUE1VX0VWRU5UX0lEWF9NQlpfTUFTSykKPiArICAgICAg
ICAgICAgICAgaWYgKGV2ZW50X2lkeCAmIFNCSV9QTVVfRVZFTlRfSURYX01CWl9NQVNLKSB7Cj4g
KyAgICAgICAgICAgICAgICAgICAgICAgc2JpX2hhcnRfcHJvdGVjdGlvbl90ZW1wX3VubWFwX3Jh
bmdlKHNobWVtX3BoeXNfbG8sCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHNobWVtX3NpemUpOwo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIHJldHVybiBTQklfRVJSX0lOVkFMSURfUEFSQU07Cj4gKyAgICAgICAgICAgICAgIH0K
PiAgICAgICAgICAgICAgICAgZXZlbnRfdHlwZSA9IHBtdV9ldmVudF92YWxpZGF0ZShwaHMsIGV2
ZW50X2lkeCwgZWluZm9baV0uZXZlbnRfZGF0YSk7Cj4gICAgICAgICAgICAgICAgIGlmIChldmVu
dF90eXBlIDwgMCkgewo+ICAgICAgICAgICAgICAgICAgICAgICAgIGVpbmZvW2ldLm91dHB1dCA9
IDA7Cj4gLS0KPiAyLjM0LjEKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5z
YmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL29wZW5zYmkK
