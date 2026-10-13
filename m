Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD5FCC6B12
	for <opensbi@archiver.kernel.org>; Tue, 13 Oct 2026 19:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N1QFj/080Y5mXfajRl1/vr4+PyoqtbYd4Dl4rQb+5vg=; b=lYWT83kH8ArBJr
	WcqDWS+qNM36v7Uzojowp0z1FFADFMcnjL0H6fPhYhy0yNsBxbzusWphNmXcUjgqpGf7TcD3+6huz
	/ju5tTfOxYlKw/xbd+DL5bY7hZV7eEqaZ3X8BWF586XBo+hgPelRa3euw7c8dQjiJR9BcNnV8OQWV
	g7GUwfry79BMpJO5tLcjwc2Q37Ag+tVl5sDpBeISV0oox3rGKWWzyxjci1Dx4LFeZsbcWDSsj18Td
	8FF7IFuuWsa8h6ELnjnPtsqw+swzLgQhdEVSqLFAIM3DG0+EqfLyjmcL1uVcofYg3MC7daJb42fST
	MIGlocZ+Czb89RMcoFUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGiSH-0000000DwbD-0EM2;
	Tue, 13 Oct 2026 19:46:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGiSE-0000000Dwa1-2Zuz
	for opensbi@lists.infradead.org;
	Tue, 13 Oct 2026 19:46:31 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE43UG900322
	for <opensbi@lists.infradead.org>; Tue, 13 Oct 2026 19:46:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B+iOJMbIvUsiwt+G2GyH5V5ni1rKKgkCEA4vX5rXjkE=; b=ahc7NgF4yf67wtXy
	q+Y2ZXRK+dn6kJfKa90LSC5ZBlQ22hC1Topu11O3XZMbN41+7kwYXiWPL7kpf5vq
	6yzcj2YQPm3BZJVGi7jfRsQf5l3frSTxY+LgSl1mAcKazgJs36mhB6KzfMTTFcaQ
	lURx38x9cgly4khNgjmadG4eXCkoM/lFp9RHiVPHEckH72YzycIE2TK2CYHnaIhp
	7H/EKlCk31jd0lh7LCdwVZ1W6HUIpcu7X4MaEh1M2NZeanoOG/Am7Oec7lBI+0Ku
	VGtIkyb8k9oLBuqspY1HR8gyYoOi5G7csBbk+DdOnf9JmKJeNfuTT5Awb8U4Oxbk
	0GsS8A==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9g7uk994-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 13 Oct 2026 19:46:29 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-4566537e644so4757457fac.0
        for <opensbi@lists.infradead.org>; Tue, 13 Oct 2026 12:46:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791920789; cv=none;
        d=google.com; s=arc-20260327;
        b=bDDWXls/5QLEpx1ev4NSKnw+7zKsvUiEhU23u3Xk29qDAZhLc13AJBTmdU1FtMdl0B
         u/qHR2wEgDAOO87OAEokOvEYo/e8tBrCeuskQky6h69O5AV5A3pao+peT7kH2Lev3ozk
         gJPIfecFqyuN9TZUuSObjidlfzoIC4tntxQwpMAaPSzeU/x9XtwlPeXHdZIN7Kbbtcrs
         CK88SJa1OIKPi6LtQRlri3Y3i8GOirX40LWu9jVOweUn3EpVMpS/qL4wPvV1oSEo07Xc
         OLwG1ybpHBNN6chm3x04L6mX3d40AwZ18e8APxo2G+eV9qS2WosGMBc+qDI8xz5xlNO2
         ifdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B+iOJMbIvUsiwt+G2GyH5V5ni1rKKgkCEA4vX5rXjkE=;
        fh=bMOdRss5Oe/e50DCGQY2BFY5PIomFisu+jcH2B7yhnA=;
        b=F10TKI5Bb0p9fB9h1mQqfJL2QdNky+iM4Y6ZitZTg1jjz+tqxfhQKPwKiTvUMh/XPb
         IsRyUq4zLvxZRA6RTyo7U58IHQ/RkMBT/MuFJrx5L5aoEGPC0P/X5KhOGWl54s3QX8xI
         MPdQgNyLh1XxIT02iL1TJcIgQDGFpmJ3tUIM9Ml2lgiA/4H0oqgO2zkfFZAuD53mM56G
         GybzUAYgxgCZSrrU4Ef1VdWO4H2zomTqRyCr16gCX/Te8/+7r+Pdar0pxQMkYEi0USRc
         9IsdXwwVYoXym8yKkjY4FmH7X1+MgaULrt2zT5WtAy6zTDJ+G44W0U1T8M9TQqcW4/hO
         bWcA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791920789; x=1792525589; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B+iOJMbIvUsiwt+G2GyH5V5ni1rKKgkCEA4vX5rXjkE=;
        b=V5H5b12jk0nT1R78qFNYbxzaviRLP1Z8dTb23GE5TI2lvJNOooPLskfb8q7m1dP2ct
         XmpEPHxPwiKrpzcTnqKIbivjstuBudChYht6JP01qpPbq9gP2K+RzL2rtFZdyfyF68LH
         zke6wPRwF0YrFr4zIeLJrbUhiPmDfP1/PZl67rgaVFpKSiP7iz8yVqCeg4JM6v1OUkw6
         dic6bwCOXv4R8cHrAxVVriT59dDBoK+qH0OEC3PNNgSTHrRNejQ9XFBkQiiPBSp4Csj/
         jL1/q2uB7jnCaNgEujipS7UfBkBlFDcralsNNbOveU43jHwX7ENgMcIj/acAGh1oxNp8
         pxWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791920789; x=1792525589;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B+iOJMbIvUsiwt+G2GyH5V5ni1rKKgkCEA4vX5rXjkE=;
        b=0W92/YIxOzkv9KxNzatqfhqA+c+YaVh5c07vsOUNy69z9XzeHexdwnt/KnlrQelAmk
         6xsyqcjtx9PX8BbkedEcty6lGHNvdf8mXfeBBR9gwzDOu3A2inX54D2wmOpuZ5ySzXWZ
         jO1KNt87cBj3gEILvDuMoJd7vw7w3uWTXGYWOipCJ2Z2oPMpHpkSRPviCvaTo9smWOXr
         csjREDPrsNtPGe+UpsIj0xV4M8QonDQOeyk5HLwEfumG4zpYhEYkpU3k9nRrw0GDG4AS
         VXjpXkKQ2U9y8qtxf1u5b1Gl+EgryuM+TqTTx3NNNPHa55oW99mzUjm13Y7qHXr9/9hH
         ieCA==
