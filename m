Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954D5CCF9E3
	for <opensbi@archiver.kernel.org>; Sun,  2 Nov 2025 11:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Oot3lwPjzZCsyQ83TT1JPiwI0mja2UisRr8hYXU2Gw=; b=ehEPDDl7wcFwXB
	5/YhWFnzqX8NyHVRhcpl12Cp4UfAlZu0GRMA0Suj9bLoG/LME2jUHbT52pRz1JbVmXqwRnwXonQM1
	LPDJN27BCdWYRZ2I9TmGkWzrUBVwasIow7h9mbmuwu+cybdxqncCLonb7t2mCvnEJNM73zpqFRVUz
	Ia57Kwbb+OozN4MFI5ofYo+XEEBQjHbTIquNHCtHicCLXb0krhOnxsR4BuoxX9s/LIfN9IsIPqaF/
	GjL/JVb+Di71dua/Bbhh0XfvRE/GjesN7naZ7+iCLLPjxn7CjcC5Ot5awvDHTCC2x4WYBfOQdQtxk
	DKui/FTnjzVmVGqQf+Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFVsy-00000008Uj8-1XpN;
	Sun, 02 Nov 2025 11:04:36 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFVsv-00000008Uin-2caO
	for opensbi@lists.infradead.org;
	Sun, 02 Nov 2025 11:04:34 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-93e9b5bafa5so134856839f.3
        for <opensbi@lists.infradead.org>; Sun, 02 Nov 2025 03:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1762081472; x=1762686272; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLNClSxN5zhJ5rT746NPf888H2HaIB2TUxNCIJbPd00=;
        b=1vvPy9HjrfV1PFgAWM5eKeL6D2NV81lsn7Y5NNmc0uYjc/iZJUkF99m6MSlnUJqgBa
         M/kNizmiFW169fDwZExCx7n2mIJplEEPxnn9w6fzokvadyZg0P0uI8QlLN6D30Rl17Ep
         WrVhfnr+JpZlaRUxp+MBK3yRbGZ4QMz8Y5BWsuU9BPvVodZEgZ+cwIfPKAtuaOxnYRSm
         nVDBxeX6jlR2kAUtpQIJJi7Jdr2aCuoZEOZqb0XzxpmQDEpUxxMm9AjUgJR4liF1s0Tm
         3HieoUzmfr+7Tk4r4cgc4pAs4FupqG4w/jlyoOFEgDrhaqNVB9m/WT5/nvO0OH7BrNg9
         GKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762081472; x=1762686272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HLNClSxN5zhJ5rT746NPf888H2HaIB2TUxNCIJbPd00=;
        b=GjrpM2GC+XMHgNFT3PDFhA6Xudvwa2n3e/2BbPO8n+5P/UkxsATv/1rAs+g8aGOoCK
         EK+S9pZaTYkOKQ/J3uA4wknvnrquu7pvHrvCEIMhPeQZidj7l/1n/Buv7Ch5V4vXRaA1
         F3q5kSBTktuMwqW02s8EnLMlG3qKKtUrlqFRRqZZ5wSMv5c21PtCxcU342PeVkgDn0gW
         ucGOU/a1s2k4Ut5Qo4dP/1xONRqCHnVuFc3MQjbx3TBjD3KIs0ecH7IV0aJwlozSl+Mz
         kYd2CoNpcFbSSliUS7BZ6yBteDgmsTd4bXc1h8WQ2lML8UMZHmr7f7awuBTD4UfE7klw
         D4ZA==
X-Gm-Message-State: AOJu0YxJUg9nAEMqbtbysfaeJQMWyfi6kHHh08hVW6uHtpiMolk34BuH
	pgvP11hLgJpjuJ4m/Mwgm9JNYfNZvzjhntwn0/SVqpcFwtAZO7wPt4t5pVgHkLXoaRKI4Y+Plp/
	MAh7k8y1ZjMQXVxj6wBAOsqdnb7yUfY1b/W0Peg+oPA==
