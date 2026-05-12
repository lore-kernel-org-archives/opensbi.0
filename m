Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9241ACD4F26
	for <opensbi@archiver.kernel.org>; Tue, 12 May 2026 08:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=frk0ZJB7OYpwvdxZ9irlDZGRqFAVUxn/vN0XrpQBugk=; b=s/os1abqyj5A+Y
	xTT1u8o+xoc1Te3xCwn82aZKg8uT3eANIaeF0VHUL10sfcKwvTNaYSmicuWwka7EbBPWhK665kGih
	LCokG8kQLcPzyNNm929xUjJDgmkuSSgXvqjPwBLoKYjfsXITHTxjahEObC6AVg1qV+eQSstvGGrQK
	BwqvZnXOosygppDDxdHAGyBjJeAsQcSgz8Ol/2UakvqJDCz79KtrAgkt6hRrBG1DOlD8yXNIarvOU
	mcvbOG9EZxK/rv1w+3ueoMOJrgxgS+jvkUebRr5inEoyhuxRDpKnYDAA2Q/XCtHmGrtcuihAHEmL3
	5Ri2fXkbrqB6FldaYROA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMiQd-0000000G4g5-3Lep;
	Tue, 12 May 2026 08:25:23 +0000
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMiQb-0000000G4ey-00C0
	for opensbi@lists.infradead.org;
	Tue, 12 May 2026 08:25:22 +0000
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-94ac8cbf3feso3167967241.0
        for <opensbi@lists.infradead.org>; Tue, 12 May 2026 01:25:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778574319; cv=none;
        d=google.com; s=arc-20240605;
        b=G6TdOOdkEYgzaxQ96aT7H4F/H7EOKdU8KfNW0OpM8YZ9dpVdMCtRlK8GjOvusVkcFF
         QI/U1RDnAE3Tr5U03jEhSwVXUHuxxmXlLXjqFa0NWsUdY2VTPZYULXTrsFN4/FmIiapl
         aIMz0K3m0DUXscy5T4j6eZvLnxH1gtBL6XNKCMFiQ5yC3QbNAGo75KGMqXjaa+zPLrhK
         P0TRk+31k9vf1MJC+qLOtsefyjuWoWOK+Td94VtNc6oB+cZhAYejsTmPEjtzgY6PpMEG
         ZMmzPSKDDbeaF2ELhQmRMdl6RNOTn7Kd62h7RZrXzuS+AfSHDXvCwyNmDY/rOAWnkaUe
         g73w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=awbziQODklWJPD8YKb1BEFuPSn63vaOCsRBfPeozrXg=;
        fh=KoDjsNmVCIeAq/rgqT5uJR8rVslUbpjcGkSYx9lccvE=;
        b=JSbiZ2fnwl56zmiL4oVVf8R+tmOp6SArG1qXe6a8T9J16jSnGOg9Hh9hISNHcf042u
         5uO0iTsQJ0SvY7VeBDN2xBXR/6lMG4CvOWjLWtOe58fwGPa2qk0YmQPZ+NLElVGNgvRy
         ZJaDhJHUnJ6swfH/2IVzqbW5Xg8IPCpSVZJ+lDGlWkh/GyK28m3MtwPUyBaVrWsjDCsG
         Rh6Q2/+DQul3OUbPRfyQhdl1iDFsBOOIwGI8NNby/jRFJS7I+Btj3jbjUQlsChVIBuaw
         +DaoAVK3wRpgev9wpbh6vUaZ5ccrfGD6vaUKWfEot2ziNg2ablfnCsBuQWYxtydgLqHU
         m86w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1778574319; x=1779179119; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=awbziQODklWJPD8YKb1BEFuPSn63vaOCsRBfPeozrXg=;
        b=hY9/SBkcEAeSj/J3ZFNxcrLy/eMsVpxeX7qnBQbCevjX0M9cVmLhZvSatXNODP+I1/
         Jmvh3LAJ9OkBr8Y8dd+S7hbIxCgKcl1qE1vonP2Vp30v8ooFMDTIl8xPnvmDuAY8gx3r
         YJtGnd/4JNyx9W5HYngUrXCUCtc+olWQNUMUzxSqI9DjY5wE0vt4IH6NszhIB5TIwuDY
         O1zzMISSimMrWA29EtZmOAoEFhtJYAJMir3yu31T8h7fK7Vsi+irF8VJio8q9J0FWiNk
         1NzMSV7ByPAfg1VyADAR1wUi8x1bvvd0rNWVQYuLIdiHp4dlpcdp2kI9caB3A/GpZrxT
         1k9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778574319; x=1779179119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=awbziQODklWJPD8YKb1BEFuPSn63vaOCsRBfPeozrXg=;
        b=eK4a6ZVqLeeQzA5OkZeoIbKISGlImWtK0rO5T334C2H/uojgccp4JRIY55q2XuCUQv
         l2Y1KHlAlh42X7mp6rGg1fhSFsUfxRx1NT5FYdwEjH42FkSKSiVkVl4UzbIoc5qdWOqE
         lJSP1L/ST7HD0fscAdsuNhpYZ/VoY1RJDhzzqo544CcNFihmUSRS9wkAtWEQQ6jrbVql
         6rCz6R6E8ZC0GfNe64zsbhHi3AE9kx9hwsvMLZPbQfyKICDBu914GdF2yM64N0Z9m9lx
         OmFrPNnwa8Lval+ZPnQNS9vRtD4kcdoNNQyOOEBC3ExfpbHqSR7F7z++qKsWG7De1PoF
         sBmQ==
