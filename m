Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91517C43458
	for <opensbi@archiver.kernel.org>; Fri,  3 Jul 2026 11:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KoG2QZfUH1Ml3lNo38GyF67SPt1onpsQGe813fcnRfA=; b=44oa39ucJ5CKHD
	Pb64Aa7itiZMsW20jSo5TcKgtdpB0cE3k18RZbwhGHYu1sFTFoiJGLDasSTSfrEntBpCC8/QqD7nF
	gIXRrWQWDkGHuRerSaVK28grsRYCL+L1qz50IwmAAtNrRtptRcsvBCP8bRmKP+R08Y2ufOSjs1OsJ
	w8DwRuORX3a7HjlPRy/IjDqntR141YRoADG5sNCyxrT3SlaKpRJUPYEn9Kgd3XuzNGrYErxJqLrIb
	dY6u6EF4BGyqXu5iZwyrHmzvDoxkGw2KRw0p16v9yIu1iZ+CAO/Pj6GP4B1VeNdkFOitqgKaZNNm1
	pfTm9x2zegfuh1lu/dQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbw2-00000006nSL-3AEj;
	Fri, 03 Jul 2026 11:19:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbw0-00000006nRt-3Us9
	for opensbi@lists.infradead.org;
	Fri, 03 Jul 2026 11:19:54 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663BBD4H3124343
	for <opensbi@lists.infradead.org>; Fri, 3 Jul 2026 11:19:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/PtmK7trGdPCQTtG089lW/ff4o1sdNFSQtSc+RBHEHk=; b=UpSQFobxsozPh5St
	GDLnmMrSSeSLMZYzCAGO9ZA7O7ayv7AitKrj4iQ2mqkEaYjkeDLN3vQw9xITkdae
	pAx6iOg83EaNt7OHAtA7e+VIuMgLhyBepW0aHIvd4aY7hB2KWexCKlFZURyNaa+S
	6QebX3CAW1JoxavI4xqCZliVy9SyKePOwwG3XmWe3592jqyTJY1y0zaYX8GJ5bb4
	yhELSUgekjiHkgtQn/lVonevbvxyxA/lOTJGqlyOLigOVoSih5m+Hd2yBz0w2Hv9
	TRUv1uh9cZVOW0t6ZMMfAuKmi+AOoFUhEdyMN2JV+/bF2vGx6zJyiDfYTJy/gw0r
	qp3rEQ==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qnpd1yp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Fri, 03 Jul 2026 11:19:51 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-80e910ddbc6so12482257b3.0
        for <opensbi@lists.infradead.org>; Fri, 03 Jul 2026 04:19:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783077591; cv=none;
        d=google.com; s=arc-20260327;
        b=o5bn82ljKuhqtgHrUTcLeUj7eUfurKMtMFQvu9YJoLo5khWP142TZRQZv4v9tc1L9N
         qnnMfNk1qOhUDhXMV7OvXLP3DXl8VJE80oF2ko0oUdSy8RNLLugHXsbNn/tlQiZGcPKQ
         ZfXk0yj35+ih7F66xt/jiapmaO5cOkZ30uPa7hUsr84tJLIn9ZORQPxeIvcFwwGWP1Q9
         PpLcW1vGmGrtiBKJzyz+PZyv6AhuJ9aHTU3TxUcxOHmWrKPgm4/HNp8UKOK9nNbnsQIr
         Tvx5UX/uAjaQUoln1OI+mQlEJLI2SORjSyTSjMb9TvGaxP+DaCJ41JFDSm1eF+oVEbfc
         qakw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/PtmK7trGdPCQTtG089lW/ff4o1sdNFSQtSc+RBHEHk=;
        fh=KrYJhzZvIgXYjgi9IqeDq7QDVTAAX0EvLn/l70df43w=;
        b=S8E5OyAvE4ZrmyCegOZ5RDxl4qV5n/p2SE5OmUTaS2cdl72xyeGRol+gFJanbTb+mN
         AIMlH1RNkOoo1RI94xLnrYHi+kE2YUE12utJXO8cf63pxQQHGI35/S0rElBFsQaHDfUh
         Z3hT4xb6QYuNVC8Smsrwlzl9VYIDSGRKHtnRCCLteCc0OkWOldsARbkMHWPwme9eDBAS
         4XxpCXJtM1vRc+nq8DFXObECdE8FrnwADYO3Qh8974YWG0wO1yWmCTio8mcd4d9uqzJc
         NpUrVFHcrxCv7I0BZAB/mS6cPts03jgaz/tT8eVZfBQ2T54W0ijk3RsFP1Vdi2wKFPyN
         bmJA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783077591; x=1783682391; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/PtmK7trGdPCQTtG089lW/ff4o1sdNFSQtSc+RBHEHk=;
        b=cvAPTqZdWtyNByhkxdcy7WzB77aZp7hr0Dz1QRqgc/aOq45UUWgSJUtZLPVEz5xuok
         2jtTUoBxC2Dv26H8VKtky47nEkybgUVWcmp4tY3xcNtkzeSHcC0C3PXsJRaeZgVorEJp
         0nWPs6IFhayEpDmSbtFBG9lH1Qa63szlXzvrne2Iyirh2yuvtvdODYT3KwHgYUE9f4W5
         TImye/exb9LQhMs4Zwtt6F+CYt+/OoMHogcmcRIWhNtKctwE5MXEbsy2BHHorULuYrQT
         BrVyhtJYtZYbfJsAaNKsCWQhIcizU0qCSCMZHF+oTWNY9pdVbGQXsiuqQ+V3Spjyg7MT
         uysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783077591; x=1783682391;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/PtmK7trGdPCQTtG089lW/ff4o1sdNFSQtSc+RBHEHk=;
        b=szqsOjOcVdOGeJd3sigoHcYHK42Jx/EOQXauW9UBPg9M151cLVezSL/YngBlELuEEz
         mCGaFyWBFp1JvD2v4V2JGKs6m+heYyeT7urF0WfeRwJa+ZBMKlV8VHt203nhwC46dsqH
         MgPCIb9SoT/4+MSSJMcynE2ZXGOUyT6nuREeaTEFsQUFy/PloGkCYuLHj0J2Kp1pBB/6
         eg6ICBRd1cJ/i/k7thIAaFY+5anppkHEjAaeRB0w3NRWdqg/BCQPVgUB5J1dbR4TZPJb
         PL81Zczr18VCmLdLqXehy39ojNOlwSy9HtVCewUpj9LIx8qZ2tihdb9Bkt8wOOq+Uc5N
         RG8Q==
