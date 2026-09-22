Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 564C0C982FA
	for <opensbi@archiver.kernel.org>; Tue, 22 Sep 2026 16:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=npW105pP2vULM8UsXTXeR4+a2UuA3uCXPnCrkFtSLZM=; b=f7lCKb66M9EUmH
	mgz+jlqkhRuRGoE9xBw2xGA77D67bO/8UV0qUPKx0XQqsKpYdjhYKgVN6ncS7PUnDCyQ+nD+5AQYj
	nzNTH4SQzufb7uOfovq4d3lTuB7Uw8X5Mu8AfGDwcNXFNM6vJAxNjLkYBTxEV2XeST1hRBMKgUnBr
	mqHx08C8aHsnK1hcilU6BpOBXEpd5UWb8/EIy/YAhiajIoK5btIpu/mzRIUWRjEr7hWdaftoCAKZl
	2osYE9jbnViiOEkAUM3OkQZD80Kdk7eUDAKOCw2UwpzFJ5+lmL5xjlm7gT6VxOlHnWqA7B/TN69zX
	CujyNm5xnZ7aeJi+xgYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x93lG-0000000675i-0djH;
	Tue, 22 Sep 2026 16:54:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x93lD-00000006757-3TfZ
	for opensbi@lists.infradead.org;
	Tue, 22 Sep 2026 16:54:29 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjVWT1058326
	for <opensbi@lists.infradead.org>; Tue, 22 Sep 2026 16:54:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OdW88BQ1EIQx+JIuU7eDXfbjnA5HT2pe8B8BKRB1NXk=; b=WS3FFx6BN0OQqa8B
	Xa5tzoM4mCuazU0cb/1F1tmT/qRVExarYsfLNm1P5MzP4sFpq7S45jrM8ZWiH7tp
	4EelX1GQz33J0OZIBcTPI4x6oPRsY7M2AX4uWWdhQIZdfqAaFOA8C+ofThX7JrO7
	1bpzu9Omz5/LYBe/b0B6US+qoehNIYrI8cbcfz88BREt28YXYrCc/spdketa95ap
	SIQV2H50tKnVnoooC+98RquFYkP59h6dnywnhn4u5RDI1Z3aZcLH6/29cgWgJ3TG
	d2t1TGJcZ8k7Nt1YLBtWOjtaTS3M8SnSHTrILgeYgbQ9ToNgAvjc3tkgvJUarMWH
	UVsUKg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guha5uha4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 22 Sep 2026 16:54:25 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91064f6e75bso2248526d6.3
        for <opensbi@lists.infradead.org>; Tue, 22 Sep 2026 09:54:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790096065; cv=none;
        d=google.com; s=arc-20260327;
        b=S9Q8p3UhsiyqJM6cQGFJ0xEb3bmp+9+ARUnhuEZEztl9KYrkmw242HqSnRuAkGu22B
         vRHXe+2upD/+4JT98ILi5pkcBtV4Ak2kq7hYbfH08FlhflGLRk4D+jfTQOEbrGvwPKEn
         1+lWkjgtf22P/p7KQ2WrYyE9Th0mlX5XrLlEttY1zkaQvXSuXEqC25d+IfKLSKBenGSL
         l/fk5wbARXsLOlEwagU2uenK7d1tE4msZAhzQeVuhC3xzK4s8KkcmWv4gNYX10huFtKH
         sdi0M915ud4/N893AF17+VEum/TTLW/6rYEporjnbiPHYrcxIJkNaQ5J7D4aj9seV4Xz
         18/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OdW88BQ1EIQx+JIuU7eDXfbjnA5HT2pe8B8BKRB1NXk=;
        fh=4iwF7ic2TRKRyZKQ0F/rMtdoAV3AbkN5ZtSvCXJtTcs=;
        b=OpIkL1CdqXJ6m2ILUEqeOZeAX/1wNkQevwsFTlLVyNiH/GG60Owq3317KLy/Omb3//
         +rHD5d6dwhuKGIrRf7Bto5jvqzs/k+o7vDs4GYw5FGZBHqNGcX6b2b+tiAj66VaX5XZ9
         vhLsM3ViLpol+GEROjcTWx2tTvFoo6q1k5bdVMp6K5NNerfJyh+DJCN0Yu0shjTthqoQ
         rESH8HjMXnOAZIYXUSJW4Oj2ElIaWvQuuUhVOcoKzTDcQEDPr5bHO8V8Ax/pZzNJyC36
         tk7DOBoiEJ6gouj5JfOT95p/Jgjn0bm4nIhN19KrOr7J0m54X8T3Wp6DGbgGsDT2zVfM
         PMCg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790096065; x=1790700865; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OdW88BQ1EIQx+JIuU7eDXfbjnA5HT2pe8B8BKRB1NXk=;
        b=FkS6Q38oFnfX4MHXBP5hHd8oHYzszgXrMrlLg8DStrtuhGzIvf7ZmGPWGrLudOh8nF
         xUPYd3OvSVQ+v2O8nO4q1PlxiI5Ylypw8TztNqsqriuBbLqhiuwnZRzeJkKXJMAxPPAs
         xuAr8UIX9GPsdx9tQbbowf3TeNPkhUtpD+A4AAg5ONcrljWpVHj57MX7Wcgx1+qxJ+mP
         sm9jFb+jMzM0iud2rIKScqxF5ndSGbCDl8UtLq/NZ/H9HASJ9Zsbh6pOT0a1fEbV7kwO
         KVzyGQNwytdtxOGtTXjISS98Zuwfcoo73wd2Rxh3kua/2bb3Bu08wDYdHTzhhSr7Ie/V
         1fMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790096065; x=1790700865;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OdW88BQ1EIQx+JIuU7eDXfbjnA5HT2pe8B8BKRB1NXk=;
        b=vrWkgRkte6Ckq20kD9ruUTHyePcTLZwgVBDF+CCxJdkHwOd/0co9/flAEaW/u7K5mr
         1KyCmC7QhxXP86Ty3teNk98sAzb/8aiGJrrJ/CrkOMkFJhoxkeyVZVWJr+3WCQywFvo+
         T9qA22e5xvEmRca+FV43t/od2VBI9Tkbf9IqgBUg8gVznFS8kNY8mT708f7dzmmx6dPC
         Cv7KpKcJAFNkbit4XvK2OrV6//8tk8bQ2UJx9P7fYkYlae1afBBcbUkLKAiqms8otN/0
         z/+qq8L+xupSHrjw4cNw6fkWd8HywvuJSlfVS8NWUW9PA7R+HPoyzoJonKCnIEZYcd5i
         qGoA==
