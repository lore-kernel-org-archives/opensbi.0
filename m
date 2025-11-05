Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD94CCF9E3
	for <opensbi@archiver.kernel.org>; Wed,  5 Nov 2025 01:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+kG3Ehnc7zTwn3rFq9aJ99gjknwAuwIBAf8d8sA5UEQ=; b=G+dNb811gwDhAW
	bP9umkN4hW+oZjtp57OWMAQs9uhxk8wrA1dyhtfw++RkaTTjZgjWyEcR88GfebVls/EkKWZeQ5Oq9
	hr/mQ/Mdgg+94lWKWSINz4atDSupLA9Bol4YpV64HEvk/oxJ0hcDmAB6ThDLEfUofFSFNlIxAyTvy
	tbHQEYpLL/y0rN43ZhRLPzX0wkvYVP6Bw7ilNbAnE/eCvs/y5R3+FGErUObpmwDriiEjZBDNpkmWL
	89GLeRV0I0fdhdYKIa6kzg+DK351CwbjKZTERzZVrgUuKUGfK/6d1IhSHWKqCdkjX8VBs51VbdQX8
	LUja3uRjnPxmPmA3JyWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGS8z-0000000CpsZ-0e4l;
	Wed, 05 Nov 2025 01:17:01 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGS8v-0000000Cpry-2CAb
	for opensbi@lists.infradead.org;
	Wed, 05 Nov 2025 01:16:59 +0000
Received: from LT03 (unknown [93.94.208.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 85D843FA7C;
	Wed,  5 Nov 2025 01:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1762305412;
	bh=SUkA02zQZsB7I1NaUgZp3OMVVulhBaqem2shJF0eaDI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=Et1knaRBh9nSq7Hra6m5T19eeg6Dd9IH8QwlMH4KgBWHPgNzxrQ5+vUC5CPYQ+xY+
	 Etdj5XZmdXsGwpmDkVJzeyOhXELZ23fb3zEaA1H/ZvyISop7g+4Wgd4flbnbsiOVLF
	 RLtgSY135QK7nIEX1lSihdGN3UNB2tnXV8J7XjECMmQDHHYz/xvWeFRloQMKdgpEfm
	 RmQMFjIpPAN4b1ykMwQbCSJn3NvjPPfB3kutHNmRlW417Iv3vDiRbi+uYa1tOyuodd
	 dSQP7LwNt/e2WDtNmBEF4CRdptu8Ds7Rd7O9WZYqCCdRZQzfg9dOYqG9KdvNfXas93
	 f7KG2qjGwdS3MJ/1As0lrJxCOiC2dLn+TLr4BpclCYSizEk8o+DJCuU6OJCGeBaaLq
	 M/IxYXvDRqyZORde0xw4lIPv4UEXjxX11/zj2tpUiLMZsT0Dwo+A7qwvwFIIGJ5Jxz
	 md23rljlT5dbZolQ8j55y5SPsqCn5k3kNnB89HhEWxQUvyXfSkxFnJKmptYZUqfUFM
	 y1BeEgFjXYmvg+dnZ0Jyc5sAJyIoAYoq7mihz0QyLJz5Sjgj3tM66RspMQS8R41kq7
	 6H39+vVqxOYbWoovDJjH1QzFmnsWJwC6geLj1eakqluwaOMPMGnm5kJKpt5XbpIJLy
	 q4qKC0r9Jk2GNqNgmEy4sJhc=
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH 1/1] lib: utils/serial: typo Recieve
Date: Wed,  5 Nov 2025 02:16:48 +0100
Message-ID: <20251105011648.9413-1-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_171657_893889_5EA2FA40 
X-CRM114-Status: UNSURE (   9.19  )
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

%s/Recieve/Receive/

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 lib/utils/serial/uart8250.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/utils/serial/uart8250.c b/lib/utils/serial/uart8250.c
index 17374082..bb209c9a 100644
--- a/lib/utils/serial/uart8250.c
+++ b/lib/utils/serial/uart8250.c
@@ -15,7 +15,7 @@
 
 /* clang-format off */
 
-#define UART_RBR_OFFSET		0	/* In:  Recieve Buffer Register */
+#define UART_RBR_OFFSET		0	/* In:  Receive Buffer Register */
 #define UART_THR_OFFSET		0	/* Out: Transmitter Holding Register */
 #define UART_DLL_OFFSET		0	/* Out: Divisor Latch Low */
 #define UART_IER_OFFSET		1	/* I/O: Interrupt Enable Register */
-- 
2.51.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
