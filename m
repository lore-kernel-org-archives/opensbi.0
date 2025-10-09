Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A659BCCD185
	for <opensbi@archiver.kernel.org>; Thu,  9 Oct 2025 13:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=erB2Uwf2O+1j/nz6y7imiNDQkN6RoxoLEhlqasjfj28=; b=BAIuRDk7ixbUfF
	H/yQd8h2j+e5n77/N5ZlHzvwJBVZbJfxeCL57E80pukt66kQfq6rXQI5O8tEQ/XDpz0ExRjdPvnYl
	bDdHhRU0XFkG5LZ/nf0sMWwW0lUZYcwn8W83vCwKPNNvjtS+3klrvaiR/l4f4VmDScPWaYpFj6940
	Sxlft0slyKPpzXzHfiR5On2lhM/Kk/aOtrC6C5K7/mjowfQArWyfb1Fw4S5t9SztMEbzo8RTr6dEE
	Xq+kHIeUP+dAOSXDIJJeqqCuUuNlDqfsymSuckRT/9FVQ3rCXgR06PDyJ2/3m37cOTICS5ryJo9cQ
	3PL52Lo/rtuXJ0xODlLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6qhw-00000006E9c-35Kt;
	Thu, 09 Oct 2025 13:29:24 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6qht-00000006E8Z-2fJL
	for opensbi@lists.infradead.org;
	Thu, 09 Oct 2025 13:29:23 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-4242bb22132so9765365ab.3
        for <opensbi@lists.infradead.org>; Thu, 09 Oct 2025 06:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1760016560; x=1760621360; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5KJjmNUNNiecsBoCQFUicNfsqH9Ut2gcLOAYqCtaHuM=;
        b=E7D85J9mPMk5njX84d8PUO1y0nVXJXgaMm4ki08dGroraJ5udpOswcvRcm5fzwKNS0
         TFtrvQ0KFt7R0ioAogWZEhtkhw10CVy0y5NGshMu8CnSHC5jfbb7jeaQ49kYlc57akCg
         EoaKZFfk1J7nqOY2vFJV4QfEybdi/whpO3lqJ94ANqVd57FlDzGiTTf+Y4ds6TuFEEJ4
         ti3NDAlX29+2f2GA/Q8hXZEgN38zLlYu23fAATbuubF7Liv9iVgxa8cq3B0gN0DGU0DE
         LRhdtuLAugh2FpncoaQATmxhj7Vq+AWWTVktZfLZ1hYApW6/Pw3q7cHoCpiVLMvcC3Jr
         2ioA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760016560; x=1760621360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5KJjmNUNNiecsBoCQFUicNfsqH9Ut2gcLOAYqCtaHuM=;
        b=Y/gfOze9hyZ/zObKCicHlXdCyKb8lkPc04PNcn0x9ZXt8wRdTCCIWjoeW3LiDkOjc4
         cGdtX9COUEvU2lcKie/3ORUtKx2L+vNSPEEGusd6FBWilwcQY6t2rNBkWknyKfwCAq8P
         PtpmHsk5uWy/cz6QhSQGw01h8dDUDj+wvnnagZpOiGFh3ABpeQUCWel+buaa2o0ZqEBN
         LmvuPLAmRW+UAEoTFhJv6R2z+iIQSXfy5NCS99D/SyDNl/0UcbQAy6KJfB7yOgAkrIRp
         e5nqx6OQIES7bQC99F+LXivc7C+Ss/XxMf3JKhkTQG3stuR4sTzI24B6aVSLnw0452iu
         MN5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXVxb3tMEwkBGLkYBQrczTCBLy4QJNuMfm1YGc1WmPasEtQgQRIoj2wWdXZIIEyCZNjya35YkyZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5rdBkO7ApSFAbxs+Ej1Z5U/IJ0HFCA6MPvA4dEyLujJwa9eZz
	IixCKccMWqOOJIBm6ERI3wwUlLaEGc7WwwvVoDWe8FjyiLnDMnQ9sWWa941F+N5aqN81TASpOVA
	eqZzMbyR89X+ZUP2wVEalBPQUkexN3oZG5K/PVDmFNQ==
X-Gm-Gg: ASbGncsEXsh3Z/RJQyHIvfq74ZEKafgbKt7K3ZIu96/IHvdZMBDU3E++2AYaet3o4VJ
	b/UsSMXBYJGZ24x2eU9+x/8i3kNf3mzi9SdX7AGsM+E8ILbh1/xdyEkMf4R78ECCUUtvK7gQLZU
	Y9eFBJfcLv++PpZs14yHJ+c00PShqETiYqHWNjzUk99VmT9KD5JfJufOSZ7IhvexEsfw59LYLKH
	o45y9RBibb42a8s48CDwDPiXAjgFNDtyWgTkdV/eYyzB59qLDrwm3tTInKtW4g=
X-Google-Smtp-Source: AGHT+IFLZDPp5CfNmH1q/5Sh8kedsMpNCcP08iUlMP3RAHVFlIP8S9+XDbrM7TYy4G9Az1KctfcKUdzCXYDTqSx8ecI=
X-Received: by 2002:a05:6e02:168e:b0:42e:6e47:53c8 with SMTP id
 e9e14a558f8ab-42f873bee13mr73929655ab.17.1760016560083; Thu, 09 Oct 2025
 06:29:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250806084123476SCLxg-qQRa8CRuhuY-dwE@zte.com.cn>
 <202508060106.57616maD072614@mse-db.zte.com.cn> <CAAhSdy2N0FQ4+3PR8ksYvi0CMc3m3Rt2Bsv+ABWWcXdWSMtXeQ@mail.gmail.com>
 <4b6afa21-f68e-4341-afed-e5d52beab77b@163.com>
