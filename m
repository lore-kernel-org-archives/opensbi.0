Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B189EC54F51
	for <opensbi@archiver.kernel.org>; Wed, 29 Jul 2026 16:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G+m9Ox5zKjgRjWhbJrO9W3XAMaGWnFnjHaU8lA5YP8M=; b=NHOiWDpBHnKPJg
	A4+BpeaDG+MYPDOCFbkZS5e5R1edivhFRRxxIkyjBhAKir+aX+BO3vLi7gGRP22tqzXWmzR3F9ysL
	8ila1RGnvFnnbYYjSwEXSLAvti+CSTMqhLtUEjD4uhCQaiHhDYR7nD0SqeKc6Yb7G8EOCi18Dz3uw
	OYyzStrJYF0VwLKbNLq/Kvmb/+DmSJcFyTnf06dTOZkPbsUSz0zpbxuxXE+0VHqeDIq8arQnT4xcS
	ZuStDfzxphxADczML7xZknkZG2qy9XW8zbDulO0/lvvFu2H6FLGtv4z6hUJaBhdZOYvzAGTuWLNph
	38XsvkbTE0aaL5SpaqpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7Of-00000008bQ6-2j1T;
	Wed, 29 Jul 2026 16:44:45 +0000
Received: from mail-wr2-x01.google.com ([2a00:1450:4864:30::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7Oc-00000008bK8-3cd8
	for opensbi@lists.infradead.org;
	Wed, 29 Jul 2026 16:44:44 +0000
Received: by mail-wr2-x01.google.com with SMTP id ffacd0b85a97d-46cbf263216so486130f8f.1
        for <opensbi@lists.infradead.org>; Wed, 29 Jul 2026 09:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785343481; x=1785948281; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8ma38Wv2ffQef/AXdTmSMIurnRkX5AXVLXBWqj/OoDE=;
        b=XXaaaysdd+moXxIv7mMRceSybfsiNcS5SQxW3r9f4QUN9KGboL9THoffQIrXSqTTtr
         suZhfjiEJ3zdSo96V/PfznUI3V/uu2W2TX/AdVKxNRSO6NQRVgY1fEyiry04imav4uh0
         aATLstuXkM8v3RrvggqUf6DINedzcv0Ll94Ph6PmxlpYJO0Frdw11kKTETFJWw7TThUf
         jPwyQQPqxaW8wHVkGvA2GKkER0lz291fAYo+sec27Ssuk4mhmnigZ+/YhYBYPdb2Q8+T
         4XOJtCxCK5iSs9fAhFgHlK4/7fB+jyB1f9TieALk0K4SiVZdBZDdZAQRTrXgWCjwMOP0
         XSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785343481; x=1785948281;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ma38Wv2ffQef/AXdTmSMIurnRkX5AXVLXBWqj/OoDE=;
        b=NKOPNUjd2iESpc9VYpN4WJUcbsWkYeNW/b7YsLoV9jUAgWuMsfpr+vBXaYMANgwqi3
         JDFtvZOwoiszPGm0DrTuUCy4hoRa32iARVUAhri/ut0s+E0P4s2RKff+3/t9wAeW+w7Q
         BUOVNsPKktOQqUyrkWtVZgAtTz5aLTihkM9uEdEQb4pUB6pl66al35AjJVGgLEcMEg1C
         hOm7m1nH8MDS7dBdDETERg9dhbUGMFeBbzwcqdF94yMrjNCuzW+mu+pvwmf+ZUE489ZV
         d3Zi20674bmtUeQ3hsiEhzUlJ+7moFXNqEYRtEnixQ7cmCpEPP62cQgeFYeyDtEoK4wJ
         wJmw==
X-Gm-Message-State: AOJu0Ywm6RWfE+fxYDGtnOLiMVuqkG1v5GPNDUe3IYigcwqoW7DOEcvo
	zjDDHf7CTWLw/dMqg0nMaIqXO0rhWIA3w7h9TewIqTSmma6AEPKHi0uFGGUt/Khc8ms=
X-Gm-Gg: AR+sD1354lmEkoRxs6FjCX4lJH4sTvp7NTayCELUHqRPYdfAyFL2tlNiGPFjlk/WvlJ
	C9CPpGB2CvxNtH/9+olvrcXVjxQ0MVHUViLUUr/IOqNAt2hYtHhmlW9yl6n9zahtxRATSQYjL+i
	h1Xhzpq8+gdNHNszrMG2AZMJhT4LDWKonw5Mj0sl+N+nvxGtblPTzn0U16r1kKMaoirvbwaJtQQ
	pkkwTTxUxvP7TrAboHmhMkfi3+kqdQcTUWR091DPBtSc0nTmAGnQt0X+Kl+iHBg1idYHh+XQz9h
	hq30DJF6OWunEZizyzomE4B4OUjEg4JoPcOd1GN0dYp2rSzNuIKYhkDxJkBSRO7Cm8NboBWK4OF
	vMXlidL4x2Yhl68vE+Ysxq3OOhrIhZ6Fuo6//aZ7msPfSLWvieg0Gc5VlbceYpFEzwQChiVzw8E
	nG8pXAy2LXZHKVy0k3ZJmTyeR1YziKoABE0ebsKcBk3RZp5wvqLabc5kngmsRy5nw/LFHBdlQ08
	M/CsI9VU69Ry3xduuUd8NF1BLp6sWwX/HUXUVf4oHeux9T1XjvfXuQCyg==
X-Received: by 2002:a05:6000:4026:b0:47f:7005:2893 with SMTP id ffacd0b85a97d-47fb1f27298mr9359953f8f.58.1785343480793;
        Wed, 29 Jul 2026 09:44:40 -0700 (PDT)
Received: from leap.suse.de ([84.77.88.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6aa3a88sm8474869f8f.6.2026.07.29.09.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 09:44:40 -0700 (PDT)
From: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
To: opensbi@lists.infradead.org
Cc: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
Subject: [PATCH 08/14] lib: htif: add TSA annotations
Date: Wed, 29 Jul 2026 18:35:35 +0200
Message-ID: <20260729163540.3162978-10-carlos.lopezr4096@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260729163540.3162978-2-carlos.lopezr4096@gmail.com>
References: <20260729163540.3162978-2-carlos.lopezr4096@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_094442_922430_51A3F3E8 
X-CRM114-Status: GOOD (  10.93  )
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

QWRkIFRocmVhZCBTYWZldHkgQW5hbHlzaXMgKFRTQSkgYW5ub3RhdGlvbnMgZm9yIHRoZSBIVElG
IGRyaXZlcgppbXBsZW1lbnRhdGlvbi4KClRoaXMgcmVxdWlyZXMgYW5ub3RhdGluZyB0aGUgdG9o
b3N0L2Zyb21ob3N0IGFuZCBodGlmX2NvbnNvbGVfYnVmCmdsb2JhbHMgdG8gaW5kaWNhdGUgdGhh
dCB0aGV5IGFyZSBwcm90ZWN0ZWQgYnkgaHRpZl9sb2NrLgpodGlmX3N5c3RlbV9yZXNldCgpIGNh
biBiZSBleGNsdWRlZCBzaW5jZSBpdCBpcyBvbmx5IGNhbGxlZCB1bmRlcgpzcGVjaWFsIGNpcmN1
bXN0YW5jZXMgZnJvbSBzYmlfc3lzdGVtX3Jlc2V0KCksIHdoZW4gYWxsIG90aGVyIGhhcnRzCmhh
dmUgYmVlbiBzdG9wcGVkLgoKU2lnbmVkLW9mZi1ieTogQ2FybG9zIEzDs3BleiA8Y2FybG9zLmxv
cGV6cjQwOTZAZ21haWwuY29tPgotLS0KIGxpYi91dGlscy9zeXMvaHRpZi5jIHwgMjggKysrKysr
KysrKysrKysrKy0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyks
IDEyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2xpYi91dGlscy9zeXMvaHRpZi5jIGIvbGli
L3V0aWxzL3N5cy9odGlmLmMKaW5kZXggYjRlNjMyMTI0NzdhLi4xMzYwNjEzY2Q1YWEgMTAwNjQ0
Ci0tLSBhL2xpYi91dGlscy9zeXMvaHRpZi5jCisrKyBiL2xpYi91dGlscy9zeXMvaHRpZi5jCkBA
IC00NiwyMiArNDYsMjUgQEAKIAogI2RlZmluZSBQS19TWVNfd3JpdGUgNjQKIAotdm9sYXRpbGUg
dWludDY0X3QgdG9ob3N0IF9fYXR0cmlidXRlX18oKHNlY3Rpb24oIi5odGlmIikpKTsKLXZvbGF0
aWxlIHVpbnQ2NF90IGZyb21ob3N0IF9fYXR0cmlidXRlX18oKHNlY3Rpb24oIi5odGlmIikpKTsK
K3N0YXRpYyBzcGlubG9ja190IGh0aWZfbG9jayA9IFNQSU5fTE9DS19JTklUSUFMSVpFUjsKKwor
dm9sYXRpbGUgdWludDY0X3QgdG9ob3N0CisJX19hdHRyaWJ1dGVfXygoc2VjdGlvbigiLmh0aWYi
KSkpIEdVQVJERURfQlkoJmh0aWZfbG9jayk7Cit2b2xhdGlsZSB1aW50NjRfdCBmcm9taG9zdAor
CV9fYXR0cmlidXRlX18oKHNlY3Rpb24oIi5odGlmIikpKSBHVUFSREVEX0JZKCZodGlmX2xvY2sp
OwogCi1zdGF0aWMgdWludDY0X3QgKmh0aWZfZnJvbWhvc3QgPSBOVUxMOwotc3RhdGljIHVpbnQ2
NF90ICpodGlmX3RvaG9zdCA9IE5VTEw7CitzdGF0aWMgdWludDY0X3QgKmh0aWZfZnJvbWhvc3Qg
UFRfR1VBUkRFRF9CWSgmaHRpZl9sb2NrKSA9IE5VTEw7CitzdGF0aWMgdWludDY0X3QgKmh0aWZf
dG9ob3N0IFBUX0dVQVJERURfQlkoJmh0aWZfbG9jaykJID0gTlVMTDsKIHN0YXRpYyBib29sIGh0
aWZfY3VzdG9tID0gZmFsc2U7CiAKLXN0YXRpYyBpbnQgaHRpZl9jb25zb2xlX2J1ZjsKLXN0YXRp
YyBzcGlubG9ja190IGh0aWZfbG9jayA9IFNQSU5fTE9DS19JTklUSUFMSVpFUjsKK3N0YXRpYyBp
bnQgaHRpZl9jb25zb2xlX2J1ZiBHVUFSREVEX0JZKCZodGlmX2xvY2spOwogCi1zdGF0aWMgaW5s
aW5lIHVpbnQ2NF90IF9fcmVhZF90b2hvc3Qodm9pZCkKK3N0YXRpYyBpbmxpbmUgdWludDY0X3Qg
X19yZWFkX3RvaG9zdCh2b2lkKSBNVVNUX0hPTEQoJmh0aWZfbG9jaykKIHsKIAlyZXR1cm4gKGh0
aWZfY3VzdG9tKSA/ICpodGlmX3RvaG9zdCA6IHRvaG9zdDsKIH0KIAotc3RhdGljIGlubGluZSB2
b2lkIF9fd3JpdGVfdG9ob3N0KHVpbnQ2NF90IHZhbCkKK3N0YXRpYyBpbmxpbmUgdm9pZCBfX3dy
aXRlX3RvaG9zdCh1aW50NjRfdCB2YWwpIE1VU1RfSE9MRCgmaHRpZl9sb2NrKQogewogCWlmICho
dGlmX2N1c3RvbSkKIAkJKmh0aWZfdG9ob3N0ID0gdmFsOwpAQCAtNjksMTIgKzcyLDEyIEBAIHN0
YXRpYyBpbmxpbmUgdm9pZCBfX3dyaXRlX3RvaG9zdCh1aW50NjRfdCB2YWwpCiAJCXRvaG9zdCA9
IHZhbDsKIH0KIAotc3RhdGljIGlubGluZSB1aW50NjRfdCBfX3JlYWRfZnJvbWhvc3Qodm9pZCkK
K3N0YXRpYyBpbmxpbmUgdWludDY0X3QgX19yZWFkX2Zyb21ob3N0KHZvaWQpIE1VU1RfSE9MRCgm
aHRpZl9sb2NrKQogewogCXJldHVybiAoaHRpZl9jdXN0b20pID8gKmh0aWZfZnJvbWhvc3QgOiBm
cm9taG9zdDsKIH0KIAotc3RhdGljIGlubGluZSB2b2lkIF9fd3JpdGVfZnJvbWhvc3QodWludDY0
X3QgdmFsKQorc3RhdGljIGlubGluZSB2b2lkIF9fd3JpdGVfZnJvbWhvc3QodWludDY0X3QgdmFs
KSBNVVNUX0hPTEQoJmh0aWZfbG9jaykKIHsKIAlpZiAoaHRpZl9jdXN0b20pCiAJCSpodGlmX2Zy
b21ob3N0ID0gdmFsOwpAQCAtODIsNyArODUsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgX193cml0
ZV9mcm9taG9zdCh1aW50NjRfdCB2YWwpCiAJCWZyb21ob3N0ID0gdmFsOwogfQogCi1zdGF0aWMg
dm9pZCBfX2NoZWNrX2Zyb21ob3N0KCkKK3N0YXRpYyB2b2lkIF9fY2hlY2tfZnJvbWhvc3QoKSBN
VVNUX0hPTEQoJmh0aWZfbG9jaykKIHsKIAl1aW50NjRfdCBmaCA9IF9fcmVhZF9mcm9taG9zdCgp
OwogCWlmICghZmgpCkBAIC0xMDQsNiArMTA3LDcgQEAgc3RhdGljIHZvaWQgX19jaGVja19mcm9t
aG9zdCgpCiB9CiAKIHN0YXRpYyB2b2lkIF9fc2V0X3RvaG9zdCh1aW50NjRfdCBkZXYsIHVpbnQ2
NF90IGNtZCwgdWludDY0X3QgZGF0YSkKKwlNVVNUX0hPTEQoJmh0aWZfbG9jaykKIHsKIAl3aGls
ZSAoX19yZWFkX3RvaG9zdCgpKQogCQlfX2NoZWNrX2Zyb21ob3N0KCk7CkBAIC0yMTcsNyArMjIx
LDcgQEAgc3RhdGljIGludCBodGlmX3N5c3RlbV9yZXNldF9jaGVjayh1MzIgdHlwZSwgdTMyIHJl
YXNvbikKIAlyZXR1cm4gMTsKIH0KIAotc3RhdGljIHZvaWQgaHRpZl9zeXN0ZW1fcmVzZXQodTMy
IHR5cGUsIHUzMiByZWFzb24pCitzdGF0aWMgdm9pZCBodGlmX3N5c3RlbV9yZXNldCh1MzIgdHlw
ZSwgdTMyIHJlYXNvbikgTk9fVEhSRUFEX1NBRkVUWV9BTkFMWVNJUwogewogCXdoaWxlICgxKSB7
CiAJCV9fd3JpdGVfZnJvbWhvc3QoMCk7Ci0tIAoyLjUxLjAKCgotLSAKb3BlbnNiaSBtYWlsaW5n
IGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
