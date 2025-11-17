Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2688CEBF92
	for <opensbi@archiver.kernel.org>; Mon, 17 Nov 2025 15:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tj+1vVzm0FsW2+ku9xU7W8YQN1WChL02OsPrWo176RM=; b=eKAUELp4xfaCD8
	elvFUo08R9UUVNd3p5lZ74iKlBTwMshKW+kRDx2krw8kHruvL18MrdjkALYrGL6zNksCSs3leTb+8
	8xiyeo70tb+mA/NaJSfgkhlXCuihksTP9PgKkW3BS1FXrkCiUhxe90GDKiMlTcMsO3WRmpaQOjfA9
	i8Zmjbg0GwQrSWaLpVkQIySY0ELn0hM6nv9FnGwUQWEyATkiw5TV77nHUOxWp2jReqSz/tpSc0bQM
	H6yYArS/jdnREyMqDEtFbMJsjGdrJcAU1GnLd1Vq8Rgi8YWzDDtBDDIfgN9/0Qhh9Wq1kxKClodR7
	N20Bpcq6vfuktoNZ/taQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL0rK-0000000GJEL-2g6t;
	Mon, 17 Nov 2025 15:09:38 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL0rH-0000000GJCR-1ckH
	for opensbi@lists.infradead.org;
	Mon, 17 Nov 2025 15:09:36 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-433100c59dcso18448785ab.0
        for <opensbi@lists.infradead.org>; Mon, 17 Nov 2025 07:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1763392174; x=1763996974; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Alzu5zNsUoF32AHa1TSGGUzTWSczM+rwIt8kCXRlO/w=;
        b=1ZIXPfPD2D1QVC7Li7c0KlphKzwRF8fanltpEk4jqOqgzPovySYECxg8aaJJk+cRee
         A7R3LHDr8SIEyrzA6IsugTPKXL3lJiPH7wnhoLCNrX9Hm4Y7FcUagTVgdBTCIYJb/yi9
         jaR9hh9yGg/gvDiNNAnebqO5xkPr5hEvQB/+9gFsUhreswupSWF/GO7oeSkEzVn9OWFm
         jkiMcVHpAhmwhho0jXwvnnosdFONPaPRRrexwve4FY3ALKbgoNEZljkF09cMxk0CNqf9
         r4sFWc5uoteLjMypb0Tg9fB2EPe2aHRMs/fGG9QekW0/uPvLaYFwRZDM1Be5lV5maAEh
         SenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763392174; x=1763996974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Alzu5zNsUoF32AHa1TSGGUzTWSczM+rwIt8kCXRlO/w=;
        b=kpTjQY5SEFkNvtHB10YMXXrmw05mLd+/TVNqqDXlVlYIEXsEiyEU/xHzKJHJZkJN5I
         i2Gl/r8+q6TWbeLNhOJN69yB+Ddw/gY7Vud3TNW54fvs1rnUsSauCmL00MB7HgR718qk
         HT1iAx075yJGIgoLcKb8SdHFsrPBrn97gp4ogdMhW87aWLC8iYiYJw584MLdbHH7jdAd
         NkPVXV3cJCZ8fMgArMneekgFfoP5ZDBNYS7TAA7u7dWpMzSQoP5dIfj8Y7PPlRcyFPye
         xASdpjW6NJD74d3W+zqx6gd5fNXiKrTbluzWV1QBNvQzL6qkyeIrbxNmxNCHsi4ghQD5
         uH0w==
X-Gm-Message-State: AOJu0Yw+wdBcMsVIZddqQ9619NODrfBJIGYjvZSo6a2MjFCj2R9V2MAH
	5HBF1+z19jQZiM4gCGzrKKKFxt0hQ77IMoTpN3h84gYG9ieuUeoCv1kh4luF+eyt4Pui29Cv48c
	2zJ+4yWQjnim2DxB6mXl3GzonvpTcq2Wo7OkPLn4XIg==
X-Gm-Gg: ASbGncv8VR6VtatXSckQhVL0FKKsGX3AqvgHNXHeQJ0o2mnZt6YsnbREaZ1aFaKzf6Y
	/YK4RVx8J/YEwnfXRFaJMHSHSv77AfIc6ElQ6s3vtgj80Oa72XYZ63Q2PBJJktc6vJpg7NUzyHh
	1idMUk6rzppEwh7Jn7j5sugmHk1TO4D/wI9SQr3tGmXUSapRXLdMlJX3A4N9jgWUmZimxuAkrXm
	1kcXixSArregg0J3nzMZAOrTYpFkBiuSUFiESwa+Ogm5Sk3a/aB4epjpoaOIw==
