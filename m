Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589A2CCF9F0
	for <opensbi@archiver.kernel.org>; Thu, 30 Oct 2025 08:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TZaDmb8G+Meh5/T6F3sG8v8ojJYqGJZtp3Qeogd+V20=; b=1bjG93ey+xMEV7
	b2asZ+vbJsei7AQl7xmoOWpKq75TCUcd0Ihht+0VVzS4JyuRUdwhbJhSM98Wj/UUuA8mDSeBECtfn
	byV8ibYmdSQQBQ06WXWrg8h7aYi3kKhPu6vPiB9CCsWXhinX2cZJ4CIhPHwpUy96Z6nHWGsw9benJ
	QaoZYfzLwvMaaYgya4ApXqMQm4v1dwHtJpIHvf2M0NaKYVchhhWZBeONa7v5VA04eOPMBmza9D4kw
	2qwzB9SznVMjlJTR5y2MIGHNkO5nxgIMqvQ6WOQt0+LwN2KhgDBLN1/2mkpHzM1+Eq22QeurEoTV3
	xMuwe39gZfjwrWH3GBcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vENuE-00000003gSk-2Ghi;
	Thu, 30 Oct 2025 08:21:14 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vENuD-00000003gS9-0TrP
	for opensbi@lists.infradead.org;
	Thu, 30 Oct 2025 08:21:14 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-591c74fd958so780533e87.3
        for <opensbi@lists.infradead.org>; Thu, 30 Oct 2025 01:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1761812468; x=1762417268; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4JJ8XG0diYpJ+aFdNd4QmXyE/+paJFsjcwX93TiCxJU=;
        b=XD7Ff0gAD4/ZTvSgx0WIOGAGUl2ZTudpqJGQ4dBA7tKQnJfR7+8VLBr5Mu0etKjyDn
         Fq5gLYgIzu0OxtTZcpw5als3+uaLMAISbW6jURBPEfPgU5sKTQgLPw6pifCLxKklusNn
         eXSFwEMBwVz+brOpyJMqVdZb0RLeAFeRdvT/vnx+ooOUGN7LqBSHSrvlu9LGje4dPYMB
         6FpsuFRUN4HlPuhCi8CphtMA0HfCqAa/odDV+31SjDEAhQapDtfUVSJFZa20VbKAfvpQ
         kFjATrR6YqcCtmr6xclBIyG5vDEhBhCtlZsXISXANNy0NIOt+1fGrcCeC/IsjeMpJaCB
         GmXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761812468; x=1762417268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4JJ8XG0diYpJ+aFdNd4QmXyE/+paJFsjcwX93TiCxJU=;
        b=Nc0/DLhh1s8dUJwNNukRWURYPG4FtSUgcHRvuxWPtgjtpIvGhIRUVXXnWS3oVZoMIx
         rPapgeWU1beXH7avMpp5LXUwfdFDBANW9dAexR1XwMoNlYz6lfo26qptJpNr3UkQndRU
         IFFa3fblXi2zdxgzpM2yYq5wbUzkqD9WrUOeHKtqyDenVcoqwub11ptPMliPMzUzZ4ni
         gBHUYvjcp1UE/p4VB7nuybDdyo8Yczm2t5QQuLYlscF0Iw+fZRode0sKD8ifDLCwHVL5
         VMjOwFDd2jKkNmQ2n7JobqefuwuYVImyJoUOG2UhIKV95ZP+JGlwVs4y+1gIwT27fcpf
         MiPQ==
X-Gm-Message-State: AOJu0YxUSYlMzwq1WrNuO/q6h2Uci6KlTjQd0yIR69o6Anh+QCS+UVYz
	P7jphtvOa5rS8JJhL2qmPLvot6vFNtm464ehQSpuxZsrGx5MR8YBrMskbQfYinqABJ06Q5+gpC1
	sfslIs4SsxElkIBnJ1GkHBkyEIIqJSVbEJT9OWMw8xvaN/fKCcAHXVES56g==
X-Gm-Gg: ASbGncvQObGb0TqtZXz5aEz/bvhF5QIS1RWGLPHRAjSZc6WhAt5qM9dwMCJ2O31qUWS
	JUYJQWv9D1QhdcgMuXAedof8PSjBIzxSKs5Z8JRLzFueZ8ZZdmsn03wSqwWHEgd4sRKt+K1AqVx
	0za/mkvWZxNhlVdz4kW0kNEziu27tSoW783hSJxzr6jn6zpZVAwhH24ky8lb3pxESQypgMu43ZA
	ddkzmyi/K0mlj7KV5HJI9mQgy+yZokW8ERgGhI4ls8mQaUDnFL3aPCSsLrkiaE=
