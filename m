Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58715D185C6
	for <opensbi@archiver.kernel.org>; Thu,  8 Jan 2026 11:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RYKn5uyNzAZc6w2zLbjSLqCJQs/ZH0NeaCQYDnA4XUo=; b=w52WQzaYhFHG8x
	C/LjuwBn5cVstpuktBbSPfg4CsnlQSh7OrmmHDuwQvnx7Lj96tbqpwfT4iJjaYUOmleNww8zz6UfJ
	2ccTFc9KtD8BmvUtU/B7jTt7wVFJO1F2W+7rknYfrKiFJcKfOt/qg6MEW0dHLXAdcCxoTPzEOdozI
	aVbqbrLOaYVPbYkk+dxwwrF7M3So7iu+BUsJXLh1jSIOt8+Cdj+BKqli8rxUDEfC71HYaoWvhXx6d
	UN2ff6ukmVpDXYlhKd8UQbo8dmNz0DbjX3plJp+alXClSG8TrGTQaEcTai+zEAVZVaqzDvejKaOKw
	SZV9BTc8apDdCFuMYnxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdnt4-0000000Gnk5-0JzP;
	Thu, 08 Jan 2026 11:09:06 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdnt0-0000000Gnir-48sQ
	for opensbi@lists.infradead.org;
	Thu, 08 Jan 2026 11:09:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oyop3V5k3+KL7rfxHPlPg/6S/ZjUW+Xvk75I+gWBA9FaprQMFAql8SAam/d+O0XP03of3LUrj3mt2hgWboK008lJuWvdbs+UJGlR8pspUz9EmSUdxQaUp1nIJTOF7AP1eNnAImO5THC/ydUwk6JVA+A7Yi39+AHhmKuiiXLBhQ+RX736m+F4LaERrNqgdobcyTqMJIOBv5AyB5HeIXDJvZNvbnsO3eAvxCvpGpnrWXRoMA6RNWcZFcUZDxDonERDtmnfmcjdWOznobXNPt0bkS54FWto465Yv3+HJnxnyl9zI/LtCViuPCIT8ba3k0/WuQykJ4YNdv2lO5slHa9sgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DKHC1pAiwLMGO0C9nkK/VqTC+xmvOfDSpxp3E9mq0CY=;
 b=K4+QAoRrJnfqjOpDMGVdBYDYn2WWg/dBvtWoBZZvwSoogluIkkA7GtNbHDeyJ2oHYJBYKPm5X7SxFw087BmciVJ23nn+Iq4B06AKOeZmCgvfBGERIEBRzx4pvFkAIG/k57XngUquwpxq9vc0WU4M4PvwiawsInCw1/95q5iuGCqMEH2A6AiJBZ4CTNCpr7cGi1iIMIIX2XRxUtAdkTs+vgp+kioZqbt7OhCOGpAXxZKLLtBLy9kEBIt6D8K8t0iL9g2U4u+yul5QERzWwZrRCqNsBQ0Dx43+4H0vPhOO1xBJFluQLPOJNrRX34HSocIYZ+d7yGjBzWaE9L8yuKuWAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DKHC1pAiwLMGO0C9nkK/VqTC+xmvOfDSpxp3E9mq0CY=;
 b=3Wl5WeSKEqLG7Z/BG02DFfcGlMH5I/zJTagtTdq/m2ujp9Au10xSr7XLIU5NGeRL9NyW19eeIA2Nmfv3IC/qIsRnkCTSyMWFdiIe3KyI+vm+shRJhyXOwaJZf1/RzqHYaPawuZ/Ck5c3OVykq3SgmS6MyJUiQPXQQ3m3o5j2kIM=
