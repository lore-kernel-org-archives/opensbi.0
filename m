Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D488E9A03B
	for <opensbi@archiver.kernel.org>; Thu, 19 Feb 2026 06:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0wTt2I95EqTDcG3swUz9PiWXTY5lLh0Xlbqh80lHoQI=; b=u0JLQ3s6G1EmFw
	LLCKipuCKEw2/gU3SfcwTCpNcenkIbomPPAhGz0MM/muMPKDt+QYZRGq9Kydba/KzqiMrTqCjjyX4
	+6GOxMbnoNkPcmVZoswcdWs8F8+/Y6rJerUwl5yJZtkvSvJCh1+06w40ojRVsbw+monhHrsz6GOyK
	7FRI8cKEex3vF5KYrO1R9aHRiplXFNdqbcStnbL4YdvqtIuEJw3qXP7i/clUlSoeR8tWKP+TSzV0n
	ROKY/Xy7y9FrpAjvVLDsP0hXn6HmfzjMlHOuh1xIG+LHDSMbx3eN/FRMUuVQstACpU+WZKWlH9KjH
	MdhpB7GtBqbrzVicDjRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsxut-0000000AzdU-1uum;
	Thu, 19 Feb 2026 06:53:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsxur-0000000Azcx-0MwJ
	for opensbi@lists.infradead.org;
	Thu, 19 Feb 2026 06:53:38 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61J3NjBR4070789
	for <opensbi@lists.infradead.org>; Thu, 19 Feb 2026 06:53:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rOEMUi2Jolt301svjv4QhsiBJVZyPkQoxUycIYddh+Q=; b=O5uFAoQOvMTIRJ/T
	jMI3uFdkyT/ygpeqwLo1jSL6OLXnFc3KSh5QeMmI0+eC2SE74jIJnk8X11pycvr0
	lwCMxWUPDPhpDDpnDqKpqdHv4d7G8wPE0Mzw1E0C9UziDvUMTmKG9HRCK5oxYutN
	3+C0MTnBc7rEihp/tG6L72b2lPdRsYJKq3ojTFK1/oGpkL+cFF6t+0ickeJT2QCL
	aEwwY543/omtFy/pqjZpjLQiTRcDJPFXIvqZH2Ep/w/yt8B6SXZT1IP09PXTgEcH
	3jfFHttfPjCpbT9+jWWBGf1qs2k3mqcGe2Lu2gK9ohZbRHaIpIzmdiMoOyWIPEKO
	PKZOwg==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdtjy0c8t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Thu, 19 Feb 2026 06:53:35 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-40450320b4fso2567360fac.0
        for <opensbi@lists.infradead.org>; Wed, 18 Feb 2026 22:53:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771484014; cv=none;
        d=google.com; s=arc-20240605;
        b=SQjrdPIQc5XLVGDXWsz5Ln2LDeNFaxMg0dZvDPRE2zSdeREXK5R2sDaJcVKqelWBls
         is/ZKRy1BaMlIll97Y7gX68/KAKSlcZNPI2E4rHkDQ9Yp6XPpXcX0CtCvisAlAVGkg5n
         NlmaAI0Nw35x1HK99kOOwa2ekt/gGlVAqMMDUc8q7GAyZ867gsuHH5C5o4gzKJKovAG9
         J9xFWGDRxF7Gt6RkI9zJtmw4ee18nunKbRWxSt8oSG+UWliMr21W+RTNWx3mtjNzvoPm
         lO+HV4KVrbpWciE4SjMdfosBz9IefElR68KOdCoP2dfS3jkWqpeD66LIe/TC5kSSxe/2
         ZEOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rOEMUi2Jolt301svjv4QhsiBJVZyPkQoxUycIYddh+Q=;
        fh=itf0b402Can3mawpxZ26mCSaPmJ4MxasHFs0bT/5AlY=;
        b=aoYcIkohyqP+D/xdun+nkYsDGSXCqE+2Y7JDHkL9Umxj6NLHo3DY7F0FzQ2L08fpJR
         nD8q6wRDt7Cvjx2f9N6p01tfMolKlpQ9nHHbpyyAtBVg/qs8JwCXAnUHat/AxaOK0r1a
         0fpjt9CtnW4Uvmy9vXQT8cqp/h+N5SbMsTLoNori09BYqebKLUyMovErUcFaIWunTbt4
         bcgLSQ05YjhMREaP49UMmqjWvY91PyRciFoPcXXe7s0V+SrPY4rhtRSrfO26Gkfex8AR
         YMkfRBwaek1D0xHt4tChiKTsVIphkBtfuW8nYANCnbZBA6rLZvPkwWkzwvJ1rQ6puWYD
         ilQg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771484014; x=1772088814; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rOEMUi2Jolt301svjv4QhsiBJVZyPkQoxUycIYddh+Q=;
        b=KJuR54SffF5Q/CaEUI3HIRpjCzNqH1mgH6yRqB9Esn2ySpCLu2krwvuJHru2JeMZiK
         hkaZEQdJXHho3RF8lXugf0pm38am6w8CV1Bl756l5Ix4qauNs6DLYZKWk2iWc8iQ/QNo
         hxCJGn+Zo2T7w6H7AnW1xv+WsUDiA50v7UEmyWSgaOQsCdkqU6o/XgAmIrJur2tTVNNG
         jEtlZRPeXIHzstnF68lTV+lkqRbw3lNKIf5czsBpxpv7Yg4wIWZXNwe/GBu3p1OgQYno
         MeSYaPHhY9nJ7hpKxU/A1+GJlgqcrHO7ttIN/VTYArWD3HO2v36xms8oH2hAwducNOiy
         bxxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771484014; x=1772088814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rOEMUi2Jolt301svjv4QhsiBJVZyPkQoxUycIYddh+Q=;
        b=Fb/Uuwuqx7DxHI/fLs7NIn0eS2y5Vr8MfIAbo8oF7GaXcB90bg2MPY1M/Qjds2CaOx
         p7qnXaliRiG0RtWbqORMqj9vdO6FdB4cB+1nppa++zvPp7D6Vr8q7G4/Yf1IzmocvoLd
         17znsdHT0+imjHnq4JWS6lu123YpV0k85QvTjPRYj/HC7eZStDedLkh8nn0xqIan0mTv
         vQhHj6JIVi7m2srZedKunyWjp3H0ZW6eCnY3vNwRgxXJcoFkXGDJgzSZk2fuPGmTq7tW
         vF4hkNswhCPrF6I8Z1eDWzpjQkPrGOxG+axNA/+305WqFA/y3fK1g5D0BArDiiraLb0i
         dDGA==
