Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50383C54F54
	for <opensbi@archiver.kernel.org>; Fri, 31 Jul 2026 05:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ul6GHQOXGvPSWdHD1KDQNnagR6FECSxgi/xuVTxeIgk=; b=0x8OU7mLcFp0NU
	YPWwhWV3gXGjTqgxpKQLhS/hRVWfxdz3Z4TWzr14H9tsC2Ot4g1yKRePoPErMGbpYHYR8lKOO6K5o
	n/E62eQtyCBAOnfsWuU63wQcteBkZicd7xs0EjGcXrSzD9atR4u9045HwoiDctlRSrojlmSb9Ogp9
	0+d5ixHvez4b80bFHvtrbAgTGYIeyMgb0U0Lbo9DRW3RyW7f5yPn2+welSgKOi5ilsytMugO8RxuF
	KLiom7+iODh2LT5eC7KyColsfiQXFjpDMTA5vmLitt10O9Z8YChXjcCt3gAoJFzjswdy02vXLjN3m
	r+HOqKNYUHmb53oeXPpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpgAX-0000000BqPX-3M7Y;
	Fri, 31 Jul 2026 05:52:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpgAU-0000000BqNw-3lWf
	for opensbi@lists.infradead.org;
	Fri, 31 Jul 2026 05:52:28 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V5jaKd3014182
	for <opensbi@lists.infradead.org>; Fri, 31 Jul 2026 05:52:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BJ/oTQT38Ju/yu4ewMSvskBcYGwfSvxOwH/3ir/xtbo=; b=TAvz10dNT3T9UsQv
	k71sPkVG9oC0ZeuILc42VOLojNcn0to+h288oYQQ7/y+0gzmkhS/O218SWrDoxma
	IZYlA30l03L82zJSPFdCHmhWgZv+uQUP1Xbz0TtZChhat8Bw5ZQBrp7tJ7rpgX6Z
	6Qf5IqHqdQph+miG3xjojTjRXk1jOqRwKaeyXRQJE8+jbpte+TMMWnyhkPTwg+3m
	G2U5gbAD612yzW7blQ96BOTk1CB3E3VS7ZnhtxpdwDnXW+zMqnnzuLWZfl0Btge1
	9yMhL28/v560/psKV3Jni0d7t+vgsAzyNHkT4VjRxL/dFT5DdB994JCc599a4y90
	VqSw8w==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frnuc00r3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Fri, 31 Jul 2026 05:52:25 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81e735bcceaso10131267b3.3
        for <opensbi@lists.infradead.org>; Thu, 30 Jul 2026 22:52:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785477144; cv=none;
        d=google.com; s=arc-20260327;
        b=D83uLPVC++b43X5HA55lkZKlZctaXaqZhwg279e1+Y4wmW6MCpvOdB0urBDDQ4NH57
         IwvpqIkF762jeBXi8bLuHzv9anU5Jlamsfx2Ed0l6J9gOpalmh3hyLJ91vqpfYZxtW2/
         AwtQzPGvRtuJtL28Zr4XfsIYjlBgvA/2WA5sXOL4B2ccAkdKGmHdpgCihQg9ukhMo/FC
         XxttRdCCi7Wmre010WHg13VJXwqlTXlj1sLhT9SVGvIBLDdHrO8cue588iOW0o+9VXCD
         1ScqJOyx+tPGd6lRYT99HfCUWZ9FTT0zmGlny/PyFT6QBLgp79LK1sFfRDRhDV9qJ8lu
         OEQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BJ/oTQT38Ju/yu4ewMSvskBcYGwfSvxOwH/3ir/xtbo=;
        fh=ptzNB7g9a30gS3iMdXy8hchchj5+04tEpHu43QD535Q=;
        b=A2OssNxdLy9uwxvWs/lj8u8CweBnEqToS2ym63qzseikVIqCN2oGf1zyTUvET40MKp
         oVAZx9lTXJ+INd4ctjtU82Y3ufpCb1o+twJ73l/d8terrm/tSq5BCbdh6qIweWGsahuB
         kTMrxHpHOZZtm29juQGdX11NAoMBZfbfVgNrHWWFV9IIK8kALld31zcxN3VfrnLHeMvT
         2jcNSJtuMSKgfSEziJk936JInnQkhQfP+M9HJiB4YkukR0REjjGeKFu+M8iZ8z5MkQBy
         Y0eVMJYzG/5UkjYhgCHH/KzJcDCCSC3BCac8+fIbMlYFMMuwqoeMhZae8R0MP4+zt4TE
         M2vA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785477144; x=1786081944; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BJ/oTQT38Ju/yu4ewMSvskBcYGwfSvxOwH/3ir/xtbo=;
        b=SvsyJh9/TmuvHmaw7ec7heV+vgDlUXajNV44vNSoH7O4ZpQRBbgB4SriAx+IUMtTxc
         iHIGThnTqVTMWWPP8/bYpBTUjg5PO/kaKX5yhVA0dBxbpwYxN0cE8ukkuIfFm5J+lynk
         kNgPA81MVm+m+LTmb1FNkJKwMgzvP8Bp2gGvOea52TZ7SF6ckEUeIt9uRcScikgV05XD
         p6eMFl0bxtlAcUQ2VVAb/YAnMV0+Lpz+JPaycLvGvtv7NflhbMZwG4Z0U8QDq+VO/hsF
         gKE6kMs1HST1OhGf/+inp7+CXFGKXeg0q6/gFsFUctJe7T7U40FNsQk+I3EqzUc2byrN
         EmEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785477144; x=1786081944;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BJ/oTQT38Ju/yu4ewMSvskBcYGwfSvxOwH/3ir/xtbo=;
        b=hDzoL6IDKcb9bOPkoXwhZ1oo48sFO3LhhLE2hXSlr1iG92gIXFS1fzdmSVf7ZKQ94+
         zplDLOeE3yQGDRJusBu2kHS3i568y3r332XvLQn93l0zdJtRXaPUV+zZsBXGnBSWRFH0
         7PXM2YXbayWgKWBduxEFjHmLLfp0uerXcTJoaCDhDJrawnrdsAaqfRYSs3aJUMcpvojE
         weuQy3MRUL6InnwvV8PvUeZo+yd4WjTVUdXgmpuuLQSLOjxOPer7D2GbgH1ssuP5ur1V
         7PIguPl2NYhx9nVGjXkpB2CYvICoMOMCnUgVtwyoGN2l1RdRVOXtJHf56u7CV8lyZsIH
         Fcjw==
