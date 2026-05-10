Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 003C6CD37AF
	for <opensbi@archiver.kernel.org>; Sun, 10 May 2026 06:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gZ6D0qcvvqOF/bqRASTF7a4T16lGzWTsmMjQFJ+kKt0=; b=XsKrJJFAxHCNNp
	8PdGBWVbFDE6gzh1A7oF1XjF/VQQGxJHn7tcsL0GaqkHrBBkwNSTEw+SndN6crYo90HClw2tZD3TM
	5PW9FQ8AtfXuAi9pDxMPvB0fM0lFVRDJzSvgfGtm0oKfnKBkXAs14gQx+HIrgqCwVEhVSym34cUEn
	OE06+46KokM+RxoesFsmC/HEhcT+60UVhd6aZNO0MC8hqvGsVcGLqQIeRn/Dth+jbXTU2wNEFVlOF
	k2aRVkYtqeCEf9+HQlyGdTqln+cNFCQcK30YtBmTaBa/PAtXFQOgfc1z2OjTQq8AEyiuWbMW4FPu7
	0jlvud5yRs1Iuh1rT1Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLxHl-0000000AFfz-3S4U;
	Sun, 10 May 2026 06:05:05 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLxHh-0000000AFfH-3mRS
	for opensbi@lists.infradead.org;
	Sun, 10 May 2026 06:05:03 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-7dcdca9aa0bso3143043a34.0
        for <opensbi@lists.infradead.org>; Sat, 09 May 2026 23:05:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778393100; cv=none;
        d=google.com; s=arc-20240605;
        b=k0PhvlPRuzoJJAlFlmAm+E+gA/Vg+SvkEDm+9yG1tLqMPdp4bTDKcWHumaYFq/fRN3
         iNSqildTCpOOcE8JNC4j138oTCWykMUBMTkfnXa8K6dM1Sj3FdM7wA+P4FPZOqsOi6Sd
         qNy5g9UaW2QnVhIJlhO9ihlrh6546/MFuExcYk5mIKP/D101rNjLIGPxKYrDpUlNWDRV
         4i202xYIA7JA2xFVLGrBnQMawlCqmC+fj4rVy+va0+UojCT7oUzqayu/dL7OAXouzDYV
         5GWWmtuGaHzZiIur/8hLnP/CpCl5PAsdwawM2tTPexDluNPipWA5MZl3I1zZdMPcRX0n
         3Mrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KmGlHhDOgeBKwrDGxC7I6ezWHxdO49EM/J6sCEdGAc8=;
        fh=1CCt9UJmt40SlRo459PKEWIuUxZQ2Zn4py42z4BZDhE=;
        b=Toh0byMXYJC4ad88c87lLrAFhY/i1iVkGgIZ8gywrs9e3Dw/q5jAmRRSTeH9m0SRZP
         XZ6BURP/BzDfGMwo2ypCs1GrLlTOoVzTyjbeOToSb/R4+iuP3Q9yTT2q9VzJxreCUJWd
         oyznDzAzjnn041iC4N62agGmo/NjNYul6nRML2FhmjpA8TRWRdLZrn0//TqpBgPw0EGy
         ZBWA99Q1svCMLkiPFU2IahrHKWUpMnZDvaqo4VhEQkdZs7dt2znu7wyQCUQSrHGLnvwO
         tkj6MbNoXnCUqxLeBLdRQAnL42cEClgrx4QKKgcP92xtawkX7eO2D9/eQSNLNvrbrvC8
         R9bQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1778393100; x=1778997900; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KmGlHhDOgeBKwrDGxC7I6ezWHxdO49EM/J6sCEdGAc8=;
        b=c3KZAqcyNkhUOYaFAqW373Z6oafhh/REC1QKLTKbyOd+MQ7EfE3Vz0gJdatyYpW2KZ
         YQKh1ymzoqTyXXOdj80RRocibsuKoZ1zQfy32cr0pW9cW3h9JX9bf8VctAI26zBwMAa6
         rMM6Pu3tnVcKvzEAe6+rU6N1MtPaV+Ln769d5M7GbDg4p9gbZMkLMiw6qez4PWIEVcRN
         T522F/wJOrNjTv5T9JqFF4ptSIWqe5GzVVKrlKoH3cEVUiyL1EFRWnXy2o4FHxnQNeRn
         nkiwm+Tt0/5OK9g0ireLqRwQDxQ/SfTMckTvyk5guoPNFBYBzH7LMbBqOTizNOfNnjSZ
         wnHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778393100; x=1778997900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KmGlHhDOgeBKwrDGxC7I6ezWHxdO49EM/J6sCEdGAc8=;
        b=c5hpuaHv1vBlqpVFBnErlNIB4AGbbyCV8TD2wPqSG0g+EtgQtwRKSNy6+BQ1QvBg/o
         g3KjvQOhYYnMSOcY2rmpXf9urhMaxG5DNYyLMLbFAefpS/mGOX0+/DDBSMFTRFpdA1Kv
         fHi0S7pwVrmdletnL/YrkC+Arn19OADpmKeCUQG85M/mCzEZHX/H/PhnB74LGFzUXqdU
         XDu8RLPx9tz8cYYiDvagsrHKV69bOlpNlkbva6+jBR0cK/JZtukMCbWwaVWggEGrgHOG
         018tabhe7khVSvHegOpRWH8yOH82PnQuguFY8mDLCYAZFTNm7k+aAUUrTZSwKrksxGji
         /wMA==
