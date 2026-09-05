Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 532E3C624DB
	for <opensbi@archiver.kernel.org>; Sat,  5 Sep 2026 07:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8R48OkmZraRtmu3CYRSIe6/9urIjOJeeg1PVYNtnL5M=; b=fQ/nhHwQ/Q2Mrz
	Goatbjowb3c5zt+HLCY6dIE1iQEI+HU5EDSpn1Mvli9iuNzyVYrsm5tdP1CQ6Wblqt2u0RV9DV8gq
	l+H+tdhfVUHpGuwDI2cNp1VoO5bgnrEXxZEuDbU+xkQFFveCrsLrXgxHNrt28VkFGeHJ+gLPHT3t+
	X7tYbIP3Vl4rKkxvg1FCZoUWBeYFak2lZi1sgbASMfFrP8Xu8ufpmcTqBx5PyAHF2qbe7g5hi6iLE
	DbsZjhhIllI+j/bRteMYQ/AiDQRp1NRBgGhTXlfLFu5bJD6MTS5tLrds6olByr22Sp/vgsRozvd8y
	HeHmLL7lYAsiSYE4SUAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2kOp-00000003kyh-0dj6;
	Sat, 05 Sep 2026 07:01:15 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2kOm-00000003kxg-1XXH
	for opensbi@lists.infradead.org;
	Sat, 05 Sep 2026 07:01:13 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso20943015e9.0
        for <opensbi@lists.infradead.org>; Sat, 05 Sep 2026 00:01:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788591670; cv=none;
        d=google.com; s=arc-20260327;
        b=ezEQa5NjQoomqrTWRjiCPnIJ2rr1WU/55ea1+VQsKHs5RsVEYZLpBH57ilhTS5lPWu
         5nsRgGHHRdikVTJ8natF11op07TKDoXXgpl1MjfmLSWdvFjCOO9PMjFQXc0JPbktuUqV
         DIa/MDMz4lRG2PAtBYrLIqzY03J35DS9+CvuU1t2ATqrdFiBkTktOBMhJeoviG/fcoaz
         4GwvbuCun9HGcc/ivcxWOE3UUBXkv8T49E598d/8fX3jqaelSRgTmVUg055PY0fLkb9b
         YBq9Ebvw1mQVQeKLIZmoylMcwLUDFxZf1yDdocPjLICxTXFLO4IWsKvIW6fLk9zUVccm
         DCqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cf1zvZEGRPpVcD6lDTDFZ4DrYVvFSYx7LkYlK0MgWXo=;
        fh=8/4yxR4ni/Wd7OOTh1rpB3jE2twMO+g8SuAOT8RRry4=;
        b=di+eX2vVx61/7yqec0k16hZenBcTzZ/2FIpoSQ1IpmjFQIM81LsYHcrkpJjKVlxXsg
         h78s6ytRUG5Rw93WJPu/cDu+2sJktWA/sppob1Dc98CvraPNG2Lte6SkHY29jXtLrbAY
         yDHEnVdp9iVlhiTZWs8e+EvGkaTGpg6isXMkxdknhoQUECDfxavPDazyjgnfJa0vbqDW
         rJmux/pzO+yep3W2kxDqspaJwfYTcRr0Lj308VjfJfD7DpSgtlyXbh5GvmmEDN/eJ+ys
         PSrmXDSnJelq2VDD5aE6LReCoBjW399R9n1nywBgMLmBlKyVVWlWs+LH9bls4C9k8aT6
         G4pA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1788591670; x=1789196470; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cf1zvZEGRPpVcD6lDTDFZ4DrYVvFSYx7LkYlK0MgWXo=;
        b=h90GhAmFt0wkfMVl0K56bDRQnecx4GvAABGvbPsg5tDjMEhzrtGXtKuplnjfVr96CI
         HcxZvrwBv9cvMn3pBgD44/4bcuzOax54lF1oorSw9K/MBJ3kFTwl7lvwX2SY4+uWEhGv
         dt0ficfNuIL+NWFHNDrX5KL06XGiBaq8dou2ouAAql8nye7Ith1Y4ycUF0W6TvGtnmxu
         Sx0yqkkzxxasyaPP125TvoXWmNaKMKe1opOoEkmLUnszyyRfTPrB522Wk4aDTFSX68WA
         AkMJhEg5uLQqI4DlorAIRB22u87cI/NzxXrxxoqsuiI+IDqlLT8niU5MB0mATpcz0a5V
         q7yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788591670; x=1789196470;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cf1zvZEGRPpVcD6lDTDFZ4DrYVvFSYx7LkYlK0MgWXo=;
        b=fJ7wNpWAAW4xITCC/1BfRTN6hAMyV/gf5x+istZBPkiingiErlWGsKl2RPX/rZNoDA
         WP0w4WQrHypb6RPPVesVokodBxciRTOQ7nrHNTqeVBs0D42qx1cv10oQgjscleH/kO48
         sgr/mpyy4QITle8Ya0EuJIMp5vRs1pA2CbP3rKUBAaUo2R5upAAPc+szl1TTEd7Ru9xy
         6dlBRf6j3iokaMWfBvyumFYUM6Xd9q3ohTCbylO7Un+HMHPuY5mH5bge+hqA8CVBPjYL
         y5pqtvR1CQP+zgQbG7ka4hSaxD+bIS7lW2AP8NEZqxVd/I7HqZebDgaB/q8omifoiSEO
         t33g==
