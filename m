Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 276BECD4F24
	for <opensbi@archiver.kernel.org>; Wed, 13 May 2026 08:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sPKFnNi2ewD8FakXr10XyvizLRRecSkvAhTx75U7pbM=; b=1tCWOZJE7PIWu/
	Fq9i4Ja+ewjVcidV3SPZAqEcwU7mTn9eVRqj6H9SkJtfTW3IofmsvnNxGD79jgvaRy1VxADjyhFs8
	/mfCKVK/M1UxfDnyKXrNMUJXx2IGihnLzidRmWjZa37Xr9BdUQvAPrCUq7JeOPuPVJOJoAkvjQnlr
	XBs4bp/e+Slrc1ems4dj+YWnzM5mo20soaUyLBTBgmQcuMqGxcqEFBCzL5dUnJGkRtxdToyiO8WxF
	+IL2CWIcNjWwTQx4CUsN4w1fyJFjLA4Q6wse78qeNL2b/shssta0XjtCE4MKc69s2TPtJ6ngwuOrz
	GfSBOIkZk4JuhdimSIQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4hQ-00000001hH1-1Xvx;
	Wed, 13 May 2026 08:12:12 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4hO-00000001hFz-16eP
	for opensbi@lists.infradead.org;
	Wed, 13 May 2026 08:12:11 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-43d77f6092eso4020860f8f.2
        for <opensbi@lists.infradead.org>; Wed, 13 May 2026 01:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778659928; x=1779264728; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kEEuqe0Yl1equeowrOfeXwBC743KDaXPuDkuuPXWCkA=;
        b=ykiTf5qyskFLK/3bUtRrZ26jS5aqmO7EH67+lvmqGedKtkB7QXewjuV11QFN6V8ImV
         P6g6f3qbEMwWXEez87EBiosbGpocM6nDRCfYbImT6w2kgMSDkpiXvCc7hvFqgVQp1guV
         pUC4lbAX4y/XEUYqH+VbbJmZOyAT9MbGaursRNsdYcUtlDf6O/tmAIcoS/eywndyB0D1
         CZqEWTgoFxbSiIaI8R+xX5QWe0b4dBVUAfk9FVjxp26aIWM3V001b4jPYpYoJcI3XF1N
         zJZcwm6QnONH6wGKPBjX/61AgVkgFp00LSkELz2+rci1fzINSIdrXvLOY8CoslJnOami
         eVqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778659928; x=1779264728;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kEEuqe0Yl1equeowrOfeXwBC743KDaXPuDkuuPXWCkA=;
        b=OZhCIVcctjiv173I35kZZjY2z0VA3Au0WaZGuNZ1udZ9T7IAaqLtXAbbbRqZdsPLLS
         FHWuASzXikyTTiJyosXvbBaL+SnEB22kCcm2G0KvDA3Qv+VvqYF6VYwT9TCJ/gTQejfU
         CnkIhj2TgeSHxAyxtHhaLGm8KO7/hHD0jZ7Ob33P0ZB0Q3tA9eZ9uB5cmQoXBCj4uxz8
         aKfqCtFxl9/1U4w6f3ABsUjT0GyB29vi0KoppEmWGGvyEvT3UQnpLALcm0SibZYcBDLB
         7hJkhcDdIpIPNbB3GfMbnzs/EewlGoH7h17sGhBu+wFjZrvYx86/aTamzBDLwbILVHzB
         NhRw==
X-Forwarded-Encrypted: i=1; AFNElJ9/w0UbNM0a3gKAOM49xhZslY2Bw88xs0GuCMIywiCtKUuCKkMWzY79GGUrJFG1mUuPuJLoKqm7@lists.infradead.org
X-Gm-Message-State: AOJu0YxmIfYljbZwN4eJAJ0IvW6VvvV6jmA//PDatGtpEcs2EOZKaQDn
	4JQbe3jurq0MahzlD/JRKChuhWc7hYmWgYwX4YjUif2EFmeub4FQhPf3MQg/qjd1mIU=
