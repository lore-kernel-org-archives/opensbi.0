Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685E5C71135
	for <opensbi@archiver.kernel.org>; Sun, 15 Jun 2025 13:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bhQsTmM8NtMD+eUu0x79ejsk4FQTKsHQ6/GGHvgAfso=; b=I8fNRHsX2mMp4S
	GPdLrBJcfpyeyfgMuvPgGdJYyunrcogdExN35uc2WAQGhcBfnjZaxxtSkT4cWZsEBgR4uUSuS+akP
	AgkPfaeeN2zLL7TK3NqurNy0TJTOd9IgRw5HSf9vPx+WZdsumTO1NSTfvIFG2pyDcl3aDs9NcV0dY
	YObUSAWvxM4sxmtE2i9ybe3gjHo90JM1diRgSeo+jQfgHvMXoFoUKxuAmLf4dQUgNF9MRn+DVDWjZ
	mcxUQOG0Qw6m41RNZkGNKqc6GfsY6eTMmHpmoHJu+qUoaF1G/Pd2bpioGXg3/joYFaEMtDCwl9+Z3
	GWsMyAAl6MH1qlX34Xdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQnIu-00000002W8M-1eEv;
	Sun, 15 Jun 2025 13:21:44 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQnIs-00000002W7w-1Nge
	for opensbi@lists.infradead.org;
	Sun, 15 Jun 2025 13:21:43 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3ddda0a8ba2so37541945ab.0
        for <opensbi@lists.infradead.org>; Sun, 15 Jun 2025 06:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1749993701; x=1750598501; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwyffz9uRN0ZIdk6VVcwig4dABa+jdvzhZbW8bi3848=;
        b=qHrExaTrqrpH1be1eQic6hsxtXAgMAquYN4MaIZjwgJRH9Cg6j8X3bl0+2820y0G4I
         0XQzdPdg/tuTjrsseb7nj4xH+pkM6my8fpjgeYXHTd2kmwy3/dSvILDj/ZGTNbP2NUu8
         dGHVFJGeg6Z/5z21CvwBMi4txnHKmUtbh+K2XFs6icVFMgHSLstEBChlDp/k5vY91Bvs
         DtC9JpkR1UX12WFcDcOBGf1Mn2Gyjv2PjbSi8or3AdRjNuZ7mL2wbkAn/6FclDouoSrG
         /Y/9CBsThUevHHzUSrjuvY/I76dORGUzTXuBTG+pHCDE6PzaApFra84WcsH8FiiESOjg
         LIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749993701; x=1750598501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kwyffz9uRN0ZIdk6VVcwig4dABa+jdvzhZbW8bi3848=;
        b=skYodiZCyGe1BIU9OTBqdXjSP8Gj99RGBdx3DiloqgQ1wmoAxmJf4yGMDQatROI6K6
         gwTBeNRqbzCyPhP8KyD7zaw3KJ/nNtrnBjtcqoC4f6Noy0M1nyGhYS1YBgIntT5rHGa3
         GHI61UTgPZflMt4rQQmCE5w+u/II5Q/LKI3tEBQDlfFjJN858hglATFz69b7xLj6/3GA
         TDOOVM7mmdPYzjPSnArnO4FbsL98MUChoAKQZVHg59fSKJ87LvOF/0H3cx5YDjPYsdS+
         XnwYVBC2IiXs4qdAjGUAeqchxQyNzqdMHcMYP8XPeU3GbgJjZRDwOC/BIwbWQ1Tud9Vi
         sT+g==
X-Gm-Message-State: AOJu0YxxjFu+ZqVbPsBtr5yraVbF26HNE8Ee+KWaN4GjxxI8yCJjEOks
	ZU/y0HA7vLFCS4D8/61spbB/C12QZJgazFOYQLrCaa9vNeCKr4vVRU7yEudvv9o8odvjb0Ta83r
	P63sKhQKAsE3c6XCRLMh3lnsEAFejm97faTS1LRUsq4Ww34U8nUyc
X-Gm-Gg: ASbGncvH6F2sYOoLcxX+fLofYk5+M3c9PueXL8ROm5PBmlwCqVnE2/pFi3HDMH7UGrV
	y/7Dqe/kUX/rN8yjFFS81LdWJ9VTeilKLetC/yDz3pElJdYIu+Mhpb60JIcCAMr8qIWoDvuc+mC
	NUgbUt/UUGxyInlmwNww3MApAuC9irdNAID/b0Hx1IU4tsyfNAuBtPQVpKk/HnRnRjaycLt0z7Z
	rSuWg==
