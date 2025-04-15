Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E70B9C369B9
	for <opensbi@archiver.kernel.org>; Tue, 15 Apr 2025 05:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RyctCU72CJdRTl5r4dJbun0WWXsnvjX2ljcuCV/fG0k=; b=2sj0qQEyjpILl+
	ExziJTsERDE9XtID2uUk232Zt88m/bVQojusb4r5MLnQc9QpFYcbfYhHAq2bhMKSaMB9wGcH0PH//
	BzolcPVeiFnm3THSsN/0ijLISUEaTdRNbi8nm5rykKm2TzNkO8hhxrPBH0zrSbPLX+0nbDf5vNhJh
	LsaSvi/5rk3n33x21KOXpLFtjDmrkDww/MW8qmPIv7Qo9KSGRSFSY3XQN1w2AaAXEdwm2Uyq1SqWj
	EBp30Ix3+Jwr59pCqk0v1/7v9EyoEXTk77qo364vqDW75tz/KD4eJizr9OC3m8e1j9I0DFd9g84pU
	/jG3pG5SmB8In7ClGq9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ZFZ-00000004bes-2KFi;
	Tue, 15 Apr 2025 05:54:25 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ZF5-00000004baA-2NAE
	for opensbi@lists.infradead.org;
	Tue, 15 Apr 2025 05:53:56 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3d7f111e9e1so33066455ab.1
        for <opensbi@lists.infradead.org>; Mon, 14 Apr 2025 22:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1744696434; x=1745301234; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TbAKZAQ+aSMK3wno9xCrKCiyy3P2RNpSlrZiAP+CAYI=;
        b=A6aBLjuExebAJNdqfgTMHrdj+0StqlkIhcE/OyRyI5iUDCIKpOm2ICERiJtEKNkLTA
         zpmtQuTPk0efcTEr4NsWysdik0fVrMNtVR7guV3z8dvyrEQVEW6qy0fY0CGVKsJydP9X
         lZ/okq7Xf8wxwzvspefPF6f+q52CQdidPYlqJns5Zzleeul8cePUzUQehOoFm87hVygk
         PeGSKUpl3HrhU7ZU7ewLLuWJVIND6POGCxANqqHpLo7hvySAY5YFZfJdJVwcnkqZiWce
         wtHgFKCGbuiyQ2cItcIPJ+5pLw0ha+MTNGaRtM4rDfjQ1tM9M7Bifn7q8ANZ9vjreYeK
         Tchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744696434; x=1745301234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TbAKZAQ+aSMK3wno9xCrKCiyy3P2RNpSlrZiAP+CAYI=;
        b=Nbg1vsk8zi9vQNIlJOhYf0Olj26aQRuPkFOJq/0kHpNlXu23GbXuADxVzwiG0UeTjQ
         HGme5hGms1aP61mLgeGm2erLdqAMDLt4aQigbNkCOv/nDg7jvkC9PKjJftnVxFTRFP7V
         HpkYhzzvzjqYeBUAtXGyevRf9uAIWa/x3Oixg1ORbIlEwgEqcJrdTwIssE86ilMJWUuX
         tKYYi7HicEBG+vqGZyv/pdtD4/s7zBw6RDaygFswFjmbGMoiDQTJzGgz7nDdRxrYNg6x
         I+TbXxR9PNAjOdR0YvU3MUSwbBN8c5bsXhFYGp47QXmax50J+P1bjp9Y/EWV4AaKBDM8
         LgFA==
X-Gm-Message-State: AOJu0YzULtIRpsNvsHjOxqlQCA3eCShoUPUohKtUv4bThpUviC7eN5/3
	eprt36XWHenlGi8wPZVVF8fPoem9Qf0JfHsMeUcTat8oEpmE+yI5DPeQowwEThdtP18k0a2jWYF
	TGWMurpq1oKWxlsie18RUJSvUbO3azvpwXn/uUAxyqXeDpksCcWfWkA==
X-Gm-Gg: ASbGnctRuC4bEp6R4KeM2LbNSkqIKnPFOO8FJDyZIfNQPFGmJiHxx5BtshqK8N+vP1N
	3rzZCM7/vEZ2LF7yMcc4UNt4/1BT+Vu3gg7tKBj34zPHd8DxmLMsHvWoU7QzZprDTMX213r3QCp
	n1/Uy148Fopi/HXCDXu67CbKI=
