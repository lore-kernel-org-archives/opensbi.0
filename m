Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A60C44507
	for <opensbi@archiver.kernel.org>; Fri, 17 Jul 2026 08:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kLgDtiOAboJ8Iib8mlawz/iPUG1Uw1JL63iRY9XBn3E=; b=FJy6op8Tk12E/k
	UyX5PTQAOzKixHeUlcFbyM9Ed078eI8AFLGJPpgyDT1PpzM5jvv7n1DHU6XCKkNgp879fdaNvEbIL
	qzpI4q9ST6CuMKffUhFUOnO2U0cBe9g6R0sZni8egtObvuyHyQvPY3XLe+zOTLcqVm22I08wq/NHj
	080td84euhJqoC+BL5DUK3GuC7eNI4RVnC1gPJbZ7soUZ0sunAecJMfrXi1FEVYoLGqWG3D7nrgsM
	dSOaROv8X3UClCnNaIpGHPZ4+h07iIO5UtxG/cZn52xdqGkSOs74EuplIMkBkIq40AkGb4PO3OV/V
	rmKECWPoBD3NpUHwpYAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdsF-00000001czM-1rTY;
	Fri, 17 Jul 2026 08:24:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdsD-00000001cyV-0tpg
	for opensbi@lists.infradead.org;
	Fri, 17 Jul 2026 08:24:46 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cHlL2098537
	for <opensbi@lists.infradead.org>; Fri, 17 Jul 2026 08:24:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tkvEjvnei1JxVW3/1cctJQOfaR1Amr0wbxAO4MuSu7M=; b=Sl/UDx4SYzvq3er6
	+sd4G+jieeeUHI3ZM/mY7kK8ROwBgLWEabuuTMarA6lJA1l81II2DZjROuR5bqHZ
	SQ1GNKWUVl9qjsVqlK/rdkQ4stbQoH6rzpsOnW5EdaTAOdGNynKA340XNO2hfxal
	r8n4whD8qU0MFmGNiub7xSYpDtsg+dg14jv6DoaPTRpqmLbErqabXE2rfApln/I4
	WPlQRK6hyUjdM9RmT1QLa2mOUTnSG4xG2Sz5AF2Lmewj3jJ9HVOW6vSs8QXdedPv
	88dpinZ3oYccQv8Kf/7sWVVFIdObkzjDmDgHSWGLsKAD6Bq844PmE6oSL1BOOpmu
	zY/SdQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u6jsjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Fri, 17 Jul 2026 08:24:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccbb61893fso163165065ad.0
        for <opensbi@lists.infradead.org>; Fri, 17 Jul 2026 01:24:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784276684; cv=none;
        d=google.com; s=arc-20260327;
        b=Gk4LOmiENYxrwxy2eLxWafpGvfPiPjRjHWybcuR4L2u+MB6L0Ipd7CS5Stl6ZbS2Cd
         rYn0EhM0bXig6RN1OrZX1QltuxsveFY931UbQgvaFII+qcb5qeRyd/vx8UTKxLmYW6Ti
         lj7XYVD4+FI94RTJCiyDwjWpmylcFWWmu/tm2B8bM3GNTqo8aZ7JqB0HoGiQNcMx7+7h
         L5UerwZ+2gOXwRnZW3OZJMaAkgRKbnqBlkDIKM3Z3Ch0gJN7Ekd1jVWojqQ4z00Teuen
         GZNIqhQEzqJ1sDNooxqtUoCOHfALWzczTLHC1virB7oqS6qGhyYRuFb8gHVqwbliCgWg
         h9fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tkvEjvnei1JxVW3/1cctJQOfaR1Amr0wbxAO4MuSu7M=;
        fh=KrYJhzZvIgXYjgi9IqeDq7QDVTAAX0EvLn/l70df43w=;
        b=dyECgq6+sk4HCMaotnCwRp9eKx5J3AN3Vt1SjozxAc1kZ2oj7mc6caI2/I69ghXSek
         UiIxXNEFQU60mhcM/16EDEX44hs3WmarN+ZPfk0ziWNohjpgLfm7QnKtO4k+5ry1rOSL
         jBQMzOQZOQMWcEJW5vUAd/Kx7wMH/dTPLoyZ8NZIH4ZBdK1oCdI36XdgatHIdr0TWrqs
         IQvw6ID3+Kujg/wSmOUsFK9EQg2Ws3wROhjpJi/xoUFX/RThq2wgeyB44T4pHJdUjtbS
         L1zHTjEp4VUrJVrXbkRRwM+E7YmF767yVuDiz9SWpAJmyBICI60IHZKEbqRgw5jh0A90
         2NMg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784276684; x=1784881484; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tkvEjvnei1JxVW3/1cctJQOfaR1Amr0wbxAO4MuSu7M=;
        b=a9cjB/Tpy5AZlfcFlvhXlaDaoiRepgIw7OnZ2QBWOVFdgucZO5+7570r/o6neiflCR
         e2KWdBLobX1cstAnzQeqwFI7M+5FZVN//cjTmHlAp6hGN9zgbCAJds2VpJ5R9f3FFSuM
         CgZ44ZcWWdXe1YAV9X3gWNdzToD/eD8BZ/lFyD8+pkxtz2YULsD+qdbXvqnN7Gn8Wtna
         u/L6a12HpIudnpkbSsg6oo/vc2spkEoH7eb0lkSt1fcLoCC7PJ+tiuqhOwGTI5i/D0Kc
         L9k5RvVage7glHp7o8xuUTVK/OaFju3gEQQWYZyRwE+NwR0KibXynmRxVCo4ffCwL1og
         L6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784276684; x=1784881484;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tkvEjvnei1JxVW3/1cctJQOfaR1Amr0wbxAO4MuSu7M=;
        b=fERDzI7nuP3puWWcy0W05zP53Nn6oXJkf1xlwGsXAHajYSIcRydIAYGrvgxq358QAR
         x1B7D0EnqkbfHnJzEwgL8kfTV6BpQc11ZNbfsS7ZzPYVR1opaXe9H7ruiKWYq7Tej0HJ
         sw0xfTCgExhAH3WnagegTZDKhWGucKeYqnB9GfdCh2P427VAfpuK0PKtoff9d5EfWePq
         Ji0tmzwQx9bSK50cvxAYVy0jR2OhhELWr+OW8mJlOfc5ImbSfAPjTsVJZQNIc28fBV3t
         L9+yFXJzLsitpqFPddj9zalO+WjkUrYbSNULbSpGRx7y1ScwxspOx2XDoQjt6A65bjiR
         CygA==
