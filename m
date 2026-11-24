Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF1D606A31E
	for <opensbi@archiver.kernel.org>; Tue, 24 Nov 2026 12:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vniRdfbA;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LdmasJm/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DukoLKtb0lj6pKTcYQuqEOueKfzc9jsHHjUJRfFaBcE=; b=vniRdfbAFuU+0wKPgTrYuR2NR+
	zPkT+BE8wGqs5q7XGdB6anAwtveVJxsK2rYfbbAJNs6W+vYNkx11NXLmlYB3NtDvYuaQdpYlgvPDa
	NTqLwB68Rmumfjf8N9qfU5NC5lwtlQOHn/tXd+XznSitCGuIyUfdlxreIzPCqs+4VA4FSwlDt7xVG
	RAJsEVnEj9XTiC+PyNmjDGi5khMttv1pQ07qiSXnfGr7386c7iML1svLDjjqfM+FyJby9vYDUgMJb
	BnyvoSM5aucBbO20eDQZCSYLAuZc/t0zDpNETd4LWsys2FnDlMk2wHY6xgJterdMJKegw5EWtKTON
	ch16uWGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVpxu-00000006Y1V-3kTA;
	Tue, 24 Nov 2026 12:49:42 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVpxs-00000006Y0O-0iSa
	for opensbi@lists.infradead.org;
	Tue, 24 Nov 2026 12:49:41 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-49d05d51553so32381935e9.2
        for <opensbi@lists.infradead.org>; Tue, 24 Nov 2026 04:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795524578; x=1796129378; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1H4Vvm3ZXEeJr4UOJXxG/313kXhUa1Ikq8AMnzZidg8=;
        b=LdmasJm/1RS8B571KRnQhuMqeU97d+IHgSCnutI+lWLTho2cUJbsLYZ45mOK8DFMer
         xXQnowHuO7dLkrZfOsCCe91BBVMFH/ycAuNN3WcRr36pq+8mOTt1bQ5mKYBV8FS0ru4M
         87h7vD6OCGElDpS8eb6fey5FrUYy0oAED4aDVTZKDlNnn8Zp0FQblAPUUM9TAsTn3UUN
         HE6gusdM/eO2pAeVMPnO4EFSH5YAZ5MP6mRts5WrJ5KFEtBpZqMC8tC3Hw1UsKnjlBfK
         WjRDVIkecUKW9Ah1uL3QngEa/DBJ8blS6hKnJDastmYSkOq6G4YjcNCy9Wez94xVCh5L
         QCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795524578; x=1796129378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1H4Vvm3ZXEeJr4UOJXxG/313kXhUa1Ikq8AMnzZidg8=;
        b=kjfkh71rl0QzHyQj9rMt74Oh76Z+iUMXlRckUmy2QVbJK+l920xm5xVc7E8kIogcNR
         BeoMw1KRJecE1lsniaMhBuCeU6pKKnHV5PBxBET8CFG4pXcLvRaXy/6fK1/a5mEiazIn
         O8Mbw1G+hX3uZG6Gh+fo/IoDB23hvStercNfHF6Wb6YBX+hlsB1u07g7y9Brj0iVGjqf
         gDCDZGmqqVlx4CHxU45+InUn78Q913tsZ5ozcaKFHoSwWC5HPRcHm/S2sD9Bqosbs9e8
         KMhtew2LQN3Gjsu8cpHs6mQuEK4tWe4o4Ak1Vy/+F/FYavgok2xbUgXEPk4h1uBAAvwi
         UMnQ==
X-Gm-Message-State: APuU4Z+BfDPg1pkOSZE9VACKPQWFGRCLn0nCuolyp1pxK++DQZ36t7LY
	Ha1wV0FKlZZc6idsMDsgH3V2puh2JKCvtfc6uOt5QgHNaoeWNgnqwVgOCraUENvo
