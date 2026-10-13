Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF49ACC6B12
	for <opensbi@archiver.kernel.org>; Tue, 13 Oct 2026 19:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cgSKF2G0FAtOuzXc8qzcoxtaLUX9pDBJqpoqFT2Czks=; b=4DA608tqllW8ej
	1fcF60nSEYrKzjAE391h7el7ENa5tZQDD9Qz2CD4xplZ+OXUy+RcNfs+sgtYRkpZ61T58c2wrqYz7
	DAGEZ1DUS0ecwTTX+y6ZmSxUozZJokZOMlaQdCixt9J+RBNh/KSA4wI0bWRnSP7mZnzD/9ILfoSR0
	MGRxz2G3t/GwkhG4UzyMQ9dFJM2JdptsrqCf6YBm1/6oc57MW0cfy/dPXRCNjXQd68c3TbQ4NqhUF
	MLBmqpUMsn8Q3Ej6OXYes1ANHkJjD/sGEoV1dt25ED/YuLUom/XW34iLV5ZvOkVSKqFvVuK5F2syP
	gTQIZYhMhWPo/SWYOmYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGiSc-0000000Dwkc-0hku;
	Tue, 13 Oct 2026 19:46:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGiSW-0000000Dwis-2b7r
	for opensbi@lists.infradead.org;
	Tue, 13 Oct 2026 19:46:52 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DHkcpW3000868
	for <opensbi@lists.infradead.org>; Tue, 13 Oct 2026 19:46:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BIPTz1BKueb7iKfxrJnLW8hz+Hs8Tvjb1q1kEb4ofa8=; b=DFRgmaeOFXcvEyQ4
	kCPFFE+mhrxlQtMc+ZSL+ItQpoukcSABpCw8ozjByU+bAuegmI3Qfgpx5TAOy2tL
	sMLb0q2tCSn/FzRlnUjSKY80kmyGQMnw/EeVely7sMZnFOCuMtF4eHy8/nYkR6aD
	w9u5UrpH56qYQsMbLOLIvakKD1fx1WYgNgTcF22hbE30mm1MsXYKUeunrv+Rjw10
	1TFPPkTtVshtF3h4U+2KgkUAnjeRwkzsV/zUwLdQ6ZKEEl+8l8TxClbdhNAkos7I
	4jWdVM/xa9IZNQFbdu0DM+5E/4cjji8fDEdWYJ3sW9BsWN/J930deBPgLEVh1e3V
	sHlkjA==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sberhy3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 13 Oct 2026 19:46:48 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-46dade0d7cdso3762751fac.1
        for <opensbi@lists.infradead.org>; Tue, 13 Oct 2026 12:46:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791920807; cv=none;
        d=google.com; s=arc-20260327;
        b=dC90qKGwrRGAwYTOlR1Nk435kFkuztmHKyX68j0Kxb8SKrO7dnme0WrKK5xF+FxgTX
         EGiVRTGs3W0OsAqW2mlVEzO5fsaVVs8C8dpuSGJox+DQDxO3viHAjZJom+1x4fdzllwA
         h79PX7XzZiT8P8m8NC1ahot8fAloQ/dU62M8hZbKOXJweZoyrgBq9QJ+nrn5fJbSUvWt
         ViavbG1PcEsiwC+caYUtCgqcycEwFYk6bQ20nFy4D+3tGlfbqXXQ57vTzTAIXu4VpzCq
         r1x+JvA8Na24YvKr17zVY8q94w0Y7XDSBqnJDie+mpwLU/vLJ2m9syXumnbHqWoIkvbQ
         +rJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BIPTz1BKueb7iKfxrJnLW8hz+Hs8Tvjb1q1kEb4ofa8=;
        fh=3QU2//IuaDpZZY04etg/jFSi1XUpl3j9/aHQ9dcgbTU=;
        b=JjWJCkyxLWCo3EwRwXX3YJSLFeSsE6GLXhAdU+u+d0EkNFekcg/IXvVZuUlTmsfUbY
         CCU4S2WKkeGnMNWbIj2pXEhotWmrXb0R/cWpf8fm/A+IjbpsoZr5o24RfkDuO/eUKGym
         /bor4L10rRHwcR9QNAMG58B6h7LSOHnrtnKoVObEFA8wwkVbGRmuqwR5KcZXbRNBL+NS
         To6hV+mWNUL+2NEexf2kV+MuTAQB/ILSB2GnDsXzivIKvtLRjSznfvUDQdYubGNdGbZO
         Io6idAmy/noccmNKJ/SywH2QKfMNEfw8fq/r3mslc5LmyldlxSPKLOTbimLAZn+1ykqk
         3EkQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791920807; x=1792525607; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BIPTz1BKueb7iKfxrJnLW8hz+Hs8Tvjb1q1kEb4ofa8=;
        b=fl61twuAMcPcamrZYL+xgqqL29e7gutWDm+KyduxKfjhVzXlrIlK1unX3lpwWvkz+N
         CQgMMi0CZBzOphw62fPXVDtkYkLWsHgMQntOMRuVQzGDaRvYGn7A80ejI+5GZomOTaRP
         St0j65NfvPX91M0JTzM1FzPwwS2CFbw1EGplTN40E5DQpdzSV7KGcYF3sisT2zdcKgBI
         LTvC6qo/pMkrii3zruUjomVjsYaSh4dmD9htA43s0UEF/kRZfPrRPuXZ6pvF24yR0Js8
         qblu5OWExzUKPzPxo6TzRX0MGqigTBFnKNuQNcuJHlJ7NkuU83np/icEEVxDgfdrzmhq
         WsSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791920807; x=1792525607;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BIPTz1BKueb7iKfxrJnLW8hz+Hs8Tvjb1q1kEb4ofa8=;
        b=y2WffG+pkXdDeSuMzR468nHolnmhtgAuSwgHejW9crpzWK6QE1x1iAhQnfCtaxCjhY
         8wYozjQC9iwGWpFPiHHJ3IVShST+f7dTn6Fx269TWod82I1B0oL0YnV96LfEAL21VTA1
         MQ+DA3HTHQBYJzq1n8vwubPdNaYm7AQFFhDxuledXzwaDt67UYf7w599rch1mcs2CzyT
         Gls0mV/ISDAUr5il9EpldluV8nW6f20MGKoAP/eo7stNHJs4ryJFPrNDdjWAacv+mwq7
         P6Cbn7FYS62IGVs2qf6YkD6B8AllADMKwd5shVkMEjuLUUYoQ/lk6Wf06+EfN2EA0xZO
         KDRg==
