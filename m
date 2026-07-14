Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8456EC43458
	for <opensbi@archiver.kernel.org>; Tue, 14 Jul 2026 00:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JZQQlxhbvqRjmGFVTIoM0V1Vk5f4BM4Q1nd9YLe+mUw=; b=MColPFJfl+fld2
	iZEx7p2MVhqA1bQhqUedfH4xiyp2Y6eY4sboqffkW9r9dGz0/4KTRhtKFlxw+nc8ppPINSlmyG6xr
	c5oA2yA8Dkyy+O7AzmHeWKxWO28yl5cebp/qrvelSDFhA7IlK0cwRpTRm0hc3gfVn0+k/8Grk8eda
	9QmZu0LD9DGruxdFezkw8fIPySlLI3KTV6089ZQFxDO9M/vDmVLIQf95VkEegVXVtLvucbU/2XheT
	UQq3cigfeQ1/mlj2edv3TbLdTg5yPI7aNfvsJv6faj0Ts1wVJxCaFDnu0OkSSDCgqXQ8IXbIOKH7h
	/N17txmL9z2/k9duSmIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjR5V-0000000Abje-35Ey;
	Tue, 14 Jul 2026 00:33:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjR5T-0000000Abj0-0ARK
	for opensbi@lists.infradead.org;
	Tue, 14 Jul 2026 00:33:28 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DNnLXA3050568
	for <opensbi@lists.infradead.org>; Tue, 14 Jul 2026 00:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PwKjS8mnbbB0UCXHOaGsSTstfo1iR7wjM06xy8CPhQI=; b=grF2LSQ4JFfxh1SX
	SHzzw+9CgPr1hMIiwuW+vXNCSLceIRBzX2Q3qgF6uyhj18GZnCrKjxJdL9Xs+XM2
	voTtxkhLvePd7Yr2P4D0Q1ZW1ONZKRcsr6R/t4fGzx2noHbtwmxNM/M8xMDXBxhC
	w6R1ww3PS0hsxSDPyWIAbujTN5ypgeEARtG5FnF0clpix+GFRUIUe4BD9WdXtQv/
	ZiPyRv5eshEZjZ7sqYCazkmF4YMo3ons4tHUGLWaycJzfMBUcsP+PS6XHdmHpa6B
	zRXECcchiw/8tm5Fx58U4zEdJqqLIMcobLTRM/gYcVtOpynbT7risohsqAsjd0ui
	7aQahg==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd37x9j5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 14 Jul 2026 00:33:26 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6a37fe3aa04so771920eaf.0
        for <opensbi@lists.infradead.org>; Mon, 13 Jul 2026 17:33:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783989206; cv=none;
        d=google.com; s=arc-20260327;
        b=I1W0n4YjaacmuDzZBzGFkDH+ZoF8RvKy80a+8jwWUdpZOkwW6iFBXRclvD8hALWU3l
         Fw1Tlp2NXN1270dvYUwXUWfNottpBjWnlnBMssRXEeIMwanvh2dChyZ+QFWrv0LDI+sh
         IuIPegUsMCPZkuM0odcej3X2Dv2DMncuMDF5jURqiWafCzq4M2yhM7hZFBIDTiOAmW2v
         qJVaZJ3Xb0s9eJ6ul75YCdtqQYUTB/c2Eb4xDtJDl4t1LV7LNot6gk7JiLoHKgJf++C7
         pFi6XgdsEtqSmohK6rpIxLeL/v4CdQsmMWdwQFpWwzWSYdE638Zv1PGzOJg/O03O+AHd
         ePMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PwKjS8mnbbB0UCXHOaGsSTstfo1iR7wjM06xy8CPhQI=;
        fh=cyWYA3kXN4M7205T7O+U3EeZKBOqXRScKUv8W0MgTLc=;
        b=lrcd/aQWONNJVdQNk7h3/MdS6cmDarF3b2eYaZS2tUQEIJpVbpDAz7ITzSeHj6Dlxc
         s6gPJ/xtMh+Ki/1LB0Myqu0FnSA7UrS7v6l8+X4ZoHzEb121pnxqp3uArS1ZASAVAxKS
         D9VFMT9ndnVfx4nWdU2aC2ONNRgybuWyabM11xmCzBaTyHuyChFXs3RqnM6+cm+zVCTS
         /XxjzBI0XUGf8Yr28+eVY3QG5X4XDozC/AIKEfqvmMQ4I8Amww4W1pREy0dfIkeBC3cq
         ptEEcm38uftD2FqEHyckEe0BV0iMIO5slSTy4GsNBKCRJGdOltBpBJbRwbYtA3ZfBFp6
         FZFg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783989206; x=1784594006; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PwKjS8mnbbB0UCXHOaGsSTstfo1iR7wjM06xy8CPhQI=;
        b=XZLQo7uhd6xr8jR4N8vVGq5kNE2CdJknV+cRgKkD3OGLr/R9gQIWLFQfH/r2J5Mfaf
         dqaCBBbRwpsOi7bQjvjg/cgwNJ5dso0if1KlVUO4xIz+1QwnTKNbXj5vITrMKjlj18pH
         3P6Qx9CNEI/pqPCU0bzAlwyixK8J3ZrFG24hx+xbQGqr7pU/BSuk4EoQ5a9vFVPdjH6l
         5ZwpF0pk7Yyfo6YCFnFMBBQEmoVWI7Okft9qXMzhJ5TyPrH5DB6awLHMz/unOTBp+0KN
         2PitT1765/Gg9CuFjDIBbpimrb34OpHHM+kNbD+pki+nGOlYBpV4ap35cLERWO9kCib5
         9uog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783989206; x=1784594006;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PwKjS8mnbbB0UCXHOaGsSTstfo1iR7wjM06xy8CPhQI=;
        b=OJXpz6nrdc9KXoWb1v7IfRCkNUTdxlBNJiDZAXD8HZs3Go75dn71XfyDX1OW2b/6At
         pabv/ptrJUNMKdWMWrDryA6qgosCdqRYa9yeC6SgiwRX9QTG2/XZYo6kBbjrQlwKUDVz
         IxLNb2hEVC39ZKvr/XW9RKMHjQjnOVBYVlozZwGQ6/XO4CjkeuL3fuijI7dLNasxPCoT
         CS9cLCd7UX3eWsfKKGodg3rvqbEHu6pWfxfyl7s4Wzwgp34aPylabMQgiYBQo5ErFLEn
         IyjcjVmAXU93ZvjwZAmWJuKNeLuksfXMR3r1/XQa3M3YxNa9kVvYiFdFye6Dk9cDh9Ps
         cHww==
