Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38333CD4851
	for <opensbi@archiver.kernel.org>; Wed, 13 May 2026 07:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NAtQUBnC+E5gvHej4ukNvobfmi5RzlIeuL42rgKmCkA=; b=CAKyD9dPTFRdSN
	6aoG1VyxJd1dJQCFz45DM7KRG9npMrdbj8GnuB49pUoCnLq0ZA5+Ip0I2ak3yGcrJaLlq9So3o2BE
	PZ71k8kamrhnhflahlgbf3qNJdca6zMBPA7sCjK1AFaAxX9tErEMBUN5E6I8UuAljJ4MdoieSTlZp
	V0GdAnycot3+IMSgr4gNJmgFmP95GYN4k8crWlvLt88GXC2ub6n37yttfQ/yKSy5C/SrD5TaMAKFG
	sxRcLlMhaaqoL1cdiJh60DOW315ssJUTVN2lJAQf1DWuOZFTA6nGpkrueCADsdoZvUGkiuK/N32yw
	xb1GatdKurBKdQYNB8qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4UC-00000001f8T-4C5Q;
	Wed, 13 May 2026 07:58:33 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4UA-00000001f7b-0lur
	for opensbi@lists.infradead.org;
	Wed, 13 May 2026 07:58:31 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so71760525e9.2
        for <opensbi@lists.infradead.org>; Wed, 13 May 2026 00:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778659108; x=1779263908; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J3l2uyOYLXMM7Rp7NiKSzHS/+N3eL6JXqo4mJDTBBfU=;
        b=l9TQBsbtMxU/CvhsDxMP2qsVWX/7LrvdlwKxuf763GeJyLjJWsRK/pg3d7rr8okvgM
         aV+Rm7czmYSlX8leu6sidVdp1nmYKEoyp6sfGEgITP1Qg22MLKFr59NkZZa/2KsmjW4E
         rDysfPkyttxJhlz37m0yK6AU/lgIFKpFenC6bSd8BB4KHqCooqCbyxRxzjVrtDGeF3sz
         8RdbUgHBW/aLVYJGenXiSY5BFj7qDqx7Z/ZfwPJ2WIsuPPAJ+vUOqfLG3kD5+niNdHuy
         5WL845/Ae6mvpwqxGmYO7vUlh/ybRz/PV8aISiRlJQQmFZu8yMM3+yYXSOjycEbxfRou
         8E0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778659108; x=1779263908;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J3l2uyOYLXMM7Rp7NiKSzHS/+N3eL6JXqo4mJDTBBfU=;
        b=AouubCIX5WxdsGHF7LjEIMByManA7720ZgEKVOv6tuD6wOIt/6v+xO3DxyeFwkjhy+
         UcHLKYWfHiK6AewLJpoveTSTPDAXp3mNYcGW5mUz7dBZa6F0FaFsS3o0jx9IK/PAvd2u
         QsTINmKxT3z2jSg4o06iuLxWj3E5k0/oOmErD35sFmiBKycJFTyko7tQXbWnOKKJrXvt
         A4oQif2vizhAvcoAiphyT3/kM1y1/jYX/0wCMhz0Qk30CgzBNF2gyOViVZZ5Vqg2ATYm
         WRIi+dvLYrAbl71M1pQJ2pe1XMUZdWnfkfLe4s4Ij39+ddaWSeAxMMK1ZG9xBgm2N1l3
         dVEg==
X-Forwarded-Encrypted: i=1; AFNElJ8Go70nkomsKM7ei5Nrmb3jG3C2KFzOeSA9q1jnaNJLA8WOH4wEmCKqoiPZ72OPu8Zou1gSIrfi@lists.infradead.org
X-Gm-Message-State: AOJu0YwPUru6F02ePtCRGjM+OqTq1DFU/wwwoJqmFiUcEY73i7qE2+c/
	G5vGfDYa/VzYdJKlNwxe3I6ujmiLZ+hf6DmaxtqGePT5uSBcLRLVizmqQvmf+ribc9Q=