X-Forwarded-Encrypted: i=1; AKwUvByMDLDAp8tpHC2j2ousdE1uuh+9ZPAbfQWiX1pBUo2PiGUM8z8NU1uSxG0dtodx8cJewrOQcHo9@lists.infradead.org
X-Gm-Message-State: AFq9FYJxsBaXIV1mX4UYPO4yfO6ewwXWU1szUKFXV29Q0Y3pJ8yvV2f5
	D9dvmn4Y+76N5VGSYrQmD1TdXExryd4BUhCxcvdewkeguyTJN51QjBxUM+0nTD6QxMBJnzqzM3p
	+tEvra3VPRSV0i1B/GCYleWci1J3eJYY1OBGtOrc2PZMfdnULWdGzKqWxILz3hMSmaTRyz8nYrY
	AD8cCUvy927u3JJ8/GyTqW5T0poj4zmzxFwT/wGBcY
X-Gm-Gg: AYBFou3zd8k//OhvujqRXI84tQbWkmyrAen7rgXChgPt9maJnR592uFW+5bEZkis+sn
	EW4k8Om6ThJE0N2ZIjxlfCpnuhfTJV1IWrxs1XtoZJ58+azsTNkJTvg5BXb0liemS2seLB3v4Jo
	wIE6jBWrOEqqB5PyJvgvCulEYwvzGxWaU5Do2nJB42FrGbE52/KUQOTNkY8No=
X-Received: by 2002:a05:6870:e0ad:b0:48f:e0f6:c02d with SMTP id 586e51a60fabf-4a2a8b2ef34mr11056358fac.43.1791920807183;
        Tue, 13 Oct 2026 12:46:47 -0700 (PDT)
