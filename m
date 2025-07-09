Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E74EC83F09
	for <opensbi@archiver.kernel.org>; Wed,  9 Jul 2025 02:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PSwSB0BHdx8p1jcuICtvzS7p7Ft1B1W3nIPS/tQiLrU=; b=s9TBUf63u8WOU3
	RoGDB4tSdUSJE886o2Z3JRHPLFVNB9IV8VbfitnLo2/eR0qxAPJf9RyrfEXlxWAxx+6VQnDUFDdM3
	J9YAcWFdqXp9LS0rExSLPuwjxfCBqSVvPy9irKwNaPjMdpkf6mV+DtF1UQRjL24kFT1jKPqG/OWpt
	+HrnccJyLeAY7ucJgCt2hjxmhpDYnM7dP1uaZbz5R0ddYYw70TuSvn30Y337mDv9xv/41Kb8lK+SE
	pbfRHTA01RUAwel0kJfnjho5faQxz+mLdP8riIQ/vklvMN3mtQFrL4+dHjuH+K7cJ/3u0RL8oYHNq
	ploDGwdAjRHjfiOwTOkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZKLB-00000007A7B-435V;
	Wed, 09 Jul 2025 02:15:21 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZKL8-00000007A6h-1iSY
	for opensbi@lists.infradead.org;
	Wed, 09 Jul 2025 02:15:20 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-e733e25bfc7so4381973276.3
        for <opensbi@lists.infradead.org>; Tue, 08 Jul 2025 19:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=summations-net.20230601.gappssmtp.com; s=20230601; t=1752027317; x=1752632117; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cHOOYBsnV+Xo8vUsj5YeXwMVgNmv+c6u6zfHbogfhYY=;
        b=1n6Ni4Fu3Q7kkvyCbs5x3JW7sSkYfQulR/odKrCTYy+E4QzEV65AMrWGBU73dP4MIa
         LhtF03tYhtJ51tdr7og8SBzXzbvhiVNFC/6mn2OgRBKvR7jUNiFvmNdTrljah7Meo5TX
         e84RG9lh6+9u78cVPMyUJIe/htPyLoq3YelApCqZ7F3qDqmv7Aow9yn8OHebsymsPma9
         peKex9VCOJFZ/clFWkK/gavTa/1vuZSdhhEB9Vl1QZymfmw1H70th7kt4FW4BqTfvnr0
         gUTslf4yeR8NdwP9hhPhLbKwxTv+DOkw3Pz7BygsDGSCEE8vv+yJqdKH2DIGWuS7uKCj
         oGhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752027317; x=1752632117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cHOOYBsnV+Xo8vUsj5YeXwMVgNmv+c6u6zfHbogfhYY=;
        b=bVqH4a25F2g2+yCGTLh1dgsnCfBtSWnVz85369LTWypv9P3H0cVv9hFeKqJQ+vUREJ
         Gw8Yrnwhpr86hdhRJAwfU0e0fRUUeB/6SQtwNhEShS4s7Nbv8YfXnYzKXTwjZXqu0FKs
         wHKbhGmEx6dCAisAdEDK936IgsW9DTGKYGVKF/DjOhZfyH8woo9EqrkN4xCguf/4ddK2
         ubyJSsPaZdRGh/ixOVYMYOsse3MfNA8sX9ZwZhE+X1vDoEy8/pBYpL3yFgYsibUAvkj1
         AB2oxlv0Q12fpFluPDziFmoQiV1/k2Om1HgghMFf6m9EBMkbTK9R5je/IE/kAQvfnwH+
         0/Jg==
X-Gm-Message-State: AOJu0Yx814YKLRm18IbQxKuQb3y0a9lRoFRdjac8ca3pWP/JJizbW0Vs
	jGe9QuyXzcHCIuBFCl/DtNb18PTQbIV0XRP6zn6o3idklqgMI56+TqowhBw/+kAndp7N6/9KFLw
	VFdrMhkfc2TUSjs9SwAjYV3FHfaGzFtV18vbB4QgNjjyis+NzPH4oBrxX46Q=
X-Gm-Gg: ASbGncta0Sz77lt5ef/kcEQoC7ghzI9rMypRtnJvin5nb+F4o42XK62euzDrSpivpG7
	w45TGLQojZjwfzrEbXNd9kNxVymROdq3SoPOZXu8gVAdwnsbkUESlo8ZQH7y/037W3miaVPabN1
	lVOM9gyN5838hhU8K225EjXO0ZjXMZpxZ2I+enaoPnCFjiAf8mHXwtt9itpDPmoln+bEM7sqmVm
	hSf
X-Google-Smtp-Source: AGHT+IF8zm5V6DuOaPLhJwY68iFO44fkZ8QmxuZFI4kHIIda7G8p5/ygTJXy67o9ZevgZAyOsv6CQxmOcKofw7JM4Fs=
X-Received: by 2002:a05:690c:4904:b0:70e:6105:2360 with SMTP id
 00721157ae682-717b197377cmr12672817b3.24.1752027316880; Tue, 08 Jul 2025
 19:15:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250704122938.897832-1-ben.dooks@codethink.co.uk>
In-Reply-To: <20250704122938.897832-1-ben.dooks@codethink.co.uk>
From: Rahul Pathak <rahul@summations.net>
Date: Wed, 9 Jul 2025 07:45:05 +0530
X-Gm-Features: Ac12FXxFErbM9pf6SEYRleaNmarTxw6cK5FRLXJFfhh6ieUwa3YVZxydwZFRFqg
Message-ID: <CABdD5xnyfwv3u7pBLwVfUWhpH0cr+SzFMOQKdWb3OgUgLDNB_g@mail.gmail.com>
Subject: Re: [PATCH] include: sbi: fix swap errors with newer gcc -Werror=sequence-point
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_191518_687364_2B2D74CC 
X-CRM114-Status: GOOD (  10.41  )
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
c2V0IG9mIEJTV0FQeHgoKSB3cmFwcGVycyB3aGljaCBzcGVjaWZpY2FsbHkgb25sdAoKbml0OiAl
cy9vbmx5L29ubHQgPwoKPiBldmFsdWF0ZSAneCcgb25jZS4KPgo+IEluIGZpbGUgaW5jbHVkZWQg
bGliL3NiaS9zYmlfbXB4eS5jOjIxOgo+IGxpYi9zYmkvc2JpX21weHkuYzogSW4gZnVuY3Rpb24g
4oCYc2JpX21weHlfd3JpdGVfYXR0cnPigJk6Cj4gaWIvc2JpL3NiaV9tcHh5LmM6NjMyOjYzOiBl
cnJvcjogb3BlcmF0aW9uIG9uIOKAmG1lbV9pZHjigJkgbWF5IGJlIHVuZGVmaW5lZCBbLVdlcnJv
cj1zZXF1ZW5jZS1wb2ludF0KPiAgIDYzMiB8ICAgICAgICAgICAgICAgICAgICAgICAgIGF0dHJf
dmFsID0gbGUzMl90b19jcHUobWVtX3B0clttZW1faWR4KytdKTsKPiAgICAgICB8ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB+fn5+fn5+Xn4K
PgoKTWF5IEkgYXNrIHdoaWNoIGdjYyB2ZXJzaW9uPwoKTEdUTQoKUmV2aWV3ZWQtYnk6IFJhaHVs
IFBhdGhhayA8cmFodWxAc3VtbWF0aW9ucy5uZXQ+CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QK
b3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
