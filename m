Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 323E6C43458
	for <opensbi@archiver.kernel.org>; Thu,  9 Jul 2026 00:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pt833r3s4XNW110BYvfkA7yTMtQvRSf0fp/WYc0llFo=; b=S8a1eVQMVbOvV6
	KCAI6AWSGCu9DgDah5wqsCchnJe/W0gz01eFnIdFxLDBWpyA7UaWkX2DE7SYgW+QLulBzSNDwJCo2
	ONh7oCiKLzPtfWG7A4OF4U0nR4CJBBmM/9tvZABwMt9qWDfKv/Aad9L52aHqpMGEIAgNBlIRfCVbU
	WHeliJPIXddwFKBwHnQnh6AjYJ0Qq6Uo0D8DS7O6kWiXuYeGuBjrHE2CYI95ztGlNBigt3iUd/MlL
	t6jwHc0qjY4G3elScob0C7GAIAhvnGOr+Rs54EhblPGOwjjffIyWn7oe0iHY766awKpgtP+n5xNeb
	/590bz/OIQ+3vk40mEHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whct8-00000000faE-45cs;
	Thu, 09 Jul 2026 00:45:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whct5-00000000fZr-2879
	for opensbi@lists.infradead.org;
	Thu, 09 Jul 2026 00:45:12 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668N8csd040287
	for <opensbi@lists.infradead.org>; Thu, 9 Jul 2026 00:45:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nmb6D7Rx035OIB9kEy0ijStntBzuWFM2Yb2V6q4XXZ4=; b=QH0BYwY1WsAVplPp
	1qC0PID1IBRNIPbchXXQirSDMAwTnLB0T+mUsyoVOpFqCNGCmfsKYkwm73urNIMO
	Wj5EAvQ72JjuSXYxq+TLZyFBk2sVvh5i64zHsxtRzV9j4hUL9l0wNKU8IExRRl+M
	L9FPf0b3ZAzLUcfVSDGZmI7fE0e0bv2Girv6EFwC2o37mkh7AlqwhS0wTR6BDTmC
	1LQjzOnhlqFHHL+iUYl5bCECwwU7/8qJVSfobuQp5Ta6qU+q53zFuABwStbRF3f6
	ZY9BQ9cauRD7yBu41bHKyIug1eTVFQds86VD3dgSVsLoIN8YKmItWWeRbdeQMciv
	WyizVA==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9g7hmd85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Thu, 09 Jul 2026 00:45:10 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6a17dafd042so1476049eaf.2
        for <opensbi@lists.infradead.org>; Wed, 08 Jul 2026 17:45:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783557910; cv=none;
        d=google.com; s=arc-20260327;
        b=MqC+Kryq0qZ0ER9EiFc0di45sVDM56A/4vgOwwgovn+ifyb4gkul8Vd4lP7Zj0h8F9
         LHc5Q5Ds2/gX14cbWmD9UTyUTBGxC3vqMF0aW2yK0t8S2CgcOmVAmsQRq8bGLuYaD2LA
         0qtZ2dXfujNhY2tenAOFwfzmhP4UYXK0gHuMD28xyb7SCTyKV9OGN4473UyKLdyWxODS
         TTK2xzjT+JROlUHRuITRDOufOlt8RK1qoRHS6Mf5UXux7elOde3QSlMWabp948KMJ/NJ
         gUl9HMTZwyyMVQVBoY03+tzHjvrNzeYgc/EaP/zr9pim102+o+/z+6G1Ufz0OZ+cW+kE
         xu3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Nmb6D7Rx035OIB9kEy0ijStntBzuWFM2Yb2V6q4XXZ4=;
        fh=cyWYA3kXN4M7205T7O+U3EeZKBOqXRScKUv8W0MgTLc=;
        b=kpHQi4QNIr2qNrgv23unoVWWHpKvijZXAsdllbgffquMcu4zhotevvCw2jnyIsXytI
         KoYJQJsJuKsgTzD5r1Fh/4r7NOYIyP+Afbb/6Dj+HVnS9qoCeWXkm37ru5LE/aCLV+jz
         ggVwMP8wOaS1LDKq/+dTOOGQQqu+SLOWvDUWi8EVT5shpCNrOi0BJAk9wJ7pUCQFU6IO
         v+HS4/2v+DL8s63iBRvwPO9dUYnrAw3g6bjHbEE744zq3eE76jWKB9qZg8A7pSY2TyTS
         v6ujS6AVHK7dx9rFH+Gmd9/hVENsTupuQrFCZ6imjjxwhhOLXw/ALakt9WY3Sek/HrTt
         gY5w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783557910; x=1784162710; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nmb6D7Rx035OIB9kEy0ijStntBzuWFM2Yb2V6q4XXZ4=;
        b=gIuJvDSszJi7laAoSZCwXXUjZgIHwvT/+ykUrEZGsDj+9CxdDYHaix9cwJCS4vteUs
         B1JLSdDEiK8Bxs1+PDtbtn9M1BXoACeDUCNE3Asb6Qhhc5o3bynvk/R93iDJv9kmkhb+
         XrgPubwtPr2He5g9cbVKFkOru9oCfkD/AF++MgWdk8E2GQF+JLzQDhvj1LZ1zZ8/AM3F
         N31/pJDnkKt6j5Xf/NrCBQ+IdCBL93TtMlWvq1AfEYkrCIPsXs8GYh/rEj7PwKxH8gUA
         sxe1xX2zdcPL9BDSg6gIPOyOCkfjClbjqCMMAX5cQn1CVaSg1sTjXb8McmjzuJBP3JZ8
         2LdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783557910; x=1784162710;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nmb6D7Rx035OIB9kEy0ijStntBzuWFM2Yb2V6q4XXZ4=;
        b=oaUkRYwNWEBp6k33SPaZFuIgbyRXqeIG9Z5nO1akpgAy9FA0fVyhw1+PzMaUt4GBZI
         B/Nph1Eil/9m9+5gLi5uvu+5tC4ANgJx8APwFO1AwGJc6KU3Egb2iR299Bx+L7gm45Xc
         BmsU74ISOrTB+96FNRtZ8ObCnYo6SXbHJCEJua6/Z1WaxvHcMt0TSKg2yHpKWSPju9M3
         ilqVI7n2bB2X5T/XIu2vjqDnZFkM/6RoQLKdfDVVvLwUkd0fUVwUF/G6vIk3xQPR4BTa
         sSpJ+YbVj2mTbdWMiBGgWxPY6lo+E0iES1erpboDWO37hYsYiwoJv2/FHrZEBuODygFy
         hrkw==
