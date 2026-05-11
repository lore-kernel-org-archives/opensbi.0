Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27FECD37AC
	for <opensbi@archiver.kernel.org>; Mon, 11 May 2026 04:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IVcUx/6dHLGKwC/ahslOsXF+w2XedD/9A6TdZWyL0IU=; b=eY4yRYwvOE7CyG
	8aKoFuhs9pDEh57xKbGtyQ56zrfZfBl8DwFvWTzyHzJ+86Vp6ohgB8VKE1dxj0OnlGLVHsvgYsWR7
	HHxGxF4YlY2Dwr1RP2iLdrSLDRotDW3dplwMmVyIbjjuDDs6jN4nBz6Y/K3k/j9n5R1BxJGKl+ZrC
	GoYH+k7MhaagvckM8tTIO8J4OY8+cg4kJySeORiogTPHnI4U3EvKThl9VpsuwGw3SEp01wePB23Sb
	kEdWyn0+3V9k6dl7Xssc9Dig74z9TQijSBZAjFIMLQ4bvQu6O7BgKNaXKmS3LahGP3uXSgcH18d6Z
	CeEUKOnESti8pRQyGVmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMIck-0000000CIrQ-0Gs8;
	Mon, 11 May 2026 04:52:10 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMIcf-0000000CIqd-080l
	for opensbi@lists.infradead.org;
	Mon, 11 May 2026 04:52:07 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-662efd1bdd4so2305983eaf.0
        for <opensbi@lists.infradead.org>; Sun, 10 May 2026 21:52:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778475123; cv=none;
        d=google.com; s=arc-20240605;
        b=eyxCgtgn59ipTQeDD98Mc2Y9mntI4i5ahT3bSRGC3BJGEvk9L5CCp4xabnp4h8DUpy
         MuBQMIOJg0f3Y5zwX7U8cuh/81qoBIB0oNFlwE8/VmXT0V87DZzMkc23qbWI2ah09osJ
         VIdpm0l0h7Lz0Dhhna6/C7eGUXbxNzV2Z1XxQ0A1pJfNeuBjixFbKiayk2SV3XkHe7/N
         5fEiXeiOL3IgOxWpKT76PTIaG+ujneJMvTL+9ouAOe1EOKEVH/jQy3+Bu60XADJGcf8I
         ZQcSheFMKzCOdO4GvniNxf72zlfd26yEeYNlkkbDOn4BEY4BvvqYEnW6OSOvYdPdkh2X
         eUgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ziez+JQJ4rBdb8aDhdRk71f7XiT1070bz3UHKUBn5XM=;
        fh=1CCt9UJmt40SlRo459PKEWIuUxZQ2Zn4py42z4BZDhE=;
        b=ghlPjcFB7+P+Km3wk+X0jiKgJSwkzBYgWCExGOoEcfHjLDj+a8pRNtRtFV5ShDnjvU
         gWPLl06b3AtM7BOA7EMsifswGl1lD5htuFiuC3gOL4FiHE2AOyELK+7njsU8/4mHdHQz
         3KRS2X49jyIx7tZyeatmiklVEp7c6DVf1/5H3S+jMdvdEvZ+IpiIGtBocTj+PFI2JuwM
         rmeXtArzcnNW/XE8rNc2fAshjaj/9aFjUBWzl9zMPC3FMDUGSiana34oUxGeLk9nSe7f
         W649uGitLGPYxuXOegSN76uZVarWfIERQDl+SScnCVgRqXd8aEIvLGGHT92m+QgEtPwX
         wYNA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1778475123; x=1779079923; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ziez+JQJ4rBdb8aDhdRk71f7XiT1070bz3UHKUBn5XM=;
        b=iS5kmRpfLOhEZbiX7KAEvQM2dNNgIIdPVQlpgJ7elvV9Y15d19a7GUCsBzErKdILx8
         xNUctr6iPfjmaKAe+heKEkkzHjpcpcfuPbkAM0Og0N9YCUcflY4zr5Woeoba7+ttGRh+
         q1Z5OYDbDMeOheJ0V/4VubMwUWZTfHgh6NLxFbxBa3Mb3a/MEzRuaIbKUCHpp+xksFGp
         gfITM3sznpyPCqAALS/rxL16fJnnbeeNfuFVkLlKsqBv3WcDrBQZWLF7QCf/5HIrfdnG
         TWQVbJPqs6n0SLWCvzha26BMg7PQQwwmTM+9QE0hlIzE6eGbidGDT74kteJph3RXdx7p
         XOhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778475123; x=1779079923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ziez+JQJ4rBdb8aDhdRk71f7XiT1070bz3UHKUBn5XM=;
        b=tT6smEXIyWPsaVOrzw5mgHNwUAAJFZuvZyzWre2Dbkpptyd1PeMYIYpJ585ZbfSq3o
         90xIHlj64fqJz4ZTji6Zynf5yOGAtqPYyscV2BxcFPy2UUWJu8vkTeR/rucCGgy1UYeD
         YGmed3+prjr1NdGBf8tBUjcwSc4lEiiG2mr+6JN2/QWeJFteTxRNbSYlfV3UKpizXFJo
         +9MQ8GhaUTOKNz5RktfTnpnGBSb30/cjdoIG0iOYub43mvLHngMU8d3hDF30sLhOa/+w
         EUHbDkVE/LDqwqYQFxTyQlXvkhccjvhNo5dPJQwVKRw9suScgLONr09QkqBr5cmkut5p
         ZCfQ==
