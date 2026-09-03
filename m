Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A23C61DD3
	for <opensbi@archiver.kernel.org>; Thu,  3 Sep 2026 03:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OMWM+Z3u8dkhv6oCw7NLmX15U7nbUFiFSQvYnCSBOYo=; b=GxRP9bM3Bn9UWw
	XOih0a28XCqpeR/mCh4NIKlgPlP3URC13UuPgcLf93v+5oK4Y58DzN0yLwC9mIGKn51iqfKBF2gmy
	JP7vfrxCDRQwBZzW5S3lKO6pz6s9UfP9VdVXkDFbmqh8VXha9jXqUS+jIxGRRvgW2DDuYsgfsJs98
	M7nxx6+HHzSTvI/h09TByPijfcDAzpdmxdbUXZEtHXVYyQnXmRxzKlraVP10JQCgaJO7brf35oIPm
	h22525Z58KlkLa9AhRO3OPxrddwsZzdYUdF5Pnii4VsOccqS/KxYlflwvXrQt0j02TSDmPN1htcCj
	4nEuUz7wQOD3NaXq6Xrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1yG4-0000000GHlz-0fdL;
	Thu, 03 Sep 2026 03:37:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1yG1-0000000GHlT-2Hul
	for opensbi@lists.infradead.org;
	Thu, 03 Sep 2026 03:36:58 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6832xtqx3275629
	for <opensbi@lists.infradead.org>; Thu, 3 Sep 2026 03:36:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QUkVMTK3Omti5CZbt5JV22/hMUMYOhmEG6mjO11+bGA=; b=KqKfFEUJX8RWoZX1
	IzHzzyFddZbBOEK0qRYl+PZghFqVFjM2+BM75RWnbuLZhtSgapNZSoL6M2nxVJoo
	b7+8lIlsaLkTs49SZYjl5eNTR9WC3WnIICdnUxi1a5V5HwsnNRpDyGDcvas4hdgO
	NnI54j4K6j2N8pzXRgdiW7VJriBvGgGyNbmjNwe4xeuub/oTjPqJB0cnURgOdJX5
	BLGKSnYRacWdfk5Fqv26PA7v4Xod6v4THU+qkY+0BHFYhM6Pkt8Kn2PWgNNGPJnJ
	r+Sgy6EDBnUTcnjkkJ8wZkQcaTJTfhQQE/E59NJ1dL7OCNziai9ib6613dv6Gonp
	hHf8Bg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdtwnx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Thu, 03 Sep 2026 03:36:55 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7f1da5e5b06so2092751a34.2
        for <opensbi@lists.infradead.org>; Wed, 02 Sep 2026 20:36:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788406614; cv=none;
        d=google.com; s=arc-20260327;
        b=owhPjPM3ZTsUcruU9sDVmko7b8ybXhT+kY9d7Lu59+f6lNV32+XSVNlVhIdTZcAs0m
         x4zy9+QBnRA0lge5w7iiC/MEhAHFkXWQUWEnxVlJjH/WJD2T43uiyJZQKNF2409GfLtq
         0JMHqt8UAh0xs0hMmGD/w0C7N+QoyFgj94cj2CaIRVZcGbl+OqAYDe0l3u0KccXQsLIR
         1Oc+9kUeS+mjiObpKxjJ2wMmtbMn94bkTduJkg8ms1HgTwFQb0KR2X03W3ygmW0jrT7y
         xIBzKEzUbRIcF7WGfQ6NMtAB57JexfNBJF0NJrHXfGnMrE1OgEdZfarix9LqWsrD84UO
         ps3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QUkVMTK3Omti5CZbt5JV22/hMUMYOhmEG6mjO11+bGA=;
        fh=HW3mrcNprVsUti2p9yjsVziUCwYLaw79UR5+L9s/4Os=;
        b=JyPqh7U9xFpjONKQXaQAzkpHw/CRDq3f6tQmGjjdL+3hp9/0XYr696LM1gtnF3Ufy+
         0KR/nuazaWI4/y2cY1szz1ZP9pw81mLp4L7KjtznQJtRfhJsZCSB07tGgasSlVcH1bh6
         M+CL5GNsX5d4FMAReS34fIpa3ixJbzmiEkkwhk1VtHePNaNJ/gOg+r8TH3ivlrdPWBTU
         q9UPM4+H8PKEd+Vcov0uXc0aMzgm7sZVfnbiYEAk61X1LjFW3WgRFVscMto2lDO2/Itb
         F7DQnw5JkL6JnbcwXAZmR05xJs0vcFLSFg/hilK4Rc0BrrMYhmADd1kAVA/2r0x0EDcg
         nX/Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788406614; x=1789011414; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QUkVMTK3Omti5CZbt5JV22/hMUMYOhmEG6mjO11+bGA=;
        b=RPWUFHkKbs7ILvK4/mCSD9tlzf/i82MRN9lb5YOZyMd4kNPBZg67KeBg/zWs7XtHK9
         w2sgbU/kQhMYsho3pfzrT7OcPuD130D52Yyr7HmJ5nayVCf9wm+sRvsYypeNkJrdJ112
         wnBrRoKIR6seFnLi4n05p6GTRSyjICZvXnGyG3WdxDcKJIrNBHXpb6wshhCeWU8GkFgM
         MFdY3WAieLvNvtlddJH6ZzvACDIu2yz9F91PrO6/0/KbdAovuF7LOZdGLkvkig0bI2Cb
         Uz2uqVK2+N6wtK6IybvhVhC48VTVX96tZMfTgr698dBSgxG+qePsVb5TcU4TIa+Idie7
         d0/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788406614; x=1789011414;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QUkVMTK3Omti5CZbt5JV22/hMUMYOhmEG6mjO11+bGA=;
        b=e9zNy73GmXe7bNV5GIGwVa6QEGkWb105RmfFU17UEUabCx+Qv8/qv9efhKlZcuYcwN
         9H1l8/3Pr5wHGssIQO2RpqNvDoKnH1ZNX2NWG4zGd/LWPgKM8JHtGC4B8bCgcQrc9QUX
         RaItSrAQMA6pWpL1TQcBTwcxWr9anY26szIs9KhJRDVuDBi4AfNW7OQBpcCA9Z6is4cP
         NrgBfdPtfliUKBQGZpLxQERFDtGzGFPpEWdF8ZK9x1dvm7fEybNQtUxL990qtSkrMuhj
         SBbxGISop5K+wT2FlEWTbdPTlAC6JEE+UlSm6XiN7S/fsPXOzu1dNMZA47DnRjBsj85k
         nB5Q==
