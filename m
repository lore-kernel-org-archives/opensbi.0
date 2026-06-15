Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F3CCD98CE
	for <opensbi@archiver.kernel.org>; Mon, 15 Jun 2026 06:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SbuGKYRWTWAhzoq3YzyzrEXY+OVKKA7EQvN9tep4tYs=; b=p962GY7bL1dl2w
	SvPBh/4/NnK6dA19Zo6dR+4CisRgJEBNkrHlrgZgrblIHE+vOii5DAKC9kvFh06xpS8D8VitQNL5S
	EA6oqdgesMQdkn831KQ0quYieMbUz2L4aQK45KINFEt11ZwbODKf2kxuFf+IassuNP1apX02qUMMT
	HMSniNHPJe0vvm8i+1vHjnxaQvE6vnZu+Ca6ZM5+ypbyWDe9g4ZMVokA+mc0voug3s9hS4Ds4/lbU
	fc5aNCMPtfiFbbUSMmm0j3qXN35bnm+lrRv3T/zJ1R+cPZVCx6dSYgEOxxg/9F2ZMq3aT427nAnCG
	NvFZf7e5u916rFX7/u9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ0VE-0000000DflD-21LN;
	Mon, 15 Jun 2026 06:08:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ0VB-0000000Dfkl-47H4
	for opensbi@lists.infradead.org;
	Mon, 15 Jun 2026 06:08:55 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1iDla2647568
	for <opensbi@lists.infradead.org>; Mon, 15 Jun 2026 06:08:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LiebXYY+58lAPgMmvYKHfSUmbQ72+2euk4U00h8RrUg=; b=HzVi3cQiAYon1TZ6
	iQGf9l81sac3Wes/7s/x6voQvGR7y1VrhWewGsnKDBU3OPU1NTNbB5X2jGZorWPC
	6GMm7TiwdRsYi7ssghQ8DPovoGGXnxo3kXOG0egBDfdRGtng5VgXRvW0AeXxXKNo
	uEYHTLuSW5VJnB2xSnRVTpbmOoFRkwMpmMwZwjg8sc/9mAlb0VR+k24z1PSUYwx4
	/WuxBiRx2x07z/+C+ufff1cHKhythUG99Z4g15UngBcWuYaUPnd80g64hXgmfPwI
	wKfTJ2jNfKqww/cAXNV/PwbAlMdhgFg6DFQ13eMGKXOwcd+wfDAnU32q477wv4oH
	VFG7jg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryybwpw6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 15 Jun 2026 06:08:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-91576c147a4so800167885a.3
        for <opensbi@lists.infradead.org>; Sun, 14 Jun 2026 23:08:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781503731; cv=none;
        d=google.com; s=arc-20240605;
        b=dX7oL28MRcK7Y3BS1GF1bMXeTFfpBSiJKhLg24mqAsRzGzyYovItV8DDjVjbIt5KK7
         ifHVi2UIJquP3idMPTniJexvPcw7fs73EnOc+1sve11rajtJbdMhtz+wUodq324+hld1
         0WdAUlmJMgLZ3XqSBwEDKQNromeuCpy0kqj43ju8mN4T9vXeRPiq5WFRU2z6z1ZImmys
         KTxoaRmGOFHP1kbdIL/kerHwBun9nd9cWT0m5TtrKHx7YPs4JgWIAzsHuMzJf+Lw9YAf
         aYyofyW0MAsOKT+LSSWVqUXniqLnnygyj3hqMDfXtZC2hsKZi8YYuKYtrrqW9vLzZzMI
         oi5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LiebXYY+58lAPgMmvYKHfSUmbQ72+2euk4U00h8RrUg=;
        fh=AjEMO+LaGc5h9bSc2U0ef6B0fpOsp708NUy+Qto5y2w=;
        b=dYxCrCBE83KEA5bsBGTD2kN8GSHr2MtX1OMtKhQ2rt0WceTjQAXLM82ZaozbYmjpBX
         1+l5YFyM6fPlixGWDJhwnRPDp+NwIcRyqgjhY2bogBAWmLQzot6F8vhYNfe63Ct75zrl
         oRCDcswxHc5t+nYAVr4UNRgV+TOjKQBU1iMLFQMll8MAytkO4E8Ek8SDcGgl9aw4pHSn
         Sk8Rb3yhtvcw9Cs/xbTjfKJV35TIcE4M8T8Jh/7r89qaotBc/zZdodJg18kt3CWiXXQp
         2L8umKjrj0WfUGc8wsn7SYXS4tXd/ZOmWirJ1v582XU+O6upL2hCxjBMnSvblPxRBDUv
         Y6aQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781503731; x=1782108531; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LiebXYY+58lAPgMmvYKHfSUmbQ72+2euk4U00h8RrUg=;
        b=XADMeEUWCHQwKObGKJGtxCP29HDU2XEqQH011Rox4bzgz8fsrxywWkDro0ki7koYIx
         BypthQg+uzeuRNzKmrcylk8ymadHkKWmPwW0zdrtRXnD6vDkcgcsPDGtF4nNtozGXu01
         J1rpLdCpsW+zP9QrmQjqPy2AANhSAEJcT6udNSCADvVBjRt/Hqc/d5u50WRzBp0ODQJP
         AwXRz7tQ0c0C5yL4Wuu726fDD1FJ0kpj7SINFyH1chUnwnWQCYYDddlV6PuK8chztBPp
         IQiUQ8GRrLsZR1OrPFm8alPP7LBkT934F2pvERHpaqBXwhQWQaI4tFMrxfOJV0PmsOMP
         X+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781503731; x=1782108531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LiebXYY+58lAPgMmvYKHfSUmbQ72+2euk4U00h8RrUg=;
        b=C3R+mbK1wj4XRD6afc/G1vVjynKvDC7YlUnqe383BqTC0drQrlrZeKIE3VfjUdwtwI
         F7JF6Ltlb8lOANuoIc7mcn7RpJVQ4zsWhotcfJlk+XmzxTpWaASV/d+ihAgaz8Ld3Ii4
         MP4WntCIHr+rj0BItM1vxvPrwYUSPPmgpUQCyg7lE3EqeSICwGMwk1yMKyzYqIe+NJnv
         1C2QkknzW8OKgsLmCcobbyYvKad6JMq83iQ2q/fM75tAsaJ+oM8z0lR31aRdy82iRzaE
         kljRVV03e9cf/ZsRoDPfzr5UmB/t1pvr0oOusa3T0Pk+LlEhD5DKh1U8d8vRr4OL86jd
         57Aw==
