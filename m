Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD85FC71136
	for <opensbi@archiver.kernel.org>; Mon, 16 Jun 2025 05:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dsq/11rarwpkjLk3bsvAwYkfb9/CKkqXubFReEY0vwI=; b=C1VR5GFLj4SJet
	nKiQ1+jS5S8hwYDbO4JBuFb37yi0mEMLqWIay9MXJR48V5klkt0DSVlI/S498EPe7o5hXFlH6ZC8m
	C5ysI2miWhxZ2pn4xD5fA/bWJR028gRMx6sK35r+J+T/jaSWP+Xot0xfg3AO9zIKyp/2/2hXw8CLW
	WqlqmpK1HBYate1NwVHfV3o2OnB/Fu9IuuTxuQB5fnsIp9SEM/JH4NYx1wh2qzISwaSG7SAuUQWno
	8ofE6xO/Mdh+J6c6hn1MXEY5FgkW4u27+E2YkEu7y+PzCRjdyoxupkJuXsyqAXggW1uhA8nabePXS
	guvSj7n/lxOWj1nv1y5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR2RH-00000003QwN-2Iu6;
	Mon, 16 Jun 2025 05:31:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR1JK-00000003KjH-2v8N
	for opensbi@bombadil.infradead.org;
	Mon, 16 Jun 2025 04:19:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=GMxZSMfG4VJbIkWIPLzxP3G8fuG4XMom1H+jcZTsgQo=; b=oius4n5D5Ak2x7TVInX0GAhD3N
	GwFKyZsr0HqoIqzkoV629A2cqyz4lwt0N8jZVnKCl1Wig64xo/qKbTUdV1F9Ye6C7ZB43eSLzkSqT
	LUWvOS8IP9pi8OIk5pQ+Cijac4VjZomRY7smuqNK78lomPBi4N7Zdx6kRGvo4SxpszmWcvq7kE/Hm
	K6X8sQ8GxWXpEYZBBzE9Jf5ZNFSsUsc+ggOipbdFFyZN9mMwFeHTj9EYcZ0cnLrSNucWfEk3wDHtw
	lpjIbLIyTBiRiLWnGUvTGwBLR9MQ7bM6uOBzSnJV0oRAZfgIapR4zmLrm8xPavaQylvhxRazA1Ya8
	ufsfnYrw==;
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR1JE-00000003Utb-0SXr
	for opensbi@lists.infradead.org;
	Mon, 16 Jun 2025 04:19:02 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3ddcbe64d0dso40078005ab.3
        for <opensbi@lists.infradead.org>; Sun, 15 Jun 2025 21:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1750047536; x=1750652336; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GMxZSMfG4VJbIkWIPLzxP3G8fuG4XMom1H+jcZTsgQo=;
        b=H2LI49gR2gqlJN1hIQ5DiXGEQPS5EdIWUMk664d+54EHqCuor10LBfCGiqZPhRSu0b
         0OPTeUwA/usNoBUaWdsZfjO6DwXLsI39J8fvgDM3aVeHzfXV9IYn0Wh5MNg+sk54xdIr
         ae1j2iDImZcPD1Etpt7MPDfBxInUsmQODA/iQ3kNOR8SYM0JO9NCIqiOwffxcNJPOTVr
         dos2rBloRJ6G4wb0qsUh3za+G2YaZaYN8Hgc5remCOSXxQtyKCqL+/tKhkzN4BQRtIV7
         11VV3NS+ypuyMtUjkIS4S/cQSTurvaADyYnzrPuzWuxKny0j2wH13RA3iMgVn1Z74cwT
         nbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750047536; x=1750652336;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GMxZSMfG4VJbIkWIPLzxP3G8fuG4XMom1H+jcZTsgQo=;
        b=LApx+JJ9QbP55Q3HwgXKCvkaVh7vDNJBaY5RHyeA1/UtsCyp2Bo3iHl7pKSqmH0A1g
         +jB0tsOl4yfxjkw7YMVI9xQ6bgWUf9H+xoS7uNVv/eZhmNkuxoTAJ1TeoV4Ot/IGbiiB
         Cuqdg4Mw3JhZgXAsCHHTKS4c2sCv68mV0GNzyGcAX/XaU8RX7+f7ku86/vRyrGnlPjXc
         9+Q7ZO2UI7LSVq4cqcNEXLq1qMEtoO5afr+dNZ9O8eOTG7AN3WgYU/s57akAz6JS+hBR
         aUOne6QG7iH7LYrrQrlVSq3vNKa4YJgEVHiNsW0dCRk5YZtc9ci8+4M9BZabwKyTnKOH
         1XZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkWNwyP0lFfGO7+stjwvS9NQuuMQqADc7iOWXoVm8Eb4OiJWqBImdep1+cLLbeJMn0VGEz3ASN@lists.infradead.org
