Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE3E1CCFA02
	for <opensbi@archiver.kernel.org>; Sun,  2 Nov 2025 10:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QecxQ3u5IaO3TYPEwU+KzfrEXrI0AlYh+qeBFyaJb2Y=; b=DQLvH+cHEKw7xr
	5NIlZ3y713FCMBwVv0R/oSQzRvYm5tDD91MzXnGUHFgKboiDcMMMAlqTNjouaecHpjenggCtLao/a
	8cR+FJ1To2wtTZalOZj/6gnXhKufYjHT8jZiFUmPQ6cKdCntLRPMFAaOagK+grI3sQEwhOTorFhs3
	n9B2gzW5TqbRMVd5fZbeV+M0TpHtjQzqesVhgBRYh6e3oH2R3MojfKObUytMrg/UkmvEkFdItw/2W
	5Dbj1nFClA1eJ15XPxQIerc5WOQxcqkzFG8SaO4/tPrN7j4vOpkogpBDWouQ8MSD2PQwp4TyWR6U1
	pXvdvJe726pRI4CqIlVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFVkT-00000008UFT-378R;
	Sun, 02 Nov 2025 10:55:49 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFVkR-00000008UF7-0rM4
	for opensbi@lists.infradead.org;
	Sun, 02 Nov 2025 10:55:48 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-4330ef18daeso8299135ab.3
        for <opensbi@lists.infradead.org>; Sun, 02 Nov 2025 02:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1762080946; x=1762685746; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGkDZwl8x4I2gDpbC0ocCl2at6jZfE0jHwYrvwVHjP4=;
        b=pZUGY4Riykx+GM7B27s6Z5dLMgJaIAr4lKf+DaHmK1U9iVN7gDB838p+/8dwQUk7tw
         YRD8KLnTIKYjh/sKgGBJVrBRQlIjtB4KPKjKhzcpJxVc1trfRnbNtD/HN3yTdvIAlsIH
         tnMKWonn6VYEM8v/RUNDFiZgPcJGmvtyU0lvcXh+VogiydRprg9vpE69/aPUIu0hfwR5
         N9M+Tu7QenGdGTUabd9ciQDi/VgHd4hnPA0UFg4QZbCzTxpB3Lf1HTDKaGI5fTp+CW/J
         IWdzGvp5UICDRVx70B1ctRQBsH1SQgH/GNR3D1aQpf/NF1o8w5g7yqY/SMpox84PoFwm
         lPTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762080946; x=1762685746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DGkDZwl8x4I2gDpbC0ocCl2at6jZfE0jHwYrvwVHjP4=;
        b=rCtTzqopFwG38sG9FdaUrzgVphtWIvwdIlOdXGMVasg4WZ4tmop75Nl9Z2y0SqqKys
         kJ4HZsteaUieun9BEHWepkb4X3dlwZpYF974Cd7QzhpUjhXa8Asi7D1ArdPuId9jLvC9
         7h3zafmFI2+JHfbXb2P48iAnP/99TP+CovTpbZpCiLECk7g9U3u54BYP98/yt90V+lqo
         3/LFEP86q6s3rNix9+EuSPj63m+5K/smF8zKak3ghG4tPd+Rrtakm/VUs9rMnfedsYEc
         R9BETfXFmAluihjwJGvXjkLwG5x6mlBcWzSnmaVayeUpkxjamx5LbHe6uUQCgSCf+crD
         RiAQ==
X-Gm-Message-State: AOJu0Yz0+3BYb7nGqGlCSnnQ30ef5+U+699Pnm5xvRRDR6zP/MzexEfS
	3V/5FiS3wvJ2p5R4ciN4y8WU5MlnH6TiNVzEAeE8RGl5LnOgKogrJf+xF2pApcYYI6hUnti5ozW
	aC9vwPWbp3ZmqB1FsLTDwGl9VeiVDVNSpAje7CiXJUg==
X-Gm-Gg: ASbGncuXzyi3+6EIdLkTZw0W/UQGKuDgHyxzdFJAyzcPtY+hcSUpwv78VDTN89vcTw9
	oexEZoV2Zh5jYVbaMw6t2XGH7RnNvXLIQxsLnopicPFHmmQiibkPUJ67q/mCErQnApWQ5UG7rDV
	rUm8PEy9ef184u/W++5O47L06eMjjr6GilHknJeibRo5b+Kxt5GaYIDRoT0cZlnRRM9JsGcLAK2
	1w3qcfgm0IrM5A4evDmUfHFuaKMFCt3oIQeuC0BrgtNfOIVXrSZLshLUrFQdr35zLHtj9X/agO9
	B0/qvw2RW7bQma1D4lePUO3eVOU=
