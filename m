Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBED1606A320
	for <opensbi@archiver.kernel.org>; Wed, 18 Nov 2026 14:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BxWPg7xc;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=ubzN0+pG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8l+IjpDARYXWVAwdSjRAK/aV2ovtmX+QKJq/Isg6x9c=; b=BxWPg7xcMndbfgjyInfXPmDXcf
	97xTE5iAP9kr5J+gZJoeE/UHbNGzZyLXeu7Y4N3iJM+Bzz2M1J892ChcMkU4QJgqeE6806a92oriQ
	SifWyeFzyEQA+bUKTEk92zrnfKBXuNNZkuqtaICYJdPM9Z665lz3YUTTi6ogCjF2n6fsLpVBU289T
	2U1R0ZgsZN/cIYbEegYwxvlu1ub6rB1QAxCOBL6IAjhPdJUNsP1L3Nycwzt7W9icwjTE4oeLDauo1
	vk9jhx1O+8L8g805yKY+p8163OlxpqkGl28czsYTI7NNd4eTfHcUldnij1Oe9ReeSXa23nxRhkgnw
	Lr/gNV6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTghU-000000097Pb-1AQW;
	Wed, 18 Nov 2026 14:31:52 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTghS-000000097OX-0xl1
	for opensbi@lists.infradead.org;
	Wed, 18 Nov 2026 14:31:51 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so9879485e9.2
        for <opensbi@lists.infradead.org>; Wed, 18 Nov 2026 06:31:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795012308; cv=none;
        d=google.com; s=arc-20260327;
        b=Cfe+5HiFMdUvooi/0eZ7n8+cdk6lspKFdg9dsEKBeBUCFBt1ALu+6lXSDuIYNzHqd9
         bsmm3bU1IGZ0pbuckGsXAhfB+kfKrfm+G+RzwRqbjQeQSubsF3Z/RRtK+QGCakdtFayU
         wEambsa/A7m8PVNcbQgo7Lqf3CrkM9E2gOoffi5RrWHabK7htZhT9PkhS5Z6ujaWZetL
         gUAn1erXPIh11XZ9dPo/Ux1Jn8iOdZAiJ3YDKZfHCmNQKRRObK8oZVKY3+o6+s8jEaP/
         0HA3OSFL/TZ6vM2dv4GOZakHhc7fWmFz7VcT5urtIO0jT74saz/GekCXMLWfpeb91ns0
         XfLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p+Voo1Dx0JzRH6vH3jVDZunAeUmMUfq+axBmJ/6RPNo=;
        fh=KrYJhzZvIgXYjgi9IqeDq7QDVTAAX0EvLn/l70df43w=;
        b=cjLqBgylxosaSbe8mtuh82Resu1QxhAQqBMqKUCawQWmoXApLZ8xdd4LmyeuLyv+4T
         aJd++6n9pW5ApACnrJjt1qSyMYtU19ab+dON1l7w8G51IAtjwRUfmsBM3TDllqq0FNev
         6p/wtbeBfcIKQ5iMdvtI6x14GAPEOWlwqYk3RWB7AQYrF1cWQElxClQ8PRsROyUI1l+0
         18AzUYbiB20XUub0Yi+h0Ry0ugTTbnRSQzKQG68T4PXO8R6VlzCNsQSHG9LoVX+G4A//
         X82oHBpKYKXXwdbq3ZPcOHtIW9TwWHdj8/tVILUQ6VP1f4MrFwxSOVnVF93MIABGyh4O
         zmlg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795012308; x=1795617108; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p+Voo1Dx0JzRH6vH3jVDZunAeUmMUfq+axBmJ/6RPNo=;
        b=ubzN0+pGnHqdCwQ33MDIZPHWEwy7t0dU9K3zRprJNi8/UmowspaNvXnDgarM+7XASq
         NHg8kwAIvj0XQDHIcoaI5v6AQZAHZeP8rhfMlN6Es9pv040k7E4QsLvSqZ2zXASgW80A
         IkodZWyFJGP//epn7ZID4GfUv3KlYB5IrnGhVOq2aNm4t7FlBIzGnTIRtWYrm2lxJLfm
         lWm2l72y1FJILCipSt75NsFZoRMqukPOVh69c8rEyRkYCD5wnZOGgLtufKq1+6oB1XX5
         JUy52owfcqaUZaHOIjPvoDCbyd02S1JEeCBlsi1Y+hHNdYtDShBD5GnPSiKF1Hagj9ot
         0YSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795012308; x=1795617108;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p+Voo1Dx0JzRH6vH3jVDZunAeUmMUfq+axBmJ/6RPNo=;
        b=rdyfJwSEl0/r4iO/n4HUspSsZvCK2gt9Bj0H9vooMvD9FoQ6ASI9opD4dOq9cDq3aq
         AXmyyGknBq4be9oipXKopZ6rWnrAcfiYKuRh9EWM9CrLm1wd3g0WG/mtQmF8Y9TG1TCW
         ddeTZUc8vWcgY9ojiNb3Rn4zGwEH0XmyCFjI9+rfudMBZOmIxEliuthaO3A85LEe8Ykm
         ReCAh84O4NwFmp0D8vV+hXQdrN/hdnVk3k1vr9VAwLIdrEcGrN34rI7suMejQIt2+2Hf
         4lz0aylSl/Djeo+2zYxmkFO1L888RkVjiU4ITzxze7aJCte4ah/nVDxmbTXqy30KBKI8
         eDNA==