X-Gm-Message-State: AOJu0Yx6AUo4yJ/8aEMc5jOMZ5ArLaeiwwocZDhNLDsEtCHGueLd6L66
	bh7PLfQHpeEJVOWbGwZ0YVaPXfPPVyH/QuRifEIapOHDnn8ViyAZIMViByM66EfSN0twL/8KNz+
	ZKE5c3FaB2qNuQ02E5F1DmnKaPsIIw0eRMbSlAq9rjhyFsnGLT33A/X3LwTmK1Bbl3Hoe967lL1
	5YPP3e/pdJOFxWdMZ8FrkpACCbI+7Qamk7NmLGZ5pf
X-Gm-Gg: AfdE7cl4rOpRWbvHmShx7al5jlaFOtGE9d7+7SSI8w7naSfYqQ8X4ZMz5hD/5hx7v5R
	K2uOb9AGiP1CuzZ+i8dBiT41ppWYRsynGfHps5mq+3fnYsp/8Cn+/yD3QfEI/4uxy2xo1W4y3u7
	et++sLynW+XLAEkpTBL3N3UoJPAIR1HxRB54QxgKfP6Q7rHMZMAj76QFphu2P4aaQdf0+f
X-Received: by 2002:a05:6820:2007:b0:6a1:189a:daf1 with SMTP id 006d021491bc7-6a36d85f68amr3838178eaf.4.1783557909975;
        Wed, 08 Jul 2026 17:45:09 -0700 (PDT)
X-Received: by 2002:a05:6820:2007:b0:6a1:189a:daf1 with SMTP id
 006d021491bc7-6a36d85f68amr3838148eaf.4.1783557909586; Wed, 08 Jul 2026
 17:45:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260626101433.3133466-1-peter.lin@sifive.com>
