Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1274CC3ABDD
	for <opensbi@archiver.kernel.org>; Mon, 19 May 2025 12:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4JOZGgtpo2rZnwnmaT3j3Rd8GCKpjLqJGe2C7qv6mGs=; b=20LM0IYT1I606D
	ZnjgXJxhx20cIfYFNtaEjTUQcwUMtcmjWu4YaTLVu/0E5C59nxc+IKSMKrLWmGlIBeni+O+SW2Hvc
	O5EAW11sNJ5M5WYYKQGc1wrCnWQkzJWO5hEJ3NioFvX5EYwKBuHnl8rZfypi1PvnDRw2/TAVuO/dk
	YZ8fKHuvnQGyHZ76LF9sPrthA7k0XmEFIacxWNjBhhMZw1i31GbIUfna1f0AgsJH4oMOL1u1iYR7O
	attB7eqhLSJqvdJ6bOUDzqCpsM4Tc/BCy7DDNA8KOmDpjNiODlIBEHmYvYisHeKabwA9ccuEjFNOc
	Khzk7bTFojfYVstyqunQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzuZ-00000009CS9-0tmy;
	Mon, 19 May 2025 12:48:07 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzlH-00000009B1e-0qKU
	for opensbi@lists.infradead.org;
	Mon, 19 May 2025 12:38:32 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a3758b122cso322965f8f.1
        for <opensbi@lists.infradead.org>; Mon, 19 May 2025 05:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747658310; x=1748263110; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OPCWieRuI3nK+wxEDK/opxaYg4GHjVhukTvvjWymmV0=;
        b=b0QrNCS15y258fvFQCgdM6DppGH7Zf3uXGuDWNQWZDKqXDypjCy7kcinIq+QR25Gno
         m4G9JIDnxek33hK3dVEyquIZgRGF3SzE0/2jCPWYasnnppdgzqIwMRI2PLfUooBJSIRk
         64Cg2ru/puh+dKGOQnPeAr0SIuvjdA6uwROmEvKiFCFsAWXCbabCJysF+1/p9zgSnGgw
         gj+HMqB7FuAVdeSyUQP/uXAD6yp+5C+p3XrffM0O0L+IpbyCACkPOX3lBbgAyM+FsUgi
         2u2DWGf/1wthLkPwezU+X4J663ASO094o5amjdI2cR1zJ++ydOFU4h0r+pSlRJa31S3m
         L1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747658310; x=1748263110;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OPCWieRuI3nK+wxEDK/opxaYg4GHjVhukTvvjWymmV0=;
        b=UvN0rFBuJV+mFkEkwD43zyCFqJS4Ot5+8CUAKpX8LOCcyXTZAv7rC/aVSZM/fEHiqQ
         D5dpyeZDdHEkmCe96LpY65QB+PJm/8sL7bWefF/ELDcNUfLw/4j5YfyAIMnOn/il/+W5
         fRXYSdenUjA3jni55RBjUzJ4ZPIrqy55KlPFf05ml1R/izArliI/RzdwMNg9pI9PnlsA
         FK+ZwTmssUvHkEc2TkEKZA/jIgwCJhYhweU3GLT9mt4vdTrSD1cT4iS9jMpj5WudbDMX
         RV43HrzNGOZmaDdVMZZ21/y3iOQl2pJVuEp5DnUd5klA/bdKJETdjRelplEaROhHr4Al
         AEBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWGMyoKrnp5L6c6Bi9719MjuhOsT8diTcu/Qa7zwEntrHyzwcWi8VqrppRfxiO6hNqV/yq4bwu@lists.infradead.org
X-Gm-Message-State: AOJu0YxbXshYa1/zY2xg332xbuUwNjAtn3Za299hbQtJeDihLcUellNY
	t7WV8127U/b5laDDAL/kXoIPuI6J9rguHtDpIxZCKepGdctrTESc90S+3h9pjgQn/sc=
X-Gm-Gg: ASbGncs0PAf2+tSSS1qZAR/ruYlopq8WZQcS6DrmDcVJwcG3yz+GJMU3mB+qr5Z8tO0
	16A2z7j68aJCfXs/Y1M/zwgtkOOgjktVvOm3OE/i1FUA7zWguiyE/zJwez9Dc5DRfnW6FkPMHTF
	npwnnpjbyWfzb8HfeMFe8PyFp5c6lhj1fnxQ7Q98oNx19irDWzR6hw1n2nyWBndnz6JfNqo+e+N
	CRhyxnjVU5/syxHlN26ABv+TT7WfDfsH9KRHs4USv/eCfljopREoEVfIaBWYTcuqJdvuSf5hPo0
	BrDKxzVCxDNHcqgIveXEycMpQ2nh4yCtSWEKUSqsZYdj2a+zLCK336FZoKzBn2I499+Vb+g4ZA8
	baArhEwyr2yjKJX1F4xfA
