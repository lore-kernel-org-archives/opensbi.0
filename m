Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0182BD5C0C0
	for <opensbi@archiver.kernel.org>; Tue, 16 Dec 2025 05:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=60w89dOyozQRrE9nMDxfaLI5a6AyANsPG83Wpi1dfDM=; b=DIMJLPvf72zh0e
	/h2M9V8kdqDlOYgVbNN3Go/yjG64cUQj7mR8glQ03pg4p80yTxzHSKTNu2SFzl1cwVgSimlNFn8ax
	FxuSNxiH9Amh56J5yBf3isxADl3YBnOvVmJxB0GnZwACQPTNQwEkwTgdvF8f0R+2vTBOrIe8GbCyc
	ufi7vUljp7hb3/z9XvJyRTo8FSHIB1Sm2mA9q9Z7Gdp+WPtImlx0boJsBNheTgESE3vogW+kwqilN
	s0i3HUJ5TTwNYxnIwiaXz6Qf73I+VZ1oktn74YZBqdoA3D7vXEqRH3g5jrtcVZd1BCKOJIK6GP2bi
	k6batW8UyUdmJVYLm/UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVNar-00000004iWs-0JL2;
	Tue, 16 Dec 2025 05:27:29 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVNao-00000004iWU-1AHK
	for opensbi@lists.infradead.org;
	Tue, 16 Dec 2025 05:27:27 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7f121c00dedso5164995b3a.0
        for <opensbi@lists.infradead.org>; Mon, 15 Dec 2025 21:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765862844; x=1766467644; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y5s4OoveLHstQd7shsJWNMwZeEuodfcOsV8suToVoWQ=;
        b=Ptq2uClXRsccs5c2en4/gYhTKhAER/EC9AdGqP0B8EfnebHdFmGzv3bSZaW3exDDqN
         rP8ARGCoRX6rsxvpC9bwwMhQRc3Kufroyzdz7wz+MmXnW8KrJcmYvQkr7IJMCz3hlNSu
         UfO1vSHPzv3JTYJjgAKJF9xK89c5yBDrcAJboLDPV+k5wXsvFDOfgwBhSeJrildxXNVU
         bRnsw5M4qwB9v2obXbzaOHjU1K+WsR9QBSkgbQSYYy59BOCg3srRALxSdIPllOJq0weW
         ZE8+yDaGROEmbYvdayJd+PdMqrm2KIpO5mhiOcWMFrickSTO6Tv/CGkSUrAFUy6JWuoS
         Psqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765862844; x=1766467644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y5s4OoveLHstQd7shsJWNMwZeEuodfcOsV8suToVoWQ=;
        b=fjn7XDLK5zaWnB61+O9W4Lppun06QP5IXZnULCUYR8WCPWrW465BRN4GXwa4boXNAg
         aOsymPu5zh9KSUbS0tCkUWpWn98uqgu6EOx2rnaQeCXXV2vw0KevuDdlt8eKEi/vX2t7
         rRKJ1p67JmaA2F+ILSNTaMpZAyB63PVOLqca/x7sQVmixXOwZpwgeU726VV3kfrInydc
         2h54vXhG848TJlHBr+j1GDu+TiW32Zv/ze4tWcnYIrRwnnWOfU7XhrhpkkEfy6N/w/iz
         mipteXUsPBDjRpXxdRlFCz0b/5CVyPjWCBFPXRTq6iqVYZhSJjvGJcBSUOroP+QipdjB
         bMww==
X-Gm-Message-State: AOJu0YwTyHnGceZqeXWs+hDZyaiSCGsJrwFuyf7VgeEsY8by/Nrix/aJ
	WoXBEvQQOFGP0t+J/C9bbruh+a/iSfGjNkySuNg4hS41WlhISAItR/S9aeo1kxH+
X-Gm-Gg: AY/fxX52qsY9zjMnP2/9gZfUyc6+pXFq8bPibV5k8Egycpvv5Af6Ik7qI/GoozD9e/5
	LXjuCBshpRhY7xUw6D49joDAHxnjmeg0JpIz9Ub34T0cYjumsRJieehivm+v5cwf9iVVghPp2ra
	pzuLk1kt95jRRko3xkc+u8Bi7a3ER8wRecqtKOWZwGvKslwldfYieACObXU9uJyw3hdjoxqimM7
	jmEcjW57bCH/n0mWVsREwmqYrF9qI77NRkJaQ7qQhBwmtxsOAVtJCtPN6YE6DZ7tv2hPSDxz4tS
	KzVe3lX+zDxhij22nJ/HYEUuRmFW3TXpos1hqf33zPx/37dx38PNb4ApMFrG5kSGWA/RHHlaQLg
	NK79PIihBup7AOfuTqrkJEY3XrvtAmIVIXy5ti4KknZhtRLOd3+WhgJFaVrUXyU1mP5Pbheqy0X
	kZfjfQ4EXuhePx
