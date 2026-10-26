Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BF3606A31A
	for <opensbi@archiver.kernel.org>; Mon, 26 Oct 2026 05:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AEiZITJh;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=Ht0eSMtQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7lhPYr6uAJJXNgfZYSDfVYoyveRB/ObdLYLVeg5Kvm8=; b=AEiZITJhkJmfMIJkbjMakxWd1C
	omXeKMMOvapgDcvhNZqhwnOsOtEV9OEjIAASWnpcLOWIBqD7/z6pZ/0F4ltgKL1N5Pk4PULZ/l4Tj
	GgSs2LY0geYooH4iS65+Lo0luuWx1fbTWo1sHqkH0uexxtFiRV3THLddjk6MCnVPf9ozJf9Xmz6yK
	ui4zAKcVJeJ5P8saQKvtQtNMUxcu9CXwHtAEBU/4m1tD5rRdydl0ynX+XS7PUJ196mwLqBd79FW3X
	Af6MlwxW9Qu3xpxH+CJbSlzonubbqC8iNzs/BEIKk4Pq/l5EAwESHSlFWd1w7uHDpb9YGCibg/DI2
	7TSSkuFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLCuG-00000001j99-0ZCk;
	Mon, 26 Oct 2026 05:06:00 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLCuD-00000001j8K-1kof
	for opensbi@lists.infradead.org;
	Mon, 26 Oct 2026 05:05:58 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-48c5358fc28so2349488f8f.0
        for <opensbi@lists.infradead.org>; Sun, 25 Oct 2026 22:05:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792991155; cv=none;
        d=google.com; s=arc-20260327;
        b=FeqXhNp//N/Nss1Mu88oZiUrnG5Us0YewiNatw2vvZDpJh3JL1wHS1gjNzthH1zE+U
         3pd+gJvmjRVA56lOViwdwcnXpwNGyo6GdDtu7ZC1H6+EEtWdMo4Lyv5KGTNeP2unnnEX
         NWU6kmwJ0ocZ0h8C3LFWVkZgiD6OJZpvaZTFTO3DwIpZtwe9vTEGYsmEpBN4FVJf3p7O
         I9hWNdZTnJwECTwYiI0UqiedmfpZ6wFcBM7QywubC/WUmMEOcLhRHUDeZ8jAlT3KHUa4
         UbY8UGR9d8zljigoETd5lBQ07e180j3wyEA0rGCLpJ0/Ro1U5VmeJAsagGtomEXXDTNw
         5DsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A+n8bYE+vOvSLdkzTVUngdcM5NfSJJ4kmt7dYc5e6d4=;
        fh=Dh6aZinx23Z80DMo/g7Tzp0Oq2qhcklt202M/UMjetY=;
        b=n7grs1sMaNRJjTnRXT1Sf6bdJFOJ1uLMOx4AsmUvu73onI6nJTeJ56CoXXTI47oBRD
         VL7UTs5Bl9BPerj6ydtdLdJqM6AIV4K/upr5pQmw3kPvSGZ20X0vt+SrTHYTUZK+wj8g
         UphqiZQ4e62IXNk40krwqr+3cCYw1a1RMy4ian4e62lB5MgObir9eZQCY9/zuuEm3IMJ
         KpEXmfdT0zyNfvaRwj7c6yZ+/YAt1IOhLaskBliW1XOgdZshpAZPLxXh1trkoEA8AZuG
         HLbIGuYJspH/6gOc6MZaGTUNU5M6+Cc94NX8bsv8ve1AmcjiG4HdbLK8WFWQpcQpDmxP
         EnxQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792991155; x=1793595955; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A+n8bYE+vOvSLdkzTVUngdcM5NfSJJ4kmt7dYc5e6d4=;
        b=Ht0eSMtQqXHLOzHfyP4fRqi1pbbNYvDO38mB+HuQMh9B3we5bY1o5z7bTDrYrNkKD4
         FWkTecZr6dMqLmpeen3KyTBg/CpDxSQ7BuaKYoZsSpv06SsK89tE9O/qYmy3vCDdvo2C
         ZXmaL7MGW+ftYptRPzYc5EfaZ2ERJinjiJiW2+Y7zKjuJUSk/BxIeOWMNCh9acqNJQ/u
         CSU+4E4zKrVZRGCHLBCvWMOJhPe1o/eRWS6jwv+ldbePKsCk2oLs7CplAJDGgMvAPDcd
         LQn1zWYvik379EMmqZdsAIxLxx1t1FZL/nqxY/WgGiF/malE8zgJH0CMBPq1VsyADL6e
         ZCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792991155; x=1793595955;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A+n8bYE+vOvSLdkzTVUngdcM5NfSJJ4kmt7dYc5e6d4=;
        b=XNdjChR+T113iStlxDPIKVAi3lDCrBqPx5XzPxAZEbLlVXDesuXEu6q+O3ckGjC/vP
         iHFzMEQVtbFQhe107I0Ia/+bYUhJiiediOflzV1vqMEIySM55/9Mk+5LtOunW8Qk7V1I
         v6v/oRacInJsS8iqoKAhqWNafYH+CJFrCPl+lk7tfYvyn2i332uWkQwSvLatpYYiFRQ3
         n7SWfp7GQB6Ck2NHNwkLfZ0iieU5NKK1LCWX4jg8oK42Xw8dQCYpYc4heFAAMy3iX5RS
         nlS792GBswgvMA6dV+ru+gmSbwUQZh4zctBtB3hWIf9gPbwjc9PKElnN/fDS3pOBgPLe
         goyQ==
