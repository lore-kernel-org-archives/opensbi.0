Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA7360A2600
	for <opensbi@archiver.kernel.org>; Fri, 30 Oct 2026 10:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jb4w0i+n;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=iy+libgR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UmFuIvFYlRrIuXMGqZgNArz3L8DZ2isuX0E8kNuNkKs=; b=jb4w0i+neixGmeU15Yuo/EKe4D
	xIiqPw5ooTQlQA38TUSrlBkvOYRb5tDLumKTPhtNbr/KNSxs5J7JdWQApv2qvkVr53xiCYEDHojT6
	dB82+TyXV1o48fWYyJl8o9veNhmqLs+xBtuOqPqoDvBOnZYWDmewm+wA7U0Hhz+SiJXi/fKl2GoFx
	gEkNn23QGwP5YAB13NmcOROqb3wlC5wALL50zMRg/44Ihh10sWpyI+Wg6ekyFLNJ/N06uLET236Qu
	K9tqRk+qYSSvESS+YQJ/oQ/miHVr16gQS1gCa7Hi5jYGbP+5ECwGspB4npTiAlu/qTZITdB+uItVb
	zKywn/0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkBB-0000000BRsm-3iEn;
	Fri, 30 Oct 2026 10:49:49 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkB8-0000000BRrO-38z5
	for opensbi@lists.infradead.org;
	Fri, 30 Oct 2026 10:49:48 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3aded3c6103so261427a91.0
        for <opensbi@lists.infradead.org>; Fri, 30 Oct 2026 03:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1793357385; x=1793962185; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WFK2HaJPlhrXxI/NLBLMbm7LrO5QPXP9hfR7nrsf6wo=;
        b=iy+libgRE6YCq1NuV3OBkRpim6hTxtd+LpJmD/aQChD1YoQ/3urap5P0EKg4MMzZYG
         f/fzGt01CYtb9aQZ2MOuI1Bz1gH+37YQQYBykv+1C1gA0XUmhVcFp0qG4ruF8RweuJLH
         w8FYdotnGOfczEOzVHdLoqV1sUZCm6BQzhOTWbnY6pGJowQllkpv95apCTHB5/XAJKu0
         bfthmk8wGZKssbpLsfuX7sbJkWuj1jHO0EQb94iaxojVEtfzEOudjXS8jNOqBi21AxL6
         TQVLNOKrQ4jx+EMEiuVlM6iX4vH7pROZcnz6ww2hgagjLt1ulpkpodL3oILd/ekeKjrc
         2YPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793357385; x=1793962185;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WFK2HaJPlhrXxI/NLBLMbm7LrO5QPXP9hfR7nrsf6wo=;
        b=pClZhocDRKysNzEpxEv7sAbjthQJcEo6hkhyBalieyl3N/qJ0m2Qb11VkjT+DYZcAm
         24BjQxYVFKHz6HjbAKBAPkWDaHUNbSBnGE/jCSQyPrGysumJs6MQOh/yMKgsXRrO0lrC
         Lg29Q4qq7nQObcbBwTgUkwMTipQBVlI5AsT3C1zvyxRkUgcKk8uF7zxqLnCxlMvmrL8a
         aicljRRMjO3+fgr5+DwBBUUN00xQdq6I8NXhiwOwgubgXJBWqIgC/AxFBmGjnixNL0jp
         HypfNe51toC4f/vU4rpMMyvnEPJ1UiSxmMyJBAZvSssdzprwIobJfUfLuZV3vPROVLIO
         C9uQ==
X-Gm-Message-State: AFq9FYLbSUsdAQp/XsCSNp4wMu/pnRpQEaG0y/iGhMzbxO0qF+ZqAZL6
	KBGStyjP1v8b5mknxEYgfKShhhvPGgmTZCAUfIGwHAPLomVY0lifOPx2p+fwmmYm6Xo=
