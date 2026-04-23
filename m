Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775D7F99353
	for <opensbi@archiver.kernel.org>; Thu, 23 Apr 2026 08:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OGTpZTcfheATaULVZAeWtrBu+I33cbWN0iGtUlm2kZI=; b=qphor8xUzxt+lI
	/1+YC2FEuVFyiwe2+z6q755ORGyEBBBN34+EkKW0HvJZprTMnNBSktA/t6ocqSJafMsUktidRMgiD
	XYHlBI8pO/+wCM3kRsnD2msfiIZbVN6HpD1ZRjiWPDY4SBVU6cUbDfzf6aO+M60BNzoyGG8kbwNBH
	2+dls3ZSwvgSRVkBVbe3khalrjwzxEhIYnVSjG9UCeQ4CON1+l61dtWPZpu0NrIEWP3Jy1w+nQQ1c
	+Np9HNd6Xt1C4QmedsKqDduzZY7FiadULEcDjtaWNJEie3UnJ//epMsJ1FDyy7bp6hz76ZGdn4ksc
	UlsgrCCeTk9ZOjQqv7ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFp7c-0000000BCla-1qs0;
	Thu, 23 Apr 2026 08:09:16 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFp7W-0000000BCkM-11xu
	for opensbi@lists.infradead.org;
	Thu, 23 Apr 2026 08:09:14 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-68244d317e5so3777434eaf.0
        for <opensbi@lists.infradead.org>; Thu, 23 Apr 2026 01:09:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776931749; cv=none;
        d=google.com; s=arc-20240605;
        b=dTskcyFmvd1IenHvRjbec2Mu+/zhme3vgbKwuuIXeSf+6bLaNeYnPQXOe9nOfZPPvG
         MOEyy3+b/HlyOwJjqHDd/d5Pe2wdkMpjOWjewM7rzcFmwLw9gpC3FxtwkxkSdAzosnp9
         jdjjr1RbXzlEIKWWAwpATPk6/i460zv9cn+OpBlmmtzN3keAdp73Vvz+/iDapfNpi4yT
         dfb0dhaU/4pxwOjRVNqmUSqNani0uImy8Qcx/fRb7czybl+0mfFuSPdU5kTGgJvWpPsh
         95H9QCO/cJIGLz8GSAMwSegmFiM1zDqsVxfxxhdNlY42iEwOOmxOw3iDBKG9xWrZDBA/
         a4dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EYSsuXlGU97DQcKIQ3CqCoxtVMlX9xU+2tnIEmMvgoM=;
        fh=O40efyWBEIKMrGX5EP6lEoj7qyXUlr/F/9H17wZn3rI=;
        b=DoUP5VNz7mkUDMLuzcLQ9VE6J0EMvn/Yi+8nF7G8mT4sfRcxdVG5+E1Abi0w2VHN7V
         CaNQcZ40g22L6bUEvBOUuj16amTCretXLXnd8KGroFSxCe7ZiuWz3V3yD7cLlJ3T65Tv
         0w1nWB6s2nTh8Atl2nH/1Iuim1N5R3htRZwtHslSODPFxKuSu1WuOq65kzJHFf54MFYN
         NSSia6DrL+ZOx9ZCPcmhvOdLpPgjXguXNX0aV9Co3DBS+2Yck7NA3khREezATkTrSphL
         4emRi90ic391Gq9FjiVPKSqkEnBrCv67wM3YUas5fkZmqAmg/Ch0dr61gEXFXLVTc92i
         agWA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1776931749; x=1777536549; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EYSsuXlGU97DQcKIQ3CqCoxtVMlX9xU+2tnIEmMvgoM=;
        b=yhdk4glOYUGxAr3GsMKJ5qeO9dOGXcsvdA+dJd48TM97Pd572C65iKejdnyiE6ue4v
         b6vOFHZoPEQAPN3OBqTDzLdSKFRYhiCxyS6tKTFoHyUYFn8+rUSFzLV3LpQCOD1y/QC3
         S6/nt7aH62ihOFFm1BRnWZXnLNUvk2zn4YizRJ3cTaNoOnb3+jyVUaWou5MMX1FKdcbO
         AIYvSTxUCpPv+MbY01eo4hqoGVpA078yPhca65wD9OPJQmH87SWAi+HVBKebHa1dIVc3
         V87ymheKegBayaPMlgREHVFWS2xIwt/saER51FlT3HjAT09L6ya2RU047ua2q2kQfAl1
         rcNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776931749; x=1777536549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EYSsuXlGU97DQcKIQ3CqCoxtVMlX9xU+2tnIEmMvgoM=;
        b=WP+s5nLegw8TJZPlDsQRuEMIq3Aj42b4SbBufaENi5TFw4I7PQvOwLGWPUTr9VS8pi
         JfsER/yenSGimuI1bLNIZ8I3dkfdT7IA32K+NxmgkzldxYNPqtMhSndxD7uwMrzpBrJq
         QM/s+xEi2S4fkJIuO46KHudw0KXWD6Q00ggAEHtjVqeb7r/ZdNjE3Fz1g3ZpL+zYwepy
         gHsoDRt38kVcmRvknQvjm4FCEmJoFIRfMbTFAxpeOql5NZ9jysxbo0Jm7EyI3F3qRBWg
         TKG/T90kXgQj2GRbsG85WbW0rzLo41ndLER1U26zSzTA9t/isBBZy4YB81PvvnfQhzwR
         TWMw==
