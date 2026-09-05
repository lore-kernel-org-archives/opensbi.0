Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B475C624D3
	for <opensbi@archiver.kernel.org>; Sat,  5 Sep 2026 13:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KomHmiV//iz6B0bZQF4svVQlNfDaH9KaZeXV019AnNI=; b=a7md5uLLP3tJb8
	kew00+HeMJ4wHEvW7Jyf/iWTQ8QQstVaSArX5Au0ka7EctjcLdAFpU3wP4Mb16juhYyjIHgvm+vtT
	1jCLEGR1wen4Bx0k75yr3fXgujYCaXKUfuN9WRppyb7xn7dkuezUDGJThZFV7mRBNbGJDQQNhuClf
	InWogaR0HyFvZ44BoYk6/wTBi0KpaKxq0urHsxhCJ99/XMJlgrK2Fgbrltrt+ZpH5zxqGCVozU9rK
	P8UEaeey9eVa+9hBySJ9nIz84p5p8GYYFOKiYxMo6+EmCJDDocJ1IEZAmgrhIWusdey7KYZqd3Nn9
	ibbCGAyrz0wloK5L2moQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2qCs-000000045U9-0Sl7;
	Sat, 05 Sep 2026 13:13:18 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2qCp-000000045Tl-0Wi0
	for opensbi@lists.infradead.org;
	Sat, 05 Sep 2026 13:13:16 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso22191515e9.1
        for <opensbi@lists.infradead.org>; Sat, 05 Sep 2026 06:13:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788613993; cv=none;
        d=google.com; s=arc-20260327;
        b=HrqAPls5dpPYQZCtvtBPWWOICjoMTfvpNuNW+QdQRLrRnhqJjFI78FrNYN+g6gxFuU
         X2TLfkD5xRlpikHXj4gly+MTs6NuI/QVRzYuFLzLrUvwCoCYHCdIUyLA4f43Y1vAIMr5
         U0OcBkPUFjO3ONZ310tOTa70c+c+FEw0RL+z65vrygnaqNjstguCqU5TSNfOniyXARb5
         546KNn6pYoPJ7E4joV+KIsnPI7ZhUJBMLt0PPj47a/Yl9uVYGStJiVAg5p+Z8ii9E61g
         9sVhq/h9J3U90LZBhU+s5APtABfwZy39szLPRBMvrtLvA63Y5LQQDUszWwM95v+rmK5j
         /XNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U27IaI5yCjCSn2K362dHjEWa7PxEDMUSaFockkhj6Oc=;
        fh=HBtj36CTzbFCOq3PjKPEjW8i8hyK7SkpA2GtIcwqLi8=;
        b=ak8tV3L8jCZvto0scC5rI1nObQ5G+Mz97gMqLIVeikps4qR07iw6hjlCTVdbj6HYVv
         /L5axWFBxBayxrxxZ6UaDcAe+3e4sPoyLt2zra/O8g7NB+scHkS+UURb6OCCyXXP+qIB
         rmzI0+ZY5J/8d+Ls7NEoL19oqf+74ssbwP4Myqpag9WOfVpHY7nuFcYT8RoP7TSr2LNW
         xXoY/gePSSqPOcXCFsV1QlsP6QwNyDkjpUr/ELeCRfdtg2y/LN/oI5ON/mqk+EhNc2Q5
         quZTBD5QxNklQudAJEW4AaO8H4tagUf5o/JEQE9aQGIqHuyEjHtso/RYrEXRptCni2aT
         tlgw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1788613993; x=1789218793; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U27IaI5yCjCSn2K362dHjEWa7PxEDMUSaFockkhj6Oc=;
        b=es1J80YXkKb+3I2Q2thaMhclMbc28j1YTOyx99tDAnjbp26VdLGcoj68pD1DeNalJJ
         Gm3M4cXF1oxnNkz7sDmC3VqP77jrh8SSHpXo2G7WJ5f48uyeFsZLRyB3BpRIKEHL1tM1
         SrlMrmVMoq8dDiX8ChIv5sFas+Y0HMZW8cQoJw7SX08iybkqWtyBG6wltJFsARNjKLJm
         RyTs1QpT9Y6jDIGuuh5k5hpGlDFGirllP1gQVomJOIxTRmWYy3b6DsNSop3tDCuss0gp
         peFLfxHUBX7oiwTvDFNK5sKay+K+8ekkxQHhwS7xgpSZcBawwcWG9h34f63APOeTTlge
         eE1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788613993; x=1789218793;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U27IaI5yCjCSn2K362dHjEWa7PxEDMUSaFockkhj6Oc=;
        b=Be8IERoMc1iX9VNj/tcynXluCEbr38Zpn2ZrvjxpqkvpvRw3RYJLEI3y4aSdxSYMLs
         ZcZXEuNUKWh2+d78LOreVJ4HKOFeIxTlQvR96p11IitD1QgXzSSRa8x1a2Cxpc7Pojoh
         wS0+KNF5qIVYFNFVcpT/mKjyXC2N8nBCSdrba4eYVjA/+Rkd0ZqTj4qHCsX/gZV5kSpQ
         mCRY1HmbvJOP4sLtAJCUAqPfI2n50sdEEHoYjmQutfLjAEJheI2G4EMSJN9WJgkwESiL
         o+hTdvfU46GlseKPr/82ro/1RrD3ZcoxWqrVMshaRlkd4Ok+LQZ7+4Y1WsOm5E3fqWJJ
         Q1hg==
