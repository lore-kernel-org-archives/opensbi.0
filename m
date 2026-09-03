Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FBDAC624D6
	for <opensbi@archiver.kernel.org>; Thu,  3 Sep 2026 22:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ltbDH9nAyoLElZe2oGERK/MF/C+v80Dw/wxJS51upVQ=; b=4pUOAeQmwoAuk4
	jD1ykF+8JSBnhnofVyNQ7Gd68HZhhipbdNSolDowwQ2dApa5RoN+0j2gMkaZOvPCR7fhzJn/rycRi
	yWqUMHY4qovejk7L90xaixqgQXTq6/m1GKHH1IPmFWVnB3nY8JuQLB5stb90047JCt0PW1L0lG6wF
	gXe8M1TxdW1JAXDXKGisijuiLksKUQlf7GLjsg4M1X7qR/VCrb3fp5jdFbFlyI4EdICzcG6SUEhaB
	EkR0ZgEpVrhnkcf+Kbc3/wjPbyWZD5lxv2LgrXedeF7G1sSzeS/QE8+Qtf1Ww/asriWO8PCzFQ2s+
	zMndGtPPq2TS8wW89xPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2FTa-00000000gQD-09yy;
	Thu, 03 Sep 2026 22:00:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2FTX-00000000gOU-0QLM
	for opensbi@lists.infradead.org;
	Thu, 03 Sep 2026 22:00:05 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683JhPA31575911
	for <opensbi@lists.infradead.org>; Thu, 3 Sep 2026 22:00:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bekpo32PCSIa7Sk3fsANicoADSFPDLoJkEGWSIiTJL0=; b=VBqxeENbF0OetfwP
	/0s/ZmbXbTRFyQX5L+xKNrZHsY5IxrjvGO7Ybt2EfMWyaYl2BWPpIxW3UCSAgKid
	4euo5pN8A78sT57xNvphHRRB4zdQ1Id7B5qcdJWwHNoJPvr6NnXgK8zIGO6rX3bw
	cjE+OAc8miREUoPHX6uC9xXmnm4mtB62C2pOwg/e4D5PfrDyBkduDjrNOBiF3jCL
	sxWrXzmfkueTQqcllEviDnWTu1DHr/FR5FexVjV7qPWn7XrmTBVrGKwcCCzFNU6u
	jKzmcJ1vBrdl7e75C/OsgC3r36v5dQZng0+xfEceoXfjF731H5jiS0wOKUPicdOa
	iK3lPw==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf4ekks3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Thu, 03 Sep 2026 22:00:02 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-45e83fd0663so309067fac.1
        for <opensbi@lists.infradead.org>; Thu, 03 Sep 2026 15:00:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788472801; cv=none;
        d=google.com; s=arc-20260327;
        b=iVVKZ08gkXRyI1WXCXK4IU6jacxoGPpWkAmAMJbVie3cRsmQeKCE3kBlOjuQa5RvDa
         NYHjDyl2FuKWzJjT9js7cFm6Kqe5b8D5NcXuNeBWxvSE9lbcmmYOFvA2ARS6UC7C1VTU
         9Az24G62jPcp8HFDzEHvxC8J8/lqkgYuzmI5LR0T0NAwAqzjP8T6dVAnQI40jETIN/EX
         a/OtlBzYeqhNa1gi3dSHPBrfeNaOIqRVoW0DtPHFa0x/i4IN6NHtPadvLhi9xE8LkCBq
         TBFR1n10W2tlOtDCupcFMeDPhz1iGoQdvFuo6BT2AAxswDGqWNl7VMHNmqiglcgcholM
         ZmIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bekpo32PCSIa7Sk3fsANicoADSFPDLoJkEGWSIiTJL0=;
        fh=4ewBQFYQm5N+QAVC2yDkcGgJqnoV8H9Ixi/6ZlMkFAE=;
        b=pakicODjeSOOoNOfogSVdH7G8FubqNRRg1VH+70DRWL5mDP37WQ1hUSGS+m/zGkVyj
         wcMD9elRMN5+w3jRR6KUZsuqiFIHkDWOvlyZrtGHa8ONio+jU545mVAjneehOGR4tuKD
         +K8efEta89aGU0HraZ6VWERTVZOlnndTbOvSHwvRUT2yFXteE/xemuosNkjV2wRsmP9B
         WYxyHPY4P5dUTbNQNTuViZvBJ+M4uaeLQBphVISS7Y1Hc9D11lFPGmuJDE4dCoONp4g3
         D2S0EsZksiptvegfwfQRSM/14+Z+CsZIENjoTBL5J89PXaXcHBB9pKQ/jgJYlIeYLMbe
         xvFQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788472801; x=1789077601; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bekpo32PCSIa7Sk3fsANicoADSFPDLoJkEGWSIiTJL0=;
        b=HgHkVMvHAPnXrqTRaVh8x7FTILNkVo8qGoEj+v9LtKb05SIpZZtPDe3Svk8M3FNzFa
         87nuKp+VADTD8lDEvcl2ihb67GegBsDOpRnd254VhjdeQIEkAxzFlT/82jNCJqSGvV02
         X29OpxPom/cvrwS/B25yZoUL0Sl4faXIC/wnKt7IBRz8FY+4fuBA0ghit57AuCksK0EZ
         3cGPv23Xbe9IKkkfmM+Lfx5ks4zbq8bf7rx1sODK55mmvxPY25RnNFIuMmEcrGCDmI24
         r0pmYKI1147WZQocSmkz+Fr2ZapNfJSpRc+FrL/peScTwPn4ZRGDf7WcWMAMsFni+wZf
         d41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788472801; x=1789077601;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bekpo32PCSIa7Sk3fsANicoADSFPDLoJkEGWSIiTJL0=;
        b=iLN6NsXAEeHMogljxXj2N+3iEwI7Mv+Kw2LkK+Q5DaQov/DeL7nnFlODkLC5NK09sV
         H5zC75obRDNPh4eHBERD5cdr9tvVK8Snp/Jd4y9CaFGFcakx5tjal8fa1o6i8OWXmWm/
         FT2xUjiBkRYAsWwd01la4dcWBEqAVRM4s5uu9VebOhO7YSeRsAcozIqSV11RyAZIZ+YS
         7ItOCHg79cnwqX2AiS49ms1KrGrlpQJzuwxvyhf1DtOrkJLBErZhS2/Nbct1836z68ch
         QJAg9UJ3nJtIatNWeRzOHGUOh6KLOPGqQ6MwzhxGHiM+BDnfVFqBI/lSFZ9r0hFAu924
         J+FA==