X-Google-Smtp-Source: AGHT+IHZT7a6+BRDHwvrncybkzbgdV18c7R/4EbFEagYGf6OZlP7J12Eyp10hgTirIwKHDMCsm3Angm4/kQIYXtK1dQ=
X-Received: by 2002:a05:6e02:330a:b0:430:a110:a8b with SMTP id
 e9e14a558f8ab-4330d15282bmr157450595ab.13.1762080946122; Sun, 02 Nov 2025
 02:55:46 -0800 (PST)
MIME-Version: 1.0
References: <20251008084444.3525615-1-peter.lin@sifive.com> <20251008084444.3525615-5-peter.lin@sifive.com>
In-Reply-To: <20251008084444.3525615-5-peter.lin@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 2 Nov 2025 16:25:34 +0530
X-Gm-Features: AWmQ_bmmSk5mrDK3MV49nBjPhZYT0hNKsj1tdKUr6WJaMVl5EKZsECd3zaVBNV8
Message-ID: <CAAhSdy2PZTiQ2VvrJA-HvUM-=sdebiQr=oZcJAjXM7HajWL9Bw@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] lib: sbi_hart: return error when insufficient PMP
 entries available
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com, greentime.hu@sifive.com, 
	wxjstz@126.com, alvinga@andestech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_025547_270916_675A5592 
X-CRM114-Status: GOOD (  18.38  )
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

