Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C6B606A31A
	for <opensbi@archiver.kernel.org>; Sat, 31 Oct 2026 12:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F3C7HmqR;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=f68DNKfn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6Nuivq8NFuCRrOGC7aUiIx85QHvdwMV0hfi5Gm5FLQ8=; b=F3C7HmqRVUD9a7Vaglp1OYGFBG
	mB7YD5kucvUP19+lyzMexQbeNGGW5tHS9gNo3qCv9t8v0R+vq4XFlSxG7VavQxSjAs/xBLvevy6TS
	5a4BM+sHAGrj8Sxf0qDLk/61yziZq1l4y8QtknHlgAViGwxEL8LA4+hYyuj/4XwzWCvG264zRFR0j
	LM9HhIWdlP0R9IdrkqHmAvPbgY7xr/PUzo76Uj5taibAR5G6Ul+2dt/01DqaSpU3UAgedxjL6LWuC
	wzHGQcrut6KWdSa5ZMK5s2divls/MQLv39iPKjhLoqeFNYrh03s+bIXVyXBFRrLDMiZjwY2odPjzn
	aXANd02g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN8WR-0000000DL1b-461w;
	Sat, 31 Oct 2026 12:49:23 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN8WO-0000000DKzY-1Zc0
	for opensbi@lists.infradead.org;
	Sat, 31 Oct 2026 12:49:22 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48e0d885929so1282840f8f.3
        for <opensbi@lists.infradead.org>; Sat, 31 Oct 2026 05:49:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793450958; cv=none;
        d=google.com; s=arc-20260327;
        b=S9k0Oyb9MUfELcoRcR87iHQC198dNneyNESMynrXRaVd74dl2wjXLEep5iEzcvkuE1
         wg2FunkH0e1ogIEzQiscKoRMrTgzO6HZKnTLxvYUpoBKkj3yLl/sVH04EAi3hw0b7lXx
         vR0oCvu1ZmNm63XAqhVwsTGjPPY7V7v3Z8g5tYFeUWVNLC98avaAliYraZCPx3UkYc9T
         fSVIyWqOZVJqcR/RTlWvJ6J0hxfQXXuMRNR2GRadNFqK8QueW8ZbmY4YmgZ1+3GsAeEk
         6swCXuwlQKB2OxkyLEmmOnQsRCZM5xOMRo17mJZHWCWPoPfdikk37aYMnRwKNginzX3w
         QWdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RTRZrzgoDpWFUyYoJ1g5xn72h+qayqo2aOvofSB/T00=;
        fh=s0V2QxfkZ31uI08A+gYD94xQ3QEn9NHnxJRAVF9iZzc=;
        b=TocFsOJazYRaZTBtsPx/jXPzONOnbiL2OJDp8MDO4MK1Ar6W65ii+O2dwS8SnCfzKy
         LQ7ueXQXOwvn8pyGcbBj8MPXuZAG9blxUMdL6DwngEjFqPKvf8bTL1YJElx0eKSkKPzR
         MmGxPIWOxrCEJKpy392y75YbVgrl2/EBtSF/3vDM6jkT2pEArcFrbjez92RERpv0rLR2
         tkWG9cluawrn4Obp0kqQESPGH/GZkGsa/fTC++BqEBO1+SJ0R80BRE6Sr07Joynz5ea5
         RvPWUuYGU3885HIA7FlVjg5+8tmPS5gIB41nhn2bZAl8rRV+0j/n+TCCe4dx2QYjg0Xp
         sjYw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793450958; x=1794055758; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RTRZrzgoDpWFUyYoJ1g5xn72h+qayqo2aOvofSB/T00=;
        b=f68DNKfnsJfd4blaYZ1rzMwLraBU9N+uZgBU/AiRlrCKXGIe/o9Zl/LbGVZq2GctU7
         30N/H6TtFXuMbj/flZLctm9zGqBoFdm2gG18XBglzBbxAFpSdIPyYkODhyhPolOxtaPi
         21vDX0UVYAFn2SipXqJVweay4CroTzuCwafc62YH0jU42ThcXDUZimK6gSjuIZWI42eo
         cQdyXkHp+iLdp0kghKzzsjCCNSv3SKAuy66DCuglF2oybYuMpjHzsnVmixiYYcZzgQWG
         Xko+CIp1Ejpync8/G42VHweRZSZq/1SVtyPlr3W/ADL2zob9xjGH2pch415zJ5ANPg7O
         Tf7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793450958; x=1794055758;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RTRZrzgoDpWFUyYoJ1g5xn72h+qayqo2aOvofSB/T00=;
        b=lDQc61WP4KZU0rQYh7JaMTapHgv5nx1G1LgB2kY0EoHrpUTeXl9c5+GDzfeGlv6rqM
         nrktP5r2JoKnHvtP32qxbSoUpm2mpnRIQt2o6Ad0g60dnEiAe+Nh4HZW1gOmIysKVqm1
         +uIbapUK2ppBqlkGRy4Hnhq3pCwOZCGKGgI7P6XKkuSh/ZQ4Yl8Fm68hOGN4LhxbsQc8
         izbOnNrVqmD0RleuEkX+CwJCfsv7ScsSDwxwC90X+KHDOXTTEemGNaFAvUdyHxSbz0t4
         c+C0rVDyAI+kN6KPzlCtZV+hlyXfm+OJH6fWa/hIkNeRMz2+LXqgk+a5mewDQzEfIpYn
         mJ9Q==
