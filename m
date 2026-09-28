Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A95A9CA5FA2
	for <opensbi@archiver.kernel.org>; Mon, 28 Sep 2026 11:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RoWSMFgp9IaAXjvTNnZw5thfV2NXI4Dkr9Q8JWEZAEo=; b=HCeCjRgs3BiYBX
	yp4oe8NjXPBxfV99mGoa8wAMiq67Uh1WUzkTRMhp+aR0ScSGl0asT08UIV30eIRcDR8N+78E+zcwZ
	oxCbIaBWllK3oG0VrbbFzfJBW0+m73Rhdx74OLmSJ/9G8Ro3OUnJiU0bLonq80RR6I19MP0ATmUBh
	C7KRF4rB6iC6YWfS7806mfmCfa3C+7tbZaC9paW5Dj7PeLMB2lichTMuO4bMeR9KOdUJWTH3DNbp9
	P5hSrcC/sQzhnwZiEBW+806jNFGui9o/wfqsTttebSIolZ31rKOESCxJvubotT5IpGzOFLDM2Upya
	nXcohou2StQAcT4P8r7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB9Jz-00000000QdW-0Yks;
	Mon, 28 Sep 2026 11:14:59 +0000
Received: from mout.web.de ([212.227.15.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB9Jw-00000000Qd7-19jS
	for opensbi@lists.infradead.org;
	Mon, 28 Sep 2026 11:14:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1790594092; x=1791198892; i=michaelestner@web.de;
	bh=nGg0WNDRfxoZ9fKF5bakBBOT2QifpspNhFHLFshZHAY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=KnC0iFtSm4HBxWtkOCY6LipNpHVLI1IqRsu6I9nieMSgOTwc1ZFg0BdfRWTmUYoe
	 ozomqGecbmlUi+gD5RiDppREX8JIMU87l6vXDoZOo392YAcnctdMB1bdIob+Xvu11
	 0eOOc6xWB0FHKDvxap7zaBdD3mXn0saxMLrUYaCRVWYjPiOCpGXqRQZi2Ch7I9Wrq
	 V+GeB7gXBT5z2adM32+i6z2CeLpHaIPFSMIlAEv0nuuLOpVSZXbnDqu/C3p7ndORz
	 Mw8RDPU0VfwxYI820Hd9gaH+txwO9hUETiivD/baxAw0Tk6AJSzlqbXLBo1EBE5Ji
	 jA5xdvZTUvbuyZ1zug==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mo6Jz-1wMSga3ijz-00fOJJ; Mon, 28
 Sep 2026 13:14:51 +0200
From: Michael Estner <michaelestner@web.de>
To: opensbi@lists.infradead.org
Cc: Michael Estner <michaelestner@web.de>
Subject: [PATCH] lib: tests: add bitmap set and clear tests
Date: Mon, 28 Sep 2026 13:14:42 +0200
Message-Id: <20260928111442.289267-1-michaelestner@web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:Hvyt1zJ1cH7CX9irk4TZoZa7b2erdfxxEB3Qtf9WhAS9iqnyzA2
 m3CUcMz1wrCZ5HZgQ0PkBjaxT43miJKzBA3duUG9QdiN718k86Ho0rCBj0EiYS58vDCw9sp
 nr4MTVl4XYIkVtJGf8684MMGJNuOyGrFNAurCHtnThzHkgHoCt/IBAjbVhaRNMT7TMB8774
 OdfhDOkuNYi8PSd8H9gFQ==
UI-OutboundReport: notjunk:1;M01:P0:hhtKSC5HhWQ=;lsZD+jQ3RO+8asYMws/7cdFtgRQ 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_041456_690566_260165F4 
X-CRM114-Status: UNSURE (   8.13  )
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

Add SBIUnit word-boundary coverage for bitmap_set() and bitmap_clear().

Derive the base bit index from BITS_PER_LONG so that the tested range
crosses the 31/32 boundary on RV32 and the 63/64 boundary on RV64.

Signed-off-by: Michael Estner <michaelestner@web.de>
---
 lib/sbi/tests/sbi_bitmap_test.c | 34 +++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/lib/sbi/tests/sbi_bitmap_test.c b/lib/sbi/tests/sbi_bitmap_test.c
index b6586fe1..96165b7e 100644
--- a/lib/sbi/tests/sbi_bitmap_test.c
+++ b/lib/sbi/tests/sbi_bitmap_test.c
@@ -120,11 +120,45 @@ static void bitmap_empty_test(struct sbiunit_test_case *test)
 	SBIUNIT_EXPECT_EQ(test, bitmap_empty(data_a, 0), true);
 }
 
+static void bitmap_set_clear_test(struct sbiunit_test_case *test)
+{
+	unsigned long res[DATA_SIZE];
+	int start = BITS_PER_LONG - 2;
+
+	/* Set across a word boundary */
+	bitmap_zero(res, DATA_BIT_SIZE);
+	bitmap_set(res, start, 4);
+
+	SBIUNIT_EXPECT_EQ(test, bitmap_test(res, start), true);
+	SBIUNIT_EXPECT_EQ(test, bitmap_test(res, start + 1), true);
+	SBIUNIT_EXPECT_EQ(test, bitmap_test(res, start + 2), true);
+	SBIUNIT_EXPECT_EQ(test, bitmap_test(res, start + 3), true);
+
+	/* Adjacent bits untouched */
+	SBIUNIT_EXPECT_EQ(test, bitmap_test(res, start - 1), false);
+	SBIUNIT_EXPECT_EQ(test, bitmap_test(res, start + 4), false);
+
+	/* Clear across the same boundary */
+	bitmap_clear(res, start + 1, 2);
+
+	SBIUNIT_EXPECT_EQ(test, bitmap_test(res, start), true);
+	SBIUNIT_EXPECT_EQ(test, bitmap_test(res, start + 1), false);
+	SBIUNIT_EXPECT_EQ(test, bitmap_test(res, start + 2), false);
+	SBIUNIT_EXPECT_EQ(test, bitmap_test(res, start + 3), true);
+
+	/* Clearing 0 bits is a no-op */
+	bitmap_clear(res, start, 0);
+
+	SBIUNIT_EXPECT_EQ(test, bitmap_test(res, start), true);
+	SBIUNIT_EXPECT_EQ(test, bitmap_test(res, start + 3), true);
+}
+
 static struct sbiunit_test_case bitmap_test_cases[] = {
 	SBIUNIT_TEST_CASE(bitmap_and_test),
 	SBIUNIT_TEST_CASE(bitmap_or_test),
 	SBIUNIT_TEST_CASE(bitmap_xor_test),
 	SBIUNIT_TEST_CASE(bitmap_empty_test),
+	SBIUNIT_TEST_CASE(bitmap_set_clear_test),
 	SBIUNIT_END_CASE,
 };
 
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
