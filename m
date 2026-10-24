Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876F0606A31A
	for <opensbi@archiver.kernel.org>; Sat, 24 Oct 2026 19:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MAexfUP/;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=ev1.pl header.i=@ev1.pl header.a=rsa-sha256 header.s=default header.b=gFAvG5i/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=fkKlLcNGLg58OnLoXEB3uBpaE/RePbbmZe2rL59Ya7c=; b=MAexfUP/HV9zkoQLO6D3EB+ff2
	o9jXDqTik/I3oer21CXXVMCo97k62ZVnEXTFXCt1+Ac650SC8zSFTNWX0YSzJWocuppCGzLhYJruj
	psJJ7r0XXry8x+HGOjRH1sSkXsdaLZ8PeVtf0O5nnOWhoeYTBsU9sNHBW9+5XcRAQjJGmdrCYlug2
	rU0vihsjGLC86VW+sUJa1yE0wMAzF2d1/ttg3sqK9IVZzbTbu1prbEFSUraJHgzIrOqRlGgbqCNib
	bttJ7WXN//Sz860x5EyBImMKAca8FRoPdT17nAVvDmeKN0pKIt9UCUYk7MJCADoNxepUEwu9V+y4o
	jyUK7oBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKhsV-00000000Ubv-2GHe;
	Sat, 24 Oct 2026 19:58:07 +0000
Received: from host5.amibroker.com ([209.50.229.168])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKhsS-00000000UbX-349O
	for opensbi@lists.infradead.org;
	Sat, 24 Oct 2026 19:58:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=ev1.pl;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PbpQeRHCWeA2j5V4EFvGzRvzwq1yZgFL5GelDnE/uPc=; b=gFAvG5i/3dR+ddmZbTZdGR3nuT
	Ob6Y9HW2jtVoyjuboYq7tCYSac0ARcXckF12C7qCWfB4JxDCXGA4Koo5k4s0U0xCnuHT4EgNnWVWI
	JW9mdTCzmX5tN5QZkGC1GEYuysl2nMSOhaPpCPOo0nKpxqpTBA1j18Mg4Cm8rQE5KUYL0Adq0/6b4
	l70bM562/IapYqz6HeuJyUlWmmSkeYmIe7djTpkZ1gVFjR3Waig7S3XfYi/cUpcMtg76iFS22olZo
	3s9R42O2pCssm55HbZ9D4MzZjpWhE1w/Iu6GdCtOopwjgYCA3uzVQGvu7a/8JmjBymrOXLEOuEeFQ
	8fpvC74w==;
Received: from [89.78.61.115] (port=57684 helo=laptop-hp-archlinux.barred-everest.ts.net)
	by host5.amibroker.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <kuba@ev1.pl>)
	id 1xKhsV-000000090HP-0Z4K;
	Sat, 24 Oct 2026 19:57:59 +0000
From: Jakub Janeczko <kuba@ev1.pl>
To: opensbi@lists.infradead.org
Cc: Jakub Janeczko <kuba@ev1.pl>
Subject: [PATCH] lib: pmu: Fix race on pmu_ctr_write_hw
Date: Sat, 24 Oct 2026 21:57:31 +0200
Message-ID: <20261024195739.585621-1-kuba@ev1.pl>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - host5.amibroker.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - ev1.pl
X-Get-Message-Sender-Via: host5.amibroker.com: authenticated_id: kuba@ev1.pl
X-Authenticated-Sender: host5.amibroker.com: kuba@ev1.pl
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_125805_064118_569272B5 
X-CRM114-Status: UNSURE (   4.69  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On platforms where a bit of mcountinhibit cannot be set to 1,
and when on rv32, pmu_ctr_write_hw() was given value whose lower
bits were close to 2^32, the write could miss the lower bit overflow.

Signed-off-by: Jakub Janeczko <kuba@ev1.pl>
---
 lib/sbi/sbi_pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index e79f6b60..7dbc9407 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -393,8 +393,8 @@ static void pmu_ctr_write_hw(uint32_t cidx, uint64_t ival)
 {
 #if __riscv_xlen == 32
 	csr_write_num(CSR_MCYCLE + cidx, 0);
-	csr_write_num(CSR_MCYCLE + cidx, ival & 0xFFFFFFFF);
 	csr_write_num(CSR_MCYCLEH + cidx, ival >> BITS_PER_LONG);
+	csr_write_num(CSR_MCYCLE + cidx, ival & 0xFFFFFFFF);
 #else
 	csr_write_num(CSR_MCYCLE + cidx, ival);
 #endif
-- 
2.56.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