X-Gm-Message-State: AFuF++mHt8PsLooaB6AZXfQ9ZlkZhNpNTIiunj0BHGVNdIV0cqkXMMZv
	DRZOdPx5u0G6jNVoNAJlfAyqDskGgT+NLfu5pJMv9dOpJAuPgOEOIrZLYZMMBydTKmMeM63u8YZ
	cIfuWCdIfshuHNz4LMOKG72Or9/J4L4/GrbCH3l7lLgS1tJteiJlm711rq+DJdziXBmAJfMut/I
	fOZVoX/7cDQnnVvNxVo8/7cOUBExPvrgBrVdlbPxWeEUYyQ/He
X-Gm-Gg: AYBFou0v0KVw21QZd+XT3Gob0QUsLujggWcznJW7IMdFmBkfHF/wEcylbmD88MQ23ML
	sNO8lwvxVvVujCSSFCmqEYZwTIBcSrKX+NhS2duHnDN3Q1TOpeb+eYAe3TzzXANblkJFqWXInq9
	y0jtu8iANAXXmeQ5hyiaB0HwnjbvGB0ElIJQzgmW9f0G17sezfgsyexH7ZWK4=
X-Received: by 2002:a05:620a:1a09:b0:939:13bf:e861 with SMTP id af79cd13be357-93c15e78b82mr667383685a.40.1790096065171;
        Tue, 22 Sep 2026 09:54:25 -0700 (PDT)
X-Received: by 2002:a05:7300:3391:b0:33c:719:f1aa with SMTP id
 5a478bee46e88-33c23aeaa62mr32211eec.8.1790096053795; Tue, 22 Sep 2026
 09:54:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260918030955.3902993-1-rahul.pathak@oss.qualcomm.com>
 <20260918030955.3902993-2-rahul.pathak@oss.qualcomm.com> <CABBgwmvkdGoiZSWVhXqwzsWTLy4veQUn1xLYC_tthx6BTEsC=w@mail.gmail.com>
 <CAFR3w35ayB=drzsAt8NtHizYwXMw9GYfs6ebWOg6RVBUBWC_ow@mail.gmail.com>
