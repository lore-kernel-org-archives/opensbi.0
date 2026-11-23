Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F78E606A31A
	for <opensbi@archiver.kernel.org>; Mon, 23 Nov 2026 03:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JFV0AUkH;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=lDEMTvDO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WqsYFP11b9fVDzzZQfo0hA3GDqxW/mh/KYqVhAcFy2E=; b=JFV0AUkHZkRMRaxzWxzcUZL0QF
	VEH681M4W7rtdVBMcyXd8KPhmdWsFR8vnwAsaNiw/mQjuP/juhgU0eCEvmAAfYWtP0T9MXtLKs9pb
	PmiuhHMR86CsRC6iHUu3+5S3hnD3x4Lksr92W5OlqVKkcPVNaQeqXyrcEDI/f9+sLsmtwoAYgLRUG
	D2K4gOHMI743+/cSaBTt35iOPiBug8uV8eBwa4fnNddWqk/tIP0tjXi2xkPEoK4mmO5dI/VfS5gLX
	g7pgOUu4NrjmN+xU+OYXKVREcnfdJNAc0H/gQM44XPEBYbbSOnh4yhB/H/UkaOTEU97AK2Pw3AszD
	gQXajfdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVKqE-00000002DYF-3yZz;
	Mon, 23 Nov 2026 03:35:42 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVKq9-00000002DXd-10lF
	for opensbi@lists.infradead.org;
	Mon, 23 Nov 2026 03:35:41 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so1686783f8f.3
        for <opensbi@lists.infradead.org>; Sun, 22 Nov 2026 19:35:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795404935; cv=none;
        d=google.com; s=arc-20260327;
        b=EGhG0CvMbD68DUShecea28Cla3WdvW2T+dN7tzpsPr7QQJCEM3lJ9Sb8HnM7iu00d9
         zpDHc04mCM5BLFlak2xiXTcQ68KxuhBYzVdYAN1LuCUIxfZuH1EeNwfMl24/a24GZcCg
         n8qUCWDk3yRZiJ902pVTYvqjKVzUGUQmim47MTmvW4vjz7Do735L5I9oMJrIoQjbIhxd
         7KMjiGvLlzcmZUdfN1A2+PTgGWy0R83uCTqwbSl22kPcTL+u/sOpts4U/SJJLATXvvd2
         rJ0VTpdvbhI5XOw1k1Bli/3cCGLxdD2kBs1sIzrPhd6SCZPY6fvMxWn4pVXi8drYhC1s
         1t4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UEDoxTSQ5KdmydjFT4VUyMF/bZg6bC35MNFpcIepTAE=;
        fh=s0V2QxfkZ31uI08A+gYD94xQ3QEn9NHnxJRAVF9iZzc=;
        b=jIdy0aVyuwmlpNe7stLQhUvYosGZhYLJhuj/3c576FJ8RCJsqJcjOnXdjxqJKlzPvt
         l86OG5yfDI3BPlMamNN/FSNecuGIksomuV0UB0t6r0Fv3It7SNr8j1KSdLmvxFfdoiu9
         2b1Or+6uAv4cLpDK9e3bCa/uCqj+ZDjWzMywHNTY2NkSeWWqSwRepWIx64viMw3CXWim
         G3TstEgf33UGyz3XDJs6e0GgNnpFJj3gJWQA2cR5ycQPwKeel3DB8Lz+Frek5GBHOa2B
         952ohjrvH+VifaYw/MNUC2k8Exu6XcHhJiVddTPpgv3LmUasZwIlmEItcO8wF+8KP1b+
         qrNA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795404935; x=1796009735; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UEDoxTSQ5KdmydjFT4VUyMF/bZg6bC35MNFpcIepTAE=;
        b=lDEMTvDO73wwMmGBWmre0wHPaAY+dK3z9jmhAob1dsUSMCkylypOXb6WCPywMQ+BUA
         A7Z/oKkvo9t8pwJ/g5dNeYRv7zWzNsAaSbA5Ur4QO1CVfPPvbQd+DekFr0H/9zoQvn72
         aX8OcrUcGa4TkpjhUKuejOE/ZIArx/OaiCwMp7EcaSZoCwDvhfscSlUn6RR3Fy/SdvXc
         PFmHdczjyaWFXU6dNsXVW/Lr+n44q5QgNYbe8Uqw/9cJDF+l9Nzlmh3HAe2CXIFBV8et
         24R/1T06fvZHDy1j1C2DmYqk75SCaufL43Z8Ba/EQbYZvWVnAlya/4swbxe3xzWwLVIc
         9Uiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795404935; x=1796009735;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UEDoxTSQ5KdmydjFT4VUyMF/bZg6bC35MNFpcIepTAE=;
        b=Ln94DnC1iuXcix/JJmtPtFCIa9C2Ltac+JFCyHLB1JGFL9+h2HXsYjUKtbTGrGdPJe
         It19efv1DWmWksrqjps70HS7CQl30BFTmcu9j4eXoYqcK+Jv0NeZS057haNvIQPeav+r
         4RBLoUiSl2NicmYvqX9GwNGwsBVQKUteFLGiwj1xfRB9gtmBAyIo54op0MKtHWJJ1dWo
         oUY616TgZzJzPwcUnSpGVnSrJ90WNxow+U+oB3Ns/UffbwHtvtQVjLQ6QOxcWAPMbyz7
         azbjymZEY97Wc2kyT+fPQWc9pr9RnAC3is2WaF26+fb60wFRmQQiakctOuhZyTn5TJ2j
         7FWA==