X-Gm-Message-State: AOJu0YwodnJORdZgekq/BxtGjIbHyRjP3z02wiQ6RLSkeNhEWTMGija2
	iwdS2VxL7/N/linTZSCBBw0Gr1tU1GyFfJaqIx3uDL73XAyZ+gHeYHw5kQ0SM34pRtYej+EDgsf
	JmOdb1k4x3yEkkpviRc2Un0jrYzdXdCWtow5cN2k1HHOo7inNDZsPSo/Mi9ihdG8L8ubs1LCOi3
	xcl5yubDVe3uZGZmclsipWxDMekOhSAMU5bRAY61SC
X-Gm-Gg: AfdE7cnODdg0pTmZK6CDj1hkBnDNaNtNruOEa51vJX1BlKWvOQcjffj0wohTJ7gpvqn
	DgAd0pOB9r4yPsSKxTksPIQcuI+nDuVSTOgm+AfROUanN1ZYkTCNe5oOIGWkj42O/7YvroqlvEI
	v6NXjYor7IcJvQkthOJeQHJBs5oOCgs6BR0FMcgKF9na406IWeTIyuntbA6fghO1egZe0GpQ==
X-Received: by 2002:a05:6820:1387:b0:69d:c5ad:40aa with SMTP id 006d021491bc7-6a39a854c09mr6209978eaf.40.1783989205584;
        Mon, 13 Jul 2026 17:33:25 -0700 (PDT)
X-Received: by 2002:a05:6820:1387:b0:69d:c5ad:40aa with SMTP id
 006d021491bc7-6a39a854c09mr6209953eaf.40.1783989205150; Mon, 13 Jul 2026
 17:33:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260626101433.3133466-1-peter.lin@sifive.com> <CAAVgOkKk=KXy4MqNMYM3FA+vsdWN8cDdrZUXnDY9KgqNqhwV=Q@mail.gmail.com>
