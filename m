Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8876C3ABAC
	for <opensbi@archiver.kernel.org>; Tue, 29 Apr 2025 16:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yaQdo6XsM+xAQSZvfOASbwXj6Y3fQL9Z1SHBQJoNP1s=; b=sqL3cKwfdOgF+a
	3IB1+9ry0SjqzoTFwrSDlLxPredfBRdgIusS68VPiDm5V6fnSFSVjU0ha7nRzkIL08OvJDoNuWgkE
	osolcZuuXU7zpp3ahNlEXhxrkNRxhC2gPLtujRzwAelYl8EcsBeii3H8+nlsPNMJ5q92yN3EEGqgC
	LweZZKPDVikrrW+Q7TETE+lL4ejX6UyOQAvrHQGECT6DZ+NystKc9sSn996Tc4xUZh1s21tgWemAt
	KfpP/AT1/IkRCfuKfPMQ3GMxRbe+nomIQ04KUN1g2RzUZnACglTliOmoMd5je9cTGeuTTJNbgLSN1
	f93crys8hwWGzkb/5QPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9o69-0000000AIcj-04HU;
	Tue, 29 Apr 2025 16:46:21 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9lyF-00000009xYH-2jUV
	for opensbi@lists.infradead.org;
	Tue, 29 Apr 2025 14:30:04 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3912b75c0f2so457801f8f.0
        for <opensbi@lists.infradead.org>; Tue, 29 Apr 2025 07:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745937002; x=1746541802; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dFdrd8TaXZ85gnWvq6JTV6X+/ypadpjCuMh0DkE/58g=;
        b=Hq9Vd1i91ctO2MpT/mzFQNPqndYsTh+pgMqBAhxNXPbNgtA/SDtWLrLAaI1p5xYtFi
         YpI0FLwEH0Jr/rj3FzpcXuN6Tbal3G2ncm7ZG9yyfxe3NczUWvlygrSLrIieEkBqqy3p
         yi2NlUrhXXsqNIWIEpm9cQwrMc9ng67i259p5Z/K+gE7Vb+PAKKJ/HLFuGlVlfJxT2gN
         Qs78hLRtyQ7I2dOPxDUHesTJZvFccCyeesCWVHmm6PHMHG8nbSk1ja1Bcj6+Arsz/xJ+
         SLTo4yZL+cfj6sw5mPq1s8+DC+tR37OoDpUicA737i5KRrfsBJ6YJ+hgT2vtw2y9Iuih
         BKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745937002; x=1746541802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dFdrd8TaXZ85gnWvq6JTV6X+/ypadpjCuMh0DkE/58g=;
        b=iccatLioFnh56nBRqcyB/WZOEkk2vUOMhU7y+ExQl1KCh2if6MML7cOM0knxJfVyKO
         EDVQGaAQamXUh5gvYo17376ynfjI/CC6X7Fg7KKxJSOTdQxlgXYSerHKzLzk15jui02W
         KrlAtsrFIf5oroES/mQdy2cJRl1KPcdMG1Kdmn0Rh/vWU+Q1vRPy9D8dWW5bGox7RDYm
         jw+KdyJl/bRzuapRnhF9n1jgoLJhh6BsQ3s4QmgVnqy4hdWkiUtlewqEsoW5cWn2W6ep
         ZYhgvRprNND6w00SnyHJMiNWL5PdUmGg25SAgba0/ajkUtnN6jGHnEREcxf849hBX0H9
         GekQ==
X-Gm-Message-State: AOJu0YxLqDghAZx64QZn2Vn/yj+zc5a3+/UAYs/jC19k9dioq7V/36FC
	9QNpZeB6lQ2s8N4r2hn5PIY+JpmZ7dY+gqIp9IL+s6QxnYdA8sJg4LEPhilqJ1Yk818YObynGMT
	sshc=
X-Gm-Gg: ASbGncsSORFu16gBgiALsTG0GdYOAxY9vt/wsjYrJC71DaeaUxWaeWQpM49eQeQUnHF
	CNpScqJEgFNRfD3xvfcbTjBUFwsujREY0dFjnuU59xbjdLCoCfv5yPhJBuKsfKePm4wlr99ArIA
	0Efo69XPDOzChL0nxINACogizwaEBujjujT1R7L2Cg0+uyi7gZr66pGoPcOP48sLbIzER3XiouS
	bjR/28iw/l2I5ZzV54aqEiD6OV3y6HlfyK+FCqs70ordu+Q3zRN5qPstkHOAwTg31eLD+H99Pkx
	fudXnxtLLMw1Pff6PS6vkujRmkPci5CzwyA9gVvmhpAvo0YA