X-Gm-Message-State: APuU4Z8uIeOOyIDGfJZTuR7ymUP5Zo2jclhhXq9TX2eScgYZaHH0AbYv
	DQJ8hUje/7jyCv1O890oB32fjBTcsxDO0lvwEqB+z+7HoMgB86JDja8jQl5sbusETq2L9ZfL/Fe
	U97J8qjpGp9WfvQcyvplDkV2EPJKvZTfeGlUpoEBezQ==
X-Gm-Gg: AZFdTZecL3HwJNGiVFDfJjFulk5rsKckcDHRLlEZTF1U4sJcC+tXeO0NbPjEpV1dycb
	ynjorgm9M0pWMOJk2/tsrEUBCpqav0EElzwRSu3gw4iuOF2wlDLMYF7P+hlveCuxU1z6c4GoASK
	5sKDvDUNkkaVtiN/HEnm+18AF236uAZe8+i9Q8MA28nEtwEDHSELEa70H9WwPN2M/zQni8jTsQA
	qoxMkkII0Z5enEOZmN03cJfN2GsDFg+wsmCb3iMMPyBmX2+zI74U2EViFNT7Lvy2puv4dzyb+Sg
	HMDp7+TCUNab/7j/qSB5oOxX8SlOM9Vn3ZsWCtSCyFGuxtFYErpeur6TfN9Edrpf+4ytn5hdztW
	Vxrmn89P/h/njdRYNnt3T+pqNU0ReVWJ5vcPQyQ56ztYUi+Ab1nLVo+8quVRRftC8CFMZU8KCQp
	KFRMpheU5Bqs+Nm9Z86mgVcNoYDaSH0U2RBI6mayrX7zXGrvgLCoOXQlg=
X-Received: by 2002:a05:6000:2602:b0:48a:f404:695e with SMTP id
 ffacd0b85a97d-4abb5518f07mr20229296f8f.50.1795404934792; Sun, 22 Nov 2026
 19:35:34 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110095029.117504-1-peter.lin@sifive.com> <20261110095029.117504-5-peter.lin@sifive.com>
 <CAAhSdy2=JhtXg_h==eiet7nJ-VMaq7VCMgmVuha-uwQKkVEmMw@mail.gmail.com>
 <av0GzyFfzDvasVEW@plin-1878> <CAAhSdy3fC1ksY18RPTCG68KRCNW7ZxTcX=o+JOKsWRfUptn+1w@mail.gmail.com>
 <awOcQsuTdKwKTkar@plin-1878>
