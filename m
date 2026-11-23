Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E473606A31A
	for <opensbi@archiver.kernel.org>; Mon, 23 Nov 2026 01:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G1OV2fG7;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=Ik+NAskP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZkWpLbdT8nj9MxUgh9Uw1riMkeKFpDttzdU3gfoTprU=; b=G1OV2fG7uplrMjKg1YRFeknqcq
	Vrctd8EOC9b3VQEKhDclMb7MsH5gqOdjc2W+qPQstw17ONdKKhc+IIRcMRm5CkjUmvLqI53dzd3kU
	WWXOo2f9EHEZIhmRs3zPzFFU9WxCORA5sgDfGJmS/MLiu2rM3OZTWPDcE9XqUK/8ij8+R+sg5u2vo
	VUzaStoZ1Ba4dExA81Q4wWxJSyn6QQtd9fZAji5IELvB+belLOf4o6b9dPqXZR6jHLQglHKsroBfi
	DK8rMzcOQqUMVLjruUNx0k2dTi9O0y/yA2XPuswsmpkMyiiAsOplt4zq3xjk3V3bhVz3LHubDQrDV
	dIJUdlQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVJE5-000000026zN-12Wz;
	Mon, 23 Nov 2026 01:52:13 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVJE1-000000026xl-29ub
	for opensbi@lists.infradead.org;
	Mon, 23 Nov 2026 01:52:10 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2f02f04a426so22520015ad.1
        for <opensbi@lists.infradead.org>; Sun, 22 Nov 2026 17:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1795398728; x=1796003528; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YLQWRjb1v6WliPWlA8krvnoH5irXVgVkG+15xGnhQFk=;
        b=Ik+NAskP9cdk6+mUTsADguMZaAT6kbkn9752K4YciOv2D9IXHKPgtbydT658Kb8Ixt
         3OOlFh+Prp30CPSYT3STya7bnJ1kAQL955kY1pghyRqmGH2DRL8rEnuoLfObconDUI5k
         pI9xFGzmfL66zuahqmDKDuHPdMlZsPLEZu7AuUlXTcCDXBFHt0cjAuHU0qDiCmeUeSaE
         f85YjWeooqEG4VAweNmtcBlTqu2ynk6twqHS03NASt+i5aCPlha8sOP4c/pwwly36vTS
         dY/rLqeLDOl6BCoB527RxIjM6q3JzU5qSKcu7AiBSPfPUWjOhJCJcbxlHf43yubBDrwo
         a9dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795398728; x=1796003528;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YLQWRjb1v6WliPWlA8krvnoH5irXVgVkG+15xGnhQFk=;
        b=WZZqKyEnhJulEWhWcTppBSBbh0OwImZ0lAXQZ+C8PMYuDYBBsE3CdK7WpgLDV7hExQ
         iwjfnyhwdem5+MISUzVI+YrSMTe4c3SebDE7Z6pF+fCXn8cynA9T5mZq1Z/hXpXDaZyX
         ppXE506VDlhiDHwQMfMoA9lpPh1EQ30QZWOZQK2RO7ENrST7UgGn5wFtOc3nbASul4CQ
         g9xZO6WPU4dY20vmxo0I2Gswqlk4M4w2jSAxOUO3eLhfrGEH0yHXXC0Ip9c4ioa6DBoT
         q1x8QAzmzXZy3xfwaaS9mSwK90x7P3Q1QppPt7q/zcvnpfvtFSMMh4vjHUqqLrrtT/6v
         O1DQ==
X-Gm-Message-State: APuU4Z8M9jV+whnFKoFx+sU1adpETUpnYh1LUC1hMpQ8qL/djZKrFTOJ
	rBMp97PlvR9pWaT5idPGPmXYEgx43NRAzyCGRCAIVbX5IXgCA/0zH6u2dNKWZj1GBBQ=
