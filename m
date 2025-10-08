Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88083CAC5BB
	for <opensbi@archiver.kernel.org>; Wed,  8 Oct 2025 08:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jy62t9FhpgcKnYsj5TQtbrWrQNpyU9TuKHP87DSgCcs=; b=lfyS45M04WXMeT
	8ZBIsuhcMeqLAJLNmgJJxP9MkJFXSzvTZdjO5Gu7nNaJZn1ShGYSQZXIE6vMEPi4tqHUtJSuTvzuN
	Vz4HoKlPd3B/TBXfYQuvAXF5TOGeAHW0AhoEc9S9xLS+od7ZBRdbsnwXrlpCYfkOZ8rT/g7/3Dkbp
	vM2DJYYiRUuP9fItfFJzehM/+DY/ZVgB2HMgaRqcc7Q6Jrpofaj+f413MjdbF0lSD/x+sPIvNX9T4
	26e1Gf7syIGTqOrk+SSNh7qJ6TvoA6zSf5P8XtFvYR/QXp+1hznogOLAfOCf3a5Vw3PmahVs37C8E
	ZO6do7mu1hJtJrdpEbFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6PnJ-00000003UbS-0flK;
	Wed, 08 Oct 2025 08:45:09 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6PnG-00000003UYl-2GVc
	for opensbi@lists.infradead.org;
	Wed, 08 Oct 2025 08:45:07 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b4755f37c3eso6217364a12.3
        for <opensbi@lists.infradead.org>; Wed, 08 Oct 2025 01:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1759913105; x=1760517905; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9Ddpc0TXeL8gn2eFr5gV9mXkaue02e1xF73743I5gQ=;
        b=XNEl+Yt5qooH+oAZCxDeYeyvvzmwsGmFr0UQnXFdHN3AJzze+HzH5+XrJqau2VTW3P
         UB6WL0ueEn4U1lw8Dh8wftlHalbMxafYs76vZwibp48ZWoQnQes2CqsOlAzD29ale8BY
         i7nvD9gUk1ecXyrIbrp4oTCeCkTOulGDxmEN84ciWE+GC/dgnoD9iZMJ+7RpFd8SMvCq
         wNqop+lHFKoJ5feVoto5BvAYmVJyZE4YGjUjs/ItKeQqd2QwjtjK985deE+OilsAf+gP
         lyrHnO1dCRS61dnbLCMN+TtqSqC5hCQeZPMxB5ebPEwdrtetHDDS9KRXr559wwpTZa1K
         5cQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759913105; x=1760517905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L9Ddpc0TXeL8gn2eFr5gV9mXkaue02e1xF73743I5gQ=;
        b=G/rCKOUx68DRJ2YCJO5fLETn+a2PdsdVHflxRHvlM4QgYZk5TKFAaCT224QmXe9vl2
         RvkqNvqwUY+RzspeygI5pCrbAF2gtrFuZqWj5IXM1OFuvJ1DywwD/f+AOgPO6JoIoUzJ
         dYFomj9HD23zrXpgBcVUT3L8h+vG/IvG0vYiJp9BYGZWer8YfAalN9u2rYia+ADcdWIC
         2+GvpFkWkx5hdAm6np8rQbX68Pif/oAjQnorlNPLhOUXnvDTLBJBZv8uhMLTLIY8DngR
         msi+58Ag5yQI1YU7S1uH7dluBjk9O/V5Xe0vMgDcz+MyEU51qRHWKwIVh0Pozjvannac
         pBbg==
X-Gm-Message-State: AOJu0YzNw+YqYevqYkGrAffx7YfsMygaSnjzKrPMaSt/XHRNuMDam03Y
	T1KnD9rhqOC6IX9US2AQM1rrQS4JGXcTZ/BdVbOVn8CjhkeIFGiw8doa+hFFUaEa1ZbOuxIZ2Lz
	sN1gNj+DPHb6IHsGdIb5L1AvpQRLXoGs+DfztYjw4HqBF8GDTj/SRBJoLJHZ3/i6WwrAMVYMncI
	2wdeQ4qwZgaJuo/A1y6J42keA54vvK/LyvIg6ynEjiLcH7pPkSlT4=
