Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1711C83F17
	for <opensbi@archiver.kernel.org>; Thu, 10 Jul 2025 18:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S6XUsx/le4Ns0IozhUQUW3xa8CtKWYW+92TxFESpZ4c=; b=Wa7eUMbVLY8VME
	xkArI7ntS1OTXE/onAGqySJwpM1rxMWQ5nrYVt92PziJu97TfPXWHtYFeoX7pPs4+As3iU/gMUb24
	rXyT9vBgZgR7BIUv4TP7Ym/w/XGcwZ4JKIuPupTfbSKEV+kz0KRJ4jLLblfDKFOPpb7971e+fNoPT
	GV8Ic+H6CsLkUFo8bxJEfydpbLe9NBSeeue6IK0VXRtt94CIPxUXf2wAYSSdiHiIVYGIQ/jNXk65S
	U4kRPQhvjtXHFg+9Pa17ncco4Yuh8Fxt+1SGrRggAYp87Z1b1IYF4FRfne1iGASKyN863VUOztaOZ
	IIg0nipEHfhT8Ko0Av1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZw41-0000000CiQy-1Xmd;
	Thu, 10 Jul 2025 18:32:09 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZttP-0000000CN0D-16xz
	for opensbi@lists.infradead.org;
	Thu, 10 Jul 2025 16:13:04 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-235a3dd4f0dso8405955ad.0
        for <opensbi@lists.infradead.org>; Thu, 10 Jul 2025 09:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1752163982; x=1752768782; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6NZoSpcx2FkLDi5eAoSuCpEu+Q3oXfPVD1H24X+Plf8=;
        b=cn28R/TadfjYQpugGzcB47h9zK/Yfhl7mLohpKawWTD7zZihQSemdy5IrkRZyhrDUV
         s9Uwtc7TOSrPuKF9BAb0jqY3BY14k4y8fjcs8DcuKCg9swo+itRYJ1L0L6nfDsrYZoUD
         4AR18dbFDQw2NHfO3mllhLg7edV+apDf71PVXvjYGAQE786kjrdcqcDBPq0zTHKVaED3
         G0878TSTDG7rkSxxZc2ZqLZvOtLlgcpyatpO7gVMBSMHZOBnMKeALGtKnaSwBal+7/UO
         2oLGtU/td3FLZuHrXNZUGI8AubM3wSzIhyBWhcCQgyicJ6drX1ikUyJ/JuGLdauY/7vB
         hKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752163982; x=1752768782;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6NZoSpcx2FkLDi5eAoSuCpEu+Q3oXfPVD1H24X+Plf8=;
        b=RYedwFBTbz5ZmfmOGf+2f1aY+RO9REJZ0X36eltQ3q19JGf0mjtAQ4gNKn4F5b0s3N
         us7tWmyHAFNLkDTMvPbs0Jexp0eD43QGXmRU9yz84VwKCbq0uOmDegKnTkkKRpPwvgyO
         Wx7QJEVAqUDAHyXIN1F7BjiN1SX3FDTUQ+5f3QQFZ8YbaAONwX3w+B095aJmjxjLfeIR
         zo5CG+6FAuFCDdd7fSaGf6/+LTyp7aBUmwWbAsdEPWuS0T0Q0CbPPoj0+rIgsL+TiPHY
         YC8duTCEZKEiHnQnXSqt7MsjxtZwW7V2sUICjJMRRQVUgvVwuLlTSB9P/rLLrBLzT5tQ
         TvUw==
X-Gm-Message-State: AOJu0YzPS+DCqY2Z0NdrNpVimbaZo0wh0aFHIflpNFl7s+swJ+74xf6L
	uyiw0wxBzy4wXfDpomMujqQFNZkjovFvq7jFodEc4um9XAopuyW/ficl0JI4uaS8mNqbHwn58VT
	2cGoXucs=
X-Gm-Gg: ASbGncug7JHzyhweP4ZP5nywlBZXI8QcMvGpFvbzmSN76yTIMTLYm9zgPnPCl7ntTln
	2wlIKZ/99CrHjKXD4epcBpKBILedFcrevnu+rqcf+6Vc8HmbxQhaqG2O0e7HjVfM6jOFfe1yUg9
	V3CQtAPy2CoS7LDK/IB5xEPYEVydKnLV7WqWhy22lzhWqhHEBUpAxMTO+nx/KHQ6jBhVwey1hwQ
	LXPzX/x9sf56l6UcAk5jVtyHRsZkNBUlXmLi822o2tF8KX2T0GdiPG2udMwikp6RJCHv8eKfXtU
	EDKke3HgtSvYyrtSxyt4GvnvqvpdP39UO05yQZfVWrvFjuTqJ/APaxhqB4u6