In-Reply-To: <20260626101433.3133466-1-peter.lin@sifive.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 17:44:58 -0700
X-Gm-Features: AUfX_mxgWkuSIHVHOiAENyjcjHr06L916gdFIYi9b8wJ3HcXyY6VpKnouKSLoM0
Message-ID: <CAAVgOkKk=KXy4MqNMYM3FA+vsdWN8cDdrZUXnDY9KgqNqhwV=Q@mail.gmail.com>
Subject: Re: [RFC PATCH 00/12] Add RISC-V Worlds ISA support to OpenSBI
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com, greentime.hu@sifive.com,
        anup@brainfault.org, scott@riscstar.com, conor@kernel.org,
        dave.patel@riscstar.com, raymond.mao@riscstar.com,
        robin.randhawa@sifive.com, samuel.holland@sifive.com
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDAwNSBTYWx0ZWRfX+lWKx5gRIDBC
 9eXeoGBstXW6Zz3ZH6DNZIEcTIKhQZIEMRS1Lyce+galZmJJL23BI3AC/RBeJvGpnyUmgjxTRDy
 9Nnn+qd3uLBcas4sufhyDHOEU1//vVpnNwMpTEbB7BSX9ZUA64kVtGtnRdn8Ex7vbuGefT5pQsu
 mwo5ITzPmbhe2YUKcjNraZ/83TBXK88yIy+APhtNMIIoZiIKFSIZiIv5IAxi6iMeb+a0wJCq3yA
 av6Zi/DAdF7KT0jUdP3AeV/wS8w1JTP7LcuDIW4QVHnmCebKTfvzB9bTCK1+l4KP3B3aQKhtv48
 idr8dSW3uvHqd0v/UcitpZQVUk7h1YvXgxLUHdRcxj2bO8JZPQGgkSo4dA/J0zWtyTSLt6cPxVN
 wvTEVQxJz7wa8Ktz5dklNokdUOm3414nunkOn73gvg+5shGEzNKQGBBiJuReFb3qM3aBujh/kuR
 5wVnKzKukXvl2L3CIcg==
X-Proofpoint-GUID: PrKO2lpAnBdFwdcAVSLloDddpUu-N6PD
X-Authority-Analysis: v=2.4 cv=TMp1jVla c=1 sm=1 tr=0 ts=6a4eef16 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=pFyQfRViAAAA:8
 a=JfrnYn6hAAAA:8 a=uejS2CynQSNwmat9Js8A:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22 a=oJz5jJLG1JtSoe7EL652:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDAwNSBTYWx0ZWRfX7+QOQlCNBuXL
 vu0u9EsVt2WUykAIPbj7MNeE2qnzcD7F3YeB8M7LmRvlhOjWWu3rYPRO+kacAHnNX/g45oCC+Zq
 nYQc1W0XVKSh62L2KCqbLkPLC5jXe3g=
X-Proofpoint-ORIG-GUID: PrKO2lpAnBdFwdcAVSLloDddpUu-N6PD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_05,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_174511_559882_768C3536 
X-CRM114-Status: GOOD (  21.80  )
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

