Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5442C98310
	for <opensbi@archiver.kernel.org>; Thu, 24 Sep 2026 08:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pX+3YiShsKgD4DWPnfFNqfT/6X/pwNfj26tZydnDE4E=; b=xinajQZfiCKjlj
	wHPAlIELiHwuJLnVc58ltTwQaJB4oqrJniPCpFX5eesywdpofo1ZoA8VXXnVkSgq4YzmyEEFp5rwK
	POhX+mNKzyZ8SJdfDe/dC9sOA1DPwpVLNGSlfsw4Z7IvkQi4+kT1Xtu+AMStbw0XU73hSA4riwomx
	0d/wjOhAQAdq2ZQd/HnznCtWYkZGNBd5qtnfAGG+LoJAKBB3C2Sw7Ob0ZpZ1oz8uRyPy6W83duZwt
	eHjx0Qw2HRX9gYyzDDJOn9Ef9WnIaTVPRHXRZYAWovQwrC/R9K0WRlJTFiLQ3+zklQj1d/sVNIqL0
	134qtp+aMzlCYtiQ2k4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ekj-0000000AQAN-3JM2;
	Thu, 24 Sep 2026 08:24:25 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ekh-0000000AQ9z-37OM
	for opensbi@lists.infradead.org;
	Thu, 24 Sep 2026 08:24:25 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2db1ca06a25so8580515ad.2
        for <opensbi@lists.infradead.org>; Thu, 24 Sep 2026 01:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1790238263; x=1790843063; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cxhj9KaEYC23NhudJzJuN48WonbgyoocrBLROtdOduY=;
        b=iVEe+MltwxLtP5T5WIK9WLz3dZI4aqlztOsTzfK5bTHThpu9JY16OsJL7PgjaT5yJB
         IlLBV5KreNZtOZaX7DYvxlCGt4f2E7UVWueAF6rIaGljhM+rao0xv6J9GldF3sVAhkR/
         7XKcdyfrswXjXTwoo7vfRUVh1tv3nrAJROeY55C7egv4TyUm4CunZHUR3/JSkzmx5yIP
         CgfXZwwydo0IOh0Rt6OfLqZN2+JkZkmwyj7rxORlFUh+loXUFVeSCfHp8O2RrY5ZNiPP
         GIhkF8K3sIHc4Xg374Izt3+APlHCa18t7AM2BvcmcYNWGSKuon10q47OKzbyyRxOaNPI
         I14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790238263; x=1790843063;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cxhj9KaEYC23NhudJzJuN48WonbgyoocrBLROtdOduY=;
        b=JVRplKNYSQm9NxSBbNYo4QZw8i6gNHIkrpEY8v2NFH3v1BPAjeNhLpKJ/isHIRFMfV
         WS/+kLUuTyAUZw6vgyAwWw5EDFZIL/4/9aAtIwJ2xLJfib+j22rgt335LFVONOa4i0f2
         JenxzJOc/Gz/byHxpFyJ344S0WBapT1iSRtZ68mGIN7cQbXsvHDrU2FOV1a8zDngVMd6
         5aFhyONFcVIBozAxNe/bXwOR8pXuPOqJR640aUIXy0A4fc2lOftYmHvVH0BehJaEA0re
         Va2IcmNQoqKie0MLg0BbfXCYaiBtlczk0RFLl7PpYV/Y/9i+/bMJ50yYlAmyv0rTXYoE
         91hA==
X-Gm-Message-State: AFuF++nxwVxrQ8SznW3/eH7zpa8aKNZdD6B7Ey2jAzndoAwvSlLse9Ys
	KXe+SEPTemBF9F+Qf+B+sUVdAqvyTQRBT+QlgvZ5Q5X2QoAiPHRO3DubNvEeVbK1Rm4=
