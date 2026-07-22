Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E39C44512
	for <opensbi@archiver.kernel.org>; Wed, 22 Jul 2026 06:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yvzw8hWVIQYlT/RZAkbvCaMziIu9Tnkl3BHX+Lsyi+U=; b=aMlcPx/kA7kYJF
	Nc5YZxHYgoTmyO4qZPaeZk8yVMNviHsHMAqbeYC1NDUpRddg1CxvKcZ+W+Y6v8zEgRu8bg3QSRQhG
	Qprzgbx79W6iXFa+vgA884TP47+/5sn5CcQJqRObYd4hSH6/2ZVN2cmungyUlCu3rGLuE4+pBSCjO
	GYNgbu11NKqDVO+jACiqSu3CzVxzJKdNzvUBpP5txQCImW80IY3Gmxpz8ZdC69To+YkuamHGflg8l
	9YpIHEv+famAA6I3CvAdwwE/OY0FM6P4zl9GZbUwC+PV4dvJvDql81GeY/HssHXQtMmXa/FlO/PtB
	Tab6YlJeahn9I9zxOGfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmQhl-0000000AzXs-30i7;
	Wed, 22 Jul 2026 06:45:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmQhi-0000000AzXR-0XXz
	for opensbi@lists.infradead.org;
	Wed, 22 Jul 2026 06:45:19 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53ZUQ3882926
	for <opensbi@lists.infradead.org>; Wed, 22 Jul 2026 06:45:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WH1huuTZieyUKPIQjL4pmrrsvOWKYcjwqhoomE+uZIc=; b=osNJra/WiSuOUQw5
	o3YDcP2C2euDdRUnbrqRQCP5U6qtr7AEkiSiU/tm+SSAqjoGjH2RM2MAPG0IVz/+
	GQrVjJsP/nUvYllL+n7NxBZcW/xCzkpW8bdHL9BW/cecMBTltD1FlAvJ0+q6VKd2
	B31AIsioUxGuplxiJCq3QW6eV9xJ+Om/41ePY7t4VUuCKW81ENSE5hcKrTwARrm4
	7+/m/YnDTRHc+0n7apEWX3FnmAIbsJLqfw3i3+700uX7HBf/ngu9Fg2fbMWFOPNx
	AAmEobIfzJVpOHyZ85TEKT6MEhsMvnJHii5zSLVz43ivjSs9SaupPXJfO404pIkh
	mXWzQA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjntn0pts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Wed, 22 Jul 2026 06:45:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cd01a14e81so177297085ad.1
        for <opensbi@lists.infradead.org>; Tue, 21 Jul 2026 23:45:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784702716; cv=none;
        d=google.com; s=arc-20260327;
        b=oeVMr0Mayq6XgyeBX6AFHFIen+dGqH0mZ9DP8Ugr7WHyGiOLRzN8wpuxt7ipC2UIZb
         qWySZ25+QOYz84FUBgVvRheeIrcESBTEw4UqZFVJhEy58vLwBqoND6gxClLFzG13HJuD
         8If7YXReGIWIrI3D4Hbiue2aBOqAdJqgA6UyJO+clClMHvsOO98Lk+zRCvBb5zhiK11D
         XfQiWD0grp9j0xX74VTbONjiS4A0VCyeFxE3ZB7o1KPQ1LB1UzTB8+RYo9sndcSi5mER
         YXAtxM/fZztdHrSRFDdLn/oaEWtxu3QmqBOiFNMVI6Ar5/bSLMRmWRHRydDiT7bDo73j
         Turw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WH1huuTZieyUKPIQjL4pmrrsvOWKYcjwqhoomE+uZIc=;
        fh=KrYJhzZvIgXYjgi9IqeDq7QDVTAAX0EvLn/l70df43w=;
        b=sYh4PR2MBGRUgjlmVS0VPsYZibZV7L479xFpjh8xF8iH148CsUXeKUyNH4L4X8yiBK
         /f8K+uqPtdGXDQDX7VbEZBalhane+uDQLJ0lmPsjfyTKk+Plnz5sj1GTauaIuEjzn5/K
         CZohS8qeDNYP4+VBo+9utpA+UQCYq2DG7rffzTA0B6G/YfIX9Wlhb9lEa3WKUm2+p77t
         szKUPZkHXMpCG09/H44CEqScPrKjC5oUJIMtM1Ak7ZPUQbrMEwEXTOjgHFl90v3kb3y3
         nMRWNLYjSusIS1Y/YUprNlbzyLojP44L2iv7mDc6/REPIJxqTQcEoWfbZaarqczikTow
         V8Ig==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784702716; x=1785307516; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WH1huuTZieyUKPIQjL4pmrrsvOWKYcjwqhoomE+uZIc=;
        b=HBulYHuTJ+9GkS7nVDZmLs4tEeRr3xBZ6+O2b166YQ30nkXDe8MCNNH8FM8maVOA1e
         HHVqjey7UfRtI3rf0WTO959Ka56soHuyWBtg65cn4E6cYZyw8aDXKnV/7oNcQuEs/d/P
         5PK4w0M8PyAiDYDBUAbN61celwm18z2TO7QaPb6/bnm3MgE4tWfOIRdctgzeqiYNA4if
         k6XdcskG4h9NfR7hVljDcPRK5hqIRkU/e2m2/LeDVrbxfk4cmopdBf9Qg+eyF2K9w5oI
         et2Ia48EMhIlL7TpZDT1ZyK2HRK7xM0kPP7tcysX4xdn6EZJ4sTfqNr4fEJseWMuBDji
         15dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784702716; x=1785307516;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WH1huuTZieyUKPIQjL4pmrrsvOWKYcjwqhoomE+uZIc=;
        b=P9QCaT4ApfXp88mKdxcBO8NmeHQAGb/7npigLmlEd5RuFkxZFJoq97RBcXopzcNm/y
         tst3ZQDaugNBnGYy/7cBnQSCqIPJZYvfRQv5IlzxLTDF2TBIkmBHoSXY/BmcQR5+JlrT
         uQD62iKCv/8JXnnqDGZevDhE0zo9Ea0LbjLYkCWs3CJpTm0VL4mJY0zpgJ2rRNUkHdkm
         iM7G15WQQQ3dD/z3GqC/9U1cfgew+dahn3VHFJCWoOnDD53r6nzJfcv7jhj1oHORHmRD
         VJKLzJt9dV68H84Xy6+zzBPSBZ0CL6l2WcDsaQIc/03kUkY3fNTlFFkI+6PkEdKs80P1
         YSdg==
