Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C38C369DC
	for <opensbi@archiver.kernel.org>; Tue, 29 Apr 2025 14:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oS/Xcts/4jiGEqtrcIpbRb/Ne/ygJXkF7porR7pXdZc=; b=zustQov7g3tPrQ
	FBXQwHq2rSslKrj8pWce5oDakHNnGQyNBtSIxM8KJ8GQq7Xo2DTnj+XePWqAk3SzzYjpk2eFSPxDY
	H35xZQeqzH96LPdN8pXu8J9Yz6RDvXMXqH0nCDXOmmcWycMkRF8YZoJ3MSTyXGKal4+tR4xb2ziDM
	L6H91tHfosb7NnR/PQ+NNaw0OkEyDaT+ZpvZdGVtZ5ahsiT/1wuRvoZw8PA6SO/tx6UuMPNrZxmTV
	aNnRoOcYwL8yOWwtuCDMFHndRiteIXXi4lAY8NaMDBbVi7nyfzoZLRVobHB7Tpa8oxLwZn0RhaKMe
	akJ3PKf3lzzWpttTO10Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9mDK-00000009zyL-3uX3;
	Tue, 29 Apr 2025 14:45:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9lyO-00000009xal-18LM
	for opensbi@bombadil.infradead.org;
	Tue, 29 Apr 2025 14:30:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/XQHQBXDnUCPfxtL9vw5NCvi+Ibijpo+6lTydumO9iA=; b=qjiT73yRHQyZJN5bDa3KzH2/t/
	GFj3Ndaxh942/CZEhelLRuU1IEuxsEmyJnTpzZJwL2ShkVoZ/IslhIHSq9hcdhMrHdhgj6K571gwX
	+wEI74rbka6mZhPIE2F0jWFJQ3pcQJwdSsTj0HP2qwZjJDyj1l/XAdvhMEmvj8tEjMLt4eL7Yr5lc
	PFfIuvmFLABtHZZBwfyS3dFiW4p0J5GZNtmQBP4biK7ozbt/zNtH3fyqobo/Ny+pgGXzxhDG2WZfV
	YwYp/zRFkANg3P/IFHAuN7/wENbi899cQlsbkgDsMbZYHU0glHgFaduG8OALFMJek2KWyuA8UVWUY
	T8AaxUsg==;
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9lyL-0000000DOAF-0Foi
	for opensbi@lists.infradead.org;
	Tue, 29 Apr 2025 14:30:11 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-39d94327297so730947f8f.0
        for <opensbi@lists.infradead.org>; Tue, 29 Apr 2025 07:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745937006; x=1746541806; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/XQHQBXDnUCPfxtL9vw5NCvi+Ibijpo+6lTydumO9iA=;
        b=mpWIx+C2AuNg+g+7+GlHyRe+TC39Kto6SPZBOMSjf1c8kPFcwiTEB/jyhobpkA1gNt
         +Q2Er/jupMVimn+7j6OOMRLdQb2iM0oqu40VmP8uS2Q+2sRu5jb6wAWkpejDEuOFZlb7
         yvq9kWPpgI+WaSMs8M5VPjMi67iR7jauXRX5RHxgTrM8VIYcms3V0BHCzd1KDyl8mRTm
         pa9n4oJ2Fdt611Ik0q3Xcsp60xlOCeZYBxNniBd8XcN+MaIVGGvOyr5PQyS43rs8l8hS
         R/hNe2MxLx2Z/k/FotGORFk/KY31KQhbwnJjK4ygr3Smug3N94bS266d+lJ77V5j8o4v
         TFsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745937006; x=1746541806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/XQHQBXDnUCPfxtL9vw5NCvi+Ibijpo+6lTydumO9iA=;
        b=aUgmCxhtIIa2ahZTwyF970f3ETFhBqzxVJXZxrrAP4gOGjrdPYBjbe7yMYcxLJXuuh
         O8f/alcQ9M9fkgFP8/LpdbZAoj3WmzPRllq30e08az/7rpY7XqG09J0HLBLoOcDCLzoI
         1HEvnbXOHW5Hu8n9d05pMpy2lG4wBXzCQC9l537cMpQHj+PGBfhKLI+CpgLvMElPAW29
         Q/5fpNiK3Oy6ImNyf2Xma66hSjGz6dB7/z+INl5ib71nCyXtpZpcVTydspQObht74ia1
         4uC6tx9XdmAlX8J8I82IRy7i+/XSLreZFolSHiv6IHmnRxFph0guoHoJ7p1dFf6z57zf
         Xl4Q==
