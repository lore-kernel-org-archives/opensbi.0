Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E586AC5DF97
	for <opensbi@archiver.kernel.org>; Sat, 22 Aug 2026 12:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zWCY82Zvs6zYb2RvtxfLWnG2ZS/8VA9QAscrE7+06nA=; b=g+gpMi+ZfaTGo9
	Ievf613JdAlTHdxNakc4GeOJTlMZRYsekA5kpvmyXCRCkh9N9bliQ2Bw7Hu+4WxSldCeU4lpJqrKe
	fdOk0bwdIN5fr6RyD5EUQfyoKpTbxVsJcUBVo6t2K5fYYkTYC9Pl0z9WP0CljgwEXOGphLqhOy+sH
	8E8pFmDinF4W0OYTlE/l/YmlUX2HDGasvFWTGNQOkLRguqMIh6QHbmyGaM5lbQg2dympV1fNheO5J
	MfqUIqXGZhNlwM1yUV3dvgb6NUiB5GmuLpzqqgUGu9Sk4Wn6gMJKZXyqroPUUgA0X5N/lraP63SCQ
	QkNQ1Wsi12Rxoxyjaf1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxkgd-0000000EVbm-18fX;
	Sat, 22 Aug 2026 12:18:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxkga-0000000EVbK-3Yh5
	for opensbi@lists.infradead.org;
	Sat, 22 Aug 2026 12:18:58 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67MB7XHE639099
	for <opensbi@lists.infradead.org>; Sat, 22 Aug 2026 12:18:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sUP6hz9zBavinrzr1s+zFosmErOaBOuT109WkPkYRGI=; b=EebQSg/f3xrjN4CJ
	gi0XjB3EiWar8dKONxg3yPeJwKr0IGXy3KBRLhOZQtfGOTGtwHRmnk+jwBjGVMdX
	NjS1uoSna2t7cCwFwv3dg2VT54bqha/hyRLgknm4l7dwl625J3VfGsrAV+gswnLq
	WRmv5T5ZKSl9A9QE4+YU3q/TJ9QTsg7bnhfcBHXkaEcIp4lMhSD2BdCEE6C3AhI9
	bbbhepplVzN5wmhNpb99+t8GIeHiouvQRrjVJU+NLz8nvIPH48SLXnaE3bFdPF64
	h+tDSsg9MDgRb0zGzwStmPBM9JfjAUYq6Wgv3Ae/Ja0x9PLK/RmnhPCNkslTh5c4
	bSJMPA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g7456s5x9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Sat, 22 Aug 2026 12:18:53 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-81e735bcceaso35782817b3.3
        for <opensbi@lists.infradead.org>; Sat, 22 Aug 2026 05:18:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787401133; cv=none;
        d=google.com; s=arc-20260327;
        b=h5b2iuGzQEs9YR6TjRShOUCR1F4w4ehcmmqPIOQtbp7FHWfXL/6pLOyoDgzALUuLpC
         o1YxTOmUMtdf4BwjLud+vUPenBCvrUyfTxZUr3v3N87RpE/72RkbJaA6huPVJKIk88Wy
         unEZNZp2ePLxSuhsxZBhMhDCagwMpOQBdy9ptuJBgNdnnlESTBDz0cJetyJ64v+eus/s
         4Z3xR1xSh1ezBx2ysQDktLwwYQGSpLRLWrbmMuINaYs8IVnDS4ZqNW5niKHflAttRIKC
         PtqA/TuMA4JroUsk96A182qQU7qpIPyKpekh7u6m704jsIqHsgJpt0WNLEETQzna0IsD
         TI5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sUP6hz9zBavinrzr1s+zFosmErOaBOuT109WkPkYRGI=;
        fh=5ObbZD5JJYHHbJ02THnimRO5ZQ7z+TpktoZJaqsE1yg=;
        b=nTr50mDPDHkebnWiwsvDVlBH5rbgOY3UNj9atsJ41lfTKXoBWLi/zYYp1j/GMLhBEZ
         UD0C5gcEqB7wmBTCCy9toRkW4P4pHlaqf/M7bASIGf8K0JUVW8k77QDAIRO3CQIB/s4d
         OE+s/bYrGBihPC2y1059RsX4mJ0LARCLeVf/18ATAd5aT3M/E40qAQa5onesBZQMlpcN
         U8/87Fuk9VuZtwMPGAc8prw+3onntBR35qO83kPXlSyM+8NaNP6qiyGwqNpqL4321Q9i
         X+pjhyc5lLQgeUvW+LYf5vhA5fZtjPIb6pBowpFau6nBQl4ktGm71TkrX5KAW6kza+Hg
         d4Dg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787401133; x=1788005933; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sUP6hz9zBavinrzr1s+zFosmErOaBOuT109WkPkYRGI=;
        b=kDM+sRF7+NQFqOQIbbN+PtgZfw2ZpaV9v8aacS1o6tigN6XAvUOvWtqJh1ltxHY4YD
         GDHWdc51ze19RnTEoS9/FcblqHxkj1TiLe/kbBqgHCOLm3n/NnjZqoJM6++CBQgOtZBz
         YU9AXbwCFE7HUJro/qdXTmP6P/DBR9aN4ZEnVMywpSOV3TB3fSZvCLchtbwr3PfeGpCE
         pzPZdXEpzUY0RmOMk1IplDY/oV8oDhkwsQco2N30RmDWlpglWwNsx5RJK27JGo0U3StR
         btdVpCq+S1ysQaBXYuDcsbtEBysgmOEwakHCgx3CLnCAWiPEz95uWD4phQc5M7WR8Fv8
         PpIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787401133; x=1788005933;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sUP6hz9zBavinrzr1s+zFosmErOaBOuT109WkPkYRGI=;
        b=mTMQGBlfJyosYvj7sAtB4MPL3VfahmXFykT4bBVfB19S64uWx0ycc/M4zeMG+rgokG
         Pn6vNe2LVLnn/Yp+f/4CxqVvEQ0ft7rCgm/ioP2kva9Gn2FdAUE5QSSEyUrFQ0bpc+Ms
         aZxjLThbevwacFa2LrREdVkgsUIYQftbAMFw7RK0r0LJ3BxT4hmPnVomjNLm+rSdZHot
         hCrrQnHGFsaao4v0NJLDtsHuNf4pLjWbfhqASbBj8ioNIwG7z1C6EsBylUguzQUCCpN0
         fBH5dsGMLT3aS2YhHJoORlP0stHRVIqOUjFWFhGx/khyoMZKY9eKQ9t14wGYtmiywq1+
         /rdA==
