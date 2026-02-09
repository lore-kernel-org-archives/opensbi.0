Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C552E7E0BC
	for <opensbi@archiver.kernel.org>; Mon,  9 Feb 2026 16:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KfYWRj4cukpHQk7KyAkjUVJ+EMhZpiuyCIOo5BZg5BY=; b=jiJTfx26uj5bHR
	zohKQhfSn6gbv5GXlfby8WAcdirSIlJu84XNcjKsTJhO9d2DXnJNHOp/2o4sVLM+wLzBr0uQDm2pm
	1FZJ9QCMst82dRLm1cszH5ex3N85o8zYrTv6TZPJS0qDvFwJ3eZMJLhkE0UlR0K5/RSXcobPBkVo9
	HLX/w7mmoNOCPtggHlh1DjvmrkLqrErGBRkoJXv76CfZsRf4LOsorns5Xrxty6V2ESoME1muPei0h
	w7+xApw/ra/eiKfAbg5tHZAx3mp0VYDlWHvrUh/6YH+QhcBquQWNzvJsHLnfcJAxJ/jN70zHSaWMX
	cGC0b1qUHhtMehMeycLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpUTM-0000000Fip0-2BDq;
	Mon, 09 Feb 2026 16:50:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpUTG-0000000FioC-1eaW
	for opensbi@lists.infradead.org;
	Mon, 09 Feb 2026 16:50:48 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619DGbOY3081548
	for <opensbi@lists.infradead.org>; Mon, 9 Feb 2026 16:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/cyx+uWjc7b7kRgsu7gGHd7l
	JqGqYrUqS+X26AMqjGY=; b=eMkaAR6XCccLwELGdJ1FvPNHr6WiVUQUnTshpCu5
	FAusbW6CdMpsmyNl9tgIcDS3xyuhMHL2FbFP57P0qjiR0zKEpmq29/uiowGxRs93
	Ja0NfPSzTtgCl8gta/X5hWfsof2P24BdL245M2X2mJmu5rL1MqmxHJzPpwrsmvUS
	ou++gI7sbfk8hXOouqTkMr0/BVshl61RPpaa6S6W6lD6MwDsaYjVEyMueSDci06f
	2Zq58TUIJweA99bH3OvrvwPR2FOUePQ0lpfwPuO3FCtuw9pcEMlGuq1435fAw04n
	wQz7T5uhPWmRuqButVIwt/9TlgNkthXFXjv0BzrSru92Lw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7gau8p52-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 09 Feb 2026 16:50:45 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b86381a107so16895726eec.1
        for <opensbi@lists.infradead.org>; Mon, 09 Feb 2026 08:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770655844; x=1771260644; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/cyx+uWjc7b7kRgsu7gGHd7lJqGqYrUqS+X26AMqjGY=;
        b=AYcbSj8Pb4hxgdgAcJwT0DAjExSo7kA+04/+K1e++tZS0HX2dIQ33YAzq8RFVcl8Kb
         O4fmSkLgmIGBNyY6rf5mRQPyJBJiuCOsf2KZaq4yywmI/QYn4EIjNhvRfPSaRgWFVDJ1
         OPakdv7xFfUcD4jcbXvzrBgB/N+XGVBOSqMqHFYc+ErnKqoh6w8Yslwz3y+WGxoWOgNs
         eG8ToNbL7JWftdv+FlmDFysq+i5bVvFeGOCp4RBiDIqI+r577vaPZ/ODW8QNpfAstzZm
         WzVS8LjzSBjIrf5ZEFwNJuctwO8mTkVdMjEbvfge+uIX3Um93o0125e3c5HxcahS/T7S
         37vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770655844; x=1771260644;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/cyx+uWjc7b7kRgsu7gGHd7lJqGqYrUqS+X26AMqjGY=;
        b=CQsKr/P5zf+/chmBL9L7vE8qWPVUedztkxp095SWh0gLB+EIzv9++rMbq5Cmp6ixjs
         qrNvvIkVyCCE3lf7zX8YdA9tFGxNqzThCJlvbfsuUjGQEtps/d+X1Qu0i7u/xiFGxiuZ
         rYS2Ey5lPJ/w2BIyyxWpfXwTVCC9LVniNs1VpidL1h+BxY7zJ72fPwCTCknKcB7u7mGi
         aVdWGwccNNB8B3E6pAsyr5L7TYdAo6V3yni2q5owpaWE5RVG4+KQklxzRyGIsadNkrXM
         1U/ZkvWnOT8cFG1Mt44q4q90OuqD6sk7bpozqOv9I24tcjRxr+NZ//YamEwkDVZFE/M4
         53Ag==
