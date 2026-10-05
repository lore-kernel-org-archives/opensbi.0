Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342BACA5FE2
	for <opensbi@archiver.kernel.org>; Mon,  5 Oct 2026 03:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7iBd7uNZX0+9JAyMh9NknvHLWvjq3kEjI6PMDtZwxFA=; b=wcUrLCteRtjB6n
	IhFqfwJFzz0ZRp5yPJk6zzQ8ngpGC5H/G3SiXZjX3b+4wkjNVC9kjr3fp53M1zZQzl+In06goCl1b
	kF2vaJ+M87XUpIUIQgPYPv3Mi/YAOrd8/kmPuR4s00gynPu2zvZOg/bSEUI7G7TY/y8IQgGBg2k7p
	M+pfdSVEGI2PPxpiHMjFn1cKYqan8dDlznywWfqqDS4laZ375N5aRzwMPLHfCP7QDNUuLIVlaL5RJ
	T7cWyhECaGzunZJRn/mothHyF6Et9IS/KlGvXbO2wyvoA5x82U2UCTEsSPXWO1WR89skbiT7LQnxI
	LCHW0EIYqITYmSQHl4Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDZGq-0000000FcZs-2oC9;
	Mon, 05 Oct 2026 03:21:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDZGo-0000000FcZG-3RQF
	for opensbi@lists.infradead.org;
	Mon, 05 Oct 2026 03:21:44 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69510TEf4061477
	for <opensbi@lists.infradead.org>; Mon, 5 Oct 2026 03:21:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eWQ+945mJfAFrOh/qiUBYsEcfZYqjZYJQalGItMhVuE=; b=MGMF82/jdT3MXuKG
	tWaMu3GSBfhasJ3KKVv0rQHf3KppcVfEGb5gNQFkLcWgSmeqbuE6A3CCTLwgTCz/
	1Uy3ePpv1lOmkb0tSmC+TKLfNva4yy+vowqi3yut/UcX0qXpv3IGt5n2ZuWtns9Q
	P9JuCp3aDl376LwL8NPf3+Ane2x/uTI1p2pFsLgvQ3cbvHVDfdhapNTBEGOyL2gp
	VX5ofslJteHHPn8tGpQfQV9HtjDLkR1Na3ZBZJkzXRcCfGmShUF9iLZ9QA4V5F3w
	38Wq9HpTkZA2fVUtLAcqGSVrCsRD6Wp0BFamzBEW5kYnt2dKr7sEkrqi3a+GfLoR
	hmOz1A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h41gn88p0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 05 Oct 2026 03:21:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a3f673221so285567185a.0
        for <opensbi@lists.infradead.org>; Sun, 04 Oct 2026 20:21:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791170501; cv=none;
        d=google.com; s=arc-20260327;
        b=ZDtEUz5BvoXotn7JuhHUmO3m5ICYoiIui0Vnt1Vhzz9+m3fx4Zys3211jni3wfF5XM
         SmS+7VOcO8neYl5y9yjHLZT4rVc0vPefwXjEJZ9Jfzyma8ayUmGw2uccIUh/KWBYxs2e
         OZCT7fGEPzo/auipj43YPl2N1wJqqlb/fXzpatdbx+tlFVLVmHUSSMz6gz0RrM0nd5Vm
         DJd0OGK/BfWOw/VOM3ZLiOiKgdEfVZ5zArEdC/a28BFO08VIp70paSmO0FLoggtogruF
         HO7+qErDLwRfWl+t+EKVT9E0rud+Yy5vZA+f9IrqPv7z3j+G1J6EKPPaa5jVfXTsJxU5
         uMSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eWQ+945mJfAFrOh/qiUBYsEcfZYqjZYJQalGItMhVuE=;
        fh=w1sQTthhun7iHXZ4nnvjwGqAmGVCTU+wYHW0CT6WtOY=;
        b=UUbVH44TgywjE0xwLa2/blouGSIgJIKMN50+3OhbfxB0CiPXvIeAH3+DwQk5ROFh3/
         +w0kP/SnBdEiKmIELs0lM40BFYGfUFuJwkcYFPdqb/rTdQiGsMhoQkR9hTqpPh5xvjaQ
         sHqp4q7fRmhOGZLs0LjTEIblqz45QJwEdgNp6fMpLsFUGkm271Z9aP5867pctejhLZFZ
         rbMHrsiCLg//dJ5416HokZ7EuEaYJLM2y5UoVM08XsdE2NM2OdzDzPVxqWyrA9KQhCDl
         B8ImezHeunB5+wvYkXVM9b4IrwU82L0Jp13xTzbWB5usmyYA9FmX2Gk5BDhk27p6FkQa
         moGg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791170501; x=1791775301; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eWQ+945mJfAFrOh/qiUBYsEcfZYqjZYJQalGItMhVuE=;
        b=QjC77xOyExtu9qFS+GUpMTfRauDiYGBoHBzjBJm362S833Qg2BaWpqtj8jke3+AvZF
         yWgTsQiVvPN7hlm9//Ya09N4xnsfG9vr/KoacQkKWwAgZDq/UYvuEO/AzLpwGuszR6Xo
         XFmXzvarEHrdOQwklsc3NBF1QZxOw9TiSBIoqxvsyRrBuH2FAR0Y/Az5PwCd3iZJAt3t
         kMecULjg3SDjyGSdnV6S6/1aBwUN0cXL+sADSoeCoxU5T1eerdK+FfPW8PUTfqcwdJKV
         +mDKrMkLFlcysVwunQgHc105bEYBpnEX8YvOGe28/PgjBVei5XOqFLAJB7MsKfe2pll/
         f1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791170501; x=1791775301;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eWQ+945mJfAFrOh/qiUBYsEcfZYqjZYJQalGItMhVuE=;
        b=HB0tnoY1ycEFMIv9ulHa1TOJzQu2fkQsfoZsWjOxCyL105ik/ACRSe5lyVj5Fyzbx4
         f8JatDBs3yHeOW8o3nSI0dAxfrqL0ROO3M2a80Q/p04bcGjl6pFZJ2lcqWoDqEOjUvhj
         MKZil61FLE+CyccZjkZ5GdHdjZaqm3TUWHLN4He5U4eFkVpvNVfyYGB1V8THFKELFrDK
         4tOB3SostlugNwaBWVAoJciqtkgqhORAHTnb3AmK3/omG0afkyCI5q7g4Ejl/Fd25l3J
         uLSrNXciLyJvK6JvpSNX8q7z7Ogse3qv9Vi1Yjv5EtF6HaSJ406HMHxKhIkgAL5wy+Kc
         XcBg==