X-Gm-Gg: ASbGnct14h/FEZhVuSezDobaHVeRAK4+dPGbWRLujxax9qAynnKtfL1MIXtXB2LSlv+
	QxDPFGyEL1s/KyapS70yhu1J0kjcTj0qrO3EpUB3x1ZQ6AWth20P4/PYRFxObrxvJgD++CJp+Rh
	DBXDXoIDQaij8xM9Q7uPriaBpiSVIb4pJ19qUfRRk7e4aN7cGPRQb1jmE2YckL/6fxO5PQBM6BH
	MCuNazhI6zDnZ0KpR8XcRPxytbYvjDQ7tlDRV8dke6SbEbPT/mGkxzhYkCv+/dpRV5YVlMQ2xNl
	WABJDqs+pZor03MSIgb2ham0v13PI74RHTD5/VZzRLWQS20cNTDOkNM/xffeyv/CANK6yw+4Cjw
	/auLv3kKIRtW9RgvIqWJ/8OLw4Lhn58ls4mnVXhlY+uNOPyhgTGok/Qi0LTansYhb4LDbgb5RnZ
	iytrloh3lL1D53KkDAVHAhstYeFRxyubRuJ3Q/V1Hj3DTgqpNMGv1hZa55
X-Google-Smtp-Source: AGHT+IFqzBiUCpkN7RF8uoEr+dJUPTmhLOstR2DBCj2m0bGV56jOXJpLGgFrolVfueAHiTofXWQFIA==
X-Received: by 2002:a17:902:e5c6:b0:268:db2:b78f with SMTP id d9443c01a7336-29027402c15mr39356365ad.44.1759913105404;
        Wed, 08 Oct 2025 01:45:05 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28ecaefd60fsm51327255ad.93.2025.10.08.01.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 01:45:05 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	wxjstz@126.com,
	alvinga@andestech.com,
	anup@brainfault.org,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v2 8/8] lib: sbi_domain_context: preserve firmware PMP entries during domain context switch
Date: Wed,  8 Oct 2025 16:44:44 +0800
Message-ID: <20251008084444.3525615-9-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251008084444.3525615-1-peter.lin@sifive.com>
References: <20251008084444.3525615-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_014506_583480_788E8388 
X-CRM114-Status: GOOD (  10.04  )
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

V2hlbiBTbWVQTVAgaXMgZW5hYmxlZCwgY2xlYXJpbmcgZmlybXdhcmUgUE1QIGVudHJpZXMgZHVy
aW5nIGEgZG9tYWluCmNvbnRleHQgc3dpdGNoIGNhbiB0ZW1wb3JhcmlseSByZXZva2UgYWNjZXNz
IHRvIE9wZW5TQknigJlzIG93biBjb2RlIGFuZApkYXRhLCBsZWFkaW5nIHRvIGZhdWx0cy4KCktl
ZXAgZmlybXdhcmUgUE1QIGVudHJpZXMgZW5hYmxlZCBhY3Jvc3Mgc3dpdGNoZXMgc28gZmlybXdh
cmUgcmVnaW9ucwpyZW1haW4gYWNjZXNzaWJsZSBhbmQgZXhlY3V0YWJsZS4KClNpZ25lZC1vZmYt
Ynk6IFl1LUNoaWVuIFBldGVyIExpbiA8cGV0ZXIubGluQHNpZml2ZS5jb20+Ci0tLQogbGliL3Ni
aS9zYmlfZG9tYWluX2NvbnRleHQuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX2RvbWFpbl9jb250ZXh0LmMgYi9saWIv
c2JpL3NiaV9kb21haW5fY29udGV4dC5jCmluZGV4IGZiMDRkODFkLi41MTUzNGRlMSAxMDA2NDQK
LS0tIGEvbGliL3NiaS9zYmlfZG9tYWluX2NvbnRleHQuYworKysgYi9saWIvc2JpL3NiaV9kb21h
aW5fY29udGV4dC5jCkBAIC0xMTYsNiArMTE2LDEwIEBAIHN0YXRpYyB2b2lkIHN3aXRjaF90b19u
ZXh0X2RvbWFpbl9jb250ZXh0KHN0cnVjdCBoYXJ0X2NvbnRleHQgKmN0eCwKIAogCS8qIFJlY29u
ZmlndXJlIFBNUCBzZXR0aW5ncyBmb3IgdGhlIG5ldyBkb21haW4gKi8KIAlmb3IgKGludCBpID0g
MDsgaSA8IHBtcF9jb3VudDsgaSsrKSB7CisJCS8qIERvbid0IHJldm9rZSBmaXJtd2FyZSBhY2Nl
c3MgcGVybWlzc2lvbnMgKi8KKwkJaWYgKHNiaV9oYXJ0X3NtZXBtcF9pc19md19yZWdpb24oaSkp
CisJCQljb250aW51ZTsKKwogCQlzYmlfcGxhdGZvcm1fcG1wX2Rpc2FibGUoc2JpX3BsYXRmb3Jt
X3RoaXNoYXJ0X3B0cigpLCBpKTsKIAkJcG1wX2Rpc2FibGUoaSk7CiAJfQotLSAKMi40OC4wCgoK
LS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
