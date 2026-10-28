Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5BF606A31E
	for <opensbi@archiver.kernel.org>; Wed, 28 Oct 2026 10:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qSbCEyeM;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=t63mpN32
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6IJ9zmksyvbVz52wf6W6CDFtP4CthEYmwDvYy8hF124=; b=qSbCEyeMaBg2oLZfIt89t+KEbu
	k+QFcZ6/SDfhaY9IK6Kl/srSKihD4KzNXUWyvXdGQZp1p0K5PFKCKMZaj8dm0vDqxqiR4RTFlckPc
	bUx9/MybYYE9przi/Ztt4ySy+jR5aZPtLUpLVnCwyE9Nq16Ot16AqayKl1jAGbAVRh40S2tpNK/eD
	ueTwrGALakjRSrCzeszCKVkPOtuXBstFvaUp9D0VtJUeLcbJnMRQHpMEeNS1CWRYngdjvNXvSjOun
	Yo66GK6gGMOHBmhIqchcGO4Mso0h4uCkdFMTKFFBWymu9mR6wbzhA/Qo0Zjk3e1gKVJngihVk5nph
	NaBNzvJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1Gv-00000006npj-05a9;
	Wed, 28 Oct 2026 10:52:45 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1Gr-00000006np1-1G55
	for opensbi@lists.infradead.org;
	Wed, 28 Oct 2026 10:52:43 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48e47347279so595820f8f.1
        for <opensbi@lists.infradead.org>; Wed, 28 Oct 2026 03:52:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793184759; cv=none;
        d=google.com; s=arc-20260327;
        b=Y7tssttwHlbL2x0l/ayNy7w9SQeymW7QdjsnG/cEwU/7v3i+VL01jiE+6sUZ8UX+pn
         jDnda8Mnc2svAVRhkJJlSi8jJgTPWtjLj7gQ9HILYmbvBimtUOTj4F19S546E7k39n3B
         gXJYdaf37RfDzJ3MH0VH1i76qpVmz6pEH4ta6+6Yxbm4qXQc6cN6wcVG6gah4eUeVroY
         2tURpGps2AoEiOuNtGKt8YlQyIBDPiD8KMo2+lFa4YTQCGqzgmd+t+bbbYFiLJElY28T
         FwL7VElQFzsSdNtFszVsnoe6xMrtYCgWtbgaC33/MmCjaShfF5llQRAayRRhetd4A+IW
         vVeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bJpjdeoL60DfJmid2aIKJEKoq9UVQMaUEh/hXjzTyGQ=;
        fh=s0V2QxfkZ31uI08A+gYD94xQ3QEn9NHnxJRAVF9iZzc=;
        b=FfkIX1qPC9H9a6LAnFWQR2YOYjRqyxElZQDiPjB9obPinhQFktdCBFYVKYMPxhyDZe
         SfDEywB2mBio+6S31kYFXN3FAv8u+1p/LwyBmuOwP2lZDBgYOqyqdw0iY8VNXm3jJ7TH
         ZkDvJ5I0S2rT827MBVyX/7S6ezULHrNnKC63yQNY5zzlm3oU1Cc3uxeEMi8TiLldHQ2k
         nNXPfR8XZjPkmV6nj8lUGGQH8DtKnpyba1bU+Z38y1wWUA9mpAQKa2N77KSNiXk1tMUl
         F2gqyKfEMj2491Z2zi6La2sGOrwMtbaiXmc1wijtxFkzRNiPii/afTsVzQr9QdCa0SpP
         cGRQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793184759; x=1793789559; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bJpjdeoL60DfJmid2aIKJEKoq9UVQMaUEh/hXjzTyGQ=;
        b=t63mpN32DOQFuIv5zlbpAtpr5o+kmqRmp3CguSAYeuvUL4dHgB5boUE3kQaT7TmbwG
         c3IHaXK4toXXzYltzz+WFPadYYCJYjxlNW3E89tjf6b8FMOs/4EJAqdEiBb5UOhQjZmm
         AkLN912DQqdY7Yu+MGl5TmwKXGspsCnTBXaHvb90qwcfz1SbdVTuGlwpc88aXSWPeJLe
         0W3Uym2TNR9oeJiy87zzMsS3IGJW5DoViINU6djxPxfghHt1fMuZJabDxzbKGnKF962F
         LNLFEDbIXABuy0xMY/ChjnrgKrK83LZFvnOA6uaK1Pb0BzsoMfjYoW6MqLB8x73nNkxN
         S38Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793184759; x=1793789559;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bJpjdeoL60DfJmid2aIKJEKoq9UVQMaUEh/hXjzTyGQ=;
        b=p81CsoJEYaiTysFJBbyJd9E6LXL3fpsIeojyuchJLyG75ckwZf4cwAlzLOo7e85cA2
         9XgB9vTPg2dNxMeBbgr2bmKvlvk9tEuXBXA0M3upBhIi3SwxD8ji4CX3HPstas95rBfB
         I8+EMcduc4qxsa7pYgZdv1zdfu759AXuIEN47pfESFv0KTgM/zhscFkzzOljFZYmTB2Q
         2nAPYHhI8CT2f12pDparh+Gle5qd6BL6PxSUf7hRzd5cic9Hr3JN1vrJuYkM5UJUYG/2
         hq3rWPBokZJqPw9usry8FRHuX/sbfWeUfHTJrphNUylayXYNhMuDzttceguQJC5kV9fz
         7Q3A==