X-Gm-Message-State: AOJu0Yx7VkzQguFmcxJFouiTh1NulZY2K49xqVzGLij+WwOzejvOWnaX
	6ZzaIWDrEu4jgeSgq0qaY0RTS+8Euv27HTElKbzYqK3Fve07vIdGzuXLIqSDygScQdEO++LZbAY
	Kg76maVpxjOa+Ao5rBxbr64lsLup1+F81JrWUz3UmHPJ5fm18E4pSTpM6l+Wv8FYCNOL60hJN1g
	JvdYJjvkI5HM+rt2ryElQuZnE7VbFxCosHttIRfCVy
X-Gm-Gg: AZuq6aIcnz+mAJoC0zfc5VHp8jNJiyQ/tJ/Cmq8hIvc4eZYhQtP6SMBHxnJRh7OaH1+
	RGhK5aOWNO4FbjqMQQMcLLFbe5zafxvzJXrQVimYM/wOPr21k+NI0NW0izklaXK7hg/1xS+yX63
	8fkUL10ZTW4q0JCnS3UN9ktVVuk3GuMFZzkC0ja3PEzsjvlLkFSDiqlwrD2GjBA1rNrxgpI+0MM
	Na/WP4=
X-Received: by 2002:a05:6871:7508:b0:3fa:df3:b198 with SMTP id 586e51a60fabf-40ef3b771famr11472282fac.3.1771484014593;
        Wed, 18 Feb 2026 22:53:34 -0800 (PST)
X-Received: by 2002:a05:6871:7508:b0:3fa:df3:b198 with SMTP id
 586e51a60fabf-40ef3b771famr11472277fac.3.1771484014129; Wed, 18 Feb 2026
 22:53:34 -0800 (PST)
