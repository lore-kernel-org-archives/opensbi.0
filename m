Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69FC0C8303C
	for <opensbi@archiver.kernel.org>; Tue,  8 Jul 2025 11:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1cZXBJHiP24/6wbGKHrCdt7rzX//AmNxJNNMbgIczSs=; b=T2eB91h0ukqT4i
	jcYZhY7RNKQjNuEEcqT8bRCd2CBkx+rJR+0Dv7B0OwPp9msTzpbjECVpaSjHyWlg4Q88Phc1Y2MPS
	gFvUo74w6zU/bVBJ60xhtAl9rFmrqwt4vmT89vRSaGOXclwJD6yE9Y76qKI4yL6G/DS65gb7rNesV
	tklnsnKa5UvqwRbG9at7to9B6avOsVPcPRD1dyKp+43jpIz4qF27d4qXhGPdcTw9wz9KuZJ2Wb20r
	tLSd3H1mIPujXamlVchH03TXXDFFkb4FPYfoL4xgbyWfpLP8EdNKYHWP6UUOY0z5838lWwyO810Ew
	AVhmykRuo6djENIdbckg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ6Oi-00000005BCG-0IZS;
	Tue, 08 Jul 2025 11:22:04 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ5s2-00000005742-2UA6
	for opensbi@lists.infradead.org;
	Tue, 08 Jul 2025 10:48:19 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-742c7a52e97so3219766b3a.3
        for <opensbi@lists.infradead.org>; Tue, 08 Jul 2025 03:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1751971698; x=1752576498; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PHV+NmMofHhqjhxZCdzpnxiJ6Q/TQPA1SZeRXza/2H8=;
        b=YfpcvRXEfU23oGa8MKDlxHAmjUyR+bn3BeoV7UnVHdcR1UgtPYJ6WTzwUrp8U9xZV3
         LAqwAkyzAfnByMaRTmAbEje9wV3jqxNj8VNMNbf3b0aJxECXUy+3iJ/7mO9JmTXMz8D3
         Nfn2vKpRCu7i6UxHYbWA8qhWZjYukw5Ht4nuxW07MF7daRzVBP3IjjF/jMINxdmO18F0
         aBfKLWPxjBR98RwkJxwGjFtaCVCHuqX9rawbC7Kh1Wa8Yp0dx6r7MxAJx5JFrAN4D50m
         0YBfdKqPLDX3oPLYRXd87LK3Ov+B5RSsmmJYX6jxavT+FEm6NHttRREVnJavUgQK6Rx7
         /FLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751971698; x=1752576498;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PHV+NmMofHhqjhxZCdzpnxiJ6Q/TQPA1SZeRXza/2H8=;
        b=hXkJvFA//3m0jdMx1AQvccaxqPlHgcaThf3oCE2EWfYTamlQD/lL8jpMWJ99ppZX7K
         DKOpSE78foP6Dr7t/TSnzwIGvHI7x65d9M3nRq+Vfq7Z7oRHSYOQxqsh1SgjFQ9f7nxm
         58dRMcKB/npo8yHJk2ZwZhD3bG6aw7EA/Ghn5LJ99okG1du4hQ49/iMrJi+7htLEl66B
         S+HQOLk8w+N1ex9FNW6KP99PozvCnWpUpgzWch6lbXBG3Eh9Uvpi9AUR87Rpy8r+dCtk
         XRfYwJi+SAYftetSNtXeds+oj7skTXn8cqwr1XnutfgNwd56wUe/jNoY6GtIyahvZWwE
         t2Vg==
X-Gm-Message-State: AOJu0YxyuFCpSPvWysZSXG7u/Sx6Zoh76I6sHghXwFSgfLk+23/aDLQi
	Y8cl2gr2UDFEPEazNkaGh0fqIHgkuPCCQmrdfWwCv8zdw7UcbSa0lNEPz1gL45JQv80=
X-Gm-Gg: ASbGncu0kW+OQgIOaZB5UK39yfIbPS0iSqgwE1PXtD2T4avtPZDfZ7d0VIAOzay8das
	2mAvJPH8F0FoCJRLd2gBwXptmV9FO0SxocBq+d0ghXtxvejWrkd9N7rmlWHnEJCtHRBHbmFTNCN
	Z04QWTf+KVduLjHlkREgqNRXw0CgPr5UAZY06297wuGLHq44iiIq3T2bJBIwLZ5ymD0DdXdLtXM
	02UDewdOvY7Hd5USzYi3lmvQ/KN2ZymIJkYS6NTs7wXSgjhgSNBvOemdOElgzB7HoqSQcQrW6RS
	u8eRhfs/QIQYFoxUMYv0IN929lmfBi+xeJCylMtgYDcYW7z7wby/NFHSSuIu
