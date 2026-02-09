Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347FFE81BDF
	for <opensbi@archiver.kernel.org>; Mon,  9 Feb 2026 16:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4rBuplJJ/aMw7+r7x/LNruRPAnD5DyaZL9PENEXsX+w=; b=aYVH/YTyi0JIzB
	wLbLDBSRfONTWvgLOwiOi4n+BeON8qEuPCK91kb4989YR13pWyIFc7cGut5wMNobEzO3Nks0py9DE
	AhlGNOBEbsbdKTyJZgWlNtndgPtOKhBITm2FIkXBPO0pvMxkFBqDC8aXjE2cM5cJojn/RdxcjCLfc
	Bv0q7CY3ceoZPnpiJcdC7xKDzwJfbog+/fFG5RPGafmMz1JjAcuc5g0nhs0eSmeXFTYqvMJZL3ujn
	okRU4Md5Yd2n4ym0069cFMUyo6wbV4VpIFGvk/MbgH3GOSxNXH/oHnepnogq7vDnHC+oP64qe2z+h
	zDGIKAiL+r6dzrm7PZeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpUSo-0000000Fiig-3E7L;
	Mon, 09 Feb 2026 16:50:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpUSm-0000000FiiD-2gQX
	for opensbi@lists.infradead.org;
	Mon, 09 Feb 2026 16:50:17 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619CGpTp3436712
	for <opensbi@lists.infradead.org>; Mon, 9 Feb 2026 16:50:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vOK+zx40oLGVjQOrWfbLPTz8
	Nl+uAmRegorIx073rUE=; b=TkVQJy150gAdw9eoZ7m6U/EP5gm07taBFwJEwhhE
	x5A+wuY0i6JxtAlMBGI1EpasnOzDZe84WPm6arSjYFsHHul2MvPtmwUuvj8xnVaN
	Qm217ou2SD7uqrJJCEcdqwX712mtzzsny0Ikh1UXAAeC0HWc2V/L2cnvyheIZ+Yr
	ToOWwv89IefwCfSSQZLwsLyD3Z44D/uD5hlT5qWCgallJbWciKvy7vAv/wuUDysy
	4ZZaUo1hSSCUTjen1H1Nf559YwMkOMp2fSQ370xa3DIV2i482zDYUAvlvec/yJTx
	2KfCSuN0VObyUhFnwpNvFJO84I1x40M/v5tZ/XqdScB7ag==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7fev8vhv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 09 Feb 2026 16:50:15 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ba728aa1f9so785333eec.0
        for <opensbi@lists.infradead.org>; Mon, 09 Feb 2026 08:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770655814; x=1771260614; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vOK+zx40oLGVjQOrWfbLPTz8Nl+uAmRegorIx073rUE=;
        b=FYci9tSpFRSumlKlXoynQGtqEBBfUspX4k1EfO+XOg/7Tfh0qq+a27Mw/tnwfwN5IR
         nfVgKtNtzfTB8M6u1bWTSci1bN8efwxPfF40P+nLpqB7IeAh5Wwo+LZzamjT6JCLv2JG
         dOQ+vBd2QoeeslCt7IGL5eXN0iCMKdc+VUz4usiPtPWT7nUetw4MQQzDiyH2BbHrEYvG
         wiZEutMeadqQ6hkDr7dK642oiOWCAgsxp+T/Jul7IPKQYK3ht1ZJ/ObUKsi15pPg5kKe
         UviZ9VRHpP3r3NEYk8RigefRX9xz6sq6Q2q4f1RryJ3kSbBCgiTMKm7ud/TYft8E7XSm
         nihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770655814; x=1771260614;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vOK+zx40oLGVjQOrWfbLPTz8Nl+uAmRegorIx073rUE=;
        b=kolQB4lZf4lgS1/5+BGeVE0Yqer3vOl87OWy9ntsNlgMie6kLo8kilrtvDmavT+bCI
         1mN9eaRYBFGC+uJB8BHv/4y1zNhluYGrY/81syzrPeub0D3lb/HmeVOhuyBPwnFk0WFD
         DN4g9u7TtPDEwAJu7F1r7zMHgNN328dJP5Y7MqXgnhPXy173v2JU8x3XttWXv5m8mlS4
         ZFowRqJdEa+FY/GxWkeoqInVlWKmIxrcPA+BTti+IOhizs5dQEPzqqfc2nCzDegQSuZP
         5gXQxIhvlibnNZzdfqPQes9uJoSdQqbGsyV74U+VB9mObMEOd5GjBTtyJfdPG/Foqjhx
         1c0A==
