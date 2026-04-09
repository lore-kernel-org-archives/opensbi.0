Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565EAE9DE5B
	for <opensbi@archiver.kernel.org>; Thu,  9 Apr 2026 07:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B9bhwOzp8nLoDIp58+9zcxjM2hBQ/tFu/ROUkmfMS1M=; b=uvE2DLhfB9b6Jd
	mCn5baMkXBiRFZlCvLgiNwYO61KYTgRM3s+sJ9G3RlrnD2+h0K4ektVzuaO7zoN75t3N4Kg9lUKJk
	b4JEVpwDwS3piNTRzXoLpp7eck1wHQnGSq43LSp0DxsbkNAJtOmjrl47HYbbaOBn8+UWQmJVavc1G
	yNt2uga4l01k3zBNbrJLUIhLIukZjk1C/C4yrTUD8BlbkqZNGdspPMUZw6YaNiZ0IDLQuHGgPHIiT
	ftjmD/tNHGNstPvvfkgn2FHFdYAS7QzwCAxd0Dj6ImbLgTOfspk8O7jV4w2ytWTMjLSnvT4sJR308
	nD3tPLh55PbbGBYTDkVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAkAJ-00000009sgX-3a5R;
	Thu, 09 Apr 2026 07:51:03 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAkAH-00000009sgA-0D7A
	for opensbi@lists.infradead.org;
	Thu, 09 Apr 2026 07:51:02 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-7dbd2a0211bso447216a34.0
        for <opensbi@lists.infradead.org>; Thu, 09 Apr 2026 00:51:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775721060; cv=none;
        d=google.com; s=arc-20240605;
        b=i5gc7rVWWlCLxLCjr9eTIhpfe6i/Dfz68vrnohlBxvHEN3aA9D/dJsGgE2B+Ekk9wq
         T1BHvsvZozSSAwjxNtMystZg3lMiKXwdul5xa73/H1kx4AAUY1V6I7J2SJchPfJ+lP3b
         L8KnRjV8E41oo/B2WRhjXRrjCK0VFo/Fjp7VMgCQVXhVS1NDaV6yG9LGlEA68D/JUH9M
         z+cVY7fsQjuiP1iFa9A2Menk0AmlpISk8g+geOvDnrUUq5NiVtBG/8vkqtNva4KtJqNr
         sZ5dSi/RAxSq+H9UtTGICjdJioxMukN2cEp0s/JckmKlUR942qSViaiOxKfoaZgSMlxa
         4J9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x0JwF2CGuYP5sC6NldPbodaMmJ6KGKoBgSsaxKlFp14=;
        fh=cmXEMq8ZrulEnk+8ca5l/gFL3IbCu5TAikrGskjbfKI=;
        b=IEVYy9HUKZ2R+4gsGJ5ivW+dYZYNAWRUwuw30wFE2RXHNCon8JIftobJv9piqgBUMB
         aI9oIltA4fSE/cQ2unpfJLTlh3dkzN+ZlWNkudbxgzQWBwBBM0i75Eh8OL2OkUdEwBrs
         po1Q1oUB1vfJW4kX0nt3CKgV+n4U1p7X58hRdHOKx7wIJfNvh/TtbAurOTrlRV/lRs62
         sB9w5HE7/De2LzPRcILG9sD6MoOGkaYrEzUbIRW6tFVqWk0GZN5Zy98vtmqkMjfdbBlO
         pXt20wgo9OxiNlTEdXQ8il1m3gzTTnPRhd1dSGTpHkca195rGrlvbivnC+LazqQbLhE2
         K9wA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1775721060; x=1776325860; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x0JwF2CGuYP5sC6NldPbodaMmJ6KGKoBgSsaxKlFp14=;
        b=NV7CFR358646qJdMRMgWHWRlSLB/MVhkjTrvhbIjqMF6c48ge4l6YLOqFxTtYpRD92
         eOBMlTWO9sk8qHVtrclktZVKOKhkAnGC7BlZP+LONfT06l2POTnzJx6IbuB5CBgsrbyJ
         KD4XXb4Vh405mn8BJ5pZGqGRdzBUOrzY+mG+Cpmc4Hv2kUqIDeDbJ2rIKQUdyJ8SOjwS
         1jMOweB4S2Xh8JJy77Zpzs81WhvUAjOKofCHLyFy6MF6eu8oTbmEdGGAidS1PCy2Z5os
         W8TqivH8EJ9buhrtRoPC/nyTYfsd60szG5t/m3YNpVNeLWS/krlSMF9d/4hwyYY5NxXX
         2iOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775721060; x=1776325860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x0JwF2CGuYP5sC6NldPbodaMmJ6KGKoBgSsaxKlFp14=;
        b=X+qAgCoSo77DGC+T9+g1e7kPE9sVH+56hfvQ/9jSqeOS9NY7DREZ5PhskoeSbeEfn5
         KKH9nZ4Np5T2EFNDQv5P6ZQPtnstBywEd6njeeInQBrpYALQ65bnd2V93wVEOU2cR8wm
         oALw5+v6hE8lZiLSsH4MNVuTPiaTFC9hpI7mY57UzDUxi27CpKBznGhKd+d7DQof2iQM
         mdZEJKOfb9YcTk89slXvBMPT4uguFOoZ0KwzUqRGpgwjWy10vEDe07RanU0maRze5jTd
         n1n0RNmbafAstCFdgxUCg1SrxxfkVUqHcTypkaF7IItErZrQarmOSTEYMXsrjBwe3te+
         JdJA==
