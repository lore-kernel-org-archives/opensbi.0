Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE7A606A31C
	for <opensbi@archiver.kernel.org>; Sat, 31 Oct 2026 12:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FLzGTMxM;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kK8N9+EB;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jht0wtBV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wi1YYyFq03ggisAtOWcCA+FuGAI4gUZTwGx9IWhsPuc=; b=FLzGTMxMZmzxGBS5J9mM6viS+5
	GGii1/PA0DcyJSwfhqGQMF98KVKsy0VgPgdU44yhGePmbi1lm+bFrQTYWxjceZOLHMY0k7FgA76Yy
	UU2VOdBauLi7ROPc3yDAr/XGRkgcVyiMh71YTp1tfMWB1dTox58I+G3E/s7GPfGXFY1Hko9t0bUWf
	mcXuQdepT7xo9olvYvSjwxHDmSSWxR1Zn/ckiJC5gI9k8oZFitUurmiVE6F70nQZP3vxZQ/644iuj
	qhE/rKGZiOlQelVhPqbbvb/eIeO/L2j3ZlIA1aG9+JDAB35ljExJDF13pDUC9DSRLDarZP8Y177eY
	b4DptdBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN8By-0000000DIsQ-0RC4;
	Sat, 31 Oct 2026 12:28:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN8Bv-0000000DIrQ-33bF
	for opensbi@lists.infradead.org;
	Sat, 31 Oct 2026 12:28:12 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69V4aLHH1756896
	for <opensbi@lists.infradead.org>; Sat, 31 Oct 2026 12:28:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hupoeRpCSEm
	OrkwqJQtyFN7RKikmPsVDDW+gV2BX60g=; b=kK8N9+EBZFK7Dl1DEXT/gydUJgA
	zvrdjOUqjcUGDq5adPqKJuIHKMxm2JfboqoYMxC4+nr4/jY5y1Uvr6gK4ZfH33Yq
	y6uyxO3oKHk/s7lJ3WS58MF0bgjB+OkbegevAAEUhhkxkfYQRbcxH6wf5WNknVBW
	CbnkR9QJl2O4dwYJnkYAncde2eS+ejDXSl3/oF7dFZpj7e0XifqfjaF/lkDCg+1t
	86/b1H2TK6Pgmye5ZXZRSBEx6WGjO+g5iM2VifkM2dADGo6GqQ5baUOOvW3JlBOY
	okqj+55yld3ePVZta65m3ppfsgIfbty41U2P8CtDLB4BMamUgBZ64gQrSSg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7wxh4qj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Sat, 31 Oct 2026 12:28:10 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3552883bd19so6811232eec.1
        for <opensbi@lists.infradead.org>; Sat, 31 Oct 2026 05:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793449690; x=1794054490; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hupoeRpCSEmOrkwqJQtyFN7RKikmPsVDDW+gV2BX60g=;
        b=jht0wtBV/eb0uaL71SCKlnbnXWcaZ5hj5yoZowflm+2cSOByD5WhNau/eXDXAIgP05
         Q3XbdJqjq52716QjkvDn4tmqwlfkXQlWXFhhhyKnrPctDUey4mN0y9n3+mv0/hnD4YEW
         2FkkKccqdsVCA9sH9TWJAnlKxilmaNKHMIDtru25lTpSOceYjI9JjhpvYgOXkrZMojBs
         5dTJ8t0tudzDSXKhUEa57Gld+UZ8ehV5VafAOJ8YgmwWH/3EHgHLdHzvbFQU0MLo372k
         wFP9NNMZuJHp/SAdddkiToL9MSfuAUBG/SlCpwN4IB/Z6hq4cKGppSTGTPYkx+f6INLL
         W83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793449690; x=1794054490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hupoeRpCSEmOrkwqJQtyFN7RKikmPsVDDW+gV2BX60g=;
        b=bZCrcesiqDj9plluA7hFTQCZjEoWCnLmDHUd73QQl7D/V4hsyJAXy4TJk1xZMn0+JH
         UcbJLHdc8iLbWrBCOWPwtKF6o+18f3nZxKRIBCYQVRI+9gIE5pFBncW8oj/cEQFuAzGx
         8CRAEUdbi8GPVb5CFacAR4g8dKs+G9lskohw6flakXfmtzPfWA369DZ3u9/gTfaPRFtc
         JUfgzyq0uGNNqfSTgk2LIU5zqarOx9OXyzJnJnOZaC7UDo4ZrJuLL4AvHbh+8tow12jb
         Yeg+m2acEgba76n/W+WPL+HwE9BiKdjRsO72B8bBbeVmSdzG5PrV4WD12xSH2CAKpFRD
         K9IA==
