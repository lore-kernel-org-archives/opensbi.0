Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC6B1062894
	for <opensbi@archiver.kernel.org>; Wed, 11 Mar 2026 12:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ln9WxaFBouoqmd4ym+nUSN38/G8YrQs3Nd0NxVrMezY=; b=XjmPbfGePudxbY
	1ejHi7lLT/tJKK21wuwXu/ScE2sFrNDMP13r9VG4a31yhenoWEmnwi/xvVFa34Xs82uerxl4qeE9j
	uLdTHlGibG9lQItPPV93VFLd/Gbs62vSWvo8WBOW8e/EWoCKLhfbefSO9UK0OyRie7OICUam7OyGC
	1vx1uos8CzBXGjjMi/ErvRhwxp/4G376qDkQC63TCQxrEqk2GMyKogxRB5s8VIbz9dxNrfep5BB/c
	KfSbHbxVlO9E5g8jBNKYPmPC+STIy9RluuXijghP6m3+7VMBW75O629Ubg6mWEnxVFO0yy6Lzkv1D
	GsNhSxw5puhXnx3SZt3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0J2C-0000000Bayr-00Di;
	Wed, 11 Mar 2026 12:51:32 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0J2A-0000000Baxr-0Ozm
	for opensbi@lists.infradead.org;
	Wed, 11 Mar 2026 12:51:31 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4852f8ac7e9so53893185e9.1
        for <opensbi@lists.infradead.org>; Wed, 11 Mar 2026 05:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1773233488; x=1773838288; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvKKWw5VPLH7BNcSJzpaIOlBYFE7QCCHVyzvBKNxGHg=;
        b=a4KFxVmLAyIfi/t8dwHLTLLlgtfQIvn6/xspn2tePTEYC0h3rXw8X1AXThRcgGXLaq
         hL6oSa/kdGvdHXsIWxRiBr63RMxj4+mHD32pGYxgjSxY/8Q4DSRfuVYphy65QSBkGJSk
         RINSo1aqjOL/Wat/n8F8OsNb0se67dmgr1reimE/fyQ7oWJYERo8YlwOParHCr1EVjYO
         ZAKfzHsYPb9WPHtPI5FYrcm5qNnUmG7YptvJGLmVGHbHq/C18AJpM7ZaBBD6l69YdxTY
         Sf65RY16V4FkrU06kM9ERUMNL1hnND2LT0gCAPbpXTs2RSonu2MbGTZLNGCIZpSm13Fp
         U41A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773233488; x=1773838288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HvKKWw5VPLH7BNcSJzpaIOlBYFE7QCCHVyzvBKNxGHg=;
        b=if6s4QxXXcT/sDdULZZG9fUKXSuzhEcqr2ZMoa70ZlHiHBFUl6clbmMG3cTNErPojo
         F1w5D58fBMqFFgSvPQ6beXfkTzaw2Cyn2C0eO3LNMx2lMjE2S5pjUmDobaM1OVXUXJPu
         4Sro5TjyhyKxhixjKyV8hWGf3WNlcARu8MbKLLOsIMS4iSNsgfvfNYbPhvJEx/vyl49I
         J2avFivbkkWMSi3Wb6rP/2cUmS3/XG/oShQl6dKRLt/B+hlYeGGF//pemjtkc9AvDKft
         nxqbTLn7BOK7d04lNVmlPZz6RhFkYZiUtpuFDWIChkPoicTVB/7+utpvzVhE7eWiudkI
         TS9g==
X-Gm-Message-State: AOJu0Yyhvv9nm0d/rtbSpoexMUuS8EWf3W4aay0kWQsBBj/xDM+Qy2w6
	2FcG4h/Id67yBDz+SI/80cVu0G5oRcE1gVbxoKNRnHjRLnGTBxBZvGqLl3do2VVUMPp3cyZWv1I
	xMCYUDiXekj51S6pkGg3xuZHbYTupXB8THxiXzFRxKi5Gk6Gg04++KxfT70639kGI4gVThBoJdK
	zhYOwVYf/jPIluNyY2GDX78S2k1emJ4UCQ7wiZO01nLTUscuLoTHw=