X-Gm-Message-State: AOJu0YzLwkcPLBwqNpFUC6BHicBULDc2UM8yYklCKpjgpMpT5BWhou8e
	5elXOoeNBHniju1wonpYyTPd5bzFQMMfco0JLu13k2N//yXElzH0Utp8GdR5O+BFtM/AoLT0drM
	H5xDrppMgKretlT1k66oTspo0d3VF3QlskyMPRLbf9Okhbgr4kf3Oa/tb8niL1NL0VfGYkRrumI
	VI2nMIhEYMvhiKR2tYeICo3fi7a0zVpBA+tz1OSR/k1Fg7R+sno4U=
X-Gm-Gg: Acq92OEjnLOyBzHI72eLYLCOT5yTwaLdm2zz6A1ZSUuj1DwskUWCDByv87EYfmQwtow
	X0feP/9QLd8Zyni8MPuc2OjBofeuC8Y897rsgFOPb+yCou+rmpccjCrQJelx1aDdGtYgiB8kikc
	rsg8TRRyHfI/01mgNNZyQ0vB4Chf+cWWOfgcpx9twKu3NEiN4nk8DdiKRwnyRwDGhlq1PVM7xNI
	mb8MARX
X-Received: by 2002:a05:620a:4804:b0:915:86a4:6685 with SMTP id af79cd13be357-917f01b5abamr1533070785a.13.1781503731239;
        Sun, 14 Jun 2026 23:08:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4804:b0:915:86a4:6685 with SMTP id
 af79cd13be357-917f01b5abamr1533069085a.13.1781503730838; Sun, 14 Jun 2026
 23:08:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260609055745.2443353-1-subrahmanya.lingappa@oss.qualcomm.com>
