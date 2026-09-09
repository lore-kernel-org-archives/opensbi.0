Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035B8C79FB6
	for <opensbi@archiver.kernel.org>; Wed,  9 Sep 2026 16:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oemNlQZmqJvMYmcLl75zWoFdUCDi39qGwwNt7XT3FX8=; b=q0kEgfEAftXVV2
	WoMWeudGGm0YPSqfbxb0qpyFj10/VLmE7WV9F6RQlJ5zZqQ9bnpHlQbgZVe4Xgpf/3nOp13IXXnlz
	nEYjMu6IlRB31W0xb4sZ4SqdK69H8mu4MWOx3GTX5Usi4l8TcaM1OrQjhNS9UU21wZfrcIT1yJTwF
	xfhNVRUUsgpr7ZMrcRH4OocgjkwIs7z/pFUuELFduuf63M5bW3pm4vTWGztEDdktZt/VMFL5fHBpT
	1E3naYFn76YhlLrE41GwLXU+3ZEite6AoWJ1P8U8osm/6PpF0Ps6TRJ9lvHMUzeQUKCztyIitOquN
	n1rObOWGEU6eQ+ZYlzEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LCh-0000000CJZ8-2uO3;
	Wed, 09 Sep 2026 16:31:19 +0000
Received: from mail-wm2-x06.google.com ([2a00:1450:4864:31::6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LCe-0000000CJXj-3P7S
	for opensbi@lists.infradead.org;
	Wed, 09 Sep 2026 16:31:18 +0000
Received: by mail-wm2-x06.google.com with SMTP id 5b1f17b1804b1-499c930cb9cso12789095e9.0
        for <opensbi@lists.infradead.org>; Wed, 09 Sep 2026 09:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788971474; x=1789576274; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nevv4bZlxh/Xp4ftRuOQHwnSslJ5O+FaLsWdCcNtLjA=;
        b=jiAVAxuVzeNsRUpy4+Nq+IJjVGE9p+FJFOjbIjfYGj9rYF9uN9UGukpoNClwRqbHbd
         wZsIzxAAv+1KbWWPFtdDfg0qSO1ub0iQj3lgvo/5wRCU266oWFWLp6c9c2AOQ8yuyPfN
         2x+J0+fkI9XdGLRmCR6zefhrosGfE9SH+NxWnExBLpTe4OWEvLImaQ/99zrRHaRRszvT
         9ySMTguUWl2AbPgNCvS/mFBdiJyjc54GjEoXld9puxMwkA0tgWEAtGt0h1whXZ9fUHZ0
         qTZyCQNQHIIMtsYNmtnWOTIURFdDrFXLdjLJPs0GWCkiCGspUYBvo88Fdi4Z1/JHkw5y
         ho1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788971474; x=1789576274;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nevv4bZlxh/Xp4ftRuOQHwnSslJ5O+FaLsWdCcNtLjA=;
        b=On6nw9JGS9d+2zYlu5/2TpkEXojMs9wEPZP+8rCNbN+ba6kDu0IfAXTVrfFdp5ciBS
         tMmYVfxfvt6La4cwKqjjixLxxboGE6YrBrcv4Jz2rkrrDpcWH55Ol5jURw8JQWDcbczU
         cpZhXNqeZ5yVTnYJYdvxrl6zg8xPdRt/WsytS19BmPu9Km7xih7+RbUDCny0P7DliAdp
         C/LocxT6ezqErS6A5rNTDC85VG+qQR5Y+PTxNxIWTQDaJkR/x+6kAE1VHemg43bpOqM5
         HkljlAl9fLSRGUin9VPkvM3W7tyvEcBOO0haTI8DwdyEffIyjZS6VkQP3h3ohValKgyM
         Ullg==
X-Gm-Message-State: AFuF++k4pg+9gFu9Zs31DU7OvIo9p01/ChxyLaUiKZyAkM64S+aV2Kt2
	jYCSQgEN9StQyFq0o3UiHu3fTbw7XESY+hpMtu6wfMmYsxHyzgnShj3NdIiG3Oyj
X-Gm-Gg: AYBFou2V5/+36lzdZ0EOzOLTztLu8cmRSUmRDZTB/MWbi1/KzbDt3uoTnvmXyLlXcXS
	MjBdDpbVm0EbQ+0vxQP13wmy/DKAnuPdxptXgJUEXkvrul6SKdrn/c6QXNpEBg3JriCQE/GtA0d
	YYkP/bW0dqlpTZjtC8au+aYGDkrwT8Wc9948nuqHkMmIDP2fgUbB9+xMSpE39DDnCyMPksp72jM
	GC6RNZR56ssbiUIuwLvQjjmZkB8Dft1rxR7lqXkn0N3DqHmWwdXK7M+TeA1GaiY2VfFWx/xEo1K
	athWopht00mm8l1K0wcgtB59pw6pRCSNQQmvYooNHcLNeDGlRndKVzS+8SS6LoQ6KQxWtVOiHTk
	mQygrxHjqolbhWZKM6rQG9grScKvLvJXOP40OYSE9sq0yZv+6H8A/ifIyqJ5koTOEBeyG5Can9D
	AVEnqd9eqsF1W3gBV/5EECjMWXGLn7bbZZZDp2aIAJoTOMeWOjqeHqhUBRS7Joe7J7/pfKl5+Xi
	vVp8S6HhqOHZ6G9ef6WA5uk4xiQzo0D2ONV2fYw5jxBSIbkWVFYHgqb0ufLknTadRIr7E/HTrik
	f7fgCSi+JA1h9w==
X-Received: by 2002:a05:600c:6386:b0:49c:fa21:e749 with SMTP id 5b1f17b1804b1-49d25925236mr19769665e9.31.1788971474187;
        Wed, 09 Sep 2026 09:31:14 -0700 (PDT)
Received: from localhost.localdomain ([84.77.88.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c06f04sm2763705e9.13.2026.09.09.09.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 09:31:13 -0700 (PDT)
From: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
To: opensbi@lists.infradead.org
Cc: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
Subject: [PATCH v2 00/14] Add clang Thread Safety Analysis (TSA) support
Date: Wed,  9 Sep 2026 18:23:09 +0200
Message-ID: <20260909162322.29778-2-carlos.lopezr4096@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_093116_868173_F02D9959 
X-CRM114-Status: GOOD (  14.15  )
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

RW5hYmxlIHRoZSB1c2Ugb2YgY2xhbmcncyBUaHJlYWQgU2FmZXR5IEFuYWx5c2lzIFswXS4gVFNB
IGlzIGEgY2xhbmcKbGFuZ3VhZ2UgZXh0ZW5zaW9uIHRoYXQgYWxsb3dzIGRldGVjdGluZyBwb3Rl
bnRpYWwgaW52YWxpZCBsb2NraW5nCnBhdHRlcm5zIGFuZCByYWNlIGNvbmRpdGlvbnMgYXQgY29t
cGlsZSB0aW1lLCB3aXRoIHplcm8gcnVudGltZQpvdmVyaGVhZC4gVFNBIHJlbGllcyBvbiBhbm5v
dGF0aW9ucyB0byBleHByZXNzIHRoZSByZWxhdGlvbnNoaXBzIGJldHdlZW4KZGF0YSBhbmQgbG9j
a3MsIGFuZCB0aGUgZXhwZWN0ZWQgc3RhdGUgb2YgYSBsb2NrIGF0IGNlcnRhaW4gcG9pbnRzIGlu
CnRoZSBwcm9ncmFtLgoKVGhlIGZpcnN0IHR3byBjb21taXRzIGludHJvZHVjZSB0aGUgYmFzaWMg
aW5mcmFzdHJ1Y3R1cmUgdG8gdXNlIHRoZSBUU0EKYW5ub3RhdGlvbnMuIFRoZSBsYXN0IGNvbW1p
dCBlbmFibGVzIFRTQSBieSBkZWZhdWx0IGluIHRoZSBNYWtlZmlsZS4KQ29tbWl0cyBpbiBiZXR3
ZWVuIGFkZCB0aGUgbmV3IGFubm90YXRpb25zIHRvIHBhcnRpY3VsYXIgT3BlblNCSQpzdWJzeXN0
ZW1zLgoKVGhlIGdlbmVyYWwgcGF0dGVybiBpczoKKiBTdHJ1Y3QgZmllbGRzIGFyZSByZWFycmFu
Z2VkIHNvIHRoYXQgbG9ja3MgYXBwZWFyIGJlZm9yZSB0aGUKICBmaWVsZChzKSB0aGV5IHByb3Rl
Y3QuIFRoaXMgaXMgbmVlZGVkIGZvciB0aGUgY29tcGlsZXIgdG8gYmUgYWJsZSB0bwogIHBlcmZv
cm0gYW5hbHlzaXMuIFByb3RlY3RlZCBmaWVsZHMgYXJlIGFubm90YXRlZCB3aXRoIEdVQVJERURf
QlkoKSAvCiAgUFRfR1VBUkRFRF9CWSgpLgoqIEZ1bmN0aW9ucyB0aGF0IGFjY2VzcyBzcGlubG9j
ay1wcm90ZWN0ZWQgZmllbGRzIGFyZSBhbm5vdGF0ZWQgd3RoCiAgTVVTVF9IT0xEKCkuCiogRnVu
Y3Rpb25zIHRoYXQgYWNxdWlyZSBhIHNwaW5sb2NrLCBhbmQgd2hpY2ggbWF5IHBsYXVzaWJseSBi
ZSBjYWxsZWQKICB3aXRoIHRoYXQgc3BpbmxvY2sgaGVsZCwgYXJlIGFubm90YXRlZCB3aXRoIE1V
U1RfTk9UX0hPTEQoKSB0byBwcmV2ZW50CiAgcG90ZW50aWFsIGZ1dHVyZSBkZWFkbG9ja3MuCiog
SW5pdGlhbGl6ZXIgZnVuY3Rpb25zIGFuZCBvdGhlciBzcGVjaWFsIGNhc2VzIGFyZSBleGNsdWRl
ZCB2aWEKICBOT19USFJFQURfU0FGRVRZX0FOQUxZU0lTLgoKVGhpcyBzdWNjZXNzZnVsbHkgcmVz
dWx0cyBpbiBkZXRlY3RpbmcgaW5jb3JyZWN0IGxvY2tpbmcgb24gY2xhbmcgPjE5LgpGb3IgZXhh
bXBsZSwgdGhlIGZvbGxvd2luZyBjaGFuZ2U6CgpkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfZmlm
by5jIGIvbGliL3NiaS9zYmlfZmlmby5jCmluZGV4IDg4Yjg4ODhkMmU4MS4uNTM0OGI3NDUyZjY0
IDEwMDY0NAotLS0gYS9saWIvc2JpL3NiaV9maWZvLmMKKysrIGIvbGliL3NiaS9zYmlfZmlmby5j
CkBAIC0zNyw5ICszNyw3IEBAIHUxNiBzYmlfZmlmb19hdmFpbChzdHJ1Y3Qgc2JpX2ZpZm8gKmZp
Zm8pCiAgICAgICAgaWYgKCFmaWZvKQogICAgICAgICAgICAgICAgcmV0dXJuIDA7CgotICAgICAg
IHNwaW5fbG9jaygmZmlmby0+cWxvY2spOwogICAgICAgIHJldCA9IGZpZm8tPmF2YWlsOwotICAg
ICAgIHNwaW5fdW5sb2NrKCZmaWZvLT5xbG9jayk7CgogICAgICAgIHJldHVybiByZXQ7CiB9CgpS
ZXN1bHRzIGluIGEgYnVpbGQgZXJyb3I6CgogIGxpYi9zYmkvc2JpX2ZpZm8uYzo0MToxNDogZXJy
b3I6IHJlYWRpbmcgdmFyaWFibGUgJ2F2YWlsJyByZXF1aXJlcyBob2xkaW5nIHNwaW5sb2NrICcm
c2JpX2ZpZm86OnFsb2NrJyBbLVdlcnJvciwtV3RocmVhZC1zYWZldHktYW5hbHlzaXNdCiAgIDQx
IHwgICAgICAgICByZXQgPSBmaWZvLT5hdmFpbDsKICAgICAgfCAgICAgICAgICAgICAgICAgICAg
IF4KICAxIGVycm9yIGdlbmVyYXRlZC4KClRlc3RlZCB3aXRoIGNsYW5nIDE4LjEuOCwgMTkuMS43
IGFuZCAyMi4xLjguCgpbMF0gaHR0cHM6Ly9jbGFuZy5sbHZtLm9yZy9kb2NzL1RocmVhZFNhZmV0
eUFuYWx5c2lzLmh0bWwKCnYyOiAKICAtIEVuYWJsZSBUU0EgbWFjcm9zIG9ubHkgb24gY2xhbmcg
Pj0gMTkuCgpDYXJsb3MgTMOzcGV6ICgxNCk6CiAgaW5jbHVkZTogc2JpOiBhZGQgdGhyZWFkIHNh
ZmV0eSBhbmFseXNpcyBtYWNyb3MKICBsaWI6IHNiaV9sb2NrczogYW5ub3RhdGUgc3BpbmxvY2sg
QVBJcyBmb3IgVFNBCiAgbGliOiBzYmlfZmlmbzogYWRkIFRTQSBhbm5vdGF0aW9ucwogIGxpYjog
c2JpX2hlYXA6IGFkZCBUU0EgYW5ub3RhdGlvbnMKICBsaWI6IHNiaV9zY3JhdGNoOiBhZGQgVFNB
IGFubm90YXRpb25zCiAgbGliOiBycG1pOiBhZGQgVFNBIGFubm90YXRpb25zCiAgbGliOiBzYmlf
dGltZXI6IGFkZCBUU0EgYW5ub3RhdGlvbnMKICBsaWI6IGh0aWY6IGFkZCBUU0EgYW5ub3RhdGlv
bnMKICBsaWI6IHNiaV9kb21haW46IGFkZCBUU0EgYW5ub3RhdGlvbnMKICBsaWI6IHNiaV9zc2U6
IGlubGluZSBlbmFibGUgZXZlbnQgbG9ja2luZwogIGxpYjogc2JpX3NzZTogcGFzcyBTU0UgaGFy
dCBzdGF0ZSBleHBsaWNpdGx5CiAgbGliOiBzYmlfc3NlOiBhZGQgVFNBIGFubm90YXRpb25zCiAg
bGliOiB0ZXN0OiBkaXNhYmxlIFRTQSBmb3Igc3BpbmxvY2sgdGVzdHMKICBNYWtlZmlsZTogZW5h
YmxlIFRocmVhZCBTYWZldHkgQW5hbHlzaXMKCiBNYWtlZmlsZSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgNyArKwogaW5jbHVkZS9zYmkvcmlzY3ZfbG9ja3MuaCAgICAgICAg
ICAgICAgICAgIHwgIDggKy0KIGluY2x1ZGUvc2JpL3NiaV9kb21haW4uaCAgICAgICAgICAgICAg
ICAgICB8IDEwICsrLQogaW5jbHVkZS9zYmkvc2JpX2ZpZm8uaCAgICAgICAgICAgICAgICAgICAg
IHwgIDYgKy0KIGluY2x1ZGUvc2JpL3NiaV92aXNpYmlsaXR5LmggICAgICAgICAgICAgICB8IDE3
ICsrKysrCiBsaWIvc2JpL3Jpc2N2X2xvY2tzLmMgICAgICAgICAgICAgICAgICAgICAgfCAgNCAr
LQogbGliL3NiaS9zYmlfZG9tYWluLmMgICAgICAgICAgICAgICAgICAgICAgIHwgIDMgKwogbGli
L3NiaS9zYmlfZG9tYWluX2NvbnRleHQuYyAgICAgICAgICAgICAgIHwgIDIgKwogbGliL3NiaS9z
YmlfZmlmby5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTEgKystCiBsaWIvc2JpL3NiaV9o
ZWFwLmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAyNSArKystLS0KIGxpYi9zYmkvc2JpX3Nj
cmF0Y2guYyAgICAgICAgICAgICAgICAgICAgICB8ICAzICstCiBsaWIvc2JpL3NiaV9zc2UuYyAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCA4OSArKysrKysrKysrLS0tLS0tLS0tLS0tCiBsaWIv
c2JpL3NiaV90aW1lci5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgNSArLQogbGliL3NiaS90
ZXN0cy9yaXNjdl9sb2Nrc190ZXN0LmMgICAgICAgICAgIHwgIDMgKwogbGliL3V0aWxzL21haWxi
b3gvZmR0X21haWxib3hfcnBtaV9zaG1lbS5jIHwgMTQgKystLQogbGliL3V0aWxzL3N5cy9odGlm
LmMgICAgICAgICAgICAgICAgICAgICAgIHwgMjggKysrKy0tLQogMTYgZmlsZXMgY2hhbmdlZCwg
MTQwIGluc2VydGlvbnMoKyksIDk1IGRlbGV0aW9ucygtKQoKCmJhc2UtY29tbWl0OiAzNTkzYTVm
YWNjNGM2OTM4YjkwNDI5YTY5NzNiYTllZTIxZmM1ODk5Ci0tIAoyLjUxLjAKCgotLSAKb3BlbnNi
aSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
