Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCE0105F78C
	for <opensbi@archiver.kernel.org>; Fri, 13 Mar 2026 12:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z+uERmK0gwWRkTXsibt/w/9oqZ+pdOSZpxarpYJQigk=; b=qyzgJDofPAR9wy
	ildByTdJnkHPtmAgfNmjQPINk7Zx8Dw/PQ+FfJW3CvQ0Rs4FLZMASy1+qvPdqFFUUt25gXjQkx0Uo
	IneAWeBqYSEU1I0KbohLC8x7rgDzYVFd/dpgHBzSEFD+eIdErMzTQoLweZVyycBQhnn+NipIm4Edc
	3rmrGUU9ui8XqfAM31sU8BNRAWXSmiSChjxBXUQ4NJdA5cEjf93x1+CHeYRWBZLcthhGOv8exoGFn
	fvAzdME3MD2IwZuwSTbddBgMm0PydNSP37YAhYxBzF+UcrYhjEQQO5F7+hc0Z6mTDek3FGPB2DSIh
	P/orct9Y/UV3cQgb+9tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w11qH-000000008Qf-0z8l;
	Fri, 13 Mar 2026 12:42:13 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w11qE-000000008QK-1MHq
	for opensbi@lists.infradead.org;
	Fri, 13 Mar 2026 12:42:11 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-485392de558so13598615e9.1
        for <opensbi@lists.infradead.org>; Fri, 13 Mar 2026 05:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1773405728; x=1774010528; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9t0XuDHoJqNztYqYoJk/qcAKxp/YN/tLDH6o63EvR2g=;
        b=PDbwD3bHvCoyKN9Tner/WNzjtJSJFmj2bQMXnN1a7gmxjH6sG6smBuuusdI0rA/VHQ
         1d7bomOLsRTzCbbqgE+yXUD9GW4LEXI+6dut0RuvRaj3DukeSczj5smnYd02TEecMtHN
         zyXi5pK5bD7xy1AxF+kmj+91GY1q6qbCKWrWeERgBw+vPEszK6GuuLsnuBuNaaHbZsKK
         xi0D7RAYSiNon1W5RCXB6EAZSDoPC/aZbsYewIaLr4VERuNz+cbemKop9uzzROaORzRf
         Xjwe/lgTX2plUz7wJ4INXZsWjtinPfreAUIpLtAMAvGkWs2l3n+uB4CzZMdPoLiB30Jj
         a2Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773405728; x=1774010528;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9t0XuDHoJqNztYqYoJk/qcAKxp/YN/tLDH6o63EvR2g=;
        b=Zs3mpHrmeAldaPEzzN4Yn1qsXNKPupH9oxXI/Cl5atTctl71M3ntmypNatCE94OB0H
         0LEaZQquuDgOaCCE0VzodJt1qbHK+sBzKHW4YNBzEsXoLh5EBqO5YhVSWwupi5gu/EeQ
         C0H9rYkFjigzvJuS3RwNHAGYoZP9vO96faC1rCBwlDHga93s488scjWRP4/JtPIkwpBc
         4I0m9tH0elJWzFsXm43mVq3PF93R7RtDbMT/LsssqdTIBzi2i/CUuNMx9fAkpCrW2KYG
         Uzf6fZlu6uxs/hQuwhcsNxsVhg0kcbz/im7Mq+F2jk9BdsTM5Gtk8/beruRhUwUlbvHX
         jRqA==
X-Forwarded-Encrypted: i=1; AJvYcCWBc9d+drVSjIbT5PXKhOHTdJnbinvXZNwcgTsC82MWRHu8UFLB2FQhamndzmaj8sSaodd4GmBV@lists.infradead.org
X-Gm-Message-State: AOJu0YwwLe/sqaN0D4C+uzlTthrag/7FbozccB1sfKkbgExo8Rs5Pwvx
	EcZSt/8KIgTodTGbOmHk3qlglP1e/aDMDo1TDqETRauSjCbCLs0wla5r6i5UjXohSJ8=
