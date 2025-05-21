Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB092C2D0CD
	for <opensbi@archiver.kernel.org>; Wed, 21 May 2025 13:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PT92MeKJWL7xpEOw3suzo4yhvUyfiF1ncSwyXaVpgN8=; b=Ve1Q/VqXVpsWsH
	/B47u8hABzIEHYaQUmMA7JC9aE2wOtM7OsCAj/ppO+G38R8lk4ovW2WVXyvhwRoyLmkxgTNe69ZPj
	tBb2bw6bozuOIvdi1RYeKmdqIO1RJfR10UET6+5lSKNw7r7OUJj0T4lQtWrmtiYed7Xotj9o0fkK4
	RJ9mtApdRaKTHxVOq1qtTRCeg7KxclHje1yKbswXsg8ReP9GbZxwLJ1wHIUi3PsaB7QgZOCjPZYxb
	dQT/BrpNVLQvjxvLxvwcODnulTSDUZSiUcq/5vsxRvJzGrrmJnn6auINV3Erpeigpn5nrePnoZrby
	9A2T5WPNz4N0wGs3tkOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHjmx-0000000FzH9-3PGO;
	Wed, 21 May 2025 13:47:19 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHjCB-0000000Ft0C-08O6
	for opensbi@lists.infradead.org;
	Wed, 21 May 2025 13:09:20 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6000f2f217dso7878259a12.1
        for <opensbi@lists.infradead.org>; Wed, 21 May 2025 06:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747832957; x=1748437757; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EBDLXFPDKPbEWxabbxIFfX0LtrA013YM/0PjzBcelDg=;
        b=HSTx3ya4UFg+1gBosFFBBVZra/9PN+7P6zx33e/pSYhzY2oTzLjrNxEkN9L0EI1tOE
         GoL3lHd0zQ+mWnzsZ4HDtui1dCQApXenknzosK+b5/OgZlAbOCDF0fty8EwYwE+TRfbb
         2xkFH6vVFns9vxZyyu+R1xi5aczNCEAg3rTUOkWWQimaCxTmOND5ckxCtDJ4oWd0KbO5
         3aLUcR5K6oXOOcMDaoS5nfII9mch8dkeW6m91q5btUNtmr4VWbg0pNDuI6HIDKmOYD09
         iA+9a7j1iqaWz+alvYIDwbd4i0f5+rhqBQ7p0JKAArX4o/zzbBqJLgufxrS5oU+TOhZI
         RTZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747832957; x=1748437757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EBDLXFPDKPbEWxabbxIFfX0LtrA013YM/0PjzBcelDg=;
        b=ZNVh4uudj90YyUv0PuEUzpuCocO8Zliq5z5S5bQBP5TJzHZcD7CKKx4W2s7qJdxKCC
         zOk573r+CHkodvuOkXExcPkGhgxSnVrBFtqO5CrJ9ew0azHR/PcwyPyp4QAdK2nsw+Ie
         sEza0g/grY+J2AEJ9tKaFQEAcUBabqY/uIs6Qddl1Qum7tGruaIhXMV+GIqL3LVRFXMN
         juMZdTq5oXIpa8eWvfJMjDqk//lc+cXVbkupVxDvUzaSNoZ5VzYqWYdxRSuiL3umUdbr
         tPBsf1JdfpjvraFWDDteXwwTFbQbCPfxs4DRpW4Wd6nXbW0BoERnC/Zp/JQk4AcOLk3j
         X9UA==
X-Gm-Message-State: AOJu0YyT0jiSOtCCQB3pHVT1sRVVH/gavaYHNOJ8OYhCmhlGTD9cdtPD
	60E6eEQSjG5MF4HSM7IDaaDosYeUP9dwmq+Nl6Cyb1sD1VY43N35GUivkbFWLDU0yBAIxk7oprL
	cmWkD9vFMRhC4oCNfYFlVOQnaFJ7o3QE=