X-Gm-Message-State: AFq9FYL3d1hr+aLtEe+Y7YYWJN7bkIMYA3KV8wZb+G7zGnk9GWwmKd/n
	EOxCS7WUOI0nxMdtd/7R+rXAfHKVKT5a2Q2tyepjRgBrX4YJu0s1y7TRstYJvXBKt2if7zaKLNl
	dLXycQzaGRfLr1Ztv/9K9fGj+YXQWfQltRLnmCAmjwssWgds9Jrtl
X-Gm-Gg: AYBFou3rcE4XGtUtGn0pijZiVA56zgckOcn+WaPYSOSWoxIiwccxXr7SNOj7zIVCyhX
	OPWqcgsskrbvhGsBnl73WHdLGd009bdOt0hede8/YYHRD4/XTE65+4br3jlNfB01bSwZmJThebi
	Jf8SNQE9tvls+64GFDWqwG7z1n6M6YcaJOA/WjYlN5+xlaSGcbPBxax5+JODF2cWFBobQh1DUNy
	+IzeWYxevS/TZ4uaMuUv2rW2egRuIk9mem4U/I++dHN0mojFJugPN5YDhwOqVt9imV4crnzlRdA
	96j6pw6z4fQMdUIjnsmrIgMg/HJja6ttV9yVPBP/7j21Ijlt5p0vzULGjAJU1jIG4MV0Rmu5YMR
	gC14LZJz5HvnlwYo8jonZwKKVpq5a8H4CG3iQxITYIUKGZFg8eyQTTCEYWntOjdzDpQwAg3Y59C
	cAsDM/fnYK1D9cOD9BccyaCYAxS7K5jP8iYR6jWt2neZalS7yV+1ULqfBm
X-Received: by 2002:a05:6000:2610:b0:48e:4561:8a17 with SMTP id
 ffacd0b85a97d-48e6e303ea6mr10386907f8f.16.1793450958408; Sat, 31 Oct 2026
 05:49:18 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030104518.3297875-1-peter.lin@sifive.com> <20261030104518.3297875-10-peter.lin@sifive.com>
