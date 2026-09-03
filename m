Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46AC5C61DD3
	for <opensbi@archiver.kernel.org>; Thu,  3 Sep 2026 21:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sRjynsfjPgn3r22ygNVHl42cv+34ViIWfUGC/pXqG+w=; b=yFw/MCY9X3Wk98
	rKoctmQUtIG0LQMJfQSKkCBtXg/lHarPs6KEylRJU6udyA9W2TdpHRmQUeI0lbxWJF0xsaX/0IKMA
	PiUwlZc8mJa9piwWmlTxAu6W+eH0gVTRpPlvEGDIAvsQRscN9Qq2nXkshdvM7TS7tOpSvqftIm7Zp
	ooH+F8bQHctzsGnIcAbNySlbLozzScHtP//0f7rW6dkyL6fiQjd/VRNcqa7+eq/S/NryPd2B200lp
	9TvQ38Pf8Hdeh42w86pnjZy6gLYicdFkwFao1IVX5JSZ4T90eC42hOCwcbNO0sYTen1sA4hHbvMyO
	RK97TR9LVv0HKKeK25Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2ErK-00000000cz9-2LNX;
	Thu, 03 Sep 2026 21:20:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2ErI-00000000cyh-3Efn
	for opensbi@lists.infradead.org;
	Thu, 03 Sep 2026 21:20:34 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683JhQcm1575934
	for <opensbi@lists.infradead.org>; Thu, 3 Sep 2026 21:20:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JWGLeNzfOXev+C94lvknZPo5KxMnUV7/cELOkKxUOoA=; b=Y1RpxrRiB650i7fk
	a4DMTU71p7MOD2tv1PWzHlq3A01M/LuMUA22T9kZyrPXsAuHRvZtDlsOMqPMrY6j
	cQ+OpETiQqc8dURGB8w8aOMdtvRDRJLiybm87+oggGJTslK+miSRdIFJWrq0NTHz
	eiRP5C7lPHm80SCXLnVQM/v5hHRgvQiD6tWGxgN9jIzkH97VXDf344ktu7AXIdd8
	/7aKmwXW7diSkfLNwK8MXJ/bksBjz/Fbr5Hy2Z70wfQOgFQpwlqg+Dlv80uWB/rq
	9xTDlyKTvZTIP9Tk3gpfyRrL3JroWBdfmICe660c7dj6fRwfkhYob/57If6OuASu
	Py6GFg==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf4ekkmsy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Thu, 03 Sep 2026 21:20:31 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-46a12cfc288so313153fac.2
        for <opensbi@lists.infradead.org>; Thu, 03 Sep 2026 14:20:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788470431; cv=none;
        d=google.com; s=arc-20260327;
        b=c57WHgqLrWOobqoHvlYc+kYd05CYSI7tKaoMO6AZRjT1K9uKck9jo0OaJpXoiFRr7V
         3rRTfn0FZnR4H+xu8kzZU8rFmqly0JTMpOUGG76KzC5He5lUf+xMKXoYWqPBE49LUTEp
         6ES9MKkVX4QGUSY8vLH/JRxj0JZu873tDe1PRAeLs/TvMBz+YQbwus0m+mX0vQcZPPcs
         23o7n9kntzT1EGLpEQMyxGIHW4AsQTmCCjkl0gtxVWjaN92mnhRHTDj5KxKsmlcmnCAA
         RAT5ECKJTpCvsVYafLsFgpQ8gVXka3ayPnFMuo8P4Xry8yI7Pd+W3vuozCr5eF90Vv3D
         E1Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JWGLeNzfOXev+C94lvknZPo5KxMnUV7/cELOkKxUOoA=;
        fh=4ewBQFYQm5N+QAVC2yDkcGgJqnoV8H9Ixi/6ZlMkFAE=;
        b=Tu72mMda+m30Mtsszms1nMesLsR/Pm1+m8w/OXuuB94w6U4Hh91LaB9QLp9iGSOkEG
         1G3TfJAgrIZJcVFp4huv06IACOPk4RuI6SFlZhNiCICHiQhmW71dLrnPKKtuGPD20uQN
         oq59E7HXKjd0FP+Z1lpacjlk/o9rqV7sC4hUKUReIgZ8ShI+viy0hSXBJAW+/jWU1bXK
         UG1TQAHyjqShx9wQkdv3OhdSyzQa44vr/xmSUF92oq2wQNv9qAeJ5TexmbU9A/QMXG7r
         u8eW1RH46q/sRCgISIOljg4VJrH0M0d0X8xS9u6CWBtPu0qCcUkMvUOKcPZNrVmNuXBL
         1Q2Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788470431; x=1789075231; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JWGLeNzfOXev+C94lvknZPo5KxMnUV7/cELOkKxUOoA=;
        b=Fti4/whvEKMbWUs4EDTnSgn28zjQpNZyWMGF+yMc0XeJvhaz6+e+i0XHjEGgXe+P2n
         MdYoKLFpHzgOgcB2HHif4+QJM6DRHkd17A8S2t0BhiKwuHUBTQtji6NMWXLDCvVGqKP6
         sF0WhW0lUPbJPkLLzxNVAB6dfAAdLVNnxQjL2JUmi5B0lGPpGOiBD4Q8UffW2C5qtghF
         YsPGyWd6phL2Z1vpOTeAGEhj69EYTa7S7eKw7QdI4Gzh9Cgldb/l1EvBIxyfTv6Fskoc
         nEnwV1V2hkMQdozwuHdYe5kch/lmN1544ti1bvnyoy2NeGyPKmvJGu5qFRM6uXdgyY5i
         yROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788470431; x=1789075231;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JWGLeNzfOXev+C94lvknZPo5KxMnUV7/cELOkKxUOoA=;
        b=PGTAI20EHL7MbEqdFuZ4ONPw+FueCqHZlFQBaCTRB189T623JAVhUWhXE1t80+RWpu
         7I1o+pGKu92/RJ2lJAQoFg1uQ/YPcrvx7wX6ukg4oWVA0Uf2eEAzrDrzN+mHr8/e2tMK
         Hk+zM4s7r3agEMwXOc0ZVldAdni6DtIV9ozu2NwTRN8s3Bhj2ymoGrP6skULoFxf842O
         4QOaHUQ5IsP0Wt16TVnYuUwSOZIzMLaDcjUbNboQXnCCZo5bMagdbQeY+YQAdsdDJGd0
         TWqtnJBtlOgiNbu4HLgW3hdNOHgtpJgxuSTZ3WeZvbalMDZqDci/+do6/dwsxGzwtyaf
         lTdQ==
