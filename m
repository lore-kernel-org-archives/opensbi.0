Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B21FCEC01B8
	for <opensbi@archiver.kernel.org>; Mon, 23 Mar 2026 10:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3HUPDM2i+CgqC+ESeshhDrdmp/XGyb+QbQwr0QQAqfY=; b=aUrD89y2/hP5Yf
	TBzHMuIQafejEXUpDdRSdmwhN4gOXcPoFvMqDf/TBZv9T4tWjaez5U2U1g75vakd0waBigE4+XUkO
	7tDEOMf42p4ASFERpGB6WPm3LmeD4z66pmlpDNdXwjjsMF3X6V5emd0oXZT6JZwfrWrgG9Gmav7fh
	0alzaKqEgeBKpT4l1qIafvPN9EhwE0CbahOgDrvD/t4R38BBxLthaA/nRPASLsGV/WT1qkIqVc8J3
	tVRmXQj+k3SrlKXOzzkU7O8uCTOspdOVwjxRQ5eQ4SVAKY2hqTg7iFCxKm4bdaC0zsg2EUL0gYtZD
	mePqdgcIyP5cBTdKlfgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4c9t-0000000GSQ7-33eK;
	Mon, 23 Mar 2026 10:05:17 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4c9r-0000000GSPG-0cem
	for opensbi@lists.infradead.org;
	Mon, 23 Mar 2026 10:05:16 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-486fb14227cso42164965e9.3
        for <opensbi@lists.infradead.org>; Mon, 23 Mar 2026 03:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1774260313; x=1774865113; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q8gb5p0mZMP56oGCd3cpbMS2Uqo5BewjUhFAbH8/MAg=;
        b=PMspZhx1ZKqw/qL8DA1mMt5HifU6dHhPTAZtwaQOulbY8GOnb6IeMTMV8VJDBo2IiR
         yadcKP60DMPlX23hBABTT4fr94zvuQYOVWh3juBJZfF82V1GQhO5KfZ7y3OiM0H82jDI
         ORyJwCL62DmDjIiOgvivitYu/6HUBNiQgzMOcHJEnKeAlbuYY+haTO7XvUzrXYO05PRS
         R1Na3/2WciwzFdikbg8lyDwUL/w691sItdOh3mEkjG/0h8RCghzYxf3LwxODxWr+bOzw
         1K1Xk5U9Xkmox00Ijtl6IqHMAh/wjKsnJtkZmbs4wJoER7Ud2h8M7AVtJj2pPUPilase
         n64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774260313; x=1774865113;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q8gb5p0mZMP56oGCd3cpbMS2Uqo5BewjUhFAbH8/MAg=;
        b=sy9jCp9GMHdUOSr3FYaPQP0Q0o4zxpLFsKnwsNY6S4U41sQLV2YD+SutvWxkqcfCj5
         Wak01TpHKIxcXDd1n6t7sKk2rtpzuZrfSMbQtkVpjCWwF+/5QqZ2hTU47AOqG7oux80+
         ihzJ71py2a0oPkfayFWSsI/lkbesHDwT9yQ/qZ2ZvfNULXiEw+GJgOHtIDr2xruuQDzm
         /XxosSdd9xBckuevQSSYf+9DlKHyCsgRa8My5nlsxt2v7bK8gSuvCbANU4fU6TiZO0IT
         PwGd8HmVDP1KYZJw9DoPg3QOAaAV7y1ZdWArRfhZQkAxN10xLIyktcVlP/x8o3MdgEDP
         G8Ww==
X-Forwarded-Encrypted: i=1; AJvYcCUdBfiGrmHqMVd30nd3Tdwe2gtucFdebM0zGkcBoBHShF2iQ++k/BttCbMM3n+R4d+nAnDrPVJ/@lists.infradead.org
X-Gm-Message-State: AOJu0YyK5pmZmavtEdMzoR4DHK+DG76qX5S4hP/8If0PnTddBS1hnmdb
	qdcHWCqQLuIy9kyr6YvfnLBAz7rWJBZjNji9s4UThX0uJSByIlwsZggq9+jxl0I0fzE=
