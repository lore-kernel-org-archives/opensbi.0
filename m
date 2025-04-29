Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C24AC3ABAD
	for <opensbi@archiver.kernel.org>; Tue, 29 Apr 2025 16:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zncVomAVLHZ67kxA1rF6chxaQSEbXt9eynwVYizMT54=; b=CwYou2VV5qrOHu
	P/ybuYeIQzyQSA7mGelVWrpyOmibdZE9bWanWGGYQm6FcR23TusQzqZkqIiwmtd7RrE91qECDlvg5
	r8SYhwH7WiP0J3D7iWADttw+VQeQvhIaLMxhAlGoRMUFCCQlaKkBE6x2SrYqK88TxWSX2TYldcSXY
	BhNJNBWftVXizjiOGvu0rrTONP/+cehRS7we6xe5lFwuRpeveZwgDPsOtUr93JyFzdpAfPRWuA/AD
	V44GfQd+Aqo/3Dzu3k+dFgMFJn9zsz3j+chMmmw1wJNDs0ELvyuLgOkuHSeaedtEEBBfUvQiKjFix
	jK2Ji78V6sCFXeOGYZag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9o69-0000000AIdP-23Rh;
	Tue, 29 Apr 2025 16:46:21 +0000
Received: from mail-wm1-f53.google.com ([209.85.128.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9lyH-00000009xYh-0lzF
	for opensbi@lists.infradead.org;
	Tue, 29 Apr 2025 14:30:06 +0000
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43eeb4e09b5so7356925e9.1
        for <opensbi@lists.infradead.org>; Tue, 29 Apr 2025 07:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745937003; x=1746541803; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jWbg476VpZTAZ0jNm2+62Dbxu7vYPM2uEfQ8x0CkqKE=;
        b=CieSuhuxo0QqSAQOx4q+CeX7qh7k9cLA6+qaeVZoF1QVMi04Ec5aJ+dRQzB7O5AySl
         yC7dq7dzHheBopJUaBEsfhMG7b8u0WUAUwGIjrWugwhuhoGYJEThl6fmMfOxxYLMx2nd
         6NSDpqfQPQL//RT2Ksb3a9RDRYoElr/aNWJTx0gKE2Xv7BwmrljmzOtkW4OkFrLLrdec
         0rSrMHc6wtJk0GE8rpwz04TQ6HAo+FhmTwOuJDPwn6HLHGUMpKRZ+iMI0IT14/5A5IKS
         NyfbEG8nOSDG82Ck5C8h0X/aoPQfzApVrpC0ID/vU2Jl4lInVENbhUQ+BYKkqaiOUM1H
         Al9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745937003; x=1746541803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jWbg476VpZTAZ0jNm2+62Dbxu7vYPM2uEfQ8x0CkqKE=;
        b=mF/UblryIodu3DbD+v520Kc4NFGXkcNObnktVcEF1BXX055PvQ7ZLHy5qaxF2zQ9ZD
         3xreeYRBefp/tk80WTSMnYlxtVYy7bwJCuiOwpWhexmv+UxIikFPVcAwAJR0Bt2lNcq8
         rXCdRa50JOOUOlYiiqZpLzFEXVJvl7fpXjtBPk7ywcyVS9kjUMh15OtJzOebU7XzUtpB
         RZne6+8AbAXVIGU5ZKpBhWhBRAxYKRkoy22HEwLCktq9vMfGKAbrfyOhmHCEBhRhNqlW
         aTqD4i1HEczY3j2/ZkEgExZNCIWTCWfW44qvd/HAErVks9Ev3Fl+vzqtkox2ZwKb7WZK
         Fjlw==
X-Gm-Message-State: AOJu0Yyx1A/2dTMS+10N8MRFNURbK3R5Aedw9QMrxq0Tp9+ucaVfjX9d
	ff2/EdxOLWE7mdYaei1Z7EU0sG23ncsDcOEyOBebTzeIHcD4U0pSFlkSqh9DHOzBHZ5h3H6SZ8A
	339U=
X-Gm-Gg: ASbGncsS4V9r2QB6LQd2N3gS+CnxE+bJiMdxecpRswxXN1YtCtsIDwPRcRSs2m02ppH
	66Yw4ADjsTOrfhGFoC4wzu1JPuSvqj4w3IYVKGFSjPl1tP4ucJM7i23WcwmhecH/G8IjvCJ2FdM
	F/7Mx3Fv3CRh45NzK8eKidlZjVQBMj5GLe9LyunIBOvoXeX1nGQZG2V2QHHzrAm/udJH/s4RCGo
	CMcVgWI1x/kjbtfLgUs94UHcouWf++EIPq+ASPHpeeAeFvPH9A5sZKWdlot0rl6zxN6GLiQjQa6
	PhP778vmyZ9r/XDgPVSvGeox14mJ3etgcsEH5xuoovjF7Knf
X-Google-Smtp-Source: AGHT+IFI0vKMEMlsRB8jk/7kqxn7wEq2O4JiLVWJ1frDSpjN5cRzlaFlmfjEoH38if2h9PCBundmWw==
X-Received: by 2002:a05:600c:4e8d:b0:43d:fa5e:50e6 with SMTP id 5b1f17b1804b1-441ac8c9426mr4113095e9.9.1745937002824;
        Tue, 29 Apr 2025 07:30:02 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:b996:f7e3:35e8:5091])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5c6a0sm14042597f8f.86.2025.04.29.07.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 07:30:02 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: opensbi@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>
