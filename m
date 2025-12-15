Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16592D5B843
	for <opensbi@archiver.kernel.org>; Mon, 15 Dec 2025 15:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RcAmc1SPjkxOfwVP7gswmRGCFRq2c+iKMFG6hX76Rsw=; b=2rC1L3Gfoj7eEG
	J4+gFSy6QEzqlXCm+Cf+ms02OgcYL/9PKbj5ctdDHJ2Ts4MuwwjouZ/kQUwAgVvKQYMKViM79i0SS
	/oOKqgVeHSGSSfIUoBtDGjmG4PtL20McaiTpo50LMYzlt8cF12EUVeldbaBHxbNfrCwt8gxVU2fjF
	c56OqvXK6prGv2geJHGbKrOfZioKAZlct0m+TwDtXGbGsqQiHWzlpvbkfOjnAOCsUbcsJMLJCD7Se
	O5pzWJuWOyyd8JGYlrcWvJjJgynEyzoHqh3cvUSxHNHHKwMIs06ERtL3NBWIX9Xcbf1nhExvxs6PS
	vZrCQm7mN1qXonzqR1Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAnx-00000003vrA-40YP;
	Mon, 15 Dec 2025 15:48:09 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAnt-00000003vqB-2b3Z
	for opensbi@lists.infradead.org;
	Mon, 15 Dec 2025 15:48:07 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-7c6ce4f65f7so3137843a34.0
        for <opensbi@lists.infradead.org>; Mon, 15 Dec 2025 07:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1765813684; x=1766418484; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=THOm8aG8S5pDxpv1E7RoijqQSEJwY67QbKLOJrB9Bt4=;
        b=msF3do6vbQpzdWWhODx5xcENxQn9o6iAfmNkQxfdZlzHv0AYjjUFeNmWbdcxD8JGrI
         kOtdg+cNujAWQAA7TMVm0Dhm9HDMpW+XfLZoN1+r6GBIZJuCFYXgEAkbe93VmINdEbs5
         IrbG23btS89jBEMe5s9b00LLgap9UyJ1PQ38kIvwHfRZ1qrQHjnhOQ0j+jtO01nzJAXo
         AU6l3ja5XeqS5wBbE/XipuNJCeiamVNcxDPoO0rlirqYcjGsgn+IjM0W77E41P7EE0TQ
         K0NP63kwo+Zuohf+4BDiE8ucRH5cLNg9htBkjpqAADiMxM4dBJ/f2DLSOsbKhCyLYmiv
         Xj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765813684; x=1766418484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=THOm8aG8S5pDxpv1E7RoijqQSEJwY67QbKLOJrB9Bt4=;
        b=n4EwaOFAEuy4F37BT9kDi5OGZn0P0H+lSVTxAQaUWZHWKkOteN+BdZYQo0tfc7edGO
         jxAZtQmQhUPKXrwfRSzCC/vXnpHKA3eGGoT/3dUYai7laQUBdffAyKpndWV4a3BMOdkt
         UoQ19xUuwg5IgQ7jEYp4upQbpg7LuJewg129Jy9lz05MjWHGEse/9lxtPnDE4EIGdRVc
         lG9rBRyIKR+v48Td0xRTzR3OS6NXO3ZjrcxGZx4Sf/7Cz8jduGSaB6ZBhA3k4mkKpbBF
         BcCZIzSuDrl7PSYeivA82S/acqVvhn3EBkYeGOpIBMo0h4bTuH/iXS1tRzeRB9L8HSiU
         VVxw==
X-Gm-Message-State: AOJu0YyXolFfZ2wpqBNNuAzpAYPL3NP12aEgXEYZ0IxKFM/BT2szDMXA
	/fh8BDBp/B6V8rsRJITZResLBNgLpVLEi+dhIfwxb0MdhRx3xrfa1AtRV4AgZe4p0yoj/ixGaWd
	OiWslfIWFyCNVgCSD3anjaMtPsyX8Edg/YAzUEW+6DWOaKs20EBuVHoQAGw==
X-Gm-Gg: AY/fxX4ZMW8fAmW1myK1VB2aTp8eYUaqL25Z1KvKpZYTyuQZmId8Db40uB85XLdyM4w
	JYWh6R+ndrvwv4QrWRigfgPWuQNR9UdRLzQUOO/qWLcxaecFfsBf/23w6S/jPxVVkE/Wo6O5n/6
	zXkyb+AYhOhDwoaR08ayUxQ9wLyfcb4zSfdVgy02rci1WhBokjJTXd3iY3MVkerBXxLTtm6FXnI
	a0DmCM+9gWCD6gY/qKm1YNDysMochDJNHkrgu9akRfeEK0k6T0SOylazbSsj7MJTslLOJM=
