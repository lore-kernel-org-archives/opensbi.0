Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC721606A320
	for <opensbi@archiver.kernel.org>; Sun, 25 Oct 2026 08:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iDLaYIa0;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=NPZdIfl1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=M1qnVsShXyb2hrQK3ocKN3CikIRvvPGK1KwzxwE2VTE=; b=iDLaYIa06a/GxKzMri1/fdN8ko
	tQ2nqeYHlbLpms81TTe1ygszGRUJ4+/3VfyujdEF2akjXKz+mssU78qccOgqaeKqDI8BXb+AqkuoI
	D6iV+NAfDmiFCG9oMclk+hkSetU1fg+DK5odUTHZfB/XfmUSxhWpYkprCL+Vq87YEbUC7hcd68Gx0
	OddP2YuYHO6kT5YcyiEK9r8fH8XVXPnqdIE60tFcHYAUNKCksP0IkB/VVHOS46WVud3bOAITfmoUQ
	/dLt1t2EfF9UtulU91qXSON/HPN8C6SejJhBPSLd6rpGSLYBj/AMHua6rjuTAj9EzlnR1aDnIu+1M
	f2CmdLvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKtMw-00000000sFv-3uWs;
	Sun, 25 Oct 2026 08:14:18 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKtMu-00000000sFZ-25DQ
	for opensbi@lists.infradead.org;
	Sun, 25 Oct 2026 08:14:17 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48c4649b35bso2151898f8f.3
        for <opensbi@lists.infradead.org>; Sun, 25 Oct 2026 01:14:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792916054; cv=none;
        d=google.com; s=arc-20260327;
        b=m61hNUMuQnphOTo2IuPGyvZ835GeDp+krTOJggJ9YE+Vjpzi7ZSPXRwDCiI/UuBf3U
         +ttr0corZfofiofVn+xdCuIkxiQo/dCZpJVpNef/EFmFAndWh+OFzp7swvWWL1jS+26N
         A+MaHVPSz5LFwF4sniE09Ra3G6ia70KKlf4G0Uels2eDS8fG1B5DpND97/W+UqdzZHMo
         TA3qwgpclI98Cs7TxQ9WGfDkRfNOOflMrvqGKnDv/SORV90EvZfLIQODmi2oo0Aausvz
         meddrubq7+M6bfHJ5sX7mBvSwdP+0ioYjykyTE8IAHNJvToLJVSeA1wIISLmn3q4KCBu
         JBcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pdTdp3IhjGL/cichP6+ByYvSbZa80+TGK30RjPxGcgs=;
        fh=UKTEt6Dadg4e/iCQHCD/VCyaAecCT1sNCxC39/A9iso=;
        b=gmI5iii2Wf0A19OJ8WOBF740UAht7KRbw9nDhUGTHceeHnnnjDICNo5tAioiqLZ9zF
         prdoJRPvwPoZlDKNZZpnyRi8LltRNFNop8LNHLCxHdyauV+LhbLtvOc7CLI593O2y0XP
         RzvHxn7lzJYve7QrIa/77UzrLrVGNl6dxMgc8cbXaewgHuJOPK2o6pB6Fq/VsoIxnwoJ
         OmoCJ0gTEHnPRHvOUIwdVfkujrYjXzRwXQ2+ywYb7wSE9XnbY1muD3oWKISxqxsttTlH
         hzi6WAdu4w5g7c+zjJOQ0qkjGRTdrzQ1/57kjglApJT+mD/doF3ULbSSpBTWj1DgvuKl
         lttg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792916054; x=1793520854; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pdTdp3IhjGL/cichP6+ByYvSbZa80+TGK30RjPxGcgs=;
        b=NPZdIfl1fygguCG2WnSO/gjL2yRtLJ7usg9Oc5DlEiSPqWmkevcGDBkFxZT+EGuz8P
         Qh8lJBzH+ky45dDBayw4/33aU3r1HBkh9n/G0YCLtI8ezzoJ873oB05zfnTrMVVsDNzf
         1HeBBmSDcZmWo4LGVn/gtJqlv9RDZDlVrKhJZItJVTjSvTHPyVZSFwPClEfwMxBhEqrI
         yOxlYaUXiuw1Az/yCPQJLge62lpnX/Eg+YMZt2GglqSzOt52UIEtqjMfDqU1uKvttrP7
         /lxPoCW/XgyDTWI/+2xEnW/W8RjxvfSkfnBTnI9rRd6Z1boutiCl6M08YgrO517pKRt3
         WN3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792916054; x=1793520854;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pdTdp3IhjGL/cichP6+ByYvSbZa80+TGK30RjPxGcgs=;
        b=dwnpSii3H6d9TGMu8zLecgBmWb0aYm1laChst+FYzHg1as93IVMkuS8DRIqGOIQYWB
         035vQzCpRMGdoYJ5vabNjjcNtokCNYVMwc/Fvb9q3jzuDzDYpRu3iBoOpPoxiiKC99xg
         vdpQpMjij70l8SmHEqcbISUi6mzHodRsBq0t+LwmREOmf+nqk/8Xn1T4Bod47e/ZWJYA
         5Dh8x47gHEFgn0cHLITxyfYhkmtrX0FHA8Klkem456jyDT+X9lwqbnHE+30JJvxJUsuO
         EcboyMNMX4qSbiMF0sUM1PI9cXelu1N4CuCGyvQB4Rw8Tykd3e+A3H8ac+9WMyn4Zi+y
         o4bA==
X-Gm-Message-State: AFq9FYIR13QJ8Ovy1DGUgSPzTg8KbB6nc9zIy1l5nnZCRzsepzKPD08B
	4ATdgP9n5K6Lyhxr6N8TQM5MqRsWpET5pSGfoXLgHoa3p1yfqpPWAByFSc/qjuC/Q5/4pJvbqdk
	ub7d1Sr+7Kj94kwOY24cKBl5xq/HTJ0y4V2KDIwxLWV9jvlWtfE165Kw=