X-Gm-Message-State: AFq9FYJdVvHD0CdwfvZcadRRSUnB63ImY/42HIGc/8qjSnsHMGiQFMt6
	tfJMsaWBWcqth9pcNMfYjAePhhh95+UN1AaGhiztjxTLz0h6K9CLBnrqno8qlUGqjgcv+oWS20K
	H+ZaBloSWrJ2m36ozgSTjEJSAHiQ2I8meJOGG4AQs0GRNA9fZNyzBIQg5x090zR3rzt8HP8vDAQ
	==
X-Gm-Gg: AYBFou2SpdF7d3+ng+eMs2F0Xon5PNr+MYcndUHXlTENQhGnll6cmF7CMMJwqX9CFj5
	OHJ9WvV7a7ftfTwQ/mfWk3DgSii4r4hXoJfYVLmFquHL7h/Yn0WS4GSBB1iS7YjS68/IPy6ZBAm
	aUFElx2frUfijWEJY7xE0pSOvFVwbNHMgCylP39+Vp9uXNEkQM6ahuBMz8BenBaUOZdTlQ3Yc/y
	vXPRtJPKafQQHR6Ud1TgKx8uGFWP04IY9uWf1BOZkc1VlXbpJv8T0D8Yu6O0iN0vTW2waJn/vFW
	MOnhVjctnbRE+MXvd8oFfB+12ds7HIcqgZ73uXNS14net65uZ5SGHtayoKyKolfJsdFEWrTszJo
	Kcq3bWBTXIk+iOWSVprTZ92dC59fnMsK6ap4P4YyAlB7lYJm7qXjBt/cWGbkmiyjIGEjilgrpWs
	Ks57CwoWi/M8Z6tCVvOqY9Dv5LhJ5dHTm0R0ZLi8vWcsf49xT3pMX/BZ1g+6WOM8CT5ZFJ
X-Received: by 2002:a05:7300:c019:20b0:369:d6ed:f2b5 with SMTP id 5a478bee46e88-36a4246992amr8321627eec.39.1793449689506;
        Sat, 31 Oct 2026 05:28:09 -0700 (PDT)
X-Received: by 2002:a05:7300:c019:20b0:369:d6ed:f2b5 with SMTP id 5a478bee46e88-36a4246992amr8321589eec.39.1793449688743;
        Sat, 31 Oct 2026 05:28:08 -0700 (PDT)
Received: from hu-rahupath-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4293b651sm15515168eec.17.2026.10.31.05.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 05:28:08 -0700 (PDT)
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: rahul.pathak@oss.qualcomm.com, rahul@summations.net
Subject: [RFC PATCH v6 1/6] lib: sbi_domain: Add finalize callback for per-domain state
Date: Sat, 31 Oct 2026 17:57:50 +0530
Message-ID: <20261031122757.2572125-2-rahul.pathak@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261031122757.2572125-1-rahul.pathak@oss.qualcomm.com>
References: <20261031122757.2572125-1-rahul.pathak@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-GUID: ybM3cdRhR8I89R8hTjRoMP2E09dRjF7o
X-Proofpoint-ORIG-GUID: ybM3cdRhR8I89R8hTjRoMP2E09dRjF7o
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA0OSBTYWx0ZWRfXygTSQz2gWP1n
 oWsa9yqMjtrodDJHzluYb9dXiiIYXcTUnT/YQMigDEPi7FPyNORTNA8cqAvuAwtkYsS8zH8+QPz
 aw4USuC8Pxi9lIFOIiTp444GtiMCN3E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA0OSBTYWx0ZWRfX6Veksn9k/35V
 /4lYsYXNddo/150TZV8O6sjMq+/Sl5O3t57T5juFWaCFjQjY7L+3Dz554PJcAG8d/5/2UlT//He
 QLFBGFxKBpBBeWbp75vGItAXVTkPxKDGh3kYtQGyiPCnjZctxs/clKrofXYF/R9IUMNCfxv5bXB
 B+gju0QSSah2LiKMrsLRW+5iYfajddiHOkvOnbrCC53ZQU8h0mfaPw52T57Malw422kPy/XrFib
 cbR2N8EeQQZhDNZ3FXDhTK8yBTlZqGtuL13Nivp/slLndllC6cgNAJ/PnHrmAwGIlql+MlnwsUy
 svAjAKgguMFd1dj2KFGqwMsmbD61sSzHS+53LgPI5DlMtKa2/3yD/3IrAbJTqUt1UgZAlpjdxJl
 RRuM2PQG7ydRVp9WcTmPKW3g11SPpX3TmbX8uKdmQDBiz1bO2oxPHN3J+2igT/9HctJ5c2YA9K4
 v8keVICDrJjHvhodO0Q==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6ae5deda cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=A3s7GLJBcYfuUOYuCAAA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_052811_885974_D3FBCA5F 