X-Google-Smtp-Source: AGHT+IGdItYrTqIuIw0l7/RI0WcpPP8M9HyU77ylzkfHR3dWa9sdYzpOjV5Ni4fQ9FFAZVQJXR72CrjepDKQciV/YX0=
X-Received: by 2002:a05:6512:3d91:b0:591:c60d:b838 with SMTP id
 2adb3069b0e04-594128bf4b5mr1861645e87.34.1761812467951; Thu, 30 Oct 2025
 01:21:07 -0700 (PDT)
MIME-Version: 1.0
References: <20251014055330.59506-1-weidong.wd@bytedance.com> <CAHLiX_G1m-9R--j3T0V5zdTmEkCUjaxRCn-cEk-2_ZSeLHA0ZQ@mail.gmail.com>
In-Reply-To: <CAHLiX_G1m-9R--j3T0V5zdTmEkCUjaxRCn-cEk-2_ZSeLHA0ZQ@mail.gmail.com>
From: dong wei <weidong.wd@bytedance.com>
Date: Thu, 30 Oct 2025 16:20:56 +0800
X-Gm-Features: AWmQ_bn5cL_O4DBY3AJFyp7xd8nA-2wtFK75izp0O0yGm4Gil-X_GQddokO6wCU
Message-ID: <CAHLiX_GptyEw9BX8cCC9q-S6jy12gYFWYz8WdN1=w8yf-0BLZQ@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: sse: add local unknown nmi event
To: opensbi@lists.infradead.org
Cc: cuiyunhui@bytedance.com, heshuan@bytedance.com, wangziang.ok@bytedance.com, 
	atishp@rivosinc.com, anup@brainfault.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_012113_175776_B666D8C0 
X-CRM114-Status: GOOD (  18.40  )
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

