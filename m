Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C488DC5DF97
	for <opensbi@archiver.kernel.org>; Mon, 24 Aug 2026 02:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=07Bfm63Y7qvc1jT/VwItRm39URia7ym2os98eYZXcTA=; b=HenpiWQDKEWKZq
	6YbgaEfOcLSKzYDzW8Mw+Yj6T54Tusuf3aOCLJOCwqqreCR5mfTPVc61NYmWSHFo/PSo48/82rUDR
	aC30sw8U8oIu2UX8N0rITk7svyUxl3HLgsuSR34dnA+mXiublH9K9OvYXkb+tttT0bI9khAGhhaW1
	KUYnW3wTLEPpcwdBTbWbIO058nhz8kU/H/VxdfqYNtjOuuwzTQE7pDQtFE9euyvlejq3ObnJ5JBBK
	xFKSfOzcdEXS3ED58p8ElHIKVku3/vg7tbJ7GWHlQqrxRn7YhGq0WTN6C/xM32MXwGTHQ0jV+LzBw
	baYnEbEZj/80aWZfvppw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyK8b-0000000Fkwx-0fEg;
	Mon, 24 Aug 2026 02:10:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyK8X-0000000Fkvx-3Ibs
	for opensbi@lists.infradead.org;
	Mon, 24 Aug 2026 02:10:11 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O0kg9p1461855
	for <opensbi@lists.infradead.org>; Mon, 24 Aug 2026 02:10:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YYxqXZNsDxb
	e9ha5BCrzluYoDjgRy8xJ59jC3amvL4M=; b=juduqZFM1R8Gb26k26+O7xTs7DK
	kVBHz8YRIW+Xx09Zg3dfOFHtqnEksl+SWkb/9JWSkjMbxwAtSMu1yoVDUhqdKVvV
	9gzmBoGSWF8D+N2ldErc7CrIpV+nLWkCWLsAJiCHIWQiO10kA5zCgn1VmWHzNPux
	JGcrUDvHA8POVJ3UEvyRFklNyuTYoowzw9cyR9GtT5UH1xjMru21Tx8NF2iqw+A8
	rwJFZff/EvvlRhw9uFA/JyLzpn1xYr9tWgGMD9vhIJj4+twp9d2oTJbnOvFVu3Be
	4VECC2BaRcX/0Xy6CugrJqtGCIrP9mS/EmhlEr9DciHt/2kWeQsCNlatw8A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8bdr06jj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 24 Aug 2026 02:10:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d04908139bso40603875ad.2
        for <opensbi@lists.infradead.org>; Sun, 23 Aug 2026 19:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787537408; x=1788142208; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YYxqXZNsDxbe9ha5BCrzluYoDjgRy8xJ59jC3amvL4M=;
        b=VfF2YUkVgbEpfRJo8Tz2EdtPAFtSEs792eXKWZxbBCOVJ43yB/4iTc1KJGH6N9Qn1b
         bOIMStmV+aMFtmQ5njYed9gMIhrAsXikN5Kb6t0zkE0s+2PWTItAcFxhFVBtVKwki81K
         j/spTz08SA5KVw7xbAdHoF/5gIY5Z9Wwh5flywOlq1OIjnS05SEenk6gBUU5pll08Fxr
         J1a4iJxH9fmcrBpP4Ea8YGIWDqAUgPbB83KWFBHAmGHIUfniiCqvp2BaHIpIjNJ6Udcj
         kqO4XES0GYU8kErJIdl25+xnb4A23k+lf1FnP3WAZgcX0TCM66fNAks5hBr73c2Xa0uk
         de0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787537408; x=1788142208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YYxqXZNsDxbe9ha5BCrzluYoDjgRy8xJ59jC3amvL4M=;
        b=oau1SieldEiqnx4EXrSywgLy+6W3R4SR8vAI5nu4YHHpg0RBrXICGnCmYOgJ6T9Ubv
         7ySTM6RBkdh27jZsvQOk7+HBVtrFoS3BNW2Guc2VZnMSiiLudCy3L7ROKNzE+wMGZ/rI
         N/OZU7CSyyJeKh+kfIVeXiKn61t7nOVe6Hl6gOEbgxlS/LuIw0/UxyKWx5w49jegPyOC
         Gt+vN75BjUADt15aP6FZWjI0UK49k0fSDNAqPI6V8BCarmH14dhI48DtfERqjrA06ofS
         Fd3JvL6gp7Kb/Id9ZtzB4xjhuxeWLxT+dSuSTHwqWvgPzyQZkmblzcJkimJTHoOtXs/t
         d0xA==
X-Gm-Message-State: AFuF++m9WKZrYK3rJFQaQ3a9XsC+LIemO2NW4BSuZah34sLyDEIx7Nfw
	qzODu+wfr4QhM8ClndACd0CuVppawt6b2jNlL2hP08wfUqMdzmI/rJ36gOHcAJtlO1HGExGPKH3
	U1U4hnMCdIwKRvTe8wdS2im7/O+zZdptDIwgQHZyN9X7RftoxpFXswc+FtX/7wH6r0nke4ugmrQ
	==