Subject: [PATCH v2 3/8] lib: sbi_hart: reset hstatus
Date: Tue, 29 Apr 2025 16:25:45 +0200
Message-ID: <20250429142549.3673976-5-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250429142549.3673976-2-rkrcmar@ventanamicro.com>
References: <20250429142549.3673976-2-rkrcmar@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_073005_222422_6B085A0C 
X-CRM114-Status: GOOD (  10.00  )
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
c28gZG8gdGhhdCBiZSBzYWZlLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+ClNpZ25lZC1vZmYtYnk6IFJhZGltIEtyxI1tw6HFmSA8cmtyY21hckB2ZW50YW5h
bWljcm8uY29tPgotLS0KdjI6IEFkZCBSZXZpZXdlZC1ieSBbQW51cF0KLS0tCiBsaWIvc2JpL3Ni
aV9oYXJ0LmMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2xpYi9zYmkvc2JpX2hhcnQuYyBiL2xpYi9zYmkvc2JpX2hhcnQuYwppbmRleCAyNmQ3
NDZkMzFkZmQuLjVlYTczMjhhMThjOSAxMDA2NDQKLS0tIGEvbGliL3NiaS9zYmlfaGFydC5jCisr
KyBiL2xpYi9zYmkvc2JpX2hhcnQuYwpAQCAtODUsNiArODUsOSBAQCBzdGF0aWMgdm9pZCBtc3Rh
dHVzX2luaXQoc3RydWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoKQogI2VuZGlmCiAJfQogCisJaWYg
KG1pc2FfZXh0ZW5zaW9uKCdIJykpCisJCWNzcl93cml0ZShDU1JfSFNUQVRVUywgMCk7CisKIAlp
ZiAoc2JpX2hhcnRfaGFzX2V4dGVuc2lvbihzY3JhdGNoLCBTQklfSEFSVF9FWFRfU01TVEFURUVO
KSkgewogCQltc3RhdGVlbl92YWwgPSBjc3JfcmVhZDY0KENTUl9NU1RBVEVFTjApOwogCQltc3Rh
dGVlbl92YWwgfD0gU01TVEFURUVOX1NUQVRFTjsKLS0gCjIuNDguMQoKCi0tIApvcGVuc2JpIG1h
aWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
