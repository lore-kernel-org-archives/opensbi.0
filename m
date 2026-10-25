Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC61606A31A
	for <opensbi@archiver.kernel.org>; Sun, 25 Oct 2026 08:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RvHKjatH;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=UIleIHQ/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/OoahKyKpei4tRlY24S6B6Jp4gynqxiKX6w1MoOyjCQ=; b=RvHKjatHBUuehsyqhpGGIusYxu
	fdZvRAEZD8lEptZJcYrSDSUF3ZMA41n+UZAR2juG13vSCYyTLMNxUx8eV615mziP1mHgGijZXtpFC
	MGDkaVPauO1cEkKNTq9z6JdNDU8ixYueDIaDhDCB2S6BLBAsjsL4W5FwDFsEuqjmiABk/R4Obg1ty
	1N/Omgl8KREoMYxMjVX8eeguYgUGMOHH9ZcgOA45ABQ6JCNHqT7FSgQIgQpQsnQ2tmlu6oyvtWQs2
	fbWVv6Yc9bVxkz9yfudD4/ETpTkb9PBc+i4i7htlCIytvyLpjc2z6FYa2yqCETVi04YKspnMIojKg
	k8Q0C75Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKtUQ-00000000sU1-3byU;
	Sun, 25 Oct 2026 08:22:02 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKtUO-00000000sTg-3okb
	for opensbi@lists.infradead.org;
	Sun, 25 Oct 2026 08:22:02 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-48c5358fc28so1894864f8f.0
        for <opensbi@lists.infradead.org>; Sun, 25 Oct 2026 01:22:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792916519; cv=none;
        d=google.com; s=arc-20260327;
        b=dbv4m9F94gdIti1fweXML+3wu6VMXNQMYb7XDy45H6UMfrGgYzKDJD7P4GFpgPSYS5
         YavqBrPAHrdZTmvIJhDexgNAafA7zBMBqk2s4wkunt7gh5zVBIV/1uDRmTeHjFKllfOz
         P+DV4Zmz6uQ2O/asMsDciAxTSgKZqa0GtRAJ9yxiMIN/2N+Nas2Vq+1zFX1WIAPBk8Fj
         1bzwophCXoe53k9Q1ZVajAmxf3fdiCo1caPha2jIa9r9/G6dPtU7hnCkf/XoOcgMGKch
         LbhhvYnaBMwSMFwsG4ZZ4AGOmAan9ebo1d46TGGMQ7GTUF+vhOPYs25TGpoA0ue1lBaw
         OMTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JoaDY3upltbIky9AYFNMGjYGDfD1+HW1upAnSmRXX3w=;
        fh=vIdEKAS85wJF4kVr1hPvqPxowGm5XGH5KR4fr+ORURk=;
        b=m5NLVLvavP+aOmH/17Rn4tUOCBECd2nZy6dAGkHYbWTkZkRNknPftnAqO4gyjsN7wj
         FWHWykGugqwrFO6JHhdy8gvDe9ISBcbv7oEJ35HL4vKsTMBrB0M7BMba6Ki2m7gLP7cI
         HGyi0RartrW3GIT8rl222Vtiwc2Ooq3o7T4JbOQk7XRB5AqLHLTVFKlDD/PjcuGpiHal
         2Ed7wA3ZJXn4WJ174pZkt3AB2hG43kzvZ/skv6MRCMij0pV4yF1vkjZdfLzt2kCWmlpN
         3zX3w4mEn0Syr9W8RHj3INKf1zetbaCr4HTcjB6BeQ964Vkz6DvNojt6OFkqw7yVDCnX
         9xgg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792916519; x=1793521319; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JoaDY3upltbIky9AYFNMGjYGDfD1+HW1upAnSmRXX3w=;
        b=UIleIHQ/6KQwfeOM0A49AGxek9GX/gUyLFor9hUUnn98dmD0bjfD910c+5n3KHBXkQ
         TA1AR39J9OFb8KJ8LutukL+pwsB3XEfyvfygXetlm9tmurz6A86PvBRds/qPo/4BvlFa
         WBKvNL/ZUKOcYZ8+1nyy9U6Ne2npswClGuT61TIToh+m+oo1RGtizqQimP9g+zYe+Dxg
         BBT0r5LXGwbKbOsntgI9TXwZik5pTABX76I9rJephBK+s+pchPj+60fDaYGkXOqJbtgg
         brzqiifjDTvxurrjzGydZWEb1Ebl7vCNq2jYgGs96aKi3aIOIigSCBK9fdxOuAmTVbJ8
         dnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792916519; x=1793521319;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JoaDY3upltbIky9AYFNMGjYGDfD1+HW1upAnSmRXX3w=;
        b=ZRwfhYGAlenOtqRSxeGHq8uV2gH7QVvmxlOY7VggY8YPh5GEQ9low9l/76Ix+XCQNh
         JVS08TfVL92iB1GQx7IiTW9GqF9dEkgcuClaoq1lM/NuPz8uzcWWAVf6AA4S8BOqR1Xh
         mA1WqfP0DOtWECSfC+wYJ4MaXqyMfWKRxzRJvsVwa834RaWtBvutnmuA2qsgeeT6Yx0A
         jUJbEMuNiBGekbUri7iBveJ/OVcLvSf3rKihUw1A6CZjWx9fYchaF/k4Fd4j3eyHBCOh
         rBK4W0vx248fVBXsOSr/XCILvRSHrKuwuQF6fj7lXpBaNR7nW0CP7W/QQzm7YoOLftPj
         CWRg==
