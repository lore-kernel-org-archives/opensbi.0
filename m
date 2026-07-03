Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF8AC44500
	for <opensbi@archiver.kernel.org>; Fri,  3 Jul 2026 05:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N2oQJKgI5kNK2f11vgwh0spt3Fg8eoTmwytsLkFc9oY=; b=F8Qs5KPdBLLXhD
	Jh5zhEwP7UVHjfuxgQqYf6p27tkhXC8VoDDxSeXqCHZsZ/uKt8WUfe/Av7fTzAbhGr9ju3oQW+wQO
	APjD62CAuOPvxyznH3/Usdh298Cd5OWk0br/pcZuwLMo3R2HyiTa3V7oVQBqNK8cH6SQZu4sLcjQg
	ADB2FFa+4gP1jHZv5MGpcWOWBYZvI98BzP6QY4LOpLDLoFHlDrVYABcfH6DBp/ThzcaeNMDhUVEf3
	1hwgX8xODYKPlKsPNr+VUOw0txWW7a3MaTilTTMfa4LJGf1XtKpRRCOvj3agK0Padwfa8+zTYLw0c
	n0OwpzxEjkWL10jk2jvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfW5y-000000062us-40Dr;
	Fri, 03 Jul 2026 05:05:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfW5v-000000062tv-3us0
	for opensbi@lists.infradead.org;
	Fri, 03 Jul 2026 05:05:45 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66342Xh52828879
	for <opensbi@lists.infradead.org>; Fri, 3 Jul 2026 05:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:sender:subject:to; s=qcppdkim1; bh=d5L+
	cdcZXxkxKGZ550f0LmXvNVa7zjkEHkK8J0bOJ2I=; b=La0603QoN66jYCR4LIT5
	spA/KW6B8aoKZzoGxtzZewvYap/wHRmLgR14ErrFFbZn5yZT1ReMc9Cddw12K5CO
	UETmvvEcggiliSoFZKlg9WfzXkfHRhuYKQhDRUg9dE8/eNJcvfhlIsLmpk4cCwxP
	eC8vqgPZ8xS65X6TPYuxe/1svVo7Ud3pfvLqNlaV++Q+ZIQ2Hy51xzdE9vxT8mHy
	jjp5zNywqEUa2qI7cVmHzDR60FxBZo2mI9D3tB71Iq1spPr+tB6OlOHZHQ17cwOt
	BgJnIbfe6Gsg2h2HQPnw0iVjD7ISHgfsQtgoZ2VpnwJzqYuhgT30oUbdqY3mfCQB
	Vg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b58hwv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Fri, 03 Jul 2026 05:05:43 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c9151bf6ce7so306193a12.3
        for <opensbi@lists.infradead.org>; Thu, 02 Jul 2026 22:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783055143; x=1783659943; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d5L+cdcZXxkxKGZ550f0LmXvNVa7zjkEHkK8J0bOJ2I=;
        b=E99y5jcIMnYxpgSNVmB/1KdhqoACLeUM6+IN5iI01+M+r0oQh0qAyc4L/XwTTjpXSJ
         /V9CuIAXsQAxKK9oRIGV2BI7PIvJVjQ8IvPH2RheiCJSsXkQHCiWGhu5BikBP1mgqMw4
         MC8gQ7ldE2CquXY6uwpZt4GCl1x2x0uZRvoKkh+21oAmByhI0qLCMqeXiJk6TG8kDrEs
         ahBdc+z0ndGOl9WQmQstHQPZWQxuGwqp4AVmL2JkY8rK6Z1rSIJLetJgFv5cSgrdBIPq
         OOUI7PI95EcAlDbmnNkAdwI+zRglqbJY7l/v8ucvdq2ZrZ/6aayfu1TAN7zwWlw1Ej4q
         Oo/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783055143; x=1783659943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d5L+cdcZXxkxKGZ550f0LmXvNVa7zjkEHkK8J0bOJ2I=;
        b=PkWG29ZMazRxKDNZyibht+5wg3fg9cCdFuGpLp5zgRSBL9O7qlsdpxGZ+5TD8Rcv5Q
         srglDZ/i6R/I75hyWGrcLFmcy8c//+gFrY2VwFi1WY3XhDpK1OgmQ1HINiwTAabTilE3
         dmzy216cNZOvX1TimvcxYcfj9QmOOeXQRAN3vsq/d0p0ATZrpi3S4H43YbAjkE5k6/ng
         BbjQ3GFOYXmVAJQRb5z1w1RnM0EvfBkPCmgUEwFnMIYTB4oW+iiA2+nDiH95J4uWY2CS
         UGHbcAOTraHFvAgWDHXASXdJHa5Kj+5AgTIwb7TlCzRQ4wk3PEPqnhqyqP20x9EeA3LW
         vWgA==