X-Gm-Gg: ATEYQzzmdJOtkWhLTWaT9b/qqL1lR6Ge0BTuJtZXrsfWeUkSV6pVRaBym4zMUsS1Gba
	p8PNCyCwRY6R2ex1idOO4GmA7CQhxtdB8JMdt4seDWjc7e6khJLJ10kPJsOyjDN5ZZUaJeGQKR/
	Tgwl20ZH4x7Irny9c2Zfk3r3M8mUq46FSqeQoWPdzid6s4eSoEFJbNAjKEqF7LsQh7cpXYB5JVB
	avbvSQly4+Ln3iWUSm5yaFeV+39Gdt7+ldzeXAPMLkr4PpoJIrf/qUL82ECxunkp6QXLdu7m3m1
	lNmVkz/DGBOXsifLsh7bhNyRS+1a3fIl+fcuuuNBOtTvRrsHlBkDNql427k1adlGac2yt2mbJNa
	qDdSnq4sPGBa7RtMADjAldXoq1TmAtanng3pU5560Xauc9lrvvsEvpGLM4jGHc6stJU9JSa3Ojk
	epz55shNM+HUJSbJhUTaidikktqx5bzY6cu7JFp0PGvsqrONsmfV3hpmcqVioSZQ==
X-Received: by 2002:a05:600c:3552:b0:485:3a59:99ca with SMTP id 5b1f17b1804b1-485566fab0bmr46239475e9.16.1773405727969;
        Fri, 13 Mar 2026 05:42:07 -0700 (PDT)
Received: from [172.27.130.2] (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe2273d9sm19661686f8f.34.2026.03.13.05.42.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 05:42:07 -0700 (PDT)
Message-ID: <640d4d44-a110-44a4-9d04-306d31cbb25a@riscstar.com>
Date: Fri, 13 Mar 2026 12:42:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] OpenSBI: Lazy floating-point and vector context switching
To: Anup Patel <anup@brainfault.org>,
 Samuel Holland <samuel.holland@sifive.com>
Cc: Scott Bambrough <scott@riscstar.com>,
 Robin Randhawa <robin.randhawa@sifive.com>,
 Anup Patel <anup.patel@qti.qualcomm.com>, Ray Mao
 <raymond.mao@riscstar.com>, Anup Patel <anuppate@qti.qualcomm.com>,
 Dhaval <dhaval@rivosinc.com>, Peter Lin <peter.lin@sifive.com>,
 Vivian Wang <wangruikang@iscas.ac.cn>, opensbi@lists.infradead.org
References: <20260311171103.70074-1-dave.patel@riscstar.com>
 <1b1d72fb-482f-49db-b41b-53bfef6edb3d@iscas.ac.cn>
 <88dca6b0-46cc-453d-8a5f-00e0c7181550@sifive.com>
 <ec7f6648-c2a7-4250-8079-fb5baefb0bf3@iscas.ac.cn>
 <56c57ce1-5ac4-44b9-81c0-02c6025c4edc@sifive.com>
 <3208508c-cf73-4878-9d87-76d58e821cc4@sifive.com>
 <CAAhSdy1u_10EkrQN7RDCiAcgRVEwYGOkBfNQFg7dDkrqcmRsew@mail.gmail.com>
Content-Language: en-US
From: Dave Patel <dave.patel@riscstar.com>
In-Reply-To: <CAAhSdy1u_10EkrQN7RDCiAcgRVEwYGOkBfNQFg7dDkrqcmRsew@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_054210_651891_FED018FB 
X-CRM114-Status: GOOD (  26.10  )
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

