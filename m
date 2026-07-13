Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BCFDC43458
	for <opensbi@archiver.kernel.org>; Mon, 13 Jul 2026 21:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UE8lS93wItx2mcJck4oZmwOpuQp4Gv7HstJ2Sc3zWIw=; b=k7kYs9YcJ3W9GD
	jJsfmaqNTmysUxl7QJEqEcMTlc6oONBdUMgYrDRQVkgDqD68qvaViEm+uTf7BcGRJQkIUdG4bRtNW
	YobPg3cqfwuip/N0JlIDi/GJNQ285O6erdIepheEMs5KB1OdZNUG1vtkD5SWWRY2a9lqsrjUUXwm2
	FJtjkCENiLFdu8lBBJWSVGDl3BO39gXtXZSWBtY+M4MVVk3nuO9v1HNPTKicIvMlYTw0PPKuPSOqS
	Z/ROBEbDCgzlOmQNAwELCcsYRwv3Z1D3UHoja1/ocoTHWpnPZqKzX0u/W+ZpHu3xryoVj38YOeTVj
	FSRnK0gzPPC7LdR9oWOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjOZw-0000000ATaE-1CXV;
	Mon, 13 Jul 2026 21:52:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjOZs-0000000ATZq-378n
	for opensbi@lists.infradead.org;
	Mon, 13 Jul 2026 21:52:42 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DJ9CA02448662
	for <opensbi@lists.infradead.org>; Mon, 13 Jul 2026 21:52:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	39CGZzMdsdybU97MS9az3HEy2LD/FimxWBvEaHphGaE=; b=Cw+W9TGf3+Frvfi6
	SwlroR1Qp2FhxBg2XCvi7eFiStY8EFulgK8J7/aq9MohdEh+R/CGrsldt8y1lvel
	Q6DzjJfhchYSiJXTtVtPJxWTsxGYbRwhocpivjW+egmyQN858fNT3FhJC8vfOCtP
	yRS4C2auboUp48ZzPxWbMNSxGuJt1/vLP0m7/s4T1wFBYxvkTQo2SW9tZb8r0ayg
	WBOwKYtE4Jz7Rf3Koe8wfRUwuDNb0q7j7UZxKubHwC3nd8uTvWwcMafqYUFxu5zm
	+6ZDAVriDV6EDWAWDbsX2BKTRDZfSkNkBRsmTnAu1WYWH2ndtJ+ENU8i9g2yPvHd
	9cEBKg==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd37x9621-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 13 Jul 2026 21:52:39 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4a43d32fa9fso841622b6e.2
        for <opensbi@lists.infradead.org>; Mon, 13 Jul 2026 14:52:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783979559; cv=none;
        d=google.com; s=arc-20260327;
        b=osFNhnNgVTpKYFKl8b7WaXhhJQ/ELaYuoibwbZN2E+9MI9y+AWjTKlI7UYybb02f9f
         FxufrxNslLXMykDuV5ek71j+YOqhmA90IOTxsQYMdiemMOtOIQ5/CG4bG14aLcToUAjo
         fjcjj3Axl1uuhpUl3HEcoETUwWiYVUvpMO27Li2jrmUA1O0WHvZC+LTiCz9XNJi/u93g
         rzdmKalEZozkxS6CleIJyqtULpfjWfJnfBpq5A4nwtoSqtuLR79Nm2/8TV/7WeX93MA9
         emHok/7ww3VGWv0a4PtxQJrysfBwTowQpL/NsVgoFNmT/JmAH3RsKYpW20Z2Z+MLBWeM
         00Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=39CGZzMdsdybU97MS9az3HEy2LD/FimxWBvEaHphGaE=;
        fh=cyWYA3kXN4M7205T7O+U3EeZKBOqXRScKUv8W0MgTLc=;
        b=Gnl8f2ozRxkabPDGotp7geN3nONM+k0P9N6exry1Tqc3ILh57bea9fyekgwcc2H30J
         nkvQqHNI8Hw7n6uxb514byLMYtkAVuilszEQap9iiibOYfuYz24Y61ux/kgh8BBMEzCv
         PHH6JbTYDu5NUT80GaQjHfO+T1c/WmGoNgyJ6qx17RGrLUzQC4AjqLUEXzLdynUNdzxh
         oAja2kWu2H3/BoxCYBsBuduZNkOD9+hN76rzvHH50mhq+0GicXpI3EettRvOUehURVkS
         EOqWlRfVSQ4kgwMI9iCxODnjUCTpWD8pkHN7Wmuk8wDjkbRIbMzCNpxjNGjl7eBQcwkz
         jkCg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783979559; x=1784584359; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=39CGZzMdsdybU97MS9az3HEy2LD/FimxWBvEaHphGaE=;
        b=LScPdZEmQWoWg2CPxSUbNUlq/e+d6R2SgsWhhbf5WdjwqNO5nkah4jKoHA8haAexYo
         sepaN1UIBUau42XhDBaRN1LrWZXOH/C/GtDS56n7OgZEBz2VM2XsAymGh2dOntLeyE0F
         kP8lnGyYT5OcP4MsDLuq7pItzMeI0c6XANkSWriKKP+EUF3KpfoyEYCIJiY+lZDMyVSK
         I7+ZHK1qCTr9wQ6lohbXilTxLoCNwf8PGZixjiQU9nywGoWVRH88bw9gGWxntgTV9bKX
         +FPZcqmEuge3Kyj4NQLydYtn9TtXt011WjTSRDozhL9u2Fhqbk/0Hc/9eMomiY4vjp09
         D7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783979559; x=1784584359;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=39CGZzMdsdybU97MS9az3HEy2LD/FimxWBvEaHphGaE=;
        b=Cd1ayHSisMqdnVwlxALuSMvUysw5auJ/McHGwfX8V7lwiClrnx5InZ95zozlnh1J5I
         qwAjoot5s9ZYipjhRCqSV38ttlYXxPUon5HZxV8Vgb4q0GDDqK6e6jHHx1pdJLq5uuei
         jr9Vq1yYMc/8Jjy3r7EJ/MVm4cztRm67HVSi8muapeAvhxbuP3D1mxckJKwR6c6HQ4Di
         FpKGdOx3gFw6197Xmrr3Ml7signwPFx8HKgLmRjSLLajwWpqSXGGJESjqg9qVi/RWw4/
         5WZyPPyKnvXwPVTXugF1LCSMGKfe5/u1mB6A43F3znVmO+tmCIqGLionciO60UoTTqBH
         MOFw==