X-Gm-Message-State: AOJu0YwcC3CV2oX2bV3bUt7IQMHfpnVPx/W7pRAsmkyU2PGWAj4KUoOv
	QM6VdMS71alnd8fgy1uTcH6dnRi9SLgqUAhNlbBKPtBWRZqw8EdeNvKcjXhD5ksrEjSw/RFP3M2
	ftpXK4BNPGjbvOoEtcXNuNAamPm09kGaSOmyKx35H+NzUir/LhvrbfzT3oL4LCkFrQkO6l7Vqaz
	QA7uLpoxmhwH4bIbb+6qJv65kt+8Ybj7FIiWtC4GoR
X-Gm-Gg: AfdE7clup1hFJPy1T8dKxt9Hupd555rUlhSE+0HAq0i0AaMn6gKnyY5M8NGZyyJy3UB
	scV0hH8jeoVxgVG7ZfXRyVaY2RI9PsGyRMaUXK4pO6EC9stephsGBS+Rse+0FOJCn6EJUACpjvK
	DFmWhT/RY/dJFOX1dJaNPNd+yj/hcLoIokIpdpFrYfAzq8ndPy0V0SDzh0/w==
X-Received: by 2002:a17:90b:4a8c:b0:381:bc4c:da56 with SMTP id 98e67ed59e1d1-38e4b43cdbdmr1811692a91.19.1784276683594;
        Fri, 17 Jul 2026 01:24:43 -0700 (PDT)
X-Received: by 2002:a17:90b:4a8c:b0:381:bc4c:da56 with SMTP id
 98e67ed59e1d1-38e4b43cdbdmr1811665a91.19.1784276683142; Fri, 17 Jul 2026
 01:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260711201413.2931099-1-pawandeep.oza@oss.qualcomm.com> <20260711201413.2931099-7-pawandeep.oza@oss.qualcomm.com>
