Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E0AC55174
	for <opensbi@archiver.kernel.org>; Wed,  5 Aug 2026 12:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QO9SWZ/VWnZlKrWnIhvS2chsCYfo4doEZX02m+nK4Ko=; b=D9svNtfosdREtc
	vHkJOh9gOGNHQs6K0JkxDLyfVjHN4vL6ftmB4VLkLCkDtGxRr2v8UIQxCP+P87B3xV0p5LXcyEMZ3
	sinpkNDkNXvGlZnTWIj+PnUHv+OaiewKx3SKt5SzQtKaNwwH+zT17jSr8RUWx/rjzkSNqY+//COKH
	tbOrVQSGoWfmnRtkrI36yOet31A9Bww6Y9JFkkZ4D7L70b4Y6xabJEf6KArUCK/U2XKbow9TA5SGZ
	Eiv7+hHQLHBiekR+PwPkJn2sye1DW11vTQ+EfvltCg4cJj5R0ocNoCOOfSN+xu2GzmAdmBi0qCckQ
	SqA9r3CkLK9mus6pmgfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wraWP-00000003seZ-2Mdg;
	Wed, 05 Aug 2026 12:14:57 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wraWN-00000003seC-0Y8f
	for opensbi@lists.infradead.org;
	Wed, 05 Aug 2026 12:14:56 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4956869750eso6512595e9.2
        for <opensbi@lists.infradead.org>; Wed, 05 Aug 2026 05:14:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785932092; cv=none;
        d=google.com; s=arc-20260327;
        b=YVwEmlIHUpcEl1FXerpU6zbBEKW0Lb7OCZyKwleK2ZVVo0W1Pgb1Gx0iiuluKeiB9G
         /PJFCgyQkaOeiCV4dvUmYooPM9wmAIRqLWG25fjXBbGPdyGWe6trvlAomgpSUBEn2gtk
         g/3mrY+lldYkvvSQCwnh/XzbFgpNg38u++2lWqd3ZYVhzJdT7PHaZrHaKX/zv/3ZtMQy
         Ntkg3k7/3nd7vfhrUkTohcPr1HZmj4sL9CPwWbByTJiH+3wjMzFjTGAm/IbT2Zfs/Rkf
         4FSheCxITkT3vhXEugNtG2/FJh2kBDsHG+tGgspDrO3CwtGc1PXop+fF0kgosGcRXz0B
         F/dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rB+gw9dKDWO7xxTfY28xERukfPB31JFWTEankAJKUVQ=;
        fh=pWhvtk1GRgDCmXLQ3/ZP2N4ZRwOGsKwb5OM6kg2ZIhc=;
        b=SiiEMaRCjcOIVZLOG/6uNkhf2KACdIyq8iwFSwrH80O5i6bWW1n1WTW8dXERC3KIos
         A6hFDlUit9eoG7SOjoigi3el3bPFcVAG43WAtILw+d+9DmkDCDw2B3a6+e4uGJQ/AEb0
         eZzXEhawZNt/V3cAgmYo/zhsQF+aBggit2Ib9prbAtodD2oIj9u+CEmPKS4ezcLkR9gP
         1C8KT3kPnGDzmr6CyJHT29K97zEVhP0g0WyhCf3LHNn8FQUxv+ZOv4uGLJYj4W2Alb00
         +gPA9AbB/a6wFGCnBWyeZlppqeo8JoLT79l2Q1YqfADjx/bpCWgo/mDUDJhPvCc1e8bX
         A5bA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1785932092; x=1786536892; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rB+gw9dKDWO7xxTfY28xERukfPB31JFWTEankAJKUVQ=;
        b=vpMgAgxYFSXghxMCdudyv+X/u8/ekWcr6E6jRiDNchmbA7CxYOCqYWgo9Gh1qagrjw
         4UkmLMi6qqkSMsaz840V6CTamIOR1Id0zxtDdNRwejJVYDY6ljBg/IeeiSMyQ5bpdgHA
         PgtBnS5tFE1c83dpbPN8AYyuvByYnMuF2KfwMQDlRRM0BZBX0zrswufzIz6YLhtbREBw
         MNYk5YmyWknEGqK7h9PXNZsivUbwC0WfkQ6RFV8SDjZRm14nT1FSxqjmBZr43h7SIx0A
         34+tAIPxkJrEs7xXqzJQJkDCpo/PGMdkI/OGhr0O3YNHGsnVIoXDGmoed6+k2Wb9LFVi
         UmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785932092; x=1786536892;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rB+gw9dKDWO7xxTfY28xERukfPB31JFWTEankAJKUVQ=;
        b=TmpMSoFURwgoiiSX/NgqdP+c0eRU3aCxKhEMl7/JQYle+gL98xTcadpR83I49e58ir
         Df/acSWzP8R+nFRS3zj+oq9LXFSz84Hw20Qu3BpnYF/i+Vm9xf9Y1eeogO8L7xEreYO7
         aeJctBCtPA7aNtB4ZVGrRFUOuJ2fijMCo759/CuXME72c7m/4Lvoxd2ctROKBdIzR6bt
         vvuSxlLGmmviZcnCwRHcOiPMxcoBi8b1LnI8IIUOB55W8JVS/gXEcDN6Eh28TRh4fuzF
         lZUbD3e7sAUlbA1rVKrERDYiqIdHFPPsqCI1zNXfpxVofck4fOxnQlEN0LxG++q5lWC6
         9YdA==