X-Gm-Message-State: AOJu0YyWzTSIy/n/iimFKTLOoqyY5NglyKIPF59mKOwNRs6UXLZB8iBI
	7fNfsaVT0I5LeQIkWEcBBXiu73A33ptVH3ET7s7WL8z6Xlb5/CdesmrIEoSSQoM6CzyxW0+FXHu
	6WriQuaRiCCxM/XYfh+O4nGntZp7TyOjGcUZqj4bTa8uGOUEkYU9mZOQfNS5iXcpgQR1StRpqRw
	==
X-Gm-Gg: AfdE7cmcpPg6mRH7Iak/CQ+PNktw5YcBRLbv/IkleCljzo2/pU4hYQGh2btk0ezlHS4
	zARWyewsI/t1S2oq3h57d68qmiMYXNmkLqGkpn7sCo0f4/C4/elYLZN6iwNrDbDVrHXteZxjUFN
	KL+e0YqxSh4oFxxvvbJoFnHxlCHhM/HqmR1iWC+ORwp5X1sLgQq2Yo+UtVuF9/0lvlU4i+bR/XU
	Aq0/niviBwSUnRG0JrFnZ6NJZ7iGqb/oabdtxEEkrMboaxmokJmIXKx/F0VZD12oCRvZP3Fo0a8
	L55fhuT6DJkrMAy5hR3USKU22iXTiQCYGn3Jsvy4ZBzLP23Sv0lLwEWW+8vJRwEA8tFolzgBMlC
	CFx8wSlwfjdEClEZCiTAFhZS1qewWbr0RPN4YI4uTZD4MQ7BzNoWWelDeL2hSMH8P47Y=
X-Received: by 2002:a05:6a21:514:b0:3bf:b960:6fc4 with SMTP id adf61e73a8af0-3bfed4701b4mr10245817637.30.1783055142816;
        Thu, 02 Jul 2026 22:05:42 -0700 (PDT)
X-Received: by 2002:a05:6a21:514:b0:3bf:b960:6fc4 with SMTP id adf61e73a8af0-3bfed4701b4mr10245798637.30.1783055142318;
        Thu, 02 Jul 2026 22:05:42 -0700 (PDT)
Received: from hu-sunilvl-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bbdc4eesm16850587eec.24.2026.07.02.22.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:05:41 -0700 (PDT)
From: Sunil V L <sunilvl@oss.qualcomm.com>
X-Google-Original-From: Sunil V L <sunilvl@oss.qualcomm.com
To: opensbi@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>, Sunil V L <sunilvl@oss.qualcomm.com>
Subject: [PATCH 2/2] lib/utils/cppc: Emulate REFERENCE_CTR and DELIVERED_CTR locally
Date: Fri,  3 Jul 2026 10:35:30 +0530
Message-ID: <20260703050530.2460037-3-sunilvl@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703050530.2460037-1-sunilvl@oss.qualcomm.com>
References: <20260703050530.2460037-1-sunilvl@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfX7RHRVQ7SNCEC
 Q5oHrLbYsJs5ottxKrjDCgt6Asr1vrIgSZAJWZJU9cWmQM3T/bPp9GBaw/UQenzkEYYE27kinbz
 RdAVuPULKK+N3JX0iR3zRc2FsOquqsM=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a474327 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=gWv9P3_6ABhfcv6EMwwA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 3PwP0EUqFP8RK7tE_TwmTtx6XzSHys75
X-Proofpoint-GUID: 3PwP0EUqFP8RK7tE_TwmTtx6XzSHys75
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfXzdqFjxvwrfgp
 kTCCjyZOlNaV458KN6TmCTlRdRtxVm5PLMvpET/t40yuLyUFk77IdnKDUdK95RWfTL1aDqpij/m
 Dtkhq1TmgH+Kodh+Qd+QiqeU/mq0YXWiKZ9sCW+5sIjnNgPS6jQh3hzmJlVngUo+70uvI5+1rMD
 hGWsKW1WMi9M+1S2PXhaomC0zOtz6GFRPgTNkAG20tv+/ZGvC7stUB/M0u9vMsq9NwXR1+ibrYd
 O7AAQyAnPE6t9Aon5EnsGW+c+RhnbxQO4x1uXAePomwHrnqsynisc/DI0rvWSB2NxsLpCQJ2psU
 zxJu376cHAfngMyh/1g0QPwNm/A7UN5sIbbG9S1tnUycJqkLJgkaj1iyg/BHDYz74j0i22KlLq1
 Q3lqge3A3Gl4P9YmDP7rf+hAfh5z5XW8whgSUsspPCFj8wUTuODpa32gc+4Fngh6+zKtfh8cuC0
 gbh9ihpljmgI6uB4b1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1011 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_220544_229565_34807AF8 
X-CRM114-Status: GOOD (  17.28  )
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

From: Sunil V L <sunilvl@oss.qualcomm.com>

