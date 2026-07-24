Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8253C531C9
	for <opensbi@archiver.kernel.org>; Fri, 24 Jul 2026 04:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pJ9GGJvITk4rGd3pEHdJ4mK34TcNKzcibuhr3a2Qf6A=; b=zZ999F9fZVdM9I
	VxLPaMCg3fAbXype1AqRM+9LkYXW1r3eaTtwmO8uNL8bflWaVDMkdpxHT8O3sfnJXdOllWMWiUAbF
	J8pTu9TZYCdwNABXeR7511uZlAwks4qnf9Q4mIOthEqZQkJa3dNWwfm++4JkoCJhIjiJhd5zxaw6A
	HR5mQUWG31qNDuXHU90bWWofc7tseAVuaqYL2qRpf5VF5J0et/8rFou6Vr2nh2wLecFuLvAaSe+6l
	egJBv6a378PNNCtDa6pYvm4DEi5s8dztLcHeTDCqv/o6KWN59pD++5hH3BYvWd/PebFTS2sunjQF6
	wYShkM52fhPjJVqxQ0Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn7ZX-0000000FTES-3XAU;
	Fri, 24 Jul 2026 04:31:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn7ZV-0000000FTE4-04w5
	for opensbi@lists.infradead.org;
	Fri, 24 Jul 2026 04:31:42 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O2iH5f1891453
	for <opensbi@lists.infradead.org>; Fri, 24 Jul 2026 04:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JLZjq2gOiG+Re5vUUjYX8S1GgYIGgtiBJ3Z2FP2CSfc=; b=maAYL2vbvL634zwN
	6TWEoxEddwOnodNj4FSybrMUYDxKz/lFUEnzqpuYKVmd36sEvLJ9Zk/gQgWtZgd+
	PaaBBcBUFQ/HQjC8VGpVFboIRdZxlgpV6bi5q3WFQhaH/1JgZs1bqjVGvxaEb6KS
	Ox8kIXG37y8gIybxZm6bagMXpyreYzqgHL9dWt/R5xAkN7s985Ix8g++mbHVGC9Q
	9W+FhANeq6SMGddxEMk5L3Luk22uxVftk9I9kuUWAFY0FIoXN//0aYIjJjlP/oQD
	syZv33b77QBlpRdJVvQZ1keItymLlhmvWcU4pEei/ivs+vymG19S/MkpUbmX+8yc
	sajhig==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkp5vjedk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Fri, 24 Jul 2026 04:31:39 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4ab4dd46ddeso216686b6e.3
        for <opensbi@lists.infradead.org>; Thu, 23 Jul 2026 21:31:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784867498; cv=none;
        d=google.com; s=arc-20260327;
        b=owNN0gcO5OrYvFpDJ4AupSNQ4j/Qh1BxfNELooG2V1fONKDLSW/cZxHJHasjN9JQMD
         V2kcAz+fNZWI4DMJqfgh6RCDMbpygl+wYCLw6/VFrQ0gO5pVFwEBdoraxOf3/UTjarrd
         rfQV8Dr9EwR/uRSg/nLtAS2M4tWTLt+qU2uC9ZkQ29twcbBeLPgWSz4O4mUfYY300Udy
         oqLmcCKNCcNk6lPv5u+utiUGYN7E9OOnNee5GbeJPvmvOl/ObzjCWI7rrDsWrBA0vKfW
         gPsTzcayxRd08xLXkfP1MnPXF7Ww4Y5tSv74he3t1eqrKdbBURAvCkIJaQdc9+y7HAeu
         C/DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JLZjq2gOiG+Re5vUUjYX8S1GgYIGgtiBJ3Z2FP2CSfc=;
        fh=MdmvXSUFENyCa9IM0o2OrD48qc7mts4Xf6MuVA5kyZ4=;
        b=GhGOGTmO0KNICVbIeM14VQL/Sjo0TaCFPGfSKhdAvBdH25ZySHoKJtm1DjTp2qSApu
         Dsy0mlPxtCoYluvMopXqpFB7DttTCt5iguWjNEfA0BAvgoaNFW2seQyFlEW0vfHgB4aS
         4jiiyM0gViNimBljwRrZuCXbB7MuPA321k6YyT1HBtnMZksdCfedr7VHpAGvJHFG++1Q
         F2OH/PwmpvkpZwTL+8qcJQ+YRlgAxDDOCGMpha0N/Ce34USlATtqeOlVvdV2s+VVGMFZ
         yj21R4QSstwExAMPt88IV9znVlc8XctOeR//u1s4yReeOtUScCnE6Pl+WqZJRJKaFgFp
         PpcA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784867498; x=1785472298; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JLZjq2gOiG+Re5vUUjYX8S1GgYIGgtiBJ3Z2FP2CSfc=;
        b=Jsjqsl+yJWMyX8fgGgY3xQnhP4gmRci9y3ps3lygZzZ1ndCWFFDrVzp/XKJ0r2j2d0
         32BzYoQjCrP9CNZBHBiwbKiEGD8bOEt1khES2OZ+rqISGbbsBc4b+ow4fMe4osUfLO0a
         4jHvtIJDB62ZWGlSdk59WFEqZd1ceuE3dePIFl4HYFUMJ8gHx5KjUsyoxbc7Md9aHKKN
         UgwksgwBbp35x22lBcuncMAzZTWZd1BIQ/xVechpv0OxE/OR9psGcS3VVVrSQXto8l28
         vSyKFD4BVyfCE0EVK2ib7BTV5wzqcvmb1Ytm286VTtWIvfrulscc72oWLmobyCWwM/rL
         HlrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784867498; x=1785472298;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JLZjq2gOiG+Re5vUUjYX8S1GgYIGgtiBJ3Z2FP2CSfc=;
        b=IPitSN5qwPYqOuT3b4yheqAWcgPUX/GFFibKeBk0KnFPrBBEkdSYGgW1kauom9urjG
         CfqflGa+4/1LzrT85tRiF8cx5XXiT2ibJCAgdlKdZo2KlJ8XAc8NOTYEDxDAeh9KMFr1
         setDh7k8MJ4q2D1zzpDc59hHzEZUTUWm9f8sOHWl0FH75ez5DVJ6RITlAiXDt8CDdywI
         Rf0axX43jzbD0Dh4ZuD3dMmQ90ilJ2UyjjgDPk6bc5JuIMvdV/3BVADmZCv2O6WR5ddK
         cuWwEkTQYTduI4bAzVeUIfO14WZF3ecBbePbF0HaMAhlOiS2j5dfHlF1DaSc4MAaLU5f
         i1Zw==