X-Google-Smtp-Source: AGHT+IEdfPIGOY6/khcj5RXadSdqKfZEbhvjvhCzERBJuNL2uY6mlzBVHsr8nWn7lAub9Qz+nyaSQ5sSZ+47co9M8d8=
X-Received: by 2002:a05:6e02:2482:b0:3dc:79e5:e6a8 with SMTP id
 e9e14a558f8ab-3de07ccd64amr69790265ab.15.1749993689716; Sun, 15 Jun 2025
 06:21:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250519083950.739044-1-cleger@rivosinc.com>
In-Reply-To: <20250519083950.739044-1-cleger@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 15 Jun 2025 18:51:17 +0530
X-Gm-Features: AX0GCFsg__vn-zgo0oVi25lr9VsJXxFFjarDgBWDA91f9azexpTAff_1Man0MfY
Message-ID: <CAAhSdy0WoEb8CxCW97KsNDsF6GQmc=aDHpw_ONptTLZJ59s+Vw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] lib: sbi: pmu: Rework SSE callbacks
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: opensbi@lists.infradead.org, Anup Patel <apatel@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_062142_374541_62878ADB 
X-CRM114-Status: GOOD (  11.09  )
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

T24gTW9uLCBNYXkgMTksIDIwMjUgYXQgMjoxMOKAr1BNIENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBXaGlsZSB0ZXN0aW5nIHRoZSBQTVUgU1NFIHN1cHBv
cnQgaW4gTGludXgsIGEgZmV3IHByb2JsZW0gd2VyZSBzcG90dGVkLgo+IFRoZSBmaXJzdCBvbmUg
d2FzIGR1ZSB0byBpbnRlcnJ1cHRzIGhhcHBpbmcgZHVyaW5nIHNvbWUgUE1VIGNyaXRpY2FsCj4g
c2VjdGlvbnMuIEluZGVlZCwgdGhlIFBNVSBjb3JlIGFjdHVhbGx5IGRpc2FibGUgaW50ZXJydXB0
cyB3aGVuIGVudGVyaW5nCj4gdGhlc2Ugc2VjdGlvbnMuIEhvd2V2ZXIsIHdoaWxlIHRoaXMgd29y
a3Mgd2hlbiBpbnRlcnJ1cHRzIGFyZSB0YXJnZXRpbmcKPiB0aGUgUy1tb2RlLCB0aGlzIGlzIG5v
dCB0aGUgY2FzZSB3aXRoIFNTRS4gRml4aW5nIHRoaXMgcmVxdWlyZWQgdG8KPiBpbXBsZW1lbnQg
cG11X2Rpc2FibGUvZW5hYmxlKCkgaW4gTGludXggWzFdLiBUaGVzZSB0d28gY2FsbGJhY2tzIG5v
dwo+IGNhbGwgc3NlX2V2ZW50X2Rpc2FibGUvZW5hYmxlKCkgd2hpY2ggbm93IGp1c3QgbmVlZHMg
dG8gc2V0L2NsZWFyCj4gTUlFL01JUC4gU2Vjb25kIHByb2JsZW0gd2FzIHRoYXQgcmVwb3J0ZWQg
UE1VIGV2ZW50cyBjb3VudCB3ZXJlIHF1aXRlCj4gbG93LiBUaGlzIHByb3ZlZCB0byBiZSBkdWUg
dG8gc29tZSBpbnRlcnJ1cHRzIGJlaW5nIGxvc2VkIHdoZW4KPiByZWVuYWJsaW5nIFNTRSBldmVu
dC4gV2Ugc3RpbGwgbmVlZCB0byBjbGVhciB0aGUgcGVuZGluZyBQTVUgaW50ZXJydXB0cwo+IHVw
b24gZGlzYWJsaW5nIG90aGVyd2lzZSB3ZSBtaWdodCBnZXQgc29tZSBzcHVyaW91cyBpbnRlcnJ1
cHRzIHdoZW4KPiByZWVuYWJsaW5nIGl0Lgo+Cj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtcmlzY3YvMjAyNTA1MTYxNTIzNTUuNTYwNDQ4LTEtY2xlZ2VyQHJpdm9zaW5jLmNv
bS8gWzFdCj4KPiBDbMOpbWVudCBMw6lnZXIgKDIpOgo+ICAgbGliOiBzYmk6IHBtdTogQWRkIFNT
RSByZWdpc3Rlci91bnJlZ2lzdGVyKCkgY2FsbGJhY2tzCj4gICBsaWI6IHNiaTogcG11OiBSZW1v
dmUgTUlQIGNsZWFyaW5nIGZyb20gcG11X3NzZV9lbmFibGUoKQoKQXBwbGllZCB0aGlzIHNlcmll
cyB0byB0aGUgcmlzY3Yvb3BlbnNiaSByZXBvLgoKVGhhbmtzLApBbnVwCgotLSAKb3BlbnNiaSBt
YWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
