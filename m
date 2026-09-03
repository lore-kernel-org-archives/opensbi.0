Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC52C624DE
	for <opensbi@archiver.kernel.org>; Thu,  3 Sep 2026 21:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+vOpRAsbqfeEv1y7iTj+G2tMgU+HI5NaVJMrVP59jVQ=; b=djoZELyvqldp5r
	B6KlUx/yRDSeLMNShGJqlilGK/6XjPsxFe6uaGy5b9ggJrGmB9N4oCx3q9DNcToc2GpvFekrZp7Ac
	LgM9yRBG4VZ9tdi3elTEImhfaTWp2R+BrT32m/UW2UWwJNSFK49eFhn8gD9oJNbzKq1HcJ2ZijWk3
	BxPVNRIkZkLGmmlvHfZagx8eBBWyTBVYYS9x/GFGn8MhW0dCQfHc3kRewD0cY5cKb2UrPR9C+LcL7
	WAt1JDwi3lnn0TQMY4xTXBsK88EyF6LyqZr9Hyzda0sdtVJWjJKNDGuf72VVuxRnjvXs+H2G+HLv9
	1keLCFPD4DGVI3DBCfGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2FT8-00000000gEq-2hc9;
	Thu, 03 Sep 2026 21:59:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2FT5-00000000gDP-2Ym5
	for opensbi@lists.infradead.org;
	Thu, 03 Sep 2026 21:59:37 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683Jgtju1692625
	for <opensbi@lists.infradead.org>; Thu, 3 Sep 2026 21:59:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9fNiohnv/cskd2vMFCSo4aLdol9UnA+4gLmsjLvAIus=; b=LXmr/HlKGIWzd7F8
	VE86XGP6l3v9cHmRKtut69p4g3reOHZNUDHhZ96gYpAqudvuArHEcfTKPqCTkXrH
	pRjV5ZrjahehutF8YS2hKSOHjoCQGOJUngM4jKbwLusSHEx3ixsO9w345RSYbN6Q
	T2GzDmG+Q4yTbhOJMGYrPIQTI5yYwTuh1saKYXcjRui5Dn7hN/65jlXHWgqkZPXK
	fuN419+z67506EhrWWRcLiv3HT++DGHXJjiGoLNTBweiWP4+qE+h1C8a4E8rU47y
	3w00ykSEr3w7KIOgwH8F5vkX8KIfXzdC23LT0MhwlPYi7T/OBXjiDN3cE+CRCp/Y
	W3QXpQ==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6p734eg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Thu, 03 Sep 2026 21:59:34 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-456ab1a7f2cso407180fac.3
        for <opensbi@lists.infradead.org>; Thu, 03 Sep 2026 14:59:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788472773; cv=none;
        d=google.com; s=arc-20260327;
        b=QpWZRn+foI+7AtzzxnOsFhVhiSaZY62PG5CI5R+2dvqi/UGt5AKTOFUqS6zejArmRO
         jzqkvblva5bc041++mUDPleY46wsfQz2SKpYxfV7hFnC9L2v2eaaYKLRSy1Cpr6ezUAW
         2YsBOXdKdpkxjj7gTCKIqPLIOucoc2tys9VUHXDH2a/TGJKhk9OsuxEgzgf8thGkCZgm
         rKmqOLhpdGxjlNOQTkv2iLVZ/V36x7yirNKw3PY2RDXgtOhBxxN9DJqGjOqb9x/kOIba
         Pm9C+tTxIm5RAqeZJ1XGdh19z8ZVOri4OETjJZGCmpDAPWPsfm0nRUQIquWRrRFAHWUM
         6zSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9fNiohnv/cskd2vMFCSo4aLdol9UnA+4gLmsjLvAIus=;
        fh=4ewBQFYQm5N+QAVC2yDkcGgJqnoV8H9Ixi/6ZlMkFAE=;
        b=hB5Fq6cSPCIf12YiSWw6T2Zo2CJwyLCoL0aRAtLunJYWh8GyXmL+0XsD59fp09wV5J
         cHuDB8rd7cUqlPZQJ5MNwlvwcC96pcu61SXBrjxvQXqs6cEpQO747fYY5CNqXYfc1M3L
         kPaezKneADOEl6Ph89mmmMm/iTrHlcZwvdUkNIXTMwa/+hb3ZHq3J8EpZY8x/LnQbUuu
         XPNJ4WYO9/9Glk7r+YsDzgVfeD9C60L3iwDm67Ul+Chuk3EpqlHrkJAF3RBx1cziKGNh
         VNoxYhDWXSmcG2smiBw7d3EyZeaWDE3heX+P5D3wKIHi6F/FKMIvLGIWm3O8ixL9MV8n
         cE5Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788472773; x=1789077573; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9fNiohnv/cskd2vMFCSo4aLdol9UnA+4gLmsjLvAIus=;
        b=bjuMvm3s/pqh4WvbkmT1TF3Un/SMiXWR8bsZapc4jMFVPa3nLkR8Pp5KC/J+MDKDbE
         oApHnYSyY48oKp0p0i1t1z4Q/YFDqujh5zDJsTaEBUTcQ+y5ftp8IYEczYoQJWElrdKP
         oq9Uk+dB6k3uwN4eUIe9rqrYviVCssV7mbhK2p0JoA7i4YK3HfUcIvix18V+aBP4Ygnk
         ROIXihsy3YVOluUpNnNKNaaOngObmm0S0V/SDq3LPakAmP/aDBbj1xXPIaXHclVbm+k7
         91T6pCwc4HCcrUbdGgQd+XCh6M+Lr+hvJJZbvLqrYVMy7wEzJ7bRsvauANqliAYndo7N
         g4+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788472773; x=1789077573;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9fNiohnv/cskd2vMFCSo4aLdol9UnA+4gLmsjLvAIus=;
        b=PasB3HFhfEN5gyPojk204F+0yWMMssWR6BqDkLAdFsZQOzv5J+HvC5JltzkUIDObua
         8xpNEPQY+U1S+15qtT7Da+qyWi89K3RnKFiDtDxksCeGdHoH08xtWVqm4vUSk3xb74D5
         lKyFBK5Bjl+NroVxc2yBsedkc+uKsYEpnEiuqQ9uuInBLcmwvlWoE1evQQhmoiOUf0oX
         JS0ulsYjaeNVibiP10+kXAiPChVgWM6ajMcBfqGDEbfoSSFqwXmCGZ9EBytB9070yZTx
         6gYIaPZRgL/rkfstxNPDntEfv2GCLRJJc9DVG7QgyaycfYT/+AVTLTCBp+GWMEiRBq5r
         /CJg==
