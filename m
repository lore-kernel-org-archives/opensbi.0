Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A96C9830E
	for <opensbi@archiver.kernel.org>; Fri, 25 Sep 2026 18:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oSPucVCWYz4ldWb23R9T/Ke8wY80v5ZbjpyxCeoRar8=; b=Gq43QhRv3BlAWX
	9F8mST3G+BLvOXHBU3SzYq8rHazhPXmqXyt21qLqRjgZMbaVbDO1nDDVL2hghmzM7YRmKtkukVVgR
	8YEw67kOStTJUwqd7LXD21LpKVN7zS5COiXgNy5ylizl4H5TIUCyHdnGpezfzUW9KLIi/xBOKQkNL
	4+86uX6QI2op5RsxYctCvhiiJAJDRQW7hvw3zBXMiKsXk3ZCu8vQd6Zi7TA0EgEj1Z50bHqzTFNXs
	ty8EiFrrufAJEYeVyhDjJcjq1z6tA9aDwVYrLaog4qw/OGkQF5oy4xXgIBLKrNpm3jHH+ZI5a1w4C
	wxucSiD+4UHmPyzsIz9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAAcw-0000000E96Q-0nDe;
	Fri, 25 Sep 2026 18:26:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAAck-0000000E8zo-1Are
	for opensbi@lists.infradead.org;
	Fri, 25 Sep 2026 18:26:19 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PG3jPe801308
	for <opensbi@lists.infradead.org>; Fri, 25 Sep 2026 18:26:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fjmJkZtyv2I9E66ipPw/mDiaRdd9EDHKXOXqWWBLins=; b=MZOuzXiVk33kb4bN
	yjrTaHCm5UE+q3fjqpypHgzICJKJxITfoHoFW7HzuUK5teY5Cdd8lEY8cdYsk4Ny
	0PK/iMFnzGY1KejGiepzE5hmmTLMSqXpPSBo5Tvwdvbd8N7bn/9oJabtbjLbuin8
	Se8EFKKKXSvzmSINgM7WKY64tEldmURjbzXSjQH2T+1ZzqZyX9EfM+JnEtzaYQEb
	l9lNNget31JUjIG77HmxEPIe0MjdmG3SVBvl0OqtxhP+wnc9dciloGUQYYmYZGU5
	PqE7DYAH/HrG0I40T/Xu9dWHZG7fevIIg0KExn10/i8e/1fh0AZSevtlt688ngdK
	ErsiuQ==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwv57gksd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Fri, 25 Sep 2026 18:26:17 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-48296f34f1dso1402811fac.3
        for <opensbi@lists.infradead.org>; Fri, 25 Sep 2026 11:26:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790360776; cv=none;
        d=google.com; s=arc-20260327;
        b=Nm2rr5DItTI18OLNmAHq1xQpanYNb/W7j/vkQhA1ml5Es288CVsYK2cvfXnnZJI+rs
         ANFut3+SdWgH5LxD+puR2bKopkbOkovT4gNmKFfxMLjvv0YAr9Wi3WUTH7iRQrrghN7r
         Qu1bakfMhxy7xySG5lWCg/K7R2F0gmNpQdCTuFM+QxMJuCuNOBgQ0wD5taTaxs1OboOM
         pUEFh0l5a8UhdmQa1PGxLu8i1vefoNysF1Ia9TY8IyhZIURgcmic2L6CbK9MurKQvZlP
         9PSF8JUbndp7XInYh71w28v9VEZlVGGuJRNHnYb+Og8dBrMdQHbJx8MOY+QtJ6cZ1Qqt
         8Haw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fjmJkZtyv2I9E66ipPw/mDiaRdd9EDHKXOXqWWBLins=;
        fh=4ewBQFYQm5N+QAVC2yDkcGgJqnoV8H9Ixi/6ZlMkFAE=;
        b=SrxCNo0lKs3FpBy/Yp/fWLT646qJbEua6ix+hxWKuWNY4flUlzDvTfJgUoBscuBje5
         XMV5aweLpHv07myXxd9LaNssNGMaoyURXtY3lVuQh1u0Que6w1dzp/YbnAdrigVNs7Qt
         7kyRZ4cXtapwNZ+hNlyPMmN5paFp1tl31zDv1efE/dsNdeAqgogfvmhp0hicoQjmQ1Qz
         W7N56cQf2ZWk9+xESJGJUH7Mdmsr+JlGWtBD3zdBspgXNBSIGIIEwtrka9qlZeTZwg8G
         AVlY7aUGk52EhCBdbP943TJjpU3fnhu5ZZiw3P6xWi2hqU/dPcig8VHtXih03cexnTtU
         kYCQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790360776; x=1790965576; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fjmJkZtyv2I9E66ipPw/mDiaRdd9EDHKXOXqWWBLins=;
        b=ZzvYPz3L1OZyMdHjFdO+/3ORgew/+YCP6tlluD/bmfMdq1+Mqjc+k8OwhGR00tS/6F
         6txwQODzL73nfAasg2ZWOT3cEG6UaLyQJbInXncsh24ezurIuXx7ejdcqgFAzHKDUrP6
         q7d7fwEq6lQtw1Dp3jlgRxV1xHoNPV7NnDGF4sFiiCY7FmEdrpb8X5QqDASaqzeqr4zC
         kOxP2lSikMTMqh4PhOHgJfhXwokB86Uf9nJg88UAcDYyrk4Nz5bO6PhWPCnfcgwwK9jk
         BWyooBtdI0DT38I2ZTJNVkZPQCE3pWpzChBZbkfSHCGG8Oy9V7WQQhDIsPsPZdZQwBxq
         9U2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790360776; x=1790965576;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fjmJkZtyv2I9E66ipPw/mDiaRdd9EDHKXOXqWWBLins=;
        b=BRyEoTXXESP6TdAFaMEl/TVnuqopUZjfRYUdCybogxHlq38KmoMoPz7nF/WeAdeW22
         kPxhwUtUFZPv/WjsjgEvRXkYtc+u1uga7IrEPuKZ0Ou9pZ/cEX3sjq9tZDFlZSAC93I7
         4Bo4Cp3JbfMJBBBQYo9MGeGhzWZp9AbenVYl6G0gbuyB9ivDesTT/YXwqiD2LgopejUx
         yDou9+8c+eTG8BoMNrKP7zUsImiOY5peQYFnXHN2pgHp0TBYEXzBfm+hQRejTXe3CxfO
         t5/T2948myKwvHgTvcz1EyMnlQn2/8KyMbE5loh6QzyN1+60G0eLbnxhlo9yZRntqmZb
         xIJQ==