X-Gm-Message-State: AOJu0Yw/OBXO+zy05oB61C1LXefIguR6FfV98xm/sB76YslWWmxKD5t4
	bp2qPlvozEOTAsfobnpVmk5c73J10W7fyxTNJBONwCH57J3hQ/au2fHoFMGUJgJQCa55dkTia+v
	6eF3x2TD5ZO/VZr4/qasSewpFW/7hR5rfvTEqVDRDI3QqQcYpQ//jh67W+W/25ULkTzg/IJHPjk
	LGnAgvLmjxrThqCdTMkmcjbOjxc/2fRktNU00WNPaR0qCS5uuAesI=
X-Gm-Gg: AR+sD12wz1WHJp0LrZoKFh7gPL9nVak0mPGxZ4SrT1BXEG/uYwkAuMba0fHXJvN1YxH
	5Pou5p2tl3PfibNYcy9yhZuVlq1mop+scd6mXonkd2HUiX8gLHZA7Zq0iVCRsW3SqO0i4Tnyz0F
	+ZhOJ5vkdQzegJ6XZujxdcoeuuE9fQba6mp02GYqqVXdwUCZEwlNObmPrn2Dw=
X-Received: by 2002:a05:6808:1b12:b0:4a3:ec7e:8c59 with SMTP id 5614622812f47-4ab3585341amr2520147b6e.40.1784867498258;
        Thu, 23 Jul 2026 21:31:38 -0700 (PDT)
