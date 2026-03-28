Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD54110F3DD5
	for <opensbi@archiver.kernel.org>; Sat, 28 Mar 2026 05:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QL6+Q5XUUyqeSyz79U9xEWWrQMKv2yq8bEAt1hk1rqs=; b=30XcfV+z8z3WHE
	wRndAg5hNkpL4NYm0RQh8Tk212Bj0xNo9FMHpn6KhWGeVMZLL5/oYnJVJ936ZydzYNtrKSR+d+xbE
	6UNP0LZryT+eb+B41k2xfUnHCZE6KvePzquMmdzTaYakLQ/DTsTl4Jtl6ofoxIZ8QS2kgUq7y7yAH
	7hRmklCDvXNO2aMR8tAQ9v69V5NwWY+VXPIYk/hwLcNptWS6Wscqz15JCKB96l9Fs9sDwgvley0Vj
	Fok43hc2oPvKjxEU8V+VXQj4ONx8gbcgjdoDOR4Q9zSICm2FZn792ic0gmFZN1Oja/gHnhgLT+Haw
	mtdrTH9jxo3a0uB82JhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6MT8-00000008bNR-1W6P;
	Sat, 28 Mar 2026 05:44:22 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6MT4-00000008bLt-30Kf
	for opensbi@lists.infradead.org;
	Sat, 28 Mar 2026 05:44:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=riaV3hw5cXKU/DaguapRwZZJRKpjuWMcrpFJm9fTnL9uWWoo4sFB8B0BZRpc+HMZmMaC1NNj9hpLX9MuCb6nQlsrQdzm4hdq8+HaknPRDaxIE5chbO40yTnKdINv63sJhu97KEACVCW+9cWDZVmRIBRpdji9uPzlldZ8DItHRUi6UPlQXskl20gYZAos7MhsH57g/sIX6L+tQ5KYO+3H7hjCVor7O5vz/3akXEVMUHaQjwQVsp6TLz64NDe63wjOncy9kKyfIfZ0Lpgelsdx9GbUrHsXag34UFSzE7Z4HhP2XsvBdbRzyQZMU/9rKg/A+61hVAnwRlOko+XeYUMJMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D814/gu6W/WGYnbUoZLsmvsWv1zzhK7q/SUZjVE0Brs=;
 b=xQy3VGZhUCNDomuYry6hF2ct7EV+EdBCqTNPmVNBkO0cLMzjTNI2MqsN/k/JkyBIaWX5yRfwEscxzbZKUxyC8BZoddsOvTdxrijb2emjj68sPGakPF4dLRVoK1ySMI4eCND/czw15Ok22EU/43mEFNIpqoIyoG2clfp0Nh7lILk9HIYpjpUUhjreIfBhEuVq7keIe4goHQhjZ9sUA/sW76S+/ScVeJvIAhqaQgX6CQqdAUq/REzzA3Y1SpHqHWzTsbJleENhrHXuAb7QuzBgRsOGgIQY30065sxD5Qry31nSK5Y5jZz4MLvonxeOJUS9i35dWDeWEjkCe0VNgHfkMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.45.236.54) smtp.rcpttodomain=aheadcomputing.com
 smtp.mailfrom=aheadcomputing.com; dmarc=fail (p=none sp=none pct=100)
 action=none header.from=aheadcomputing.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aheadcomputing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D814/gu6W/WGYnbUoZLsmvsWv1zzhK7q/SUZjVE0Brs=;
 b=z74WesGDXu5lBR+pMzrThp+ipxCazbj7jP0dij612XNpldvHwsuitZKdjqDf7E3fKxg7gTBc5KO84B9VQpvhiAKZVCxs5jFVfFhpytuS5xEK1nqfb9V/duriaIgMMozWi/wNEvdItmXgAhFlA/LEOEWIYW8e58kLTPb5AzBaqSzSimxTwyTwh/lHss4TAra+Bb1I9k9G6vmr/07zEwpoRP7BArzzzuOMbczvFgjJW3e7vxAhNvZylgzkz2imcXvU2PQcwnbH040yIRsX/TkSxYREo7bwJS1azEhODDmnkmmomvXz70oFaoxHjtskQiQ6+e3HzTucMyeFM7KSfuHhQg==
