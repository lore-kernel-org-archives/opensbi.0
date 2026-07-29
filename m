Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9AFC54F51
	for <opensbi@archiver.kernel.org>; Wed, 29 Jul 2026 16:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hr3TFzVmNHS6Sm58Ci51ss0pikFB6uUs5RQbiYTWjNY=; b=ctWjLe6lOvWinh
	kxcK3z5Woc+K6fa9VgJbtGep99C1diQkmqTzXdOTNpDf92iSkVAurx4Hbx9+dKazQ0cODnIVWO+th
	/WTcOUbrVJkU4tyO0amKLEiSKZ3iLdY9YhScD25u9rV0qYxndj4xmGod/BVlmpc58IWjWYrHDgEyU
	q0qP1H8DKyTD1SgKWZ81G3u1jXJNfmRtVBF/DeVEPOaLt3AhRzE9C83lClwRreol3Y0DGJc1NUUJR
	GR6M3bjkEi14qlS4ioXCfGOVUrnkPPGOKVuCiMgZQSxEDrHAozMetOAlpqFtxoUj7PdzuRfMdLUL8
	EM/k+gqa96/YfQ1IDEHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7Oj-00000008bXE-2Qda;
	Wed, 29 Jul 2026 16:44:49 +0000
Received: from mail-wr2-x00.google.com ([2a00:1450:4864:30::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7Oh-00000008bRf-15pG
	for opensbi@lists.infradead.org;
	Wed, 29 Jul 2026 16:44:48 +0000
Received: by mail-wr2-x00.google.com with SMTP id ffacd0b85a97d-472365266f5so461505f8f.1
        for <opensbi@lists.infradead.org>; Wed, 29 Jul 2026 09:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785343485; x=1785948285; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3Gr7mZvvP2RP8YVE9PzeeRU3+lkzjm5BZ3r6Inkw3mw=;
        b=UlfC81TR+ViOT+k/T+HubyA0vwFlxUALdyCddlwP2BjkYu55CUiIoY8DC1tenJgOn/
         vyZmhqSIhCLNtLdVkUtA2+73zYSyc+LJvLdGlydKuHOrhGvtELlJR3EFdrXGKaHeJQiF
         JihJGQzm/ludq2Bv6yDOV+uroKtmNzaywT+uZ1hyFaV90dQ3btJkrpb7EXcpFxUe7QII
         6MtEAMicyduYMGWPPt6KrX+OdY1K2y1X0QCM+efFfRHNHEMXUYYV49Ko+8ghGAEj7BkL
         zrsRfaK12p8vqdO8Y3TRUk441dRTIRGD/bE99j5WqH+nOpwQFwOy7qqnVauPOQgHowUd
         otlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785343485; x=1785948285;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Gr7mZvvP2RP8YVE9PzeeRU3+lkzjm5BZ3r6Inkw3mw=;
        b=m6Vx2eZkd9GroPI6r3EN2oJDRc9J435H6MzrVLj3aexuwB2ivmeIkBAi+AAjYUgJXE
         9FSIk/8ZfSs+7OLqIk7lCyAr5WIZW8Wtl9NzqoRDpI9uEoQmuuK2RFylDYqW6DsheA2v
         eOtGh2mr/d05vDhDFr4WlTRbSeEzOx5gZ2ghpgonslaAK7oKM4o/Z+cBg17Zrg6Ll789
         TZypmE+v/XNt/YkSHAgdOAKSezyEw1rjxixjWh1w/QfXCJZho5Qace7Xrkyf50HWHi9C
         zHKGiqCNvyWn4R1NbYVCu7TBw4IRZW/j8KyJ5XDSEbWOZQDUNf7yYElDvySr6Hvr2zIj
         mTQA==
X-Gm-Message-State: AOJu0Yy6AZJEzrxCUdmTLPEKFP//P8yXpYjc5McTaubuj+iI8XgUlWT1
	Izn/cppL6PAyW+FPxBNjgTTw0JBX+M89t4KxIpjKiikQCx8qXRQWpzNZ1P82aEM6Y2U=
X-Gm-Gg: AR+sD10qzNd2tHhPP+pCXqiASYPw3irUXsGJaT5CDTWof3KKlVgXur9O2YejWi1EbUE
	MHfunxYZvLySgmIvei9sfMjiu2e5a07uoOkhApeSej6BEPy+P8Uo+UUUS5DJ6L+fYvjxeVxNEz5
	/6fQK53dCjNFcoqEpqa2E3sBnvomW2XNabwBdFVi0Nzt/GxkzdzhMOHhYpoIrCCkd+q6IPvW2LT
	H6Ed0jmFWqdPKxqBsgAWX+DN2ND3sv8cQ/wyWuywBmR0j/cwDTRaUKt/xblF1N9092TYjpRQf+E
	jrXe1WEE1Z8szeIFaBaCLJ3VqxsE0Oh3oc2hCH61XB4WXaV6geeZtlzDjTL20Pqf8BPn1N06kew
	FLpXVRt8CktQVlRVo+KSQ9X0IrD9RU3dTH6TxD46myyq7uESdnsE4JwvsKTxWNPKLm4B7TzHCLa
	Q4GH6YAY5zBeyszf0FQXC4Nc7mcmv4NBNozxvHfeLnSwZtaH/00NHnXegGGVeBQ0S/OizPklE7d
	y/gYQrXzPa40Xu2AlA2BtJHK8xoFS9UsZfUSZ+LuDVxVR0zlvwWLFzFaA==
X-Received: by 2002:a05:6000:4008:b0:470:2fb1:3dbc with SMTP id ffacd0b85a97d-47fb1f149b0mr9507758f8f.35.1785343485506;
        Wed, 29 Jul 2026 09:44:45 -0700 (PDT)
Received: from leap.suse.de ([84.77.88.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6aa3a88sm8474869f8f.6.2026.07.29.09.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 09:44:45 -0700 (PDT)
From: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
To: opensbi@lists.infradead.org
Cc: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
Subject: [PATCH 13/14] lib: test: disable TSA for spinlock tests
Date: Wed, 29 Jul 2026 18:35:40 +0200
Message-ID: <20260729163540.3162978-15-carlos.lopezr4096@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260729163540.3162978-2-carlos.lopezr4096@gmail.com>
References: <20260729163540.3162978-2-carlos.lopezr4096@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_094447_312250_1EA10FC0 
X-CRM114-Status: UNSURE (   8.90  )
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

VGhlIHNwaW5sb2NrIHRlc3RzIGRlbGliZXJhdGVseSB1c2UgdW5jb252ZW50aW9uYWwgbG9ja2lu
ZyBwYXR0ZXJucyB0bwp0ZXN0IGVkZ2UgY2FzZXMuIERpc2FibGUgdGhyZWFkIHNhZmV0eSBhbmFs
eXNpcyBmb3IgdGhlbSBzbyB0aGF0IHRoZXkKZG9uJ3QgZ2VuZXJhdGUgZmFsc2UgcG9zaXRpdmVz
IHdoZW4gdGhlIGZlYXR1cmUgaXMgZW5hYmxlZC4KClNpZ25lZC1vZmYtYnk6IENhcmxvcyBMw7Nw
ZXogPGNhcmxvcy5sb3BlenI0MDk2QGdtYWlsLmNvbT4KLS0tCiBsaWIvc2JpL3Rlc3RzL3Jpc2N2
X2xvY2tzX3Rlc3QuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvbGliL3NiaS90ZXN0cy9yaXNjdl9sb2Nrc190ZXN0LmMgYi9saWIvc2JpL3Rl
c3RzL3Jpc2N2X2xvY2tzX3Rlc3QuYwppbmRleCA3ODk0YzRlOTg3M2MuLjJjYmJhM2RhOGI2YiAx
MDA2NDQKLS0tIGEvbGliL3NiaS90ZXN0cy9yaXNjdl9sb2Nrc190ZXN0LmMKKysrIGIvbGliL3Ni
aS90ZXN0cy9yaXNjdl9sb2Nrc190ZXN0LmMKQEAgLTQsNiArNCw3IEBACiBzdGF0aWMgc3Bpbmxv
Y2tfdCB0ZXN0X2xvY2sgPSBTUElOX0xPQ0tfSU5JVElBTElaRVI7CiAKIHN0YXRpYyB2b2lkIHNw
aW5fbG9ja190ZXN0KHN0cnVjdCBzYml1bml0X3Rlc3RfY2FzZSAqdGVzdCkKKwlOT19USFJFQURf
U0FGRVRZX0FOQUxZU0lTCiB7CiAJLyogV2UgZG9uJ3Qgd2FudCB0byBhY2NpZGVudGFsbHkgZ2V0
IGxvY2tlZCAqLwogCVNCSVVOSVRfQVNTRVJUKHRlc3QsICFzcGluX2xvY2tfY2hlY2soJnRlc3Rf
bG9jaykpOwpAQCAtMTYsNiArMTcsNyBAQCBzdGF0aWMgdm9pZCBzcGluX2xvY2tfdGVzdChzdHJ1
Y3Qgc2JpdW5pdF90ZXN0X2Nhc2UgKnRlc3QpCiB9CiAKIHN0YXRpYyB2b2lkIHNwaW5fdHJ5bG9j
a19mYWlsKHN0cnVjdCBzYml1bml0X3Rlc3RfY2FzZSAqdGVzdCkKKwlOT19USFJFQURfU0FGRVRZ
X0FOQUxZU0lTCiB7CiAJLyogV2UgZG9uJ3Qgd2FudCB0byBhY2NpZGVudGFsbHkgZ2V0IGxvY2tl
ZCAqLwogCVNCSVVOSVRfQVNTRVJUKHRlc3QsICFzcGluX2xvY2tfY2hlY2soJnRlc3RfbG9jaykp
OwpAQCAtMjYsNiArMjgsNyBAQCBzdGF0aWMgdm9pZCBzcGluX3RyeWxvY2tfZmFpbChzdHJ1Y3Qg
c2JpdW5pdF90ZXN0X2Nhc2UgKnRlc3QpCiB9CiAKIHN0YXRpYyB2b2lkIHNwaW5fdHJ5bG9ja19z
dWNjZXNzKHN0cnVjdCBzYml1bml0X3Rlc3RfY2FzZSAqdGVzdCkKKwlOT19USFJFQURfU0FGRVRZ
X0FOQUxZU0lTCiB7CiAJU0JJVU5JVF9FWFBFQ1QodGVzdCwgc3Bpbl90cnlsb2NrKCZ0ZXN0X2xv
Y2spKTsKIAlzcGluX3VubG9jaygmdGVzdF9sb2NrKTsKLS0gCjIuNTEuMAoKCi0tIApvcGVuc2Jp
IG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
