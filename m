Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CC0606A31B
	for <opensbi@archiver.kernel.org>; Tue, 27 Oct 2026 15:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S4vN3uWC;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=le8dKDTw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pnJ/0yoBWIDAoYExo22sh2wFV+gGZt7eiJH0uxnUyKk=; b=S4vN3uWCQtlNstdPNtLXY/VSSf
	DuoMFb6KMPaxNn4mjVQ/szaJNziwjIKlbWmv4VOdwQ9X6P7IIJ54G32UgoEFFK972SykoH5kKiyu2
	/UvYJ4Peng/POWlpWIki3jdo2EqilE4hI/VO/y3uugMjb2zUl41U1EL0tWN1N8Igfmc4AWCfUrLEu
	wBzqsYmt3RB012CeW/xI1o2ih3lH/b9Cypz8TGQVmPmmSC0fZ3OgNVP1r1RxR/PamdmGbxt1kjn0B
	/PfgZ/2V1dKALZAwwHvaQxFiz06BA6zcLXwBIaG19LFNh3jLhP1bIUgF0N1peUi6umzyC5EicUhZK
	rrLDEf/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLj78-00000005AeO-0zGE;
	Tue, 27 Oct 2026 15:29:26 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLj75-00000005Adb-47GO
	for opensbi@lists.infradead.org;
	Tue, 27 Oct 2026 15:29:25 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-3a9e87ba696so30690141fa.0
        for <opensbi@lists.infradead.org>; Tue, 27 Oct 2026 08:29:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793114962; cv=none;
        d=google.com; s=arc-20260327;
        b=dI7icFUUxcgAnAmpuoTUMIxekyPe0+c3itFD19ufz7VqsgzHV/UYPZW3xx1j2KHuWp
         eCPieO91IbyS5msoZW5KSdq53bjlxqKlNZjt1Z6fOgVAO63sAAD52aYNreJYsTHcUNQ1
         NlcmmFpxIEE1iKthRLsuEhLwS3pLBCiaw6u7MIJnv5LasVlToY9Ogbd/xImTFO4uzRt4
         ZGZW0JkonFFXYaURmAW+4HErfguGqY1TKJ99P7q3bmhSQi4RjtQFwAP3QMzb9qAVrK+h
         7wUKPpS+6q5pVFDOsyTbr6B9hoNi/5oWPT8E5KXSbH6CP4H2iv6d/K53GH3DxW1PEUe2
         NFEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EPBuWtOAZ6V8LP5GUVTfkjJ2VGWQApIomfVKgktFQ8Y=;
        fh=PuEIaFB7AZmrTBpJW/fRSDPALmDSZ17OZVllTNb+mbs=;
        b=GtH6Ols1xe29gavGEgN/PLFAKGvjx63fPMN6T/ubLRelE6VHrBSriFIP7944+ctvUJ
         73yQdChygd8X8eGTHR+IwTn7k19FLoUIM4QJFj7EZQZUNR8mY89wp6WEtqHr02H1AHZm
         kFmY/hZiEpAy1ocossDu2Ks9p3657sHlH8kI7W1gDz445LUhr8GZgZ64lRNvygk7S9k9
         SMRJuUl1jGHmwbnJRi2G0K6paVxxKJOzaysnbTJ4bEp8EDGMzTXrPruAOs2FBT9UbELn
         uGWxyJcIdigbdVRY8tAoOx2KVAc3eNVYXb1qwf35PYPJoKCueQH5UjX0h/UG/vDbo3x/
         YBWw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793114962; x=1793719762; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EPBuWtOAZ6V8LP5GUVTfkjJ2VGWQApIomfVKgktFQ8Y=;
        b=le8dKDTwc/Q989Nq5gnMDnKu9iOSVgBrhK8UoTJ98AbCZJw5aEmnnfQqHJxlsXdLab
         kUMKCzpTr3Ut407rLGiqZkSLaQBZgBoHi/NWIjosMlbxA3HvKeWuUoSjcddDU9N/Pp0y
         iSSJfKLPvOvkDwfrmf4AtBG6zQm7CYtQ+tVJY285aKavJtxn6MBoLT0LuFXDaDfpmAlk
         NeMNhuAG8gFtj4PDLU0/0qoIj5zTP9wzGB5ugDhWEb9vnz1GT2EmMrUJbXrn5XgevF6l
         D+5K2UqTCNf6RZqE6xw27N1+dn9YF5fgsQGO6pR4QzC1kJFB1FCVZTH/uLSl19ZR0YTO
         QM5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114962; x=1793719762;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EPBuWtOAZ6V8LP5GUVTfkjJ2VGWQApIomfVKgktFQ8Y=;
        b=jDTJsnZJuCFkX3zsmTOR1bvDCtKzTBwu/PHmUbchZbVVhH2ozWKr1WT97H+pjvUSJ1
         +1H0YRTI6sNV0f3ShMzRwdep/XhhfCCQ0cQJOU27KvzTgRWfMDaOpD44bY35hltN5BJM
         hlnRHF0lbtLSk8Zsi0/xZN4I926jAVSpPGNYMn66mjVqApGyuOqd2SlnCMpPOw1QZ+HE
         QxnD5qthBoXTZT4Bj0AsIlbmXo73iSJd7kPrRSBmEqOR5LnmY+Xy2yEincPr2mKHzvFE
         t+5rM0X+B22FGsAiw/khHydsX8Ikn0W3/3b9I2AWgz1Ic0PU0QVSzeyUVnHVlqYvfy0W
         1vng==
