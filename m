Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF73C531C9
	for <opensbi@archiver.kernel.org>; Fri, 24 Jul 2026 14:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ATCJYNVncW/FGNcTXNd8Vowpzzr8P6VL/Qw7fBvwrTM=; b=HIuqVctedUIlAP
	xwrY9sJb1VOJTbmKdnweYATg31OtkSeXT+v/T7bEegc5oxk4LyVrfE1UGRgechTRGj0d6Wkn8QK9K
	DIHH/osSsEOUQ6Uyptr9KjwFTjjDIwyR7HK1jo7HeISpcxT5gKwvfZLNsDckKCr1mmSE8q+R92f74
	jwYhi7ZfcOw7tEcw9gxIB3bWCZh0PC3vTtTwJ2aJjIoftXQLLg36cF9YV8rHZufxGhJ4q7FML5B5O
	cvlbGu99sm3TAOGyylcvR4d1x9XXkNODtLsVrGqVQ5KOWrjY2JbWTzxtsZ/s5xTAnkiLrsnMVueNp
	ImrBbz/+nwl6Mbway7iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHIJ-0000000GcaA-1GDu;
	Fri, 24 Jul 2026 14:54:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHIH-0000000GcZR-1BwZ
	for opensbi@lists.infradead.org;
	Fri, 24 Jul 2026 14:54:34 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbHRm3178250
	for <opensbi@lists.infradead.org>; Fri, 24 Jul 2026 14:54:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EKFhPCR+m0phGxp7w/MGKnPea2YBUQUIte93JEvfIBU=; b=JvoDlfCC1HROZ53I
	HctM2EWqDg9TmY/3fNigTOcUUvAmAiedHxvBd7VvcskQYuC6wbmvM4cFMjnZDY9N
	KOWzHrg+W1j9gTelaW6qjfMQ8U477kHyJPrVikdAdEdmNyDVsGjVgvVLUKJnC4DI
	LYVPJn/hG5D4O1O+gJvKbBSQpbUurIy2YJkLybh818tq3K6ui4vIBOT77TzIorCi
	cz0p3ZOEXRnEg3s+u8ZrYxDiDtgEMeDw36ieHAlq3FCxu9ZpIndEtylM67zZIa44
	248pazHQocl6wYH3L8kqTmn18sEcrnypPTaG7rBwQLeNxgyuHt9f2tWgpoTyTRER
	sGcQxw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5yah2hn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Fri, 24 Jul 2026 14:54:32 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb835525b13so467867a12.1
        for <opensbi@lists.infradead.org>; Fri, 24 Jul 2026 07:54:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784904871; cv=none;
        d=google.com; s=arc-20260327;
        b=SYWm3iyNBGLuFY6RmJjXrhX5LyH6VPVdAbqcVVeXZA7oIl0DxodWH/9voeu6yQhfIh
         eBZLwhcjnTPGLvoWkQlDa2bQoh1gMs4ap52bAtnPs9/J/6KkBrCYSisSgeArKY1aUSVl
         8LT1nugsleObzhuwHnyTH4AG0HFxnhIFsw5ssHU2n1oSbW+KwCskfrkKSJ/xLNOvwVEG
         stj/IUFRergiB6wBcdBPRTHOcERDY0H1f68CRGWf11855266fCtVQ0UIRRqZ9Rw8nSEh
         2Xwe3KUgO4557hZpOUUFO+P4862kinf1Q2EH0uMq2dLzgVJH5okWzXOHxs8RpAaBfrRF
         2MHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EKFhPCR+m0phGxp7w/MGKnPea2YBUQUIte93JEvfIBU=;
        fh=EfMTrEkpXGLgcAQYe07sWIBPPDzXvNFdYgznq1BxfAU=;
        b=kFUAd/vD5VgYdhVOB788ld+kxipXtKp14U9zGcjjdWEoV+FGWYTUdCYjGbn4PTonqT
         qA7YoOGRbTo2GfPprHmwnrF930T+VJbSpaRQJLxdH8RebsbBNPvhXs6c2H3MNJrHhj7e
         oSDw6wE9oFWqLmxozgBGWHYtm4YqX1kgN7i4QgAQKjCiGFQBYOfG9MWOTqN7UO5qn5hT
         PhCzh54ONwNofH7bz8ySd4HwUB3ceb/Hcthkc+0hmSIEmslLLw32oktbLMOWPfyq2YNk
         /B2bsZWMJR5n19Q5V4RYqgdgOG8N2NJHC/xSd9+8nvj/Rr/xoRm9taGJlI44wxMWLSO3
         CWfQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784904871; x=1785509671; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EKFhPCR+m0phGxp7w/MGKnPea2YBUQUIte93JEvfIBU=;
        b=ePxGBez0TDyf+haf18eJ9C8LYFbYYG5iG945vX6YRAfIzutuwOM1fpPcJnfrXMLkCf
         J910GnGd4ykXXPXBie6TVOQ/VZRW9E5eoQKxddVLoI/+exi+KPHsSYKrdpEtGRA1L1yB
         KvWR+XNMI7aKe/9iI0PWP2Uw4fM1fjag3CWAlAMWM/KCrTti5w8OVgsfqxOYEeNpryEg
         Z1k1RtaDqkaRsjjKlwpR+gcQ1jdg8mLpKwThfOlX0UTw0Zqt0j5gRrLs43zoQFF0i8rf
         J6rT1SUr5pkibMllepTnFhuU7qed35Q7PEFKJvsjRWaKia3xgpu/rGetDRzW1Yg1OEEg
         rD2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784904871; x=1785509671;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EKFhPCR+m0phGxp7w/MGKnPea2YBUQUIte93JEvfIBU=;
        b=O43SX93inLf9WwLmXXcfzLndZ9Uk+hWQ4X0tG4KDUJqQhrJ/Ds9L7B10yC0f+nl0Sn
         LLPgAdlc7H2w8ItfVLuZHDwDezGulLtSz7n0YH0M1yqQfz/vTeXX7leLVwx8ww+jGvjI
         zCjnndlO+jUVXjCcLjFJpGTICX7RK2FSB5dN7Npcf0z3uZ7MZq3JQCdTpvma8P09glDA
         QEDCKI0y4vitJlMfQjTzCt52ulX19ej4mayUp3l5QbMhOwm24Op5w6bEOx5xYpc6jhYV
         O4ap0fi8xBqSov20Nvjwuy65TGpzk30KfTOoLAt/Hc9/TYZ9RBNxs0FtaEbCkmbnRmFG
         mDqQ==