X-Gm-Message-State: AOJu0YzDzXUiMjUW0mLxMfzL9LKATwGdg3O4VWLPyO+zvrmLnCXYZnZF
	LSNERKmzuceg1rovRikmmvksL1rBw5JGkJbgkmdpr7G5G9JO8dsXdFR52AQd3KeTpWvIAEx5dE0
	px4toDcb/A2NzmAiXuBYYAE1kxn2CxGwCj1O9E8R3vniQRH43EIBAYTkcewrCNdhm2OV8p97ShY
	j3Miv1LV0Rf3QrtWfSYI8rSoglkKZtn6IXyf4OwGIU7D5jBrugn+U=
X-Gm-Gg: AfdE7cm17O0UbI1fg1Oz1glUmFNhFaFLz91pDHOs7QcetE9IMIg4NRc3SiJu1S7PeYX
	SDrxI1+PLkpMSl0EJ+6bKt5AiLHErRoRzfdzzfc1kASepYNrprm+qOy/OzE/udPiJB23vY1tmJA
	hwgHypc7vVmnhmgHwxOy465CdXa8s0EuUPL2QDfBQHoxelcE86dFEYjN+9GAa5g9dtc43C
X-Received: by 2002:a05:690c:4f07:b0:814:47f2:217 with SMTP id 00721157ae682-81447f20388mr74268817b3.65.1783077590609;
        Fri, 03 Jul 2026 04:19:50 -0700 (PDT)
X-Received: by 2002:a05:690c:4f07:b0:814:47f2:217 with SMTP id
 00721157ae682-81447f20388mr74268597b3.65.1783077590177; Fri, 03 Jul 2026
 04:19:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260629181206.754781-1-pawandeep.oza@oss.qualcomm.com>