X-Gm-Message-State: AOJu0YyI0P9T043XahvyBJ6qwYy5u8LvF6zaSUForzuZKVW21fjVtUjh
	g4DtOIUDBJZQSxcv7cnABdl++4GnGu3elVAxNzFp9BzYfBndLTyMjxCW0Rk+WUvry6EfKAGv3nR
	eTzkX6NpBsvkmSDslhP8n50QEtUsPAbjYVqUgYehnNg==
X-Gm-Gg: ASbGncsMHSx/kOFY+of2miKsdHtDY+yS4fqOnVLgPgkinbPT/tCBA2PUTl9dExTAWQm
	xGk4uxXR8UMWqjKIjNwIpnBpmBb9nUEF4E8SpSoa/ASO8b+dmtDck/FbdsGPV7TpGRNqEaMR4cE
	M/veAg7tiki8wYHbN1Gvl072nCAubQ+B3XumgTeDJ/QH8BRg==
X-Google-Smtp-Source: AGHT+IEA9A/lOuvbYKhEXBP75N5+m5dOOfLQnKdV0jRqnLPOcHtumomnEwBZOmF426L0pv9FOhFJgEHC/H24n7t4mv4=
X-Received: by 2002:a05:6e02:194d:b0:3dd:c78c:ec3e with SMTP id
 e9e14a558f8ab-3de07d01d7emr96302595ab.22.1750047536481; Sun, 15 Jun 2025
 21:18:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250606055810.237441-1-apatel@ventanamicro.com>
In-Reply-To: <20250606055810.237441-1-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 16 Jun 2025 09:48:45 +0530
X-Gm-Features: AX0GCFuWAzxq4WjqiqOy3R2cm8QwwzbcQd5tK9AzZq2PEWclgZQuPeg2m8NZmEc
Message-ID: <CAAhSdy3X6qOZrvaX9JSpsLQoUqHn=CYyP2GsHoHxs9TTt4p9Cw@mail.gmail.com>
Subject: Re: [PATCH] lib: utils: Fix fdt_parse_aclint_node() for
 non-contiguous hartid
To: Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atishp@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Raj Vishwanathan <Raj.Vishwanathan@gmail.com>, opensbi@lists.infradead.org, 
	Maria Mbaye <MameMaria.Mbaye@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_051900_641552_CEAB830D 
X-CRM114-Status: GOOD (  16.19  )
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