X-Google-Smtp-Source: AGHT+IG8+AzVMoWN4q/sszfyoNF5Rjj+yIadLYonQwQbqzuH9bmW5O7V/kWmaZurlJMl/HT9eFHg1jeHzlyuziS99z8=
X-Received: by 2002:a05:6820:1c95:b0:65b:32b4:83e7 with SMTP id
 006d021491bc7-65b451863a4mr4715046eaf.19.1765813684279; Mon, 15 Dec 2025
 07:48:04 -0800 (PST)
MIME-Version: 1.0
References: <20251114203842.13396-1-b.freisen@gmx.net> <20251114203842.13396-4-b.freisen@gmx.net>
In-Reply-To: <20251114203842.13396-4-b.freisen@gmx.net>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 15 Dec 2025 21:17:52 +0530
X-Gm-Features: AQt7F2qL-LXhyYjL2P1He-fO7178ZdC7g8joerDbeKnVyggv8hKXULmAMfTk09I
Message-ID: <CAAhSdy2buUk22HDoUDkf0ZnCXQbin0C9BZS=EX1kGsaTK6N=9w@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] include: sbi: Fix tab alignment.
To: Benedikt Freisen <b.freisen@gmx.net>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_074805_667557_4A304FAD 
X-CRM114-Status: GOOD (  15.80  )
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