X-Gm-Message-State: AOJu0YxAT8yMXyY0uuBPvXLcDPMfftv+9HmuyDdEKnTV6qE+1XjTNsc7
	+H8MFJeKuUwV/WZ1nBHk36XzHDTbRX5F8WceOUdLMNHUGWq9xpy8Hhl5r7r3QbwGZQyUku9jebu
	HHflkOo55MHYr20EoG/ilRLfUhZeqL5ggYCe42g+byA==
X-Gm-Gg: Acq92OE5c5ShziqY9a0LvO/bDVucV4Dy8Sa4lp0tBJvWpvGxUMpbCL/M7VjHArwa4IK
	S7MhJD+GbUNN+Hlxy15KCHMo6oWQgkCEzRdnznqBgIx9R2iln/ReF1z0peiujkji15VRaQ4/u9/
	bCvxIv3tHxz1iMANbF6VO32MIJhkJ3JxyVQrdqbSqT6Gh/5zNa5TDsr7KLIcU+ExK2G0gIcTI4e
	yI2qlTfAGQoQZYzLV4dVwPYhXdRtejpCWbCeV0ZZnVV3oK0AMAfxUOcqS9+clYOCV/kVN2n95VC
	3IlTlGgkpIpdLH0RSqbhqm+uPwxTHDj1pG57JP5aO1j1NRvmF8bNwtXHpRoe6sr5whHT34vk7bm
	2g3FXRhfc404+Skjh7RfjpRzLX5qFQskxfiosOS5sTxsk3OU=
X-Received: by 2002:a4a:e60a:0:b0:696:6e28:8c19 with SMTP id
 006d021491bc7-699ab62ba1amr6689164eaf.20.1778475123426; Sun, 10 May 2026
 21:52:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260327054936.3462935-1-peter.lin@sifive.com>
In-Reply-To: <20260327054936.3462935-1-peter.lin@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 11 May 2026 10:21:51 +0530
X-Gm-Features: AVHnY4ICuhEOzPJ98L0z_EZGAc0Cq6LdiqoAivcRAPciO9nQUQkJmi4WJlzM_bw
Message-ID: <CAAhSdy3Au2QMw6wKb9ZXbemMUYX7vrwHg5xt_7tFYeTDV1JAaQ@mail.gmail.com>
Subject: Re: [PATCH] lib: fdt_domain: Default boot-hart to coldboot HART for
 multi-domain boot
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com, greentime.hu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_215205_339394_4E87C321 
X-CRM114-Status: GOOD (  23.37  )
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

