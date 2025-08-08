Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0098CA0EC1
	for <opensbi@archiver.kernel.org>; Fri,  8 Aug 2025 14:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aetZbHjb94mZQA7P2/RdbTF+Ba3ytsRnr7ybeo5Xvr0=; b=a89KJvK3/+fVTm
	IzLBhTf8xwWLGq0dUYauCKazJdvoouVq62vtsSBiJ+5uAmbNDLhTaQPxN1i/kXlohMEPqsLzmHli9
	LtaEorKZi3BVvCe6W8jk7GveUnEdgArjv2CCqHvPEznHvW+jy4Pq9w1Q7nPBXPdZsr8NkT56AZ8rA
	VIES26TKVmADuVGqpHJW1CA2YyiuoEROFdDJ5cigoK4YMvbnv+YZUXjGe0b7nWE2BivgkS82KBsjp
	pvpTwvyc8gjlrgtSFoAo8CYSd0ChkIcdjA5oD74RgyDfToxAKQaAOk2oEOYji/i4BOasfdLZ0OHgJ
	GnPSs4KLmn89oJnpBHSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukOW2-000000034kJ-0gXi;
	Fri, 08 Aug 2025 14:56:18 +0000
Received: from esa.hc1631-21.eu.iphmx.com ([23.90.122.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukOVz-000000034jQ-1GAk
	for opensbi@lists.infradead.org;
	Fri, 08 Aug 2025 14:56:16 +0000
X-CSE-ConnectionGUID: LKQN+VTwReGrLzFvNl3q3A==
X-CSE-MsgGUID: 8ua1Yx/hQVyg7UOmbh+ltg==
Authentication-Results: ob1.hc1631-21.eu.iphmx.com; dkim=pass (signature verified) header.i=@thalesgroup.com
X-THALES-CLOUD-URL: Yes
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="34992909"
X-IronPort-AV: E=Sophos;i="6.17,274,1747692000"; 
   d="scan'208";a="34992909"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=thalesgroup.com; i=@thalesgroup.com; s=bbmfo20230504;
  t=1754664970;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=unL19pUpKmx6Zn/s8NBaW1V2mUCrR4QZTT8j74B1DJk=;
  b=rJGTF9gIOVbgiw4dbtIgQ6aydxsyl2BGDIL0S45/prfe+NBgei9k1LsJ
   d36IJwx1eSH+6fGgal+uSx9qnkgNYzLJxBzZo4SBGAc45wTA+uvzPqQ0i
   19aWyWCXcIHntuOFEOs2KudS8cpsUXN2uCQdMH/52MsJF6YgX73QcivbV
   P7T3pJmmGnCto5y/cRTpqJKg2p/1tnK0b+ZTjdojxj+tT1gISMoy6cNzj
   UmLjz1en/C9Glyug1CoQLutwn/s/XmZOn9aXmj9ps3pvE2PUY9Y8VSbYT
   1rok+UNokoEZt1X7KdbGYwaBf8bSo9tizrWfA+ok+bELZZrgxwbHk/Y0C
   w==;
X-CSE-ConnectionGUID: zhHAip+mQ8OlRTANrP4odA==
X-CSE-MsgGUID: CWqjkdlsQNaxU4u2abjsAA==
X-THALES-FO-URL: Yes
X-CSE-ConnectionGUID: JwWiNW+4SgSFZmuZErN0dQ==
X-CSE-MsgGUID: p7dYqI8vTby+de/6XjXI4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="51936828"
X-IronPort-AV: E=Sophos;i="6.17,274,1747692000"; 
   d="scan'208";a="51936828"
From: LE RHUN Jimmy <jimmy.lerhun@thalesgroup.com>
To: Jessica Clarke <jrtc27@jrtc27.com>
CC: "opensbi@lists.infradead.org" <opensbi@lists.infradead.org>
Subject: RE: platform: add CVA6 platform and support for PMU.
Thread-Topic: platform: add CVA6 platform and support for PMU.
Thread-Index: AdwHvxQjGpa4/fnCT4GxIFIEIByqbAAmk4+AAAU96MA=
Date: Fri, 8 Aug 2025 14:56:09 +0000
Message-ID: <e8a80f721c3a42eabc7338307234af09@thalesgroup.com>
References: <1aadc5594074447a8c38da0ac33b5235@thalesgroup.com>
 <1FC085FD-22F6-4FFF-854F-8E1186C46FD8@jrtc27.com>
In-Reply-To: <1FC085FD-22F6-4FFF-854F-8E1186C46FD8@jrtc27.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
thales-sensitivity: {TGOPEN}
dlpmanualfileclassification: {64c9cc36-7289-4c96-81d0-25ee8eefd11d}
x-endpointsecurity-0xde81-ev: v:7.9.25.561, d:out, a:y, w:t, t:28,
 sv:1754641259, ts:1754664969
x-ms-exchange-nodisclaimer: 0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_075615_605093_C2081D43 
X-CRM114-Status: UNSURE (   4.95  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

Classified as: {OPEN}

Vendredi 8 ao=FBt 2025 15:42, Jessica Clarke <jrtc27@jrtc27.com> a =E9crit :
>On 8 Aug 2025, at 14:35, LE RHUN Jimmy <jimmy.lerhun@thalesgroup.com> wrot=
e:
>> =

>> Add a new platform called CVA6 (https://github.com/openhwgroup/cva6).
>> Add support for Performance Monitoring Unit for this platform.
>> This development starts from tag v1.5.
>
>Does generic not work for it? My understanding was it did, and if support =
for anything is missing in generic it should be added to generic.
>
>Jessica

Thanks for your quick answer. I'm using the standard Yocto distribution for=
 this core :
https://github.com/openhwgroup/meta-cva6-yocto and it has a specific config=
uration for OpenSBI that was not submitted here and that lacked PMU support=
. =

I had to define hardware-specific information about performance counters. =

Actually CVA6 is an evolution of Ariane (that exists in platform/fpga/arian=
e).

Kind regards,
Jimmy

>> Signed-off-by: Jimmy Le Rhun <jimmy.lerhun@thalesgroup.com>
>> =

>> <OpenSBI_1.5_add_CVA6_PMU.patch>--
>> opensbi mailing list
>> opensbi@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/opensbi


{OPEN}

-- =

opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
