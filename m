Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62168C369D9
	for <opensbi@archiver.kernel.org>; Thu,  1 May 2025 00:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=33EvFk/Jb9JtUigVcXVhTO+GFrSguUnd2KqPN8h7Krw=; b=qf/V0XtQjWjPKU
	wkdbFlcQBTU4AIpAmBxkgAZ9p9Y9soL7ELBbb0IP4JW3DvUkuq6CTnf/gQTDvc6Vg2X+mls+Rhts1
	qe6BwbLxwuIEuK6n2B1z30rpZ2OlGi9CY2kwGOzqG0quFgxTF0Gs8TuwWxoowVwCuqU0XwOOdbHh+
	8hL1dM/oXV8LVEbVUU610OSUnPhH0hNlCDGBTiX3R4TO+FRgp1VYVNnIoSDo8akSC1powDXue1mbx
	vlvkYUYg+GUA0wSXw1ynVCOSDtYV6QlBfQBDFKDOHOI/55jGhxsBCgy8uK9tT3yFrCaiql58BSUFP
	p6NCVy93BPSCG7xmWLbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAHWc-0000000EICc-1Ej8;
	Thu, 01 May 2025 00:11:38 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAHWZ-0000000EICH-0jhh
	for opensbi@lists.infradead.org;
	Thu, 01 May 2025 00:11:36 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-227cf12df27so4710575ad.0
        for <opensbi@lists.infradead.org>; Wed, 30 Apr 2025 17:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746058294; x=1746663094; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QVslvNTRCPyp2ag08G9ajJvRb63m5SVJq3aQIB9M4v4=;
        b=lC8SMwXMgzIRP8kcpV58EUxA2y0Vi40CNWdzYTR6kVOJJ247IEaTAXoBUPjAQ12v6g
         i2bxzvIwRyENuURU3K+4Ki5u7vE7gJFso+2iHwwm0yvj0Kj4rLDwKUoV5IX5IsZChI4f
         8d624xjVO+XpA12iyQVIS36IujMIOmB88/U6OChKoqTI6mgF9F1S85yIZimXgCJtRcO5
         smP8pq89rfMoF0dC+MH7OZ4jhtzYj8e6FzCmdi9HRLJTI6hUO29NQgIFRRiPxa0k7pWi
         NtJcv/XucDZSkikiN58D+r46VR2yxkWgYvFR0kQlf4ezIHawo6CzFLMgHcRAVvMALz91
         7SRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746058294; x=1746663094;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QVslvNTRCPyp2ag08G9ajJvRb63m5SVJq3aQIB9M4v4=;
        b=HVEuFsw1zClsqyrBltTYkJ+1pxWjKhIeyCCueKJqcqu/c3K/uaxCA7UXMuHyZTfF3J
         AIryaTODB1+NroVrg5gd82Su72g7Zedx2tSJLJ9TiKTGGvnpp+myOcaYVdsKKMw5woRU
         FzoA3sAzks6PsC//T0QVpPoCoQb4L0SgyHtLisbCxT2U4ibgQdrqpcNzj2FXes4HjXNt
         3cf8fgpCqMgDB6gjakPy+E3MDUisvNdVPKeUAm0TJVseKWwPy62OOSCv3sDREp8X1RTq
         zYbK+fSmcghLqc3EWimBVbyXlbw+OiMX5Gxi42+79GCT6X7QX4lvVK65/2Mg+LAjYZIJ
         VTeQ==
X-Gm-Message-State: AOJu0YyvuOUuIkyjNZIl7R7bz94a5YzCM3B8uZAZme3zPUccZZ1TbJxf
	yrZcxmiGWzRW9bnBVFTbSxtBGBf9ko6C5Q/iNCYRXrDywpYuEeaUzxHu3Jr3JeM=
X-Gm-Gg: ASbGncuzx74yXqdTVankZqd3A0PSHTWs/QHmare7swhAhQ+vTei1Tr3l5jQmz6HHgQf
	OlPpZjKoKfj4PKZTGPOcGBKSZgpYc2odPpFIbcUOZE8Gmylu7xHN7NkFoUlHaSCxgiTgrIFGP3k
	zMqApEIr5U/ODnuGFRn+SMT+rV0DeDICvEbpCZ5sybQ+JwcxkFIz4obAlBbq0EfFu9Vt3Y/5jE2
	9fIfaOucZXJeQEn6RbK8jgQasBoWJOmbJ5Alo0bzho1VqJgInTCzTTuSKShjWkJ2nx7LyF6vzM4
	Lu7VNolMRApO0d77te1LG4Lnou6OJDGDh8Q=
X-Google-Smtp-Source: AGHT+IFCDLwLZhGc+mhzypaLLvQ0EPD1cf9LaZ9CLLHqFXRXG79DjRUqobGthPvSp/m0iXLtxyJblQ==
X-Received: by 2002:a17:902:ce06:b0:215:58be:3349 with SMTP id d9443c01a7336-22e087f00b6mr6170095ad.14.1746058293944;
        Wed, 30 Apr 2025 17:11:33 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:42a0:d6d:e70f:4155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbe5a2sm128424545ad.86.2025.04.30.17.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 17:11:33 -0700 (PDT)