X-Forwarded-Encrypted: i=1; AHgh+Rr4zCCzrm4LmBF1NMn454QxsJNmHg7R+pwVnfeM06Jt89/NAybMJ9zhQyemMprN8dedEvsMUCW2@lists.infradead.org
X-Gm-Message-State: AOJu0Yzw5whpvAfMiN1z9VEeMcH9Nqz01dsw2gAlhiJ4CS6dFJQ8jATo
	hBcU3TAcFnR43slkh0Dhtv5Gi00T6IlUmzK7iShIHb3SDDpKZ6jS6ozqOq83IA2fh2POr7c1krA
	8UDh4EZ5iGkBLB+qypk6ZXi/9yQJOlh6fkKQIGeo3LAiL+FJ/uVbUjH5J6Q==
X-Gm-Gg: AR+sD1057Y8QsrdRPNLeQRUoXfU3rUh/HXfsOgQEOzLRVsQrqJp9pBGEVpAvtYpCzqM
	J8M+VUPRo2VCb29yA1v0PZ+czkXUjI6/SpeS6a20ia3m+BaZ0y5XgSzzIB2KXZOuLeTnnYf516J
	Kg8O3HMJZXnMCHB+7/64rn/ZE9xhPEC/dFHptoXmOpGJYlTP1Hy5YeIWegSy5yoIVyJNurG5mei
	J8DgoEWrFwL58ZdpjwaHPq0pyErxg3PkStpm+YDRMeAsKWdWOhewPxF/Lxl3XYw5BrGC1LjGAmb
	oEr1m2o/lX0Gle9xGfoagsLWhRZwp2V3vN3QbwDrTQxVDMWClh7DPXTrpL3PAHOOxgO3/6fDTPt
	x2JXxkTwXQf1QYCp9DfTPg6ZNNJlSr+G9FdlTkaYhswFm9AC39+BiZRhX5rXtV9yN
X-Received: by 2002:a7b:cd19:0:b0:495:4bf3:2150 with SMTP id
 5b1f17b1804b1-4994e7af664mr61398485e9.8.1785932092279; Wed, 05 Aug 2026
 05:14:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260717074413.2536416-1-anup.patel@oss.qualcomm.com>
 <20260717074413.2536416-5-anup.patel@oss.qualcomm.com> <al30Fax18B3Ev/qS@plin-1878>
 <CAAhSdy089rACuAxxuxhdmF=_Hu_kGokGqzSvqA2UTaC4=2oyQg@mail.gmail.com> <anMEe1XLBZJn+PLM@plin-1878>
In-Reply-To: <anMEe1XLBZJn+PLM@plin-1878>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 5 Aug 2026 17:44:40 +0530
X-Gm-Features: AUfX_mzBv0_lgS_fVUiTra9SC5R1yq9BpcHebbWgcYCKsIQiePi_I4qe07q3x4A
Message-ID: <CAAhSdy10o7rzx5VCM6m9ShgNVeoqrwgsA4G0gjaHn1eJ-DDWzA@mail.gmail.com>
Subject: Re: [PATCH 4/5] lib: sbi: Extend hart protection abstraction to allow
 ID configuration
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Atish Patra <atish.patra@linux.dev>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Samuel Holland <samuel.holland@sifive.com>, 
	opensbi@lists.infradead.org, raymondmaoca@gmail.com, zong.li@sifive.com, 
	jim.shu@sifive.com, pawandeep.oza@oss.qualcomm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_051455_205925_137DF12F 
X-CRM114-Status: GOOD (  20.71  )
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

