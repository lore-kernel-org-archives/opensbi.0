Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F799CCF9EA
	for <opensbi@archiver.kernel.org>; Mon, 27 Oct 2025 11:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3mIUQBl/NgNMqWt88zhFYbclPZAuJng+Qcg2rtq4U18=; b=HfDd9nCWxW4T4z
	5tMuEFeIZwBYPF2p9TQ8YHlDEaIpUxVWSr11Zt9RbRIZCQI9Rm3sYJ5Sp2UhrCSgJ+fjn6v7jy9YQ
	PlNfrKYr2JRkj9b/qlIIMvk6BggjjC/fGg9plF8J7g1VYvyZ8qgAp1WXJ2XqbIsij07zWwyLirm/b
	W53bUxsRWaNJLOuByfacRLJb+WIloAIbepMaEI4IdwsurpOxkkfYd79GAp8Cwm4I3k4JYw/xSoZrQ
	lM1t8UZIZZQDskQtvyMbSLD0/Pglhrqv+Qa5Pxp3LIZTraUhEyLbU++mqRy4P3eCTi9kxMEyoOB0d
	9DUkZjUSaWHMiT3j8DEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLXJ-0000000DmHk-0pwM;
	Mon, 27 Oct 2025 11:37:17 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLXH-0000000DmHF-1Lg1
	for opensbi@lists.infradead.org;
	Mon, 27 Oct 2025 11:37:16 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-430aeaffeaeso18871085ab.3
        for <opensbi@lists.infradead.org>; Mon, 27 Oct 2025 04:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1761565034; x=1762169834; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JG8taCKOuSnzyuhlKHbaevL7Y/6mXpnk3yFBg8UeRt4=;
        b=P74siOwoGymHgMpH+Yr13HKgoZwqkCxMOdXLAMwcJwfj6GT1MWq1bgOJK7qMA8jgzr
         stt8LSgTsJKTlNmTI8AZhBpDQ7wlNtcAuJZKL1nCUB8vZcfaoGkQl1zQpLC1eQVjN4eg
         2b3l4Z9AADo+OuRIn57mrUJiNuhY/JPDecbFYElVrTxzphiE6ADlecIbGy9H86hh291u
         uwGmDd3HskEgEsMGuhoNmMJ3hXwSH9Qw++wVj3uVlVpKYr58ry2z7UAo/tS0q6lxDgUb
         RvRRvSlArWR/9vu4G2T5jFpMC2plXPWvbrgeChMm3nhZhkIHS0cGJufufORknOWWgSWR
         K6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761565034; x=1762169834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JG8taCKOuSnzyuhlKHbaevL7Y/6mXpnk3yFBg8UeRt4=;
        b=mc31GEKchGKeXErPOJgSHaQavC/MOHR1ADUZO6f9UV8I48ZfjXW4CGffugoSzl6wap
         nuLa6zqKuSZ9DPNL6FPVS74IzcLyp8FdA6NFepuUarQ2ag6iQEvfhkJpaRQ1szAVv2on
         AuzLxll2o9QhQH6K2SDuTOfMfUTdNvxjC7jeUTECuSpWmJzWRaLTX9BsYW7w915iTMiP
         ZKVaCyd6MyIAm/W8wiT0uZJFPoWQF71Ffm+id9pf9x0hOxkCs1dBBAPmYfRFvmkl6Wq/
         qQZkpQxamLDXv/DWuIc8pFrJK6JW10GRBg3tUEibDzhw2dNlMLQzOfC4BVHziqnketGt
         zM/Q==
X-Gm-Message-State: AOJu0YwvLqWtzyKZhNCsBD+B3dU2KbkTtb+zF4TbQwl9sILUBdJriv8W
	Ze0YnSLwIN2dgbHy4fCbduSv7A12/11qa4fzdX1USeqjGFIiBLXQGilZAdfYjRM1c6Nh2+2Va1B
	lSXYpPtZy+AajDqmBu0KxfXReREFpFx57aYy2MLkdqbJeTJwtY1sUm6JdLg==
X-Gm-Gg: ASbGnctTNCdLJ/6hcnKxMbOpL88YhydcVdIB9NQYy6XD8qjzEO9pI1jkhDX0fB48nxg
	C+tAl/ZRrZWstEdGjpeNT4nGFlS+LKJbYZNg63hPjmPXRKpdBR6Oai5VS2wWi1Dmk8gYhr1ppuk
	r561WMGGSCJxBbMHnDL01g6Pi/tL5W3QwjtQlzui7dmEgpUuaiZgqsFbzKro+lMO8+5bXZjaRjg
	1zhNaBI8CUanx/0nwxib61ckvf8CYBUzIe94SxWXfuoNkrs1bBAc5FnoApPDwe0VtRtSmFUh5GV
	9W47tIB7X+INF8fM0w==