X-Forwarded-Encrypted: i=1; AFNElJ+HChlIguYireyYlcWE9fvyX2DIwoizq9k8ebHXFYBT0XRo5SJk7g+gaU4kP1iRYOuJxTYp+M43@lists.infradead.org
X-Gm-Message-State: AOJu0YzvdSrU/HSp6cFu8TRWEc9oPcDD6BYFT0dkbtQiAINFdPM0mUNB
	SpYMfHGrQ0iQhwTk3Po31G09ABJaJ3nKgplMpUrUCcFdaF+wl5C8MxMuudiUrosVBVrgqObVOgk
	eQ9dAuOQ9kacOiCqn1OqkLi6HvGVznJD0cVk/3AzIWw==
X-Gm-Gg: Acq92OFeBxUBY4hLxVCAJHmP6Jziluv90nludQ2Qynh9fBSGK2o8diCAswewq5jjXoo
	NAhB/Yr6iB1pXRVgp6MB2VDdNcIDdhrnKukx53XiFoqDRCX+Kt1rkwTFk/OH3Hv1Jiqnzer4OH1
	iHc/xgJqIpNz41eR9dwDusNA3mkLRse/ZiLK0DtHqmmKXIkJjoapyX9+MofnOeY1DQX1idkGtMD
	9EsatYdnQLGA1FbecaKD6/I3GwR/0YPVzlgSshq/TW4/GvPANYuklMuwRJhvxPJfqtZGjfFJyKc
	3xnGyRleA54X+E1w2Rfd
X-Received: by 2002:a05:6102:2ad2:b0:605:5d09:8631 with SMTP id
 ada2fe7eead31-630f908d3e1mr14622468137.29.1778574319485; Tue, 12 May 2026
 01:25:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1778176768.git.evvoevod@tenstorrent.com>
 <88b1470e1e3348d454b4b995a11a85c01914f7af.1778176768.git.evvoevod@tenstorrent.com>
 <CAAhSdy3Pm5ESW17pz5wZxrbB5hoTHVBz_rQWo9voa6s+gxi7Pw@mail.gmail.com>
 <CAHh=Yk9PUdCc3kbBWxmaEOOG1WauvYXctFdrQhvM-=NbWr_DCg@mail.gmail.com> <CAAhSdy0TLbpLmfO_LPLn0cPqs-gD0EzvbYEaUvHpZuv_NYQXRQ@mail.gmail.com>
In-Reply-To: <CAAhSdy0TLbpLmfO_LPLn0cPqs-gD0EzvbYEaUvHpZuv_NYQXRQ@mail.gmail.com>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Tue, 12 May 2026 16:25:08 +0800
X-Gm-Features: AVHnY4J9mK8YxawK10qIjp6xeoMCITpyMDm1ZsHM7vUEE2W0T8yIw2ftIhWzNfQ
Message-ID: <CAHh=Yk_Sbd1MEH8tVshAOFQptEVKm0QZv+D7bJwMC80qvarVew@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] lib: sbi: hart: Detect and enable Smrnmi before
 trap-based feature detection
