Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2167C3ABC3
	for <opensbi@archiver.kernel.org>; Wed, 14 May 2025 00:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PsYjQeaoExZlu14CTklHi4iAvDjjPwN585d5LOv4uq8=; b=T19TvQO3cvKKpr
	F0A+X8bxm98Cz1PVGXIUo7N2yw82k3HtG268s+xdsAFZwGRU1I2qcC30caRHGGtydsKjm8ECvB6J7
	RCV9PZV3qiNVZ/AO0vcY+1Q/e6PS3nwCfl6pt3+TUNb887txTEH8ed7f7fIpQaDUicyKUh19x/Myi
	hcGGNzSybFGQRcjmM/u4TXIzFtunp6JkJyP9k41MqFrq5/nFdzWyL+K5r3DB2TegQNIxZniEneQVg
	Fp98ILJUxLO2XybHcz4vbBvEb9YJmE1cYCbMJ2mVaishuPgURUajxG3yZXluAHNlhAceDw1axi3u2
	VkawiwPnBu4etL0eCGmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF0Ja-0000000DoEQ-07fe;
	Wed, 14 May 2025 00:49:42 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF0JX-0000000DoE1-2vwU
	for opensbi@lists.infradead.org;
	Wed, 14 May 2025 00:49:41 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3da74959554so17965765ab.2
        for <opensbi@lists.infradead.org>; Tue, 13 May 2025 17:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747183778; x=1747788578; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wIAKKDukSvKzbBkLGeTuLIRL01wB0oEwpUHfvf0X/vU=;
        b=HuyDx+eaOgno8RAaBWADDkQtLau6DbQcUK0jyT8JFF8T5iToURIImF2N5ry7rD5sQd
         PXYC2xo318sXnqxNxe6eB2r/PLeu84nAlHqoZmCeoOJHzxaalgg6yL/kJPC3gPI59wyC
         NO9BCUOTwhh9s1SjaiBkJ8XoqU8U/iciGPiq5pBTrTdFp6VhVk3yVHDLTBs1IdXwnIoq
         eAEiVOrkwODusyae996JFLh2Qxh1q6uqmxM1TfQWgWkM8NpW8j8TMBatqSJeyZoFsc5U
         TBjCGgV2Ix3sbpM4B55FiMpdPnT/LoiV7NBxFwVikHj6UCbzSLuQNuIwtgPWWPkJvxy8
         ZzDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747183778; x=1747788578;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wIAKKDukSvKzbBkLGeTuLIRL01wB0oEwpUHfvf0X/vU=;
        b=lUGptnMvdr948y0SV4s1gvrA+Dldul5XzFoZcw8uGMiv+Wn3N4zn37ymC7dKQa/OAC
         NmfZyPYjt5y6Z22M20qq8yAxRRmDLeAOeTlm4fUKTLWF+8sZYDRsNg4A3gS1d4rsNWXx
         /7vbxS5n3P/X0Whd+cF0L0vNw+QUZ6TWnxXd3tSDT93W2Yw+w0CUXeztCYkZzpqTx1c0
         qJU0fDzVpCeb5cb/ylen6DubyPwns5g3iP+sZgKTKZ6RP2vqu9/Rxv0c3ddp6SB+f7SA
         vqaWfqJI77pkumkXSWskUaMJqSlmPOq/UD0lgiAuEcS0ECXbte6iKGsuNjwXb/dOPq/u
         3Edw==
X-Forwarded-Encrypted: i=1; AJvYcCXIENscb/8LpakWTaIYRsTsuynTNvEjws4cBT7LBB7QAv+SiQtgM68BG/C61fNIhnczMnNj62YB@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0GWkBSQTbErF7THJYe3i8nt82skrTg9q1e28sKM2LJ4NLfqD9
	IPWwn5mhcXvcef4ikDoF197HH8VmoKlU10kzdpO6RJR1pHDhKoDAnrkBusHY2L1kCN9kd6axA1Z
	a