X-Gm-Gg: ATEYQzzQ5nIhIm8wR0oshk7vCdK/3sqQfr/SifRs36R539vhMMGRXDVdoasqT68OiWa
	FLLC72Io2NM91dqUsyAyRyPcuse+Vvuu/x2S0eCUnP1VN6R+7Vnb/LFV0AJpNzjbch8+JsHusYy
	T6xrgxIem8MP2Ed5g5tBy8EOmDCpzH/Xho0Xxl5P7i/Xjs7OaDGdxxb0xqHhoXYHyKn+Qp+0jrs
	vXZZTdHS1TRGk7fCyDOkZZ+1DXIKybOSFLgqjwebnOV8DPAVXxmJZu+lk7FbmuCF2daDTChU8RG
	xUuK8DjwyPtmOJSDhoneIyNp6r2pk9ie0T+agrLBqj2NBl6avL96ofqxU+fSQwo4SQpXukdwFG0
	MG7AyULhu5qNWm+KJVjTqyw+VrMaFmWNTQp0iG1z8PU/WbcwBiGUewxP90ps4TLpjGTD06E9DAL
	rJTkNFlng2ERNtCaL3d2GV6fqPXAMh
X-Received: by 2002:a05:600c:3b07:b0:485:3aa1:a7f1 with SMTP id 5b1f17b1804b1-486fedab4bdmr162421215e9.7.1774260312632;
        Mon, 23 Mar 2026 03:05:12 -0700 (PDT)