T24gRnJpLCBKdW4gMjYsIDIwMjYgYXQgMzoxNuKAr0FNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgoKT3phOiBJIGhhdmUgc3RhcnRlZCByZXZpZXdpbmcg
dGhpcyBzZXJpZXMsIGFuZCB3aWxsIHByb3ZpZGUgY29tbWVudHMKaW4gY29taW5nIGRheXMuCj4K
PiBUaGlzIFJGQyBwYXRjaCBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciBSSVNDLVYgV29ybGRzIElT
QSBleHRlbnNpb25zLAo+IGVuYWJsaW5nIGhhcmR3YXJlLWVuZm9yY2VkIGlzb2xhdGlvbiBib3Vu
ZGFyaWVzIGJhc2VkIG9uIFdvcmxkIElEcyAoV0lEcykKPiBieSBleHRlbmRpbmcgdGhlIE9wZW5T
QkkgZG9tYWluIGZyYW1ld29yay4KPgo+IFRydXN0IE1vZGVsIGFuZCBCb290LXRpbWUgUm9sZXMK
PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+Cj4gVGhlIGltcGxlbWVudGF0aW9u
IGZvbGxvd3MgdGhlIHR3by1waGFzZSBNLW1vZGUgdHJ1c3QgbW9kZWw6Cj4KPiAtIFJvVCBNLW1v
ZGUgcGhhc2U6IFByaW9yIGJvb3Qgc3RhZ2UgKFJPTS9TUEwpIHRoYXQgbWF5IHByb2dyYW0gbXdp
ZC8KPiAgIG1sd2lkbGlzdCBhbmQgbG9jayBtd2lkIGJlZm9yZSBoYW5kaW5nIG9mZiB0byBPcGVu
U0JJLgo+Cj4gLSBSZWd1bGFyIE0tbW9kZSBwaGFzZSAoT3BlblNCSSk6IFRyZWF0cyBwbXdpZC9w
bXdpZGxpc3QvcG1sd2lkbGlzdCBhcwo+ICAgcmVhZC1vbmx5IGlucHV0IHBvbGljeSBmcm9tIGhh
cmR3YXJlL1JvVC4gTG9ja3MgbXdpZCBkdXJpbmcgZmVhdHVyZQo+ICAgZGV0ZWN0aW9uIHRvIHBy
ZXZlbnQgbGF0ZXIgTS1tb2RlIGNvZGUgZnJvbSBjaGFuZ2luZyBpdHMgb3duIFdJRC4KPiAgIFBy
b2dyYW1zIHBlci1kb21haW4gbWx3aWQvbXdpZGRlbGVnIGJhc2VkIG9uIERUIGNvbmZpZ3VyYXRp
b24uCj4KPiBEZXZpY2UgVHJlZSBCaW5kaW5ncwo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+Cj4g
TmV3IENQVSBwcm9wZXJ0aWVzIChwZXItaGFydCk6Cj4gLSByaXNjdixwbXdpZDogUGxhdGZvcm0t
ZGVmaW5lZCBNLW1vZGUgV29ybGQgSUQKPiAtIHJpc2N2LHBtd2lkbGlzdDogTS1tb2RlIHBlcm1p
dHRlZCBXSUQgYml0bWFwICh1NjQsIDIgY2VsbHMpCj4gLSByaXNjdixwbWx3aWRsaXN0OiBTL1Ut
bW9kZSBwZXJtaXR0ZWQgV0lEIGJpdG1hcCAodTY0LCAyIGNlbGxzKQo+Cj4gTmV3IGRvbWFpbiBw
cm9wZXJ0aWVzIChwZXItZG9tYWluKToKPiAtIG5leHQtd2lkOiBPdmVycmlkZSBTLW1vZGUgV0lE
IGZvciB0aGlzIGRvbWFpbiAodTMyLCAxIGNlbGwpCj4gLSBuZXh0LXdpZGxpc3Q6IFdJRCBkZWxl
Z2F0aW9uIGJpdG1hcCBmb3IgdGhpcyBkb21haW4gKHU2NCwgMiBjZWxscykKPgo+IElmIGEgZG9t
YWluIGxhY2tzIG5leHQtd2lkLCBPcGVuU0JJIGZhbGxzIGJhY2sgdG8gcG13aWQgKE0tbW9kZSBh
bmQKPiBTLW1vZGUgcnVuIGluIHRoZSBzYW1lIFdvcmxkKS4KPgo+IEV4YW1wbGUgRFQgc25pcHBl
dDoKPgo+ICAgICBjcHVzIHsKPiAgICAgICAgIHJpc2N2LG53b3JsZHMgPSA8ND47Cj4gICAgICAg
ICBjcHVAMCB7Cj4gICAgICAgICAgICAgcmlzY3YscG13aWQgPSA8Mz47Cj4gICAgICAgICAgICAg
cmlzY3YscG13aWRsaXN0ID0gPDB4MCAweGY+Owo+ICAgICAgICAgICAgIHJpc2N2LHBtbHdpZGxp
c3QgPSA8MHgwIDB4Zj47Cj4gICAgICAgICB9Owo+ICAgICB9Owo+Cj4gICAgIGNob3NlbiB7Cj4g
ICAgICAgICBvcGVuc2JpLWRvbWFpbnMgewo+ICAgICAgICAgICAgIHRydXN0ZWQtZG9tYWluIHsK
PiAgICAgICAgICAgICAgICAgbmV4dC13aWQgPSA8MT47Cj4gICAgICAgICAgICAgICAgIG5leHQt
d2lkbGlzdCA9IDwweDAgMHgyPjsKPiAgICAgICAgICAgICB9Owo+ICAgICAgICAgICAgIHVudHJ1
c3RlZC1kb21haW4gewo+ICAgICAgICAgICAgICAgICBuZXh0LXdpZCA9IDwwPjsKPiAgICAgICAg
ICAgICAgICAgbmV4dC13aWRsaXN0ID0gPDB4MCAweDE+Owo+ICAgICAgICAgICAgIH07Cj4gICAg
ICAgICB9Owo+ICAgICB9Owo+Cj4gS25vd24gTGltaXRhdGlvbnMgYW5kIEZ1dHVyZSBXb3JrCj4g
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+Cj4gVGhpcyBSRkMgaW1wbGVtZW50
cyBjb3JlIGZ1bmN0aW9uYWxpdHkgYnV0IGhhcyBzZXZlcmFsIGFyZWFzIHJlcXVpcmluZwo+IHJl
ZmluZW1lbnQgaW4gdGhlIGZ1dHVyZSByZXZpc2lvbnM6Cj4KPiAxLiBXSUQgVmFsaWRhdGlvbjoK
PiAgICAtIERvbWFpbiBuZXh0LXdpZCBpcyBOT1QgdmFsaWRhdGVkIGFnYWluc3QgcG1sd2lkbGlz
dAo+ICAgIC0gRG9tYWluIG5leHQtd2lkbGlzdCBpcyBOT1QgdmFsaWRhdGVkIGFzIHN1YnNldCBv
ZiBwbWx3aWRsaXN0Cj4gICAgLSBJbnZhbGlkIFdJRCBjb25maWd1cmF0aW9uIGZhaWxzIGF0IHJ1
bnRpbWUgd2l0aCBzb2Z0d2FyZS1jaGVjawo+ICAgICAgZXhjZXB0aW9ucyByYXRoZXIgdGhhbiBh
dCBkb21haW4gcmVnaXN0cmF0aW9uIHRpbWUKPiAgICAtIFBsYW5uZWQ6IEFkZCB2YWxpZGF0aW9u
IGluIHNhbml0aXplX2RvbWFpbigpIHRvIGNhdGNoIGVycm9ycyBlYXJseQo+Cj4gMi4gUmVzdW1l
IFBhdGggbXdpZCBSZXN0b3JhdGlvbjoKPiAgICAtIEN1cnJlbnQgaW1wbGVtZW50YXRpb24gb25s
eSByZS1sb2NrcyBtd2lkIG9uIHJlc3VtZSwgYXNzdW1pbmcgUm9UCj4gICAgICBoYXMgYWxyZWFk
eSByZXN0b3JlZCB0aGUgY29ycmVjdCBXSUQgdmFsdWUKPiAgICAtIE5vIG1lY2hhbmlzbSB0byB2
ZXJpZnkgb3IgYWN0aXZlbHkgcmVzdG9yZSBtd2lkIHRvIFJvVC1kZWZpbmVkIHZhbHVlCj4KPiBT
cGVjaWZpY2F0aW9uIFJlZmVyZW5jZXMKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4KPiAt
IFJJU0MtViBXb3JsZHMgSVNBIFNwZWM6IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi13
b3JsZHMKPiAgIChSZWxlYXNlOiByaXNjdi1pc2EtcmVsZWFzZS00YzgxYTNmLTIwMjYtMDQtMTQp
Cj4gLSBEZXZpY2UgVHJlZSBQcm9wb3NhbDogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIw
MjYwNjE5MTA1ODM0LjEyNzczMDItMS1wZXRlci5saW5Ac2lmaXZlLmNvbS8KPgo+IFl1LUNoaWVu
IFBldGVyIExpbiAoMTIpOgo+ICAgbGliOiBzYmlfaGFydDogZGV0ZWN0IFJJU0MtViBXb3JsZHMg
SVNBIGV4dGVuc2lvbnMKPiAgIGxpYjogdXRpbHM6IGZkdF9oZWxwZXI6IHBhcnNlIFJJU0MtViBX
b3JsZHMgRFQgcHJvcGVydGllcwo+ICAgbGliOiBzYmlfaGFydDogZW5mb3JjZSByaXNjdixwbXdp
ZCBmb3IgV29ybGRzIElTQQo+ICAgbGliOiBzYmlfaGFydDogbG9jayBtd2lkIENTUiBmb3IgUm9U
IGltbXV0YWJpbGl0eQo+ICAgaW5jbHVkZTogc2JpX2RvbWFpbjogYWRkIFdvcmxkcyBXSUQgZmll
bGRzCj4gICBpbmNsdWRlOiBzYmlfdHlwZXM6IGFkZCBQUkl4NjQgZm9ybWF0IG1hY3JvCj4gICBs
aWI6IHNiaV9kb21haW46IHByaW50IFdvcmxkIElEIGNvbmZpZyBhdCBib290Cj4gICBsaWI6IHNi
aV9pbml0OiBwcmludCBNLW1vZGUgV29ybGQgSUQgYXQgYm9vdAo+ICAgcGxhdGZvcm06IGdlbmVy
aWM6IHBhcnNlIHJvb3QgZG9tYWluIFdJRCBjb25maWcgZnJvbSBEVAo+ICAgbGliOiB1dGlsczog
ZmR0X2RvbWFpbjogcGFyc2UgcGVyLWRvbWFpbiBXSUQgcHJvcGVydGllcwo+ICAgbGliOiBzYmlf
ZG9tYWluOiBhZGQgV29ybGRzIENTUiBjb25maWcgb24gZG9tYWluIGVudHJ5Cj4gICBkb2NzOiBh
ZGQgUklTQy1WIFdvcmxkcyBuZXh0LXdpZC9uZXh0LXdpZGxpc3QgRFQgcHJvcGVydGllcwo+Cj4g
IGRvY3MvZG9tYWluX3N1cHBvcnQubWQgICAgICAgICAgICAgfCAxMyArKysrKysKPiAgZG9jcy9v
cGVuc2JpX2NvbmZpZy5tZCAgICAgICAgICAgICB8IDEzICsrKysrKwo+ICBpbmNsdWRlL3NiaS9y
aXNjdl9lbmNvZGluZy5oICAgICAgIHwgMTIgKysrKysKPiAgaW5jbHVkZS9zYmkvc2JpX2RvbWFp
bi5oICAgICAgICAgICB8ICA5ICsrKysKPiAgaW5jbHVkZS9zYmkvc2JpX2hhcnQuaCAgICAgICAg
ICAgICB8IDI1ICsrKysrKysrKysrCj4gIGluY2x1ZGUvc2JpL3NiaV90eXBlcy5oICAgICAgICAg
ICAgfCAgMiArCj4gIGluY2x1ZGUvc2JpX3V0aWxzL2ZkdC9mZHRfaGVscGVyLmggfCAgMiArCj4g
IGxpYi9zYmkvc2JpX2RvbWFpbi5jICAgICAgICAgICAgICAgfCA1MCArKysrKysrKysrKysrKysr
KysrKysKPiAgbGliL3NiaS9zYmlfZG9tYWluX2NvbnRleHQuYyAgICAgICB8ICAzICsrCj4gIGxp
Yi9zYmkvc2JpX2hhcnQuYyAgICAgICAgICAgICAgICAgfCA3MSArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysKPiAgbGliL3NiaS9zYmlfaHNtLmMgICAgICAgICAgICAgICAgICB8ICA0ICsr
Cj4gIGxpYi9zYmkvc2JpX2luaXQuYyAgICAgICAgICAgICAgICAgfCAxMyArKysrKysKPiAgbGli
L3V0aWxzL2ZkdC9mZHRfZG9tYWluLmMgICAgICAgICB8IDE1ICsrKysrKysKPiAgbGliL3V0aWxz
L2ZkdC9mZHRfaGVscGVyLmMgICAgICAgICB8IDYxICsrKysrKysrKysrKysrKysrKysrKysrKysK
PiAgcGxhdGZvcm0vZ2VuZXJpYy9wbGF0Zm9ybS5jICAgICAgICB8IDMzICsrKysrKysrKysrKyst
Cj4gIDE1IGZpbGVzIGNoYW5nZWQsIDMyNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
Cj4gLS0KPiAyLjQzLjcKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlA
bGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L29wZW5zYmkK
