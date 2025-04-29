Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A69BC3ABAB
	for <opensbi@archiver.kernel.org>; Tue, 29 Apr 2025 17:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=azdLGf3/WbTloJsywsaykWIBW8yWSiOgyA9gFELqt7c=; b=w1KSigXJlO1T3F
	yWVKRDoE62GjfrRyDyC/sK3HpY+dV4kYQJ28/R2zY+dEbEr2BE2Sc3y7y72fWBJfwN8lY2qQ6fLkx
	zc6i8j82TwdDqs+9bsBek9MXo4LfTj5Bx5401ykkoFc1esUgqfA+uL8LVneWZ+69+pae7NPANhyUh
	8q0hE0v7b6yExBnYs3aBAb7FcS04/TG2fTj40qO29naMQ9nHOxh3S83eYL3NfJmqbH17nRzF5dJ8k
	JkOYBrhkpKg+TAqTHA74tyLtWJx90D3JnAXXcJSyOpFq4LOaZgM6aT09rskuC3eTyaCa0+U3qT8gk
	SzMlFkYBirhQ/u01fbnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9oKa-0000000ALRX-3Y15;
	Tue, 29 Apr 2025 17:01:16 +0000
Received: from mail-wm1-f53.google.com ([209.85.128.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9lyL-00000009xa8-2No7
	for opensbi@lists.infradead.org;
	Tue, 29 Apr 2025 14:30:10 +0000
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43e9ccaa1ebso7079985e9.1
        for <opensbi@lists.infradead.org>; Tue, 29 Apr 2025 07:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745937008; x=1746541808; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vSZ/UCfWLDTHdxCJuWDAcQuvSM2QKe0IL93PR0q8s4=;
        b=k4LVw3cjeMpqo7E4SqeK99J9auvqdnUXLew+YAqAsC3RZztelAvbi6mPp+yUxPADHi
         bTe3Lb19Cgy7dO7X3zIm5SIxoBfslTixBrHU/nF4pBlMC6D/ZIrbTTWqMycwScW8unGS
         MLQ4BBdhumqhB6iaGheV88+Cr+ZVZLFPI9JlPsF/lF0V56eKxrYSXBTVdjoCuIMhht8f
         7qpfjLJaQJQGiPx9dsltJkrHzr2J/N4/5ozYSPWru26yJ41SdSQzZOxZtmb49Sf00wf0
         Db8A/+xgeOP1DcejkebAN0xFlhL2maETL5jPQbIdJRqj/Zy4ZZzGQAFXHpBS9quGKYjB
         NCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745937008; x=1746541808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6vSZ/UCfWLDTHdxCJuWDAcQuvSM2QKe0IL93PR0q8s4=;
        b=Xe23jfdNYtsJK1wFmGURXn8S7KKhHBu7BDIm45Yw4sWyLhCSC4MRNhv0S+1QgElT7b
         +jgIjm1Cy5fIelviKKQhF3GonCaGlpEl0ZZuBEt57MoZKg+Q3jNq46dKQ3267GpItl0Y
         JEOVj5WEy36f3optgxzZDoHyzNLtmn/YuemeBF3TPpjbVP3An07Ys2wbDYYEA47ZU26I
         PCkqfGIrZJ+UKkBA218bZUyyJi7R1E6ZATMcmR6NZdj84fySc3Tfpp0BUq8oY9wIkKrg
         KsQUuLX+bvrBkA68n5xlkGw3+7CwGW+THfY9zZY+QyHgHT1OhBS7n1lw7ZXvh2bb1TJf
         Pd5A==
X-Gm-Message-State: AOJu0YwQT370YAEvxugRkwmWAEvYr42bnfwwt0STtQqUWpaSZ7qCYgZO
	gzAExjptAZU3B0jJCtEf6nS6/Yny23LlWeAF0kpH6uXwlE4mchxkwS+p0lSWwN27Nzf4o4r54hY
	yLTs=
X-Gm-Gg: ASbGncsAhjUsUN+LBR4uWRHLGf0lOO+V5u740ariOygmfw+CdTI9rrSYm2PYET+7CqR
	kFF5Mc08Myr0upFuRKuoiBsInFDfzts/VbOgHaf6ViYFpukSpLCZbIEtA5mpveM6mdZU68WYiwU
	RO4SaLUJNSTOnM9uVXzUUYlsN293fZBLjPHT3Dbifm70gKyKHXz3+TlmVbZ+dPinDoShrms2kDs
	TbmEVsIi4SPWZ1zzptzbtU3AB1ZVimSEOzfCInb07FyStXuzH0kmxE1NNL+VLh8E3vwlk2Zg0MN
	PsM+yuRZAkmwfYzIbirpUaSBtHLDLdb9yu0Rwl/O/oUSGNKS
X-Google-Smtp-Source: AGHT+IFBVjHKVR8faVGF7I17LI0CIygtExc4rHm1rhJTiOFyIr2Sh72WejUiaS3coILt/gh+9OCcdQ==
X-Received: by 2002:a05:600c:4e52:b0:439:94f8:fc7b with SMTP id 5b1f17b1804b1-441ac7e96famr11400605e9.0.1745937007494;
        Tue, 29 Apr 2025 07:30:07 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:b996:f7e3:35e8:5091])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2d86f7sm188879235e9.32.2025.04.29.07.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 07:30:07 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: opensbi@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>