X-Received: by 2002:a05:6808:1b12:b0:4a3:ec7e:8c59 with SMTP id
 5614622812f47-4ab3585341amr2520138b6e.40.1784867497903; Thu, 23 Jul 2026
 21:31:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260722033455.2658178-1-rahul.pathak@oss.qualcomm.com> <20260722033455.2658178-2-rahul.pathak@oss.qualcomm.com>
In-Reply-To: <20260722033455.2658178-2-rahul.pathak@oss.qualcomm.com>
From: Ranbir Singh <ranbir.singh@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 10:01:26 +0530
X-Gm-Features: AUfX_mwjmaxQ66QETEyQVQgPEdFDCyehdBz3Ju3keiVRTIRoonEm1IGvupx6cfE
Message-ID: <CAPPZMLEKB_tj4eXBPjc3nMWX67c0UHesTKROPjV3ih3L=aSp8w@mail.gmail.com>
Subject: Re: [RFC PATCH 1/5] riscv: Add Smsdid and Smmpt hart extensions
To: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, rahul@summations.net
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDAzOCBTYWx0ZWRfX1y5YadJxuZl+
 ncopfkjUlNfGAa7YyYOvDCl0y39OEqrkSTW09vZ4PYCSqVZSnlz64qGxOjTWvKVhBoh6470sKq1
 Mb7fuMHtry34VmwwtnMSsOCRNsk05bU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDAzOCBTYWx0ZWRfX+1ym5rTiBBQK
 RjMzU6KrqDXWkLGNIC2RW9/S+a+UDKv+xPM2Yp04/tXukiLTSzk91iyng9T/eHRFednhIdWRAnc
 McAXbsF42T88NpeP4TiFQi5ZaOBYd/R6rDn32dIwbY3Y1JuzE1GlP8muibKj2XxprFPg643pPK0
 z6PISDhDlX5t1KrBT9jvpZOGs2H6YtOxmX4lSMxOWSFwo7g4TODqnwfFwKUCA9tWswSJ574NTk6
 rkI6H81ccCcmecXlDjlMha4z7U6Py+LSkDn8mUOsxKM8N+QSqQSi6GJFxIio3yRahpfNFiv/9KZ
 ojMBBj5bdT1mgm2Uu8Q2BtxptqmHUHQM83FltcsKxRERXmoMhj+coQVyIuGUTQI6ev0t6UlRdM7
 I3QITXvT1WkE+7f4k7nYwBBZFVyIDjoTVJ5cu2pA45O5JUJ+0LvwFufvc9FYLYyKjVNfwc9RJR5
 2rQ7UHPNEW97um+u1Rg==
X-Authority-Analysis: v=2.4 cv=Z9Dc2nRA c=1 sm=1 tr=0 ts=6a62eaab cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=rMjfrZy8gvDLKKaNkeoA:9 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: c8Ee7S9Zmntc_PsIw-CvYWKrGkyGP1hA
X-Proofpoint-ORIG-GUID: c8Ee7S9Zmntc_PsIw-CvYWKrGkyGP1hA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_07,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_213141_187479_45DE93C4 
X-CRM114-Status: GOOD (  18.27  )
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