X-Forwarded-Encrypted: i=1; AJvYcCUr4rwBOntyCwz1hAHexax0W9X9/mBa2Gu6wGOGCc1vK22O8cdkb76zI9w8JUvsiVco1xSpDNg7@lists.infradead.org
X-Gm-Message-State: AOJu0YzyllRarfQZqQKGsIL+aBto+Wc3FpwstA9DC7iIrEPmiAIpntot
	Oo6ALO5KpIxbExDJkgd8EQQEouFZdLYNTPYvZhhZuCQvEdOHu8sQsIGP4/TuqYLoDakYz2gMFS7
	WZxTyeZ7XPI3+VDaQFtJRBzw+EhzEp1tm32tzkrebhzigKU5UNNzAplcI/hnPC2dyZA==
X-Gm-Gg: AZuq6aKfzUJa+voeeLlZVtIkMpsadd1rOdXwW+4rM7oGNsifTK/fOLldNu8SzvL+XxN
	sj0+wHVXacD3i4bh5qSP1XPX7S5u2ptBFEwIelmhUe1o7ebvJ27XCVD83UtQQfcqVle2fK7yMCF
	xH3TYoYJJ5/hkrejzYC2OwEd2n1Ut1dmjdYVT7eNbud34H2ShobB4/UcTHDB8q4h0JUGyanjRRg
	mrMjOshuse0tvJIwAn117zZ/pqdWlyGi/+bn1v4h67BeU7JnE4eSH4faLfSFMhsWqKRjJG/bL9v
	LUscwWk2bS6wLRxWZaXRVz4CY6c8GPT1OjnlE0wHGixax9I4Mow3cA4F3R3eejJNFDkbOcudgx+
	dyKmvHeRgAKcD6hQGUiw=
X-Received: by 2002:a05:7301:1f0d:b0:2ab:ecd0:5221 with SMTP id 5a478bee46e88-2b856b58bfamr5364845eec.42.1770655814351;
        Mon, 09 Feb 2026 08:50:14 -0800 (PST)
X-Received: by 2002:a05:7301:1f0d:b0:2ab:ecd0:5221 with SMTP id 5a478bee46e88-2b856b58bfamr5364825eec.42.1770655813766;
        Mon, 09 Feb 2026 08:50:13 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855c7f5fcsm7612938eec.29.2026.02.09.08.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 08:50:13 -0800 (PST)
Date: Mon, 9 Feb 2026 10:50:11 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>,
        Raymond Mao <raymond.mao@riscstar.com>,
        Dave Patel <dave.patel@riscstar.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
Subject: Re: [PATCH 4/8] lib: utils/irqchip: Add IDC to hartindex map in
 struct aplic_data
Message-ID: <2c67verpauee2cnoauviiclujhuydiorbavxvrhfobbqdrlji6@tenf7n66gnu5>
References: <20260207102602.2917520-1-anup.patel@oss.qualcomm.com>
 <20260207102602.2917520-5-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260207102602.2917520-5-anup.patel@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: PPMPY6BLUyktTsvJjoBylavKhxqIQbd5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDE0MSBTYWx0ZWRfX8UzXZyuD2oZC
 grjtof54xO9kp2Nb2XCMUtvPVHgmBFQLyggT/BlZkPGz418C/CiiTIk1rRjwJ36lVwbte9YPafF
 SMVdAw/GrcoPeilNyL2fE6Iir57ej8+VNaiF+1LRHnQLi4llScC3f+w0g3tj9UPfTA0qf/nohGs
 GrQ0gFM5v8XnzoVWse/iQ8eICDQepRzZP4+BSxEuO/1j4evkTkBGy/KhuQzvWBkQ8rbizqzd7kV
 lvOeyGapLQvnUpMaHxuUS3hPYXLj1UxsmDIw++uqtA9bbt189hSLANtK52zkMyL2EfzMNSN6Xw6
 lF3RRuKv5+Glt6XB6MhwnxlZij1EVwMmR9EEP2vNW9Sc85mj4/XAPEW8kspe2N8+4rzqm7VU8QN
 xUE/s0w2diyHWI5RSePC1yfpFr+SpzSJCO2kDey1xm3gI/p9YjHsJK0quOVZw464V1DFjjtv2DL
 Aenubt2izyrTg4acxeA==
X-Authority-Analysis: v=2.4 cv=F6Rat6hN c=1 sm=1 tr=0 ts=698a1047 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=bwiJyuGuz08mk7ZFl2oA:9 a=CjuIK1q_8ugA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: PPMPY6BLUyktTsvJjoBylavKhxqIQbd5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1011 lowpriorityscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_085016_695912_53C001D0 
X-CRM114-Status: GOOD (  10.08  )
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

On Sat, Feb 07, 2026 at 03:55:58PM +0530, Anup Patel wrote:
> A platform can have multiple APLICs in direct-mode targetting
> different subset of harts. Add APLIC ID to hartindex map in
> struct aplic_data to capture the set of harts targed by a

/targed/targeted/

Thanks,
drew

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
