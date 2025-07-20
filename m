Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71753C83F1A
	for <opensbi@archiver.kernel.org>; Sun, 20 Jul 2025 15:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=anEDjOQ/NzUSJnLILOXBhkrWUXiUfJfAYfi23UixZ/U=; b=PFBpiIOnWAuNSA
	RWJik0YK+S0HBdAA0fbGGiv9CkeqF1ex9y9jGvRg4Lz1Fb8ahU6BDuGyTli+2Rh8VhrLifc4J2zuK
	GbhwqbObRiZXeYcaUMM+au0tZzyqsco3SBJ4I5dVU26T41H2/FNCLv6r6UimWbnXDKDE+5uWBi9w6
	K1FquZgvr/kzxUdz0IbdwtqES4CxNfk6JHuOlOGTU4mmg/CqccQiWfZFx06t3drqc12jb8Ktsuy4X
	Q0FQldcSmKiXCBoLctx2C+DeLbameTwHN2CtHLCmMudFNvg2YflsS06IFNQog7o/Wwnwi+dMmCD8P
	elM8HVjLLTpPXeGu+X1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udWF8-0000000FTEk-42Dr;
	Sun, 20 Jul 2025 15:46:26 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udWF6-0000000FTEM-0oV5
	for opensbi@lists.infradead.org;
	Sun, 20 Jul 2025 15:46:25 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3df2f937370so14086805ab.3
        for <opensbi@lists.infradead.org>; Sun, 20 Jul 2025 08:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1753026383; x=1753631183; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WOCDNcNEsDGK0Ace1lErkz0KGQ7gi5+QzDTq/GV6+RU=;
        b=G6RtA5ZrApo7t0gMtJKV/i4tBLBHpkQENi0qs3tZG/wFSNe4m4v5UxdU2B3lMyhPLP
         bpD5pScb0Y3oealiGb0cdBOR2yZSXW2uERplfuzsY++OfJZ31AInL4MwvRMZEmCVmDG3
         TBL1LDV1y2FudhO6MEFwDLPKSJsOxBx9Q+de7Eb0MCRfTSbZHA1c/hYrW+D6dgHxKy7A
         1oir4wZRygaF9jRg0rUtWTTxDv9qLjv5ZtNnEpxN8cW+HSpQpFXiOBB1KHTohZU88/AJ
         drqrExv3H95Yp1yui/d7Jaj4n+rGwhjRV75BuFXhNCG8v1PqSAJmDVsMOt48Y1XqbSND
         Ef/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753026383; x=1753631183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WOCDNcNEsDGK0Ace1lErkz0KGQ7gi5+QzDTq/GV6+RU=;
        b=C+6l1J0q70jivfp6JHFRdk6kHOy5kM8Brm5v2RHwJqxVV8hbVXwzbleRlsRgwWdKq7
         nYrEpziBPho5Iv8eG0t0zsTxm7a77HIbfTVQecCKT1W+sxT74aRa1HLkBbMWTLRPaI3Z
         lFS0f9P+W0jqR/YGmWyXB+qqRXi6r94HRl5rTQawdtWweXJuuoPRf4h0QayfixnC8am9
         pvR2UOvk+m08fBEcYbVoQFaVgPr3phIk2EUOHEeSkifsQkVjcMvvv0v0vP/9BfX4GA6I
         z4lRE1dnswrrxBzgLpWbzkIG4K3EB9cv1qoBe6vuj6octhKQy/cuhtE3GZwzBobD3vBf
         E5HQ==
X-Gm-Message-State: AOJu0YzKePgZhFGXBXVCItm+EmDciL7q6Mz0kJXvT4IoRxaFEDsixAzP
	DoNcIrfVPjKtbVgpr9jTQFaWW92sTMlguE1mnTL9PMNoWHliRe/UvD+5WqEyzYbh64fw+JTGS+Q
	8jUoD884iybO4XrpCJbobJfvwISYFBXmuYvkh03LQ9FaeLcWE1nnp
X-Gm-Gg: ASbGncvLhNjl6NZ7OhPGQZXjW+Vo+eZyEiiG5P40LUDSyBN8pL///HZbOWIaDHLCDQ6
	5Nohaob0ah9J4+Ky9HdTqfkc4Jo6ok2+kn0Bnp2EWdlLG92pOK5jbF5woTT9IGNUAJncmOeZ4Tk
	zOgBCtJoYJk21aW3/OiBI72lRRfxMcp9mHBdfV6PULZKVMmaBNPoQ3YyexlHvgTiC4KJLeKNSvT
	qv40h6v
