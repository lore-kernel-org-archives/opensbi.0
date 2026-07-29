Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FA3C54F55
	for <opensbi@archiver.kernel.org>; Wed, 29 Jul 2026 16:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H659wR1GnVqMWWYWMrSdRbE3Uu09/D2R0Co6D4mr66E=; b=o3XLdv4vAUEcJl
	JJw0bONP561RL2d3EfnGcIDoudkx2bcZ591Sg/SXpAtWek7xydGgC/2DIknW7Z/7J4nOdC5Do3oRN
	1Mf0kkfPppDfxB1uWwvfPKlLrwMrfAzndEnBlKOXSylEgCnktjtDuVB6+qA67zm6c/LZ+KSnIVXgZ
	ovZBLRjXCiyf997mvhfDMdeV1n9Bata1v2cCOVCUD7HUJ/o+hXh436P7LJboo9pLQZYUtIu3ePj2A
	8FHMzcYAzYv/CPVgJk7FSIeQpWM7oizdy6tUBKg2DsABGUgJEDEqylBt1+VbQe4HIv/Q9n68SWNUk
	l+ZjM/hozOtZCDzHRBCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7OZ-00000008bHn-2GNH;
	Wed, 29 Jul 2026 16:44:39 +0000
Received: from mail-wr2-x00.google.com ([2a00:1450:4864:30::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7OW-00000008bFd-1oI6
	for opensbi@lists.infradead.org;
	Wed, 29 Jul 2026 16:44:37 +0000
Received: by mail-wr2-x00.google.com with SMTP id ffacd0b85a97d-472365266f5so461437f8f.1
        for <opensbi@lists.infradead.org>; Wed, 29 Jul 2026 09:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785343474; x=1785948274; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yc6owcx70m+9Q0fJS9kthbLo2/885+vEnEQO3aK5LR8=;
        b=ZUruDHONod4kiPIdv1GtrX0usuIt1WFg//FYIdsXX/BhmH8093usKzccQe2CYri+GW
         iEN/JfUJw94YwsyYvuYfAUOX7k/utWJ7Jt46OPy11cFfPeo1FdBiC8eH9KLTjtocsYbi
         g4m5BYb3Z4wkDVpbWeQCKMVZHwm3fPgnfZ4aeCkvAqUZkKbAer8GZLkl+Xi3ySIfGVVk
         e0r816QP2h0qgQ27JiWdlNprHWvLu+h1fiKoXw8txRK6d8cGfAXt2zn7echK5mwJWflL
         OrdtVzXl/yl3rFgxr4gcl1x10Qb4TmjXliS4SlzmJ1CB1fIQ+72LUkU/QQ0duyJWxhuy
         iPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785343474; x=1785948274;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yc6owcx70m+9Q0fJS9kthbLo2/885+vEnEQO3aK5LR8=;
        b=ZcGk6vfBhtA4FZ+D7cQhyvHoMlDSRcvy+x35N75ys86NFZxOjZ9/FpNioebdBaW5Cj
         cu6+zdP7d4tY97OfQUUVWGt56HOP19HSu20gagHBfs7xJ36yO3yW3GVhAPME0IsLPHLa
         s7WLXkRF1zZHKO1ckvBdJrA+BthgZaNlsY1J2nRPIGiWhOE+VoqCDlJvtOklZE11vft/
         9QQVeiwZ7nggERgbGof0972c9kHr400m580CNCuEbqQK47JPcbQM2f5AvSfAt3cCp8TP
         LRkiPgy7X8rJnSGugwJn4Tv8Mel8Y7o7YIOVzJJtvZbSwk0Q3Hf5GEOjO+pmg6t6lYB5
         ToIw==
X-Gm-Message-State: AOJu0Yz2NdMpg5P5xZbenq3OXf/Z4glmcwtGrAxlnRUCc3Yq1HyAdM/X
	0f20yYityvEp0qefSgh5uAA37l63mGTLl5BxhhHzehMmSnaEL3y362K2nR7A1Zh+AMs=
X-Gm-Gg: AR+sD11W50P/kwPYG/2S0/peaPMDIJnWTPIwq5UeYQlCQNaPAmQRjZeQYvDwEk6JPCD
	LkblqRbZYVSa7C0ZeFBvb35C3QWHqHxVl2BXSGRGhoRX87ybZ3gmL7LLCEtNTVjr+bb2A7oV2x9
	XzJHsbPShHUnX6qMoKSbZndUMrD/ONL4jfHIQBK2roEcErC9peUYM7xfJyIaAX4cP1N+QcAmmx1
	2cjyenVHwguIPzlwnChWijYPQFht+LLKmRpN0xh/R390geIei4vrDMMncHQogyPAveTxxlnH6J7
	2kwhzkug7HqYqPFKzWo25q12ZEIFzA17FnR8Ci4Jzd+AWKW5+9edxfFQ36SfHGE3rQKS9+Qm2dE
	Pxd/cKdU9QJOFP+ZqgESR7LisK3BGOc3gZ9QRnx5KJiGmH5GgSn7S1BHoXTr7teR5aE6SIliKNj
	qvbn53E5EbSaDQBczKU2s1cwR8sR0UT3zQjkq5h20eNhLxSdS6hiU86jQLaay9V3OGisbpVaD4Q
	Q+IOJPJ8I4dfLKr7yQiv0x61pWmXpcKQLNowPsMYIg9KJVZba2iCRk33pNUmJD+lBwZ
X-Received: by 2002:a05:6000:4008:b0:470:2fb1:3dbc with SMTP id ffacd0b85a97d-47fb1f149b0mr9506871f8f.35.1785343474405;
        Wed, 29 Jul 2026 09:44:34 -0700 (PDT)
Received: from leap.suse.de ([84.77.88.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6aa3a88sm8474869f8f.6.2026.07.29.09.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 09:44:34 -0700 (PDT)
From: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
To: opensbi@lists.infradead.org
Cc: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
Subject: [PATCH 01/14] include: sbi: add thread safety analysis macros
Date: Wed, 29 Jul 2026 18:35:28 +0200
Message-ID: <20260729163540.3162978-3-carlos.lopezr4096@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260729163540.3162978-2-carlos.lopezr4096@gmail.com>
References: <20260729163540.3162978-2-carlos.lopezr4096@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_094436_479098_0C5FE443 
X-CRM114-Status: UNSURE (   7.39  )
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

QWRkIG1hY3JvcyB0byBwcm9wZXJseSBndWFyZCBjbGFuZydzIHRocmVhZCBzYWZldHkgYW5hbHlz
aXMgYXR0cmlidXRlcwprZWVwaW5nIGNvbXBhdGliaWxpdHkgd2l0aCBHQ0MsIG9uIHRvcCBvZiBt
YWtpbmcgdGhpbmdzIG1vcmUgcmVhZGFibGUuCgpTaWduZWQtb2ZmLWJ5OiBDYXJsb3MgTMOzcGV6
IDxjYXJsb3MubG9wZXpyNDA5NkBnbWFpbC5jb20+Ci0tLQogaW5jbHVkZS9zYmkvc2JpX3Zpc2li
aWxpdHkuaCB8IDE3ICsrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3NiaV92aXNpYmlsaXR5LmggYi9pbmNs
dWRlL3NiaS9zYmlfdmlzaWJpbGl0eS5oCmluZGV4IGY5MDBjNDQ1NjVhNC4uNTZlYmI4Mzg1NWQ3
IDEwMDY0NAotLS0gYS9pbmNsdWRlL3NiaS9zYmlfdmlzaWJpbGl0eS5oCisrKyBiL2luY2x1ZGUv
c2JpL3NiaV92aXNpYmlsaXR5LmgKQEAgLTE1LDQgKzE1LDIxIEBACiAjcHJhZ21hIEdDQyB2aXNp
YmlsaXR5IHB1c2goaGlkZGVuKQogI2VuZGlmCiAKKy8qIFRocmVhZCBTYWZldHkgQW5hbHlzaXMg
KFRTQSkgYW5ub3RhdGlvbnMgZm9yIHVzZSB3aXRoIGNsYW5nIC1XdGhyZWFkLXNhZmV0eSAqLwor
I2lmIGRlZmluZWQoX19jbGFuZ19fKQorI2RlZmluZSBDTEFOR19BVFRSKHgpIF9fYXR0cmlidXRl
X18oKHgpKQorI2Vsc2UKKyNkZWZpbmUgQ0xBTkdfQVRUUih4KQorI2VuZGlmCisKKyNkZWZpbmUg
Q0FQQUJJTElUWSh4KSBDTEFOR19BVFRSKGNhcGFiaWxpdHkoeCkpCisjZGVmaW5lIEdVQVJERURf
QlkoeCkgQ0xBTkdfQVRUUihndWFyZGVkX2J5KHgpKQorI2RlZmluZSBQVF9HVUFSREVEX0JZKHgp
IENMQU5HX0FUVFIocHRfZ3VhcmRlZF9ieSh4KSkKKyNkZWZpbmUgQUNRVUlSRSguLi4pIENMQU5H
X0FUVFIoYWNxdWlyZV9jYXBhYmlsaXR5KF9fVkFfQVJHU19fKSkKKyNkZWZpbmUgUkVMRUFTRSgu
Li4pIENMQU5HX0FUVFIocmVsZWFzZV9jYXBhYmlsaXR5KF9fVkFfQVJHU19fKSkKKyNkZWZpbmUg
TVVTVF9IT0xEKC4uLikgQ0xBTkdfQVRUUihyZXF1aXJlc19jYXBhYmlsaXR5KF9fVkFfQVJHU19f
KSkKKyNkZWZpbmUgTVVTVF9OT1RfSE9MRCguLi4pIENMQU5HX0FUVFIobG9ja3NfZXhjbHVkZWQo
X19WQV9BUkdTX18pKQorI2RlZmluZSBUUllfQUNRVUlSRShiLCAuLi4pIENMQU5HX0FUVFIodHJ5
X2FjcXVpcmVfY2FwYWJpbGl0eShiLCBfX1ZBX0FSR1NfXykpCisjZGVmaW5lIE5PX1RIUkVBRF9T
QUZFVFlfQU5BTFlTSVMgQ0xBTkdfQVRUUihub190aHJlYWRfc2FmZXR5X2FuYWx5c2lzKQorCiAj
ZW5kaWYKLS0gCjIuNTEuMAoKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9vcGVuc2JpCg==
