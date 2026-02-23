Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF97BEF5865
	for <opensbi@archiver.kernel.org>; Mon, 23 Feb 2026 05:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ip94LoN+LN20Zcu1GNBfIMdcOwDQ3JR5yg6fvtAlCHA=; b=1W2o1H+pREQzc7
	LnM7i4T7kXY9+nLFiJsTVJROTXlXXps22fphONK8deQECwU/mS7O2dd3xSyTIQlZV5lXdFq8NQVPn
	ipsSasNJcDZzDZSydmtJy8bKk8jOmipO6PsmZUZpeXykzJnqe1IxO7guBilEsrzM//lHXhdNbRZng
	grAe4wVxi/jPRD7AQJF5zVQjlf6m//eAZDemCSNDSfjB20FLZgI+VDNrMIDRAcGVCc4q0HJ3F3j3y
	dX1C4jdfx4Rnom1U+a/sGW4uWwd9Fb5GkbUeF9078W2QyuQgBWaCoNWBlfYO/2PwYdvWL+yM/EDb/
	JiaQBkrCTfMETJxsWfUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuO36-0000000HEgA-2iTB;
	Mon, 23 Feb 2026 05:00:00 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuO33-0000000HEf7-3zce
	for opensbi@lists.infradead.org;
	Mon, 23 Feb 2026 04:59:59 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-662efd1bdd4so2273734eaf.0
        for <opensbi@lists.infradead.org>; Sun, 22 Feb 2026 20:59:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771822797; cv=none;
        d=google.com; s=arc-20240605;
        b=jHF2hZPFoQ0lHJDqo4dOi7Ve/vJV/zqP85cdVcmjKGwLt84exDSY2t+nG2nm3BmQpk
         q7GMzKXNYJi0n6yOqM9QUXSnTRGD00A3zjNeIq3l0Fk58Kmhn+D6QeXGCd3ys0mOQU6n
         +MCt3Vem2rsyTH6JUzciJVrCqWwx+EczCrJdGOx+6iWNHSj5lYCH9F2epJqdsOxZ4XQu
         BTad80N96W5M/go9v2TwQXRi9F2PRvZfJeArt5nirsZfYYNkvm/SV1yLABWTzqevSRcC
         Y4eAbeLvSafDD2FQ1XIoFFFLDHJrWJaT6+Tg4r1oVZk4VvXi1OEarYRQwmAgtWY/sprY
         hgcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ADJlDwfgiilMF7sTfPSrPhyYpN24q1/6wP8TKYiJQyk=;
        fh=YKcsHR7jyHuqFbxF9TEF32A5pzizE+s5ek3T2qh5h1Y=;
        b=W1gSOpu9EFR/WxoetLTzMyh2GpMm8QTVvLhJOXZRW1GiWijAhHLaZy2AOHnxv0qDWD
         C1GaXXNzE71HXY0RFvJCOqYymXnhI5LHfDYYaoZiuPRAMSsnU8fe2KqHGMqfzxdeA5ZQ
         ThMvlDLZlhItJt18DdYvr2yxdZmkjIU0QLTR87eZHYy0DdTSXlf5MEA6y4Tlmqjnq/cW
         2PcZkKk2g+kItvsbjUXmTs7ZswgWecDhejYAHyCl3iaLKFchVlbNRCwtAIxdM8q/6g0X
         J3poCBIdgUkkybsaJkU1G6uY+PV3Wrji/kv6KLVF8sw9L2Fj990JbxraqICytmZzOmV4
         4tjQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1771822797; x=1772427597; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ADJlDwfgiilMF7sTfPSrPhyYpN24q1/6wP8TKYiJQyk=;
        b=u0dIPn/BZM8XQT7OZ3m35jiwqrk/GLjfyOJYI096gFePywfhUbExkwVoAbVBtAm/v9
         eU0sZsOTDun7CcK9rJKbSVmVqLUDcEG30Jt3vVfNm/XxIcn/4yBM9A+8oznuZqEQH5BP
         mD+En6lNi3HzgiwaCHLxvOn3UwzipQgq7PpxnUC9NscgTlmeBvr8ft5+dnp5jvv9pxKw
         crOmU2+iyYVXQw+eA6mJPnsJZjF9m9/iFufa9BF48g7clt853yJuRTwAlfFueFSRqWyg
         NKq62p3vA4MhD2vo8z2p7hLzrJG41prr6pKGgpK1hYIe7tsj8yxu8SSI8n22A6COBkdU
         /BuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771822797; x=1772427597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ADJlDwfgiilMF7sTfPSrPhyYpN24q1/6wP8TKYiJQyk=;
        b=JhUrOn+7TpIHm5V/lt2LJRb1KM//DB7iMb+W+vcZa316qPVw37PjkYHGQgyxlqG48B
         kXVcneToZBgwm6WD2NS5mVdh71tGfRpE3DXdOqUJQ5Bh42X2PlF3mSORlH5qUAtkqq/L
         0z/CPlZdfiqqrdDYreYTz0H1aDhGnp4b9Fh2Rfi2pcqIEnWrUfltTDBiCRe+FS+Xl49u
         pnwWvqnRVeqVzIQpre+PNHOSXqpvE5sAiOSjDaS79X0qAgPFVpDwu89g5equSxslZaEU
         0/K9WV2Op0jMLivz4OEMUQDndUEtcrjWQDUWnSpOwIkBgLQTUP4Y9JiT40Jztq4EJgVU
         QvYQ==