X-Gm-Message-State: AFuF++nByoZWBk0SeRnQWEkrXL2ixO4ATM5v8xy4IG36TSyxf8DoeLtb
	KpVGDaNAsNBHmirVYBSn46ABMoDjfB3v0X014bgvYqLBDm2v26Aw0CY171tKM1a6lnQllEIoXT2
	+ZObWJVXN0S3CBlgqcmceO6V0gHHYfMBaiMDX7S3XRzAvHK8Xw1jTAcFAngIvoa4MWoMiO4aFpE
	V9EdDZFV5ASV8Dq5EQOAI+7plikSdGJDmISBnBMSoN
X-Gm-Gg: AR+sD138zO3m8zCBd18hlYKn4NAQWXzeOJkSQvhzn9s+Mr1OF8Wu1BIkV5t2F+s220n
	G4s1wK2Ze4aZpp/LVTr1RpY0OkrYPnsszbDI2ERe6pcL3nNWATKkjRp1MX7um2Ko+wqr9nOl1MU
	2DM3q6Nz/LlFH+SlEmA3XQHwPiblclzuPx7u0wml5rKZ+M19KSXWRNvqcIWHs=
X-Received: by 2002:a05:690c:3682:b0:7ba:f690:70be with SMTP id 00721157ae682-849f18a7e82mr48295317b3.7.1787401133423;
        Sat, 22 Aug 2026 05:18:53 -0700 (PDT)