X-Google-Smtp-Source: AGHT+IHdEz120eJiHSYpQRQqGi1s4Q9J+nByzpQwFaSCM1BFzDIeXQRXXb/0S4gDUsS7+AkZcAvJWQ==
X-Received: by 2002:a05:6a00:1795:b0:748:e150:ac5c with SMTP id d2e1a72fcca58-74d24443a9emr3563413b3a.23.1751971697624;
        Tue, 08 Jul 2025 03:48:17 -0700 (PDT)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce35ccbaasm11735279b3a.41.2025.07.08.03.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 03:48:17 -0700 (PDT)
From: Max Hsu <max.hsu@sifive.com>
Date: Tue, 08 Jul 2025 18:48:09 +0800
Subject: [PATCH] lib: utils: fdt: fix "ranges" translation
MIME-Version: 1.0
Message-Id: <20250708-dev-maxh-master_fdt_helper-v1-1-866c165f1f85@sifive.com>
X-B4-Tracking: v=1; b=H4sIAGj3bGgC/x3MQQqDMBBG4avIrA3EUGvxKiLBOn+agVZlIiIE7
 27o5sG3eZkSVJCorzIpDkmyLgVNXdEcp+UDI1xMzrrWdvZlGIf5TWcsSTvUB959xHeDmseTHYC
 37WamMtgUQc7/fBiv6wasY4RMbAAAAA==
X-Change-ID: 20250708-dev-maxh-master_fdt_helper-46d2eeeb07cd
To: opensbi@lists.infradead.org
Cc: Max Hsu <max.hsu@sifive.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2257; i=max.hsu@sifive.com;
 h=from:subject:message-id; bh=Kev6nA7S0hpFgDHPcOpIYKcaQWwL/84GcFltMmPxYdg=;
 b=owEB7QES/pANAwAKAdID/Z0HeUC9AcsmYgBobPdwuSlp0m1ELyTDXGbZEtx/Few9fsmPCfHLP
 FuUzmdrR5OJAbMEAAEKAB0WIQTqXmcbOhS2KZE9X2jSA/2dB3lAvQUCaGz3cAAKCRDSA/2dB3lA
 veW5DACim4HgOv1t1dPHcNkzyQWuqOWR+/EdUXS5yedqcTWv1CPELjwJI3KvbdQKxctGkOAbUyK
 0NyqqRjjWAv/mnR+nzLdkIN7MYpCoPkZUvHK8X7UzeTsuFOAdv/vdlpP1cSnOBfRrOXLW2hhYC8
 sDGhdrZAS7xQL/1MPLjTyRo5GJy52IfTbVaGNJVvgdQMjLsKbuZbqZl5rzRqlNCHAbK5pb15PwW
 MYGIuALZ8agGvKvHZ7rXT4GJyW80h2diMlwxm5nBe/HaAaA9hN3GjC/qYJP6Q9bgpqwzLkDhN2Q
 lRu9ozWx++hu6aQVEBgoWOf0748nztBilcsk/YjmtmI7K5GeX+0km/gdJLVlG8TY7CCB1vfuzee
 EGfcipwAhkGoM//GPCkw//QI3h9jzuUmie4hUy025veZPYzQKVM0HEyypDIqvYiTqUSszaiTwuJ
 OEQnpseuaNIzDhDVU+Ze5j881NJTV5b77EKX3ML8l+1++tff2xaPuayhn8VUOwu1A0N10=
X-Developer-Key: i=max.hsu@sifive.com; a=openpgp;
 fpr=EA5E671B3A14B629913D5F68D203FD9D077940BD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_034818_648824_5F972E0D 