X-Forwarded-Encrypted: i=1; AKwUvBwZ6QnD3sfp9rNDrrdTSl/nw3GdYH0D5/E3TJ5r2eXKtzmctCoPtLeZYZGiBB2/yL6myR5fxW5N@lists.infradead.org
X-Gm-Message-State: AFuF++nW+FZHhmak6kiLZ7RlV7gx4AYLdZKFhb7HAFxyumdqfi7ZMMic
	cfzpnemP2wr5st5OHX/ch5z5v5Qxy4KwXCjIwu6e3aEpLle3UBwF1I6VdrOFz2X8rINucEHILko
	y18XqZfGMq/8Q7JXzruYGxnypt+aGK07+mz26tfeKVA==
X-Gm-Gg: AYBFou2joK9VflZJqHaVbDXWp9Gt2uqRvf787day8LMdwm4IpTurDt52LPZzBJ0O4GA
	+2DSTiFuqb0Ppt6kMDPKt60ugckKajOKkqfbRtGlmjPjdBwGUf0iAuRiJl2qIxx29+e63T0+wlg
	Nio56annaqFwHMAZ8uukT7AuP8DvyJBX6LFvfVJjzynvJqJIDPhdimATRbVU7OYgjOtXaqeDYWm
	dkhCD2Xb3IVPRFSeCLhF8YLTJ63zF8V7Vu1LA0pX06zzEGYGeQXZpA/eKSA7LFxLb4Fbj0iroGk
	+tpow4UDFcNSatx8DlL13i/x7u02xFB4zRL3nf+tpaSVUD1wEjkYNe6UBJvWuxeA7tYsyi3lgpK
	9KJ4vDNZ8+yw48go1QP+sxJvWjqxRjUrQol/WQGDYzMs8c85YnV5Q6IHvfuKgCj0=
X-Received: by 2002:a05:600d:848e:20b0:495:4d88:e630 with SMTP id
 5b1f17b1804b1-49cf824f697mr91311345e9.10.1788613992791; Sat, 05 Sep 2026
 06:13:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260817143025.3068512-1-anup.patel@oss.qualcomm.com>
 <20260817143025.3068512-4-anup.patel@oss.qualcomm.com> <apFguEZuVsjvulZr@plin-1878>
In-Reply-To: <apFguEZuVsjvulZr@plin-1878>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 5 Sep 2026 18:43:01 +0530
X-Gm-Features: AcwNN1V-TS5js86GxSiTPt237PXvhPt7PNocX66ifK-Vw9lZEIKypq_4fDzhJxU
Message-ID: <CAAhSdy3tZcJdc=jg=Q4O0fFesErSwOAjxVyyvfU_fgbp-QVAgA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] lib: sbi_domain: Introduce domain intialization order
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Atish Patra <atish.patra@linux.dev>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Samuel Holland <samuel.holland@sifive.com>, 
	opensbi@lists.infradead.org, Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_061315_311705_0D180197 
X-CRM114-Status: GOOD (  21.20  )
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