In-Reply-To: <20261030104518.3297875-10-peter.lin@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 31 Oct 2026 18:19:05 +0530
X-Gm-Features: AclHuK9f2VBevYe4BlZkLU3IfMkFHHRt-qCKjqEwrE4nx2FGjtYK2helluTanio
Message-ID: <CAAhSdy2td+EUjcxPJTHvg+xHify8hv7ERtbiFzb=-GbbrbAsGQ@mail.gmail.com>
Subject: Re: [PATCH v4 9/9] docs: document WID DT properties
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, pawandeep.oza@oss.qualcomm.com, 
	rkrcmar@qti.qualcomm.com, raymond.mao@riscstar.com, robin.randhawa@sifive.com, 
	samuel.holland@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_054920_850185_DF344840 
X-CRM114-Status: GOOD (  22.53  )
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

T24gRnJpLCBPY3QgMzAsIDIwMjYgYXQgNDoxNeKAr1BNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gQWRkICJ3aWQiIGFuZCAid2lkZGVsZWciIHBy
b3BlcnRpZXMgdG8gZG9tYWluIGluc3RhbmNlIG5vZGUKPiBkb2N1bWVudGF0aW9uIGFuZCBleGFt
cGxlIERULiBBZGQgYSAiUm9vdCBEb21haW4gTm9kZSIgc2VjdGlvbgo+IGRlc2NyaWJpbmcgdGhl
ICJyb290IiBzdWJub2RlIHVuZGVyIHRoZSBkb21haW4gY29uZmlndXJhdGlvbgo+IG5vZGUgZm9y
IHJvb3QgZG9tYWluIFdJRCBjb25maWd1cmF0aW9uCj4KPiBTaWduZWQtb2ZmLWJ5OiBZdS1DaGll
biBQZXRlciBMaW4gPHBldGVyLmxpbkBzaWZpdmUuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBB
bnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKVGhhbmtzLApBbnVwCgoKPiAtLS0KPiBD
aGFuZ2UgdjMtPnY0Ogo+IC0gTWFrZSBjb21wYXRpYmxlIHN0cmluZyBtYW5kYXRvcnkgZm9yIHJv
b3Qgbm9kZQo+IC0gRHJvcCBSQi10YWcgZnJvbSBPemEKPiAtLS0KPiAgZG9jcy9kb21haW5fc3Vw
cG9ydC5tZCB8IDM4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZG9jcy9kb21h
aW5fc3VwcG9ydC5tZCBiL2RvY3MvZG9tYWluX3N1cHBvcnQubWQKPiBpbmRleCA1MTczNzIxOC4u
ZWQ2MmE2Y2QgMTAwNjQ0Cj4gLS0tIGEvZG9jcy9kb21haW5fc3VwcG9ydC5tZAo+ICsrKyBiL2Rv
Y3MvZG9tYWluX3N1cHBvcnQubWQKPiBAQCAtNTYsNiArNTYsOCBAQCBoYXMgZm9sbG93aW5nIGRl
dGFpbHM6Cj4gICAgZG9tYWluLiBUaGlzIGNhbiBiZSBlaXRoZXIgUy1tb2RlIG9yIFUtbW9kZS4K
PiAgKiAqKnN5c3RlbV9yZXNldF9hbGxvd2VkKiogLSBJcyBkb21haW4gYWxsb3dlZCB0byByZXNl
dCB0aGUgc3lzdGVtPwo+ICAqICoqc3lzdGVtX3N1c3BlbmRfYWxsb3dlZCoqIC0gSXMgZG9tYWlu
IGFsbG93ZWQgdG8gc3VzcGVuZCB0aGUgc3lzdGVtPwo+ICsqICoqd2lkKiogLSBXb3JsZCBJRCBm
b3IgdGhlIGRvbWFpbgo+ICsqICoqd2lkZGVsZWcqKiAtIFdvcmxkIElEIGRlbGVnYXRpb24gYml0
bWFzayBmb3IgdGhlIGRvbWFpbgo+Cj4gIFRoZSBtZW1vcnkgcmVnaW9ucyByZXByZXNlbnRlZCBi
eSAqKnJlZ2lvbnMqKiBpbiAqKnN0cnVjdCBzYmlfZG9tYWluKiogaGF2ZQo+ICBmb2xsb3dpbmcg
YWRkaXRpb25hbCBjb25zdHJhaW50cyB0byBhbGlnbiB3aXRoIFJJU0MtViBQTVAgcmVxdWlyZW1l
bnRzOgo+IEBAIC05OCw2ICsxMDAsOCBAQCBmb2xsb3dpbmcgbWFubmVyOgo+ICAgIGlzIHRoZSBu
ZXh0IG1vZGUgZm9yIHRoZSBST09UIGRvbWFpbgo+ICAqICoqc3lzdGVtX3Jlc2V0X2FsbG93ZWQq
KiAtIFRoZSBST09UIGRvbWFpbiBpcyBhbGxvd2VkIHRvIHJlc2V0IHRoZSBzeXN0ZW0KPiAgKiAq
KnN5c3RlbV9zdXNwZW5kX2FsbG93ZWQqKiAtIFRoZSBST09UIGRvbWFpbiBpcyBhbGxvd2VkIHRv
IHN1c3BlbmQgdGhlIHN5c3RlbQo+ICsqICoqd2lkKiogLSBDb25maWd1cmFibGUgV29ybGQgSUQg
Zm9yIHRoZSBST09UIGRvbWFpbgo+ICsqICoqd2lkZGVsZWcqKiAtIENvbmZpZ3VyYWJsZSBXb3Js
ZCBJRCBkZWxlZ2F0aW9uIGJpdG1hc2sgZm9yIHRoZSBST09UIGRvbWFpbgo+Cj4gIERvbWFpbiBF
ZmZlY3RzCj4gIC0tLS0tLS0tLS0tLS0tCj4gQEAgLTEzMSw2ICsxMzUsMjMgQEAgVGhlIERUIHBy
b3BlcnRpZXMgb2YgYSBkb21haW4gY29uZmlndXJhdGlvbiBEVCBub2RlIGFyZSBhcyBmb2xsb3dz
Ogo+ICAqICoqY29tcGF0aWJsZSoqIChNYW5kYXRvcnkpIC0gVGhlIGNvbXBhdGlibGUgc3RyaW5n
IG9mIHRoZSBkb21haW4KPiAgICBjb25maWd1cmF0aW9uLiBUaGlzIERUIHByb3BlcnR5IHNob3Vs
ZCBoYXZlIHZhbHVlICoib3BlbnNiaSxkb21haW4sY29uZmlnIioKPgo+ICsjIyMgUm9vdCBEb21h
aW4gTm9kZQo+ICsKPiArVGhlIHJvb3QgZG9tYWluIFdJRCBjb25maWd1cmF0aW9uIGlzIGRlc2Ny
aWJlZCBpbiBhICoqcm9vdCoqIHN1Ym5vZGUgdW5kZXIKPiArdGhlIGRvbWFpbiBjb25maWd1cmF0
aW9uIERUIG5vZGUuCj4gKwo+ICtUaGUgRFQgcHJvcGVydGllcyBvZiB0aGUgcm9vdCBkb21haW4g
bm9kZSBhcmUgYXMgZm9sbG93czoKPiArCj4gKyogKipjb21wYXRpYmxlKiogKE1hbmRhdG9yeSkg
LSBUaGUgY29tcGF0aWJsZSBzdHJpbmcgb2YgdGhlIHJvb3QgZG9tYWluIG5vZGUuCj4gKyAgVGhp
cyBEVCBwcm9wZXJ0eSBzaG91bGQgaGF2ZSB2YWx1ZSAqIm9wZW5zYmksZG9tYWluLGluc3RhbmNl
IiouCj4gKyogKip3aWQqKiAoTWFuZGF0b3J5IGlmIFNtbHdpZCBpcyBwcmVzZW50KSAtIFRoZSAz
Mi1iaXQgV29ybGQgSUQgZm9yCj4gKyAgbG93ZXItcHJpdmlsZWdlIG1vZGVzIChTL1UtbW9kZSkg
Zm9yIHRoZSBST09UIGRvbWFpbi4gSWYgdGhlIGhhcnQKPiArICBzdXBwb3J0cyB0aGUgU21sd2lk
IGV4dGVuc2lvbiwgdGhpcyBwcm9wZXJ0eSBtdXN0IGJlIHByb3ZpZGVkLgo+ICsqICoqd2lkZGVs
ZWcqKiAoT3B0aW9uYWwpIC0gVGhlIDY0IGJpdCBXb3JsZCBJRCBkZWxlZ2F0aW9uIGJpdG1hc2sg
Zm9yCj4gKyAgdGhlIFJPT1QgZG9tYWluLiBJZiBwcmVzZW50LCBPcGVuU0JJIHdyaXRlcyB0aGlz
IHZhbHVlIHRvICoqbXdpZGRlbGVnKioKPiArICB3aGVuIGVudGVyaW5nIHRoZSBST09UIGRvbWFp
biAocmVxdWlyZXMgU213aWRkZWxlZyBleHRlbnNpb24pLiBJZiBhYnNlbnQsCj4gKyAgY2xlYXJz
ICoqbXdpZGRlbGVnKiogdG8gZGlzYWJsZSBTLW1vZGUgV0lEIGRlbGVnYXRpb24uCj4gKwo+ICAj
IyMgRG9tYWluIE1lbW9yeSBSZWdpb24gTm9kZQo+Cj4gIFRoZSBkb21haW4gbWVtb3J5IHJlZ2lv
biBEVCBub2RlIGRlc2NyaWJlcyBkZXRhaWxzIG9mIGEgbWVtb3J5IHJlZ2lvbiBhbmQKPiBAQCAt
MjA1LDYgKzIyNiwxMyBAQCBUaGUgRFQgcHJvcGVydGllcyBvZiBhIGRvbWFpbiBpbnN0YW5jZSBE
VCBub2RlIGFyZSBhcyBmb2xsb3dzOgo+ICAgIHdoZXRoZXIgdGhlIGRvbWFpbiBpbnN0YW5jZSBp
cyBhbGxvd2VkIHRvIGRvIHN5c3RlbSByZXNldC4KPiAgKiAqKnN5c3RlbS1zdXNwZW5kLWFsbG93
ZWQqKiAoT3B0aW9uYWwpIC0gQSBib29sZWFuIGZsYWcgcmVwcmVzZW50aW5nCj4gICAgd2hldGhl
ciB0aGUgZG9tYWluIGluc3RhbmNlIGlzIGFsbG93ZWQgdG8gZG8gc3lzdGVtIHN1c3BlbmQuCj4g
KyogKip3aWQqKiAoTWFuZGF0b3J5IGlmIFNtbHdpZCBpcyBwcmVzZW50KSAtIFRoZSAzMi1iaXQg
V29ybGQgSUQgZm9yCj4gKyAgbG93ZXItcHJpdmlsZWdlIG1vZGVzIChTL1UtbW9kZSkgZm9yIHRo
ZSBkb21haW4gaW5zdGFuY2UuIElmIHRoZSBoYXJ0Cj4gKyAgc3VwcG9ydHMgdGhlIFNtbHdpZCBl
eHRlbnNpb24sIHRoaXMgcHJvcGVydHkgbXVzdCBiZSBwcm92aWRlZC4KPiArKiAqKndpZGRlbGVn
KiogKE9wdGlvbmFsKSAtIFRoZSA2NCBiaXQgV29ybGQgSUQgZGVsZWdhdGlvbiBiaXRtYXNrIGZv
cgo+ICsgIHRoZSBkb21haW4gaW5zdGFuY2UuIElmIHByZXNlbnQsIE9wZW5TQkkgd3JpdGVzIHRo
aXMgdmFsdWUgdG8gKiptd2lkZGVsZWcqKgo+ICsgIG9uIGNvbnRleHQgc3dpdGNoIGludG8gdGhp
cyBkb21haW4gKHJlcXVpcmVzIFNtd2lkZGVsZWcgZXh0ZW5zaW9uKS4gSWYgYWJzZW50LAo+ICsg
IGNsZWFycyAqKm13aWRkZWxlZyoqIHRvIGRpc2FibGUgUy1tb2RlIFdJRCBkZWxlZ2F0aW9uLgo+
Cj4gICMjIyBBc3NpZ25pbmcgSEFSVCBUbyBEb21haW4gSW5zdGFuY2UKPgo+IEBAIC0yNjAsNiAr
Mjg4LDEyIEBAIGJlIGRvbmU6Cj4gICAgICAgICAgICAgICAgICBvcmRlciA9IDw2ND47Cj4gICAg
ICAgICAgICAgIH07Cj4KPiArICAgICAgICAgICAgcm9vdCB7Cj4gKyAgICAgICAgICAgICAgICBj
b21wYXRpYmxlID0gIm9wZW5zYmksZG9tYWluLGluc3RhbmNlIjsKPiArICAgICAgICAgICAgICAg
IHdpZCA9IDwzPjsKPiArICAgICAgICAgICAgICAgIHdpZGRlbGVnID0gPDB4MCAweDA+Owo+ICsg
ICAgICAgICAgICB9Owo+ICsKPiAgICAgICAgICAgICAgdGRvbWFpbjogdHJ1c3RlZC1kb21haW4g
ewo+ICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJvcGVuc2JpLGRvbWFpbixpbnN0YW5j
ZSI7Cj4gICAgICAgICAgICAgICAgICBwb3NzaWJsZS1oYXJ0cyA9IDwmY3B1MD47Cj4gQEAgLTI2
OCw2ICszMDIsOCBAQCBiZSBkb25lOgo+ICAgICAgICAgICAgICAgICAgbmV4dC1hcmcxID0gPDB4
MCAweDA+Owo+ICAgICAgICAgICAgICAgICAgbmV4dC1hZGRyID0gPDB4MCAweDgwMTAwMDAwPjsK
PiAgICAgICAgICAgICAgICAgIG5leHQtbW9kZSA9IDwweDA+Owo+ICsgICAgICAgICAgICAgICAg
d2lkID0gPDE+Owo+ICsgICAgICAgICAgICAgICAgd2lkZGVsZWcgPSA8MHgwIDB4Nj47Cj4gICAg
ICAgICAgICAgICAgICBzeXN0ZW0tcmVzZXQtYWxsb3dlZDsKPiAgICAgICAgICAgICAgICAgIHN5
c3RlbS1zdXNwZW5kLWFsbG93ZWQ7Cj4gICAgICAgICAgICAgIH07Cj4gQEAgLTI3Niw2ICszMTIs
OCBAQCBiZSBkb25lOgo+ICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJvcGVuc2JpLGRv
bWFpbixpbnN0YW5jZSI7Cj4gICAgICAgICAgICAgICAgICBwb3NzaWJsZS1oYXJ0cyA9IDwmY3B1
MSAmY3B1MiAmY3B1MyAmY3B1ND47Cj4gICAgICAgICAgICAgICAgICByZWdpb25zID0gPCZ0bWVt
IDB4MD4sIDwmdHVhcnQgMHgwPiwgPCZhbGxtZW0gMHgzZj47Cj4gKyAgICAgICAgICAgICAgICB3
aWQgPSA8MD47Cj4gKyAgICAgICAgICAgICAgICB3aWRkZWxlZyA9IDwweDAgMHgxPjsKPiAgICAg
ICAgICAgICAgfTsKPiAgICAgICAgICB9Owo+ICAgICAgfTsKPiAtLQo+IDIuNDMuNwo+CgotLSAK
b3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