X-CRM114-Status: GOOD (  11.99  )
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
IGNvbnNpZGVyZWQgdGhlIHBhcmVudCBhZGRyZXNzIHNpemUKaXMgZXF1YWwgdG8gdGhlIGNoaWxk
IGFkZHJlc3Mgc2l6ZTsgVGhpcyBjb21taXQgZml4IHRvIHBhcnNlIHR3bwphZGRyZXNzIHNpemVz
IGFuZCBwYXJzaW5nIHRoZSBhZGRyZXNzIGluZGVwZW5kZW50bHkuCgpMaW5rOiBodHRwczovL2Rl
dmljZXRyZWUtc3BlY2lmaWNhdGlvbi5yZWFkdGhlZG9jcy5pby9lbi9sYXRlc3QvY2hhcHRlcjIt
ZGV2aWNldHJlZS1iYXNpY3MuaHRtbCNyYW5nZXMgWzFdCgpTaWduZWQtb2ZmLWJ5OiBNYXggSHN1
IDxtYXguaHN1QHNpZml2ZS5jb20+Ci0tLQogbGliL3V0aWxzL2ZkdC9mZHRfaGVscGVyLmMgfCAx
NCArKysrKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNSBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9saWIvdXRpbHMvZmR0L2ZkdF9oZWxwZXIuYyBiL2xpYi91
dGlscy9mZHQvZmR0X2hlbHBlci5jCmluZGV4IDBmNDg1OWMxYTcyMWJjN2MyODcxYmFjZWZlMjdj
YWJhNzc4MGY3NTIuLjc3OTE0OTk0MmRkOWM3ZWI1MTgyZmVlMzJlOWZlN2YwNWMzNzUyY2YgMTAw
NjQ0Ci0tLSBhL2xpYi91dGlscy9mZHQvZmR0X2hlbHBlci5jCisrKyBiL2xpYi91dGlscy9mZHQv
ZmR0X2hlbHBlci5jCkBAIC04NCwxMiArODQsMTYgQEAgc3RhdGljIGludCBmZHRfdHJhbnNsYXRl
X2FkZHJlc3MoY29uc3Qgdm9pZCAqZmR0LCB1aW50NjRfdCByZWcsIGludCBwYXJlbnQsCiAJCQkJ
IHVpbnQ2NF90ICphZGRyKQogewogCWludCBpLCBybGVuOwotCWludCBjZWxsX2FkZHIsIGNlbGxf
c2l6ZTsKKwlpbnQgY2VsbF9wYXJlbnRfYWRkciwgY2VsbF9jaGlsZF9hZGRyLCBjZWxsX3NpemU7
CiAJY29uc3QgZmR0MzJfdCAqcmFuZ2VzOwogCXVpbnQ2NF90IG9mZnNldCwgY2FkZHIgPSAwLCBw
YWRkciA9IDAsIHJzaXplID0gMDsKIAotCWNlbGxfYWRkciA9IGZkdF9hZGRyZXNzX2NlbGxzKGZk
dCwgcGFyZW50KTsKLQlpZiAoY2VsbF9hZGRyIDwgMSkKKwljZWxsX2NoaWxkX2FkZHIgPSBmZHRf
YWRkcmVzc19jZWxscyhmZHQsIHBhcmVudCk7CisJaWYgKGNlbGxfY2hpbGRfYWRkciA8IDEpCisJ
CXJldHVybiBTQklfRU5PREVWOworCisJY2VsbF9wYXJlbnRfYWRkciA9IGZkdF9hZGRyZXNzX2Nl
bGxzKGZkdCwgZmR0X3BhcmVudF9vZmZzZXQoZmR0LCBwYXJlbnQpKTsKKwlpZiAoY2VsbF9wYXJl
bnRfYWRkciA8IDEpCiAJCXJldHVybiBTQklfRU5PREVWOwogCiAJY2VsbF9zaXplID0gZmR0X3Np
emVfY2VsbHMoZmR0LCBwYXJlbnQpOwpAQCAtOTgsOSArMTAyLDkgQEAgc3RhdGljIGludCBmZHRf
dHJhbnNsYXRlX2FkZHJlc3MoY29uc3Qgdm9pZCAqZmR0LCB1aW50NjRfdCByZWcsIGludCBwYXJl
bnQsCiAKIAlyYW5nZXMgPSBmZHRfZ2V0cHJvcChmZHQsIHBhcmVudCwgInJhbmdlcyIsICZybGVu
KTsKIAlpZiAocmFuZ2VzICYmIHJsZW4gPiAwKSB7Ci0JCWZvciAoaSA9IDA7IGkgPCBjZWxsX2Fk
ZHI7IGkrKykKKwkJZm9yIChpID0gMDsgaSA8IGNlbGxfY2hpbGRfYWRkcjsgaSsrKQogCQkJY2Fk
ZHIgPSAoY2FkZHIgPDwgMzIpIHwgZmR0MzJfdG9fY3B1KCpyYW5nZXMrKyk7Ci0JCWZvciAoaSA9
IDA7IGkgPCBjZWxsX2FkZHI7IGkrKykKKwkJZm9yIChpID0gMDsgaSA8IGNlbGxfcGFyZW50X2Fk
ZHI7IGkrKykKIAkJCXBhZGRyID0gKHBhZGRyIDw8IDMyKSB8IGZkdDMyX3RvX2NwdSgqcmFuZ2Vz
KyspOwogCQlmb3IgKGkgPSAwOyBpIDwgY2VsbF9zaXplOyBpKyspCiAJCQlyc2l6ZSA9IChyc2l6
ZSA8PCAzMikgfCBmZHQzMl90b19jcHUoKnJhbmdlcysrKTsKCi0tLQpiYXNlLWNvbW1pdDogYTMy
YTkxMDY5MTE5ZTdhNWFhMzFlNmJjNTFkNWUwMDg2MGJlM2Q4MApjaGFuZ2UtaWQ6IDIwMjUwNzA4
LWRldi1tYXhoLW1hc3Rlcl9mZHRfaGVscGVyLTQ2ZDJlZWViMDdjZAoKQmVzdCByZWdhcmRzLAot
LSAKTWF4IEhzdSA8bWF4LmhzdUBzaWZpdmUuY29tPgoKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlz
dApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