X-Gm-Message-State: AFuF++knl5nNbJHR53ubWz7YVk6LTY5zVvqMeLko772Ptm+U1AXmSfC+
	q7qvSl/WkXshfn3D9tNgcJyWmrTNcac+nJFPTv0j7X62ocIlmPt+DX2LynjuLV+iyK3qFJVFzwj
	7nH9CiZK9XgiiiOCYBnVNbPvycHaJ28eX+hHy5iLMz0NyvUEiz8xh6DqztvUCBLakTJJPBb0Sqm
	NV5HoTxMOaFEeBYuS+tfwabSJ71vCuJthNVY31xgWs
X-Gm-Gg: AYBFou3XOplKueP4f55hg268OpLpfj8tXWA12PgPkwAkzgBun1ZK8lojXTK+Rcpw3uv
	xbzryUDAFGVOJvfw3odwCgQanZ/B2aONsMfTTj8V4GiEtGa7IGoranu8n/skype7FLq/gQAoK+w
	Oj3ihgMZGAQVpl3khtpzLC+rfgUEMu2dDQuSzxP1nPSi0+OTfotfvTQlhacg==
X-Received: by 2002:a05:6820:16a4:b0:6b1:b375:481 with SMTP id 006d021491bc7-6b6f7c75a86mr1496998eaf.0.1788470430735;
        Thu, 03 Sep 2026 14:20:30 -0700 (PDT)
X-Received: by 2002:a05:6820:16a4:b0:6b1:b375:481 with SMTP id
 006d021491bc7-6b6f7c75a86mr1496970eaf.0.1788470430380; Thu, 03 Sep 2026
 14:20:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260817090503.2104998-1-peter.lin@sifive.com> <20260817090503.2104998-5-peter.lin@sifive.com>
In-Reply-To: <20260817090503.2104998-5-peter.lin@sifive.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 14:20:19 -0700
X-Gm-Features: AcwNN1Xv48FaNFfopppjksaxnIquJ7k2G3a-a2Tp4hiNvcXBWmz_fqoRDYACctU
Message-ID: <CAAVgOk+44wf+nYUPAzb+-NOvaGc6M9C_cg75cn0-pDQUCi-cxA@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] lib: sbi_hart: lock mwid CSR for RoT immutability
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com, greentime.hu@sifive.com,
        anup@brainfault.org, scott@riscstar.com, conor@kernel.org,
        dave.patel@riscstar.com, raymond.mao@riscstar.com,
        robin.randhawa@sifive.com, samuel.holland@sifive.com, krzk@kernel.org