X-Forwarded-Encrypted: i=1; AJvYcCVSW/fy+WW/rZI8/PJZ6Zy54VReOk1343CwW8TlQMKslGsoXy6Skw8rvzPm6P8zaMvX8VwOhRDY@lists.infradead.org
X-Gm-Message-State: AOJu0YxvUVM5zqU5k0RkSWnTEyfkos6Hvu1BGP32q3zi0v9zrN893QEF
	RFUWihWhkvoqEhGrBbswPy4DcSu15ELuHwHbLFojz/P8NuluXsxsynx/+6vsndCqQOSpO18PR/s
	ALsgypqTcZT+JfgialEyn27cfHlETDjTdgrDPhfUKI8NUlztDeQTWVVl9IlekHcHFuA==
X-Gm-Gg: AZuq6aJEJ7f5hS8DR/Lvov1AFsKoSYFSNu3XIQlu56cWJ7Eq8FiMsnR5u9FxwJ2cKhS
	UFVEz+QW8TudY+ztXvNzmmunaw7LFFAYKFW1Ig9343U9dj0JGuYTBnE8Ldhj7+zsZfCCfGLmLLk
	xIq373+uW5omTm8X1AD1MNEW0Q3x02comzixM07KvsNak9pjsQUYAy6OB4ZNGr00Rn94BCdVEAA
	8rEuA6375juGM8mWL1mVv0xZ2U932hYe2RTVsURbFN6r6i0p2KFOE3HzdbqSgTJDw2UrSchWmtL
	TUWO+rIipfpnhNLys4/ArrUGsUMywXxPRH3mFFTGoxLkT0llbBn2Z7UBcalXluZylWo0PYFPTb8
	NFzswfbB6kzITvURC3jU=
X-Received: by 2002:a05:7022:6993:b0:11e:163:be60 with SMTP id a92af1059eb24-127041699e8mr5184232c88.31.1770655844304;
        Mon, 09 Feb 2026 08:50:44 -0800 (PST)
X-Received: by 2002:a05:7022:6993:b0:11e:163:be60 with SMTP id a92af1059eb24-127041699e8mr5184225c88.31.1770655843707;
        Mon, 09 Feb 2026 08:50:43 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b86ab1aaf7sm5193036eec.17.2026.02.09.08.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 08:50:43 -0800 (PST)
Date: Mon, 9 Feb 2026 10:50:42 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>,
        Raymond Mao <raymond.mao@riscstar.com>,
        Dave Patel <dave.patel@riscstar.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
Subject: Re: [PATCH 5/8] lib: sbi_irqchip: Support irqchip device targetting
 subset of harts
Message-ID: <urkwgvbeaqqpfieewyjuapido3774mscw7v7kjq7wm3qo2kfxz@iyu45i5lq5jq>
References: <20260207102602.2917520-1-anup.patel@oss.qualcomm.com>
 <20260207102602.2917520-6-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260207102602.2917520-6-anup.patel@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: KAl9ADYaPW2snQLpqGlzBa_J-nkHmTJs
X-Authority-Analysis: v=2.4 cv=eP4eTXp1 c=1 sm=1 tr=0 ts=698a1065 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=y4ymbNa9U3QHxlxag20A:9 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: KAl9ADYaPW2snQLpqGlzBa_J-nkHmTJs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDE0MSBTYWx0ZWRfX6jtueOAhnBG5
 HLPVufOAF4Br0fP6skMaHZzm30/Vkhjplox1ovj1Q73jR5R1zEjjEObzK1pmSyLIUirR6S67hAW
 tyXCv0kvjY2xawI+KVv7xme+FgPwmX1ms0ToU0DSRuNtMiZh3TDJA4a31VJs8UTLVziVd9scYho
 YuoXnapMX8oX+oOCS0hKKi15foTrJu+DNm4PMaW53yw8fqGLGOzVew3q3NKxcfPNRi0ADrxWxHk
 b8BJNr18+6jCwN6yJDzmV3OMHs7JN7Oq+JvtutVAFO2+/Yl/mWQqCtbiER68z8l9rDKvuBsx0nF
 /Tm45Lfnh9sia7vM3FZ7VWqK9Q1vH1B+Z0yn4pY48Xf4udLfWL77fU5032YE2BE1s/vV7V3kXhn
 CvZBFj/N9eb59xyLgkomHygAgo5BE6QaQTsJf9bXWVq/f7V68BeSXbRUT40lenb7209iPcii9tR
 vQVu7u6sqKQaZwFtkHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_085047_377634_C74E286B 
X-CRM114-Status: GOOD (  13.26  )
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

On Sat, Feb 07, 2026 at 03:55:59PM +0530, Anup Patel wrote:
> It is possible to have platform where an irqchip device targets
> a subset of harts and there are multiple irqchip devices to cover
> all harts.
> 
> To support this scenario:
> 1) Add target_harts hartmask to struct sbi_irqchip_device which
>    represents the set of harts targetted by the irqchip device
> 2) Call warm_init() and irq_handle() callbacks of an irqchip device

/irq_handle/process_hwirqs/

Thanks,
drew

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