Received: from DS7PR12MB6008.namprd12.prod.outlook.com (2603:10b6:8:7f::15) by
 LV3PR12MB9258.namprd12.prod.outlook.com (2603:10b6:408:1bb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 11:08:57 +0000
Received: from DS7PR12MB6008.namprd12.prod.outlook.com
 ([fe80::4aa0:3ad8:9aa0:d1fe]) by DS7PR12MB6008.namprd12.prod.outlook.com
 ([fe80::4aa0:3ad8:9aa0:d1fe%5]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 11:08:57 +0000
From: "Belsare, Akshay" <akshay.belsare@amd.com>
To: "opensbi@lists.infradead.org" <opensbi@lists.infradead.org>
CC: "Simek, Michal" <michal.simek@amd.com>, "Bollapalli, Maheedhar Sai"
	<MaheedharSai.Bollapalli@amd.com>
Subject: Release cadence page for future OpenSBI versions
Thread-Topic: Release cadence page for future OpenSBI versions
Thread-Index: AdyAjw9uGX/DlZzYQemi3qWWPjSV1w==
Date: Thu, 8 Jan 2026 11:08:57 +0000
Message-ID: <DS7PR12MB6008258B7DC96734FD736C3A9485A@DS7PR12MB6008.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2026-01-08T11:07:45.0000000Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB6008:EE_|LV3PR12MB9258:EE_
x-ms-office365-filtering-correlation-id: c140c64e-26ce-43b9-60cf-08de4ea65191
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?tV9VNoUjfoquHNgAXB8w6wHWv+52gXMkZM7zbmvWhoeoeGOQJOJOl9kCugY0?=
 =?us-ascii?Q?zxa7FuW0MP+fTA86beoTafs5DGRylo8DdfhsVzF3fc8u4uUidzJ+XpRX4mno?=
 =?us-ascii?Q?od7lEjsckPS/4JfhuW65W2xdU+2/0Bn7dolu7irwaNGcVPz2M5mioTriZFZX?=
 =?us-ascii?Q?45Fz1PUIurzR2PXwHOLpCq8SU6huC71tLpOhLDYCyYjTMQkx4u+RzUaXW4ca?=
 =?us-ascii?Q?Rx7UbaFBtyaYYr6LoXH+fLAa+qanSZB7+qmou2vHoCiwIZq85GIG78NW6qA+?=
 =?us-ascii?Q?VH53FZT2FcEdex6aTQ/GbVf6AyeO4tddZeIPLlbEEbyuvVrEbwEJzzE0Ir8u?=
 =?us-ascii?Q?ewdoYei3K8i77Dn7fx7IVbn6Bz8j7POLcj8FaThoIS6NsDzIGP18wTPnoeZP?=
 =?us-ascii?Q?1jXb+A0QFZpOWlhd3wDHC/WZGZNUu4Myqw4q9KYgqYEEvc83rE/Jd2th9EqH?=
 =?us-ascii?Q?niwin8G1wKSTtKqE70YggwH2GcmeRnTMkUNQc7NIRREk7/vHCaR5h3kzcCsT?=
 =?us-ascii?Q?Sbjo7xLqJ/VYeKcFUSTZE/OBQ6RkXd6QKGZFQoDCq6wZtfrolKVyobeBXo+g?=
 =?us-ascii?Q?/vJKpvGushpVGaqNfGxBfQZDXfo38jwVdvaKJHpf/8xkfY+1a8kgGQmo/11m?=
 =?us-ascii?Q?jqKkCKGx5/wRP4RG3rBY07ElNwHa2O2AImIVekoUywvBkCp5r2M9Dizskxmm?=
 =?us-ascii?Q?1wcNjP/6Yq9gaJB8kyaHTSVFV8d1WtInU/KqJgCLCvVHo73BDu/XmW6gpDZ/?=
 =?us-ascii?Q?CFx1f0IZpghHpLpWrrdcpWCBL2a8a7eH+TAZ0gnRkDBM3nRTyzIh10kdwOmX?=
 =?us-ascii?Q?A5F/2XWD1Y84mkX/HVMeyozDM85UgJt3/DZ4fgyHNMP7WkfMEOLVvFb5PxSo?=
 =?us-ascii?Q?BqFvZnT+fnUN7kfXZ8J7LvjO9gVVHBIpir3O9oS1lThGk+VpLNkAikTW83OM?=
 =?us-ascii?Q?v3wjYuK0nxlCukWVPrQFmVDVUx2Ga9vcG6FqqNkdRMJV2lz9FYXISqeW41XN?=
 =?us-ascii?Q?gVVmRSH8y4eJ5+CbjHxfP/74/an5XA5SREiYiJZZeuxAsndKYOxCPcb/6c0v?=
 =?us-ascii?Q?cUrP9Q2813RN0oLD7axwLkSLN0WHrzqPfh83M8Mvimxx+I11MTBRZUbiCtuu?=
 =?us-ascii?Q?49nCkVegKEo9IjIFTij5CwXcLsSCL+JmsDqr/6PJ/VNh+/m98aJgiq73In1b?=
 =?us-ascii?Q?Tmwh+PYcDo3rcaVrU0tkyFviACgVmDp4IEawH5+WWTbqQvIbZ6HqrmQj7kbj?=
 =?us-ascii?Q?uhQ1UQ5eniHxTtnYk6z67VNPkndOuKb14kF76TTM5nFFKBNcuZp/S3GJQvT/?=
 =?us-ascii?Q?VECHpWswlt2y7gs2mDIClyBAfr/5UmlvaLwYLsWYh4RIkK7AJUwyUjMmmrea?=
 =?us-ascii?Q?ka8g4QwEjIN5X6Y6VtH4sLjO8ceoX0RTBQUWFpgtsTEZYO/bXFNSRbpecL06?=
 =?us-ascii?Q?DjKwYI5zt+eDz1Ve7AM/7rPCTwCaZHknR7dUxwanwjCW63CqxLW7EQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6008.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kEDcuGa9gP8pylwmOCreggIqrzygcZXAY2Rdl173VXLHRLnS9SwdYhDrr+Qs?=
 =?us-ascii?Q?dOCer7pu4KEgKTNR5a0cg7N0895MSAL0W1hOvCFeISJ5AMJN529PYb7lM1mU?=
 =?us-ascii?Q?FF8Blb2WfiTto+jFaNZGmWMwHQnh86v/4/t7BYn4VyPTvaRS5SIbsp/3ygkV?=
 =?us-ascii?Q?xmPs43yMbjJ0WnCwTyVAIcIBs2hqCbLiaMzgIqkssrOaaI0A4s1SDs84GN6j?=
 =?us-ascii?Q?P7DLAdRLvQji7TQduRPhPDa7D7Bmw9TgOZtpLYn3+az6PFkCFqXsLiAmVAke?=
 =?us-ascii?Q?7mFKeI4SnjsXTAWhbIJgn+SxbsFtOAFfGlUCptoV1CvgGoG6iLIGzhAgX0Ux?=
 =?us-ascii?Q?ZP0YC2/bXERKOs/Yoe+LI9nqmGGKpE8WHiQh0CPWio6YxBjETOom+umSrHB8?=
 =?us-ascii?Q?McOH7tad1A/EW5bmjchmhNZWNPoG/Vbm5XZNUtHxQdkbNj9qgy+XlMJSXAxb?=
 =?us-ascii?Q?rm8lXTl62cN4Z3ELqOD+ak2IexcDciLHVn/+HILv69OB5PUMZJNjp7DpjZ5l?=
 =?us-ascii?Q?MpSdASq4QedPWt//rYh0vuOSj0rkQLl05saDSDhf0NdL0aTWJqzxCwrks02h?=
 =?us-ascii?Q?T06FNXVjIsbPExBk6VDk1Mvo5y6ftzRRqK/dNzT5w950lyJqK06E4Uvtuba5?=
 =?us-ascii?Q?ZjvnJ+jhflvF9qjIcrNAC7wkHmk51+BZYpoKS48WDVv7bHTVn1ZT9FVPjNh2?=
 =?us-ascii?Q?/uZR3n4wvxhrgH65OZY+zhMZXfQGvYOqAf4e5voiquEtBCxbaoyeuG36DvTd?=
 =?us-ascii?Q?b/boNLyZ94MIUw/klEUFFbEp1zQFke772G2wZmO+UwOTA+fjDd6ddWRJa5xn?=
 =?us-ascii?Q?ICYYJ6bxO7dbu4iqymNArHmzlupP4JX1DnhO1/zGGhIPpU/uGi7Jp2epsFuh?=
 =?us-ascii?Q?vN4oX1F9REdI3R9/9bMjWDaM9LV0mnH5Ni4MO0JY11c6N0YszoQxC4AyuIlr?=
 =?us-ascii?Q?Z34s+jghGvOtqXXx9XJsckzNZhCc0Qt59reuYLJ+CrPGT9qFUaSK2nyiXf6y?=
 =?us-ascii?Q?9Ipo7SP/If2vziVWbB6yONLo0hrhnoWJJqe+vdyxWEOL0XZMZ4gft0Cm11hC?=
 =?us-ascii?Q?n3iSyDdXxn8E09LOiI6hBsZ6N1DtoEArU0G3uzoiWElRm7WoqQXAxLUi118H?=
 =?us-ascii?Q?kc3f9k89zHnnCqlmJC1RuhIrBtkJkuym71qLP8OtWeOiR5FrPx+aMFiHJ8Yj?=
 =?us-ascii?Q?Khpvai4LE0HHjbSLaQN2NgJziu2JsFsBXEMfDySjowrZ1I3xwdSpwb+I9pEK?=
 =?us-ascii?Q?K7Elx7XTenjq5teaVZ+T0SHMBP6xzG19InC1pV/+l70WCgUSRAsj1mUeU/Aw?=
 =?us-ascii?Q?Jvw53kNszrJyGh1BliIMNJt1a1+u+0A9M58Q6mtxv7r766gZpgLJ+N0LET6k?=
 =?us-ascii?Q?e9MGwId556k5uB5sb5J1iK8S4qJ+Oj534jjosYZ0p5t+PZ9w/PEWoQaIRjYM?=
 =?us-ascii?Q?VHub4yWwjD/LChb5tURgh7zquekCpb21/ZhbpLODKGXwt2ZfhCMqqsz5QKdf?=
 =?us-ascii?Q?3G1QnZwyIv6NSGARDM9RakJQXFyep5gkn54o3MIHl5+yXEnWSGqlak3+m02U?=
 =?us-ascii?Q?Fqu0Fe8IbWg7q3HNIcTBI2MSJxmWg+5K/kYqoT+nf+BHbLgcP2YliqSlIlOE?=
 =?us-ascii?Q?I5zIceyvVceYC2yfR4TUN7tL2zQJXH4Aq/JuNOJQqolk2lXtbTzmuiMkDd4P?=
 =?us-ascii?Q?lQocJ9Za0mZaZzxaAEhFzpPNvUZGwIzSD6pNjSfvYq9ainzp?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6008.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c140c64e-26ce-43b9-60cf-08de4ea65191
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2026 11:08:57.2652
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vje1lEIyREaVcGRUggJCQJPm1wAqrxUynrazbK74w7nCPuBLPiDnbf2TKd8+5wRO+O23vWceLSOz49d5NzbpcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9258
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_030903_031765_53E35BC7 
X-CRM114-Status: UNSURE (   5.26  )
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

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Team,
I'm new to the OpenSBI community and wanted to ask whether there is a published release cadence page that outlines tentative future release dates and versions-similar to OP-TEE (https://optee.readthedocs.io/en/latest/general/releases.html#releases).
If such a page exists, could you please point me to it? If not, I'd appreciate guidance on where to find the most up-to-date release plans.

Thanks!
Akshay Belsare


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