X-Gm-Gg: ASbGncsutF3a+Ijyq3fbP6x7kB625RwcI7at3w6qzVoGIvfPjdHX/L5kH1tGrh+NdNO
	i5y4VKflBY5wLx47mBlGJeVsZ0pHdHRjvwvzZadzWI+WB8iQ5tKM8AnUskHWIm/Bu1G2FKJNwVr
	/LvtZUSwOgg+F1EveR6zbaQ1iBJ3JeLi7+k3HpFTakf0bzZaZu2rWtaAeyGuMSd961OJASLzD6c
	n0i+f+SSDniaXiDJC4Hd7ZED+X8lOqhAwsmu2zbA5VCGu15oOX+S9tTvuN7UX/P8040DhGYlxZS
	3ipVzfvG59wCuzpOoey1jthe4AyzSLOcD14p6UNFMhZQWtU9KV0+umwHxBF934XKQ66AZg==
X-Google-Smtp-Source: AGHT+IFAG/rt0aBpHkJja4ki5qUq6oTdeR8ioJB551yXo0E4tMrjcb7S+/HUacVG2VQpT3j6VdRV/Q==
X-Received: by 2002:a05:6e02:2590:b0:3d4:36da:19a9 with SMTP id e9e14a558f8ab-3db6f7e8751mr18340545ab.15.1747183778110;
        Tue, 13 May 2025 17:49:38 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.10.203])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fa224ddde7sm2400526173.41.2025.05.13.17.49.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 17:49:37 -0700 (PDT)
Message-ID: <893b8c86-ee0d-47ed-b596-dc4278cba2b9@sifive.com>
Date: Tue, 13 May 2025 19:49:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib: sbi: Only enable TM bit in scounteren
To: Jessica Clarke <jrtc27@jrtc27.com>, Atish Patra <atishp@rivosinc.com>
Cc: anup@brainfault.org, opensbi@lists.infradead.org
References: <20250513-fix_scounteren-v1-1-01018e0c0b0a@rivosinc.com>
 <B1E3B737-3E3D-4FCD-ADA1-136F69433F39@jrtc27.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <B1E3B737-3E3D-4FCD-ADA1-136F69433F39@jrtc27.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_174939_756004_C89F36E4 
X-CRM114-Status: GOOD (  24.28  )
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