X-Proofpoint-ORIG-GUID: USVAPOFS5UqFiboGoiKlOovkHBTNEXLt
X-Proofpoint-GUID: USVAPOFS5UqFiboGoiKlOovkHBTNEXLt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE4NiBTYWx0ZWRfX2cYhAF7mKQ4n
 tXpfdBLh8nzLGI6bldYPk7A/YepbOuIPbliswHKGrzuNmyQk/700WtxFb7UkMawl5bIpSh4OS+a
 TukOIizIxFiYXy+mqfvmubgxZzZIFsI+nNjPTdYTREugAwa+raD/JhSmkbnmvfldFEHmuaf9woL
 9RvyNPCuFsi9LfpUlb10dF72C0aCYCB4yCksX5efacKGle3MyjSzqEnDcGYNSVif8Zwny6nWBMu
 zLRkzmEFSpcCKLug3eFyJ1lCRfR0vzh2JuQKnsu9hqYk/zveqA5KP1w5ldiUuTz++6b7hj2umvZ
 5ahaHT2F836eX34x6U6nb7v7ATBLGqJT8HVZOs6cpNCmBLj/0bgiyLOG0i+qnpxRZiA1IUMw0hV
 DXkuSlBJyzVb16nv+M2ejr5gLanFUhoR8xVYGBBZWCSQ1XE7LoX+K3j/4DVO1xho2O+i7lQ7WWS
 JNffZ/5yA0+r/JIQxcA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE4NiBTYWx0ZWRfX1Ozf7WpW7FLH
 X0KhrgB854HMnSBDQXttM+zoz9gc0fwIKctN6iNjbI6eXRzV5wHga8YN7V6nPY3IZOL2ewVyUO5
 tks1BVviqQDBONr1f9uOXmG2SURDKkk=
X-Authority-Analysis: v=2.4 cv=PKc/P/qC c=1 sm=1 tr=0 ts=6a99e49f cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8
 a=cwQEnzW-4i6HU328WOAA:9 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_06,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030186
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_142032_948895_7D1BD165 
X-CRM114-Status: GOOD (  18.90  )
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
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gTG9jayB0aGUgTS1tb2RlIFdvcmxkIElEICht
d2lkKSBDU1IgZHVyaW5nIGhhcnQgcmUtaW5pdGlhbGl6YXRpb24KPiB0byBlbmZvcmNlIGltbXV0
YWJpbGl0eSBvZiB0aGUgV0lEIGVzdGFibGlzaGVkIGJ5IHRoZSByb290LW9mLXRydXN0Lgo+Cj4g
T3BlblNCSSBkb2VzIG5vdCBhc3NpZ24gdGhlIFdJRCB2YWx1ZSBpdHNlbGY7IGl0IG9ubHkgc2V0
cyBNV0lEX0xPQ0sKPiB0byBmcmVlemUgdGhlIHZhbHVlIGVzdGFibGlzaGVkIGJ5IHByaW9yIFJv
VCBzdGFnZS4gVGhlIE1XSURfTE9DSyBiaXQKPiBhdCBYTEVOLTEgaXMgc3RpY2t5IGFuZCBtYWtl
cyB0aGUgQ1NSIHJlYWQtb25seSB1bnRpbCByZXNldCwgZW5mb3JjaW5nCj4gYSB0ZW1wb3JhbCBz
ZWN1cml0eSBib3VuZGFyeSBwZXIgdGhlIFJJU0MtViBXb3JsZHMgc3BlY2lmaWNhdGlvbi4KPgo+
IFNpZ25lZC1vZmYtYnk6IFl1LUNoaWVuIFBldGVyIExpbiA8cGV0ZXIubGluQHNpZml2ZS5jb20+
Cj4gLS0tCj4gIGxpYi9zYmkvc2JpX2hhcnQuYyB8IDcgKysrKysrKwo+ICAxIGZpbGUgY2hhbmdl
ZCwgNyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfaGFydC5jIGIv
bGliL3NiaS9zYmlfaGFydC5jCj4gaW5kZXggZjVmNDA2MmUuLjI5ODU2YzBmIDEwMDY0NAo+IC0t
LSBhL2xpYi9zYmkvc2JpX2hhcnQuYwo+ICsrKyBiL2xpYi9zYmkvc2JpX2hhcnQuYwo+IEBAIC03
MjQsNiArNzI0LDEzIEBAIGludCBzYmlfaGFydF9yZWluaXQoc3RydWN0IHNiaV9zY3JhdGNoICpz
Y3JhdGNoKQo+ICAgICAgICAgaWYgKHJjKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gcmM7Cj4K
PiArICAgICAgIC8qCj4gKyAgICAgICAgKiBBc3N1bWUgTVdJRCBpcyByZXN0b3JlZCBieSByb290
LW9mLXRydXN0IE0tbW9kZSBpbiBwcmV2aW91cwo+ICsgICAgICAgICogc3RhZ2UuIExvY2sgbXdp
ZCBzbyBSb1QtZGVmaW5lZCBXSUQgcmVtYWlucyBpbW11dGFibGUuCj4gKyAgICAgICAgKi8KPiAr
ICAgICAgIGlmIChzYmlfaGFydF9oYXNfZXh0ZW5zaW9uKHNjcmF0Y2gsIFNCSV9IQVJUX0VYVF9T
TVdJRCkpCj4gKyAgICAgICAgICAgICAgIGNzcl9zZXQoQ1NSX01XSUQsIE1XSURfTE9DSyk7Cj4g
Kwo+ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+IC0tCj4gMi40My43Cj4KClJldmlld2VkLWJ5
OiBQYXdhbmRlZXAgT3phIDxwYXdhbmRlZXAub3phQG9zcy5xdWFsY29tbS5jb20+CgotLSAKb3Bl
bnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