Ck9uIDMvMTMvMjYgMDY6NTksIEFudXAgUGF0ZWwgd3JvdGU6Cj4gT24gRnJpLCBNYXIgMTMsIDIw
MjYgYXQgNjo0M+KAr0FNIFNhbXVlbCBIb2xsYW5kCj4gPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5j
b20+IHdyb3RlOgo+PiBIaSBEYXZlLAo+Pgo+PiBPbiAyMDI2LTAzLTEyIDY6MjMgUE0sIFNhbXVl
bCBIb2xsYW5kIHdyb3RlOgo+Pj4gT24gMjAyNi0wMy0xMiAxMjozMyBQTSwgVml2aWFuIFdhbmcg
d3JvdGU6Cj4+Pj4gT24gMy8xMi8yNiAyMjoxMywgU2FtdWVsIEhvbGxhbmQgd3JvdGU6Cj4+Pj4+
IE9uIDIwMjYtMDMtMTIgNDoxNCBBTSwgVml2aWFuIFdhbmcgd3JvdGU6Cj4+Pj4+PiBPbiAzLzEy
LzI2IDAxOjExLCBkYXZlLnBhdGVsQHJpc2NzdGFyLmNvbSB3cm90ZToKPj4+Pj4+PiBIaSBPcGVu
U0JJIG1haW50YWluZXJzIGFuZCBjb21tdW5pdHksCj4+Pj4+Pj4KPj4+Pj4+PiBJIGFtIHdvcmtp
bmcgb24gYW4gaW1wbGVtZW50YXRpb24gdG8gc3VwcG9ydCBmbG9hdGluZy1wb2ludCAoRlApIGFu
ZAo+Pj4+Pj4+IHZlY3RvciByZWdpc3RlciBjb250ZXh0IG1hbmFnZW1lbnQgZHVyaW5nIGRvbWFp
biBhbmQgYXBwbGljYXRpb24KPj4+Pj4+PiBjb250ZXh0IHN3aXRjaGVzIGluIE9wZW5TQkkuCj4+
Pj4+Pj4KPj4+Pj4+PiBDdXJyZW50bHksIE9wZW5TQkkgc2F2ZXMgYW5kIHJlc3RvcmVzIG9ubHkg
dGhlIGludGVnZXIgcmVnaXN0ZXIKPj4+Pj4+PiBjb250ZXh0IHdoZW4gaGFuZGxpbmcgdHJhcHMg
b3IgZG9tYWluIHRyYW5zaXRpb25zLiBUaGUgRlAgcmVnaXN0ZXJzCj4+Pj4+Pj4gKGYw4oCTZjMx
KSBhbmQgdmVjdG9yIHJlZ2lzdGVycyAodjDigJN2MzEpIGFyZSBub3QgY3VycmVudGx5IG1hbmFn
ZWQgYnkKPj4+Pj4+PiBPcGVuU0JJLgo+Pj4+Pj4+Cj4+Pj4+Pj4gV2l0aCBpbmNyZWFzaW5nIGFk
b3B0aW9uIG9mIHRoZSBSSVNDLVYgdmVjdG9yIGV4dGVuc2lvbiBhbmQKPj4+Pj4+PiBmbG9hdGlu
Zy1wb2ludCB3b3JrbG9hZHMsIGl0IGJlY29tZXMgaW1wb3J0YW50IHRvIGVuc3VyZSBjb3JyZWN0
Cj4+Pj4+Pj4gYmVoYXZpb3Igd2hlbiBTLW1vZGUgc29mdHdhcmUgb3IgdHJ1c3RlZCBhcHBsaWNh
dGlvbnMgdXNlIHRoZXNlCj4+Pj4+Pj4gZXhlY3V0aW9uIHVuaXRzLgo+Pj4+Pj4+Cj4+Pj4+Pj4g
VGhpcyBlbWFpbCBwcm9wb3NlcyBhbiBhcHByb2FjaCB0byBzdXBwb3J0IGxhenkgRlAgYW5kIHZl
Y3Rvcgo+Pj4+Pj4+IGNvbnRleHQgc3dpdGNoaW5nLCBhbGlnbmVkIHdpdGggdGhlIG1lY2hhbmlz
bSBkZXNjcmliZWQgaW4gdGhlCj4+Pj4+Pj4gUklTQy1WIHByaXZpbGVnZWQgc3BlY2lmaWNhdGlv
bi4KPj4+Pj4+Pgo+Pj4+Pj4+IC0tLQo+Pj4+Pj4+Cj4+Pj4+Pj4gIyMgQmFja2dyb3VuZAo+Pj4+
Pj4+Cj4+Pj4+Pj4gSW4gUklTQy1WLCB0aGUgYEZTYCAoRmxvYXRpbmctcG9pbnQgU3RhdGUpIGFu
ZCBgVlNgIChWZWN0b3IgU3RhdGUpCj4+Pj4+Pj4gZmllbGRzIGluIGBtc3RhdHVzYCAvIGBzc3Rh
dHVzYCBjb250cm9sIGFjY2VzcyB0byB0aGUgZmxvYXRpbmctcG9pbnQKPj4+Pj4+PiBhbmQgdmVj
dG9yIHVuaXRzLgo+Pj4+Pj4+Cj4+Pj4+Pj4gV2hlbiB0aGVzZSBmaWVsZHMgYXJlIHNldCB0byBg
T2ZmYCwgYW55IGF0dGVtcHQgdG8gZXhlY3V0ZSBGUCBvcgo+Pj4+Pj4+IHZlY3RvciBpbnN0cnVj
dGlvbnMgcmVzdWx0cyBpbiBhbiBpbGxlZ2FsIGluc3RydWN0aW9uIHRyYXAuCj4+Pj4+Pj4KPj4+
Pj4+PiBUaGlzIG1lY2hhbmlzbSBhbGxvd3Mgb3BlcmF0aW5nIHN5c3RlbXMgYW5kIGZpcm13YXJl
IHRvIGltcGxlbWVudAo+Pj4+Pj4+IGxhenkgY29udGV4dCBzd2l0Y2hpbmcgd2hlcmUgRlAvdmVj
dG9yIHJlZ2lzdGVycyBhcmUgc2F2ZWQgb3IKPj4+Pj4+PiByZXN0b3JlZCBvbmx5IHdoZW4gdGhl
eSBhcmUgYWN0dWFsbHkgdXNlZC4KPj4+Pj4+IFRoaXMgZG9lcyBub3Qgd29yayBpbiBNYWNoaW5l
IG1vZGUsIHdoZXJlIE9wZW5TQkkgcmVzaWRlcy4KPj4+Pj4+Cj4+Pj4+PiBTZWUgcHJpdmlsZWdl
ZCBzcGVjLCBzZWN0aW9uICJFeHRlbnNpb24gQ29udGV4dCBTdGF0dXMgaW4gbXN0YXR1cwo+Pj4+
Pj4gUmVnaXN0ZXIiOiAiTWFjaGluZSBhbmQgU3VwZXJ2aXNvciBtb2RlcyBzaGFyZSBhIHNpbmds
ZSBjb3B5IG9mIHRoZSBGUywKPj4+Pj4+IFZTLCBhbmQgWFMgYml0cy4iCj4+Pj4+Pgo+Pj4+Pj4g
VGhpcyBtZWFucyB0aGF0IGEgU3VwZXJ2aXNvciBtb2RlIHByb2dyYW0gY2FuIHNldCBzc3RhdHVz
LkZTIHRvIERpcnR5LAo+Pj4+Pj4gYWNjZXNzIGZsb2F0aW5nIHBvaW50IHN0YXRlLCBhbmQgc2V0
IHNzdGF0dXMuRlMgYmFjayB0byBPZmYgd2l0aG91dAo+Pj4+Pj4gTWFjaGluZSBtb2RlIHNvZnR3
YXJlIG5vdGljaW5nIGV2ZXIuCj4+Pj4+Pgo+Pj4+Pj4gU2VlIGFsc28gaHR0cHM6Ly9naXRodWIu
Y29tL3Jpc2N2L3Jpc2N2LWlzYS1tYW51YWwvaXNzdWVzLzgzMgo+Pj4+Pj4gIkltcG9zc2libGUg
dG8gaW1wbGVtZW50IEhTLWxldmVsIHNzdGF0dXMue0ZTLFZTfSA9IE9mZiB3aXRoCj4+Pj4+PiBz
b2Z0d2FyZS1lbXVsYXRlZCBoeXBlcnZpc29yIGV4dGVuc2lvbj8iIHdoZXJlIEkgcmFuIGludG8g
dGhlIHNhbWUKPj4+Pj4+IHByb2JsZW0gaW4gYSBkaWZmZXJlbnQgY29udGV4dC4KPj4+Pj4+Cj4+
Pj4+PiBTbyBiYXNpY2FsbHksIGxhenkgc2F2aW5nL3Jlc3RvcmluZyBGIGFuZCBWIGluIE1hY2hp
bmUgbW9kZSB3aXRoCj4+Pj4+PiBtdWx0aXBsZSBTdXBlcnZpc29yIG1vZGUgcHJvZ3JhbXMgaXMg
bm90IGEgZGVzaWduZWQgZmVhdHVyZSwgYW5kIGlzIG5vdAo+Pj4+Pj4gcG9zc2libGUgYXMgdGhl
IHByaXZpbGVnZWQgYXJjaGl0ZWN0dXJlIGlzIGN1cnJlbnRseSBkZXNpZ25lZC4gRm9yIHRoZXNl
Cj4+Pj4+PiB1c2UgY2FzZXMgbm9uLWxhenkgc3dpdGNoaW5nIGlzIHJlcXVpcmVkLgo+Pj4+PiBB
cyB5b3UgbWVudGlvbmVkIGluIGluIHRoYXQgR2l0aHViIGlzc3VlLCBpdCBpcyBhbHNvIHBvc3Np
YmxlIHRvIGZvcmNlCj4+Pj4+IGZsb2F0aW5nLXBvaW50IGluc3RydWN0aW9ucyB0byB0cmFwIGJ5
IGNsZWFyaW5nIG1pc2EuRi4gSG93ZXZlciwgbm90ZSB0aGlzCj4+Pj4+IGNsYXVzZSBpbiB0aGUg
bWlzYSBzcGVjaWZpY2F0aW9uOgo+Pj4+Pgo+Pj4+PiAiV2hlbiBzb2Z0d2FyZSBlbmFibGVzIGFu
IGV4dGVuc2lvbiB0aGF0IHdhcyBwcmV2aW91c2x5IGRpc2FibGVkLCB0aGVuIGFsbCBzdGF0ZQo+
Pj4+PiB1bmlxdWVseSBhc3NvY2lhdGVkIHdpdGggdGhhdCBleHRlbnNpb24gaXMgVU5TUEVDSUZJ
RUQsIHVubGVzcyBvdGhlcndpc2UKPj4+Pj4gc3BlY2lmaWVkIGJ5IHRoYXQgZXh0ZW5zaW9uLiIK
Pj4+Pj4KPj4+Pj4gU28gZmxvYXRpbmctcG9pbnQgc3RhdGUgbXVzdCBhbHdheXMgYmUgc2F2ZWQg
b24gYSBtaXNhLkYgMS0+MCB0cmFuc2l0aW9uIGFuZAo+Pj4+PiByZXN0b3JlZCBvbiBhIG1pc2Eu
RiAwLT4xIHRyYW5zaXRpb24uIFRoaXMgZG9lcyBzb21ld2hhdCByZWR1Y2UgdGhlCj4+Pj4+IGVm
ZmVjdGl2ZW5lc3Mgb2YgdGhlIGxhenkgY29udGV4dCBzYXZpbmcsIGJ1dCBzdGlsbCBwcm92aWRl
cyBzb21lIGJlbmVmaXQuIEFuZAo+Pj4+PiB0aGlzIHNjaGVtZSBncmFjZWZ1bGx5IGRlZ3JhZGVz
IG9uIHN5c3RlbXMgd2hlcmUgbWlzYS5GIGlzIG5vdCB3cml0YWJsZS4gU28KPj4+Pj4gdW5sZXNz
IEkgYW0gbWlzc2luZyBzb21ldGhpbmcsIGhpZGluZyBGUCBzdGF0ZSB1c2luZyBtaXNhIGJpdHMg
c2hvdWxkIHdvcmsgZm9yCj4+Pj4+IHRoZSBjdXJyZW50IHVzZSBjYXNlLgo+Pj4+IEknbSBhIGJp
dCBjb25mdXNlZCBhYm91dCB0aGUgMC0+MSBhbmQgMS0+MCB0cmFuc2l0aW9uIHRlcm1pbm9sb2d5
IGJ1dCBJCj4+Pj4gZ2V0IHRoZSBpZGVhLiBJdCAqd291bGQqIHdvcmssIHllcy4KPj4+IFNvcnJ5
IGZvciB0aGUgY29uZnVzaW9uLiBUbyByZXdvcmQ6IHRoZSBGUCBjb250ZXh0IG11c3QgYmUgc2F2
ZWQgZXZlcnkgdGltZSB0aGUKPj4+IG1pc2EuRiBiaXQgaXMgY2xlYXJlZCAoRi9EL1YgZXh0ZW5z
aW9uIGRpc2FibGVkKSwgYmVjYXVzZSBpdCBtdXN0IGJlIHJlc3RvcmVkCj4+PiBldmVyeSB0aW1l
IHRoZSBtaXNhLkYgYml0IGlzIGxhdGVyIHNldCAoRiBleHRlbnNpb24gZW5hYmxlZCksIGJlY2F1
c2UgdGhlCj4+PiByZWdpc3RlciBzdGF0ZSBpcyBvdGhlcndpc2UgdW5zcGVjaWZpZWQgaW1tZWRp
YXRlbHkgYWZ0ZXIgdGhlIG1pc2EuRiBiaXQgaXMgc2V0Lgo+Pj4KPj4+IFRoaXMgaXMgaW4gY29u
dHJhc3QgdG8gbXN0YXR1cy5GUywgd2hlcmUgeW91IGNhbiBzZXQgdGhlIGZpZWxkIHRvIE9mZiB3
aGlsZSB0aGUKPj4+IEZQIHJlZ2lzdGVycyBob2xkIGRvbWFpbiBBJ3MgY29udGV4dCwgc3dpdGNo
IHRvIGRvbWFpbiBCIGFuZCBiYWNrIHRvIEEsIHRoZW4gc2V0Cj4+PiBtc3RhdHVzLkZTIGJhY2sg
dG8gRGlydHksIGFsbCB3aXRob3V0IGxvc2luZyBhbnkgcmVnaXN0ZXIgc3RhdGUuIFNvIG1pc2Eu
RiBpcwo+Pj4gbm90IGFzIGxhenkgYXMgbXN0YXR1cy5GUy4KPj4+Cj4+Pj4gSXQncyBqdXN0IHRo
YXQgSSBhbSBub3QgYXdhcmUgb2YgYW55IGV4aXN0aW5nIGhhcmR3YXJlIGltcGxlbWVudGF0aW9u
Cj4+Pj4gaGF2aW5nIHdyaXRhYmxlIG1pc2EuRiBhbmQvb3IgbWlzYS5WIChhcyBvcHBvc2VkIHRv
IHhzdGF0dXMue0ZTLFZTfQo+Pj4+IHdoaWNoIGFyZSBtYW5kYXRvcnkgaWYgRiBhbmQgViBhcmUg
aW1wbGVtZW50ZWQsIHJlc3BlY3RpdmVseSksIHNvIEkgZGlkCj4+Pj4gbm90IGNvbnNpZGVyIGl0
Lgo+Pj4+Cj4+Pj4gVG8gbWUsIHdyaXRhYmxlIG1pc2EgaXMgb25lIG9mIHRob3NlIGZ1bm55IGZl
YXR1cmVzIHRoYXQgdGhlIHNwZWMKPj4+PiB0ZWNobmljYWxseSBwZXJtaXRzIGJ1dCBub2JvZHkg
YWN0dWFsbHkgaW1wbGVtZW50cyBpbiBIVy4gSSdtIGhhcHB5IHRvCj4+Pj4gY2hhbmdlIG15IG1p
bmQgYWJvdXQgdGhhdCBpZiBzb21lIHJlYWwgaGFyZHdhcmUgaGFzIHdyaXRhYmxlIG1pc2EuRiBh
bmQKPj4+PiBtaXNhLlYuCj4+PiBUaGF0J3MgZmFpci4gSSBrbm93IGF0IGxlYXN0IG9uZSByZWFs
LWlzaCBpbXBsZW1lbnRhdGlvbiwgUm9ja2V0WzFdLCBoYXMgdGhpcwo+Pj4gY2FwYWJpbGl0eSwg
YnV0IEknbSBhbHNvIHVuYXdhcmUgb2YgYSBwdWJsaWMgY29tbWVyY2lhbCBTb0Mgd2l0aCB0aGlz
IGZlYXR1cmUuCj4+PiBUaGF0IGJlaW5nIHNhaWQsIHNpbmNlIHRoaXMgaXMgdGhlIGV4aXN0aW5n
IGFyY2hpdGVjdHVyYWwgd2F5IHRvIHRyYWNrIEZQIHVzYWdlCj4+PiBmcm9tIE0tbW9kZSAoYWRt
aXR0ZWRseSB3aXRoIHRoZSBhYm92ZSBsaW1pdGF0aW9uKSwgSSB3b3VsZCBleHBlY3QgcHVzaGJh
Y2sgdG8KPj4+IGFkZGluZyBhbnkgZHVwbGljYXRlIG9yIG92ZXJsYXBwaW5nIG1lY2hhbmlzbS4g
U28gd2UgbWlnaHQgc2VlIGltcGxlbWVudGF0aW9ucwo+Pj4gYWRkIHRoaXMgY2FwYWJpbGl0eSBh
cyB0aGV5IHN0YXJ0IHRvIGFkZCBTdXBlcnZpc29yIERvbWFpbnMgZmVhdHVyZXMuCj4+IEkgcmFp
c2VkIHRoaXMgYXQgaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LXNtbXR0L2lzc3Vlcy8y
NjQgYW5kIHRoZQo+PiByZXNwb25zZSBmcm9tIFZlZCB3YXMgIkVuaGFuY2luZyBzdXBwb3J0IGZv
ciBsYXp5IHNhdmUvcmVzdG9yZSBoYXMgYmVlbgo+PiBkaXNjdXNzZWQgcHJldmlvdXNseSBhbmQg
aXMgbm90IGxpa2VseSB0byBiZSBhY2NlcHRlZCIuCj4+Cj4+IFNvIGl0IHNlZW1zIHRoYXQgdGhl
IG9wdGlvbnMgYXJlOgo+PiAxKSBlYWdlciBjb250ZXh0IHN3aXRjaGluZywKPj4gMikgb3B0aW9u
YWxseSB3aXRoIG9wcG9ydHVuaXN0aWMgdXNlIG9mIG1pc2Eue0QsRixWfSBpZiB0aG9zZSBiaXRz
IGFyZSB3cml0YWJsZS4KPiBDdXJyZW50bHksIEkgYW0gbGVhbmluZyB0b3dhcmRzIG9wdGlvbiAj
MSBiZWNhdXNlOgo+ID0+IG1pc2Eue0QsRixWfSBhcmUgbm90IHdyaXRhYmxlIG9uIGFsbCBSSVND
LVYgcGxhdGZvcm1zCj4gPT4gZG9tYWluIGNvbnRleHQgc3dpdGNoaW5nIGlzIGxlc3MgZnJlcXVl
bnQgYW5kIG9uLWRlbWFuZAo+ICAgICAgY29tcGFyZWQgdG8gTGludXggdGFzayBzd2l0Y2hpbmcK
Pgo+IEluIHRoZSBsb25nIHJ1biwgb3B0aW9uICMxIGNhbiBiZSB0aGUgZGVmYXVsdCBhbmQgd2Ug
Y2FuIGRvCj4gb3B0aW9uICMyIHNlbGVjdGl2ZWx5IG9uIHBsYXRmb3JtcyB3aXRoIHdyaXRhYmxl
IG1pc2F7RCxGLFZ9IGJpdHMuCj4KPiBSZWdhcmRzLAo+IEFudXAKClRoYW5rcyBTYW11ZWwsIEFu
dXAgYW5kIFZpdmlhbi4KU2FtdWVsIHRoYW5rcyBmb3IgdGhlIHdpZGVyIGNvbW11bml0eSBkaXNj
dXNzaW9uIGFuZCBjb25maXJtaW5nIGxhenkKc2F2ZS9yZXN0b3JlIHdpbGwgbm90IGJlIGFjY2Vw
dGVkIHNvbHV0aW9uLgoKSSB3aWxsIGxvb2sgYXQgdGhlIG9wdGlvbiAxOiBlYWdlciBjb250ZXh0
IHN3aXRjaGluZwoKUmVnYXJkcywKRGF2ZQoKCgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9w
ZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL29wZW5zYmkK