X-Gm-Message-State: AFuF++kNqdntY+HmOkqpG88H2uuK5eSOtLqVLL1PO27W2a26hwfuV7+h
	9ndPFhS5G4VpwTztfOci/dk/vjZTjME3eUU/Wl63DLYbLgObs072Kz9Co1Dyf9jpWbGw9yLZ2Ju
	jG3PYDC8m2oH3w98qvCqrSeRNtG+gAUtFKz9nw6XMR6lBPsTFrGQQ7TU5EPHfku1N4c2k6+2lKw
	1FU85tHo/FipyXjSt2Ro2bn3dZhDRFjtdivNB8x+4d
X-Gm-Gg: AYBFou1IYFQcdNSBq57mb7oukrErt88+vEc6/nM46cHW66ZjWp9vovzuuF/9mg9ZUy5
	93F9xsOdA4OxYtSuxfloX+d8QCUa9OCoeLGirx49b67+/3/9ULTxO7oceUFW9L/gCzXlzioooma
	0Wn+iK/v1X6fQE9345pOJ8LgonNxcijhw/JW7+rsdHdfBx77qIP7EEqcUecg==
X-Received: by 2002:a05:6871:c8c8:b0:459:2c03:6302 with SMTP id 586e51a60fabf-475512544f3mr1904149fac.11.1788472801498;
        Thu, 03 Sep 2026 15:00:01 -0700 (PDT)
X-Received: by 2002:a05:6871:c8c8:b0:459:2c03:6302 with SMTP id
 586e51a60fabf-475512544f3mr1904117fac.11.1788472801193; Thu, 03 Sep 2026
 15:00:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260817090503.2104998-1-peter.lin@sifive.com> <20260817090503.2104998-8-peter.lin@sifive.com>
In-Reply-To: <20260817090503.2104998-8-peter.lin@sifive.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 14:59:50 -0700
X-Gm-Features: AcwNN1XeA0E-KlFPTXxFdkIx2jD4nWqn-29-1JDcuk_jSZl1aHKbLYw6DiaXLzc
Message-ID: <CAAVgOkL7Si6i-a9p8RXAEKcKmhz+8bJGeqFQrJmqce8yUpBYtA@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] include: sbi_types: add PRIx64 format macro
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com, greentime.hu@sifive.com,
        anup@brainfault.org, scott@riscstar.com, conor@kernel.org,
        dave.patel@riscstar.com, raymond.mao@riscstar.com,
        robin.randhawa@sifive.com, samuel.holland@sifive.com, krzk@kernel.org