X-Gm-Message-State: AFq9FYLZTZwYfwVuVMcizjwChFKCpdsOxYMv1Oe7BXu1MBy2yxeXLd5X
	yfR3B9kXx2UOB5nwIB5d2cTNzY+iahqAIcp/flRcCxpVgv9cd4kgBoMyXxA/iAiIaHSorQz6+v6
	ioZ6BKLzMlHjTbxTnf1nykVEhFInYzeUOqTVDvYMm66gHcWk2YPZ3
X-Gm-Gg: AYBFou3TvErhueXDYgGeyQNh7yhWvwbTcJ0YyIwghhSQ4/378HQ6VedqG7aQKsHZ/BM
	hPfb8KVvXj3z30q3XZDoRFXUQcsqPO8PC+DicBaxZ+7k4Q5IDf62BxZGkju7Mt6CykQeZzSfw1j
	rhRJRmMvUXUXOavNcQWUE58EH3nfhpPlyZkHdPb698FFFz2gk5pnwPMXrBYsEZbO9dHw9saemaq
	dySRFcK201gjNRCdyTyBoT3BY5QW3m7Fqrty0WYgIzmMoYN+//CFvhmAzr3DqEjpz+k4OLLP9lY
	JgxvO44Pbsq4bPAP+h3vyBTFK45903MrSpP0xdjPqz37GiA07ZlOq6ys8jqxDCmyrmgbHFlsyLd
	RaUNwt7XLgyOeX/ZaW/3V4GQon3IYRpAPslH3ajoYg5YOXOhyFO0s40cJlN2r0YRGb8VLOxvtPZ
	WDqjWRUetSloeRu4KpUZx9ZUKXZAEZDx9N3KomhhWVxjYXdgQjJ6JQOn1d
X-Received: by 2002:a05:651c:1445:b0:3ab:4c60:897c with SMTP id
 38308e7fff4ca-3ac6fd59c08mr24225571fa.27.1793114961567; Tue, 27 Oct 2026
 08:29:21 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260921182017.999610-1-indrek.kruusa@gmail.com>