X-Gm-Gg: ASbGncvAyFvbXIZEzZnNGY5F1MShAxDQDR9JoKL68AquNpBkDzM8YNbLpKYX57WO9vc
	3fJZqCe+Tpw5/r1g+OhIAESsoF5KbqPqJzg1vgaoa+PJTOsvqyYrclJic7gMrtU5QcPNnegfykd
	sN9hjJSeqQUOt6sxoN4QqY9NTgkxmxaiSiSUhulg4BQjEVfqyn+L0JIWeMP7tRam1qtu9pe0Jps
	+fBNeiqrFFIxT2si3RhZ/WHcrIrVKC7wOc3mR5RU3nP+569YUgUeFDlMSMY0kSmXJ+ptJ1U31NW
	ZDKvsm0BE0zswzCXS5tDICiWOdASbzAK43Pliw==
X-Google-Smtp-Source: AGHT+IFRUiul31RJ0A6GLxOi/ohsJ6xFy1YyHX5D9ABUEjwrad8GHE3WP0aiioDZMeYpuff6cTTPeUQvL1QTsFI6RnI=
X-Received: by 2002:a05:6e02:3045:b0:433:2c76:4e1b with SMTP id
 e9e14a558f8ab-4332c764f3emr8213165ab.25.1762081472371; Sun, 02 Nov 2025
 03:04:32 -0800 (PST)
MIME-Version: 1.0
References: <20251008084444.3525615-1-peter.lin@sifive.com> <20251008084444.3525615-7-peter.lin@sifive.com>
In-Reply-To: <20251008084444.3525615-7-peter.lin@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 2 Nov 2025 16:34:20 +0530
X-Gm-Features: AWmQ_bnuqSn63flAqHZMoHD1tGfhBDrtrAj3lbE4sZsl72vd-s2qorjyO4MEg_Y
Message-ID: <CAAhSdy0Lov3RN_CzOKT5VXP8dZgGSFLYw4O8AXSiYUc3Pdhn4A@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] lib: sbi_domain: ensure consistent firmware PMP entries
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com, greentime.hu@sifive.com, 
	wxjstz@126.com, alvinga@andestech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_030433_673159_50D1B6D7 
X-CRM114-Status: GOOD (  15.97  )
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

