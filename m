Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E317CC6B12
	for <opensbi@archiver.kernel.org>; Tue, 13 Oct 2026 19:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s5xLl4bsTQf1m3ivmKgSOR9nSMo3KFNaLM+A5BWuvUc=; b=v2H3QlRhQJjBHm
	8PmgRjCII209sezQNK1TmZuVtxz4oaEiVEXBXAvSdUPm2Fab0Wy40TLNJilQ0bdSB4WlVbX629BgL
	7umedHXhWKaOtWyIfakjjcVAWdBQPBUS5FdzEWsKwTflvMb9XO62AQsYZU+fNYvOpmk9yOXODYtpa
	RpeQAlkZ9+IuNg9zWE/ZrqJ4OLF7UOzI/wbdSEpTI65RbfeSNj6X744wE99dkfsYGiL7KIUlHefkB
	vnHBwmgA9ZsWL2SjpH+dCoZFRShH25klktjy0DUeDQiOCvzMYBhK06xLEQaLz81q32/f/HsXu2min
	NROByG0C4FHaxUlIS5Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGiVp-0000000Dxie-2z1R;
	Tue, 13 Oct 2026 19:50:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGiVm-0000000Dxhw-3lYc
	for opensbi@lists.infradead.org;
	Tue, 13 Oct 2026 19:50:12 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DHkj6i3000921
	for <opensbi@lists.infradead.org>; Tue, 13 Oct 2026 19:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j3SKoDPZrbp2GM3+a8UEdPGEAj8mSAbZOHqNT5ipMDc=; b=hLnvwGI8quysLwel
	HwKeXzkmQ90Gmqq/NBf/T3MkmwIkI6FixofEP5RktFkd6LSu4Vd+8kBlz6hY9G3z
	l5FTIVWIJL1WG2O9nhpIwgsJKkCRG9j75gf8OxXe4tt4G33ngbUHcV/IeOqG9W9c
	tvfP2jVwwTBs9fM/+WfAHz4z1AyZd87KBFgDzPjgQO73/oI2D0VJa/lzXANyFFbQ
	OLtqD+pDCZ61U2LTItrzMwctXs+5WVCCcUgsuiGFq3ZrEis35wXyQAdC4zYPVLwr
	QRJyv6jt6vQwVNYnaDvW9CtTbihJEW99JEO75rzlJP1J+bIDfpo4ovNsKmRwX1QG
	Dj1SJw==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sberjbs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 13 Oct 2026 19:50:10 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-46f178d813bso4003776fac.3
        for <opensbi@lists.infradead.org>; Tue, 13 Oct 2026 12:50:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791921009; cv=none;
        d=google.com; s=arc-20260327;
        b=OyaLCFuzASrrfpGx4auAgvvVBJOqdXi0q9NxnHSNjp8TxIHErLogNLX9+eAjbJtGb1
         ffm8BSi9ti62t/Yx+jYArnsoBkto069azEmef4maaQYC8wt548uE/oylQQ1pFRKvKRSW
         V2+BzMtvV229jIILbdsoNbcw9Tu/BbT5W0rDbv9wHGr8dwRqYEGSHsoPkjVDDt7G+CGv
         u8FGtnxnC6INsMRGfMDKuhPhnZkvjUDRIpZGc+lsCbzcC0mV9EbEu8+0IKZeave3+9wQ
         Qz4gnhHcU+7h/ygi5vIx6WiJec9EAr0232RQIJ9USZBYw2MNgDcsG3uz1UAypOeSeHbI
         2XVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j3SKoDPZrbp2GM3+a8UEdPGEAj8mSAbZOHqNT5ipMDc=;
        fh=p5HWGUs+o68g3Z3KRd4Q/56yvMjrNxgFRPBh+4T4KMM=;
        b=XFqNZy4qAKi3nvA4Wdg3OrHVgPlUs1Y9+f58pNrXp++dKn0OyDrxzHGanEIJZX9dzH
         9/KTMJYY4tp/PJXLAfOKNpSmMmYDgEAA1bkJsrJ3kDlSqncsqzPYx4kgSXgjrbhkqTAj
         Vg3NlwLFZN/2bdcLVEp9c7ujEidyt6RvEq68u3jHiRX6Mq9JiPfuxgQtXusfVer+ertu
         b87BZa1BoRU7AUzj0PG4FFlFGw88sJ3upssRzj94UYhks6dnmRlGxwF+HJRDwSYMCFM7
         2dT7LvCPUpIMDNYMG52+lTtfzgl/Kyn3U0vzDOyFGgOruLiNK1CoIx/DrxmQeyCXkp8Z
         czhA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791921009; x=1792525809; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j3SKoDPZrbp2GM3+a8UEdPGEAj8mSAbZOHqNT5ipMDc=;
        b=OA+2itqNT9ZKjSSImnj4l3YbLOFmJce3adF3UT9vZa8EW/gjWMEpRwpTP6G6k8mHJs
         4wFhuFXy5EEDHibaFcQWq2f7kFZis+hoKKTsDCPySYOjUP4ErnZn+ZIH+i/HGYm/dMlB
         uKDcEfE6JQhjZZ7WS/mNQXfkCPtvmXHR4VHPs5YUz/iXbybPpM+w2NdZbutaJfZrtxUm
         Ne4My0g1oVVJpOxs/j28FsHW/xDrpKwA5E6BJG60xOFiPMw25PZajdeDchhzxxpTeY8t
         KMWQDb4jf6xNE3xhjSkybSB8WVJIJr82bWSUf9SCfClITVjeCdAXZroR7N+RXYCZmhOg
         WplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791921009; x=1792525809;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j3SKoDPZrbp2GM3+a8UEdPGEAj8mSAbZOHqNT5ipMDc=;
        b=kEYhCww6XiNseaPb0fA93BNbtq80mMtMgV/Yl9fzOSNPqDaFSKOZHP6eHZUvaiGPTI
         WpEy7ADEMoKJSKBbk2McEkJGIoU1yJILt+//xNNrsL2GS/mH3BKSljjMAkwCoSPgXQbC
         BNI1KfrQvynhfn29BgiUHhpb0c3XWtnM/2OkNqmqlIPyydOc9kSE3Yhp3xPitBviL8Lm
         r43O9y+Uvda9HHCrbNvWMtRCfkGqiZgmMAEbl0RinzfbDM8D2CcsnzNJT4gzg+HZtEJU
         N30A1hrFgc7rTmSjEKA96aZsakJtM6pedrAXNSVniS1pMd/4waq6f9kl4+UaOPATQ6Q1
         bagw==