X-Gm-Message-State: AFq9FYJ+SrGRZ8sRvFijYaDxZJbU+/b/gpL5SeFUxb1pPLk33jINuq/N
	64VQ9YmzqAtkLnlrP4eptsLnMHcOAi31r8rW31ZsErXHwPOcdLkCNVzAC1013qBwy69ndDJqH3Z
	9QHMcOXLtwJGMP7qP7Jh7o3RPyqzhtMczs2lqGb2V1JHS0JJR1L2lTF4=
X-Gm-Gg: AYBFou3aFz7rVxeXeLoRUKuXPDjXLmco9LCKeTMevgSsHY5Y9eKnvjvLuXbe1hiXU+U
	mrl4BkjUObrSGfgRYV7Il8xirxqWiNOj3//G5Dpx3LpCNC3gMiEXKI1Z/9ZCbKtacWXYdWO/SA3
	mFIWudig3OgFgRsKkJfGZJAkbDqUMZZlzLo6oLsQ9kznHWFWRJk0imX8y3+Oqavo8vfmQgBMB4n
	ISA/S814oX5KgbBhHiCYOjRHkxTSIYrqfKtSNQCUPNkZ6Qc5TXTEijNVbiBGEYI5Rj2syNJbI5t
	cPZPsI1LjHKfH0qGSh974LETJbb9scB03g6hk0+PjxESMrvYyG3isoWNcK4YweDdTwmDJrwMBE7
	jhhgELjBV/ys4Bq0aS3rZijRAoF6PftKAnq/wIpsRoAxeozAGy673Qg408FATbEiPCMF5FeEHu+
	dj4hBLllvBoqd4hsbWsH9CADO4P+SN0qsBaDg8w97158ByXEBNA6JwyH50
X-Received: by 2002:a05:6000:29d6:b0:48d:f14a:9182 with SMTP id
 ffacd0b85a97d-48e3eb75c4cmr3771085f8f.20.1792916518743; Sun, 25 Oct 2026
 01:21:58 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261025062836.2445655-1-sebasjosue84@gmail.com> <20261025062836.2445655-3-sebasjosue84@gmail.com>