T24gRnJpLCBBdWcgMjgsIDIwMjYgYXQgMzo0OeKAr1BNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gSGkgQW51cCwKPgo+IE9uIE1vbiwgQXVnIDE3
LCAyMDI2IGF0IDA4OjAwOjI1UE0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBDdXJyZW50
bHksIHRoZSBkb21haW4gaW5pdGlhbGl6YXRpb24gb3JkZXIgaXMgaW1wbGllZCBieSB0aGUgb3Jk
ZXIKPiA+IGluIHdoaWNoIGRvbWFpbnMgYXJlIHBvcHVsYXRlZCBieSBzYmlfcGxhdGZvcm1fZG9t
YWluc19pbml0KCkgZnJvbQo+ID4gc2JpX2RvbWFpbl9maW5hbGl6ZSgpLiBUaGlzIGlzIG5vdCBk
b2N1bWVudGVkIGFueXdoZXJlIGFuZCBmb3JjZXMKPiA+IHVuZWNlc3Nhcnkgb3JkZXJpbmcgYmV0
d2VlbiBkb21haW4gRFQgbm9kZXMuCj4gPgo+ID4gVG8gYWRkcmVzcyB0aGUgYWJvdmUsIGludHJv
ZHVjZSBwZXItZG9tYWluIDMyLWJpdCBpbnRlZ2VyIHRvIHJlcHJlc2VudAo+ID4gaW50aWFsaXph
dGlvbiBvcmRlciAoYWthICJpbml0X29yZGVyIikgd2hlcmUgZG9tYWluIHdpdGggYSBsb3dlcgo+
ID4gaW5pdGlhbGl6YXRpb24gb3JkZXIgd2lsbCBiZSBib290ZWQgZmlyc3QgYW5kIHR3byBkb21h
aW5zIG11c3Qgbm90Cj4gPiBoYXZlIHNhbWUgaW5pdGlhbGl6YXRpb24gb3JkZXIuIEZvciBEVCBi
YXNlZCBkb21haW4gY3JlYXRpb24sIG5ldwo+ID4gImluaXQtb3JkZXIiIERUIHByb3BlcnR5IGNh
biBiZSB1c2VkIGluIGRvbWFpbiBEVCBub2RlIHRvIHNwZWNpZnkKPiA+IHRoZSBpbml0aWFsaXph
dGlvbiBvcmRlci4gVGhlIFJPT1QgZG9tYWluIGlzIGFzc3VtZWQgdG8gaGF2ZSBsb3dlc3QKPiA+
IGluaXRpYWxpemF0aW9uIG9yZGVyIChha2EgMHhmZmZmZmZmZikuCj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogQW51cCBQYXRlbCA8YW51cC5wYXRlbEBvc3MucXVhbGNvbW0uY29tPgo+ID4gUmV2aWV3
ZWQtYnk6IFBhd2FuZGVlcCBPemEgPHBhd2FuZGVlcC5vemFAb3NzLnF1YWxjb21tLmNvbT4KPiA+
IFRlc3RlZC1ieTogUGF3YW5kZWVwIE96YSA8cGF3YW5kZWVwLm96YUBvc3MucXVhbGNvbW0uY29t
Pgo+ID4gLS0tCj4gPiAgZG9jcy9kb21haW5fc3VwcG9ydC5tZCAgICAgICB8ICA1ICsrKysrCj4g
PiAgaW5jbHVkZS9zYmkvc2JpX2RvbWFpbi5oICAgICB8ICAyICsrCj4gPiAgbGliL3NiaS9zYmlf
ZG9tYWluLmMgICAgICAgICB8IDIxICsrKysrKysrKysrKysrLS0tLS0tLQo+ID4gIGxpYi9zYmkv
c2JpX2RvbWFpbl9jb250ZXh0LmMgfCAxNyArKysrKysrKystLS0tLS0tLQo+ID4gIGxpYi91dGls
cy9mZHQvZmR0X2RvbWFpbi5jICAgfCAgOCArKysrKysrKwo+ID4gIDUgZmlsZXMgY2hhbmdlZCwg
MzggaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2Rv
Y3MvZG9tYWluX3N1cHBvcnQubWQgYi9kb2NzL2RvbWFpbl9zdXBwb3J0Lm1kCj4gPiBpbmRleCA4
MmYxNTVlMS4uNjU1YmY0NzQgMTAwNjQ0Cj4gPiAtLS0gYS9kb2NzL2RvbWFpbl9zdXBwb3J0Lm1k
Cj4gPiArKysgYi9kb2NzL2RvbWFpbl9zdXBwb3J0Lm1kCj4gPiBAQCAtMzksNiArMzksOSBAQCBo
YXMgZm9sbG93aW5nIGRldGFpbHM6Cj4gPgo+ID4gICogKippbmRleCoqIC0gTG9naWNhbCBpbmRl
eCBvZiB0aGlzIGRvbWFpbgo+ID4gICogKipuYW1lKiogLSBOYW1lIG9mIHRoaXMgZG9tYWluCj4g
PiArKiAqKmluaXRfb3JkZXIqKiAtIEluaXRpYWxpemF0aW9uIG9yZGVyIG9mIHRoaXMgZG9tYWlu
LiBEb21haW4gd2l0aCBhCj4gPiArICBsb3dlciBpbml0aWFsaXphdGlvbiBvcmRlciB3aWxsIGJl
IGJvb3RlZCBmaXJzdCBhbmQgdHdvIGRvbWFpbnMgbXVzdAo+ID4gKyAgbm90IGhhdmUgc2FtZSBp
bml0aWFsaXphdGlvbiBvcmRlci4KPgo+IE1heWJlIHRoZSBpbml0LW9yZGVyIGRlZmF1bHQgYmVo
YXZpb3IgKEZEVCBvZmZzZXQgZmFsbGJhY2spIGlzCj4gd29ydGggbm90aW5nIGhlcmUuCj4KClll
cywgd2Ugc2hvdWxkIGRvY3VtZW50IGl0IGluIGRvbWFpbl9zdXBwb3J0Lm1kLiBJIHdpbGwgdXBk
YXRlCmluIHRoZSBuZXh0IHJldmlzaW9uLgoKUmVnYXJkcywKQW51cAoKLS0gCm9wZW5zYmkgbWFp
bGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