X-Gm-Gg: Acq92OGIFK+xICRhn49tE/EsFLpRDV0qKNT0UzJx7wL4sZ/3Lc9dxbcFDGiZifzzZGL
	C6k5I9B+MH22KbkNZXAqNM1/6JomHKGLQRtPMPq9Z+sc8MelYjQdzaZD1+sgtvvjI9Aaz7k3PA2
	iNnTloEaH1kvoC3m99Wgoi21sWpiMI3SgQcSVOFVpZC72JtCEISqbqcuwFfGRUpuYNeJCufNT5p
	7g3HVbZgyvAM1O5dnrNZ0yyjOcWWTAmetNMVHncjabUG3ZzotOS080yTLf6Gum7V0oDxngGClzb
	Oj/NvKKg8L9hAyZinv6L993MZR9EUAfo0XuUmBge3nrEDewe4XvXh2D1Y6JU/DfIuGfKyQ/H4WM
	sVc5ZZ87rFQ+s46W6KNdJBFvq9PEUCiR7uiEgJSfMcQeQXwwVT2JrfIpD+5hlg7hbViU2iTFS09
	DoLAiZ21MwRzekaS7pN7rmXdGfOqcm7mXNFFMbXZP4soDXzvPT3/4mxQHwlkrojQ==
X-Received: by 2002:a05:600c:34c9:b0:486:d76c:fa57 with SMTP id 5b1f17b1804b1-48fc9a30d32mr31130595e9.17.1778659108284;
        Wed, 13 May 2026 00:58:28 -0700 (PDT)
Received: from [172.27.130.2] (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fce383209sm30956015e9.12.2026.05.13.00.58.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 00:58:28 -0700 (PDT)
Message-ID: <478b4c36-4c98-4b21-bb08-24deeed077da@riscstar.com>
Date: Wed, 13 May 2026 08:58:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] Add eager FP and RISC-V vector context switching
 support
To: Anup Patel <anup@brainfault.org>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>,
 Anup Patel <anuppate@qti.qualcomm.com>, Scott Bambrough
 <scott@riscstar.com>, Robin Randhawa <robin.randhawa@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Ray Mao <raymond.mao@riscstar.com>, Dhaval <dhaval@rivosinc.com>,
 Peter Lin <peter.lin@sifive.com>, opensbi@lists.infradead.org
References: <20260513071418.50957-1-dave.patel@riscstar.com>
 <CAAhSdy0D6opyLUCpHKg9cOptYgdVgrXbyacMMSHoOKhV7tkSRQ@mail.gmail.com>
Content-Language: en-US
From: Dave Patel <dave.patel@riscstar.com>
In-Reply-To: <CAAhSdy0D6opyLUCpHKg9cOptYgdVgrXbyacMMSHoOKhV7tkSRQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_005830_276329_CF79D29D 
X-CRM114-Status: GOOD (  15.57  )
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

