Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C50C53209
	for <opensbi@archiver.kernel.org>; Mon, 27 Jul 2026 18:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iam0//CAV531iJhxAOht7hqMDqfWyCgDmHsjezH/nrE=; b=hr1rXj9f9su2a3
	0wBB+b2CzrcvfAYZO/IUQ9yzprj9JA7fd9VC0F0jkumtgFcQjI87QDEe+6ggbGvo7LrnjP3C+r9ir
	uOyYpC53pOMcTa9UgCqTKBvWn4eP0T0nyyeuDiILGCmeGbg2IeKFNTfIifVcDJUix2mtlk/WAzH7u
	M4neXjkfYDYMM1WNNaSkksx0+SaSB+JAOIZkeXSxCnPPSPm6L/L0+oPDlTMl5jypslaCTJ/kgRezV
	XmhZZgT4VkzPpgfMdGgG/V0r1DYawjNVm58n8GGE0sV8E4r5z4ONBrNBCjGdTCa8yRzudDOWYSKV2
	dZvhfuS6hYO4Toqpt0nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woQ6Q-00000003fbD-0VVo;
	Mon, 27 Jul 2026 18:31:02 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woQ6M-00000003fYs-2Ekj
	for opensbi@lists.infradead.org;
	Mon, 27 Jul 2026 18:31:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LwcX2IHs8CW566PfNW1ZVYcSuO1P9eyed7zYRXf2Emh/oEn4+qZxeSqgQYWCym9cbrbDUX6kd8Gtqan9//ppzmFop6Pt9zQdJlouwDW4M7S1yvQL+yY5E2VfBSOXD33kzr7O7R2mEIFwMiJG88AlBOgUkE3TOLx8C7NLAiIGQiXupW/5Ehae0RAM8utNNabIEkMV5xQSOpqv49lSFWPTBtGZpK9HuoUtq+zQRqWZVJNvHvd5sZrf9VR7PLKTfUSHpw+S4jX0ui4o7Aj0Pd/PkT/3Bi6OAw6t0xAIWwFsnXIgDp6fvF1e5EesM1dv9kCK5kBWzWm67ZKd/VXjrYVSpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XuuIgak156F2MdlsnIzhhyJelvT8swM1If02WqULvzM=;
 b=YwStQVrr+olFBZc0uCIpUa352BZPHKV0buxf7TZFdiv/sWk/pXWu41iYaujmCL9DSii+APEys5J7f09p6qEffopRHlcRBLooZrf/yRQoT2Qf6VinfmLUqRXaZivCopATZbf4AjU0SpeQIZJS6BTZvOjWo/Bu1B0xEFdvYrxHCWLBbdpMfFPUdfn3UT9C4mDnaNvew+SglZvEYP1oL0fp5nJ8XQjA6cSEPkgk9WuSzQdc6Qb0gWSnY/Io83/B5gP6M105WhJEmAfgQItrCzF+u2XpBdJEhe/zvhNAkNVZTw00H/hfYpD2xU0NEe0k+FpXYhPQpkMzz6zg0h2Ma+RkOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.45.236.54) smtp.rcpttodomain=aheadcomputing.com
 smtp.mailfrom=aheadcomputing.com; dmarc=fail (p=none sp=none pct=100)
 action=none header.from=aheadcomputing.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aheadcomputing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XuuIgak156F2MdlsnIzhhyJelvT8swM1If02WqULvzM=;
 b=GhF5bs8YeuOCUuvnPV195cgzivhzllgQZI2xL+ue9XSa62+56bkLmXqHS4QPNWNRKIa6y9Gag553wHE80mulpfwmXiG++AYbbYxXFdZxFyxZlyB1jbd/+BJ/CwvMp+A+mFl8poR6FJ4mCesLDJaKWyP7iwRjgcLELXHmYTPcIPmv2bMCx9TvaPn+BKmjl5uMA13jcAvNYysxZ74cX+Awi9DZjgEELJhTBGqz/Ym/D0NSYeG4EnqzzdcR4nFTPiVuFeXcNmpXgNxBf1++7c8L3Tg9m4p0H89jTfBYytsz5hR8pzwW/XqQINbyfBv1K/g3VRAu/Fqe6clITuA1Ax+3WQ==
Received: from SJ0PR05CA0134.namprd05.prod.outlook.com (2603:10b6:a03:33d::19)
 by BY1PR22MB5599.namprd22.prod.outlook.com (2603:10b6:a03:4ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 18:30:52 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:a03:33d:cafe::28) by SJ0PR05CA0134.outlook.office365.com
 (2603:10b6:a03:33d::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Mon,
 27 Jul 2026 18:30:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.45.236.54)
 smtp.mailfrom=aheadcomputing.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=aheadcomputing.com;