X-Gm-Message-State: AFuF++nVRbFZg7WOlxBT/2nHR7FlNKPp2RrPQdk5RHay9QzsrI2xIOLv
	7TU7xTjay39CCbHgqn2jdYAWsduCYOKpK+BCdc5JWKqjCY8lnH7DmhrObvMYDpz3Zx57Xvve1hg
	4sCy5+ytxQSwG+ibRldvVXtAdtqGP7oMM3AoGWolB2uyAmWM4KWWciVIw2h0n+695pOo9rPft0F
	INJhL+gd7pDL48Pi5Y6BRI2j9wkPuohv/LDmwBN3ep
X-Gm-Gg: AYBFou0cHw+G1H0awPOHl0JWtHwyAICiXO/JwpkHtoWaN77JJnc53+1y7UX6708NQIe
	aHwaTqSpUuUn4uTlYbYuWlx+9Y7ejvNZghFpZjaYxHd//u5bUAnCdYcvJtoU3oGrLQfe+W7vtpo
	YxJHmt7fzoLQ5w1fKJvVv5i5Kjsf/jctWS6irgkdgMeCjMttk5pz8fPpTYdHc=
X-Received: by 2002:a05:6820:4cc1:b0:6b0:5233:f69a with SMTP id 006d021491bc7-6b481b368damr6831413eaf.30.1788406614300;
        Wed, 02 Sep 2026 20:36:54 -0700 (PDT)