In-Reply-To: <20261025062836.2445655-3-sebasjosue84@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 25 Oct 2026 13:51:47 +0530
X-Gm-Features: AclHuK_DfJPG143HRHK8PYZxzzuyIV052bSLdBXdEX5m0ilvaFhHEF4-oyOVN2A
Message-ID: <CAAhSdy1H-rMM5keCcu=v=wQ3xXYs2WNGppweKn1P9sP4oLG3TQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] lib: sbi_pmu: reject out-of-bounds counter index in pmu_ctr_write_hw()
To: Sebastian Alba Vives <sebasjosue84@gmail.com>
Cc: opensbi@lists.infradead.org, anup.patel@oss.qualcomm.com, 
	pengpeng@iscas.ac.cn, hppiscas@163.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_012200_987364_9777CB2D 
X-CRM114-Status: GOOD (  29.11  )
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

T24gU3VuLCBPY3QgMjUsIDIwMjYgYXQgMTE6NTnigK9BTSBTZWJhc3RpYW4gQWxiYSBWaXZlcwo8
c2ViYXNqb3N1ZTg0QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBwbXVfY3RyX3dyaXRlX2h3KCkgd3Jp
dGVzIENTUl9NQ1lDTEUgKyBjaWR4IHdpdGggbm8gY2hlY2sgb24gY2lkeCwKPiB3aGlsZSBpdHMg
c2libGluZyBwbXVfY3RyX3N0YXJ0X2h3KCkgZ3VhcmRzIHRoZSBzYW1lIGluZGV4IHNwYWNlOgo+
Cj4gICAgICAgICBpZiAoY2lkeCA+PSBudW1faHdfY3RycyB8fCBjaWR4ID09IDEpCj4gICAgICAg
ICAgICAgICAgIHJldHVybiBTQklfRUlOVkFMOwo+Cj4gQSBjaWR4IGF0IG9yIGFib3ZlIG51bV9o
d19jdHJzIGFkZHJlc3NlcyBhbiBtaHBtY291bnRlciB0aGUgcGxhdGZvcm0KPiBuZWVkIG5vdCBp
bXBsZW1lbnQsIGFuZCBjaWR4ID09IDEgYWRkcmVzc2VzIDB4YjAxLCB3aGljaCBpcyBub3QKPiBh
c3NpZ25lZC4gRWl0aGVyIG9uZSB0cmFwcyBpbiBNLW1vZGUgaW5zdGVhZCBvZiByZXR1cm5pbmcg
YW4gZXJyb3IuCj4KPiBHaXZlIHRoZSBmdW5jdGlvbiB0aGUgc2FtZSBndWFyZCBhbmQgYSByZXR1
cm4gdmFsdWUuIFRoZSBndWFyZCBpcwo+IGNvcGllZCBmcm9tIHBtdV9jdHJfc3RhcnRfaHcoKSBy
YXRoZXIgdGhhbiBsaW1pdGVkIHRvIHRoZSB1cHBlcgo+IGJvdW5kLCBzbyB0aGF0IHRoZSB0d28g
ZnVuY3Rpb25zIGFjY2VwdCBleGFjdGx5IHRoZSBzYW1lIGluZGV4IHNwYWNlLgo+Cj4gT25seSB0
aGUgY2FsbCBzaXRlIGluIHNiaV9wbXVfY3RyX2NmZ19tYXRjaCgpIHByb3BhZ2F0ZXMgdGhlIGVy
cm9yLgo+IFRoZSB0d28gY2FsbCBzaXRlcyBpbnNpZGUgcG11X2N0cl9zdGFydF9odygpIHJ1biBh
ZnRlciB0aGUgaWRlbnRpY2FsCj4gZ3VhcmQgaW4gdGhhdCBmdW5jdGlvbiwgc28gdGhleSBjYW5u
b3QgZmFpbCBhbmQgYXJlIGxlZnQgdW5jaGFuZ2VkLgo+Cj4gRml4ZXM6IDEzZDQwZjIxZDU4OCAo
ImxpYjogc2JpOiBBZGQgUE1VIHN1cHBvcnQiKQo+IFNpZ25lZC1vZmYtYnk6IFNlYmFzdGlhbiBB
bGJhIFZpdmVzIDxzZWJhc2pvc3VlODRAZ21haWwuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBB
bnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywKQW51cAoKPiAtLS0KPgo+
IEEgbm90ZSBvbiByZWFjaGFiaWxpdHksIHNvIHRoZSBGaXhlcyB0YWcgaXMgbm90IHJlYWQgYXMg
bW9yZSB0aGFuIGl0Cj4gaXMuCj4KPiBTaW5jZSA5ZjM3ZTI1ZiAoImxpYjogc2JpOiByZWplY3Qg
UE1VIHNraXAtbWF0Y2ggY291bnRlciBjbGFzcwo+IG1pc21hdGNoZXMiKSB0aGUgU0tJUF9NQVRD
SCBwYXRoIHJlamVjdHMgYSBoYXJkd2FyZSBldmVudCBvbiBhCj4gZmlybXdhcmUgY291bnRlci4g
SW5kZXggMSBjYW5ub3QgcmVhY2ggdGhpcyBjYWxsIHNpdGUgZWl0aGVyOgo+IGFjdGl2ZV9ldmVu
dHNbMV0gaXMgaW5pdGlhbGlzZWQgdG8gU0JJX1BNVV9FVkVOVF9JRFhfSU5WQUxJRCBhbmQKPiBw
bXVfY3RyX2ZpbmRfaHcoKSBtYXNrcyBvdXQgdGhlIGZpeGVkIGNvdW50ZXJzIHdpdGgKPiB+U0JJ
X1BNVV9GSVhFRF9DVFJfTUFTSy4gSSBjb3VsZCBub3QgZmluZCBhIHJvdXRlIHRoYXQgZ2V0cyBh
IGJhZAo+IGluZGV4IGludG8gcG11X2N0cl93cml0ZV9odygpIG9uIGN1cnJlbnQgbWFzdGVyLCBz
byB0aGlzIGlzIGhhcmRlbmluZwo+IG9mIGEgbGF0ZW50IGRlZmVjdCwgbm90IGEgbGl2ZSBvbmUu
Cj4KPiBJIGluY2x1ZGVkIGNpZHggPT0gMSB0byBtYXRjaCBwbXVfY3RyX3N0YXJ0X2h3KCkgZXhh
Y3RseSwgd2hpY2ggaXMKPiBzbGlnaHRseSBtb3JlIHRoYW4gdGhlIG91dC1vZi1ib3VuZHMgY2hl
Y2sgeW91IGFza2VkIGZvci4gSWYgeW91IHdvdWxkCj4gcmF0aGVyIHRoZSB0d28gZnVuY3Rpb25z
IGd1YXJkIGRpZmZlcmVudCBpbmRleCBzcGFjZXMsIEkgd2lsbCByZXNlbmQKPiB3aXRoIG9ubHkg
dGhlIHVwcGVyIGJvdW5kLgo+Cj4gIGxpYi9zYmkvc2JpX3BtdS5jIHwgMTUgKysrKysrKysrKysr
LS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX3BtdS5jIGIvbGliL3NiaS9zYmlfcG11LmMKPiBp
bmRleCA2MmQ1ZTIwNi4uNzRhYTJmZTAgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfcG11LmMK
PiArKysgYi9saWIvc2JpL3NiaV9wbXUuYwo+IEBAIC0zODksOCArMzg5LDEyIEBAIHN0YXRpYyBp
bnQgcG11X2N0cl9lbmFibGVfaXJxX2h3KGludCBjdHJfaWR4KQo+ICAgICAgICAgcmV0dXJuIDA7
Cj4gIH0KPgo+IC1zdGF0aWMgdm9pZCBwbXVfY3RyX3dyaXRlX2h3KHVpbnQzMl90IGNpZHgsIHVp
bnQ2NF90IGl2YWwpCj4gK3N0YXRpYyBpbnQgcG11X2N0cl93cml0ZV9odyh1aW50MzJfdCBjaWR4
LCB1aW50NjRfdCBpdmFsKQo+ICB7Cj4gKyAgICAgICAvKiBNYWtlIHN1cmUgdGhlIGNvdW50ZXIg
aW5kZXggbGllcyB3aXRoaW4gdGhlIHJhbmdlIGFuZCBpcyBub3QgVE0gYml0ICovCj4gKyAgICAg
ICBpZiAoY2lkeCA+PSBudW1faHdfY3RycyB8fCBjaWR4ID09IDEpCj4gKyAgICAgICAgICAgICAg
IHJldHVybiBTQklfRUlOVkFMOwo+ICsKPiAgI2lmIF9fcmlzY3ZfeGxlbiA9PSAzMgo+ICAgICAg
ICAgY3NyX3dyaXRlX251bShDU1JfTUNZQ0xFICsgY2lkeCwgMCk7Cj4gICAgICAgICBjc3Jfd3Jp
dGVfbnVtKENTUl9NQ1lDTEUgKyBjaWR4LCBpdmFsICYgMHhGRkZGRkZGRik7Cj4gQEAgLTM5OCw2
ICs0MDIsOCBAQCBzdGF0aWMgdm9pZCBwbXVfY3RyX3dyaXRlX2h3KHVpbnQzMl90IGNpZHgsIHVp
bnQ2NF90IGl2YWwpCj4gICNlbHNlCj4gICAgICAgICBjc3Jfd3JpdGVfbnVtKENTUl9NQ1lDTEUg
KyBjaWR4LCBpdmFsKTsKPiAgI2VuZGlmCj4gKwo+ICsgICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+
ICBzdGF0aWMgaW50IHBtdV9jdHJfc3RhcnRfaHcodWludDMyX3QgY2lkeCwgdWludDY0X3QgaXZh
bCwgYm9vbCBpdmFsX3VwZGF0ZSkKPiBAQCAtOTgwLDggKzk4NiwxMSBAQCBza2lwX21hdGNoOgo+
ICAgICAgICAgICAgIGV2ZW50X3R5cGUgPT0gU0JJX1BNVV9FVkVOVF9UWVBFX0hXX0NBQ0hFIHx8
Cj4gICAgICAgICAgICAgZXZlbnRfdHlwZSA9PSBTQklfUE1VX0VWRU5UX1RZUEVfSFdfUkFXIHx8
Cj4gICAgICAgICAgICAgZXZlbnRfdHlwZSA9PSBTQklfUE1VX0VWRU5UX1RZUEVfSFdfUkFXX1Yy
KSB7Cj4gLSAgICAgICAgICAgICAgIGlmIChmbGFncyAmIFNCSV9QTVVfQ0ZHX0ZMQUdfQ0xFQVJf
VkFMVUUpCj4gLSAgICAgICAgICAgICAgICAgICAgICAgcG11X2N0cl93cml0ZV9odyhjdHJfaWR4
LCAwKTsKPiArICAgICAgICAgICAgICAgaWYgKGZsYWdzICYgU0JJX1BNVV9DRkdfRkxBR19DTEVB
Ul9WQUxVRSkgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IHBtdV9jdHJfd3JpdGVf
aHcoY3RyX2lkeCwgMCk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKHJldCkKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gKyAgICAgICAgICAgICAg
IH0KPiAgICAgICAgICAgICAgICAgaWYgKGZsYWdzICYgU0JJX1BNVV9DRkdfRkxBR19BVVRPX1NU
QVJUKSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gcG11X2N0cl9zdGFydF9odyhj
dHJfaWR4LCAwLCBmYWxzZSk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHJldCAmJiBy
ZXQgIT0gU0JJX0VBTFJFQURZX1NUQVJURUQpCj4gLS0KPiAyLjQzLjAKPgo+Cj4gLS0KPiBvcGVu
c2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkg
bWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
