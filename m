Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C791BE8FDA7
	for <opensbi@archiver.kernel.org>; Fri, 26 Dec 2025 11:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OAZQL4E8fbotVfTxjD1Y7KJ6IJ6glBMchxA4s6+Dx1U=; b=fQnoTK907xzUIq
	iY/WA3EozhIOWTfIDM3DzcZWNHEf1m5kcER2jZL4CRt/TK28Z/9nt2KF+xibccJorOJLGVLeRB1Zm
	INNlCp9mKmOOkqHWCIuTcx8YA88rQBRjNIaJxzvlXc3uIZnDTTTNSzepy3VjhL0byFmga9HBJnxEE
	fFcO6Su/d4pLCS8sro28SCz/+KfN04UL0E/cIE+j5mCx1AsyhOhw04SRcGclsq6Mlhztr6XZdcDiS
	TRhLjRDIUZlil5pnncibQ1J0GaHJmzAKc2DmasxW+NW8vxkASI5aaDY2NLYM3E/KRQ1VZhJArA69V
	0q+n98YsSiSk13l6Mfxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ5ev-000000017zw-1Qsc;
	Fri, 26 Dec 2025 11:07:01 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ5et-000000017zJ-0Aad
	for opensbi@lists.infradead.org;
	Fri, 26 Dec 2025 11:07:00 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-65e9430489eso1749443eaf.0
        for <opensbi@lists.infradead.org>; Fri, 26 Dec 2025 03:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1766747217; x=1767352017; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7UrajG6LYJXJPR6aDDYZf6fI8FKa90/5nEF13FPFMRI=;
        b=uPVHnAvlonX5O674a5iJJZZwlKM9JMGWAT7DSETvPpn8llG2EYvDipmKXmR3Ap8Hyp
         JWX9dqWhjMdannWcnXsZAaliZjsiUFNsQUc5vrO550YCAAASL/WHZkl4t2c9h3n3+Qeh
         IUaA53Z1bYQSR3dcfjgl3H24GRdvjzipSMJuuvqSk4/WKQX2QQNoX07oSDE9AGzvB1wc
         mxPVQrFT+MkFSqbCB7pfasqDbHV4RuhTMCukTyX7YLhd2DsAYGNiD3sOfz5xcoBVWA8v
         Hkm9WNC4hYmaCZteQyDqEdHKy5wFK+8odgYAlVrW88KmKJ8rsZOUVjjFIkruh9G/p+pu
         jP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766747217; x=1767352017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7UrajG6LYJXJPR6aDDYZf6fI8FKa90/5nEF13FPFMRI=;
        b=C0zSO1ddWgGsyEnUbJ4dVYV2fMDNi5/o+acphjt++42//mutB4iY0nGojZinpu6wEU
         ASs5/Fto026LZx3Ep5hxoROA7PEWAt/hldmHKwB7xbHPKm2oJhIubMCOt+u7aQDd4ymm
         bl6LUhSBOxhNAg7PrWJdWeqmGtYXSegTsCaodT840qR9C7hjG3s+q7KKXIh1hllzW2Gh
         7SA+9nXf/8Ro9n+YS/R+/fosyzdgbozTcnLAwkxUfL+JDfykKIozGY2Gmf8wjSn0ylxe
         2OySwgUdy6xYIh27GihZqfwof7wN1plOllVnwQaDAzNblqVMT/ynanE1GXFGqUvnOCKj
         mlVA==
X-Gm-Message-State: AOJu0Yw4OCThdVE61utIZZQ/NRsS9cDNVPE4IiwAugDh+sN20aLjQye/
	DoYKY/rGrzwCIr8HbZB+g9nDL5fwT0dHl28j/xNBAL7J3kLuiagEzHO2pQ+AtRz3F3dVmbsSBQq
	16+FJS39XFn50NcYajN0Ei6Y4eLVAqaTaLB0T3gHKGQ==
X-Gm-Gg: AY/fxX4WbRnKYRrEhKIfELMdOyuY0ttBi58p9xMWLZotpPjaOI4Z7IMm/lQCTLnOC3N
	TUGijjh/3CPnb822T81mD8nrBvc3TDoVDZBuXzRlzMjO7v6siYkkV3RowWhg3Uaou6+7JjVf9MM
	9HIykb2Z5XbYjRNOVzlHyCu7J+swWurZxVDq5FWY0YE//kJtXyuMrq0GEiexcQBMMKxXUXTddHW
	M+TlQZOgEGOclImSsS5WxO+n/CF2KQFY0Y9CkwuHpnmDXHo4mwc+auq9+BSoyxKhbDqt39GM/ki
	ejwCUcs6m3ALR3EZUEAUObhLr51zOjGtHK9JzcBKQ5lkvOrCtPBhHwpcqQ==
X-Google-Smtp-Source: AGHT+IEhBF+vFtc7dPrAUflmnzdbOId950DG9UXr674mZ7v2OBbSEHJ16mzz/QUqFb+gFN3dl+9iHOe+7otDGKzqmwA=
X-Received: by 2002:a05:6820:16a4:b0:65c:f4b9:1037 with SMTP id
 006d021491bc7-65d0e9af356mr8464512eaf.33.1766747217371; Fri, 26 Dec 2025
 03:06:57 -0800 (PST)
MIME-Version: 1.0
References: <20251124220339.3695940-1-debug@rivosinc.com>
In-Reply-To: <20251124220339.3695940-1-debug@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 26 Dec 2025 16:36:44 +0530
X-Gm-Features: AQt7F2qPE5wqFGZrOx_L77865O2VWdc8Zm6i0E3ZP1dpAgJy_pSlgjz9_xTHc-c
Message-ID: <CAAhSdy08KSgzHQW3m5Z3p7QWXvti1PgX7nxeAXWZS=jinWqE4g@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: expected trap must always clear MPRV
To: Deepak Gupta <debug@rivosinc.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_030659_318008_CA94D905 
X-CRM114-Status: GOOD (  16.27  )
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