X-Gm-Message-State: AFuF++m7g5d3aEXap7CDxHh96Cy3ZDG27VgkgIIlNcFmmr5Zd7Jk02Hw
	uoJVg+Cs/jcrulGH3g2k18uFoeO7tJuuZ2nCEBaYQW/mNhnQ1hWm/RNIDXENO42H8uFcP6uDnzx
	fpXZW+BUdPJUZCokK9T7IDeU9GVOs80PLPtR7nQlIIeQ5bczUfRImsHpfJq489+k098so6FTDxE
	TBJfAw/vIPd5ErZBP77EOdju2FyADhdWL66X0QJVRI
X-Gm-Gg: AYBFou0sTsCo/6cn3SuxW8D60Ma7noILo67lomRLeHjZ2M/ypecsFYdP8SFmUDLst4R
	27ybHXUR8hrWAuXiM0fwyLaPsUk8RYlpgwIH0OzANqnySmrqNZ5cMu6qHR66INVqKRcSGgnYLaU
	jqYrgR8veukA/gnJVV/nN8VxvVdJ3qfmnxK8fhrJuqqc5isNUysyxvGMa0fg==
X-Received: by 2002:a05:6870:a54b:b0:448:3eb2:8c8c with SMTP id 586e51a60fabf-475516aa4bemr1893020fac.6.1788472773533;
        Thu, 03 Sep 2026 14:59:33 -0700 (PDT)
X-Received: by 2002:a05:6870:a54b:b0:448:3eb2:8c8c with SMTP id
 586e51a60fabf-475516aa4bemr1892996fac.6.1788472773170; Thu, 03 Sep 2026
 14:59:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260817090503.2104998-1-peter.lin@sifive.com> <20260817090503.2104998-7-peter.lin@sifive.com>