In-Reply-To: <20260629181206.754781-1-pawandeep.oza@oss.qualcomm.com>
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 16:49:39 +0530
X-Gm-Features: AVVi8CftdpFD1NgRSrtHyfzEavO9OxfJ0AkzEg-UU6mfMhc5_GGGHPUy4JuIyGA
Message-ID: <CAFR3w37h+20zkPzwugKrPyPHBZambpL8hiLnR5u3AVeob9uL+Q@mail.gmail.com>
Subject: Re: [PATCH] lib: utils/mpxy: bind channel access to owning domain
To: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDExMCBTYWx0ZWRfX/MxMwRl52DP7
 zEVdEu9i6AqUflcwMZFttryZhTB9QoC+K7Ccrll41R/1ATbKh528sna+fV/OkqvkD5YW+t3c7sX
 dnKkKvt3s/Bzt9PNKRhJPTN3YvXyLRY=
X-Authority-Analysis: v=2.4 cv=FoI1OWrq c=1 sm=1 tr=0 ts=6a479ad7 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=SLIK18LNGnxy7DmqeeYA:9
 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDExMCBTYWx0ZWRfX4TSQd/AtDE+2
 idcWBq/OK1+uG//rak2sPAqSSMGZC0U2XrErRwDLghej5+d6jku6JcPzR9a5mgssK4AdnRxhvN0
 DmfPgHiqr3RJt9pPyFQrKtBX3LMgHiFLiHcH5xmauW8ScREki20cN+DMpMQibiqGI1hM6ZTno4U
 +gN8P0OGoGgrh1XEFZyyzxPD/57c/38EFdSAMt1q1X0qSfGFqvo+m/OEGT93Q10OMUMsrdoWlw1
 29oHyaILJBuZ7QsuxjSO2SmhDQ+/NWjxKsZ/EZiEDhnGWv8LEt0YjvlsvPU7bBMtiNIkImr0TIW
 4P/ufyLIxiUujqARUx+uU2qhAjc+UhXwQWoQ+IxCzBO7l/VMYbwjZ+3StDrUPmlDqzc7GW74mfV
 3bPlOz/mkT6LF/9aSqQcLruQz2fF0nzh/OnKipu9SH+maFfPkvHhx/4IAttnfNfjdlbEIAhozK3
 p0G4Jvbe5lXIz7ZZl7Q==
X-Proofpoint-ORIG-GUID: di29ZUKQVYZR69S9fP0jeyS4VeYE7Vxb
X-Proofpoint-GUID: di29ZUKQVYZR69S9fP0jeyS4VeYE7Vxb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_041952_991360_EFE8B3D3 
X-CRM114-Status: GOOD (  26.68  )
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