Received: from SJ0PR03CA0154.namprd03.prod.outlook.com (2603:10b6:a03:338::9)
 by EA2PR22MB5018.namprd22.prod.outlook.com (2603:10b6:303:256::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.24; Sat, 28 Mar
 2026 05:44:12 +0000
Received: from SJ5PEPF000001D1.namprd05.prod.outlook.com
 (2603:10b6:a03:338:cafe::2a) by SJ0PR03CA0154.outlook.office365.com
 (2603:10b6:a03:338::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.23 via Frontend Transport; Sat,
 28 Mar 2026 05:44:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.45.236.54)
 smtp.mailfrom=aheadcomputing.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=aheadcomputing.com;
Received-SPF: Fail (protection.outlook.com: domain of aheadcomputing.com does
 not designate 50.45.236.54 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.45.236.54;
 helo=mail.aheadcomputing.com;
Received: from mail.aheadcomputing.com (50.45.236.54) by
 SJ5PEPF000001D1.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Sat, 28 Mar 2026 05:44:11 +0000
Received: from davidAhead.lan (unknown [10.8.0.9])
	by mail.aheadcomputing.com (Postfix) with ESMTP id A8B0880AAC;
	Fri, 27 Mar 2026 22:44:10 -0700 (PDT)
From: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
To: opensbi@lists.infradead.org
Cc: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
Subject: [PATCH 0/4] irqchip/rpmi: Expose APLIC/IMSIC interfaces for platform use
Date: Fri, 27 Mar 2026 23:43:43 -0600
Message-ID: <20260328054347.3706029-1-david.garcia@aheadcomputing.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D1:EE_|EA2PR22MB5018:EE_
X-MS-Office365-Filtering-Correlation-Id: e6d01bbc-465f-4698-5365-08de8c8d09e1
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|18002099003|56012099003|55112099003;
X-Microsoft-Antispam-Message-Info: gTQ862WTLxkguoBFA0jDAc8rMHD50eutNl9pqHHw2LRdL0m00K/kidCkBJMyAat2lYXmj1JbPdR5q3Y8jOIvIM8tiy/nHGELAsra5yLBjBDllPn8HVmVq6cgZ0Qe8bVOUVyq+eQlla4300coSRPHRxJQS8ZSIFuOSgiPOZRqwdVXttuyXD2hxkXWlKnjNXfVwOcwj25llo2GQWbN7++Fi+IK4CORKodFQjvwqlBpe+aa3FW2+UGnoUfhLiv3jRO6I2tuDohEaDaSWOdr2qjglImev6TGW4t3thBVFnH4ljCqWOGLiRQ+D3ybvLkNexW65qtbKQbxinIBTIw7nXCL42kSWihWxjNmq2a1n9Yg+mWkTsOj9IDARvRa4cvjOROWeVMRvvaMTX4018S1pL1pHpP7CxT4Ow91iXIZq/kqhj+l5IryeDVntraJSlAtj/7WQM5bpfQHV2+yr/luDZKCkab64vX4qTkPvRg40cYNBkEoyUpfGvpaz+9cDJCw2zst00YUfY17qH36R2FGUvyqK2Cz1YhNTVXyraocZPC9/jdax9d1SjhN5g5XdxuSgnSrm8q7Cjvrj2hUrquXvWMi/rF4r1EoSzrbvxsDDYQz8cKbPhtJ3cXt0JSN/6aZ2wCOYY0Iz+Zqew9ebj4MLfgBGbIweQOC8jVdr7fEzSlnvctQqawQO4zJjv9Hxp75oOGEgIm1hnDD4iGbZZhsTaT3a3RBbzAMrRxVEfINvmtr0elspXo22NLXdZke8bt39ta4wgGZbOuOPVPnnHXZXxS86A==
X-Forefront-Antispam-Report: CIP:50.45.236.54;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.aheadcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(18002099003)(56012099003)(55112099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3oG2MyKvpim7NolvSJ94k6sBHmjDoQoGk3xUDc6Gc8ZPNAeU48hB+ZhpfTlzYpWLH4npZRbb1OfukO2lmHCdvIUXkEtncsWHUFQbJD78fHbJdk8STRMcn310hxpRSFvChwRW+3Oh0hes5KZhOy1OofLe5oXFuIg1SwOeg5agrjW+qy7/j5FVLMyggIDw9mgHOu4VRExJKRz4L28WQ/WG5qBOq7acb4JN0WLyzPsCCsMifLbreDzTN+9ohm0kob2j749jZG0/IRty3NWNTRpk882AsIubIxojf4OkNL1bHXxy/tMWNxffNmWELlVaE+tlux5Cd5vjLc47yxqf4EqauZAeXTsh3Uiel1pFDXQAqx4GmcM98AV1WHI88EA3Vaurlt16VvAmHQOZO0a2vhZ5FXG2iz4zd7yayP0hocUinQ5Anhp6cLq/xlF+YGEQ21DB
X-OriginatorOrg: aheadcomputing.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2026 05:44:11.6913
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6d01bbc-465f-4698-5365-08de8c8d09e1
X-MS-Exchange-CrossTenant-Id: 53cf747c-7b8f-4d06-8b1e-b22383a3fabf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53cf747c-7b8f-4d06-8b1e-b22383a3fabf;Ip=[50.45.236.54];Helo=[mail.aheadcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA2PR22MB5018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_224418_906469_43FBD4C0 
X-CRM114-Status: UNSURE (   5.27  )
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

This series exposes existing APLIC and IMSIC internal definitions and
adds minimal extension points so that platform code can perform custom
interrupt configuration without modifying the generic irqchip drivers.

The motivation is that a platform which uses AIA may need to:
 - Configure APLIC source/target registers directly for M-mode
   interrupt routing
 - Iterate registered APLIC devices for platform-specific
   initialization
 - Handle M-mode external interrupts beyond IPI in the IMSIC driver
Furthermore, a platform using RPMI PERFORMANCE service group may
need to:
 - Use RPMI performance domain attribute flags for RPMI PERFORMANCE
   PERF_DOMAIN and FAST_CHANNEL attribute control

Patch 1 moves APLIC register defines from aplic.c to the public
aplic.h header (pure move, no functional change).
Patch 2 adds aplic_get_list() to allow platform code to iterate
registered APLIC devices.
Patch 3 routes non-IPI IMSIC interrupts through the sbi_irqchip
handler framework and adds hwirq_unmask/hwirq_mask callbacks so
that sbi_irqchip_register_handler() works end-to-end with IMSIC.
Patch 4 adds missing RPMI performance flag defines and a struct field.

All changes are additive and preserve existing behavior for platforms
that do not use the new interfaces.

David E. Garcia Porras (4):
  lib: utils: irqchip: aplic: Move register defines to public header
  lib: utils: irqchip: aplic: Add aplic_get_list() accessor
  lib: utils: irqchip: imsic: Dispatch non-IPI interrupts via irqchip
    framework
  include: mailbox: rpmi_msgprot: Add RPMI performance domain flag
    defines

 include/sbi_utils/irqchip/aplic.h        | 103 ++++++++++++++++++++++
 include/sbi_utils/mailbox/rpmi_msgprot.h |  18 ++++
 lib/utils/irqchip/aplic.c                | 106 ++---------------------
 lib/utils/irqchip/imsic.c                |  15 +++-
 4 files changed, 139 insertions(+), 103 deletions(-)

--
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
