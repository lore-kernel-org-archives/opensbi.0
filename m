Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C107C54754
	for <opensbi@archiver.kernel.org>; Mon, 19 May 2025 08:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0rvYGuoENiiQmXYjvQQpDd4MS7TIp941yrpmUA4kC6M=; b=2IQJ2JmGYerc9D
	QiMMqqqOgDoYgnupS918CuZTFK7Ca7voa70JdCSzhVcWI5PWYRpldCd2UK/H8VeIjNRQ83OUeJBHk
	HpgzcZeHIO9L9uHCNdSUMhW4OJw0ZRY0GuHxcxBwqzvr26J5AT8w09AsW6QLSnlKZCCRcB3WWRgB+
	Zkd+uq/rplLnUoGR2QtDSJE27iU0Ow0ecJ2j/47p46PPRfy6LAELlRZjGfjdiu/hTPFRH6h6bc8U7
	ubQHrxScoKSjljeWQpUqacb4YJ0F3RdLPbfW9TbSl2+2OlCx8sf2Xx9ZCPzecQBmpVBpnIa0tlVli
	6hdKiyjk2CJlwh9XejCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGw2e-00000008Nuo-1qZo;
	Mon, 19 May 2025 08:40:12 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGw2b-00000008Nso-1ZLr
	for opensbi@lists.infradead.org;
	Mon, 19 May 2025 08:40:11 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so44852625e9.3
        for <opensbi@lists.infradead.org>; Mon, 19 May 2025 01:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747644007; x=1748248807; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B4GWiyjjuAJy21NdNX//OwZl+T0E+j48G/VrlVS4egI=;
        b=LnszYgWzqYZ+h/1H5WXh5ajLboZr1oI0B5wQAC/8CvlvCrwCM0BEno1XbPd1ZbqiRN
         1eXATlFb3P7wp3teJa9vNNU14N/OBd9wzReIKc3bBTt7d+CGkhjS+ovH+lBBSCt0uIFa
         9ScsJBDbtlOZZcXXgdibL5sk/hnvocqfk8dt/BB5hBYWl9HHbECP6jPye1Ba2rXEj8Xn
         qFkLCmTKFPLqIgVFhyEc8YcvnYmLrrxKPR62fZG9p4cNNWYER4Sq1+Ayc/h++Ou+ciJ6
         mh/crJTvYX0j4QyjfHETT59HeiIN+4a9NqGfo45quHt0Tic4blb2dHdODIilrnZNaBIQ
         3K6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747644007; x=1748248807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B4GWiyjjuAJy21NdNX//OwZl+T0E+j48G/VrlVS4egI=;
        b=Gxj9I5NjuC0n+3HyF4vX/DE55XOvBb9i6fnLE1ljQBQbNq7YE5oLL/D6M1nhNDCZ59
         xCnIeaPizrdw/0kudoC6adzMN3UNgJ57yYiJI/+dn4biVOpHfUW60WTVdW7IfpNQc268
         tDzizUmUtcjyx1sasU64yzHI61x2P7tsCFFGP+cnon+3EnksoLIgXqH2oF35WJ78mE4q
         ICn2e2er0BxhF5+DxRr053KOVCFKXMREUJwzjnq9PQ2YBRcWUj7AgcG2DbMGJU9GGRVe
         v8teh2Ku+M8HbRuH5pomQ7l5QJDeyfqSs4rKKe9XWY7ySRLkYhP3XxMRXskld63qOOKs
         3/Aw==
X-Gm-Message-State: AOJu0YyovmObCKfKY3ji71JUy8W8DA7sVdPiw4K6wIFk5gkJlgW/j3rb
	XHV/KYw9p6d7Qy7De/G0UD2KyBBaNZfwA9MAo3bNakrsGshV421WAlj1UuVkbgcnbnTd0gF6GSV
	kOMDtyzk=
X-Gm-Gg: ASbGnctstAUIBPF6w945yrtrLnqE5GP29FXgctJQazJnhVoZ4nyA5MMbDTKFKCY5KlF
	VDk+y9hygz2hN2Jen9CFDr7ivoUe1SMfxD5YhtoGmnTR+JVo3v8Qpr7ou0HBF0ZF9ZspGDx/QVB
	q7vB356vm3kcEtXLJy637w3v4wJQVnuy5Z7ssWtNAJZ+7cjr3UQDWAXxPCe+AU1m5TbSXBwCH/I
	Z5m8hflTWycYKsfaisDdKrBNF979z5SiAcmCyG3D+FKImmlP0Y0GRV/hZ0Y9YC53K3j6itDpgHo
	5SOzODwAlAo/NuEjYr6PFepo29NpJ/KCjU+O3luuYZoHAfFbpVTn