In-Reply-To: <20260711201413.2931099-7-pawandeep.oza@oss.qualcomm.com>
From: Anup Patel <anup.patel@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 13:54:30 +0530
X-Gm-Features: AUfX_mxL9WIRQP3_mq_XS1XTTdRrEn1sPR6EWIG-GxMQsD2nSOhxluDPgHuJWDM
Message-ID: <CABBgwmtya3EfO9CJDCEr6cEvdPVkea_=NpH89pi6n9cQJzJrOw@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] lib: sbi_irqchip: fix MSI EIID gap and tail
 allocation logic in register_msi
To: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4MyBTYWx0ZWRfX4lYjmOJWHWAH
 kYRmAiOs9ukkyWFl4CwRk5ApL8tOUgnr9Zw8u4oz+SomjMjQv1rWPfD9duEfaS2+JrmYhS/6WOn
 /CEDzTEt5cCmv3ATLQP+/Y8Y5R/EQdBhIJgmr4QErMpX5VhdFEwwUBdW5KSEFf+0Lj3bjNZkFAL
 ofzdJ1dq+ZbvRFE2FgUuLRFPqjLve9nshnJQhjF5eQVGFT2Qck//r26LKYAUooqM5PLT5x39V8R
 vgKwyt7B9aRWJkQhgyj+QGtjYWclppuQd6oE+ZR61ukR2PrMSowT23qgaGlGrGtNAEqiN7fjUVy
 UKWS6bL7Vb+TECMjd8fhBh5bi9oxKwjutgA3/x8UOdZQyfKAJh4yOD6FNm150Kn16Db7kFVlo7M
 RMhJFvq6LZQGj77JtVpqhjEi3IqZzXZuyGi6vxg5Rp174TWx03uuZg5d3Ox0mjQGhOurE+6t7HH
 kH8N5qjI6Y+9ilKf8OQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4MyBTYWx0ZWRfXzUqjX4YNImws
 kbEq0c57U6xS8vF2usrF7e0sUQ8JQgOxvg7rlU0U02rduLPIJVJd6Hseldcy+iSPpTuzRKMmqdf
 SMkiKou/frSsvtBQmjXUVealvnJlyUk=
X-Authority-Analysis: v=2.4 cv=DYMnbPtW c=1 sm=1 tr=0 ts=6a59e6cc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=W-_n0kkjAAAA:8
 a=nln6zk6g-nMBeO9wuAMA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-GUID: 4fYDJhb0XUTOhgSiZkjxF5GsLxEcXF47
X-Proofpoint-ORIG-GUID: 4fYDJhb0XUTOhgSiZkjxF5GsLxEcXF47
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_012445_257770_9D631FB1 
X-CRM114-Status: GOOD (  19.92  )
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

