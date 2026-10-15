Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A52CCC6B38
	for <opensbi@archiver.kernel.org>; Thu, 15 Oct 2026 20:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bTX3+nTroYv76HB2iS8QM2oAfCxYfh4npeWC9ELWSaA=; b=bnltmOWaAzgXYH
	fovoUF9+LPKR8Jax2dwo26xcowd4HEj5IkRWttln2qCLEQgNwaV+B29ojQM6K6vpyGKnLcWMJLHYb
	cBzuM+dcheuFCWBB4Riy30wsYQ9jkIZgADCzFEKHqxuvgMZd0IbQ1N4VDXUztdqDuOe0Xc8BLzbHD
	zvTJG/QTMgy91fAGITHXrdd94zcBKQAIhUVMTIqEj0s7o4hwwUrjDZTOAVmh3cjZYvGnZNi+LbpSh
	QN/EUksnod8miC77SareQyEQWQMkXdKaacb8xGL/80zGZ2J8n0MS3wzI+Wu4Q0F/4TW2PAknCwXT7
	Fnnl1O2QNDP/OajDhUGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHSBW-00000001Ltq-1scP;
	Thu, 15 Oct 2026 20:36:18 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHSBR-00000001LtJ-3Y8m
	for opensbi@lists.infradead.org;
	Thu, 15 Oct 2026 20:36:16 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-15354aa70e8so1124727c88.1
        for <opensbi@lists.infradead.org>; Thu, 15 Oct 2026 13:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792096572; x=1792701372; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zViI2c975XEIbLNYv8Au5VB3tvAlNrJlrfrAs0/5g28=;
        b=oOgZ9clTzSBaeZvJg4RtWhD1D8zzpfos2XDqE1r8JjxF4vvWVn9rY8T7Ol8NxjL4hY
         UzhvHvTQz1jnoFhP4xoC6cbGyEFDYF+1iLe2HoQPW6tX20Jzsse9cuRCHisJr5vDMySz
         kCuSFW+wxNzu+/PK5uVCuEB+H/mT5cbXMWAtL+CM4Ha4nuK5qoD0PlCi0MTLpxRPyYs+
         JywNvDoPJzBQ7gYAy07/dHkjKIb7J/Fwj4//dxXawVstFinvaYkrW3UyvEbu4hvBKZbn
         LOMkBJaTTQ7KYOShOUXKVu51/g2Fso+Oc1yQ72m7WRlguYz9Q+DDUNcgmbfXgVXiQLdL
         w0NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792096572; x=1792701372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zViI2c975XEIbLNYv8Au5VB3tvAlNrJlrfrAs0/5g28=;
        b=XQ2lNbLVifL1tCYCZ5tHT4j1vhQAsSTMY95zqLIWAMuK2fZi01Rx0ZUwFYh8+yxPR7
         uDu7J2GOor0e6G/hKL+idDwgvxnBnOEc5H5TZ9bMD6xaCw0HJqQVEt+voF30I6IfKKPY
         v9Bxn9YXsKyJgLmW4GLjMiAWB27pMZGSJzpivTl3VznNLQ6FHTOmx4qsiOAbWtVjlA/t
         M6weew7wBMyGw2DbgLI/IMyVXvh1MRI2mqdD5LMFdif9zuYdiru7p2iIgGtqZPkUt4IC
         k8455kjE8YIW792a3QrgtUIAwi4Q9AWopQelxUyfcWqNDi0ykSzvo1ZHx7kmqHECIx/Q
         ZA1Q==
X-Gm-Message-State: AFq9FYKCN561a3TGE12oQhV8OfGPkgqYEV8nj2SK0UV2iDLTjhRhI9I4
	al+QBlggAuhDk4A1alSuNmwW0sRlBfMYS8xLfdD0R/477MSnn6j4L6eQkOQoDXel