In-Reply-To: <20260817090503.2104998-7-peter.lin@sifive.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 14:59:21 -0700
X-Gm-Features: AcwNN1WYCd7QcnYFXO-HQcU-HCmicUl8R6Eut94iwR5St240NvhSM-c8ZkhPK_k
Message-ID: <CAAVgOkLZHQOgOjJLkrnGsM45uFoH9XrJpmRDyQmvK2SsCrkqJA@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] lib: sbi_domain_context: add slwid to per-domain
 S-mode context
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com, greentime.hu@sifive.com,
        anup@brainfault.org, scott@riscstar.com, conor@kernel.org,
        dave.patel@riscstar.com, raymond.mao@riscstar.com,
        robin.randhawa@sifive.com, samuel.holland@sifive.com, krzk@kernel.org
X-Proofpoint-GUID: cK27hjYqRbU5pEdxRVlePNd4YekF1o9-
X-Proofpoint-ORIG-GUID: cK27hjYqRbU5pEdxRVlePNd4YekF1o9-
X-Authority-Analysis: v=2.4 cv=OZyoyBTY c=1 sm=1 tr=0 ts=6a99edc6 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8
 a=Jt4guZC-A5abtLck3aoA:9 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22
 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE5MiBTYWx0ZWRfX+oHnRMhYUZN0
 1VuYqf8GYepPscVA2CFss1zeQR5S5QPgcvTHRaJVKzOztuaGM6d/AHEhFUo7CZsc3GxAQRCATv/
 iJSfexgbkkPvjgkewBYAqj5nJNPJvhI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE5MiBTYWx0ZWRfX6svNo27QxLgz
 z4bhRDZ0Ap/r+LHo9XkBoYs2fFwndZPMSeOv9k8g3JwK5tF2JeFVKrfQutkPilLWWaTFQeFT30A
 Bq5ndO50bjGszm3wfmq5s0km2APvoAnGOWEgCkS8/gi5ro6K3YPM2cKzqkbZBXl6G40PDipFG4O
 2eZst6o7DU+GRK7H3aAzf223gGYj9qGbAxIkpo07Sq5RZx0wxH5WaCQ3oGcNLlbR9/GGSIcdHGt
 hZyncrEyKjG2mQUzK/Tmga+aX/rWDEFroJINwf6VqUF1o8IKLJG/XJp1sFTa5MUkbZ1hugpz92J
 xBTZdaf9pamBxXkwOpQtYZ9oEHMBp49GxSizUAM+q4OyQhxWul96kBOvqcTcmKzPCocsOxf3nyW
 my9xSF1/SVnU+XYWNOPIFBoXfSlF86BP35K9mr7v6wkbgMDOGgRsUSnkdxZ/6Xp+eQ7IOl7w8Jy
 waXCXAtHDGnGxXT2I1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_06,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_145935_762988_4AC7D364 