T24gU2F0LCBOb3YgMTUsIDIwMjUgYXQgMjowOeKAr0FNIEJlbmVkaWt0IEZyZWlzZW4gPGIuZnJl
aXNlbkBnbXgubmV0PiB3cm90ZToKPgo+IEEgcHJldmlvdXMgZWRpdG9yIG9yIGZvcm1hdHRlciBz
Y3JpcHQgYXBwZWFycyB0byBoYXZlIGJlZW4gY29uZnVzZWQgYnkgYQo+IGRpZmYgdmlldywgd2hl
cmUgdGhlIHByZXBlbmRlZCArIG9yIC0gY2hhbmdlcyB0aGUgd2F5IHRhYnMgYXJlIGRpc3BsYXll
ZC4KPiBTaW5jZSBpdCBpcyB0aGUgZmlsZSBpdHNlbGYgdGhhdCBtYXR0ZXJzLCBhZGp1c3QgdGhh
dCBhY2NvcmRpbmdseS4KPgo+IFNpZ25lZC1vZmYtYnk6IEJlbmVkaWt0IEZyZWlzZW4gPGIuZnJl
aXNlbkBnbXgubmV0PgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWlu
ZmF1bHQub3JnPgoKQXBwbGllZCB0aGlzIHBhdGNoIHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8u
CgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIGluY2x1ZGUvc2JpL3Jpc2N2X2VuY29kaW5nLmggfCAz
MCArKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE1IGlu
c2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2Jp
L3Jpc2N2X2VuY29kaW5nLmggYi9pbmNsdWRlL3NiaS9yaXNjdl9lbmNvZGluZy5oCj4gaW5kZXgg
NjFlNGI2My4uOTJjYmMyNyAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3NiaS9yaXNjdl9lbmNvZGlu
Zy5oCj4gKysrIGIvaW5jbHVkZS9zYmkvcmlzY3ZfZW5jb2RpbmcuaAo+IEBAIC0xODksNyArMTg5
LDcgQEAKPgo+ICAjZGVmaW5lIFRPUElfSUlEX1NISUZUICAgICAgICAgICAgICAgICAxNgo+ICAj
ZGVmaW5lIFRPUElfSUlEX01BU0sgICAgICAgICAgICAgICAgICAweGZmZgo+IC0jZGVmaW5lIFRP
UElfSVBSSU9fTUFTSyAgICAgICAgICAgICAgICAweGZmCj4gKyNkZWZpbmUgVE9QSV9JUFJJT19N
QVNLICAgICAgICAgICAgICAgICAgICAgICAgMHhmZgo+Cj4gICNpZiBfX3Jpc2N2X3hsZW4gPT0g
NjQKPiAgI2RlZmluZSBNSFBNRVZFTlRfT0YgICAgICAgICAgICAgICAgICAgKF9VTCgxKSA8PCA2
MykKPiBAQCAtOTM1LDEwICs5MzUsMTAgQEAKPiAgI2RlZmluZSBJTlNOX01BU0tfQ19GU1dTUCAg
ICAgICAgICAgICAgMHhlMDAzCj4KPiAgI2RlZmluZSBJTlNOX01BVENIX0NfTEhVICAgICAgICAg
ICAgICAgMHg4NDAwCj4gLSNkZWZpbmUgSU5TTl9NQVNLX0NfTEhVICAgICAgICAgICAgICAgIDB4
ZmM0Mwo+IC0jZGVmaW5lIElOU05fTUFUQ0hfQ19MSCAgICAgICAgICAgICAgICAweDg0NDAKPiAr
I2RlZmluZSBJTlNOX01BU0tfQ19MSFUgICAgICAgICAgICAgICAgICAgICAgICAweGZjNDMKPiAr
I2RlZmluZSBJTlNOX01BVENIX0NfTEggICAgICAgICAgICAgICAgICAgICAgICAweDg0NDAKPiAg
I2RlZmluZSBJTlNOX01BU0tfQ19MSCAgICAgICAgICAgICAgICAgMHhmYzQzCj4gLSNkZWZpbmUg
SU5TTl9NQVRDSF9DX1NIICAgICAgICAgICAgICAgIDB4OGMwMAo+ICsjZGVmaW5lIElOU05fTUFU
Q0hfQ19TSCAgICAgICAgICAgICAgICAgICAgICAgIDB4OGMwMAo+ICAjZGVmaW5lIElOU05fTUFT
S19DX1NIICAgICAgICAgICAgICAgICAweGZjNDMKPgo+ICAjZGVmaW5lIElOU05fTUFTS19XRkkg
ICAgICAgICAgICAgICAgICAweGZmZmZmZjAwCj4gQEAgLTEzMDcsNyArMTMwNyw3IEBACj4gIC8q
IDY0LWJpdCByZWFkIGZvciBWUy1zdGFnZSBhZGRyZXNzIHRyYW5zbGF0aW9uIChSVjY0KSAqLwo+
ICAjZGVmaW5lIElOU05fUFNFVURPX1ZTX0xPQUQgICAgICAgICAgICAweDAwMDAzMDAwCj4gIC8q
IDY0LWJpdCB3cml0ZSBmb3IgVlMtc3RhZ2UgYWRkcmVzcyB0cmFuc2xhdGlvbiAoUlY2NCkgKi8K
PiAtI2RlZmluZSBJTlNOX1BTRVVET19WU19TVE9SRSAgIDB4MDAwMDMwMjAKPiArI2RlZmluZSBJ
TlNOX1BTRVVET19WU19TVE9SRSAgICAgICAgICAgMHgwMDAwMzAyMAo+Cj4gICNlbGlmIF9fcmlz
Y3ZfeGxlbiA9PSAzMgo+Cj4gQEAgLTEzMTUsNyArMTMxNSw3IEBACj4gICNkZWZpbmUgSU5TTl9Q
U0VVRE9fVlNfTE9BRCAgICAgICAgICAgIDB4MDAwMDIwMDAKPgo+ICAvKiAzMi1iaXQgd3JpdGUg
Zm9yIFZTLXN0YWdlIGFkZHJlc3MgdHJhbnNsYXRpb24gKFJWMzIpICovCj4gLSNkZWZpbmUgSU5T
Tl9QU0VVRE9fVlNfU1RPUkUgICAweDAwMDAyMDIwCj4gKyNkZWZpbmUgSU5TTl9QU0VVRE9fVlNf
U1RPUkUgICAgICAgICAgIDB4MDAwMDIwMjAKPgo+ICAjZWxzZQo+ICAjZXJyb3IgIlVuZXhwZWN0
ZWQgX19yaXNjdl94bGVuIgo+IEBAIC0xMzM1LDExICsxMzM1LDExIEBACj4gICNkZWZpbmUgU0hJ
RlRfQVFSTCAgICAgICAgICAgICAgICAgICAgIDI1Cj4KPiAgI2RlZmluZSBWTV9NQVNLICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAweDEKPiAtI2RlZmluZSBWSUVXX01BU0sgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAweDMKPiAtI2RlZmluZSBWU0VXX01BU0sgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAweDMKPiAtI2RlZmluZSBWTE1VTF9NQVNLICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAweDcKPiArI2RlZmluZSBWSUVXX01BU0sgICAgICAgICAgICAgICAg
ICAgICAgMHgzCj4gKyNkZWZpbmUgVlNFV19NQVNLICAgICAgICAgICAgICAgICAgICAgIDB4Mwo+
ICsjZGVmaW5lIFZMTVVMX01BU0sgICAgICAgICAgICAgICAgICAgICAweDcKPiAgI2RlZmluZSBW
RF9NQVNLICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDFmCj4gLSNkZWZpbmUgVlMy
X01BU0sgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHgxZgo+ICsjZGVmaW5lIFZTMl9N
QVNLICAgICAgICAgICAgICAgICAgICAgICAweDFmCj4gICNkZWZpbmUgSU5TTl8xNkJJVF9NQVNL
ICAgICAgICAgICAgICAgICAgICAgICAgMHgzCj4gICNkZWZpbmUgSU5TTl8zMkJJVF9NQVNLICAg
ICAgICAgICAgICAgICAgICAgICAgMHgxYwo+Cj4gQEAgLTEzNTEsOCArMTM1MSw4IEBACj4KPiAg
I2RlZmluZSBJTlNOX0xFTihpbnNuKSAgICAgICAgICAgICAgICAgKElOU05fSVNfMTZCSVQoaW5z
bikgPyAyIDogNCkKPgo+IC0jZGVmaW5lIFNIX1ZTRVcgICAgICAgICAgICAgICAgICAgICAgICAz
Cj4gLSNkZWZpbmUgU0hfVklFVyAgICAgICAgICAgICAgICAgICAgICAgIDEyCj4gKyNkZWZpbmUg
U0hfVlNFVyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMwo+ICsjZGVmaW5lIFNIX1ZJ
RVcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDEyCj4gICNkZWZpbmUgU0hfVkQgICAg
ICAgICAgICAgICAgICAgICAgICAgIDcKPiAgI2RlZmluZSBTSF9WUzIgICAgICAgICAgICAgICAg
ICAgICAgICAgMjAKPiAgI2RlZmluZSBTSF9WTSAgICAgICAgICAgICAgICAgICAgICAgICAgMjUK
PiBAQCAtMTQwMCwxNyArMTQwMCwxNyBAQAo+ICAjZGVmaW5lIElNTV9TKGluc24pICAgICAgICAg
ICAgICAgICAgICAoKChzMzIpKGluc24pID4+IDI1IDw8IDUpIHwgXAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgKHMzMikoKChpbnNuKSA+PiA3KSAmIDB4MWYpKQo+
Cj4gLSNkZWZpbmUgSVNfTUFTS0VEKGluc24pICAgICAgICAgICAgICAgICgoKGluc24gPj4gU0hf
Vk0pICYgVk1fTUFTSykgPT0gMCkKPiArI2RlZmluZSBJU19NQVNLRUQoaW5zbikgICAgICAgICAg
ICAgICAgICAgICAgICAoKChpbnNuID4+IFNIX1ZNKSAmIFZNX01BU0spID09IDApCj4gICNkZWZp
bmUgR0VUX1ZEKGluc24pICAgICAgICAgICAgICAgICAgICgoaW5zbiA+PiBTSF9WRCkgJiBWRF9N
QVNLKQo+ICAjZGVmaW5lIEdFVF9WUzIoaW5zbikgICAgICAgICAgICAgICAgICAoKGluc24gPj4g
U0hfVlMyKSAmIFZTMl9NQVNLKQo+ICAjZGVmaW5lIEdFVF9WSUVXKGluc24pICAgICAgICAgICAg
ICAgICAoKChpbnNuKSA+PiBTSF9WSUVXKSAmIFZJRVdfTUFTSykKPiAgI2RlZmluZSBHRVRfTUVX
KGluc24pICAgICAgICAgICAgICAgICAgKCgoaW5zbikgPj4gU0hfTUVXKSAmIDEpCj4gLSNkZWZp
bmUgR0VUX1ZTRVcodnR5cGUpICAgICAgICAgICAgICAgICgoKHZ0eXBlKSA+PiBTSF9WU0VXKSAm
IFZTRVdfTUFTSykKPiArI2RlZmluZSBHRVRfVlNFVyh2dHlwZSkgICAgICAgICAgICAgICAgICAg
ICAgICAoKCh2dHlwZSkgPj4gU0hfVlNFVykgJiBWU0VXX01BU0spCj4gICNkZWZpbmUgR0VUX1ZM
TVVMKHZ0eXBlKSAgICAgICAgICAgICAgICgodnR5cGUpICYgVkxNVUxfTUFTSykKPiAgI2RlZmlu
ZSBHRVRfTEVOKHZpZXcpICAgICAgICAgICAgICAgICAgKDFVTCA8PCAodmlldykpCj4gICNkZWZp
bmUgR0VUX05GKGluc24pICAgICAgICAgICAgICAgICAgICgxICsgKChpbnNuID4+IDI5KSAmIDcp
KQo+ICAjZGVmaW5lIEdFVF9WRU1VTCh2bG11bCwgdmlldywgdnNldykgICAoKHZsbXVsICsgdmll
dyAtIHZzZXcpICYgNykKPiAtI2RlZmluZSBHRVRfRU1VTCh2ZW11bCkgICAgICAgICAgICAgICAg
KDFVTCA8PCAoKHZlbXVsKSA+PSA0ID8gMCA6ICh2ZW11bCkpKQo+ICsjZGVmaW5lIEdFVF9FTVVM
KHZlbXVsKSAgICAgICAgICAgICAgICAgICAgICAgICgxVUwgPDwgKCh2ZW11bCkgPj0gNCA/IDAg
OiAodmVtdWwpKSkKPgo+ICAjZGVmaW5lIENTUlJXIDEKPiAgI2RlZmluZSBDU1JSUyAyCj4gLS0K
PiAyLjUxLjEKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMu
aW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5z
YmkK