X-Gm-Gg: AYBFou2sMCybUWAnzBXczsRcHzGm0jMHTPOujOS5BWD9A+ZWZ5aO4O+9JMcUMLaJRKz
	6eiBFQKy0EDIomPBXUf4JrmKWbbBQmQKos5CdJkNjEjsY5ttYOADaeIH1ueGbBswiTiAJTtHLd+
	1YOFcMnim9tMx9sjTlNvVBoP7g7h4whWL3D+dH17vNKI/mnQtq1Ro6+oqXBTm11tfOyeb53CcOK
	IxQhNBY3gluBtkPJjaYZQn2ZenxK6lcEhU7cdlZJjdNlPav7zVt9fgZ3vEm4iMeqjsTKrGQ0UiT
	fVb8qKWVKq3uU17vw7JwNLKBTvymFLXE4bBLkVL98SpZov1UWiIPvB4Nq4O03BsUSTbPt2sUJ44
	5HuQvwLz96HT6mYUHJvM3D6ndPQxUqjKpeEtdASwKSC4U6nMRRHzqzA4yVOC8/2EEky39DnJKRF
	so9qqiP2ukwpaxPPUt6Xlz0xyEeXXJKWQwYqH6NUDzDj3NnoBjhYy+OPT1Pw7m4lxW/j2/I7sHL
	y3LYw==
X-Received: by 2002:adf:e193:0:b0:48e:3ebc:d242 with SMTP id
 ffacd0b85a97d-48e3ebcd6c3mr5793648f8f.37.1792916054377; Sun, 25 Oct 2026
 01:14:14 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261024195739.585621-1-kuba@ev1.pl>
In-Reply-To: <20261024195739.585621-1-kuba@ev1.pl>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 25 Oct 2026 13:44:02 +0530
X-Gm-Features: AclHuK-hIpFSNXXiDTBcfFdyKs_scpdEcKGghHADSDRSU-NkcaNo3a4UmLt3QRc
Message-ID: <CAAhSdy1tRn8vRVmr4sqn0VOy0MLnwFJCVMmfSb4Y=ekeESpH3g@mail.gmail.com>
Subject: Re: [PATCH] lib: pmu: Fix race on pmu_ctr_write_hw
To: Jakub Janeczko <kuba@ev1.pl>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_011416_579992_E7C149EA 
X-CRM114-Status: GOOD (  16.79  )
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

T24gU3VuLCBPY3QgMjUsIDIwMjYgYXQgMToyOOKAr0FNIEpha3ViIEphbmVjemtvIDxrdWJhQGV2
MS5wbD4gd3JvdGU6Cj4KPiBPbiBwbGF0Zm9ybXMgd2hlcmUgYSBiaXQgb2YgbWNvdW50aW5oaWJp
dCBjYW5ub3QgYmUgc2V0IHRvIDEsCj4gYW5kIHdoZW4gb24gcnYzMiwgcG11X2N0cl93cml0ZV9o
dygpIHdhcyBnaXZlbiB2YWx1ZSB3aG9zZSBsb3dlcgo+IGJpdHMgd2VyZSBjbG9zZSB0byAyXjMy
LCB0aGUgd3JpdGUgY291bGQgbWlzcyB0aGUgbG93ZXIgYml0IG92ZXJmbG93Lgo+Cj4gU2lnbmVk
LW9mZi1ieTogSmFrdWIgSmFuZWN6a28gPGt1YmFAZXYxLnBsPgoKTEdUTS4KClJldmlld2VkLWJ5
OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKQXBwbGllZCB0aGlzIHBhdGNoIHRv
IHRoZSByaXNjdi9vcGVuc2JpIHJlcG8uCgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIGxpYi9zYmkv
c2JpX3BtdS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9wbXUuYyBiL2xpYi9zYmkvc2Jp
X3BtdS5jCj4gaW5kZXggZTc5ZjZiNjAuLjdkYmM5NDA3IDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkv
c2JpX3BtdS5jCj4gKysrIGIvbGliL3NiaS9zYmlfcG11LmMKPiBAQCAtMzkzLDggKzM5Myw4IEBA
IHN0YXRpYyB2b2lkIHBtdV9jdHJfd3JpdGVfaHcodWludDMyX3QgY2lkeCwgdWludDY0X3QgaXZh
bCkKPiAgewo+ICAjaWYgX19yaXNjdl94bGVuID09IDMyCj4gICAgICAgICBjc3Jfd3JpdGVfbnVt
KENTUl9NQ1lDTEUgKyBjaWR4LCAwKTsKPiAtICAgICAgIGNzcl93cml0ZV9udW0oQ1NSX01DWUNM
RSArIGNpZHgsIGl2YWwgJiAweEZGRkZGRkZGKTsKPiAgICAgICAgIGNzcl93cml0ZV9udW0oQ1NS
X01DWUNMRUggKyBjaWR4LCBpdmFsID4+IEJJVFNfUEVSX0xPTkcpOwo+ICsgICAgICAgY3NyX3dy
aXRlX251bShDU1JfTUNZQ0xFICsgY2lkeCwgaXZhbCAmIDB4RkZGRkZGRkYpOwo+ICAjZWxzZQo+
ICAgICAgICAgY3NyX3dyaXRlX251bShDU1JfTUNZQ0xFICsgY2lkeCwgaXZhbCk7Cj4gICNlbmRp
Zgo+IC0tCj4gMi41Ni4wCj4KPgo+IC0tCj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBvcGVuc2Jp
QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL29wZW5zYmkKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9vcGVuc2JpCg==