X-Gm-Message-State: AOJu0YyQn87HrkprZFFeEn3w5FIsAfYn2C7q1rObtZiYeeZBsE6yLEf0
	x3Y7N0x9TiUuwPfCbwOMU0z3QZHNO0PCU5MshcBxFA7KyrbkBZ8DmM9Ueo4UtO6Zj4aFcgGql0a
	OOqvcun8pMhulnb2+hofQZahDtHGb+UqCpCUsyzOTSg==
X-Gm-Gg: AeBDiev40uCoD/cWcaCQIjDCt4fQO0yTyLHv79PLVXKAR8t1O2RJpFOz+E40uP5W6aV
	r32uj/VVTYYXIs8F7/wi7yvBGxzs8trTTVgvcmUuEHtoKAn5dtEXa9KNnHpfcehQIPHCe177ghG
	cL1qOuFPPm2vbEgWQbqbqChXazWu9SU+PWHrTslZ0Uo9d0FSb157VOT9HE6FK+hibvlWZwyWibG
	6Dn8H1bc8COS3QQPeD+aqZ3k/qnTGUkPZEQOPr2SOxeFG3b42j45AnRpCA75/i7vL9IrNv4f0Hu
	iU9l1gKF8wp0Ye4hEllaNGxo5+suovreAe3qVfX+sEvtT59Sb7ztZdh9jqxWMdb7HMDaJTHKvV9
	gstbxFk93pBFXcGnbqXD+xKFSig==
X-Received: by 2002:a05:6820:a01:b0:67e:33aa:f544 with SMTP id
 006d021491bc7-68220e49638mr10928213eaf.56.1775721059719; Thu, 09 Apr 2026
 00:50:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260310183155.2186463-1-evvoevod@oss.tenstorrent.com> <20260310183155.2186463-2-evvoevod@oss.tenstorrent.com>
In-Reply-To: <20260310183155.2186463-2-evvoevod@oss.tenstorrent.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 9 Apr 2026 13:20:48 +0530
X-Gm-Features: AQROBzCX424tg3Ya9_AZyfv9jcDC17fHy3KoRsSleTulp1l2-jB5Fw0UhY99L2I
Message-ID: <CAAhSdy1BN4_uKXGg+=+4khoZ2mcvmkvi9_7ymDGG0qw9mbFsNw@mail.gmail.com>
Subject: Re: [PATCH 1/7] include: sbi_scratch: Add tmp1 scratch space for RNMI
 context saving