X-Gm-Message-State: AFq9FYIeT7ch+bgOd743H9tlTkjh7p0a4ZAEOgb3KbPQBWQMUL7j/oTl
	/JnYiaqhIxg+dXC0q1Hn2WiTkiFWDnV05E/Hfel48HueFc7//1f67kY7RPi3Ul/s+0umDOVXZjj
	4h6+lEsMwrhbz7JHu/QTe51wG1zsuKtJXA2VmEWxVuw==
X-Gm-Gg: AYBFou3Ta2cfTXH7TjY9/fprkU8tlRVknkWumDMNcFti0/0N8WQp7b2gYlfRrXTQrUZ
	QnRwMvRt9nR1yQLtcWVnzE89GPukqIoGFBmSRFTY5IjwocVBZUsAWy1dvLFo9tn3dZVykFrJy1U
	1trnpz7/06w5pQgm93y0R3fdQq34KszkH5a6gLUb9AL9nw+N8whm1nChu+xPn94uhiOiY1i9fts
	1PS0OPOL9Q7kZD/qG4ty0Hp0hLQ12gGIw1OfCX8endKnarv3C/GapNm4TFdmxlPNKTFJ8JCrKhN
	8D22OCWNa7jr7mT6g7Uo75IY98B+m7EQs/Q8BBUrgRi0Dvq1vqWixMpAURaRsm+2kEJfZ6s+h6O
	UUddcdeoJ9hVySefCIQ82czhNtdw2JzpiAB82Hu4ycxmAkRbqESnncBuNOY/iDpDeyzw9kPeyOS
	R+FUJRqXjoYjCEWH42WPU2wcZFdwymc8Nr4owrYEgmadub2t4S9Dx8p+c6
X-Received: by 2002:a5d:5e8d:0:b0:48d:ee35:b3fe with SMTP id
 ffacd0b85a97d-48e3eb3cbfamr8608858f8f.8.1792991154933; Sun, 25 Oct 2026
 22:05:54 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260910052629.3359493-1-liutong@iscas.ac.cn> <20260910052629.3359493-5-liutong@iscas.ac.cn>
In-Reply-To: <20260910052629.3359493-5-liutong@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 26 Oct 2026 10:35:43 +0530
X-Gm-Features: AclHuK_S0J7I0YLT7z1VGxPdfQesqVrKcnDRXlNr7j2WDE-Oln2fcHqDGd4h9kQ
Message-ID: <CAAhSdy15MDJB09AUCuMuG1xtPxAyJUHtM5jDcquZ3t_2PvGMOA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] lib: sbi_mpxy: fix integer overflow in attribute
 range endpoint