X-CRM114-Status: GOOD (  17.76  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Per-domain state is registered via sbi_domain_state in state_setup()
but during that time the domain memory regions are not final.
Add optional state_finalize() callback which is called
from sbi_domain_finalize for each domain after all domains are
registered and their memory regions are final.

Signed-off-by: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
---
 include/sbi/sbi_domain_state.h | 22 ++++++++++++++++++++++
 lib/sbi/sbi_domain.c           | 16 ++++++++++++++++
 lib/sbi/sbi_domain_state.c     | 25 +++++++++++++++++++++++++
 3 files changed, 63 insertions(+)

diff --git a/include/sbi/sbi_domain_state.h b/include/sbi/sbi_domain_state.h
index 72030380b357..6528a95b9b56 100644
--- a/include/sbi/sbi_domain_state.h
+++ b/include/sbi/sbi_domain_state.h
@@ -40,6 +40,18 @@ struct sbi_domain_state {
 	/** Optional callback to setup domain state */
 	int (*state_setup)(struct sbi_domain *dom,
 			  struct sbi_domain_state *state, void *state_ptr);
+	/**
+	 * Optional callback to finalize domain state
+	 *
+	 * Called for each domain from sbi_domain_finalize() after all
+	 * domains are registered and memory regions are final.
+	 *
+	 * State from the domain memory regions must be setup here instead
+	 * of state_setup()
+	 */
+	int (*state_finalize)(struct sbi_domain *dom,
+			      struct sbi_domain_state *state, void *state_ptr);
+
 	/** Optional callback to cleanup domain state */
 	void (*state_cleanup)(struct sbi_domain *dom,
 			     struct sbi_domain_state *state, void *state_ptr);
@@ -64,6 +76,16 @@ void *sbi_domain_state_ptr(struct sbi_domain *dom, struct sbi_domain_state *stat
  */
 int sbi_domain_setup_state(struct sbi_domain *dom);
 
+/**
+ * Finalize all domain state for a domain
+ * @param dom pointer to domain
+ *
+ * @return 0 on success and negative error code on failure
+ *
+ * Note: This function is used internally within domain framework.
+ */
+int sbi_domain_finalize_state(struct sbi_domain *dom);
+
 /**
  * Cleanup all domain state for a domain
  * @param dom pointer to domain
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 42fe56324a94..0214c5d43bbf 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -947,6 +947,7 @@ int sbi_domain_startup(struct sbi_scratch *scratch, u32 cold_hartid)
 int sbi_domain_finalize(struct sbi_scratch *scratch)
 {
 	int rc;
+	struct sbi_domain *dom;
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 
 	/* Sanity checks */
@@ -967,6 +968,21 @@ int sbi_domain_finalize(struct sbi_scratch *scratch)
 	 */
 	domain_finalized = true;
 
+	/*
+	 * Finalize per-domain state of each domain. Now all domains
+	 * are finalized already and their memory regions are final.
+	 * State which is derived from the domain memory regions is
+	 * set up below.
+	 */
+	sbi_domain_for_each(dom) {
+		rc = sbi_domain_finalize_state(dom);
+		if (rc) {
+			sbi_printf("%s: domain state finalize failed for %s"
+				   " (error %d)\n", __func__, dom->name, rc);
+			return rc;
+		}
+	}
+
 	return 0;
 }
 
diff --git a/lib/sbi/sbi_domain_state.c b/lib/sbi/sbi_domain_state.c
index 2d1f30e32169..f8ccab693764 100644
--- a/lib/sbi/sbi_domain_state.c
+++ b/lib/sbi/sbi_domain_state.c
@@ -84,6 +84,31 @@ int sbi_domain_setup_state(struct sbi_domain *dom)
 	return 0;
 }
 
+int sbi_domain_finalize_state(struct sbi_domain *dom)
+{
+	struct sbi_domain_state *state;
+	void *state_ptr;
+	int rc;
+
+	if (!dom)
+		return SBI_EINVAL;
+
+	sbi_list_for_each_entry(state, &state_list, head) {
+		if (!state->state_finalize)
+			continue;
+
+		state_ptr = sbi_domain_state_ptr(dom, state);
+		if (!state_ptr)
+			continue;
+
+		rc = state->state_finalize(dom, state, state_ptr);
+		if (rc)
+			return rc;
+	}
+
+	return 0;
+}
+
 void sbi_domain_cleanup_state(struct sbi_domain *dom)
 {
 	struct sbi_domain_state *state;
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
