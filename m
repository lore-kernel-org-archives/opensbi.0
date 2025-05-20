Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC4EC3ABDD
	for <opensbi@archiver.kernel.org>; Tue, 20 May 2025 04:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mkXjyKPAg5/mEUtn0vHNLOzKWjshazjxWed0etq6X5g=; b=P3M5h95YGPa8bc
	wwNRACUpmHtzj2OxAYDxvLGVhHeRUG3BibdW/pu6Focgq8eTkT1FSVeSGsixp7m10VLnKeSUdoX4V
	u6SVW7rR6ceCKnGZrL599yHRrUHOPnxUyP5DP0p1EfZZ8QIYPVMde5NpmpDTXnfvzRFu052CbdWoD
	kULDb5waz1yX42WypCt6bAKnMgJNenIq38axjMpj+Df8zgbrZHotGQvmw96m1cMgoijohypHVfF/h
	arFuuV2URf9V5G+05w3OmJDTEmUxc5XvL0Vj6xZypINFimzhFPB2Av+5e/D/hk35b3shO3KH3ne8w
	nsi/wNO6V2GkW1HNnxfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHEao-0000000BUaO-1fNI;
	Tue, 20 May 2025 04:28:42 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHEal-0000000BUa2-2zcb
	for opensbi@lists.infradead.org;
	Tue, 20 May 2025 04:28:40 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-86135d11760so427213039f.2
        for <opensbi@lists.infradead.org>; Mon, 19 May 2025 21:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1747715318; x=1748320118; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i/AUY79zKde1u0OZE2+8AfYmvoGDgrjMDIljI/q0xyM=;
        b=zWy4sBjQAVOzHrVbUZ2P2Mp0u73HKFKTMBc9k++8iNZEWP6ewsffrV0SY4Aj8R2+IF
         6naJNfKakUKnjIWH2CIk5n8TVbcDr5hBiV94rrqJqYgN2m5yTs9Ufm2VQyqQK0gbA4M4
         FiPd9Z/3GcTDxkENt7JEOxiv4N8F+2O60bX5PXjGU8TlDob+YHQNJE5vRfgppEPAX5eI
         0N12CXUckAliGHE3TKs5IMvpEwdrRGM5/FfBWHThp1E6g7+pfgbjcPkUFccBzvioAFle
         FR0uUvsapXeN6eGUvkqd2iBVLYAwmHBhNWT+jrRYhuCgo3+AKRdGhMGn0hj40TxUjknS
         FQCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747715318; x=1748320118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i/AUY79zKde1u0OZE2+8AfYmvoGDgrjMDIljI/q0xyM=;
        b=efDe059oY8VIJid+oRh0MxQBl3L5Ym4HqtXcKpidajdpYxY5EO4DJxkDFEV3jGP8QA
         8/8Bdj9LsmoNLD395uAQhy5DxgeEREBfSSPmfMFWENxungqZ9CgGj391AwQKnWfoyc0v
         fN0RFbqwf2Ae9O3NQ6Sy40m/2uVDnu5zUa89SDHGPuYQtIR5GFOs3HPrIT/srrK3Mf0M
         XHHk5ZO2FhGSImx0ZHnDBiqwUKSS8lq+uZXbULaBkM8HGi1xOunovLhlfioUekpvVbDB
         certBXCHOFW/3y1wrrCZSXopMF6AMqBGU6GcSIbId5O2bARKzMonJwGL2qFVuTFbsKKe
         F7XA==
X-Gm-Message-State: AOJu0Yx82A6W+TNEawBLhA2PfjI4NKB3sCyNwNCCzNyBhwlcq4vz84se
	h8olrNSx+srK9aJKRaGNfxNv0ZGVyJ/xgRl4yopSgOMVh0gphCKwQp+NjipqIoQpKPr+M/Y89eL
	qKHD29k8UfLLxy21H+CL0IrbMU2rvzmK4O8F1a9AOLg==
X-Gm-Gg: ASbGncuMRIyeQ18DF2KHYJal4HCSV9yr4+IyzMc76G7RTh3Khtq8CuDPvjiGNyGL+N+
	VngWue0ojg+8Kpfijy9FqnoEWl8yYYaVe7FKMgg1EcZd3NuF8p08E6n3pECT+dP0KRuiLWUA2hG
	S33LxRlQiJs46tZex6SSvfmYkrOJ/oQLOwrA==