X-Gm-Gg: Acq92OH8GhJ1MqtFKWyBaYNl92sbVDI4Rn7hrEws6TP+6zsAHOJyD8egk4lVBXQN5Ul
	fDtJwUBHU1Ka2KZm8Kk02oEV+cS5QcjK9dgD5ooxWfTguuz66TDFccG9MLnhDXBSNA6lmGlh3do
	f8jXHmUQsQFVunZPRl4/mLtKRuIzLkoK69ppQ+VokjY/863XcTo9ko5dYzzpJ26iLCfmxv8/tlZ
	P0jkcswZW8hvmMbQCpmUbXtQdMYTS8vW5M6YzYQONSYnrKHDXNhk82r/dJWAq5/1SjR/u1EC4Zt
	VBngWr8hzgwkfCCrBb25lvn0bgLNMcqvlNFZQQOvvvjFTT/7GIE4c5A7OJa9bQQk3KH8GqZuhP+
	SxjfnwtEIhJ28T0n7HzYqjoBapmuo7ScQaE49pJDVoCqbjZwD4XRYihc7g6qf8vBHptEq9TpcG6
	HTVQupTz/OBMM3H2+IV3gZmL8C0YReFw1oWgJKICDw/Q/vMNok0gUb0G19kcKeGA==
X-Received: by 2002:a05:6000:288c:b0:43c:fe66:43ec with SMTP id ffacd0b85a97d-45c584a793bmr3234025f8f.14.1778659928326;
        Wed, 13 May 2026 01:12:08 -0700 (PDT)