X-Gm-Gg: ASbGncsHYD+8MBhow32vkssassmYWNP6PT0tAFDB6nqZLzkCVddxIg5aRIM1CtgvBE4
	sf9odzqSU7XqhYOzDa/D5od5byc/RF/QDOrR89BnuCjGKgZQI+7tX1gIYtSPtCysGytWM/oo/+H
	j1eyyVE/X9WY0uI/xkDfaYnBT7ecZ3GIjTB8XQCzkQOqF6pgw8lBmNEXJay4eD9OgaE9A=
X-Google-Smtp-Source: AGHT+IGvfHXVdkr+pvprigVDYCoA1W4bXJTYWDkDWbjmjfSLSpGL+8HT0TKSHQCV95yMCt7jFH3V1Wej+BjMi5+qahg=
X-Received: by 2002:a17:907:6d23:b0:ad1:fa48:da0a with SMTP id
 a640c23a62f3a-ad52d5578efmr1850380466b.35.1747832956714; Wed, 21 May 2025
 06:09:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250520132533.30974-1-jamestiotio@gmail.com> <20250520-ee7cba8dd3e0873b4af0c27f@orel>
In-Reply-To: <20250520-ee7cba8dd3e0873b4af0c27f@orel>
From: James R T <jamestiotio@gmail.com>
Date: Wed, 21 May 2025 21:08:37 +0800
X-Gm-Features: AX0GCFtglieN5Takk0bmHawU92EiDjF90RBNr1aqk5MwbpH1b3HZAGmfThfmHK8
Message-ID: <CAA_Li+tpPSLxbH_mRZZr9=cX=ObOpguU_UusEjtOLzwotpUVgQ@mail.gmail.com>
Subject: Re: [PATCH v4] lib: sbi: pmu: Return SBI_EINVAL if cidx_mask is 0
To: Andrew Jones <ajones@ventanamicro.com>
Cc: opensbi@lists.infradead.org, andrew.jones@linux.dev, atishp@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_060919_073919_847AF8BE 
X-CRM114-Status: GOOD (  33.17  )
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

