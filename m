Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E154CC5AD5A
	for <opensbi@archiver.kernel.org>; Wed, 12 Aug 2026 11:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U/JZQRkJcZy0ZZsvXSrXq2s3BsLP1HN8TvqyGSLSNSE=; b=Zqvva2yiszCsC1
	TQWDyUGf+LTcxi4W76Yso33vLqhiTEzGvA1j8Myg2I1rh9iOiKP9DVFf2HKjilqA3CSTb6f53LdOO
	OIwNY3X7+NL1WFcuExW4INmiLkG5rb4MjHxzGWPdPXGF0EO0m91yq+2z27WVzAYpSdh3OHEWa+aAH
	Dr+1o65NmAhbZMiAr+FjpHVJsn8ZerETUjPHzUG7MiluSTvjite5bmHbWswbSSC55cQDVXeFRHwk4
	AAG19vK1PvQnmTLWRbNjPPbWsL9HbWtXZulla6VEZTwFprSNiF4h2N8IQvMAami+5z9MseIuicY7P
	28nQSInNCpIJm9gxBlmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu7NV-0000000G7fE-0O1M;
	Wed, 12 Aug 2026 11:44:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu7NQ-0000000G7dX-1Rs3
	for opensbi@lists.infradead.org;
	Wed, 12 Aug 2026 11:44:11 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CB4tZN3543532
	for <opensbi@lists.infradead.org>; Wed, 12 Aug 2026 11:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wr0aAhqjMa0N9iGygJbzp4/W1lJhE/nNtXpzNCSqdtY=; b=mhJpguDk7OybKKIt
	60FRF5rkQxs7N5oFqMBl/atucKsDYzvnG+mOkKkyegPpkshpw9/7EZe2Bcrv3Pfp
	CfJiwyqPSO3epkt+1yI77AlzrOiZc0BYnAJeELq8Sg+jteGpwb0CPfB20XlRQ//A
	ZvSmtyY7Pv/3Hbp8PN3hsB9gFovF4wUil2ZDZve/jVgvvBsjmuBiLtU9aSzFrICQ
	Wkj9/cFsuAI2GF0Ckz5/en8mTNa2Zq8fYqvdLgWeAUhlO6doEK/eKfJvaIxPBlis
	IxC62xUaVQmnF/Bw4WC2cBMJYV0Mch8z+ioZbMslXbbrI8AXZc66yw/b2Zqx9vm3
	TtAhuQ==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0hj1hn1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Wed, 12 Aug 2026 11:44:07 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e9dc0f5900so2793627a34.0
        for <opensbi@lists.infradead.org>; Wed, 12 Aug 2026 04:44:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786535046; cv=none;
        d=google.com; s=arc-20260327;
        b=keLQw0Kloulon4FtY7wpy0r0hkZzspUQ91uNlXMPBmMwJ+YbFmJP9DF6pSdwS/rJBk
         3B7Lcjof19t82CIf/Jgw+4pT9T4jecEwHScpTMKP6CYj2ppdjC/VJQBeGPmPWw+bas6b
         YyAsMlp1pM+0hODxluX2dm5n0DdHeKzgczki64XQOsunylVTdTOIJ+yYjlFWFurgR//1
         ggmeSYepvwWgeu7ShPjBVVRCbHi8BPEw2y5SzXT4BD/+kKrFIpSrQXWWBXCFB/6Wc6re
         66Hoep4z0Jtcc7VfsQ5Fbh38R4XOmAcXekIwkJQDZ7pm4T5ROYCNWBx5mb4RtYUzg3q7
         y4MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wr0aAhqjMa0N9iGygJbzp4/W1lJhE/nNtXpzNCSqdtY=;
        fh=MdmvXSUFENyCa9IM0o2OrD48qc7mts4Xf6MuVA5kyZ4=;
        b=huIlKzgNmWbZSvTRlYMf4adbcMP42Ls34pUxSWsxZqRLvkubgPD6sbRorS71Wian7S
         WIjTso8luNtxsJWsh+LJJrnxp1Bjr0g+10PSYrkAe+uAPmf9ko69q/Ht0f3AwRgjaXf1
         hINMtEvwZOyb3naGlDZRpKPlBk92U9DohLrAbjJUgzXmB+ER/ZpllI+Dpn52Nj4Qv+d1
         HBYMSDP4syTobtxq4oa+cjDL4CoHzpto8RmkCJA1JaUb7YBRk9aQtqqhZkTAqrnx1CAm
         y2TPwtn6Uj2mKHBa0YGKSwwN76c31kG1me5dMl+W5wZlc+1n5haT8psezfnOYDmVY6sL
         3otg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786535046; x=1787139846; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wr0aAhqjMa0N9iGygJbzp4/W1lJhE/nNtXpzNCSqdtY=;
        b=d2FF5tHHYXIYlLO+PZNbjjo3V1O2DCsVeVAzuLnHIrg9ZvqNarHq0bAQ8rv5cBPmd6
         9eSRbOge/Bccwyp4O2S1NXO/mtWhyAFGaHPxpd5rmghPfkMkgBt+eY8CIuP3gifzXFPy
         l8yR6ELVAUD1ofW9iZua1IXpE8Blp6kotb3WwIwlwGBJt/uvLt314kCwwGsxpHoea5Hm
         aMqMqEy6+vWhbTnpQf9YhlmqA+yWDrlucDbHhhobYAL+Tb8CIQeEeYustOG4Zo0Ltzzz
         0xrQYV5zn09nL92RcxqtLuXbHt19LCKPEBm96SLW4E6mquTZAehCC5KEBJIn6bAQoOze
         oe2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786535046; x=1787139846;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wr0aAhqjMa0N9iGygJbzp4/W1lJhE/nNtXpzNCSqdtY=;
        b=LwTjetNBhelckFv075g0Nj7nxXct4zo+wUSymerpem6v7lYqN0dt6hrm/vGPLb3ubT
         jKWDTdp3MH8Yasz1pcgQIOc2PJJO//SDWEJ/yWWgMT7g5EJZBoIIhPB5wjWGXLXwImJ7
         ljpqjZDl9/XNyajpDMhXTSAH9T/ijq9oPlKvtFGLFlho7ZhZSk69riGExQ+En4kvcIqa
         PElH8q6VAjAN8GEinCbIXSZfbXkq0uLpDvsciBaFDm1TYMYrYxwKdEYdCDFRDaaN2SaM
         +e4zw8uLrViRRkvgvSb8NOzMKvl81y3gouiyLhUI0vaHt7APcL36ZWcmA+vCE5DvuGWg
         akcg==