X-Received: by 2002:a05:6820:4cc1:b0:6b0:5233:f69a with SMTP id
 006d021491bc7-6b481b368damr6831389eaf.30.1788406613892; Wed, 02 Sep 2026
 20:36:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260827115833.50735-1-pengpeng@iscas.ac.cn>
In-Reply-To: <20260827115833.50735-1-pengpeng@iscas.ac.cn>
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 09:06:40 +0530
X-Gm-Features: AcwNN1VDNtbzGMXJrIDLaYa3dKhV8PRJ6efe4htAa1ATpuQcdn4jrKdq5QYF0eE
Message-ID: <CA+Ht8=ZJrfwk6DBk+Dyt71=2r66-N=WBbKnBu+npLekKUX45Sg@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: dbtr: validate complete shared memory range
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: opensbi@lists.infradead.org, Anup Patel <anup.patel@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a98eb57 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=n0jg7fNemnf5H7JP0kwA:9
 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: Ke7S2yetas6JPRqkDbYbe9xHlGzsbFup
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDAyOSBTYWx0ZWRfX+Jj9VuDDjqXO
 ffC1K88htl8L8fpctNi/f7o5XeB27k9UwV3VxjcjdT8PL6HjNIvyxlLckClzPm1gNiFZ0TkeANC
 OF0gbS9au9Xp2GneVeBF9oSRbNhuDi/yNPBuZJTxnC+3cRa+IuSgjX38O0F+3c6trW9q6sI0m6a
 sNj4Rn63uGj66+/dYHNtXzStkvSjFFQKqfZaF0rT/L2mbSSDWtPxoZcF4+TL9NtQziH1Q8YiIH7
 Bv28IyHtTa9D31B9matddf1Fvv72ebudMFiobpZKiDjlSu4XBz9vWi2WAneiM+6ltc20gaDwZCb
 RsrzGqtjRpa8kPqDWL+K0hk7W8Jn+tzwArKKctEVYwjRgzIqwdE0H/W6EuOjyatsQl6zNkqf0Bt
 T3rvVe56ZseShROEG9v/nnPJKKRg5Au4ZpT/SY7b6lhHCUiWHUVlkhKoCKnzrrND/sQ6dGJUmfg
 /LsasJ9rt9E9n4kO4bQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDAyOSBTYWx0ZWRfXwU5aQJeLNx9p
 MYAGpBMFWPlt5IG4VCnZWmU4NezAwZl1cVC1QPRca+EIk+2Ib7cfQTgeTWPQHFIF4tNyLQ/tCSq
 Xu3pqWoVs43ZTK21ANtPFpwxCt/nNBQ=
X-Proofpoint-ORIG-GUID: Ke7S2yetas6JPRqkDbYbe9xHlGzsbFup
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_01,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1011
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_203657_701771_D6A6E1CA 
X-CRM114-Status: GOOD (  21.18  )
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