TWF5IEkgYXNrIGlmIHRoZXJlIGFyZSBhbnkgdXBkYXRlcyB0byB0aGUgY29tbWVudHMgb24gdGhp
cyBwYXRjaD8gVGhlCnVua25vd24gbm1pIGV2ZW50IGhhcyBwcmFjdGljYWwgYXBwbGljYXRpb24g
c2NlbmFyaW9zIGZvciBSSVNDLVYKc2VydmVycy4KCk9uIFdlZCwgT2N0IDE1LCAyMDI1IGF0IDEw
OjE44oCvUE0gZG9uZyB3ZWkgPHdlaWRvbmcud2RAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4KPiBB
ZGQgbW9yZSByZXZpZXdlcnMuCj4KPiBPbiBUdWUsIE9jdCAxNCwgMjAyNSBhdCAxOjU04oCvUE0g
d2VpZG9uZ3dkIDx3ZWlkb25nLndkQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+ID4KPiA+IEFkZCB0
aGUgaWQgb2YgbG9jYWwgdW5rbm93biBubWkgZXZlbnQgYW5kIGFkZCB0aGlzIGV2ZW50IHRvIHRo
ZQo+ID4gbGlzdCBvZiBzdXBwb3J0ZWQgZXZlbnRzLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IHdl
aWRvbmd3ZCA8d2VpZG9uZy53ZEBieXRlZGFuY2UuY29tPgo+ID4gLS0tCj4gPiAgaW5jbHVkZS9z
Ymkvc2JpX2VjYWxsX2ludGVyZmFjZS5oIHwgMyArKy0KPiA+ICBsaWIvc2JpL3NiaV9zc2UuYyAg
ICAgICAgICAgICAgICAgfCA4ICsrKysrKystCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2Jp
L3NiaV9lY2FsbF9pbnRlcmZhY2UuaCBiL2luY2x1ZGUvc2JpL3NiaV9lY2FsbF9pbnRlcmZhY2Uu
aAo+ID4gaW5kZXggYWY3YTA1YS4uOGJiMGQzOSAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvc2Jp
L3NiaV9lY2FsbF9pbnRlcmZhY2UuaAo+ID4gKysrIGIvaW5jbHVkZS9zYmkvc2JpX2VjYWxsX2lu
dGVyZmFjZS5oCj4gPiBAQCAtNDM2LDcgKzQzNiw4IEBAIGVudW0gc2JpX3NzZV9zdGF0ZSB7Cj4g
Pgo+ID4gIC8qIFJhbmdlIDB4ZmZmZjAwMDAgLSAweGZmZmZmZmZmICovCj4gPiAgI2RlZmluZSBT
QklfU1NFX0VWRU5UX0xPQ0FMX1NPRlRXQVJFICAgICAgICAgICAweGZmZmYwMDAwCj4gPiAtI2Rl
ZmluZSBTQklfU1NFX0VWRU5UX0xPQ0FMX1JFU0VSVkVEXzNfU1RBUlQgICAweGZmZmYwMDAxCj4g
PiArI2RlZmluZSBTQklfU1NFX0VWRU5UX0xPQ0FMX1VOS05PV05fTk1JICAgICAgICAgICAgICAg
IDB4ZmZmZjAwMDEKPiA+ICsjZGVmaW5lIFNCSV9TU0VfRVZFTlRfTE9DQUxfUkVTRVJWRURfM19T
VEFSVCAgIDB4ZmZmZjAwMDIKPiA+ICAjZGVmaW5lIFNCSV9TU0VfRVZFTlRfTE9DQUxfUkVTRVJW
RURfM19FTkQgICAgIDB4ZmZmZjNmZmYKPiA+ICAjZGVmaW5lIFNCSV9TU0VfRVZFTlRfTE9DQUxf
UExBVF8zX1NUQVJUICAgICAgIDB4ZmZmZjQwMDAKPiA+ICAjZGVmaW5lIFNCSV9TU0VfRVZFTlRf
TE9DQUxfUExBVF8zX0VORCAgICAgICAgIDB4ZmZmZjdmZmYKPiA+IGRpZmYgLS1naXQgYS9saWIv
c2JpL3NiaV9zc2UuYyBiL2xpYi9zYmkvc2JpX3NzZS5jCj4gPiBpbmRleCA5ODZiNzcwLi5lNzcx
ZWZlIDEwMDY0NAo+ID4gLS0tIGEvbGliL3NiaS9zYmlfc3NlLmMKPiA+ICsrKyBiL2xpYi9zYmkv
c2JpX3NzZS5jCj4gPiBAQCAtMTgyLDkgKzE4MiwxNCBAQCBzdHJ1Y3Qgc3NlX2V2ZW50X2luZm8g
Z2xvYmFsX3NvZnR3YXJlX2V2ZW50ID0gewo+ID4gICAgICAgICBTQklfU0xJU1RfTk9ERV9JTklU
KE5VTEwpLAo+ID4gIH07Cj4gPgo+ID4gK3N0cnVjdCBzc2VfZXZlbnRfaW5mbyBsb2NhbF91bmtu
b3duX25taV9ldmVudCA9IHsKPiA+ICsgICAgICAgLmV2ZW50X2lkID0gU0JJX1NTRV9FVkVOVF9M
T0NBTF9VTktOT1dOX05NSSwKPiA+ICsgICAgICAgU0JJX1NMSVNUX05PREVfSU5JVCgmZ2xvYmFs
X3NvZnR3YXJlX2V2ZW50KSwKPiA+ICt9Owo+ID4gKwo+ID4gIHN0cnVjdCBzc2VfZXZlbnRfaW5m
byBsb2NhbF9zb2Z0d2FyZV9ldmVudCA9IHsKPiA+ICAgICAgICAgLmV2ZW50X2lkID0gU0JJX1NT
RV9FVkVOVF9MT0NBTF9TT0ZUV0FSRSwKPiA+IC0gICAgICAgU0JJX1NMSVNUX05PREVfSU5JVCgm
Z2xvYmFsX3NvZnR3YXJlX2V2ZW50KSwKPiA+ICsgICAgICAgU0JJX1NMSVNUX05PREVfSU5JVCgm
bG9jYWxfdW5rbm93bl9ubWlfZXZlbnQpLAo+ID4gIH07Cj4gPgo+ID4gIHN0YXRpYyBTQklfU0xJ
U1RfSEVBRChzdXBwb3J0ZWRfZXZlbnRzLCBzc2VfZXZlbnRfaW5mbykgPQo+ID4gQEAgLTIwMiw2
ICsyMDcsNyBAQCBzdGF0aWMgY29uc3QgdWludDMyX3Qgc3RhbmRhcmRfZXZlbnRzW10gPSB7Cj4g
PiAgICAgICAgIFNCSV9TU0VfRVZFTlRfTE9DQUxfTE9XX1BSSU9fUkFTLAo+ID4gICAgICAgICBT
QklfU1NFX0VWRU5UX0dMT0JBTF9MT1dfUFJJT19SQVMsCj4gPiAgICAgICAgIFNCSV9TU0VfRVZF
TlRfTE9DQUxfU09GVFdBUkUsCj4gPiArICAgICAgIFNCSV9TU0VfRVZFTlRfTE9DQUxfVU5LTk9X
Tl9OTUksCj4gPiAgICAgICAgIFNCSV9TU0VfRVZFTlRfR0xPQkFMX1NPRlRXQVJFLAo+ID4gIH07
Cj4gPgo+ID4gLS0KPiA+IDIuMjAuMQo+ID4KCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVu
c2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9vcGVuc2JpCg==
