Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA0EC44515
	for <opensbi@archiver.kernel.org>; Mon, 20 Jul 2026 07:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4q8IeNeoeTk8HBkREZt9+KRbrat75rEFECdQbhSXoIY=; b=KnBpVLDwh8qahM
	j52oPiOIeHlfWoySdGyGWPHrIpcG5H2EyxkSnkOhfA0diXxHkpdKZKEzvj3AQ8+YTSQIZhFXnoF93
	y05MDaZ/n2Wl3nz28Wmwj6M4JMxq1eNLZtYSsWfW1jFNN3AocniYHhJiHI37bKERtGdA6kl6qTRmH
	qm1tyyQ9SCfQLhxBAle/Yt8taHqMCzLnAG3vHnXiPScufrBKw5qoW8jFIFAxAOqJoePGyyP6LOXwu
	EEUt03vlV19trvzgaeYHlIrHfwIfL+zLvzKP26OJxHZBbTdSRX5KYSbfYgtnSGqFsvFi4/O/YQxJy
	n/28LOnmKvIZCspWgdGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliqm-000000068vP-1VjZ;
	Mon, 20 Jul 2026 07:55:44 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliqk-000000068v2-2Yul
	for opensbi@lists.infradead.org;
	Mon, 20 Jul 2026 07:55:43 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-383cb94f742so8909630a91.3
        for <opensbi@lists.infradead.org>; Mon, 20 Jul 2026 00:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1784534142; x=1785138942; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o82+MVZcJplr3rMtf+6acSc4YorEUAbh+bHsOW+l7WE=;
        b=aYtZG2E/ldVEsaNCoVVuJrFHNnUiJVlZJvzsYdYzX1zK7YQxwA8b/qPV9R+uSAOqzS
         H6j1MJjnCetPiZ/W4AJtIWFIscycbFMcPyvi9k0rcJ8wRuTDaPeCjXfKcel7CfPG8SNm
         8oS24qEEqaG6CxVnHSX9bxFLBPI1cKCtOwVCDqWjVMnrVolhbzduRgP05d5z2TKTNGXg
         OjkZErGTZ1Dnt7+jfICzhoFiGWFTfzykKPJGJ27JAFCmS3wM8aFhZy4HeCmFFSrdOhQm
         PL3oiXRkahfITF9Vpav93EK2sKTNP3ggB+8X5IRlBQFYHd4aBBzMtCQIU1uOEckH8k97
         heQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784534142; x=1785138942;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=o82+MVZcJplr3rMtf+6acSc4YorEUAbh+bHsOW+l7WE=;
        b=q8kpMAsev8ZTW8K3K1EFPqCsAxZkJySaY8TQ/YbtoRPP4QV4n3dxjjflDkLuh6AuHa
         v/7yxl3vJiDt1hepIxiKwL4/Dxfj5RXulPWd+Mv4S3YkZepzFrK4i+larFb4opbKXgMz
         YFqIHAdo5Gv8ElZUiO9AXs4U/XtdzHt9BJ48WbaSZ1v4NqCd3VopmFqZb5Me+THl75+V
         2dN9T/oMkD0vwSaZJeAyHkOd7XOmgF3EtdF2ZIsLjVhdA7aMrSxVISwdL8D1rIvfFQKT
         juDqqduEfNWH5T4DF0GManYf8tn/UugM/Wp/Q/8YR8eg1aX+h/ntfRgGLy6f2P6qQlHG
         T99A==
X-Gm-Message-State: AOJu0YzvoJ52t0DfAuCCdPLvhqxyyo5PG7wCoQBya+6h6py8IpHB0Pl4
	NIeZPK1Mm//lUkOBadpgnPgLAo/y8C8c4IljwiDBK4i162/PmAR2sUAnD0htZ+7mcrYNYeXPGc6
	Z8GgVPIk=