X-Forwarded-Encrypted: i=1; AKwUvBzGqmoKMso1uB9pTyt19N27S/yOVLOPYiBxGQyx64YadUywXANT2V2OEAE3MsPEJMCdBB7xRnCS@lists.infradead.org
X-Gm-Message-State: AFq9FYJ/Q4mdNSg3yKRbfjAv1Q7J8CvbOL4UDxgmd2maufSKgJIj0yXn
	WN7n3WtCgbrOIdhmX94iHD2wPrch4tKhZSY1bmh1go8RmfA6CbJ9mF02Hj+AOiEJicuiCL4Be/3
	reijQ/4zc5T5mmMv49kDP97KXnEwh83nz+aBmDUI/FtO2+clRRJH8xUE+tFAbI3pNrJ1852koA3
	NwzJcBrRTczGTvXk+UWagLPI7A7frNAzNtUglgO3alQjxVleEmmlY=
X-Gm-Gg: AYBFou31yzSCFB/Mh7f03yfCQfY9SIyhxTW//B8OIpHhXPcHV1GTHTQZluAspBgDQTb
	yS4yYHuMKxGjEKKijyyhX1SUwlC3hRN26bLEC4uaNYc3MGD+l9G629En58LR/9Xk4DBlO7Pbvs3
	rpWySOZOMrZwQK9wdtoy/EX3LomDQI/YiY57TruvQC6KHXo2B5I5/Nuvxn7gM=
X-Received: by 2002:a05:6871:6908:b0:475:a1ec:9623 with SMTP id 586e51a60fabf-4a2a8a5e3c8mr11491449fac.37.1791920789138;
        Tue, 13 Oct 2026 12:46:29 -0700 (PDT)
X-Received: by 2002:a05:6871:6908:b0:475:a1ec:9623 with SMTP id
 586e51a60fabf-4a2a8a5e3c8mr11491430fac.37.1791920788751; Tue, 13 Oct 2026
 12:46:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260923032359.4041876-1-anup.patel@oss.qualcomm.com> <20260923032359.4041876-5-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260923032359.4041876-5-anup.patel@oss.qualcomm.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:46:17 -0700
