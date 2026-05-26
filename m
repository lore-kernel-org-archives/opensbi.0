Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38FCCD5BB1
	for <opensbi@archiver.kernel.org>; Tue, 26 May 2026 17:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7/9NSn7qz7UdzOoO0OlmUBeNmrnRajfiu6Yb9NIVe0g=; b=UCTZ0PN9kMf2D8
	Of6OnEivv5ftPnQ4AhVzs4ghcJFEj1xMVtsuyu3OmXUbGMBTjzyVcD4mDQpCi3/K9B4OhGH6XeIV/
	zdd2Sv+EzUEaXJVo43+c4bZLu+hOO3MwnDbEkhWlRUO+xAWRCP1sZA7Smo1b2Y74dmyaG4Ql+vsUW
	cB+AdKoiTByK+3CK+wuegkD5LObfb6rHYGsZDi+PaMNX7JbSaV831rw8Dz72MijRTGOCkHdfV5Va5
	tqsWNccU3iOIKfXSUn4FDcZfM8Kgmk8KEqS4p+uoGRyI9piWNIlDSCjJdNt7/Mpl7bCC/xyQ7y2ec
	pnD/ynArnZizUKt9xfjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRvWe-00000002iQ6-2bLR;
	Tue, 26 May 2026 17:25:08 +0000
Received: from mail-eastusazon11021139.outbound.protection.outlook.com ([52.101.52.139] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRvWc-00000002iOF-0LCe
	for opensbi@lists.infradead.org;
	Tue, 26 May 2026 17:25:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kpLqgsLEVvYVOJC14elJMoeq6zppGmd+hZ4CImZbTbl/vfMCcxMtQVxwESkBYz+NQkTvWCWPV3hXXditl4iOUDFWJY1ODJyI6SIOnWLHxj6jhf97NQ/hOpQujxNYgyda/awqYYO2puf6PdY37lCeO1wycAHrPIawSt8IGpByspEHtBMkz8toOMR/PZxjAkIAqDvDQjW8flzYXBREzkJOFUhHlGxvl0ko2M8jVXPpHx+OnUwX1CbcfD0bBxoLI2Z+szIWrdBZvXhqpuqlzZzjvlWUu+bdQNdkhgiB2jc3279bvpiyfVVeoFmfiJDv6mc2AOPK9KkwMmdrSVNUU/eeag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cweevmk+NEsEP++ZxiQwar/i6X5lohm4WaYJLa3AKn4=;
 b=BOFbav22NtNGSdvg7WMztlPdwYOxFOHi7gvrlb4XyyKdVdKgz/lEimnTCWJhyXmGd2g+NrfSExoUge5sRSciO0knorgZbtvDc+WiIVwkF7toB1kqIGHteIZuap08zoljLini+IiTSw/AWYsxf2LyV7Ya3xPCZobceGn1uanO999z/WYVv/BIGkvtOLWpDtwoAJQmYc2mHiDc+KD2Eojne/8K4GlpC/Pez7thwUQM9IipD95eJ7HzpgeOZvjjtw1x029PKu26FhFL88T/5hxpPoc2v2QDdAxanJvtDYjM4uoXTFK5PQn/UtJ1ojUChTW9FdSDra8N1z6JdIzuWtjidw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.45.236.54) smtp.rcpttodomain=aheadcomputing.com
 smtp.mailfrom=aheadcomputing.com; dmarc=fail (p=none sp=none pct=100)
 action=none header.from=aheadcomputing.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aheadcomputing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cweevmk+NEsEP++ZxiQwar/i6X5lohm4WaYJLa3AKn4=;
 b=14PRVB9OoGV5ChqetjY94kJeUfA52jq5qiLYV0TP+q1LC3EsIdkPAIE32ELPYo696VxLA2mDKvwKkZWULswPw+S32GGeZmSOXgr910xgQMV5bg2Edi3jmk0KXHUjG59g3Yr5LdNUgu0pX3Fd+MXFulZJ3htdQ86oRlPrrVlPMWLo2FSUT6ggHqogvmAJHwbGDGxnzGmNadW9mG45t0e5KGIKrHOmN8e5ZlWLdgd7SszlbiTwrDk0/mLtcRVXuv2IOXCCMP6MGXRyUMB4EjcOdCGGKdsIT4AncpMRO9SooaBpkzsTfLOBa1ekYK2j+5bdJcPM/Z6jm5L9hpzL34IAUA==
