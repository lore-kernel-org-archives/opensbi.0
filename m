Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B460CD33990
	for <opensbi@archiver.kernel.org>; Fri,  5 Dec 2025 17:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IiwAr4sicGgzibJeVPmlJMrxJUpY2zS6Jgqs35mX5Ho=; b=EI7MYmcm5zwpfQ
	gMZgufICC6FnVx/T0oo/v/KfoimfNjLy2u95iuO2SKbsSruI2/WmLPp9JpQQGw5BbbruPHxSAm2+T
	VPLkPQC5eyh4/fJvh0Jjfj4ZxbhjtDcmABKZrgpCsQH3uFmdRoHYPqHOwlffbTRI23uxuY0uRe+lB
	QrSSXxXeXOHFuujPooBuoxCBA6TMK2L7kbW3NHIgmjjUFyBwkErfjrc5/7+zRTqcqK4Bi3N1wXwb2
	KDg6Js94sZMj7V+s1XQd4aP7/EdHBxuH1s53Zg1it0IyeBU6EVVLJa/olmsn+zmuAFy7Po8chz1Tl
	xnmpzXOB2e39DtyHOlWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRZGy-00000009ji1-3rob;
	Fri, 05 Dec 2025 17:07:12 +0000
Received: from esa.hc1631-21.eu.iphmx.com ([23.90.122.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRZGw-00000009jhD-0q4z
	for opensbi@lists.infradead.org;
	Fri, 05 Dec 2025 17:07:11 +0000
X-CSE-ConnectionGUID: Y054PVCpTjK38ZmqDjklWQ==
X-CSE-MsgGUID: hzTS1VOySgK1IM5z01m4lg==
Authentication-Results: ob1.hc1631-21.eu.iphmx.com; dkim=pass (signature verified) header.i=@thalesgroup.com
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="41167165"
X-IronPort-AV: E=Sophos;i="6.20,252,1758578400"; 
   d="scan'208";a="41167165"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=thalesgroup.com; i=@thalesgroup.com; s=bbmfo20230504;
  t=1764954420;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1euMSXSYYcB2FFqoteEQ8nUixnuLyiIHeQb4ubmj5nA=;
  b=stZ09oTAxMlopcxfAeuftbfp7RkwOwZzz57UBfUyykDZgYc2MlSeMUx3
   nHgOV0SaORGt5RGrk6VYSDlWt47wB2rYLPsSlFUc8dsOUTpVBQB/HvpJQ
   2XuauFrxBuvU3hVtZaL8GM6E5BQ6GUCXLn0CDAFHr2vMLCNu4SgF/mvN7
   uY/1uDhgtaRDXvXK2Xe+eAvdewgrVyq0YwI7C1ALzXjCEm3Vgepf19yvC
   UYQV3p4MZTMTMz9TGyo8a2IWCCafKbf9zuNXX9L1GphMwmfgmf7lZ5+45
   WZ+bMuDtntlMYE9Xpoup3QIv4n9gSlCnLgLkC6bqNcN9kZ56C12VlF+fY
   A==;
X-CSE-ConnectionGUID: CJqGMkyhQPuOa9Fqid6d4w==
X-CSE-MsgGUID: c9KThutPTuS7PUXu+c1yqg==
X-CSE-ConnectionGUID: d6glYll5SSOrbnDShpPUfg==
X-CSE-MsgGUID: RhaHUK8EQUecXx1LrPPywA==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="58026187"
X-IronPort-AV: E=Sophos;i="6.20,252,1758578400"; 
   d="scan'208";a="58026187"
From: LE RHUN Jimmy <jimmy.lerhun@thalesgroup.com>
To: =?iso-8859-1?Q?Manuel_Hern=E1ndez_=7C_OPENCHIP?=
	<manuel.hernandez@openchip.com>
CC: "opensbi@lists.infradead.org" <opensbi@lists.infradead.org>
Subject: RE: platform: generic: add CVA6 platform and support for PMU
Thread-Topic: platform: generic: add CVA6 platform and support for PMU
Thread-Index: AdxlNr4lyuKAA3lWSBu1kuNF+8VdoQABISCAADKsCIA=
Date: Fri, 5 Dec 2025 17:06:59 +0000
Message-ID: <5b9a5b33b81f4f6e98bfd6c08b3ed637@thalesgroup.com>
References: <46f88d260ac64ca7af4e5f5cbefabeb7@thalesgroup.com>
 <20251204173011.10815-1-manuel.hernandez@openchip.com>
In-Reply-To: <20251204173011.10815-1-manuel.hernandez@openchip.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
thales-sensitivity: {TGOPEN}
dlpmanualfileclassification: {64c9cc36-7289-4c96-81d0-25ee8eefd11d}
x-endpointsecurity-0xde81-ev: v:7.9.29.589, d:out, a:y, w:t, t:15,
 sv:1764925016, ts:1764954420
x-ms-exchange-nodisclaimer: 0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_090710_628147_7C7786E3 
X-CRM114-Status: UNSURE (   4.50  )
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

Le jeudi 4 d=E9cembre 2025 18:30 Manuel Hern=E1ndez a =E9crit :
> Hi Jimmy,
>
> This functionality has been already merged, you can find it for the
> CVA6 in this commit: e8dfa55f3d6ada2e1f71671213bd3a68ec96ea76.
> =

> Regards,
> Manuel

Hi Manuel,
Thanks for your quick answer. I am confused, as for me Ariane is a legacy d=
esign, superseded by CVA6 which is maintained by the Open Hardware Group.
Besides, my patch adds support for performance monitoring counters.

Kind regards,
Jimmy

{OPEN}

-- =

opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