X-Gm-Message-State: AOJu0YyxLif3GFQ4ZhVSJSpufBHqCrphxs3enmt2qWCbbRYQscZ7SuuM
	aD4e6azjNa8Lft5EUuFuAEDlTvtxVWpfqJfDHTTdvZy8yzkiuHbaUQKywTNrgBennJKwgbrHfdl
	ja1t6fBoHsuKD/qhiicgOKduL7fbqQnLQ0YFf6EyNBvqY+gWGM6slILjoDFgVwiIFjW9F/T/Mj5
	yLzeqEoZuIARl0x9mLlCqOcCv/MxIFd4MxmULz32So
X-Gm-Gg: AR+sD11tNVjRVFgoSpPiIndgJKdTW74r+gDKNURVte4HtCm+3/J0flxGCcE0Z0uB3Qk
	uzHlDiRF4ns35zilKFs+MBNvZ+18iDSfDCWLCwWhAaO8NsvWjd6SfUkh+VLwtraNk14K57yFA6I
	7RS4O++WVAwDMs4DQ0TvvGLFoTJqv95xsSmJ7PHMn6FA5eGECp2L9SwNPgKQ==
X-Received: by 2002:a05:690c:6607:b0:80d:e322:5426 with SMTP id 00721157ae682-81fcbbddeebmr3313967b3.40.1785477144524;
        Thu, 30 Jul 2026 22:52:24 -0700 (PDT)
X-Received: by 2002:a05:690c:6607:b0:80d:e322:5426 with SMTP id
 00721157ae682-81fcbbddeebmr3313877b3.40.1785477144025; Thu, 30 Jul 2026
 22:52:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260628090421.188161-1-liutong@iscas.ac.cn> <20260730160252.1325335-1-liutong@iscas.ac.cn>
In-Reply-To: <20260730160252.1325335-1-liutong@iscas.ac.cn>
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 11:22:11 +0530
X-Gm-Features: AUfX_myzVs44-gNhGJu0iT7WDSbi-EhFU7oHdT3va30MUQKwu3R7phdWW_JrvF4
Message-ID: <CAFR3w36HL7qj9XXXNgxcSFGKCFUjVAi0HDMuO0wu6D5_AN4GFQ@mail.gmail.com>
Subject: Re: [PATCH v2] lib: sbi_pmu: fix integer overflow and zero-address in event_get_info
To: liutong <liutong@iscas.ac.cn>
Cc: opensbi@lists.infradead.org
X-Proofpoint-GUID: 5nqFQym3VmwO2CHm-cSF2Nn9gs9bzzra
X-Proofpoint-ORIG-GUID: 5nqFQym3VmwO2CHm-cSF2Nn9gs9bzzra
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAzOCBTYWx0ZWRfX7ZKZTrqaA7jH
 9lrMRGEOxKrp0Z0BPWMw7G/Gx97Uxtf/Zlq9GnKz6XN0g+ev2UV1BXW2kq4ZVa6Lj00drlPM9ek
 FiuIcuqH55se1y4EIvCmaJC+hgAq9pwRjMlMo1ALYJHUpOd2iPcwY8Vz9J+Cf+NPJRwQ7VdGxdQ
 9swXKDk6ZWacDHrjyDpbJgsuRmCEJAwCjNXBOQtDh7eCmuBhRnv8TH4wgmRZSU/IkuVPenXSm6f
 mnlpm17uRXhnrocwohIt5GoNtp2pZcKDMn8g0u6EkzsZ7W2H/QHLjwabax8viU73a52vaOZQCUt
 QXCUeYS6JwmHdL+DElZTTkjcKPcV6kywUBYeFTEZiD/17cK7z8BxKwqmlfd8Wfuu6hkeOgPxSR/
 sZKe/CbnsRwFkdEG9XvgJXwgsJqYKQnD19lPlzP6HDs+IQKFT8tIfy/M7wjSS8C4bctRBty/xdE
 T4Lm8cQlHLRLO1xgljA==