X-Gm-Gg: AR+sD12I9Zxf5ZTjhkj9cASEJ1jMBv1axYPXrjJujPKqK+sDSL6q1tiAXGnMwtMkyUo
	w6x73iMIonzZZTqpO+XOwja1dOqScWKEqPov8S+4MV/XORZJ0IYFHjc7p6o6juL+xKi2cVDeY/y
	xVidV9E6JEZRjUzZFllDY2XJxb49/zbs1YZ98yyYvKgTfzw3SRFSKh0VhhEJZCxr9r3wQiR6dxC
	+T5dvBDyIPkOSnNaNTQG56jtGgwiQSoY8niGN/obLnU+UPZb+VPBEPJCT1BkUMWe9FDqy5YjR9O
	W6tV5papR74JJU8eb6jOaJC9YgzspIdl7h9oXicEmS7Y5BbKeJICWu8YF/ZXmA3EmwzBXB9Me1+
	SezY+PSqCchdY/ueSOZekqTHOj0fsCB6vat/QkXtFVirOhnkvwbbWoTh6h7XremhrHPvg7h6EBi
	HHDR8uw+WeRAZ0HWnnCAZ7
X-Received: by 2002:a17:902:f78f:b0:2c9:9a2e:dab0 with SMTP id d9443c01a7336-2d64ad92e17mr421640715ad.3.1787537407661;
        Sun, 23 Aug 2026 19:10:07 -0700 (PDT)
X-Received: by 2002:a17:902:f78f:b0:2c9:9a2e:dab0 with SMTP id d9443c01a7336-2d64ad92e17mr421639585ad.3.1787537407154;
        Sun, 23 Aug 2026 19:10:07 -0700 (PDT)
Received: from hu-rahupath-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f92359c9sm20487634eec.27.2026.08.23.19.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 19:10:06 -0700 (PDT)
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: rahul.pathak@oss.qualcomm, rahul@summations.net,
        Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Subject: [RFC PATCH v4 1/4] lib: sbi_domain: Add finalize callback for per-domain state
Date: Mon, 24 Aug 2026 07:39:49 +0530
Message-ID: <20260824020953.2438946-2-rahul.pathak@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824020953.2438946-1-rahul.pathak@oss.qualcomm.com>
References: <20260824020953.2438946-1-rahul.pathak@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDAxNyBTYWx0ZWRfXxBgnWuasKfPl
 5vun3mumxe3Q+1NihD7fj20F9JvuKgYXsoXBs4vjB9GLGXmJyXe7jPeR1QvMZKS4Fi9TVD579qU
 Fb2YW0pPPqobVtf2dXI9p0qM/Otzh4RszCBk8Mmf1Kbd8OHxrQ26+jQThEJwJvuoRgJMpzSgeSm
 3lIAfcbn44tUY3/gJlUXb7bAiULhHOWx2oDUUWMbLke8Ew+VgEbzFkS62CNPopYdARYvFfAMObR
 5tp5a3VjwfB6q99kfD9lupyC9OTEoHB+HpxYZ7/2nKXT+aPjtynrInEuN7rRBv8RdALf7XS4mcf
 sLASn9sR4zCU4ahOnw6JnV+Z2/Q5nsrI6APg+Q1Fu8grbEjoTg3Z0RggSDGwTBJSLiBplQm3P+X
 jqMKbxxWEi9qSBx6YEdwVVkeV+rE8yS1o3HpEpcWVfaXR7LzDPiZ/foEjRUv6Jo4aeknKQ0Azum
 Vt2eY6qzINmLxqKzpzg==
X-Proofpoint-GUID: TmHmHXRpQ6Io_GBbVXkSEnK1yASQD_a-
X-Proofpoint-ORIG-GUID: TmHmHXRpQ6Io_GBbVXkSEnK1yASQD_a-
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDAxNyBTYWx0ZWRfX12zERfmo0VwA
 y4QMlk8NwmptfuJxxDwp00vVP6dLzg5vV0FRvhPw07OlIGF6tGMN8QGqbW9RaXh8ioaKGQIs68C
 0G0bdFp0WR6iGsbaZIDUdvONqytvwE0=
X-Authority-Analysis: v=2.4 cv=W8cIkxWk c=1 sm=1 tr=0 ts=6a8ba800 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=A3s7GLJBcYfuUOYuCAAA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_01,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_191009_968691_71E43030 
X-CRM114-Status: GOOD (  18.45  )
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
index 72030380..6528a95b 100644
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
index 79d61c54..aa85d736 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -845,6 +845,7 @@ int sbi_domain_startup(struct sbi_scratch *scratch, u32 cold_hartid)
 int sbi_domain_finalize(struct sbi_scratch *scratch)
 {
 	int rc;
+	struct sbi_domain *dom;
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 
 	/* Sanity checks */
@@ -865,6 +866,21 @@ int sbi_domain_finalize(struct sbi_scratch *scratch)
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
index 2d1f30e3..f8ccab69 100644
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