T24gVGh1LCBBdWcgMjcsIDIwMjYgYXQgNToyOOKAr1BNIFBlbmdwZW5nIEhvdSA8cGVuZ3BlbmdA
aXNjYXMuYWMuY24+IHdyb3RlOgo+Cj4gVGhlIERCVFIgc2hhcmVkIG1lbW9yeSBjb250YWlucyB0
b3RhbF90cmlncyBlbnRyaWVzLCBidXQgc2V0dXAgY3VycmVudGx5Cj4gY2hlY2tzIGRvbWFpbiBh
Y2Nlc3MgZm9yIG9ubHkgaXRzIGZpcnN0IGJ5dGUuICBBIHN1cGVydmlzb3IgY2FuIHBsYWNlIHRo
YXQKPiBiYXNlIG5lYXIgYSBkb21haW4gYm91bmRhcnkgc28gbGF0ZXIgZW50cmllcyBleHRlbmQg
aW50byBpbmFjY2Vzc2libGUgb3IKPiBNLW1vZGUtb25seSBtZW1vcnkuCj4KPiBWYWxpZGF0ZSB0
aGUgY29tcGxldGUgc3BlY2lmaWNhdGlvbi1kZWZpbmVkIHNoYXJlZC1tZW1vcnkgZXh0ZW50IHdp
dGgKPiBzYmlfZG9tYWluX2NoZWNrX2FkZHJfcmFuZ2UoKS4gIEFsc28gcmVqZWN0IGFuIGluc3Rh
bGwgY291bnQgcHJvaGliaXRlZCBieQo+IHRoZSBEQlRSIHNwZWNpZmljYXRpb24gYmVmb3JlIG1h
cHBpbmcgb3IgcmVhZGluZyB0aGF0IG1hbnkgZW50cmllcy4KPgo+IFRoaXMgcGF0Y2ggaW50ZW50
aW9uYWxseSBkb2VzIG5vdCBhbHRlciBzYmlfZGJ0cl9yZWFkX3RyaWcoKS4gIEl0cyBlcXVhbGl0
eQo+IHByZWRpY2F0ZSBmb2xsb3dzIHRoZSBjdXJyZW50IERCVFIgZXJyb3IgdGFibGUgZXZlbiB0
aG91Z2ggdGhlIHN1cnJvdW5kaW5nCj4gaGFsZi1vcGVuLXJhbmdlIHByb3NlIGlzIGluY29uc2lz
dGVudDsgdGhhdCBzcGVjaWZpY2F0aW9uIGlzc3VlIGlzIGEKPiBzZXBhcmF0ZSBkZWNpc2lvbi4K
Pgo+IEZpeGVzOiA5N2YyMzRmMTVjOTYgKCJsaWI6IHNiaTogSW50cm9kdWNlIHRoZSBTQkkgZGVi
dWcgdHJpZ2dlcnMgZXh0ZW5zaW9uIHN1cHBvcnQiKQo+Cj4gU2lnbmVkLW9mZi1ieTogUGVuZ3Bl
bmcgSG91IDxwZW5ncGVuZ0Bpc2Nhcy5hYy5jbj4KPiAtLS0KPiBCYXNlLWNvbW1pdDogNGU3OWZk
N2RlNTlmMWIyODk5MDkyYzFhODRjZTY4YzhlYmM2OGY5Mwo+Cj4gIGxpYi9zYmkvc2JpX2RidHIu
YyB8IDE0ICsrKysrKysrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX2RidHIuYyBiL2xp
Yi9zYmkvc2JpX2RidHIuYwo+IGluZGV4IDAxMDQ3OTYuLjQxZDVlNmYgMTAwNjQ0Cj4gLS0tIGEv
bGliL3NiaS9zYmlfZGJ0ci5jCj4gKysrIGIvbGliL3NiaS9zYmlfZGJ0ci5jCj4gQEAgLTI2Myw2
ICsyNjMsNyBAQCBpbnQgc2JpX2RidHJfc2V0dXBfc2htZW0oY29uc3Qgc3RydWN0IHNiaV9kb21h
aW4gKmRvbSwgdW5zaWduZWQgbG9uZyBzbW9kZSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
dW5zaWduZWQgbG9uZyBzaG1lbV9waHlzX2xvLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICB1
bnNpZ25lZCBsb25nIHNobWVtX3BoeXNfaGkpCj4gIHsKPiArICAgICAgIHVuc2lnbmVkIGxvbmcg
c2htZW1fYWRkciwgc2htZW1fc2l6ZTsKPiAgICAgICAgIHN0cnVjdCBzYmlfZGJ0cl9oYXJ0X3Ry
aWdnZXJzX3N0YXRlICpoYXJ0X3N0YXRlOwo+Cj4gICAgICAgICBpZiAoZG9tICYmICFzYmlfZG9t
YWluX2lzX2Fzc2lnbmVkX2hhcnQoZG9tLCBjdXJyZW50X2hhcnRpbmRleCgpKSkgewo+IEBAIC0z
MDQsOSArMzA1LDEzIEBAIGludCBzYmlfZGJ0cl9zZXR1cF9zaG1lbShjb25zdCBzdHJ1Y3Qgc2Jp
X2RvbWFpbiAqZG9tLCB1bnNpZ25lZCBsb25nIHNtb2RlLAo+ICAgICAgICAgaWYgKHNobWVtX3Bo
eXNfaGkpCj4gICAgICAgICAgICAgICAgIHJldHVybiBTQklfRUlOVkFMSURfQUREUjsKPgo+IC0g
ICAgICAgaWYgKGRvbSAmJiAhc2JpX2RvbWFpbl9jaGVja19hZGRyKGRvbSwKPiAtICAgICAgICAg
ICAgICAgICBEQlRSX1NITUVNX01BS0VfUEhZUyhzaG1lbV9waHlzX2hpLCBzaG1lbV9waHlzX2xv
KSwgc21vZGUsCj4gLSAgICAgICAgICAgICAgICAgU0JJX0RPTUFJTl9SRUFEIHwgU0JJX0RPTUFJ
Tl9XUklURSkpCj4gKyAgICAgICBzaG1lbV9hZGRyID0gREJUUl9TSE1FTV9NQUtFX1BIWVMoc2ht
ZW1fcGh5c19oaSwgc2htZW1fcGh5c19sbyk7Cj4gKyAgICAgICBzaG1lbV9zaXplID0gaGFydF9z
dGF0ZS0+dG90YWxfdHJpZ3MgKgo+ICsgICAgICAgICAgICAgICAgICAgIHNpemVvZih1bmlvbiBz
YmlfZGJ0cl9zaG1lbV9lbnRyeSk7Cj4gKyAgICAgICBpZiAoZG9tICYmICFzYmlfZG9tYWluX2No
ZWNrX2FkZHJfcmFuZ2UoZG9tLCBzaG1lbV9hZGRyLCBzaG1lbV9zaXplLAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNtb2RlLAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNCSV9ET01BSU5fUkVBRCB8Cj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU0JJX0RPTUFJ
Tl9XUklURSkpCj4gICAgICAgICAgICAgICAgIHJldHVybiBTQklfRVJSX0lOVkFMSURfQUREUkVT
UzsKPgo+ICAgICAgICAgaGFydF9zdGF0ZS0+c2htZW0ucGh5c19sbyA9IHNobWVtX3BoeXNfbG87
Cj4gQEAgLTYxOSw2ICs2MjQsOSBAQCBpbnQgc2JpX2RidHJfaW5zdGFsbF90cmlnKHVuc2lnbmVk
IGxvbmcgc21vZGUsCj4gICAgICAgICBpZiAoc2JpX2RidHJfc2htZW1fZGlzYWJsZWQoaHMpKQo+
ICAgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VSUl9OT19TSE1FTTsKPgo+ICsgICAgICAgaWYg
KHRyaWdfY291bnQgPj0gaHMtPnRvdGFsX3RyaWdzKQo+ICsgICAgICAgICAgICAgICByZXR1cm4g
U0JJX0VSUl9CQURfUkFOR0U7Cj4gKwoKTG9va3MgZ29vZCB0byBtZS4KClJldmlld2VkLWJ5OiBI
aW1hbnNodSBDaGF1aGFuIDxoaW1hbnNodS5jaGF1aGFuQG9zcy5xdWFsY29tbS5jb20+CgpIaW1h
bnNodQoKPiAgICAgICAgIHNobWVtX2Jhc2UgPSBoYXJ0X3NobWVtX2Jhc2UoaHMpOwo+ICAgICAg
ICAgc2JpX2hhcnRfcHJvdGVjdGlvbl9tYXBfcmFuZ2UoKHVuc2lnbmVkIGxvbmcpc2htZW1fYmFz
ZSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRyaWdfY291bnQgKiBz
aXplb2YoKmVudHJ5KSk7Cj4gLS0KPiAyLjUwLjEgKEFwcGxlIEdpdC0xNTUpCj4KCi0tIApvcGVu
c2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