X-Google-Smtp-Source: AGHT+IGZNKe8AnFDVn3qJyZW8JdkKvj1tjWlW+6Lf8KNGJDABtBojJ8dZok3ZPKtaNidaO7cJZuZYd+pJbYBHt7anP8=
X-Received: by 2002:a05:6e02:5e88:b0:3e2:9695:1de6 with SMTP id
 e9e14a558f8ab-3e2969521ffmr66419915ab.9.1753026383249; Sun, 20 Jul 2025
 08:46:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250704122938.897832-1-ben.dooks@codethink.co.uk>
In-Reply-To: <20250704122938.897832-1-ben.dooks@codethink.co.uk>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 20 Jul 2025 21:16:12 +0530
X-Gm-Features: Ac12FXzCRlm8w5GR3Ui5D6ya07M40evzqIAPTUUBn4wIKbP6COVsz7ebswTSva0
Message-ID: <CAAhSdy3z-HD_kK9hHNtW2RfzRyJtHaovPeFZJq_7oH=-ugivYg@mail.gmail.com>
Subject: Re: [PATCH] include: sbi: fix swap errors with newer gcc -Werror=sequence-point
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_084624_231129_1C45F331 
X-CRM114-Status: GOOD (  19.03  )
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

T24gRnJpLCBKdWwgNCwgMjAyNSBhdCA1OjU54oCvUE0gQmVuIERvb2tzIDxiZW4uZG9va3NAY29k
ZXRoaW5rLmNvLnVrPiB3cm90ZToKPgo+IFRoZSBCU1dBUHh4KCkgbWFjcm9zIGFyZSBub3cgdGhy
b3dpbmcgdGhlIGZvbGxvd2luZyB3YXJuaW5ncyB3aXRoCj4gbmV3ZXIgZ2NjIHZlcnNpb25zLiBU
aGlzIGlzIGR1ZSB0byB0aHJvd2luZyBhbiBhcmd1bWVudCBpbiB0aGF0IG1heQo+IGJlIGV2YWx1
YXRlZCBtb3JlIHRoYW4gb25lIChJIHRoaW5rKSBhbmQgdGhlcmVmb3JlIHRoaW5ncyBsaWtlIHRo
ZQo+IGV4YW1wbGUgYmVsb3cgc2hvdWxkIGJlIGF2b2lkZWQuCj4KPiBGaXggYnkgbWFraW5nIGEg
c2V0IG9mIEJTV0FQeHgoKSB3cmFwcGVycyB3aGljaCBzcGVjaWZpY2FsbHkgb25sdAo+IGV2YWx1
YXRlICd4JyBvbmNlLgo+Cj4gSW4gZmlsZSBpbmNsdWRlZCBsaWIvc2JpL3NiaV9tcHh5LmM6MjE6
Cj4gbGliL3NiaS9zYmlfbXB4eS5jOiBJbiBmdW5jdGlvbiDigJhzYmlfbXB4eV93cml0ZV9hdHRy
c+KAmToKPiBpYi9zYmkvc2JpX21weHkuYzo2MzI6NjM6IGVycm9yOiBvcGVyYXRpb24gb24g4oCY
bWVtX2lkeOKAmSBtYXkgYmUgdW5kZWZpbmVkIFstV2Vycm9yPXNlcXVlbmNlLXBvaW50XQo+ICAg
NjMyIHwgICAgICAgICAgICAgICAgICAgICAgICAgYXR0cl92YWwgPSBsZTMyX3RvX2NwdShtZW1f
cHRyW21lbV9pZHgrK10pOwo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIH5+fn5+fn5efgo+Cj4gU2lnbmVkLW9mZi1ieTogQmVu
IERvb2tzIDxiZW4uZG9va3NAY29kZXRoaW5rLmNvLnVrPgoKSSBoYXZlIHRha2VuIGNhcmUgb2Yg
UmFodWwncyBjb21tZW50IGF0IHRoZSB0aW1lCm9mIG1lcmdpbmcgdGhpcyBwYXRjaC4KCkFwcGxp
ZWQgdGhpcyBwYXRjaCB0byB0aGUgcmlzY3Yvb3BlbnNiaSByZXBvLgoKVGhhbmtzLApBbnVwCgo+
IC0tLQo+ICBpbmNsdWRlL3NiaS9zYmlfYnl0ZW9yZGVyLmggfCAxMCArKysrKysrLS0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9zYmkvc2JpX2J5dGVvcmRlci5oIGIvaW5jbHVkZS9zYmkvc2JpX2J5dGVv
cmRlci5oCj4gaW5kZXggMmI0OTgxZS4uZWQ3Y2FkMSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3Ni
aS9zYmlfYnl0ZW9yZGVyLmgKPiArKysgYi9pbmNsdWRlL3NiaS9zYmlfYnl0ZW9yZGVyLmgKPiBA
QCAtMTQsMTMgKzE0LDEzIEBACj4gICMgZGVmaW5lIF9jb252X2Nhc3QodHlwZSwgdmFsKSAoKHR5
cGUpKHZhbCkpCj4gICNlbmRpZgo+Cj4gLSNkZWZpbmUgQlNXQVAxNih4KSAgICAgKCgoKHgpICYg
MHgwMGZmKSA8PCA4KSB8IFwKPiArI2RlZmluZSBfX0JTV0FQMTYoeCkgICAoKCgoeCkgJiAweDAw
ZmYpIDw8IDgpIHwgXAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAoKCh4KSAmIDB4ZmYwMCkg
Pj4gOCkpCj4gLSNkZWZpbmUgQlNXQVAzMih4KSAgICAgKCgoKHgpICYgMHgwMDAwMDBmZikgPDwg
MjQpIHwgXAo+ICsjZGVmaW5lIF9fQlNXQVAzMih4KSAgICgoKCh4KSAmIDB4MDAwMDAwZmYpIDw8
IDI0KSB8IFwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgKCgoeCkgJiAweDAwMDBmZjAwKSA8
PCA4KSB8IFwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgKCgoeCkgJiAweDAwZmYwMDAwKSA+
PiA4KSB8IFwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgKCgoeCkgJiAweGZmMDAwMDAwKSA+
PiAyNCkpCj4gLSNkZWZpbmUgQlNXQVA2NCh4KSAgICAgKCgoKHgpICYgMHgwMDAwMDAwMDAwMDAw
MGZmVUxMKSA8PCA1NikgfCBcCj4gKyNkZWZpbmUgX19CU1dBUDY0KHgpICAgKCgoKHgpICYgMHgw
MDAwMDAwMDAwMDAwMGZmVUxMKSA8PCA1NikgfCBcCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICgoKHgpICYgMHgwMDAwMDAwMDAwMDBmZjAwVUxMKSA8PCA0MCkgfCBcCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICgoKHgpICYgMHgwMDAwMDAwMDAwZmYwMDAwVUxMKSA8PCAyNCkgfCBcCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICgoKHgpICYgMHgwMDAwMDAwMGZmMDAwMDAwVUxMKSA8
PCA4KSB8IFwKPiBAQCAtMjksNiArMjksMTAgQEAKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
KCgoeCkgJiAweDAwZmYwMDAwMDAwMDAwMDBVTEwpID4+IDQwKSB8IFwKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgKCgoeCkgJiAweGZmMDAwMDAwMDAwMDAwMDBVTEwpID4+IDU2KSkKPgo+ICsj
ZGVmaW5lIEJTV0FQNjQoeCkgKHsgdWludDY0X3QgX3N2ID0gKHgpOyBfX0JTV0FQNjQoX3N2KTsg
fSkKPiArI2RlZmluZSBCU1dBUDMyKHgpICh7IHVpbnQzMl90IF9zdiA9ICh4KTsgX19CU1dBUDMy
KF9zdik7IH0pCj4gKyNkZWZpbmUgQlNXQVAxNih4KSAoeyB1aW50MTZfdCBfc3YgPSAoeCk7IF9f
QlNXQVAxNihfc3YpOyB9KQo+ICsKPiAgI2lmIF9fQllURV9PUkRFUl9fID09IF9fT1JERVJfTElU
VExFX0VORElBTl9fICAvKiBDUFUobGl0dGxlLWVuZGlhbikgKi8KPiAgI2RlZmluZSBjcHVfdG9f
YmUxNih4KSAgICAgICAgIF9jb252X2Nhc3QodWludDE2X3QsIEJTV0FQMTYoeCkpCj4gICNkZWZp
bmUgY3B1X3RvX2JlMzIoeCkgICAgICAgICBfY29udl9jYXN0KHVpbnQzMl90LCBCU1dBUDMyKHgp
KQo+IC0tCj4gMi4zNy4yLjM1Mi5nM2M0NDQzNzY0Mwo+Cj4KPiAtLQo+IG9wZW5zYmkgbWFpbGlu
ZyBsaXN0Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxp
c3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