X-Gm-Gg: ATEYQzzHuCEvFRe90CgmSj17oIGdiRZuqZERPKKfOnypOOWmutD4JNyI5tpn4o0EOUD
	qOVMLUmmu6z650TWvBgdnenOjYEBP1IAbzBuLu6PFLMt13UkWPnQNjqEsJmyi9/+qQ/d0jztSYF
	GRS22z2Q3mGFckeGp+ZiJf6RcfUYMm5ddgp5cpUoMac4gpbIMi8E6IyR72qKO+HPHBFhJBBFEfJ
	H2O6Yy4AGf+GNKffoMFApaqXyQv0JNDFHGm7FjBt5ZOi9vUpT/1b9cR6R+nxjfK0WqP9YdUSr6J
	smxUPLe9kQovcclslHQmURZgxJN6nGGil14x7lLAJhkj9/NKMO8m/rHzIaMqHLePp13+tvnuXAX
	V5AXEkaRfiCTp/QafcdCODaAOf44yTglw0gpnyEENbpJNNDKbdZSZ2ksBiSkPOLnbUawNuI92iA
	k2PXGd2LEP+HJ7qEblRYabWaih4PICgrpmphqjscHeMhOdoz8=
X-Received: by 2002:a05:600c:4452:b0:485:40a4:364 with SMTP id 5b1f17b1804b1-4854b145513mr40791435e9.26.1773233488015;
        Wed, 11 Mar 2026 05:51:28 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b0dcf2asm27463495e9.8.2026.03.11.05.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 05:51:26 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH 2/2] lib: sbi_bitmap_test: add tests for bitmap_empty()
Date: Wed, 11 Mar 2026 20:51:16 +0800
Message-ID: <20260311125116.1401002-2-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20260311125116.1401002-1-peter.lin@sifive.com>
References: <20260311125116.1401002-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_055130_146690_C76AFBED 
X-CRM114-Status: UNSURE (   7.70  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

Add tests for bitmap_empty(), covers empty/non-empty bitmaps and
edge case nbits=0.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 lib/sbi/tests/sbi_bitmap_test.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/lib/sbi/tests/sbi_bitmap_test.c b/lib/sbi/tests/sbi_bitmap_test.c
index d2c35996..b6586fe1 100644
--- a/lib/sbi/tests/sbi_bitmap_test.c
+++ b/lib/sbi/tests/sbi_bitmap_test.c
@@ -92,10 +92,39 @@ static void bitmap_xor_test(struct sbiunit_test_case *test)
 	SBIUNIT_EXPECT_MEMEQ(test, res, data_zero, DATA_SIZE);
 }
 
+static void bitmap_empty_test(struct sbiunit_test_case *test)
+{
+	unsigned long res[DATA_SIZE];
+
+	/* All zeros = empty */
+	SBIUNIT_EXPECT_EQ(test, bitmap_empty(data_zero, DATA_BIT_SIZE), true);
+
+	/* Non-zero data = not empty */
+	SBIUNIT_EXPECT_EQ(test, bitmap_empty(data_a, DATA_BIT_SIZE), false);
+	SBIUNIT_EXPECT_EQ(test, bitmap_empty(data_b, DATA_BIT_SIZE), false);
+
+	/* bitmap_zero creates empty bitmap */
+	bitmap_zero(res, DATA_BIT_SIZE);
+	SBIUNIT_EXPECT_EQ(test, bitmap_empty(res, DATA_BIT_SIZE), true);
+
+	/* bitmap_fill creates non-empty bitmap */
+	bitmap_fill(res, DATA_BIT_SIZE);
+	SBIUNIT_EXPECT_EQ(test, bitmap_empty(res, DATA_BIT_SIZE), false);
+
+	/* Single bit set = not empty */
+	bitmap_zero(res, DATA_BIT_SIZE);
+	bitmap_set(res, 0, 1);
+	SBIUNIT_EXPECT_EQ(test, bitmap_empty(res, DATA_BIT_SIZE), false);
+
+	/* Zero nbits = empty */
+	SBIUNIT_EXPECT_EQ(test, bitmap_empty(data_a, 0), true);
+}
+
 static struct sbiunit_test_case bitmap_test_cases[] = {
 	SBIUNIT_TEST_CASE(bitmap_and_test),
 	SBIUNIT_TEST_CASE(bitmap_or_test),
 	SBIUNIT_TEST_CASE(bitmap_xor_test),
+	SBIUNIT_TEST_CASE(bitmap_empty_test),
 	SBIUNIT_END_CASE,
 };
 
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