In-Reply-To: <CAAVgOkKk=KXy4MqNMYM3FA+vsdWN8cDdrZUXnDY9KgqNqhwV=Q@mail.gmail.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 17:33:13 -0700
X-Gm-Features: AUfX_mx-kp9Qyzv1SG7EmHWltGLqq5KxnRS9yxbRvUMGi92Yt0edT_a7Ar8k_TI
Message-ID: <CAAVgOkJTLvqjvQLLp3qDKvGYigPq1jLu75MBAWSSXEMdGYNzfQ@mail.gmail.com>
Subject: Re: [RFC PATCH 00/12] Add RISC-V Worlds ISA support to OpenSBI
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com, greentime.hu@sifive.com,
        anup@brainfault.org, scott@riscstar.com, conor@kernel.org,
        dave.patel@riscstar.com, raymond.mao@riscstar.com,
        robin.randhawa@sifive.com, samuel.holland@sifive.com
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDAwNCBTYWx0ZWRfX9drTPVl/P75L
 ldeXGOo2DwgoN4R9x5XGtU9k9IE1q+XJI0EgrePlkXV993aGKw8Kcaoxm01gE3b0xFQeibRMo0W
 z+pp97SCddomm9A+F8gmKe9k2rguFqi1F8jCuZeSiNyAR8siqxjy5RW3GGg60655Ub+f3Vsbbhu
 cieyWlQX7SUBLO5hVbzB4gAWh3CaWEDsCGQDoWzSDKNbs2gBILyX4QDUEUxv4+nRkXEBbA9F1x4
 5t4o9cQycIpgQi7jJjTdf366HR/+iLHCpOdUeMMp3OhBDQXXZlqXCs7oxTz9aAx2f7RYVCgwma3
 CXMVphO4lNgruP3qdfljXxZrHScZFphRfbELPd3NZ+0HHzPft7LM0CCi4C+ZALcokAIZ6IO1Hpx
 iVDSx4zPrWheVSprcc0ssxYsUKRQL6zA7aStl6Mi8fVOwp4n8hn4JOLkhliswkyjE1zIQZJvPkh
 QnvmPZz1xdy9vxG/I6g==
X-Authority-Analysis: v=2.4 cv=BNWDalQG c=1 sm=1 tr=0 ts=6a5583d6 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=pFyQfRViAAAA:8
 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=wI5joPN9iGgGYwVyID0A:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22 a=oJz5jJLG1JtSoe7EL652:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: I6izTSJd9Kl7al6UvM3Q7m5EyaIw3tIO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDAwNCBTYWx0ZWRfX6ljh8YLKTFWD
 bVInaBgd4M1/5Lo+BZ8+TLLi5UU/iMznxQAU0E2kynXiPJuiVzOzid0kw115D6hByspbqvTX5K7
 DFurbaLtRkc3wHGtTVcbSo1b0H1UZyY=
X-Proofpoint-GUID: I6izTSJd9Kl7al6UvM3Q7m5EyaIw3tIO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_173327_095106_00EA5E03 
X-CRM114-Status: GOOD (  28.54  )
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