X-Gm-Message-State: APuU4Z/2OaBPQuwWX2vBO7adp9xkisQItK6jVCE3WcF86IZguFbRCZkw
	npiqs0y9EdSCQROe/Lq4UnKH5dVRNHXAHfu6W+Z//e3v53sIx0D2GprfMMOp//VxoJuhMfDgXYm
	HnGxxDrdrJ8YXardtAl6CtyKQLM7XMYIl+ZlJyaffeQ==
X-Gm-Gg: AYBFou2smXEexHNJSNdu3hPXc5DKuMoBw2brDLY5HEW6bbfLXOsbK1iHQJVhqlHSEUO
	cq534QVXkAovqDNiga5/e1gxi5UlQbFy87QxV82IoPKFUXYX9OR58ihdq9Ghfs266xxVeyON3PD
	RS8JhvXGGvV2Z3Pzz8oE+0p44HUsEaLY1BPVhE2YIVMBgOtiOQmsp/Y0NrF0Rielw7WStM58XAS
	/sAHUMeQyxH+KouXSMB1JFJVPhe0rRT8Swgna7PYT0dDmf2GX/b+wRRtPED3UCFeCZ7lE84ydTt
	EIDlDwsr6+5CRLX1jguY/FXy1vSFoQxsIYYVvaA9pW+DA+bGLADaGo5CniX9vmKtfAt1vRa/uJv
	dr6E83wqtd69A68uSjkL3tVfT6IxG0vaQ3s9cIltzTlUHxERtCX2wDVTDIG63ijzptXscv6YCNS
	85feQzaYfPCHBmyJ0tLDgTsUchsnr2eECkquUhnIqhLQFqNKnGjYTAhA==
X-Received: by 2002:a05:600c:1d1f:b0:4bb:6a5a:7839 with SMTP id
 5b1f17b1804b1-4bb7da4d216mr53804805e9.34.1795012307535; Wed, 18 Nov 2026
 06:31:47 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261117184547.1145243-1-pawandeep.oza@oss.qualcomm.com> <20261117184547.1145243-7-pawandeep.oza@oss.qualcomm.com>