X-Google-Smtp-Source: AGHT+IGVEnj1WkB+0c3tdp3NU1Hzp+GD/oTL73uCaNTleZGX6cuddrZ+SQCHrMFzS2QDik8/QbzXQQ==
X-Received: by 2002:a05:6000:40db:b0:3a3:75fa:a0d5 with SMTP id ffacd0b85a97d-3a375faa1a5mr1503090f8f.38.1747658309702;
        Mon, 19 May 2025 05:38:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a03fsm12587505f8f.22.2025.05.19.05.38.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 05:38:29 -0700 (PDT)
Message-ID: <668d4b7f-ef3c-47e9-8e8d-05929d8cf648@rivosinc.com>
Date: Mon, 19 May 2025 14:38:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] include: sbi: Change SBI spec version to 3.0
To: Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 opensbi@lists.infradead.org
References: <20250516122844.113423-1-apatel@ventanamicro.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250516122844.113423-1-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_053831_393826_00225F3F 
X-CRM114-Status: GOOD (  13.02  )
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

CgpPbiAxNi8wNS8yMDI1IDE0OjI4LCBBbnVwIFBhdGVsIHdyb3RlOgo+IE5vdyB0aGF0IFNCSSB2
My4wIHNwZWNpZmljYXRpb24gaXMgZnJvemVuLCBjaGFuZ2UgcnVudGltZSBTQkkgdmVyc2lvbgo+
IGltcGxlbWVudGVkIGJ5IE9wZW5TQkkgdG8gdjMuMC4gQWxzbywgbWFyayBleHRlbnNpb25zIGRl
ZmluZWQgYnkgdGhlCj4gU0JJIHYzLjAgc3BlY2lmaWNhdGlvbiBhcyBub24tZXhwZXJpbWVudGFs
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29t
Pgo+IC0tLQo+ICBpbmNsdWRlL3NiaS9zYmlfZWNhbGwuaCAgfCAyICstCj4gIGxpYi9zYmkvc2Jp
X2VjYWxsX2RidHIuYyB8IDEgLQo+ICBsaWIvc2JpL3NiaV9lY2FsbF9md2Z0LmMgfCAxIC0KPiAg
bGliL3NiaS9zYmlfZWNhbGxfbXB4eS5jIHwgMSAtCj4gIGxpYi9zYmkvc2JpX2VjYWxsX3NzZS5j
ICB8IDEgLQo+ICA1IGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA1IGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3NiaS9zYmlfZWNhbGwuaCBiL2luY2x1ZGUvc2Jp
L3NiaV9lY2FsbC5oCj4gaW5kZXggODhhNjliYjMuLjE1NDAwZTVhIDEwMDY0NAo+IC0tLSBhL2lu
Y2x1ZGUvc2JpL3NiaV9lY2FsbC5oCj4gKysrIGIvaW5jbHVkZS9zYmkvc2JpX2VjYWxsLmgKPiBA
QCAtMTMsNyArMTMsNyBAQAo+ICAjaW5jbHVkZSA8c2JpL3NiaV90eXBlcy5oPgo+ICAjaW5jbHVk
ZSA8c2JpL3NiaV9saXN0Lmg+Cj4gIAo+IC0jZGVmaW5lIFNCSV9FQ0FMTF9WRVJTSU9OX01BSk9S
CQkyCj4gKyNkZWZpbmUgU0JJX0VDQUxMX1ZFUlNJT05fTUFKT1IJCTMKPiAgI2RlZmluZSBTQklf
RUNBTExfVkVSU0lPTl9NSU5PUgkJMAo+ICAjZGVmaW5lIFNCSV9PUEVOU0JJX0lNUElECQkxCj4g
IAo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9lY2FsbF9kYnRyLmMgYi9saWIvc2JpL3NiaV9l
Y2FsbF9kYnRyLmMKPiBpbmRleCBkMjhmZDM5Ni4uOWM0OTZjNDIgMTAwNjQ0Cj4gLS0tIGEvbGli
L3NiaS9zYmlfZWNhbGxfZGJ0ci5jCj4gKysrIGIvbGliL3NiaS9zYmlfZWNhbGxfZGJ0ci5jCj4g
QEAgLTY5LDcgKzY5LDYgQEAgc3RydWN0IHNiaV9lY2FsbF9leHRlbnNpb24gZWNhbGxfZGJ0ciA9
IHsKPiAgCS5uYW1lCQkJPSAiZGJ0ciIsCj4gIAkuZXh0aWRfc3RhcnQJCT0gU0JJX0VYVF9EQlRS
LAo+ICAJLmV4dGlkX2VuZAkJPSBTQklfRVhUX0RCVFIsCj4gLQkuZXhwZXJpbWVudGFsCQk9IHRy
dWUsCj4gIAkuaGFuZGxlCQkJPSBzYmlfZWNhbGxfZGJ0cl9oYW5kbGVyLAo+ICAJLnJlZ2lzdGVy
X2V4dGVuc2lvbnMJPSBzYmlfZWNhbGxfZGJ0cl9yZWdpc3Rlcl9leHRlbnNpb25zLAo+ICB9Owo+
IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9lY2FsbF9md2Z0LmMgYi9saWIvc2JpL3NiaV9lY2Fs
bF9md2Z0LmMKPiBpbmRleCAzNTE5Mjg1ZS4uMjI3NzQwNWUgMTAwNjQ0Cj4gLS0tIGEvbGliL3Ni
aS9zYmlfZWNhbGxfZndmdC5jCj4gKysrIGIvbGliL3NiaS9zYmlfZWNhbGxfZndmdC5jCj4gQEAg
LTQ1LDcgKzQ1LDYgQEAgc3RydWN0IHNiaV9lY2FsbF9leHRlbnNpb24gZWNhbGxfZndmdCA9IHsK
PiAgCS5uYW1lCQkJPSAiZndmdCIsCj4gIAkuZXh0aWRfc3RhcnQJCT0gU0JJX0VYVF9GV0ZULAo+
ICAJLmV4dGlkX2VuZAkJPSBTQklfRVhUX0ZXRlQsCj4gLQkuZXhwZXJpbWVudGFsCQk9IHRydWUs
Cj4gIAkucmVnaXN0ZXJfZXh0ZW5zaW9ucwk9IHNiaV9lY2FsbF9md2Z0X3JlZ2lzdGVyX2V4dGVu
c2lvbnMsCj4gIAkuaGFuZGxlCQkJPSBzYmlfZWNhbGxfZndmdF9oYW5kbGVyLAo+ICB9Owo+IGRp
ZmYgLS1naXQgYS9saWIvc2JpL3NiaV9lY2FsbF9tcHh5LmMgYi9saWIvc2JpL3NiaV9lY2FsbF9t
cHh5LmMKPiBpbmRleCAwM2FjNzFiMi4uMGE1ZTM1MjUgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9z
YmlfZWNhbGxfbXB4eS5jCj4gKysrIGIvbGliL3NiaS9zYmlfZWNhbGxfbXB4eS5jCj4gQEAgLTY3
LDcgKzY3LDYgQEAgc3RydWN0IHNiaV9lY2FsbF9leHRlbnNpb24gZWNhbGxfbXB4eSA9IHsKPiAg
CS5uYW1lCQkJPSAibXB4eSIsCj4gIAkuZXh0aWRfc3RhcnQJCT0gU0JJX0VYVF9NUFhZLAo+ICAJ
LmV4dGlkX2VuZAkJPSBTQklfRVhUX01QWFksCj4gLQkuZXhwZXJpbWVudGFsCQk9IHRydWUsCj4g
IAkucmVnaXN0ZXJfZXh0ZW5zaW9ucwk9IHNiaV9lY2FsbF9tcHh5X3JlZ2lzdGVyX2V4dGVuc2lv
bnMsCj4gIAkuaGFuZGxlCQkJPSBzYmlfZWNhbGxfbXB4eV9oYW5kbGVyLAo+ICB9Owo+IGRpZmYg
LS1naXQgYS9saWIvc2JpL3NiaV9lY2FsbF9zc2UuYyBiL2xpYi9zYmkvc2JpX2VjYWxsX3NzZS5j
Cj4gaW5kZXggMzAzYzBmMmQuLmI3ZGJmMDcyIDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkvc2JpX2Vj
YWxsX3NzZS5jCj4gKysrIGIvbGliL3NiaS9zYmlfZWNhbGxfc3NlLmMKPiBAQCAtNTksNyArNTks
NiBAQCBzdHJ1Y3Qgc2JpX2VjYWxsX2V4dGVuc2lvbiBlY2FsbF9zc2UgPSB7Cj4gIAkubmFtZQkJ
CT0gInNzZSIsCj4gIAkuZXh0aWRfc3RhcnQJCT0gU0JJX0VYVF9TU0UsCj4gIAkuZXh0aWRfZW5k
CQk9IFNCSV9FWFRfU1NFLAo+IC0JLmV4cGVyaW1lbnRhbAkJPSB0cnVlLAo+ICAJLnJlZ2lzdGVy
X2V4dGVuc2lvbnMJPSBzYmlfZWNhbGxfc3NlX3JlZ2lzdGVyX2V4dGVuc2lvbnMsCj4gIAkuaGFu
ZGxlCQkJPSBzYmlfZWNhbGxfc3NlX2hhbmRsZXIsCj4gIH07CgpIaSBBbnVwLAoKUmV2aWV3ZWQt
Ynk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KClRoYW5rcywKCkNsw6lt
ZW50CgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