X-Gm-Gg: AfdE7cm3uVKI0fHJkhMS9HnHE87o0WbfvSkTSoOYbTArPdpJ22hCStJ4fGJBAFErnGZ
	HJksrWb0AdsuYz3ANLawlkIH9s2yi2U6kKAgTfXLxPS6x36SdH4FYH25e3204xHPuEqwpwfmoHD
	mE43Cgu4JkIOAiLmLZsZ4aj+m7v7h7JldDlX0SyKYgGyJQk3/nkJS6K8rRWnFFF1l7W7gHmJjvj
	9uKKY3sMafi5Fay3Xpit73zXduKkna+dVshIXgrMNIjbcywC24SgnWpyDq15kSoJkYwAnZLoc8f
	egJyS6nxiqzunxhXWw9PH/3Ynj0VYUjubfermF+eQEz24AALyZUFA04qP1+2vNy7jfav0V4HBRv
	xvNV9fD0vwj29VU5I5ypIsxkOo04TfJQt9nHh4lpSS3D2FGkmPxCkuGrz0i1dxLNoe6M+eztyYa
	WV
X-Received: by 2002:a17:90b:58ee:b0:37f:9ce0:af32 with SMTP id 98e67ed59e1d1-38e4b595a3dmr13167107a91.29.1784534141673;
        Mon, 20 Jul 2026 00:55:41 -0700 (PDT)
Received: from plin-1878 ([136.226.240.191])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e39de785dsm7052618a91.4.2026.07.20.00.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:55:41 -0700 (PDT)
Date: Mon, 20 Jul 2026 15:55:36 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com,
	greentime.hu@sifive.com, anup@brainfault.org, scott@riscstar.com,
	conor@kernel.org, dave.patel@riscstar.com, raymond.mao@riscstar.com,
	robin.randhawa@sifive.com, samuel.holland@sifive.com
Subject: Re: [RFC PATCH 05/12] include: sbi_domain: add Worlds WID fields
Message-ID: <al3UeLd8u0Dr8xRR@plin-1878>
References: <20260626101433.3133466-1-peter.lin@sifive.com>
 <20260626101433.3133466-6-peter.lin@sifive.com>
 <CAAVgOkJDsTUhon3MvUrw-ufHfzKOrEkK93vdmRV74KBC-hqkKA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAVgOkJDsTUhon3MvUrw-ufHfzKOrEkK93vdmRV74KBC-hqkKA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_005542_678197_BBBF0D59 
X-CRM114-Status: GOOD (  21.67  )
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

