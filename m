Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE7DC636B5
	for <opensbi@archiver.kernel.org>; Mon, 23 Feb 2026 00:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ILaLZqtGfM4uWeojvxKPXfj94/Ruk27mqpiaDdm8tpE=; b=VB8MluiWqoH/56
	JJpbCq3BGA/yO+ou032270ganMgCy338omwsnCh/g4M0ROiklEYDq7eSqW42t4VCYiq8mYLxZdHiR
	mTXb4qi9dtrpv0xcsvdx/cqf2cJtZXr5TV8h9Zw8oEkaAr/IGaonbzmGeYEdNIsZMBtiz+t/Te+mQ
	auohXAv+hGXPmWclpAjkf/mNUaEnTkqn78ugJcMcbLnHCN5jmX62LpwJhn2obocZiW1J0xYBbSryU
	LCWix0RN4FCJtRq06ciib5S6WdjFc3vQdixhm4cjabW69zueUiiQp5+0XJHC1n+cN9Xw2/+ej+ZE8
	+YuBc9BX4iiJwz/iQBOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuJXu-0000000H4S7-16bD;
	Mon, 23 Feb 2026 00:11:30 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuJXr-0000000H4Rh-2Yg6
	for opensbi@lists.infradead.org;
	Mon, 23 Feb 2026 00:11:28 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-48372efa020so29232305e9.2
        for <opensbi@lists.infradead.org>; Sun, 22 Feb 2026 16:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771805485; x=1772410285; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sPPqeAzwYUIhXKOHQXrm8akX6VRIu0NFOosSLErJMfY=;
        b=i1gpoPmdUy/esfkYLecm21/EcdzVVrpMUe79OTpdS2YZJH1Ohctsvhav/9XvU3OGRw
         Lam+GyzrlZj7LhFVzQoEOqKv4Ya1nLDBjGrQCkduoUSbo9f0ZFU+mhU+Iknd+ww0iyPp
         gL3BHJ0ZvwM/5aoyB1g8Fj/EPaa1YP4fZLr/rW9/9hqvkEaNuTADJ+YyRWnuKPUv4+pr
         GtjyyXm3GVQmpkcBh4mQFTS84jbGFUnAAm3xY+dFrQeL88dFGatOicZ8hfZK0ym1GxF+
         YX2l49Ry0usRpGu98Bz/0JuU5dQ7LF39dWGCTm+yiNEcfVg2Zk9H9QCxWlULQkQQGarH
         +G7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771805485; x=1772410285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sPPqeAzwYUIhXKOHQXrm8akX6VRIu0NFOosSLErJMfY=;
        b=HILqXPDr816skfGIZlnM9P6QQ0zgKi67tFwR3/6RCGeZpNz9/3gNTvriE+M9pRzpY7
         lZ1jNWwGmhIeM7//g+Xmxow3dEnMqszE/H9bJm1z2qHo+fJHNBCtMwx4L5Fia2pYZzQk
         Lj6u+yYqonzXzPhRotSg/1BZhbmpmxcFqyfWRs5TN+EykHGCY63ji8/CPUaBq0ssy3cs
         ZZBa+v5Qifz2MUTI+L4XF4pq6sS4dJ3pJTVFwb7fxMD5vsjJOezw4zpzSGV3DHG4XHP0
         wQCBE8rfjkETuo7xw2+R9au4n6//0G1cA+W9DIW3dDJreU4OQ6KjF9w+iaEozFM4iMF7
         A9EQ==
X-Gm-Message-State: AOJu0YyrukW5VlZzuK1Fc5ThAMG6d4TLCOV2s7wtKHnD8/Jb/EE1Jhiu
	2LYNg6LBaRG6roEUOdinWG+Lye225zSA0JVN5TA6dtfCNBOqrWS1rxg3lrsYsw==
X-Gm-Gg: AZuq6aLQZ0XdwllxwJL+o6JC8VF3WJDxGMA8z3sXG+osTspUOFCPadcrqaC/jBFEJHw
	Q7hcwNoThULumSRhvZcMP+ffD1Y4sh+IBwSWbZGlZlnMGGMntZl5rVeTQYOdVC0RBavkFqluaKj
	0z8dZohqi4UGa1kzgiN2TKg96M+NSdguJxDhbVPNCQPvh64qxnsjf25GOkYgRTmSG403f0rhi5V
	JyN+rvfVzksa+qQzU7Y51n8DTtOYad8fXflzcSBPJRK9+1fQZ8s/tHMU23OM9rG40rt9SlyxnpW
	4lUIBc7LJ+4H9C3Jwxxd65M5lrm7Bi3CmiVb0u92SdXvF9K9f6q5bx83y8yoEB3n21AVidr7ns0
	Sm+YCLXhiCVd2dIHOZudLZLYs+3OuYz+QKicbEJQFa2MCKqEERxINUR83YwE4t8mQ8l69Jv/YhN
	gzDnnQhFqeBdElCyjTgUDC0g2Kkd6gqqczh12NZvnOpkKkZLbXxqpXHlOr03IsEj+1XeUyHWVv9
	aD1xis8CpNuxgGn/3FL3f9fjmH4J6WbsJIJ3UwN0H/OHr13lF/ZX3gPd32DZs9TZA==
X-Received: by 2002:a05:600c:820e:b0:482:e5d4:b7ca with SMTP id 5b1f17b1804b1-483a95f7d94mr103341615e9.8.1771805485450;
        Sun, 22 Feb 2026 16:11:25 -0800 (PST)