X-Google-Smtp-Source: AGHT+IHhiXVsheYTDHHS3dBzkd0EycjbHDrIrbW7rS1iC3ROtrDtJEyLlAraXeZ6fDkUSOj1iIdTAqtPulel4UQoMHA=
X-Received: by 2002:a05:6602:6a8a:b0:85b:5494:5519 with SMTP id
 ca18e2360f4ac-86a231b453bmr1937006239f.5.1747715318593; Mon, 19 May 2025
 21:28:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250428093646.2352928-1-nylon.chen@sifive.com>
In-Reply-To: <20250428093646.2352928-1-nylon.chen@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 20 May 2025 09:58:27 +0530
X-Gm-Features: AX0GCFtczcV_oZ3DlxbKHMDCZPdhCvr1ZUtOK4MgIrQ34x3BDZWE0X9PfuyKzT8
Message-ID: <CAAhSdy1TecJVrRPSjytjNwmik51N6G4m9cDby1=1iuyfXO7O0A@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: Add Smrnmi extension detection
To: Nylon Chen <nylon.chen@sifive.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com, yongxuan.wang@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_212839_758601_207C817C 
X-CRM114-Status: GOOD (  23.89  )
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

T24gTW9uLCBBcHIgMjgsIDIwMjUgYXQgMzoxMOKAr1BNIE55bG9uIENoZW4gPG55bG9uLmNoZW5A
c2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiBUaGUgY29tbWl0IGFkZHMgZGV0ZWN0aW9uIGFuZCBpbml0
aWFsaXphdGlvbiBvZiB0aGUgU21ybm1pCj4gZXh0ZW5zaW9uIGluIHRoZSBTQkkgaGFydCBpbml0
aWFsaXphdGlvbiBjb2RlLgo+Cj4gSWYgdGhlIGV4dGVuc2lvbiBpcyBkZXRlY3RlZCwKPiBpdCBz
ZXRzIHRoZSBOTUlFIGJpdCBpbiB0aGUgbW5zdGF0dXMgQ1NSIHRvIGVuYWJsZSBSTk1JcyBvdXQg
b2YgcmVzZXQuCj4KPiBDby1kZXZlbG9wZWQtYnk6IFpvbmcgTGkgPHpvbmcubGlAc2lmaXZlLmNv
bT4KPiBTaWduZWQtb2ZmLWJ5OiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+Cj4gU2lnbmVk
LW9mZi1ieTogTnlsb24gQ2hlbiA8bnlsb24uY2hlbkBzaWZpdmUuY29tPgo+IFNpZ25lZC1vZmYt
Ynk6IFlvbmctWHVhbiBXYW5nIDx5b25neHVhbi53YW5nQHNpZml2ZS5jb20+Cj4gLS0tCj4gIGlu
Y2x1ZGUvc2JpL3Jpc2N2X2VuY29kaW5nLmggfCAxMCArKysrKysrKysrCj4gIGluY2x1ZGUvc2Jp
L3NiaV9oYXJ0LmggICAgICAgfCAgMiArKwo+ICBsaWIvc2JpL3NiaV9oYXJ0LmMgICAgICAgICAg
IHwgIDYgKysrKysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKQo+Cj4gZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3Jpc2N2X2VuY29kaW5nLmggYi9pbmNsdWRlL3NiaS9yaXNj
dl9lbmNvZGluZy5oCj4gaW5kZXggMjA4Mjc4My4uOTMyMjhjZSAxMDA2NDQKPiAtLS0gYS9pbmNs
dWRlL3NiaS9yaXNjdl9lbmNvZGluZy5oCj4gKysrIGIvaW5jbHVkZS9zYmkvcmlzY3ZfZW5jb2Rp
bmcuaAo+IEBAIC0yMTUsNiArMjE1LDEwIEBACj4KPiAgI2VuZGlmCj4KPiArI2RlZmluZSBNTlNU
QVRVU19OTUlFICAgICAgICAgICAgICAgICAgKF9VTCgweDgpKQo+ICsjZGVmaW5lIE1OU1RBVFVT
X01OUFYgICAgICAgICAgICAgICAgICAoX1VMKDB4ODApKQo+ICsjZGVmaW5lIE1OU1RBVFVTX01O
UFAgICAgICAgICAgICAgICAgICAoX1VMKDB4MTgwMCkpCj4gKwo+ICAjZGVmaW5lIE1IUE1FVkVO
VF9TU0NPRl9NQVNLICAgICAgICAgICBfVUxMKDB4RkYwMDAwMDAwMDAwMDAwMCkKPgo+ICAjZGVm
aW5lIEVOVkNGR19TVENFICAgICAgICAgICAgICAgICAgICAoX1VMTCgxKSA8PCA2MykKPiBAQCAt
NzcwLDYgKzc3NCwxMiBAQAo+ICAjZGVmaW5lIENTUl9NU1RBVEVFTjMgICAgICAgICAgICAgICAg
ICAweDMwRgo+ICAjZGVmaW5lIENTUl9NU1RBVEVFTjNIICAgICAgICAgICAgICAgICAweDMxRgo+
Cj4gKy8qIFNtcm5taSBleHRlbnNpb24gcmVnaXN0ZXJzICovCj4gKyNkZWZpbmUgQ1NSX01OU0NS
QVRDSCAgICAgICAgICAgICAgICAgIDB4NzQwCj4gKyNkZWZpbmUgQ1NSX01ORVBDICAgICAgICAg
ICAgICAgICAgICAgIDB4NzQxCj4gKyNkZWZpbmUgQ1NSX01OQ0FVU0UgICAgICAgICAgICAgICAg
ICAgIDB4NzQyCj4gKyNkZWZpbmUgQ1NSX01OU1RBVFVTICAgICAgICAgICAgICAgICAgIDB4NzQ0
Cj4gKwo+ICAvKiBNYWNoaW5lLUxldmVsIEhpZ2gtSGFsZiBDU1JzIChBSUEpICovCj4gICNkZWZp
bmUgQ1NSX01JREVMRUdIICAgICAgICAgICAgICAgICAgIDB4MzEzCj4gICNkZWZpbmUgQ1NSX01J
RUggICAgICAgICAgICAgICAgICAgICAgIDB4MzE0Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2Jp
L3NiaV9oYXJ0LmggYi9pbmNsdWRlL3NiaS9zYmlfaGFydC5oCj4gaW5kZXggYzNhN2ZlYi4uMDdj
YmVhZCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3NiaS9zYmlfaGFydC5oCj4gKysrIGIvaW5jbHVk
ZS9zYmkvc2JpX2hhcnQuaAo+IEBAIC03OSw2ICs3OSw4IEBAIGVudW0gc2JpX2hhcnRfZXh0ZW5z
aW9ucyB7Cj4gICAgICAgICBTQklfSEFSVF9FWFRfU01DVFIsCj4gICAgICAgICAvKiogSEFSVCBo
YXMgQ1RSIFMtbW9kZSBDU1JzICovCj4gICAgICAgICBTQklfSEFSVF9FWFRfU1NDVFIsCj4gKyAg
ICAgICAvKiogSEFSVCBoYXMgU21ybm1pIGV4dGVuc2lvbiAqLwo+ICsgICAgICAgU0JJX0hBUlRf
RVhUX1NNUk5NSSwKPgo+ICAgICAgICAgLyoqIE1heGltdW0gaW5kZXggb2YgSGFydCBleHRlbnNp
b24gKi8KPiAgICAgICAgIFNCSV9IQVJUX0VYVF9NQVgsCj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkv
c2JpX2hhcnQuYyBiL2xpYi9zYmkvc2JpX2hhcnQuYwo+IGluZGV4IGVlZmIwM2YuLjY2ZDVkMDIg
MTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfaGFydC5jCj4gKysrIGIvbGliL3NiaS9zYmlfaGFy
dC5jCj4gQEAgLTY1LDYgKzY1LDExIEBAIHN0YXRpYyB2b2lkIG1zdGF0dXNfaW5pdChzdHJ1Y3Qg
c2JpX3NjcmF0Y2ggKnNjcmF0Y2gpCj4gICAgICAgICAvKiBBbGwgcHJvZ3JhbW1hYmxlIGNvdW50
ZXJzIHdpbGwgc3RhcnQgcnVubmluZyBhdCBydW50aW1lIGFmdGVyIFMtbW9kZSByZXF1ZXN0ICov
Cj4gICAgICAgICBpZiAoc2JpX2hhcnRfcHJpdl92ZXJzaW9uKHNjcmF0Y2gpID49IFNCSV9IQVJU
X1BSSVZfVkVSXzFfMTEpCj4gICAgICAgICAgICAgICAgIGNzcl93cml0ZShDU1JfTUNPVU5USU5I
SUJJVCwgMHhGRkZGRkZGOCk7Cj4gKyAgICAgICAvKiBEZXRlY3QgUmVzdW1hYmxlIE5vbi1NYXNr
YWJsZSBJbnRlcnJ1cHRzCj4gKyAgICAgICAgKiBJZiBpdCBleGlzdHMgd2UgbXVzdCBlbmFibGUg
aXQgYmVmb3JlIGFsbCB0cmFwcy4KPiArICAgICAgICAqLwo+ICsgICAgICAgaWYgKHNiaV9oYXJ0
X2hhc19leHRlbnNpb24oc2NyYXRjaCwgU0JJX0hBUlRfRVhUX1NNUk5NSSkpCj4gKyAgICAgICAg
ICAgICAgIGNzcl9zZXQoQ1NSX01OU1RBVFVTLCBNTlNUQVRVU19OTUlFKTsKCldlIGNhbid0IGJs
aW5keSBlbmFibGUgbm9uLW1hc2thYmxlIGludGVycnVwdHMgd2l0aG91dCBhbnkKTk1JIGhhbmRs
ZXIgaW4gT3BlblNCSS4KClRoaXMgcGF0Y2ggbmVlZHMgdG8gYmUgY29udmVydGVkIGludG8gYSBz
ZXJpZXMgd2l0aAphdCBsZWFzdCBmb2xsb3dpbmcgcGF0Y2hlczoKUEFUQ0gxOiBBZGQgU21ybm1p
IGV4dGVuc2lvbiBkZXRlY3Rpb24gKHRoaXMgcGF0Y2ggd2l0aG91dCB0aGUKbXN0YXR1c19pbml0
KCkgY2hhbmdlKQpQQVRDSDI6IEFkZCBjb21tb24gTk1JIHRyYXAgaGFuZGxlciBpbiBmd19iYXNl
LlMKUEFUQ0gzOiBFbmFibGUgTk1JIGhhbmRsaW5nICh0aGUgbXN0YXR1c19pbml0KCkgY2hhbmdl
IGZyb20gdGhpcyBwYXRjaApwbHVzIHNldCB0aGUgY29tbW9uIE5NSSB0cmFwIGhhbmRsZXIgaW4g
cGxhdGZvcm0gc3BlY2lmaWMgd2F5KQoKUmVnYXJkcywKQW51cAoKPgo+ICAgICAgICAgLyoqCj4g
ICAgICAgICAgKiBUaGUgbWhwbWV2ZW50bltoXSBDU1Igc2hvdWxkIGJlIGluaXRpYWxpemVkIHdp
dGggaW50ZXJydXB0IGRpc2FibGVkCj4gQEAgLTY5NSw2ICs3MDAsNyBAQCBjb25zdCBzdHJ1Y3Qg
c2JpX2hhcnRfZXh0X2RhdGEgc2JpX2hhcnRfZXh0W10gPSB7Cj4gICAgICAgICBfX1NCSV9IQVJU
X0VYVF9EQVRBKHNzZGJsdHJwLCBTQklfSEFSVF9FWFRfU1NEQkxUUlApLAo+ICAgICAgICAgX19T
QklfSEFSVF9FWFRfREFUQShzbWN0ciwgU0JJX0hBUlRfRVhUX1NNQ1RSKSwKPiAgICAgICAgIF9f
U0JJX0hBUlRfRVhUX0RBVEEoc3NjdHIsIFNCSV9IQVJUX0VYVF9TU0NUUiksCj4gKyAgICAgICBf
X1NCSV9IQVJUX0VYVF9EQVRBKHNtcm5taSwgU0JJX0hBUlRfRVhUX1NNUk5NSSksCj4gIH07Cj4K
PiAgX1N0YXRpY19hc3NlcnQoU0JJX0hBUlRfRVhUX01BWCA9PSBhcnJheV9zaXplKHNiaV9oYXJ0
X2V4dCksCj4gLS0KPiAyLjM5LjMKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9w
ZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL29wZW5zYmkK
