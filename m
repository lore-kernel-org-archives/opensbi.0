Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB6710F3DD4
	for <opensbi@archiver.kernel.org>; Sat, 28 Mar 2026 05:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yq3eaRip+ulBd8Y1DXCNhlHX7joRcqTy++IY3rVJOQo=; b=AhaSLn+o8IQxbp
	zkJRpwTyV/GmSV2gq3unb3Q5Pvepkw6/JEH3p00PVHSB0toj7BfCJbPhgCBkijpWXVx5Da0sx5KMZ
	mIzepK2jClP2yU9ydcPFmlqf5eI6FN7AQUmQA7M9vjPiMNf6ImMkLYicsAcBZuZ6W4u+u0MA+Oddb
	1GOl2dfd/JLv17tdSkKPHde2Ws3Lhp/ZCwmIphu9uBLECyvDU6kWiiy12YNRiYJYPker9nCn00T62
	WYaPA9YYSiZPw34U7we0SE5BCA+JVtB4rJ4bjk1JjNjZETn/Aek+7kNTSl2NQ8s6/DVkQoBJeSTzb
	iOnsbzavaIjs6Q4u7VgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6MT7-00000008bMg-0NGr;
	Sat, 28 Mar 2026 05:44:21 +0000
Received: from mail-eastus2azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c110::3] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6MT4-00000008bLu-3aYI
	for opensbi@lists.infradead.org;
	Sat, 28 Mar 2026 05:44:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r3SbkX9M38J6fygPeqh+BUqvNa9CWAyohbX+NdrJbn4QXM/tE1vuwLpLNdIcRSjKvE3J1wd6l9vKUn+6YI7IFQujM/3jGs3XI51iyZYKpwW4Xk/bf6WPzS61CoA2gecZC3kviV5NOlA6eNUaz55RY0ksQ5JW7IhD42vzxQEYECP4lkQgbdlDFVRWGb6c4zN8yig7GAd+INhDcPJLnynwEaRlBHZVGOG41R9FOWB44imqc17lxoQJQc9pmmQ5M4d4Jtt5Mm4GnP5idxISSlZQgg4zj6gQ/zZBXExY8IwCRDLp/zzIsdvs0fBMVC3WazvJu2RzNkphxLYmRIDSm/LX6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BzQrJNXzUA5+k02J3VaeZ8MY2BS88oRD9lgmM3NtpRw=;
 b=NEtUu68OS7mOAb+qrowXH2eDqPmVny5WoHlCzh+7EykLYt+64pH759y84/Dr7ZoutNVo5hgnuxH+6YxuhK7Cpzzl2EThOQZUgItnNaPzGnVW6bycNxQnteqxUy4TJ+BjfWe5BCeGWftdc9D0D+iETTZADPMnW934UVoNSk5QlJli8fKb/iZGe/pPoz66Dnf+t9z+z8woMvGIxH+9JHX3NWg1HcBx6LGE7oS+v5sOJJePQM2BpWPraJwO9GeLuoRbxk5i2y5LUgYrg5Tk7LAexjQ/gtHipx6MEkczFGfP+Gle/CdcCcW1k5o6eVb0gSITrCwekdi+5vRaS2iwWtnUqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.45.236.54) smtp.rcpttodomain=aheadcomputing.com
 smtp.mailfrom=aheadcomputing.com; dmarc=fail (p=none sp=none pct=100)
 action=none header.from=aheadcomputing.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aheadcomputing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BzQrJNXzUA5+k02J3VaeZ8MY2BS88oRD9lgmM3NtpRw=;
 b=M1rIceWyks9S9Puz9/2TO8bsZnahDmYKJGXRpsIKmkL+xCNsQMO2+ixmp71JlvNIuDG2PXjwTGM2C4WZJRqaHBGCmO25d6nu4Bl7iqiO8A3nIErz/wQm2/IF9YwxvwHRC1PLJdDE5DOiCkNB9+mgatjumchCYYJtRqQaoSDOwMdUKNkNjy+2Xow66z4/ag88gvgWmYlJM1/fhti+L7MZfB6+vYxtvYaFNgzy2bXxVcRbgJzWYG0TfGx3foK1+0E0Z46DPsbaDIqWiF4jRWcpkORlcmGos2KQYt3pdE1oShEeX9FCcyCFEj+S/LSGDTzefzRPk9qNRgibjg4QoRo9Nw==
Received: from SJ0PR03CA0193.namprd03.prod.outlook.com (2603:10b6:a03:2ef::18)
 by DM4PR22MB3628.namprd22.prod.outlook.com (2603:10b6:8:63::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.24; Sat, 28 Mar
 2026 05:44:13 +0000
Received: from SJ5PEPF000001EF.namprd05.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::e1) by SJ0PR03CA0193.outlook.office365.com
 (2603:10b6:a03:2ef::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Sat,
 28 Mar 2026 05:44:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.45.236.54)
 smtp.mailfrom=aheadcomputing.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=aheadcomputing.com;