X-Gm-Gg: AYBFou0DfX44EuyCKC+ArInr/ksuJ0ckM5sLlqzjb5iYicewVM54Bia2W4yVwlq8SjI
	HdUeX7QRwDgE0uaCQ8OAbBK07A6VfCe8yxBCh6sZUnpMy5j3dGAomnidKQd2RvNwBxI0kJcqB/E
	xIzSRuOTM3pmzSzVzlyRDUOGWrHyWfiRc6FPAqxDCWWWuQ4bShparWMBWsncwuKlsEH4POkYlCr
	6QdCRbjg0WuPhygxIGzOiwO8ITM0cL7vFxkfzg5zU2j3f8aPMXDNAaQiZB4APLQ1ez4ClhxxxJn
	NDsjK9Qmj6vthaikFb6XQZFsij+f8Q/DE62nmbf6k4HSXjbIxTbOyWsYFxhqZEK4mxyjzxAKUXV
	zvjFhxBgXOY9C3xfv9FHhVgk0ZuzTJ2DtBT8qwd/RAQQQdLBZoK5qZ57ukTlHsYDlkK2T4FYNBu
	jxOiVeDbEEtZEGIiPHanFqdPCKb8FypguvEbPTO/GDqgpOE3C3X+BCMT/45ugrnywkOReFmbK9o
	nOvoo374GFzQnQ3r5zl/EWJp5UdUeakD1AR3NmA/Ijt+5HscIch55Ee01nRRhBNfveAHx9QaNXF
	henVUb03W2M+fQN/uZV9sqwJJyM=
X-Received: by 2002:a17:90b:1d47:b0:3ac:2788:cab1 with SMTP id 98e67ed59e1d1-3ae897c3dc6mr1504151a91.30.1793357385399;
        Fri, 30 Oct 2026 03:49:45 -0700 (PDT)