MIME-Version: 1.0
References: <20260217-nmi-v1-1-eb4b4b3ad70e@gmail.com>
In-Reply-To: <20260217-nmi-v1-1-eb4b4b3ad70e@gmail.com>
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 12:23:23 +0530
X-Gm-Features: AaiRm504zghsrmnLz47122AnBmIt5UVV13kFU5yBiSE9QDKFrc8Ufj8LVkNxy1c
Message-ID: <CA+Ht8=YMejcSnkA+8ODbzD0pUYaDbh0YkmqLmq1FiQEY_R=nBA@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: Use SBI_SSE_EVENT_LOCAL_UNKNOWN_NMI with
 unknown interrupts
To: thecharlesjenkins@gmail.com
Cc: opensbi@lists.infradead.org, weidongwd <weidong.wd@bytedance.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDA2MSBTYWx0ZWRfX0WYmJ5z1B2PF
 MBVatytZZCxP7iKbXVsHYvZGVaErIbx8kQUzXpKYw9nXcV1gXZZ8Q6kXJfLFLpP0CHLCPFnEoi7
 R5ss6vJ84wVvREAVy7y9boaXfck9poKKgqCVa141GBwcJ4qdadWBGDAA0lLqwa2nbcI6Tom3UEu
 KRsNo7RO4KS9n49iGNmQHmztl/yqHddaYiWBkX19an2Egyv8SNcqvfx9/76aJAxeol2SHCIs65s
 mnG5lS7Crh6m/XsiGkD+8Mh5JkiwPyzUVaPFhCTzKhbh9h9wjzyoDe0s3jtd9GSsjvWIcvNuz4b
 WWxJn6UVuaG8VAtEbvv/y3tb8bmTp+6QQvBqUlqBgLIY/RvPv45wjZg6ZcNK6u9kKrSC6h64jYC
 vXSfu1sIprtIPyz/54nIxX9bqzBtCvRai5z4pyoSgJwFZDWVD1WMrKgEOZmW1b6CJfzbWnAONng
 3pnf0C2taraZ6HGimdQ==
X-Proofpoint-GUID: hEyTZEW0I8KzJhhI4g27sB7nCJUwB-uu
X-Authority-Analysis: v=2.4 cv=FoUIPmrq c=1 sm=1 tr=0 ts=6996b36f cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=w9LLKGefiHYLQ32EEQQA:9 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-ORIG-GUID: hEyTZEW0I8KzJhhI4g27sB7nCJUwB-uu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_02,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_225337_244059_93BFC762 
X-CRM114-Status: UNSURE (   9.77  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

SGksCgpPbiBXZWQsIEZlYiAxOCwgMjAyNiBhdCA3OjU44oCvQU0gQ2hhcmxpZSBKZW5raW5zIHZp
YSBCNCBSZWxheQo8ZGV2bnVsbCt0aGVjaGFybGVzamVua2lucy5nbWFpbC5jb21Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBGcm9tOiBDaGFybGllIEplbmtpbnMgPHRoZWNoYXJsZXNqZW5raW5zQGdt
YWlsLmNvbT4KPgo+IEFuIG1jYXVzZSBvZiAwIG1lYW5zICJ1bmtub3duIGNhdXNlIiBhY2NvcmRp
bmcgdG8gdGhlIHJpc2N2IHByaXZpbGVnZWQKPiBzcGVjLiBXaGVuIHRoaXMgb2NjdXJzLCB0aGUg
aW50ZXJydXB0IHNob3VsZCBiZSBmb3J3YXJkZWQgdG8gUy1tb2RlCj4gc29mdHdhcmUgdmlhIFNC
SV9TU0VfRVZFTlRfR0xPQkFMX1VOS05PV05fTk1JIGlmIFNTRSBpcyBlbmFibGVkLgo+CgpUaGlz
IGlzIGFuIGluY29ycmVjdCBpbnRlcnByZXRhdGlvbiBvZiB0aGUgc3BlYy4gVGhlIHNwZWNpZmlj
YXRpb24gaGFzCiJyZXNlcnZlZCIgdGhlIG1jYXVzZSBleGNlcHRpb24gY29kZSAwIG9mIGludGVy
cnVwdHMuCklNSE8sIGEgcmVzZXJ2ZWQgaW50ZXJydXB0LCBpZiBvY2N1cnMsIHNob3VsZG4ndCBi
ZSBmb3J3YXJkZWQgdG8Kc3VwZXJ2aXNvciBzb2Z0d2FyZS4KClJlZ2FyZHMKSGltYW5zaHUKCi0t
IApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