X-Gm-Gg: AZFdTZcUfHUwTcNKBuc5g/J3DUto5XxwvsjnpKMvBLqwPkcZACAJepXCEfOKV9W7iCJ
	14pjS6Rtqku9D8HGGk2vfRh0vzFTV97y4Ff0e3pToNENQGP+kBVa+adoOvbrzxzasGDppZq4EPm
	1OOqneDCcbJ7aXtW7V6TetMsuuOPZEHoUskd4IKRTxgNgeRedXXKX7sLiEK44cYZWqYCiEuzaJj
	nKn3O+Sjf2oOgKjxrQ3cc1pSf8tweMgRumbYy6FQYU5IuwQqFFhKkDNVMaK1slA6IA1EtNDKGvk
	yby/P9DWjmraYpCE2RMpQYYT3phcEO/h4xO59WPxFje5iyEDwEleuVrfI3fQCGMu0XrevkzN39R
	56Jksr+w2FdGmkXvMWzUNLPDOsCXvOlrpd2S2AmfPaeHnfntmZLUgatRBzUuzDVv5Mm4TSOUouj
	IwrWdr0MNNHqOuMA3cwwXYUCXbAdAWvVtTDCCcFIpqfvFVCuBb2hzCcGoBQ6ZzcNEQKNlOAv1XG
	prymk127q7uh530YawKi0WenWZkif0L1GRlUBlyvhRUlBXnfAJeC9x9JJz1mPCySApNNx3FC43s
	qfj4eUXWja0kYRxJKupgSnWfvQMiau0CEaUxIcJZxDn5I08ozTTGZ45KBBsQSc0fMyLnpIYFBdt
	RjelV8bY=
X-Received: by 2002:a05:600c:a085:b0:4a2:526b:d410 with SMTP id 5b1f17b1804b1-4bb8881092bmr307509805e9.13.1795524578090;
        Tue, 24 Nov 2026 04:49:38 -0800 (PST)
Received: from imamay-pc.yadro.com (mail.raidix.com. [185.53.20.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa397asm28619615f8f.48.2026.11.24.04.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:49:37 -0800 (PST)
From: Ilya Mamay <mmamayka01@gmail.com>
To: opensbi@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>,
	Ilya Mamay <mmamayka01@gmail.com>
Subject: [PATCH 2/2] lib: sbi: Disable compressed instructions in sbi_get_insn()
Date: Tue, 24 Nov 2026 15:49:00 +0300
Message-ID: <20261124124900.92404-2-mmamayka01@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124124900.92404-1-mmamayka01@gmail.com>
References: <20261124124900.92404-1-mmamayka01@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_044940_244944_2C9EF24C 
X-CRM114-Status: UNSURE (   9.22  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When an exception occurs during unprivileged memory access,
sbi_hart_expected_trap() skips the faulting instruction by
unconditionally advancing `mepc` by 4 bytes.

If the compiler with Zcb enabled emits c.lhu inside the inline
assembly block advancing `mepc` by 4 bytes on a trap will land
in the middle of a subsequent 32-bit instruction, corrupting
the execution flow.

Wrap the inline assembly block with `.option push`, `.option norvc`,
and `.option pop` to guarantee that all instructions inside are
32-bit wide.

Signed-off-by: Ilya Mamay <mmamayka01@gmail.com>
---
 lib/sbi/sbi_unpriv.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_unpriv.c b/lib/sbi/sbi_unpriv.c
index 3fd9d9ff..c265d54f 100644
--- a/lib/sbi/sbi_unpriv.c
+++ b/lib/sbi/sbi_unpriv.c
@@ -213,6 +213,8 @@ ulong sbi_get_insn(ulong mepc, struct sbi_trap_info *trap)
 	trap->cause = 0;
 
 	asm volatile(
+	    ".option push\n"
+	    ".option norvc\n"
 	    "add %[tinfo], %[taddr], zero\n"
 	    "csrrw %[mtvec], " STR(CSR_MTVEC) ", %[mtvec]\n"
 	    "csrrs %[mstatus], " STR(CSR_MSTATUS) ", %[mprv]\n"
@@ -224,7 +226,8 @@ ulong sbi_get_insn(ulong mepc, struct sbi_trap_info *trap)
 	    "sll %[ttmp], %[ttmp], 16\n"
 	    "add %[insn], %[insn], %[ttmp]\n"
 	    "2: csrw " STR(CSR_MSTATUS) ", %[mstatus]\n"
-	    "csrw " STR(CSR_MTVEC) ", %[mtvec]"
+	    "csrw " STR(CSR_MTVEC) ", %[mtvec]\n"
+	    ".option pop\n"
 	    : [mstatus] "+&r"(mstatus), [mtvec] "+&r"(mtvec),
 	      [tinfo] "+&r"(tinfo), [ttmp] "+&r"(ttmp),
 	      [insn] "+&r"(insn)
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