Received: from [172.27.130.2] ([78.41.211.48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff1ce0b9sm102552935e9.6.2026.03.23.03.05.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:05:12 -0700 (PDT)
Message-ID: <df422df4-e7dd-40e1-b4a8-416e0cb741af@riscstar.com>
Date: Mon, 23 Mar 2026 10:05:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] lib: sbi: Add RISC-V vector context save/restore
 support (eager switching)
To: Samuel Holland <samuel.holland@sifive.com>, opensbi@lists.infradead.org
Cc: Scott Bambrough <scott@riscstar.com>,
 Robin Randhawa <robin.randhawa@sifive.com>,
 Anup Patel <anup.patel@qti.qualcomm.com>, Ray Mao
 <raymond.mao@riscstar.com>, Anup Patel <anuppate@qti.qualcomm.com>,
 Dhaval <dhaval@rivosinc.com>, Peter Lin <peter.lin@sifive.com>
References: <20260320143018.74191-1-dave.patel@riscstar.com>
 <20260320143018.74191-2-dave.patel@riscstar.com>
 <cfbfa618-d875-43e9-bbff-2aa8d75a519b@sifive.com>
Content-Language: en-US
From: Dave Patel <dave.patel@riscstar.com>
In-Reply-To: <cfbfa618-d875-43e9-bbff-2aa8d75a519b@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_030515_226751_44475F4D 
X-CRM114-Status: GOOD (  29.23  )
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

T24gMy8yMy8yNiAwNDozNywgU2FtdWVsIEhvbGxhbmQgd3JvdGU6Cj4gSGkgRGF2ZSwKPiAKPiBP
biAyMDI2LTAzLTIwIDk6MzAgQU0sIGRhdmUucGF0ZWxAcmlzY3N0YXIuY29tIHdyb3RlOgo+PiBG
cm9tOiBEYXZlIFBhdGVsIDxkYXZlLnBhdGVsQHJpc2NzdGFyLmNvbT4KPj4KPj4gQWRkIHN1cHBv
cnQgZm9yIHNhdmluZyBhbmQgcmVzdG9yaW5nIFJJU0MtViB2ZWN0b3IgZXh0ZW5zaW9uIHN0YXRl
IGluIE9wZW5TQkkuCj4+IFRoaXMgaW50cm9kdWNlcyBhIHBlci1oYXJ0IHZlY3RvciBjb250ZXh0
IHN0cnVjdHVyZSBhbmQgaGVscGVyIHJvdXRpbmVzIHRvCj4+IHBlcmZvcm0gZnVsbCBjb250ZXh0
IHNhdmUgYW5kIHJlc3RvcmUuCj4+Cj4+IFRoZSB2ZWN0b3IgY29udGV4dCBpbmNsdWRlcyB2bCwg
dnR5cGUsIHZjc3IgQ1NScyBhbG9uZyB3aXRoIHN0b3JhZ2UgZm9yIGFsbAo+PiAzMiB2ZWN0b3Ig
cmVnaXN0ZXJzLiBUaGUgcmVnaXN0ZXIgc3RhdGUgaXMgc2F2ZWQgYW5kIHJlc3RvcmVkIHVzaW5n
IGJ5dGUtd2lzZQo+PiB2ZWN0b3IgbG9hZC9zdG9yZSBpbnN0cnVjdGlvbnMgKHZzZTgudi92bGU4
LnYpLCBtYWtpbmcgdGhlIGltcGxlbWVudGF0aW9uCj4+IGluZGVwZW5kZW50IG9mIGN1cnJlbnQg
U0VXL0xNVUwgY29uZmlndXJhdGlvbi4KPj4KPj4gVGhlIGltcGxlbWVudGF0aW9uIGZvbGxvd3Mg
YW4gZWFnZXIgY29udGV4dCBzd2l0Y2hpbmcgbW9kZWwgd2hlcmUgdGhlIGVudGlyZQo+PiB2ZWN0
b3Igc3RhdGUgaXMgc2F2ZWQgYW5kIHJlc3RvcmVkIG9uIGV2ZXJ5IGNvbnRleHQgc3dpdGNoLiBU
aGlzIHByb3ZpZGVzIGEKPj4gc2ltcGxlIGFuZCBkZXRlcm1pbmlzdGljIG1lY2hhbmlzbSB3aXRo
b3V0IHJlcXVpcmluZyBsYXp5IHRyYXAtYmFzZWQKPj4gbWFuYWdlbWVudC4KPj4KPj4gQSBwZXIt
aGFydCBwb2ludGVyIGlzIHVzZWQgdG8gdHJhY2sgdGhlIGN1cnJlbnQgdmVjdG9yIGNvbnRleHQg
b3duZXIuCj4gCj4gU3RvcmluZyBvbmx5IG9uZSBjb250ZXh0IHBlciBoYXJ0IG1lYW5zIHRoYXQg
eW91IG11c3Qgc2F2ZS9yZXN0b3JlIHRoZSBjb250ZXh0Cj4gZXZlcnkgdGltZSB0aGUgaGFydCB0
cmFwcyB0byBNLW1vZGUuIFRoaXMgaXMgdW5uZWNlc3NhcnkgYW5kIGluZWZmaWNpZW50LAo+IGJl
Y2F1c2UgT3BlblNCSSBpdHNlbGYgZG9lcyBub3QgdXNlIHRoZSB2ZWN0b3IgcmVnaXN0ZXJzIChl
eGNlcHQgd2hlcmUgaXQKPiBleHBsaWNpdGx5IG1vZGlmaWVzIHRoZSBsb3dlci1wcml2aWxlZ2Ug
dmVjdG9yIHN0YXRlIHdoZW4gZW11bGF0aW5nCj4gaW5zdHJ1Y3Rpb25zKS4gSXQgaXMgb25seSBu
ZWNlc3NhcnkgdG8gc2F2ZS9yZXN0b3JlIHRoZSBjb250ZXh0IHdoZW4gc3dpdGNoaW5nCj4gYmV0
d2VlbiBkb21haW5zLCBub3Qgd2hlbiB0cmFwcGluZyB0byBNLW1vZGUgYW5kIHJldHVybmluZyB0
byB0aGUgc2FtZSBkb21haW4uCj4gU28gYSBiZXR0ZXIgcGxhY2UgZm9yIHRoZSBjb250ZXh0IGlz
IGluIGBzdHJ1Y3QgaGFydF9jb250ZXh0YCBpbgo+IGxpYi9zYmkvc2JpX2RvbWFpbl9jb250ZXh0
LmMuCgpUaGlzIHdhcyB0aGUgY29tbWVudCBvZiB0aGUgZW1haWwgYW5kIFJGQyBpcyBmb3IgZGlz
Y3Vzc2lvbiBhcyBPcGVuU0JJCmRvZXMgbm90IHVzZSB0aGUgdmVjdG9yIHJlZ2lzdGVycywgdGhl
IGltcGxlbWVudGF0aW9uIHdhcyB0byBnaXZlIHRoZQpjb250ZXh0IHdpdGggdGhlIFJGQyDCoChv
dmVyaGVhZCBvbiBldmVyeSB0cmFwIGR1ZSB0byBmdWxsIHN0YXRlIHNhdmUgYW5kCnJlc3RvcmUp
LiBJcyBpdCBwb3NzaWJsZSB0byBwcm92aWRlIHVzZWNhc2UgYW5kIG1vcmUgaW5mb3JtYXRpb24g
dG8KY292ZXIgdGhpcyBhcyBPcGVuc2JpIHdvbid0IGJlIHVzaW5nIHRoZSB2ZWN0b3IgcmVnaXN0
ZXJzPwpBbHNvIGRvIHdlIGhhdmUgYW55IGNvbnNpZGVyYXRpb24gb2YgaG93IHRoaXMgY29udGV4
dCBzd2l0Y2ggd29yayB3aGVuCnRoZXJlIGEgdHJhcCBvY2N1cnMgaW4gdGhlIG1pZGRsZSBvZiB0
aGlzIGNvbnRleHQ/CkFsc28gdGhlIGRvbWFpbiBjb250ZXh0IHNob3VsZCBiZSBjb3ZlcmVkIGJ5
IFMtbW9kZSBmb3IgZXhhbXBsZSBMaW51eAprZXJuZWwsIGhvdyBpcyBpdCBkaWZmZXJlbnQgdG8g
ZG9tYWluIGNvbnRleHQgaW4gT3BlbnNiaT8KCgo+IAo+PiBOb3RlczoKPj4gLSBUaGUgbWF4aW11
bSBzdXBwb3J0ZWQgVkxFTiBpcyBjYXBwZWQgdmlhIFNCSV9NQVhfVkxFTkIuCj4+IC0gVGhlIGlt
cGxlbWVudGF0aW9uIGFzc3VtZXMgdGhlIHZlY3RvciB1bml0IGlzIGVuYWJsZWQgd2hlbiBpbnZv
a2VkLgo+IAo+IFRoaXMgaXMgbm90IHNvbWV0aGluZyB5b3UgY2FuIGFzc3VtZS4gVGhlIGNvZGUg
bXVzdCBub3QgY3Jhc2ggd2hlbiBydW5uaW5nIG9uCj4gaGFyZHdhcmUgd2l0aG91dCB2ZWN0b3Ig
SVNBIHN1cHBvcnQgKFp2ZTMyeCkuClllcyBJIHdhcyBnb2luZyB0byBwcm92aWRlIENvbXBsaWUg
c3dpdGNoLCBob3dldmVyIGxlZnQgaXQgb3BlbiBmb3IKZGlzY3Vzc2lvbi4gU28gc2hvdWxkIHRo
aXMgb25seSBiZSBjb21waWxlZCBzd2l0Y2ggZm9yClBMQVRGT1JNX1JJU0NWX0lTQT1ydjY0Z2N2
PyBhbmQgdGhhdCB3ZSBkb24ndCB3YW50IHRoaXMgdG8gYmUgaW5jbHVkZWQKZm9yIFp2ZTMyeD8K
Cj4gCj4+IC0gdnN0YXJ0IENTUiBpcyBub3QgY3VycmVudGx5IHNhdmVkL3Jlc3RvcmVkIGFuZCBp
cyBleHBlY3RlZCB0byBiZSB6ZXJvCj4+IGFjcm9zcyBjb250ZXh0IHN3aXRjaCBib3VuZGFyaWVz
Lgo+IAo+IFRoaXMgaXMgbm90IHNvbWV0aGluZyB5b3UgY2FuIGFzc3VtZS4gQSB0cmFwIGNhbiBo
YXBwZW4gYW55d2hlcmUgKGUuZy4gZHVlIHRvIGFuCj4gaW50ZXJydXB0KSwgc28gdnN0YXJ0IG1h
eSBiZSBub256ZXJvIGFuZCBtdXN0IG5vdCBsZWFrIGFjcm9zcyBkb21haW5zLgpZZXMgY29ycmVj
dCwgSSBkZWxpYmVyYXRlbHkgbGVmdCBpdCBvcGVuIHRvIGhhdmUgYSBkaXNjdXNzaW9uIGFuZCB2
aWV3CnBvaW50LCBzbyBJIHdpbGwgc2F2ZSB2c3RhcnQgQ1NSIGZvciBjb250ZXh0IGFzd2VsbC4K
Cj4gCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IERhdmUgUGF0ZWwgPGRhdmUucGF0ZWxAcmlzY3N0YXIu
Y29tPgo+PiAtLS0KPj4gIGluY2x1ZGUvc2JpL3NiaV92ZWN0b3IuaCB8ICAzMCArKysrKysrKysK
Pj4gIGxpYi9zYmkvb2JqZWN0cy5tayAgICAgICB8ICAgMSArCj4+ICBsaWIvc2JpL3NiaV92ZWN0
b3IuYyAgICAgfCAxMzYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+
ICAzIGZpbGVzIGNoYW5nZWQsIDE2NyBpbnNlcnRpb25zKCspCj4+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgaW5jbHVkZS9zYmkvc2JpX3ZlY3Rvci5oCj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgbGliL3Ni
aS9zYmlfdmVjdG9yLmMKPj4KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3NiaV92ZWN0b3Iu
aCBiL2luY2x1ZGUvc2JpL3NiaV92ZWN0b3IuaAo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBp
bmRleCAwMDAwMDAwMC4uNmJlNDc3YzAKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9pbmNsdWRl
L3NiaS9zYmlfdmVjdG9yLmgKPj4gQEAgLTAsMCArMSwzMCBAQAo+PiArLyogU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjAKPj4gKyAqCj4+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMjYgUklT
Q3N0YXIgU29sdXRpb25zLgo+PiArICoKPj4gKyAqIEF1dGhvcnM6Cj4+ICsgKiAgICAgRGF2ZSBQ
YXRlbCA8ZGF2ZS5wYXRlbEByaXNjc3Rhci5jb20+Cj4+ICsgKi8KPj4gKwo+PiArI2lmbmRlZiBf
X1NCSV9WRUNUT1JfSF9fCj4+ICsjZGVmaW5lIF9fU0JJX1ZFQ1RPUl9IX18KPj4gKwo+PiArI2lu
Y2x1ZGUgPHNiaS9zYmlfdHlwZXMuaD4KPj4gKwo+PiArI2RlZmluZSBTQklfTUFYX1ZMRU5CIDI1
Ngo+PiArCj4+ICtzdHJ1Y3Qgc2JpX3ZlY3Rvcl9jb250ZXh0IHsKPj4gKyAgICB1bnNpZ25lZCBs
b25nIHZsOwo+PiArICAgIHVuc2lnbmVkIGxvbmcgdnR5cGU7Cj4+ICsgICAgdW5zaWduZWQgbG9u
ZyB2Y3NyOwo+PiArCj4+ICsgICAgLyogc2l6ZSBkZXBlbmRzIG9uIFZMRU4gKi8KPj4gKyAgICB1
aW50OF90IHZyZWdzWzMyICogU0JJX01BWF9WTEVOQl07Cj4+ICt9Owo+PiArCj4+ICtzdHJ1Y3Qg
c2JpX3ZlY3Rvcl9jb250ZXh0ICpzYmlfY3VycmVudF92ZWN0b3JfY29udGV4dCh2b2lkKTsKPj4g
K3ZvaWQgc2JpX3ZlY3Rvcl9zYXZlKHN0cnVjdCBzYmlfdmVjdG9yX2NvbnRleHQgKmRzdCk7Cj4+
ICt2b2lkIHNiaV92ZWN0b3JfcmVzdG9yZShjb25zdCBzdHJ1Y3Qgc2JpX3ZlY3Rvcl9jb250ZXh0
ICpzcmMpOwo+PiArCj4+ICsjZW5kaWYgLy9fX1NCSV9WRUNUT1JfSF9fCj4+ICsKPj4gZGlmZiAt
LWdpdCBhL2xpYi9zYmkvb2JqZWN0cy5tayBiL2xpYi9zYmkvb2JqZWN0cy5tawo+PiBpbmRleCBl
YTgxNmU5Mi4uNWMwY2FmMzkgMTAwNjQ0Cj4+IC0tLSBhL2xpYi9zYmkvb2JqZWN0cy5tawo+PiAr
KysgYi9saWIvc2JpL29iamVjdHMubWsKPj4gQEAgLTEwNiwzICsxMDYsNCBAQCBsaWJzYmktb2Jq
cy15ICs9IHNiaV90cmFwX3ZfbGRzdC5vCj4+ICBsaWJzYmktb2Jqcy15ICs9IHNiaV91bnByaXYu
bwo+PiAgbGlic2JpLW9ianMteSArPSBzYmlfZXhwZWN0ZWRfdHJhcC5vCj4+ICBsaWJzYmktb2Jq
cy15ICs9IHNiaV9jcHBjLm8KPj4gK2xpYnNiaS1vYmpzLXkgKz0gc2JpX3ZlY3Rvci5vCj4+IGRp
ZmYgLS1naXQgYS9saWIvc2JpL3NiaV92ZWN0b3IuYyBiL2xpYi9zYmkvc2JpX3ZlY3Rvci5jCj4+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwLi4zNzIzOWNlMgo+PiAtLS0g
L2Rldi9udWxsCj4+ICsrKyBiL2xpYi9zYmkvc2JpX3ZlY3Rvci5jCj4+IEBAIC0wLDAgKzEsMTM2
IEBACj4+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+PiArICoKPj4gKyAq
IENvcHlyaWdodCAoYykgMjAyNiBSSVNDc3RhciBTb2x1dGlvbnMuCj4+ICsgKgo+PiArICogQXV0
aG9yczoKPj4gKyAqICAgICBEYXZlIFBhdGVsIDxkYXZlLnBhdGVsQHJpc2NzdGFyLmNvbT4KPj4g
KyAqLwo+PiArCj4+ICsjaW5jbHVkZSA8c2JpL3NiaV9kb21haW4uaD4KPj4gKyNpbmNsdWRlIDxz
YmkvcmlzY3ZfZW5jb2RpbmcuaD4KPj4gKyNpbmNsdWRlIDxzYmkvcmlzY3ZfYXNtLmg+Cj4+ICsj
aW5jbHVkZSA8c2JpL3NiaV92ZWN0b3IuaD4KPj4gKwo+PiArLyogUGVyLWhhcnQgdmVjdG9yIG93
bmVyICovCj4+ICtzdGF0aWMgaW5saW5lIHN0cnVjdCBzYmlfdmVjdG9yX2NvbnRleHQgKip2ZWNf
b3duZXJfcHRyKHZvaWQpCj4+ICt7Cj4+ICsgICAgc3RydWN0IHNiaV9zY3JhdGNoICpzY3JhdGNo
ID0gc2JpX3NjcmF0Y2hfdGhpc2hhcnRfcHRyKCk7Cj4+ICsgICAgcmV0dXJuICZzY3JhdGNoLT52
ZWNfY3R4Owo+IAo+IFRoZSBjb2RlIG11c3QgY29tcGlsZSBhbmQgcnVuIGFmdGVyIGV2ZXJ5IHBh
dGNoIGluIHRoZSBzZXJpZXMsIGJ1dCB0aGUgdmVjX2N0eAo+IG1lbWJlciBpc24ndCBhZGRlZCB1
bnRpbCBwYXRjaCAzLCBzbyB0aGlzIGRvZXNuJ3QgY29tcGlsZS4gSG93ZXZlciwgYXMgbWVudGlv
bmVkCj4gYWJvdmUsIHRoZSBjb250ZXh0IHNob3VsZCBiZSBzdG9yZWQgcGVyLWRvbWFpbiBhbnl3
YXkuCm9rLCB0aGFua3MuCj4gCj4gUmVnYXJkcywKPiBTYW11ZWwKPiAKCgpIaSBTYW11ZWwsCiAg
ICAgICAgICBUaGFua3MgZm9yIHRha2luZyBvdXQgdGltZSBhbmQgcHJvdmlkaW5nIGNvbW1lbnRz
OiB2ZXJ5IG11Y2gKYXBwcmVjaWF0ZWQuCgpJIGhhdmUgc29tZSBxdWVzdGlvbi4KClRoYW5rcwpE
YXZlCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