T24gTW9uLCBKdW4gMjksIDIwMjYgYXQgMTE6NDfigK9QTSBQYXdhbmRlZXAgT3phCjxwYXdhbmRl
ZXAub3phQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gRnJvbTogT3phIFBhd2FuZGVlcCA8
cGF3YW5kZWVwLm96YUBvc3MucXVhbGNvbW0uY29tPgo+Cj4gVGhlIE1QWFkgZnJhbWV3b3JrIGN1
cnJlbnRseSBzdG9yZXMgcmVnaXN0ZXJlZCBjaGFubmVscyBpbiBhIGdsb2JhbAo+IGxpc3QgYW5k
IGV4cG9zZXMgdGhlbSB0byBhbGwgY2FsbGVycy4gSG93ZXZlciwgdGhlIGludGVuZGVkIG1vZGVs
IGlzCj4gdGhhdCBlYWNoIGNoYW5uZWwgaXMgYXNzaWduZWQgdG8gYSBzaW5nbGUgc3VwZXJ2aXNv
ciBkb21haW4gYXQgYm9vdCBhbmQKPiByZW1haW5zIG93bmVkIGJ5IHRoYXQgZG9tYWluIGZvciBp
dHMgbGlmZXRpbWUuCj4KPiBJbnRyb2R1Y2UgZml4ZWQgb3duZXItZG9tYWluIHRyYWNraW5nIGlu
IHN0cnVjdCBzYmlfbXB4eV9jaGFubmVsIGFuZAo+IG1ha2UgY2hhbm5lbCBsb29rdXAgYW5kIGVu
dW1lcmF0aW9uIGRvbWFpbi1hd2FyZS4gQSBjaGFubmVsIGlzIG5vdwo+IHZpc2libGUgb25seSB3
aGVuIGFjY2Vzc2VkIGZyb20gaXRzIG93bmluZyBkb21haW4uIEFsc28gcmVxdWlyZSB0aGUKPiBv
d25lciB0byBiZSBzZXQgYmVmb3JlIGNoYW5uZWwgcmVnaXN0cmF0aW9uLgo+Cj4gVGhpcyBhbGxv
d3MgTVBYWSB0byBzdXBwb3J0IHN5c3RlbXMgd2hlcmUgdGhlIHNhbWUgaGFydCBtYXkgYmUgcmV1
c2VkIGJ5Cj4gbXVsdGlwbGUgZG9tYWlucyB3aGlsZSBrZWVwaW5nIGNoYW5uZWwgb3duZXJzaGlw
IGFuZCB2aXNpYmlsaXR5IGZpeGVkIHRvCj4gdGhlIGRvbWFpbiB0aGF0IG93bnMgdGhlIHNlcnZp
Y2UuCj4KPiBTaWduZWQtb2ZmLWJ5OiBPemEgUGF3YW5kZWVwIDxwYXdhbmRlZXAub3phQG9zcy5x
dWFsY29tbS5jb20+Cj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zYmkvc2JpX21weHkuaCBiL2lu
Y2x1ZGUvc2JpL3NiaV9tcHh5LmgKPiBpbmRleCA5ZGEyNzkxZS4uZTdiMjg1MjcgMTAwNjQ0Cj4g
LS0tIGEvaW5jbHVkZS9zYmkvc2JpX21weHkuaAo+ICsrKyBiL2luY2x1ZGUvc2JpL3NiaV9tcHh5
LmgKPiBAQCAtMTMsNiArMTMsNyBAQAo+ICAjaW5jbHVkZSA8c2JpL3NiaV9saXN0Lmg+Cj4KPiAg
c3RydWN0IHNiaV9zY3JhdGNoOwo+ICtzdHJ1Y3Qgc2JpX2RvbWFpbjsKPgo+ICAjZGVmaW5lIFNC
SV9NUFhZX01TR1BST1RPX1ZFUlNJT04oTWFqb3IsIE1pbm9yKSAoKE1ham9yIDw8IDE2KSB8IE1p
bm9yKQo+Cj4gQEAgLTkxLDEyICs5MiwxMyBAQCBzdHJ1Y3Qgc2JpX21weHlfY2hhbm5lbF9hdHRy
cyB7Cj4gICAgICAgICAvKiBFdmVudHMgU3RhdGUgQ29udHJvbCAqLwo+ICAgICAgICAgdTMyIGV2
ZW50c3N0YXRlX2N0cmw7Cj4gIH07Cj4gLQo+ICAvKiogQSBNZXNzYWdlIHByb3h5IGNoYW5uZWwg
YWNjZXNzaWJsZSB0aHJvdWdoIFNCSSBpbnRlcmZhY2UgKi8KPiAgc3RydWN0IHNiaV9tcHh5X2No
YW5uZWwgewo+ICAgICAgICAgLyoqIExpc3QgaGVhZCB0byBhIHNldCBvZiBjaGFubmVscyAqLwo+
ICAgICAgICAgc3RydWN0IHNiaV9kbGlzdCBoZWFkOwo+ICAgICAgICAgdTMyIGNoYW5uZWxfaWQ7
Cj4gKwo+ICsgICAgICAgc3RydWN0IHNiaV9kb21haW4gKm93bmVyX2RvbWFpbjsKPiAgICAgICAg
IHN0cnVjdCBzYmlfbXB4eV9jaGFubmVsX2F0dHJzIGF0dHJzOwo+Cj4gICAgICAgICAvKioKPiBA
QCAtMTgxLDUgKzE4Myw0IEBAIGludCBzYmlfbXB4eV9zZW5kX21lc3NhZ2UodTMyIGNoYW5uZWxf
aWQsIHU4IG1zZ19pZCwKPiAgLyoqIEdldCBNZXNzYWdlIHByb3h5IG5vdGlmaWNhdGlvbiBldmVu
dHMgKi8KPiAgaW50IHNiaV9tcHh5X2dldF9ub3RpZmljYXRpb25fZXZlbnRzKHUzMiBjaGFubmVs
X2lkLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBs
b25nICpldmVudHNfbGVuKTsKPiAtCj4gICNlbmRpZgo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3Ni
aV9tcHh5LmMgYi9saWIvc2JpL3NiaV9tcHh5LmMKPiBpbmRleCBmZjVjNmFiNi4uMDhlMTBkY2Eg
MTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfbXB4eS5jCj4gKysrIGIvbGliL3NiaS9zYmlfbXB4
eS5jCj4gQEAgLTE0NSwxNCArMTQ1LDIzIEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBtcHh5X2lzX3N0
ZF9hdHRyKHUzMiBhdHRyX2lkKQo+ICAgICAgICAgcmV0dXJuIChhdHRyX2lkID4+IDMxKSA/IGZh
bHNlIDogdHJ1ZTsKPiAgfQo+Cj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBtcHh5X2NoYW5uZWxfdmlz
aWJsZShzdHJ1Y3Qgc2JpX21weHlfY2hhbm5lbCAqY2hhbm5lbCwKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHNiaV9kb21haW4gKmRvbSkKPiArewo+ICsg
ICAgICAgcmV0dXJuIGNoYW5uZWwtPm93bmVyX2RvbWFpbiA9PSBkb207Cj4gK30KPiArCj4gIC8q
KiBGaW5kIGNoYW5uZWxfaWQgaW4gcmVnaXN0ZXJlZCBjaGFubmVscyBsaXN0ICovCj4gLXN0YXRp
YyBzdHJ1Y3Qgc2JpX21weHlfY2hhbm5lbCAqbXB4eV9maW5kX2NoYW5uZWwodTMyIGNoYW5uZWxf
aWQpCj4gK3N0YXRpYyBzdHJ1Y3Qgc2JpX21weHlfY2hhbm5lbCAqbXB4eV9maW5kX2NoYW5uZWwo
dTMyIGNoYW5uZWxfaWQsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCBzYmlfZG9tYWluICpkb20pCj4gIHsKPiAgICAgICAgIHN0cnVjdCBzYmlfbXB4eV9j
aGFubmVsICpjaGFubmVsOwo+Cj4gLSAgICAgICBzYmlfbGlzdF9mb3JfZWFjaF9lbnRyeShjaGFu
bmVsLCAmbXB4eV9jaGFubmVsX2xpc3QsIGhlYWQpCj4gLSAgICAgICAgICAgICAgIGlmIChjaGFu
bmVsLT5jaGFubmVsX2lkID09IGNoYW5uZWxfaWQpCj4gKyAgICAgICBzYmlfbGlzdF9mb3JfZWFj
aF9lbnRyeShjaGFubmVsLCAmbXB4eV9jaGFubmVsX2xpc3QsIGhlYWQpIHsKPiArICAgICAgICAg
ICAgICAgaWYgKGNoYW5uZWwtPmNoYW5uZWxfaWQgPT0gY2hhbm5lbF9pZCAmJgo+ICsgICAgICAg
ICAgICAgICAgICAgbXB4eV9jaGFubmVsX3Zpc2libGUoY2hhbm5lbCwgZG9tKSkKPiAgICAgICAg
ICAgICAgICAgICAgICAgICByZXR1cm4gY2hhbm5lbDsKPiArICAgICAgIH0KPgo+ICAgICAgICAg
cmV0dXJuIE5VTEw7Cj4gIH0KPiBAQCAtMjIyLDkgKzIzMSwxMiBAQCBzdGF0aWMgdm9pZCBtcHh5
X3N0ZF9hdHRyc19pbml0KHN0cnVjdCBzYmlfbXB4eV9jaGFubmVsICpjaGFubmVsKQo+ICBpbnQg
c2JpX21weHlfcmVnaXN0ZXJfY2hhbm5lbChzdHJ1Y3Qgc2JpX21weHlfY2hhbm5lbCAqY2hhbm5l
bCkKPiAgewo+ICAgICAgICAgaWYgKCFjaGFubmVsKQo+ICsgICAgICAgICAgICAgICByZXR1cm4g
U0JJX0VJTlZBTDsKPiArCj4gKyAgICAgICBpZiAoIWNoYW5uZWwtPm93bmVyX2RvbWFpbikKPiAg
ICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FSU5WQUw7Cj4KPiAtICAgICAgIGlmIChtcHh5X2Zp
bmRfY2hhbm5lbChjaGFubmVsLT5jaGFubmVsX2lkKSkKPiArICAgICAgIGlmIChtcHh5X2ZpbmRf
Y2hhbm5lbChjaGFubmVsLT5jaGFubmVsX2lkLCBjaGFubmVsLT5vd25lcl9kb21haW4pKQo+ICAg
ICAgICAgICAgICAgICByZXR1cm4gU0JJX0VBTFJFQURZOwo+Cj4gICAgICAgICAvKiBJbml0aWFs
aXplIGNoYW5uZWwgc3BlY2lmaWMgYXR0cmlidXRlcyAqLwo+IEBAIC0zOTcsMTIgKzQwOSwxNSBA
QCBpbnQgc2JpX21weHlfZ2V0X2NoYW5uZWxfaWRzKHUzMiBzdGFydF9pbmRleCkKPiAgICAgICAg
IHN0cnVjdCBzYmlfbXB4eV9jaGFubmVsICpjaGFubmVsOwo+ICAgICAgICAgdTMyIGNoYW5uZWxz
X2NvdW50ID0gMDsKPiAgICAgICAgIHUzMiAqc2htZW1fYmFzZTsKPiArICAgICAgIHN0cnVjdCBz
YmlfZG9tYWluICpkb20gPSBzYmlfZG9tYWluX3RoaXNoYXJ0X3B0cigpOwo+Cj4gICAgICAgICBp
ZiAoIW1weHlfc2htZW1fZW5hYmxlZChtcykpCj4gICAgICAgICAgICAgICAgIHJldHVybiBTQklf
RVJSX05PX1NITUVNOwo+Cj4gLSAgICAgICBzYmlfbGlzdF9mb3JfZWFjaF9lbnRyeShjaGFubmVs
LCAmbXB4eV9jaGFubmVsX2xpc3QsIGhlYWQpCj4gLSAgICAgICAgICAgICAgIGNoYW5uZWxzX2Nv
dW50ICs9IDE7Cj4gKyAgICAgICBzYmlfbGlzdF9mb3JfZWFjaF9lbnRyeShjaGFubmVsLCAmbXB4
eV9jaGFubmVsX2xpc3QsIGhlYWQpIHsKPiArICAgICAgICAgICAgICAgaWYgKG1weHlfY2hhbm5l
bF92aXNpYmxlKGNoYW5uZWwsIGRvbSkpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgY2hhbm5l
bHNfY291bnQgKz0gMTsKPiArICAgICAgIH0KPgo+ICAgICAgICAgaWYgKHN0YXJ0X2luZGV4ID4g
Y2hhbm5lbHNfY291bnQpCj4gICAgICAgICAgICAgICAgIHJldHVybiBTQklfRVJSX0lOVkFMSURf
UEFSQU07Cj4gQEAgLTQyMCw2ICs0MzUsOSBAQCBpbnQgc2JpX21weHlfZ2V0X2NoYW5uZWxfaWRz
KHUzMiBzdGFydF9pbmRleCkKPgo+ICAgICAgICAgLy8gSXRlcmF0ZSBvdmVyIHRoZSBsaXN0IG9m
IGNoYW5uZWxzIHRvIGdldCB0aGUgY2hhbm5lbCBpZHMuCj4gICAgICAgICBzYmlfbGlzdF9mb3Jf
ZWFjaF9lbnRyeShjaGFubmVsLCAmbXB4eV9jaGFubmVsX2xpc3QsIGhlYWQpIHsKPiArICAgICAg
ICAgICAgICAgaWYgKCFtcHh5X2NoYW5uZWxfdmlzaWJsZShjaGFubmVsLCBzYmlfZG9tYWluX3Ro
aXNoYXJ0X3B0cigpKSkKCk5JVDogWW91IGNhbiB1c2UgZG9tIGhlcmUgYWxzbyBpbnN0ZWFkIG9m
IHNiaV9kb21haW5fdGhpc2hhcnRfcHRyKCkKCj4gKyAgICAgICAgICAgICAgICAgICAgICAgY29u
dGludWU7Cj4gKwoKPgoKUXVlc3Rpb246IE5vdyBhIGRvbWFpbiBtYXkgaGF2ZSBhbGwgdGhlIGNo
YW5uZWxzIG93bmVkIGFuZCBhbm90aGVyIG1heSBoYXZlCm5vbmUsIHNpbmNlIE1QWFkgZXh0ZW5z
aW9uIHdpbGwgYmUgcmVnaXN0ZXJlZCBhbnl3YXlzLApzYmlfcHJvYmVfZXh0ZW5zaW9uKFNCSV9F
WFRfTVBYWSkKd2lsbCByZXR1cm4gYSBwcmVzZW50IGZvciB0aGUgZG9tYWluIHdoaWNoIGRvZXMg
bm90IG93biBhbnkgY2hhbm5lbHMuCklzIHRoaXMgaW50ZW5kZWQ/CgpUaGFua3MKUmFodWwKCi0t
IApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