X-Forwarded-Encrypted: i=1; AHgh+RqHheVkDJXINC+Fcnnwcn7lmvI+EECThm5NoGndC47QWWaaXV80oQcaGLs3PqG9cvveig2dVfvP@lists.infradead.org
X-Gm-Message-State: AOJu0YwHewcYy1HL3dU40cD7pz7uSjrVrgIA3FngCPuOmK8+ikERCgTJ
	2aBijG0EelkQrgMVWdfq0kydCODPyDlWtBMD3mdQRwf2VzmWZxw5Ky5tWH31b0ZI+wIxeGht+fx
	Z6HHufPae2QNoL/qmvWWxdjXQpKxBJVlLlLBtoAv9EQH/ogm+UEG5wDkXWqyfaeHc7aRtiVg+4Q
	+fl1kwkKZc8zjXdfP1lp/Qdi+JlR8tliS+wBQUvD4m
X-Gm-Gg: AR+sD12L5pJEmaEm/YHyCkYmh7l5/g9HOI0q+Ua8CIIN1/1nb78rSg1qumUH7c9+6Xg
	7fGpv4pmndQDfpFjVo8e8QAEqL1wxB3xGxPPOxmIE4dXPrlPvgqP46o7IveAa1WYUR00PpIaGpY
	tE1OhtvZOo3c2/zj90rvXEfIYJxAqe5utaaeuVKfNQrnKBVPrVGs1tiWsmXw==