Received: from PH8P221CA0018.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:2d8::19)
 by DS1PR22MB5705.namprd22.prod.outlook.com (2603:10b6:8:1de::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 17:24:56 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:510:2d8:cafe::67) by PH8P221CA0018.outlook.office365.com
 (2603:10b6:510:2d8::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.11 via Frontend Transport; Tue, 26
 May 2026 17:24:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.45.236.54)
 smtp.mailfrom=aheadcomputing.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=aheadcomputing.com;
Received-SPF: Fail (protection.outlook.com: domain of aheadcomputing.com does
 not designate 50.45.236.54 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.45.236.54;
 helo=mail.aheadcomputing.com;
Received: from mail.aheadcomputing.com (50.45.236.54) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Tue, 26 May 2026 17:24:56 +0000
Received: from davidAhead.lan (unknown [10.8.0.21])
	by mail.aheadcomputing.com (Postfix) with ESMTP id 79D0C8055C;
	Tue, 26 May 2026 10:24:54 -0700 (PDT)
From: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: "David E . Garcia Porras" <david.garcia@aheadcomputing.com>,
	opensbi@lists.infradead.org
Subject: Re: [PATCH] lib: sbi: dbtr: do not unconditionally access tdata2/tdata3 CSRs
Date: Tue, 26 May 2026 11:24:51 -0600
Message-ID: <20260526172452.280191-1-david.garcia@aheadcomputing.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ahUDmImiqdlJAhdc@lima-default>
References: <20260525185033.4165210-1-david.garcia@aheadcomputing.com> <ahUDmImiqdlJAhdc@lima-default>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|DS1PR22MB5705:EE_
X-MS-Office365-Filtering-Correlation-Id: c957d484-264f-4c36-9d20-08debb4bb4bd
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|4143699003|22082099003|18002099003|6133799003|56012099006|55112099003;
X-Microsoft-Antispam-Message-Info: 2392bET11Uh8SEE/0Mhm3Gw9u4HFAJwdS/d7KBUcV3Bj8TkA1zM0P0HxDYtKtggvp68lBHDgNc5mNvsWXD4vinwm4Gj3PpuztoB/Kkc4DiHzmfz31zPjJ90IgVPA2wFOfxfVIN7bpZidNa7rAHBEINS8av84tDZFE6lp9ytDkmkLj9+CFL0o3ArNaAoe8MO7aMY+azBe2t/dBVlNfFtG7w2bEe5pS6UXSJz1MaAh3ezvsI0oXCs+/iiFguTqU20KVZ+1hsf1k3u3h0j9n26ne5WSk99dOd7kLEj/zobZBJ3XSoHZ3zZq4V/WTjl1wfRueNqRY9iOD7BtrSGh/1w+ZBY7eSUCrHIKbwkjLqkFmM0QEuO1/ClEx3XZ3bIHyym3bjobT4ZtG3MizraVgbrmdSdsWpekVriQW8od1Bk0Ap0cl/Wx7inetrhj0yrhoWg4CG0G9gYHZaoS5wgAmSwbJogqIn8wyY4S1KRDrpksqCDHe1maHHFeve4c8e7dn5ZCgd8iaai0lqCRA5NBEoXZM6g5HrJhYm0bgMRJ5bbjSmHcCAejY6/Q6jPtaPU3uNXw5C1oMRCbT7oP+d26IrQ78YbDbLWYu0l+6PjTj12jiG/6xRL0zPb2Bt/RvhkO4gfY6+g6nwsnLty00loTMTzYim+1MJBC2LE3GrUQbplVRInxc03jtlxNUJYTirpipEPGoQ1uSDrGURiuozEzVuMBl6TIIaHFldjegfbBDcWNH3w=
X-Forefront-Antispam-Report: CIP:50.45.236.54;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.aheadcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(4143699003)(22082099003)(18002099003)(6133799003)(56012099006)(55112099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: c3VbevYlWghBS1Txw7yqor0g6w/Aw026uWz2W6fRDh0M9qbSi9TB2nckg16SBeodRstGnRFYALFb1ItD7A5e25MKu67Q/DSec6Mo+RLvahwDTqO6ZZg8KA6HUCM62t0wwW7gZgYg1a2ptM5SlTrYhdYvuRO5iTuBOf129Nb+SI5xCxamz0fbz51diviO8BTDDjmIkLRboo1rivGIM/FMlUsx90pEH/FYMUGpgQYacI50UB9bt4tK15Hx8Ey+3zO5Rz58kT/4ZGHp9vAGmfh18iholUlzK/q9hrorjRa7DcX0d6kqu5RKHZsQBXjZH9+jSnlQOSzlz6ViZoarCRLAdbZBuHtfAIVEqJ4Izxu0k6XfWUofs+2VCE5dW6haXdz5coWC199fFBw+T+6UR0Z+0CMVdOKxmW7rhv9SZxxMZk4Swm1e6BhRyYGvnJkuXYn2
X-OriginatorOrg: aheadcomputing.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 17:24:56.1516
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c957d484-264f-4c36-9d20-08debb4bb4bd
X-MS-Exchange-CrossTenant-Id: 53cf747c-7b8f-4d06-8b1e-b22383a3fabf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53cf747c-7b8f-4d06-8b1e-b22383a3fabf;Ip=[50.45.236.54];Helo=[mail.aheadcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR22MB5705
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_102506_276838_7AA71D78 
X-CRM114-Status: GOOD (  12.55  )
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

Hi Nick,

Thanks for the review and for the QEMU context, I missed that work from your patch series.
If QEMU behaves as stated (tying trap directly to specific triggers), then yes my checks won't suffice.
I'll update my patch and submit a V2, lmk if we should maybe merge it into your patch series.

> Unfortunately your fix here I think won't help the existing QEMU bug
> because trap depends on the selected trigger type (see
> tdata_available()). Arguably we could just ignore QEMU... but using
> csr_read_allowed/csr_write_allowed would solve both cases. What do
> you think?

Agreed. v2 will drop the boot-time probe and instead wrap every
tdata2/tdata3 read and write with csr_read_allowed/csr_write_allowed,
checking trap.cause locally, this should cover all cases.

For read path, I used your exact same code.

> These checks seem consistent with the SBI spec, but even with them we
> miss classes of these errors AFAIKS. To be comprehensive we might
> need to program the trigger then read it back and compare. Which
> might require some complicated unwinding.
>
> In any case I don't dislike adding the checks, but perhaps they can
> be addressed separately and we could decide whether to cover other
> cases too.

I'd like to keep the SBI_ERR_NOT_SUPPORTED checks in v2 to satisfy
the SBI spec wording in section 19.4 / 19.5:

  "One of the trigger configuration can't be programmed due to
   unimplemented optional bits in tdata1, tdata2, or tdata3 CSRs."

I'll implement them via csr_read_allowed so there's a single
consistent code path, and I'll add an explicit comment noting that
this only catches the "whole CSR unimplemented" case -- WARL
tied-off bits within a CSR are not caught and would require the
program-then-read-back approach you described. We can address that
as a separate follow-up patch.

v2 incoming.

Thanks,
David

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