X-Gm-Message-State: AFq9FYLSzfXEu3GiXvbjmo+Wvnxx9Rm2xAsdhSE6jn6xUrrCqyK+c0Ai
	R9xtl1H00y8DjVWyD/eQytgt70i54grWtGUwNILJKAErBzMXc4rZe0o5kAP+jMCRjr56LFO3bCv
	c1X9Qvo82vEmLgW4R2O3syVFaeK2yPRUP6C9Z5tgMDw==
X-Gm-Gg: AYBFou3vb00oiiWoj3yvS0aL0WEiZy2KnV56MYhwudelbGPzP7I580mxm2xOU2QVgl6
	lV+f1Eo0qQrsHb//PkdMNb9F7UD7XG6xlFe7cHtdVgkyTlU5ASTjD8PR1coVBi652GxCxdP2kZU
	D803ukBOJHvGJGtMU7ygEUpESe3ceWjthhsr/Dg8X8Q3AolH5vSr7xuWnOyZqHe24ltMEARDP0u
	qHbmap+yz9Oswa60tW2Z6H++ZF2bZbVJICPeyvzBrQfM+DwINowo/N78nRBa82BEJTVeoM5DGda
	kiY1qE0vhJrKnUtYKHOQECjVHuCRgjzYHE+HMKDKfdeI/swJyVpWb17r/QQeD8YV76RXX72dyue
	4fHaFAwpg5qB58s1fdrgDX1zR7BeTLNFxqfMek/au0Fg1hLzpxiNK1g5U/QTR82e9wN2+8NAPK3
	WSJzKVfAgamJ23AlFxDNy71UNmeqAYydJVhdiqZSWIBGleeUYzGHQq5TE=
X-Received: by 2002:a05:6000:2308:b0:48e:5e20:1371 with SMTP id
 ffacd0b85a97d-48e5e20139dmr3728207f8f.4.1793184759227; Wed, 28 Oct 2026
 03:52:39 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027083509.1076577-1-peter.lin@sifive.com> <20261027083509.1076577-4-peter.lin@sifive.com>
In-Reply-To: <20261027083509.1076577-4-peter.lin@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 28 Oct 2026 16:22:27 +0530
X-Gm-Features: AclHuK_lW6_oVE4JwVYNs1--uG7FUgxI9cmLl62SuRi6P7CT7paOt3PNPaRAlC8
Message-ID: <CAAhSdy04Mmm_Y72UK+KgPRpdWH2q1Cquk01Eh87dkKZ4sPV8Uw@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] lib: fdt_domain: parse domain WID properties
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, pawandeep.oza@oss.qualcomm.com, 
	rkrcmar@qti.qualcomm.com, raymond.mao@riscstar.com, robin.randhawa@sifive.com, 
	samuel.holland@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_035241_604503_439F20C0 