Received: from marcosthinkpad ([79.116.216.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31f0370sm390475335e9.11.2026.02.22.16.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 16:11:25 -0800 (PST)
From: Marcos Oduardo <marcos.oduardo@gmail.com>
To: opensbi@lists.infradead.org
Cc: Marcos Oduardo <marcos.oduardo@gmail.com>
Subject: [PATCH] lib: sbi: fix undefined behavior in signed shifts in sbi_hart.c, sbi_ecall_interface.h
Date: Mon, 23 Feb 2026 01:11:59 +0100
Message-ID: <20260223001202.284612-1-marcos.oduardo@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_161127_659268_EE1BC2CA 
X-CRM114-Status: GOOD (  13.83  )
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

VUJTYW4gZGV0ZWN0ZWQgdW5kZWZpbmVkIGJlaGF2aW9yIGluIHNiaV9oYXJ0LmMgYW5kIHNiaV9m
d2Z0LmMgKGluIHRoZSBjYXNlCm9mIHNiaV9md2Z0LmMsIHRoZSBidWcgY29tZXMgZnJvbSBhIG1h
Y3JvIGNhbGwgZGVmaW5lZCBhdCBzYmlfZWNhbGxfaW50ZXJmYWNlLmgpCmNhdXNlZCBieSBzaGlm
dGluZyBhIHNpZ25lZCBpbnRlZ2VyIGludG8gdGhlIHNpZ24gYml0ICgxIDw8IDMxKQoKVGhpcyBj
YW4gYmUgZml4ZWQgYnkgdXNpbmcgdGhlIDFVTCBsaXRlcmFsLCBlbnN1cmluZyBkZWZpbmVkIGFy
aXRobWV0aWMuCgpQbGVhc2UgbGV0IG1lIGtub3cgaWYgdGhlcmXigJlzIGFueSBvdGhlciBtb3N0
IHN1aXRhYmxlIHNvbHV0aW9uIGZvciB0aGlzIGJ1Zy4KClNpZ25lZC1vZmYtYnk6IE1hcmNvcyBP
ZHVhcmRvIDxtYXJjb3Mub2R1YXJkb0BnbWFpbC5jb20+Ci0tLQogaW5jbHVkZS9zYmkvc2JpX2Vj
YWxsX2ludGVyZmFjZS5oIHwgMiArLQogbGliL3NiaS9zYmlfaGFydC5jICAgICAgICAgICAgICAg
IHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zYmkvc2JpX2VjYWxsX2ludGVyZmFjZS5oIGIvaW5jbHVk
ZS9zYmkvc2JpX2VjYWxsX2ludGVyZmFjZS5oCmluZGV4IDc2NjI0ZTNmLi45YTc3NmY3OSAxMDA2
NDQKLS0tIGEvaW5jbHVkZS9zYmkvc2JpX2VjYWxsX2ludGVyZmFjZS5oCisrKyBiL2luY2x1ZGUv
c2JpL3NiaV9lY2FsbF9pbnRlcmZhY2UuaApAQCAtMTQ0LDcgKzE0NCw3IEBAIGVudW0gc2JpX2Z3
ZnRfZmVhdHVyZV90IHsKIAlTQklfRldGVF9HTE9CQUxfUExBVEZPUk1fRU5ECQk9IDB4ZmZmZmZm
ZmYsCiB9OwogCi0jZGVmaW5lIFNCSV9GV0ZUX0dMT0JBTF9GRUFUVVJFX0JJVAkJKDEgPDwgMzEp
CisjZGVmaW5lIFNCSV9GV0ZUX0dMT0JBTF9GRUFUVVJFX0JJVAkJKDFVTCA8PCAzMSkKICNkZWZp
bmUgU0JJX0ZXRlRfUExBVEZPUk1fRkVBVFVSRV9CSVQJCSgxIDw8IDMwKQogCiAjZGVmaW5lIFNC
SV9GV0ZUX1NFVF9GTEFHX0xPQ0sJCQkoMSA8PCAwKQpkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlf
aGFydC5jIGIvbGliL3NiaS9zYmlfaGFydC5jCmluZGV4IDYwZTk1YmNhLi45OWUxMzk5MCAxMDA2
NDQKLS0tIGEvbGliL3NiaS9zYmlfaGFydC5jCisrKyBiL2xpYi9zYmkvc2JpX2hhcnQuYwpAQCAt
NzAsNyArNzAsNyBAQCBzdGF0aWMgdm9pZCBtc3RhdHVzX2luaXQoc3RydWN0IHNiaV9zY3JhdGNo
ICpzY3JhdGNoKQogCSAqLwogCW1ocG1ldmVudF9pbml0X3ZhbCB8PSAoTUhQTUVWRU5UX09GIHwg
TUhQTUVWRU5UX01JTkgpOwogCWZvciAoY2lkeCA9IDA7IGNpZHggPD0gMjg7IGNpZHgrKykgewot
CQlpZiAoIShtaHBtX21hc2sgJiAxIDw8IChjaWR4ICsgMykpKQorCQlpZiAoIShtaHBtX21hc2sg
JiAxVUwgPDwgKGNpZHggKyAzKSkpCiAJCQljb250aW51ZTsKICNpZiBfX3Jpc2N2X3hsZW4gPT0g
MzIKIAkJY3NyX3dyaXRlX251bShDU1JfTUhQTUVWRU5UMyArIGNpZHgsCi0tIAoyLjUzLjAKCgot
LSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