Received: from plin-1878 ([136.226.240.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845df666sm3633988a91.14.2026.10.30.03.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:49:44 -0700 (PDT)
Date: Fri, 30 Oct 2026 18:49:40 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Anup Patel <anup@brainfault.org>, pawandeep.oza@oss.qualcomm.com,
	rkrcmar@qti.qualcomm.com
Cc: opensbi@lists.infradead.org, raymond.mao@riscstar.com,
	robin.randhawa@sifive.com, samuel.holland@sifive.com,
	zong.li@sifive.com, greentime.hu@sifive.com
Subject: Re: [PATCH v3 0/9] Add RISC-V Worlds ISA support to OpenSBI
Message-ID: <auR2RJRs5RHKGdvp@plin-1878>
References: <20261027083509.1076577-1-peter.lin@sifive.com>
 <CAAhSdy3C=w+Si19sfpn7ioqVSRMdz+2=eZ5gzdn3ohnoj8q3MQ@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy3C=w+Si19sfpn7ioqVSRMdz+2=eZ5gzdn3ohnoj8q3MQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_034946_792347_1C36FA5A 
X-CRM114-Status: GOOD (  24.56  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgQW51cCwKCk9uIFdlZCwgT2N0IDI4LCAyMDI2IGF0IDA0OjUwOjI0UE0gKzA1MzAsIEFudXAg
UGF0ZWwgd3JvdGU6Cj4gSGkgUGV0ZXIsCj4gCj4gT24gVHVlLCBPY3QgMjcsIDIwMjYgYXQgMjow
NeKAr1BNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+
ID4KPiA+IFRoaXMgcGF0Y2ggc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgdGhlIFJJU0MtViBXb3Js
ZHMgSVNBIGV4dGVuc2lvbnMgaW4KPiA+IE9wZW5TQkksIGludHJvZHVjaW5nIGEgV0lELWJhc2Vk
IGhhcnQgcHJvdGVjdGlvbiBiYWNrZW5kIHRvIGVuZm9yY2UKPiA+IGhhcmR3YXJlIGlzb2xhdGlv
biBib3VuZGFyaWVzIGFjcm9zcyBkb21haW5zLgo+ID4KPiA+IFRydXN0IE1vZGVsIGFuZCBCb290
LXRpbWUgUm9sZXMKPiA+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+Cj4gPiBU
aGUgaW1wbGVtZW50YXRpb24gYWRoZXJlcyB0byB0aGUgdHdvLXBoYXNlIE0tbW9kZSB0cnVzdCBt
b2RlbDoKPiA+Cj4gPiAtIFJvVCBNLW1vZGUgcGhhc2U6IEFuIGVhcmxpZXIgYm9vdCBzdGFnZSAo
ZS5nLiwgUk9NIG9yIFNQTCkgbWF5IHByb2dyYW0KPiA+ICAgbXdpZCBhbmQgbWx3aWRsaXN0LCBs
b2NraW5nIG13aWQgcHJpb3IgdG8gaGFuZGluZyBvZmYgZXhlY3V0aW9uIHRvCj4gPiAgIE9wZW5T
QkkuCj4gPgo+ID4gLSBSZWd1bGFyIE0tbW9kZSBwaGFzZSAoT3BlblNCSSk6IE9wZW5TQkkgdHJl
YXRzIHRoZSBub24tSVNBIHBsYXRmb3JtCj4gPiAgIGNvbnN0cmFpbnRzIChwbXdpZCwgcG13aWRs
aXN0LCBwbWx3aWRsaXN0KSBhbmQgQ1NSIHN0YXRlcyAobXdpZCwKPiA+ICAgbWx3aWRsaXN0KSBh
cyBpbW11dGFibGUgaW5wdXQgcG9saWNpZXMgZnJvbSB0aGUgaGFyZHdhcmUvUm9ULiBJdCBsb2Nr
cwo+ID4gICBtd2lkIGlmIHN0aWxsIHVubG9ja2VkLCBwcmV2ZW50aW5nIHN1YnNlcXVlbnQgTS1t
b2RlIHNvZnR3YXJlIGZyb20KPiA+ICAgYWx0ZXJpbmcgaXRzIG93biBXSUQsIGFuZCBwcm9ncmFt
cyBwZXItZG9tYWluIG1sd2lkIGFuZCBtd2lkZGVsZWcgYmFzZWQKPiA+ICAgb24gZGV2aWNlIHRy
ZWUgY29uZmlndXJhdGlvbi4KPiA+Cj4gPiBEZXZpY2UgVHJlZSBCaW5kaW5ncwo+ID4gLS0tLS0t
LS0tLS0tLS0tLS0tLS0KPiA+Cj4gPiBQZXItaGFydCBwcm9wZXJ0aWVzIGRlZmluZWQgaW4gTGlu
dXgga2VybmVsIERUIGJpbmRpbmdzIHYzIFsxXToKPiA+IC0gcmlzY3YscG13aWQ6IE0tbW9kZSBX
b3JsZCBJRAo+ID4gLSByaXNjdixwbXdpZGxpc3Q6IE0tbW9kZSBwZXJtaXR0ZWQgV0lEIGJpdG1h
cAo+ID4gLSByaXNjdixwbWx3aWRsaXN0OiBTL1UtbW9kZSBwZXJtaXR0ZWQgV0lEIGJpdG1hcAo+
ID4KPiA+IFBlci1kb21haW4gcHJvcGVydGllcyAoc2VlIGRvY3MvZG9tYWluX3N1cHBvcnQubWQp
Ogo+ID4gLSB3aWQ6IFdvcmxkIElEIGFzc2lnbmVkIHRvIHRoaXMgZG9tYWluIGZvciBTL1UtbW9k
ZQo+ID4gLSB3aWRkZWxlZzogV0lEIGRlbGVnYXRpb24gYml0bWFwIGZvciB0aGlzIGRvbWFpbgo+
ID4KPiA+IENoYW5nZXMgc2luY2UgdjIKPiA+IC0tLS0tLS0tLS0tLS0tLS0KPiA+IC0gTWFrZSAn
d2lkJyBwcm9wZXJ0eSBtYW5kYXRvcnkgZm9yIGFsbCBkb21haW5zIChpbmNsdWRpbmcgcm9vdCkg
d2hlbgo+ID4gICBTbWx3aWQgaXMgaW1wbGVtZW50ZWQ7IHJlamVjdCBtaXNjb25maWd1cmVkIGRv
bWFpbnMgYXQgYm9vdC4KPiA+IC0gUmVtb3ZlIE0tbW9kZSBXSUQgZmFsbGJhY2sgbG9naWMgKG13
aWQvcG13aWQpIGZvciBTLW1vZGUgZG9tYWluIFdJRC4KPiA+IC0gVmFsaWRhdGUgZG9tYWluIHdp
ZCBhbmQgd2lkZGVsZWcgYWdhaW5zdCBwbWx3aWRsaXN0IGFuZCBtbHdpZGxpc3QgbWFza3MuCj4g
PiAtIEludHJvZHVjZSBhIG5ldyBwYXRjaCB0byBwcm9wYWdhdGUgZXJyb3IgZnJvbSBzYmlfaGFy
dF9wcm90ZWN0aW9uX3JlY29uZmlndXJlKCkKPiA+ICAgaW4gc2JpX2RvbWFpbl9jb250ZXh0Lgo+
ID4gLSBBZGFwdCB0byB1cHN0cmVhbSBkb21haW4gc3RhdGUgZnJhbWV3b3JrIEFQSSByZW5hbWUg
KHNiaV9kb21haW5fZGF0YSAtPgo+ID4gICBzYmlfZG9tYWluX3N0YXRlKS4KPiA+IC0gVXBkYXRl
IGRvY3VtZW50YXRpb24gYW5kIGJvb3QgbG9nIG91dHB1dCBhY2NvcmRpbmdseS4KPiA+Cj4gPiBb
MV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXJpc2N2L2NvdmVy
LzIwMjYwODEyMTIyMTMxLjE1MzQ5MDYtMS1wZXRlci5saW5Ac2lmaXZlLmNvbS8KPiA+Cj4gPiBZ
dS1DaGllbiBQZXRlciBMaW4gKDkpOgo+ID4gICBsaWI6IHNiaV9oYXJ0OiBkZXRlY3QgUklTQy1W
IFdvcmxkcyBJU0EgZXh0ZW5zaW9ucwo+ID4gICBsaWI6IHV0aWxzOiBmZHRfaGVscGVyOiBwYXJz
ZSBSSVNDLVYgV29ybGRzIHBlci1oYXJ0IFdJRCBwcm9wZXJ0aWVzCj4gPiAgIGxpYjogZmR0X2Rv
bWFpbjogcGFyc2UgZG9tYWluIFdJRCBwcm9wZXJ0aWVzCj4gPiAgIGxpYjogc2JpX2hhcnQ6IGxv
Y2sgbXdpZCBDU1IgZm9yIFJvVCBpbW11dGFiaWxpdHkKPiA+ICAgbGliOiBzYmlfZG9tYWluX2Nv
bnRleHQ6IHByb3BhZ2F0ZSBlcnJvciBmcm9tCj4gPiAgICAgc2JpX2hhcnRfcHJvdGVjdGlvbl9y
ZWNvbmZpZ3VyZQo+ID4gICBsaWI6IHNiaV9oYXJ0X3dvcmxkczogSW1wbGVtZW50IFdJRCBoYXJ0
IHByb3RlY3Rpb24gYmFja2VuZAo+ID4gICBpbmNsdWRlOiBzYmlfdHlwZXM6IGFkZCBQUkl4NjQg
Zm9ybWF0IG1hY3JvCj4gPiAgIGxpYjogc2JpOiBkaXNwbGF5IFdvcmxkIElEIGNvbmZpZ3VyYXRp
b24gYXQgYm9vdAo+ID4gICBkb2NzOiBkb2N1bWVudCBXSUQgRFQgcHJvcGVydGllcwo+ID4KPiA+
ICBkb2NzL2RvbWFpbl9zdXBwb3J0Lm1kICAgICAgICAgICAgIHwgIDM2ICsrKysrCj4gPiAgaW5j
bHVkZS9zYmkvcmlzY3ZfZW5jb2RpbmcuaCAgICAgICB8ICAxMiArKwo+ID4gIGluY2x1ZGUvc2Jp
L3NiaV9kb21haW4uaCAgICAgICAgICAgfCAgIDYgKwo+ID4gIGluY2x1ZGUvc2JpL3NiaV9oYXJ0
LmggICAgICAgICAgICAgfCAgMTUgKysrCj4gPiAgaW5jbHVkZS9zYmkvc2JpX2hhcnRfd29ybGRz
LmggICAgICB8ICAyNCArKysrCj4gPiAgaW5jbHVkZS9zYmkvc2JpX3R5cGVzLmggICAgICAgICAg
ICB8ICAgMiArCj4gPiAgaW5jbHVkZS9zYmlfdXRpbHMvZmR0L2ZkdF9oZWxwZXIuaCB8ICAgMiAr
Cj4gPiAgbGliL3NiaS9vYmplY3RzLm1rICAgICAgICAgICAgICAgICB8ICAgMSArCj4gPiAgbGli
L3NiaS9zYmlfZG9tYWluLmMgICAgICAgICAgICAgICB8ICAyMCArKysKPiA+ICBsaWIvc2JpL3Ni
aV9kb21haW5fY29udGV4dC5jICAgICAgIHwgICA1ICstCj4gPiAgbGliL3NiaS9zYmlfaGFydC5j
ICAgICAgICAgICAgICAgICB8ICAzOCArKysrKysKPiA+ICBsaWIvc2JpL3NiaV9oYXJ0X3dvcmxk
cy5jICAgICAgICAgIHwgMjEwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgbGli
L3NiaS9zYmlfaW5pdC5jICAgICAgICAgICAgICAgICB8ICAxMyArKwo+ID4gIGxpYi91dGlscy9m
ZHQvZmR0X2RvbWFpbi5jICAgICAgICAgfCAgODQgKysrKysrKysrKysrCj4gPiAgbGliL3V0aWxz
L2ZkdC9mZHRfaGVscGVyLmMgICAgICAgICB8ICA5MCArKysrKysrKysrKysrCj4gPiAgcGxhdGZv
cm0vZ2VuZXJpYy9wbGF0Zm9ybS5jICAgICAgICB8ICAxMyArLQo+ID4gIDE2IGZpbGVzIGNoYW5n
ZWQsIDU2OSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBpbmNsdWRlL3NiaS9zYmlfaGFydF93b3JsZHMuaAo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBsaWIvc2JpL3NiaV9oYXJ0X3dvcmxkcy5jCj4gPgo+ID4gLS0KPiA+IDIuNDMuNwo+ID4KPiAK
PiBPdmVyYWxsLCB0aGlzIHNlcmllcyBpcyBpbiBncmVhdCBzaGFwZS4gT25jZSwgSSB3aWxsCj4g
bWVyZ2Ugb25jZSBteSBjb21tZW50cyBhcmUgYWRkcmVzc2VkLgoKU3VyZSwgY29tbWVudHMgYXJl
IGFkZHJlc3NlZCBhY2NvcmRpbmdseS4KCkhpIE96YSwgUmFkaW0sCgpQbGVhc2UgcmUtcmV2aWV3
IHRoZSBQQVRDSHY0LgoKVGhhbmtzLApQZXRlciBMaW4KCj4gCj4gVGhhbmtzLAo+IEFudXAKCi0t
IApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