T24gV2VkLCBKdWwgOCwgMjAyNiBhdCA1OjQ04oCvUE0gUGF3YW5kZWVwIE96YQo8cGF3YW5kZWVw
Lm96YUBvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgSnVuIDI2LCAyMDI2IGF0
IDM6MTbigK9BTSBZdS1DaGllbiBQZXRlciBMaW4gPHBldGVyLmxpbkBzaWZpdmUuY29tPiB3cm90
ZToKPgo+IE96YTogSSBoYXZlIHN0YXJ0ZWQgcmV2aWV3aW5nIHRoaXMgc2VyaWVzLCBhbmQgd2ls
bCBwcm92aWRlIGNvbW1lbnRzCj4gaW4gY29taW5nIGRheXMuCj4gPgo+ID4gVGhpcyBSRkMgcGF0
Y2ggc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgUklTQy1WIFdvcmxkcyBJU0EgZXh0ZW5zaW9ucywK
PiA+IGVuYWJsaW5nIGhhcmR3YXJlLWVuZm9yY2VkIGlzb2xhdGlvbiBib3VuZGFyaWVzIGJhc2Vk
IG9uIFdvcmxkIElEcyAoV0lEcykKPiA+IGJ5IGV4dGVuZGluZyB0aGUgT3BlblNCSSBkb21haW4g
ZnJhbWV3b3JrLgo+ID4KPiA+IFRydXN0IE1vZGVsIGFuZCBCb290LXRpbWUgUm9sZXMKPiA+IC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPgo+ID4gVGhlIGltcGxlbWVudGF0aW9u
IGZvbGxvd3MgdGhlIHR3by1waGFzZSBNLW1vZGUgdHJ1c3QgbW9kZWw6Cj4gPgo+ID4gLSBSb1Qg
TS1tb2RlIHBoYXNlOiBQcmlvciBib290IHN0YWdlIChST00vU1BMKSB0aGF0IG1heSBwcm9ncmFt
IG13aWQvCj4gPiAgIG1sd2lkbGlzdCBhbmQgbG9jayBtd2lkIGJlZm9yZSBoYW5kaW5nIG9mZiB0
byBPcGVuU0JJLgo+ID4KPiA+IC0gUmVndWxhciBNLW1vZGUgcGhhc2UgKE9wZW5TQkkpOiBUcmVh
dHMgcG13aWQvcG13aWRsaXN0L3BtbHdpZGxpc3QgYXMKPiA+ICAgcmVhZC1vbmx5IGlucHV0IHBv
bGljeSBmcm9tIGhhcmR3YXJlL1JvVC4gTG9ja3MgbXdpZCBkdXJpbmcgZmVhdHVyZQo+ID4gICBk
ZXRlY3Rpb24gdG8gcHJldmVudCBsYXRlciBNLW1vZGUgY29kZSBmcm9tIGNoYW5naW5nIGl0cyBv
d24gV0lELgo+ID4gICBQcm9ncmFtcyBwZXItZG9tYWluIG1sd2lkL213aWRkZWxlZyBiYXNlZCBv
biBEVCBjb25maWd1cmF0aW9uLgo+ID4KPiA+IERldmljZSBUcmVlIEJpbmRpbmdzCj4gPiAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0KPiA+Cj4gPiBOZXcgQ1BVIHByb3BlcnRpZXMgKHBlci1oYXJ0KToK
PiA+IC0gcmlzY3YscG13aWQ6IFBsYXRmb3JtLWRlZmluZWQgTS1tb2RlIFdvcmxkIElECj4gPiAt
IHJpc2N2LHBtd2lkbGlzdDogTS1tb2RlIHBlcm1pdHRlZCBXSUQgYml0bWFwICh1NjQsIDIgY2Vs
bHMpCj4gPiAtIHJpc2N2LHBtbHdpZGxpc3Q6IFMvVS1tb2RlIHBlcm1pdHRlZCBXSUQgYml0bWFw
ICh1NjQsIDIgY2VsbHMpCj4gPgo+ID4gTmV3IGRvbWFpbiBwcm9wZXJ0aWVzIChwZXItZG9tYWlu
KToKPiA+IC0gbmV4dC13aWQ6IE92ZXJyaWRlIFMtbW9kZSBXSUQgZm9yIHRoaXMgZG9tYWluICh1
MzIsIDEgY2VsbCkKPiA+IC0gbmV4dC13aWRsaXN0OiBXSUQgZGVsZWdhdGlvbiBiaXRtYXAgZm9y
IHRoaXMgZG9tYWluICh1NjQsIDIgY2VsbHMpCj4gPgo+ID4gSWYgYSBkb21haW4gbGFja3MgbmV4
dC13aWQsIE9wZW5TQkkgZmFsbHMgYmFjayB0byBwbXdpZCAoTS1tb2RlIGFuZAo+ID4gUy1tb2Rl
IHJ1biBpbiB0aGUgc2FtZSBXb3JsZCkuCj4gPgo+ID4gRXhhbXBsZSBEVCBzbmlwcGV0Ogo+ID4K
PiA+ICAgICBjcHVzIHsKPiA+ICAgICAgICAgcmlzY3YsbndvcmxkcyA9IDw0PjsKPiA+ICAgICAg
ICAgY3B1QDAgewo+ID4gICAgICAgICAgICAgcmlzY3YscG13aWQgPSA8Mz47Cj4gPiAgICAgICAg
ICAgICByaXNjdixwbXdpZGxpc3QgPSA8MHgwIDB4Zj47Cj4gPiAgICAgICAgICAgICByaXNjdixw
bWx3aWRsaXN0ID0gPDB4MCAweGY+Owo+ID4gICAgICAgICB9Owo+ID4gICAgIH07Cj4gPgo+ID4g
ICAgIGNob3NlbiB7Cj4gPiAgICAgICAgIG9wZW5zYmktZG9tYWlucyB7Cj4gPiAgICAgICAgICAg
ICB0cnVzdGVkLWRvbWFpbiB7Cj4gPiAgICAgICAgICAgICAgICAgbmV4dC13aWQgPSA8MT47Cj4g
PiAgICAgICAgICAgICAgICAgbmV4dC13aWRsaXN0ID0gPDB4MCAweDI+Owo+ID4gICAgICAgICAg
ICAgfTsKPiA+ICAgICAgICAgICAgIHVudHJ1c3RlZC1kb21haW4gewo+ID4gICAgICAgICAgICAg
ICAgIG5leHQtd2lkID0gPDA+Owo+ID4gICAgICAgICAgICAgICAgIG5leHQtd2lkbGlzdCA9IDww
eDAgMHgxPjsKPiA+ICAgICAgICAgICAgIH07Cj4gPiAgICAgICAgIH07Cj4gPiAgICAgfTsKCk96
YTogbGV0cyBzdGFydCBhIGJpdCBmcm9tIGhlcmUgZnJvbSBkZXZpY2UgdHJlZS4KCmNwdXMgewog
ICAgcmlzY3YsbndvcmxkcyA9IDw0PjsKCiAgICBjcHVAMCB7CiAgICAgICAgcmlzY3YscG13aWQg
ICAgICA9IDwzPjsgICAgICAgLyogTS1tb2RlIGxpdmVzIGluIFdvcmxkIDMgKi8KICAgICAgICBy
aXNjdixwbXdpZGxpc3QgID0gPDB4MCAweGY+OyAvKiBNLW1vZGUgY2FuIGFjY2VzcyBXb3JsZHMg
MC0zICovCiAgICAgICAgcmlzY3YscG1sd2lkbGlzdCA9IDwweDAgMHhmPjsgLyogUy9VLW1vZGUg
Y2FuIHVzZSBXb3JsZHMgMC0zICovCiAgICB9Owp9OwoKY2hvc2VuIHsKICAgIG9wZW5zYmktZG9t
YWlucyB7CiAgICAgICAgLyogV0lEIDMg4oCUIE0tbW9kZSAoaW1wbGljaXQsIHZpYSBwbXdpZCkg
Ki8KICAgICAgICB0cnVzdGVkLWRvbWFpbiB7CiAgICAgICAgICAgIHdpZCAgICAgPSA8Mj47ICAg
ICAgIC8qIFdJRCAyIOKAlCB0cnVzdGVkIFMtbW9kZSAqLwogICAgICAgICAgICB3aWRsaXN0ID0g
PDB4MCAweDQ+OyAvKiBjYW4gZGVsZWdhdGUgV0lEIDIgdG8gVS1tb2RlICovCiAgICAgICAgfTsK
ICAgICAgICB1bnRydXN0ZWQtZG9tYWluIHsKICAgICAgICAgICAgd2lkICAgICA9IDwxPjsgICAg
ICAgLyogV0lEIDEg4oCUIHVudHJ1c3RlZCBTLW1vZGUgKi8KICAgICAgICAgICAgd2lkbGlzdCA9
IDwweDAgMHgwPjsgLyogbm8gZGVsZWdhdGlvbiAqLwogICAgICAgIH07CiAgICAgICAgcm9vdC1k
b21haW4gewogICAgICAgICAgICB3aWQgICAgID0gPDA+OyAgICAgICAvKiBXSUQgMCDigJQgcm9v
dC91bnByb3RlY3RlZCAqLwogICAgICAgICAgICB3aWRsaXN0ID0gPDB4MCAweDA+OwogICAgICAg
IH07CiAgICB9Owp9OwoKPiA+Cj4gPiBLbm93biBMaW1pdGF0aW9ucyBhbmQgRnV0dXJlIFdvcmsK
PiA+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+Cj4gPiBUaGlzIFJGQyBp
bXBsZW1lbnRzIGNvcmUgZnVuY3Rpb25hbGl0eSBidXQgaGFzIHNldmVyYWwgYXJlYXMgcmVxdWly
aW5nCj4gPiByZWZpbmVtZW50IGluIHRoZSBmdXR1cmUgcmV2aXNpb25zOgo+ID4KPiA+IDEuIFdJ
RCBWYWxpZGF0aW9uOgo+ID4gICAgLSBEb21haW4gbmV4dC13aWQgaXMgTk9UIHZhbGlkYXRlZCBh
Z2FpbnN0IHBtbHdpZGxpc3QKPiA+ICAgIC0gRG9tYWluIG5leHQtd2lkbGlzdCBpcyBOT1QgdmFs
aWRhdGVkIGFzIHN1YnNldCBvZiBwbWx3aWRsaXN0Cj4gPiAgICAtIEludmFsaWQgV0lEIGNvbmZp
Z3VyYXRpb24gZmFpbHMgYXQgcnVudGltZSB3aXRoIHNvZnR3YXJlLWNoZWNrCj4gPiAgICAgIGV4
Y2VwdGlvbnMgcmF0aGVyIHRoYW4gYXQgZG9tYWluIHJlZ2lzdHJhdGlvbiB0aW1lCj4gPiAgICAt
IFBsYW5uZWQ6IEFkZCB2YWxpZGF0aW9uIGluIHNhbml0aXplX2RvbWFpbigpIHRvIGNhdGNoIGVy
cm9ycyBlYXJseQo+ID4KPiA+IDIuIFJlc3VtZSBQYXRoIG13aWQgUmVzdG9yYXRpb246Cj4gPiAg
ICAtIEN1cnJlbnQgaW1wbGVtZW50YXRpb24gb25seSByZS1sb2NrcyBtd2lkIG9uIHJlc3VtZSwg
YXNzdW1pbmcgUm9UCj4gPiAgICAgIGhhcyBhbHJlYWR5IHJlc3RvcmVkIHRoZSBjb3JyZWN0IFdJ
RCB2YWx1ZQo+ID4gICAgLSBObyBtZWNoYW5pc20gdG8gdmVyaWZ5IG9yIGFjdGl2ZWx5IHJlc3Rv
cmUgbXdpZCB0byBSb1QtZGVmaW5lZCB2YWx1ZQo+ID4KPiA+IFNwZWNpZmljYXRpb24gUmVmZXJl
bmNlcwo+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4KPiA+IC0gUklTQy1WIFdvcmxk
cyBJU0EgU3BlYzogaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LXdvcmxkcwo+ID4gICAo
UmVsZWFzZTogcmlzY3YtaXNhLXJlbGVhc2UtNGM4MWEzZi0yMDI2LTA0LTE0KQo+ID4gLSBEZXZp
Y2UgVHJlZSBQcm9wb3NhbDogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwNjE5MTA1
ODM0LjEyNzczMDItMS1wZXRlci5saW5Ac2lmaXZlLmNvbS8KPiA+Cj4gPiBZdS1DaGllbiBQZXRl
ciBMaW4gKDEyKToKPiA+ICAgbGliOiBzYmlfaGFydDogZGV0ZWN0IFJJU0MtViBXb3JsZHMgSVNB
IGV4dGVuc2lvbnMKPiA+ICAgbGliOiB1dGlsczogZmR0X2hlbHBlcjogcGFyc2UgUklTQy1WIFdv
cmxkcyBEVCBwcm9wZXJ0aWVzCj4gPiAgIGxpYjogc2JpX2hhcnQ6IGVuZm9yY2UgcmlzY3YscG13
aWQgZm9yIFdvcmxkcyBJU0EKPiA+ICAgbGliOiBzYmlfaGFydDogbG9jayBtd2lkIENTUiBmb3Ig
Um9UIGltbXV0YWJpbGl0eQo+ID4gICBpbmNsdWRlOiBzYmlfZG9tYWluOiBhZGQgV29ybGRzIFdJ
RCBmaWVsZHMKPiA+ICAgaW5jbHVkZTogc2JpX3R5cGVzOiBhZGQgUFJJeDY0IGZvcm1hdCBtYWNy
bwo+ID4gICBsaWI6IHNiaV9kb21haW46IHByaW50IFdvcmxkIElEIGNvbmZpZyBhdCBib290Cj4g
PiAgIGxpYjogc2JpX2luaXQ6IHByaW50IE0tbW9kZSBXb3JsZCBJRCBhdCBib290Cj4gPiAgIHBs
YXRmb3JtOiBnZW5lcmljOiBwYXJzZSByb290IGRvbWFpbiBXSUQgY29uZmlnIGZyb20gRFQKPiA+
ICAgbGliOiB1dGlsczogZmR0X2RvbWFpbjogcGFyc2UgcGVyLWRvbWFpbiBXSUQgcHJvcGVydGll
cwo+ID4gICBsaWI6IHNiaV9kb21haW46IGFkZCBXb3JsZHMgQ1NSIGNvbmZpZyBvbiBkb21haW4g
ZW50cnkKPiA+ICAgZG9jczogYWRkIFJJU0MtViBXb3JsZHMgbmV4dC13aWQvbmV4dC13aWRsaXN0
IERUIHByb3BlcnRpZXMKPiA+Cj4gPiAgZG9jcy9kb21haW5fc3VwcG9ydC5tZCAgICAgICAgICAg
ICB8IDEzICsrKysrKwo+ID4gIGRvY3Mvb3BlbnNiaV9jb25maWcubWQgICAgICAgICAgICAgfCAx
MyArKysrKysKPiA+ICBpbmNsdWRlL3NiaS9yaXNjdl9lbmNvZGluZy5oICAgICAgIHwgMTIgKysr
KysKPiA+ICBpbmNsdWRlL3NiaS9zYmlfZG9tYWluLmggICAgICAgICAgIHwgIDkgKysrKwo+ID4g
IGluY2x1ZGUvc2JpL3NiaV9oYXJ0LmggICAgICAgICAgICAgfCAyNSArKysrKysrKysrKwo+ID4g
IGluY2x1ZGUvc2JpL3NiaV90eXBlcy5oICAgICAgICAgICAgfCAgMiArCj4gPiAgaW5jbHVkZS9z
YmlfdXRpbHMvZmR0L2ZkdF9oZWxwZXIuaCB8ICAyICsKPiA+ICBsaWIvc2JpL3NiaV9kb21haW4u
YyAgICAgICAgICAgICAgIHwgNTAgKysrKysrKysrKysrKysrKysrKysrCj4gPiAgbGliL3NiaS9z
YmlfZG9tYWluX2NvbnRleHQuYyAgICAgICB8ICAzICsrCj4gPiAgbGliL3NiaS9zYmlfaGFydC5j
ICAgICAgICAgICAgICAgICB8IDcxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4g
IGxpYi9zYmkvc2JpX2hzbS5jICAgICAgICAgICAgICAgICAgfCAgNCArKwo+ID4gIGxpYi9zYmkv
c2JpX2luaXQuYyAgICAgICAgICAgICAgICAgfCAxMyArKysrKysKPiA+ICBsaWIvdXRpbHMvZmR0
L2ZkdF9kb21haW4uYyAgICAgICAgIHwgMTUgKysrKysrKwo+ID4gIGxpYi91dGlscy9mZHQvZmR0
X2hlbHBlci5jICAgICAgICAgfCA2MSArKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgcGxh
dGZvcm0vZ2VuZXJpYy9wbGF0Zm9ybS5jICAgICAgICB8IDMzICsrKysrKysrKysrKystCj4gPiAg
MTUgZmlsZXMgY2hhbmdlZCwgMzI0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPgo+
ID4gLS0KPiA+IDIuNDMuNwo+ID4KPiA+Cj4gPiAtLQo+ID4gb3BlbnNiaSBtYWlsaW5nIGxpc3QK
PiA+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QK
b3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