X-Gm-Message-State: AFuF++kB7gmzLFYLLtczcsqBuQgjNw8ETsRPV2xfplNI9pudv049/pE+
	+90aKU5q+y65q8k3yNrW/v6dm4+Yj6Hf30llN1pGOPNVLwqXYEYk/EagWrAMQ70gs5B/W2J/5RN
	Fs+4OgUbmxKiBHB++9/R9hrMyQV8PAQoD4d4vLFkie9PIBuO6iwBEA2n9EUDL5KAcxT/7cTMOrz
	ajv0OiUbIstDXTA2FDagw6DWu8BwLVSAmnhPpt+ZGB
X-Gm-Gg: AYBFou3FSuviDddNFqa1H+z4yj/OXsEMws5jDdS6YeHzNqKN/5ZQdbLLua4Ryi8h+T0
	n14yiMvzs0m2l9XsecMXcEL4QN7yEOxevFFrSBbcahqu/uT0o840UbyhrrzWJs8nYPtDyB3PaiM
	wxT5mtFJZO31YLnwF1Hgba87Gj9euf8HrT/Y6YuCBGK6DhR3qm/apY4c3SysVzEV+EIEOgYOQ4K
	UQKZQE4zN+V0C+4iA==
X-Received: by 2002:a05:620a:8808:b0:93e:4a94:6072 with SMTP id af79cd13be357-93e4a9465f0mr1362069285a.63.1791170501046;
        Sun, 04 Oct 2026 20:21:41 -0700 (PDT)
X-Received: by 2002:a05:620a:8808:b0:93e:4a94:6072 with SMTP id
 af79cd13be357-93e4a9465f0mr1362067585a.63.1791170500586; Sun, 04 Oct 2026
 20:21:40 -0700 (PDT)
MIME-Version: 1.0
References: <20261001060820.1267933-1-prajwal.n@oss.qualcomm.com>
In-Reply-To: <20261001060820.1267933-1-prajwal.n@oss.qualcomm.com>
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 08:51:29 +0530
X-Gm-Features: AclHuK-bJIvSjLYRm49AjjzRUkbCJGj3aq51WXMilDVWJT-4cKjCEdj07ac4UIs
Message-ID: <CAFR3w36e23qpZORxpzzjX180BQ_AaLOX_235feQHBhDo7=yB-A@mail.gmail.com>
Subject: Re: [PATCH] lib: utils/irqchip/imsic: Fix the MSI capability assignment
To: Prajwal N <prajwal.n@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, prajwal.n.oss@gmail.com
X-Proofpoint-ORIG-GUID: J2g4ct1xov56OOy024oro_VBglGtkIdg
X-Proofpoint-GUID: J2g4ct1xov56OOy024oro_VBglGtkIdg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAxMiBTYWx0ZWRfX9X0+Yuniv5yK
 wJKP+jA4Q3wbgWQuEn+zc02wkO9Pte78NzdXYExuKuwdZpzgE+sHC/rzfz9NznDyDPORd1sf7cy
 WmSrFy5a2yAYhzrChcBOGT0Bg5QxeWacs4rv79XvTk0jHdE0bA3WQ9oDVzJ+Nmn/JKVuE0XS5hg
 NgjtH/JyYrXvdyrqFxYPTAgTJiwgUgiroueb4+ZrASH5WWnc+F49deLs5/qQHb3+U8zSy8vLGmQ
 FfNXbmfQrcxjmihetddlTN7NBQ8FvVWolFUxpft4ejULYyF/GlxG3DIjeL6EkQxL6VEcg0ZFKRj
 O6LLmy0Ml5HsZrQhIYz3ujQEPd4x917YkCfoWSzM7HOD6EmMnCFV+SLMPpINJd9tpdhfF7lDTtO
 yKfqLnv16A9IF1E9AAzc6SL5IfJzmbNeHe0GMolB0sMf5NRB8CQfh3rOncCTGzqfGc2c8mjfriK
 R7nWTmthvoGWu/bHUyw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAxMiBTYWx0ZWRfXwVCFbNfYKv+T
 4QQnbrkObzhdOwAA9iiJ1FysAs3QboTT2ngx1nmtyica1tuT9PFzhA3wQ4SRYGVnSVZaPzdJAEj
 zHZadGJ3S9/rxap/0+VARe4MOUVOJ88=