T24gNS8xMy8yNiAwODo0MiwgQW51cCBQYXRlbCB3cm90ZToKPiBPbiBXZWQsIE1heSAxMywgMjAy
NiBhdCAxMjo0NOKAr1BNIDxkYXZlLnBhdGVsQHJpc2NzdGFyLmNvbT4gd3JvdGU6Cj4+Cj4+IEhp
IEFudXAsCj4+ICAgICAgICAgVGhhbmsgeW91IGZvciB0YWtpbmcgb3V0IHRpbWUgYW5kIHJldmll
d2luZyB0aGUgcGF0Y2hlcy4KPj4gRm9sbG93aW5nIHlvdXIgcmV2aWV3IGNvbW1lbnRzLCBJIGhh
dmUgbWFkZSBmb2xsb3dpbmcgY2hhbmdlcy4gQWxzbyBJIGhhdmUKPj4gdGVzdGVkIHRoZSBjaGFu
Z2VzLgo+Pgo+PiBUaGUgY2hhbmdlcyBpbmNsdWRlOgo+PiAgICAgICAgIC0gRHJvcHBpbmcgQ09O
RklHX1NCSV9NQVhfVkxFTkIgYW5kIHNiaV92ZWN0b3JfZG9tYWluX2luaXQoKQo+PiAgICAgICAg
IC0gc3RydWN0IHNiaV92ZWN0b3JfY29udGV4dCB2ZWNfY3R4IGlzIG5vdyBzdHJ1Y3QgKiBpbgo+
PiAgICAgICAgICAgJ3N0cnVjdCBoYXJ0X2NvbnRleHQnCj4+ICAgICAgICAgLSBjaGFuZ2luZyBS
RUFEX0NTUiBhbmQgV1JJVEVfQ1NSIHRvIHZjc3JfcmVhZCBhbmQgdmNzcl93cml0ZQo+IAo+IEkg
dGhpbmsgeW91IG1pc3VuZGVyc3Rvb2QgbXkgcHJldmlvdXMgY29tbWVudC4gV2UgYWxyZWFkeQo+
IGhhdmUgY3NyX3JlYWQoKSBhbmQgY3NyX3dyaXRlKCkgZGVmaW5lZCBpbiByaXNjdl9hc20uaCBz
byB1c2UKPiB0aGVzZSBtYWNyb3MgaW5zdGVhZCBvZiBpbnRyb2R1Y2luZyAgdmNzcl9yZWFkKCkg
YW5kIHZjc3Jfd3JpdGUoKS4KPiAKPj4KPj4gSSBoYXZlIGNvdmVyZWQgYWxsIHlvdXIgY29tbWVu
dHMsIHBsZWFzZSBjYW4geW91IGhhdmUgYSBsb29rIGFuZCBsZXQgbWUga25vdy4KPj4KPiAKPiBS
ZWdhcmRzLAo+IEFudXAKCkhpIEFudXAsCiAgICAgICAgVGhhbmtzLAoKVGhlcmUgaXMgc3VidGxl
IGRpZmZlcmVuY2UgYmV0d2VlbiBjc3JfcmVhZC93cml0ZSBhbmQgdmNzcl9yZWFkL3dyaXRlIGlu
CnRoZSBjb250ZXh0IHRoYXQgdGhpcyBleHBsaWNpdGx5IGVuYWJsZXMgYW5kIGlzb2xhdGVzIHRo
ZSBSSVNDLVYgVmVjdG9yCihWKSBleHRlbnNpb24gZHVyaW5nIGNvbXBpbGF0aW9uLiBUaGlzIGFs
bG93cyB0aGUgcHJvZ3JhbSB0byByZWFkCnZlY3Rvci1zcGVjaWZpYyBDb250cm9sIGFuZCBTdGF0
dXMgUmVnaXN0ZXJzIChzdWNoIGFzIHZsZW5iLCB2bCwgb3IKdnR5cGUpIHdpdGhvdXQgcmVxdWly
aW5nIHRoZSBlbnRpcmUgcHJvamVjdCB0byBiZSBjb21waWxlZCB3aXRoIGdsb2JhbAp2ZWN0b3Ig
c3VwcG9ydC4KClZlY3RvciBBcmNoaXRlY3R1cmUgT3ZlcnJpZGU6IFRoZSBkaXJlY3RpdmUgLm9w
dGlvbiBhcmNoLCArdiBkeW5hbWljYWxseQp0ZWxscyB0aGUgYXNzZW1ibGVyIHRoYXQgdGhlIFZl
Y3RvciBleHRlbnNpb24gaXMgc3VwcG9ydGVkIGZvciB0aGlzCnNwZWNpZmljIGluc3RydWN0aW9u
IGJsb2NrLiBBIHN0YW5kYXJkIGNzcl9yZWFkIGxhY2tzIHRoaXMsIGNhdXNpbmcKY29tcGlsYXRp
b24gdG8gZmFpbCBpZiB2ZWN0b3IgcmVnaXN0ZXJzIGFyZSBhY2Nlc3NlZCB3aXRob3V0IGdsb2Jh
bAotbWFyY2ggdmVjdG9yIGZsYWdzLgpDb250ZXh0IFByb3RlY3Rpb246IFRoZSAub3B0aW9uIHB1
c2ggYW5kIC5vcHRpb24gcG9wIGRpcmVjdGl2ZXMKc2FmZWd1YXJkIHRoZSBidWlsZCBlbnZpcm9u
bWVudC4gVGhleSBzYXZlIHRoZSBvcmlnaW5hbCBjb21waWxlcgpvcHRpb25zLCB0ZW1wb3Jhcmls
eSBpbmplY3QgdGhlIHZlY3RvciBleHRlbnNpb24sIGFuZCBpbW1lZGlhdGVseQpyZXN0b3JlIHRo
ZSBvcmlnaW5hbCBzZXR0aW5ncyBzbyBzdWJzZXF1ZW50IGNvZGUgaXMgdW5hZmZlY3RlZC4KTWVt
b3J5IFNlcmlhbGl6YXRpb246IFRoZSBpbmNsdXNpb24gb2YgdGhlICJtZW1vcnkiIGNsb2JiZXIg
YWN0cyBhcyBhCm9wdGltaXphdGlvbiBiYXJyaWVyLiBJdCBwcmV2ZW50cyB0aGUgY29tcGlsZXIg
ZnJvbSByZW9yZGVyaW5nIG1lbW9yeQpyZWFkcyBvciB3cml0ZXMgYXJvdW5kIHRoZSBDU1Igb3Bl
cmF0aW9uLCB3aGljaCBpcyBjcml0aWNhbCBmb3IgdmVjdG9yCnN0YXRlIHVwZGF0ZXMuCgpTbyBz
aG91bGQgSSB1cGRhdGUgaXQgdG8gbm9ybWFsIGNzcl9yZWFkL3dyaXRlIGluc3RlYWQ/CgpUaGFu
a3MKRGF2ZQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