X-Forwarded-Encrypted: i=1; AFNElJ9yUaZrJYOVvFBg0bzs51ZhLIeLQfzyl1EutcmnLMrhKnjds3rv4EYTNkYnQQpau+E56LUNNd1d@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8dThGsXWbQu2i8U9Mf/3ssETrSh4ISlbceq/u3KEJ/70NEhcs
	MUEu47JdokGwSkO0l6irTPqxGj3temfkUohawkOT0l3XVqLLJdJjopBSwRhfBjtw/cfnXYHXzY1
	J6x3kYU8BI9z/cHoiLCigjjpGkRubq7RMCRl8Cs7sqA==
X-Gm-Gg: AeBDiesZYSpU4x6schLnvDA3yI4JbarfzABPt3HmHfV2bJDgPCJxBLzSvOnIV8f5r7b
	ZxNWUau7fTB+0oqHf1aydJXiEPSW4sTs2S7izlmpWJ+3Uwfk6EjdJXZCCv1P3yxkefguAwM2tub
	ZqxJlhGhNRgD/1tjJ1qPE96TR/rRVkZa79kZNQY3HPdsPHLF4sddM/mX+BFD0bDFGdTLhP6Fhda
	g4aYulb4cEsmZIvA8H8Gzv9DiTb0OtSCw2V/NGaX6nUHNnsbkygrcfJBaBsGJo0Pi7XIR4IVXTc
	DjgW0Z5P9uKNcB3OuJ5doSSQvQMSypJWMBi8DkRBvLUZRn0QiRtV9ANO2q8Ku7Pkz263aTM+PAd
	4dQ9PwRruKS7bLNPSCa9pbppwzqGHeWNKGhXX
X-Received: by 2002:a05:6820:2212:b0:696:1262:2ae0 with SMTP id
 006d021491bc7-69612622fdcmr2332949eaf.52.1776931748836; Thu, 23 Apr 2026
 01:09:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260415110002.2610929-1-anup.patel@oss.qualcomm.com> <aenCd32nbvLsxaQc@lima-default>