X-Gm-Message-State: AOJu0Yx0sMFxvLDnpTehn4P9U6kBTKU2cogvYFtXciIYwtc0GulrRLJ1
	DfxSFY7Zr1jqa8VIg5sm/+1yDJBPZvKGARVgDoVqa5TNIBEMUJ63p8mvSjvgM2r7ddHWWMRTMGh
	5EgOgC+0Bl0/R5XHzEov0SVU68xqTuj9/NPzzwenEAroSIi+TwX3wYcgQPY/4EoY03VN1xpAv7g
	uLvpfXQisJ+aWhayVpXXBWPcww+CYZdQzI5NEFxy/8pADTWZitWXQ=
X-Gm-Gg: AR+sD12B9yd3goIQpTiMCeG1TU3i4G15J2Xx3MMqpqVA4UcZQ7GdFdX0XnXBlDm6R9s
	2phYIj2ijDDMCNcilljn/yKNhjXPn5sWwzj4umRp/ibtm7ahLubUvP2U3PfNPCJHHGlvd8A6pJI
	+bRFGeFuVPmB4ptyproath9S+3TJJPfhD+ugaKPFfrTHzBIChTeCiHgEhtKB8=
X-Received: by 2002:a17:902:d509:b0:2c9:cf62:6f61 with SMTP id d9443c01a7336-2cf348b264cmr233397965ad.17.1784702715868;
        Tue, 21 Jul 2026 23:45:15 -0700 (PDT)