X-Gm-Message-State: AOJu0YyzJTG5HFBmPW9vMtZ2SgRC4/UMcKNlU/0JfdH1/jJrY3sjv389
	ocy/sWWpXScdqq4mpIrzcYGt0LbsuYFzMLJQxDDNQ6htTfVYyL4lhM2OdwHqV/BFF6ujkbe7mzS
	XhdGe2MSFMlBZwtMn9XDyve1TZ8LVic4VjelcdgzmE1Dx9tKdo6pq76fxTXwQ16769GiEzr07DM
	poHZ7n4FTN00S81kRrCS0kIDLFf38/dwJXK2sF851y
X-Gm-Gg: AfdE7cmItPk5KjZNVgXLXZadinRtl43RM9W5Ps24lYHLsoEGOmKGKxDM70vEcVjqPjA
	0C0xHGcwG5u6HpmjQE7tKqC0ADOnYYiu9E4Q0ktD1+KBKlB5K8V9mG+8tvz3nZTfscVDgLxW8bu
	jwAp4cW8e5n1hahcBk5glhYYg/q80XTkPfsbLveol8k+J3EXtcQ/mZqrZAS7TwLEoQ/uG2
X-Received: by 2002:a05:6808:1b24:b0:4a0:cf55:3cf0 with SMTP id 5614622812f47-4a42ad05460mr7186722b6e.9.1783979558954;
        Mon, 13 Jul 2026 14:52:38 -0700 (PDT)
X-Received: by 2002:a05:6808:1b24:b0:4a0:cf55:3cf0 with SMTP id
 5614622812f47-4a42ad05460mr7186700b6e.9.1783979558591; Mon, 13 Jul 2026
 14:52:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260626101433.3133466-1-peter.lin@sifive.com> <20260626101433.3133466-6-peter.lin@sifive.com>