X-Google-Smtp-Source: AGHT+IHCEo4uDbyllz2MWQUtB4TPSTjOHV7wEPK+v0sAjDGorqixICMg2NUJw8KBCdh4d+CayaaPwg==
X-Received: by 2002:a17:902:f64a:b0:235:eb8d:7fff with SMTP id d9443c01a7336-23ddb312670mr116058235ad.28.1752163982016;
        Thu, 10 Jul 2025 09:13:02 -0700 (PDT)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4322dbdsm25584745ad.127.2025.07.10.09.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:13:01 -0700 (PDT)
From: Max Hsu <max.hsu@sifive.com>
Date: Fri, 11 Jul 2025 00:12:53 +0800
Subject: [PATCH v2] lib: utils: fdt: fix "ranges" translation
MIME-Version: 1.0
Message-Id: <20250711-dev-maxh-master_fdt_helper-v2-1-9579e1f02ee1@sifive.com>
X-B4-Tracking: v=1; b=H4sIAITmb2gC/42NQQqDMBQFryJ/3ZQk1Chd9R5FxCYvzYdaJZFgE
 e/e1BN082DeYmajhMhIdK02isiceHoX0KeKbBjeTwh2hUlLXctGtsIhi3FYQ5m0IPbeLX3Aa0Y
 UF+M0gIdsrKMimCM8r4f83hUOnJYpfo5WVr/3L21WQonWGKtM7ZVv61tizxlnO43U7fv+BXU7U
 pLFAAAA
X-Change-ID: 20250708-dev-maxh-master_fdt_helper-46d2eeeb07cd
To: opensbi@lists.infradead.org
Cc: Max Hsu <max.hsu@sifive.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3132; i=max.hsu@sifive.com;
 h=from:subject:message-id; bh=g0W1vRpOK2rmAxn97wEe3i90nxTFYAK5OGZwQaTgZ0I=;
 b=owEB7QES/pANAwAKAdID/Z0HeUC9AcsmYgBob+aMs/Hce0g1X+RsoXpWmhPjpgZKRdmhrlCkq
 7cKLjXUQh2JAbMEAAEKAB0WIQTqXmcbOhS2KZE9X2jSA/2dB3lAvQUCaG/mjAAKCRDSA/2dB3lA
 vVBJDACgGu1bvwGOnZJb28+imzP+Tic2xolBE40JeOfifkQgzspYqadcVODmyPKXx5GCVHluC/C
 NMwYNv2e+r77fAl4Fx9k4dNhhG05J5OSV+7Md05rTJH61JYBjARo+cKtF4iiu+v8QCyib6UfpzU
 MPoT0cVcgvhDc8Tn2+X98OgzcPLB14YV7HD+zGDdWXgkdhmCs2wil1F4+DFENMz66pN8BoR/8Yg
 7vZ3DLSQerpCCPufdZLEibv+DS1e6SpopVPywurOI3z0ZNs2CUJEaTEPlVoX+jHSj68YlCOVWmx
 q1+sonZMibGZSxo7gh7a6Slhn5DpaOKr4s0bRYBKq7awsfLWq67eKgRhO2xV7c9CTbSnhx5/hNq
 /Ik6w4ssC5DzwrRUS38kGZQo0vB4s24WSgkYa4jT7cn+/z2O8Zr0lLcVEZYtllggKE384YoQtdu
 4S/v/dASQGzNgwtzp8sCKZ+CwWwJpnlgjKq8TEVPtJMScMGdLkE60QdUXWSoKqegiAtLY=
X-Developer-Key: i=max.hsu@sifive.com; a=openpgp;
 fpr=EA5E671B3A14B629913D5F68D203FD9D077940BD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_091303_320569_16925179 
X-CRM114-Status: GOOD (  16.22  )
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