X-Received: by 2002:a17:902:d509:b0:2c9:cf62:6f61 with SMTP id
 d9443c01a7336-2cf348b264cmr233397705ad.17.1784702715287; Tue, 21 Jul 2026
 23:45:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260721214833.687361-1-pawandeep.oza@oss.qualcomm.com>
In-Reply-To: <20260721214833.687361-1-pawandeep.oza@oss.qualcomm.com>
From: Anup Patel <anup.patel@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 12:15:03 +0530
X-Gm-Features: AUfX_mzeOd6-GkBeK0pzCoOd6aFg5dutRI6qOwIC3eP-pGtPXayd9f_D8Xy6mus
Message-ID: <CABBgwmuBunzno1a91wu3BkD24hxAP839EBe0A53ksiR-nYOP1Q@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] ISC-V AIA: APLIC and IMSIC irqchip framework integration
To: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org
X-Authority-Analysis: v=2.4 cv=AJsSZ1gA c=1 sm=1 tr=0 ts=6a6066fc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=6eBNWtDoqyEsE8X1PJIA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: 8eAeVC5NJecNcq61QpxWrt-3IM-HWjfR
X-Proofpoint-ORIG-GUID: 8eAeVC5NJecNcq61QpxWrt-3IM-HWjfR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfX9P4eHGbUXGz3
 /znGPWhcU/qNiuzh4jpbH87xvk3zzryjW2RyhuqDbFMk7iqc9eiGViytsZFOfNTohXdyvU0PY+h
 xr94Lw80giNUYQQgMCyBJvmg/H8UckA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfX7P+F5+7VP/mi
 OSlE1lI1fv86l4UfjGu2rLFit82EUUCsvWlU3q3fYjFAv5oMwlDXmsmMaVoIdnYI1XauzNKhmSM
 w3nKQkOcXNtgNzy47nWzMS1nFAmT229qLsZ9ZWrh3JAQeAqbVFYPrn0VxLMvNLUOHLXcvZg0UOz
 cNEukvf6usBCJf1v205CYJQi+i/447Ml/Qf6pVrGw8EsxXFf15pSo+lCyz+Nro4li73hoeoYZpQ
 MmUWgBgCCRWbF9kbakCwoJI4a89pC9MkgYEm1XIH1RmD9nPBPn0LanIW5FEnR0y0GZG6QxlMSVN
 VRe5IRXmO9YTpcZT7GWJKgxL69q2LtSOJo7okLnH7lE5xFpz8k3pgtOR8sv0J8YPdfmbAdvrQij
 rIR5UFlPFW+gz7Of8XcaUjbg22WkXFrvuF6HInKUDTqIa7PTe7eI7pwGzwK5/9yGrhwXT5hk7Mn
 u6YlsgeaTcA1zV4f0nA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_234518_286724_0B77F400 
X-CRM114-Status: GOOD (  25.33  )
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

