Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995D810D14AC
	for <opensbi@archiver.kernel.org>; Mon, 30 Mar 2026 12:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tFCg5rToIiH854739Jb0ycy+N2b1R0ayINimBQ32Hgk=; b=ocqlMUTRBC/qFQ
	xpSUhBN2wzBKV9yGPaDkGntGBz85p75OZ81dwrHdjwVBHRLRQXfx91Pky0cx96mcrVXWtl+wS9Hgr
	yau+YonMVkBnEQ2SKq1TRb7O4j2BX+HecrCPsxj0fKcHD4Nj1kL73f6l/4Pti/26lJfLxVcEAimml
	XQsd+Ajyv8mNCRzxNqV/MnfdPl71Ud6bnWavcfOYaij64Ypfg+xQgevrJyZ0zET+HrUPXqhasFjU+
	avvPM4RqhNrUIVPvd/KdEpQ1K1e9/1wf1NDQpMBBcLLUVjMzuj/DdmkobthW3Ydl47KUVANo138RQ
	OaiMrtv+Cv3ncIkNIXag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ByF-0000000BHVc-1S88;
	Mon, 30 Mar 2026 12:43:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ByE-0000000BHVT-0HUv;
	Mon, 30 Mar 2026 12:43:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To
	:From:Sender:Reply-To:Content-Description;
	bh=rfxdN3IGhmRBr/bP5H4cp145n9bjQJRFDFJafSmI0hU=; b=Jg2LQbtSxgBoDXHDvUKHpZ95QT
	RstSSR6ISorvYMKKy31IlKZJTT5G9VVTkDTWEtPv/6QfOBQU7I1ybAz5GkbjRblST7+FjKOWbUc/C
	WIz5rhtxDsaW+d0k4DNijGnwj3O4UB2+RwSpCHf1RqP+xonLTnTgIKEfCsm6oU4yPScQTjN5EkX/P
	S2Y63C+xeBwG9nQsq+qhhBdKzWu5vWB4tIS3dgEv5fix3+GV9h3EQ1IBDcpJvMpxIE5e9yFMU6tO/
	dS7Tdw1DHidaO4wQgueA0aLeDuFPetG9zw54EwBviiEZtrQdplK6B3XB1M0XM88X3E1zCd9iZBiIn
	qLV29niA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7BxS-0000000DqXo-2Ua4;
	Mon, 30 Mar 2026 12:43:52 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U9VlAo2953401;
	Mon, 30 Mar 2026 12:42:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	qcppdkim1; bh=rfxdN3IGhmRBr/bP5H4cp145n9bjQJRFDFJafSmI0hU=; b=Kw
	x5huqgnpkI9MIwJgt/Dyo+bYTp84eXayT5wa1UK0l5/Kn5aDiBpdx1I1R061N8KG
	VHFX2pa4aabLqsXFxsi3sR9d4pgkQ0bBVSWEshqGq+Tja9kGUnhk27bjonkcjM5P
	pUcv6zVZEyj3jHVQbjj/vf9Imf7/3moVf62OWvrPILa1XeIimZzR3VseKvJdwF+L
	ZQ+EqRH8jE2dUFewNzqG/rk4zMTvI9l8fRtwUd5DweqgYsUcbsAXlu2NjNEt3xvi
	I/tlkyRQeyuEQ2TFgf+YkfGhGinpnsOQbTajXRLLHoyCkrL3S6ObvaJWY+sje6jc
	6p3PE07srlrf4yARyrCQ==
