Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FECC79FB7
	for <opensbi@archiver.kernel.org>; Wed,  9 Sep 2026 16:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G+m9Ox5zKjgRjWhbJrO9W3XAMaGWnFnjHaU8lA5YP8M=; b=RSrUWy4GSowUQ1
	/byRBuZxuWIndnxvX7Rs6YUdHFd7RGe6ctqkwlntHS5pSwwRL6+h2uJ2Cp78zy8d5QEai6rMLC3ft
	lHNytXi/Eeco1bcHwUzWG+t5Lrwy9liMs4NF2FyuRNqK7DOrpoplHuPD4qC8zQ7O8TnMXkgvi4p5r
	GDx07vT52eYM2OZa5xNMZOmHqwscyFJC9GubLZzBzCKHn3vtoL+pSoWNTIfz06AvzoqSEORRbYyV+
	0b8mqY55+INPZzovFpMPzf4I4eIsmlWzjYzTN4WkZS0dqODntJqSIxsdlqG09MJ7OvIVTL63YTw1O
	DITXpBFFeDph4BrBpAIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LCx-0000000CJmW-3kRV;
	Wed, 09 Sep 2026 16:31:35 +0000
Received: from mail-wr2-x0b.google.com ([2a00:1450:4864:30::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LCu-0000000CJjL-3fLS
	for opensbi@lists.infradead.org;
	Wed, 09 Sep 2026 16:31:34 +0000
Received: by mail-wr2-x0b.google.com with SMTP id ffacd0b85a97d-483960225ccso1862048f8f.1
        for <opensbi@lists.infradead.org>; Wed, 09 Sep 2026 09:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788971491; x=1789576291; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8ma38Wv2ffQef/AXdTmSMIurnRkX5AXVLXBWqj/OoDE=;
        b=NYqIeVtKlUMC2Ohhy1vb164lBk0wiIRRf574sny+BMJyqRQ4A57Z/Voz+MtuaI1TZ6
         5H0WKAOzutMcQHalhIl9+S3p6Vlr345OD4ftEi5hfHeUD+Z1u5qtNBjRcuhxP+wIcQoH
         EfE/nYOHOnrVyEqZjfQDrVAMTOCo2ocbZtRMYqEgsPc5g2p9SwGHLOLt75l69tgNZIba
         1hLN1JshUvg1/QJkfKbdCc1N0O81/+SKn1DqC4e5YEfPkG/+MdsTDMdArgNe9n5nFd2H
         lwmlg65bfQvY9Sz/ajoabz//gdfs30scWCLO41iMBEBTa3vG76ZjIqTZNvjF8ERITZSH
         aSdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788971491; x=1789576291;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ma38Wv2ffQef/AXdTmSMIurnRkX5AXVLXBWqj/OoDE=;
        b=UsGR7Fgga+c08QtfBHDVH7fXLl6gAqeXfJqyHxpVk23q9N3+I8qA4W4vXfULYI2jw9
         0uRGJ3S9zUyxrSjDrlw00tCdecTMj9NqU8px5aaIlcfqFjrpbaLPiWMM017X4OWluHkd
         foaIEL92x6yPU154zIEZAcvgRbJ8klFAIxKIV/i6aP+cYJCEjbcTVBphzIvH+1StIsFX
         GMWpbZwr69Bnjbk4knC7Q7wXYlMB29S2+QZS7e4qMbBtGINYaTNDT6Zt1oAM6Ch5KKCe
         +pkvY0AFqXnmmrlZqgZPRKvATVKVObfA//Dd5H6BVW3pDmmjGBDNxVnXJnB/uf8XH5Hl
         mAFg==
X-Gm-Message-State: AFuF++mLiDjyF1R9hHHCKTAuEgcmjMu61m8BLyd7Tel/LvQcPO0jUcDc
	i8JqM+EZ+98ZZOBStbsXp+8JN7XgmEA1ioeOMB8X+IWjRJ+ofUasLSLtAePVt4Pn
X-Gm-Gg: AYBFou3mLcCmmv3MJe1DONHTGn6wd9MjaAhc2IG8edUZXdXj3afmFMCmQJdkhpsGvnL
	5MM6bsqCrOtdXPdkj/0oxAiOVLtV6Z+2baN6ND5lttcJZjAzO3+vM4Lx0rtyZxOgGsmfgKrQMxe
	lrB6VaLGDo1ZGEf9PlzuPDYocAm2g6SnEFAeYEYJMhJkO+67DaBhEhGko2p+wLWlgiv/4bdgbxe
	NykKvCPTh4iSBjiTwyIN+gowNgqKHEvRV7mDQ4csQEfPaV+/fdbanVMMkFw02dLzwN3QC2xCZFe
	PPmY745+J9RWcmnbx2leZOWEr360Ii7/I0k5niANor6g7mvL0AmrPBouOGizLh75WSbEq8oGUN2
	fmLuWBaKOoA0C5MYJ7ZEaMQbhrYNrDJDPcjQvXRZN3LwX0U7PWpPlpgiMcweLx2nO6bTrPqHMpO
	rtt88SexxIm3clqD4l8XF1d3txojfVLwToVEXmXUi3I+9qjAGqvoq82vzqlrqgEevRO1QC5v1fj
	U3QwQ0JrhwIrnt/Z7gFKYREPjVpE3p9FDsEFfpJAI+WtmNCfkzbQDWSxwgZcqrNoavRBFvPANoS
	DzE=
X-Received: by 2002:a05:600d:640e:20b0:49c:ee06:9c58 with SMTP id 5b1f17b1804b1-49d258cdb3fmr17239555e9.4.1788971490946;
        Wed, 09 Sep 2026 09:31:30 -0700 (PDT)
Received: from localhost.localdomain ([84.77.88.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c06f04sm2763705e9.13.2026.09.09.09.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 09:31:25 -0700 (PDT)
From: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
To: opensbi@lists.infradead.org
Cc: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
Subject: [PATCH v2 08/14] lib: htif: add TSA annotations
Date: Wed,  9 Sep 2026 18:23:17 +0200
Message-ID: <20260909162322.29778-10-carlos.lopezr4096@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260909162322.29778-2-carlos.lopezr4096@gmail.com>
References: <20260909162322.29778-2-carlos.lopezr4096@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_093132_932619_B9E2617C 
X-CRM114-Status: GOOD (  11.30  )
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
