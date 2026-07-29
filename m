Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35475C54F51
	for <opensbi@archiver.kernel.org>; Wed, 29 Jul 2026 16:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aeqHo1YbBglBvQ+jtHbZGNL/Hk77mLoST6CCboNPghA=; b=ot7yzUw2tM9wnn
	+saNwyX5hPiHA4pg3AIk71r/DHexNd2ylFBK/RD+bnuAuNnxFr/jFkgG3+J5CTbUE2JO2nAN2qiZe
	5SGspmJmmvw0OzBTKk9CBhNGrJc3IyE/i3ZTcu1I+fwg7M/quSXNlRceWDW4EuCg1/59FfAwgxeB2
	aGWwm/RccsRnuuE/Bz5UQf8JX9TazziHTTL3K8l3LoR0dqy0OdKSuzH2RftHmFlQkU3jbbCZ1zja9
	MAVecyaiPaHz3VEQ2mXA43O0xsm1eQ4JTtZGyaYt0aYJpjeqBnUsY8qSFG9YiVIJHx1P3Zx1d2xA7
	c39nPePAC7PhFvCSgSsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7OZ-00000008bHy-2etO;
	Wed, 29 Jul 2026 16:44:39 +0000
Received: from mail-wr2-x02.google.com ([2a00:1450:4864:30::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7OW-00000008bFs-3zGP
	for opensbi@lists.infradead.org;
	Wed, 29 Jul 2026 16:44:38 +0000
Received: by mail-wr2-x02.google.com with SMTP id ffacd0b85a97d-4784b41f3aeso290066f8f.1
        for <opensbi@lists.infradead.org>; Wed, 29 Jul 2026 09:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785343475; x=1785948275; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/lQxIyCoaZq6PdqzaXsVeQfV90qzq+Ykl6wRQhBxxLM=;
        b=hh+jEgSpSJTvDEWtsFmI+s8NyEsXSE0pKYyQDPT1N6GKOAzDYK71Oq1JPTkMSK7HXR
         eOxtEVFUdXnje0Z2bHrerOiq5+mK0y3UFf4cfAtucWz7y4ysB27/OfnAMCh7unAeTaR0
         dNTcgq2N1s59AewFmuWVpmTOO+qZ07bBcB9MnL2yaBK0MgSgsCGI+8BFg8MVzVBelfk1
         maZ6D71quWBaHgJItSoTv8TK+p0XYh9IfnMb+cM3TuKC9TSYQ8fIr4h+ocHoFvzONNSL
         YGvwH0miNpkWuLalQ7mBSBGPu0jkI++f+sG8JwRKqaU7qYRw8fH3BwM1JCbY8AOiYeHq
         ZQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785343475; x=1785948275;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/lQxIyCoaZq6PdqzaXsVeQfV90qzq+Ykl6wRQhBxxLM=;
        b=bfVqPnp4BNLz1kjwlfLRPA1yt7wolJMenqDwy5UuhbAqAtFqbRV7TUeIyTXqpXCA5O
         /jc7ZYVTBWqz8k+ntywsbRfmA3y+T7p3LfS9xU4h7+evPpfqjBsfLs/mGd9CZfuEhR8K
         /plYC3fo10P6RaIei2kE6gz6kkrCXoSrqlGsVhTLtWPFc3iumOFuxO9b1PAHN81pM3By
         genYoeMmogXgoHIqiMzL5ttubasfrlJe6jvi0KP19b8TOQNQGDi4ORZaTemjFbIQTqix
         /2W1tSQPbgrmKakiTzlHlbfvvU3zZ8mRjdAnqK8YWB4195Vez97cIOb3K+Dh6jqaUxwL
         cpqA==
X-Gm-Message-State: AOJu0YwfPoUdCzwyMSfxPS24laSA5sFoJ7aHFc24i/tsA4tcrDgxziIo
	v9Xm2UfJoJQxsMZFHonnxauMWDPbXpJn4DCe3v1itgBSVTG2Qj1FJIeCvR9mxGQ1Yno=
X-Gm-Gg: AR+sD13+yDi5fz0SDk1eu/hZ98Urv7RYF2p0NEplxsC8tavrtyDeaaw1Gxxz5y37kOI
	3RrLv4JYvez1MttU3HJV79mQa3B532RQFMhDsD9gknaR/leJcR52reuBO50DXsQf8tpOEozCoyj
	uBtKozi4RPy4vSqhGP8HxR+dQAZG6EC6ikaFFmLS8jaQPJoYdIsJCENnhvfZ1SxTurLezGNkCiH
	nZL/DJQbRjp6pO3VdlJpwR31HEESu43Zg6950L7F4/gIApOC3gU5MGDeL9fZFIyi1nYuYa6ETZq
	ZW7hu7hrgna/7mPKBvAY7+kzHvxNe09HpilTOwz+jtun3gvUTE8RIe/yc7zTZ08IQs8RdKOaXbN
	1Bl/ckTmSJAkSM4L6wqnt1+QvdwauCzBSrzF89gBOGA3eKzt99tsYr9eMD1C5O4E7hrDU49Loxm
	gUYwwZdfl4bRobzLAGfNWriZ+czlC5K4LydNgUsCfAAqVypxWRutYbTz9EfPkmCL6aIb2r9NqLI
	7xFHXCSry97u3Rb7+w0jgEHz5eXbFAnE8dRw1MgEzk/44wpUVFxQA9DZw==
X-Received: by 2002:a05:6000:40cd:b0:47f:93b6:8d06 with SMTP id ffacd0b85a97d-47fb1dc701emr8457533f8f.0.1785343475294;
        Wed, 29 Jul 2026 09:44:35 -0700 (PDT)
Received: from leap.suse.de ([84.77.88.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6aa3a88sm8474869f8f.6.2026.07.29.09.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 09:44:34 -0700 (PDT)
From: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
To: opensbi@lists.infradead.org
Cc: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
Subject: [PATCH 02/14] lib: sbi_locks: annotate spinlock APIs for TSA
Date: Wed, 29 Jul 2026 18:35:29 +0200
Message-ID: <20260729163540.3162978-4-carlos.lopezr4096@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260729163540.3162978-2-carlos.lopezr4096@gmail.com>
References: <20260729163540.3162978-2-carlos.lopezr4096@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_094437_028118_B130964E 
X-CRM114-Status: GOOD (  11.48  )
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

QWRkIFRocmVhZCBTYWZldHkgQW5hbHlzaXMgKFRTQSkgYW5ub3RhdGlvbnMgZm9yIHNwaW5sb2Nr
IEFQSXMsIGFsbG93aW5nCnRoZSBjb21waWxlciB0byByZWFzb24gYWJvdXQgbG9jayBhY3F1aXNp
dGlvbiBhbmQgcmVsZWFzZS4KCkFubm90YXRpb25zIGhhdmUgYSBkaWZmZXJlbnQgbWVhbmluZyBp
ZiB1c2VkIGluIGhlYWRlciBkZWNsYXJhdGlvbnMgdnMgQwpmaWxlIGltcGxlbWVudGF0aW9ucy4g
SW4gaGVhZGVyIGRlY2xhcmF0aW9ucywgdGhleSBzcGVjaWZ5IHRoZSBzZW1hbnRpY3MKb2YgdGhl
IGdpdmVuIGZ1bmN0aW9uLCBtZWFuaW5nIHRoYXQgd2UgbXVzdCBzcGVjaWZ5IHRoYXQgdGhlIHNw
aW5sb2NrCmZ1bmN0aW9ucyBhY3F1aXJlIGFuZCByZWxlYXNlIGEgbG9jayAoImNhcGFiaWxpdHki
IGluIGNsYW5nIHRlcm1zKS4KSW4gZnVuY3Rpb24gaW1wbGVtZW50YXRpb25zLCBhdHRyaWJ1dGVz
IGFmZmVjdCB0aGUgZnVuY3Rpb24gYm9keSBhbmQKY2FsbGVycyBpbiB0aGUgc2FtZSB0cmFuc2xh
dGlvbiB1bml0OyBzaW5jZSB0aGUgc3BpbmxvY2sgZnVuY3Rpb25zCmNvbnRhaW4gaW5saW5lIGFz
c2VtYmx5LCB0aGV5IG11c3QgYmUgZXhjbHVkZWQgZnJvbSBhbmFseXNpcy4KClNpZ25lZC1vZmYt
Ynk6IENhcmxvcyBMw7NwZXogPGNhcmxvcy5sb3BlenI0MDk2QGdtYWlsLmNvbT4KLS0tCiBpbmNs
dWRlL3NiaS9yaXNjdl9sb2Nrcy5oIHwgOCArKysrLS0tLQogbGliL3NiaS9yaXNjdl9sb2Nrcy5j
ICAgICB8IDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zYmkvcmlzY3ZfbG9ja3MuaCBiL2luY2x1ZGUv
c2JpL3Jpc2N2X2xvY2tzLmgKaW5kZXggMzhkOWNiZWI3YjJhLi5hMGEzNGMwNDk3NTAgMTAwNjQ0
Ci0tLSBhL2luY2x1ZGUvc2JpL3Jpc2N2X2xvY2tzLmgKKysrIGIvaW5jbHVkZS9zYmkvcmlzY3Zf
bG9ja3MuaApAQCAtMjAsNyArMjAsNyBAQCB0eXBlZGVmIHN0cnVjdCB7CiAgICAgICAgdTE2IG93
bmVyOwogICAgICAgIHUxNiBuZXh0OwogI2VuZGlmCi19IF9fYWxpZ25lZCg0KSBzcGlubG9ja190
OworfSBfX2FsaWduZWQoNCkgQ0FQQUJJTElUWSgic3BpbmxvY2siKSBzcGlubG9ja190OwogCiAj
ZGVmaW5lIF9fU1BJTl9MT0NLX1VOTE9DS0VECVwKIAkoc3BpbmxvY2tfdCkgeyAwLCAwIH0KQEAg
LTM2LDEwICszNiwxMCBAQCB0eXBlZGVmIHN0cnVjdCB7CiAKIGJvb2wgc3Bpbl9sb2NrX2NoZWNr
KHNwaW5sb2NrX3QgKmxvY2spOwogCi1ib29sIHNwaW5fdHJ5bG9jayhzcGlubG9ja190ICpsb2Nr
KTsKK2Jvb2wgc3Bpbl90cnlsb2NrKHNwaW5sb2NrX3QgKmxvY2spIFRSWV9BQ1FVSVJFKHRydWUs
ICpsb2NrKTsKIAotdm9pZCBzcGluX2xvY2soc3BpbmxvY2tfdCAqbG9jayk7Cit2b2lkIHNwaW5f
bG9jayhzcGlubG9ja190ICpsb2NrKSBBQ1FVSVJFKCpsb2NrKSBNVVNUX05PVF9IT0xEKCpsb2Nr
KTsKIAotdm9pZCBzcGluX3VubG9jayhzcGlubG9ja190ICpsb2NrKTsKK3ZvaWQgc3Bpbl91bmxv
Y2soc3BpbmxvY2tfdCAqbG9jaykgUkVMRUFTRSgqbG9jayk7CiAKICNlbmRpZgpkaWZmIC0tZ2l0
IGEvbGliL3NiaS9yaXNjdl9sb2Nrcy5jIGIvbGliL3NiaS9yaXNjdl9sb2Nrcy5jCmluZGV4IGUy
NTNiMWI3MjNhYi4uZmE2MjRhOTRiZTgxIDEwMDY0NAotLS0gYS9saWIvc2JpL3Jpc2N2X2xvY2tz
LmMKKysrIGIvbGliL3NiaS9yaXNjdl9sb2Nrcy5jCkBAIC00NSw3ICs0NSw3IEBAIGJvb2wgc3Bp
bl90cnlsb2NrKHNwaW5sb2NrX3QgKmxvY2spCiAJcmV0dXJuIGwwID09IDA7CiB9CiAKLXZvaWQg
c3Bpbl9sb2NrKHNwaW5sb2NrX3QgKmxvY2spCit2b2lkIHNwaW5fbG9jayhzcGlubG9ja190ICps
b2NrKSBOT19USFJFQURfU0FGRVRZX0FOQUxZU0lTCiB7CiAJdW5zaWduZWQgbG9uZyBpbmMgPSAx
dSA8PCBUSUNLRVRfU0hJRlQ7CiAJdW5zaWduZWQgbG9uZyBtYXNrID0gMHhmZmZmdTsKQEAgLTg0
LDcgKzg0LDcgQEAgdm9pZCBzcGluX2xvY2soc3BpbmxvY2tfdCAqbG9jaykKIAkJOiAibWVtb3J5
Iik7CiB9CiAKLXZvaWQgc3Bpbl91bmxvY2soc3BpbmxvY2tfdCAqbG9jaykKK3ZvaWQgc3Bpbl91
bmxvY2soc3BpbmxvY2tfdCAqbG9jaykgTk9fVEhSRUFEX1NBRkVUWV9BTkFMWVNJUwogewogCV9f
c21wX3N0b3JlX3JlbGVhc2UoJmxvY2stPm93bmVyLCBsb2NrLT5vd25lciArIDEpOwogfQotLSAK
Mi41MS4wCgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