X-Authority-Analysis: v=2.4 cv=P9WvFSAu c=1 sm=1 tr=0 ts=6ac317c6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=Cgm17DcsQIzNQePq4-YA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_202142_865024_28490B02 
X-CRM114-Status: GOOD (  19.04  )
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

T24gVGh1LCBPY3QgMSwgMjAyNiBhdCAxMjoxMuKAr1BNIFByYWp3YWwgTiA8cHJhandhbC5uQG9z
cy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gVGhlIHN0cnVjdCBzYmlfaXJxY2hpcF9kZXZpY2Ug
aXMgY29waWVkIHRvIHRoZSBzdHJ1Y3QgaW1zaWNfZGF0YQo+IGFuZCB0aGUgTVNJIGNhcGFiaWxp
dHkgaXMgc2V0IGluIHNiaV9pcnFjaGlwX2RldmljZS4gU2luY2UgdGhlCj4gc3RydWN0IGFzc2ln
bm1lbnQgaXMgbm90IGEgcG9pbnRlciwgdGhlIE1TSSBjYXBhYmlsaXR5IHNldHRpbmcKPiBkb2Vz
IG5vdCB0YWtlIGVmZmVjdC4KPgo+IFNldCB0aGUgTVNJIGNhcGFiaWxpdHkgZGlyZWN0bHkgaW4g
dGhlIHN0cnVjdCBpbXNpY19kYXRhIHRvCj4gZW5zdXJlIGl0IHRha2VzIGVmZmVjdC4KPgo+IEZp
eGVzOiAxOTNiMWQ5ZTdlY2IgKCJsaWI6IHV0aWxzL2lycWNoaXAvaW1zaWM6bWlncmF0ZSB0byBp
cnFjaGlwIGZyYW1ld29yayIpCj4KPiBTaWduZWQtb2ZmLWJ5OiBQcmFqd2FsIE4gPHByYWp3YWwu
bkBvc3MucXVhbGNvbW0uY29tPgo+IC0tLQo+ICBsaWIvdXRpbHMvaXJxY2hpcC9pbXNpYy5jIHwg
MiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+
IGRpZmYgLS1naXQgYS9saWIvdXRpbHMvaXJxY2hpcC9pbXNpYy5jIGIvbGliL3V0aWxzL2lycWNo
aXAvaW1zaWMuYwo+IGluZGV4IGY2ZGE5ZjdlLi40MWNmYWRlYiAxMDA2NDQKPiAtLS0gYS9saWIv
dXRpbHMvaXJxY2hpcC9pbXNpYy5jCj4gKysrIGIvbGliL3V0aWxzL2lycWNoaXAvaW1zaWMuYwo+
IEBAIC01OTgsNyArNTk4LDcgQEAgaW50IGltc2ljX2NvbGRfaXJxY2hpcF9pbml0KHN0cnVjdCBp
bXNpY19kYXRhICppbXNpYykKPgo+ICAgICAgICAgaW1zaWMtPmlycWNoaXAgICAgICAgICAgPSBp
bXNpY19kZXZpY2U7Cj4gICAgICAgICBpbXNpYy0+aXJxY2hpcC5pZCAgICAgICA9IGltc2ljLT51
bmlxdWVfaWQ7Cj4gLSAgICAgICBpbXNpY19kZXZpY2UuY2FwcyA9IFNCSV9JUlFDSElQX0NBUFNf
TVNJOwo+ICsgICAgICAgaW1zaWMtPmlycWNoaXAuY2FwcyAgICAgPSBTQklfSVJRQ0hJUF9DQVBT
X01TSTsKPiAgICAgICAgIGltc2ljLT5pcnFjaGlwLm51bV9od2lycSA9IGltc2ljLT5udW1faWRz
ICsgMTsKPgo+ICAgICAgICAgc2JpX2hhcnRtYXNrX3NldF9hbGwoJmltc2ljLT5pcnFjaGlwLnRh
cmdldF9oYXJ0cyk7Cj4gLS0KPiAyLjQzLjAKCkxHVE0KClJldmlld2VkLWJ5OiBSYWh1bCBQYXRo
YWsgPHJhaHVsLnBhdGhha0Bvc3MucXVhbGNvbW0uY29tPgoKLS0gCm9wZW5zYmkgbWFpbGluZyBs
aXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
