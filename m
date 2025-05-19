Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CF7C54756
	for <opensbi@archiver.kernel.org>; Mon, 19 May 2025 21:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y9NMLC57pYawp2R0QGYro6fwxBOUDaXjB0LS56vlawY=; b=PlVPZ41bDmhJgE
	GpJ1fuxl3yfes0b3KDGq0kAw47IU9DCV3vBys5Cy1Ufu8AwVRu2tq/lz0l7WUv/Y9PL4Q4rmZ7+PO
	qmPhyGHyfRtMkhI0e5aLdb76E84N9fgUYF4hrkUewS9Ir7iK76903yW4HMQnRB4fNBPQUKHgYjBz6
	P1GFzc1vnBA+U7Ij3OlxCTLWiA1dU27n+S4g/2ubed7aNRvCPvzuJZArVxfzujUHQxoBKXeHMuAI3
	dLm4kpjSR1wDE4wQlWtANbT+Kbthag/pN6kcw8uLfbeloNwE9rSNI/8In+Ing9A6x0ggFr85mEQ0J
	3xl4luGPRb4v8RQac+dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH8Vt-0000000AgI7-2zp4;
	Mon, 19 May 2025 21:59:13 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH8Vr-0000000AgDG-08oe
	for opensbi@lists.infradead.org;
	Mon, 19 May 2025 21:59:12 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2321c38a948so21883065ad.2
        for <opensbi@lists.infradead.org>; Mon, 19 May 2025 14:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747691950; x=1748296750; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6J81sN1OJzrszK9QnxApRanzDGJRnKzcV43iYuqSGlI=;
        b=Nq9SAEcJgcbm9HACKuKczJ8lx1Px8j/7Wn0fB3lD1xCInSVR3HfJGKTb6QBDqm2CLd
         bN21fBbewZUAU39OlZuiS2bH5l1tbkmDecHqRryOUjY2Pfo2eaVaz1FBzk8Fuf0OYToN
         jktzot0d/Ezeo+dT3j2vZRhUKwoV3ihkOUZz1EBNujrBiGgEdHcOgErVynpifki/9qQr
         A2qmdicQofc9g/UQ+P5dLE3Eu58dkA1cuVDUhsPMx0WlZgqiGWjJkrhtUyv9VikghgUR
         xgz1R6N82obLxCrHfnsdcvSkd1h+y9aG8m9wXJUcwP4K3vo34OwKerZCnKuM7paxqbrf
         H4Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747691950; x=1748296750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6J81sN1OJzrszK9QnxApRanzDGJRnKzcV43iYuqSGlI=;
        b=QHt7VZ3KXFi/FQCOZpzljqPbXP9izSISUBlSN5wEYGxLIuHmZxY8S/n+xMgCBUACsf
         TkUrIdrjHwikXuXX2hYcc9N38GMJYiYNvu9m7jTqB2YgPv8n4B9qBHsd7NnOye+tBjYb
         UwFgES+eNip1Ve9gp8ED31yp08HJ+ECxGmONC90ZvPA0FWoZh89bHAkAANB3H8UI4o2E
         OkJeGllha8HzRuLZMBEC0DKtJJKQ6v7bsObFG6Vur4pabKS7ClGc7SvEjuRHfaaV45K3
         czkFgW9IEyILucomW/hphP/JXpFgmErMEScliDwj1n04UmkyuaJkkDmZfHI8qc0dWBf8
         ZfPQ==
X-Gm-Message-State: AOJu0YwJPEOl3naQtZVDvCby7GiutI5CYcK6K0fyBoHwEAatqS1fnDkD
	lN8xJ0ubc83hUeYHyvSK+kPZFg3mya6sU3GRFgW1xo+Gi3yR16Q/l6AiiB5LlS4+
X-Gm-Gg: ASbGncs67RSXqIuFf0Tf7EypwvTIZlsm0DTn1WN4jyjnRRtYlW6FknOuks7BMnAB7z3
	02FHG6TtWEM3Yj/02OFPDQ87VgEK0pqQ+UuX8CwOgQf60TTm+N/mZa4ITWdgrupquCgX0oM5q5g
	oSULeFQzClXj3ard3JNKYSDXJklldaxRDiGFTlHpCmECssp8P6JPPZhrlEbUoai4VKw4wf//9AB
	aq0kGxT8QxLJwKAKgvENJ5Lzt2VMnDH9s6Mc+qtjeA+1vnnqjVkb7oSYFSUbYya43muigVdgB1j
	eWxpkzyIbJxCqOKtZ0GIsIIbVEk5ipRw67lQQUT3OGiTl4k1k9aaxGVyv4vOSJMLiw==
X-Google-Smtp-Source: AGHT+IFuy8JJtuClKCSe2x7vx+psRSe70j+kPsgq/fjU2556NjaJz9ndiM0MSgKrioOwR7jAp9XQQw==
X-Received: by 2002:a17:903:26cf:b0:22e:5882:1812 with SMTP id d9443c01a7336-231de3ae58fmr163178735ad.32.1747691949877;
        Mon, 19 May 2025 14:59:09 -0700 (PDT)
Received: from localhost.localdomain ([50.175.154.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2320418f249sm46386625ad.215.2025.05.19.14.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 14:59:09 -0700 (PDT)
From: Chao-ying Fu <icebergfu@gmail.com>
X-Google-Original-From: Chao-ying Fu <cfu@mips.com>
To: opensbi@lists.infradead.org
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH v5 08/10] devices to use MMIO memory
Date: Mon, 19 May 2025 14:58:45 -0700
Message-ID: <20250519215848.27569-9-cfu@mips.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_145911_126816_E915DB9D 
X-CRM114-Status: GOOD (  11.71  )
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

From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>

When applying FDT fixups, request device memory to be of
MMIO type

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 lib/utils/fdt/fdt_fixup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
index e237dd0..aa64977 100644
--- a/lib/utils/fdt/fdt_fixup.c
+++ b/lib/utils/fdt/fdt_fixup.c
@@ -154,7 +154,7 @@ static void fdt_domain_based_fixup_one(void *fdt, int nodeoff)
 		return;
 
 	if (!sbi_domain_check_addr(dom, reg_addr, dom->next_mode,
-				    SBI_DOMAIN_READ | SBI_DOMAIN_WRITE)) {
+				    SBI_DOMAIN_READ | SBI_DOMAIN_WRITE | SBI_DOMAIN_MMIO)) {
 		rc = fdt_open_into(fdt, fdt, fdt_totalsize(fdt) + 32);
 		if (rc < 0)
 			return;
-- 
2.47.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
