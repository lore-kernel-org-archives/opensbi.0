Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAC4C53219
	for <opensbi@archiver.kernel.org>; Tue, 28 Jul 2026 18:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cpEuCwd15P961sL9Ox63wAVL3GPaxUKsvcGz+3mNzfk=; b=LYABJJQnJ4L/Bj
	y9TIu7RruAiyQE99KI8r4YAyzgEQ0e2tefyKZzzqsV5hxsBsgXgdx49aJRh4YTU1OkW33oSsZqKQF
	Xy/nrc9qnPxpHFDPdCRReO1Q4wtAD/vQRlwIk3y2yWVp1K2cEg8CJi20X1GjIbimtnbkDnNFqKNvM
	3shvEzufLruzpIsiH1av9WCjHR/xdHHFs+BLFlgiREnS2oSXJxdN7xeLBKL2j+2kYi2f0KuyMltJl
	mT8zGMm9N2icXYfk+Lk7NJC2cB3JhuRjyP3SP74EXhvvUuAord+7zpMJBhBHjV71wGoZmkgrcURDc
	/veEk1gnzMVTFACO0Msg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1womNn-000000063nG-0Hiv;
	Tue, 28 Jul 2026 18:18:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1womNk-000000063mv-1BHQ
	for opensbi@lists.infradead.org;
	Tue, 28 Jul 2026 18:18:25 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SIBkKY3587257
	for <opensbi@lists.infradead.org>; Tue, 28 Jul 2026 18:18:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZvwY0jBCfyy017+Rnq76aJRe0cZcZYtzzE+Ur7A3EKU=; b=czTi6hyCDwlBBNgd
	ZQCEGCKY5HVqgTu8HQ8f7Y84+In/SY0731uoUTzqGBaFEdXEVAlE4s5uuFqkjXrT
	E189D0kp1ryzwBap/O+FCt+nQMUn8VYJhRbAi8IKFNOGWshz01JXgsYD0zTwgsNP
	0rBEDWZDNumQVhJbC5hb94E0BfszLKxwIyUjW3F1+gtVCfSN5SXNL3m1zz6NnjJe
	uFWO0ZjPdkAhZRbQI4cEDq9qTk6X2NsGcLXhtZLcuq8qA2R9+AXLwnvmM1E95JA/
	SJBVi+i6oc2+0gqCJgoiZ1h5fqFQss4RaXkkZvszyJkblbzRaiySuqs/0a1ftdqx
	WaTjOA==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpyukrj00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 28 Jul 2026 18:18:23 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-4583ab9a376so77521fac.0
        for <opensbi@lists.infradead.org>; Tue, 28 Jul 2026 11:18:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785262702; cv=none;
        d=google.com; s=arc-20260327;
        b=diC+WcFgi/1PcHjeXklXmecDRoH1a2zVUNkjb6MgoUZBot7xbW+CrRaR15cSo11WJK
         SMS2/Bio8UkeWCjI0pnpro2fU3uH+84vfinES5CblXNcw8RgWyAzcG56erLNFhbx+b5e
         fXl6ijab9nmVqswl0+LY7/LFr5YHkxZL8VjRpy6iM1yfwAr+uYRGXU9/UpmlFzhQm593
         s1hwn40f9z5ADpk4Zx/XnL6ALEYvhKspsThcdoJQOqv7VYVGvifC4TLeUAV9H8hvF9BJ
         RNB/CryycOkyOOtG0ylr8fUH+z8i+N9ylEJgij8KmCLJlzFS5EAmT3oMihm5VK4X1Can
         AFJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZvwY0jBCfyy017+Rnq76aJRe0cZcZYtzzE+Ur7A3EKU=;
        fh=MdmvXSUFENyCa9IM0o2OrD48qc7mts4Xf6MuVA5kyZ4=;
        b=sAXCZECq0k3aScnD0WlClhWV4UdZmAwFHtUBTjOr78CDRDdzs7/CNXGoM6qUMqPJLU
         Wt3fDYV2V0nzEHlmxOVoASFzU2FKVR0xhQlY4Z5aqrrKbenbB+KanClRzAsU++GD1Vle
         ajVhUaJS0a47AwFJD1mBW4sYvqB/uv1pRmvGBDqwdRchn+pDayViubed+8aaeiW9uJtk
         g+iTCQksTEzlrBSiYvprLcI/L+TRo2U/LLnESPAvtTydVDsr5LrHYC/JNbYb0wKDn8uN
         HXMdkdL0MvXMM/qLPerunayVY4gVE+pkJidvLauMuVbWtNEYeY/M6RZp9cvE6PMuvpkD
         qLzw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785262702; x=1785867502; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZvwY0jBCfyy017+Rnq76aJRe0cZcZYtzzE+Ur7A3EKU=;
        b=dqBhR45jUSOwINPyREiUXG2wzyiVC6imQVQ85XYLm1R7MoRMcYmWGlxSwD6O90kZ+N
         PrGT60xYcapgiBEG1BbYboSTo+SREjlMm32aSe9s7gvvfyuMQbBc13J3f/EbOOgoONOh
         HrfmnU6j4mI1AvY24uaQXdCg3NdVI5YofFJ1fVjQSUFBhnf5qfUuEvlG8np7if9bHo5k
         rJ27gXNhJFvbBX6wMpIyAxtCU7fxq8lKgb0EUsjVdjWtWl7K2aSdvQVcA1oTdYmYpZ8P
         cJ75YEhQ9A8dI9laQwTJuNb+wLcByvhwVUcXy1aagrrX9FAzGMo2ty3niyIKAd1HIKdI
         WL6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785262702; x=1785867502;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZvwY0jBCfyy017+Rnq76aJRe0cZcZYtzzE+Ur7A3EKU=;
        b=CA4HnHXImsgTaVXu9a0nllSd1pz4G5Wh3T+ujyy5HXs1iqGSByemcD/g8aouKMVV+L
         xXGo6J8p26Jda1vb+xH+ehWMZEuFEO1VB04Xn/daQ+6guH2ve6MGxYcOua8brUVYa6NY
         lVxvSY4mAgvM/K89BQ3ctGlTipYKiW06g+F7BNVwQA+Rme5HJfErSzU+IqIOxVxkosLm
         T48m6Vzt2vfI1wtcZvbtYRDJZB4zCENq/5e2NilXYwskmBckfLCV7nSShZ5MfM4MQk0Q
         F363qK/Gs3rvSZV3jR+i27EXHryuXaN3wz4pThmPvpQPOXrPft9Q34YprEUhG3yMOJ4Y
         kRyg==