T24gV2VkLCBKdWwgMjIsIDIwMjYgYXQgMzoxOeKAr0FNIFBhd2FuZGVlcCBPemEKPHBhd2FuZGVl
cC5vemFAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBPemEgUGF3YW5kZWVwIDxw
YXdhbmRlZXAub3phQG9zcy5xdWFsY29tbS5jb20+Cj4KPiBUaGlzIHNlcmllcyBpbnRlZ3JhdGVz
IHRoZSBSSVNDLVYgQWR2YW5jZWQgSW50ZXJydXB0IEFyY2hpdGVjdHVyZSAoQUlBKQo+IEFQTElD
IGFuZCBJTVNJQyBNLW1vZGUgZHJpdmVycyBpbnRvIHRoZSBPcGVuU0JJIHNiaV9pcnFjaGlwIGZy
YW1ld29yaywKPiByZXBsYWNpbmcgdGhlIHByZXZpb3VzIHN0YW5kYWxvbmUgZXhwZXJpbWVudGFs
IGRyaXZlciB3aXRoIGEgY29tcGxldGUKPiBjYWxsYmFjay1iYXNlZCBpbXBsZW1lbnRhdGlvbi4K
Pgo+IFRoZSBzZXJpZXMgYWRkcyBmdWxsIHN1cHBvcnQgZm9yOgo+Cj4gICAtIEFQTElDIERpcmVj
dCBNb2RlIChJREMpIGludGVycnVwdCBkZWxpdmVyeSB3aXRoIHBlci1oYXJ0IElEQwo+ICAgICBy
ZWdpc3RlciBtYW5hZ2VtZW50LCBwcmlvcml0eS1iYXNlZCByb3V0aW5nLCBhbmQgc291cmNlIGRl
bGVnYXRpb24KPiAgICAgdG8gUy1tb2RlIGNoaWxkIGRvbWFpbnMuCj4KPiAgIC0gQVBMSUMgTVNJ
IE1vZGUgZmFsbGJhY2sgd2hlcmUgSURDIHN0cnVjdHVyZXMgYXJlIGFic2VudCwgcm91dGluZwo+
ICAgICB3aXJlZCBpbnRlcnJ1cHRzIHRocm91Z2ggSU1TSUMgYnkgcHJvZ3JhbW1pbmcgQVBMSUMg
VEFSR0VUIHJlZ2lzdGVycwo+ICAgICB3aXRoIGhhcnQgaW5kZXgsIGd1ZXN0IGluZGV4LCBhbmQg
ZHluYW1pY2FsbHkgYWxsb2NhdGVkIEVJSURzLgo+Cj4gICAtIElNU0lDIGluc3RhbmNlLWJhc2Vk
IGlycWNoaXAgcmVnaXN0cmF0aW9uIHdpdGggcGVyLWhhcnQgaW50ZXJydXB0Cj4gICAgIGZpbGUg
bWFuYWdlbWVudCwgRUlFIENTUiBzdGF0ZSB0cmFja2luZywgd2FybS1ib290IHN0YXRlIHJlc3Rv
cmF0aW9uLAo+ICAgICBhbmQgTVNJIGNvbXBvc2l0aW9uIGZvciB1cHN0cmVhbSBBUExJQyBhZmZp
bml0eSByZXByb2dyYW1taW5nLgo+Cj4gICAtIEEgZGVjb3VwbGVkIGFyY2hpdGVjdHVyZSBiZXR3
ZWVuIEFQTElDIGFuZCBJTVNJQyBkcml2ZXJzIG1lZGlhdGVkCj4gICAgIGJ5IHRoZSBzYmlfaXJx
Y2hpcCBmcmFtZXdvcmsuIEFQTElDIHJlZ2lzdGVycyB3cml0ZV9tc2kgYW5kCj4gICAgIG1zaV9j
YWxsYmFjayBob29rczsgSU1TSUMgcmVnaXN0ZXJzIHRoZSBpcnFjaGlwIE1TSSBzaW5rLiBOZWl0
aGVyCj4gICAgIGRyaXZlciBkaXJlY3RseSByZWZlcmVuY2VzIHRoZSBvdGhlcidzIGRhdGEgc3Ry
dWN0dXJlcy4KPgo+ICAgLSBJUlEgZW5hYmxlIHN0YXRlIHRyYWNraW5nIGluIHRoZSBpcnFjaGlw
IGZyYW1ld29yayB2aWEgYSBuZXcKPiAgICAgaXJxX3N0YXRlIGZpZWxkIGFuZCBJUlFfRU5BQkxF
RCBmbGFnLCBleHBvc2VkIHRocm91Z2gKPiAgICAgc2JpX2lycWNoaXBfaXNfaXJxX2VuYWJsZWQo
KSBmb3Igd2FybS1ib290IEVJRSBDU1IgcmVzdG9yYXRpb24uCj4KPiAgIC0gQSBmaXggZm9yIHR3
byBhbGxvY2F0aW9uIGJ1Z3MgaW4gc2JpX2lycWNoaXBfcmVnaXN0ZXJfbXNpKCkgdGhhdAo+ICAg
ICBwcmV2ZW50ZWQgY29udGlndW91cyBFSUlEIGFsbG9jYXRpb24gd2hlbiByZXNlcnZlZCBoYW5k
bGVycyB3ZXJlCj4gICAgIGFscmVhZHkgcmVnaXN0ZXJlZC4KPgo+IERyaXZlciBpbml0aWFsaXph
dGlvbiBmb2xsb3dzIGhhcmR3YXJlIGRlcGVuZGVuY3kgb3JkZXJpbmc6Cj4KPiAgIElNU0lDIGNv
bGQgaW5pdCDihpIgQVBMSUMgY29sZCBpbml0Cj4KPiBUaGUgSU1TSUMgaXJxY2hpcCBtdXN0IGJl
IHJlZ2lzdGVyZWQgYmVmb3JlIEFQTElDIHNvIHRoYXQgQVBMSUMgTVNJCj4gbW9kZSBjYW4gcmVz
b2x2ZSB0aGUgcGFyZW50IGNoaXAgYnkgdW5pcXVlX2lkIHZpYQo+IHNiaV9pcnFjaGlwX2ZpbmRf
ZGV2aWNlKCkgZHVyaW5nIGh3aXJxX3NldHVwLgo+Cj4gQVBMSUMgRGlyZWN0IE1vZGUgYW5kIE1T
SSBNb2RlIGFyZSBtdXR1YWxseSBleGNsdXNpdmUgYW5kIHNlbGVjdGVkCj4gYXQgY29sZCBpbml0
IHRpbWUgYmFzZWQgb24gdGhlIHByZXNlbmNlIG9mIElEQyBzdHJ1Y3R1cmVzIChudW1faWRjKQo+
IGFuZCB0aGUgSU1TSUMgZ2VvbWV0cnkgKGhhc19tc2ljZmdfbW1vZGUpIHBhcnNlZCBmcm9tIHRo
ZSBEZXZpY2UgVHJlZS4KPgo+IFRlc3Rpbmcgd2FzIHBlcmZvcm1lZCBvbiBhIFFFTVUgUklTQy1W
IHBsYXRmb3JtIHdpdGggMTI4IGhhcnRzLCB0d28KPiBBUExJQyBkb21haW5zIChNLW1vZGUgYXQg
MHgxMDAxMDAwMCwgUy1tb2RlIGF0IDB4MTAwMTgwMDApLCBhbmQgdHdvCj4gSU1TSUMgaW5zdGFu
Y2VzIChIYXJ0IDAtMSBhdCAweDE5ZTAwMDAsIEhhcnQgMi0zIGF0IDB4MTlmMDAwMCkgd2l0aAo+
IDMxIHdpcmVkIGludGVycnVwdCBzb3VyY2VzLiBFbmQtdG8tZW5kIE0tbW9kZSBpbnRlcnJ1cHQg
ZGVsaXZlcnkgdmlhCj4gQVBMSUMgTVNJIG1vZGUgd2FzIHZlcmlmaWVkIHVzaW5nIGEgc29mdHdh
cmUgaW50ZXJydXB0IHRlc3QgY2xpZW50Cj4gZXhlcmNpc2luZyB0aGUgR0VOTVNJIHBhdGguCj4K
PiBDaGFuZ2VzIHNpbmNlIHYxOgo+IEFQTElDIE1TSSBEZWNvZGluZzoKPiBSZWZhY3RvcmVkIHRo
ZSBoYXJ0X2luZGV4IGRlcml2YXRpb24gbG9naWMgaW4gZGVyaXZlX2hhcnRfaW5kZXgoKQo+IHRv
IHVzZSBQYWdlIEZyYW1lIE51bWJlciAoUFBOKSBiYXNlZCBzaGlmdHMgYW5kIG1hc2tzLgo+Cj4g
Q2hhbmdlcyBzaW5jZSB2MjoKPiBBZGRlZCBTQklfRUFMUkVBRFkgZ3VhcmQgdG8gZmFpbCBpZiBo
d2lycSB3YXMgYWxyZWFkeSB1bm1hc2tlZAo+IGFwbGljX2h3aXJxX2VvaSBoYW5kbGVzIG9ubHkg
bXNpIG1vZGUgZm9yIGFwbGljCj4gYXBsaWNfcHJvY2Vzc19pcnEgbm93IHJlYWRzIEFQTElDX0lE
Q19DTEFJTUkKPgo+IENoYW5nZXMgc2luY2UgdjM6Cj4gcHJpbnQgZm9ybWF0dGluZyBjb3JyZWN0
ZWQKPiByZW1vdmVkIGFwbGljX21zaV9wdHJzW10gYW5kIGFkZGVkIHNiaV9pcnFjaGlwX2dldF9o
YW5kbGVyX3ByaXYgaGVscGVyCj4gcmVuYW1lZCBzYmlfaXJxY2hpcF9pc19pcnFfZW5hYmxlZCB0
byBzYmlfaXJxY2hpcF9pc19od2lycV9lbmFibGVkCj4KPiBDaGFuZ2VzIHNpbmNlIHY0Ogo+IC0t
LS0tLS0tLS0tLS0tLS0tCj4gKiBSZXBsYWNlZCBzYmlfaXJxY2hpcF9nZXRfaGFuZGxlcl9wcml2
KCkgd2l0aCBhIGdlbmVyaWMgcGVyLWh3aXJxCj4gICBwcml2YXRlIGRhdGEgQVBJLiBBZGRlZCAi
dm9pZCAqcHJpdiIgZmllbGQgdG8gc3RydWN0Cj4gICBzYmlfaXJxY2hpcF9od2lycV9kYXRhIGFu
ZCBpbnRyb2R1Y2VkIHNiaV9pcnFjaGlwX3NldF9od2lycV9wcml2KCkKPiAgIGFuZCBzYmlfaXJx
Y2hpcF9nZXRfaHdpcnFfcHJpdigpIHRvIHNldCBhbmQgcmV0cmlldmUgcGVyLWh3aXJxCj4gICBw
cml2YXRlIGRhdGEuIFRoZSBBUEkgaXMgbm8gbG9uZ2VyIHR5cGVkIHRvIHN0cnVjdCBhcGxpY19t
c2lfZGF0YQo+ICAgYW5kIGlzIG5vdyBmdWxseSBnZW5lcmljLgo+Cj4gKiBEcm9wcGVkIHBhcmVu
dF9pcnFfbWFwW10gZnJvbSBzdHJ1Y3QgYXBsaWNfZGF0YS4gVGhlIEVJSUQtdG8tc291cmNlCj4g
ICBtYXBwaW5nIGlzIG5vdyB0cmFja2VkIHZpYSB0aGUgcGVyLWh3aXJxIHByaXZhdGUgZGF0YS4g
QWRkZWQKPiAgIHBhcmVudF9od2lycSBmaWVsZCB0byBzdHJ1Y3QgYXBsaWNfbXNpX2RhdGEgdG8g
cmVjb3JkIHRoZSBJTVNJQwo+ICAgaHdpcnEgYWxsb2NhdGVkIGZvciBlYWNoIEFQTElDIHNvdXJj
ZS4gaHdpcnFfc2V0dXAgc3RvcmVzIHRoaXMgdmlhCj4gICBzYmlfaXJxY2hpcF9zZXRfaHdpcnFf
cHJpdigpIGFuZCBod2lycV9zZXRfYWZmaW5pdHkgcmV0cmlldmVzIGl0Cj4gICB2aWEgc2JpX2ly
cWNoaXBfZ2V0X2h3aXJxX3ByaXYoKS4KPgo+ICogRml4ZWQgQVBMSUMgTVNJLW1vZGUgRU9JIGZv
ciBsZXZlbC10cmlnZ2VyZWQgaW50ZXJydXB0cy4gUmVwbGFjZWQKPiAgIGFwbGljX2lycV9jbHJp
cCgpIHdpdGggYSB3cml0ZSB0byBTRVRJUE5VTSB0byByZS10cmlnZ2VyIHRoZQo+ICAgaW50ZXJy
dXB0IHBlbmRpbmcgc3RhdGUsIGFsaWduaW5nIHdpdGggdGhlIExpbnV4IEFQTElDIE1TSS1tb2Rl
Cj4gICBkcml2ZXIgYmVoYXZpb3VyIChpcnEtcmlzY3YtYXBsaWMtbXNpLmMsIGFwbGljX2lwaV9z
ZW5kX21hc2soKSkuCj4KPiAqIEZpeGVkIHRhYi9zcGFjZSBhbGlnbm1lbnQgaXNzdWVzIHRocm91
Z2hvdXQgYXBsaWMuYyBhbmQKPiAgIHNiaV9pcnFjaGlwLmMuCj4KPiAqIFJlcGxhY2VkIGFsbCBo
YXJkLWNvZGVkIGZ1bmN0aW9uIG5hbWUgc3RyaW5ncyBpbiBzYmlfcHJpbnRmKCkgY2FsbHMKPiAg
IHdpdGggJXMgYW5kIF9fZnVuY19fIGFjcm9zcyBib3RoIHRoZSBBUExJQyBhbmQgSU1TSUMgZHJp
dmVycy4KPgo+IFBhd2FuZGVlcCBPemEgKDYpOgo+ICAgbGliOiB1dGlscy9pcnFjaGlwL2FwbGlj
OiBpbXBsZW1lbnQgZGlyZWN0IG1vZGUgaXJxY2hpcCBjYWxsYmFja3MKPiAgIGxpYjogdXRpbHMv
aXJxY2hpcC9hcGxpYzogYWRkIE1TSSBtb2RlIHN1cHBvcnQgd2l0aCBJTVNJQyBwYXJlbnQKPiAg
ICAgbGlua2luZwo+ICAgbGliOiB1dGlscy9pcnFjaGlwL2ltc2ljOiBlbWJlZCBzYmlfaXJxY2hp
cF9kZXZpY2UgaW4gaW1zaWMgZGF0YQo+ICAgbGliOiB1dGlscy9pcnFjaGlwL2ltc2ljOm1pZ3Jh
dGUgdG8gaXJxY2hpcCBmcmFtZXdvcmsKPiAgIGxpYjogdXRpbHMvaXJxY2hpcC9pbXNpYzogdHJh
Y2sgSVJRIGVuYWJsZSBzdGF0ZSBhbmQgcmVzdG9yZSBFSUUgb24KPiAgICAgd2FybSBpbml0Cj4g
ICBsaWI6IHNiaV9pcnFjaGlwOiBmaXggTVNJIEVJSUQgZ2FwIGFuZCB0YWlsIGFsbG9jYXRpb24g
bG9naWMgaW4KPiAgICAgcmVnaXN0ZXJfbXNpCj4KPiAgaW5jbHVkZS9zYmkvc2JpX2lycWNoaXAu
aCAgICAgICAgIHwgIDEwICsKPiAgaW5jbHVkZS9zYmlfdXRpbHMvaXJxY2hpcC9hcGxpYy5oIHwg
ICAxICsKPiAgaW5jbHVkZS9zYmlfdXRpbHMvaXJxY2hpcC9pbXNpYy5oIHwgICAyICsKPiAgbGli
L3NiaS9zYmlfaXJxY2hpcC5jICAgICAgICAgICAgIHwgIDc0ICsrKy0KPiAgbGliL3V0aWxzL2Zk
dC9mZHRfaGVscGVyLmMgICAgICAgIHwgICAxICsKPiAgbGliL3V0aWxzL2lycWNoaXAvYXBsaWMu
YyAgICAgICAgIHwgNTYwICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLQo+ICBsaWIvdXRp
bHMvaXJxY2hpcC9pbXNpYy5jICAgICAgICAgfCAzMDggKysrKysrKysrKysrKy0tLQo+ICA3IGZp
bGVzIGNoYW5nZWQsIDg2MSBpbnNlcnRpb25zKCspLCA5NSBkZWxldGlvbnMoLSkKPgo+IC0tCj4g
Mi40My4wCj4KPgo+IC0tCj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L29wZW5zYmkKCkFwcGxpZWQgdGhpcyBzZXJpZXMgdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4K
ClRoYW5rcywKQW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29w
ZW5zYmkK