In-Reply-To: <awOcQsuTdKwKTkar@plin-1878>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 23 Nov 2026 09:05:20 +0530
X-Gm-Features: Aa3M54pDs7yWwmaDHo6DF8wxieyH6lGYaYQPyNhTaoZh7g-rCYem9G3vVdkGKME
Message-ID: <CAAhSdy3-WUgZtqba383vSFyATDxe3F5fY8vH7_OYu93DNHxD1g@mail.gmail.com>
Subject: Re: [PATCH v5 4/9] lib: sbi_hart: lock mwid CSR for RoT immutability
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, pawandeep.oza@oss.qualcomm.com, 
	rkrcmar@qti.qualcomm.com, raymond.mao@riscstar.com, robin.randhawa@sifive.com, 
	samuel.holland@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_193537_308062_BA5A20D0 
X-CRM114-Status: GOOD (  34.57  )
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

T24gTW9uLCBOb3YgMjMsIDIwMjYgYXQgNzoyMuKAr0FNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gSGkgQW51cCwKPgo+IE9uIFRodSwgTm92IDE5
LCAyMDI2IGF0IDA2OjMzOjIzUE0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBPbiBXZWQs
IE5vdiAxOCwgMjAyNiBhdCA3OjMw4oCvQU0gWXUtQ2hpZW4gUGV0ZXIgTGluIDxwZXRlci5saW5A
c2lmaXZlLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEhpIEFudXAsCj4gPiA+Cj4gPiA+IE9uIE1v
biwgTm92IDE2LCAyMDI2IGF0IDA2OjQ5OjUwUE0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4g
PiA+ID4gT24gVHVlLCBOb3YgMTAsIDIwMjYgYXQgMzoyMOKAr1BNIFl1LUNoaWVuIFBldGVyIExp
biA8cGV0ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+IExvY2sg
dGhlIE0tbW9kZSBXb3JsZCBJRCAobXdpZCkgQ1NSIGR1cmluZyBoYXJ0IHJlLWluaXRpYWxpemF0
aW9uCj4gPiA+ID4gPiB0byBlbmZvcmNlIGltbXV0YWJpbGl0eSBvZiB0aGUgV0lEIGVzdGFibGlz
aGVkIGJ5IHRoZSByb290LW9mLXRydXN0Lgo+ID4gPiA+ID4KPiA+ID4gPiA+IE9wZW5TQkkgZG9l
cyBub3QgYXNzaWduIHRoZSBXSUQgdmFsdWUgaXRzZWxmOyBpdCBvbmx5IHNldHMgTVdJRF9MT0NL
Cj4gPiA+ID4gPiB0byBmcmVlemUgdGhlIHZhbHVlIGVzdGFibGlzaGVkIGJ5IHByaW9yIFJvVCBz
dGFnZS4gVGhlIE1XSURfTE9DSyBiaXQKPiA+ID4gPiA+IGF0IFhMRU4tMSBpcyBzdGlja3kgYW5k
IG1ha2VzIHRoZSBDU1IgcmVhZC1vbmx5IHVudGlsIHJlc2V0LCBlbmZvcmNpbmcKPiA+ID4gPiA+
IGEgdGVtcG9yYWwgc2VjdXJpdHkgYm91bmRhcnkgcGVyIHRoZSBSSVNDLVYgV29ybGRzIHNwZWNp
ZmljYXRpb24uCj4gPiA+ID4gPgo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogWXUtQ2hpZW4gUGV0
ZXIgTGluIDxwZXRlci5saW5Ac2lmaXZlLmNvbT4KPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gQ2hh
bmdlcyB2NC0+djU6Cj4gPiA+ID4gPiAtIE1vdmUgdGhlIE1XSUQgbG9jayBvdXQgb2Ygc2JpX2hh
cnRfcmVpbml0KCkgaW50byBzbXdpZF9oYXJ0X2luaXQoKQo+ID4gPiA+ID4gLSBEcm9wIFJCLXRh
Z3MgZnJvbSBPemEgYW5kIEFudXAKPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gIGxpYi9zYmkvc2Jp
X2hhcnQuYyB8IDEyICsrKysrKysrKysrKwo+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBp
bnNlcnRpb25zKCspCj4gPiA+ID4gPgo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2Jp
X2hhcnQuYyBiL2xpYi9zYmkvc2JpX2hhcnQuYwo+ID4gPiA+ID4gaW5kZXggZDg2YWJmMDcuLmE3
MjFiZWY0IDEwMDY0NAo+ID4gPiA+ID4gLS0tIGEvbGliL3NiaS9zYmlfaGFydC5jCj4gPiA+ID4g
PiArKysgYi9saWIvc2JpL3NiaV9oYXJ0LmMKPiA+ID4gPiA+IEBAIC00NjksNiArNDY5LDE2IEBA
IHN0YXRpYyBpbnQgaGFydF9taHBtX2dldF9hbGxvd2VkX2JpdHModm9pZCkKPiA+ID4gPiA+ICAg
ICAgICAgcmV0dXJuIG51bV9iaXRzOwo+ID4gPiA+ID4gIH0KPiA+ID4gPiA+Cj4gPiA+ID4gPiAr
c3RhdGljIHZvaWQgc213aWRfaGFydF9pbml0KHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCkK
PiA+ID4gPiA+ICt7Cj4gPiA+ID4gPiArICAgICAgIC8qCj4gPiA+ID4gPiArICAgICAgICAqIEFz
c3VtZSBNV0lEIGlzIHJlc3RvcmVkIGJ5IHJvb3Qtb2YtdHJ1c3QgTS1tb2RlIGluIHByZXZpb3Vz
Cj4gPiA+ID4gPiArICAgICAgICAqIHN0YWdlLiBMb2NrIG13aWQgc28gUm9ULWRlZmluZWQgV0lE
IHJlbWFpbnMgaW1tdXRhYmxlLgo+ID4gPiA+ID4gKyAgICAgICAgKi8KPiA+ID4gPiA+ICsgICAg
ICAgaWYgKHNiaV9oYXJ0X2hhc19leHRlbnNpb24oc2NyYXRjaCwgU0JJX0hBUlRfRVhUX1NNV0lE
KSkKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBjc3Jfc2V0KENTUl9NV0lELCBNV0lEX0xPQ0sp
Owo+ID4gPiA+Cj4gPiA+ID4gSWYgcG13aWQgaXMgYXZhaWxhYmxlIHRoZW4gd2Ugc2hvdWxkIHNl
dCBwbXdpZCBpbiBNV0lEIENTUgo+ID4gPiA+IGJlZm9yZSBsb2NraW5nIGl0LiBUaGlzIHdpbGwg
aGVscCBwbGF0Zm9ybXMgd2hlcmUgT3BlblNCSSBib290cwo+ID4gPiA+IGZpcnN0IHdpdGhvdXQg
YW55IHByaW9yIGJvb3Rpbmcgc3RhZ2UuCj4gPiA+ID4KPiA+ID4gPiBXaGF0IGRvIHlvdSB0aGlu
ayA/Cj4gPiA+Cj4gPiA+IFRoYW5rcyBmb3IgdGhlIHN1Z2dlc3Rpb24uIEknZCBwcmVmZXIgbG9j
ay1vbmx5LCBiZWNhdXNlIHdyaXRpbmcgcG13aWQgYmVmb3JlIHRoZQo+ID4gPiBsb2NrIGlzIGVp
dGhlciBhIG5vLW9wIG9yIGNhbiB1bmRvIGFuIGVhcmxpZXIgc3RhZ2UncyBkZWNpc2lvbi4KPiA+
ID4KPiA+ID4gVGhlIHNwZWMgc2F5cyAiT24tcmVzZXQsIHRoZSBtd2lkIENTUiBpcyBleHBlY3Rl
ZCB0byBzaG93IHRoZSBwbGF0Zm9ybS1kZWZpbmVkIHBtd2lkCj4gPiA+IHZhbHVlIiwgc28gaWYg
T3BlblNCSSBpcyB0aGUgZmlyc3Qgc3RhZ2UsIG13aWQgYWxyZWFkeSBlcXVhbHMgcG13aWQgYW5k
IHRoZSB3cml0ZQo+ID4gPiBjaGFuZ2VzIG5vdGhpbmcuCj4gPiA+Cj4gPiA+IEl0IG9ubHkgY2hh
bmdlcyBzb21ldGhpbmcgd2hlbiBtd2lkICE9IHBtd2lkLCB3aGljaCBtZWFucyBhbiBlYXJsaWVy
IHN0YWdlIGhhcyBhbHJlYWR5Cj4gPiA+IHByb2dyYW1tZWQgbXdpZC4gRXhhbXBsZSB3aXRoIG5X
b3JsZHM9MTYsIHRydXN0ZWQgV0lEID0gMTU6Cj4gPiA+Cj4gPiA+IDEuIE91dCBvZiByZXNldCwg
bXdpZCA9IHBtd2lkID0gMTUuIFRoZSBSb1QgcnVucyBpbiB0aGUgdHJ1c3RlZCBXSUQuCj4gPiA+
IDIuIFRoZSBSb1QgY29uZmlndXJlcyB0aGUgd2dDaGVja2VycyBzbyB0aGF0IFdJRCAzIGNhbiBv
bmx5IGFjY2VzcyBPcGVuU0JJJ3MKPiA+ID4gICAgUkFNL2RldmljZXMgYW5kIGNhbm5vdCB0b3Vj
aCB0aGUgd2dDaGVja2VyIGNvbmZpZ3VyYXRpb24gcmVnaXN0ZXJzLgo+ID4gPiAgICAtIFRoZSBS
b1Qgd3JpdGVzIG13aWQgPSAzIHRvIGRlbW90ZSBydW50aW1lIE0tbW9kZSwgYnV0IGxlYXZlcyB0
aGUgbG9jawo+ID4gPiAgICAgIGJpdCB1bnNldCBhbmQgaGFuZHMgb3ZlciB0byBPcGVuU0JJLgo+
ID4gPiA0LiBPcGVuU0JJIHdyaXRlcyBwbXdpZCAoMTUpIHRvIG13aWQsIHRoZW4gc2V0cyB0aGUg
bG9jayBiaXQuCj4gPiA+IDUuIE9wZW5TQkkgaXMgbm93IGJhY2sgaW4gdGhlIHRydXN0ZWQgV0lE
LCBhbmQgbG9ja2VkIHRoZXJlIHVudGlsIHRoZSBuZXh0IHJlc2V0Lgo+ID4gPiAgICBJdCBjYW4g
cmVjb25maWd1cmUgdGhlIHdnQ2hlY2tlcnMgYW5kIHRoZSBSb1QncyBkZW1vdGlvbiBpcyB1bmRv
bmUuCj4gPiA+Cj4gPiA+IEdpdmVuIHRoZSBjYXNlIGFib3ZlLCBJIHRoaW5rIHdlIHNob3VsZCBr
ZWVwIG13aWQgdW50b3VjaGVkLgo+ID4KPiA+IEF0IGxlYXN0LCBjaGVjayB0aGUgbXdpZCBpbiBD
U1Igd2l0aCBwbXdpZCB3aGVuIHBtd2lkIGlzIGF2YWlsYWJsZSBpbiBEVC4KPiA+IElmIHBtd2lk
IGlzIG5vdCBhdmFpbGFibGUgaW4gRFQgdGhlbiBsZWF2ZSBtd2lkIHVudG91Y2hlZC4KPgo+IC0g
SWYgcG13aWQgaXMgaW4gRFQgYW5kIG13aWQgKHdpdGhvdXQgdGhlIGxvY2sgYml0KSAhPSBwbXdp
ZCwgcHJpbnQKPiAgIGEgaW5mbyBtZXNzYWdlIHNob3dpbmcgcG13aWQgdmFsdWUuCgpJIHdvdWxk
IHN1Z2dlc3QgcHJpbnQgYSB3YXJuaW5nIGluIHRoaXMgY2FzZS4KCj4gLSBJbiBhbGwgY2FzZXMs
IG9ubHkgc2V0IHRoZSBsb2NrIGJpdCBhbmQgbmV2ZXIgbW9kaWZ5IHRoZSBtd2lkLgoKVGhpcyBp
cyBmaW5lLgoKUmVnYXJkcywKQW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL29wZW5zYmkK