X-Google-Smtp-Source: AGHT+IGKEOTjgBmZNnYNNt33FjDI9W9f4lJs1YRsPeJ1JjR+HLssbbiVplgffJlKmgY7unVp7Vcu7wPDr3OALJhEQxQ=
X-Received: by 2002:a05:6e02:12e5:b0:433:7e03:3ecd with SMTP id
 e9e14a558f8ab-4348c93e2b5mr138165905ab.27.1763392174208; Mon, 17 Nov 2025
 07:09:34 -0800 (PST)
MIME-Version: 1.0
References: <20251117054846.1335-1-ganboing@gmail.com> <CAAhSdy0Epa0RhOn5Cvjxnzd-XAdxHi1PEJPmj++Sm_GqbgVf-A@mail.gmail.com>
 <6d2f3906-5c9d-4ce2-b222-44b05071b9ec@gmail.com>
In-Reply-To: <6d2f3906-5c9d-4ce2-b222-44b05071b9ec@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 17 Nov 2025 20:39:21 +0530
X-Gm-Features: AWmQ_bmgm33AqUyE7PsTJvAFhyaLmBRuj0l1bcnq55tdOuKhTCWgGYQGXf-XXBQ
Message-ID: <CAAhSdy0gmOtDDbNc0wE0iAaGz33a1Q+75OMrWAuKYybToPnhkw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Initial ESWIN/EIC7700 support
To: Bo Gan <ganboing@gmail.com>
Cc: opensbi@lists.infradead.org, linmin@eswincomputing.com, 
	pinkesh.vaghela@einfochips.com, gaohan@iscas.ac.cn, samuel@sholland.org, 
	wangxiang@iscas.ac.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_070935_539374_61802524 
X-CRM114-Status: GOOD (  31.21  )
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

