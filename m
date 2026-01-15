Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77505D46604
	for <opensbi@archiver.kernel.org>; Thu, 15 Jan 2026 17:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5N29Rr7zq/JdMkmodvuJKN6dyMFUkOaTJGl947OIh44=; b=Uct5TrYtLhNQbX
	SifZ4KDpUAAA8ms039qqloZKXQOffe95FmgMyz0yuHu8Lu1FwsL5nn4ioeS8gaPLzBvYBrWc2WAaf
	54KYzV3i291ANQSf/KUfKz67gVPAbxYCwA51mwDxxKyCgBFI1hMfE4gMSXvzShd34CZy0S6cCGCw4
	rhAc4jmLyoKqdPfkaMG2rHe3RXhSIQRy887m5cazH+IEFIfzfHjoOuxHhezpXyF6tbL1C5hAaomGw
	LuUajZChG9Cf5NCi4wCaUi5qINCJiJ3rNbEQIbDr4SSi3ZvyjVXObKzwsECVur+x5NHvxZVjRCq4W
	4lAB4Jdp/yaQxDGkfOyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRSG-0000000CsOq-2Xli;
	Thu, 15 Jan 2026 17:48:20 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRSD-0000000CsMR-2YNg
	for opensbi@lists.infradead.org;
	Thu, 15 Jan 2026 17:48:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qO8msdvQ+tqlzk//xfZeCrZP5OCfe4J+UWSyf9vdvKy5GxIlcMgw+l++Hrvf9DoxwOcoi44s//U9cDG5xRUu8T6NzCzTi4DfFMjxEme26dXBN1zws6R5Y2cQ0kvrJ0agcrPNjbxhZaIoGL66v51hpGDqCKN422zBNTyu4P4F6c1up6pv+vBVBnJc1IJbeTFjd8knwxG8F+WkLiJXVQ+z2G3JP7OeAWkyCEA+NmzdsecW6SPKgxjvb/bt/5b1O0Cx+UO1E9Dmz0JwQxLBrrxfkQ8PKnhPsszCTc6bxsxsjgkAmmDyRr8q7eTi4pEb+2Ts2uLf7Dr4Z4icJPgXCeWnaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k5dfnbZsKV6L46kxgpoAwT9jO1ljB8f2l8zI6UJCb8Q=;
 b=lr04lM5P0W9DDXhJDSRu3CjILs6ndEnTKuytHDipUpT6zclngw5QK38k15xNiF4iIbnyvmDWZYzCYkr5jsmXrMqhBfqCiMWQDWVdivyBbgx2QuHFhmrO43fT38FzkY9tKkK8/1zeNPDPOk6NM7pZ8kD4znNzReqjoGnLYzPc1VDu27QYg2ZQm5den7yZWRLhBJ0CMiZ8NF6XVgV4BZVPDJX2w6OD+qNu+6vG602NQPgfGkeoH7xjzs+gfVaRRL9b5V7wgSqoJkOCNioo0fvnzsmL3BNrBIENQTn0psDajvBDmxkFMCmfvU0U6rLpMqWc9ZZPnXXr5jlw8rEiS7GhfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mobileye.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k5dfnbZsKV6L46kxgpoAwT9jO1ljB8f2l8zI6UJCb8Q=;
 b=MVgPG4+zeOImuzDezPcedRvrQp6VCRhB5sY5L3xnhmCqBKDOM2PiM3tWeyFRHQKirbQ3wlYSIGFk4XQJNGFypqvIWb8sAWZWeCyZmoq3TWHyWn87sNQWFd9D3N/9CrRoGYa/gkX6kpo735gX0c0lidBMPCq8dXLq1pgqNpj7rqs=