X-Gm-Message-State: AOJu0Yw5Bm1DnNNZjXUwGAC/Q0ce75qCQckM5+MfmS8JvIGNHLK/XZWs
	smCEylxIgLJS2LWzAKplpIma2fzFk358AMF2xmWh6MKiFcg0rCc1Mnia+QChvY7pvnBIRVtVoL7
	9s3fWS/jd1e3J9vijAXRU1zZXLOa1tGsfLqTgJo3kXznjCor8lBMnoQxYYg==
X-Gm-Gg: AZuq6aLRY9fys5R6Ohby3HG9Di1QINj//UsOqVKFJ7fAkr0WhfZhJw4NW9sHJC1D4Vb
	tuece8oHMKIiUnlrH9XK7ZTxcOE6oq8y/TKXcr1gsvOD5KIdFlWJwsXNkfWsEUPi2PuLkNFbyqn
	cchSVTkFCzu9MpJiUjwmWLRZx5mDuhQMpzPmWBZUacrhmI8SekL4zmaqr4FjCi84oGtsxKmyp/3
	1krwIZSCV/OXhlsBJ6ZQnTTCmTaw051o3RA613Y6/SVS/hDlSbAUmv2UTpY6MPaifbx2khvf8tl
	KsMeVX4qi2Dl+LTiLshxCpqBNRZs4x3L03l0WCBkNuMQfKSb5Q+ACf/VHKXaxAl02Ey15RIJR8L
	1u8iK7SPX0db9fLMUw+72xLORcmpPquV9kAkVNQ==
X-Received: by 2002:a05:6820:1c8d:b0:674:5797:122c with SMTP id
 006d021491bc7-679b0e02ef5mr7252132eaf.4.1771822796698; Sun, 22 Feb 2026
 20:59:56 -0800 (PST)
MIME-Version: 1.0
References: <20260127-pmu_platform_stop-v1-1-b07d1abd1ef2@gmail.com>
In-Reply-To: <20260127-pmu_platform_stop-v1-1-b07d1abd1ef2@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 23 Feb 2026 10:29:44 +0530
X-Gm-Features: AaiRm50Sr1uHUOoVcZBfwwQGyNjyyJK8tUjouxyq-25pOwP2ybuEBsJ7KwPcmyM
Message-ID: <CAAhSdy2sttP2czaxAzev+xeCShtzvrNAtJRx9Ph_YCHN1dfmyg@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi_pmu: Track SBI_PMU_FW_PLATFORM started counter
To: thecharlesjenkins@gmail.com
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_205958_275180_8EEC0141 
X-CRM114-Status: GOOD (  17.99  )
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