T24gRnJpLCBKdW4gNiwgMjAyNSBhdCAxMToyOOKAr0FNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IEN1cnJlbnRseSwgdGhlIGZkdF9wYXJzZV9hY2xpbnRf
bm9kZSgpIGRvZXMgbm90IGhhbmRsZSBub24tY29udGlndW91cwo+IGhhcnRpZCBjb3JyZWN0bHkg
YW5kIHJldHVybnMgaW5jb3JyZWN0IGZpcnN0X2hhcnRpZCBhbmQgaGFydF9jb3VudC4KPiBUaGlz
IGlzIGJlY2F1c2UgdGhlIGZvci1sb29wIGluIGZkdF9wYXJzZV9hY2xpbnRfbm9kZSgpIHNraXBz
IGEgaGFydGlkCj4gZm9yIHdoaWNoIGhhcnRpbmRleCBpcyBub3QgYXZhaWxhYmxlIChha2EgY29y
cmVzcG9uZGluZyBDUFUgRFQgbm9kZQo+IGlzIGRpc2FibGVkKS4KPgo+IEZvciBleGFtcGxlLCBv
biBhIHBsYXRmb3JtIHdpdGggNCBIQVJUcyAoaGFydGlkIDAsIDEsIDIsIGFuZCAzKSB3aGVyZQo+
IENQVSBEVCBub2RlcyB3aXRoIGhhcnRpZCAwIGFuZCAyIGFyZSBkaXNhYmxlZCwgdGhlIGZkdF9w
YXJzZV9hY2xpbnRfbm9kZSgpCj4gcmV0dXJucyBmaXJzdF9oYXJ0aWQgPSAxIGFuZCBoYXJ0X2Nv
dW50ID0gMyB3aGljaCBpcyBpbmNvcnJlY3QuCj4KPiBUbyBhZGRyZXNzIHRoZSBhYm92ZSBpc3N1
ZSwgZHJvcCB0aGUgc2JpX2hhcnRpZF90b19oYXJ0aW5kZXgoKSBjaGVjawo+IGZyb20gdGhlIGZv
ci1sb29wIG9mIGZkdF9wYXJzZV9hY2xpbnRfbm9kZSgpLgo+Cj4gRml4ZXM6IDVlOTBlNTRhMWE1
MyAoImxpYjogdXRpbHM6Q2hlY2sgdGhhdCBoYXJ0aWQgaXMgdmFsaWQiKQo+IFJlcG9ydGVkLWJ5
OiBNYXJpYSBNYmF5ZSA8TWFtZU1hcmlhLk1iYXllQG1pY3JvY2hpcC5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+CgpBcHBsaWVkIHRoaXMg
cGF0Y2ggdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywKQW51cAoKPiAtLS0KPiAg
bGliL3V0aWxzL2ZkdC9mZHRfaGVscGVyLmMgfCAzIC0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBk
ZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9saWIvdXRpbHMvZmR0L2ZkdF9oZWxwZXIuYyBi
L2xpYi91dGlscy9mZHQvZmR0X2hlbHBlci5jCj4gaW5kZXggYjJkOTFmZGYuLjRjMGU4MjIxIDEw
MDY0NAo+IC0tLSBhL2xpYi91dGlscy9mZHQvZmR0X2hlbHBlci5jCj4gKysrIGIvbGliL3V0aWxz
L2ZkdC9mZHRfaGVscGVyLmMKPiBAQCAtMTAxMyw5ICsxMDEzLDYgQEAgaW50IGZkdF9wYXJzZV9h
Y2xpbnRfbm9kZShjb25zdCB2b2lkICpmZHQsIGludCBub2Rlb2Zmc2V0LAo+ICAgICAgICAgICAg
ICAgICBpZiAocmMpCj4gICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4KPiAtICAg
ICAgICAgICAgICAgaWYgKFNCSV9IQVJUTUFTS19NQVhfQklUUyA8PSBzYmlfaGFydGlkX3RvX2hh
cnRpbmRleChoYXJ0aWQpKQo+IC0gICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+IC0K
PiAgICAgICAgICAgICAgICAgaWYgKG1hdGNoX2h3aXJxID09IGh3aXJxKSB7Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgaWYgKGhhcnRpZCA8IGZpcnN0X2hhcnRpZCkKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGZpcnN0X2hhcnRpZCA9IGhhcnRpZDsKPiAtLQo+IDIuNDMuMAo+
CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
