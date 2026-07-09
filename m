Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F1F6C43458
	for <opensbi@archiver.kernel.org>; Thu,  9 Jul 2026 00:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=twJNayF2zisiSNp9bawEe5GuBXr2dKIIodQOdl2LTh4=; b=BTdwPZPwosGszs
	i3HHE0tP7YrIK59QIfZHGMJ4TYCZcuc33d1VPlBTeyevZd4nrZHP31/iMs9YblG2eyg1Pfy9QMB9F
	WZz8kC2FDi4G8Z4Lc2YoHA/c8OsuySXlEvQbHX9ysFlp8s6oBCUaPlRsokTqfl27xLwv82GTZaGIU
	aWvJBjuLe83ACln7X1vagyH3Nm0hONh7NWs2AEerAzfzmjaJviLn7eVpCtLgmzKfNJ3XW6Yz6o6BL
	U40JJyVQZMaxf0XZ9XEfu6UkoMLp15pZYSCVthBe9uZiosOh8/MmGr4zRkYDYmllB3voz6fwGnb9i
	m9Anhoc/Gepsp9g+JDGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whcks-00000000f5U-0ihG;
	Thu, 09 Jul 2026 00:36:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whcko-00000000f53-3TQP
	for opensbi@lists.infradead.org;
	Thu, 09 Jul 2026 00:36:40 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668N8jOd4193606
	for <opensbi@lists.infradead.org>; Thu, 9 Jul 2026 00:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QJzTzHslBvoW3SUN0E9HA6AyakZGCCZiLUtnswFLiCg=; b=SwHStDemwb87cmoM
	lW7JZYRjRCWIoSjex15CLVtnYN9rVq0DQP/+rZZcOiIuOaa3Lb4eabGC/0qOSttv
	kPi9BWyx2U4hnSBXmahiicA+V16Ha6CRI0nGuc3rZxSHhKt8nAlsB3a4d0IN1qSO
	xMesdEf6UtM//vyv/fknCsAZ5WxGVEI7atbo4OTx5A1LkagDbNvuH6Z17D799tdc
	VTLnrgUQzy429D4YvFldbpxewGKQ2WqiS4pVrwRfnipA0nfxcHQiSrY7Ttqyd8qt
	x1CUeccGAPUgCAzNJFm9c0CEBAgvKyyYC+/mW0ZJ99bkKs2lKrUg3YMr8rLSGdq5
	PIVOhA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9rq3216e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Thu, 09 Jul 2026 00:36:35 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4a36606e230so55028b6e.2
        for <opensbi@lists.infradead.org>; Wed, 08 Jul 2026 17:36:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783557395; cv=none;
        d=google.com; s=arc-20260327;
        b=RS+n424ecY1jpa5uokQU+VKe4kexBXK72YHJWHWtvwwyqd+jRpR7Z1Ns4X1VbpqNbs
         scTxr63NXZaBZP8GlxAlq1HWvQNkRiY33WYeMOXoUhbjvIK5MBG60FJv2qHmhdKwZSn5
         f69Z/C2q5jcS0UN62lYcZk+6nJ+7CtuCj0kuvYBOHMUMbCs70W8g77EW1m9DBItuJfRX
         iUyDIQa5Nx7eUiZOl+mfBt9jZc9dWR4+x4V6xGjWPB9pWIua9sGz5mAaxpUeCPoEpyjJ
         G2usCsEt3IX2Rqgh/S/aegX41mGCi9Z4FDTmHiTDHWdC0NtFmXm2MOKrIrROPDdC3OIu
         gEvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QJzTzHslBvoW3SUN0E9HA6AyakZGCCZiLUtnswFLiCg=;
        fh=cyWYA3kXN4M7205T7O+U3EeZKBOqXRScKUv8W0MgTLc=;
        b=GSnsLMHjAePvzRaCq5WHzQ28tpKY8H3TBeGExJ7nilw8dP1qxHKvPJyAhFh7IdM7Qs
         aUQwgUOWn2ahZD0AXgQ7EC/UGBXbXHAuNVT5ZGpPWlzi/OiQjQ0nw7OZi4szqNHdpGYe
         rYSjlZXTWblJOeMD+IYDSKLnPmfxGGJQUfFrCgPb7UvppKGTCPBqstpVd86x5LYYeYsj
         FwwjdehpM9Fektfv6DeNXwYOyDaN2UP7Fd5D4X/jj7DJipD9IW/7y9h/LZsczJSjJQvO
         +djrYGh9DPfF8P/LmikZjEFZNV9NayI71WDb4Y7744daPYWYL0TKdwcvtGUCuESO4AQ3
         9CvA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783557395; x=1784162195; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QJzTzHslBvoW3SUN0E9HA6AyakZGCCZiLUtnswFLiCg=;
        b=M5h6c2OJgHJyDPU8o24fomUUzwUlPKy3paqVVUNHLWeadUTTdu4Qm/So/0pHxQTL8e
         mmgS+AakWfYmAmDLcFFIL5QgzJvxPpuNQ0eRm9AlDhXofgDdrdBTgUUBGoJ+DJDJy3so
         0AHEm2PrEBfy2xPY8rtudGNE6DZFqfknSlN6DfMcaMBLPGmYPCz2Yhv8scGMgddAG5qT
         T9rJU6oks1ko8tWs2IZt60gJUntFOpaeU1qNjDn7lrtngb/32pd6d0opNurTB2RBDIqC
         ty/k8paNyXw+qBJeZ8W0YKUDRpVQqKGQ+Mk0irrx/B0SPv+QRb0i66THd6LRPtmr+XNY
         PVtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783557395; x=1784162195;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QJzTzHslBvoW3SUN0E9HA6AyakZGCCZiLUtnswFLiCg=;
        b=AbouSEpE47aSkRJUNsJBCrk0t1agj6DzNo/82FFfhOh9NI8kSAtGIw0M/D647swU3B
         yrIy0VW6z23xKCC/Mht+jHvn6ekYP2G8pgkSnnbo4r9cGT1kXYlfIMvctPcLSURf5cdH
         vTzY477/3gf1j2xYKmyEo4nXVGy9MnfqSQHyj1StX2lDJqM/9K87QWexXFasAFBlgWIm
         7a/6Tia0aUR4r6+0ViWHuanAJd8QrKb8T2i2baOmptTn9D2aThH6+iU+Qfenoenb5wj3
         SB0GjsvjvRuJKE87VNrVXDx68sh9y1uURgxiIJjonyeBOLteKCp97kynvueupQ+TAFJR
         ZBNA==