X-Gm-Message-State: AFuF++mo4OsbF9vn/q6lfDF8KXaZO4pLYH39k3HeauBKUjYbPHTjp+NA
	GgVHpu5zqe4TL4bytZAozXQ7RA+8NVOonm5xaycbIywiEH0sHDGi32UZr55bHzt46i89zQMvxv6
	POthFi1Ns0X8FX+af3fCq2rYdxAq5dR8waCrltszCpGIZLYYp3E/bd9jZHpRYFDvVU1lltYH9p2
	bfNdXAcRmTi7iqrtx12yRcwlp1a3Bnlk9HYUCTguTFYSn/YPdp
X-Gm-Gg: AYBFou0GDT4MnlL+z8rqPrZhlPWmcrf4EVoXKCJKFXo/t3aPyasq1U60MQaLOUtpnVw
	OGpUPo5NmF97OpTvgDO+IgMOHugjsFIaI/kgvvtK8Rslbk0erfeSMXRtPHJqcl1KOmYdPIBXDuW
	5sKowveMHZDVoIGDy199nzuEExij7aheg7ZbBYmr/cc9deLiiBVrUxZRA47Q==
X-Received: by 2002:a05:6871:6c17:b0:448:9d5b:6393 with SMTP id 586e51a60fabf-491e539b5c8mr7013571fac.14.1790360775998;
        Fri, 25 Sep 2026 11:26:15 -0700 (PDT)
X-Received: by 2002:a05:6871:6c17:b0:448:9d5b:6393 with SMTP id
 586e51a60fabf-491e539b5c8mr7013541fac.14.1790360775538; Fri, 25 Sep 2026
 11:26:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260817090503.2104998-1-peter.lin@sifive.com>
 <20260817090503.2104998-3-peter.lin@sifive.com> <CAAVgOk+t1aF6AQHSRkseKEBNc_UGhvjxPJ5KwbSQPJwdD-Cnrw@mail.gmail.com>
 <arTSR83onqjV23CV@plin-1878>