X-Received: by 2002:a05:6870:e0ad:b0:48f:e0f6:c02d with SMTP id
 586e51a60fabf-4a2a8b2ef34mr11056336fac.43.1791920806637; Tue, 13 Oct 2026
 12:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260923032359.4041876-1-anup.patel@oss.qualcomm.com> <20260923032359.4041876-6-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260923032359.4041876-6-anup.patel@oss.qualcomm.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:46:34 -0700
X-Gm-Features: AclHuK9R5jMHpOo2l6YYWHvvw-mT8VpOWv7ivdppxU-RdvrcXOEjCbyxSFjBQjE
Message-ID: <CAAVgOkLjNK_q3ozfep79W33tUS7QL1JpS4Nrt7jmrZrDBkdRrw@mail.gmail.com>
Subject: Re: [PATCH 05/11] lib: utils/mpxy: Introduce mpxy_rpmi_no_mbox_init() function
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
X-Proofpoint-ORIG-GUID: n-x9fJ3QxDzMNbzA64m9e4LvES_JUwcO
X-Proofpoint-GUID: n-x9fJ3QxDzMNbzA64m9e4LvES_JUwcO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA3OCBTYWx0ZWRfX+IY0h9WNT/nA
 3eG+2oRpQxvkA4WpPbU92Q7fuSaLLz9fuzNqQcU+fMb4/qKxZTJQnSUuvile4cazQCj99kVKH0B
 v2KHvlC+D1kCaFI+b/K8zmmh1MVERLorNWqyAgAdnSHL6LJdMEHq7XkvRNEjwmceSNjATsLFh2O
 eSIFz3PxPuyr0wO7j/LAJtLgkFkxcSBFEY0oD78bz5B0Gt/oCdLNFlRJ8pS5Gbn4yr6iKdHRf5g
 agYQ4gkPahbK9Iq68xmN8Q2CT75HX4YadJtbqoFZ6GNREDvSh1d6oNnVKNu6vjRCMP1LxiCpL64
 5Yo7nnIq+xzaTuRxlI7Iqbt8UmopST+kL3RRjm/phTmcuzGa+zNh5PHOlpOkl7Qb5xYEjNTNPkg
 BehlonuLWAazHzdScGxU4d6EMf54+/jXGot3jto45BzZ984XLaiFy8druz93DT8lKGSq/8Cv2Am
 4dg9AD+m5iqbEXQ8b1Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA3OCBTYWx0ZWRfX5pCoCCk4o3hb
 hK+Y260tAnFAQ0OupTccQ5niijBEh96I8NRlHuWZFqFDKnLjf+sBCvTNkXE8fTULKiC1bHHYhcN
 P/M1Q6wUEZv/9waMl/rvN42lZyIHT4w=
X-Authority-Analysis: v=2.4 cv=U7AHnuru c=1 sm=1 tr=0 ts=6ace8aa8 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=9GsBhgrrzz-BKwLXYeEA:9 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_124651_237845_A91B2CED 
X-CRM114-Status: GOOD (  28.74  )
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