Received-SPF: Fail (protection.outlook.com: domain of aheadcomputing.com does
 not designate 50.45.236.54 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.45.236.54;
 helo=mail.aheadcomputing.com;
Received: from mail.aheadcomputing.com (50.45.236.54) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Mon, 27 Jul 2026 18:30:52 +0000
Received: from davidAhead.lan (unknown [10.8.0.39])
	by mail.aheadcomputing.com (Postfix) with ESMTP id 00AF6800DF;
	Mon, 27 Jul 2026 11:30:49 -0700 (PDT)
From: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
To: opensbi@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	"David E. Garcia Porras" <david.garcia@aheadcomputing.com>
Subject: [PATCH 3/3] lib: sbi: dbtr: return SBI_ERR_INVALID_PARAM for invalid trigger configuration
Date: Mon, 27 Jul 2026 12:30:41 -0600
Message-ID: <20260727183041.258377-4-david.garcia@aheadcomputing.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727183041.258377-1-david.garcia@aheadcomputing.com>
References: <20260727183041.258377-1-david.garcia@aheadcomputing.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|BY1PR22MB5599:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a7076b8-8866-4aa2-59bf-08deec0d3039
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|376014|1800799024|36860700016|6133799003|11063799006|55112099003|56012099006|18002099003|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info: 5/txw6WtD57EB1ug3D6gl2ejU607VjuB1ysdgeEK0DAKQ46Y440UxM2Bqzti9+G72oWqG3YNVQ2gmG26t0ZK5k89XdkfWzutxm6VDPE4hJhOq5pT+3BWQ7mA1pdYORDKjGtALcZmUaMzu48jtUFBbXOJncknvELajvj51mYnJaIlmh0fDLRlo+dvhbBcC02n+97twtbSU3IVXj+wfFcYrPaqZnsh1DWGio3TGqRAyR5d4Wo3IFAUFUTLeiSbuMBaKdm4nYDeQgUgZPodcE6FxrnEA6p2oq1VxCektddAHRAXeJBZImvVgXC11QQK8kzm4U7B2VvmRbpKzHE+8EBlyjUKsrD6pA1hu68//p04UAMHQuLTvpBYBYcxkQfkXbfC4mtKvnt3hXBocmlIoz8LD8xKQtWBOsiBaMtS2wBEbmfvnFmqldaUPpWGfdOz43ogDr9ZdwTHo1bLjAaI4Hqa4qnX02hxGzNSW1RAQTeF328zxw1lfKWyiJ6wRMZbbu5jcarIxx9Mah0RI4bp9S/ByEIuXi98RO2BMy+H9XvuhoAHJxF5YjQyMzuzP2siLX4mJNMevqDRh6IzLaYmDOsmumACBmNInLBAXZKebM9+bzjcIgkeBf+gJBhbV2N5Cd/9BhcvFgAq/9y2NJHfKXLc7FOOyXb1EkqMrnNnQB8uS8r74veMhQdsq///iml0rs+mnDy7r7bHlzRpyVVi2W8Esg==
X-Forefront-Antispam-Report: CIP:50.45.236.54;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.aheadcomputing.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(1800799024)(36860700016)(6133799003)(11063799006)(55112099003)(56012099006)(18002099003)(10067099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: nlVaEzmaqahraNcyV1v9Y1nP+c3ji8QuieqWoZk2f6GMjWQlsJLTvsS0u26DJVIHVQejl3lRprTK78xNv4bVIhDz1YlIYraCbdVVAJKAFDoAvDmK3XfEQvvRuZ0t1c8upBqpeFIvzRo1H6RyZ9M62YXPMuPMdBi62PDYhtPWWLMKemPHk35X3M8HnG75JpOtQoQwdtPgCucyXMKA0jMCYpD6qezRteqJjpDX1/8JL8jY/6eC25a4khpfmS+niI55FSHt7rPjifwl6nwA3gwhdEkApzkZVdAvhM99tNdpl9Jbikn4Xik5RcX4Ap8lOqQjys7RyD0c64AuG66s+a2t4F7ttnIe+J8gRgk2yfUZi8EB7EWHveX1NWR5RHIoZWCVUWEWTpOmC6sVcX66rkn0wGnuSYRjSVuB5mPL+sQ66yvlm7Jq6X0XAIHWsTj/sgQp
X-OriginatorOrg: aheadcomputing.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 18:30:52.0565
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a7076b8-8866-4aa2-59bf-08deec0d3039
X-MS-Exchange-CrossTenant-Id: 53cf747c-7b8f-4d06-8b1e-b22383a3fabf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53cf747c-7b8f-4d06-8b1e-b22383a3fabf;Ip=[50.45.236.54];Helo=[mail.aheadcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR22MB5599
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_113059_202228_FF4B5692 
X-CRM114-Status: UNSURE (   7.90  )
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

sbi_dbtr_install_trig() returns the generic SBI_ERR_FAILED when
dbtr_trigger_valid() rejects a trigger configuration (dmode or M-mode
bits set), where SBI v3.0 section 19.4 defines SBI_ERR_INVALID_PARAM
for an invalid trigger configuration entry. Return
SBI_ERR_INVALID_PARAM instead.

Fixes: 97f234f15c96 ("lib: sbi: Introduce the SBI debug triggers extension support")
Signed-off-by: David E. Garcia Porras <david.garcia@aheadcomputing.com>
---
 lib/sbi/sbi_dbtr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index d06fcaeb..4fd7fb5e 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -729,7 +729,7 @@ int sbi_dbtr_install_trig(unsigned long smode,
 			*out = _idx;
 			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
 							trig_count * sizeof(*entry));
-			return SBI_ERR_FAILED;
+			return SBI_ERR_INVALID_PARAM;
 		}
 
 		if ((recv->tdata2 && !tdata2_impl) ||
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