In-Reply-To: <20261117184547.1145243-7-pawandeep.oza@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 18 Nov 2026 20:01:35 +0530
X-Gm-Features: Aa3M54oDPtib4et5tqvVJ-9Um4iTOQqR5uEu-MVCorBlnm--jhgKcVp-lvYTgrE
Message-ID: <CAAhSdy0Siyi8412hQ5RMAj0CfGPXyPzeKm5Jbg4dbZC=i9nz7A@mail.gmail.com>
Subject: Re: [PATCH v9 6/7] lib: utils: mpxy: Fix RPMI service ID lookup
To: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_063150_295599_9B8F82EA 
X-CRM114-Status: GOOD (  17.08  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBOb3YgMTgsIDIwMjYgYXQgMTI6MTjigK9BTSBQYXdhbmRlZXAgT3phCjxwYXdhbmRl
ZXAub3phQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gRnJvbTogT3phIFBhd2FuZGVlcCA8
cGF3YW5kZWVwLm96YUBvc3MucXVhbGNvbW0uY29tPgo+Cj4gbXB4eV9maW5kX3JwbWlfc3J2aWQo
KSBpbmNvcnJlY3RseSB1c2VkIHRoZSBjdXJyZW50IHNlcnZpY2UgSUQgdG8KPiBjb250cm9sIGl0
ZXJhdGlvbiB0aHJvdWdoIHRoZSBzZXJ2aWNlIHRhYmxlLiBUaGlzIGNvdWxkIHN0b3AgdGhlCj4g
c2VhcmNoIHByZW1hdHVyZWx5IG9yIHJlYWQgYmV5b25kIHRoZSB0YWJsZS4KPgo+IEJvdW5kIHRo
ZSBzZWFyY2ggdXNpbmcgbnVtX3NlcnZpY2VzIHNvIGV2ZXJ5IHJlZ2lzdGVyZWQgc2VydmljZSBp
cwo+IGNoZWNrZWQgd2l0aG91dCBhY2Nlc3NpbmcgZW50cmllcyBwYXN0IHRoZSBlbmQgb2YgdGhl
IGFycmF5Lgo+Cj4gRml4ZXM6IGM1YThiMTVlMzk4YSAoImxpYjogdXRpbHMvbXB4eTogQWRkIFJQ
TUkgY2xpZW50IGRyaXZlciBmb3IgTVBYWSIpCj4gU2lnbmVkLW9mZi1ieTogT3phIFBhd2FuZGVl
cCA8cGF3YW5kZWVwLm96YUBvc3MucXVhbGNvbW0uY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBB
bnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKPiAtLS0KPiAgbGliL3V0aWxzL21weHkv
ZmR0X21weHlfcnBtaS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9saWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9y
cG1pLmMgYi9saWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pLmMKPiBpbmRleCA2YjcxODAzZC4u
NjI0ODMxYmUgMTAwNjQ0Cj4gLS0tIGEvbGliL3V0aWxzL21weHkvZmR0X21weHlfcnBtaS5jCj4g
KysrIGIvbGliL3V0aWxzL21weHkvZmR0X21weHlfcnBtaS5jCj4gQEAgLTc2LDcgKzc2LDcgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBtcHh5X3JwbWlfc2VydmljZV9kYXRhICptcHh5X2ZpbmRfcnBt
aV9zcnZpZCh1MzIgbWVzc2FnZV9pZCwKPiAgICAgICAgIGNvbnN0IHN0cnVjdCBtcHh5X3JwbWlf
c2VydmljZV9kYXRhICpzcnYgPSBkYXRhLT5zZXJ2aWNlX2RhdGE7Cj4gICAgICAgICBpbnQgbWlk
ID0gMDsKPgo+IC0gICAgICAgZm9yIChtaWQgPSAwOyBzcnZbbWlkXS5pZCA8IGRhdGEtPm51bV9z
ZXJ2aWNlczsgbWlkKyspIHsKPiArICAgICAgIGZvciAobWlkID0gMDsgbWlkIDwgZGF0YS0+bnVt
X3NlcnZpY2VzOyBtaWQrKykgewo+ICAgICAgICAgICAgICAgICBpZiAoc3J2W21pZF0uaWQgPT0g
KHU4KW1lc3NhZ2VfaWQpCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuICZzcnZbbWlk
XTsKPiAgICAgICAgIH0KPiAtLQo+IDIuNDMuMAo+CgpUaGFua3MsCkFudXAKCi0tIApvcGVuc2Jp
IG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