In-Reply-To: <20260626101433.3133466-6-peter.lin@sifive.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:52:27 -0700
X-Gm-Features: AUfX_myV4BeoKp3J5bzVIaeGrMVCTgZQfHNbCtFsKHGnqYHEwPFXLdm9kC7AZ5k
Message-ID: <CAAVgOkJDsTUhon3MvUrw-ufHfzKOrEkK93vdmRV74KBC-hqkKA@mail.gmail.com>
Subject: Re: [RFC PATCH 05/12] include: sbi_domain: add Worlds WID fields
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com, greentime.hu@sifive.com,
        anup@brainfault.org, scott@riscstar.com, conor@kernel.org,
        dave.patel@riscstar.com, raymond.mao@riscstar.com,
        robin.randhawa@sifive.com, samuel.holland@sifive.com
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDIyMyBTYWx0ZWRfX+6MjgBP6P/Jl
 N3dUMnBqvWB1C3bP5OOlqMBFN0t94kS8+DNAuBobS5xLxE6uP4nT3gohxJ7k1JE9csw2gVlAM8B
 aE0ovz1QCCuegI8PPgFUT1g+lb1jhMWUPW4oQfGKCwpHtP0HbJpSCO+VvuMASF+rCWQSeHnCz9t
 4cnEPZrJl/xVlZKlX40VOzC5sw7nsW63OzTFWWPwW0qrukF8WNjA7BHdi/eZs3KOMhXSuzs8m/g
 Y2xmP+x5dC1B/suIJbPXoqt6fpkHa88cqoSDjqPEn8IxD+tjmq5uxQNIwBCTMejDx6Wj5M56X2+
 cxUV/4SbSevYoEq2drjWyheE+q9M1HKMTOakGNwJnaqCqXnsw4ewTWMqOkcqW4aAMCdlnQ7vKSb
 +EsiK1jpfeTCcqw1WNZHxIcUaysMJ9cqRfMCOAZlZmzy8KPAmTRGmm8edvaJI687EnueaH4jwSZ
 JHB7o6sjQZq6eEANq8g==
X-Authority-Analysis: v=2.4 cv=BNWDalQG c=1 sm=1 tr=0 ts=6a555e27 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=JfrnYn6hAAAA:8 a=pFyQfRViAAAA:8
 a=J9p6pe2AO95up9OnTVsA:9 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-ORIG-GUID: jwYDokv3yDZvYCKfP7mCAj5tquKmEIpO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDIyMyBTYWx0ZWRfX1zv04NxOwANF
 UA6/U9/I9GWJsSAVPRIT3L2p/lkOnEiOs5nVCI3D1oY2O5ly6SWtr8JxE/bhdapyoumD6U4POwT
 wa5UkjMWYBRmCc6uuGmX2Is7gighh+M=