X-Google-Smtp-Source: AGHT+IETGRcxknLNfXXOUa8J+y7X/hP6e23mbKSOCMqZcFvYy5pc6RAwhNdNYEReBVBDidNx1cyz4OuN3n/csLFSbU4=
X-Received: by 2002:a05:6e02:3a01:b0:3d2:b509:af44 with SMTP id
 e9e14a558f8ab-3d7ec2045a0mr178877635ab.8.1744696434576; Mon, 14 Apr 2025
 22:53:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250319123832.505033-1-wxjstz@126.com>
In-Reply-To: <20250319123832.505033-1-wxjstz@126.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 15 Apr 2025 11:23:42 +0530
X-Gm-Features: ATxdqUEidgYPafBWerFcKgvnl-blE1SgyU0uKxdqGgp9LSlYvwKOUdjddkbI-q0
Message-ID: <CAAhSdy1e8EM5+q582UBDL1r2_gKibJJhDto6taQtYVo7SajDaw@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: Fix SHMEM_PHYS_ADDR for RV64
To: Xiang W <wxjstz@126.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_225355_604711_EB52BEB4 
X-CRM114-Status: GOOD (  14.96  )
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

T24gV2VkLCBNYXIgMTksIDIwMjUgYXQgNjowOOKAr1BNIFhpYW5nIFcgPHd4anN0ekAxMjYuY29t
PiB3cm90ZToKPgo+IE9idGFpbmluZyBhIDY0LWJpdCBhZGRyZXNzIHVuZGVyIHJ2NjQgZG9zZSBu
b3QgcmVxdWlyZSBjb21iaW5pbmcKPiAzMi1iaXQgcmVnaXN0ZXJzCgpGb3IgcnY2NCwgd2UgYXJl
IGFscmVhZHkgaWdub3JpbmcgYWRkcl9oaSBzbyB3ZSBzaG91bGQgc2F5IHRoYXQgZm9yCnJ2MzIg
d2UgZG9uJ3QgbmVlZCB0byBjb21iaW5lIHR3byAzMi1iaXQgcmVnaXN0ZXJzLgoKVGhlIHBhdGNo
IHN1YmplY3QgYW5kIGRlc2NyaXB0aW9uIG5lZWRzIHRvIGJlIGltcHJvdmVkIGFzLXBlciBhYm92
ZS4KSSB3aWxsIHRha2UgY2FyZSBvZiB0aGlzIGF0IHRoZSB0aW1lIG9mIG1lcmdpbmcgdGhpcyBw
YXRjaC4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBYaWFuZyBXIDx3eGpzdHpAMTI2LmNvbT4KPiAtLS0K
PiAgbGliL3NiaS9zYmlfbXB4eS5jIHwgNiAtLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfbXB4eS5jIGIvbGliL3NiaS9z
YmlfbXB4eS5jCj4gaW5kZXggYzVkOWQxYmIuLjBhNGM1MDBlIDEwMDY0NAo+IC0tLSBhL2xpYi9z
Ymkvc2JpX21weHkuYwo+ICsrKyBiL2xpYi9zYmkvc2JpX21weHkuYwo+IEBAIC02NiwxMyArNjYs
NyBAQCBzdGF0aWMgU0JJX0xJU1RfSEVBRChtcHh5X2NoYW5uZWxfbGlzdCk7Cj4gICNkZWZpbmUg
Q0FQX0RJU0FCTEUoX2MsIF9tKSAgICBJTlNFUlRfRklFTEQoX2MsIF9tLCAwKQo+ICAjZGVmaW5l
IENBUF9HRVQoX2MsIF9tKSAgICAgICAgICAgICAgICBFWFRSQUNUX0ZJRUxEKF9jLCBfbSkKPgo+
IC0jaWYgX19yaXNjdl94bGVuID09IDY0Cj4gICNkZWZpbmUgU0hNRU1fUEhZU19BRERSKF9oaSwg
X2xvKSAoX2xvKQo+IC0jZWxpZiBfX3Jpc2N2X3hsZW4gPT0gMzIKPiAtI2RlZmluZSBTSE1FTV9Q
SFlTX0FERFIoX2hpLCBfbG8pICgoKHU2NCkoX2hpKSA8PCAzMikgfCAoX2xvKSkKPiAtI2Vsc2UK
PiAtI2Vycm9yICJVbmRlZmluZWQgWExFTiIKPiAtI2VuZGlmCj4KPiAgLyoqIFBlciBoYXJ0IHNo
YXJlZCBtZW1vcnkgKi8KPiAgc3RydWN0IG1weHlfc2htZW0gewo+IC0tCj4gMi40Ny4yCj4KClJl
dmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKQXBwbGllZCB0aGlz
IHBhdGNoIHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8uCgpUaGFua3MsCkFudXAKCi0tIApvcGVu
c2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