Currently, REFERENCE_CTR and DELIVERED_CTR are always read by sending
an RPMI message to the controller. This does not scale well since
these registers are typically polled frequently by CPU frequency
governors.

The reference counter can be simply the TIME csr, so it can be read
locally without going over RPMI. If the fast channel is supported,
the delivered counter can also be emulated locally: the fast channel
exposes the current frequency, which is multiplied by the elapsed
TIME csr ticks since the last read to calculate the delivered
performance counter.

Signed-off-by: Sunil V L <sunilvl@oss.qualcomm.com>
---
 lib/utils/cppc/fdt_cppc_rpmi.c | 44 +++++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 6 deletions(-)

diff --git a/lib/utils/cppc/fdt_cppc_rpmi.c b/lib/utils/cppc/fdt_cppc_rpmi.c
index 7bd3b0f90d6a..15c893517a6c 100644
--- a/lib/utils/cppc/fdt_cppc_rpmi.c
+++ b/lib/utils/cppc/fdt_cppc_rpmi.c
@@ -12,6 +12,7 @@
 #include <sbi/sbi_cppc.h>
 #include <sbi/sbi_ecall_interface.h>
 #include <sbi/sbi_scratch.h>
+#include <sbi/sbi_timer.h>
 #include <sbi_utils/fdt/fdt_driver.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/mailbox/fdt_mailbox.h>
@@ -39,6 +40,8 @@ struct rpmi_cppc {
 	ulong fc_db_addr;
 	u64 fc_db_setmask;
 	u64 fc_db_preservemask;
+	u64 prev_time_csr;
+	u64 prev_delivered_counter;
 };
 
 static unsigned long rpmi_cppc_offset;
@@ -107,6 +110,7 @@ static void rpmi_cppc_fc_db_trigger(struct rpmi_cppc *cppc)
 
 static int rpmi_cppc_read(unsigned long reg, u64 *val)
 {
+	u64 curr_freq, curr_time_csr, time_csr_delta, freq;
 	int rc = SBI_SUCCESS;
 	struct rpmi_cppc_read_reg_req req;
 	struct rpmi_cppc_read_reg_resp resp;
@@ -116,12 +120,38 @@ static int rpmi_cppc_read(unsigned long reg, u64 *val)
 	req.reg_id = reg;
 	cppc = rpmi_cppc_get_pointer(req.hart_id);
 
-	rc = rpmi_normal_request_with_status(
-			cppc->chan, RPMI_CPPC_SRV_READ_REG,
-			&req, rpmi_u32_count(req), rpmi_u32_count(req),
-			&resp, rpmi_u32_count(resp), rpmi_u32_count(resp));
-	if (rc)
-		return rc;
+	if ((reg == SBI_CPPC_DELIVERED_CTR) && cppc->fc_supported) {
+#if __riscv_xlen != 32
+		curr_freq = readq((void *)cppc->fc_perf_feedback_addr);
+#else
+		curr_freq = readl((void *)cppc->fc_perf_feedback_addr + 4);
+		curr_freq <<= 32;
+		curr_freq |= readl((void *)cppc->fc_perf_feedback_addr);
+#endif
+		curr_time_csr = sbi_timer_value();
+		time_csr_delta = curr_time_csr - cppc->prev_time_csr;
+		cppc->prev_time_csr = curr_time_csr;
+
+		freq = sbi_timer_frequency();
+		if (freq)
+			cppc->prev_delivered_counter +=
+				curr_freq * (time_csr_delta / freq) +
+				(curr_freq * (time_csr_delta % freq)) / freq;
+
+		resp.data_lo = cpu_to_le32(cppc->prev_delivered_counter & UINT32_MAX);
+		resp.data_hi = cpu_to_le32(cppc->prev_delivered_counter >> 32);
+	} else if (reg == SBI_CPPC_REFERENCE_CTR) {
+		curr_time_csr = sbi_timer_value();
+		resp.data_lo = cpu_to_le32(curr_time_csr & UINT32_MAX);
+		resp.data_hi = cpu_to_le32(curr_time_csr >> 32);
+	} else {
+		rc = rpmi_normal_request_with_status(
+				cppc->chan, RPMI_CPPC_SRV_READ_REG,
+				&req, rpmi_u32_count(req), rpmi_u32_count(req),
+				&resp, rpmi_u32_count(resp), rpmi_u32_count(resp));
+		if (rc)
+			return rc;
+	}
 
 #if __riscv_xlen == 32
 	*val = resp.data_lo;
@@ -276,6 +306,8 @@ static int rpmi_cppc_update_hart_scratch(struct mbox_chan *chan)
 			if (!cppc)
 				return SBI_ENOSYS;
 
+			cppc->prev_time_csr = 0;
+			cppc->prev_delivered_counter = 0;
 			cppc->chan = chan;
 			cppc->mode = cppc_mode;
 			cppc->fc_supported = fc_supported;
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