T24gV2VkLCBKYW4gMjgsIDIwMjYgYXQgNToyOOKAr0FNIENoYXJsaWUgSmVua2lucyB2aWEgQjQg
UmVsYXkKPGRldm51bGwrdGhlY2hhcmxlc2plbmtpbnMuZ21haWwuY29tQGtlcm5lbC5vcmc+IHdy
b3RlOgo+Cj4gRnJvbTogQ2hhcmxpZSBKZW5raW5zIDx0aGVjaGFybGVzamVua2luc0BnbWFpbC5j
b20+Cj4KPiBXaGVuIGEgU0JJX1BNVV9GV19QTEFURk9STSBzdGFydHMsIGFkZCB0aGUgY291bnRl
ciB0byB0aGUgY291bnRlciBhcnJheQo+IGluc3RlYWQgb2YgcmV0dXJuaW5nIGVhcmx5LiBUaGlz
IHdpbGwgY2F1c2UgZndfY291bnRlcl9zdG9wKCkgdG8gYmUKPiBjYWxsZWQgd2hlbiBhIFNCSV9Q
TVVfRldfUExBVEZPUk0gY291bnRlciBzaG91bGQgYmUgc3RvcHBlZC4KPgo+IFNpZ25lZC1vZmYt
Ynk6IENoYXJsaWUgSmVua2lucyA8dGhlY2hhcmxlc2plbmtpbnNAZ21haWwuY29tPgoKVGhpcyBp
cyBhbHJlYWR5IGNvdmVyZWQgYnkgdGhlIGZvbGxvd2luZyBwYXRjaDoKImxpYjogc2JpX3BtdTog
Rml4IG11bHRpcGxlIEZXIGNvdW50ZXIgc3RhcnQgb3BlcmF0aW9ucyB3aXRoIGN1c3RvbSBQTVUg
ZGV2aWNlIgoKUmVnYXJkcywKQW51cAoKPiAtLS0KPiAgbGliL3NiaS9zYmlfcG11LmMgfCAxMCAr
KysrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfcG11LmMgYi9saWIvc2JpL3NiaV9wbXUu
Ywo+IGluZGV4IGUwODQwMDVkLi4zYzYxMDc5YiAxMDA2NDQKPiAtLS0gYS9saWIvc2JpL3NiaV9w
bXUuYwo+ICsrKyBiL2xpYi9zYmkvc2JpX3BtdS5jCj4gQEAgLTQ0OCw2ICs0NDgsOCBAQCBzdGF0
aWMgaW50IHBtdV9jdHJfc3RhcnRfZncoc3RydWN0IHNiaV9wbXVfaGFydF9zdGF0ZSAqcGhzLAo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50NjRfdCBldmVudF9kYXRhLCB1aW50NjRf
dCBpdmFsLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib29sIGl2YWxfdXBkYXRlKQo+
ICB7Cj4gKyAgICAgICBpbnQgcmMgPSAwOwo+ICsKPiAgICAgICAgIGlmICgoZXZlbnRfY29kZSA+
PSBTQklfUE1VX0ZXX01BWCAmJgo+ICAgICAgICAgICAgIGV2ZW50X2NvZGUgPD0gU0JJX1BNVV9G
V19SRVNFUlZFRF9NQVgpIHx8Cj4gICAgICAgICAgICAgZXZlbnRfY29kZSA+IFNCSV9QTVVfRldf
UExBVEZPUk0pCj4gQEAgLTQ2OCw5ICs0NzAsOSBAQCBzdGF0aWMgaW50IHBtdV9jdHJfc3RhcnRf
Zncoc3RydWN0IHNiaV9wbXVfaGFydF9zdGF0ZSAqcGhzLAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2lkeCAtIG51bV9od19jdHJzLAo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
aXZhbCk7Cj4KPiAtICAgICAgICAgICAgICAgcmV0dXJuIHBtdV9kZXYtPmZ3X2NvdW50ZXJfc3Rh
cnQocGhzLT5oYXJ0aWQsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNpZHggLSBudW1faHdfY3RycywKPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZXZlbnRfZGF0YSk7Cj4gKyAgICAgICAgICAgICAgIHJj
ID0gcG11X2Rldi0+ZndfY291bnRlcl9zdGFydChwaHMtPmhhcnRpZCwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNpZHggLSBudW1faHdfY3RycywKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGV2ZW50X2RhdGEp
Owo+ICAgICAgICAgfSBlbHNlIHsKPiAgICAgICAgICAgICAgICAgaWYgKGl2YWxfdXBkYXRlKQo+
ICAgICAgICAgICAgICAgICAgICAgICAgIHBocy0+ZndfY291bnRlcnNfZGF0YVtjaWR4IC0gbnVt
X2h3X2N0cnNdID0gaXZhbDsKPiBAQCAtNDc4LDcgKzQ4MCw3IEBAIHN0YXRpYyBpbnQgcG11X2N0
cl9zdGFydF9mdyhzdHJ1Y3Qgc2JpX3BtdV9oYXJ0X3N0YXRlICpwaHMsCj4KPiAgICAgICAgIHBo
cy0+ZndfY291bnRlcnNfc3RhcnRlZCB8PSBCSVQoY2lkeCAtIG51bV9od19jdHJzKTsKPgo+IC0g
ICAgICAgcmV0dXJuIDA7Cj4gKyAgICAgICByZXR1cm4gcmM7Cj4gIH0KPgo+ICBzdGF0aWMgdm9p
ZCBwbXVfdXBkYXRlX2luaGliaXRfZmxhZ3ModW5zaWduZWQgbG9uZyBmbGFncywgdWludDY0X3Qg
Km1ocG1ldmVudF92YWwpCj4KPiAtLS0KPiBiYXNlLWNvbW1pdDogNzQ0MzRmMjU1ODczZDc0ZTU2
Y2M1MGFhNzYyZDFjYWYyNGMwOTlmOAo+IGNoYW5nZS1pZDogMjAyNjAxMjctcG11X3BsYXRmb3Jt
X3N0b3AtZmViZWY2NWFiZjU0Cj4KPiAtIENoYXJsaWUKPgo+Cj4KPiAtLQo+IG9wZW5zYmkgbWFp
bGluZyBsaXN0Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCgotLSAKb3BlbnNiaSBtYWlsaW5n
IGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