Date: Wed, 30 Apr 2025 17:11:31 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: opensbi@lists.infradead.org
Subject: Re: [PATCH] Makefile: Make $(LLVM) more flexible
Message-ID: <aBK8MwCoLXoZuLAY@ghost>
References: <20250430-improve_llvm_building-v1-1-caae96cc6be6@rivosinc.com>
 <18D74DFC-E63B-446A-806B-B7C51AA4CDA4@jrtc27.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <18D74DFC-E63B-446A-806B-B7C51AA4CDA4@jrtc27.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_171135_484481_221F627B 
X-CRM114-Status: GOOD (  24.25  )
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

T24gVGh1LCBNYXkgMDEsIDIwMjUgYXQgMDE6MDQ6MzhBTSArMDEwMCwgSmVzc2ljYSBDbGFya2Ug
d3JvdGU6Cj4gT24gMSBNYXkgMjAyNSwgYXQgMDA6MzgsIENoYXJsaWUgSmVua2lucyA8Y2hhcmxp
ZUByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4gCj4gPiBJbnRyb2R1Y2UgYSB3YXkgZm9yIGRldmVs
b3BlcnMgdG8gZWFzaWx5IHN3aXRjaCBiZXR3ZWVuIExMVk0gdmVyc2lvbnMKPiA+IHdpdGggTExW
TT0vcGF0aC90by9sbHZtLyBhbmQgTExWTT0tdmVyc2lvbi4gVGhpcyBpcyBhIHVzZWZ1bAo+IAo+
IEZyZWVCU0QgZG9lc27igJl0IGluY2x1ZGUgYSBoeXBoZW4gaW4gaXRzIHZlcnNpb24gbnVtYmVy
IHN1ZmZpeCwgeW91IGdldAo+IGNsYW5nMjAgZXRjLiBJbiB0aGUgTGludXggd29ybGQgd2hlcmUg
eW914oCZdmUgY29waWVkIHRoaXMgcGF0dGVybiBmcm9tCj4gdmVyYmF0aW0gdGhhdCBtYXkgd2Vs
bCBob2xkLCBidXQgT3BlblNCSSBzdXBwb3J0cyBtb3JlIHRoYW4ganVzdCBMaW51eC4KPiAKPiBP
bmUgY291bGQgc3BlY2lhbC1jYXNlIExMVk09MSBhbmQgdHJlYXQgYW55dGhpbmcgZWxzZSBhcyBh
IHN1ZmZpeCBJCj4gc3VwcG9zZSwgdGhvdWdoIHRoYXQgd291bGQgYmUgYSBsaXR0bGUgd2VpcmQu
CgpUaGlzIHBhdHRlcm4gbm90IGJlaW5nIGFwcGxpY2FibGUgZm9yIGFsbCBzeXN0ZW1zIGRvZXNu
J3QgaW52YWxpZGF0ZSB0aGUKdXNlY2FzZSBmb3Igc3lzdGVtcyB0aGF0IGRvIHN1cHBvcnQgaXQu
IERldmVsb3BlcnMgY2FuIHN0aWxsIG1hbmlwdWxhdGUKdGhlaXIgUEFUSCB0byBnZXQgTExWTT0x
IHRvIHNlbGVjdCB0aGUgY2xhbmcgdGhhdCB0aGV5IHdhbnQuCgotIENoYXJsaWUKCj4gCj4gSmVz
cwo+IAo+ID4gYWRkaXRpb24gdG8gdGhlIGV4aXN0aW5nIExMVk09MSB2YXJpYWJsZSB3aGljaCB3
aWxsIHNlbGVjdCB0aGUgZmlyc3QKPiA+IGNsYW5nIGFuZCBsbHZtIGJpbnV0aWxzIGF2YWlsYWJs
ZSBvbiB0aGUgcGF0aC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogQ2hhcmxpZSBKZW5raW5zIDxj
aGFybGllQHJpdm9zaW5jLmNvbT4KPiA+IC0tLQo+ID4gTWFrZWZpbGUgIHwgMTQgKysrKysrKysr
Ky0tLS0KPiA+IFJFQURNRS5tZCB8IDEyICsrKysrKysrKysrKwo+ID4gMiBmaWxlcyBjaGFuZ2Vk
LCAyMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEv
TWFrZWZpbGUgYi9NYWtlZmlsZQo+ID4gaW5kZXggZTkwODM2YzdjNGFkMTZjMzBkNGQ4MDY0OWZm
OGIyMjg0MTMxOTBhZC4uMzdkNGNmNDFhMjIxNGUwYTgyOWYxZDRhNTNmM2Y0ZjlhZTA5ZWU0MSAx
MDA2NDQKPiA+IC0tLSBhL01ha2VmaWxlCj4gPiArKysgYi9NYWtlZmlsZQo+ID4gQEAgLTEwNCwx
MCArMTA0LDE2IEBAIGVuZGlmCj4gPiAKPiA+ICMgU2V0dXAgY29tcGlsYXRpb24gY29tbWFuZHMK
PiA+IGlmbmVxICgkKExMVk0pLCkKPiA+IC1DQyA9IGNsYW5nCj4gPiAtQVIgPSBsbHZtLWFyCj4g
PiAtTEQgPSBsZC5sbGQKPiA+IC1PQkpDT1BZID0gbGx2bS1vYmpjb3B5Cj4gPiAraWZuZXEgKCQo
ZmlsdGVyICUvLCQoTExWTSkpLCkKPiA+ICtMTFZNX1BSRUZJWCA6PSAkKExMVk0pCj4gPiArZWxz
ZSBpZm5lcSAoJChmaWx0ZXIgLSUsJChMTFZNKSksKQo+ID4gK0xMVk1fU1VGRklYIDo9ICQoTExW
TSkKPiA+ICtlbmRpZgo+ID4gKwo+ID4gK0NDID0gJChMTFZNX1BSRUZJWCljbGFuZyQoTExWTV9T
VUZGSVgpCj4gPiArQVIgPSAkKExMVk1fUFJFRklYKWxsdm0tYXIkKExMVk1fU1VGRklYKQo+ID4g
K0xEID0gJChMTFZNX1BSRUZJWClsZC5sbGQkKExMVk1fU1VGRklYKQo+ID4gK09CSkNPUFkgPSAk
KExMVk1fUFJFRklYKWxsdm0tb2JqY29weSQoTExWTV9TVUZGSVgpCj4gPiBlbHNlCj4gPiBpZmRl
ZiBDUk9TU19DT01QSUxFCj4gPiBDQyA9ICQoQ1JPU1NfQ09NUElMRSlnY2MKPiA+IGRpZmYgLS1n
aXQgYS9SRUFETUUubWQgYi9SRUFETUUubWQKPiA+IGluZGV4IDI3OTVjYzFhNWZmMGRmNjJkODNh
NGI1YzMwNjJmZjJiNjgyZGJjYWIuLmZkNDBiZTBiNDk4ODgxNWQ4ZDAyMzg2MjcxYWVhZWI3ODc1
NDEyMTUgMTAwNjQ0Cj4gPiAtLS0gYS9SRUFETUUubWQKPiA+ICsrKyBiL1JFQURNRS5tZAo+ID4g
QEAgLTI1Miw2ICsyNTIsMTggQEAgb3B0aW9uIHdpdGg6Cj4gPiBtYWtlIExMVk09MQo+ID4gYGBg
Cj4gPiAKPiA+ICtUbyBidWlsZCB3aXRoIGEgc3BlY2lmaWMgdmVyc2lvbiBvZiBMTFZNLCBhIHBh
dGggdG8gYSBkaXJlY3RvcnkgY29udGFpbmluZyB0aGUKPiA+ICtMTFZNIHRvb2xzIGNhbiBiZSBw
cm92aWRlZDoKPiA+ICtgYGAKPiA+ICttYWtlIExMVk09L3BhdGgvdG8vbGx2bS8KPiA+ICtgYGAK
PiA+ICsKPiA+ICtJZiB5b3UgaGF2ZSB2ZXJzaW9uZWQgbGx2bSB0b29scyB5b3Ugd291bGQgbGlr
ZSB0byB1c2UsIHN1Y2ggYXMgYGNsYW5nLTE3YCwgdGhlIExMVk0gdmFyaWFibGUgY2FuCj4gPiAr
YmUgc2V0IGFzOgo+ID4gK2BgYAo+ID4gK21ha2UgTExWTT0tMTcKPiA+ICtgYGAKPiA+ICsKPiA+
IFdoZW4gdXNpbmcgQ2xhbmcsICpDUk9TU19DT01QSUxFKiBvZnRlbiBkb2VzIG5vdCBuZWVkIHRv
IGJlIGRlZmluZWQgdW5sZXNzCj4gPiB1c2luZyBHTlUgYmludXRpbHMgd2l0aCBwcmVmaXhlZCBi
aW5hcnkgbmFtZXMuICpQTEFURk9STV9SSVNDVl9YTEVOKiB3aWxsIGJlCj4gPiB1c2VkIHRvIGlu
ZmVyIGEgZGVmYXVsdCB0cmlwbGUgdG8gcGFzcyB0byBDbGFuZywgc28gaWYgKlBMQVRGT1JNX1JJ
U0NWX1hMRU4qCj4gPiAKPiA+IC0tLQo+ID4gYmFzZS1jb21taXQ6IDMxNmRhYWYxYzI5OWMyOWFj
NDZlNTIxNDVmNjU1MjFmNDhlYzYzYjUKPiA+IGNoYW5nZS1pZDogMjAyNTA0MzAtaW1wcm92ZV9s
bHZtX2J1aWxkaW5nLWNmZjMxOTE4ZTFhNgo+ID4gLS0gCj4gPiAtIENoYXJsaWUKPiA+IAo+ID4g
Cj4gPiAtLSAKPiA+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gPiBvcGVuc2JpQGxpc3RzLmluZnJh
ZGVhZC5vcmcKPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
b3BlbnNiaQo+IAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5z
YmkK