X-CRM114-Status: GOOD (  19.51  )
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
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gc2x3aWQgaXMgdGhlIFMtbW9kZSBDU1IgdGhh
dCBjb250cm9scyBVLW1vZGUncyBXb3JsZCBJRC4gU2luY2UKPiBlYWNoIGRvbWFpbiBtYXkgcnVu
IGRpZmZlcmVudCBVLW1vZGUgd29ya2xvYWRzIHdpdGggZGlmZmVyZW50Cj4gV0lEIGlzb2xhdGlv
biByZXF1aXJlbWVudHMsIHNsd2lkIG11c3QgYmUgcGFydCBvZiB0aGUgcGVyLWRvbWFpbgo+IFMt
bW9kZSBjb250ZXh0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogWXUtQ2hpZW4gUGV0ZXIgTGluIDxwZXRl
ci5saW5Ac2lmaXZlLmNvbT4KPiAtLS0KPiAgbGliL3NiaS9zYmlfZG9tYWluX2NvbnRleHQuYyB8
IDEzICsrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKPgo+
IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9kb21haW5fY29udGV4dC5jIGIvbGliL3NiaS9zYmlf
ZG9tYWluX2NvbnRleHQuYwo+IGluZGV4IDA4NjFkNTQxLi4wYjQ1YzBmZCAxMDA2NDQKPiAtLS0g
YS9saWIvc2JpL3NiaV9kb21haW5fY29udGV4dC5jCj4gKysrIGIvbGliL3NiaS9zYmlfZG9tYWlu
X2NvbnRleHQuYwo+IEBAIC01MCw2ICs1MCw4IEBAIHN0cnVjdCBoYXJ0X2NvbnRleHQgewo+ICAg
ICAgICAgdW5zaWduZWQgbG9uZyBzZW52Y2ZnOwo+ICAgICAgICAgLyoqIFN1cGVydmlzb3IgcmVz
b3VyY2UgbWFuYWdlbWVudCBjb25maWd1cmF0aW9uIHJlZ2lzdGVyICovCj4gICAgICAgICB1bnNp
Z25lZCBsb25nIHNybWNmZzsKPiArICAgICAgIC8qKiBTdXBlcnZpc29yIGxvd2VyLXByaXZpbGVn
ZSBtb2RlIFdvcmxkIElEIHJlZ2lzdGVyICovCj4gKyAgICAgICB1bnNpZ25lZCBsb25nIHNsd2lk
Owo+Cj4gICAgICAgICAvKiogRmxvYXQgY29udGV4dCBzdGF0ZSAqLwo+ICAgICAgICAgc3RydWN0
IHNiaV9mcF9jb250ZXh0IGZwX2N0eDsKPiBAQCAtMTQ1LDYgKzE0NywxNyBAQCBzdGF0aWMgaW50
IHN3aXRjaF90b19uZXh0X2RvbWFpbl9jb250ZXh0KHN0cnVjdCBoYXJ0X2NvbnRleHQgKmN0eCwK
PiAgICAgICAgICAgICAgICAgY3R4LT5zZW52Y2ZnICAgID0gY3NyX3N3YXAoQ1NSX1NFTlZDRkcs
IGRvbV9jdHgtPnNlbnZjZmcpOwo+ICAgICAgICAgaWYgKHNiaV9oYXJ0X2hhc19leHRlbnNpb24o
c2NyYXRjaCwgU0JJX0hBUlRfRVhUX1NTUU9TSUQpKQo+ICAgICAgICAgICAgICAgICBjdHgtPnNy
bWNmZyAgICAgPSBjc3Jfc3dhcChDU1JfU1JNQ0ZHLCBkb21fY3R4LT5zcm1jZmcpOwo+ICsgICAg
ICAgaWYgKHNiaV9oYXJ0X2hhc19leHRlbnNpb24oc2NyYXRjaCwgU0JJX0hBUlRfRVhUX1NTV0lE
KSkgewo+ICsgICAgICAgICAgICAgICAvKgo+ICsgICAgICAgICAgICAgICAgKiBUZW1wb3Jhcmls
eSBlbmFibGUgU3N3aWQgc28gc2x3aWQgaXMgYWNjZXNzaWJsZSBmb3IKPiArICAgICAgICAgICAg
ICAgICogc3dhcC4gVGhlIHRhcmdldCBkb21haW4ncyBtd2lkZGVsZWcgaXMgcmVzdG9yZWQgYnkK
PiArICAgICAgICAgICAgICAgICogc2JpX2hhcnRfcHJvdGVjdGlvbl9yZWNvbmZpZ3VyZSgpIGJl
bG93Lgo+ICsgICAgICAgICAgICAgICAgKi8KPiArICAgICAgICAgICAgICAgY3NyX3dyaXRlKENT
Ul9NV0lEREVMRUcsIH4wVUwpOwo+ICsgICAgICAgICAgICAgICBpZiAoY3NyX3JlYWQoQ1NSX01X
SURERUxFRykpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgY3R4LT5zbHdpZCA9IGNzcl9zd2Fw
KENTUl9TTFdJRCwgZG9tX2N0eC0+c2x3aWQpOwo+ICsgICAgICAgICAgICAgICBjc3Jfd3JpdGUo
Q1NSX01XSURERUxFRywgMCk7Cj4gKyAgICAgICB9Cj4KPiAgICAgICAgIC8qIEVhZ2VyIGNvbnRl
eHQgc3dpdGNoIGZvciBmbG9hdCAqLwo+ICAgICAgICAgaWYgKHNiaV9oYXJ0X2hhc19leHRlbnNp
b24oc2NyYXRjaCwgU0JJX0hBUlRfRVhUX0YpIHx8Cj4gLS0KPiAyLjQzLjcKPgoKUmV2aWV3ZWQt
Ynk6IFBhd2FuZGVlcCBPemEgPHBhd2FuZGVlcC5vemFAb3NzLnF1YWxjb21tLmNvbT4KCi0tIApv
cGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