X-Gm-Message-State: AOJu0Yzlwgrk20yldPXB1Av4A2xi6z8xlzjU7dj4ZuLZa0YgBSYZpELh
	66CfnlCP3SF8zrBdOMuwJ0s7FFKijdQ+L0sXnar/8BR+An7gVfp7jNrla//sNhcSMYkP/uzW4Ee
	pTJBfF967KXU4ogQveKvu3zLRts36PMt91P9veWWcNkjLHxj//DUE79f9rW36+MAzJYxZk2WaoK
	QH1nTNOIo1k1BXgdJ156Y1w34fgjWNSHgF60Hdo6WaVYz8JbOyWmU=
X-Gm-Gg: AfdE7cn0swkS7J0jXg+UiNyx8QF4CfKzOfT9QMuL7XN4+dlfVZkEnFdpeyqTrmQHwvd
	K65l/1QWISDoHgNxo++tpSoTFB/SBrvd8yDXNv4NlWDYYe78dRK4cSQ/hnpdQtKleqQRYhbPStn
	g9NIE2sLn+1sNkz8KRzfvBv5DYCWXicvp2HIxT6dwtNyFbi5gGdWBCCYt+7RGckpA24lNB
X-Received: by 2002:a05:6808:318c:b0:495:f519:70f1 with SMTP id 5614622812f47-4a2050feb3amr4272160b6e.31.1783557395164;
        Wed, 08 Jul 2026 17:36:35 -0700 (PDT)
X-Received: by 2002:a05:6808:318c:b0:495:f519:70f1 with SMTP id
 5614622812f47-4a2050feb3amr4272144b6e.31.1783557394738; Wed, 08 Jul 2026
 17:36:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260626101433.3133466-1-peter.lin@sifive.com> <20260626101433.3133466-3-peter.lin@sifive.com>