QWNjb3JkaW5nIHRvIHRoZSBEZXZpY2UgVHJlZSBTcGVjLCBDaGFwdGVyIDIuMy44ICJyYW5nZXMi
IFsxXToKVGhlIHBhcmVudCBhZGRyZXNzIHNpemUgd2lsbCBiZSBkZXRlcm1pbmVkIGZyb20gdGhl
ICNhZGRyZXNzLWNlbGxzCnByb3BlcnR5IG9mIHRoZSBub2RlIHRoYXQgZGVmaW5lcyB0aGUgcGFy
ZW504oCZcyBhZGRyZXNzIHNwYWNlLgoKSW4gZmR0X3RyYW5zbGF0ZV9hZGRyZXNzKCksIHdoaWNo
IGNvbnNpZGVyZWQgdGhlIHBhcmVudCBhZGRyZXNzIHNpemUKaXMgdGhlIGNoaWxkIGFkZHJlc3Mg
c2l6ZSwgdGhpcyBjb21taXQgZml4IHRoZSB0d28gYWRkcmVzcyBzaXplcwphbmQgcGFyc2luZyB0
aGUgYWRkcmVzcyBpbmRlcGVuZGVudGx5LgoKU2lnbmVkLW9mZi1ieTogTWF4IEhzdSA8bWF4Lmhz
dUBzaWZpdmUuY29tPgotLS0KdjEgZml4IHdpbGwgaW50cm9kdWNlIGFub3RoZXIgYnVnIGluIHRo
ZSBmb2xsb3dpbmcgY2FzZS4KClRoZSBub2RlIGluIERUUyBkZXB0aCAxIGlmIGV4ZWN1dGUgZmR0
X2dldF9ub2RlX2FkZHJfc2l6ZSgpLCBpbnNpZGUKdGhlIGZ1bmN0aW9uLCB0aGUgZmR0X3RyYW5z
bGF0ZV9hZGRyZXNzKCkgd2lsbCB0cnkgdG8gZ2V0IHRoZSBjaGlsZAoiI2FkZHJlc3MtY2VsbHMi
IGFuZCAiI3NpemUtY2VsbHMiIGluIERUUyBkZXB0aCAwLCBhbmQgdGhlIHBhcmVudAoiI2FkZHJl
c3MtY2VsbHMiIGluIERUUyBkZXB0aCAtMS4gd2hpY2ggd2lsbCBjYXVzZSBlYXJseSBhYm9ydC4K
V2l0aCBmZHRfdHJhbnNsYXRlX2FkZHJlc3MoKSBlYXJseSBhYm9ydCwgdGhlIHBhcmFtZXRlciAi
YWRkciIgZGlkbid0CmdvdCBhbnkgYXNzaWdubWVudCBvZiB0aGUgYWRkcmVzcyB2YWx1ZS4gVGhp
cyBsZXQKZmR0X2dldF9ub2RlX2FkZHJfc2l6ZSgpIHJldHVybiB3aXRoIHVua25vd24gdmFsdWUg
b2YgcGFyYW1ldGVyICJhZGRyIi4KCkZvciB0aGUgdjIgZml4LCB3aGljaCB3aWxsIGNoZWNrIHRo
ZSAicmFuZ2VzIiBmaXJzdCwgc2luY2UgdGhlIGFib3ZlCmNhc2Ugc2hvdWxkbid0IGhhcHBlbiBp
biB0aGUgRFRTIGFzIHRoZSAicmFuZ2VzIiBzaG91bGQgYmUgZXhpc3RlZCBpbgpEVFMgZGVwdGgg
bW9yZSB0aGFuIDAuIFRoaXMgZml4IGFsc28gaW1wcm92ZSBleGVjdXRpb24gY3ljbGUuIAotLS0K
Q2hhbmdlcyBpbiB2MjoKLSBmaXggdjEgYnVnIG1lbnRpb25lZCBpbiB0aGUgY292ZXIgbGV0dGVy
LgotIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTA3MDgtZGV2LW1h
eGgtbWFzdGVyX2ZkdF9oZWxwZXItdjEtMS04NjZjMTY1ZjFmODVAc2lmaXZlLmNvbQotLS0KIGxp
Yi91dGlscy9mZHQvZmR0X2hlbHBlci5jIHwgMjYgKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9saWIvdXRpbHMvZmR0L2ZkdF9oZWxwZXIuYyBiL2xpYi91dGlscy9mZHQvZmR0X2hl
bHBlci5jCmluZGV4IDBmNDg1OWMxYTcyMWJjN2MyODcxYmFjZWZlMjdjYWJhNzc4MGY3NTIuLjc5
OWZkNDhkYzNhYmYwYTNjMTk2M2Y4NGRkNmJkZTI3MWU2YzA4ZDcgMTAwNjQ0Ci0tLSBhL2xpYi91
dGlscy9mZHQvZmR0X2hlbHBlci5jCisrKyBiL2xpYi91dGlscy9mZHQvZmR0X2hlbHBlci5jCkBA
IC04NCwyMyArODQsMjcgQEAgc3RhdGljIGludCBmZHRfdHJhbnNsYXRlX2FkZHJlc3MoY29uc3Qg
dm9pZCAqZmR0LCB1aW50NjRfdCByZWcsIGludCBwYXJlbnQsCiAJCQkJIHVpbnQ2NF90ICphZGRy
KQogewogCWludCBpLCBybGVuOwotCWludCBjZWxsX2FkZHIsIGNlbGxfc2l6ZTsKKwlpbnQgY2Vs
bF9wYXJlbnRfYWRkciwgY2VsbF9jaGlsZF9hZGRyLCBjZWxsX3NpemU7CiAJY29uc3QgZmR0MzJf
dCAqcmFuZ2VzOwogCXVpbnQ2NF90IG9mZnNldCwgY2FkZHIgPSAwLCBwYWRkciA9IDAsIHJzaXpl
ID0gMDsKIAotCWNlbGxfYWRkciA9IGZkdF9hZGRyZXNzX2NlbGxzKGZkdCwgcGFyZW50KTsKLQlp
ZiAoY2VsbF9hZGRyIDwgMSkKLQkJcmV0dXJuIFNCSV9FTk9ERVY7Ci0KLQljZWxsX3NpemUgPSBm
ZHRfc2l6ZV9jZWxscyhmZHQsIHBhcmVudCk7Ci0JaWYgKGNlbGxfc2l6ZSA8IDApCi0JCXJldHVy
biBTQklfRU5PREVWOwotCiAJcmFuZ2VzID0gZmR0X2dldHByb3AoZmR0LCBwYXJlbnQsICJyYW5n
ZXMiLCAmcmxlbik7CiAJaWYgKHJhbmdlcyAmJiBybGVuID4gMCkgewotCQlmb3IgKGkgPSAwOyBp
IDwgY2VsbF9hZGRyOyBpKyspCisJCWNlbGxfY2hpbGRfYWRkciA9IGZkdF9hZGRyZXNzX2NlbGxz
KGZkdCwgcGFyZW50KTsKKwkJaWYgKGNlbGxfY2hpbGRfYWRkciA8IDEpCisJCQlyZXR1cm4gU0JJ
X0VOT0RFVjsKKworCQljZWxsX3BhcmVudF9hZGRyID0gZmR0X2FkZHJlc3NfY2VsbHMoZmR0LCBm
ZHRfcGFyZW50X29mZnNldChmZHQsIHBhcmVudCkpOworCQlpZiAoY2VsbF9wYXJlbnRfYWRkciA8
IDEpCisJCQlyZXR1cm4gU0JJX0VOT0RFVjsKKworCQljZWxsX3NpemUgPSBmZHRfc2l6ZV9jZWxs
cyhmZHQsIHBhcmVudCk7CisJCWlmIChjZWxsX3NpemUgPCAwKQorCQkJcmV0dXJuIFNCSV9FTk9E
RVY7CisKKwkJZm9yIChpID0gMDsgaSA8IGNlbGxfY2hpbGRfYWRkcjsgaSsrKQogCQkJY2FkZHIg
PSAoY2FkZHIgPDwgMzIpIHwgZmR0MzJfdG9fY3B1KCpyYW5nZXMrKyk7Ci0JCWZvciAoaSA9IDA7
IGkgPCBjZWxsX2FkZHI7IGkrKykKKwkJZm9yIChpID0gMDsgaSA8IGNlbGxfcGFyZW50X2FkZHI7
IGkrKykKIAkJCXBhZGRyID0gKHBhZGRyIDw8IDMyKSB8IGZkdDMyX3RvX2NwdSgqcmFuZ2VzKysp
OwogCQlmb3IgKGkgPSAwOyBpIDwgY2VsbF9zaXplOyBpKyspCiAJCQlyc2l6ZSA9IChyc2l6ZSA8
PCAzMikgfCBmZHQzMl90b19jcHUoKnJhbmdlcysrKTsKCi0tLQpiYXNlLWNvbW1pdDogYTMyYTkx
MDY5MTE5ZTdhNWFhMzFlNmJjNTFkNWUwMDg2MGJlM2Q4MApjaGFuZ2UtaWQ6IDIwMjUwNzA4LWRl
di1tYXhoLW1hc3Rlcl9mZHRfaGVscGVyLTQ2ZDJlZWViMDdjZAoKQmVzdCByZWdhcmRzLAotLSAK
TWF4IEhzdSA8bWF4LmhzdUBzaWZpdmUuY29tPgoKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApv
cGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9vcGVuc2JpCg==