In-Reply-To: <20260609055745.2443353-1-subrahmanya.lingappa@oss.qualcomm.com>
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 11:38:39 +0530
X-Gm-Features: AVVi8CcOi9oVwi4fvbQenH_Cp7hmKAhC5eEMszhAMd4zmdJkyB_sca4bKWYnhKQ
Message-ID: <CAFR3w354AOKQDarWsU6kvSg3FraFMr1uPQ87u6Rep3jxSqwfsg@mail.gmail.com>
Subject: Re: [PATCH] sbi_mpxy: Add Logging service group handlers
To: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org
X-Proofpoint-GUID: 1JxYpmkBH5lV-HfK5sjbvPZO4v05WIGo
X-Proofpoint-ORIG-GUID: 1JxYpmkBH5lV-HfK5sjbvPZO4v05WIGo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA2MSBTYWx0ZWRfX6CGNVlqKvy7r
 0AjsoVuI68C3KJuWJWbOm7e5QBYvILFldkZKZ4MNPJNOtaTka/+3AykAiK4iXKn20gYeR/oxAY5
 c23HC1471w9lngwztT+tfcI4v2vxfhQ=
X-Authority-Analysis: v=2.4 cv=JLYLdcKb c=1 sm=1 tr=0 ts=6a2f96f4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=MM6GPz4KWQpPl2IL170A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA2MSBTYWx0ZWRfX2Iv6VektiaGE
 LlNyfXr13hB/9rUCJvhw93m1kwu4TBepNC82ELWJgfM7ch0TbEh1wdxe9yxgY9x9ZejrcMNAuh0
 N4EHkVb2I1l9se/OCH6NYA344z1nE07PrSWI5fcs4W9/BV1vmFsaxFfuJdbCSlrdDQMwhC51C5n
 roHAZh8e4TfoavTfCVllg7Q/jQJuEUKpewRyWP6dhTzs/WeQodW3n6L081jjpRygZk4fgGNcBiD
 EoCSkf0wlnzV29Gvf5xnIJO1KMjoj12k6nIIs4N1h3dDFov5ezZr88oyyrXoulIWNsSZnZjhi6o
 HKiPu/fXKO3P+8TX82zQEciB+qpZHo5hcKA3gJHOmYTzri8MyiOvzwvcaH3ejXbi/86bV78xAmA
 dSrilUlmDtwC4AwLJ5CN66s2RPqn85O8451S8aoSKnlmwFUN1Tw7X1qWcYLn/iKCeYNpdNEaYQn
 IkaH5IROM4yeXip+cjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_230854_021824_D19363AC 
X-CRM114-Status: GOOD (  16.63  )
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