X-Google-Smtp-Source: AGHT+IGrzSm4CXTNiK+1sjj4GiF/4r9GFOq22tSk4tHu83r7AaqBvOIxcBL9tJyj9jPY4ANHq6Xx5w==
X-Received: by 2002:a05:600c:a012:b0:43c:e70d:44f0 with SMTP id 5b1f17b1804b1-442fd63bfa4mr103124975e9.19.1747644007255;
        Mon, 19 May 2025 01:40:07 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39ef832sm202099905e9.40.2025.05.19.01.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 01:40:06 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: opensbi@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v2 0/2] lib: sbi: pmu: Rework SSE callbacks
Date: Mon, 19 May 2025 10:39:47 +0200
Message-ID: <20250519083950.739044-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_014009_669288_66406BC7 
X-CRM114-Status: UNSURE (   8.20  )
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

V2hpbGUgdGVzdGluZyB0aGUgUE1VIFNTRSBzdXBwb3J0IGluIExpbnV4LCBhIGZldyBwcm9ibGVt
IHdlcmUgc3BvdHRlZC4KVGhlIGZpcnN0IG9uZSB3YXMgZHVlIHRvIGludGVycnVwdHMgaGFwcGlu
ZyBkdXJpbmcgc29tZSBQTVUgY3JpdGljYWwKc2VjdGlvbnMuIEluZGVlZCwgdGhlIFBNVSBjb3Jl
IGFjdHVhbGx5IGRpc2FibGUgaW50ZXJydXB0cyB3aGVuIGVudGVyaW5nCnRoZXNlIHNlY3Rpb25z
LiBIb3dldmVyLCB3aGlsZSB0aGlzIHdvcmtzIHdoZW4gaW50ZXJydXB0cyBhcmUgdGFyZ2V0aW5n
CnRoZSBTLW1vZGUsIHRoaXMgaXMgbm90IHRoZSBjYXNlIHdpdGggU1NFLiBGaXhpbmcgdGhpcyBy
ZXF1aXJlZCB0bwppbXBsZW1lbnQgcG11X2Rpc2FibGUvZW5hYmxlKCkgaW4gTGludXggWzFdLiBU
aGVzZSB0d28gY2FsbGJhY2tzIG5vdwpjYWxsIHNzZV9ldmVudF9kaXNhYmxlL2VuYWJsZSgpIHdo
aWNoIG5vdyBqdXN0IG5lZWRzIHRvIHNldC9jbGVhcgpNSUUvTUlQLiBTZWNvbmQgcHJvYmxlbSB3
YXMgdGhhdCByZXBvcnRlZCBQTVUgZXZlbnRzIGNvdW50IHdlcmUgcXVpdGUKbG93LiBUaGlzIHBy
b3ZlZCB0byBiZSBkdWUgdG8gc29tZSBpbnRlcnJ1cHRzIGJlaW5nIGxvc2VkIHdoZW4KcmVlbmFi
bGluZyBTU0UgZXZlbnQuIFdlIHN0aWxsIG5lZWQgdG8gY2xlYXIgdGhlIHBlbmRpbmcgUE1VIGlu
dGVycnVwdHMKdXBvbiBkaXNhYmxpbmcgb3RoZXJ3aXNlIHdlIG1pZ2h0IGdldCBzb21lIHNwdXJp
b3VzIGludGVycnVwdHMgd2hlbgpyZWVuYWJsaW5nIGl0LgoKTGluazogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtcmlzY3YvMjAyNTA1MTYxNTIzNTUuNTYwNDQ4LTEtY2xlZ2VyQHJpdm9z
aW5jLmNvbS8gWzFdCgpDbMOpbWVudCBMw6lnZXIgKDIpOgogIGxpYjogc2JpOiBwbXU6IEFkZCBT
U0UgcmVnaXN0ZXIvdW5yZWdpc3RlcigpIGNhbGxiYWNrcwogIGxpYjogc2JpOiBwbXU6IFJlbW92
ZSBNSVAgY2xlYXJpbmcgZnJvbSBwbXVfc3NlX2VuYWJsZSgpCgogbGliL3NiaS9zYmlfcG11LmMg
fCAyNSArKysrKysrKysrKysrKysrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0
aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCi0tIAoyLjQ5LjAKCgotLSAKb3BlbnNiaSBtYWlsaW5n
IGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