Subject: [PATCH v2 8/8] lib: sbi_hart: properly reset Ssstateen
Date: Tue, 29 Apr 2025 16:25:50 +0200
Message-ID: <20250429142549.3673976-10-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250429142549.3673976-2-rkrcmar@ventanamicro.com>
References: <20250429142549.3673976-2-rkrcmar@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_073009_605341_C659A47C 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
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

c3N0YXRlZW4qIGFuZCBoc3RhdGVlbiogQ1NScyBtdXN0IGJlIHplcm9lZCBieSBNLW1vZGUgaWYg
dGhlIG1zdGF0ZWVuKgpyZWdpc3RlcnMgYXJlIG1pc3NpbmcsIHRvIGF2b2lkIHNlY3VyaXR5IGlz
c3Vlcy4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgpTaWdu
ZWQtb2ZmLWJ5OiBSYWRpbSBLcsSNbcOhxZkgPHJrcmNtYXJAdmVudGFuYW1pY3JvLmNvbT4KLS0t
CnYyOgoqIFJlbW92ZSBwb2ludGxlc3MgU21zdGF0ZWVuIGNoZWNrLiBbQW51cF0KKiBBZGQgUmV2
aWV3ZWQtYnkgW0FudXBdCi0tLQogbGliL3NiaS9zYmlfaGFydC5jIHwgMTUgKysrKysrKysrKysr
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9saWIvc2JpL3NiaV9oYXJ0LmMgYi9saWIvc2JpL3NiaV9oYXJ0LmMKaW5kZXgg
OGRjNjFkNmZmMjMwLi5mYzQ5MjViNTc2MjUgMTAwNjQ0Ci0tLSBhL2xpYi9zYmkvc2JpX2hhcnQu
YworKysgYi9saWIvc2JpL3NiaV9oYXJ0LmMKQEAgLTExNCwxMiArMTE0LDIxIEBAIHN0YXRpYyB2
b2lkIG1zdGF0dXNfaW5pdChzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gpCiAJCWNzcl93cml0
ZTY0KENTUl9NU1RBVEVFTjEsIFNNU1RBVEVFTl9TVEFURU4pOwogCQljc3Jfd3JpdGU2NChDU1Jf
TVNUQVRFRU4yLCBTTVNUQVRFRU5fU1RBVEVOKTsKIAkJY3NyX3dyaXRlNjQoQ1NSX01TVEFURUVO
MywgU01TVEFURUVOX1NUQVRFTik7CisJfQogCi0JCWlmIChtaXNhX2V4dGVuc2lvbignUycpKQor
CWlmIChzYmlfaGFydF9oYXNfZXh0ZW5zaW9uKHNjcmF0Y2gsIFNCSV9IQVJUX0VYVF9TU1NUQVRF
RU4pKSB7CisJCWlmIChtaXNhX2V4dGVuc2lvbignUycpKSB7CiAJCQljc3Jfd3JpdGUoQ1NSX1NT
VEFURUVOMCwgMCk7Ci0KLQkJaWYgKG1pc2FfZXh0ZW5zaW9uKCdIJykpCisJCQljc3Jfd3JpdGUo
Q1NSX1NTVEFURUVOMSwgMCk7CisJCQljc3Jfd3JpdGUoQ1NSX1NTVEFURUVOMiwgMCk7CisJCQlj
c3Jfd3JpdGUoQ1NSX1NTVEFURUVOMywgMCk7CisJCX0KKwkJaWYgKG1pc2FfZXh0ZW5zaW9uKCdI
JykpIHsKIAkJCWNzcl93cml0ZTY0KENTUl9IU1RBVEVFTjAsICh1aW50NjRfdCkwKTsKKwkJCWNz
cl93cml0ZTY0KENTUl9IU1RBVEVFTjEsICh1aW50NjRfdCkwKTsKKwkJCWNzcl93cml0ZTY0KENT
Ul9IU1RBVEVFTjIsICh1aW50NjRfdCkwKTsKKwkJCWNzcl93cml0ZTY0KENTUl9IU1RBVEVFTjMs
ICh1aW50NjRfdCkwKTsKKwkJfQogCX0KIAogCWlmIChzYmlfaGFydF9wcml2X3ZlcnNpb24oc2Ny
YXRjaCkgPj0gU0JJX0hBUlRfUFJJVl9WRVJfMV8xMikgewotLSAKMi40OC4xCgoKLS0gCm9wZW5z
YmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