In-Reply-To: <20260626101433.3133466-3-peter.lin@sifive.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 17:36:23 -0700
X-Gm-Features: AUfX_mwOOANG1U2MJ1NbXgx8tg0ygU7szCmJyeOvmDvfEMnuIielKfm7JZ9T2r4
Message-ID: <CAAVgOkJ31PoMz7rkeW9STXWCDGyEU7ttkeJxyyoSK7BCmFd-9w@mail.gmail.com>
Subject: Re: [RFC PATCH 02/12] lib: utils: fdt_helper: parse RISC-V Worlds DT properties
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com, greentime.hu@sifive.com,
        anup@brainfault.org, scott@riscstar.com, conor@kernel.org,
        dave.patel@riscstar.com, raymond.mao@riscstar.com,
        robin.randhawa@sifive.com, samuel.holland@sifive.com
X-Proofpoint-ORIG-GUID: XF8FDnzG7lhem9QSHZebrwneMRe2iQlf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDAwNCBTYWx0ZWRfX96hiRxz6UYOq
 sQ/h5e+XlE/pHoHqXkUmOgPuCLl2T5XDaUaZdXhyfDtTBrSACC1NMW0b31SDMyYHDMY7G4t/egM
 XSgs1WSTYdAE25t+n5cXNBNhYEHrF1qrVI2NbObvFgti1HC2QgyEkzcmrqoS4M3xxftON8f03Du
 mpA7CQoVbad7yZf+gEASyWTSZB3+eTnqQTcFghyC+GHxbYi8UglPaiYZGvlQPIH2qwsXGnXBEWf
 ysdBE5lCu7yxPxjK92FckXQ9/iT2Ok72PM07ALY2MqeTKEZxCHPGiO7TX9NaKxZBkn8o2+LKiJG
 Pqm6JqUi4Z+658IWzik8IkLH4BQlzZixPHA9MArMd95eJR7MCWNzTrM95gGE/+r3qYSZCIKFtfw
 8Vyj1Yp+ZxCNWWE3g9/BgnsMV/GK2h/yVBcH9Gbx1qpNlpMJ0nG1qxRPO2Zz7c4PicYOXt1t/xc
 hNHcsH2e43/DwHhsT/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDAwNCBTYWx0ZWRfX6cZe1A8IrPUR
 0cBvM0IU3nU7Z6CvuwaremrxX0Oldji9PZRj2agFXvm9HDE9H0FRwDZseF06qBkabkiC3ARG+II
 B7EFY0AgBwRkQTArKmpZYp2wOp3CnQU=
X-Authority-Analysis: v=2.4 cv=PYPPQChd c=1 sm=1 tr=0 ts=6a4eed13 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=pFyQfRViAAAA:8 a=JfrnYn6hAAAA:8
 a=Kopkbg4jDh715k1rmzUA:9 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
 a=oJz5jJLG1JtSoe7EL652:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: XF8FDnzG7lhem9QSHZebrwneMRe2iQlf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_05,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_173639_038594_F8E6AD06 