X-Proofpoint-ORIG-GUID: FS_0jETednv4QT5F3qfvBm3I5zTvBf1u
X-Proofpoint-GUID: FS_0jETednv4QT5F3qfvBm3I5zTvBf1u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE5MiBTYWx0ZWRfXwVxvHWHKerWg
 hoXp6IaavCoziTGUUPvUtdmbrYJv/eeaGeR8l1BWADK57T+R6rG496hWQmSMs4hpkpdiJyWjPa6
 6s+nI3UG/GPrSME9E2ouomIXxBIbKdOl8c74WNBf4SoeyCSP0k9Rknh7Kgp3G1wOtnIQ9otT6e2
 BWadlJz/01/2CnwdfceBqWbe0tnEIlVupZ74+tajaBVgICnKMZwRrNezqj0V0ivkKXBWsPccWuG
 squTARGAh63fyvNnEnpwll10Nxi4ID4QTjoDIpu0POrtbiKD5sH9kpjdhZLJNgySZU77lq0Jwh7
 sv9GD4pieRNqCEx1z5KLjdM6KbOnYMb1JbjBEfCRktAihIE9qJ8//AsTuCV21i1QqXTeRBN93v5
 Nf9nVYG/0o9TLlh5uXOZGqLHtOvTA9C2FMv0k9JH/VHWn8ze6XY5ehppmviBIFwm9/5C1OMYyHo
 /hIvrCBVpWXeVE6/oQQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE5MiBTYWx0ZWRfX/g31bzXAE616
 HsJ6/yJM2tG4cLK720Tgv8PBw9VqQnqcvYfjJ7ssXrzLNMy83V3ZC9sXlv+7RHlC2NjTgpnGrR6
 e0LeqQm0X8zcrkFO1Flu5Vuv/r/Uh84=
X-Authority-Analysis: v=2.4 cv=PKc/P/qC c=1 sm=1 tr=0 ts=6a99ede2 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8
 a=oYmuAEKEK418UmGzqhQA:9 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_06,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_150003_271136_9F2A641D 
X-CRM114-Status: GOOD (  14.55  )
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

T24gTW9uLCBBdWcgMTcsIDIwMjYgYXQgMjowNeKAr0FNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gQWRkIFBSSXg2NCBmb3IgcG9ydGFibGUgNjQt
Yml0IGhleCBwcmludGluZy4gRXhwYW5kcwo+IHRvIDAxNmx4IG9uIFJWNjQgYW5kIDAxNmxseCBv
biBSVjMyLCBlbmFibGluZyBjb25zaXN0ZW50Cj4gcHJpbnRmLXN0eWxlIGZvcm1hdHRpbmcgb2Yg
dWludDY0X3QgdmFsdWVzLgo+Cj4gU2lnbmVkLW9mZi1ieTogWXUtQ2hpZW4gUGV0ZXIgTGluIDxw
ZXRlci5saW5Ac2lmaXZlLmNvbT4KPiAtLS0KPiAgaW5jbHVkZS9zYmkvc2JpX3R5cGVzLmggfCAy
ICsrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL3NiaS9zYmlfdHlwZXMuaCBiL2luY2x1ZGUvc2JpL3NiaV90eXBlcy5oCj4gaW5kZXgg
YjhhN2U2Y2IuLjc4MGE0YzJhIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvc2JpL3NiaV90eXBlcy5o
Cj4gKysrIGIvaW5jbHVkZS9zYmkvc2JpX3R5cGVzLmgKPiBAQCAtMzQsMTIgKzM0LDE0IEBAIHR5
cGVkZWYgdW5zaWduZWQgbG9uZyAgICAgICAgICAgICAgIHU2NDsKPiAgdHlwZWRlZiBsb25nICAg
ICAgICAgICAgICAgICAgIGludDY0X3Q7Cj4gIHR5cGVkZWYgdW5zaWduZWQgbG9uZyAgICAgICAg
ICB1aW50NjRfdDsKPiAgI2RlZmluZSBQUklMWCAgICAgICAgICAgICAgICAgICIwMTZseCIKPiAr
I2RlZmluZSBQUkl4NjQgICAgICAgICAgICAgICAgICIwMTZseCIKPiAgI2VsaWYgX19yaXNjdl94
bGVuID09IDMyCj4gIHR5cGVkZWYgbG9uZyBsb25nICAgICAgICAgICAgICBzNjQ7Cj4gIHR5cGVk
ZWYgdW5zaWduZWQgbG9uZyBsb25nICAgICB1NjQ7Cj4gIHR5cGVkZWYgbG9uZyBsb25nICAgICAg
ICAgICAgICBpbnQ2NF90Owo+ICB0eXBlZGVmIHVuc2lnbmVkIGxvbmcgbG9uZyAgICAgdWludDY0
X3Q7Cj4gICNkZWZpbmUgUFJJTFggICAgICAgICAgICAgICAgICAiMDhseCIKPiArI2RlZmluZSBQ
Ukl4NjQgICAgICAgICAgICAgICAgICIwMTZsbHgiCj4gICNlbHNlCj4gICNlcnJvciAiVW5leHBl
Y3RlZCBfX3Jpc2N2X3hsZW4iCj4gICNlbmRpZgo+IC0tCj4gMi40My43Cj4KClJldmlld2VkLWJ5
OiBQYXdhbmRlZXAgT3phIDxwYXdhbmRlZXAub3phQG9zcy5xdWFsY29tbS5jb20+CgotLSAKb3Bl
bnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