In-Reply-To: <arTSR83onqjV23CV@plin-1878>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 11:26:04 -0700
X-Gm-Features: AclHuK9L3Wipw3SI_LY4P-Q-fZu2Mqzjb-WuTjSLQFGu-lFqXlsHakFkthmYMZI
Message-ID: <CAAVgOkJngC+dpKyd=icWNJcvDYQrmqHBVfWphAxhrzK+NeJZ3g@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] lib: utils: fdt_helper: parse RISC-V Worlds
 per-hart WID properties
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com, greentime.hu@sifive.com,
        anup@brainfault.org, scott@riscstar.com, conor@kernel.org,
        dave.patel@riscstar.com, raymond.mao@riscstar.com,
        robin.randhawa@sifive.com, samuel.holland@sifive.com, krzk@kernel.org
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA3MyBTYWx0ZWRfXwOz4N9NugsYZ
 5NI+8212cLg/bLDVkekxGN5goarLU1Mj2uxWukkPI+78ONSf6x9P0sdSLXcB9GTHgH3Ytshufj8
 YRZ68NTKHnT1V+vZEACTUbqlKO915LnK07buKr32raQC73xHUJi4u9nozPcL0kYP2EnNL9VdS85
 3w2JrKPNclE7yDEFsPjcrsP0U8jJzdHkPM6R5Uw56CST5RWeAW9OsfSte+LBGBw4doLeUKoSsZn
 +QEZfHlAbA/sSITUBbrsiSy097RC0MupzQ5ih2/3ZG4rD0Og2hP8EoscyGg0snDvplwlWjy0doG
 6W5xVPX798ol4JkFB86fINE9OTWyXReiZF8iII0tgshXA5H/NxCFQ+rAWs2dA1m1dcYGOR/4b7w
 puh3QPCrnVX/UnudFz02MVztR54TprWZvtKvqyrwLDlJMSGozN4v6gkCaS2J8dHlrQA+c+zvpIC
 xchp5ubn5mF7k4mohbw==
X-Proofpoint-GUID: qTJ1s1m3SG25BP7fdZEhIcrJDIUF18GJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA3MyBTYWx0ZWRfX6zLi5b1tG8sV
 DoEmuek4b6UKbzUjog+CkZFFD+NpryKpNMKGnon59yj2bLHVEV3OQJ7n/UPXEgq5fi2NZRZW8xR
 VmZ6P7Cxr+L+UO377vjR03geNjsaaY4=
X-Authority-Analysis: v=2.4 cv=S4dMU4sP c=1 sm=1 tr=0 ts=6ab6bcc9 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=pFyQfRViAAAA:8 a=zqYjfnJzQx5HuK2q3jwA:9
 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-ORIG-GUID: qTJ1s1m3SG25BP7fdZEhIcrJDIUF18GJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_112618_379890_1C5E133C 
X-CRM114-Status: GOOD (  33.91  )
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