T24gTW9uLCBKdWwgMTMsIDIwMjYgYXQgMDI6NTI6MjdQTSAtMDcwMCwgUGF3YW5kZWVwIE96YSB3
cm90ZToKPiBPbiBGcmksIEp1biAyNiwgMjAyNiBhdCAzOjE24oCvQU0gWXUtQ2hpZW4gUGV0ZXIg
TGluIDxwZXRlci5saW5Ac2lmaXZlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gQWRkcyBuZXh0X3dpZCAo
dTMyIFdJRCBmb3IgbmV4dCBib290IHN0YWdlKSwgaGFzX25leHRfd2lkIChkaXN0aW5ndWlzaGVz
Cj4gPiBleHBsaWNpdCB6ZXJvIGZyb20gdW5zZXQgZm9yIHBtd2lkIGZhbGxiYWNrKSwgYW5kIG5l
eHRfd2lkbGlzdCAodTY0IGJpdG1hc2sKPiA+IHNwZWNpZnlpbmcgd2hpY2ggV0lEcyBjYW4gYmUg
ZGVsZWdhdGVkIHRvIHRoaXMgZG9tYWluKSB0byBzYmlfZG9tYWluCj4gPiBzdHJ1Y3R1cmUuIEVu
YWJsZXMgcGVyLWRvbWFpbiBXb3JsZCBJRCBjb25maWd1cmF0aW9uLgo+ID4KPiA+IFNpZ25lZC1v
ZmYtYnk6IFl1LUNoaWVuIFBldGVyIExpbiA8cGV0ZXIubGluQHNpZml2ZS5jb20+Cj4gPiAtLS0K
PiA+ICBpbmNsdWRlL3NiaS9zYmlfZG9tYWluLmggfCA2ICsrKysrKwo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCA2IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zYmkvc2Jp
X2RvbWFpbi5oIGIvaW5jbHVkZS9zYmkvc2JpX2RvbWFpbi5oCj4gPiBpbmRleCAxNmVkZDRjZS4u
N2Q1MjM0OTMgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL3NiaS9zYmlfZG9tYWluLmgKPiA+ICsr
KyBiL2luY2x1ZGUvc2JpL3NiaV9kb21haW4uaAo+ID4gQEAgLTIxMSw2ICsyMTEsMTIgQEAgc3Ry
dWN0IHNiaV9kb21haW4gewo+ID4gICAgICAgICB1bnNpZ25lZCBsb25nIG5leHRfYWRkcjsKPiA+
ICAgICAgICAgLyoqIFByaXZpbGVnZSBtb2RlIG9mIG5leHQgYm9vdGluZyBzdGFnZSBmb3IgdGhp
cyBkb21haW4gKi8KPiA+ICAgICAgICAgdW5zaWduZWQgbG9uZyBuZXh0X21vZGU7Cj4gPiArICAg
ICAgIC8qKiBOZXh0IGJvb3Rpbmcgc3RhZ2UgV29ybGQgSUQgZm9yIHRoaXMgZG9tYWluICovCj4g
PiArICAgICAgIHUzMiBuZXh0X3dpZDsKPiBvemE6IFRoZSBuZXh0XyBjb252ZW50aW9uIHdvcmtz
IHdlbGwgZm9yIG9uZS10aW1lIGJvb3QgaGFuZG9mZiBmaWVsZHMKPiBsaWtlIG5leHRfYWRkciBh
bmQgbmV4dF9tb2RlCj4gQnV0IG5leHRfd2lkIGFuZCBuZXh0X3dpZGxpc3QgYXJlIG5vdCBvbmUt
dGltZSBib290IGZpZWxkcyDigJQgdGhleSBhcmU6Cj4gV3JpdHRlbiBvbiBldmVyeSBkb21haW4g
ZW50cnkgdmlhIHNiaV9kb21haW5fd29ybGRzX2VudGVyKCkKPiBBY3RpdmUgdGhyb3VnaG91dCB0
aGUgZG9tYWluJ3MgbGlmZXRpbWUKPiBSdW50aW1lIGlzb2xhdGlvbiBwb2xpY3ksIG5vdCBhIGJv
b3QgaGFuZG9mZiB2YWx1ZQo+IFNvIHRoZSBuZXh0XyBuYW1pbmcgaXMgc2VtYW50aWNhbGx5IG1p
c2xlYWRpbmcgaGVyZQo+IAo+IHdoeSBub3QganVzdCBoYXZlIHRoaXMgbmFtaW5nCj4gCj4gd2lk
VGhlCj4gV0lEIGFzc2lnbmVkIHRvIHRoaXMgZG9tYWluLgo+IGhhc193aWQKPiBsd2lkX2RlbGVn
Cj4gVGhlIGRlbGVnYXRpb24gYnVkZ2V0IHRvIGxvd2VyIGxldmVscy4KCkdvb2QgY2F0Y2ghIFRo
YXQncyBpbmRlZWQgYmV0dGVyIG5hbWluZy4gSSBwcmVmZXIgd2lkX2RlbGVnCm92ZXIgbHdpZF9k
ZWxlZyB0byBtaXJyb3IgdGhlIE1XSURERUxFRyBDU1IgbmFtZS4gSG9wZSB0aGF0CndvcmtzIGZv
ciB5b3UKClRoYW5rcywKUGV0ZXIgTGluCgo+IAo+ID4gKyAgICAgICAvKiogV2hldGhlciBuZXh0
X3dpZCB3YXMgZXhwbGljaXRseSBzZXQgKi8KPiA+ICsgICAgICAgYm9vbCBoYXNfbmV4dF93aWQ7
Cj4gPiArICAgICAgIC8qKiBOZXh0IGJvb3Rpbmcgc3RhZ2UgV29ybGQgSUQgZGVsZWdhdGlvbiBi
aXRtYXNrIGZvciB0aGlzIGRvbWFpbiAqLwo+ID4gKyAgICAgICB1NjQgbmV4dF93aWRsaXN0Owo+
ID4gICAgICAgICAvKiogSXMgZG9tYWluIGFsbG93ZWQgdG8gcmVzZXQgdGhlIHN5c3RlbSAqLwo+
ID4gICAgICAgICBib29sIHN5c3RlbV9yZXNldF9hbGxvd2VkOwo+ID4gICAgICAgICAvKiogSXMg
ZG9tYWluIGFsbG93ZWQgdG8gc3VzcGVuZCB0aGUgc3lzdGVtICovCj4gPiAtLQo+ID4gMi40My43
Cj4gPgo+ID4KPiA+IC0tCj4gPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+ID4gb3BlbnNiaUBsaXN0
cy5pbmZyYWRlYWQub3JnCj4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL29wZW5zYmkKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9v
cGVuc2JpCg==