X-Google-Smtp-Source: AGHT+IEigrRZcZ5ITarGtLlfdEYe3jIrTbXE064yz1TRp/KFpw1ZzyfGPfDxdCydh9xov8LNmPopxg==
X-Received: by 2002:a05:6a00:414c:b0:7e2:839e:84e0 with SMTP id d2e1a72fcca58-7f667931a15mr12997328b3a.17.1765862844374;
        Mon, 15 Dec 2025 21:27:24 -0800 (PST)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c2773749sm14264999b3a.19.2025.12.15.21.27.23
        for <opensbi@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 21:27:23 -0800 (PST)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org
Subject: [PATCH] include: riscv_asm: Optimize csr_xyz() macros to reduce stack usage
Date: Mon, 15 Dec 2025 21:25:28 -0800
Message-Id: <20251216052528.18896-1-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_212726_321611_C508F085 
X-CRM114-Status: UNSURE (   8.03  )
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

When using debug builds, aka., DEBUG=1, csr_write_num() function can
trigger stack overflow. This is caused by the large amount of macro
expansion of csr_write(...), which, under debug builds, will generate
massive amount of stack variables (tested with GCC 13.2.0). The issue
is masked previously as we didn't have too many csr_write()'s before
commit 55296fd27c0c, but now, it does overflow the default 4KB stack.

The csr_read(relaxed) macros already use the "register" modifier to
optimize stack usage (perhaps unknowingly?), so this patch just
follows suit.

Fixes: 55296fd27c0c ("lib: Allow custom CSRs in csr_read_num() and csr_write_num()")
Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 include/sbi/riscv_asm.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/sbi/riscv_asm.h b/include/sbi/riscv_asm.h
index ef48dc89..0cf3fc37 100644
--- a/include/sbi/riscv_asm.h
+++ b/include/sbi/riscv_asm.h
@@ -83,7 +83,7 @@
 
 #define csr_swap(csr, val)                                              \
 	({                                                              \
-		unsigned long __v = (unsigned long)(val);               \
+		register unsigned long __v = (unsigned long)(val);      \
 		__asm__ __volatile__("csrrw %0, " __ASM_STR(csr) ", %1" \
 				     : "=r"(__v)                        \
 				     : "rK"(__v)                        \
@@ -111,7 +111,7 @@
 
 #define csr_write(csr, val)                                        \
 	({                                                         \
-		unsigned long __v = (unsigned long)(val);          \
+		register unsigned long __v = (unsigned long)(val); \
 		__asm__ __volatile__("csrw " __ASM_STR(csr) ", %0" \
 				     :                             \
 				     : "rK"(__v)                   \
@@ -120,7 +120,7 @@
 
 #define csr_read_set(csr, val)                                          \
 	({                                                              \
-		unsigned long __v = (unsigned long)(val);               \
+		register unsigned long __v = (unsigned long)(val);      \
 		__asm__ __volatile__("csrrs %0, " __ASM_STR(csr) ", %1" \
 				     : "=r"(__v)                        \
 				     : "rK"(__v)                        \
@@ -130,7 +130,7 @@
 
 #define csr_set(csr, val)                                          \
 	({                                                         \
-		unsigned long __v = (unsigned long)(val);          \
+		register unsigned long __v = (unsigned long)(val); \
 		__asm__ __volatile__("csrs " __ASM_STR(csr) ", %0" \
 				     :                             \
 				     : "rK"(__v)                   \
@@ -139,7 +139,7 @@
 
 #define csr_read_clear(csr, val)                                        \
 	({                                                              \
-		unsigned long __v = (unsigned long)(val);               \
+		register unsigned long __v = (unsigned long)(val);      \
 		__asm__ __volatile__("csrrc %0, " __ASM_STR(csr) ", %1" \
 				     : "=r"(__v)                        \
 				     : "rK"(__v)                        \
@@ -149,7 +149,7 @@
 
 #define csr_clear(csr, val)                                        \
 	({                                                         \
-		unsigned long __v = (unsigned long)(val);          \
+		register unsigned long __v = (unsigned long)(val); \
 		__asm__ __volatile__("csrc " __ASM_STR(csr) ", %0" \
 				     :                             \
 				     : "rK"(__v)                   \
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