T24gVHVlLCBOb3YgMjUsIDIwMjUgYXQgMzozM+KAr0FNIERlZXBhayBHdXB0YSA8ZGVidWdAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IEV4cGVjdGVkIHRyYXAgbXVzdCBhbHdheXMgY2xlYXIgTVBS
Vi4gQ3VycmVudGx5IGl0IGRvZXNuJ3QuIFRoZXJlIGlzIGEKPiBzZWN1cml0eSBpc3N1ZSBoZXJl
IHdoZXJlIGlmIGZpcm13YXJlIHdhcyBkb2luZyBsZC9zdCB3aXRoIE1QUlY9MSBhbmQKPiBzaW5j
ZSB0aGVyZSB3b3VsZCBiZSBhIGV4cGVjdGVkIHRyYXAsIG9wZW5zYmkgd2lsbCBjb250aW51ZSB0
byBydW4gYXMKPiBNUFJWPTEuIFNlY3VyaXR5IGltcGFjdCBpcyBEb1Mgd2hlcmUgb3BlbnNiaSB3
aWxsIGp1c3Qga2VlcCB0cmFwcGluZy4KPgo+IFNpZ25lZC1vZmYtYnk6IERlZXBhayBHdXB0YSA8
ZGVidWdAcml2b3NpbmMuY29tPgo+IC0tLQo+ICBsaWIvc2JpL3NiaV9leHBlY3RlZF90cmFwLlMg
fCA0ICsrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdp
dCBhL2xpYi9zYmkvc2JpX2V4cGVjdGVkX3RyYXAuUyBiL2xpYi9zYmkvc2JpX2V4cGVjdGVkX3Ry
YXAuUwo+IGluZGV4IDk5ZGVkZTVmLi44ZmJkMmNiMiAxMDA2NDQKPiAtLS0gYS9saWIvc2JpL3Ni
aV9leHBlY3RlZF90cmFwLlMKPiArKysgYi9saWIvc2JpL3NiaV9leHBlY3RlZF90cmFwLlMKPiBA
QCAtMjMsNiArMjMsOCBAQAo+ICAgICAgICAgLmdsb2JhbCBfX3NiaV9leHBlY3RlZF90cmFwCj4g
IF9fc2JpX2V4cGVjdGVkX3RyYXA6Cj4gICAgICAgICAvKiBXaXRob3V0IEgtZXh0ZW5zaW9uIHNv
LCBNVFZBTDIgYW5kIE1USU5TVCBDU1JzIGFuZCBHVkEgbm90IGF2YWlsYWJsZSAqLwo+ICsgICAg
ICAgbHVpICAgICBhNCwgMHgyMCAvKiBNU1RBVFVTX01QUlYgKi8KClRoaXMgc2hvdWxkIGJlICJs
aSBhNCwgTVNUQVRVU19NUFJWIi4gSSB3aWxsIHRha2UgY2FyZQpvZiBpdCBhdCB0aGUgdGltZSBv
ZiBtZXJnaW5nIHRoaXMgcGF0Y2guCgo+ICsgICAgICAgY3NyYyAgICBDU1JfTVNUQVRVUywgYTQK
PiAgICAgICAgIGNzcnIgICAgYTQsIENTUl9NQ0FVU0UKPiAgICAgICAgIFJFR19TICAgYTQsIFNC
SV9UUkFQX0lORk9fT0ZGU0VUKGNhdXNlKShhMykKPiAgICAgICAgIGNzcnIgICAgYTQsIENTUl9N
VFZBTAo+IEBAIC0zOSw2ICs0MSw4IEBAIF9fc2JpX2V4cGVjdGVkX3RyYXA6Cj4gICAgICAgICAu
Z2xvYmFsIF9fc2JpX2V4cGVjdGVkX3RyYXBfaGV4dAo+ICBfX3NiaV9leHBlY3RlZF90cmFwX2hl
eHQ6Cj4gICAgICAgICAvKiBXaXRoIEgtZXh0ZW5zaW9uIHNvLCBNVFZBTDIgYW5kIE1USU5TVCBD
U1JzIGFuZCBHVkEgYXZhaWxhYmxlICovCj4gKyAgICAgICBsdWkgICAgIGE0LCAweDIwIC8qIE1T
VEFUVVNfTVBSViAqLwoKU2FtZSBjb21tZW50IGFzIGFib3ZlLgoKPiArICAgICAgIGNzcmMgICAg
Q1NSX01TVEFUVVMsIGE0Cj4gICAgICAgICBjc3JyICAgIGE0LCBDU1JfTUNBVVNFCj4gICAgICAg
ICBSRUdfUyAgIGE0LCBTQklfVFJBUF9JTkZPX09GRlNFVChjYXVzZSkoYTMpCj4gICAgICAgICBj
c3JyICAgIGE0LCBDU1JfTVRWQUwKPiAtLQo+IDIuNDMuMAo+Cj4KPiAtLQo+IG9wZW5zYmkgbWFp
bGluZyBsaXN0Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCgpSZXZpZXdlZC1ieTogQW51cCBQ
YXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KCkFwcGxpZWQgdGhpcyBwYXRjaCB0byB0aGUgcmlz
Y3Yvb3BlbnNiaSByZXBvLgoKVGhhbmtzLApBbnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QK
b3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