In-Reply-To: <aenCd32nbvLsxaQc@lima-default>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 23 Apr 2026 13:38:55 +0530
X-Gm-Features: AQROBzAVocB2Br1i87dkbLxc4xQw4hiwR5McxsxtX4LAJlj9IojqhEFMP03u3t0
Message-ID: <CAAhSdy0n6mstxpuLaRM7hBo7JhhOSMdMR=wJsQW6+H8YR4PYww@mail.gmail.com>
Subject: Re: [PATCH 0/3] Timer events for OpenSBI
To: Nicholas Piggin <npiggin@gmail.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Atish Patra <atish.patra@linux.dev>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Samuel Holland <samuel.holland@sifive.com>, 
	opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_010910_546841_641E3BC1 
X-CRM114-Status: GOOD (  12.24  )
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

T24gVGh1LCBBcHIgMjMsIDIwMjYgYXQgMTI6MjfigK9QTSBOaWNob2xhcyBQaWdnaW4gPG5waWdn
aW5AZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgQXByIDE1LCAyMDI2IGF0IDA0OjI5OjU5
UE0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBUaGlzIHNlcmllcyBleHRlbmRzIHRoZSBz
YmlfdGltZXIgZnJhbWV3b3JrIHRvIHN1cHBvcnQKPiA+IHRpbWVyIGV2ZW50cyB1c2FibGUgZnJv
bSBhbnkgcGFydCBvZiBPcGVuU0JJLiBUaGUgcGxhdGZvcm0KPiA+IGRyaXZlcnMgaW4gT3BlblNC
SSBjYW4gdXNlIHRpbWVyIGV2ZW50cyBmb3IgdGltZW91dHMgb3IKPiA+IHBlcmlvZGljIGNoZWNr
cy4KPiA+Cj4gPiBUaGVzZSBwYXRjaGVzIGNhbiBhbHNvIGJlIGZvdW5kIGluIHNiaV90aW1lcl9p
bXBfdjEgYnJhbmNoCj4gPiBhdDogaHR0cHM6Ly9naXRodWIuY29tL2F2cGF0ZWwvb3BlbnNiaS5n
aXQKPgo+IFdoYXQgaXMgeW91ciBtIG1vZGUgdXNlIGNhc2UgZm9yIHRoZXNlLCBJIHdvdWxkIGJl
IGludGVyZXN0ZWQKPiBpbiB0aGUgY29udGV4dCBvZiByZXZpZXdpbmcgaXQuIEdlbmVyYWxseSBJ
IHRob3VnaHQgaXQgbG9va3MKPiBnb29kLgo+CgpXZSBoYXZlIGEgUlBNSSB3YXRjaGRvZyBwcm9w
b3NhbCB1bmRlciBkZXZlbG9wbWVudC4gVGhpcwpzZXJpZXMgd2lsbCBwcm92aWRlIGZvdW5kYXRp
b24gZm9yIHRoZSBQb0Mgd29yayBvZiB0aGUgUlBNSQp3YXRjaGRvZyBwcm9wb3NhbC4gQmFzaWNh
bGx5LCB0aGUgT3BlblNCSSBmaXJtd2FyZSBjYW4gZW11bGF0ZQpSUE1JIHdhdGNoZG9nIG92ZXIg
U0JJIE1QWFkgY2hhbm5lbCBmb3IgdGhlIHN1cGVydmlzb3Igc29mdHdhcmUuClRoaXMgT3BlblNC
SSBjYW4gcHJvdmlkZSBhIHNlcGFyYXRlIHdhdGNoZG9nIGZvciBlYWNoIHN1cGVydmlzb3IKZG9t
YWluLiBJbiBhYnNlbmNlIG9mIEhXIHdhdGNoZG9nIGZvciBNLW1vZGUgZmlybXdhcmUsIHRoZSBQ
dUMKZmlybXdhcmUgY2FuIGFsc28gaW1wbGVtZW50IFJQTUkgd2F0Y2hkb2cgb3ZlciBSUE1JIHNo
YXJlZAptZW1vcnkgdHJhbnNwb3J0LgoKUmVnYXJkcywKQW51cAoKLS0gCm9wZW5zYmkgbWFpbGlu
ZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