X-Gm-Message-State: AOJu0YzqhAemCtqMBZzJ6IvgXb0fFBmI+8y7MeTaA2hatTqgE7NlN14R
	V9x4E+mT6cXgqiZd81LMmQExWisgs0cldSRe3eqQgbeQgLtbYjEDrnBtPSYHKzr8Dan5ApBRQWC
	tB9wGXramrGfsuSmhi9v22KBQD9/KPb5JSRU1N94Q8xJWxYbxi708lgjrs0tPFELBBXHh5FIGgz
	6r7G8ulVLwT7CWCMd+ZDV+ZDUREmjWH98FNIBD0qfzkDWD7mvS
X-Gm-Gg: AR+sD11f+FuEzUp7F5KQpgyw2yfCvcn6745EAJu3FMFsz6Qb8VENijYoaNEMGS9E7sU
	9Wmotu6cXNQX6hzC69Iqex8NT1d1ulQ65pIahHqwh9Vnq8ni949SIDT0YJMDmicMQQQtH8OPVdk
	y1rFcvTBpIXG3f6gEh9JpZGNAFrNcLKRzWf6lym8DW+SQcyVGyigJ525Gw9A==
X-Received: by 2002:a05:6820:4b82:b0:6b0:b6a2:1ef5 with SMTP id 006d021491bc7-6b0b6a22062mr2218021eaf.17.1786535046522;
        Wed, 12 Aug 2026 04:44:06 -0700 (PDT)
X-Received: by 2002:a05:6820:4b82:b0:6b0:b6a2:1ef5 with SMTP id
 006d021491bc7-6b0b6a22062mr2217988eaf.17.1786535046149; Wed, 12 Aug 2026
 04:44:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260805183839.2576691-1-rahul.pathak@oss.qualcomm.com> <20260805183839.2576691-6-rahul.pathak@oss.qualcomm.com>
In-Reply-To: <20260805183839.2576691-6-rahul.pathak@oss.qualcomm.com>
From: Anup Patel <anup.patel@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 17:13:54 +0530
X-Gm-Features: AUfX_mzQ5XgEY8Rx4HZrFwMfwozbGeDPntixXq6NOjVqAZDhWpKBhpv19-ZPjwk
Message-ID: <CABBgwmvSAxxQXFP2Rm9+gpxDMhTRMNfVsCHVGWDzF8UeW7Kq2g@mail.gmail.com>
Subject: Re: [RFC PATCH v3 5/5] sbi: init: Print supervisor domains at boot
To: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, rahul@summations.net
X-Proofpoint-ORIG-GUID: kH-euotOlBu86iK3W5rtgg00dktjXKFQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA5NSBTYWx0ZWRfX9r1CCQ5NBRGi
 uTUzDLTNsLVodWrLZguaTv9pyBqa1c4NLOkqsM5YU4fLLC+h74ZY0REPizdbizioszCuWzAmSEt
 t5TwUH8NknxczUFyMKoFrvnr0Bq0c7n299CcGkc8W4cdXm5lljVCf1dsxKNxGUvUrDDDkDYGLBP
 WuDlaEBOAPQEHUN7fAMvgDS9v3FzHlglTyVDYJKm/oir8XuqMxeFzl59e+UA7xPk7DEH8MA16ZV
 Ym/BEcFkZmTdojoeS7UIGFRHFcXQTZhTsxEYNBuoqDqeEKJhRTw3+VsBZ0ktsXss6cSmVssotez
 E7KQh5yUKNWwwEOmZ3eZ32gh1tWJa6Ysg3JeGjDF+L4bH9D1uoklok4eq3A49JnVwvVQixXR8Xa
 Ytkd/+TT/jw/jtnCmiONuWFXtkbAQ/czS7cUqndGWKrRpi7bHv/zBMxa5QOSMqaBktjx9DIGnpI
 yABFzvzzIslIuzA+etA==