To: Anup Patel <anup@brainfault.org>
Cc: Evgeny Voevodin <evvoevod@tenstorrent.com>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_012521_057759_5CAF9E8B 
X-CRM114-Status: GOOD (  41.87  )
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

QW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4g5pa8IDIwMjblubQ15pyIMTLml6XpgLHk
uowg5LiL5Y2IMzo1OeWvq+mBk++8mgo+Cj4gT24gVHVlLCBNYXkgMTIsIDIwMjYgYXQgMTI6MTTi
gK9QTSBOeWxvbiBDaGVuIDxueWxvbi5jaGVuQHNpZml2ZS5jb20+IHdyb3RlOgo+ID4KPiA+IEFu
dXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+IOaWvCAyMDI25bm0NeaciDnml6XpgLHlha0g
5LiL5Y2IMjo1MeWvq+mBk++8mgo+ID4KPiA+ID4KPiA+ID4gT24gVGh1LCBNYXkgNywgMjAyNiBh
dCAxMTozOOKAr1BNIEV2Z2VueSBWb2V2b2Rpbgo+ID4gPiA8ZXZ2b2V2b2RAdGVuc3RvcnJlbnQu
Y29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IFRoZSBsb2NhdGlvbiBvZiB0aGUgUk5NSS9FIHRy
YXAgdmVjdG9ycyBpbiB0aGUgU21ybm1pIGV4dGVuc2lvbiBpcwo+ID4gPiA+IGltcGxlbWVudGF0
aW9uLWRlZmluZWQsIHNvIHBsYXRmb3JtcyB3aXRoIHZlbmRvci1zcGVjaWZpYyBOTUkgdmVjdG9y
Cj4gPiA+ID4gbWVjaGFuaXNtcyBtdXN0IGluc3RhbGwgdGhlIGZpcm13YXJlJ3MgTk1JIGVudHJ5
IHBvaW50cyB0aGVtc2VsdmVzLgo+ID4gPiA+Cj4gPiA+ID4gQWRkIGFuIHNtcm5taV9oYW5kbGVy
c19pbml0KCkgY2FsbGJhY2sgdG8gc2JpX3BsYXRmb3JtX29wZXJhdGlvbnMgdGhhdAo+ID4gPiA+
IHJlY2VpdmVzIHRoZSBmaXJtd2FyZSBlbnRyeSBwb2ludHMgYW5kIGxldHMgcGxhdGZvcm0gY29k
ZSBpbnN0YWxsIHRoZW0KPiA+ID4gPiBhdCB0aGUgaGFyZHdhcmUtc3BlY2lmaWMgdmVjdG9yIGxv
Y2F0aW9ucy4gVHdvIHBvaW50ZXJzIGFyZSBwYXNzZWQ6Cj4gPiA+ID4KPiA+ID4gPiAgIC0gX3Ry
YXBfcm5taV9oYW5kbGVyOiB0aGUgZGVkaWNhdGVkIFJOTUkgZW50cnkgcG9pbnQgdGhhdCBzYXZl
cwo+ID4gPiA+ICAgICBjb250ZXh0IHVzaW5nIHRoZSBTbXJubWkgTU4qIENTUnMgYW5kIHJldHVy
bnMgdmlhIG1ucmV0Lgo+ID4gPiA+ICAgLSBfdHJhcF9oYW5kbGVyOiB0aGUgcmVndWxhciBNLW1v
ZGUgdHJhcCBlbnRyeSBzaW5jZSBSTk1FIGlzIHRha2VuCj4gPiA+ID4gICAgIGFzIGEgcmVndWxh
ciBNLW1vZGUgdHJhcCB3aXRoIE5NSUU9MC4KPiA+ID4gPgo+ID4gPiA+IFdoZW4gU21ybm1pIGlz
IHByZXNlbnQsIGluc3RhbGwgdGhlIHBsYXRmb3JtJ3MgTk1JIHZlY3RvcnMgdmlhIHRoZSBuZXcK
PiA+ID4gPiBjYWxsYmFjaywgaW5pdGlhbGl6ZSBNTlNDUkFUQ0ggd2l0aCB0aGUgcGVyLWhhcnQg
c2NyYXRjaCBwb2ludGVyLCBhbmQKPiA+ID4gPiBzZXQgTU5TVEFUVVMuTk1JRS4KPiA+ID4gPgo+
ID4gPiA+IFNtcm5taS1lbmFibGVkIHBsYXRmb3JtcyBtdXN0IHJlZ2lzdGVyIHNtcm5taV9oYW5k
bGVyc19pbml0OyBpZiB0aGUKPiA+ID4gPiBleHRlbnNpb24gaXMgZGV0ZWN0ZWQgYnV0IG5vIGNh
bGxiYWNrIGlzIHJlZ2lzdGVyZWQsIHNiaV9wYW5pYygpIGlzCj4gPiA+ID4gY2FsbGVkIHNpbmNl
IGVuYWJsaW5nIE5NSXMgd2l0aG91dCBoYW5kbGVycyBpbiBwbGFjZSB3b3VsZCByb3V0ZQo+ID4g
PiA+IHN1YnNlcXVlbnQgdHJhcHMgaW50byBub3doZXJlLgo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVk
LW9mZi1ieTogRXZnZW55IFZvZXZvZGluIDxldnZvZXZvZEB0ZW5zdG9ycmVudC5jb20+Cj4gPiA+
Cj4gPiA+IExHVE0uCj4gPiA+Cj4gPiA+IFJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJy
YWluZmF1bHQub3JnPgo+ID4gPgo+ID4gPiBSZWdhcmRzLAo+ID4gPiBBbnVwCj4gPiA+Cj4gPiA+
ID4gLS0tCj4gPiA+ID4gIGluY2x1ZGUvc2JpL3NiaV9wbGF0Zm9ybS5oIHwgIDQgKysrKwo+ID4g
PiA+ICBsaWIvc2JpL3NiaV9oYXJ0LmMgICAgICAgICB8IDIwICsrKysrKysrKysrKysrKysrKysr
Cj4gPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKQo+ID4gPiA+Cj4gPiA+
ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3NiaV9wbGF0Zm9ybS5oIGIvaW5jbHVkZS9zYmkv
c2JpX3BsYXRmb3JtLmgKPiA+ID4gPiBpbmRleCA3MTVkZjQ5OS4uZmUzODJiNTYgMTAwNjQ0Cj4g
PiA+ID4gLS0tIGEvaW5jbHVkZS9zYmkvc2JpX3BsYXRmb3JtLmgKPiA+ID4gPiArKysgYi9pbmNs
dWRlL3NiaS9zYmlfcGxhdGZvcm0uaAo+ID4gPiA+IEBAIC0xNTAsNiArMTUwLDEwIEBAIHN0cnVj
dCBzYmlfcGxhdGZvcm1fb3BlcmF0aW9ucyB7Cj4gPiA+ID4gICAgICAgICAvKiogcGxhdGZvcm0g
c3BlY2lmaWMgcG1wIGRpc2FibGUgb24gY3VycmVudCBIQVJUICovCj4gPiA+ID4gICAgICAgICB2
b2lkICgqcG1wX2Rpc2FibGUpKHVuc2lnbmVkIGludCBuKTsKPiA+ID4gPgo+ID4gPiA+ICsgICAg
ICAgLyoqIHBsYXRmb3JtIHNwZWNpZmljIFNtcm5taSBoYW5kbGVycyBpbml0IG9uIGN1cnJlbnQg
SEFSVCAqLwo+ID4gPiA+ICsgICAgICAgdm9pZCAoKnNtcm5taV9oYW5kbGVyc19pbml0KSh2b2lk
ICgqcm5taV9oYW5kbGVyKSh2b2lkKSwKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICB2
b2lkICgqcm5tZV9oYW5kbGVyKSh2b2lkKSk7Cj4gPiA+ID4gKwo+ID4gPiA+ICAgICAgICAgLyoq
IHBsYXRmb3JtIHNwZWNpZmljIFNtcm5taSBOTUkgaGFuZGxlci4KPiA+ID4gPiAgICAgICAgICAq
ICBSZXR1cm5zIFNCSV9TVUNDRVNTIG9uIHN1Y2Nlc3MsIGVycm9yIGNvZGUgaWYgTk1JIGNhbm5v
dCBiZSBoYW5kbGVkLiAqLwo+ID4gPiA+ICAgICAgICAgaW50ICgqcm5taV9oYW5kbGVyKShzdHJ1
Y3Qgc2JpX3RyYXBfY29udGV4dCAqdGNudHgpOwo+ID4gPiA+IGRpZmYgLS1naXQgYS9saWIvc2Jp
L3NiaV9oYXJ0LmMgYi9saWIvc2JpL3NiaV9oYXJ0LmMKPiA+ID4gPiBpbmRleCA3ODExNjFlNS4u
OTJjNjAyYWEgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvbGliL3NiaS9zYmlfaGFydC5jCj4gPiA+ID4g
KysrIGIvbGliL3NiaS9zYmlfaGFydC5jCj4gPiA+ID4gQEAgLTUzMiw2ICs1MzIsMjYgQEAgc3Rh
dGljIGludCBoYXJ0X2RldGVjdF9mZWF0dXJlcyhzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gp
Cj4gPiA+ID4gICAgICAgICBpZiAocmMpCj4gPiA+ID4gICAgICAgICAgICAgICAgIHJldHVybiBy
YzsKPiA+ID4gPgo+ID4gPiA+ICsgICAgICAgaWYgKHNiaV9oYXJ0X2hhc19leHRlbnNpb24oc2Ny
YXRjaCwgU0JJX0hBUlRfRVhUX1NNUk5NSSkpIHsKPiA+ID4gPiArICAgICAgICAgICAgICAgY29u
c3Qgc3RydWN0IHNiaV9wbGF0Zm9ybSAqcGxhdCA9IHNiaV9wbGF0Zm9ybV90aGlzaGFydF9wdHIo
KTsKPiA+ID4gPiArICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IHNiaV9wbGF0Zm9ybV9vcGVy
YXRpb25zICpvcHMgPSBzYmlfcGxhdGZvcm1fb3BzKHBsYXQpOwo+ID4gPiA+ICsgICAgICAgICAg
ICAgICBleHRlcm4gdm9pZCBfdHJhcF9ybm1pX2hhbmRsZXIodm9pZCk7Cj4gPiA+ID4gKyAgICAg
ICAgICAgICAgIGV4dGVybiB2b2lkIF90cmFwX2hhbmRsZXIodm9pZCk7Cj4gPiA+ID4gKwo+ID4g
PiA+ICsgICAgICAgICAgICAgICBpZiAoIW9wcyB8fCAhb3BzLT5zbXJubWlfaGFuZGxlcnNfaW5p
dCkKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBzYmlfcGFuaWMoIlNtcm5taSBkZXRl
Y3RlZCwgYnV0IHBsYXRmb3JtIGxhY2tzIHNtcm5taV9oYW5kbGVyc19pbml0IGNhbGxiYWNrXG4i
KTsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgICAgICAgICAgIC8qIFJldXNlIF90cmFwX2hhbmRs
ZXIgZm9yIHRoZSBSTk1FIHNsb3Qgc2luY2UgUk5NRSBpcyB0YWtlbgo+ID4gPiA+ICsgICAgICAg
ICAgICAgICAgKiBhcyBhIHJlZ3VsYXIgTS1tb2RlIHRyYXAgd2l0aCBOTUlFPTAuICovCj4gPiA+
ID4gKyAgICAgICAgICAgICAgIG9wcy0+c21ybm1pX2hhbmRsZXJzX2luaXQoX3RyYXBfcm5taV9o
YW5kbGVyLCBfdHJhcF9oYW5kbGVyKTsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgICAgICAgICAg
IC8qIEluaXRpYWxpemUgTU5TQ1JBVENIIGZvciB0aGUgUk5NSSBoYW5kbGVyICovCj4gPiA+ID4g
KyAgICAgICAgICAgICAgIGNzcl93cml0ZShDU1JfTU5TQ1JBVENILCBzY3JhdGNoKTsKPiA+ID4g
PiArCj4gPiA+ID4gKyAgICAgICAgICAgICAgIC8qIEVuYWJsZSBOTUlzICovCj4gPiA+ID4gKyAg
ICAgICAgICAgICAgIGNzcl9zZXQoQ1NSX01OU1RBVFVTLCBNTlNUQVRVU19OTUlFKTsKPiA+IFR3
byBjb25jZXJucyBhYm91dCB0aGlzIGJsb2NrCj4gPgo+ID4gRmlyc3QsIHNiaV9wYW5pYygpIHdo
ZW4gc21ybm1pX2hhbmRsZXJzX2luaXQgaXMgTlVMTCBpcyB0b28gc3RyaWN0Lgo+ID4gTm90IGFs
bCBwbGF0Zm9ybXMgd2l0aCBTbXJubWkgbmVlZCB0byBwcm9ncmFtIGEgdmVuZG9yLXNwZWNpZmlj
IE5NSQo+ID4gdmVjdG9yIHJlZ2lzdGVyLgo+ID4gU29tZSBpbXBsZW1lbnRhdGlvbnMgaGF2ZSBh
IGZpeGVkIE5NSSB2ZWN0b3IgYWRkcmVzcyBvciByb3V0ZSBOTUlzCj4gPiB0aHJvdWdoIG10dmVj
IGJ5IGRlZmF1bHQ7IGZvciB0aGVzZSwgc2V0dGluZyBNTlNDUkFUQ0ggYW5kIE5NSUUgaXMKPiA+
IHN1ZmZpY2llbnQgYW5kIG5vIHBsYXRmb3JtIGNhbGxiYWNrIGlzIG5lZWRlZC4KPiA+Cj4gPiBU
aGlzIGNhbiBiZSByZXByb2R1Y2VkIHdpdGggUUVNVSB2aXJ0Ogo+ID4KPiA+IHFlbXUtc3lzdGVt
LXJpc2N2NjQgLU0gdmlydCAtY3B1IHJ2NjQsc21ybm1pPW9uIC1tIDI1Nm0gXAo+ID4gICAgICAg
LWJpb3MgZndfanVtcC5iaW4gLW5vZ3JhcGhpYyAtbm8tcmVib290Cj4gPgo+ID4gVGhlIGZpcm13
YXJlIGhhbmdzIHdpdGggemVybyBvdXRwdXQuIFRoZSBwYW5pYyBmaXJlcyBiZWZvcmUKPiA+IHNi
aV9wbGF0Zm9ybV9lYXJseV9pbml0KCkgc28gdGhlIGNvbnNvbGUgaXMgbm90IHlldCBpbml0aWFs
aXplZCBhbmQKPiA+IHRoZSBtZXNzYWdlIGlzIHNpbGVudGx5IGRyb3BwZWQuCj4gPgo+ID4gQWRk
aW5nIGEgbm8tb3Agc3R1YiB0byB0aGUgZ2VuZXJpYyBwbGF0Zm9ybSBjb25maXJtcyB0aGUgcGFu
aWMgaXMgIHRoZQo+ID4gc29sZSBjYXVzZSAtLSBib290IHByb2NlZWRzIG5vcm1hbGx5IHdpdGgg
dGhlIHN0dWIgaW4gcGxhY2UuCj4gPgo+ID4gU2Vjb25kLCB0aGUgY2FsbGJhY2sgcmV0dXJucyB2
b2lkLCBzbyB0aGVyZSBpcyBubyB3YXkgdG8gZGV0ZWN0Cj4gPiB3aGV0aGVyIHRoZSBwbGF0Zm9y
bSBzdWNjZWVkZWQgaW4gcHJvZ3JhbW1pbmcgdGhlIE5NSSB2ZWN0b3IuCj4gPiBjc3Jfc2V0KE1O
U1RBVFVTLCBOTUlFKSB0aGVuIHJ1bnMgdW5jb25kaXRpb25hbGx5Lgo+ID4gSWYgdGhlIGNhbGxi
YWNrIGZhaWxzIHNpbGVudGx5LCBOTUlzIGFyZSBlbmFibGVkIGJ1dCB0aGUgaGFyZHdhcmUKPiA+
IHZlY3RvciByZWdpc3RlciBpcyBsZWZ0IGF0IGl0cyByZXNldCB2YWx1ZS4gVGhlIGZpcnN0IE5N
SSB3b3VsZCBqdW1wCj4gPiB0byBhbiB1bmRlZmluZWQgYWRkcmVzcy4KPiA+Cj4gPiBTdWdnZXN0
ZWQgZml4Ogo+ID4KPiA+IC8qIGFsbG93IE5VTEw6IHBsYXRmb3JtcyB3aXRoIGZpeGVkIG9yIG10
dmVjLWJhc2VkIE5NSSB2ZWN0b3JzCj4gPiAqIGRvIG5vdCBuZWVkIHRvIHByb2dyYW0gYW55IHZl
bmRvciByZWdpc3RlciAqLwo+ID4gaWYgKG9wcyAmJiBvcHMtPnNtcm5taV9oYW5kbGVyc19pbml0
KSB7Cj4gPiAgICAgICAgIGludCByZXQgPSBvcHMtPnNtcm5taV9oYW5kbGVyc19pbml0KF90cmFw
X3JubWlfaGFuZGxlciwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgX3RyYXBfaGFuZGxlcik7Cj4gPiAgICAgICAgIGlmIChyZXQpCj4gPiAgICAgICAgICAg
ICByZXR1cm4gcmV0Owo+ID4gfQo+ID4KPiA+IGNzcl93cml0ZShDU1JfTU5TQ1JBVENILCBzY3Jh
dGNoKTsKPiA+IGNzcl9zZXQoQ1NSX01OU1RBVFVTLCBNTlNUQVRVU19OTUlFKTsKPiA+Cj4gPiBU
aGlzIHJlcXVpcmVzIGNoYW5naW5nIHRoZSBjYWxsYmFjayBzaWduYXR1cmUgZnJvbSB2b2lkIHRv
IGludC4KPiA+Cj4gPiBQbGF0Zm9ybXMgdGhhdCBoYXZlIG5vdGhpbmcgdG8gcHJvZ3JhbSByZXR1
cm4gMCwgcGxhdGZvcm1zIHRoYXQgZmFpbAo+ID4gcmV0dXJuIGFuIGVycm9yLCBhbmQgcGxhdGZv
cm1zIHdpdGggbm8gY2FsbGJhY2sgYXQgYWxsIGFyZSBoYW5kbGVkCj4gPiBncmFjZWZ1bGx5IHdp
dGhvdXQgYSBwYW5pYy4KPiA+Cj4KPiBQbGVhc2Ugc2VuZCBhIHBhdGNoIHdpdGggYXBwcm9wcmlh
dGUgRml4ZXMgdGFnLgpXaWxsIGRvLgoKV2hpbGUgcHJlcGFyaW5nIHRoZSBwYXRjaCwgSSBhbHNv
IG5vdGljZWQgdGhlIHNlcmllcyBpcyBtaXNzaW5nCm5vbi1yZXRlbnRpdmUgc3VzcGVuZC9yZXN1
bWUgaGFuZGxpbmcgZm9yIENTUl9NTlNDUkFUQ0ggYW5kCiAgTU5TVEFUVVMuTk1JRS4KCkFmdGVy
IG5vbi1yZXRlbnRpdmUgc3VzcGVuZCwgdGhlIGhhcnQgaXMgZnVsbHkgcG93ZXJlZCBvZmYgYW5k
IGFsbCBDU1IKc3RhdGUgaXMgcmVzZXQuCgpPbiByZXN1bWUsIHNiaV9oc21faGFydF9yZXN1bWVf
ZmluaXNoKCkgY2FsbHMKX19zYmlfaHNtX3N1c3BlbmRfbm9uX3JldF9yZXN0b3JlKCkgYW5kIGp1
bXBzIGRpcmVjdGx5IHRvIHRoZSBrZXJuZWwKd2l0aG91dCBnb2luZyB0aHJvdWdoIHNiaV9oYXJ0
X2luaXQoKSwgc28gdGhlIFNtcm5taSBDU1JzIHNldCB1cCBpbgpoYXJ0X2RldGVjdF9mZWF0dXJl
cygpIGFyZSBuZXZlciByZS1pbml0aWFsaXplZC4KCkkgd2lsbCBzZW5kIGJvdGggZml4ZXMgdG9n
ZXRoZXIgYXMgYSB0d28tcGF0Y2ggc2VyaWVzIGFmdGVyIHRlc3RpbmcuCgo+Cj4gUmVnYXJkcywK
PiBBbnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