T24gVHVlLCBNYXkgMjAsIDIwMjUgYXQgMTE6MzfigK9QTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2
ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgTWF5IDIwLCAyMDI1IGF0IDA5OjI1
OjMzUE0gKzA4MDAsIEphbWVzIFJhcGhhZWwgVGlvdmFsZW4gd3JvdGU6Cj4gPiBDdXJyZW50bHks
IHdoZW4gY29uZmlndXJpbmcgYSBtYXRjaGluZyBwcm9ncmFtbWFibGUgSFBNIGNvdW50ZXIgd2l0
aAo+ID4gU3Njb2ZwbWYgYmVpbmcgcHJlc2VudCwgY2lkeF9iYXNlID4gMiwgYW5kIGNpZHhfbWFz
ayA9PSAwIHRvIG1vbml0b3IKPiA+IGVpdGhlciB0aGUgQ1BVX0NZQ0xFUyBvciBJTlNUUlVDVElP
TlMgaGFyZHdhcmUgZXZlbnQsCj4gPiBzYmlfcG11X2N0cl9jZmdfbWF0Y2ggd2lsbCBzdWNjZWVk
IGJ1dCBpdCB3aWxsIGNvbmZpZ3VyZSB0aGUKPiA+IGNvcnJlc3BvbmRpbmcgZml4ZWQgY291bnRl
ciBpbnN0ZWFkIG9mIHRoZSBjb3VudGVyIHNwZWNpZmllZCBieSB0aGUKPiA+IGNpZHhfYmFzZSBw
YXJhbWV0ZXIuCj4gPgo+ID4gRHVyaW5nIGNvdW50ZXIgY29uZmlndXJhdGlvbiwgdGhlIGZvbGxv
d2luZyBpc3N1ZXMgbWF5IGFyaXNlOgo+ID4gLSBJZiB0aGUgU0tJUF9NQVRDSCBmbGFnIGlzIHNl
dCwgYW4gb3V0LW9mLWJvdW5kcyBtZW1vcnkgcmVhZCBvZiB0aGUKPiA+IHBocy0+YWN0aXZlX2V2
ZW50cyBhcnJheSB3b3VsZCBvY2N1ciwgd2hpY2ggY291bGQgbGVhZCB0byB1bmRlZmluZWQKPiA+
IGJlaGF2aW9yLgo+ID4KPiA+IC0gSWYgdGhlIENMRUFSX1ZBTFVFIGZsYWcgaXMgc2V0LCB0aGUg
Y29ycmVzcG9uZGluZyBmaXhlZCBjb3VudGVyIHdpbGwKPiA+IGJlIHJlc2V0LCB3aGljaCBjb3Vs
ZCBiZSBjb25zaWRlcmVkIHVuZXhwZWN0ZWQgYmVoYXZpb3IuCj4gPgo+ID4gLSBJZiB0aGUgQVVU
T19TVEFSVCBmbGFnIGlzIHNldCwgcG11X2N0cl9zdGFydF9odyB3aWxsIHNpbGVudGx5IHN0YXJ0
Cj4gPiB0aGUgZml4ZWQgY291bnRlciwgZXZlbiB0aG91Z2ggaXQgaGFzIGFscmVhZHkgc3RhcnRl
ZC4gRnJvbSB0aGUKPiA+IHN1cGVydmlzb3IncyBwZXJzcGVjdGl2ZSwgbm90aGluZyBoYXMgY2hh
bmdlZCwgd2hpY2ggY291bGQgYmUgY29uZnVzaW5nLgo+ID4gVGhlIHN1cGVydmlzb3Igd2lsbCBu
b3Qgc2VlIHRoZSBTQklfRVJSX0FMUkVBRFlfU1RBUlRFRCBlcnJvciBjb2RlIHNpbmNlCj4gPiBz
YmlfcG11X2N0cl9jZmdfbWF0Y2ggZG9lcyBub3QgcmV0dXJuIHRoZSBlcnJvciBjb2RlIG9mCj4g
PiBwbXVfY3RyX3N0YXJ0X2h3Lgo+ID4KPiA+IFRoZSBvbmx5IHdheSB0byBkZXRlY3QgdGhlc2Ug
aXNzdWVzIGlzIHRvIGNoZWNrIHRoZSBjdHJfaWR4IHJldHVybiB2YWx1ZQo+ID4gb2Ygc2JpX3Bt
dV9jdHJfY2ZnX21hdGNoIGFuZCBjb21wYXJlIGl0IHdpdGggY2lkeF9iYXNlLgo+ID4KPiA+IEZp
eCB0aGVzZSBpc3N1ZXMgYnkgcmV0dXJuaW5nIHRoZSBTQklfRVJSX0lOVkFMSURfUEFSQU0gZXJy
b3IgY29kZSBpZgo+ID4gdGhlIGNpZHhfbWFzayBwYXJhbWV0ZXIgdmFsdWUgYmVpbmcgcGFzc2Vk
IGluIGlzIDAgc2luY2UgYW4gaW52YWxpZAo+ID4gcGFyYW1ldGVyIHNob3VsZCBub3QgbGVhZCB0
byBhIHN1Y2Nlc3NmdWwgc2JpX3BtdV9jdHJfY2ZnX21hdGNoIGJ1dCB3aXRoCj4gPiB1bmV4cGVj
dGVkIHNpZGUgZWZmZWN0cy4KPiA+Cj4gPiBGb2xsb3dpbmcgYSBzaW1pbGFyIHJhdGlvbmFsZSwg
YWRkIHRoZSB2YWxpZGF0aW9uIGNoZWNrIHRvCj4gPiBzYmlfcG11X2N0cl9zdGFydCBhbmQgc2Jp
X3BtdV9jdHJfc3RvcCBhcyB3ZWxsIHNpbmNlIHNiaV9mbHMgaXMKPiA+IHVuZGVmaW5lZCB3aGVu
IHRoZSBtYXNrIGlzIDAuCj4gPgo+ID4gVGhpcyBhbHNvIGFsaWducyBPcGVuU0JJJ3MgYmVoYXZp
b3Igd2l0aCBLVk0ncy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBSYXBoYWVsIFRpb3Zh
bGVuIDxqYW1lc3Rpb3Rpb0BnbWFpbC5jb20+Cj4gPiBSZXZpZXdlZC1ieTogQXRpc2ggUGF0cmEg
PGF0aXNocEByaXZvc2luYy5jb20+Cj4gPiBSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9u
ZXNAdmVudGFuYW1pY3JvLmNvbT4KPiA+IC0tLQo+Cj4gTmVlZCBhIGNoYW5nZWxvZyBoZXJlLiBJ
IHNlZSB0aGUgb25seSBjaGFuZ2UgZnJvbSB2MyBpcyBkcm9wcGluZyB0aGUgKCksCj4gdGhvdWdo
Lgo+CgpGb3IgcG9zdGVyaXR5LCB0aGUgY29tcGxldGUgY2hhbmdlbG9nIGlzOgotIHYyOiBJbXBy
b3ZlIGNvbW1pdCBtZXNzYWdlIHdpdGggYnVnIGRlc2NyaXB0aW9uCi0gdjM6IEFkZCBjaGVjayB0
byBzYmlfcG11X2N0cl9zdGFydCBhbmQgc2JpX3BtdV9jdHJfc3RvcAotIHY0OiBSZW1vdmUgdW5u
ZWNlc3NhcnkgcGFyZW50aGVzZXMKCkJlc3QgcmVnYXJkcywKSmFtZXMgUmFwaGFlbCBUaW92YWxl
bgoKPiBUaGFua3MsCj4gZHJldwo+Cj4gPiAgbGliL3NiaS9zYmlfcG11LmMgfCAxNSArKysrKysr
KysrLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlv
bnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfcG11LmMgYi9saWIvc2JpL3Ni
aV9wbXUuYwo+ID4gaW5kZXggNTk4M2E3OC4uNmNhNGVmZCAxMDA2NDQKPiA+IC0tLSBhL2xpYi9z
Ymkvc2JpX3BtdS5jCj4gPiArKysgYi9saWIvc2JpL3NiaV9wbXUuYwo+ID4gQEAgLTIwNiw2ICsy
MDYsMTIgQEAgc3RhdGljIGludCBwbXVfY3RyX3ZhbGlkYXRlKHN0cnVjdCBzYmlfcG11X2hhcnRf
c3RhdGUgKnBocywKPiA+ICAgICAgIHJldHVybiBldmVudF9pZHhfdHlwZTsKPiA+ICB9Cj4gPgo+
ID4gK3N0YXRpYyBib29sIHBtdV9jdHJfaWR4X3ZhbGlkYXRlKHVuc2lnbmVkIGxvbmcgY2Jhc2Us
IHVuc2lnbmVkIGxvbmcgY21hc2spCj4gPiArewo+ID4gKyAgICAgLyogRG8gYSBiYXNpYyBzYW5p
dHkgY2hlY2sgb2YgY291bnRlciBiYXNlICYgbWFzayAqLwo+ID4gKyAgICAgcmV0dXJuIGNtYXNr
ICYmIGNiYXNlICsgc2JpX2ZscyhjbWFzaykgPCB0b3RhbF9jdHJzOwo+ID4gK30KPiA+ICsKPiA+
ICBpbnQgc2JpX3BtdV9jdHJfZndfcmVhZCh1aW50MzJfdCBjaWR4LCB1aW50NjRfdCAqY3ZhbCkK
PiA+ICB7Cj4gPiAgICAgICBpbnQgZXZlbnRfaWR4X3R5cGU7Cj4gPiBAQCAtNDcyLDcgKzQ3OCw3
IEBAIGludCBzYmlfcG11X2N0cl9zdGFydCh1bnNpZ25lZCBsb25nIGNiYXNlLCB1bnNpZ25lZCBs
b25nIGNtYXNrLAo+ID4gICAgICAgaW50IGksIGNpZHg7Cj4gPiAgICAgICB1aW50NjRfdCBlZGF0
YTsKPiA+Cj4gPiAtICAgICBpZiAoKGNiYXNlICsgc2JpX2ZscyhjbWFzaykpID49IHRvdGFsX2N0
cnMpCj4gPiArICAgICBpZiAoIXBtdV9jdHJfaWR4X3ZhbGlkYXRlKGNiYXNlLCBjbWFzaykpCj4g
PiAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPgo+ID4gICAgICAgaWYgKGZsYWdzICYgU0JJ
X1BNVV9TVE9QX0ZMQUdfVEFLRV9TTkFQU0hPVCkKPiA+IEBAIC01NzcsOCArNTgzLDggQEAgaW50
IHNiaV9wbXVfY3RyX3N0b3AodW5zaWduZWQgbG9uZyBjYmFzZSwgdW5zaWduZWQgbG9uZyBjbWFz
aywKPiA+ICAgICAgIHVpbnQzMl90IGV2ZW50X2NvZGU7Cj4gPiAgICAgICBpbnQgaSwgY2lkeDsK
PiA+Cj4gPiAtICAgICBpZiAoKGNiYXNlICsgc2JpX2ZscyhjbWFzaykpID49IHRvdGFsX2N0cnMp
Cj4gPiAtICAgICAgICAgICAgIHJldHVybiBTQklfRUlOVkFMOwo+ID4gKyAgICAgaWYgKCFwbXVf
Y3RyX2lkeF92YWxpZGF0ZShjYmFzZSwgY21hc2spKQo+ID4gKyAgICAgICAgICAgICByZXR1cm4g
cmV0Owo+ID4KPiA+ICAgICAgIGlmIChmbGFnICYgU0JJX1BNVV9TVE9QX0ZMQUdfVEFLRV9TTkFQ
U0hPVCkKPiA+ICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FTk9fU0hNRU07Cj4gPiBAQCAtODM5
LDggKzg0NSw3IEBAIGludCBzYmlfcG11X2N0cl9jZmdfbWF0Y2godW5zaWduZWQgbG9uZyBjaWR4
X2Jhc2UsIHVuc2lnbmVkIGxvbmcgY2lkeF9tYXNrLAo+ID4gICAgICAgaW50IHJldCwgZXZlbnRf
dHlwZSwgY3RyX2lkeCA9IFNCSV9FTk9UU1VQUDsKPiA+ICAgICAgIHUzMiBldmVudF9jb2RlOwo+
ID4KPiA+IC0gICAgIC8qIERvIGEgYmFzaWMgc2FuaXR5IGNoZWNrIG9mIGNvdW50ZXIgYmFzZSAm
IG1hc2sgKi8KPiA+IC0gICAgIGlmICgoY2lkeF9iYXNlICsgc2JpX2ZscyhjaWR4X21hc2spKSA+
PSB0b3RhbF9jdHJzKQo+ID4gKyAgICAgaWYgKCFwbXVfY3RyX2lkeF92YWxpZGF0ZShjaWR4X2Jh
c2UsIGNpZHhfbWFzaykpCj4gPiAgICAgICAgICAgICAgIHJldHVybiBTQklfRUlOVkFMOwo+ID4K
PiA+ICAgICAgIGV2ZW50X3R5cGUgPSBwbXVfZXZlbnRfdmFsaWRhdGUocGhzLCBldmVudF9pZHgs
IGV2ZW50X2RhdGEpOwo+ID4gLS0KPiA+IDIuNDMuMAo+ID4KCi0tIApvcGVuc2JpIG1haWxpbmcg
bGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