To: Evgeny Voevodin <evvoevod@tenstorrent.com>
Cc: opensbi@lists.infradead.org, evvoevod@oss.tenstorrent.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_005101_366707_85EBA0A8 
X-CRM114-Status: GOOD (  16.15  )
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

T24gV2VkLCBNYXIgMTEsIDIwMjYgYXQgMTI6MDPigK9BTSBFdmdlbnkgVm9ldm9kaW4KPGV2dm9l
dm9kQHRlbnN0b3JyZW50LmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBFdmdlbnkgVm9ldm9kaW4gPGV2
dm9ldm9kQHRlbnN0b3JyZW50LmNvbT4KPgo+IFJOTUkgaGFuZGxlcnMgdXNlIE1OU0NSQVRDSCBp
bnN0ZWFkIG9mIE1TQ1JBVENIIGFuZCBuZWVkIHNlcGFyYXRlIHNjcmF0Y2gKPiBzcGFjZSBmcm9t
IHJlZ3VsYXIgdHJhcCBoYW5kbGluZy4gQWRkIHRtcDEgZm9yIFJOTUkgY29udGV4dCB3aGlsZSB0
bXAwCj4gcmVtYWlucyBmb3IgcmVndWxhciB0cmFwcy4KPgo+IFNpZ25lZC1vZmYtYnk6IEV2Z2Vu
eSBWb2V2b2RpbiA8ZXZ2b2V2b2RAdGVuc3RvcnJlbnQuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5
OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywKQW51cAoKPiAtLS0K
PiAgZmlybXdhcmUvZndfYmFzZS5TICAgICAgICB8ICAzICsrLQo+ICBpbmNsdWRlL3NiaS9zYmlf
c2NyYXRjaC5oIHwgMTEgKysrKysrKystLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2Zpcm13YXJlL2Z3X2Jhc2Uu
UyBiL2Zpcm13YXJlL2Z3X2Jhc2UuUwo+IGluZGV4IDYzYmI0NDczLi5jZGIxNTQyOSAxMDA2NDQK
PiAtLS0gYS9maXJtd2FyZS9md19iYXNlLlMKPiArKysgYi9maXJtd2FyZS9md19iYXNlLlMKPiBA
QCAtMjU4LDkgKzI1OCwxMCBAQCBfc2NyYXRjaF9pbml0Ogo+ICAgICAgICAgLyogU3RvcmUgaGFy
dGlkLXRvLXNjcmF0Y2ggZnVuY3Rpb24gYWRkcmVzcyBpbiBzY3JhdGNoIHNwYWNlICovCj4gICAg
ICAgICBsbGEgICAgIGE0LCBfaGFydGlkX3RvX3NjcmF0Y2gKPiAgICAgICAgIFJFR19TICAgYTQs
IFNCSV9TQ1JBVENIX0hBUlRJRF9UT19TQ1JBVENIX09GRlNFVCh0cCkKPiAtICAgICAgIC8qIENs
ZWFyIHRyYXBfY29udGV4dCBhbmQgdG1wMCBpbiBzY3JhdGNoIHNwYWNlICovCj4gKyAgICAgICAv
KiBDbGVhciB0cmFwX2NvbnRleHQsIHRtcDAgYW5kIHRtcDEgaW4gc2NyYXRjaCBzcGFjZSAqLwo+
ICAgICAgICAgUkVHX1MgICB6ZXJvLCBTQklfU0NSQVRDSF9UUkFQX0NPTlRFWFRfT0ZGU0VUKHRw
KQo+ICAgICAgICAgUkVHX1MgICB6ZXJvLCBTQklfU0NSQVRDSF9UTVAwX09GRlNFVCh0cCkKPiAr
ICAgICAgIFJFR19TICAgemVybywgU0JJX1NDUkFUQ0hfVE1QMV9PRkZTRVQodHApCj4gICAgICAg
ICAvKiBTdG9yZSBmaXJtd2FyZSBvcHRpb25zIGluIHNjcmF0Y2ggc3BhY2UgKi8KPiAgICAgICAg
IE1PVl8zUiAgczAsIGEwLCBzMSwgYTEsIHMyLCBhMgo+ICAjaWZkZWYgRldfT1BUSU9OUwo+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL3NiaS9zYmlfc2NyYXRjaC5oIGIvaW5jbHVkZS9zYmkvc2JpX3Nj
cmF0Y2guaAo+IGluZGV4IDU4ZDU0NjI4Li5hNmVkZWIyZCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRl
L3NiaS9zYmlfc2NyYXRjaC5oCj4gKysrIGIvaW5jbHVkZS9zYmkvc2JpX3NjcmF0Y2guaAo+IEBA
IC00MCwxMiArNDAsMTQgQEAKPiAgI2RlZmluZSBTQklfU0NSQVRDSF9UUkFQX0NPTlRFWFRfT0ZG
U0VUICAgICAgICAgICAgICAgICgxMSAqIF9fU0laRU9GX1BPSU5URVJfXykKPiAgLyoqIE9mZnNl
dCBvZiB0bXAwIG1lbWJlciBpbiBzYmlfc2NyYXRjaCAqLwo+ICAjZGVmaW5lIFNCSV9TQ1JBVENI
X1RNUDBfT0ZGU0VUICAgICAgICAgICAgICAgICAgICAgICAgKDEyICogX19TSVpFT0ZfUE9JTlRF
Ul9fKQo+ICsvKiogT2Zmc2V0IG9mIHRtcDEgbWVtYmVyIGluIHNiaV9zY3JhdGNoICovCj4gKyNk
ZWZpbmUgU0JJX1NDUkFUQ0hfVE1QMV9PRkZTRVQgICAgICAgICAgICAgICAgICAgICAgICAoMTMg
KiBfX1NJWkVPRl9QT0lOVEVSX18pCj4gIC8qKiBPZmZzZXQgb2Ygb3B0aW9ucyBtZW1iZXIgaW4g
c2JpX3NjcmF0Y2ggKi8KPiAtI2RlZmluZSBTQklfU0NSQVRDSF9PUFRJT05TX09GRlNFVCAgICAg
ICAgICAgICAoMTMgKiBfX1NJWkVPRl9QT0lOVEVSX18pCj4gKyNkZWZpbmUgU0JJX1NDUkFUQ0hf
T1BUSU9OU19PRkZTRVQgICAgICAgICAgICAgKDE0ICogX19TSVpFT0ZfUE9JTlRFUl9fKQo+ICAv
KiogT2Zmc2V0IG9mIGhhcnRpbmRleCBtZW1iZXIgaW4gc2JpX3NjcmF0Y2ggKi8KPiAtI2RlZmlu
ZSBTQklfU0NSQVRDSF9IQVJUSU5ERVhfT0ZGU0VUICAgICAgICAgICAoMTQgKiBfX1NJWkVPRl9Q
T0lOVEVSX18pCj4gKyNkZWZpbmUgU0JJX1NDUkFUQ0hfSEFSVElOREVYX09GRlNFVCAgICAgICAg
ICAgKDE1ICogX19TSVpFT0ZfUE9JTlRFUl9fKQo+ICAvKiogT2Zmc2V0IG9mIGV4dHJhIHNwYWNl
IGluIHNiaV9zY3JhdGNoICovCj4gLSNkZWZpbmUgU0JJX1NDUkFUQ0hfRVhUUkFfU1BBQ0VfT0ZG
U0VUICAgICAgICAgKDE1ICogX19TSVpFT0ZfUE9JTlRFUl9fKQo+ICsjZGVmaW5lIFNCSV9TQ1JB
VENIX0VYVFJBX1NQQUNFX09GRlNFVCAgICAgICAgICgxNiAqIF9fU0laRU9GX1BPSU5URVJfXykK
PiAgLyoqIE1heGltdW0gc2l6ZSBvZiBzYmlfc2NyYXRjaCAoNEtCKSAqLwo+ICAjZGVmaW5lIFNC
SV9TQ1JBVENIX1NJWkUgICAgICAgICAgICAgICAgICAgICAgICgweDEwMDApCj4KPiBAQCAtODMs
NiArODUsOCBAQCBzdHJ1Y3Qgc2JpX3NjcmF0Y2ggewo+ICAgICAgICAgdW5zaWduZWQgbG9uZyB0
cmFwX2NvbnRleHQ7Cj4gICAgICAgICAvKiogVGVtcG9yYXJ5IHN0b3JhZ2UgKi8KPiAgICAgICAg
IHVuc2lnbmVkIGxvbmcgdG1wMDsKPiArICAgICAgIC8qKiBUZW1wb3Jhcnkgc3RvcmFnZSAqLwo+
ICsgICAgICAgdW5zaWduZWQgbG9uZyB0bXAxOwo+ICAgICAgICAgLyoqIE9wdGlvbnMgZm9yIE9w
ZW5TQkkgbGlicmFyeSAqLwo+ICAgICAgICAgdW5zaWduZWQgbG9uZyBvcHRpb25zOwo+ICAgICAg
ICAgLyoqIEluZGV4IG9mIHRoZSBoYXJ0ICovCj4gQEAgLTEwNiw2ICsxMTAsNyBAQCBhc3NlcnRf
bWVtYmVyX29mZnNldChzdHJ1Y3Qgc2JpX3NjcmF0Y2gsIHBsYXRmb3JtX2FkZHIsIFNCSV9TQ1JB
VENIX1BMQVRGT1JNX0FERAo+ICBhc3NlcnRfbWVtYmVyX29mZnNldChzdHJ1Y3Qgc2JpX3NjcmF0
Y2gsIGhhcnRpZF90b19zY3JhdGNoLCBTQklfU0NSQVRDSF9IQVJUSURfVE9fU0NSQVRDSF9PRkZT
RVQpOwo+ICBhc3NlcnRfbWVtYmVyX29mZnNldChzdHJ1Y3Qgc2JpX3NjcmF0Y2gsIHRyYXBfY29u
dGV4dCwgU0JJX1NDUkFUQ0hfVFJBUF9DT05URVhUX09GRlNFVCk7Cj4gIGFzc2VydF9tZW1iZXJf
b2Zmc2V0KHN0cnVjdCBzYmlfc2NyYXRjaCwgdG1wMCwgU0JJX1NDUkFUQ0hfVE1QMF9PRkZTRVQp
Owo+ICthc3NlcnRfbWVtYmVyX29mZnNldChzdHJ1Y3Qgc2JpX3NjcmF0Y2gsIHRtcDEsIFNCSV9T
Q1JBVENIX1RNUDFfT0ZGU0VUKTsKPiAgYXNzZXJ0X21lbWJlcl9vZmZzZXQoc3RydWN0IHNiaV9z
Y3JhdGNoLCBvcHRpb25zLCBTQklfU0NSQVRDSF9PUFRJT05TX09GRlNFVCk7Cj4gIGFzc2VydF9t
ZW1iZXJfb2Zmc2V0KHN0cnVjdCBzYmlfc2NyYXRjaCwgaGFydGluZGV4LCBTQklfU0NSQVRDSF9I
QVJUSU5ERVhfT0ZGU0VUKTsKPgo+IC0tCj4gMi40My4wCj4KPgo+IC0tCj4gb3BlbnNiaSBtYWls
aW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0tIApvcGVuc2JpIG1haWxpbmcg
bGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