To: liutong <liutong@iscas.ac.cn>
Cc: opensbi@lists.infradead.org, himanshu.chauhan@oss.qualcomm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_220557_488696_5FB25A69 
X-CRM114-Status: GOOD (  23.16  )
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBTZXAgMTAsIDIwMjYgYXQgMTA6NTbigK9BTSBsaXV0b25nIDxsaXV0b25nQGlzY2Fz
LmFjLmNuPiB3cm90ZToKPgo+IHNiaV9tcHh5X3JlYWRfYXR0cnMoKSBhbmQgc2JpX21weHlfd3Jp
dGVfYXR0cnMoKSBjb21wdXRlIHRoZSBlbmQgb2YgdGhlCj4gcmVxdWVzdGVkIHJhbmdlIGFzIGEg
dTMyOgo+Cj4gICBlbmRfaWQgPSBiYXNlX2F0dHJfaWQgKyBhdHRyX2NvdW50IC0gMTsKPgo+IE1l
c3NhZ2UgcHJvdG9jb2wgYXR0cmlidXRlIGlkcyBleHRlbmQgdG8KPiBTQklfTVBYWV9BVFRSX01T
R1BST1RPX0FUVFJfRU5EICgweGZmZmZmZmZmKSwgc28gdGhlIGd1YXJkCj4gImVuZF9pZCA+IFNC
SV9NUFhZX0FUVFJfTVNHUFJPVE9fQVRUUl9FTkQiIGNhbm5vdCBob2xkIGZvciBhIHUzMiBhbmQK
PiBuZXZlciByZWplY3RzIGFueXRoaW5nLgo+Cj4gU3VjaCBhIHJlcXVlc3QgdGhlbiByZWFjaGVz
IHRoZSBtZXNzYWdlIHByb3RvY29sIGRyaXZlciwgd2hpY2ggY29tcHV0ZXMKPiB0aGUgc2FtZSBl
bmRwb2ludCBpbiBhIHUzMiBhbmQgc28gcGFzc2VzIGl0cyBvd24gcmFuZ2UgY2hlY2sgYXMgd2Vs
bCwKPiBhbmQgaW5kZXhlcyBpdHMgYXR0cmlidXRlIGFycmF5IHdpdGggYXR0cl9pZDJpbmRleChi
YXNlX2F0dHJfaWQpLiBGb3IKPiBiYXNlX2F0dHJfaWQgMHhmZmZmZmZmZiB0aGF0IGlzIGluZGV4
IDB4N2ZmZmZmZmYsIGFuIG91dC1vZi1ib3VuZHMgcmVhZAo+IHdob3NlIHJlc3VsdCBpcyBjb3Bp
ZWQgaW50byB0aGUgc2hhcmVkIG1lbW9yeS4KPgo+IFdpZGVuIGVuZF9pZCB0byB1NjQgc28gdGhl
IGVuZHBvaW50IGlzIGV4YWN0IGFuZCBzdWNoIGEgcmVxdWVzdCBpcwo+IHJlamVjdGVkIGJlZm9y
ZSBhIGRyaXZlciBydW5zLiBUaGUgc3RhbmRhcmQgYXR0cmlidXRlIHBhdGggaXMgbm90Cj4gYWZm
ZWN0ZWQsIHNpbmNlIGF0dHJfY291bnQgaXMgYWxyZWFkeSBsaW1pdGVkIHRvIHRoZSBzaGFyZWQg
bWVtb3J5IHNpemUKPiB0aGVyZS4KPgo+IEZpeGVzOiA3OTM5YmYxMzI5ZWIgKCJsaWI6IHNiaTog
QWRkIFNCSSBNZXNzYWdlIFByb3h5IChNUFhZKSBmcmFtZXdvcmsiKQo+IFNpZ25lZC1vZmYtYnk6
IGxpdXRvbmcgPGxpdXRvbmdAaXNjYXMuYWMuY24+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAg
UGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpBcHBsaWVkIHRoaXMgcGF0Y2ggdG8gdGhlIHJp
c2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywKQW51cAoKPiAtLS0KPiBQcmV2aW91c2x5IHNlbnQg
YXMgW1BBVENIIHYyIDYvNl0uCj4KPiBDaGFuZ2VzIGluIHYzOgo+IC0gUmViYXNlZCBvbnRvIGN1
cnJlbnQgbWFzdGVyOyB0aGUgY29kZSBpcyB1bmNoYW5nZWQgZnJvbSB2Mgo+IC0gQ29tbWl0IG1l
c3NhZ2UgcmV3cml0dGVuLiB2MiBzYWlkIHRoZSB3cmFwIG1hZGUgdGhlIHN0YW5kYXJkCj4gICBh
dHRyaWJ1dGUgZ3VhcmQgcGFzcyBpbmNvcnJlY3RseSwgYnV0IGF0dHJfY291bnQgaXMgYWxyZWFk
eSBsaW1pdGVkCj4gICB0byB0aGUgc2hhcmVkIG1lbW9yeSBzaXplIG9uIHRoYXQgcGF0aCwgc28g
aXQgY2Fubm90IHdyYXAgdGhlcmUuIFRoZQo+ICAgZ3VhcmQgdGhhdCBhIHUzMiBlbmRwb2ludCBk
aXNhYmxlcyBpcyB0aGUgbWVzc2FnZSBwcm90b2NvbCBvbmUsIGFuZAo+ICAgdGhlIGVmZmVjdCBp
cyBhbiBvdXQtb2YtYm91bmRzIHJlYWQgaW4gdGhlIG1lc3NhZ2UgcHJvdG9jb2wgZHJpdmVyCj4g
ICByYXRoZXIgdGhhbiBvbiB0aGUgc2hhcmVkIG1lbW9yeSBpdHNlbGYuCj4gLSBTcGxpdCBpbnRv
IHRoaXMgc2VyaWVzCj4KPiAgbGliL3NiaS9zYmlfbXB4eS5jIHwgNiArKysrLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9saWIvc2JpL3NiaV9tcHh5LmMgYi9saWIvc2JpL3NiaV9tcHh5LmMKPiBpbmRleCAyYjlhZDM1
MS4uNjIyYzdkODkgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfbXB4eS5jCj4gKysrIGIvbGli
L3NiaS9zYmlfbXB4eS5jCj4gQEAgLTQ3NSw3ICs0NzUsOCBAQCBpbnQgc2JpX21weHlfcmVhZF9h
dHRycyh1MzIgY2hhbm5lbF9pZCwgdTMyIGJhc2VfYXR0cl9pZCwgdTMyIGF0dHJfY291bnQpCj4g
IHsKPiAgICAgICAgIHN0cnVjdCBtcHh5X3N0YXRlICptcyA9IHNiaV9kb21haW5fbXB4eV9zdGF0
ZV90aGlzaGFydF9wdHIoKTsKPiAgICAgICAgIGludCByZXQgPSBTQklfU1VDQ0VTUzsKPiAtICAg
ICAgIHUzMiAqYXR0cl9wdHIsIGVuZF9pZDsKPiArICAgICAgIHUzMiAqYXR0cl9wdHI7Cj4gKyAg
ICAgICB1NjQgZW5kX2lkOwo+ICAgICAgICAgdm9pZCAqc2htZW1fYmFzZTsKPiAgICAgICAgIHN0
cnVjdCBzYmlfZG9tYWluICpkb20gPSBzYmlfZG9tYWluX3RoaXNoYXJ0X3B0cigpOwo+Cj4gQEAg
LTYyNSw3ICs2MjYsOCBAQCBzdGF0aWMgdm9pZCBtcHh5X3dyaXRlX3N0ZF9hdHRyKHN0cnVjdCBz
YmlfbXB4eV9jaGFubmVsICpjaGFubmVsLCB1MzIgYXR0cl9pZCwKPiAgaW50IHNiaV9tcHh5X3dy
aXRlX2F0dHJzKHUzMiBjaGFubmVsX2lkLCB1MzIgYmFzZV9hdHRyX2lkLCB1MzIgYXR0cl9jb3Vu
dCkKPiAgewo+ICAgICAgICAgc3RydWN0IG1weHlfc3RhdGUgKm1zID0gc2JpX2RvbWFpbl9tcHh5
X3N0YXRlX3RoaXNoYXJ0X3B0cigpOwo+IC0gICAgICAgdTMyICptZW1fcHRyLCBhdHRyX2lkLCBl
bmRfaWQsIGF0dHJfdmFsOwo+ICsgICAgICAgdTMyICptZW1fcHRyLCBhdHRyX2lkLCBhdHRyX3Zh
bDsKPiArICAgICAgIHU2NCBlbmRfaWQ7Cj4gICAgICAgICBzdHJ1Y3Qgc2JpX21weHlfY2hhbm5l
bCAqY2hhbm5lbDsKPiAgICAgICAgIGludCByZXQsIG1lbV9pZHg7Cj4gICAgICAgICB2b2lkICpz
aG1lbV9iYXNlOwo+IC0tCj4gMi4zNC4xCj4KPgo+IC0tCj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QK
PiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVu
c2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9vcGVuc2JpCg==