In-Reply-To: <CAFR3w35ayB=drzsAt8NtHizYwXMw9GYfs6ebWOg6RVBUBWC_ow@mail.gmail.com>
From: Anup Patel <anup.patel@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 22:24:02 +0530
X-Gm-Features: AclHuK_u7yNWYNTCQ8m-8O_6GyTeZn31MwOuc4dYdde6Y9b4z1JecW0vQzm0CqI
Message-ID: <CABBgwmujv0mJ5LVo5WYUcjS69actoZjs_24dbYW43kWHzpinPA@mail.gmail.com>
Subject: Re: [RFC PATCH v5 1/4] lib: sbi_domain: Add domain register finalize notifier
To: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, rahul.pathak@oss.qualcomm,
        rahul@summations.net
X-Proofpoint-GUID: JvZplB58aRzimhyVntfBnMhI8RbE4l9R
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI0NyBTYWx0ZWRfXy8ccOVNUBWHw
 x6SXfBllSqdS8+F+gWDG9l+yUkTYjpicc/kOOO+jiXw0qS8njQGQqHJzReOKj+e0W8Z3UCAo3JV
 uKabZ3iV9d/VqmRSeIooMmAgJ76XaWk=
X-Authority-Analysis: v=2.4 cv=U+4Hnuru c=1 sm=1 tr=0 ts=6ab2b2c1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=gqVhgbQHoEgmPcL8FfAA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: JvZplB58aRzimhyVntfBnMhI8RbE4l9R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI0NyBTYWx0ZWRfXzEOTu+KgRoG1
 6WpUjLk+zNVowvAdgbqDNToHdEWjAsJ/0eGrJBbHFgEQVIMUCY4rXYgoEzTVNf3wD1s0PdZz/6e
 A+cY0kuptRW5J0th9jpz/zv4VCix+WsxKEIJ0lGFv71pklJcOanxi71QybLdMwbbkHCwGYFhkDD
 Fb3B7VacKwthtICpatpy69gbYYCMHdCAgzWbV3rtMWR1rnKhAN60cC8R8kq9JfsbN2zVIcUKHfq
 75OSXZd/vqoQPdZL1Qm4T6p0Yr7okfoCK+maKMZzNiJquGkeVBVmtcD9NtmJgqvkVeVYmS4rv0e
 gxJNSVbOUBDe7rRZVohRaXIIilN7b5e4CNd5+rSzLgBOJmL25hP1ns1FvdEeSEaKU68lh7x2cmh
 JcSvK6wUJlO8AYWAUoGHvBqU8yFRYvLVO4MFCqtoDja/xFWuJwJejS8i63EnJc/r8+HpkzrEA/Z
 17v0W8tYaNW+XiqvQEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220247
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_095427_982338_0AC081B0 
X-CRM114-Status: GOOD (  22.63  )
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