Received-SPF: Fail (protection.outlook.com: domain of aheadcomputing.com does
 not designate 50.45.236.54 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.45.236.54;
 helo=mail.aheadcomputing.com;
Received: from mail.aheadcomputing.com (50.45.236.54) by
 SJ5PEPF000001EF.mail.protection.outlook.com (10.167.242.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Sat, 28 Mar 2026 05:44:12 +0000
Received: from davidAhead.lan (unknown [10.8.0.9])
	by mail.aheadcomputing.com (Postfix) with ESMTP id 0C30F80AAE;
	Fri, 27 Mar 2026 22:44:11 -0700 (PDT)
From: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
To: opensbi@lists.infradead.org
Cc: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
Subject: [PATCH 2/4] lib: utils: irqchip: aplic: Add aplic_get_list() accessor
Date: Fri, 27 Mar 2026 23:43:45 -0600
Message-ID: <20260328054347.3706029-3-david.garcia@aheadcomputing.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260328054347.3706029-1-david.garcia@aheadcomputing.com>
References: <20260328054347.3706029-1-david.garcia@aheadcomputing.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EF:EE_|DM4PR22MB3628:EE_
X-MS-Office365-Filtering-Correlation-Id: ba0c5e04-121a-4d98-bdc0-08de8c8d0aa1
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|55112099003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: eDv3gABX+bSWa7h6yWK0WDLMLUue6Ch29QW2eyWl+/qp/OeKYZzB76BPTQzeSziQCpWjMzbmgpl/IXKI6baFHI61gAc9plC1hiPhi/SevF+DFAZBh9RB/DJiSC8i0GCSYnpS3eyCMto8NOZnQqZ2Q4fTo970ljFe7qdptb0OgpMMRQXByPkTq9gPXabGqID4nTw1M0qus/Zk2dX4BIcKCmSxJmZEhSxxtPpkDfDNQpEMiYYk5TZEEeTATKc5CeHO1wHWKZAeLabIzZhYg9Ekd91kUutZVVn0JYSJTHjeOUBQTjm/6XojWNfargWJXICz5BOWHuYhN+aShhdXMA670CCEFvhr2ZYlWWhlq6qjx0+J+/ruHbged8SynCt4slzWG+arTxPvPNv5OWevBbh8r2+xHWR7EQJg6jrEXVre+Boa8xKMn0E6L5a9PQZPlToJEYT4TuvZBT28b7lWXn6vDEjzHFZSKYWtSkHIHvwfIW2lSzFCEEurUPKx6W2b701p7nE59pSigE92wOmgp2pq9J1kyVb6jochZym/1p4PFYfkwVZrOBbwHONUcemterYxHE95ehkjiqYgWct/gNc9B8dJQAPBa/6eyRsMe9dwOADf8xhgR9OgBxHfBpsHQrnFSE4XOD0MuqjI9oXqOcJDNW5z7EUqxTqmjnVRNmwO/Pf+XO3v14WjIdrjVVxvncHc/G4zy/6EJw7vu5HzuxPDXGQWfHu4aTT5ynEKQVVP+vQ63L0R8nUHEE+MCNZ7S4/DGhmOn1iueqj2+l8xujYwpQ==
X-Forefront-Antispam-Report: CIP:50.45.236.54;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.aheadcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(55112099003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Bs7jj2b7PqhWPnj3ovo8XahYMZtmE3+t3hiJjD67hWAGa3r52hgx8Tvf6CL5mFWqwGL4Z66knHoVsQdmXmtbpcax3pATuGQKVghwCReho/V0ZkrpS5AQg97GT+JSbqLUttqJtCmMgmm1FegMc4EU5ELc8oK4ZdR30gZBzi4ADC5t+HNqUqPLvQJxPKukUpXFpbxbCoTeaQEJ//CbSwtm0PpbgIqKdabNe5erFzon682FpWUUr6zbg8BeB2o9URvQRD989SRphjOgk0DC9F7DhfFMBPVfSsZmfy+hp8N/AfcquQSdBzmIiEtrRQVw+PMNpx5EWN7auT2IogcCRWfC4zGUkYT0g2jxTK6ts6c56xcGXWKn1qbQGrRVzWgGk3TMFbaXwATfzvifmj0vxazd9c70CTLYSdAda0Cu5FEylbqyfgLGZwpgxnG9Ddp8NgpN
X-OriginatorOrg: aheadcomputing.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2026 05:44:12.9118
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba0c5e04-121a-4d98-bdc0-08de8c8d0aa1
X-MS-Exchange-CrossTenant-Id: 53cf747c-7b8f-4d06-8b1e-b22383a3fabf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53cf747c-7b8f-4d06-8b1e-b22383a3fabf;Ip=[50.45.236.54];Helo=[mail.aheadcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR22MB3628
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_224418_905944_FC4A15A2 
X-CRM114-Status: UNSURE (   7.33  )
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

The internal aplic_list is static, preventing platform code from
iterating over registered APLIC devices for custom configuration
(e.g. enabling domain-level interrupts in MSI delivery mode).

Add aplic_get_list() to return a pointer to the list head, allowing
platform code to walk registered APLIC devices without breaking
encapsulation by extern-ing the static list directly.

Signed-off-by: David E. Garcia Porras <david.garcia@aheadcomputing.com>
---
 include/sbi_utils/irqchip/aplic.h | 2 ++
 lib/utils/irqchip/aplic.c         | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/include/sbi_utils/irqchip/aplic.h b/include/sbi_utils/irqchip/aplic.h
index 286c8f94..e2cf5808 100644
--- a/include/sbi_utils/irqchip/aplic.h
+++ b/include/sbi_utils/irqchip/aplic.h
@@ -152,6 +152,8 @@ struct aplic_data {
 
 int aplic_cold_irqchip_init(struct aplic_data *aplic);
 
+struct sbi_dlist *aplic_get_list(void);
+
 void aplic_reinit_all(void);
 
 #endif
diff --git a/lib/utils/irqchip/aplic.c b/lib/utils/irqchip/aplic.c
index a20cecf2..ad9abf86 100644
--- a/lib/utils/irqchip/aplic.c
+++ b/lib/utils/irqchip/aplic.c
@@ -90,6 +90,11 @@ static void aplic_init(struct aplic_data *aplic)
 	}
 }
 
+struct sbi_dlist *aplic_get_list(void)
+{
+	return &aplic_list;
+}
+
 void aplic_reinit_all(void)
 {
 	struct aplic_data *aplic;
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