X-Received: by 2002:a05:6a21:730b:b0:3c3:9557:3b62 with SMTP id adf61e73a8af0-3c44b1b5294mr8285992637.44.1784904871346;
        Fri, 24 Jul 2026 07:54:31 -0700 (PDT)
X-Received: by 2002:a05:6a21:730b:b0:3c3:9557:3b62 with SMTP id
 adf61e73a8af0-3c44b1b5294mr8285960637.44.1784904870858; Fri, 24 Jul 2026
 07:54:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260717074413.2536416-1-anup.patel@oss.qualcomm.com>
 <20260717074413.2536416-3-anup.patel@oss.qualcomm.com> <CAFR3w36fjrhaciTGX+fTNL+NGy3kp-HR+9kdOXSeHG06mun+Kg@mail.gmail.com>
In-Reply-To: <CAFR3w36fjrhaciTGX+fTNL+NGy3kp-HR+9kdOXSeHG06mun+Kg@mail.gmail.com>
From: Anup Patel <anup.patel@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 20:24:19 +0530
X-Gm-Features: AUfX_mxg0A57A4c41qjFsoEtv_qqVTpPii_qTc05ECx-26a2FetzY_ZoMTh1L64
Message-ID: <CABBgwmvZf1cdxbjurb2pb5AqzQpGopJGxGy8zE-gGsM31B=9fA@mail.gmail.com>
Subject: Re: [PATCH 2/5] lib: sbi: Introduce sbi_hart_protection_reconfigure() function
To: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNCBTYWx0ZWRfXwkvZws3YZ9Yr
 Cv/aXGxa+LZRbjjduY8QvKt+xvMZTno5iE7DlwwjWfLtyxwjVYWJhoAmPHd9+KIL0Wr2ZUrDbYY
 VJZlAqNcmh4VZeZme0jjn+vI/kqw64U=
X-Authority-Analysis: v=2.4 cv=Rtz16imK c=1 sm=1 tr=0 ts=6a637ca8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=ZlvHD2lM5vMEi_gLcU8A:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: _84UYD5B-jLmMyNffZBeI99WkvMcPJtg
X-Proofpoint-ORIG-GUID: _84UYD5B-jLmMyNffZBeI99WkvMcPJtg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNCBTYWx0ZWRfX1l1ECoOJWvoF
 D9R6kO9tjsjC0/ZC+eQKgU9tNjQuYugge+XdAvBKgGJrLQ41FMTrW2bQbdZgOREIpJ/Yc0rW2ad
 mStSglJgbdVKc2xNsEMTmQClxzC9IxmB72wrP/uPRo2T5BlakOc/sXL8K6sKgnvURRDhycN8f5J
 1cFC52vwUzonMFWZP0c6amy/a00bxhIX3Lf5F/kzpczLLj9tFAgTlEuRVKin6Tcw10+KDnJ1XOj
 3mdOgo+USUTRWcQhzM1KEtTsiq+F5d84cKQTRSess8nM6VGeHlriuYIlT7h0n98s3jIaGHmy9fn
 A0wkVr/e/740GJHAPezzV7S2xc0+z5BpZyM+3s8tGov82nDJtdPyjZr3Lqef2+1T4gRCE/xha5E
 2J/TrwExFnsPonHQDgIBcuieVDpQ41jPqOB79iKwioGdPN3JBt0lMHUkgSgV2/CMIGTfOagT7C8
 4A8S0SYPkzLYUi6fr+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_075433_438918_A631DEE8 
X-CRM114-Status: GOOD (  16.06  )
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