T24gVHVlLCBKdW4gOSwgMjAyNiBhdCAxMToyOeKAr0FNIFN1YnJhaG1hbnlhIExpbmdhcHBhCjxz
dWJyYWhtYW55YS5saW5nYXBwYUBvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPgpNaXNzaW5nIGNv
bW1pdCBtZXNzYWdlCgo+IFNpZ25lZC1vZmYtYnk6IFN1YnJhaG1hbnlhIExpbmdhcHBhIDxzdWJy
YWhtYW55YS5saW5nYXBwYUBvc3MucXVhbGNvbW0uY29tPgo+IC0tLQo+ICBpbmNsdWRlL3NiaV91
dGlscy9tYWlsYm94L3JwbWlfbXNncHJvdC5oIHwgMTkgKysrKysrKysrKwo+ICBsaWIvdXRpbHMv
bXB4eS9LY29uZmlnICAgICAgICAgICAgICAgICAgIHwgIDQgKysrCj4gIGxpYi91dGlscy9tcHh5
L2ZkdF9tcHh5X3JwbWlfbG9nZ2luZy5jICAgfCA0NCArKysrKysrKysrKysrKysrKysrKysrKysK
PiAgbGliL3V0aWxzL21weHkvb2JqZWN0cy5tayAgICAgICAgICAgICAgICB8ICAzICsrCj4gIHBs
YXRmb3JtL2dlbmVyaWMvY29uZmlncy9kZWZjb25maWcgICAgICAgfCAgMSArCj4gIDUgZmlsZXMg
Y2hhbmdlZCwgNzEgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgbGliL3V0aWxz
L21weHkvZmR0X21weHlfcnBtaV9sb2dnaW5nLmMKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3Ni
aV91dGlscy9tYWlsYm94L3JwbWlfbXNncHJvdC5oIGIvaW5jbHVkZS9zYmlfdXRpbHMvbWFpbGJv
eC9ycG1pX21zZ3Byb3QuaAo+IGluZGV4IDRmZWM2NDAyLi5iMDM0YjliNyAxMDA2NDQKPiAtLS0g
YS9pbmNsdWRlL3NiaV91dGlscy9tYWlsYm94L3JwbWlfbXNncHJvdC5oCj4gKysrIGIvaW5jbHVk
ZS9zYmlfdXRpbHMvbWFpbGJveC9ycG1pX21zZ3Byb3QuaAo+IEBAIC0yMjEsNiArMjIxLDcgQEAg
ZW51bSBycG1pX3NlcnZpY2Vncm91cF9pZCB7Cj4gICAgICAgICBSUE1JX1NSVkdSUF9ERVZJQ0Vf
UE9XRVIgPSAweDAwMDksCj4gICAgICAgICBSUE1JX1NSVkdSUF9QRVJGT1JNQU5DRSA9IDB4MDAw
MEEsCj4gICAgICAgICBSUE1JX1NSVkdSUF9NQU5BR0VNRU5UX01PREUgPSAweDAwMEIsCj4gKyAg
ICAgICBSUE1JX1NSVkdSUF9MT0dHSU5HID0gMHgwMDBFLAo+ICAgICAgICAgUlBNSV9TUlZHUlBf
SURfTUFYX0NPVU5ULAo+Cj4gICAgICAgICAvKiBSZXNlcnZlZCByYW5nZSBmb3Igc2VydmljZSBn
cm91cHMgKi8KPiBAQCAtMTAzMiw0ICsxMDMzLDIyIEBAIHN0cnVjdCBycG1pX3Jhc19zeW5jX2Vy
cl9yZXNwIHsKPiAgICAgICAgIHUzMiBwZW5kaW5nX3ZlY3NbTUFYX1BFTkRfVkVDU107Cj4gIH07
Cj4KPiArLyoqIFJQTUkgTE9HR0lORyBTZXJ2aWNlR3JvdXAgU2VydmljZSBJRHMgKi8KPiArZW51
bSBycG1pX2xvZ2dpbmdfc2VydmljZV9pZCB7Cj4gKyAgICAgICBSUE1JX0xPR0dJTkdfU1JWX0VO
QUJMRV9OT1RJRklDQVRJT04gPSAweDAxLAo+ICsgICAgICAgUlBNSV9MT0dHSU5HX1NSVl9TRVRf
Q09ORklHID0gMHgwMiwKClJQTUkgc3BlYyBtZW50aW9ucyB0aGlzIHNlcnZpY2UgYXMgIkxPR19E
QVRBIi4gVGhlIHVzZWQgbmFtZSBoZXJlIHNob3VsZApub3QgY29tcGxldGVseSBkaWZmZXIgZnJv
bSB3aGF0IHNwZWMgdXNlcyBhcyB0aGUgbmFtZSBvZiB0aGUgc2VydmljZS4KCgo+ICsgICAgICAg
UlBNSV9MT0dHSU5HX1NSVl9NQVhfQ09VTlQsCj4gK307Cj4gKwo+ICtzdHJ1Y3QgcnBtaV9sb2dn
aW5nX3NldF9jb25maWdfcmVxIHsKCldydCB0byB0aGUgbmFtZSBvZiB0aGUgc2VydmljZSB0aGVz
ZSBzdHJ1Y3R1cmVzJyBuYW1lcwpzaG91bGQgYWxzbyBjaGFuZ2UuCgo+ICsgICAgICAgdTMyIHR5
cGU7Cj4gKyAgICAgICB1MzIgbGVuOwo+ICsjZGVmaW5lIE1BWF9MT0dHSU5HX0RMRU4gICgoUlBN
SV9NU0dfREFUQV9TSVpFKFJQTUlfU0xPVF9TSVpFX01JTikgLSAoc2l6ZW9mKHUzMikgKiAyKSkg
LyBzaXplb2YodTMyKSkKPiArICAgICAgIHUzMiBkYXRhW01BWF9MT0dHSU5HX0RMRU5dOwo+ICt9
Owo+ICsKPiArc3RydWN0IHJwbWlfbG9nZ2luZ19zZXRfY29uZmlnX3Jlc3Agewo+ICsgICAgICAg
czMyIHN0YXR1czsKPiArfTsKPiArCj4gICNlbmRpZiAvKiAhX19SUE1JX01TR1BST1RfSF9fICov
CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