X-Proofpoint-GUID: jwYDokv3yDZvYCKfP7mCAj5tquKmEIpO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130223
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_145240_809675_49AD54EC 
X-CRM114-Status: GOOD (  18.60  )
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
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gQWRkcyBuZXh0X3dpZCAodTMyIFdJRCBmb3Ig
bmV4dCBib290IHN0YWdlKSwgaGFzX25leHRfd2lkIChkaXN0aW5ndWlzaGVzCj4gZXhwbGljaXQg
emVybyBmcm9tIHVuc2V0IGZvciBwbXdpZCBmYWxsYmFjayksIGFuZCBuZXh0X3dpZGxpc3QgKHU2
NCBiaXRtYXNrCj4gc3BlY2lmeWluZyB3aGljaCBXSURzIGNhbiBiZSBkZWxlZ2F0ZWQgdG8gdGhp
cyBkb21haW4pIHRvIHNiaV9kb21haW4KPiBzdHJ1Y3R1cmUuIEVuYWJsZXMgcGVyLWRvbWFpbiBX
b3JsZCBJRCBjb25maWd1cmF0aW9uLgo+Cj4gU2lnbmVkLW9mZi1ieTogWXUtQ2hpZW4gUGV0ZXIg
TGluIDxwZXRlci5saW5Ac2lmaXZlLmNvbT4KPiAtLS0KPiAgaW5jbHVkZS9zYmkvc2JpX2RvbWFp
bi5oIHwgNiArKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+Cj4gZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3NiaV9kb21haW4uaCBiL2luY2x1ZGUvc2JpL3NiaV9kb21h
aW4uaAo+IGluZGV4IDE2ZWRkNGNlLi43ZDUyMzQ5MyAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3Ni
aS9zYmlfZG9tYWluLmgKPiArKysgYi9pbmNsdWRlL3NiaS9zYmlfZG9tYWluLmgKPiBAQCAtMjEx
LDYgKzIxMSwxMiBAQCBzdHJ1Y3Qgc2JpX2RvbWFpbiB7Cj4gICAgICAgICB1bnNpZ25lZCBsb25n
IG5leHRfYWRkcjsKPiAgICAgICAgIC8qKiBQcml2aWxlZ2UgbW9kZSBvZiBuZXh0IGJvb3Rpbmcg
c3RhZ2UgZm9yIHRoaXMgZG9tYWluICovCj4gICAgICAgICB1bnNpZ25lZCBsb25nIG5leHRfbW9k
ZTsKPiArICAgICAgIC8qKiBOZXh0IGJvb3Rpbmcgc3RhZ2UgV29ybGQgSUQgZm9yIHRoaXMgZG9t
YWluICovCj4gKyAgICAgICB1MzIgbmV4dF93aWQ7Cm96YTogVGhlIG5leHRfIGNvbnZlbnRpb24g
d29ya3Mgd2VsbCBmb3Igb25lLXRpbWUgYm9vdCBoYW5kb2ZmIGZpZWxkcwpsaWtlIG5leHRfYWRk
ciBhbmQgbmV4dF9tb2RlCkJ1dCBuZXh0X3dpZCBhbmQgbmV4dF93aWRsaXN0IGFyZSBub3Qgb25l
LXRpbWUgYm9vdCBmaWVsZHMg4oCUIHRoZXkgYXJlOgpXcml0dGVuIG9uIGV2ZXJ5IGRvbWFpbiBl
bnRyeSB2aWEgc2JpX2RvbWFpbl93b3JsZHNfZW50ZXIoKQpBY3RpdmUgdGhyb3VnaG91dCB0aGUg
ZG9tYWluJ3MgbGlmZXRpbWUKUnVudGltZSBpc29sYXRpb24gcG9saWN5LCBub3QgYSBib290IGhh
bmRvZmYgdmFsdWUKU28gdGhlIG5leHRfIG5hbWluZyBpcyBzZW1hbnRpY2FsbHkgbWlzbGVhZGlu
ZyBoZXJlCgp3aHkgbm90IGp1c3QgaGF2ZSB0aGlzIG5hbWluZwoKd2lkVGhlCldJRCBhc3NpZ25l
ZCB0byB0aGlzIGRvbWFpbi4KaGFzX3dpZApsd2lkX2RlbGVnClRoZSBkZWxlZ2F0aW9uIGJ1ZGdl
dCB0byBsb3dlciBsZXZlbHMuCgo+ICsgICAgICAgLyoqIFdoZXRoZXIgbmV4dF93aWQgd2FzIGV4
cGxpY2l0bHkgc2V0ICovCj4gKyAgICAgICBib29sIGhhc19uZXh0X3dpZDsKPiArICAgICAgIC8q
KiBOZXh0IGJvb3Rpbmcgc3RhZ2UgV29ybGQgSUQgZGVsZWdhdGlvbiBiaXRtYXNrIGZvciB0aGlz
IGRvbWFpbiAqLwo+ICsgICAgICAgdTY0IG5leHRfd2lkbGlzdDsKPiAgICAgICAgIC8qKiBJcyBk
b21haW4gYWxsb3dlZCB0byByZXNldCB0aGUgc3lzdGVtICovCj4gICAgICAgICBib29sIHN5c3Rl
bV9yZXNldF9hbGxvd2VkOwo+ICAgICAgICAgLyoqIElzIGRvbWFpbiBhbGxvd2VkIHRvIHN1c3Bl
bmQgdGhlIHN5c3RlbSAqLwo+IC0tCj4gMi40My43Cj4KPgo+IC0tCj4gb3BlbnNiaSBtYWlsaW5n
IGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlz
dApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