T24gV2VkLCBKdWwgMjIsIDIwMjYgYXQgNDozMOKAr1BNIFJhaHVsIFBhdGhhawo8cmFodWwucGF0
aGFrQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBKdWwgMTcsIDIwMjYgYXQg
MToxNeKAr1BNIEFudXAgUGF0ZWwgPGFudXAucGF0ZWxAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6
Cj4gPgo+ID4gSW5zdGVhZCBvZiBhc3N1bWluZyB0aGF0IGhhcnQgcHJvdGVjdGlvbiByZWNvbmZp
Z3VyYXRpb24gaXMgdW5jb25maWd1cmUKPiA+IGZvbGxvd2VkIGJ5IGNvbmZpZ3VyZSwgaW50cm9k
dWNlIGEgc2VwYXJhdGUgc2JpX2hhcnRfcHJvdGVjdGlvbl9yZWNvbmZpZ3VyZSgpCj4gPiBmdW5j
dGlvbiBhbmQgdXNlIGl0IGluIHN3aXRjaF90b19uZXh0X2RvbWFpbl9jb250ZXh0KCkuCj4gPgo+
ID4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YW51cC5wYXRlbEBvc3MucXVhbGNvbW0uY29t
Pgo+ID4gLS0tCj4gPiAgaW5jbHVkZS9zYmkvc2JpX2hhcnRfcHJvdGVjdGlvbi5oIHwgIDcgKysr
KysrKwo+ID4gIGxpYi9zYmkvc2JpX2RvbWFpbl9jb250ZXh0LmMgICAgICB8ICAzICstLQo+ID4g
IGxpYi9zYmkvc2JpX2hhcnRfcHJvdGVjdGlvbi5jICAgICB8IDMzICsrKysrKysrKysrKysrKysr
KysrKysrKystLS0tLS0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKyksIDgg
ZGVsZXRpb25zKC0pCj4gPgo+ID4KPiA+ICtpbnQgc2JpX2hhcnRfcHJvdGVjdGlvbl9jb25maWd1
cmUoc3RydWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoKQo+ID4gK3sKPiA+ICsgICAgICAgcmV0dXJu
IF9faGFydF9wcm90ZWN0aW9uX2NvbmZpZ3VyZShzY3JhdGNoLCBzYmlfaGFydF9wcm90ZWN0aW9u
X2Jlc3QoKSk7Cj4gPiArfQo+ID4gKwo+ID4gK3ZvaWQgc2JpX2hhcnRfcHJvdGVjdGlvbl91bmNv
bmZpZ3VyZShzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gpCj4gPiArewo+ID4gKyAgICAgICBf
X2hhcnRfcHJvdGVjdGlvbl91bmNvbmZpZ3VyZShzY3JhdGNoLCBzYmlfaGFydF9wcm90ZWN0aW9u
X2Jlc3QoKSk7Cj4gPiArfQo+ID4gKwo+ID4gK2ludCBzYmlfaGFydF9wcm90ZWN0aW9uX3JlY29u
ZmlndXJlKHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCkKPiA+ICt7Cj4gPiArICAgICAgIHN0
cnVjdCBzYmlfaGFydF9wcm90ZWN0aW9uICpocHJvdCA9IHNiaV9oYXJ0X3Byb3RlY3Rpb25fYmVz
dCgpOwo+ID4gKyAgICAgICBpbnQgcmV0Owo+ID4gKwo+ID4gKyAgICAgICBfX2hhcnRfcHJvdGVj
dGlvbl91bmNvbmZpZ3VyZShzY3JhdGNoLCBocHJvdCk7Cj4gPiArICAgICAgIHJldCA9IF9faGFy
dF9wcm90ZWN0aW9uX2NvbmZpZ3VyZShzY3JhdGNoLCBocHJvdCk7Cj4gPiArICAgICAgIGlmIChy
ZXQpCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiBTaW1wbHkgLSAgcmV0dXJuICBf
X2hhcnRfcHJvdGVjdGlvbl9jb25maWd1cmUoc2NyYXRjaCwgaHByb3QpOwo+CgpPa2F5LCBJIHdp
bGwgdXBkYXRlLgoKUmVnYXJkcywKQW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5z
YmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL29wZW5zYmkK