X-Received: by 2002:a05:690c:3682:b0:7ba:f690:70be with SMTP id
 00721157ae682-849f18a7e82mr48295217b3.7.1787401132917; Sat, 22 Aug 2026
 05:18:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260727135605.465309-1-rahul.pathak@oss.qualcomm.com>
 <20260727135605.465309-3-rahul.pathak@oss.qualcomm.com> <CAAVgOk+MtstZjfP9+_xtQc9RAhuC1M7Tay9RfUQFkPWsNhRQWw@mail.gmail.com>
In-Reply-To: <CAAVgOk+MtstZjfP9+_xtQc9RAhuC1M7Tay9RfUQFkPWsNhRQWw@mail.gmail.com>
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Date: Sat, 22 Aug 2026 17:48:42 +0530
X-Gm-Features: AcwNN1UiTc8kE4TjaHucsZiJ7sP-uB_9oFPlfRQp9XlwS36IIx6GeLBEhIG4Pt4
Message-ID: <CAFR3w34PZq2jCg2vZcZKm8OY3jtSHkXgz0o+c5CTZw4tMm6PNA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/5] mpt: Add Smsdid and Smmpt supervisor domain core
To: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, rahul@summations.net
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIyMDEwMSBTYWx0ZWRfX3U1/TWL4mhUy
 wohvOgxakNBOdeAzx3w/pvTpwq2rE3ySKLLkeYj6U0cl60HtFNWRFAdAIOyCu/w/BcJ3kiv1RDw
 GOs/gdjacXbl6Dne79Fw5WXYNGxi1tk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIyMDEwMSBTYWx0ZWRfX8CdYF77fhhQT
 6IJJIJQ+f3GcTEoWWPhtaRy2UU+T0pW3IYF3Sg4mXC0RzC78JciMfLlPAbuMF1+wKsjXJkaV4ap
 7tAKDXjd9NcsWoFtlbsk2AR4++wZVantrLDK4CfwcEQENP+jeGnWgQ4QEEBtj+b6gz6N1Sn+5k/
 mwBF8Xmjf+gZSFc7pQ0E5a/8Y+qlA+mlJydcIMmZSWb4lJ75r0vE3jpmH6GNyVJnykGKwZIoWj+
 nRtUkbGuvxolpl5HIuw7+X+wTCk7PrtuBWIHqOzuzOswhgVOHKUfYVD/w+Qy2jIXDYjdRMZ03Hq
 JRxh6C0jM3mWJwUjFKVBShmQ5eR9rpir3dkd5J7cpRczNfSrIPe3U1U7HZz48yWgqsyR63qvdq7
 LaT2clAhEfeuLaanlWOHMiVE8HUa1PG15vC6jqlgPmo/rfYaV/0GF4/oO20UXir6WKff/FQvvSj
 QuslfmZqxKvFW5zAYNw==
X-Authority-Analysis: v=2.4 cv=RtL16imK c=1 sm=1 tr=0 ts=6a8993ae cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=wV_mV4Ws5_n727wU68IA:9
 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-ORIG-GUID: mnxJMMNsAHfX3isFLe-ofuPTdtnw754E
X-Proofpoint-GUID: mnxJMMNsAHfX3isFLe-ofuPTdtnw754E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-22_04,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608220101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_051857_029156_6060E709 
X-CRM114-Status: GOOD (  29.16  )
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