X-Gm-Message-State: AFuF++mlw6ECwXUHrFmiLH6ci/pxX0E5SW8kwFX6AMZstMN90POCYIAJ
	bDcWcJioTUYM3Paa8SAQJ4jtIX8davAbTL7im5HtyYI66ljOHGP9eTqoLQSzdiHF0QOt7uw3Zjk
	FAt8FOXX4VvmzAjJWCGDxiY3Zx259vbDtedxPpN1DtRNrGvivwkx/xbE=
X-Gm-Gg: AYBFou0ePEkLR4hSeBK86Ge7JgRC8cKEVxdGmFSExun0Jieo5l3Sgx5B0Lbmgyg7mcB
	HsEqyQFi444G47fyvpzu7C9utToALoflIFksq9lMXckM5nFvQohgAj1YI/eIAIvdeEHR+BXe8Q9
	G5Nwj+GSQcPP4jIk4m4FezZ94WQBzScpLbiYLqS/psNgein8diXGnIh8tFRV6i5ATdLsO1lwy6H
	TrOfBhKW/I/eqBoMFRCLZpz/bCtuRPIs0G8seqGopmgT6HL0+1MiZizvbAu0m18YMlfvCeZGG4G
	4NWGOxOs6h2a5fwO+592Vy44hbnhcF3knnWe5BakAxaOs+9EkmUf+LeZrz4GjwoOLWErXf3IaR/
	UEvbKfkF4UvJc2XambeTkHnAiOTZlcr9wWMNxV7vvkP5qbVpaQQUh3zeIcQRN38k=
X-Received: by 2002:a05:600d:849b:10b0:49c:f13d:ffe6 with SMTP id
 5b1f17b1804b1-49cf13e05d9mr127375055e9.10.1788591669768; Sat, 05 Sep 2026
 00:01:09 -0700 (PDT)
MIME-Version: 1.0
References: <598191cd2102633b80b8890af6c8b3292fb76242.15545c56.8705.442f.b574.8164d38a1edb@feishu.cn>
In-Reply-To: <598191cd2102633b80b8890af6c8b3292fb76242.15545c56.8705.442f.b574.8164d38a1edb@feishu.cn>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 5 Sep 2026 12:30:58 +0530
X-Gm-Features: AcwNN1VP4BmEGJd64Odh8F5h4T0-yBq2mVKGYWxEJwITN65G0RVUuQOh5Qb-Mxw
Message-ID: <CAAhSdy1TDac-U3FpDkQCq0pj2boZFJz4QWzLX9rkqLTH8YdahA@mail.gmail.com>
Subject: Re: [PATCH] lib: Fix MSTATUS_FS bit usage in sbi_fp_save()
To: Huamao Wu <huamao.wu@spacemit.com>
Cc: "opensbi@lists.infradead.org" <opensbi@lists.infradead.org>, 
	"atishp@atishpatra.org" <atishp@atishpatra.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_000112_431898_4C4C28A0 
X-CRM114-Status: GOOD (  21.81  )
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