X-Gm-Features: AclHuK-fjgeRlLjXhUxHddx4MR8_oBVyBug-IGWTnk-dFsCC7Gd5YsE2FuW6UQ4
Message-ID: <CAAVgOkL-wLgYLgNo39mbtOLG1Dk_PC-Dxhh5avruYFgVc9nr7g@mail.gmail.com>
Subject: Re: [PATCH 04/11] lib: sbi_domain: Introduce sbi_domain_find_by_name()
 function
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA3OCBTYWx0ZWRfX3/UB7Uw0ZRlK
 OcuAn9iy/D3QvTYg9cZO50idsmj967o4FvEFKYfqJ1L4jcPuFKQbbm9rSpKz673P5dR4aEYylTa
 B5DY7eKE+ow+B95v5BC/X881j2Lhyix52lVDVcIPEnlIJ9JoYuiXbIxo5K6wXKixfxp+0afFYcS
 tHz2ghPggL4XhSU5pkFoCUUU+5Opd2/Yl9ZvtX+RFFFOIKLoMbzzK2QMYpZildCrVqMMR9q8xui
 X0hw9MMmjIyqY2zoiflQnLyaEJ7659MFot3jkGRd0bLpz5zbE9iMSLZlPHZNPuo8G2KVGbFMoHF
 W2nrKq6+hrvpdZeJIWBqdNSl7SqreHttgcm+5TNqzeFL456isxW/DPGY4NKa8jmhmqH3hwvHuzF
 /KJYA0th/1KP3Ug+KI35rQ9LpN0WIsbwlErBlNOqXt3LMZl2Xml6cy+uh78KxskDrnokUQOgmAa
 28IJo39KX8zrIN84AnQ==
X-Authority-Analysis: v=2.4 cv=Z495j3RA c=1 sm=1 tr=0 ts=6ace8a96 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=woWvkxNpCqgkYvFbcW8A:9 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: s2GHaovkAejC6HlOfZKZYY-x19pqAoGr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA3OCBTYWx0ZWRfX/Ecd9F+hwfMF
 fKo2Ib4YPGNYnFuJ/4BSiujroSJf2CDuIgXpT5SXt5l61kBiL7VC+onMZ27qy2gUAuvoPah2UbR
 TEwLkVHnyE9oZKCHnhQctOV/IBKyaKY=
X-Proofpoint-GUID: s2GHaovkAejC6HlOfZKZYY-x19pqAoGr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_124630_659615_F2E95480 
X-CRM114-Status: GOOD (  22.38  )
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