T24gU3VuLCBKdWwgMTIsIDIwMjYgYXQgMTo0NOKAr0FNIFBhd2FuZGVlcCBPemEKPHBhd2FuZGVl
cC5vemFAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBGaXggc2JpX2lycWNoaXBfcmVnaXN0
ZXJfbXNpKCkgdGhhdCBwcmV2ZW50ZWQgY29udGlndW91cyBFSUlEIGFsbG9jYXRpb246Cj4KPiAt
IEdhcCBjaGVjayBjb25kaXRpb24gd2FzIGludmVydGVkOiB0aGUgb3JpZ2luYWwgYGgtPmZpcnN0
X2h3aXJxIC0KPiAgIGh3aXJxIDwgbnVtX2h3aXJxYCBpbmNvcnJlY3RseSBzZXQgYGZvdW5kID0g
dHJ1ZWAgd2hlbiB0aGUgZ2FwIHdhcwo+ICAgdG9vIHNtYWxsIHRvIGZpdCBudW1faHdpcnEgZW50
cmllcy4gQ29ycmVjdCB0byBgPj0gbnVtX2h3aXJxYCBzbwo+ICAgYWxsb2NhdGlvbiBvbmx5IHBy
b2NlZWRzIHdoZW4gc3VmZmljaWVudCBzcGFjZSBleGlzdHMgYmV0d2Vlbgo+ICAgcmVnaXN0ZXJl
ZCBoYW5kbGVycy4KPgo+IC0gVGFpbC1zcGFjZSBjaGVjayBgIWZvdW5kICYmICFod2lycWAgbmV2
ZXIgdHJpZ2dlcmVkIGFmdGVyIGl0ZXJhdGlvbgo+ICAgUmVwbGFjZSB3aXRoIGAoY2hpcC0+bnVt
X2h3aXJxIC0gaHdpcnEpID49IG51bV9od2lycWAgdG8gY29ycmVjdGx5Cj4gICBhbGxvY2F0ZSBp
ZiBoYW5kbGVyIGxpc3QgaXMgZW1wdHkuCj4KPiBGaXhlczogNzllNjNiYzgzNDhkICgiaXJxY2hp
cDogYWRkIHNiaV9pcnFjaGlwX3JlZ2lzdGVyX21zaSBzdXBwb3J0IikKPgo+IFNpZ25lZC1vZmYt
Ynk6IE96YSBQYXdhbmRlZXAgPHBhd2FuZGVlcC5vemFAb3NzLnF1YWxjb21tLmNvbT4KCkxHVE0u
CgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClRoYW5rcywK
QW51cAoKPiAtLS0KPiAgbGliL3NiaS9zYmlfaXJxY2hpcC5jIHwgNCArKy0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
bGliL3NiaS9zYmlfaXJxY2hpcC5jIGIvbGliL3NiaS9zYmlfaXJxY2hpcC5jCj4gaW5kZXggZDEy
NGMxOTQuLjk0MWY0NTE0IDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkvc2JpX2lycWNoaXAuYwo+ICsr
KyBiL2xpYi9zYmkvc2JpX2lycWNoaXAuYwo+IEBAIC0zNjIsNyArMzYyLDcgQEAgaW50IHNiaV9p
cnFjaGlwX3JlZ2lzdGVyX21zaShzdHJ1Y3Qgc2JpX2lycWNoaXBfZGV2aWNlICpjaGlwLCB1MzIg
bnVtX2h3aXJxLAo+ICAgICAgICAgICAgICAgICBpZiAoaC0+Zmlyc3RfaHdpcnEgPD0gaHdpcnEg
JiYgaHdpcnEgPCAoaC0+Zmlyc3RfaHdpcnEgKyBoLT5udW1faHdpcnEpKSB7Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgaHdpcnEgPSBoLT5maXJzdF9od2lycSArIGgtPm51bV9od2lycTsKPiAg
ICAgICAgICAgICAgICAgfSBlbHNlIGlmIChod2lycSA8IGgtPmZpcnN0X2h3aXJxKSB7Cj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgaWYgKGgtPmZpcnN0X2h3aXJxIC0gaHdpcnEgPCBudW1faHdp
cnEpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAoaC0+Zmlyc3RfaHdpcnEgLSBod2ly
cSA+PSBudW1faHdpcnEpIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZvdW5k
ID0gdHJ1ZTsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAg
ICAgICAgICAgICAgICAgICAgIH0gZWxzZSB7Cj4gQEAgLTM3MCw3ICszNzAsNyBAQCBpbnQgc2Jp
X2lycWNoaXBfcmVnaXN0ZXJfbXNpKHN0cnVjdCBzYmlfaXJxY2hpcF9kZXZpY2UgKmNoaXAsIHUz
MiBudW1faHdpcnEsCj4gICAgICAgICAgICAgICAgICAgICAgICAgfQo+ICAgICAgICAgICAgICAg
ICB9Cj4gICAgICAgICB9Cj4gLSAgICAgICBpZiAoIWZvdW5kICYmICFod2lycSkKPiArICAgICAg
IGlmICghZm91bmQgJiYgKGNoaXAtPm51bV9od2lycSAtIGh3aXJxKSA+PSBudW1faHdpcnEpCj4g
ICAgICAgICAgICAgICAgIGZvdW5kID0gdHJ1ZTsKPiAgICAgICAgIGlmICghZm91bmQpCj4gICAg
ICAgICAgICAgICAgIHJldHVybiBTQklfRU5PU1BDOwo+IC0tCj4gMi40My4wCj4KPgo+IC0tCj4g
b3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0tIApvcGVu
c2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