X-Gm-Message-State: AOJu0YwJO7dOU0Y2dZ/rLibq3htYA0Nuft/VU7G0dWxIROiGQuVFpQD+
	hsMmBS2N1lt3IfaSGuXv3n1VDRbcHQhQVPcTxmm5OUpzMdhWCEvSCLQN1gDZeSqNiQG6S5IkqCH
	yBCJwV1j41imHUXzk5y0+PmOW3r+JmvdToKZ9mpq5hNJeFflqo9dVYyc29moTm3LH5oiDMsYEdB
	XCPxePLAbqnwfGqfS4DwlPv08NgFsFljLPJiVDJb09
X-Gm-Gg: AR+sD13ovnQP5frJbX0ym+wzpQYboOpr06EWN6+YUGhIroAdrk4o8ml/8Kj5J65kF3H
	kqAtFJMljSXbtRVtO8eV1p6gut0J2Ofbu2F/e5oU/urxVNZzpNKj2yugvEYKkQcNOpTv4/80gTP
	i/9na0x5aXXaptFFLxD2fgNrFa3WrbOIICd6Ahx92IBfUXyNiduiIqYwcgrw==
X-Received: by 2002:a05:6870:242:b0:43c:2d3f:95f8 with SMTP id 586e51a60fabf-4586be2959bmr1940702fac.0.1785262702347;
        Tue, 28 Jul 2026 11:18:22 -0700 (PDT)