X-Gm-Message-State: AOJu0YwyUggEZapHJM9Y+92TcnMyKTGlP6yKN3SRIcgbUDwVf9aGW3Uq
	UOe3G8S9m8+ADNZEOuXpgBa/7r5FPEanXuLyjeea1nM5z5Hm+lePPwe5GOUwQw3l9v2H7Jaop5u
	iCVk=
X-Gm-Gg: ASbGncta1HC2hxFm+d4S2zdxZpBRF0gwmYyxvlja+46EYqf9IKIaam+EnlKtdtVwxcZ
	CePljBqgF4brLAMayIzpxmn5F8bLJZ3Lj1HpfZ8QkQswH13Ap6DLFiwF6kIicHdEpDU8nKYx55B
	vZZ40A56ne80pyc4aEu1qjYbeQ3gzNTAoORwxARsaMhytMp0OXphX/SJc2t8SxQdReySj7U7lO1
	fy94gngVZePAmLHaQJVzFaejNwCMS/PN5E2zHRjPppunQcIownXq0FtaBwBeSZtXByiIY0FF24L
	nrHSHs6iZaBf4Svo5x+iJGI5F2csekn1vTLrjLGs/9H3CD8j
X-Google-Smtp-Source: AGHT+IEFmawyU7QRGnejqijUZkKhVCvC8HmCTJ0jZTHOh/ewWGnQ1BeCin/1Cw3MN4F5kdBKp5GVRg==
X-Received: by 2002:a05:6000:2212:b0:391:277e:c400 with SMTP id ffacd0b85a97d-3a08a3499b6mr1020615f8f.13.1745937006611;
        Tue, 29 Apr 2025 07:30:06 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:b996:f7e3:35e8:5091])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5d264sm14439382f8f.95.2025.04.29.07.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 07:30:06 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: opensbi@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>
Subject: [PATCH v2 7/8] lib: sbi_hart: add Ssstateen extension
Date: Tue, 29 Apr 2025 16:25:49 +0200
Message-ID: <20250429142549.3673976-9-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250429142549.3673976-2-rkrcmar@ventanamicro.com>
References: <20250429142549.3673976-2-rkrcmar@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_153009_228634_0A96CECF 
X-CRM114-Status: GOOD (  10.71  )
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