Received: from AS2PR09MB6296.eurprd09.prod.outlook.com (2603:10a6:20b:578::5)
 by AM8PR09MB5227.eurprd09.prod.outlook.com (2603:10a6:20b:3da::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 17:48:10 +0000
Received: from AS2PR09MB6296.eurprd09.prod.outlook.com
 ([fe80::ef0b:e667:faa1:bae0]) by AS2PR09MB6296.eurprd09.prod.outlook.com
 ([fe80::ef0b:e667:faa1:bae0%5]) with mapi id 15.20.9520.003; Thu, 15 Jan 2026
 17:48:10 +0000
From: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
To: Bo Gan <ganboing@gmail.com>, "anup@brainfault.org" <anup@brainfault.org>
CC: "cfu@mips.com" <cfu@mips.com>, "opensbi@lists.infradead.org"
	<opensbi@lists.infradead.org>, "benoit.monin@bootlin.com"
	<benoit.monin@bootlin.com>
Subject: Re: [PATCH 11/22] platform: generic: mips p8700: restrict memory
 region to physical memory as in DTS
Thread-Topic: [PATCH 11/22] platform: generic: mips p8700: restrict memory
 region to physical memory as in DTS
Thread-Index: AQHchTcuEhC0149Za06LqMo/14/4FLVS9GCAgACM+mM=
Date: Thu, 15 Jan 2026 17:48:10 +0000
Message-ID: <AS2PR09MB6296A1830FCFD2C049109DEF948CA@AS2PR09MB6296.eurprd09.prod.outlook.com>
References: <20260114092118.1315581-1-vladimir.kondratiev@mobileye.com>
 <20260114092118.1315581-12-vladimir.kondratiev@mobileye.com>
 <7cff5c09-4f76-4079-9c1f-e80116e54ab3@gmail.com>
In-Reply-To: <7cff5c09-4f76-4079-9c1f-e80116e54ab3@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR09MB6296:EE_|AM8PR09MB5227:EE_
x-ms-office365-filtering-correlation-id: efa70944-fe0b-43b0-d3cc-08de545e3f76
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?0P25r8zcguI7llb4YMGwmup7dp9ltpJQUD6EELahp5xKV8mxrCDcBIA42c?=
 =?iso-8859-1?Q?IzVle7CIpntgvLNXDlhpLPZ0tglgS3boG6rDHwhkefE9E3RQWGte0BUEfn?=
 =?iso-8859-1?Q?CUTWaskeC5RI2McWBnPz49Wr/uLL3LNSit1KQx0IbpC5WGBzFPD72YOrnc?=
 =?iso-8859-1?Q?EZIKHxe5Qipy9qBn0Cr0U4o+aSTruAxWqwv9QtG6iCfw8TVmqcAN0vWBEI?=
 =?iso-8859-1?Q?39vbMvqif5us9rDQX4B2B8uQhyXqL9FvuqWt/ysAwMofd+bBAsfRMHeHBv?=
 =?iso-8859-1?Q?Iz+arVY6C5RrRBTfGH8TRp+uRytUl3oWw8PkEFsa35yl95qA11b8nTDEa2?=
 =?iso-8859-1?Q?KcgdOfC/pSo27jc0Xl/gNjASi79EbpoCvN3YZ3+oxfLs2zkdxw2ms90f9F?=
 =?iso-8859-1?Q?B3gJTooJ/eZEkZoxqmRSUR/ZAHienOxlrjng1QssvkWu2biJIQ65zoFLtq?=
 =?iso-8859-1?Q?0/1bHREOvaCuN0BPwJtO3H4VdTrSkFXNDi2NbuGzSM3PnVbvAmAM9JKtfi?=
 =?iso-8859-1?Q?aTr5HSEKmXKmU7eO7WgzBazGXFQ8y/qxp3d6MpRGvv2gplyTRQTNSyVW48?=
 =?iso-8859-1?Q?QZ7rR8tazmlqA7PolWl70vYmP/sHePvu2IKhsqA6vGqi7aou2O77whWENu?=
 =?iso-8859-1?Q?rTuS/OdgqlS9Yde6PF8Ytr6B58BmOfW64TD0OwPiHELGOiqLnUJBsm34YX?=
 =?iso-8859-1?Q?3i+uTHcTi3jG2uw9OQ6/rgjYA1+i9JFd+cWt/Bshnx79QzSlhKGpgeFH+g?=
 =?iso-8859-1?Q?kKn/v7+VwDtGDwXYrCWiKld8Qk1RNeVEGqyd3DmowhrSdQQp471PV4qdce?=
 =?iso-8859-1?Q?aN1j78ytCE8MqzB7M7LvCum6nyJZmbs1VmHDNzpteSpFTmjjeZMIh2n2+/?=
 =?iso-8859-1?Q?fD1HAJ7Cu9xJUDQ2J2r1VzWdXThT49iEeejdeljlKniTUSd+n1UVg+Vpil?=
 =?iso-8859-1?Q?7KgS8AJ/+xbvUMAfT76Dg0M6NDyUwscM1rn40qF0y/ROAVJm5TtVCBGzka?=
 =?iso-8859-1?Q?FTSvOsV/x5IyPElHBpkfi+VSqLO0si3iOos8vz6eq6mo9E+75D7suvdFgW?=
 =?iso-8859-1?Q?rnbKSb6OJhcJ+sZr5my1yRC0A5CN5EjJGVGQSHzMQFB5qnnDwYbMzAX1uH?=
 =?iso-8859-1?Q?d/sn9s7TTt7ypOP+7BEKyYNt9iGIlDUuaNPIG4N2W/jEN0FAJxpDdAlYNI?=
 =?iso-8859-1?Q?rK46b+C5eO+yQVHooCcnAQ7qVz019AD47HEYL0rPUv7pgxdh73K6szRmXa?=
 =?iso-8859-1?Q?YIB855tvb6+CulGABSfJgsb3Hi+m0B4jc6VZ+pbUeUXo23pv+NmL4xJnMR?=
 =?iso-8859-1?Q?R+PxN+nssGnBI7E1N6bn8XSM5+aDNIy1mApIpkTcvSVyEujKUSW6WCG2/p?=
 =?iso-8859-1?Q?YNG1yumPbTwP4xDnT066UF+W8LIBpTO5PBCjy/0bW9D98BKZj00ML3EY4m?=
 =?iso-8859-1?Q?V27o23Qih7YX+MJEVyml5iscn9kOg8c3USdRsWHTrMGt8dgg+fStknWj3K?=
 =?iso-8859-1?Q?FFjJdm+xeYR0VSCCoMMB6j1BgXocze2HW43oVOCXMfyUBXi7ouGKRqVAo3?=
 =?iso-8859-1?Q?jd/kziGHrIasMYKkxNH/sGDJOfKuYrFvQkP+4d/futxVfmx8q93+ZE7DcH?=
 =?iso-8859-1?Q?J1d8vtLe6caNPlo8OheE/ofjOahd5qDBod+UklfPelrZcEu6mVH3z62VF5?=
 =?iso-8859-1?Q?1T2J5XRgYtxK0tjoamw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR09MB6296.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Zm9w+LPnz8uhPBTr4Wok4oOlVJPxCFq+XjbqKn2EuSjTlUsmeUA3P3TBGG?=
 =?iso-8859-1?Q?nw23DUWbQF79S5w0e9A7qd6DOJt1W1f1gQKfD1O3p82s7KMi0viEipL6kU?=
 =?iso-8859-1?Q?TF779a/f0Mq6Tye9Oc6Sx31IoGyk05rUA2Xc8cSe/bLi7euzUPCAMzZjg7?=
 =?iso-8859-1?Q?6/3H/TohYBA8csj0H77THJAEVWqZ3Qz4ADWuioltZmyNFpaPCV5nb1LA7k?=
 =?iso-8859-1?Q?X5H73ERObPiKDEou5avLUvliybYqC16CsPxIIRi5JFrWdWxhrhDt5A4Mmx?=
 =?iso-8859-1?Q?InwRzS9yy5CbnskLiy/5rOsSh4g7iqDGHwISipHhanBD9udafs86YfTSCf?=
 =?iso-8859-1?Q?/SHqmRZ/VHFB/mf5D5KtxTe6686mp2Z/qv+SpFp7rfSClboqJq4qeSuvDT?=
 =?iso-8859-1?Q?DR6sinUlHm3XwS/7gR4P1nVU+o1E5GWyrGJzqDj5S6U7gKyr16NiwiCYfg?=
 =?iso-8859-1?Q?DDJtDVJgeMN6PCUDcN9lY7ROV/NXWGbHsJWs5w5xsK/5e6WmLDXW9LiBCt?=
 =?iso-8859-1?Q?ilNLU1ONS17MjUz0Gy5CV/lwK5g5Ad7S9CuPJY5b77e8a4TAufYbfc4WzE?=
 =?iso-8859-1?Q?WduK9k/NLnD9qUseCu6TzZEPVyi42zyY8VM+L7xplpeRf0K7DkfA9eKD52?=
 =?iso-8859-1?Q?1G/7FMyIaeejdvaFDONBYqBlQgonkBIjfCXo7qwW0Sk1lguxMNIQiefdud?=
 =?iso-8859-1?Q?LRNOVrQ4C6a+5bBdBQF8dtEgkOPLpTjvJJCONg+TUri2tu3dfZCN8H+7Nr?=
 =?iso-8859-1?Q?BilXqLK4TiMx6DnSszZ+zr24XDAS1vfDXbi0+MF548h9R/2o/ZBvf72Zgl?=
 =?iso-8859-1?Q?FV0D5WYlRZebPCCt1U5GuZzuy6Nyk7KFEQoNny7eMKkJwxRrK02zuxH9+v?=
 =?iso-8859-1?Q?29AR3qaSFzSs6t+WZJRGB+I1vnSI+/LmmxrL0sdMI+O0X7Odi7f3YeHCvf?=
 =?iso-8859-1?Q?liQRJnLTNa3Yj6RINqY8E9x+DTq/m+riDoYQJpA9EsNAiMGdpoSXJPjqhy?=
 =?iso-8859-1?Q?TMQ5EHT31P0XAYvAccdDmcc6cn6uHTXZZcP3WUywVZmoclimq9nBdjcBUF?=
 =?iso-8859-1?Q?+ka4bcb9affGfYIU0PhTEDSdJKet4WjSs068TCEAXIEsZC2BgdrzvEKRr7?=
 =?iso-8859-1?Q?F3CL+8W005LBowIbpl9YWw6e33ruP8PTW+omifDgq2NYgxSLzD/gAXXxpT?=
 =?iso-8859-1?Q?PJ5EtaPk5T1iksDr0Je2LhICTigM13SckZEhrUIGq+i7Dl/s/dJdaI1vfy?=
 =?iso-8859-1?Q?Fh/bS2r3l9Ww5GvdF78Qc7ZrMSnCnkr9T1z90HzyRS2Pau/jsyaYtMblvE?=
 =?iso-8859-1?Q?9vocfp947LtiLZEAUIsAwT7YNl/qzMc8YXg4zVaWubja2WWb5HqVEPN3QA?=
 =?iso-8859-1?Q?Th+LycQ4VoZOlzXDKfWJ+Exe9qSeDnLzjHgs1Kb6aQczWnxMFiUqUzkcKt?=
 =?iso-8859-1?Q?YCpV3G+52Gay+z0JsFWege8/AHd5X4rc7qD5579bMDNtytcaJTLvrbCVMs?=
 =?iso-8859-1?Q?stJpJjnRWwhXt0aPPeDWaZZ3YegdnqRusyNwF3BYxVOO7EgyyHxBMnaY0P?=
 =?iso-8859-1?Q?cn74Ac1ryzE3zmlZd2G4LXkFXvjS/KeIk7Ikf8v8fbuwvREix2Y4NnR3f9?=
 =?iso-8859-1?Q?b4vl5G2+IDc/7Rzm8im1QU0RhxSIzi1o3TsmOCt2XEsh429xbzBMtjVIoq?=
 =?iso-8859-1?Q?hBu8I6Uw80jYmcVAnL1Y3tBtJ3fqk6Tr3/SlXFc4t7IfK25slVOdg9/EpV?=
 =?iso-8859-1?Q?YiKOq441bR4/TMouLeQuU796U045mN5Knud7Y+fm+0n2iL?=
MIME-Version: 1.0
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR09MB6296.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efa70944-fe0b-43b0-d3cc-08de545e3f76
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2026 17:48:10.1223
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aMmw/ptX8YMXoPQwobbCjD1FxjvLEZdBaVeuMtU/tr7+4UuoCypzJ552/tx0KfnrXXTluNiYTqtL4QjqiErzOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR09MB5227
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_094817_848585_61789BF1 
X-CRM114-Status: GOOD (  10.50  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

> Hi Vladimir,

>>=A0=A0=A0=A0=A0=A0=A0 dom =3D sbi_domain_thishart_ptr();
>>=A0=A0=A0=A0=A0=A0=A0 reg =3D find_last_memregion(dom);
>> -=A0=A0=A0=A0 sbi_printf("Fix region[%ld]: base 0x%lx order %ld flags 0x=
%lx\n",
>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 reg - dom->regions, reg->=
base, reg->order, reg->flags);
>> -=A0=A0=A0=A0 reg->order =3D sbi_fls(end_of_dram);

> I have some doubts on this. On the code level, `reg` comes from
> find_last_memregion, which exposes internal memory region data structure
> from `domain`. If modifying the base/order/flags directly, that bypasses
> the sanitation logic in root_add_memregion, which could invalidate the
> assumption in lib/ code. In your subsequent patch, there's also direct
> access to dom->regions (again internal structures). IMO, we shouldn't do
> that in platform code. Perhaps Anup has better thoughts.

Thanks for input. Fixed this, I will modify only "flags" for the last entry,
that should be OK. For the DRAM, will add new entry using API

>> -=A0=A0=A0=A0 sbi_printf("Modified order: %ld to match end of DRAM 0x%lx=
\n",
>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 reg->order, end_of_dram);
>> +=A0=A0=A0=A0 ret =3D fixup_dram_region(dom, reg);

> Based on your description above, you are trying to block speculative
> access above the physical memory region. I encountered similar problem
> when coding up the EIC7700 platform. I also need to block access to some
> regions to avoid speculative access triggering bus errors. However I
> realized that just doing what you did here is not enough. For M mode, if
> there's no matching PMP (traditional) entries, then by default the access
> is granted. Hence, I don't see how you prevent speculation from M mode to
> system NOC.

Good catch. On my platform it worked by coincident, you're right - it is
safer to make last entry totally prohibitively, covering whole address rang=
e.
Did just this. Will upload v2 shortly, after running tests

Thanks, Vladimir
-- =

opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