X-Gm-Message-State: AOJu0YzQ8knc0ojS3LX6Zrw8kQSODWlA7O5RlVHHhTQO22/pfx2UjuEX
	sdI20uCAfubod7TdOhbWcsSF8nQnImF7Z4HvJJhoY7cjt8vss+4n4SRq/Wm+n+kg1xmqpXz8qZo
	QO5B1M251Heffi3SRfVyJu53p+ht7KhjhGS3BRo0yCw==
X-Gm-Gg: Acq92OH9o80QyivHJt+tf8neVLnFq7TjDQrJgSRD6wElr3OtknkEU2z3LkC0flCHZvk
	WxCcH8U6IPwGqhbSxTXWc0Gr1qXDq5PnSmcEgypf2aG+ihPEtB+gnEGuQtt/s+K9kCkYvU6HKKo
	jgy1hdY38MlbPjqR0fZsT6JrylJ33LBxs62zl5tXNKFpiZbkyYKD+96WxVetVePLj5vAbUR8sWg
	c/skUieJ06+ZTTqOq/zAj0Na04eGZNZ9E5uNEGLKMaeQESWEIXj3e8ipKUmnfVPRLBF80obd0/e
	Elr15TM+7G0iKWnezf6ykhkyTNLMsX92Myx82w73grhcI1V2gqsRUskTlqmzFW7W8Ifgf4ubRHF
	1efRHnAe8Dqd8inoWoOpplhbdpQ==
X-Received: by 2002:a4a:d84b:0:b0:695:94b4:d4cc with SMTP id
 006d021491bc7-699ab57164amr4804017eaf.1.1778393100494; Sat, 09 May 2026
 23:05:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260327043357.3452008-1-peter.lin@sifive.com>
In-Reply-To: <20260327043357.3452008-1-peter.lin@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 10 May 2026 11:34:49 +0530
X-Gm-Features: AVHnY4JT6r83LKFiKJnDiYqkZiFNZQztjCSpxBi196chHU7kycUuLo6Ho1S0rso
Message-ID: <CAAhSdy2P4D41w5fM=gYwn8ObRjUW3D5p_rdc8EMB7qFa_n-U4w@mail.gmail.com>
Subject: Re: [PATCH] lib: utils: fdt_domain: add support for root domain
 region inheritance
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com, greentime.hu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_230502_213169_B56DE52B 
X-CRM114-Status: GOOD (  23.89  )
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