X-Received: by 2002:a05:6870:242:b0:43c:2d3f:95f8 with SMTP id
 586e51a60fabf-4586be2959bmr1940691fac.0.1785262701906; Tue, 28 Jul 2026
 11:18:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260727135605.465309-1-rahul.pathak@oss.qualcomm.com> <20260727135605.465309-5-rahul.pathak@oss.qualcomm.com>
In-Reply-To: <20260727135605.465309-5-rahul.pathak@oss.qualcomm.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 11:18:09 -0700
X-Gm-Features: AUfX_mxgnubxPJsIw4ClujqwlWuDYVULZNHcvQ2a9k9Rzp4YYYqaSqsT8OF4SDQ
Message-ID: <CAAVgOkKHauD1f4Tr+t6uWH3COuN=A6KUj8rUHXWdpDqg+2xJ=g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 4/5] sbi: hsm: Activate MPT for domain on hart start/resume
To: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, rahul@summations.net
X-Authority-Analysis: v=2.4 cv=O/kJeh9W c=1 sm=1 tr=0 ts=6a68f26f cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=OF5XkGY452hmmCe9SD4A:9 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: sBojJpKhiLxhdcCgbRxfERTB4vD7oWSc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDE1OCBTYWx0ZWRfX7Twue5Tc8Nx0
 MQeT9DLqLxIqGeSv+P/59oex4uiQ1aFUfUsjqWThWgTR4gsyXqg1Ukv2NRvwyyBHo6xypBhD+ZU
 ukPb4kVHEpy0abaK360NfdBvK7wuJaqxaCglgyxF3SoP+EMyDwpAIHrZgq+hQhAvIj2gdp+ilst
 p5TGLAVSWpwwqyy0yzCKWq6Vr0wnOktgBIl5tc0+DK0Z7g1gN7UC9i7jiW7PLAu6635q9G2CInK
 qggA+rmnLY2ABj7ZHAwFrQsr9c06Gisyzim2N5zf2ydtqNV+rFylX516gxLlH7siqgaCxeuHInh
 ++pJ4J2gCYoayYqWrVyVa4O/2Nrb7qCLSVD78MKOqTHiG4NlkIxSREEV1DOzx7ChSQgFU9K/2Gq
 NOa++9Uj3unvbxHJakF7ExrLhPYCvC9kZk4XN+zFDs2b+9McqYpsCP86tsgWZUMYW3z9V4GE4Ro
 LFiYUKsUXGSmjfbblaw==
X-Proofpoint-ORIG-GUID: sBojJpKhiLxhdcCgbRxfERTB4vD7oWSc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDE1OCBTYWx0ZWRfX4yVQhg6vAH4V
 3FeK210ftXSO5feoLQ+zqSB3aiDDUyTS64SGINsMxEpAQZYGJjCW6b6V4PoZlv8YBzGTKVWKHPb
 k90HNXrbgYjUWp0/3uhY29uV/fJOIJQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_05,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_111824_458852_1120C657 
X-CRM114-Status: GOOD (  16.58  )
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