X-Google-Smtp-Source: AGHT+IHI5UeBJLOIG7cwsh4/IsJkfhX7ezbT3Z7G/A9OWEcj4PhvJJAVFmkRSkhnMv7JAnfp4nUfmmS3ASWTet9gfBA=
X-Received: by 2002:a05:6e02:3c04:b0:430:ac27:c26d with SMTP id
 e9e14a558f8ab-430c52200f3mr536619035ab.12.1761565034191; Mon, 27 Oct 2025
 04:37:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250918090706.2217603-1-alexander.chuprunov@syntacore.com> <20250918090706.2217603-4-alexander.chuprunov@syntacore.com>
In-Reply-To: <20250918090706.2217603-4-alexander.chuprunov@syntacore.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 27 Oct 2025 17:07:03 +0530
X-Gm-Features: AWmQ_bmxIwfzZZmdNM-7oDglIbf6F6gHfx6kSX_nF9oyrwRHQxNqrM8RKDlG-OQ
Message-ID: <CAAhSdy3b_r+kJgkzoARP_eoTqV712kuWTsWNbCS11PVZvLUdxg@mail.gmail.com>
Subject: Re: [PATCH 3/3] lib: sbi: sbi_pmu: added checks for ctr_idx in match
To: Alexander Chuprunov <alexander.chuprunov@syntacore.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_043715_386100_B50B0B23 
X-CRM114-Status: GOOD (  20.98  )
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