X-CRM114-Status: GOOD (  26.15  )
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

T24gVHVlLCBPY3QgMjcsIDIwMjYgYXQgMjowNeKAr1BNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gQWRkIHdpZCBhbmQgd2lkZGVsZWcgZmllbGRz
IHRvIHN0cnVjdCBzYmlfZG9tYWluIHRvIHN0b3JlIHRoZQo+IFJJU0MtViBXb3JsZHMgbWx3aWQg
YW5kIG13aWRlbGVnIENTUiB2YWx1ZXMgZm9yIGVhY2ggZG9tYWluLgo+IEFsc28sIHBhcnNlIHRo
ZSByb290IGFuZCB1c2VyLWRlZmluZWQgZG9tYWlucycgV0lEIGR1cmluZwo+IGZkdF9kb21haW5z
X3BvcHVsYXRlKCkuCj4KPiBXaGVuIFNtbHdpZCBpcyBpbXBsZW1lbnRlZCwgdGhlICJ3aWQiIHBy
b3BlcnR5IGlzIG1hbmRhdG9yeQo+IGZvciBhbGwgZG9tYWluczsgZmFpbCBkb21haW4gcG9wdWxh
dGlvbiBpZiBpdCBpcyBtaXNzaW5nLgo+Cj4gU2lnbmVkLW9mZi1ieTogWXUtQ2hpZW4gUGV0ZXIg
TGluIDxwZXRlci5saW5Ac2lmaXZlLmNvbT4KPiAtLS0KPiBDaGFuZ2UgdjItPnYzOgo+IC0gQWRk
IHZhbGlkYXRlX2RvbWFpbl93aWQoKSB0byBjaGVjayBpZiAnd2lkJyBpcyBzcGVjaWZpZWQgd2hl
biBTbWx3aWQKPiAgIGV4dGVuc2lvbiBpcyBwcmVzZW50OyByZXR1cm4gU0JJX0VJTlZBTCBpZiBt
aXNzaW5nLgo+IC0gUGFyc2UgJ3dpZCcgYW5kICd3aWRkZWxlZycgZm9yIHRoZSByb290IGRvbWFp
biB2aWEgZmR0X3BhcnNlX3Jvb3RfZG9tYWluKCkuCj4gLSBTZXQgcm9vdC53aWRkZWxlZyBkZWZh
dWx0IHRvIDAuCj4gLS0tCj4gIGluY2x1ZGUvc2JpL3NiaV9kb21haW4uaCAgIHwgIDYgKysrCj4g
IGxpYi9zYmkvc2JpX2RvbWFpbi5jICAgICAgIHwgIDIgKwo+ICBsaWIvdXRpbHMvZmR0L2ZkdF9k
b21haW4uYyB8IDg0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDMg
ZmlsZXMgY2hhbmdlZCwgOTIgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUv
c2JpL3NiaV9kb21haW4uaCBiL2luY2x1ZGUvc2JpL3NiaV9kb21haW4uaAo+IGluZGV4IDU2YTIx
Mzk3Li41YTI5MWQxZiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3NiaS9zYmlfZG9tYWluLmgKPiAr
KysgYi9pbmNsdWRlL3NiaS9zYmlfZG9tYWluLmgKPiBAQCAtMTksNiArMTksOCBAQAo+Cj4gIHN0
cnVjdCBzYmlfc2NyYXRjaDsKPgo+ICsjZGVmaW5lIElOVkFMSURfV0lEICAgICgodW5zaWduZWQg
aW50KX4wVSkKPiArCj4gIC8qKiBEb21haW4gYWNjZXNzIHR5cGVzICovCj4gIGVudW0gc2JpX2Rv
bWFpbl9hY2Nlc3Mgewo+ICAgICAgICAgU0JJX0RPTUFJTl9SRUFEID0gKDFVTCA8PCAwKSwKPiBA
QCAtMjE4LDYgKzIyMCwxMCBAQCBzdHJ1Y3Qgc2JpX2RvbWFpbiB7Cj4gICAgICAgICBib29sIHN5
c3RlbV9yZXNldF9hbGxvd2VkOwo+ICAgICAgICAgLyoqIElzIGRvbWFpbiBhbGxvd2VkIHRvIHN1
c3BlbmQgdGhlIHN5c3RlbSAqLwo+ICAgICAgICAgYm9vbCBzeXN0ZW1fc3VzcGVuZF9hbGxvd2Vk
Owo+ICsgICAgICAgLyoqIFdvcmxkIElEIGZvciB0aGlzIGRvbWFpbiAobWx3aWQgdmFsdWUpICov
Cj4gKyAgICAgICB1MzIgd2lkOwo+ICsgICAgICAgLyoqIFdvcmxkIElEIGRlbGVnYXRpb24gYml0
bWFzayBmb3IgdGhpcyBkb21haW4gKG13aWRkZWxlZyB2YWx1ZSkgKi8KPiArICAgICAgIHU2NCB3
aWRkZWxlZzsKPiAgICAgICAgIC8qKiBJZGVudGlmaWVzIHdoZXRoZXIgdG8gaW5jbHVkZSB0aGUg
ZmlybXdhcmUgcmVnaW9uICovCj4gICAgICAgICBib29sIGZ3X3JlZ2lvbl9pbml0ZWQ7Cj4gIH07
Cj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX2RvbWFpbi5jIGIvbGliL3NiaS9zYmlfZG9tYWlu
LmMKPiBpbmRleCA0MmZlNTYzMi4uYmU5MDIwZDAgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlf
ZG9tYWluLmMKPiArKysgYi9saWIvc2JpL3NiaV9kb21haW4uYwo+IEBAIC0zMCw2ICszMCw4IEBA
IHN0cnVjdCBzYmlfZG9tYWluIHJvb3QgPSB7Cj4gICAgICAgICAucG9zc2libGVfaGFydHMgPSBO
VUxMLAo+ICAgICAgICAgLnN5c3RlbV9yZXNldF9hbGxvd2VkID0gdHJ1ZSwKPiAgICAgICAgIC5z
eXN0ZW1fc3VzcGVuZF9hbGxvd2VkID0gdHJ1ZSwKPiArICAgICAgIC53aWQgPSBJTlZBTElEX1dJ
RCwKPiArICAgICAgIC53aWRkZWxlZyA9IDAsCj4gICAgICAgICAuZndfcmVnaW9uX2luaXRlZCA9
IGZhbHNlLAo+ICB9Owo+Cj4gZGlmZiAtLWdpdCBhL2xpYi91dGlscy9mZHQvZmR0X2RvbWFpbi5j
IGIvbGliL3V0aWxzL2ZkdC9mZHRfZG9tYWluLmMKPiBpbmRleCBlNGNjZThjMy4uOGNlMDMyMzYg
MTAwNjQ0Cj4gLS0tIGEvbGliL3V0aWxzL2ZkdC9mZHRfZG9tYWluLmMKPiArKysgYi9saWIvdXRp
bHMvZmR0L2ZkdF9kb21haW4uYwo+IEBAIC0xMyw2ICsxMyw3IEBACj4gICNpbmNsdWRlIDxzYmkv
c2JpX2NvbnNvbGUuaD4KPiAgI2luY2x1ZGUgPHNiaS9zYmlfZG9tYWluLmg+Cj4gICNpbmNsdWRl
IDxzYmkvc2JpX2Vycm9yLmg+Cj4gKyNpbmNsdWRlIDxzYmkvc2JpX2hhcnQuaD4KPiAgI2luY2x1
ZGUgPHNiaS9zYmlfaGFydG1hc2suaD4KPiAgI2luY2x1ZGUgPHNiaS9zYmlfaGVhcC5oPgo+ICAj
aW5jbHVkZSA8c2JpL3NiaV9zY3JhdGNoLmg+Cj4gQEAgLTI5MCw2ICsyOTEsNDIgQEAgc3RhdGlj
IGludCBfX2ZkdF9wYXJzZV9yZWdpb24oY29uc3Qgdm9pZCAqZmR0LCBpbnQgZG9tYWluX29mZnNl
dCwKPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4KPiArc3RhdGljIHZvaWQgZmR0X3BhcnNlX2Rv
bWFpbl93aWRfcHJvcHMoY29uc3Qgdm9pZCAqZmR0LCBpbnQgb2Zmc2V0LAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBzYmlfZG9tYWluICpkb20pCj4gK3sK
PiArICAgICAgIGNvbnN0IGZkdDMyX3QgKnZhbDsKPiArICAgICAgIGludCBsZW47Cj4gKyAgICAg
ICB1NjQgdmFsNjQ7Cj4gKwo+ICsgICAgICAgdmFsID0gZmR0X2dldHByb3AoZmR0LCBvZmZzZXQs
ICJ3aWQiLCAmbGVuKTsKPiArICAgICAgIGlmICh2YWwgJiYgbGVuID09IHNpemVvZihmZHQzMl90
KSkgewo+ICsgICAgICAgICAgICAgICBkb20tPndpZCA9IGZkdDMyX3RvX2NwdSh2YWxbMF0pOwo+
ICsgICAgICAgfQo+ICsKPiArICAgICAgIHZhbCA9IGZkdF9nZXRwcm9wKGZkdCwgb2Zmc2V0LCAi
d2lkZGVsZWciLCAmbGVuKTsKPiArICAgICAgIGlmICh2YWwgJiYgKGxlbiA9PSAoMiAqIHNpemVv
ZihmZHQzMl90KSkpKSB7Cj4gKyAgICAgICAgICAgICAgIHZhbDY0ID0gZmR0MzJfdG9fY3B1KHZh
bFswXSk7Cj4gKyAgICAgICAgICAgICAgIHZhbDY0ID0gKHZhbDY0IDw8IDMyKSB8IGZkdDMyX3Rv
X2NwdSh2YWxbMV0pOwo+ICsgICAgICAgICAgICAgICBkb20tPndpZGRlbGVnID0gdmFsNjQ7Cj4g
KyAgICAgICB9Cj4gK30KPiArCj4gK3N0YXRpYyBpbnQgdmFsaWRhdGVfZG9tYWluX3dpZChjb25z
dCBzdHJ1Y3Qgc2JpX2RvbWFpbiAqZG9tKQo+ICt7Cj4gKyAgICAgICBpZiAoZG9tLT53aWQgIT0g
SU5WQUxJRF9XSUQpCj4gKyAgICAgICAgICAgICAgIHJldHVybiAwOwo+ICsKPiArICAgICAgIGlm
IChzYmlfaGFydF9oYXNfZXh0ZW5zaW9uKHNiaV9zY3JhdGNoX3RoaXNoYXJ0X3B0cigpLAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU0JJX0hBUlRfRVhUX1NNTFdJRCkpIHsK
PiArICAgICAgICAgICAgICAgc2JpX3ByaW50ZigiJXM6IGRvbWFpbiBcIiVzXCI6IG1pc3Npbmcg
XCJ3aWRcIiIKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAiIHByb3BlcnR5IChyZXF1aXJl
ZCBieSBTbWx3aWQpXG4iLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIF9fZnVuY19fLCBk
b20tPm5hbWUpOwo+ICsgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VJTlZBTDsKPiArICAgICAg
IH0KPiArCj4gKyAgICAgICByZXR1cm4gMDsKPiArfQo+ICsKPiAgc3RhdGljIGludCBfX2ZkdF9w
YXJzZV9kb21haW4oY29uc3Qgdm9pZCAqZmR0LCBpbnQgZG9tYWluX29mZnNldCwgdm9pZCAqb3Bh
cXVlKQo+ICB7Cj4gICAgICAgICB1MzIgdmFsMzI7Cj4gQEAgLTMwNiw2ICszNDMsNyBAQCBzdGF0
aWMgaW50IF9fZmR0X3BhcnNlX2RvbWFpbihjb25zdCB2b2lkICpmZHQsIGludCBkb21haW5fb2Zm
c2V0LCB2b2lkICpvcGFxdWUpCj4gICAgICAgICBkb20gPSBzYmlfemFsbG9jKHNpemVvZigqZG9t
KSk7Cj4gICAgICAgICBpZiAoIWRvbSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FTk9N
RU07Cj4gKyAgICAgICBkb20tPndpZCA9IElOVkFMSURfV0lEOwo+Cj4gICAgICAgICBwcmVnLmRv
bSA9IGRvbTsKPiAgICAgICAgIHByZWcucmVnaW9uX2NvdW50ID0gMDsKPiBAQCAtNDQ5LDYgKzQ4
NywxMiBAQCBzdGF0aWMgaW50IF9fZmR0X3BhcnNlX2RvbWFpbihjb25zdCB2b2lkICpmZHQsIGlu
dCBkb21haW5fb2Zmc2V0LCB2b2lkICpvcGFxdWUpCj4gICAgICAgICB9Cj4gICAgICAgICBkb20t
Pm5leHRfbW9kZSA9IHZhbDMyOwo+Cj4gKyAgICAgICAvKiBSZWFkICJ3aWQiIGFuZCAid2lkZGVs
ZWciIERUIHByb3BlcnRpZXMgKi8KPiArICAgICAgIGZkdF9wYXJzZV9kb21haW5fd2lkX3Byb3Bz
KGZkdCwgZG9tYWluX29mZnNldCwgZG9tKTsKPiArICAgICAgIGVyciA9IHZhbGlkYXRlX2RvbWFp
bl93aWQoZG9tKTsKPiArICAgICAgIGlmIChlcnIpCj4gKyAgICAgICAgICAgICAgIGdvdG8gZmFp
bF9mcmVlX2FsbDsKPiArCj4gICAgICAgICAvKiBSZWFkICJzeXN0ZW0tcmVzZXQtYWxsb3dlZCIg
RFQgcHJvcGVydHkgKi8KPiAgICAgICAgIGlmIChmZHRfZ2V0X3Byb3BlcnR5KGZkdCwgZG9tYWlu
X29mZnNldCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJzeXN0ZW0tcmVzZXQtYWxs
b3dlZCIsIE5VTEwpKQo+IEBAIC00NzcsMTIgKzUyMSw1MiBAQCBmYWlsX2ZyZWVfZG9tYWluOgo+
ICAgICAgICAgcmV0dXJuIGVycjsKPiAgfQo+Cj4gK3N0YXRpYyBpbnQgZmR0X3Jvb3RfZG9tYWlu
X29mZnNldChjb25zdCB2b2lkICpmZHQpCj4gK3sKPiArICAgICAgIGludCBvZmZzZXQ7Cj4gKwo+
ICsgICAgICAgb2Zmc2V0ID0gZmR0X3BhdGhfb2Zmc2V0KGZkdCwgIi9jaG9zZW4iKTsKPiArICAg
ICAgIGlmIChvZmZzZXQgPCAwKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gb2Zmc2V0Owo+ICsK
PiArICAgICAgIG9mZnNldCA9IGZkdF9ub2RlX29mZnNldF9ieV9jb21wYXRpYmxlKGZkdCwgb2Zm
c2V0LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIm9w
ZW5zYmksZG9tYWluLGNvbmZpZyIpOwo+ICsgICAgICAgaWYgKG9mZnNldCA8IDApCj4gKyAgICAg
ICAgICAgICAgIHJldHVybiBvZmZzZXQ7Cj4gKwo+ICsgICAgICAgcmV0dXJuIGZkdF9zdWJub2Rl
X29mZnNldChmZHQsIG9mZnNldCwgInJvb3QiKTsKPiArfQo+ICsKPiArc3RhdGljIGludCBmZHRf
cGFyc2Vfcm9vdF9kb21haW4oY29uc3Qgdm9pZCAqZmR0KQo+ICt7Cj4gKyAgICAgICBpbnQgb2Zm
c2V0Owo+ICsKPiArICAgICAgIGlmIChmZHQpIHsKPiArICAgICAgICAgICAgICAgb2Zmc2V0ID0g
ZmR0X3Jvb3RfZG9tYWluX29mZnNldChmZHQpOwo+ICsgICAgICAgICAgICAgICBpZiAob2Zmc2V0
ID49IDApCj4gKyAgICAgICAgICAgICAgICAgICAgICAgZmR0X3BhcnNlX2RvbWFpbl93aWRfcHJv
cHMoZmR0LCBvZmZzZXQsICZyb290KTsKPiArICAgICAgIH0KPiArCj4gKyAgICAgICAvKgo+ICsg
ICAgICAgICogRW5zdXJlIHJvb3QgZG9tYWluIGhhcyBhIHZhbGlkIFdJRAo+ICsgICAgICAgICog
ZXZlbiBpZiBGRFQgb3Igcm9vdCBzdWJub2RlIGlzIGFic2VudAo+ICsgICAgICAgICovCj4gKyAg
ICAgICByZXR1cm4gdmFsaWRhdGVfZG9tYWluX3dpZCgmcm9vdCk7Cj4gK30KPiArCj4gIGludCBm
ZHRfZG9tYWluc19wb3B1bGF0ZShjb25zdCB2b2lkICpmZHQpCj4gIHsKPiArICAgICAgIGludCBl
cnI7Cj4gKwo+ICAgICAgICAgLyogU2FuaXR5IGNoZWNrcyAqLwo+ICAgICAgICAgaWYgKCFmZHQp
Cj4gICAgICAgICAgICAgICAgIHJldHVybiBTQklfRUlOVkFMOwo+Cj4gKyAgICAgICAvKiBQYXJz
ZSByb290IGRvbWFpbiBjb25maWcgZnJvbSAicm9vdCIgc3Vibm9kZSAqLwo+ICsgICAgICAgZXJy
ID0gZmR0X3BhcnNlX3Jvb3RfZG9tYWluKGZkdCk7Cj4gKyAgICAgICBpZiAoZXJyKQo+ICsgICAg
ICAgICAgICAgICByZXR1cm4gZXJyOwo+ICsKPiAgICAgICAgIC8qIEl0ZXJhdGUgb3ZlciBlYWNo
IGRvbWFpbiBpbiBGRFQgYW5kIHBvcHVsYXRlIGRldGFpbHMgKi8KPiAgICAgICAgIHJldHVybiBm
ZHRfaXRlcmF0ZV9lYWNoX2RvbWFpbl9ybyhmZHQsIE5VTEwsIF9fZmR0X3BhcnNlX2RvbWFpbik7
CgpJbiBhZGRpdGlvbiB0byB0aGVzZSBjaGFuZ2VzLCBJIHN1Z2dlc3QgaGF2aW5nIGNvbXBhdGli
bGUKc3RyaW5nIHNldCB0byAib3BlbnNiaSxkb21haW4saW5zdGFuY2UiIGZvciByb290IGRvbWFp
biBEVApub2RlIGFzIHdlbGwuIFRvIGhhbmRsZSB0aGlzIGluIHBhcnNpbmcsIHlvdSBjYW4gc2tp
cCAicm9vdCIKRFQgbm9kZSBpbiBmZHRfaXRlcmF0ZV9lYWNoX2RvbWFpbigpLgoKUmVnYXJkcywK
QW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