T24gVGh1LCBTZXAgMjQsIDIwMjYgYXQgMTI6MzPigK9BTSBZdS1DaGllbiBQZXRlciBMaW4KPHBl
dGVyLmxpbkBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEhpIE96YSwKPgo+IE9uIFRodSwgU2VwIDAz
LCAyMDI2IGF0IDAyOjE1OjE2UE0gLTA3MDAsIFBhd2FuZGVlcCBPemEgd3JvdGU6Cj4gPiBPbiBN
b24sIEF1ZyAxNywgMjAyNiBhdCAyOjA14oCvQU0gWXUtQ2hpZW4gUGV0ZXIgTGluIDxwZXRlci5s
aW5Ac2lmaXZlLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEFkZCBmZHRfcGFyc2Vfd29ybGRzX2Fs
bF9oYXJ0cygpIHRvIHBhcnNlIHBsYXRmb3JtLWRlZmluZWQgRFQKPiA+ID4gcHJvcGVydGllcyBp
biB0aGUgL2NwdXMvY3B1QFg6Cj4gPiA+IC0gcmlzY3YscG13aWQ6IE0tbW9kZSBXb3JsZCBJRAo+
ID4gPiAtIHJpc2N2LHBtd2lkbGlzdDogYml0bWFwIG9mIHBlcm1pdHRlZCBNLW1vZGUgV0lEcwo+
ID4gPiAtIHJpc2N2LHBtbHdpZGxpc3Q6IGJpdG1hcCBvZiBwZXJtaXR0ZWQgbG93ZXItcHJpdmls
ZWdlIFdJRHMKPiA+ID4gSW5pdGlhbGl6ZSBwYXJzZWQgdmFsdWVzIGluIHNiaV9oYXJ0X2ZlYXR1
cmVzIHdpdGggaGFzXyogcHJlc2VuY2UKPiA+ID4gZmxhZ3MuCj4gPiA+Cj4gPiA+IFRoZXNlIHBs
YXRmb3JtLWRlZmluZWQgdmFsdWVzIHNlcnZlIGFzIHRoZSByb290LW9mLXRydXN0IGNvbnN0cmFp
bnRzCj4gPiA+IGZvciBwZXItZG9tYWluIFdJRCBhc3NpZ25tZW50IGR1cmluZyBkb21haW4gY3Jl
YXRpb24gYW5kIGNvbnRleHQKPiA+ID4gc3dpdGNoaW5nLgo+ID4gPgo+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBZdS1DaGllbiBQZXRlciBMaW4gPHBldGVyLmxpbkBzaWZpdmUuY29tPgo+ID4gPiAtLS0K
PiA+ID4gIGluY2x1ZGUvc2JpL3NiaV9oYXJ0LmggICAgICAgICAgICAgfCAgNiArKwo+ID4gPiAg
aW5jbHVkZS9zYmlfdXRpbHMvZmR0L2ZkdF9oZWxwZXIuaCB8ICAyICsKPiA+ID4gIGxpYi91dGls
cy9mZHQvZmR0X2hlbHBlci5jICAgICAgICAgfCA5MiArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKPiA+ID4gIHBsYXRmb3JtL2dlbmVyaWMvcGxhdGZvcm0uYyAgICAgICAgfCAxMyArKysr
LQo+ID4gPiAgNCBmaWxlcyBjaGFuZ2VkLCAxMTIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zYmkvc2JpX2hhcnQuaCBiL2luY2x1
ZGUvc2JpL3NiaV9oYXJ0LmgKPiA+ID4gaW5kZXggMjk0MTgwOWUuLjRmY2Y1MzcyIDEwMDY0NAo+
ID4gPiAtLS0gYS9pbmNsdWRlL3NiaS9zYmlfaGFydC5oCj4gPiA+ICsrKyBiL2luY2x1ZGUvc2Jp
L3NiaV9oYXJ0LmgKPiA+ID4gQEAgLTEzNSw2ICsxMzUsMTIgQEAgc3RydWN0IHNiaV9oYXJ0X2Zl
YXR1cmVzIHsKPiA+ID4gICAgICAgICB1bnNpZ25lZCBpbnQgcG1wX2xvZzJncmFuOwo+ID4gPiAg
ICAgICAgIHVuc2lnbmVkIGludCBtaHBtX21hc2s7Cj4gPiA+ICAgICAgICAgdW5zaWduZWQgaW50
IG1ocG1fYml0czsKPiA+ID4gKyAgICAgICB1MzIgcG13aWQ7Cj4gPiA+ICsgICAgICAgdTY0IHBt
d2lkbGlzdDsKPiA+ID4gKyAgICAgICB1NjQgcG1sd2lkbGlzdDsKPiA+ID4gKyAgICAgICBib29s
IGhhc19wbXdpZDsKPiA+ID4gKyAgICAgICBib29sIGhhc19wbXdpZGxpc3Q7Cj4gPiA+ICsgICAg
ICAgYm9vbCBoYXNfcG1sd2lkbGlzdDsKPiA+Cj4gPiBPemE6IGRvIHlvdSBuZWVkIHRoZXNlIDMg
Ym9vbGVhbnMgPwo+ID4KPiA+IHlvdSBjYW4gZmluZCBvdXQgZnJvbSB0aGUgdmFsdWUgaXRzbGVm
ID8KPiA+IHBtd2lkbGlzdCA9PSAwIG1lYW5zIG5vdCBycGVzZW50Cj4gPiBwbWx3aWRsaXN0ID0g
MCBtZWFucyBub3QgcnBlc2VudAo+ID4gYW5kIG1heSBiZSBwbXdpZCA9PSBVSU5UX01BWCB0aGVu
IG5vdCBwcmVzZW50ID8KPgo+IEknZCBsaWtlIHRvIGtlZXAgaGFzX3Btd2lkLiBwbXdpZCA9IDAg
aXMgYSB2YWxpZCBXSUQsIGFzCj4gc2JpX2hhcnRfZmVhdHVyZXMgaXMgemVyby1pbml0aWFsaXpl
ZCwgdXNpbmcgYSBzZW50aW5lbAo+IGxpa2UgVUlOVF9NQVggdG8gbWVhbiAibm90IHNldCIgd291
bGQgcmVxdWlyZSBhZGRpbmcgYW4KPiBleHBsaWNpdCBpbml0IHN0ZXAgYXQgc2JpX2hhcnRfZmVh
dHVyZSBhbGxvY2F0aW9uIHRpbWUuCj4KPiBJJ2QgbGlrZSB0byBrZWVwIGhhc19wbWx3aWRsaXN0
IHRvby4gUGVyIHRoZSBzcGVjLAo+IHBtbHdpZGxpc3QgPSAwIGlzIGEgbGVnYWwgY29uZmlndXJh
dGlvbiBtZWFuaW5nCj4gIm5vIFdJRCBpcyBhdXRob3JpemVkIGZvciBtbHdpZCIgd2hpY2ggaXMg
dGhlIG9wcG9zaXRlCj4gb2YgdW5yZXN0cmljdGVkLgo+Cj4gSSBhZ3JlZSB3ZSBjYW4gZHJvcCBo
YXNfcG13aWRsaXN0LCBhcyBwbXdpZGxpc3QgY2FuIG5ldmVyCj4gYmUgMC4KCk96YTogRXZlcnl0
aGluZyBzb3VuZHMgZ29vZCB0byBtZS4KCj4KPiBUaGFua3MsCj4gUGV0ZXIgTGluCj4KPiA+Cj4g
PiA+ICB9Owo+ID4gPgo+ID4gPiAgZXh0ZXJuIHVuc2lnbmVkIGxvbmcgaGFydF9mZWF0dXJlc19v
ZmZzZXQ7Cj4gPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3NiaV91dGlscy9mZHQvZmR0X2hlbHBl
ci5oIGIvaW5jbHVkZS9zYmlfdXRpbHMvZmR0L2ZkdF9oZWxwZXIuaAo+ID4gPiBpbmRleCA3NWE1
NjRkMS4uM2YzZDA5MWIgMTAwNjQ0Cj4gPiA+IC0tLSBhL2luY2x1ZGUvc2JpX3V0aWxzL2ZkdC9m
ZHRfaGVscGVyLmgKPiA+ID4gKysrIGIvaW5jbHVkZS9zYmlfdXRpbHMvZmR0L2ZkdF9oZWxwZXIu
aAo+ID4gPiBAQCAtNTYsNiArNTYsOCBAQCBpbnQgZmR0X3BhcnNlX3RpbWViYXNlX2ZyZXF1ZW5j
eShjb25zdCB2b2lkICpmZHQsIHVuc2lnbmVkIGxvbmcgKmZyZXEpOwo+ID4gPgo+ID4gPiAgaW50
IGZkdF9wYXJzZV9pc2FfZXh0ZW5zaW9uc19hbGxfaGFydHMoY29uc3Qgdm9pZCAqZmR0KTsKPiA+
ID4KPiA+ID4gK2ludCBmZHRfcGFyc2Vfd29ybGRzX2FsbF9oYXJ0cyhjb25zdCB2b2lkICpmZHQp
Owo+ID4gPiArCj4gPiA+ICBpbnQgZmR0X3BhcnNlX2dhaXNsZXJfdWFydF9ub2RlKGNvbnN0IHZv
aWQgKmZkdCwgaW50IG5vZGVvZmZzZXQsCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgc3RydWN0IHBsYXRmb3JtX3VhcnRfZGF0YSAqdWFydCk7Cj4gPiA+Cj4gPiA+IGRpZmYg
LS1naXQgYS9saWIvdXRpbHMvZmR0L2ZkdF9oZWxwZXIuYyBiL2xpYi91dGlscy9mZHQvZmR0X2hl
bHBlci5jCj4gPiA+IGluZGV4IDc0N2JhMDI4Li5kNjAyNTcwNSAxMDA2NDQKPiA+ID4gLS0tIGEv
bGliL3V0aWxzL2ZkdC9mZHRfaGVscGVyLmMKPiA+ID4gKysrIGIvbGliL3V0aWxzL2ZkdC9mZHRf
aGVscGVyLmMKPiA+ID4gQEAgLTQ1Nyw2ICs0NTcsOTggQEAgaW50IGZkdF9wYXJzZV9pc2FfZXh0
ZW5zaW9uc19hbGxfaGFydHMoY29uc3Qgdm9pZCAqZmR0KQo+ID4gPiAgICAgICAgIHJldHVybiAw
Owo+ID4gPiAgfQo+ID4gPgo+ID4gPiAraW50IGZkdF9wYXJzZV93b3JsZHNfYWxsX2hhcnRzKGNv
bnN0IHZvaWQgKmZkdCkKPiA+ID4gK3sKPiA+ID4gKyAgICAgICB1MzIgaGFydGlkOwo+ID4gPiAr
ICAgICAgIGNvbnN0IGZkdDMyX3QgKnZhbDsKPiA+ID4gKyAgICAgICBzdHJ1Y3Qgc2JpX3NjcmF0
Y2ggKnNjcmF0Y2g7Cj4gPiA+ICsgICAgICAgc3RydWN0IHNiaV9oYXJ0X2ZlYXR1cmVzICpoZmVh
dHVyZXM7Cj4gPiA+ICsgICAgICAgaW50IGVyciwgY3B1X29mZnNldCwgY3B1c19vZmZzZXQsIGxl
bjsKPiA+ID4gKwo+ID4gPiArICAgICAgIGlmICghZmR0KQo+ID4gPiArICAgICAgICAgICAgICAg
cmV0dXJuIFNCSV9FSU5WQUw7Cj4gPiA+ICsKPiA+ID4gKyAgICAgICBjcHVzX29mZnNldCA9IGZk
dF9wYXRoX29mZnNldChmZHQsICIvY3B1cyIpOwo+ID4gPiArICAgICAgIGlmIChjcHVzX29mZnNl
dCA8IDApCj4gPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gY3B1c19vZmZzZXQ7Cj4gPiA+ICsK
PiA+ID4gKyAgICAgICBmZHRfZm9yX2VhY2hfc3Vibm9kZShjcHVfb2Zmc2V0LCBmZHQsIGNwdXNf
b2Zmc2V0KSB7Cj4gPiA+ICsgICAgICAgICAgICAgICBlcnIgPSBmZHRfcGFyc2VfaGFydF9pZChm
ZHQsIGNwdV9vZmZzZXQsICZoYXJ0aWQpOwo+ID4gPiArICAgICAgICAgICAgICAgaWYgKGVycikK
PiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gPiA+ICsKPiA+ID4gKyAg
ICAgICAgICAgICAgIGlmICghZmR0X25vZGVfaXNfZW5hYmxlZChmZHQsIGNwdV9vZmZzZXQpKQo+
ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiA+ID4gKwo+ID4gPiArICAg
ICAgICAgICAgICAgc2NyYXRjaCA9IHNiaV9oYXJ0aWRfdG9fc2NyYXRjaChoYXJ0aWQpOwo+ID4g
PiArICAgICAgICAgICAgICAgaWYgKCFzY3JhdGNoKQo+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgICByZXR1cm4gU0JJX0VOT0VOVDsKPiA+ID4gKwo+ID4gPiArICAgICAgICAgICAgICAgaGZl
YXR1cmVzID0gc2JpX2hhcnRfZmVhdHVyZXNfcHRyKHNjcmF0Y2gpOwo+ID4gPiArICAgICAgICAg
ICAgICAgaWYgKCFoZmVhdHVyZXMpCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVy
biBTQklfRU5PRU5UOwo+ID4gPiArCj4gPiA+ICsgICAgICAgICAgICAgICB2YWwgPSBmZHRfZ2V0
cHJvcChmZHQsIGNwdV9vZmZzZXQsICJyaXNjdixwbXdpZCIsICZsZW4pOwo+ID4gPiArICAgICAg
ICAgICAgICAgaWYgKHZhbCAmJiBsZW4gPT0gc2l6ZW9mKGZkdDMyX3QpKSB7Cj4gPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGhmZWF0dXJlcy0+cG13aWQgPSBmZHQzMl90b19jcHUoKnZhbCk7
Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGhmZWF0dXJlcy0+aGFzX3Btd2lkID0gdHJ1
ZTsKPiA+ID4gKyAgICAgICAgICAgICAgIH0KPiA+ID4gKwo+ID4gPiArICAgICAgICAgICAgICAg
dmFsID0gZmR0X2dldHByb3AoZmR0LCBjcHVfb2Zmc2V0LCAicmlzY3YscG13aWRsaXN0IiwgJmxl
bik7Cj4gPiA+ICsgICAgICAgICAgICAgICBpZiAodmFsICYmIGxlbiA9PSAyICogc2l6ZW9mKGZk
dDMyX3QpKSB7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGhmZWF0dXJlcy0+cG13aWRs
aXN0ID0gKCh1NjQpZmR0MzJfdG9fY3B1KHZhbFswXSkgPDwgMzIpIHwKPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmR0MzJfdG9fY3B1KHZhbFsx
XSk7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGhmZWF0dXJlcy0+aGFzX3Btd2lkbGlz
dCA9IHRydWU7Cj4gPiA+ICsgICAgICAgICAgICAgICB9Cj4gPiA+ICsKPiA+ID4gKyAgICAgICAg
ICAgICAgIHZhbCA9IGZkdF9nZXRwcm9wKGZkdCwgY3B1X29mZnNldCwgInJpc2N2LHBtbHdpZGxp
c3QiLCAmbGVuKTsKPiA+ID4gKyAgICAgICAgICAgICAgIGlmICh2YWwgJiYgbGVuID09IDIgKiBz
aXplb2YoZmR0MzJfdCkpIHsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaGZlYXR1cmVz
LT5wbWx3aWRsaXN0ID0gKCh1NjQpZmR0MzJfdG9fY3B1KHZhbFswXSkgPDwgMzIpIHwKPiA+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZkdDMyX3Rv
X2NwdSh2YWxbMV0pOwo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBoZmVhdHVyZXMtPmhh
c19wbWx3aWRsaXN0ID0gdHJ1ZTsKPiA+ID4gKyAgICAgICAgICAgICAgIH0KPiA+ID4gKwo+ID4g
PiArICAgICAgICAgICAgICAgLyogU2FuaXR5IGNoZWNrcyAqLwo+ID4gPiArICAgICAgICAgICAg
ICAgaWYgKGhmZWF0dXJlcy0+aGFzX3Btd2lkbGlzdCAmJiAhaGZlYXR1cmVzLT5wbXdpZGxpc3Qp
IHsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgc2JpX3ByaW50ZigiJXM6IGhhcnQldSBy
aXNjdixwbXdpZGxpc3QgaXMgZW1wdHlcbiIsCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgX19mdW5jX18sIGhhcnRpZCk7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgIHJldHVybiBTQklfRUlOVkFMOwo+ID4gPiArICAgICAgICAgICAgICAgfQo+ID4gPiArCj4g
PiA+ICsjaWYgX19yaXNjdl94bGVuID09IDMyCj4gPiA+ICsgICAgICAgICAgICAgICBpZiAoaGZl
YXR1cmVzLT5oYXNfcG13aWRsaXN0ICYmCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgKGhmZWF0
dXJlcy0+cG13aWRsaXN0ID4+IDMyKSkgewo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBz
YmlfcHJpbnRmKCIlczogaGFydCV1IHJpc2N2LHBtd2lkbGlzdCBoYXMgYml0cyBiZXlvbmQgWExF
TlxuIiwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX2Z1bmNfXywg
aGFydGlkKTsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FSU5WQUw7
Cj4gPiA+ICsgICAgICAgICAgICAgICB9Cj4gPiA+ICsKPiA+ID4gKyAgICAgICAgICAgICAgIGlm
IChoZmVhdHVyZXMtPmhhc19wbWx3aWRsaXN0ICYmCj4gPiA+ICsgICAgICAgICAgICAgICAgICAg
KGhmZWF0dXJlcy0+cG1sd2lkbGlzdCA+PiAzMikpIHsKPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgc2JpX3ByaW50ZigiJXM6IGhhcnQldSByaXNjdixwbWx3aWRsaXN0IGhhcyBiaXRzIGJl
eW9uZCBYTEVOXG4iLAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9f
ZnVuY19fLCBoYXJ0aWQpOwo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gU0JJ
X0VJTlZBTDsKPiA+ID4gKyAgICAgICAgICAgICAgIH0KPiA+ID4gKyNlbmRpZgo+ID4gPiArCj4g
PiA+ICsgICAgICAgICAgICAgICBpZiAoaGZlYXR1cmVzLT5oYXNfcG13aWQgJiYKPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICBoZmVhdHVyZXMtPnBtd2lkID49IF9fcmlzY3ZfeGxlbikgewo+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgICBzYmlfcHJpbnRmKCIlczogaGFydCV1IHJpc2N2LHBt
d2lkICgldSkgZXhjZWVkcyBtYXggV0lEXG4iLAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIF9fZnVuY19fLCBoYXJ0aWQsIGhmZWF0dXJlcy0+cG13aWQpOwo+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VJTlZBTDsKPiA+ID4gKyAgICAgICAg
ICAgICAgIH0KPiA+ID4gKwo+ID4gPiArICAgICAgICAgICAgICAgaWYgKGhmZWF0dXJlcy0+aGFz
X3Btd2lkbGlzdCAmJiBoZmVhdHVyZXMtPmhhc19wbXdpZCAmJgo+ID4gPiArICAgICAgICAgICAg
ICAgICAgICEoaGZlYXR1cmVzLT5wbXdpZGxpc3QgJiBCSVRfVUxMKGhmZWF0dXJlcy0+cG13aWQp
KSkgewo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBzYmlfcHJpbnRmKCIlczogaGFydCV1
IHJpc2N2LHBtd2lkICgldSkgbm90IGluIHBtd2lkbGlzdFxuIiwKPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBfX2Z1bmNfXywgaGFydGlkLCBoZmVhdHVyZXMtPnBtd2lk
KTsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FSU5WQUw7Cj4gPiA+
ICsgICAgICAgICAgICAgICB9Cj4gPiA+ICsgICAgICAgfQo+ID4gPiArCj4gPiA+ICsgICAgICAg
cmV0dXJuIDA7Cj4gPiA+ICt9Cj4gPiA+ICsKPiA+ID4gIHN0YXRpYyBpbnQgZmR0X3BhcnNlX3Vh
cnRfbm9kZV9jb21tb24oY29uc3Qgdm9pZCAqZmR0LCBpbnQgbm9kZW9mZnNldCwKPiA+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgcGxhdGZvcm1fdWFydF9k
YXRhICp1YXJ0LAo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVu
c2lnbmVkIGxvbmcgZGVmYXVsdF9mcmVxLAo+ID4gPiBkaWZmIC0tZ2l0IGEvcGxhdGZvcm0vZ2Vu
ZXJpYy9wbGF0Zm9ybS5jIGIvcGxhdGZvcm0vZ2VuZXJpYy9wbGF0Zm9ybS5jCj4gPiA+IGluZGV4
IDFkZjAyODBkLi41MWU5ZjM0MiAxMDA2NDQKPiA+ID4gLS0tIGEvcGxhdGZvcm0vZ2VuZXJpYy9w
bGF0Zm9ybS5jCj4gPiA+ICsrKyBiL3BsYXRmb3JtL2dlbmVyaWMvcGxhdGZvcm0uYwo+ID4gPiBA
QCAtMjU1LDExICsyNTUsMjIgQEAgaW50IGdlbmVyaWNfZmluYWxfaW5pdChib29sIGNvbGRfYm9v
dCkKPiA+ID4KPiA+ID4gIGludCBnZW5lcmljX2V4dGVuc2lvbnNfaW5pdChib29sIGNvbGRfYm9v
dCkKPiA+ID4gIHsKPiA+ID4gKyAgICAgICBpbnQgcmM7Cj4gPiA+ICsKPiA+ID4gICAgICAgICBp
ZiAoIWNvbGRfYm9vdCkKPiA+ID4gICAgICAgICAgICAgICAgIHJldHVybiAwOwo+ID4gPgo+ID4g
PiAgICAgICAgIC8qIFBhcnNlIHRoZSBJU0Egc3RyaW5nIGZyb20gRkRUIGFuZCBlbmFibGUgdGhl
IGxpc3RlZCBleHRlbnNpb25zICovCj4gPiA+IC0gICAgICAgcmV0dXJuIGZkdF9wYXJzZV9pc2Ff
ZXh0ZW5zaW9uc19hbGxfaGFydHMoZmR0X2dldF9hZGRyZXNzKCkpOwo+ID4gPiArICAgICAgIHJj
ID0gZmR0X3BhcnNlX2lzYV9leHRlbnNpb25zX2FsbF9oYXJ0cyhmZHRfZ2V0X2FkZHJlc3MoKSk7
Cj4gPiA+ICsgICAgICAgaWYgKHJjKQo+ID4gPiArICAgICAgICAgICAgICAgcmV0dXJuIHJjOwo+
ID4gPiArCj4gPiA+ICsgICAgICAgLyogUGFyc2UgUklTQy1WIFdvcmxkcyBDUFUgcHJvcGVydGll
cyBmcm9tIEZEVCAqLwo+ID4gPiArICAgICAgIHJjID0gZmR0X3BhcnNlX3dvcmxkc19hbGxfaGFy
dHMoZmR0X2dldF9hZGRyZXNzKCkpOwo+ID4gPiArICAgICAgIGlmIChyYykKPiA+ID4gKyAgICAg
ICAgICAgICAgIHJldHVybiByYzsKPiA+ID4gKwo+ID4gPiArICAgICAgIHJldHVybiAwOwo+ID4g
PiAgfQo+ID4gPgo+ID4gPiAgaW50IGdlbmVyaWNfZG9tYWluc19pbml0KHZvaWQpCj4gPiA+IC0t
Cj4gPiA+IDIuNDMuNwo+ID4gPgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL29wZW5zYmkK