T24gRnJpLCBNYXIgMjcsIDIwMjYgYXQgMTE6MTnigK9BTSBZdS1DaGllbiBQZXRlciBMaW4KPHBl
dGVyLmxpbkBzaWZpdmUuY29tPiB3cm90ZToKPgo+IFdoZW4gImJvb3QtaGFydCIgaXMgbm90IHNw
ZWNpZmllZCwgZG9tLT5ib290X2hhcnRpZCB3YXMgbGVmdCBhcyAtMVUsCj4gY2F1c2luZyBkb21h
aW4gY29udGV4dCBzd2l0Y2hpbmcgdG8gZmFpbC4gRGVmYXVsdCBpdCB0byB0aGUgY29sZGJvb3QK
PiBIQVJUIHRvIGVuYWJsZSBTTVAgYm9vdCBpbiBtdWx0aS1kb21haW4gc2V0dXBzLCBjb25zaXN0
ZW50IHdpdGggaG93Cj4gbmV4dC1hcmcxIGlzIGhhbmRsZWQuCj4KPiBBbHNvIHVwZGF0ZSBpdHMg
ZGVzY3JpcHRpb24gaW4gZG9tYWluX3N1cHBvcnQubWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBZdS1D
aGllbiBQZXRlciBMaW4gPHBldGVyLmxpbkBzaWZpdmUuY29tPgoKQXBwbGllZCB0aGlzIHBhdGNo
IHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8uCgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIGRvY3Mv
ZG9tYWluX3N1cHBvcnQubWQgICAgIHwgNiArKystLS0KPiAgbGliL3V0aWxzL2ZkdC9mZHRfZG9t
YWluLmMgfCA1ICstLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA3IGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RvY3MvZG9tYWluX3N1cHBvcnQubWQgYi9kb2Nz
L2RvbWFpbl9zdXBwb3J0Lm1kCj4gaW5kZXggOTMxODZjNGEuLmMwMWU0NDVmIDEwMDY0NAo+IC0t
LSBhL2RvY3MvZG9tYWluX3N1cHBvcnQubWQKPiArKysgYi9kb2NzL2RvbWFpbl9zdXBwb3J0Lm1k
Cj4gQEAgLTE3Myw5ICsxNzMsOSBAQCBUaGUgRFQgcHJvcGVydGllcyBvZiBhIGRvbWFpbiBpbnN0
YW5jZSBEVCBub2RlIGFyZSBhcyBmb2xsb3dzOgo+ICAgIEFueSByZWdpb24gb2YgYSBkb21haW4g
ZGVmaW5lZCBpbiBEVCBub2RlIGNhbm5vdCBoYXZlIG9ubHkgTS1iaXRzIHNldAo+ICAgIGluIGFj
Y2VzcyBwZXJtaXNzaW9ucyBpLmUuIGl0IGNhbm5vdCBiZSBhbiBtLW1vZGUgb25seSBhY2Nlc3Np
YmxlIHJlZ2lvbi4KPiAgKiAqKmJvb3QtaGFydCoqIChPcHRpb25hbCkgLSBUaGUgRFQgbm9kZSBw
aGFuZGxlIG9mIHRoZSBIQVJUIGJvb3RpbmcgdGhlCj4gLSAgZG9tYWluIGluc3RhbmNlLiBJZiBj
b2xkYm9vdCBIQVJUIGlzIGFzc2lnbmVkIHRvIHRoZSBkb21haW4gaW5zdGFuY2UgdGhlbgo+IC0g
IHRoaXMgRFQgcHJvcGVydHkgaXMgaWdub3JlZCBhbmQgdGhlIGNvbGRib290IEhBUlQgaXMgYXNz
dW1lZCB0byBiZSB0aGUKPiAtICBib290IEhBUlQgb2YgdGhlIGRvbWFpbiBpbnN0YW5jZS4KPiAr
ICBkb21haW4gaW5zdGFuY2UuIElmIG5vdCBzcGVjaWZpZWQsIGRlZmF1bHRzIHRvIHRoZSBjb2xk
Ym9vdCBIQVJULiBOb3RlIHRoYXQKPiArICBpZiB0aGUgY29sZGJvb3QgSEFSVCBpcyBhc3NpZ25l
ZCB0byB0aGlzIGRvbWFpbiwgaXQgd2lsbCBiZSBmb3JjZWQgYXMKPiArICB0aGUgYm9vdCBIQVJU
IHJlZ2FyZGxlc3Mgb2YgdGhpcyBwcm9wZXJ0eS4KPiAgKiAqKm5leHQtYXJnMSoqIChPcHRpb25h
bCkgLSBUaGUgNjQgYml0IG5leHQgYm9vdGluZyBzdGFnZSBhcmcxIGZvciB0aGUKPiAgICBkb21h
aW4gaW5zdGFuY2UuIElmIHRoaXMgRFQgcHJvcGVydHkgaXMgbm90IGF2YWlsYWJsZSBhbmQgY29s
ZGJvb3QgSEFSVAo+ICAgIGlzIG5vdCBhc3NpZ25lZCB0byB0aGUgZG9tYWluIGluc3RhbmNlIHRo
ZW4gKipuZXh0IGJvb3Rpbmcgc3RhZ2UgYXJnMSBvZiBjb2xkYm9vdCBIQVJUKioKPiBkaWZmIC0t
Z2l0IGEvbGliL3V0aWxzL2ZkdC9mZHRfZG9tYWluLmMgYi9saWIvdXRpbHMvZmR0L2ZkdF9kb21h
aW4uYwo+IGluZGV4IGIyZmE4NjMzLi4xYjAzOTUzMyAxMDA2NDQKPiAtLS0gYS9saWIvdXRpbHMv
ZmR0L2ZkdF9kb21haW4uYwo+ICsrKyBiL2xpYi91dGlscy9mZHQvZmR0X2RvbWFpbi5jCj4gQEAg
LTM5NiwxNiArMzk2LDEzIEBAIHN0YXRpYyBpbnQgX19mZHRfcGFyc2VfZG9tYWluKGNvbnN0IHZv
aWQgKmZkdCwgaW50IGRvbWFpbl9vZmZzZXQsIHZvaWQgKm9wYXF1ZSkKPiAgICAgICAgIGRvbS0+
ZndfcmVnaW9uX2luaXRlZCA9IHJvb3QuZndfcmVnaW9uX2luaXRlZDsKPgo+ICAgICAgICAgLyog
UmVhZCAiYm9vdC1oYXJ0IiBEVCBwcm9wZXJ0eSAqLwo+IC0gICAgICAgdmFsMzIgPSAtMVU7Cj4g
KyAgICAgICB2YWwzMiA9IGN1cnJlbnRfaGFydGlkKCk7Cj4gICAgICAgICB2YWwgPSBmZHRfZ2V0
cHJvcChmZHQsIGRvbWFpbl9vZmZzZXQsICJib290LWhhcnQiLCAmbGVuKTsKPiAgICAgICAgIGlm
ICh2YWwgJiYgbGVuID49IDQpIHsKPiAgICAgICAgICAgICAgICAgY3B1X29mZnNldCA9IGZkdF9u
b2RlX29mZnNldF9ieV9waGFuZGxlKGZkdCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmZHQzMl90b19jcHUoKnZhbCkpOwo+ICAgICAg
ICAgICAgICAgICBpZiAoY3B1X29mZnNldCA+PSAwICYmIGZkdF9ub2RlX2lzX2VuYWJsZWQoZmR0
LCBjcHVfb2Zmc2V0KSkKPiAgICAgICAgICAgICAgICAgICAgICAgICBmZHRfcGFyc2VfaGFydF9p
ZChmZHQsIGNwdV9vZmZzZXQsICZ2YWwzMik7Cj4gLSAgICAgICB9IGVsc2Ugewo+IC0gICAgICAg
ICAgICAgICBpZiAoZG9tYWluX29mZnNldCA9PSAqY29sZF9kb21haW5fb2Zmc2V0KQo+IC0gICAg
ICAgICAgICAgICAgICAgICAgIHZhbDMyID0gY3VycmVudF9oYXJ0aWQoKTsKPiAgICAgICAgIH0K
PiAgICAgICAgIGRvbS0+Ym9vdF9oYXJ0aWQgPSB2YWwzMjsKPgo+IC0tCj4gMi40OC4wCj4KPgo+
IC0tCj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcK
PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0t
IApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