T24gV2VkLCBPY3QgOCwgMjAyNSBhdCAyOjE04oCvUE0gWXUtQ2hpZW4gUGV0ZXIgTGluIDxwZXRl
ci5saW5Ac2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiBQcmV2aW91c2x5LCB3aGVuIG1lbW9yeSByZWdp
b25zIGV4Y2VlZCBhdmFpbGFibGUgUE1QIGVudHJpZXMsCj4gc29tZSByZWdpb25zIHdlcmUgc2ls
ZW50bHkgaWdub3JlZC4gSWYgdGhlIGxhc3QgZW50cnkgdGhhdCBjb3ZlcnMKPiB0aGUgZnVsbCA2
NC1iaXQgYWRkcmVzcyBzcGFjZSBpcyBub3QgYWRkZWQgdG8gYSBkb21haW4sIHRoZSBuZXh0Cj4g
c3RhZ2UgUy1tb2RlIHNvZnR3YXJlIHdvbid0IGhhdmUgcGVybWlzc2lvbiB0byBhY2Nlc3MgYW5k
IGZldGNoCj4gaW5zdHJ1Y3Rpb25zIGZyb20gaXRzIG1lbW9yeS4gU28gcmV0dXJuIGVhcmx5IHdp
dGggZXJyb3IgbWVzc2FnZQo+IHRvIGNhdGNoIHN1Y2ggc2l0dWF0aW9uLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogWXUtQ2hpZW4gUGV0ZXIgTGluIDxwZXRlci5saW5Ac2lmaXZlLmNvbT4KPiAtLS0KPiAg
bGliL3NiaS9zYmlfaGFydC5jIHwgMjIgKysrKysrKysrKysrKysrKy0tLS0tLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9saWIvc2JpL3NiaV9oYXJ0LmMgYi9saWIvc2JpL3NiaV9oYXJ0LmMKPiBpbmRleCBkMDE4NjE5
Yi4uMDMyZjdkYzEgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfaGFydC5jCj4gKysrIGIvbGli
L3NiaS9zYmlfaGFydC5jCj4gQEAgLTMyNCw2ICszMjQsMTYgQEAgc3RhdGljIHZvaWQgc2JpX2hh
cnRfc21lcG1wX3NldChzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gsCj4gICAgICAgICB9Cj4g
IH0KPgo+ICtzdGF0aWMgYm9vbCBpc192YWxpZF9wbXBfaWR4KHVuc2lnbmVkIGludCBwbXBfY291
bnQsIHVuc2lnbmVkIGludCBwbXBfaWR4KQo+ICt7Cj4gKyAgICAgICBpZiAocG1wX2NvdW50ID4g
cG1wX2lkeCkKPiArICAgICAgICAgICAgICAgcmV0dXJuIHRydWU7Cj4gKwo+ICsgICAgICAgc2Jp
X3ByaW50ZigiRVJSOiBpbnN1ZmZpY2llbnQgUE1QIGVudHJpZXNcbiIpOwo+ICsKClJlZHVuZGFu
dCBuZXdsaW5lIGhlcmUuIEFsc28sICJlcnJvcjoiIGlzIGJldHRlciB0aGFuICJFUlI6Ii4KSSB3
aWxsIHRha2UgY2FyZSBvZiB0aGlzIGF0IHRoZSB0aW1lIG9mIG1lcmdpbmcgdGhpcyBwYXRjaC4K
ClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKVGhhbmtzLApB
bnVwCgo+ICsgICAgICAgcmV0dXJuIGZhbHNlOwo+ICt9Cj4gKwo+ICBzdGF0aWMgaW50IHNiaV9o
YXJ0X3NtZXBtcF9jb25maWd1cmUoc3RydWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoLAo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgcG1wX2NvdW50LAo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgcG1wX2xv
ZzJncmFuLAo+IEBAIC0zNDgsOCArMzU4LDggQEAgc3RhdGljIGludCBzYmlfaGFydF9zbWVwbXBf
Y29uZmlndXJlKHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCwKPiAgICAgICAgICAgICAgICAg
LyogU2tpcCByZXNlcnZlZCBlbnRyeSAqLwo+ICAgICAgICAgICAgICAgICBpZiAocG1wX2lkeCA9
PSBTQklfU01FUE1QX1JFU1ZfRU5UUlkpCj4gICAgICAgICAgICAgICAgICAgICAgICAgcG1wX2lk
eCsrOwo+IC0gICAgICAgICAgICAgICBpZiAocG1wX2NvdW50IDw9IHBtcF9pZHgpCj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAgICAgICAgICAgIGlmICghaXNfdmFsaWRf
cG1wX2lkeChwbXBfY291bnQsIHBtcF9pZHgpKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJl
dHVybiBTQklfRUZBSUw7Cj4KPiAgICAgICAgICAgICAgICAgLyogU2tpcCBzaGFyZWQgYW5kIFNV
LW9ubHkgcmVnaW9ucyAqLwo+ICAgICAgICAgICAgICAgICBpZiAoIVNCSV9ET01BSU5fTUVNUkVH
SU9OX01fT05MWV9BQ0NFU1MocmVnLT5mbGFncykpIHsKPiBAQCAtMzcyLDggKzM4Miw4IEBAIHN0
YXRpYyBpbnQgc2JpX2hhcnRfc21lcG1wX2NvbmZpZ3VyZShzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNj
cmF0Y2gsCj4gICAgICAgICAgICAgICAgIC8qIFNraXAgcmVzZXJ2ZWQgZW50cnkgKi8KPiAgICAg
ICAgICAgICAgICAgaWYgKHBtcF9pZHggPT0gU0JJX1NNRVBNUF9SRVNWX0VOVFJZKQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgIHBtcF9pZHgrKzsKPiAtICAgICAgICAgICAgICAgaWYgKHBtcF9j
b3VudCA8PSBwbXBfaWR4KQo+IC0gICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ICsgICAg
ICAgICAgICAgICBpZiAoIWlzX3ZhbGlkX3BtcF9pZHgocG1wX2NvdW50LCBwbXBfaWR4KSkKPiAr
ICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VGQUlMOwo+Cj4gICAgICAgICAgICAg
ICAgIC8qIFNraXAgTS1vbmx5IHJlZ2lvbnMgKi8KPiAgICAgICAgICAgICAgICAgaWYgKFNCSV9E
T01BSU5fTUVNUkVHSU9OX01fT05MWV9BQ0NFU1MocmVnLT5mbGFncykpIHsKPiBAQCAtNDA3LDgg
KzQxNyw4IEBAIHN0YXRpYyBpbnQgc2JpX2hhcnRfb2xkcG1wX2NvbmZpZ3VyZShzdHJ1Y3Qgc2Jp
X3NjcmF0Y2ggKnNjcmF0Y2gsCj4gICAgICAgICB1bnNpZ25lZCBsb25nIHBtcF9hZGRyOwo+Cj4g
ICAgICAgICBzYmlfZG9tYWluX2Zvcl9lYWNoX21lbXJlZ2lvbihkb20sIHJlZykgewo+IC0gICAg
ICAgICAgICAgICBpZiAocG1wX2NvdW50IDw9IHBtcF9pZHgpCj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgYnJlYWs7Cj4gKyAgICAgICAgICAgICAgIGlmICghaXNfdmFsaWRfcG1wX2lkeChwbXBf
Y291bnQsIHBtcF9pZHgpKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBTQklfRUZB
SUw7Cj4KPiAgICAgICAgICAgICAgICAgcG1wX2ZsYWdzID0gMDsKPgo+IC0tCj4gMi40OC4wCj4K
Ci0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