T24gVHVlLCBTZXAgMjIsIDIwMjYgYXQgODoyNOKAr1BNIEFudXAgUGF0ZWwgPGFudXAucGF0ZWxA
b3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBBZGQgc2JpX2RvbWFpbl9maW5kX2J5X25hbWUo
KSB0byBhbGxvdyBkcml2ZXIgbG9jYXRlIGRvbWFpbiBpbnN0YW5jZQo+IHVzaW5nIGRvbWFpbiBu
YW1lLiBUaGlzIGFsc28gbWVhbnMgZG9tYWluIG5hbWVzIG11c3QgYmUgdW5pcXVlLgo+Cj4gU2ln
bmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YW51cC5wYXRlbEBvc3MucXVhbGNvbW0uY29tPgo+IC0t
LQo+ICBpbmNsdWRlL3NiaS9zYmlfZG9tYWluLmggfCAgNyArKysrKysrCj4gIGxpYi9zYmkvc2Jp
X2RvbWFpbi5jICAgICB8IDE5ICsrKysrKysrKysrKysrKysrKy0KPiAgMiBmaWxlcyBjaGFuZ2Vk
LCAyNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9zYmkvc2JpX2RvbWFpbi5oIGIvaW5jbHVkZS9zYmkvc2JpX2RvbWFpbi5oCj4gaW5kZXggMWY3
NzNlNDEuLjM5NGU3ZGRmIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvc2JpL3NiaV9kb21haW4uaAo+
ICsrKyBiL2luY2x1ZGUvc2JpL3NiaV9kb21haW4uaAo+IEBAIC0zMjMsNiArMzIzLDEzIEBAIGJv
b2wgc2JpX2RvbWFpbl9jaGVja19hZGRyX3JhbmdlKGNvbnN0IHN0cnVjdCBzYmlfZG9tYWluICpk
b20sCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBtb2Rl
LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgYWNjZXNz
X2ZsYWdzKTsKPgo+ICsvKioKPiArICogRmluZCBhIGRvbWFpbiBieSBuYW1lCj4gKyAqIEBwYXJh
bSBuYW1lIE5hbWUgb2YgdGhlIGRvbWFpbgo+ICsgKiBAcmV0dXJuIHBvaW50ZXIgdG8gdGhlIGRv
bWFpbiBvciBOVUxMIHVwb24gZmFpbHVyZQo+ICsgKi8KPiArc3RydWN0IHNiaV9kb21haW4gKnNi
aV9kb21haW5fZmluZF9ieV9uYW1lKGNvbnN0IGNoYXIgKm5hbWUpOwo+ICsKPiAgLyoqIER1bXAg
ZG9tYWluIGRldGFpbHMgb24gdGhlIGNvbnNvbGUgKi8KPiAgdm9pZCBzYmlfZG9tYWluX2R1bXAo
Y29uc3Qgc3RydWN0IHNiaV9kb21haW4gKmRvbSwgY29uc3QgY2hhciAqc3VmZml4KTsKPgo+IGRp
ZmYgLS1naXQgYS9saWIvc2JpL3NiaV9kb21haW4uYyBiL2xpYi9zYmkvc2JpX2RvbWFpbi5jCj4g
aW5kZXggYjNmNTg5MmQuLmY1YzYyNTA5IDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkvc2JpX2RvbWFp
bi5jCj4gKysrIGIvbGliL3NiaS9zYmlfZG9tYWluLmMKPiBAQCAtNTMxLDYgKzUzMSwyMSBAQCBi
b29sIHNiaV9kb21haW5fY2hlY2tfYWRkcl9yYW5nZShjb25zdCBzdHJ1Y3Qgc2JpX2RvbWFpbiAq
ZG9tLAo+ICAgICAgICAgcmV0dXJuIHRydWU7Cj4gIH0KPgo+ICtzdHJ1Y3Qgc2JpX2RvbWFpbiAq
c2JpX2RvbWFpbl9maW5kX2J5X25hbWUoY29uc3QgY2hhciAqbmFtZSkKPiArewo+ICsgICAgICAg
c3RydWN0IHNiaV9kb21haW4gKmRvbTsKPiArCj4gKyAgICAgICBpZiAoIW5hbWUpCj4gKyAgICAg
ICAgICAgICAgIHJldHVybiBOVUxMOwo+ICsKPiArICAgICAgIHNiaV9kb21haW5fZm9yX2VhY2go
ZG9tKSB7Cj4gKyAgICAgICAgICAgICAgIGlmICghc2JpX3N0cmNtcChkb20tPm5hbWUsIG5hbWUp
KQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBkb207Cj4gKyAgICAgICB9Cj4gKwo+
ICsgICAgICAgcmV0dXJuIE5VTEw7Cj4gK30KPiArCj4gIHZvaWQgc2JpX2RvbWFpbl9kdW1wKGNv
bnN0IHN0cnVjdCBzYmlfZG9tYWluICpkb20sIGNvbnN0IGNoYXIgKnN1ZmZpeCkKPiAgewo+ICAg
ICAgICAgdTMyIGksIGosIGs7Cj4gQEAgLTY0NSwxMSArNjYwLDEzIEBAIGludCBzYmlfZG9tYWlu
X3JlZ2lzdGVyKHN0cnVjdCBzYmlfZG9tYWluICpkb20pCj4gICAgICAgICAvKgo+ICAgICAgICAg
ICogRW5zdXJlIHRoYXQ6Cj4gICAgICAgICAgKiAgMSkgRG9tYWluIG5vdCBhbHJlYWR5IHJlZ2lz
dGVyZWQKPiArICAgICAgICAqICAyKSBEb21haW4gbmFtZSBpcyB1bmlxdWUKPiAgICAgICAgICAq
ICAyKSBJbml0aWFsaXphdGlvbiBvcmRlciBpcyB1bmlxdWUKPiAgICAgICAgICAqLwo+ICAgICAg
ICAgc2JpX2RvbWFpbl9mb3JfZWFjaCh0ZG9tKSB7Cj4gICAgICAgICAgICAgICAgIGlmICh0ZG9t
ID09IGRvbSB8fAo+IC0gICAgICAgICAgICAgICAgICAgdGRvbS0+aW5pdF9vcmRlciA9PSBkb20t
PmluaXRfb3JkZXIpCj4gKyAgICAgICAgICAgICAgICAgICB0ZG9tLT5pbml0X29yZGVyID09IGRv
bS0+aW5pdF9vcmRlciB8fAo+ICsgICAgICAgICAgICAgICAgICAgIXNiaV9zdHJjbXAodGRvbS0+
bmFtZSwgZG9tLT5uYW1lKSkKPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VB
TFJFQURZOwo+ICAgICAgICAgfQo+Cj4gLS0KPiAyLjQzLjAKPgo+Cj4gLS0KPiBvcGVuc2JpIG1h
aWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKUmV2aWV3ZWQtYnk6IFBhd2Fu
ZGVlcCBPemEgPHBhd2FuZGVlcC5vemFAb3NzLnF1YWxjb21tLmNvbT4KVGVzdGVkLWJ5OiBQYXdh
bmRlZXAgT3phIDxwYXdhbmRlZXAub3phQG9zcy5xdWFsY29tbS5jb20+CgotLSAKb3BlbnNiaSBt
YWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