In-Reply-To: <4b6afa21-f68e-4341-afed-e5d52beab77b@163.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 9 Oct 2025 18:59:08 +0530
X-Gm-Features: AS18NWA3sGOZqd2_mHxfhAZNiXZLP7TtOzwZA7GNYcIQoh1VpR6C5qbJLHY-TFs
Message-ID: <CAAhSdy3H951_=J+FCR4nF_qiPfxsOmr438abuA28e5Cop+phrg@mail.gmail.com>
Subject: Re: [PATCH 3/3] include: sbi: Lift the maximum harts to 1024
To: Wu Fei <atwufei@163.com>
Cc: wu.fei9@sanechips.com.cn, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_062921_932589_9CD0321E 
X-CRM114-Status: GOOD (  21.98  )
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

T24gVGh1LCBPY3QgOSwgMjAyNSBhdCA1OjU14oCvUE0gV3UgRmVpIDxhdHd1ZmVpQDE2My5jb20+
IHdyb3RlOgo+Cj4KPiBPbiA5LzMwLzI1IDE5OjM2LCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gT24g
V2VkLCBBdWcgNiwgMjAyNSBhdCA2OjM54oCvQU0gPHd1LmZlaTlAc2FuZWNoaXBzLmNvbS5jbj4g
d3JvdGU6Cj4gPj4gSXQgaXMgZXhwZWN0ZWQgdG8gaGF2ZSByaXNjdiBzZXJ2ZXIgYm9hcmRzIHdp
dGggbWFueSBjb3JlcyB2ZXJ5IHNvb24uCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBXdSBGZWkg
PHd1LmZlaTlAc2FuZWNoaXBzLmNvbS5jbj4KPiA+PiAtLS0KPiA+PiAgIGluY2x1ZGUvc2JpL3Ni
aV9oYXJ0bWFzay5oIHwgMiArLQo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zYmkvc2JpX2hh
cnRtYXNrLmggYi9pbmNsdWRlL3NiaS9zYmlfaGFydG1hc2suaAo+ID4+IGluZGV4IDIwMGFiNmUu
LjJmOTRmMzkgMTAwNjQ0Cj4gPj4gLS0tIGEvaW5jbHVkZS9zYmkvc2JpX2hhcnRtYXNrLmgKPiA+
PiArKysgYi9pbmNsdWRlL3NiaS9zYmlfaGFydG1hc2suaAo+ID4+IEBAIC0yMCw3ICsyMCw3IEBA
Cj4gPj4gICAgKiBhbHNvIHJlcHJlc2VudHMgdGhlIG1heGltdW0gbnVtYmVyIG9mIEhBUlQgaWRz
IGdlbmVyaWMgT3BlblNCSQo+ID4+ICAgICogY2FuIGhhbmRsZS4KPiA+PiAgICAqLwo+ID4+IC0j
ZGVmaW5lIFNCSV9IQVJUTUFTS19NQVhfQklUUyAgICAgICAgICAxMjgKPiA+PiArI2RlZmluZSBT
QklfSEFSVE1BU0tfTUFYX0JJVFMgICAgICAgICAgMTAyNAo+ID4gSW5zdGVhZCBvZiBtYWtpbmcg
dGhpcyA4eCwgaXQgaXMgYmV0dGVyIHRvIG1vdmUgdG8gYSBtb3JlIHJlYWxpc3RpYwo+ID4gbnVt
YmVyIGxpa2UgMjU2IG9yIDUxMi4gTk8gPwo+Cj4KPiBEbyB5b3UgdGhpbmsgd2UgbmVlZCB0byBt
YWtlIHRoaXMgY29uZmlndXJhYmxlPyBJdCBzb3VuZHMgZ29vZCB0byBtYWtlCj4gaXQgbGFyZ2Vy
IGlmIGl0J3MgY29uZmlndXJhYmxlLAo+Cj4gNTEyIGlzIG5vdCBlbm91Z2ggc29vbmVyIG9yIGxh
dGVyIG9uIHNlcnZlcnMuCgpJIHdvdWxkIHJhdGhlciB3YWl0IGZvciBhIHJlYWwgcGxhdGZvcm0g
d2l0aCA+IDEyOCBDUFVzIHRvIHNob3ctdXAuIFNpbmNlCml0IGlzIGEgb25lLWxpbmUgY2hhbmdl
IGFuZCB3ZSBjYW4gZG8gaXQgYW55IGRheS4KClJlZ2FyZHMsCkFudXAKCj4KPgo+IFRoYW5rcywK
Pgo+IEZlaS4KPgo+ID4KPiA+IFJlZ2FyZHMsCj4gPiBBbnVwCj4gPgo+ID4+ICAgLyoqIFJlcHJl
c2VudGF0aW9uIG9mIGhhcnRtYXNrICovCj4gPj4gICBzdHJ1Y3Qgc2JpX2hhcnRtYXNrIHsKPiA+
PiAtLQo+ID4+IDIuNDMuMAo+ID4+Cj4gPj4gLS0KPiA+PiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+
ID4+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4+IGh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo+CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxp
c3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