SGkgSmVzcywKCk9uIDIwMjUtMDUtMTMgNzozNSBQTSwgSmVzc2ljYSBDbGFya2Ugd3JvdGU6Cj4g
T24gMTQgTWF5IDIwMjUsIGF0IDAxOjI1LCBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNv
bT4gd3JvdGU6Cj4gCj4+IFRoZSBTLW1vZGUgc2hvdWxkIGRpc2FibGUgQ3ljbGUgYW5kIGluc3Ry
dWN0aW9uIGNvdW50ZXIgZm9yIHVzZXIgc3BhY2UKPj4gdG8gYXZvaWQgc2lkZSBjaGFubmVsIGF0
dGFja3MuIFRoZSBMaW51eCBrZXJuZWwgYWxyZWFkeSBkb2VzIHRoaXMgc28gdGhhdAo+PiBhbnkg
cmFuZG9tIHVzZXIgc3BhY2UgY29kZSBzaG91bGRuJ3QgYmUgYWJsZSB0byBtb25pdG9yIGN5Y2xl
L2luc3RydWN0aW9uCj4+IHdpdGhvdXQgaGlnaGVyIHByaXZpbGVnZSBtb2RlIGludm9sdmVtZW50
Lgo+Pgo+PiBSZW1vdmUgdGhlIENZL0lSIGJpdHMgaW4gc2NvdW50ZXJuIGluIE9wZW5TQkkuCj4g
Cj4gSXNu4oCZdCB0aGlzIGEgYnJlYWtpbmcgY2hhbmdlPyBTLW1vZGUgT1NlcyB0aGF0IGFyZSBo
YXBweSB0byBhbGxvdwo+IFUtbW9kZSB0byByZWFkIHRoZSBjb3VudGVycyBhcmUgbm93IGJyb2tl
biwgc3VjaCBhcyBGcmVlQlNELiBCQkwgYWx3YXlzCj4gc2V0IHNjb3VudGVyZW4gdG8gYWxsIG9u
ZXMgKHdpdGggYml0cyBhYm92ZSAyIGJlaW5nIHBvaW50bGVzcyB3aXRob3V0Cj4gcHJvZ3JhbW1p
bmcgbWhwbWV2ZW50WCksIGFuZCBPcGVuU0JJIGRpZCB0aGF0IHVudGlsIGl0IHN3aXRjaGVkIHRv
IHRoaXMKPiBiZWhhdmlvdXIgb2YgQ1l8VE18SVIuIFNvIHdoZXRoZXIgb3Igbm90IGl0IHdhcyBl
eHBsaWNpdCBpbiB0aGUKPiBzcGVjaWZpY2F0aW9uIHdoYXQgdGhlc2Ugd2VyZSBpbml0aWFsaXNl
ZCB0bywgUy1tb2RlIE9TZXMgZXhpc3QgdGhhdAo+IGFzc3VtZWQgQ1ksIFRNIGFuZCBJUiBhdCBs
ZWFzdCB3ZXJlIGF2YWlsYWJsZS4gUGxlYXNlIGRvIG5vdCBicmVhawo+IHRoaW5nczsgdHJlYXQg
dGhlIGZpcm13YXJlPC0+Uy1tb2RlIGludGVyZmFjZSBpbiB0aGUgc2FtZSB3YXkgYXMKPiBrZXJu
ZWw8LT51c2Vyc3BhY2UsIGkuZS4gZG9u4oCZdCBicmVhayB1c2Vyc3BhY2UvUy1tb2RlLgo+IAo+
IE9TZXMgdGhhdCB3YW50IHRvIG9wdCBvdXQgY2FuLiBBbmQgaWYgeW91IHJlYWxseSB3YW50IHRv
IHB1c2ggZm9yIHRoaXMsCj4geW91IG5lZWQgdG8gd2FpdCBmb3IgT1NlcyB0byBiZSBjaGFuZ2Vk
IHRvIGV4cGxpY2l0bHkgaW5pdGlhbGlzZQo+IHNjb3VudGVyZW4gYW5kIG9ubHkgZG8gaXQgb25j
ZSBvbGQgdmVyc2lvbnMgYXJlIHN1ZmZpY2llbnRseSByYXJlLiBCdXQKPiB5b3UgY2Fu4oCZdCBq
dXN0IGdvIGRvaW5nIHRoaXMgd2l0aCBubyB3YXJuaW5nIC8gZGVwcmVjYXRpb24gcGVyaW9kLgoK
VGhpcyBzaG91bGRuJ3QgYmUgYSBicmVha2luZyBjaGFuZ2UgZm9yIGFueSBPUyB0aGF0IHN1cHBv
cnRzIFNNUC4gV2hpbGUgdGhlCmFyY2hpdGVjdHVyYWwgc3RhdGUgb2YgdGhlIGJvb3QgaGFydCB1
cG9uIFMtbW9kZSBlbnRyeSBpcyBub3Qgd2VsbCBkZWZpbmVkLCB0aGUKU0JJIEhTTSBzcGVjaWZp
Y2F0aW9uIGV4cGxpY2l0bHkgc3RhdGVzIHRoYXQgIkFsbCBvdGhlciByZWdpc3RlcnMgcmVtYWlu
IGluIGFuCnVuZGVmaW5lZCBzdGF0ZS4iIChUaGlzIHdvcmRpbmcgbmVlZHMgdG8gYmUgbW9kaWZp
ZWQgaW4gU0JJIDMuMCB0byBhY2NvdW50IGZvcgpGV0ZUIGRlZmluaW5nIHRoZSByZXNldCB2YWx1
ZSBvZiBtb3N0IGZlYXR1cmVzLCBidXQgdGhlIHBvaW50IHN0YW5kcy4pIFNvIGl0CndvdWxkIGJl
IGluYXBwcm9wcmlhdGUgZm9yIGFuIE9TIHRvIHJlbHkgb24gdGhlIHByZWV4aXN0aW5nIHNjb3Vu
dGVyZW4gQ1NSIHZhbHVlCm9uIGFueSBzZWNvbmRhcnkgaGFydC4gVGh1cywgYW55IFNNUCBPUyBt
dXN0IGhhdmUgY29kZSB0byBpbml0aWFsaXplIHNjb3VudGVyZW4KYW55d2F5LgoKUmVnYXJkcywK
U2FtdWVsCgo+IE5BSy4KPiAKPiBKZXNzCj4gCj4+IFNpZ25lZC1vZmYtYnk6IEF0aXNoIFBhdHJh
IDxhdGlzaHBAcml2b3NpbmMuY29tPgo+PiAtLS0KPj4gVG86IGFudXAgUGF0ZWwgPGFudXBAYnJh
aW5mYXVsdC5vcmc+Cj4+IENjOiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPj4gLS0tCj4+
IGxpYi9zYmkvc2JpX2hhcnQuYyB8IDQgKystLQo+PiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfaGFy
dC5jIGIvbGliL3NiaS9zYmlfaGFydC5jCj4+IGluZGV4IGZjNDkyNWI1NzYyNS4uMTc3ZjM1NmI3
Yjc3IDEwMDY0NAo+PiAtLS0gYS9saWIvc2JpL3NiaV9oYXJ0LmMKPj4gKysrIGIvbGliL3NiaS9z
YmlfaGFydC5jCj4+IEBAIC00OSwxMCArNDksMTAgQEAgc3RhdGljIHZvaWQgbXN0YXR1c19pbml0
KHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCkKPj4KPj4gY3NyX3dyaXRlKENTUl9NU1RBVFVT
LCBtc3RhdHVzX3ZhbCk7Cj4+Cj4+IC0gLyogRGlzYWJsZSB1c2VyIG1vZGUgdXNhZ2Ugb2YgYWxs
IHBlcmYgY291bnRlcnMgZXhjZXB0IGRlZmF1bHQgb25lcyAoQ1ksIFRNLCBJUikgKi8KPj4gKyAv
KiBEaXNhYmxlIHVzZXIgbW9kZSB1c2FnZSBvZiBhbGwgcGVyZiBjb3VudGVycyBleGNlcHQgVE0g
Ki8KPj4gaWYgKG1pc2FfZXh0ZW5zaW9uKCdTJykgJiYKPj4gICAgc2JpX2hhcnRfcHJpdl92ZXJz
aW9uKHNjcmF0Y2gpID49IFNCSV9IQVJUX1BSSVZfVkVSXzFfMTApCj4+IC0gY3NyX3dyaXRlKENT
Ul9TQ09VTlRFUkVOLCA3KTsKPj4gKyBjc3Jfd3JpdGUoQ1NSX1NDT1VOVEVSRU4sIDB4MDIpOwo+
Pgo+PiAvKioKPj4gKiBPcGVuU0JJIGRvZXNuJ3QgdXNlIGFueSBQTVUgY291bnRlcnMgaW4gTS1t
b2RlLgo+Pgo+PiAtLS0KPj4gYmFzZS1jb21taXQ6IDMxNmRhYWYxYzI5OWMyOWFjNDZlNTIxNDVm
NjU1MjFmNDhlYzYzYjUKPj4gY2hhbmdlLWlkOiAyMDI1MDUxMi1maXhfc2NvdW50ZXJlbi04Yjdi
NjgyYmI4NjQKPj4gLS0KPj4gUmVnYXJkcywKPj4gQXRpc2ggcGF0cmEKPj4KPj4KPj4gLS0gCj4+
IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKPiAKPiAK
CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
