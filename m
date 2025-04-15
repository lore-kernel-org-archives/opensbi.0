Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96989C369B5
	for <opensbi@archiver.kernel.org>; Tue, 15 Apr 2025 13:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2JGiv42ZAVDfe7A1SuOPz6V1J3mwYDQZjN6DgYej3jM=; b=o+3EjSHGkXQJ08
	j0otlgunGM0PlO4t/ktAtr9XMbmVI2NOhBYqKt2SBRM2+vcEb4eJ88TpkfCzJ7SzFdXWhkgFBkqlu
	kqeGioCgXPQf+JvyAFZPrZqtdWvLnXfhDwZMKh7cgLU1eLJ3FODpHR0T2hGSvEqE+GJlGnCmKwgnO
	22BlNBXoZzsbM0tFZ5WvRc+SDIB38oItmyqQPBcRVAug2eOpDNNbNdSeARaKYldMLIHUpSnE+ROda
	7kvppc6V3JjMqqdm1H3y06+Ip3XuP75KgMZfuPEeQADMRXyyBWo4sR72K09sHZkT8SzrLEeWFoLf/
	fMThQPL5eKZ/323MR+pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4gMg-00000005upl-38Fx;
	Tue, 15 Apr 2025 13:30:14 +0000
Received: from mail-wm1-f52.google.com ([209.85.128.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4gCu-00000005t82-3bzC
	for opensbi@lists.infradead.org;
	Tue, 15 Apr 2025 13:20:10 +0000
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cee550af2so5551945e9.1
        for <opensbi@lists.infradead.org>; Tue, 15 Apr 2025 06:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1744723207; x=1745328007; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Spo9jeQ/+jcIhHus2nnnRzhOsKnCYeTNz8pLEYMdNbE=;
        b=AKux4n7uxutWojEyMz7hDWB/PD4lZ2UYSEI6HEdyOsFXEZ47UrOPyAzxUJv8vMQwHT
         uX1HYdm77/vSMhjbJ4gnftNXzmca3c6oqpP+xXOywQgYZVL0scUFO1Z+u4qwdu7/6lUO
         p9AW+XcNdNiLo+7HoYXgdJBFsBgnZFYohx/QmF3vlzykkcqvE+3fLlHhGkUIEnWLUj+Y
         RMXNstFGRQJPNKam/hRDRsbhZVCD1Vgb9RWcaaS40OFmWdjkDewtk+Rv4AE1hhxMiipk
         E1mwEkT90SIh3K3d2BoBIbUgMtSXQ/fcnU5MtqELUfjDDoeoluhezU5aE6JycKh6IKxb
         Lx4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744723207; x=1745328007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Spo9jeQ/+jcIhHus2nnnRzhOsKnCYeTNz8pLEYMdNbE=;
        b=Z7IS0dcqgh5zocskk8ZLzlj2G/arI4lEuiS1ztE2wlzftVtRNo/YalMAha+GDxI9sf
         q8q2v/WKdOweKnGNuOt5a5WhGeI8DbSc4/9khf/lcP5tgxg9ROIfYapFERfWqmpNQj4h
         H7dkN1r4Zqa8kpcgL5EOQGQ/rSklKNuUUA+6tl1s6DxbiKIhyys59uTgT/winaOTnCxy
         lU/r4lvbp355J1iezPTFfPm3n3UTQ8fZtbRzst3K0Sc/OoYSpZkF1itXBykc7Ekaf7lS
         +34LNU1ZfaPPX+B8+PqxJITb8JexEPCmdnjOcncJZRSICm/G9Ip1TCXCB+femDMAaHdl
         XDMA==
X-Gm-Message-State: AOJu0YxqHH063FLA6BBLRI9aoDjhcLfK5nhCCPXbkWi9QTAXpdN7MkeU
	NtolC90hzGuCHa9Itb9olJYbsoZSIzLPmxk3eJydQih6d6xM2Z+oKCxqapi4Eqz+asp6xp1VIdk
	Yves=
X-Gm-Gg: ASbGncsxQ3PCzzTBRre27GvOScKg87tcHFqcULpDfNwP+b2pZoy+cvu2jB4V6v3REZ1
	DwlrzXLOfJ5qoD/qWCJg1/xiubUHQE7Gqm82JXfnUWQDS5BR+KrMGdJrYlqseLqPjgr8DF31X0n
	pFBGjqZ/cI9GHpsdoVQixYltQZQk2XgBZEpM9DLl9PTogYZAs1D6M91+bQo0V/Xae5/+7yiJ44/
	JAmADrLzm/VsSrDWzRqckYxNovs+dTlUs7YDzAo7z8hiAEYL2EmnHjlQ59ECbSNF+S2LPczx3Rg
	9X0fWY8RNg/FgOW0xKIcu1J9f7iTcsOpKw5fN0Q9nWeC15Fc
X-Google-Smtp-Source: AGHT+IGh1a36veJdJt5/cOGjYNgR7ET4VMzH4kkZN1n7w1GkgH1xwvs+Ho9OouN/qNzhuz8h+WBY/A==
X-Received: by 2002:a05:600c:35cc:b0:43d:77c5:9c0e with SMTP id 5b1f17b1804b1-43f3a922179mr50346135e9.1.1744723206573;
        Tue, 15 Apr 2025 06:20:06 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:c67a:74e3:4d6f:be48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4403605892fsm11396685e9.2.2025.04.15.06.20.06
        for <opensbi@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:20:06 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: opensbi@lists.infradead.org
Subject: [PATCH 3/8] lib: sbi_hart: reset hstatus
Date: Tue, 15 Apr 2025 15:19:04 +0200
Message-ID: <20250415131908.2699782-5-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250415131908.2699782-2-rkrcmar@ventanamicro.com>
References: <20250415131908.2699782-2-rkrcmar@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_062008_896597_34F168A8 
X-CRM114-Status: UNSURE (   9.62  )
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

aHN0YXR1cy5IVSBtdXN0IGJlIGNsZWFyZWQsIGJlY2F1c2UgVS1tb2RlIGNvdWxkIG90aGVyd2lz
ZSB1c2UgdGhlCkhMUy9IU1YgaW5zdHJ1Y3Rpb25zLiAgVGhpcyB3b3VsZCBhbGxvdyBVLW1vZGUg
dG8gcmVhZCBwaHlzaWNhbCBtZW1vcnkKZGlyZWN0bHkgaWYgdmdhdHAgYW5kIHZzYXRwIHdhcyAw
LgoKVGhlIHJlbWFpbmluZyBmaWVsZHMgZG9uJ3Qgc2VlbSBsaWtlIGEgc2VjdXJpdHkgdnVsbmVy
YWJpbGl0eSBub3csIGJ1dApjbGVhcmluZyB0aGUgd2hvbGUgQ1NSIGlzIG5vdCBhbiBpc3N1ZSwg
c28gZG8gdGhhdCBiZSBzYWZlLgoKU2lnbmVkLW9mZi1ieTogUmFkaW0gS3LEjW3DocWZIDxya3Jj
bWFyQHZlbnRhbmFtaWNyby5jb20+Ci0tLQogbGliL3NiaS9zYmlfaGFydC5jIHwgMyArKysKIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9o
YXJ0LmMgYi9saWIvc2JpL3NiaV9oYXJ0LmMKaW5kZXggMmQ5ZWU2MGZkMzZjLi5iNjZiODlmNmJj
NTEgMTAwNjQ0Ci0tLSBhL2xpYi9zYmkvc2JpX2hhcnQuYworKysgYi9saWIvc2JpL3NiaV9oYXJ0
LmMKQEAgLTg1LDYgKzg1LDkgQEAgc3RhdGljIHZvaWQgbXN0YXR1c19pbml0KHN0cnVjdCBzYmlf
c2NyYXRjaCAqc2NyYXRjaCkKICNlbmRpZgogCX0KIAorCWlmIChtaXNhX2V4dGVuc2lvbignSCcp
KQorCQljc3Jfd3JpdGUoQ1NSX0hTVEFUVVMsIDApOworCiAJaWYgKHNiaV9oYXJ0X2hhc19leHRl
bnNpb24oc2NyYXRjaCwgU0JJX0hBUlRfRVhUX1NNU1RBVEVFTikpIHsKIAkJbXN0YXRlZW5fdmFs
ID0gY3NyX3JlYWQ2NChDU1JfTVNUQVRFRU4wKTsKIAkJbXN0YXRlZW5fdmFsIHw9IFNNU1RBVEVF
Tl9TVEFURU47Ci0tIAoyLjQ4LjEKCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vb3BlbnNiaQo=