T24gVHVlLCBBdWcgMTEsIDIwMjYgYXQgODo0N+KAr0FNIEh1YW1hbyBXdSA8aHVhbWFvLnd1QHNw
YWNlbWl0LmNvbT4gd3JvdGU6DQo+DQo+IFRoZSBzYmlfZnBfc2F2ZSgpIGZ1bmN0aW9uIGluY29y
cmVjdGx5IHVzZXMgTVNUQVRVU19WUyAoMHg2MDAsIFZlY3Rvcg0KPiBleHRlbnNpb24gc3RhdGUp
IGluc3RlYWQgb2YgTVNUQVRVU19GUyAoMHg2MDAwLCBGbG9hdGluZy1Qb2ludCBleHRlbnNpb24N
Cj4gc3RhdGUpIHdoZW4gZW5hYmxpbmcgZmxvYXRpbmctcG9pbnQgaW5zdHJ1Y3Rpb25zIGJlZm9y
ZSBzYXZpbmcgRlAgcmVnaXN0ZXJzLg0KPg0KPiBUaGlzIGNhdXNlcyBhbiBpbGxlZ2FsIGluc3Ry
dWN0aW9uIGV4Y2VwdGlvbiB3aGVuIGV4ZWN1dGluZyB0aGUgZmlyc3QgZnNkL2Zzdw0KPiBpbnN0
cnVjdGlvbiwgYmVjYXVzZSB0aGUgRlAgdW5pdCByZW1haW5zIGRpc2FibGVkIChNU1RBVFVTLkZT
PTApIHdoaWxlIHRoZQ0KPiBjb2RlIGF0dGVtcHRzIHRvIGFjY2VzcyBGUCByZWdpc3RlcnMuDQo+
DQo+IFRoZSBidWcgd2FzIGludHJvZHVjZWQgaW4gY29tbWl0IDcxOGUxZDE5NGY1YSAoImxpYjog
QWRkIEZQIGNvbnRleHQgc2F2ZS9yZXN0b3JlDQo+IHN1cHBvcnQiLCAyMDI2LTA1LTE4KSBhbmQg
YWZmZWN0cyBPcGVuU0JJIHYxLjkgYW5kIGxhdGVyIHZlcnNpb25zLg0KPg0KPiBTeW1wdG9tIG9i
c2VydmVkIG9uIGEgZGV2ZWxvcG1lbnQgcGxhdGZvcm0gd2l0aCBkdWFsIDQwLWhhcnQgUlZBMjMg
Q1BVcyBhbmQgT1AtVEVFOg0KPiAtIERvbWFpbiBjb250ZXh0IHN3aXRjaCB0cmlnZ2VycyBzYmlf
ZnBfc2F2ZSgpDQo+IC0gRmlyc3QgZnNkIGluc3RydWN0aW9uIGF0IFBDIDB4MjNjZTQgcmFpc2Vz
IGlsbGVnYWwgaW5zdHJ1Y3Rpb24gdHJhcA0KPiAtIFN5c3RlbSBmYWlscyB0byBlbnRlciBPUC1U
RUUgdHJ1c3RlZCBkb21haW4NCj4NCj4gVGhlIHNiaV9mcF9yZXN0b3JlKCkgZnVuY3Rpb24gaW4g
dGhlIHNhbWUgZmlsZSBjb3JyZWN0bHkgdXNlcyBNU1RBVFVTX0ZTDQo+IChsaW5lIDExMiksIGNv
bmZpcm1pbmcgdGhpcyBpcyBhIGNvcHktcGFzdGUgZXJyb3IuDQo+DQo+IEZpeDogQ2hhbmdlIE1T
VEFUVVNfVlMgdG8gTVNUQVRVU19GUyBpbiBzYmlfZnBfc2F2ZSgpLg0KPg0KPiBTaWduZWQtb2Zm
LWJ5OiBIdWFtYW8gV3UgPGh1YW1hby53dUBzcGFjZW1pdC5jb20+DQoNClRoYW5rcyBmb3IgY2F0
Y2hpbmcgdGhpcyBpc3N1ZS4gSXQgaXMgYmV0dGVyIHRvIGluY2x1ZGUgRml4ZXMgdGFnIGhlcmUu
DQoNClRoZXJlIGlzIGFub3RoZXIgcGF0Y2ggImxpYjogc2JpOiBGaXggRlAgc3RhdGUgZW5hYmxl
IGluIHNiaV9mcF9zYXZlIg0KZml4aW5nIHRoZSBzYW1lIHRoaW5nIGJ1dCBpdCBkb2VzIGhhdmUg
Rml4ZXMgdGFnLiBJIHdpbGwgbWVyZ2UgdGhhdA0KcGF0Y2ggYW5kIGFkZCB5b3VyIFNpZ25lZC1v
ZmYtYnkgdG8gYWNrbm93bGVkZ2UgeW91ciBlZmZvcnRzLg0KDQpSZWdhcmRzLA0KQW51cA0KDQo+
IC0tLQ0KPiAgbGliL3NiaS9zYmlfZnAuYyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlf
ZnAuYyBiL2xpYi9zYmkvc2JpX2ZwLmMNCj4gaW5kZXggYzg5NDEyNTIuLjM4ZmI3YTAxIDEwMDY0
NA0KPiAtLS0gYS9saWIvc2JpL3NiaV9mcC5jDQo+ICsrKyBiL2xpYi9zYmkvc2JpX2ZwLmMNCj4g
QEAgLTIwLDcgKzIwLDcgQEAgdm9pZCBzYmlfZnBfc2F2ZShzdHJ1Y3Qgc2JpX2ZwX2NvbnRleHQg
KmRzdCkNCj4gICAgICAgICBpZiAoIWRzdCkNCj4gICAgICAgICAgICAgICAgIHJldHVybjsNCj4N
Cj4gLSAgICAgICBtc3RhdHVzX29yaWcgPSBjc3JfcmVhZF9zZXQoQ1NSX01TVEFUVVMsIE1TVEFU
VVNfVlMpOw0KPiArICAgICAgIG1zdGF0dXNfb3JpZyA9IGNzcl9yZWFkX3NldChDU1JfTVNUQVRV
UywgTVNUQVRVU19GUyk7DQo+DQo+ICAgICAgICAgYXNtIHZvbGF0aWxlKA0KPiAgI2lmIGRlZmlu
ZWQoX19yaXNjdl9kKQ0KPiAtLQ0KPiAyLjQzLjANCj4NCj4NCj4gVGhpcyBtZXNzYWdlIGFuZCBh
bnkgYXR0YWNobWVudCBhcmUgY29uZmlkZW50aWFsIGFuZCBtYXkgYmUgcHJpdmlsZWdlZCBvciBv
dGhlcndpc2UgcHJvdGVjdGVkIGZyb20gZGlzY2xvc3VyZS4gSWYgeW91IGFyZSBub3QgYW4gaW50
ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgbWVzc2FnZSwgcGxlYXNlIGRlbGV0ZSBpdCBhbmQgYW55
IGF0dGFjaG1lbnQgZnJvbSB5b3VyIHN5c3RlbSBhbmQgbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRp
YXRlbHkgYnkgcmVwbHkgZS1tYWlsLiBVbmludGVuZGVkIHJlY2lwaWVudHMgc2hvdWxkIG5vdCB1
c2UsIGNvcHksIGRpc2Nsb3NlIG9yIHRha2UgYW55IGFjdGlvbiBiYXNlZCBvbiB0aGlzIG1lc3Nh
Z2Ugb3IgYW55IGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIG1lc3NhZ2UuIEVtYWlscyBj
YW5ub3QgYmUgZ3VhcmFudGVlZCB0byBiZSBzZWN1cmUgb3IgZXJyb3IgZnJlZSBhcyB0aGV5IGNh
biBiZSBpbnRlcmNlcHRlZCwgYW1lbmRlZCwgbG9zdCBvciBkZXN0cm95ZWQsIGFuZCB5b3Ugc2hv
dWxkIHRha2UgZnVsbCByZXNwb25zaWJpbGl0eSBmb3Igc2VjdXJpdHkgY2hlY2tpbmcuDQo+DQo+
IOacrOmCruS7tuWPiuWFtuS7u+S9lemZhOS7tuWFt+acieS/neWvhuaAp+i0qO+8jOW5tuWPr+iD
veWPl+WFtuS7luS/neaKpOaIluS4jeWFgeiuuOiiq+aKq+mcsue7meesrOS4ieaWueOAguWmgumY
geS4i+ivr+aUtuWIsOacrOmCruS7tu+8jOaVrOivt+eri+WNs+S7peWbnuWkjeeUteWtkOmCruS7
tueahOaWueW8j+mAmuefpeWPkeS7tuS6uu+8jOW5tuWwhuacrOmCruS7tuWPiuWFtuS7u+S9lemZ
hOS7tuS7jumYgeS4i+ezu+e7n+S4reS6iOS7peWIoOmZpOOAguWmgumYgeS4i+W5tumdnuacrOmC
ruS7tuWGmeaYjuS5i+aUtuS7tuS6uu+8jOaVrOivt+WIh+WLv+S9v+eUqOOAgeWkjeWItuOAgeaK
q+mcsuacrOmCruS7tuaIluWFtuS7u+S9leWGheWuue+8jOS6puivt+WIh+WLv+S+neacrOmCruS7
tuaIluWFtuS7u+S9leWGheWuueiAjOmHh+WPluS7u+S9leihjOWKqOOAgueUteWtkOmCruS7tuaX
oOazleS/neivgeaYr+S4gOenjeWuieWFqOWSjOS4jeS8muWHuueOsOS7u+S9leW3rumUmeeahOmA
muS/oeaWueW8j++8jOWPr+iDveS8muiiq+aLpuaIquOAgeS/ruaUueOAgeS4ouWkseaIluaNn+Wd
j++8jOaUtuS7tuS6uumcgOiHquihjOi0n+i0o+WBmuWlveWuieWFqOajgOafpeOAgg0KLS0gCm9w
ZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