X-Google-Smtp-Source: AGHT+IGIu9QtVpBP5tjBpkSb2mIZ2+B+q327XQFAfQGo07PwnZdkcdcyISXMdVdMDC9FgT5bKLRSRQ==
X-Received: by 2002:a05:6000:2c8:b0:391:c42:dae with SMTP id ffacd0b85a97d-3a08a22437fmr1194680f8f.4.1745937001762;
        Tue, 29 Apr 2025 07:30:01 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:b996:f7e3:35e8:5091])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8cd7fsm14112089f8f.1.2025.04.29.07.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 07:30:01 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: opensbi@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>
Subject: [PATCH v2 2/8] lib: sbi: use 64 bit csr macros
Date: Tue, 29 Apr 2025 16:25:44 +0200
Message-ID: <20250429142549.3673976-4-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250429142549.3673976-2-rkrcmar@ventanamicro.com>
References: <20250429142549.3673976-2-rkrcmar@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_073003_697771_74BE2E4B 
X-CRM114-Status: UNSURE (   9.90  )
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

U3dpdGNoIHRoZSBtb3N0IG9idmlvdXMgY2FzZXMgdG8gbmV3IG1hY3Jvcy4KClJldmlld2VkLWJ5
OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgpTaWduZWQtb2ZmLWJ5OiBSYWRpbSBL
csSNbcOhxZkgPHJrcmNtYXJAdmVudGFuYW1pY3JvLmNvbT4KLS0tCnYyOiBBZGQgUmV2aWV3ZWQt
YnkgW0FudXBdCi0tLQogbGliL3NiaS9zYmlfaGFydC5jICB8IDIwICsrKystLS0tLS0tLS0tLS0t
LS0tCiBsaWIvc2JpL3NiaV90aW1lci5jIHwgIDcgKy0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2Jp
X2hhcnQuYyBiL2xpYi9zYmkvc2JpX2hhcnQuYwppbmRleCBlZWZiMDNmMmI5YmEuLjI2ZDc0NmQz
MWRmZCAxMDA2NDQKLS0tIGEvbGliL3NiaS9zYmlfaGFydC5jCisrKyBiL2xpYi9zYmkvc2JpX2hh
cnQuYwpAQCAtODYsMTAgKzg2LDcgQEAgc3RhdGljIHZvaWQgbXN0YXR1c19pbml0KHN0cnVjdCBz
Ymlfc2NyYXRjaCAqc2NyYXRjaCkKIAl9CiAKIAlpZiAoc2JpX2hhcnRfaGFzX2V4dGVuc2lvbihz
Y3JhdGNoLCBTQklfSEFSVF9FWFRfU01TVEFURUVOKSkgewotCQltc3RhdGVlbl92YWwgPSBjc3Jf
cmVhZChDU1JfTVNUQVRFRU4wKTsKLSNpZiBfX3Jpc2N2X3hsZW4gPT0gMzIKLQkJbXN0YXRlZW5f
dmFsIHw9ICgodWludDY0X3QpY3NyX3JlYWQoQ1NSX01TVEFURUVOMEgpKSA8PCAzMjsKLSNlbmRp
ZgorCQltc3RhdGVlbl92YWwgPSBjc3JfcmVhZDY0KENTUl9NU1RBVEVFTjApOwogCQltc3RhdGVl
bl92YWwgfD0gU01TVEFURUVOX1NUQVRFTjsKIAkJbXN0YXRlZW5fdmFsIHw9IFNNU1RBVEVFTjBf
Q09OVEVYVDsKIAkJbXN0YXRlZW5fdmFsIHw9IFNNU1RBVEVFTjBfSFNFTlZDRkc7CkBAIC0xMTAs
MTcgKzEwNywxMSBAQCBzdGF0aWMgdm9pZCBtc3RhdHVzX2luaXQoc3RydWN0IHNiaV9zY3JhdGNo
ICpzY3JhdGNoKQogCQllbHNlCiAJCQltc3RhdGVlbl92YWwgJj0gflNNU1RBVEVFTjBfQ1RSOwog
Ci0JCWNzcl93cml0ZShDU1JfTVNUQVRFRU4wLCBtc3RhdGVlbl92YWwpOwotI2lmIF9fcmlzY3Zf
eGxlbiA9PSAzMgotCQljc3Jfd3JpdGUoQ1NSX01TVEFURUVOMEgsIG1zdGF0ZWVuX3ZhbCA+PiAz
Mik7Ci0jZW5kaWYKKwkJY3NyX3dyaXRlNjQoQ1NSX01TVEFURUVOMCwgbXN0YXRlZW5fdmFsKTsK
IAl9CiAKIAlpZiAoc2JpX2hhcnRfcHJpdl92ZXJzaW9uKHNjcmF0Y2gpID49IFNCSV9IQVJUX1BS
SVZfVkVSXzFfMTIpIHsKLQkJbWVudmNmZ192YWwgPSBjc3JfcmVhZChDU1JfTUVOVkNGRyk7Ci0j
aWYgX19yaXNjdl94bGVuID09IDMyCi0JCW1lbnZjZmdfdmFsIHw9ICgodWludDY0X3QpY3NyX3Jl
YWQoQ1NSX01FTlZDRkdIKSkgPDwgMzI7Ci0jZW5kaWYKKwkJbWVudmNmZ192YWwgPSBjc3JfcmVh
ZDY0KENTUl9NRU5WQ0ZHKTsKIAogCQkvKiBEaXNhYmxlIGRvdWJsZSB0cmFwIGJ5IGRlZmF1bHQg
Ki8KIAkJbWVudmNmZ192YWwgJj0gfkVOVkNGR19EVEU7CkBAIC0xNTYsMTAgKzE0Nyw3IEBAIHN0
YXRpYyB2b2lkIG1zdGF0dXNfaW5pdChzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gpCiAJCWlm
IChzYmlfaGFydF9oYXNfZXh0ZW5zaW9uKHNjcmF0Y2gsIFNCSV9IQVJUX0VYVF9TVkFERSkpCiAJ
CQltZW52Y2ZnX3ZhbCAmPSB+RU5WQ0ZHX0FEVUU7CiAKLQkJY3NyX3dyaXRlKENTUl9NRU5WQ0ZH
LCBtZW52Y2ZnX3ZhbCk7Ci0jaWYgX19yaXNjdl94bGVuID09IDMyCi0JCWNzcl93cml0ZShDU1Jf
TUVOVkNGR0gsIG1lbnZjZmdfdmFsID4+IDMyKTsKLSNlbmRpZgorCQljc3Jfd3JpdGU2NChDU1Jf
TUVOVkNGRywgbWVudmNmZ192YWwpOwogCiAJCS8qIEVuYWJsZSBTLW1vZGUgYWNjZXNzIHRvIHNl
ZWQgQ1NSICovCiAJCWlmIChzYmlfaGFydF9oYXNfZXh0ZW5zaW9uKHNjcmF0Y2gsIFNCSV9IQVJU
X0VYVF9aS1IpKSB7CmRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV90aW1lci5jIGIvbGliL3NiaS9z
YmlfdGltZXIuYwppbmRleCA4NmUwZGI1YWIzOTkuLjk5OGE5YTY3YzJmMCAxMDA2NDQKLS0tIGEv
bGliL3NiaS9zYmlfdGltZXIuYworKysgYi9saWIvc2JpL3NiaV90aW1lci5jCkBAIC0xMzksMTIg
KzEzOSw3IEBAIHZvaWQgc2JpX3RpbWVyX2V2ZW50X3N0YXJ0KHU2NCBuZXh0X2V2ZW50KQogCSAq
IHRoZSBvbGRlciBzb2Z0d2FyZSB0byBsZXZlcmFnZSBzc3RjIGV4dGVuc2lvbiBvbiBuZXdlciBo
YXJkd2FyZS4KIAkgKi8KIAlpZiAoc2JpX2hhcnRfaGFzX2V4dGVuc2lvbihzYmlfc2NyYXRjaF90
aGlzaGFydF9wdHIoKSwgU0JJX0hBUlRfRVhUX1NTVEMpKSB7Ci0jaWYgX19yaXNjdl94bGVuID09
IDMyCi0JCWNzcl93cml0ZShDU1JfU1RJTUVDTVAsIG5leHRfZXZlbnQgJiAweEZGRkZGRkZGKTsK
LQkJY3NyX3dyaXRlKENTUl9TVElNRUNNUEgsIG5leHRfZXZlbnQgPj4gMzIpOwotI2Vsc2UKLQkJ
Y3NyX3dyaXRlKENTUl9TVElNRUNNUCwgbmV4dF9ldmVudCk7Ci0jZW5kaWYKKwkJY3NyX3dyaXRl
NjQoQ1NSX1NUSU1FQ01QLCBuZXh0X2V2ZW50KTsKIAl9IGVsc2UgaWYgKHRpbWVyX2RldiAmJiB0
aW1lcl9kZXYtPnRpbWVyX2V2ZW50X3N0YXJ0KSB7CiAJCXRpbWVyX2Rldi0+dGltZXJfZXZlbnRf
c3RhcnQobmV4dF9ldmVudCk7CiAJCWNzcl9jbGVhcihDU1JfTUlQLCBNSVBfU1RJUCk7Ci0tIAoy
LjQ4LjEKCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