T24gVGh1LCBTZXAgMTgsIDIwMjUgYXQgMjozN+KAr1BNIEFsZXhhbmRlciBDaHVwcnVub3YKPGFs
ZXhhbmRlci5jaHVwcnVub3ZAc3ludGFjb3JlLmNvbT4gd3JvdGU6Cj4KPiBQcmV2aW91c2x5LCBp
biBzYmlfcG11X2N0cl9jZmdfbWF0Y2goKSBmdW5jdGlvbiwgY3RyX2lkeCB3YXMgdXNlZCBpbW1l
ZGlhdGVseQo+IGFmdGVyIHBtdV9jdHJfZmluZF9mdygpIG9yIHBtdV9jdHJfZmluZF9odygpIGNh
bGxzLiBJbiBmaXJzdCBjYXNlLCBhcnJheSBpbmRleAo+IHdhcyAoY3RyX2lkeCAtIG51bV9od19j
dHJzKSwgaW4gc2Vjb25kIC0gY3RyX2lkeC4gQnV0IHBtdV9jdHJfZmluZF9mdygpIGFuZAo+IHBt
dV9jdHJfZmluZF9odygpIGZ1bmN0aW9ucyBjYW4gcmV0dXJuIG5lZ2F0aXZlIHZhbHVlLCBpbiB3
aGljaCBjYXNlIHdyaXRpbmcKPiBpbiBhcnJheXMgd2l0aCBzdWNoIGluZGV4ZXMgd291bGQgY29y
cnVwdCBzYmlfcG11X2hhcnRfc3RhdGUgc3RydWN0dXJlLgo+IFRvIGF2b2lkIHRoaXMgc2l0dWF0
aW9uLCBkaXJlY3QgY3RyX2lkeCB2YWx1ZSBjaGVjayBhZGRlZC4KPgo+IFNpZ25lZC1vZmYtYnk6
IEFsZXhhbmRlciBDaHVwcnVub3YgPGFsZXhhbmRlci5jaHVwcnVub3ZAc3ludGFjb3JlLmNvbT4K
PiAtLS0KPiAgbGliL3NiaS9zYmlfcG11LmMgfCA1ICsrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9z
YmlfcG11LmMgYi9saWIvc2JpL3NiaV9wbXUuYwo+IGluZGV4IDVkOThhNTMyLi5mNzYyMzZlMSAx
MDA2NDQKPiAtLS0gYS9saWIvc2JpL3NiaV9wbXUuYwo+ICsrKyBiL2xpYi9zYmkvc2JpX3BtdS5j
Cj4gQEAgLTg3NywxMyArODc3LDE0IEBAIGludCBzYmlfcG11X2N0cl9jZmdfbWF0Y2godW5zaWdu
ZWQgbG9uZyBjaWR4X2Jhc2UsIHVuc2lnbmVkIGxvbmcgY2lkeF9tYXNrLAo+ICAgICAgICAgICAg
ICAgICAvKiBBbnkgZmlybXdhcmUgY291bnRlciBjYW4gYmUgdXNlZCB0cmFjayBhbnkgZmlybXdh
cmUgZXZlbnQgKi8KPiAgICAgICAgICAgICAgICAgY3RyX2lkeCA9IHBtdV9jdHJfZmluZF9mdyhw
aHMsIGNpZHhfYmFzZSwgY2lkeF9tYXNrLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGV2ZW50X2NvZGUsIGV2ZW50X2RhdGEpOwo+IC0gICAgICAgICAgICAgICBp
ZiAoZXZlbnRfY29kZSA9PSBTQklfUE1VX0ZXX1BMQVRGT1JNKQo+ICsgICAgICAgICAgICAgICBp
ZiAoKGV2ZW50X2NvZGUgPT0gU0JJX1BNVV9GV19QTEFURk9STSkgJiYgKGN0cl9pZHggPj0gbnVt
X2h3X2N0cnMpKQoKTm8gaXNzdWVzIHdpdGggdGhpcyBwYXRjaCBidXQgaXQgc2VlbXMgcG11X2N0
cl9maW5kX2Z3KCkKaXMgcmV0dXJuaW5nIGFuIGluY29ycmVjdCBjb3VudGVyIHRvIGFkZHJlc3Mg
SSBoYXZlIGZvbGRlZApmb2xsb3dpbmcgY2hhbmdlIHdpdGggdGhpcyBwYXRjaC4KCmRpZmYgLS1n
aXQgYS9saWIvc2JpL3NiaV9wbXUuYyBiL2xpYi9zYmkvc2JpX3BtdS5jCmluZGV4IGI2MThiZTQz
Li43MGM0OWFiYyAxMDA2NDQKLS0tIGEvbGliL3NiaS9zYmlfcG11LmMKKysrIGIvbGliL3NiaS9z
YmlfcG11LmMKQEAgLTgzMCw3ICs4MzAsNyBAQCBzdGF0aWMgaW50IHBtdV9jdHJfZmluZF9mdyhz
dHJ1Y3Qgc2JpX3BtdV9oYXJ0X3N0YXRlICpwaHMsCiAgICAgICAgICAgICAgICBjaWR4ID0gaSAr
IGNiYXNlOwogICAgICAgICAgICAgICAgaWYgKGNpZHggPCBudW1faHdfY3RycyB8fCB0b3RhbF9j
dHJzIDw9IGNpZHgpCiAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwotICAgICAgICAg
ICAgICAgaWYgKHBocy0+YWN0aXZlX2V2ZW50c1tpXSAhPSBTQklfUE1VX0VWRU5UX0lEWF9JTlZB
TElEKQorICAgICAgICAgICAgICAgaWYgKHBocy0+YWN0aXZlX2V2ZW50c1tjaWR4XSAhPSBTQklf
UE1VX0VWRU5UX0lEWF9JTlZBTElEKQogICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsK
ICAgICAgICAgICAgICAgIGlmIChTQklfUE1VX0ZXX1BMQVRGT1JNID09IGV2ZW50X2NvZGUgJiYK
ICAgICAgICAgICAgICAgICAgICBwbXVfZGV2ICYmIHBtdV9kZXYtPmZ3X2NvdW50ZXJfbWF0Y2hf
ZW5jb2RpbmcpIHsKQEAgLTg0MCw3ICs4NDAsNyBAQCBzdGF0aWMgaW50IHBtdV9jdHJfZmluZF9m
dyhzdHJ1Y3Qgc2JpX3BtdV9oYXJ0X3N0YXRlICpwaHMsCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgY29udGludWU7CiAgICAgICAgICAgICAgICB9CgotICAgICAgICAgICAgICAgcmV0
dXJuIGk7CisgICAgICAgICAgICAgICByZXR1cm4gY2lkeDsKICAgICAgICB9CgogICAgICAgIHJl
dHVybiBTQklfRU5PVFNVUFA7CgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZh
dWx0Lm9yZz4KCkFwcGxpZWQgdGhpcyBwYXRjaCB0byB0aGUgcmlzY3Yvb3BlbnNiaSByZXBvLgoK
VGhhbmtzLApBbnVwCgo+ICAgICAgICAgICAgICAgICAgICAgICAgIHBocy0+ZndfY291bnRlcnNf
ZGF0YVtjdHJfaWR4IC0gbnVtX2h3X2N0cnNdID0KPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZXZlbnRfZGF0YTsKPiAgICAg
ICAgIH0gZWxzZSB7Cj4gICAgICAgICAgICAgICAgIGN0cl9pZHggPSBwbXVfY3RyX2ZpbmRfaHco
cGhzLCBjaWR4X2Jhc2UsIGNpZHhfbWFzaywgZmxhZ3MsCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgZXZlbnRfaWR4LCBldmVudF9kYXRhKTsKPiAtICAgICAgICAg
ICAgICAgcGhzLT5od19jb3VudGVyc19kYXRhW2N0cl9pZHhdID0gZXZlbnRfZGF0YTsKPiArICAg
ICAgICAgICAgICAgaWYgKGN0cl9pZHggPj0gMCkKPiArICAgICAgICAgICAgICAgICAgICAgICBw
aHMtPmh3X2NvdW50ZXJzX2RhdGFbY3RyX2lkeF0gPSBldmVudF9kYXRhOwo+ICAgICAgICAgfQo+
Cj4gICAgICAgICBpZiAoY3RyX2lkeCA8IDApCj4gLS0KPiAyLjQzLjAKPgo+Cj4gLS0KPiBvcGVu
c2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkg
bWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