V2UgYWxyZWFkeSBkZXRlY3QgU21zdGF0ZWVuLCBidXQgU3NzdGF0ZWVuIGV4aXN0cyBhcyB3ZWxs
IGFuZCBpdCBkb2Vzbid0CmhhdmUgdGhlIE0tc3RhdGUgQ1NScy4KClJldmlld2VkLWJ5OiBBbnVw
IFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgpTaWduZWQtb2ZmLWJ5OiBSYWRpbSBLcsSNbcOh
xZkgPHJrcmNtYXJAdmVudGFuYW1pY3JvLmNvbT4KLS0tCnYyOgoqIEltcHJvdmUgY29tbWVudHMu
IFtBbnVwXQoqIEFkZCBSZXZpZXdlZC1ieSBbQW51cF0KLS0tCiBpbmNsdWRlL3NiaS9zYmlfaGFy
dC5oIHwgNCArKystCiBsaWIvc2JpL3NiaV9oYXJ0LmMgICAgIHwgNCArKysrCiAyIGZpbGVzIGNo
YW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2luY2x1
ZGUvc2JpL3NiaV9oYXJ0LmggYi9pbmNsdWRlL3NiaS9zYmlfaGFydC5oCmluZGV4IGMzYTdmZWI3
NTNkOS4uYmNlODhjNTk4NGY0IDEwMDY0NAotLS0gYS9pbmNsdWRlL3NiaS9zYmlfaGFydC5oCisr
KyBiL2luY2x1ZGUvc2JpL3NiaV9oYXJ0LmgKQEAgLTMxLDcgKzMxLDcgQEAgZW51bSBzYmlfaGFy
dF9leHRlbnNpb25zIHsKIAlTQklfSEFSVF9FWFRfU01BSUEgPSAwLAogCS8qKiBIQVJUIGhhcyBT
bWVwbXAgKi8KIAlTQklfSEFSVF9FWFRfU01FUE1QLAotCS8qKiBIQVJUIGhhcyBTbXN0YXRlZW4g
Q1NSICoqLworCS8qKiBIQVJUIGhhcyBTbXN0YXRlZW4gZXh0ZW5zaW9uICoqLwogCVNCSV9IQVJU
X0VYVF9TTVNUQVRFRU4sCiAJLyoqIEhhcnQgaGFzIFNzY29mcG10IGV4dGVuc2lvbiAqLwogCVNC
SV9IQVJUX0VYVF9TU0NPRlBNRiwKQEAgLTc5LDYgKzc5LDggQEAgZW51bSBzYmlfaGFydF9leHRl
bnNpb25zIHsKIAlTQklfSEFSVF9FWFRfU01DVFIsCiAJLyoqIEhBUlQgaGFzIENUUiBTLW1vZGUg
Q1NScyAqLwogCVNCSV9IQVJUX0VYVF9TU0NUUiwKKwkvKiogSEFSVCBoYXMgU3NzdGF0ZWVuIGV4
dGVuc2lvbiAqKi8KKwlTQklfSEFSVF9FWFRfU1NTVEFURUVOLAogCiAJLyoqIE1heGltdW0gaW5k
ZXggb2YgSGFydCBleHRlbnNpb24gKi8KIAlTQklfSEFSVF9FWFRfTUFYLApkaWZmIC0tZ2l0IGEv
bGliL3NiaS9zYmlfaGFydC5jIGIvbGliL3NiaS9zYmlfaGFydC5jCmluZGV4IGM2YTc3OTQ5MGM3
MC4uOGRjNjFkNmZmMjMwIDEwMDY0NAotLS0gYS9saWIvc2JpL3NiaV9oYXJ0LmMKKysrIGIvbGli
L3NiaS9zYmlfaGFydC5jCkBAIC02OTUsNiArNjk1LDcgQEAgY29uc3Qgc3RydWN0IHNiaV9oYXJ0
X2V4dF9kYXRhIHNiaV9oYXJ0X2V4dFtdID0gewogCV9fU0JJX0hBUlRfRVhUX0RBVEEoc3NkYmx0
cnAsIFNCSV9IQVJUX0VYVF9TU0RCTFRSUCksCiAJX19TQklfSEFSVF9FWFRfREFUQShzbWN0ciwg
U0JJX0hBUlRfRVhUX1NNQ1RSKSwKIAlfX1NCSV9IQVJUX0VYVF9EQVRBKHNzY3RyLCBTQklfSEFS
VF9FWFRfU1NDVFIpLAorCV9fU0JJX0hBUlRfRVhUX0RBVEEoc3NzdGF0ZWVuLCBTQklfSEFSVF9F
WFRfU1NTVEFURUVOKSwKIH07CiAKIF9TdGF0aWNfYXNzZXJ0KFNCSV9IQVJUX0VYVF9NQVggPT0g
YXJyYXlfc2l6ZShzYmlfaGFydF9leHQpLApAQCAtOTQwLDYgKzk0MSw5IEBAIF9fcG1wX3NraXA6
CiAJLyogRGV0ZWN0IGlmIGhhcnQgc3VwcG9ydHMgbXN0YXRlZW4gQ1NScyAqLwogCV9fY2hlY2tf
ZXh0X2NzcihTQklfSEFSVF9QUklWX1ZFUl8xXzEyLAogCQkJQ1NSX01TVEFURUVOMCwgU0JJX0hB
UlRfRVhUX1NNU1RBVEVFTik7CisJLyogRGV0ZWN0IGlmIGhhcnQgc3VwcG9ydHMgc3N0YXRlZW4g
Q1NScyAqLworCV9fY2hlY2tfZXh0X2NzcihTQklfSEFSVF9QUklWX1ZFUl8xXzEyLAorCQkJQ1NS
X1NTVEFURUVOMCwgU0JJX0hBUlRfRVhUX1NTU1RBVEVFTik7CiAJLyogRGV0ZWN0IGlmIGhhcnQg
c3VwcG9ydHMgc21jbnRycG1mICovCiAJX19jaGVja19leHRfY3NyKFNCSV9IQVJUX1BSSVZfVkVS
XzFfMTIsCiAJCQlDU1JfTUNZQ0xFQ0ZHLCBTQklfSEFSVF9FWFRfU01DTlRSUE1GKTsKLS0gCjIu
NDguMQoKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