In-Reply-To: <20260921182017.999610-1-indrek.kruusa@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 27 Oct 2026 20:59:04 +0530
X-Gm-Features: AclHuK9H0p1g-5Mqg9dsTu9qix69IbQdDGad8IMDon-QV99X7c86S-388xbF_1Y
Message-ID: <CAAhSdy2CCY4xDC=WpNx3G9WEA=VKMfiD4j1DaHaE1wrZdrvdDg@mail.gmail.com>
Subject: Re: [PATCH] platform: generic: allwinner: Support the D1s as well
To: Indrek Kruusa <indrek.kruusa@gmail.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_082924_039312_4287D44D 
X-CRM114-Status: GOOD (  18.25  )
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

T24gTW9uLCBTZXAgMjEsIDIwMjYgYXQgMTE6NTDigK9QTSBJbmRyZWsgS3J1dXNhIDxpbmRyZWsu
a3J1dXNhQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGUgQWxsd2lubmVyIEQxcyBTb0MgaXMgYSBz
dHJpcHBlZC1kb3duIHZlcnNpb24gb2YgdGhlIEQxIGFuZCBEMXMKPiBib2FyZHMgdXNlICJhbGx3
aW5uZXIsc3VuMjBpLWQxcyIgYXMgdGhlaXIgcm9vdCBjb21wYXRpYmxlIHN0cmluZwo+IGluc3Rl
YWQgb2YgImFsbHdpbm5lcixzdW4yMGktZDEiLiBTbywgY3VycmVudGx5IHRoZSBzdW4yMGkgb3Zl
cnJpZGUgaXMKPiBub3Qgc2VsZWN0ZWQgb24gdGhlbS4KPgo+IEFkZCB0aGUgRDFzIGNvbXBhdGli
bGUgdG8gdGhlIG1hdGNoIHRhYmxlLgo+Cj4gVGVzdGVkIG9uIHRoZSBNYW5nb1BpIE1RIGJvYXJk
IHdpdGggdGhlIEFsbHdpbm5lciBGMTMzLUEgKEQxcykgU29DLgo+Cj4gU2lnbmVkLW9mZi1ieTog
SW5kcmVrIEtydXVzYSA8aW5kcmVrLmtydXVzYUBnbWFpbC5jb20+CgpMR1RNLgoKUmV2aWV3ZWQt
Ynk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpBcHBsaWVkIHRoaXMgcGF0Y2gg
dG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywKQW51cAoKCj4gLS0tCj4gIHBsYXRm
b3JtL2dlbmVyaWMvYWxsd2lubmVyL3N1bjIwaS1kMS5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL3BsYXRmb3JtL2dlbmVyaWMvYWxsd2lu
bmVyL3N1bjIwaS1kMS5jIGIvcGxhdGZvcm0vZ2VuZXJpYy9hbGx3aW5uZXIvc3VuMjBpLWQxLmMK
PiBpbmRleCA0ZWE5MDE1OC4uYWVlYzA3OGUgMTAwNjQ0Cj4gLS0tIGEvcGxhdGZvcm0vZ2VuZXJp
Yy9hbGx3aW5uZXIvc3VuMjBpLWQxLmMKPiArKysgYi9wbGF0Zm9ybS9nZW5lcmljL2FsbHdpbm5l
ci9zdW4yMGktZDEuYwo+IEBAIC0yMjksNiArMjI5LDcgQEAgc3RhdGljIGludCBzdW4yMGlfZDFf
cGxhdGZvcm1faW5pdChjb25zdCB2b2lkICpmZHQsIGludCBub2Rlb2ZmLAo+Cj4gIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgZmR0X21hdGNoIHN1bjIwaV9kMV9tYXRjaFtdID0gewo+ICAgICAgICAgeyAu
Y29tcGF0aWJsZSA9ICJhbGx3aW5uZXIsc3VuMjBpLWQxIiB9LAo+ICsgICAgICAgeyAuY29tcGF0
aWJsZSA9ICJhbGx3aW5uZXIsc3VuMjBpLWQxcyIgfSwKPiAgICAgICAgIHsgfSwKPiAgfTsKPgo+
IC0tCj4gMi40My4wCj4KPgo+IC0tCj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxp
c3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL29wZW5zYmkKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9v
cGVuc2JpCg==