T24gV2VkLCBKdWwgMjIsIDIwMjYgYXQgOTowNuKAr0FNIFJhaHVsIFBhdGhhawo8cmFodWwucGF0
aGFrQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gQWRkIGhhcnQgZXh0ZW5zaW9uIGlkZW50
aWZpZXJzIGZvciB0aGUgUklTQy1WIFNtc2RpZCAoc3VwZXJ2aXNvcgo+IGRvbWFpbiBJRCkgYW5k
IFNtbXB0IChzdXBlcnZpc29yIGRvbWFpbiBtZW1vcnkgcHJvdGVjdGlvbikgZXh0ZW5zaW9ucy4K
Pgo+IFNpZ25lZC1vZmYtYnk6IFJhaHVsIFBhdGhhayA8cmFodWwucGF0aGFrQG9zcy5xdWFsY29t
bS5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvc2JpL3NiaV9oYXJ0LmggfCA1ICsrKystCj4gIGxpYi9z
Ymkvc2JpX2hhcnQuYyAgICAgfCAyICsrCj4gIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zYmkvc2JpX2hhcnQu
aCBiL2luY2x1ZGUvc2JpL3NiaV9oYXJ0LmgKPiBpbmRleCA1NDMzOTNiYi4uMzhhYWNkNzAgMTAw
NjQ0Cj4gLS0tIGEvaW5jbHVkZS9zYmkvc2JpX2hhcnQuaAo+ICsrKyBiL2luY2x1ZGUvc2JpL3Ni
aV9oYXJ0LmgKPiBAQCAtOTUsOCArOTUsMTEgQEAgZW51bSBzYmlfaGFydF9leHRlbnNpb25zIHsK
PiAgICAgICAgIFNCSV9IQVJUX0VYVF9GLAo+ICAgICAgICAgLyoqIEhhcnQgaGFzIEQgZXh0ZW5z
aW9uICovCj4gICAgICAgICBTQklfSEFSVF9FWFRfRCwKPiArICAgICAgIC8qKiBIYXJ0IGhhcyBT
TU1UVCAtIFNNU0RJRCBleHRlbnNpb24gKi8KPiArICAgICAgIFNCSV9IQVJUX0VYVF9TTVNESUQs
Cj4gKyAgICAgICAvKiogSGFydCBoYXMgU01NVFQgLSBTTU1QVCBleHRlbnNpb24gKi8KPiArICAg
ICAgIFNCSV9IQVJUX0VYVF9TTU1QVCwKPgo+IC0gICAgICAgLyoqIE1heGltdW0gaW5kZXggb2Yg
SGFydCBleHRlbnNpb24gKi8KClRoaXMgc2VlbXMgYW4gdW5kZXNpcmVkIHJlbW92YWwgYW5kIHNo
b3VsZCBiZSByZXRhaW5lZC4KCj4gICAgICAgICBTQklfSEFSVF9FWFRfTUFYLAo+ICB9Owo+Cj4g
ZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX2hhcnQuYyBiL2xpYi9zYmkvc2JpX2hhcnQuYwo+IGlu
ZGV4IGJlZTg4NTU3Li40MjYxZmVhOCAxMDA2NDQKPiAtLS0gYS9saWIvc2JpL3NiaV9oYXJ0LmMK
PiArKysgYi9saWIvc2JpL3NiaV9oYXJ0LmMKPiBAQCAtMzYwLDYgKzM2MCw4IEBAIGNvbnN0IHN0
cnVjdCBzYmlfaGFydF9leHRfZGF0YSBzYmlfaGFydF9leHRbXSA9IHsKPiAgICAgICAgIF9fU0JJ
X0hBUlRfRVhUX0RBVEEodiwgU0JJX0hBUlRfRVhUX1YpLAo+ICAgICAgICAgX19TQklfSEFSVF9F
WFRfREFUQShmLCBTQklfSEFSVF9FWFRfRiksCj4gICAgICAgICBfX1NCSV9IQVJUX0VYVF9EQVRB
KGQsIFNCSV9IQVJUX0VYVF9EKSwKPiArICAgICAgIF9fU0JJX0hBUlRfRVhUX0RBVEEoc21zZGlk
LCBTQklfSEFSVF9FWFRfU01TRElEKSwKPiArICAgICAgIF9fU0JJX0hBUlRfRVhUX0RBVEEoc21t
cHQsICBTQklfSEFSVF9FWFRfU01NUFQpLAo+ICB9Owo+Cj4gIF9TdGF0aWNfYXNzZXJ0KFNCSV9I
QVJUX0VYVF9NQVggPT0gYXJyYXlfc2l6ZShzYmlfaGFydF9leHQpLAo+IC0tCj4gMi41MS4wCj4K
Pgo+IC0tCj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5v
cmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
Ck90aGVyd2lzZSwgTEdUTQoKUmV2aWV3ZWQtYnk6IHJhbmJpci5zaW5naEBvc3MucXVhbGNvbW0u
Y29tCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