X-Forwarded-Encrypted: i=1; AKwUvBwnjIae/3CnjNTb1cjKgTa/ipKJ6aTDDceLBx3ibRIEmOh+mcm7+5nGqvrdwVSrZF4CXY6bdfa0@lists.infradead.org
X-Gm-Message-State: AFq9FYKb7/OOhiPmaHWLF9o9Ob+kRbkkLt/rOUvycw4kaMFwVhwaFdum
	JACaXib3msajuuLo5bUfTD13KbPTt3P6qa+2LrwvQIiLRR+Y6eLGV6Nj1JIqwY2C1Wlt179BOHk
	aHGrZnevfbA4Cf5XeIykCaPop2e0nR9oIYDpZviB0aWFlDuj7ZOxIsR5aCW9meJFKLtkCoR7F8W
	uqGQzNRgC0ZtEAwXI14aKkxe3Op4nwl5AJQRZtRaaK
X-Gm-Gg: AYBFou2bp0vcMZroXUYYc29wKoOcNpAZpAVclJZs2NpZnnVhGp+sbpW/2sO+psOcCGn
	Or53TSmGdS5+CmZIGV51zIewZg4GXaVSwG0hWDqW6TjkJTHjfhjP11zAVnP/3PfsBjMBBLS6He6
	jG2UbrsuxWugw502uIH45R4oef+josqF4WtrKeMG1CQBNDrm2CLx9HFB6mHR4=
X-Received: by 2002:a05:6870:728b:10b0:4a6:d647:9bb3 with SMTP id 586e51a60fabf-4a6d647d438mr1135611fac.57.1791921009281;
        Tue, 13 Oct 2026 12:50:09 -0700 (PDT)
X-Received: by 2002:a05:6870:728b:10b0:4a6:d647:9bb3 with SMTP id
 586e51a60fabf-4a6d647d438mr1135598fac.57.1791921008749; Tue, 13 Oct 2026
 12:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260923032359.4041876-1-anup.patel@oss.qualcomm.com>
 <20260923032359.4041876-12-anup.patel@oss.qualcomm.com> <CAFR3w37k35NmVxV=xxRJYVrd0fk_FrsL+jecwBC+=zb-ow-vVQ@mail.gmail.com>
In-Reply-To: <CAFR3w37k35NmVxV=xxRJYVrd0fk_FrsL+jecwBC+=zb-ow-vVQ@mail.gmail.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:49:58 -0700
X-Gm-Features: AclHuK9LtVnVCYEVOB7i7Vpbs03_W-YoHtX21x32RQX3HRbH0I2yaj_kPQfqzJ8
Message-ID: <CAAVgOkJ3nmuLALuuCO35SHRrCHohn4_fmyPHBtJs92WnvpdsnQ@mail.gmail.com>
Subject: Re: [PATCH 11/11] lib: utils/mpxy: Use domain notifier for deferred
 creation of MPXY RPMI
To: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>,
        Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