X-CRM114-Status: GOOD (  28.68  )
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
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gQWRkIGZkdF9wYXJzZV93b3JsZHNfYWxsX2hh
cnRzKCkgdG8gcGFyc2UgUklTQy1WIFdvcmxkcyBkZXZpY2UgdHJlZQo+IHByb3BlcnRpZXMgZnJv
bSBDUFUgbm9kZXM6Cj4gICAtIHJpc2N2LHBtd2lkICh1MzIpOiBQaHlzaWNhbCBNYWNoaW5lIFdv
cmxkIElEIGZvciB0aGlzIGhhcnQKPiAgIC0gcmlzY3YscG13aWRsaXN0ICh1NjQpOiBCaXRtYXAg
b2YgcGVybWl0dGVkIE0tbW9kZSBXb3JsZCBJRHMKPiAgIC0gcmlzY3YscG1sd2lkbGlzdCAodTY0
KTogQml0bWFwIG9mIHBlcm1pdHRlZCBTL1UtbW9kZSBXb3JsZCBJRHMKPgo+IFRoaXMgcGF0Y2gg
ZXh0ZW5kcyB0aGUgc2JpX2hhcnRfZmVhdHVyZXMgc3RydWN0IHdpdGggbmV3IGZpZWxkcyB0bwo+
IHN0b3JlIHRoZSBwYXJzZWQgV29ybGQgSUQgY29uZmlndXJhdGlvbiAoaGFzX3Btd2lkLCBwbXdp
ZCwgcG13aWRsaXN0LAo+IGFuZCBwbWx3aWRsaXN0KS4KPgo+IExpbms6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2FsbC8yMDI2MDYxOTEwNTgzNC4xMjc3MzAyLTMtcGV0ZXIubGluQHNpZml2ZS5j
b20vCj4gU2lnbmVkLW9mZi1ieTogWXUtQ2hpZW4gUGV0ZXIgTGluIDxwZXRlci5saW5Ac2lmaXZl
LmNvbT4KPiAtLS0KPiAgaW5jbHVkZS9zYmkvc2JpX2hhcnQuaCAgICAgICAgICAgICB8IDE1ICsr
KysrKysrCj4gIGluY2x1ZGUvc2JpX3V0aWxzL2ZkdC9mZHRfaGVscGVyLmggfCAgMiArCj4gIGxp
Yi91dGlscy9mZHQvZmR0X2hlbHBlci5jICAgICAgICAgfCA2MSArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysKPiAgcGxhdGZvcm0vZ2VuZXJpYy9wbGF0Zm9ybS5jICAgICAgICB8IDEzICsr
KysrKy0KPiAgNCBmaWxlcyBjaGFuZ2VkLCA5MCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zYmkvc2JpX2hhcnQuaCBiL2luY2x1ZGUvc2JpL3Ni
aV9oYXJ0LmgKPiBpbmRleCAyOTQxODA5ZS4uOTcwNzJjMDkgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVk
ZS9zYmkvc2JpX2hhcnQuaAo+ICsrKyBiL2luY2x1ZGUvc2JpL3NiaV9oYXJ0LmgKPiBAQCAtMTM1
LDYgKzEzNSwyMSBAQCBzdHJ1Y3Qgc2JpX2hhcnRfZmVhdHVyZXMgewo+ICAgICAgICAgdW5zaWdu
ZWQgaW50IHBtcF9sb2cyZ3JhbjsKPiAgICAgICAgIHVuc2lnbmVkIGludCBtaHBtX21hc2s7Cj4g
ICAgICAgICB1bnNpZ25lZCBpbnQgbWhwbV9iaXRzOwo+ICsgICAgICAgLyoqIFRydWUgaWYgcmlz
Y3YscG13aWQgd2FzIHByZXNlbnQgaW4gRFQgKi8KPiArICAgICAgIGJvb2wgaGFzX3Btd2lkOwo+
ICsgICAgICAgdTMyIHBtd2lkOwo+ICsgICAgICAgLyoqCj4gKyAgICAgICAgKiBQbGF0Zm9ybS1k
ZWZpbmVkIGJpdG1hcCBvZiBNLW1vZGUgV0lEcwo+ICsgICAgICAgICogKGZyb20gRFQgcmlzY3Ys
cG13aWRsaXN0KS4gWmVybyBtZWFucwo+ICsgICAgICAgICogYWJzZW50L3VucmVzdHJpY3RlZC4K
PiArICAgICAgICAqLwo+ICsgICAgICAgdTY0IHBtd2lkbGlzdDsKPiArICAgICAgIC8qKgo+ICsg
ICAgICAgICogUGxhdGZvcm0tZGVmaW5lZCBiaXRtYXAgb2YgUy9VLW1vZGUgV0lEcwo+ICsgICAg
ICAgICogKGZyb20gRFQgcmlzY3YscG1sd2lkbGlzdCkuIFplcm8gbWVhbnMKPiArICAgICAgICAq
IGFic2VudC91bnJlc3RyaWN0ZWQuCj4gKyAgICAgICAgKi8KPiArICAgICAgIHU2NCBwbWx3aWRs
aXN0Owo+ICB9Owo+Cj4gIGV4dGVybiB1bnNpZ25lZCBsb25nIGhhcnRfZmVhdHVyZXNfb2Zmc2V0
Owo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3NiaV91dGlscy9mZHQvZmR0X2hlbHBlci5oIGIvaW5j
bHVkZS9zYmlfdXRpbHMvZmR0L2ZkdF9oZWxwZXIuaAo+IGluZGV4IDc1YTU2NGQxLi4zZjNkMDkx
YiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3NiaV91dGlscy9mZHQvZmR0X2hlbHBlci5oCj4gKysr
IGIvaW5jbHVkZS9zYmlfdXRpbHMvZmR0L2ZkdF9oZWxwZXIuaAo+IEBAIC01Niw2ICs1Niw4IEBA
IGludCBmZHRfcGFyc2VfdGltZWJhc2VfZnJlcXVlbmN5KGNvbnN0IHZvaWQgKmZkdCwgdW5zaWdu
ZWQgbG9uZyAqZnJlcSk7Cj4KPiAgaW50IGZkdF9wYXJzZV9pc2FfZXh0ZW5zaW9uc19hbGxfaGFy
dHMoY29uc3Qgdm9pZCAqZmR0KTsKPgo+ICtpbnQgZmR0X3BhcnNlX3dvcmxkc19hbGxfaGFydHMo
Y29uc3Qgdm9pZCAqZmR0KTsKPiArCj4gIGludCBmZHRfcGFyc2VfZ2Fpc2xlcl91YXJ0X25vZGUo
Y29uc3Qgdm9pZCAqZmR0LCBpbnQgbm9kZW9mZnNldCwKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCBwbGF0Zm9ybV91YXJ0X2RhdGEgKnVhcnQpOwo+Cj4gZGlmZiAtLWdp
dCBhL2xpYi91dGlscy9mZHQvZmR0X2hlbHBlci5jIGIvbGliL3V0aWxzL2ZkdC9mZHRfaGVscGVy
LmMKPiBpbmRleCBhZDRlZmFhZi4uOGI0MGNkMjggMTAwNjQ0Cj4gLS0tIGEvbGliL3V0aWxzL2Zk
dC9mZHRfaGVscGVyLmMKPiArKysgYi9saWIvdXRpbHMvZmR0L2ZkdF9oZWxwZXIuYwo+IEBAIC00
NTcsNiArNDU3LDY3IEBAIGludCBmZHRfcGFyc2VfaXNhX2V4dGVuc2lvbnNfYWxsX2hhcnRzKGNv
bnN0IHZvaWQgKmZkdCkKPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4KPiAraW50IGZkdF9wYXJz
ZV93b3JsZHNfYWxsX2hhcnRzKGNvbnN0IHZvaWQgKmZkdCkKPiArewo+ICsgICAgICAgdTMyIGhh
cnRpZDsKPiArICAgICAgIGNvbnN0IGZkdDMyX3QgKnZhbDsKPiArICAgICAgIHN0cnVjdCBzYmlf
c2NyYXRjaCAqc2NyYXRjaDsKPiArICAgICAgIHN0cnVjdCBzYmlfaGFydF9mZWF0dXJlcyAqaGZl
YXR1cmVzOwo+ICsgICAgICAgaW50IGVyciwgY3B1X29mZnNldCwgY3B1c19vZmZzZXQsIGxlbjsK
PiArCj4gKyAgICAgICBpZiAoIWZkdCkKPiArICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FSU5W
QUw7Cj4gKwo+ICsgICAgICAgY3B1c19vZmZzZXQgPSBmZHRfcGF0aF9vZmZzZXQoZmR0LCAiL2Nw
dXMiKTsKPiArICAgICAgIGlmIChjcHVzX29mZnNldCA8IDApCj4gKyAgICAgICAgICAgICAgIHJl
dHVybiBjcHVzX29mZnNldDsKPiArCj4gKyAgICAgICBmZHRfZm9yX2VhY2hfc3Vibm9kZShjcHVf
b2Zmc2V0LCBmZHQsIGNwdXNfb2Zmc2V0KSB7CndoYXQgYWJvdXQgcmlzY3YsbndvcmxkcyA/IEkg
dGhpbmsgeW91IHNob3VsZCBwYXJzZSB0aGlzIGFuZCBiYXNlZCBvbgp0aGF0IGFzc3VtZSB3aWQg
cmFuZ2UgLSBhbmQgcmVzdCBvZiB0aGUgd2lkcyBzaG91bGQgYmUgcmVqZWN0ZWQuCj4gKyAgICAg
ICAgICAgICAgIGVyciA9IGZkdF9wYXJzZV9oYXJ0X2lkKGZkdCwgY3B1X29mZnNldCwgJmhhcnRp
ZCk7Cj4gKyAgICAgICAgICAgICAgIGlmIChlcnIpCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
Y29udGludWU7Cj4gKwo+ICsgICAgICAgICAgICAgICBpZiAoIWZkdF9ub2RlX2lzX2VuYWJsZWQo
ZmR0LCBjcHVfb2Zmc2V0KSkKPiArICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiAr
Cj4gKyAgICAgICAgICAgICAgIHNjcmF0Y2ggPSBzYmlfaGFydGlkX3RvX3NjcmF0Y2goaGFydGlk
KTsKPiArICAgICAgICAgICAgICAgaWYgKCFzY3JhdGNoKQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIHJldHVybiBTQklfRU5PRU5UOwo+ICsKPiArICAgICAgICAgICAgICAgaGZlYXR1cmVzID0g
c2JpX2hhcnRfZmVhdHVyZXNfcHRyKHNjcmF0Y2gpOwo+ICsgICAgICAgICAgICAgICBpZiAoIWhm
ZWF0dXJlcykKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VOT0VOVDsKPiAr
Cj4gKyAgICAgICAgICAgICAgIHZhbCA9IGZkdF9nZXRwcm9wKGZkdCwgY3B1X29mZnNldCwgInJp
c2N2LHBtd2lkIiwgJmxlbik7Cj4gKyAgICAgICAgICAgICAgIGlmICh2YWwgJiYgbGVuID09IHNp
emVvZihmZHQzMl90KSkgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIGhmZWF0dXJlcy0+cG13
aWQgPSBmZHQzMl90b19jcHUoKnZhbCk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgaGZlYXR1
cmVzLT5oYXNfcG13aWQgPSB0cnVlOwo+ICsgICAgICAgICAgICAgICB9Cj4gKwo+ICsgICAgICAg
ICAgICAgICB2YWwgPSBmZHRfZ2V0cHJvcChmZHQsIGNwdV9vZmZzZXQsICJyaXNjdixwbXdpZGxp
c3QiLCAmbGVuKTsKPiArICAgICAgICAgICAgICAgaWYgKHZhbCAmJiBsZW4gPT0gMiAqIHNpemVv
ZihmZHQzMl90KSkgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIGhmZWF0dXJlcy0+cG13aWRs
aXN0ID0gKCh1NjQpZmR0MzJfdG9fY3B1KHZhbFswXSkgPDwgMzIpIHwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmZHQzMl90b19jcHUodmFsWzFdKTsK
PiArICAgICAgICAgICAgICAgfQpPemE6IHByb3ZpZGUgc29tZSBkZWZpbmVzIGZvciBtYWdpYyBu
dW1iZXJzLgo+ICsKPiArICAgICAgICAgICAgICAgdmFsID0gZmR0X2dldHByb3AoZmR0LCBjcHVf
b2Zmc2V0LCAicmlzY3YscG1sd2lkbGlzdCIsICZsZW4pOwo+ICsgICAgICAgICAgICAgICBpZiAo
dmFsICYmIGxlbiA9PSAyICogc2l6ZW9mKGZkdDMyX3QpKSB7Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgaGZlYXR1cmVzLT5wbWx3aWRsaXN0ID0gKCh1NjQpZmR0MzJfdG9fY3B1KHZhbFswXSkg
PDwgMzIpIHwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZmR0MzJfdG9fY3B1KHZhbFsxXSk7Cj4gKyAgICAgICAgICAgICAgIH0KPiArCj4gKyAgICAg
ICAgICAgICAgIC8qIFNhbml0eSBjaGVja3MgKi8KPiArICAgICAgICAgICAgICAgaWYgKGhmZWF0
dXJlcy0+aGFzX3Btd2lkICYmIChoZmVhdHVyZXMtPnBtd2lkID49IDY0KSkKT3phOiAgZmVhdHVy
ZXMtPnBtd2lkID49bndvcmxkcyA/Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFNC
SV9FSU5WQUw7Cj4gKyAgICAgICAgICAgICAgIGlmIChoZmVhdHVyZXMtPmhhc19wbXdpZCAmJiBo
ZmVhdHVyZXMtPnBtd2lkbGlzdCAmJgo+ICsgICAgICAgICAgICAgICAgICAgIShoZmVhdHVyZXMt
PnBtd2lkbGlzdCAmIEJJVF9VTEwoaGZlYXR1cmVzLT5wbXdpZCkpKSB7Cj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgcmV0dXJuIFNCSV9FSU5WQUw7Cj4gKyAgICAgICAgICAgICAgIH0KPiArICAg
ICAgIH0KPiArCj4gKyAgICAgICByZXR1cm4gMDsKPiArfQo+ICsKPiAgc3RhdGljIGludCBmZHRf
cGFyc2VfdWFydF9ub2RlX2NvbW1vbihjb25zdCB2b2lkICpmZHQsIGludCBub2Rlb2Zmc2V0LAo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHBsYXRmb3JtX3Vh
cnRfZGF0YSAqdWFydCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVu
c2lnbmVkIGxvbmcgZGVmYXVsdF9mcmVxLAo+IGRpZmYgLS1naXQgYS9wbGF0Zm9ybS9nZW5lcmlj
L3BsYXRmb3JtLmMgYi9wbGF0Zm9ybS9nZW5lcmljL3BsYXRmb3JtLmMKPiBpbmRleCAxZGYwMjgw
ZC4uNTFlOWYzNDIgMTAwNjQ0Cj4gLS0tIGEvcGxhdGZvcm0vZ2VuZXJpYy9wbGF0Zm9ybS5jCj4g
KysrIGIvcGxhdGZvcm0vZ2VuZXJpYy9wbGF0Zm9ybS5jCj4gQEAgLTI1NSwxMSArMjU1LDIyIEBA
IGludCBnZW5lcmljX2ZpbmFsX2luaXQoYm9vbCBjb2xkX2Jvb3QpCj4KPiAgaW50IGdlbmVyaWNf
ZXh0ZW5zaW9uc19pbml0KGJvb2wgY29sZF9ib290KQo+ICB7Cj4gKyAgICAgICBpbnQgcmM7Cj4g
Kwo+ICAgICAgICAgaWYgKCFjb2xkX2Jvb3QpCj4gICAgICAgICAgICAgICAgIHJldHVybiAwOwo+
Cj4gICAgICAgICAvKiBQYXJzZSB0aGUgSVNBIHN0cmluZyBmcm9tIEZEVCBhbmQgZW5hYmxlIHRo
ZSBsaXN0ZWQgZXh0ZW5zaW9ucyAqLwo+IC0gICAgICAgcmV0dXJuIGZkdF9wYXJzZV9pc2FfZXh0
ZW5zaW9uc19hbGxfaGFydHMoZmR0X2dldF9hZGRyZXNzKCkpOwo+ICsgICAgICAgcmMgPSBmZHRf
cGFyc2VfaXNhX2V4dGVuc2lvbnNfYWxsX2hhcnRzKGZkdF9nZXRfYWRkcmVzcygpKTsKPiArICAg
ICAgIGlmIChyYykKPiArICAgICAgICAgICAgICAgcmV0dXJuIHJjOwo+ICsKPiArICAgICAgIC8q
IFBhcnNlIFJJU0MtViBXb3JsZHMgQ1BVIHByb3BlcnRpZXMgZnJvbSBGRFQgKi8KPiArICAgICAg
IHJjID0gZmR0X3BhcnNlX3dvcmxkc19hbGxfaGFydHMoZmR0X2dldF9hZGRyZXNzKCkpOwo+ICsg
ICAgICAgaWYgKHJjKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gcmM7Cj4gKwo+ICsgICAgICAg
cmV0dXJuIDA7Cj4gIH0KPgo+ICBpbnQgZ2VuZXJpY19kb21haW5zX2luaXQodm9pZCkKPiAtLQo+
IDIuNDMuNwo+Cj4KPiAtLQo+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gb3BlbnNiaUBsaXN0cy5p
bmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9vcGVuc2JpCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNi
aQo=