T24gVHVlLCBTZXAgMjIsIDIwMjYgYXQgODoyNOKAr1BNIEFudXAgUGF0ZWwgPGFudXAucGF0ZWxA
b3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBBZGQgbmV3IG1weHlfcnBtaV9ub19tYm94X2lu
aXQoKSBmdW5jdGlvbiB0byBpbnN0YW50aWF0ZSBNUFhZIFJQTUkKPiBjaGFubmVsIHdpdGhvdXQg
YW55IG1haWxib3ggY2hhbm5lbCBiYWNraW5nLiBUaGlzIG5ldyBmdW5jdGlvbiBjYW4KPiBiZSB1
c2VkIGJ5IE1QWFkgUlBNSSBkcml2ZXJzIHRoYXQgd2FudCB0byBlbXVsYXRlIE1QWFkgY2hhbm5l
bHMgaW4KPiBzb2Z0d2FyZS4KPgo+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFudXAucGF0
ZWxAb3NzLnF1YWxjb21tLmNvbT4KPiAtLS0KPiAgaW5jbHVkZS9zYmlfdXRpbHMvbXB4eS9mZHRf
bXB4eV9ycG1pLmggfCAgIDYgKy0KPiAgbGliL3V0aWxzL21weHkvZmR0X21weHlfcnBtaS5jICAg
ICAgICAgfCAxMTkgKysrKysrKysrKysrKysrKy0tLS0tLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQs
IDgzIGluc2VydGlvbnMoKyksIDQyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvc2JpX3V0aWxzL21weHkvZmR0X21weHlfcnBtaS5oIGIvaW5jbHVkZS9zYmlfdXRpbHMvbXB4
eS9mZHRfbXB4eV9ycG1pLmgKPiBpbmRleCBhMzk2OGU4Ny4uYzRlNjg5N2YgMTAwNjQ0Cj4gLS0t
IGEvaW5jbHVkZS9zYmlfdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pLmgKPiArKysgYi9pbmNsdWRl
L3NiaV91dGlscy9tcHh5L2ZkdF9tcHh5X3JwbWkuaAo+IEBAIC04NCw3ICs4NCwxMSBAQCBzdHJ1
Y3QgbXB4eV9ycG1pX2RhdGEgewo+ICAgICAgICAgdm9pZCAoKmNsZWFudXBfZ3JvdXApKHZvaWQg
KmNvbnRleHQpOwo+ICB9Owo+Cj4gLS8qKiBDb21tb24gcHJvYmUgZnVuY3Rpb24gZm9yIE1QWFkg
UlBNSSBkcml2ZXJzICovCj4gKy8qKiBGdW5jdGlvbiB0byBpbnN0YW50aWF0ZSBNUFhZIFJQTUkg
Y2hhbm5lbCAqLwo+ICtpbnQgbXB4eV9ycG1pX25vX21ib3hfaW5pdChjb25zdCBzdHJ1Y3QgbXB4
eV9ycG1pX2RhdGEgKmRhdGEsIHUzMiBtcHh5X2NoYW5uZWxfaWQsCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgY29uc3QgY2hhciAqZG9tX25hbWUpOwo+ICsKPiArLyoqIEZEVCBwcm9iZSBm
dW5jdGlvbiB0byBpbnN0YW50aWF0ZSBNUFhZIFJQTUkgY2hhbm5lbCAqLwo+ICBpbnQgZmR0X21w
eHlfcnBtaV9pbml0KGNvbnN0IHZvaWQgKmZkdCwgaW50IG5vZGVvZmYsIGNvbnN0IHN0cnVjdCBm
ZHRfbWF0Y2ggKm1hdGNoKTsKPgo+ICAjZW5kaWYKPiBkaWZmIC0tZ2l0IGEvbGliL3V0aWxzL21w
eHkvZmR0X21weHlfcnBtaS5jIGIvbGliL3V0aWxzL21weHkvZmR0X21weHlfcnBtaS5jCj4gaW5k
ZXggOWI4ZTY5ZTEuLjEwM2RlZDEzIDEwMDY0NAo+IC0tLSBhL2xpYi91dGlscy9tcHh5L2ZkdF9t
cHh5X3JwbWkuYwo+ICsrKyBiL2xpYi91dGlscy9tcHh5L2ZkdF9tcHh5X3JwbWkuYwo+IEBAIC0y
MTksNDQgKzIxOSwzNyBAQCBzdGF0aWMgaW50IG1weHlfcnBtaV9nZXRfYXR0cmlidXRlKHN0cnVj
dCBtcHh5X3JwbWkgKnJtYiwKPiAgICAgICAgIHJldHVybiByYzsKPiAgfQo+Cj4gLWludCBmZHRf
bXB4eV9ycG1pX2luaXQoY29uc3Qgdm9pZCAqZmR0LCBpbnQgbm9kZW9mZiwgY29uc3Qgc3RydWN0
IGZkdF9tYXRjaCAqbWF0Y2gpCj4gK3N0YXRpYyBpbnQgX19tcHh5X3JwbWlfaW5pdChjb25zdCBz
dHJ1Y3QgbXB4eV9ycG1pX2RhdGEgKmRhdGEsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCBtYm94X2NoYW4gKmNoYW4sIHUzMiBtcHh5X2NoYW5uZWxfaWQsCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHN0cnVjdCBzYmlfZG9tYWluICpkb20pCj4gIHsKPiAtICAgICAg
IHUzMiBjaGFubmVsX2lkLCBzZXJ2aWNlZ3JwX3ZlciwgcHJvX3ZlciwgbWF4X2RhdGFfbGVuLCB0
eF90b3V0LCByeF90b3V0Owo+IC0gICAgICAgdTMyIGltcGxfaWQsIGltcGxfdmVyOwo+IC0gICAg
ICAgY29uc3Qgc3RydWN0IG1weHlfcnBtaV9kYXRhICpkYXRhID0gbWF0Y2gtPmRhdGE7Cj4gKyAg
ICAgICB1MzIgc2VydmljZWdycF92ZXIsIHByb192ZXIsIG1heF9kYXRhX2xlbiwgdHhfdG91dCwg
cnhfdG91dDsKPiAgICAgICAgIHN0cnVjdCBtcHh5X3JwbWkgKnJtYjsKPiAtICAgICAgIHN0cnVj
dCBtYm94X2NoYW4gKmNoYW47Cj4gLSAgICAgICBjb25zdCBmZHQzMl90ICp2YWw7Cj4gLSAgICAg
ICBpbnQgcmMsIGxlbjsKPiArICAgICAgIHUzMiBpbXBsX2lkLCBpbXBsX3ZlcjsKPiArICAgICAg
IGludCByYzsKPiArCj4gKyAgICAgICBpZiAoIWRhdGEgfHwgIWRvbSkKPiArICAgICAgICAgICAg
ICAgcmV0dXJuIFNCSV9FSU5WQUw7Cj4gKwo+ICsgICAgICAgLyoKPiArICAgICAgICAqIFdoZW4g
bWFpbGJveCBjaGFubmVsIGlzIG5vdCBhdmFpbGFibGUsIGJvdGggZ2V0X2F0dHJpYnV0ZV9ncm91
cCgpIGFuZAo+ICsgICAgICAgICogeGZlcl9ncm91cCgpIGNhbGxiYWNrcyBtdXN0IGJlIGF2YWls
YWJsZS4KPiArICAgICAgICAqLwo+ICsgICAgICAgaWYgKCFjaGFuICYmICghZGF0YS0+Z2V0X2F0
dHJpYnV0ZV9ncm91cCB8fCAhZGF0YS0+eGZlcl9ncm91cCkpCj4gKyAgICAgICAgICAgICAgIHJl
dHVybiBTQklfRUlOVkFMOwo+Cj4gICAgICAgICAvKiBBbGxvY2F0ZSBjb250ZXh0IGZvciBNUFhZ
IFJQTUkgaW5zdGFuY2UgKi8KPiAgICAgICAgIHJtYiA9IHNiaV96YWxsb2Moc2l6ZW9mKCpybWIp
KTsKPiAgICAgICAgIGlmICghcm1iKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VOT01F
TTsKPiAgICAgICAgIHJtYi0+ZGF0YSA9IGRhdGE7Cj4gLQo+IC0gICAgICAgLyoKPiAtICAgICAg
ICAqIElmIGNoYW5uZWwgcmVxdWVzdCBmYWlsZWQgdGhlbiBvdGhlciBlbmQgZG9lcyBub3Qgc3Vw
cG9ydAo+IC0gICAgICAgICogc2VydmljZSBncm91cCBzbyBkbyBub3RoaW5nLgo+IC0gICAgICAg
ICovCj4gLSAgICAgICByYyA9IGZkdF9tYWlsYm94X3JlcXVlc3RfY2hhbihmZHQsIG5vZGVvZmYs
IDAsICZjaGFuKTsKPiAtICAgICAgIGlmIChyYykgewo+IC0gICAgICAgICAgICAgICByYyA9IFNC
SV9FTk9ERVY7Cj4gLSAgICAgICAgICAgICAgIGdvdG8gZmFpbF9mcmVlX2NsaWVudDsKPiAtICAg
ICAgIH0KPiAgICAgICAgIHJtYi0+Y2hhbiA9IGNoYW47Cj4KPiAtICAgICAgIC8qIE1hdGNoIGNo
YW5uZWwgc2VydmljZSBncm91cCBpZCAqLwo+IC0gICAgICAgaWYgKGRhdGEtPnNlcnZpY2VncnBf
aWQgIT0gY2hhbi0+Y2hhbl9hcmdzWzBdKSB7Cj4gLSAgICAgICAgICAgICAgIHJjID0gU0JJX0VJ
TlZBTDsKPiAtICAgICAgICAgICAgICAgZ290byBmYWlsX2ZyZWVfY2hhbjsKPiAtICAgICAgIH0K
PiAtCj4gICAgICAgICAvKiBTZXR1cCBSUE1JIHNlcnZpY2UgZ3JvdXAgY29udGV4dCAqLwo+ICAg
ICAgICAgaWYgKGRhdGEtPnNldHVwX2dyb3VwKSB7Cj4gICAgICAgICAgICAgICAgIHJjID0gZGF0
YS0+c2V0dXBfZ3JvdXAoJnJtYi0+Z3JvdXBfY29udGV4dCwgY2hhbiwgZGF0YSk7Cj4gICAgICAg
ICAgICAgICAgIGlmIChyYykKPiAtICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGZhaWxfZnJl
ZV9jaGFuOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZmFpbF9mcmVlX2NsaWVudDsK
PiAgICAgICAgIH0KPgo+ICAgICAgICAgLyogR2V0IGNoYW5uZWwgcHJvdG9jb2wgdmVyc2lvbiAq
Lwo+IEBAIC0zMDEsMjQgKzI5NCwxMSBAQCBpbnQgZmR0X21weHlfcnBtaV9pbml0KGNvbnN0IHZv
aWQgKmZkdCwgaW50IG5vZGVvZmYsIGNvbnN0IHN0cnVjdCBmZHRfbWF0Y2ggKm1hdAo+ICAgICAg
ICAgaWYgKHJjKQo+ICAgICAgICAgICAgICAgICBnb3RvIGZhaWxfY2xlYW51cF9ncm91cDsKPgo+
IC0gICAgICAgLyoKPiAtICAgICAgICAqIFRoZSAicmlzY3Ysc2JpLW1weHktY2hhbm5lbC1pZCIg
RFQgcHJvcGVydHkgaXMgbWFuZGF0b3J5Cj4gLSAgICAgICAgKiBmb3IgTVBYWSBSUE1JIGRyaXZl
cnMgc28gaWYgdGhpcyBpcyBub3QgcHJlc2VudCB0aGVuIHRyeQo+IC0gICAgICAgICogb3RoZXIg
ZHJpdmVycy4KPiAtICAgICAgICAqLwo+IC0gICAgICAgdmFsID0gZmR0X2dldHByb3AoZmR0LCBu
b2Rlb2ZmLCAicmlzY3Ysc2JpLW1weHktY2hhbm5lbC1pZCIsICZsZW4pOwo+IC0gICAgICAgaWYg
KGxlbiA+IDAgJiYgdmFsKSB7Cj4gLSAgICAgICAgICAgICAgIGNoYW5uZWxfaWQgPSBmZHQzMl90
b19jcHUoKnZhbCk7Cj4gLSAgICAgICB9IGVsc2Ugewo+IC0gICAgICAgICAgICAgICByYyA9IFNC
SV9FTk9ERVY7Cj4gLSAgICAgICAgICAgICAgIGdvdG8gZmFpbF9jbGVhbnVwX2dyb3VwOwo+IC0g
ICAgICAgfQo+IC0KPiAgICAgICAgIC8qIFNldHVwIE1QWFkgUlBNSSBjaGFubmVsICovCj4gICAg
ICAgICAvKiBDaGFubmVsIElEKi8KPiAtICAgICAgIHJtYi0+Y2hhbm5lbC5jaGFubmVsX2lkID0g
Y2hhbm5lbF9pZDsKPiArICAgICAgIHJtYi0+Y2hhbm5lbC5jaGFubmVsX2lkID0gbXB4eV9jaGFu
bmVsX2lkOwo+ICAgICAgICAgLyogU2V0IHRoZSBvd25lciBkb21haW4gKi8KPiAtICAgICAgIHJt
Yi0+Y2hhbm5lbC5vd25lcl9kb21haW4gPSAmcm9vdDsKPiArICAgICAgIHJtYi0+Y2hhbm5lbC5v
d25lcl9kb21haW4gPSBkb207Cj4gICAgICAgICAvKiBDYWxsYmFjayBmb3IgcmVhZCBSUE1JIGF0
dHJpYnV0ZXMgKi8KPiAgICAgICAgIHJtYi0+Y2hhbm5lbC5yZWFkX2F0dHJpYnV0ZXMgPSBtcHh5
X3JlYWRfYXR0cmlidXRlczsKPiAgICAgICAgIC8qIENhbGxiYWNrIGZvciB3cml0ZSBSUE1JIGF0
dHJpYnV0ZXMgKi8KPiBAQCAtMzYwLDkgKzM0MCw2NiBAQCBpbnQgZmR0X21weHlfcnBtaV9pbml0
KGNvbnN0IHZvaWQgKmZkdCwgaW50IG5vZGVvZmYsIGNvbnN0IHN0cnVjdCBmZHRfbWF0Y2ggKm1h
dAo+ICBmYWlsX2NsZWFudXBfZ3JvdXA6Cj4gICAgICAgICBpZiAoZGF0YS0+Y2xlYW51cF9ncm91
cCkKPiAgICAgICAgICAgICAgICAgZGF0YS0+Y2xlYW51cF9ncm91cChybWItPmdyb3VwX2NvbnRl
eHQpOwo+IC1mYWlsX2ZyZWVfY2hhbjoKPiAtICAgICAgIG1ib3hfY29udHJvbGxlcl9mcmVlX2No
YW4oY2hhbik7Cj4gIGZhaWxfZnJlZV9jbGllbnQ6Cj4gICAgICAgICBzYmlfZnJlZShybWIpOwo+
ICAgICAgICAgcmV0dXJuIHJjOwo+ICB9Cj4gKwo+ICtpbnQgbXB4eV9ycG1pX25vX21ib3hfaW5p
dChjb25zdCBzdHJ1Y3QgbXB4eV9ycG1pX2RhdGEgKmRhdGEsIHUzMiBtcHh5X2NoYW5uZWxfaWQs
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqZG9tX25hbWUpCj4gK3sK
PiArICAgICAgIC8qIENyZWF0ZSBNUFhZIFJQTUkgaW5zdGFuY2Ugd2l0aG91dCBtYWlsYm94IGNo
YW5uZWwgKi8KPiArICAgICAgIHJldHVybiBfX21weHlfcnBtaV9pbml0KGRhdGEsIE5VTEwsIG1w
eHlfY2hhbm5lbF9pZCwgc2JpX2RvbWFpbl9maW5kX2J5X25hbWUoZG9tX25hbWUpKTsKPiArfQo+
ICsKPiAraW50IGZkdF9tcHh5X3JwbWlfaW5pdChjb25zdCB2b2lkICpmZHQsIGludCBub2Rlb2Zm
LCBjb25zdCBzdHJ1Y3QgZmR0X21hdGNoICptYXRjaCkKPiArewo+ICsgICAgICAgY29uc3Qgc3Ry
dWN0IG1weHlfcnBtaV9kYXRhICpkYXRhID0gbWF0Y2gtPmRhdGE7Cj4gKyAgICAgICBzdHJ1Y3Qg
bWJveF9jaGFuICpjaGFuID0gTlVMTDsKPiArICAgICAgIGNvbnN0IGZkdDMyX3QgKnZhbDsKPiAr
ICAgICAgIHUzMiBjaGFubmVsX2lkOwo+ICsgICAgICAgaW50IHJjLCBsZW47Cj4gKwo+ICsgICAg
ICAgLyogUmVxdWVzdCBtYWlsYm94IGNoYW5uZWwgd2hlbiBhdmFpbGFibGUgKi8KPiArICAgICAg
IHZhbCA9IGZkdF9nZXRwcm9wKGZkdCwgbm9kZW9mZiwgIm1ib3hlcyIsICZsZW4pOwo+ICsgICAg
ICAgaWYgKHZhbCkgewo+ICsgICAgICAgICAgICAgICAvKgo+ICsgICAgICAgICAgICAgICAgKiBJ
ZiBjaGFubmVsIHJlcXVlc3QgZmFpbGVkIHRoZW4gb3RoZXIgZW5kIGRvZXMgbm90IHN1cHBvcnQK
PiArICAgICAgICAgICAgICAgICogc2VydmljZSBncm91cCBzbyBkbyBub3RoaW5nLgo+ICsgICAg
ICAgICAgICAgICAgKi8KPiArICAgICAgICAgICAgICAgcmMgPSBmZHRfbWFpbGJveF9yZXF1ZXN0
X2NoYW4oZmR0LCBub2Rlb2ZmLCAwLCAmY2hhbik7Cj4gKyAgICAgICAgICAgICAgIGlmIChyYykK
PiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VOT0RFVjsKPiArCj4gKyAgICAg
ICAgICAgICAgIC8qIE1hdGNoIGNoYW5uZWwgc2VydmljZSBncm91cCBpZCAqLwo+ICsgICAgICAg
ICAgICAgICBpZiAoZGF0YS0+c2VydmljZWdycF9pZCAhPSBjaGFuLT5jaGFuX2FyZ3NbMF0pIHsK
PiArICAgICAgICAgICAgICAgICAgICAgICByYyA9IFNCSV9FSU5WQUw7Cj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgZ290byBmYWlsX2ZyZWVfY2hhbjsKPiArICAgICAgICAgICAgICAgfQo+ICsg
ICAgICAgfQo+ICsKPiArICAgICAgIC8qCj4gKyAgICAgICAgKiBUaGUgInJpc2N2LHNiaS1tcHh5
LWNoYW5uZWwtaWQiIERUIHByb3BlcnR5IGlzIG1hbmRhdG9yeQo+ICsgICAgICAgICogZm9yIE1Q
WFkgUlBNSSBkcml2ZXJzIHNvIGlmIHRoaXMgaXMgbm90IHByZXNlbnQgdGhlbiB0cnkKPiArICAg
ICAgICAqIG90aGVyIGRyaXZlcnMuCj4gKyAgICAgICAgKi8KPiArICAgICAgIHZhbCA9IGZkdF9n
ZXRwcm9wKGZkdCwgbm9kZW9mZiwgInJpc2N2LHNiaS1tcHh5LWNoYW5uZWwtaWQiLCAmbGVuKTsK
PiArICAgICAgIGlmIChsZW4gPiAwICYmIHZhbCkgewo+ICsgICAgICAgICAgICAgICBjaGFubmVs
X2lkID0gZmR0MzJfdG9fY3B1KCp2YWwpOwo+ICsgICAgICAgfSBlbHNlIHsKPiArICAgICAgICAg
ICAgICAgcmMgPSBTQklfRU5PREVWOwo+ICsgICAgICAgICAgICAgICBnb3RvIGZhaWxfZnJlZV9j
aGFuOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIC8qIENyZWF0ZSBNUFhZIFJQTUkgaW5zdGFu
Y2Ugd2l0aCBtYWlsYm94IGNoYW5uZWwgZGlzY292ZXJlZCBmcm9tIERUICovCj4gKyAgICAgICBy
YyA9IF9fbXB4eV9ycG1pX2luaXQoZGF0YSwgY2hhbiwgY2hhbm5lbF9pZCwgJnJvb3QpOwo+ICsg
ICAgICAgaWYgKHJjKQo+ICsgICAgICAgICAgICAgICBnb3RvIGZhaWxfZnJlZV9jaGFuOwo+ICsK
PiArICAgICAgIHJldHVybiBTQklfT0s7Cj4gKwo+ICtmYWlsX2ZyZWVfY2hhbjoKPiArICAgICAg
IGlmIChjaGFuKQo+ICsgICAgICAgICAgICAgICBtYm94X2NvbnRyb2xsZXJfZnJlZV9jaGFuKGNo
YW4pOwo+ICsgICAgICAgcmV0dXJuIHJjOwo+ICt9Cj4gLS0KPiAyLjQzLjAKPgo+Cj4gLS0KPiBv
cGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKUmV2aWV3ZWQt
Ynk6IFBhd2FuZGVlcCBPemEgPHBhd2FuZGVlcC5vemFAb3NzLnF1YWxjb21tLmNvbT4KVGVzdGVk
LWJ5OiBQYXdhbmRlZXAgT3phIDxwYXdhbmRlZXAub3phQG9zcy5xdWFsY29tbS5jb20+CgotLSAK
b3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