X-Gm-Gg: AYBFou0RF1xF7Lbq3DqzsshGjnSltC8xBSj/JaaBZTrNo2Uqsa9zjXcXCBBT7lb/EAR
	Gckc2mWNJGBn/dcXCnBrLiH2pBLA50hiyVZQejBFB3zLN+MgUd39MCy3Uj2ywEWfTWtqOQPGlkm
	bv4UyFjxXFkyqa1oExT5ApLsCtz/utWG3f4O7x7OMqQvA8vVXZXV7tVIj8GAldaAt+nhhLdqJEt
	KlsKbDEFLcMVyMG3fpwTgLZSRUK5R8P0D5wK3QS7WtQynMKpGTpGbT64Ew+ZYa8BRnNsVtJt5pB
	FirjYPLHa6MYGXHAweFCEmyLiczXhNDMXcmt6T8CZSNJPhHHJnJf5qaqtdfTTxJX5JYQQ6oS2M2
	mjoFSGfybOS4ccUsKKZuoimFjqp8lx5G8Ljl2+mh1qsPPQuN5e7cADVBVFKQcbjkLSqeO2zZJqo
	SLxO6XVt4dnrltKRHyYXFU//YziD7W83VQCJTelDGbXOL5eCkgTci+PDiiNIJqrCV1hy+UIg==
X-Received: by 2002:a17:903:2f8c:b0:2dd:c053:e0f9 with SMTP id d9443c01a7336-2df7e43e249mr13591495ad.40.1790238262736;
        Thu, 24 Sep 2026 01:24:22 -0700 (PDT)