X-Gm-Gg: AZFdTZeUPgGd4Y94SwxFe/Vgd0vJiFMXq7rE5Mu2nDO55wyOB4+D54Qsjl86av0OHaA
	vKLBRBNGugU6nmo8omNldetet0w9x8iWEnwFjkqF3DqNVgghMGb3CbiO3aIfnouId6ozVonGqNI
	d5kV5FR/LVfQNOrhY7nSPA8VwNfBne26rgKbWwHIlq+QRgsN7VXc3+pVsPco1dR9uDUtsYUFJJu
	9Y9Ns/1SYVO19VIiAWkMtqHQ5JOQ73XcM76QLSEl0jeADxYRMU7Pjg8GmugJqtSPHIBTy+9D69a
	gdmEFZVQY4nQc3ron9ytYZYUua0SSQUxwLC7qZUc2Dzn1TGvoF3exDFQBpfUqqAmK3fEJS9Xm50
	7mYDoOZc2EKpZhxGy1FcTHOjGx6G8Y/itrQn5PZZPsvaSn27DVCFmRpR9DNVPGGRANZ3aW/rhTt
	r/0QYjbqBfSlSH/mqOzAb68aKac5QItHgr4upA9BnwYAdIcfu7R76WGAGUEvgE9mYQWb2I08dny
	/OlHGmPQt7U+D0hFoKe6r0ul2svw4iC3JDIC5dIxN2P2ye1x13v38u3hRxl0xBcaRIkRvp6DJOt
	Ndyl1JCRmlPmesgvhf6U3WOOFZQ=
X-Received: by 2002:a17:903:2282:b0:2f0:82df:b8a6 with SMTP id d9443c01a7336-2f082dfbfa2mr27873925ad.59.1795398728048;
        Sun, 22 Nov 2026 17:52:08 -0800 (PST)
Received: from plin-1878 ([136.226.240.203])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f04eaffad5sm33335055ad.14.2026.11.22.17.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 17:52:07 -0800 (PST)
Date: Mon, 23 Nov 2026 09:52:02 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org, pawandeep.oza@oss.qualcomm.com,
	rkrcmar@qti.qualcomm.com, raymond.mao@riscstar.com,
	robin.randhawa@sifive.com, samuel.holland@sifive.com,
	zong.li@sifive.com, greentime.hu@sifive.com
Subject: Re: [PATCH v5 4/9] lib: sbi_hart: lock mwid CSR for RoT immutability
Message-ID: <awOcQsuTdKwKTkar@plin-1878>
References: <20261110095029.117504-1-peter.lin@sifive.com>
 <20261110095029.117504-5-peter.lin@sifive.com>
 <CAAhSdy2=JhtXg_h==eiet7nJ-VMaq7VCMgmVuha-uwQKkVEmMw@mail.gmail.com>
 <av0GzyFfzDvasVEW@plin-1878>
 <CAAhSdy3fC1ksY18RPTCG68KRCNW7ZxTcX=o+JOKsWRfUptn+1w@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy3fC1ksY18RPTCG68KRCNW7ZxTcX=o+JOKsWRfUptn+1w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_175209_668914_28BD6C81 
X-CRM114-Status: GOOD (  34.97  )
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