X-Proofpoint-ORIG-GUID: BFGPaC9T-eVTPMbbpqmz36lFewaHL5_1
X-Proofpoint-GUID: BFGPaC9T-eVTPMbbpqmz36lFewaHL5_1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA3OSBTYWx0ZWRfX4SfKtMkrLP8i
 n9qD8tzZ/PYegq321hoykwZV1xCWrbhG9i4vUpMzzZijOTn8gpF/GQJE2mv1P/rs26DGJJiLbSw
 yOcSlxFYj9F6/Ty5jI3uL/ZinxBXYjQHTT2M0EIN5aTnupOfuQUfEkLG7Z2os8m3BRK9h8zO0XT
 0xKD01QRT5qr22jFpkQccVB+6HTs2cnbllrxk+oF8ZvA4rtcEDw/S8GFMlHcBqpL4pRSBjXgARq
 FM6SBjTi1ZwpFn1uY0KOZs204d/UC/VRNqM2LwrJpnrWMKlXdKcDOyQZflksEDAcQ8dEQmsCheB
 VB2HNx5tOdaDbQlgkncy8q5Ar2mCeji9QaIy36hxITsnjRokBES6osf42TCZ/PwKKtwpsZnIkrn
 DZVzm4BidmAo+LqJMb/TlvzxZA786VEUy2wR05UJaur2GEwBjXk/mCv6g35o80q3YWRxbhIVtEt
 FWvmYq4YdYMuASGooqg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA3OSBTYWx0ZWRfXzypPlfT1gnax
 TcM0SV0JNj/0QPhHjPubU2p3+lkIznA5ww1iDCJx+Tex3wim2CAeDdBDL12J2qsSwu3y9xvnOvT
 +uSHW9/Euxr9yEjCMuz2iPaD8an/fSg=
X-Authority-Analysis: v=2.4 cv=U7AHnuru c=1 sm=1 tr=0 ts=6ace8b72 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=Q1gAMBQW0D7a7XJcny4A:9 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_125010_943259_215F22EC 
X-CRM114-Status: GOOD (  12.46  )
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

T24gVGh1LCBPY3QgOCwgMjAyNiBhdCA5OjEz4oCvQU0gUmFodWwgUGF0aGFrCjxyYWh1bC5wYXRo
YWtAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiA+ICsKPiA+ICtzdGF0aWMgaW50IF9fbXB4
eV9ycG1pX2RlZmVyX25vdGlmKHN0cnVjdCBzYmlfZG9tYWluICpkb20sCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGVudW0gc2JpX2RvbWFpbl9ub3RpZnlfZXZlbnQgZXZl
bnQsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKnByaXYpCj4g
PiArewo+ID4gKyAgICAgICBzdHJ1Y3QgX19tcHh5X3JwbWlfZGVmZXJfaW5pdF9wcml2ICppcHJp
diA9IHByaXY7Cj4gPiArICAgICAgIGludCByYzsKPiA+ICsKPiA+ICsgICAgICAgLyogRG8gbm90
aGluZyBpZiBkb21haW4gbmFtZSBkb2VzIG5vdCBtYXRjaCAqLwo+ID4gKyAgICAgICBpZiAoc2Jp
X3N0cmNtcChkb20tPm5hbWUsIGlwcml2LT5kb21fbmFtZSkpCj4gPiArICAgICAgICAgICAgICAg
cmV0dXJuIDA7Cj4gPiArCj4gPiArICAgICAgIC8qIFVucmVnaXN0ZXIgbm90aWZpZXIgKi8KPiA+
ICsgICAgICAgcmMgPSBzYmlfZG9tYWluX3VucmVnaXN0ZXJfbm90aWZpZXIoX19tcHh5X3JwbWlf
ZGVmZXJfbm90aWYsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFNCSV9ET01BSU5fTk9USUZZX0VWRU5UX1JFR0lTVEVSLCBpcHJpdik7Cj4gPiArICAgICAg
IGlmIChyYykKPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gcmM7Cj4gPiArCj4gPiArICAgICAg
IC8qIENyZWF0ZSBNUFhZIFJQTUkgaW5zdGFuY2UgKi8KPiA+ICsgICAgICAgcmMgPSBfX21weHlf
cnBtaV9pbml0KGlwcml2LT5kYXRhLCBpcHJpdi0+Y2hhbiwgaXByaXYtPm1weHlfY2hhbm5lbF9p
ZCwgZG9tKTsKPiA+ICsgICAgICAgaWYgKHJjKQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBy
YzsKPiA+ICsKPiA+ICsgICAgICAgc2JpX2ZyZWUoaXByaXYpOwo+Cj4gRnJlZWluZyB0aGUgaXBy
aXYgaXMgb25seSByZXF1aXJlZCBmb3Igc3VjY2VzcyBwYXRoLCB3aGF0IGFib3V0IGVycm9yIGNh
c2VzPwo+Cj4gPiArICAgICAgIHJldHVybiAwOwo+ID4gK30KPiA+ICsKPgo+IC0tCj4gb3BlbnNi
aSBtYWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKClJldmlld2VkLWJ5OiBQ
YXdhbmRlZXAgT3phIDxwYXdhbmRlZXAub3phQG9zcy5xdWFsY29tbS5jb20+ClRlc3RlZC1ieTog
UGF3YW5kZWVwIE96YSA8cGF3YW5kZWVwLm96YUBvc3MucXVhbGNvbW0uY29tPgoKLS0gCm9wZW5z
YmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