T24gV2VkLCBBdWcgNSwgMjAyNiBhdCAzOjA44oCvUE0gWXUtQ2hpZW4gUGV0ZXIgTGluIDxwZXRl
ci5saW5Ac2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiBIaSBBbnVwLAo+Cj4gT24gTW9uLCBKdWwgMjAs
IDIwMjYgYXQgMDQ6MTk6MTBQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPiA+IE9uIE1vbiwg
SnVsIDIwLCAyMDI2IGF0IDM6NDDigK9QTSBZdS1DaGllbiBQZXRlciBMaW4gPHBldGVyLmxpbkBz
aWZpdmUuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gSGkgQW51cCBhbmQgUmF5bW9uZCwKPiA+ID4K
PiA+ID4gT24gRnJpLCBKdWwgMTcsIDIwMjYgYXQgMDE6MTQ6MTJQTSArMDUzMCwgQW51cCBQYXRl
bCB3cm90ZToKPiA+ID4gPiBUaGVyZSBhcmUgdmFyaW91cyBJRCBjb25maWd1cmF0aW9uIElTQSBl
eHRlbnNpb25zIHN1Y2ggYXMgUklTQy1WIFdvcmxkcywKPiA+ID4gPiBTdXBlcnZpc29yIGRvbWFp
biBJRCwgUW9TIElELCBldGMgd2hpY2ggbmVlZCB0byBiZSByZS1jb25maWd1cmVkIHVwb24KPiA+
ID4gPiBkb21haW4gY29udGV4dCBzd2l0Y2ggb24gYSBoYXJ0LiBFeHRlbmQgaGFydCBwcm90ZWN0
aW9uIGFic3RyYWN0aW9uIHRvCj4gPiA+ID4gc3VwcG9ydCBib3RoIG1lbW9yeSBwcm90ZWN0aW9u
IGFuZCBJRCBjb25maWd1cmF0aW9uIElTQSBleHRlbnNpb25zLgo+ID4gPgo+ID4gPiBJIHdpbGwg
cmV3b3JrIG15ICJbUkZDLDAwLzEyXSBBZGQgUklTQy1WIFdvcmxkcyBJU0Egc3VwcG9ydCB0byBP
cGVuU0JJIgo+ID4gPiBzZXJpZXMgYmFzZWQgb24gdGhpcyBzZXJpZXMuCj4gPgo+ID4gVGhhbmtz
IFBldGVyIQo+ID4KPiA+IFRoZSBSSVNDLVYgd29ybGQgRFQgcHJvcGVydHkgcGFyc2luZyBjYW4g
YmUgZG9uZSBhdCB0aGUKPiA+IHRpbWUgb2YgcGFyc2luZyBkb21haW5zIGZyb20gRkRUIChsaWtl
IGFscmVhZHkgZG9uZSBpbiB0aGlzCj4gPiBzZXJpZXMpLiBUaGUgaGFydCBwbGF0Zm9ybSBhYnN0
cmFjdGlvbiB3aWxsIGJlIG9ubHkgZm9yIGNvbmZpZ3VyaW5nCj4gPiB0aGUgUklTQy1WIHdvcmxk
IENTUnMuCj4gPgo+ID4gTWF5IGJlIHlvdSBjYW4gYWRkIHNiaV9oYXJ0X3dvcmxkcy5jIChqdXN0
IGxpa2Ugc2JpX2hhcnRfcG1wLmMpID8KPiA+Cj4gPiBGb3IgUklTQy1WIHdvcmxkIGNoZWNrZXJz
LCB3ZSBjYW4gaGF2ZSBzZXBhcmF0ZSBGRFQgYmFzZWQgZHJpdmVyCj4gPiB1bmRlciBsaWIvdXRp
bHMgd2hpY2ggd2lsbCByZWdpc3RlciBzYmlfZG9tYWluX2RhdGEgaW5zdGFuY2UgdXBvbiBwcm9i
ZQo+ID4gb2YgZWFjaCBSSVNDLVYgd29ybGQgY2hlY2tlciBpbnN0YW5jZS4gVGhlIGRvbWFpbl9z
ZXR1cCgpIGFuZAo+ID4gZG9tYWluX2NsZWFudXAoKSBjYWxsYmFja3Mgb2YgdGhlIFJJU0MtViB3
b3JsZHMgY2hlY2tlciBkcml2ZXIgd2lsbAo+ID4gcHJvZ3JhbSB0aGUgUklTQy1WIHdvcmxkIGNo
ZWNrZXIgTU1JTyByZWdpc3RlcnMuCj4KPiBJIGV4cGVjdCB0aGUgd2dDaGVja2VyIGRyaXZlciB3
aWxsIGJlIGltcGxlbWVudGVkIGFzIGEgZ2xvYmFsIEZEVAo+IGRyaXZlciwgbm90IGJvdW5kIHRv
IGRvbWFpbiBzdGF0ZS4gQSBjaGVja2VyIHNsb3QgdGFibGUgY29udGFpbnMKPiBhbGwgV0lEcycg
cGVybWlzc2lvbnMgc2ltdWx0YW5lb3VzbHkgYW5kIHJlbWFpbnMgdW5jaGFuZ2VkIGR1cmluZwo+
IHJ1bnRpbWUgKG1pZ2h0IGJlIGxvY2tlZCkuIFNvIEkgdGhpbmsgd2Ugc2hvdWxkIG5vdCBhZGQg
d2dDaGVja2VyCj4gZG9tYWluX3NldHVwL2RvbWFpbl9jbGVhbnVwIGNhbGxiYWNrcy4KPgoKSSBh
Z3JlZSB3aXRoIHlvdXIgc3VnZ2VzdGlvbi4gVGhlIHdnQ2hlY2tlciBpcyBxdWl0ZSBzaW1wbGUg
YW5kCmRvZXMgbm90IG5lZWQgYW55IGluLW1lbW9yeSBkYXRhIHN0cnVjdHVyZXMgdG8gYmUgYWxs
b2NhdGVkIChsaWtlCklPLU1QVCkgc28gYSBub3JtYWwgRkRUIGRyaXZlciBwcm9iZWQgdmlhIHBs
YXRmb3JtIGZpbmFsIGluaXQgc2hvdWxkCmJlIGZpbmUuCgpSZWdhcmRzLApBbnVwCgotLSAKb3Bl
bnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