T24gTW9uLCBKdWwgMjcsIDIwMjYgYXQgNjo1NuKAr0FNIFJhaHVsIFBhdGhhawo8cmFodWwucGF0
aGFrQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gUHJvZ3JhbSB0aGUgaGFydCBtbXB0IENT
UiBmb3IgaXRzIHN1cGVydmlzb3IgZG9tYWluIG9uIHRoZSBIU00KPiBzdGFydCBhbmQgcmVzdW1l
IHBhdGhzIGJlZm9yZSBlbnRlcmluZyBTLW1vZGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBSYWh1bCBQ
YXRoYWsgPHJhaHVsLnBhdGhha0Bvc3MucXVhbGNvbW0uY29tPgo+IC0tLQo+ICBsaWIvc2JpL3Ni
aV9oc20uYyB8IDcgKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4K
PiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfaHNtLmMgYi9saWIvc2JpL3NiaV9oc20uYwo+IGlu
ZGV4IDBhMzU1ZjljLi5lYjM5ZDVjMiAxMDA2NDQKPiAtLS0gYS9saWIvc2JpL3NiaV9oc20uYwo+
ICsrKyBiL2xpYi9zYmkvc2JpX2hzbS5jCj4gQEAgLTI1LDYgKzI1LDcgQEAKPiAgI2luY2x1ZGUg
PHNiaS9zYmlfc3lzdGVtLmg+Cj4gICNpbmNsdWRlIDxzYmkvc2JpX3RpbWVyLmg+Cj4gICNpbmNs
dWRlIDxzYmkvc2JpX2NvbnNvbGUuaD4KPiArI2luY2x1ZGUgPHNiaS9zYmlfbXB0Lmg+Cj4KPiAg
I2RlZmluZSBfX3NiaV9oc21faGFydF9jaGFuZ2Vfc3RhdGUoaGRhdGEsIG9sZHN0YXRlLCBuZXdz
dGF0ZSkgICAgICAgICBcCj4gICh7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+IEBAIC0xNTQsNiArMTU1LDkgQEAg
dm9pZCBfX25vcmV0dXJuIHNiaV9oc21faGFydF9zdGFydF9maW5pc2goc3RydWN0IHNiaV9zY3Jh
dGNoICpzY3JhdGNoLAo+ICAgICAgICAgbmV4dF9tb2RlID0gc2NyYXRjaC0+bmV4dF9tb2RlOwo+
ICAgICAgICAgaHNtX3N0YXJ0X3RpY2tldF9yZWxlYXNlKGhkYXRhKTsKPgo+ICsgICAgICAgLyog
UHJvZ3JhbSBoYXJ0IG1tcHQgZm9yIGl0cyBzdXBlcnZpc29yIGRvbWFpbiBiZWZvcmUgZW50ZXJp
bmcgUy1tb2RlLiAqLwo+ICsgICAgICAgc2JpX21wdF9oYXJ0X2FjdGl2YXRlX2Zvcl9kb21haW4o
c2JpX2RvbWFpbl90aGlzaGFydF9wdHIoKSk7Cj4gKwo+ICAgICAgICAgc2JpX2hhcnRfc3dpdGNo
X21vZGUoaGFydGlkLCBuZXh0X2FyZzEsIG5leHRfYWRkciwgbmV4dF9tb2RlLCBmYWxzZSk7Cj4g
IH0KPgo+IEBAIC00NzgsNiArNDgyLDkgQEAgdm9pZCBfX25vcmV0dXJuIHNiaV9oc21faGFydF9y
ZXN1bWVfZmluaXNoKHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCwKPiAgICAgICAgICAqLwo+
ICAgICAgICAgX19zYmlfaHNtX3N1c3BlbmRfbm9uX3JldF9yZXN0b3JlKHNjcmF0Y2gpOwo+Cj4g
KyAgICAgICAvKiBSZXByb2dyYW0gbW1wdCBvbiB0aGUgYSByZXN1bWVkIGhhcnQgKi8KPiArICAg
ICAgIHNiaV9tcHRfaGFydF9hY3RpdmF0ZV9mb3JfZG9tYWluKHNiaV9kb21haW5fdGhpc2hhcnRf
cHRyKCkpOwo+ICsKPiAgICAgICAgIHNiaV9oYXJ0X3N3aXRjaF9tb2RlKGhhcnRpZCwgc2NyYXRj
aC0+bmV4dF9hcmcxLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2NyYXRjaC0+bmV4
dF9hZGRyLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2NyYXRjaC0+bmV4dF9tb2Rl
LCBmYWxzZSk7Cj4gLS0KPiAyLjUxLjAKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+
IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKUmV2aWV3ZWQtYnk6IFBhd2FuZGVlcCBPemEgPHBh
d2FuZGVlcC5vemFAb3NzLnF1YWxjb21tLmNvbT4KCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApv
cGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9vcGVuc2JpCg==