SGkgQW51cCwKCk9uIFRodSwgTm92IDE5LCAyMDI2IGF0IDA2OjMzOjIzUE0gKzA1MzAsIEFudXAg
UGF0ZWwgd3JvdGU6Cj4gT24gV2VkLCBOb3YgMTgsIDIwMjYgYXQgNzozMOKAr0FNIFl1LUNoaWVu
IFBldGVyIExpbiA8cGV0ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+ID4KPiA+IEhpIEFudXAs
Cj4gPgo+ID4gT24gTW9uLCBOb3YgMTYsIDIwMjYgYXQgMDY6NDk6NTBQTSArMDUzMCwgQW51cCBQ
YXRlbCB3cm90ZToKPiA+ID4gT24gVHVlLCBOb3YgMTAsIDIwMjYgYXQgMzoyMOKAr1BNIFl1LUNo
aWVuIFBldGVyIExpbiA8cGV0ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+
ID4gTG9jayB0aGUgTS1tb2RlIFdvcmxkIElEIChtd2lkKSBDU1IgZHVyaW5nIGhhcnQgcmUtaW5p
dGlhbGl6YXRpb24KPiA+ID4gPiB0byBlbmZvcmNlIGltbXV0YWJpbGl0eSBvZiB0aGUgV0lEIGVz
dGFibGlzaGVkIGJ5IHRoZSByb290LW9mLXRydXN0Lgo+ID4gPiA+Cj4gPiA+ID4gT3BlblNCSSBk
b2VzIG5vdCBhc3NpZ24gdGhlIFdJRCB2YWx1ZSBpdHNlbGY7IGl0IG9ubHkgc2V0cyBNV0lEX0xP
Q0sKPiA+ID4gPiB0byBmcmVlemUgdGhlIHZhbHVlIGVzdGFibGlzaGVkIGJ5IHByaW9yIFJvVCBz
dGFnZS4gVGhlIE1XSURfTE9DSyBiaXQKPiA+ID4gPiBhdCBYTEVOLTEgaXMgc3RpY2t5IGFuZCBt
YWtlcyB0aGUgQ1NSIHJlYWQtb25seSB1bnRpbCByZXNldCwgZW5mb3JjaW5nCj4gPiA+ID4gYSB0
ZW1wb3JhbCBzZWN1cml0eSBib3VuZGFyeSBwZXIgdGhlIFJJU0MtViBXb3JsZHMgc3BlY2lmaWNh
dGlvbi4KPiA+ID4gPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFl1LUNoaWVuIFBldGVyIExpbiA8
cGV0ZXIubGluQHNpZml2ZS5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gQ2hhbmdlcyB2NC0+djU6
Cj4gPiA+ID4gLSBNb3ZlIHRoZSBNV0lEIGxvY2sgb3V0IG9mIHNiaV9oYXJ0X3JlaW5pdCgpIGlu
dG8gc213aWRfaGFydF9pbml0KCkKPiA+ID4gPiAtIERyb3AgUkItdGFncyBmcm9tIE96YSBhbmQg
QW51cAo+ID4gPiA+IC0tLQo+ID4gPiA+ICBsaWIvc2JpL3NiaV9oYXJ0LmMgfCAxMiArKysrKysr
KysrKysKPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKPiA+ID4gPgo+
ID4gPiA+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9oYXJ0LmMgYi9saWIvc2JpL3NiaV9oYXJ0
LmMKPiA+ID4gPiBpbmRleCBkODZhYmYwNy4uYTcyMWJlZjQgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEv
bGliL3NiaS9zYmlfaGFydC5jCj4gPiA+ID4gKysrIGIvbGliL3NiaS9zYmlfaGFydC5jCj4gPiA+
ID4gQEAgLTQ2OSw2ICs0NjksMTYgQEAgc3RhdGljIGludCBoYXJ0X21ocG1fZ2V0X2FsbG93ZWRf
Yml0cyh2b2lkKQo+ID4gPiA+ICAgICAgICAgcmV0dXJuIG51bV9iaXRzOwo+ID4gPiA+ICB9Cj4g
PiA+ID4KPiA+ID4gPiArc3RhdGljIHZvaWQgc213aWRfaGFydF9pbml0KHN0cnVjdCBzYmlfc2Ny
YXRjaCAqc2NyYXRjaCkKPiA+ID4gPiArewo+ID4gPiA+ICsgICAgICAgLyoKPiA+ID4gPiArICAg
ICAgICAqIEFzc3VtZSBNV0lEIGlzIHJlc3RvcmVkIGJ5IHJvb3Qtb2YtdHJ1c3QgTS1tb2RlIGlu
IHByZXZpb3VzCj4gPiA+ID4gKyAgICAgICAgKiBzdGFnZS4gTG9jayBtd2lkIHNvIFJvVC1kZWZp
bmVkIFdJRCByZW1haW5zIGltbXV0YWJsZS4KPiA+ID4gPiArICAgICAgICAqLwo+ID4gPiA+ICsg
ICAgICAgaWYgKHNiaV9oYXJ0X2hhc19leHRlbnNpb24oc2NyYXRjaCwgU0JJX0hBUlRfRVhUX1NN
V0lEKSkKPiA+ID4gPiArICAgICAgICAgICAgICAgY3NyX3NldChDU1JfTVdJRCwgTVdJRF9MT0NL
KTsKPiA+ID4KPiA+ID4gSWYgcG13aWQgaXMgYXZhaWxhYmxlIHRoZW4gd2Ugc2hvdWxkIHNldCBw
bXdpZCBpbiBNV0lEIENTUgo+ID4gPiBiZWZvcmUgbG9ja2luZyBpdC4gVGhpcyB3aWxsIGhlbHAg
cGxhdGZvcm1zIHdoZXJlIE9wZW5TQkkgYm9vdHMKPiA+ID4gZmlyc3Qgd2l0aG91dCBhbnkgcHJp
b3IgYm9vdGluZyBzdGFnZS4KPiA+ID4KPiA+ID4gV2hhdCBkbyB5b3UgdGhpbmsgPwo+ID4KPiA+
IFRoYW5rcyBmb3IgdGhlIHN1Z2dlc3Rpb24uIEknZCBwcmVmZXIgbG9jay1vbmx5LCBiZWNhdXNl
IHdyaXRpbmcgcG13aWQgYmVmb3JlIHRoZQo+ID4gbG9jayBpcyBlaXRoZXIgYSBuby1vcCBvciBj
YW4gdW5kbyBhbiBlYXJsaWVyIHN0YWdlJ3MgZGVjaXNpb24uCj4gPgo+ID4gVGhlIHNwZWMgc2F5
cyAiT24tcmVzZXQsIHRoZSBtd2lkIENTUiBpcyBleHBlY3RlZCB0byBzaG93IHRoZSBwbGF0Zm9y
bS1kZWZpbmVkIHBtd2lkCj4gPiB2YWx1ZSIsIHNvIGlmIE9wZW5TQkkgaXMgdGhlIGZpcnN0IHN0
YWdlLCBtd2lkIGFscmVhZHkgZXF1YWxzIHBtd2lkIGFuZCB0aGUgd3JpdGUKPiA+IGNoYW5nZXMg
bm90aGluZy4KPiA+Cj4gPiBJdCBvbmx5IGNoYW5nZXMgc29tZXRoaW5nIHdoZW4gbXdpZCAhPSBw
bXdpZCwgd2hpY2ggbWVhbnMgYW4gZWFybGllciBzdGFnZSBoYXMgYWxyZWFkeQo+ID4gcHJvZ3Jh
bW1lZCBtd2lkLiBFeGFtcGxlIHdpdGggbldvcmxkcz0xNiwgdHJ1c3RlZCBXSUQgPSAxNToKPiA+
Cj4gPiAxLiBPdXQgb2YgcmVzZXQsIG13aWQgPSBwbXdpZCA9IDE1LiBUaGUgUm9UIHJ1bnMgaW4g
dGhlIHRydXN0ZWQgV0lELgo+ID4gMi4gVGhlIFJvVCBjb25maWd1cmVzIHRoZSB3Z0NoZWNrZXJz
IHNvIHRoYXQgV0lEIDMgY2FuIG9ubHkgYWNjZXNzIE9wZW5TQkkncwo+ID4gICAgUkFNL2Rldmlj
ZXMgYW5kIGNhbm5vdCB0b3VjaCB0aGUgd2dDaGVja2VyIGNvbmZpZ3VyYXRpb24gcmVnaXN0ZXJz
Lgo+ID4gICAgLSBUaGUgUm9UIHdyaXRlcyBtd2lkID0gMyB0byBkZW1vdGUgcnVudGltZSBNLW1v
ZGUsIGJ1dCBsZWF2ZXMgdGhlIGxvY2sKPiA+ICAgICAgYml0IHVuc2V0IGFuZCBoYW5kcyBvdmVy
IHRvIE9wZW5TQkkuCj4gPiA0LiBPcGVuU0JJIHdyaXRlcyBwbXdpZCAoMTUpIHRvIG13aWQsIHRo
ZW4gc2V0cyB0aGUgbG9jayBiaXQuCj4gPiA1LiBPcGVuU0JJIGlzIG5vdyBiYWNrIGluIHRoZSB0
cnVzdGVkIFdJRCwgYW5kIGxvY2tlZCB0aGVyZSB1bnRpbCB0aGUgbmV4dCByZXNldC4KPiA+ICAg
IEl0IGNhbiByZWNvbmZpZ3VyZSB0aGUgd2dDaGVja2VycyBhbmQgdGhlIFJvVCdzIGRlbW90aW9u
IGlzIHVuZG9uZS4KPiA+Cj4gPiBHaXZlbiB0aGUgY2FzZSBhYm92ZSwgSSB0aGluayB3ZSBzaG91
bGQga2VlcCBtd2lkIHVudG91Y2hlZC4KPiAKPiBBdCBsZWFzdCwgY2hlY2sgdGhlIG13aWQgaW4g
Q1NSIHdpdGggcG13aWQgd2hlbiBwbXdpZCBpcyBhdmFpbGFibGUgaW4gRFQuCj4gSWYgcG13aWQg
aXMgbm90IGF2YWlsYWJsZSBpbiBEVCB0aGVuIGxlYXZlIG13aWQgdW50b3VjaGVkLgoKLSBJZiBw
bXdpZCBpcyBpbiBEVCBhbmQgbXdpZCAod2l0aG91dCB0aGUgbG9jayBiaXQpICE9IHBtd2lkLCBw
cmludAogIGEgaW5mbyBtZXNzYWdlIHNob3dpbmcgcG13aWQgdmFsdWUuCi0gSW4gYWxsIGNhc2Vz
LCBvbmx5IHNldCB0aGUgbG9jayBiaXQgYW5kIG5ldmVyIG1vZGlmeSB0aGUgbXdpZC4KCkRvZXMg
dGhhdCB3b3JrIGZvciB5b3U/CgpUaGFua3MsClBldGVyIExpbgoKPiBSZWdhcmRzLAo+IEFudXAK
Ci0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