T24gV2VkLCBPY3QgOCwgMjAyNSBhdCAyOjE14oCvUE0gWXUtQ2hpZW4gUGV0ZXIgTGluIDxwZXRl
ci5saW5Ac2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiBEdXJpbmcgZG9tYWluIGNvbnRleHQgc3dpdGNo
ZXMsIGFsbCBQTVAgZW50cmllcyBhcmUgcmVjb25maWd1cmVkCj4gd2hpY2ggY2FuIGNsZWFyIGZp
cm13YXJlIGFjY2VzcyBwZXJtaXNzaW9ucywgY2F1c2luZyBNLW1vZGUgYWNjZXNzCj4gZmF1bHRz
IHVuZGVyIFNtZVBNUC4KPgo+IFNvcnQgZG9tYWluIHJlZ2lvbnMgdG8gcGxhY2UgZmlybXdhcmUg
cmVnaW9ucyBmaXJzdCwgZW5zdXJpbmcKPiBjb25zaXN0ZW50IGZpcm13YXJlIFBNUCBlbnRyaWVz
IHNvIHRoZXkgd29uJ3QgYmUgcmV2b2tlZCBkdXJpbmcKPiBkb21haW4gY29udGV4dCBzd2l0Y2hl
cy4KPgo+IFNpZ25lZC1vZmYtYnk6IFl1LUNoaWVuIFBldGVyIExpbiA8cGV0ZXIubGluQHNpZml2
ZS5jb20+CgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClRo
YW5rcywKQW51cAoKPiAtLS0KPiAgaW5jbHVkZS9zYmkvc2JpX2RvbWFpbi5oIHwgIDMgKysrCj4g
IGxpYi9zYmkvc2JpX2RvbWFpbi5jICAgICB8IDE0ICsrKysrKysrKysrKysrCj4gIDIgZmlsZXMg
Y2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3Ni
aV9kb21haW4uaCBiL2luY2x1ZGUvc2JpL3NiaV9kb21haW4uaAo+IGluZGV4IDkxOTNmZWIwLi4x
MTk2ZDYwOSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3NiaS9zYmlfZG9tYWluLmgKPiArKysgYi9p
bmNsdWRlL3NiaS9zYmlfZG9tYWluLmgKPiBAQCAtMTIxLDYgKzEyMSw5IEBAIHN0cnVjdCBzYmlf
ZG9tYWluX21lbXJlZ2lvbiB7Cj4gICAgICAgICAgICAgICAgICgoX19mbGFncyAmIFNCSV9ET01B
SU5fTUVNUkVHSU9OX1NVX0FDQ0VTU19NQVNLKSAgJiYgICAgXAo+ICAgICAgICAgICAgICAgICAg
IShfX2ZsYWdzICYgU0JJX0RPTUFJTl9NRU1SRUdJT05fTV9BQ0NFU1NfTUFTSykpCj4KPiArI2Rl
ZmluZSBTQklfRE9NQUlOX01FTVJFR0lPTl9JU19GSVJNV0FSRShfX2ZsYWdzKSAgICAgICAgICAg
ICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgICgoX19mbGFncyAmIFNCSV9ET01BSU5fTUVN
UkVHSU9OX0ZXKSA/IHRydWUgOiBmYWxzZSkgICAgXAo+ICsKPiAgLyoqIEJpdCB0byBjb250cm9s
IGlmIHBlcm1pc3Npb25zIGFyZSBlbmZvcmNlZCBvbiBhbGwgbW9kZXMgKi8KPiAgI2RlZmluZSBT
QklfRE9NQUlOX01FTVJFR0lPTl9FTkZfUEVSTUlTU0lPTlMgICAoMVVMIDw8IDYpCj4KPiBkaWZm
IC0tZ2l0IGEvbGliL3NiaS9zYmlfZG9tYWluLmMgYi9saWIvc2JpL3NiaV9kb21haW4uYwo+IGlu
ZGV4IDk2OGZlNjFiLi42NTdkZTEwZCAxMDA2NDQKPiAtLS0gYS9saWIvc2JpL3NiaV9kb21haW4u
Ywo+ICsrKyBiL2xpYi9zYmkvc2JpX2RvbWFpbi5jCj4gQEAgLTI5NCw2ICsyOTQsMjAgQEAgc3Rh
dGljIGJvb2wgaXNfcmVnaW9uX2NvbXBhdGlibGUoY29uc3Qgc3RydWN0IHNiaV9kb21haW5fbWVt
cmVnaW9uICpyZWdBLAo+ICBzdGF0aWMgYm9vbCBpc19yZWdpb25fYmVmb3JlKGNvbnN0IHN0cnVj
dCBzYmlfZG9tYWluX21lbXJlZ2lvbiAqcmVnQSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGNvbnN0IHN0cnVjdCBzYmlfZG9tYWluX21lbXJlZ2lvbiAqcmVnQikKPiAgewo+ICsgICAg
ICAgLyoKPiArICAgICAgICAqIEVuZm9yY2UgZmlybXdhcmUgcmVnaW9uIG9yZGVyaW5nIGZvciBt
ZW1vcnkgYWNjZXNzCj4gKyAgICAgICAgKiB1bmRlciBTbWVQTVAuCj4gKyAgICAgICAgKiBQbGFj
ZSBmaXJtd2FyZSByZWdpb25zIGZpcnN0IHRvIGVuc3VyZSBjb25zaXN0ZW50Cj4gKyAgICAgICAg
KiBQTVAgZW50cmllcyBkdXJpbmcgZG9tYWluIGNvbnRleHQgc3dpdGNoZXMuCj4gKyAgICAgICAg
Ki8KPiArICAgICAgIGlmIChTQklfRE9NQUlOX01FTVJFR0lPTl9JU19GSVJNV0FSRShyZWdBLT5m
bGFncykgJiYKPiArICAgICAgICAgICFTQklfRE9NQUlOX01FTVJFR0lPTl9JU19GSVJNV0FSRShy
ZWdCLT5mbGFncykpCj4gKyAgICAgICAgICAgICAgIHJldHVybiB0cnVlOwo+ICsgICAgICAgaWYg
KCFTQklfRE9NQUlOX01FTVJFR0lPTl9JU19GSVJNV0FSRShyZWdBLT5mbGFncykgJiYKPiArICAg
ICAgICAgICBTQklfRE9NQUlOX01FTVJFR0lPTl9JU19GSVJNV0FSRShyZWdCLT5mbGFncykpCj4g
KyAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiArCj4gKwoKUmVkdW5kYW50IG5ld2xpbmUg
aGVyZSBvdGhlcndpc2UgaXQgbG9va3MgZ29vZCB0byBtZS4KClJldmlld2VkLWJ5OiBBbnVwIFBh
dGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKVGhhbmtzLApBbnVwCgotLSAKb3BlbnNiaSBtYWls
aW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