X-Authority-Analysis: v=2.4 cv=K6ES2SWI c=1 sm=1 tr=0 ts=6a7c5c87 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=BdsGnOfRUh8klkrVg1cA:9
 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-GUID: kH-euotOlBu86iK3W5rtgg00dktjXKFQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA5NSBTYWx0ZWRfX8vzeIVelXhmF
 KtaZWf3ra+bgsW9eFx4AMfG1OuZHxQDauOEkLLOUCR0a7JLU3C52wjU8jloPnXwtbq/3JgEVzX6
 hYNH85qijeWHxgoh4SBBTGQTD2bDFO4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_044408_502516_08721D13 
X-CRM114-Status: GOOD (  15.26  )
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

T24gVGh1LCBBdWcgNiwgMjAyNiBhdCAxMjowOeKAr0FNIFJhaHVsIFBhdGhhawo8cmFodWwucGF0
aGFrQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gUHJpbnQgdGhlIGNvbmZpZ3VyZWQgc3Vw
ZXJ2aXNvciBkb21haW5zIGFsb25nc2lkZSB0aGUgZXhpc3RpbmcgZG9tYWluCj4gZGV0YWlscyBk
dXJpbmcgYm9vdC4KPgo+IFNpZ25lZC1vZmYtYnk6IFJhaHVsIFBhdGhhayA8cmFodWwucGF0aGFr
QG9zcy5xdWFsY29tbS5jb20+Cj4gLS0tCj4gIGxpYi9zYmkvc2JpX2luaXQuYyB8IDQgKysrKwo+
ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvbGliL3Ni
aS9zYmlfaW5pdC5jIGIvbGliL3NiaS9zYmlfaW5pdC5jCj4gaW5kZXggYWNkMmY4YjYuLmRjMzk5
NDk0IDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkvc2JpX2luaXQuYwo+ICsrKyBiL2xpYi9zYmkvc2Jp
X2luaXQuYwo+IEBAIC0zNSw2ICszNSw3IEBACj4gICNpbmNsdWRlIDxzYmkvc2JpX3RsYi5oPgo+
ICAjaW5jbHVkZSA8c2JpL3NiaV92ZXJzaW9uLmg+Cj4gICNpbmNsdWRlIDxzYmkvc2JpX3VuaXRf
dGVzdC5oPgo+ICsjaW5jbHVkZSA8c2JpL3NiaV9tcHQuaD4KPgo+ICAjZGVmaW5lIEJBTk5FUiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gICAgICAgICAi
ICAgX19fXyAgICAgICAgICAgICAgICAgICAgX19fX18gX19fXyBfX19fX1xuIiAgICAgXAo+IEBA
IC0xNjAsNiArMTYxLDkgQEAgc3RhdGljIHZvaWQgc2JpX2Jvb3RfcHJpbnRfZG9tYWlucyhzdHJ1
Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gpCj4KPiAgICAgICAgIC8qIERvbWFpbiBkZXRhaWxzICov
Cj4gICAgICAgICBzYmlfZG9tYWluX2R1bXBfYWxsKCIgICAgICAgICIpOwo+ICsKPiArICAgICAg
IC8qIFByaW50IFN1cGVydmlzb3IgRG9tYWlucyAqLwo+ICsgICAgICAgc2JpX21wdF9kdW1wKCk7
CgpUaGUgc2JpX2RvbWFpbl9kdW1wX2FsbCgpIGFscmVhZHkgcHJpbnRzIGRvbWFpbiByZWdpb25z
IGluIGEgd2F5CmluZGVwZW5kZW50IG9mIHRoZSB1bmRlcmx5aW5nIGhhcnQgcHJvdGVjdGlvbiBt
ZWNoYW5pc20gc28gZHJvcApib3RoIHNiaV9tcHRfZHVtcCgpIGFuZCB0aGlzIHBhdGNoLgoKUmVn
YXJkcywKQW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5z
YmkK