X-Authority-Analysis: v=2.4 cv=T5W8ifKQ c=1 sm=1 tr=0 ts=6a6c3819 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=QFDb2H8CayUIjeqmVqEA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAzOCBTYWx0ZWRfX5uwTmXBtzIs1
 SIQREjASXPR2pclCZxBRiPsXGeVMSE+/Ea2x5Ps2IJxjR6VMWdEN0FpxIxflpj2lqhkPukQYEJA
 tsxOaZOaMbjK0XQWR+FOeaQ4g+P3VQw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_225226_944972_04D3FC68 
X-CRM114-Status: GOOD (  14.23  )
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

T24gVGh1LCBKdWwgMzAsIDIwMjYgYXQgOTozNOKAr1BNIGxpdXRvbmcgPGxpdXRvbmdAaXNjYXMu
YWMuY24+IHdyb3RlOgo+Cj4gc2JpX3BtdV9ldmVudF9nZXRfaW5mbygpIGNvbXB1dGVzIHRoZSBz
aGFyZWQgbWVtb3J5IHNpemUgYXMKPiBudW1fZXZlbnRzICogc2l6ZW9mKHN0cnVjdCBzYmlfcG11
X2V2ZW50X2luZm8pIHdpdGhvdXQgY2hlY2tpbmcgZm9yCj4gaW50ZWdlciBvdmVyZmxvdy4gQSBz
dWZmaWNpZW50bHkgbGFyZ2UgbnVtX2V2ZW50cyBjYXVzZXMgdGhlIHByb2R1Y3QgdG8KPiB3cmFw
IGFyb3VuZCwgbWFraW5nIHRoZSBkb21haW4gY2hlY2sgcGFzcyBvbiBhIHRydW5jYXRlZCBzaXpl
IHdoaWxlIHRoZQo+IGxvb3AgaXRlcmF0ZXMgd2l0aCB0aGUgb3JpZ2luYWwgY291bnQuCj4KPiBU
aGlzIGFsbG93cyBTLW1vZGUgdG8gdHJpZ2dlciBvdXQtb2YtYm91bmRzIHdyaXRlcyBpbiBNLW1v
ZGUgbWVtb3J5Lgo+IEEgemVybyBwaHlzaWNhbCBhZGRyZXNzIGlzIGFsc28gbm90IHJlamVjdGVk
LCB3aGljaCB3b3VsZCBjYXVzZSBNLW1vZGUKPiB0byB3cml0ZSB0byBhZGRyZXNzIDAgYW5kIGhh
bmcgdGhlIGhhcnQuCj4KPiBBZGQgYm91bmRzIGNoZWNraW5nIG9uIG51bV9ldmVudHMgYmVmb3Jl
IHRoZSBtdWx0aXBsaWNhdGlvbiBhbmQgcmVqZWN0Cj4gemVybyBzaG1lbSBhZGRyZXNzZXMgZWFy
bHkuCj4KPiBGaXhlczogZTQzNDU4NDIxNjhiICgibGliOiBzYmlfcG11OiBJbXBsZW1lbnQgU0JJ
IFBNVSBldmVudCBpbmZvIGZ1bmN0aW9uIikKPiBTaWduZWQtb2ZmLWJ5OiBsaXV0b25nIDxsaXV0
b25nQGlzY2FzLmFjLmNuPgo+IC0tLQo+Cj4gQ2hhbmdlcyBpbiB2MjoKPiAtIEFkZGVkIEZpeGVz
IHRhZwo+CgpZb3UgbmVlZCB0byBzZW5kIG5ldyB2ZXJzaW9uIG9mIHRoZSBwYXRjaCB3aXRoIGFu
bm90YXRpbmcgaXQgaW4Kc3ViamVjdCAiW1BBVENIIHYyXSIKCkkgYWxzbyBzdWdnZXN0IHlvdSBj
b252ZXJ0IHlvdXIgcmVjZW50IHBhdGNoZXMgaW50byBhIHNlcmllcy4KCi0tIApvcGVuc2JpIG1h
aWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