Received: from plin-1878 ([136.226.240.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a516d58sm23184395ad.11.2026.09.24.01.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 01:24:22 -0700 (PDT)
Date: Thu, 24 Sep 2026 16:24:16 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com,
	greentime.hu@sifive.com, anup@brainfault.org, scott@riscstar.com,
	conor@kernel.org, dave.patel@riscstar.com, raymond.mao@riscstar.com,
	robin.randhawa@sifive.com, samuel.holland@sifive.com,
	krzk@kernel.org
Subject: Re: [PATCH v2 5/9] lib: sbi_hart: add WID protection mechanism
Message-ID: <arTeMIyGMx4hXoOz@plin-1878>
References: <20260817090503.2104998-1-peter.lin@sifive.com>
 <20260817090503.2104998-6-peter.lin@sifive.com>
 <CAAVgOkKnxXEx9MY4eTtGwrT=iX-PdXNfK5Bq8hBxmD93Sh+ykw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAVgOkKnxXEx9MY4eTtGwrT=iX-PdXNfK5Bq8hBxmD93Sh+ykw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_012423_798768_AAFC1A77 
X-CRM114-Status: GOOD (  30.35  )
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

SGkgT3phLAoKT24gVGh1LCBTZXAgMDMsIDIwMjYgYXQgMDI6NTI6NTFQTSAtMDcwMCwgUGF3YW5k
ZWVwIE96YSB3cm90ZToKPiBPbiBNb24sIEF1ZyAxNywgMjAyNiBhdCAyOjA14oCvQU0gWXUtQ2hp
ZW4gUGV0ZXIgTGluIDxwZXRlci5saW5Ac2lmaXZlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gUmVnaXN0
ZXIgYSBXSUQtYmFzZWQgaGFydCBwcm90ZWN0aW9uIG1lY2hhbmlzbSB0aGF0Cj4gPiBjb25maWd1
cmVzIG1sd2lkIGFuZCBtd2lkZGVsZWcgQ1NScyBvbiBkb21haW4gZW50cnkuCj4gPiBUaGlzIGVu
YWJsZXMgdGhlIHByb3RlY3Rpb24gZnJhbWV3b3JrIHJlY29uZmlndXJlIFdJRAo+ID4gaXNvbGF0
aW9uIHdoZW5ldmVyIGRvbWFpbnMgYXJlIHN3aXRjaGVkLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6
IFl1LUNoaWVuIFBldGVyIExpbiA8cGV0ZXIubGluQHNpZml2ZS5jb20+Cj4gPiAtLS0KPiA+IENo
YW5nZXMgdjEgLT4gdjI6Cj4gPiAtIFZhbGlkYXRlIFdJRCBhZ2FpbnN0IHBtbHdpZGxpc3QgYmVm
b3JlIHdyaXRpbmcgbWx3aWQgQ1NSIChPemEpCj4gPiAtLS0KPiA+ICBpbmNsdWRlL3NiaS9zYmlf
aGFydF93b3JsZHMuaCB8IDI0ICsrKysrKysrKysrKwo+ID4gIGxpYi9zYmkvb2JqZWN0cy5tayAg
ICAgICAgICAgIHwgIDEgKwo+ID4gIGxpYi9zYmkvc2JpX2hhcnQuYyAgICAgICAgICAgIHwgIDUg
KysrCj4gPiAgbGliL3NiaS9zYmlfaGFydF93b3JsZHMuYyAgICAgfCA3MiArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwo+ID4gIDQgZmlsZXMgY2hhbmdlZCwgMTAyIGluc2VydGlv
bnMoKykKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9zYmkvc2JpX2hhcnRfd29ybGRz
LmgKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgbGliL3NiaS9zYmlfaGFydF93b3JsZHMuYwo+ID4K
PiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3NiaS9zYmlfaGFydF93b3JsZHMuaCBiL2luY2x1ZGUv
c2JpL3NiaV9oYXJ0X3dvcmxkcy5oCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXgg
MDAwMDAwMDAuLjJiYjM1YTdlCj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9pbmNsdWRlL3Ni
aS9zYmlfaGFydF93b3JsZHMuaAo+ID4gQEAgLTAsMCArMSwyNCBAQAo+ID4gKy8qCj4gPiArICog
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEJTRC0yLUNsYXVzZQo+ID4gKyAqCj4gPiArICogQ29w
eXJpZ2h0IChjKSAyMDI2IFNpRml2ZSBJbmMuCj4gPiArICovCj4gPiArCj4gPiArI2lmbmRlZiBf
X1NCSV9IQVJUX1dPUkxEU19IX18KPiA+ICsjZGVmaW5lIF9fU0JJX0hBUlRfV09STERTX0hfXwo+
ID4gKwo+ID4gK3N0cnVjdCBzYmlfc2NyYXRjaDsKPiA+ICsKPiA+ICsvKioKPiA+ICsgKiBJbml0
aWFsaXplIFdJRCBoYXJ0IHByb3RlY3Rpb24gZm9yIGN1cnJlbnQgSEFSVAo+ID4gKyAqCj4gPiAr
ICogUmVnaXN0ZXJzIHRoZSBXSUQgcHJvdGVjdGlvbiBtZWNoYW5pc20gaWYgU213aWQvU21sd2lk
Cj4gPiArICogZXh0ZW5zaW9ucyBhcmUgcHJlc2VudC4KPiA+ICsgKgo+ID4gKyAqIEBwYXJhbSBz
Y3JhdGNoIHBvaW50ZXIgdG8gc2NyYXRjaCBzcGFjZSBvZiBjdXJyZW50IEhBUlQKPiA+ICsgKgo+
ID4gKyAqIEByZXR1cm4gMCBvbiBzdWNjZXNzIGFuZCBuZWdhdGl2ZSBlcnJvciBjb2RlIG9uIGZh
aWx1cmUKPiA+ICsgKi8KPiA+ICtpbnQgc2JpX2hhcnRfd29ybGRzX2luaXQoc3RydWN0IHNiaV9z
Y3JhdGNoICpzY3JhdGNoKTsKPiA+ICsKPiA+ICsjZW5kaWYgLyogX19TQklfSEFSVF9XT1JMRFNf
SF9fICovCj4gPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9vYmplY3RzLm1rIGIvbGliL3NiaS9vYmpl
Y3RzLm1rCj4gPiBpbmRleCBjMjljODg4Zi4uYWMwMjZkZWMgMTAwNjQ0Cj4gPiAtLS0gYS9saWIv
c2JpL29iamVjdHMubWsKPiA+ICsrKyBiL2xpYi9zYmkvb2JqZWN0cy5tawo+ID4gQEAgLTc3LDYg
Kzc3LDcgQEAgbGlic2JpLW9ianMteSArPSBzYmlfZndmdC5vCj4gPiAgbGlic2JpLW9ianMteSAr
PSBzYmlfaGFydC5vCj4gPiAgbGlic2JpLW9ianMteSArPSBzYmlfaGFydF9wbXAubwo+ID4gIGxp
YnNiaS1vYmpzLXkgKz0gc2JpX2hhcnRfcHJvdGVjdGlvbi5vCj4gPiArbGlic2JpLW9ianMteSAr
PSBzYmlfaGFydF93b3JsZHMubwo+ID4gIGxpYnNiaS1vYmpzLXkgKz0gc2JpX2hlYXAubwo+ID4g
IGxpYnNiaS1vYmpzLXkgKz0gc2JpX21hdGgubwo+ID4gIGxpYnNiaS1vYmpzLXkgKz0gc2JpX2hm
ZW5jZS5vCj4gPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfaGFydC5jIGIvbGliL3NiaS9zYmlf
aGFydC5jCj4gPiBpbmRleCAyOTg1NmMwZi4uZTkyZjBhZjMgMTAwNjQ0Cj4gPiAtLS0gYS9saWIv
c2JpL3NiaV9oYXJ0LmMKPiA+ICsrKyBiL2xpYi9zYmkvc2JpX2hhcnQuYwo+ID4gQEAgLTE3LDYg
KzE3LDcgQEAKPiA+ICAjaW5jbHVkZSA8c2JpL3NiaV9lcnJvci5oPgo+ID4gICNpbmNsdWRlIDxz
Ymkvc2JpX2hhcnQuaD4KPiA+ICAjaW5jbHVkZSA8c2JpL3NiaV9oYXJ0X3BtcC5oPgo+ID4gKyNp
bmNsdWRlIDxzYmkvc2JpX2hhcnRfd29ybGRzLmg+Cj4gPiAgI2luY2x1ZGUgPHNiaS9zYmlfcGxh
dGZvcm0uaD4KPiA+ICAjaW5jbHVkZSA8c2JpL3NiaV9wbXUuaD4KPiA+ICAjaW5jbHVkZSA8c2Jp
L3NiaV9zdHJpbmcuaD4KPiA+IEBAIC03NjIsNiArNzYzLDEwIEBAIGludCBzYmlfaGFydF9pbml0
KHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCwgYm9vbCBjb2xkX2Jvb3QpCj4gPiAgICAgICAg
ICAgICAgICAgcmMgPSBzYmlfaGFydF9wbXBfaW5pdChzY3JhdGNoKTsKPiA+ICAgICAgICAgICAg
ICAgICBpZiAocmMpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmM7Cj4gPiAr
Cj4gPiArICAgICAgICAgICAgICAgcmMgPSBzYmlfaGFydF93b3JsZHNfaW5pdChzY3JhdGNoKTsK
PiA+ICsgICAgICAgICAgICAgICBpZiAocmMpCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBy
ZXR1cm4gcmM7Cj4gPiAgICAgICAgIH0KPiA+Cj4gPiAgICAgICAgIHJldHVybiBzYmlfaGFydF9y
ZWluaXQoc2NyYXRjaCk7Cj4gPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfaGFydF93b3JsZHMu
YyBiL2xpYi9zYmkvc2JpX2hhcnRfd29ybGRzLmMKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4g
PiBpbmRleCAwMDAwMDAwMC4uZDlkNjliMDcKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL2xp
Yi9zYmkvc2JpX2hhcnRfd29ybGRzLmMKPiA+IEBAIC0wLDAgKzEsNzIgQEAKPiA+ICsvKgo+ID4g
KyAqIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBCU0QtMi1DbGF1c2UKPiA+ICsgKgo+ID4gKyAq
IENvcHlyaWdodCAoYykgMjAyNiBTaUZpdmUgSW5jLgo+ID4gKyAqLwo+ID4gKwo+ID4gKyNpbmNs
dWRlIDxzYmkvcmlzY3ZfZW5jb2RpbmcuaD4KPiA+ICsjaW5jbHVkZSA8c2JpL3NiaV9jb25zb2xl
Lmg+Cj4gPiArI2luY2x1ZGUgPHNiaS9zYmlfZG9tYWluLmg+Cj4gPiArI2luY2x1ZGUgPHNiaS9z
YmlfZXJyb3IuaD4KPiA+ICsjaW5jbHVkZSA8c2JpL3NiaV9oYXJ0Lmg+Cj4gPiArI2luY2x1ZGUg
PHNiaS9zYmlfaGFydF9wcm90ZWN0aW9uLmg+Cj4gPiArI2luY2x1ZGUgPHNiaS9zYmlfaGFydF93
b3JsZHMuaD4KPiA+ICsjaW5jbHVkZSA8c2JpL3NiaV9zY3JhdGNoLmg+Cj4gPiArCj4gPiArc3Rh
dGljIGludCBzYmlfaGFydF93b3JsZHNfY29uZmlndXJlKHN0cnVjdCBzYmlfc2NyYXRjaCAqc2Ny
YXRjaCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgc2Jp
X2RvbWFpbiAqZG9tKQo+ID4gK3sKPiA+ICsgICAgICAgc3RydWN0IHNiaV9oYXJ0X2ZlYXR1cmVz
ICpoZiA9IHNiaV9oYXJ0X2ZlYXR1cmVzX3B0cihzY3JhdGNoKTsKPiA+ICsgICAgICAgYm9vbCB3
aWRfZm91bmQgPSB0cnVlOwo+ID4gKyAgICAgICB1MzIgd2lkX3ZhbCA9IDA7Cj4gPiArCj4gPiAr
ICAgICAgIGlmICghc2JpX2hhcnRfaGFzX2V4dGVuc2lvbihzY3JhdGNoLCBTQklfSEFSVF9FWFRf
U01MV0lEKSkKPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gMDsKPiA+ICsKPiA+ICsgICAgICAg
aWYgKGRvbS0+aGFzX3dpZCkgewo+ID4gKyAgICAgICAgICAgICAgIHdpZF92YWwgPSBkb20tPndp
ZDsKPiA+ICsgICAgICAgfSBlbHNlIGlmIChzYmlfaGFydF9oYXNfZXh0ZW5zaW9uKHNjcmF0Y2gs
IFNCSV9IQVJUX0VYVF9TTVdJRCkpIHsKPiA+ICsgICAgICAgICAgICAgICB3aWRfdmFsID0gY3Ny
X3JlYWQoQ1NSX01XSUQpICYgfk1XSURfTE9DSzsKPiA+ICsgICAgICAgfSBlbHNlIGlmIChoZi0+
aGFzX3Btd2lkKSB7Cj4gPiArICAgICAgICAgICAgICAgd2lkX3ZhbCA9IGhmLT5wbXdpZDsKPiA+
ICsgICAgICAgfSBlbHNlIHsKPiA+ICsgICAgICAgICAgICAgICAvKgo+ID4gKyAgICAgICAgICAg
ICAgICAqIFNtbHdpZCBwcmVzZW50IGJ1dCBubyBXSUQgc291cmNlLiBXaXRob3V0IHdyaXRpbmcK
PiA+ICsgICAgICAgICAgICAgICAgKiBtbHdpZCwgdGhlIGhhcmR3YXJlIHJlc2V0IHZhbHVlIGlz
IHVzZWQgd2hpY2ggbWF5Cj4gPiArICAgICAgICAgICAgICAgICogY2F1c2UgYSBzb2Z0d2FyZS1j
aGVjayBleGNlcHRpb24gb24gbG93ZXItcHJpdmlsZWdlCj4gPiArICAgICAgICAgICAgICAgICog
bW9kZSBlbnRyeS4KPiA+ICsgICAgICAgICAgICAgICAgKi8KPiA+ICsgICAgICAgICAgICAgICB3
aWRfZm91bmQgPSBmYWxzZTsKPiA+ICsgICAgICAgfQo+ID4gKwo+ID4gKyAgICAgICBpZiAod2lk
X2ZvdW5kKSB7Cj4gPiArICAgICAgICAgICAgICAgaWYgKGhmLT5oYXNfcG1sd2lkbGlzdCAmJgo+
ID4gKyAgICAgICAgICAgICAgICAgICAhKGhmLT5wbWx3aWRsaXN0ICYgQklUX1VMTCh3aWRfdmFs
KSkpIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHNiaV9wcmludGYoIiVzOiBkb21haW4g
d2lkICV1IG5vdCBpbiBwbWx3aWRsaXN0XG4iLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBfX2Z1bmNfXywgd2lkX3ZhbCk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICByZXR1cm4gU0JJX0VJTlZBTDsKPiA+ICsgICAgICAgICAgICAgICB9Cj4gPiArICAgICAgICAg
ICAgICAgY3NyX3dyaXRlKENTUl9NTFdJRCwgd2lkX3ZhbCk7Cj4gPiArICAgICAgIH0KPiA+ICsK
PiA+ICsgICAgICAgaWYgKHNiaV9oYXJ0X2hhc19leHRlbnNpb24oc2NyYXRjaCwgU0JJX0hBUlRf
RVhUX1NNV0lEREVMRUcpKQo+ID4gKyAgICAgICAgICAgICAgIGNzcl93cml0ZShDU1JfTVdJRERF
TEVHLCBkb20tPndpZGRlbGVnKTsKPiA+ICsKPiA+ICsgICAgICAgcmV0dXJuIDA7Cj4gPiArfQo+
ID4gKwo+ID4gK3N0YXRpYyBzdHJ1Y3Qgc2JpX2hhcnRfcHJvdGVjdGlvbiB3aWRfcHJvdGVjdGlv
biA9IHsKPiA+ICsgICAgICAgLm5hbWUgICAgICAgICAgID0gIndpZCIsCj4gPiArICAgICAgIC5y
YXRpbmcgICAgICAgICA9IDEwMCwKPiA+ICsgICAgICAgLnR5cGUgICAgICAgICAgID0gU0JJX0hB
UlRfUFJPVEVDVElPTl9UWVBFX0lELAo+ID4gKyAgICAgICAuY29uZmlndXJlICAgICAgPSBzYmlf
aGFydF93b3JsZHNfY29uZmlndXJlLAo+ID4gKyAgICAgICAudW5jb25maWd1cmUgICAgPSBOVUxM
Cj4gPiArfTsKPiA+ICsKPiA+ICtpbnQgc2JpX2hhcnRfd29ybGRzX2luaXQoc3RydWN0IHNiaV9z
Y3JhdGNoICpzY3JhdGNoKQo+ID4gK3sKPiA+ICsgICAgICAgaWYgKCFzYmlfaGFydF9oYXNfZXh0
ZW5zaW9uKHNjcmF0Y2gsIFNCSV9IQVJUX0VYVF9TTUxXSUQpKQo+ID4gKyAgICAgICAgICAgICAg
IHJldHVybiAwOwo+ID4gKwo+ID4gKyAgICAgICByZXR1cm4gc2JpX2hhcnRfcHJvdGVjdGlvbl9y
ZWdpc3Rlcigmd2lkX3Byb3RlY3Rpb24pOwo+ID4gK30KPiA+IC0tCj4gPiAyLjQzLjcKPiA+Cj4g
Cj4gT3phOiBleGNlcHQgdGhlIHBhcnQgdGhhdCBpZiB5b3UgZGVjaWRlIHRvIHJlbW92ZSBhbGwg
dGhlIGJvb2xlbmFzIGFuZAo+IGZpZ3VyZSBvdXQgZnJvbSB0aGUgd2lkICwgd2lkbGlzdCBpdHNs
ZWYgaWYgdGhhdCB2YWxpZCBvciBub3QuCj4gCj4gUmV2aWV3ZWQtYnk6IFBhd2FuZGVlcCBPemEg
PHBhd2FuZGVlcC5vemFAb3NzLnF1YWxjb21tLmNvbT4KCklmIHRoZSByYXRpb25hbGUgSSBwcm92
aWRlZCBpbiBQQVRDSDIgaXMgc291bmQsIEkgd291bGQga2VlcCB0aGUKY29kZSBoZXJlIGFzIGlz
LgoKVGhhbmtzLApQZXRlciBMaW4KCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vb3BlbnNiaQo=