T24gRnJpLCBBdWcgMTQsIDIwMjYgYXQgMTE6NTjigK9QTSBQYXdhbmRlZXAgT3phCjxwYXdhbmRl
ZXAub3phQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBKdWwgMjcsIDIwMjYg
YXQgNjo1NuKAr0FNIFJhaHVsIFBhdGhhawo+IDxyYWh1bC5wYXRoYWtAb3NzLnF1YWxjb21tLmNv
bT4gd3JvdGU6Cj4gPgo+ID4gSW50cm9kdWNlIHRoZSBzdXBlcnZpc29yZCBvbWFpbiBtZW1vcnkt
cHJvdGVjdGlvbiAoU21tcHQpIHRhYmxlCj4gT3phOiB0eXBvOiAic3VwZXJ2aXNvcmQgb21haW4i
CgpSYWh1bDogU3VyZSwgd2lsbCB1cGRhdGUKCj4gPiBtYW5hZ2VtZW50IGNvcmUuIFRoaXMgYWRk
cyB0aGUgbW9kZSBhZ25vc3RpYyBjb3JlIGxheWVyIGFuZCB0aGUKPiA+IHBlciBtb2RlIHRhYmxl
IHdhbGtlcnMvYnVpbGRlci4KPiA+Cj4gPiBBZGQgZGVmaW5lcyBmb3IgdGhlIG1tcHQgQ1NSIGVu
Y29kaW5nLCBNUFRFIGJpdCBsYXlvdXQsIHBlcm1pc3Npb24gZmxhZ3MsCj4gPiBzdHJ1Y3R1cmVz
LCBmZW5jZSBoZWxwZXJzIGFuZCB0aGUgcHVibGljIGludGVyZmFjZXMuCj4gPgo+ID4gSXQgaW1w
bGVtZW50cyB0aGUgUlY2NCBzdXBwb3J0ZWQgbW9kZXMgKFNtbXB0NDMvNTIvNjQpIGFuZAo+ID4g
dGhlIFJWMzIgbW9kZSAoU21tcHQzNCksIGl0cyBNUFQgdGFibGUgc3VwcG9ydC4KPiA+Cj4gPiBB
bHNvIGltcGxlbWVudHMgbXB0IGNvcmUgd2hpY2ggaW50ZWdyYXRlcyBTbW1wdCB3aXRoIFNCSSBk
b21haW5zIGFuZAo+ID4gb3RoZXIgY29yZSBsYXllcnMuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTog
UmFodWwgUGF0aGFrIDxyYWh1bC5wYXRoYWtAb3NzLnF1YWxjb21tLmNvbT4KPiA+IC0tLQo+ID4g
IGluY2x1ZGUvc2JpL3NiaV9tcHQuaCAgfCAzMzQgKysrKysrKysrKysrKysKPiA+ICBsaWIvc2Jp
L29iamVjdHMubWsgICAgIHwgICAyICsKPiA+ICBsaWIvc2JpL3NiaV9tcHQuYyAgICAgIHwgOTI2
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgbGliL3NiaS9zYmlf
bXB0X21vZGUuYyB8IDk5NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Kwo+ID4gIDQgZmlsZXMgY2hhbmdlZCwgMjI1OSBpbnNlcnRpb25zKCspCj4gPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGluY2x1ZGUvc2JpL3NiaV9tcHQuaAo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBs
aWIvc2JpL3NiaV9tcHQuYwo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBsaWIvc2JpL3NiaV9tcHRf
bW9kZS5jCj4gPgo+ID4gKyAgICAgICByZXR1cm4geHdyOwo+ID4gK30KPiA+ICsKPiA+ICsvKgo+
ID4gKyAqIHNiaV9tcHRfZG9tYWluX2NyZWF0ZSgpOiBDcmVhdGUgYSBTdXBlcnZpc29yIERvbWFp
bgo+IE96YTogIkNyZWF0ZSBhIFN1cGVydmlzb3IgRG9tYWluIiA/ICBZb3UgcHJvYmFibHkgbWVh
bnQgIkNyZWF0ZSBhbiBtcHQgZG9tYWluIiAhCgpSYWh1bDogWWVzLCB3aWxsIGNoYW5nZQoKPgo+
ID4gKyAqLwo+ID4gK2ludCBzYmlfbXB0X2RvbWFpbl9jcmVhdGUoY29uc3Qgc3RydWN0IHNiaV9t
cHRfZG9tYWluX2NvbmZpZyAqY2ZnLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgdTMy
ICpvdXRfc2RpZCkKPiA+ICt7Cj4gPiArICAgICAgIGludCByYzsKPiA+ICsgICAgICAgdTMyIHNk
aWQsIGk7Cj4gPiArICAgICAgIHVuc2lnbmVkIGxvbmcgcm9vdF9wYTsKPiA+ICsgICAgICAgc3Ry
dWN0IHNiaV9tcHRfbW9kZSAqc2NoOwo+ID4gKyAgICAgICBzdHJ1Y3Qgc2JpX21wdF9kb21haW4g
KmRvbTsKPiA+ICsgICAgICAgY29uc3Qgc3RydWN0IHNiaV9kb21haW5fbWVtcmVnaW9uICptcjsK
PiA+ICsgICAgICAgc3RydWN0IHNiaV9tcHRfY3RybCAqY3RybCA9ICZtcHRfY3RybDsKPiA+ICsg
ICAgICAgdTggYmFzZV94d3IgPSBTQklfTVBUX1BFUk1fTk9ORTsKPiA+ICsKPiA+ICsgICAgICAg
aWYgKCFjdHJsLT5yZWFkeSkKPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VOT0RFVjsK
PiA+ICsKPiA+ICsgICAgICAgaWYgKGNmZy0+c2JpX2RvbSAmJiBjZmctPm5yZWdpb25zKSB7Cj4g
PiArICAgICAgICAgICAgICAgc2JpX3ByaW50Zigic2JpX21wdDogc2JpX2RvbSBhbmQgZXhwbGlj
aXQgcmVnaW9ucyBhcmUgbXV0dWFsbHkgZXhjbHVzaXZlXG4iKTsKPiA+ICsgICAgICAgICAgICAg
ICByZXR1cm4gU0JJX0VJTlZBTDsKPiA+ICsgICAgICAgfQo+ID4gKwo+ID4gKyAgICAgICAvKgo+
ID4gKyAgICAgICAgKiBzZGlkX2JpdG1hcCBlbXB0eSBtZWFucyBldmVyeSBhdmFpbGFibGUgU0RJ
RCBpcwo+ID4gKyAgICAgICAgKiBjdXJyZW50bHkgaW4gdXNlIGFuZCBubyBkb21haW4gY2FuIGJl
IGNyZWF0ZWQuCj4gPiArICAgICAgICAqLwo+ID4gKyAgICAgICBpZiAoYml0bWFwX2VtcHR5KGN0
cmwtPnNkaWRfYml0bWFwLCBjdHJsLT5tYXhfZG9tYWlucykpCj4gPiArICAgICAgICAgICAgICAg
cmV0dXJuIFNCSV9FTk9NRU07Cj4gPiArCj4gPiArICAgICAgIHNjaCA9IGN0cmwtPm1vZGU7Cj4g
PiArCj4gPiArICAgICAgIHJvb3RfcGEgPSBzYmlfbXB0X3Bvb2xfYWxsb2Moc2NoLT5yb290X3Rh
YmxlX3NpemUoKSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzY2gt
PnJvb3RfdGFibGVfYWxpZ24oKSk7Cj4gPiArICAgICAgIGlmICghcm9vdF9wYSkgewogICAgICAg
IHJ2NjRfd3JpdGVfbXB0ZShncnBfYmFzZSArIGkgKiBSVjY0X01QVEVfU0laRSwgbGVhZik7Cj4g
PiArfQo+ID4gKwo+ID4gKy8qCj4gPiArICogTVBUIHRhYmxlIGJlc3QtbGV2ZWwgc2VsZWN0aW9u
Cj4gPiArICoKPiA+ICsgKiBSZXR1cm5zIHRoZSBoaWdoZXN0IGxldmVsIGF0IHdoaWNoIHRoZSBy
YW5nZSBbcGEsIHBhK3NpemVdIGNhbiBiZQo+ID4gKyAqIGNvdmVyZWQgYnkgYSBzaW5nbGUgbGVh
ZiBNUFRFLiBMZXZlbCAwIGlzIGFsd2F5cyB2YWxpZCBiZWNhdXNlIHRoYXRzCj4gPiArICogdGhl
IGxhc3QgcmVzb3J0Lgo+ID4gKyAqLwo+ID4gK3N0YXRpYyB1MzIgcnY2NF9iZXN0X2xldmVsKHVu
c2lnbmVkIGxvbmcgcGEsIHVuc2lnbmVkIGxvbmcgc2l6ZSwKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgIHUzMiB0b3BfbGV2ZWwpCj4gPiArewo+ID4gKyAgICAgICB1MzIgbHZsOwo+ID4g
KyAgICAgICB1bnNpZ25lZCBsb25nIHJhbmdlOwo+IE96YTogbmVlZCB0byB2YWxpZGF0ZSA/PyBv
ciB0cnVzdCB0b3BfbGV2ZWwgaGVyID8KPiBpZiAoIXRvcF9sZXZlbCkgcmV0dXJuIDA7CgpSYWh1
bDogVGhpcyBpZiBjb25kaXRpb24gd2lsbCBiZSByZWR1bmRhbnQgc2luY2UgYmVsb3cgZm9yCmxv
b3Agd2lsbCBub3QgZW50ZXIgaWYgdG9wX2xldmVsID09IDAKCj4gPiArCj4gPiArICAgICAgIGZv
ciAobHZsID0gdG9wX2xldmVsOyBsdmwgPj0gMTsgbHZsLS0pIHsKPiA+ICsgICAgICAgICAgICAg
ICByYW5nZSA9IHJ2NjRfbXB0ZV9yYW5nZShsdmwpOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICAg
IGlmIChzaXplID49IHJhbmdlICYmIChwYSAmIChyYW5nZSAtIDEpKSA9PSAwKQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgcmV0dXJuIGx2bDsKPiA+ICsgICAgICAgfQo+ID4gKyAgICAgICBy
ZXR1cm4gMDsKPiA+ICt9Cj4gPiArCj4gPiArLyoKPiA+ICsgKiBHZW5lcmljIE4tbGV2ZWwgd2Fs
ayB3aXRoIGxhenkgdGFibGUgYWxsb2NhdGlvbgo+ID4gKyAqLwo+ID4gK3N0YXRpYyB1bnNpZ25l
ZCBsb25nIHJ2NjRfc3BsaXRfbGVhZih1bnNpZ25lZCBsb25nIHBhcmVudF9lcCkKPiA+ICt7Cj4g
PiArICAgICAgIHU2NCBwYXJlbnQgPSBydjY0X3JlYWRfbXB0ZShwYXJlbnRfZXApOwo+ID4gKyAg
ICAgICB1bnNpZ25lZCBsb25nIHN1YjsKPiA+ICsgICAgICAgdTMyIGosIHBnLCBzaDsKPiA+ICsg
ICAgICAgdTggeHdyOwo+ID4gKyAgICAgICB1NjQgY2hpbGQ7Cj4gPiArCj4gPiArICAgICAgIHN1
YiA9IHNiaV9tcHRfcG9vbF9hbGxvYyhSVjY0X1RBQkxFX1NJWkUsIFNCSV9NUFRfUEFHRV9TSVpF
KTsKPiA+ICsgICAgICAgaWYgKCFzdWIpCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4g
PiArCj4gPiArICAgICAgIGZvciAoaiA9IDA7IGogPCBSVjY0X0lOTkVSX0VOVFJJRVM7IGorKykg
ewo+ID4gKyAgICAgICAgICAgICAgIHNoID0gc2JpX21wdGVfeHdyX3NoaWZ0KGogPj4gNSk7Cj4g
T3phOiBjYW4gd2UgZGVmaW5lIDUgPwoKUmFodWw6IFN1cmUsIHdpbGwgZGVmaW5lIGEgbWFjcm8g
Zm9yIGl0Cgo+ID4gKyAgICAgICAgICAgICAgIHh3ciA9ICgoKHVuc2lnbmVkIGxvbmcpcGFyZW50
ID4+IHNoKSAmIFNCSV9NUFRFX1hXUl9NQVNLKTsKPiA+ICsgICAgICAgICAgICAgICBjaGlsZCA9
IFNCSV9NUFRFX1YgfCBTQklfTVBURV9MOyAvKiBOPTAgdW5pZm9ybSBsZWFmICovCj4gPiArCj4g
PiArICAgICAgICAgICAgICAgZm9yIChwZyA9IDA7IHBnIDwgUlY2NF9QQUdFU19QRVJfTVBURTsg
cGcrKykKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNoaWxkID0gc2JpX21wdGVfbGVhZl9z
ZXRfeHdyKGNoaWxkLCBwZywgeHdyKTsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgICBydjY0X3dy
aXRlX21wdGUoc3ViICsgaiAqIFJWNjRfTVBURV9TSVpFLCBjaGlsZCk7Cj4gPiArICAgICAgIH0K
PiA+ICsKPiA+ICsgICAgICAgLyogcGFyZW50IGxlYWYgLT4gbm9uLWxlYWYgcG9pbnRlciB0byBN
UFQgc3ViIHRhYmxlLiAqLwo+ID4gKyAgICAgICBydjY0X3dyaXRlX21wdGUocGFyZW50X2VwLCBz
YmlfbXB0ZV9ub25sZWFmKHN1YikpOwo+ID4gKwo+ID4gKyAgICAgICByZXR1cm4gc3ViOwo+ID4g
K30KPiA+ICsKPiA+ICsvKgo+ID4gKyAqIFdhbGsgYSBNUFQgdGFibGUgYW5kIHJldHVybiBNUFRF
IFBBIGFuZCBpdHMgc3VpdGFibGUgbGV2ZWwKPiA+ICsgKi8KPiA+ICtzdGF0aWMgdW5zaWduZWQg
bG9uZyBydjY0X3dhbGtfYWxsb2Moc3RydWN0IHNiaV9tcHRfZG9tYWluICpkb20sCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBwYSwKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHNpemUsCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTMyICpvdXRfbGV2ZWwsCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTMyIHRvcF9sZXZlbCkKPiA+
ICt7Cj4gPiArICAgICAgIHUzMiBsdmwsIGlkeDsKPiA+ICsgICAgICAgdTY0IG1wdGU7Cj4gPiAr
ICAgICAgIHVuc2lnbmVkIGxvbmcgZXAsIHN1YiwgbmV3X3BhOwo+ID4gKyAgICAgICBjb25zdCBz
dHJ1Y3Qgc2JpX21wdF9tb2RlICpzY2ggPSBkb20tPm1vZGU7Cj4gPiArICAgICAgIHVuc2lnbmVk
IGxvbmcgdGFibGVfcGEgPSBkb20tPnJvb3RfcGE7Cj4gPiArICAgICAgIHUzMiBiZXN0X2x2bCA9
IHJ2NjRfYmVzdF9sZXZlbChwYSwgc2l6ZSwgdG9wX2xldmVsKTsKPiA+ICsKPiA+ICsKPiA+ICsg
ICAgICAgZm9yIChsdmwgPSB0b3BfbGV2ZWw7IGx2bCA+PSAxOyBsdmwtLSkgewo+ID4gKyAgICAg
ICAgICAgICAgIGlkeCA9IHJ2NjRfdGFibGVfaWR4KHBhLCBsdmwsIHNjaCk7Cj4gPiArICAgICAg
ICAgICAgICAgZXAgPSBydjY0X21wdGVfcGEodGFibGVfcGEsIGlkeCk7Cj4gPiArICAgICAgICAg
ICAgICAgbXB0ZSA9IHJ2NjRfcmVhZF9tcHRlKGVwKTsKPiA+ICsKPiA+ICsgICAgICAgICAgICAg
ICBpZiAobXB0ZSAmIFNCSV9NUFRFX0wpIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGlm
IChsdmwgPiBiZXN0X2x2bCkgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
dWIgPSBydjY0X3NwbGl0X2xlYWYoZXApOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBpZiAoIXN1YikKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICByZXR1cm4gMDsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdGFi
bGVfcGEgPSBzdWI7Cj4gT3phOiBkbyB5b3UgbmVlZCB0byBkZWNyZW1lbnQgbHZsIGhlcmUgc2lu
Y2UgeW91IGFyZSBzcGxpdHRpbmcgPyAgZS5nLiBsdmwtLQoKUmFodWw6IGJlbG93IGNvbnRpbnVl
IG1ha2Ugc3VyZSB0aGF0IGx2bCBpcyBkZWNyZW1lbnRlZCBpbiBuZXh0IHBhc3Mgb2YgZm9yIGxv
b3AKRG8geW91IG1lYW4gSSBoYXZlIHRvIGRlY3JlbWVudCBsdmwgYWdhaW4gaGVyZSB0aG91Z2gg
ZHVlIHRvIGJlbG93IGNvbnRpbnVlLAppdCB3aWxsIGJlIGRlY3JlbWVudGVkIHR3aWNlPwoKPgo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgIH0KPiA+ICsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICpvdXRf
bGV2ZWwgPSBsdmw7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gZXA7Cj4gPiAr
ICAgICAgICAgICAgICAgfQo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgIGlmICghKG1wdGUgJiBT
QklfTVBURV9WKSkgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKGx2bCA8PSBiZXN0
X2x2bCkgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqb3V0X2xldmVsID0g
bHZsOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gZXA7Cj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICB9Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAvKiBB
bGxvY2F0ZSBpbm5lciB0YWJsZSAoYWx3YXlzIDRLaUIsIGFsbCBsZXZlbHMsIGFsbCBtb2Rlcykg
Ki8KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIG5ld19wYSA9IHNiaV9tcHRfcG9vbF9hbGxv
YyhSVjY0X1RBQkxFX1NJWkUsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgU0JJX01QVF9QQUdFX1NJWkUpOwo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgaWYgKCFuZXdfcGEpCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHJldHVybiAwOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcnY2NF93cml0ZV9t
cHRlKGVwLCAodTY0KXNiaV9tcHRlX25vbmxlYWYobmV3X3BhKSk7Cj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICB0YWJsZV9wYSA9IG5ld19wYTsKPiA+ICsgICAgICAgICAgICAgICB9Cj4gPiAr
ICAgICAgICAgICAgICAgZWxzZSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICB0YWJsZV9w
YSA9IHJ2NjRfbmV4dF90YWJsZV9wYShtcHRlKTsKPiA+ICsgICAgICAgICAgICAgICB9Cj4gPiAr
ICAgICAgIH0KPiA+ICsKPiA+ICsgICAgICAgKm91dF9sZXZlbCA9IDA7Cj4gPiArCj4gPiArICAg
ICAgIHJldHVybiBydjY0X21wdGVfcGEodGFibGVfcGEsIHJ2NjRfdGFibGVfaWR4KHBhLCAwLCBz
Y2gpKTsKPiA+ICt9Cj4gPiArCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vb3BlbnNiaQo=