Received: from ds2pr08cu001.outbound.protection.outlook.com (mail-ds2pr08cu00102.outbound.protection.outlook.com [40.93.13.74])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6wqem47b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 30 Mar 2026 12:42:48 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CzIkgWvgZqzCQoVeuYAEGD1mlQlNUZx0Wge5bPHj9bEuCS9yjRvSGb/gVYsy6uVJoaI0scbVTpKfP4AqrvjSm8rmvmDPzASuUb2yqAcb5SW6eMQvEfI4++Qgz/gMM08hwSf8KyigAOCSbsi+hqVjikOBs8A8PEOvFbRXssZ4NL1VDLGpnwZaLJvCFOv8t4GkP6v7Sy5xF/Wi6V0xeFgdlH2INXgP5U7sU8VacnmzHXJKquWIM/B5nHKMg/ipwv+kJHWLteKGYDqPAT0D/D2+qNJ2FLkrXyBZw87060usoSawWC/aYAz/LEZRecF82AoKfahYfHalzdVyJmeUMCB7TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rfxdN3IGhmRBr/bP5H4cp145n9bjQJRFDFJafSmI0hU=;
 b=RD48A+A/A3xTuZWkWgJ7zUPxrrCUM61bhy3DAn5tbpkGkF/ZwTucImz7bTVqxg9ONWIvHC+4V52P+dJG4Tzd7x4xzG6zVgxJkFEb2oBJZGSvBJ+LzkWs2IE00SSsb8C7y9csoHSr/OlL2/7tTBuKXUee7D+xOznads7HUTaNlWPgthHbOwO5O9p9PEqCsusAKtwKa7FaRMDl/+3NupAYD9NesLXZ86tcEjfKgstFSv5rzHV6BmIcU85UW/PceTBwq/k4xZ+iZXMdmicL4doOSGY9Dxr/Z6Jh3Xo5XuYnJpOOW+NW5fgd3i0lNaILm3a8lqe0qFvowKhZf53r0Cj81A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BL0PR02MB4435.namprd02.prod.outlook.com (2603:10b6:208:4a::23)
 by CYYPR02MB9761.namprd02.prod.outlook.com (2603:10b6:930:c1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 12:42:45 +0000
Received: from BL0PR02MB4435.namprd02.prod.outlook.com
 ([fe80::5818:27e:c1c8:7aa0]) by BL0PR02MB4435.namprd02.prod.outlook.com
 ([fe80::5818:27e:c1c8:7aa0%4]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 12:42:45 +0000
From: Radim Krcmar <rkrcmar@qti.qualcomm.com>
To: "dave.patel@riscstar.com" <dave.patel@riscstar.com>,
        Samuel Holland
	<samuel.holland@sifive.com>
CC: Scott Bambrough <scott@riscstar.com>,
        Robin Randhawa
	<robin.randhawa@sifive.com>,
        Anup Patel <anuppate@qti.qualcomm.com>,
        Ray Mao
	<raymond.mao@riscstar.com>,
        Anup Patel <anuppate@qti.qualcomm.com>, Dhaval
	<dhaval@rivosinc.com>,
        Peter Lin <peter.lin@sifive.com>,
        "opensbi@lists.infradead.org" <opensbi@lists.infradead.org>,
        opensbi
	<opensbi-bounces@lists.infradead.org>
Subject: Re: [PATCH v3 1/3] lib: sbi: Add RISC-V vector context save/restore
 support
Thread-Topic: [PATCH v3 1/3] lib: sbi: Add RISC-V vector context save/restore
 support
Thread-Index: AQHcwEK1Dy6xhSoAe0mhK/kenSxUpw==
Date: Mon, 30 Mar 2026 12:42:45 +0000
Message-ID: <DHG4IUERGFUV.3TT9CFPZ9YEDG@qti.qualcomm.com>
References: <20260327171601.169103-1-dave.patel@riscstar.com>
 <20260327171601.169103-2-dave.patel@riscstar.com>
In-Reply-To: <20260327171601.169103-2-dave.patel@riscstar.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR02MB4435:EE_|CYYPR02MB9761:EE_
x-ms-office365-filtering-correlation-id: e7e7a826-49a6-4898-7b26-08de8e59d7bc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info: UEir0kNisqwbdM2JbDPHAacgyAFNuxRkccjRNM90rv19YBXAZI09w7PvpPN+bItOEOpEKMpRdUr97aVg6AegHEeMZ8y1duQAwMRe9Z7AZf3zCo9v/9illJVnAEUGzYOA7xSaWedALolwSaNtJgaNN7JBtiTQ2dORVMxGr2ApJyTXXas/v9Xy7SNM/edl3jbMaDc9SCD04ZwjXW1B0weVBinjvPQtc+50gIGPInTFUghVnAA3Ao7/U/lsikUj1pyIXP6yYzNCaEQKk/gVuc6wzwTAuOHXJS85Ju9yiVqJ4PSfZmZmmPdbm0NTCSWcIfEv9ZoB0he49ufUuGn03Xzhbo5VUtWRhVd2Fc3mrGuseMoWQ7kPtJYQRD+ckjLNrnrEvW9EZD9ULZ//VcsGQaIbcLHBG3Gi8jiK08cXKFqG4kXYwgyquDf1JlAaXbJiHhbUBNtsBYYWZH3XOyduaaiVC2slZSyp7N0ihOXKciQYlkFUVMadRBSp0NxUjROYNcwbQUXJUepO2Rg/6isvosFuIraaZVsHn44C0uy5zyGOxg4BFjMg8iuONKa8gtcVtloits3rp6YmjCZ7+QrEotvAv2ujjp8Ocni0eu4rpTYgIB9+RbLQ/i3VXwoXmINJ8WIiKvJnhhZWx6KsW/dY5BIDPTwo4sgHQXmVYf/44AQWROzU4X+oLauhTstFMQysKAuBnxrimghv3isCWRtn046AYBzKMuU4rdnwEUetqNuNMxYCVFpEqd4cnDVU/hokPV7ejy3LpXxQEM116dOGSvqgl+5CzcmxLrWzJ/O3wKbXHew=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR02MB4435.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VjJIRDhub0J1QTVjOG5BK0JwWDBKYUpoQjBOQ3FOYXlrMGdyMlVwVjB3d0FT?=
 =?utf-8?B?MFpzamJyWm5UYkZnU0VOTXY1MSs2RktERnd3MEVBTWlVNHdJaHU4SEhja3hk?=
 =?utf-8?B?RXAvUG5IYUt3ZzlRSXJvTC9qa0ZvdVRnVFdvZE56RHQ4dStVbjVzeTNFTUVW?=
 =?utf-8?B?c1dRWTJGV09UNEQvK3ZIaTZpRW1SWnBqemQ0cXo0OC9nYlFGcVdsOWpSdktt?=
 =?utf-8?B?VmdKZzNRalIxNlpPTXVjZXUxRnpScS93QWZmRGNSeFdGZkdCMjJDaURvanY1?=
 =?utf-8?B?bE1UcVQ2YTY5Q3NsSHBIczlhbnR3K1pjM0E4cm0vTGQ5QXZJZkUvQmdBaVgv?=
 =?utf-8?B?RHR2Zi9oL0daN01ZTlNWeFN5N3JLcXUvQXh0ZmRpWHI2V05iSUZxQWxzWlZu?=
 =?utf-8?B?d1VubFpIL3JXdEpISG9xOGEzdXU1cm91Uk9ZYXdBdkZXN2dHY3hDMGk4YkZo?=
 =?utf-8?B?SFBuYmxaNS9BZStDdXo3enFGZ1JLT0lWT1Y3VkFGeWNkbFJYbFFiWUh0T3dD?=
 =?utf-8?B?M2xOanY0Z0NMa2lYTkFBYUt6OEJ0eW9YUGQ3RE9WVzZqcURxWXhITGU2azZo?=
 =?utf-8?B?ckMvbzNxRnRNZU5kcitsQnlKU3VlTmZlNkV4Q1hXbEErQ3MzakQ1ZWd0VlhF?=
 =?utf-8?B?aHpWbCsxSkJYQWFwbFRBR2hoS013WnRFNGNPTURXZUdpTS92anZwK3N3ZWcy?=
 =?utf-8?B?ZjBvNmhjeldzSU0yMTJqNjNtdzMxTWRXc1ZHUGh2WnhZaVJzK3BUU1R1b082?=
 =?utf-8?B?djk5bHkvdWo4akhwMHNaS21ETkNxdHU4RDRkYzNteHNMajQyZS9MRVBONWww?=
 =?utf-8?B?UGo4V1pneHd1OEs2OSsycDg5QVlKUUJ0eFJQdU1oL2YrTHg0dlR2UDlOUDBY?=
 =?utf-8?B?L3c5V1lCbkZEblU2Q252ei84cXRxaHlIbGJKM3JYV0tiRlRkU0crOFFVbENr?=
 =?utf-8?B?NCtDNU5VeXpnVm1lOXNxTWFNOHlabFpLZjdHQTRDYitaeC9BaHY4UG8xNjdN?=
 =?utf-8?B?My9waTNYa3dGbFRUOUhkWTV0alJ5VCtzN1NFekwvY2hucXg5Qk9oY3d6cHc5?=
 =?utf-8?B?RWxrRUljQmR6SGp2UnJWdDNLYUZnUHRJeXZHTlZhS2lpaUt2by9icXNXUjZZ?=
 =?utf-8?B?SlNBdStiY09hNWxUSEZsdlB1VjdrUldmS1FtWnVDTkhEOGRCOHBoZVFkMFpa?=
 =?utf-8?B?elVURS9YMW5OdDNiQnRLTTg4OEJNUGlrQ1diN2tEV2xQUXhqMk1waEgzdUVF?=
 =?utf-8?B?TUQvU1o0NUJheFF4aFZ6MndqN3ViZ2wxN2NVQzdkT1ZoZks3LzA3RjNHRktj?=
 =?utf-8?B?L0owZzR2Nk44TnFkc0RLd0VQeU1xOVNJT09hZDUwcGZ1RWp2U1V2TDVMOE9l?=
 =?utf-8?B?WXZMa0tDbS9OR1l3YlllUG5WZm5Yd0dKN08vdnJRWTA3M2ZqTlc2clJhQ2ha?=
 =?utf-8?B?OHdxNUpVMmxpLzlNOVZoRkpLWmFUbmJQR3FFd2JPQmRsWW40VVpoZ1RqZElr?=
 =?utf-8?B?UTBwemdjYzRraDZ6ZnlVaFArNHFmNFJ3Tnd0cWV2Z1Z0aVlROXIrU3o0eEM0?=
 =?utf-8?B?M0FaWWJFL1N5bzBMR0VKUEFTNEE4RTh2L09zK1NnbXQrVjQxRFJ6MERWL1Zy?=
 =?utf-8?B?L2pTL2xiVkFjeDNZTGhLb00zamFrYUpURjg2cjZBZ1g0YW15NlAzdWRnWFhB?=
 =?utf-8?B?K2dUS05xTTg0ZisrQWloRnJaSWhOZlNMSlQzdkQ5bVlkSW45YllZVlVzTnVm?=
 =?utf-8?B?NmRJZ2xZbFIwNHFSQldGR3crUHVmZ2ljeCtRSUVyUk1GeFh0K1VSQ2lNSFBn?=
 =?utf-8?B?OHVSMlNkL1J5RHFFTUZHVHB0bXdPYWU5S2RXWlNndEJ2RzVxeWFmbXhsYzRQ?=
 =?utf-8?B?TW9HYlB1b3dQaFVyZWdBTGhZU0pDbThUQmVva2hRelVKcnZrQmJCUWFKOGpl?=
 =?utf-8?B?ZEticGhyM0loUnlIdE9HOFlseENJcFo4V2N2VUk3MFZaOFBITVYxbnFQTXg4?=
 =?utf-8?B?bTM2eTVuYnJ1TDNQbnRWTHNRK292bnZEeEtVZjFORU12MnlUTERzdnRZV3k3?=
 =?utf-8?B?dDRTb1E1S3RDRGMxYzN2YlVId3pVdGlHV0VCdVY3Y2xLcDVrL0V1MXZqK2tV?=
 =?utf-8?B?SDhaUXJpTU5tQzQxdjF5bG9majdya0F2SmhBZ2tIVFR5emtSZ0hrUGJIdVN6?=
 =?utf-8?B?clpYcHg1c3p4UGtTS2ZQQnUrelJxTWZwc1ZTQ3ZkREkvbUhDR1F2ZW53cUth?=
 =?utf-8?B?Q2JTR3QrdG5mMlQvZEZZUUNWU2dlOGxabDNDZ1Nrb1lrUTlQMkRiWG5FcTAr?=
 =?utf-8?B?TmltSmsxYjd5emVxRTdIei8xSDFETm1lK3J4dkhxYkhPdG1BMXZ0N1BqUG5N?=
 =?utf-8?Q?BzzgmdeqfSNKynLQ=3D?=
Content-ID: <121D4185E5957F479A075FBA22379A3A@namprd02.prod.outlook.com>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: GB+IUCHJEzowhuEVT9uQFcxdm/OnrGcIAHBMCKcsjMwH0YQxVMt8cSiwDP9p0cEx3liVbD9PRkzGhgE2AxkAb3I13sTfJdCDhneWgbk8Q76rmngIAqQRdqUWW/V7sWI0LaLhW2Nhff1gFK3IsTUbQm2Z6mKF6e/s2PbYnY0SpeRoDu0VqSWl+5NVNBDvVjfwZgYyoRK8jOJaLTQA7X/NjsJabbLUDK9tiEf2sZJuZqQ5hgy1lXtLzgCtR/OfXE/7iVK1Jf+NCA9TxEYojAbqN4Wo+Y80RRjSiPsejK+otRGGYkYNnKBwAZ43I0YXrUzso5fy9QeZ5cp1L1mF+yft+w==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: T2yOgpMbC+zfgRrHf0fEsmHdwLVa06HJWQxO1XLrjqe9jl849yVhja7lGnJklF5UDDMDyJ/uJfZHqXmQVWpD9uLSB+qjQAn8tSqQ4FUxdIW4n3tio+zKIseQBuqh0nLjSabwCJIq+JFcKfkUIrDCidpzWSKpgs+Ao4VDIzPB+CD2Ze7usJZdUYwyiMhuXIs1xlFF9RPbKP5SSYT0ImDJS2a/o6PqedEd0nzFE5EpFjrgHAEel39Z4ZkN/bcMNOwR8SK5uI7J7gedP4QseuRrCFJNV6Rd3/e2Lf4iYLcOIaPY4ay6dvl8rK9PcZPhZbJjeIEuOdbhc6x7O2HjuNtgL3Du7I3ddY9Ogg6cpR/Vbn0dSXGGO14cIzuZ+cojOw0kan2Vhv8Akcbe0hhE5AK3NAc1rMAOHzvPE5xjXsEMGgJmRUhBHR0F+PC7nqyNnlFKASyMP9Gi5Uk0iD/wbUXeelfkqT3E8OJyKx8uG77vLcyz/q0Ibd1ncK57sITaZcyJhdjqcrm0N+WKfn3855aUK1uorhHgRenPEYhZtqjHgGEi+5PkumB+bs7LYGMMkKXqhorNsx4dsh1J7mYHrp7SB5Yz+LV0rM+HWGSYWCPk7YktpOe8etH6ed3yR7YZ6vTL
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR02MB4435.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7e7a826-49a6-4898-7b26-08de8e59d7bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2026 12:42:45.5770
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aD79l1QpWADQu2gqrrCg40eP/xZ1c7Avg6+Xt4A/VGe/BCcjwrGCM+i02m6UhloKp6nuGbUfqWIXV/J/rmjMJ7wKUWCxpoBiyaaA3CV1+7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR02MB9761
X-Authority-Analysis: v=2.4 cv=Jo78bc4C c=1 sm=1 tr=0 ts=69ca6fc8 cx=c_pps
 a=1w3Rox83O5gulhrCDwffwQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=f7IdgyKtn90A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=ee_2aqc6AAAA:8
 a=DsnocTpnZYD2-G3mty4A:9 a=QEXdDO2ut3YA:10 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-GUID: 11FVbNNDP_hkeQGggSCT9AS5-ZfbT_19
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA5OSBTYWx0ZWRfX3kxvQENbZVB7
 W3zdcEKfMx4XIPmr1YFm8jBCFPGEYyeFhFz9V7IGi/VlLK2RJy5I8yL+OlWwua5FPUu0I9D5eJ7
 8rceT0dtbR7rTB5w6gAaLe9ddcJEJ+fFqcWt08xSN4IEFeeMgaZGRl50skiLyMST+sHONI9qPrB
 spqo9BbdjIX0aPlK8Z+80JylLGpiFx3xuDgrWyKe8Mw36KLsNxyVFgRgn5bn9LH3OChWK61hlmE
 xP4CnyoAKnHR1ZYschYxLkOHmh8ZqGQPuJB6hWGl+qeAt659lItEtEsDlHoQyznmPuWIF732grN
 iyHodNlxUe0gEQCkzKrpR5/a2nZDpbJgdu5dpc6y1qKx+qZD9fGPJSJcRfQ+PJdpCoc7gCohhlp
 r4jTDt4FDJ/vIU7lLaB5aHCN3jM4bYHIhWk1Cn9iII77VCRjFB+/ZltEFXENFAKtE0M34l0+2TR
 gcU12l4BDI9aC3Cm3vw==
X-Proofpoint-ORIG-GUID: 11FVbNNDP_hkeQGggSCT9AS5-ZfbT_19
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_134308_994173_2C119676 
X-CRM114-Status: GOOD (  15.93  )
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

2026-03-27T17:15:59+00:00, <dave.patel@riscstar.com>:
> From: Dave Patel <dave.patel@riscstar.com>
>
> Eager context switch: Add support for saving and restoring RISC-V vector
> extension state in OpenSBI. This introduces a per-hart vector context
> structure and helper routines to perform full context save and restore.
>
> The vector context includes vl, vtype, vcsr CSRs along with storage for all
> 32 vector registers. The register state is saved and restored using byte-wise
> vector load/store instructions (vse8.v/vle8.v), making the implementation
> independent of current SEW/LMUL configuration.

Using the whole register store/load (vs8r/vl8r) is more appropriate.
We must manipulate the whole architectural register file regardless of
what is configured by lower privileged modes.

(I think vse/vle shouldn't be used for the purpose of context-switching
 as it's too easy to introduce a security issue with them.)

> The implementation follows an eager context switching model where the entire
> vector state is saved and restored on every context switch. This provides a
> simple and deterministic mechanism without requiring lazy trap-based
> management.

The code below uses the lower privilege's vl/vtype, which means that we
do not save the entire vector register file, but only the subset that is
currently configured by lower-privileges.  This creates a side-channel.

> Notes:
> - The SBI_MAX_VLENB is configured using CONFIG_SBI_MAX_VLENB.
>
> Signed-off-by: Dave Patel <dave.patel@riscstar.com>
> ---
> diff --git a/include/sbi/sbi_vector.h b/include/sbi/sbi_vector.h
[...]
> +	/* Restore CSRs first */
> +	WRITE_CSR(vtype,  src->vtype);
> +	WRITE_CSR(vl,     src->vl);

vl and vtype are read-only registers... how does this work?

Thanks.
-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