X-Gm-Gg: AYBFou2Qoku+thuStchRx5k1XdQI20zdncd41s7bwj58hg8paPZO4i1p+3hkzfWSBDW
	G8nT7Lx3kDfDmi9kXbEnCJs81/hAdYYBfpy2u7gu0FdPn0WFRzmMTpsGTxXQ93lUbKTzhiCxyu5
	P9d0VGHi8S4aAxAVDzZAAZXoprsqyzs8Fmit9G/Ov4hciCmhxrLV5C/OvvF30OwdVRI5iZt12TP
	rgDpkqEFpjqDpR/dgFHgyN0wydl38kArLYDPcqHp+0cEwv17ujebgTgXblh5WLr++adb1xtFYOI
	Kfb0kKXcPckUwXN47PgdISAkBnfLWPRtmyZxBrMXhIDAHqxnai4nOiMb/QF3qZUAhN/9BzKpB+n
	MPB4J/C1oF54iMi0q+oMhx6Xs/pV2t+/IgENKO1ASnqkCaqMLqbFGkuYHQIJ8GpsOOoyb4TGw40
	/R1mAC7yg/BntDp5SdmWkPsqRyKnKXfgtDkEjc4VpWf0hfnTHi7ZPDpZFo6UTnIryMRnjC/e/HH
	vitqMtQF34Hy7riwmy/Bzc06jcb9C6dCXt9vgV7AYrfvvGNfNyCepoVJDQFgWNXxVbSJwYj1xb2
	QGeUs/An6eF+L0X0kXPbZU7/6YpZ4CbE4S6SnOMLfetKtCR7k0VJBQukpW6v6PvirOceQan2Bai
	JH2RzhH8+aPoALVHDpEpv2TdR+R184PUnPdrbvBQNYICNmHDI/SbgL+AlIyd46HDrahNy0k9qhM
	aq7L4eYZi8PUTbwlci/7T4cosgZrIq8r+kE5g9hqHXmjaweg==
X-Received: by 2002:a05:701b:2509:b0:16e:6e3:9a9f with SMTP id a92af1059eb24-16e06e39b4fmr24693924c88.34.1792096572451;
        Thu, 15 Oct 2026 13:36:12 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b37ce3fsm51057c88.14.2026.10.15.13.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 13:36:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] lib: utils/serial: Remove unused baudrate/frequency globals
Date: Thu, 15 Oct 2026 13:36:10 -0700
Message-ID: <20261015203610.835320-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_133613_892294_A814F04E 
X-CRM114-Status: UNSURE (   9.73  )
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

From: Khem Raj <raj.khem@gmail.com>

The sifive-uart and cadence-uart drivers store the input clock
frequency and baudrate into file-static globals during init, but
never read them back; the divisor is computed directly from the
function arguments. Clang 23 adds -Wunused-but-set-global, which is
enabled by -Wall, so the build fails with -Werror:

  sifive-uart.c:34:12: error: variable 'uart_in_freq' set but not used [-Werror,-Wunused-but-set-global]
  sifive-uart.c:35:12: error: variable 'uart_baudrate' set but not used [-Werror,-Wunused-but-set-global]

Drop the dead variables.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 lib/utils/serial/cadence-uart.c | 4 ----
 lib/utils/serial/sifive-uart.c  | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/lib/utils/serial/cadence-uart.c b/lib/utils/serial/cadence-uart.c
index 30fbb95..80dc429 100644
--- a/lib/utils/serial/cadence-uart.c
+++ b/lib/utils/serial/cadence-uart.c
@@ -39,8 +39,6 @@
 /* clang-format on */
 
 static volatile void *uart_base;
-static u32 uart_in_freq;
-static u32 uart_baudrate;
 
 /*
  * Find minimum divisor divides in_freq to max_target_hz;
@@ -95,8 +93,6 @@ static struct sbi_console_device cadence_console = {
 int cadence_uart_init(unsigned long base, u32 in_freq, u32 baudrate)
 {
 	uart_base     = (volatile void *)base;
-	uart_in_freq  = in_freq;
-	uart_baudrate = baudrate;
 
 	/* Disable interrupts */
 	set_reg(UART_REG_IDR, 0xFFFFFFFF);
diff --git a/lib/utils/serial/sifive-uart.c b/lib/utils/serial/sifive-uart.c
index 5563713..235976e 100644
--- a/lib/utils/serial/sifive-uart.c
+++ b/lib/utils/serial/sifive-uart.c
@@ -31,8 +31,6 @@
 /* clang-format on */
 
 static volatile char *uart_base;
-static u32 uart_in_freq;
-static u32 uart_baudrate;
 
 /**
  * Find minimum divisor divides in_freq to max_target_hz;
@@ -94,8 +92,6 @@ static struct sbi_console_device sifive_console = {
 int sifive_uart_init(unsigned long base, u32 in_freq, u32 baudrate)
 {
 	uart_base     = (volatile char *)base;
-	uart_in_freq  = in_freq;
-	uart_baudrate = baudrate;
 
 	/* Configure baudrate */
 	if (in_freq && baudrate)

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