SGkgQm8gR2FuLAoKT24gTW9uLCBOb3YgMTcsIDIwMjUgYXQgMzowMOKAr1BNIEJvIEdhbiA8Z2Fu
Ym9pbmdAZ21haWwuY29tPiB3cm90ZToKPgo+IEhpIEFudXAsCj4KPiBUaGFua3MgZm9yIHRoZSBw
cm9tcHQgcmVwbHkuIFNlZSBpbmxpbmUuCj4KPiBPbiAxMS8xNy8yNSAwMDowNCwgQW51cCBQYXRl
bCB3cm90ZToKPiA+IE9uIE1vbiwgTm92IDE3LCAyMDI1IGF0IDExOjIw4oCvQU0gQm8gR2FuIDxn
YW5ib2luZ0BnbWFpbC5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gRUlDNzcwMCBpcyB0aGUgU29DIHVz
ZWQgaW4gSGlGaXZlIFA1NTAgYW5kIE1pbGstViBNZWdyZXouIFRoaXMgU29DIGlzCj4gPj4gY3Vy
cmVudGx5IG9uZSBvZiB0aGUgb25seSBvZmYtdGhlLXNoZWxmIGJvYXJkL2NoaXBzIHRoYXQgc3Vw
cG9ydCBICj4gPj4gZXh0ZW5zaW9uLCBhbHRob3VnaCBpdCdzIHYwLjYuMS4gSXQgYWxzbyBzdXBw
b3J0cyBwcmUtcmF0aWZpZWQgTi10cmFjZS4KPiA+PiBBZGQgc3VwcG9ydCBmb3IgaXQgc28gcGVv
cGxlIGNhbiBiZW5lZml0IGZyb20gbGF0ZXN0IE9wZW5TQkkgZmVhdHVyZXMuCj4gPj4KPiA+PiBU
aGUgZGV2aWNlLXRyZWUgb2YgSGlGaXZlIFA1NTAgaGFzIGJlZW4gdXBzdHJlYW1lZCB0byBMaW51
eDoKPiA+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA4MjUxMzI0MjcuMTYxODA4
OS0xLXBpbmtlc2gudmFnaGVsYUBlaW5mb2NoaXBzLmNvbS8KPiA+PiBIb3dldmVyIFUtYm9vdCBp
cyBub3QsIGFuZCB0aGVyZSBhcmUgYnVncyBpbiB2ZW5kb3IgVS1ib290IGRldmljZS10cmVlLAo+
ID4+IGFuZCBhbHNvIGluY29uc2lzdGVuY2llcyBiZXR3ZWVuIHRoZSB0d28uIFRodXMsIHRoaXMg
cGF0Y2ggaXMgY29kZWQgd2l0aAo+ID4+IHRoZSB1cHN0cmVhbWVkIGRldmljZS10cmVlIGFzIHRo
ZSByZWZlcmVuY2UsIGJ1dCB0ZXN0ZWQgd2l0aCB0aGUgcGF0Y2hlZAo+ID4+IHZlbmRvciBVLWJv
b3QgZGV2aWNlIHRyZWUgYXMgYEZXX0ZEVF9QQVRIYC4gVGhlIHBhdGNoZWQgdmVuZG9yIFUtYm9v
dCBpcwo+ID4+IGhvc3RlZCBoZXJlOiBodHRwczovL2dpdGh1Yi5jb20vZ2FuYm9pbmcvdS1ib290
LWVpYzd4L3RyZWUvZWljN3gtZHQtZml4Cj4gPj4gUmVmZXIgdG8gUEFUQ0ggNS81IGZvciB0aGUg
aW5zdHJ1Y3Rpb25zIG9uIGJ1aWxkaW5nIHRoZSBmaXJtd2FyZSBibG9iCj4gPj4gYW5kIGxhdW5j
aCBpdCB0aHJvdWdoIFVBUlQgYm9vdC4KPiA+Pgo+ID4+IFRoZSBtYWpvciBjb21wbGljYXRpb24g
b2YgdGhpcyBjaGlwIGlzIHRoYXQgaXQgcmVxdWlyZXMgY2VydGFpbiBtZW1vcnkKPiA+PiByZWdp
b25zIHRvIGJlIGJsb2NrZWQgd2l0aCBQTVAgZW50cmllcyB0byBwcmV2ZW50IHNwZWN1bGF0aXZl
IGV4ZWN1dGlvbgo+ID4+IG9yIEhXIHByZWZldGNoZXIgZnJvbSB0b3VjaGluZyB0aGVtIHRvIGF2
b2lkIGJ1cyBlcnJvcnMuIEFsc28gZHVlIHRvIHRoZQo+ID4+IGZhY3QgdGhhdCB0aGlzIFNvQyBo
YW5kbGVzIGNhY2hlIGluY29oZXJlbnQgRE1BIGJ5IG1hcHBpbmcgbWVtb3J5IHR3aWNlLAo+ID4+
IG9uZSBhcyBjYWNoZWQsIGFuZCB0aGUgb3RoZXIgYXMgdW5jYWNoZWQsIHdlIGFsc28gbmVlZCBh
biBleHRyYSBQTVAgdG8KPiA+PiBwcm90ZWN0IHRoZSBPcGVuU0JJIGluIHRoZSB1bmNhY2hlZCBw
b3J0aW9uIGluIGFkZHJlc3Mgc3BhY2UuIEZvbGxvd2luZwo+ID4+IGNoYW5nZXMgYXJlIG1hZGUg
dG8gbGliLyBhbmQgZmlybXdhcmUvIHRvIG1ha2UgaXQgcG9zc2libGU6Cj4gPj4KPiA+PiAgIC0g
QWxsb3cgcGxhdGZvcm0gdG8gb3ZlcnJpZGUgcG1wXyh1biljb25maWd1cmUKPiA+PiAgIC0gQWRk
IGhlbHBlciBmdW5jdGlvbiBmb3Igc2V0dGluZ3MgUE1QIFRPUgo+ID4+ICAgLSBBZGQgaGVscGVy
IGZ1bmN0aW9uIHRvIGNoZWNrIGlmIG1lbXJlZ2lvbnMgYXJlIGRpc2pvaW50Cj4gPj4gICAtIElu
dHJvZHVjZSBGSVJNV0FSRV9QQUNLRURfUlhSVyBmb3IgZGlzYWJsaW5nIHBvd2VyLW9mLTIgUlcg
c3BsaXQKPiA+Cj4gPiBQTVAgVE9SIGVudHJpZXMgYXJlIG5vdCBnb2luZyB0byBmbHkuIEFsc28s
IGFkZGluZyBzZXBhcmF0ZSBjb25maWcKPiA+IG9wdGlvbiBGSVJNV0FSRV9QQUNLRURfUlhSVyBh
bmQgc2VwYXJhdGUgZGVmY29uZmlnIGZvcgo+ID4gRUlDNzcwWCAgbWVhbnMgZGlzdHJvcyBjYW4n
dCB1c2UgdGhlIHNhbWUgZndfZHlhbm1pYy5iaW4gb24KPiA+IEVJQzc3MFggIGFuZCBvdGhlciBw
bGF0Zm9ybXMuCj4gPgo+ID4gSWYgUE1QIFRPUiBpcyBiZWluZyB1c2VkIG9ubHkgdG8gc2F2ZSBv
bmUgUE1QIGVudHJ5IHRoZW4gdGhlcmUKPiA+IGFyZSBiZXR0ZXIgd2F5cyB0byBhY2hpZXZlIHRo
aXMuCj4gPgo+Cj4gT2theS4gSSB0aGluayBJJ3ZlIGZvdW5kIGEgd2F5IHRvIHVzZSBOQVBPVCB0
byBhY2hpZXZlIHRoZSBzYW1lIGVmZmVjdC4KPgo+IE1lbW9yeSBQb3J0IChkaWUgMCkKPiAgICDi
lJzilIAgMHgwMF84MDAwXzAwMDAgLSAweDEwXzgwMDBfMDAwMCBkaWUgMCBtZW1vcnkgKGNhY2hl
ZCkKPiAgICDilJTilIAgMHgxMF84MDAwXzAwMDAgLSAweDgwXzAwMDBfMDAwMCAoaG9sZSkKPgo+
IE1lbW9yeSBQb3J0IChkaWUgMSkKPiAgICDilJzilIAgMHgwMF84MDAwXzAwMDAgLSAweDIwXzAw
MDBfMDAwMCAoaG9sZSkKPiAgICDilJzilIAgMHgyMF8wMDAwXzAwMDAgLSAweDMwXzAwMDBfMDAw
MCBkaWUgMSBtZW1vcnkgKGNhY2hlZCkKPiAgICDilJTilIAgMHgzMF8wMDAwXzAwMDAgLSAweDgw
XzAwMDBfMDAwMCAoaG9sZSkKPgo+IEJ5IGRlZmF1bHQsIGZvciBib3RoIGRpZSAwLzE6Cj4KPiAg
ICBOQVBPVFswXSAgIC4uLi4uLiAgIE1SV1gsU1UoKSAgX19fXyBPcGVuU0JJIGluIGNhY2hlZCBt
ZW0KPiAgICBOQVBPVFsxXSAgIC4uLi4uLiAgIE1SV1gsU1UoKSAgX19fXyBPcGVuU0JJIGluIHVu
Y2FjaGVkIG1lbQo+ICAgIE5BUE9UWzItNV0gICAgICAgICAgICAgICAgICAgICA8ZnJlZT4KPiAg
ICBOQVBPVFs2XSBbMHgwLCAweDgwXzAwMDBfMDAwMCkgTF9fXwo+ICAgIE5BUE9UWzddICAgICAg
IC4uLi4uLiAgICAgICAgICA8cmVzZXJ2ZWQ+Cj4KPiBGb3IgZGllIDAgaW4gcm9vdCBkb21haW46
Cj4KPiAgICBOQVBPVFswXSAgICAgICAuLi4uLi4gICAgICAgICAgTShSV1gpU1UoKSBfX19fIE9w
ZW5TQkkgaW4gY2FjaGVkIG1lbQo+ICAgIE5BUE9UWzFdICAgICAgIC4uLi4uLiAgICAgICAgICBN
KFJXWClTVSgpIF9fX18gT3BlblNCSSBpbiB1bmNhY2hlZCBtZW0KPiAgICBOQVBPVFsyXSAgICAg
ICAgIFsweDIwMF8wMDAwLCAweDIwMV8wMDAwKSBfX19fIE0oUlcpU1UoKSBDTElOVAo+ICAgIE5B
UE9UWzNdICAgICAgIFsweDIwMDBfMDAwMCwgMHg0MDAwXzAwMDApIExfX18gZm9yIGRpZSAxIHA1
NTAKPiAgICBOQVBPVFs0XSAgICAgICAgICAgIFsweDAsIDB4MTBfMDAwMF8wMDAwKSBfUldYIE0o
KSBTVShSV1gpCj4gICAgTkFQT1RbNV0gWzB4MTBfMDAwMF8wMDAwLCAweDEwXzgwMDBfMDAwMCkg
X1JXWCBNKCkgU1UoUldYKQo+ICAgIE5BUE9UWzZdICAgICAgICAgICAgWzB4MCwgMHg4MF8wMDAw
XzAwMDApIExfX18KPiAgICBOQVBPVFs3XSAgICAgICAgWzB4MCwgMHhmZmZmZmZmZmZmZmZmZmZm
KSBfUldYIE0oKSBTVShSV1gpCj4KPiBTaW1pbGFybHksIGZvciBkaWUgMSwgdXNlOgo+Cj4KPiAg
IE5BUE9UWzBdICAgICAgIC4uLi4uLiAgICAgICAgICBNKFJXWClTVSgpIF9fX18gT3BlblNCSSBp
biBjYWNoZWQgbWVtCj4gICBOQVBPVFsxXSAgICAgICAuLi4uLi4gICAgICAgICAgTShSV1gpU1Uo
KSBfX19fIE9wZW5TQkkgaW4gdW5jYWNoZWQgbWVtCj4gICBOQVBPVFsyXSAgICAgICAgIFsweDQw
MF8wMDAwLCAweDQwMV8wMDAwKSBfX19fIE0oUlcpU1UoKSBDTElOVAo+ICAgTkFQT1RbM10gICAg
ICAgICAgICAgICBbMHgwLCAweDIwMDBfMDAwMCkgTF9fXyBmb3IgZGllIDAgcDU1MAo+ICAgTkFQ
T1RbNF0gICAgICAgICAgICAgICBbMHgwLCAweDgwMDBfMDAwMCkgX1JXWCBNKCkgU1UoUldYKQo+
ICAgTkFQT1RbNV0gWzB4MjBfMDAwMF8wMDAwLCAweDMwXzgwMDBfMDAwMCkgX1JXWCBNKCkgU1Uo
UldYKQo+ICAgTkFQT1RbNl0gICAgICAgICAgICBbMHgwLCAweDgwXzAwMDBfMDAwMCkgTF9fXwo+
ICAgTkFQT1RbN10gICAgICAgIFsweDAsIDB4ZmZmZmZmZmZmZmZmZmZmZikgX1JXWCBNKCkgU1Uo
UldYKQo+Cj4gSXQnbGwgd29yayBhbHNvIGZvciBub24tcm9vdCBkb21haW4gaGFydHMsIGFuZCBh
Y3R1YWxseSBiZXR0ZXIgaWYgaXQKPiBkb2Vzbid0IGNvbnRhaW4gYSAiY2F0Y2ggYWxsIiByZWdp
b24gKG9yZGVyID09IF9fcmlzY3ZfeGxlbikuIEhvd2V2ZXIsCj4gY29tcGFyZWQgdG8gdGhlIFRP
UiBhcHByb2FjaCwgaXQgY29uc3VtZXMgMSBtb3JlIFBNUCBvbiBkaWUgMCBmb3Igcm9vdAo+IGRv
bWFpbiBvciBhbnkgZG9tYWluIHdpdGggYSAiY2F0Y2ggYWxsIiByZWdpb24sIGFuZCB3ZSd2ZSB1
c2VkIHVwIGFsbAo+IGVudHJpZXMuIFRoZXJlJ3Mgbm8gcm9vbSBmb3IgbW9yZSwgc28gd2UgY2Fu
J3QgZG8gc29tZXRoaW5nIGxpa2UgYQo+IHRydXN0ZWQvdW50cnVzdGVkLWRvbWFpbiBzY2VuYXJp
byBhcyBkb2N1bWVudGVkIGluIGRvbWFpbl9zdXBwb3J0Lm1kLAo+IGJlY2F1c2Ugd2UgY2FuJ3Qg
YmxvY2sgdGhlIGFjY2VzcyBvZiB0ZG9tYWluIG1lbW9yeSByZWdpb24gaW4gdWRvbWFpbi4KPiBJ
J20gbm90IHN1cmUgaWYgdGhpcyBpcyBhbiBpc3N1ZSBhdCB0aGlzIHBvaW50LiBQZXJoYXBzIGl0
IGNvdWxkIGJlCj4gd2hlbiBzb21lb25lIHRyaWVzIG91dCBURUU/IEkgZG9uJ3QgaGF2ZSB0aGUg
YW5zd2VyIHRvZGF5LgoKVGhlcmUgaXMgb25lIG1vcmUgYXBwcm9hY2ggd2hpY2ggY2FuIHNhdmUg
UE1QIGVudHJpZXMgZm9yCnlvdSB3aGVyZSB5b3UgY2FuIGNyZWF0ZSBhIGxhcmdlIHJlZ2lvbiBp
biBwbGF0Zm9ybSBlYXJseSBpbml0CmNvdmVyaW5nIG11bHRpcGxlIHJlZ2lvbnMgYWRkZWQgYnkg
T3BlblNCSSBkcml2ZXJzLgoKRm9yIGV4YW1wbGUsIHlvdSBjYW4gY3JlYXRlIGEgc2luZ2xlIHJl
Z2lvbiBmb3IgYWxsIE0tbW9kZQpvbmx5IE1NSU8gZGV2aWNlcyBpZiBwbGF0Zm9ybSBhZGRyZXNz
IHNwYWNlIGFsbG93cyB5b3UuCgpSZWdhcmRzLApBbnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxp
c3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