Received: from [172.27.130.2] (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491304387sm37622117f8f.21.2026.05.13.01.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 01:12:08 -0700 (PDT)
Message-ID: <0654a207-8bb0-436f-a29c-be8d09fc1862@riscstar.com>
Date: Wed, 13 May 2026 09:12:07 +0100
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
 <478b4c36-4c98-4b21-bb08-24deeed077da@riscstar.com>
 <CAAhSdy0kOnD4x-OjDrrzOUhgmEW4uCxKNTTF5+z95dYpzLFXSw@mail.gmail.com>
Content-Language: en-US
From: Dave Patel <dave.patel@riscstar.com>
In-Reply-To: <CAAhSdy0kOnD4x-OjDrrzOUhgmEW4uCxKNTTF5+z95dYpzLFXSw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_011210_318252_EA25FE71 
X-CRM114-Status: GOOD (  16.96  )
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

T24gNS8xMy8yNiAwOTowNCwgQW51cCBQYXRlbCB3cm90ZToKPiBPbiBXZWQsIE1heSAxMywgMjAy
NiBhdCAxOjI44oCvUE0gRGF2ZSBQYXRlbCA8ZGF2ZS5wYXRlbEByaXNjc3Rhci5jb20+IHdyb3Rl
Ogo+Pgo+PiBPbiA1LzEzLzI2IDA4OjQyLCBBbnVwIFBhdGVsIHdyb3RlOgo+Pj4gT24gV2VkLCBN
YXkgMTMsIDIwMjYgYXQgMTI6NDTigK9QTSA8ZGF2ZS5wYXRlbEByaXNjc3Rhci5jb20+IHdyb3Rl
Ogo+Pj4+Cj4+Pj4gSGkgQW51cCwKPj4+PiAgICAgICAgIFRoYW5rIHlvdSBmb3IgdGFraW5nIG91
dCB0aW1lIGFuZCByZXZpZXdpbmcgdGhlIHBhdGNoZXMuCj4+Pj4gRm9sbG93aW5nIHlvdXIgcmV2
aWV3IGNvbW1lbnRzLCBJIGhhdmUgbWFkZSBmb2xsb3dpbmcgY2hhbmdlcy4gQWxzbyBJIGhhdmUK
Pj4+PiB0ZXN0ZWQgdGhlIGNoYW5nZXMuCj4+Pj4KPj4+PiBUaGUgY2hhbmdlcyBpbmNsdWRlOgo+
Pj4+ICAgICAgICAgLSBEcm9wcGluZyBDT05GSUdfU0JJX01BWF9WTEVOQiBhbmQgc2JpX3ZlY3Rv
cl9kb21haW5faW5pdCgpCj4+Pj4gICAgICAgICAtIHN0cnVjdCBzYmlfdmVjdG9yX2NvbnRleHQg
dmVjX2N0eCBpcyBub3cgc3RydWN0ICogaW4KPj4+PiAgICAgICAgICAgJ3N0cnVjdCBoYXJ0X2Nv
bnRleHQnCj4+Pj4gICAgICAgICAtIGNoYW5naW5nIFJFQURfQ1NSIGFuZCBXUklURV9DU1IgdG8g
dmNzcl9yZWFkIGFuZCB2Y3NyX3dyaXRlCj4+Pgo+Pj4gSSB0aGluayB5b3UgbWlzdW5kZXJzdG9v
ZCBteSBwcmV2aW91cyBjb21tZW50LiBXZSBhbHJlYWR5Cj4+PiBoYXZlIGNzcl9yZWFkKCkgYW5k
IGNzcl93cml0ZSgpIGRlZmluZWQgaW4gcmlzY3ZfYXNtLmggc28gdXNlCj4+PiB0aGVzZSBtYWNy
b3MgaW5zdGVhZCBvZiBpbnRyb2R1Y2luZyAgdmNzcl9yZWFkKCkgYW5kIHZjc3Jfd3JpdGUoKS4K
Pj4+Cj4+Pj4KPj4+PiBJIGhhdmUgY292ZXJlZCBhbGwgeW91ciBjb21tZW50cywgcGxlYXNlIGNh
biB5b3UgaGF2ZSBhIGxvb2sgYW5kIGxldCBtZSBrbm93Lgo+Pj4+Cj4+Pgo+Pj4gUmVnYXJkcywK
Pj4+IEFudXAKPj4KPj4gSGkgQW51cCwKPj4gICAgICAgICBUaGFua3MsCj4+Cj4+IFRoZXJlIGlz
IHN1YnRsZSBkaWZmZXJlbmNlIGJldHdlZW4gY3NyX3JlYWQvd3JpdGUgYW5kIHZjc3JfcmVhZC93
cml0ZSBpbgo+PiB0aGUgY29udGV4dCB0aGF0IHRoaXMgZXhwbGljaXRseSBlbmFibGVzIGFuZCBp
c29sYXRlcyB0aGUgUklTQy1WIFZlY3Rvcgo+PiAoVikgZXh0ZW5zaW9uIGR1cmluZyBjb21waWxh
dGlvbi4gVGhpcyBhbGxvd3MgdGhlIHByb2dyYW0gdG8gcmVhZAo+PiB2ZWN0b3Itc3BlY2lmaWMg
Q29udHJvbCBhbmQgU3RhdHVzIFJlZ2lzdGVycyAoc3VjaCBhcyB2bGVuYiwgdmwsIG9yCj4+IHZ0
eXBlKSB3aXRob3V0IHJlcXVpcmluZyB0aGUgZW50aXJlIHByb2plY3QgdG8gYmUgY29tcGlsZWQg
d2l0aCBnbG9iYWwKPj4gdmVjdG9yIHN1cHBvcnQuCj4gCj4gSSB0b3RhbGx5IGRpc2FncmVlLiBZ
b3VyIHZjc3JfcmVhZCgpIGlzIGV4YWN0bHkgc2FtZSBhcyBjc3JfcmVhZCgpCj4gZXhjZXB0IHRo
YXQgaXQgcmVsaWVzIG9uIGNvbXBpbGVyIG5lbW9taWNzIGluc3RlYWQgb2YgQ1NSIG51bWJlci4K
PiAKPj4KPj4gVmVjdG9yIEFyY2hpdGVjdHVyZSBPdmVycmlkZTogVGhlIGRpcmVjdGl2ZSAub3B0
aW9uIGFyY2gsICt2IGR5bmFtaWNhbGx5Cj4+IHRlbGxzIHRoZSBhc3NlbWJsZXIgdGhhdCB0aGUg
VmVjdG9yIGV4dGVuc2lvbiBpcyBzdXBwb3J0ZWQgZm9yIHRoaXMKPj4gc3BlY2lmaWMgaW5zdHJ1
Y3Rpb24gYmxvY2suIEEgc3RhbmRhcmQgY3NyX3JlYWQgbGFja3MgdGhpcywgY2F1c2luZwo+PiBj
b21waWxhdGlvbiB0byBmYWlsIGlmIHZlY3RvciByZWdpc3RlcnMgYXJlIGFjY2Vzc2VkIHdpdGhv
dXQgZ2xvYmFsCj4+IC1tYXJjaCB2ZWN0b3IgZmxhZ3MuCj4+IENvbnRleHQgUHJvdGVjdGlvbjog
VGhlIC5vcHRpb24gcHVzaCBhbmQgLm9wdGlvbiBwb3AgZGlyZWN0aXZlcwo+PiBzYWZlZ3VhcmQg
dGhlIGJ1aWxkIGVudmlyb25tZW50LiBUaGV5IHNhdmUgdGhlIG9yaWdpbmFsIGNvbXBpbGVyCj4+
IG9wdGlvbnMsIHRlbXBvcmFyaWx5IGluamVjdCB0aGUgdmVjdG9yIGV4dGVuc2lvbiwgYW5kIGlt
bWVkaWF0ZWx5Cj4+IHJlc3RvcmUgdGhlIG9yaWdpbmFsIHNldHRpbmdzIHNvIHN1YnNlcXVlbnQg
Y29kZSBpcyB1bmFmZmVjdGVkLgo+PiBNZW1vcnkgU2VyaWFsaXphdGlvbjogVGhlIGluY2x1c2lv
biBvZiB0aGUgIm1lbW9yeSIgY2xvYmJlciBhY3RzIGFzIGEKPj4gb3B0aW1pemF0aW9uIGJhcnJp
ZXIuIEl0IHByZXZlbnRzIHRoZSBjb21waWxlciBmcm9tIHJlb3JkZXJpbmcgbWVtb3J5Cj4+IHJl
YWRzIG9yIHdyaXRlcyBhcm91bmQgdGhlIENTUiBvcGVyYXRpb24sIHdoaWNoIGlzIGNyaXRpY2Fs
IGZvciB2ZWN0b3IKPj4gc3RhdGUgdXBkYXRlcy4KPj4KPj4gU28gc2hvdWxkIEkgdXBkYXRlIGl0
IHRvIG5vcm1hbCBjc3JfcmVhZC93cml0ZSBpbnN0ZWFkPwo+IAo+IE9sZGVyIHRvb2xjaGFpbnMg
ZG9udCB1bmRlcnN0YW5kIHZlY3RvciBuZW1vbmljcyB0aGF0Cj4gaXMgd2h5IEkgaW5zaXN0IG9u
IHVzaW5nIGNvbW1vbiBjc3JfcmVhZC93cml0ZSgpLgo+IAo+IFJlZ2FyZHMsCj4gQW51cAoKVGhh
bmtzIEFudXAsIHVuZGVyc3Rvb2QgYW5kIHNoYWxsIGFtZW5kIGl0IGFzIHBlciB5b3VyIHN1Z2dl
c3Rpb24gYWJvdmUuCgpUaGFua3MKRGF2ZQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5z
YmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL29wZW5zYmkK