T24gRnJpLCBNYXIgMjcsIDIwMjYgYXQgMTA6MDTigK9BTSBZdS1DaGllbiBQZXRlciBMaW4KPHBl
dGVyLmxpbkBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEFkZCB0aGUgInJvb3QtcmVnaW9ucyIgcHJv
cGVydHkgaW4gZG9tYWluIGRldmljZS10cmVlIG5vZGVzIHRvCj4gYWxsb3cgZG9tYWlucyB0byBp
bmhlcml0IGFsbCByZWdpb25zIGZyb20gdGhlIHJvb3QgZG9tYWluLiBUaGlzCj4gc2ltcGxpZmll
cyBjb25maWd1cmF0aW9uIGZvciBkb21haW5zIHRoYXQgbmVlZCBhY2Nlc3MgdG8gbW9zdAo+IHJv
b3QgZG9tYWluIHJlZ2lvbnMgd2l0aCBvbmx5IG1pbm9yIGV4Y2x1c2lvbnMgb3IgYWRkaXRpb25z
LgoKT3ZlcmFsbCwgdGhpcyBpcyBhIGdvb2QgYXBwcm9hY2ggYnV0IEkgc3VnZ2VzdCByZW5hbWlu
ZyB0aGlzIHByb3BlcnR5CnRvICJyb290LXJlZ2lvbnMtaW5oZXJpdGFuY2UiIHdoaWNoIHRha2Vz
IHRoZSBmb2xsb3dpbmcgcG9zc2libGUgdmFsdWVzOgoKMSkgImFsbCIgOiBJbmhlcml0IGFsbCBy
ZWdpb25zIGZyb20gdGhlIHJvb3QgZG9tYWluCjIpICJzdS1vbmx5IjogSW5oZXJpdCByZWdpb25z
IGFjY2Vzc2libGUgdG8gUy1tb2RlIG9yIFUtbW9kZSBmcm9tIHRoZQpyb290IGRvbWFpbgozKSAi
bm9uZSI6IEluaGVyaXQgbm8gcmVnaW9ucyBmcm9tIHRoZSByb290IGRvbWFpbgoKRnJvbSB0aGUg
YWJvdmUsIGlmICJyb290LXJlZ2lvbnMtaW5oZXJpdGFuY2UiIGlzIG5vdCBzZXQgdGhlbiBpdCBp
cwphc3N1bWVkIHRvIGJlICJzdS1vbmx5Ii4KClJlZ2FyZHMsCkFudXAKCj4KPiBTaWduZWQtb2Zm
LWJ5OiBZdS1DaGllbiBQZXRlciBMaW4gPHBldGVyLmxpbkBzaWZpdmUuY29tPgo+IC0tLQo+ICBk
b2NzL2RvbWFpbl9zdXBwb3J0Lm1kICAgICB8ICA0ICsrKysKPiAgbGliL3V0aWxzL2ZkdC9mZHRf
ZG9tYWluLmMgfCA0NiArKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQo+ICAy
IGZpbGVzIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQo+Cj4gZGlm
ZiAtLWdpdCBhL2RvY3MvZG9tYWluX3N1cHBvcnQubWQgYi9kb2NzL2RvbWFpbl9zdXBwb3J0Lm1k
Cj4gaW5kZXggOTMxODZjNGEuLmE4OGYxY2ZiIDEwMDY0NAo+IC0tLSBhL2RvY3MvZG9tYWluX3N1
cHBvcnQubWQKPiArKysgYi9kb2NzL2RvbWFpbl9zdXBwb3J0Lm1kCj4gQEAgLTE1OSw2ICsxNTks
MTAgQEAgVGhlIERUIHByb3BlcnRpZXMgb2YgYSBkb21haW4gaW5zdGFuY2UgRFQgbm9kZSBhcmUg
YXMgZm9sbG93czoKPiAgKiAqKnBvc3NpYmxlLWhhcnRzKiogKE9wdGlvbmFsKSAtIFRoZSBsaXN0
IG9mIENQVSBEVCBub2RlIHBoYW5kbGVzIGZvciB0aGUKPiAgICB0aGUgZG9tYWluIGluc3RhbmNl
LiBUaGlzIGxpc3QgcmVwcmVzZW50cyB0aGUgcG9zc2libGUgSEFSVHMgb2YgdGhlCj4gICAgZG9t
YWluIGluc3RhbmNlLgo+ICsqICoqcm9vdC1yZWdpb25zKiogKE9wdGlvbmFsKSAtIEEgYm9vbGVh
biBmbGFnIGluZGljYXRpbmcgd2hldGhlciB0aGlzIGRvbWFpbgo+ICsgIGluaGVyaXRzIEFMTCBt
ZW1vcnkgcmVnaW9ucyBmcm9tIHRoZSByb290IGRvbWFpbi4gSWYgdGhpcyBwcm9wZXJ0eSBpcyBw
cmVzZW50LAo+ICsgIHRoZSBkb21haW4gd2lsbCBpbmNsdWRlIHdpdGggYWxsIHJvb3QgZG9tYWlu
IHJlZ2lvbnMgYW5kIHRoZW4gb3ZlcmxheSB3aXRoCj4gKyAgcmVnaW9ucyBzcGVjaWZpZWQgaW4g
dGhlICoqcmVnaW9ucyoqIHByb3BlcnR5IGZvciBhZGRpdGlvbmFsIHJlc3RyaWN0aW9ucy4KPiAg
KiAqKnJlZ2lvbnMqKiAoT3B0aW9uYWwpIC0gVGhlIGxpc3Qgb2YgZG9tYWluIG1lbW9yeSByZWdp
b24gRFQgbm9kZSBwaGFuZGxlCj4gICAgYW5kIGFjY2VzcyBwZXJtaXNzaW9ucyBmb3IgdGhlIGRv
bWFpbiBpbnN0YW5jZS4gRWFjaCBsaXN0IGVudHJ5IGlzIGEgcGFpcgo+ICAgIG9mIERUIG5vZGUg
cGhhbmRsZSBhbmQgYWNjZXNzIHBlcm1pc3Npb25zLiBUaGUgYWNjZXNzIHBlcm1pc3Npb25zIGFy
ZQo+IGRpZmYgLS1naXQgYS9saWIvdXRpbHMvZmR0L2ZkdF9kb21haW4uYyBiL2xpYi91dGlscy9m
ZHQvZmR0X2RvbWFpbi5jCj4gaW5kZXggYjJmYTg2MzMuLjQ1NDA3YzIyIDEwMDY0NAo+IC0tLSBh
L2xpYi91dGlscy9mZHQvZmR0X2RvbWFpbi5jCj4gKysrIGIvbGliL3V0aWxzL2ZkdC9mZHRfZG9t
YWluLmMKPiBAQCAtMzczLDI1ICszNzMsMzUgQEAgc3RhdGljIGludCBfX2ZkdF9wYXJzZV9kb21h
aW4oY29uc3Qgdm9pZCAqZmR0LCBpbnQgZG9tYWluX29mZnNldCwgdm9pZCAqb3BhcXVlKQo+ICAg
ICAgICAgaWYgKGVycikKPiAgICAgICAgICAgICAgICAgZ290byBmYWlsX2ZyZWVfYWxsOwo+Cj4g
LSAgICAgICAvKgo+IC0gICAgICAgICogQ29weSBvdmVyIHJvb3QgZG9tYWluIG1lbXJlZ2lvbnMg
d2hpY2ggZG9uJ3QgYWxsb3cKPiAtICAgICAgICAqIHJlYWQsIHdyaXRlIGFuZCBleGVjdXRlIGZy
b20gbG93ZXIgcHJpdmlsZWdlIG1vZGVzLgo+IC0gICAgICAgICoKPiAtICAgICAgICAqIFRoZXNl
IHJvb3QgZG9tYWluIG1lbXJlZ2lvbnMgd2l0aG91dCByZWFkLCB3cml0ZSwKPiAtICAgICAgICAq
IGFuZCBleGVjdXRlIHBlcm1pc3Npb25zIGluY2x1ZGU6Cj4gLSAgICAgICAgKiAxKSBmaXJtd2Fy
ZSByZWdpb24gcHJvdGVjdGluZyB0aGUgZmlybXdhcmUgbWVtb3J5Cj4gLSAgICAgICAgKiAyKSBt
bWlvIHJlZ2lvbnMgcHJvdGVjdGluZyBNLW1vZGUgb25seSBtbWlvIGRldmljZXMKPiAtICAgICAg
ICAqLwo+IC0gICAgICAgc2JpX2RvbWFpbl9mb3JfZWFjaF9tZW1yZWdpb24oJnJvb3QsIHJlZykg
ewo+IC0gICAgICAgICAgICAgICBpZiAoKHJlZy0+ZmxhZ3MgJiBTQklfRE9NQUlOX01FTVJFR0lP
Tl9TVV9SRUFEQUJMRSkgfHwKPiAtICAgICAgICAgICAgICAgICAgIChyZWctPmZsYWdzICYgU0JJ
X0RPTUFJTl9NRU1SRUdJT05fU1VfV1JJVEFCTEUpIHx8Cj4gLSAgICAgICAgICAgICAgICAgICAo
cmVnLT5mbGFncyAmIFNCSV9ET01BSU5fTUVNUkVHSU9OX1NVX0VYRUNVVEFCTEUpKQo+IC0gICAg
ICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+IC0gICAgICAgICAgICAgICBpZiAocHJlZy5t
YXhfcmVnaW9ucyA8PSBwcmVnLnJlZ2lvbl9jb3VudCkgewo+IC0gICAgICAgICAgICAgICAgICAg
ICAgIGVyciA9IFNCSV9FSU5WQUw7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgZ290byBmYWls
X2ZyZWVfYWxsOwo+ICsgICAgICAgaWYgKGZkdF9nZXRfcHJvcGVydHkoZmR0LCBkb21haW5fb2Zm
c2V0LCAicm9vdC1yZWdpb25zIiwgTlVMTCkpIHsKPiArICAgICAgICAgICAgICAgc2JpX2RvbWFp
bl9mb3JfZWFjaF9tZW1yZWdpb24oJnJvb3QsIHJlZykgewo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGlmIChwcmVnLm1heF9yZWdpb25zIDw9IHByZWcucmVnaW9uX2NvdW50KSB7Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBlcnIgPSBTQklfRUlOVkFMOwo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgZ290byBmYWlsX2ZyZWVfYWxsOwo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIH0KPiArICAgICAgICAgICAgICAgICAgICAgICBtZW1jcHkoJmRvbS0+cmVnaW9u
c1twcmVnLnJlZ2lvbl9jb3VudCsrXSwgcmVnLCBzaXplb2YoKnJlZykpOwo+ICsgICAgICAgICAg
ICAgICB9Cj4gKyAgICAgICB9IGVsc2Ugewo+ICsgICAgICAgICAgICAgICAvKgo+ICsgICAgICAg
ICAgICAgICAgKiBDb3B5IG92ZXIgcm9vdCBkb21haW4gbWVtcmVnaW9ucyB3aGljaCBkb24ndCBh
bGxvdwo+ICsgICAgICAgICAgICAgICAgKiByZWFkLCB3cml0ZSBhbmQgZXhlY3V0ZSBmcm9tIGxv
d2VyIHByaXZpbGVnZSBtb2Rlcy4KPiArICAgICAgICAgICAgICAgICoKPiArICAgICAgICAgICAg
ICAgICogVGhlc2Ugcm9vdCBkb21haW4gbWVtcmVnaW9ucyB3aXRob3V0IHJlYWQsIHdyaXRlLAo+
ICsgICAgICAgICAgICAgICAgKiBhbmQgZXhlY3V0ZSBwZXJtaXNzaW9ucyBpbmNsdWRlOgo+ICsg
ICAgICAgICAgICAgICAgKiAxKSBmaXJtd2FyZSByZWdpb24gcHJvdGVjdGluZyB0aGUgZmlybXdh
cmUgbWVtb3J5Cj4gKyAgICAgICAgICAgICAgICAqIDIpIG1taW8gcmVnaW9ucyBwcm90ZWN0aW5n
IE0tbW9kZSBvbmx5IG1taW8gZGV2aWNlcwo+ICsgICAgICAgICAgICAgICAgKi8KPiArICAgICAg
ICAgICAgICAgc2JpX2RvbWFpbl9mb3JfZWFjaF9tZW1yZWdpb24oJnJvb3QsIHJlZykgewo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGlmICgocmVnLT5mbGFncyAmIFNCSV9ET01BSU5fTUVNUkVH
SU9OX1NVX1JFQURBQkxFKSB8fAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAocmVnLT5m
bGFncyAmIFNCSV9ET01BSU5fTUVNUkVHSU9OX1NVX1dSSVRBQkxFKSB8fAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAocmVnLT5mbGFncyAmIFNCSV9ET01BSU5fTUVNUkVHSU9OX1NVX0VY
RUNVVEFCTEUpKQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4g
KyAgICAgICAgICAgICAgICAgICAgICAgaWYgKHByZWcubWF4X3JlZ2lvbnMgPD0gcHJlZy5yZWdp
b25fY291bnQpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVyciA9IFNCSV9F
SU5WQUw7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGZhaWxfZnJlZV9h
bGw7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgfQo+ICsgICAgICAgICAgICAgICAgICAgICAg
IG1lbWNweSgmZG9tLT5yZWdpb25zW3ByZWcucmVnaW9uX2NvdW50KytdLCByZWcsIHNpemVvZigq
cmVnKSk7Cj4gICAgICAgICAgICAgICAgIH0KPiAtICAgICAgICAgICAgICAgbWVtY3B5KCZkb20t
PnJlZ2lvbnNbcHJlZy5yZWdpb25fY291bnQrK10sIHJlZywgc2l6ZW9mKCpyZWcpKTsKPiAgICAg
ICAgIH0KPiAgICAgICAgIGRvbS0+ZndfcmVnaW9uX2luaXRlZCA9IHJvb3QuZndfcmVnaW9uX2lu
aXRlZDsKPgo+IC0tCj4gMi40OC4wCj4KPgo+IC0tCj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBv
cGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2Jp
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9vcGVuc2JpCg==