T24gVHVlLCBTZXAgMjIsIDIwMjYgYXQgMTA6MTPigK9QTSBSYWh1bCBQYXRoYWsKPHJhaHVsLnBh
dGhha0Bvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgU2VwIDIyLCAyMDI2IGF0
IDE6MzPigK9QTSBBbnVwIFBhdGVsIDxhbnVwLnBhdGVsQG9zcy5xdWFsY29tbS5jb20+IHdyb3Rl
Ogo+ID4KPiA+IE9uIEZyaSwgU2VwIDE4LCAyMDI2IGF0IDk6MDjigK9BTSBSYWh1bCBQYXRoYWsK
PiA+IDxyYWh1bC5wYXRoYWtAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IHNi
aSBkb21haW4gcmVnaXN0ZXJhdGlvbiBub3RpZmllciBpcyBpbnZva2VkIHdoZW4KPiA+ID4gbWVt
b3J5IHJlZ2lvbnMgb2YgdGhlIGRvbWFpbnMgYXJlIG5vdCBmaW5hbGl6ZWQuIFRoZSByb290Cj4g
PiA+IGRvbWFpbiBpcyByZWdpc3RlcmVkIGVhcmx5IGFuZCB0aGUgZHJpdmVycyBrZWVwIGFkZGlu
Zwo+ID4gPiB0aGUgcmVnaW9ucyB1bnRpbCBzYmlfZG9tYWluX2ZpbmFsaXplKCkgaXMgY2FsbGVk
LiBTdWNoIHJlZ2lvbnMKPiA+ID4gYXJlIGFkZGVkIHRvIHRoZSByb290IGFmdGVyIHJvb3QgZG9t
YWluIGlzIGFscmVhZHkgcmVnaXN0ZXJlZAo+ID4gPiBhbmQgbm90aWZpY2F0aW9uIGZvciB0aGF0
IGhhcyBhbHJlYWR5IGJlZW4gc2VudC4KPiA+ID4KPiA+ID4gUGVyLWRvbWFpbiBjb25maWd1cmF0
aW9uIHdoaWNoIGlzIGJhc2VkIG9uIHRoZSBmaW5hbCBtZW1vcnkKPiA+ID4gcmVnaW9ucyBvZiB0
aGUgZG9tYWlucyBlc3BlY2lhbGx5IHRoZSByb290IGRvbWFpbiBpcyBub3QKPiA+ID4gcG9zc2li
bGUgb25seSB3aXRoIGEgZG9tYWluIHJlZ2lzdGVyIG5vdGlmaWVyLgo+ID4gPgo+ID4gPiBBZGQg
YSBkb21haW4gZmluYWxpemUgbm90aWZpZXIgZm9yIHN1Y2ggY2FzZSB3aGljaCBpcyBjYWxsZWQK
PiA+ID4gZm9yIGV2ZXJ5IGRvbWFpbiBvbmNlIGFsbCB0aGUgZG9tYWlucyBhcmUgYWxyZWFkeSBy
ZWdpc3RlcmVkIGFuZAo+ID4gPiB0aGVpciBtZW1vcnkgcmVnaW9ucyBhcmUgZmluYWxpemVkLgo+
ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBSYWh1bCBQYXRoYWsgPHJhaHVsLnBhdGhha0Bvc3Mu
cXVhbGNvbW0uY29tPgo+ID4KPiA+IENsZWFybHksIE1QVCB0YWJsZSBpcyBwZXItZG9tYWluIHN0
YXRlIHNvIHdoeSBub3QgdXNlIHNiaV9kb21haW5fc3RhdGUKPiA+IGZvciB0aGlzID8/Cj4gPgo+
Cj4gVGhlIHY0IGhhZCB1c2VkIHNiaV9kb21haW5fc3RhdGUgb25seSBmb3IgdGhpcwo+IGh0dHBz
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9waXBlcm1haWwvb3BlbnNiaS8yMDI2LUF1Z3VzdC8wMTA0
NDYuaHRtbAo+Cj4gYnV0IGFzIHN1Z2dlc3RlZCBieSBQYXdhbmRlZXAgdG8gcmV1c2UgdGhlIGlu
ZmxpZ2h0IG5vdGlmaWVyIHN1cHBvcnQKPiBmb3IgZG9tYWluIGV2ZW50cywgSSBkcm9wcGVkIHRo
YXQgdG8gdXNlIGEgbm90aWZpZXIgZXZlbnQuCj4KPiBodHRwczovL2xpc3RzLmluZnJhZGVhZC5v
cmcvcGlwZXJtYWlsL29wZW5zYmkvMjAyNi1BdWd1c3QvMDEwNDU0Lmh0bWwKCkFjdHVhbGx5LCBi
b3RoIG5vdGlmaWVyIGFuZCBzYmlfZG9tYWluX3N0YXRlIHdpbGwgd29yayBpbiB0aGlzCmNhc2Ug
YnV0IHNiaV9kb21haW5fc3RhdGUgc2hvdWxkIGJlIHByZWZlcnJlZCBiZWNhdXNlCnNtbXB0IGRv
ZXMgY3JlYXRlIGEgcGVyLWRvbWFpbiBzdGF0ZSB3aGljaCBpcyB0aGUgTVBUCnRhYmxlLgoKUmVn
YXJkcywKQW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5z
YmkK
