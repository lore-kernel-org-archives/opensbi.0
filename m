Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B02C5DF8C
	for <opensbi@archiver.kernel.org>; Mon, 24 Aug 2026 05:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sUywkJaGHBSfmfCMug9y2rtXPqFqSL/P9uUjp6j+kZs=; b=CAWcODFUkZ7NQP
	i0/Li3X35Xe3E2uvj0R0BT1BwvwYOeyeXtSq7rOIKiTj178K1878CQywvboK/MZ/ZZLwQGrjtjPVa
	k2fmH9YZ9lzCeT1iFeprCZTlPJ0qTtDFxlGKWNyQnJYvMHd6c9c5fQMKeMierA0AmuAKzDRB43Yfc
	keaT3US1qaxiC9zFf7PmS2eYsmtjQsl3J9q0vmt7NziydqVjNJ209kS566S2T7IPftWFqpAN39tD3
	Xu9qApEpfN+Fo8pC3tb/unkJ60UTukz2VfGEomoMgJu4Uk5d7dy8SH/IB11Gl+bBgo9GI9DXr09Jc
	Pt3BbBCaP9wbV5f4+9Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyNTO-0000000FweA-0uaf;
	Mon, 24 Aug 2026 05:43:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyNTK-0000000Fwdo-2I17
	for opensbi@lists.infradead.org;
	Mon, 24 Aug 2026 05:43:52 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5R9ri1937618
	for <opensbi@lists.infradead.org>; Mon, 24 Aug 2026 05:43:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AUZ6uMC69fzwdlk7gfvyC2IcvUgiSRsEe3a5wGzTtzk=; b=lZkwWD+oUfFAp+jC
	OCNrPZ2lHw45QpQbtF+p+hyUkCX8uzTA6/3BgTgS+sGXWxyRtIRuvsS0r77REGc+
	ztl7QbrZHJ08hvI5W9e7VdVgx9tYMy2aOzUEoVChySlXIvzbSu2759o3gz7GEugH
	WLOBq7qtCOJFlc6aHhluvFvdxaqY4b5ls2uE2dPRw9Sl17ZgOsLZXqOksCRZD4gh
	9ul1UNuPkvH898jnyXP5tmi6X8r3lUadXzoAOjLuwl869nJy+tEjbxMJ9WxGRpRL
	mee3naSkmCD6+RL4sDofODYKuQxDZpIuz/eMVOILnF4kUu6/CEgnj0ERxeucQehE
	xzotag==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g741qwh23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 24 Aug 2026 05:43:49 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-81eddfe28b4so71720827b3.3
        for <opensbi@lists.infradead.org>; Sun, 23 Aug 2026 22:43:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787550229; cv=none;
        d=google.com; s=arc-20260327;
        b=KwBJlZuwjG+2qr8wLgDZsp5t4ze1Usei3KDZcKvtmlYs0RRZiMyvqrYJKnmmPT1S9V
         UL/BRMaBENzMncpmVwejLH2Uuj4NAZqDCTlnRSYk4KqE9tMhUOG2Gs4NJUmr3e/1tzep
         zhVgtf690uJv4FkwAL9Y0rJDlAnip8AuK30ivDZMY2iajoj0WwoJLlYFab6J3iKo9rGc
         LjtwIwJrLM3anSe+2cutOcPh5AsRoWhzvmdKXQeB7BS2e2Ap+ZGi+ALjBW/KkHRnRfkR
         RcCCtupp+ePHoMMxOymyXVw68tirY2TbWVlPsCzBOoJDvYPTGaVdb+/oOGzpkccwoQwO
         MgOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AUZ6uMC69fzwdlk7gfvyC2IcvUgiSRsEe3a5wGzTtzk=;
        fh=q4o1TaSJghkK0OEKcMzSnmpcIOGXXY4v4d6T9e4pGCA=;
        b=PIE2PSWHrv9rXCGVMbYVVJVSzBjN6rMOfy9W7GbHxspag90v8rhZpna8jeS0mE+e0Q
         c4JZJT2MeSDc7jSDd09FivnNyzsYJ1xVgqrPCi+chG7y4Yhi2jrH/hohpXXzEzyI8lUz
         e5X0SUMw6vOlXcVcP5E5aC0gsC4tkKRNiqFqCOYJd21T2p/R80uh9wQfQiezp2PC0g7m
         jOssq/g7L/Abo1RSElLS3DzgxTdWA2/1qa33unxQegDkoUFHhCYFZ10lPPLKJtVwGzlH
         DyLjtoJXOrvhktq1Fze7NP9fAqJJyCcSCM13adEYazJXSKMUC/tdz0uUZHeiiYXuf0NA
         hnmQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787550229; x=1788155029; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AUZ6uMC69fzwdlk7gfvyC2IcvUgiSRsEe3a5wGzTtzk=;
        b=ajSqKN5+0VeM4E/hC63EXW96DZag21EQ9DjTTOncHTXT0H5ZN9FejOkUKh/zv+32UW
         yLxpEy95W4aAMtXRBjfjoYzsI0eBuknygBEEjKIypICSn0t8ITLd76ZwnoN/17JOt0bQ
         Cu7oXM2ztVa6V88TjW6PTKWtPf21tInFh1ruppQQfbMG0rs1ur2UOTDLTCtBOcIUVQGs
         XUzsacEhN5zsg8Jg/N6O8t/fPFYJYK/xQ917vJ1DKGmFpLDXFYVc2m8ikkiGxBQ/Wsg7
         2GFlBylzRlmQYokc8B5YrGCRHSouTQjNEG4s2HqEu9fQDrP6Ej880gfu5/eKh9n0VLjA
         w7hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787550229; x=1788155029;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AUZ6uMC69fzwdlk7gfvyC2IcvUgiSRsEe3a5wGzTtzk=;
        b=kxTyD7RsH8Xp5ok6xfqtUQrt4Nx8ak3Cwx1u06CKiIEpnaV7Hx8Jp0WSMa7VPKiIxX
         rZD7pWrDiDW5fepkIFDqMxIkALBJXTBqATpAfuQs8G4f/CcJzbGrDLF7ol9UH8q5xLYG
         jHOb+C1IuyUFNvvvgg58bmSmqmVHYw+oWtFXFY0JiPSrX7zs68RhV2AxBl2poV3bDAJf
         ugF7MhuHBXIuHGJBHhG5d1T5Jw0BHImjebgv0aMw36YdrBjA+77+55ev47EbWeunq9qd
         fr1+msCCTEARCTUfkycB589WIYEF73knsPlMQ+LW891g3joHeskHt4l7bOqDE5vX3jyv
         uumA==
X-Gm-Message-State: AFuF++kz/Rk1ViYt6UvVvON/ikAUeNCiZhzr0JlhZ+LTEYVIV0njk8Kw
	JFpG7vGZ9+mFnfICnkdWO+fwLevLDQIjFZvJCtJ7Zg0X05qwYzBx5RzeyqxmpmiSARGMmkvFfkE
	qRj/+hMl2gLoLOgwxtU5PvbDtuPZjSH8YlwzKteR21EfHwCV6ADbrIzcYKt1vrZA6hyIZ3TRnQP
	zqDxlWqrlG+KYckCsFUOaa1Al8Dc7rBz/fVsDx6CIEaTcQ5X+t
X-Gm-Gg: AR+sD113QzHxzpvRVaYQj1CDly20BG6l5cZVsij+e3gwyKDuPT1eVgNvHWiJHFcW7GJ
	eulxuakYeS2GDxEZtiNN1GSL21s5lYXOlX+kL5lOB752+u8D2vB0OlSQbGp6o+DQcDGWOL9BXXV
	ciggoVnJwz9926Lz6xIKkCrZ0ZfsnR/K3yjKOUl1SwsU8OIYIBBa3xzaH7xA==
X-Received: by 2002:a05:690c:e146:b0:830:7633:a1ab with SMTP id 00721157ae682-84c97c89720mr44660577b3.16.1787550228762;
        Sun, 23 Aug 2026 22:43:48 -0700 (PDT)
X-Received: by 2002:a05:690c:e146:b0:830:7633:a1ab with SMTP id
 00721157ae682-84c97c89720mr44660487b3.16.1787550228375; Sun, 23 Aug 2026
 22:43:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260824020953.2438946-1-rahul.pathak@oss.qualcomm.com>
 <20260824020953.2438946-5-rahul.pathak@oss.qualcomm.com> <CAPPZMLGtYDJG5mV0oHXghWYNsrAq1d4+HbR=LPxnL-UExBU5ng@mail.gmail.com>
In-Reply-To: <CAPPZMLGtYDJG5mV0oHXghWYNsrAq1d4+HbR=LPxnL-UExBU5ng@mail.gmail.com>
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:13:37 +0530
X-Gm-Features: AcwNN1WBrUtMeF2X2sVlmq6eDbe5fj_z7AL1qa75g8wWLzNn5v8F9lDyyOTP-6I
Message-ID: <CAFR3w37oDMSx1ixcAbHzEnDzE11YhLrYZC5j5QHeRuFy5cjZKA@mail.gmail.com>
Subject: Re: [RFC PATCH v4 4/4] lib: sbi: Initialize SMMPT during coldboot
To: Ranbir Singh <ranbir.singh@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, rahul.pathak@oss.qualcomm,
        rahul@summations.net
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA0OSBTYWx0ZWRfX7suMm5Seh9z4
 DR04t0hj61XFKflG63LmOZFFjc2sLOniEYdpZlzHeivwq1L1R/3sjQQuseRMgaE/aWwAndHeH37
 RWZ8oMF5JLLqNsmEM6g1fMpySy/NVYPVBd9SqXEtfCEp9GGdmy7r9+8PY0jeXBUeRCB1UGXSmV2
 J8asnjrwP9aqiYpNP32fozR4JqsJEqtwOb4Eyd+Vh4g5xHp5P52kH3C08xfjPSqUo+TalWkyzSe
 r+f5Tyb/TdRg4txbxBB/60CWv8zeYsszjvY/RTvqmUc1xgG1Liewgf6BuSbS1ugLjPk//cTk4zy
 v+MUiCQl+IxI+oB6vjH8GlUkbv3fPaSwKUAjU3fQ59xDA8mi9lMwozb1ory6/cFmFEtwWZVia78
 4sc/j+XHxa9tsr+drrUIKp9iWhlEb4ShSxQTMaC+WlMFjmfmt2kwPhNhJpOrRDXNMXKy5Sv4yDf
 maMAxwqShoUPuqoDJ4A==
X-Authority-Analysis: v=2.4 cv=GvNyPE1C c=1 sm=1 tr=0 ts=6a8bda15 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=ZXyd4MZ7hD6_gfokuEAA:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: mv6ja5C6SWJM3_6GWSI8VV9WCpHsy_zk
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA0OSBTYWx0ZWRfX9VLh3wSLpX0E
 njfIJh53+fyD/BEdn2Lx7A9ZoWRakFpTsybNQyQP9HxOGlIxlDBXxmUTIeYAMCiqKDUHPyXmvYd
 9eW0AUrm+mHwpFu6KBFDgtwfmopZj3k=
X-Proofpoint-GUID: mv6ja5C6SWJM3_6GWSI8VV9WCpHsy_zk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_224350_724739_33C72815 
X-CRM114-Status: GOOD (  27.63  )
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

T24gTW9uLCBBdWcgMjQsIDIwMjYgYXQgMTE6MDDigK9BTSBSYW5iaXIgU2luZ2gKPHJhbmJpci5z
aW5naEBvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgQXVnIDI0LCAyMDI2IGF0
IDc6NDHigK9BTSBSYWh1bCBQYXRoYWsKPiA8cmFodWwucGF0aGFrQG9zcy5xdWFsY29tbS5jb20+
IHdyb3RlOgo+ID4KPiA+IENhbGwgc2JpX21wdF9pbml0KCkgZnVuY3Rpb24gZnJvbSBjb2xkYm9v
dCBwYXRoIG9mCj4gPiBzYmlfaGFydF9pbml0KCkgdG8gaW5pdGlhbGl6ZSB0aGUgU01NUFQgY29y
ZS4gSXQgd2lsbAo+ID4gY3JlYXRlIGFuZCB0aGUgTVBUIHRhYmxlcyBmb3IgZWFjaCBTQkkgZG9t
YWluIGFuZCBtYXBzCj4gPiBpdHMgbWVtcmVnaW9ucyB3aXRoIGFwcHJvcHJpYXRlIHBlcm1pc3Np
b25zIGluIE1QVCB0YWJsZXMuCj4gPgo+ID4gQWxzbyBlYWNoIE1QVCB0YWJsZSByZXF1aXJlcyB0
byBtZW1vcnkgdG8gaW5zdGFsbCB0YWJsZXMKPiA+IHNvIHJlc2VydmUgbW9yZSBzcGFjZSBpbiBo
ZWFwIGZvciBNUFQgdGFibGVzCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogUmFodWwgUGF0aGFrIDxy
YWh1bC5wYXRoYWtAb3NzLnF1YWxjb21tLmNvbT4KPiA+IC0tLQo+ID4gIGxpYi9zYmkvc2JpX2hh
cnQuYyAgICAgICAgICB8IDggKysrKysrKy0KPiA+ICBwbGF0Zm9ybS9nZW5lcmljL3BsYXRmb3Jt
LmMgfCA5ICsrKysrKysrKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9oYXJ0LmMgYi9s
aWIvc2JpL3NiaV9oYXJ0LmMKPiA+IGluZGV4IDQyNjFmZWE4Li5jYzE4YjJjNSAxMDA2NDQKPiA+
IC0tLSBhL2xpYi9zYmkvc2JpX2hhcnQuYwo+ID4gKysrIGIvbGliL3NiaS9zYmlfaGFydC5jCj4g
PiBAQCAtMSw0ICsxLDQgQEAKPiA+IC0vKgo+ID4gKy8qc2JpX2hhcnQuCj4KPiBSUzogTG9va3Mg
bGlrZSB0aGlzIGlzIG1pc3Rha2VubHkgYWRkZWQuCgpZZXMsIHR5cG8sIHdpbGwgY29ycmVjdCBp
dAoKPgo+ID4gICAqIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBCU0QtMi1DbGF1c2UKPiA+ICAg
Kgo+ID4gICAqIENvcHlyaWdodCAoYykgMjAxOSBXZXN0ZXJuIERpZ2l0YWwgQ29ycG9yYXRpb24g
b3IgaXRzIGFmZmlsaWF0ZXMuCj4gPiBAQCAtMjEsNiArMjEsNyBAQAo+ID4gICNpbmNsdWRlIDxz
Ymkvc2JpX3BtdS5oPgo+ID4gICNpbmNsdWRlIDxzYmkvc2JpX3N0cmluZy5oPgo+ID4gICNpbmNs
dWRlIDxzYmkvc2JpX3RyYXAuaD4KPiA+ICsjaW5jbHVkZSA8c2JpL3NiaV9oYXJ0X21wdC5oPgo+
ID4KPiA+ICBleHRlcm4gdm9pZCBfX3NiaV9leHBlY3RlZF90cmFwKHZvaWQpOwo+ID4gIGV4dGVy
biB2b2lkIF9fc2JpX2V4cGVjdGVkX3RyYXBfaGV4dCh2b2lkKTsKPiA+IEBAIC03MzEsNiArNzMy
LDExIEBAIGludCBzYmlfaGFydF9pbml0KHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCwgYm9v
bCBjb2xkX2Jvb3QpCj4gPiAgICAgICAgICAgICAgICAgcmMgPSBzYmlfaGFydF9wbXBfaW5pdChz
Y3JhdGNoKTsKPiA+ICAgICAgICAgICAgICAgICBpZiAocmMpCj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICByZXR1cm4gcmM7Cj4gPiArCj4gPiArICAgICAgICAgICAgICAgLyogU21tcHQgaXMg
b3B0aW9uYWwuIENvbnRpbnVlIGlmIHRoZSBTbW1wdCBpcyBub3QgcHJlc2VudC4gKi8KPiA+ICsg
ICAgICAgICAgICAgICByYyA9IHNiaV9tcHRfaW5pdCgpOwo+ID4gKyAgICAgICAgICAgICAgIGlm
IChyYyAmJiByYyAhPSBTQklfRU5PREVWKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuIHJjOwo+ID4gICAgICAgICB9Cj4gPgo+ID4gICAgICAgICByZXR1cm4gc2JpX2hhcnRfcmVp
bml0KHNjcmF0Y2gpOwo+ID4gZGlmZiAtLWdpdCBhL3BsYXRmb3JtL2dlbmVyaWMvcGxhdGZvcm0u
YyBiL3BsYXRmb3JtL2dlbmVyaWMvcGxhdGZvcm0uYwo+ID4gaW5kZXggMWRmMDI4MGQuLmNjZjZm
NzU2IDEwMDY0NAo+ID4gLS0tIGEvcGxhdGZvcm0vZ2VuZXJpYy9wbGF0Zm9ybS5jCj4gPiArKysg
Yi9wbGF0Zm9ybS9nZW5lcmljL3BsYXRmb3JtLmMKPiA+IEBAIC00Miw2ICs0MiwxNSBAQCBzdGF0
aWMgdTMyIGZ3X3BsYXRmb3JtX2NhbGN1bGF0ZV9oZWFwX3NpemUodTMyIGhhcnRfY291bnQpCj4g
PiAgICAgICAgIC8qIEZvciBUTEIgZmlmbyAqLwo+ID4gICAgICAgICBoZWFwX3NpemUgKz0gU0JJ
X1RMQl9JTkZPX1NJWkUgKiAoaGFydF9jb3VudCkgKiAoaGFydF9jb3VudCk7Cj4gPgo+ID4gKyAg
ICAgICAvKgo+ID4gKyAgICAgICAgKiBNUFQgdGFibGUgYnVkZ2V0Cj4gPiArICAgICAgICAqIDEg
TWlCIG1lbW9yeSBmb3IgTVBUIGFsbG9jYXRlZCBjdXJyZW50bHkuCj4gPiArICAgICAgICAqCj4g
PiArICAgICAgICAqIFRPRE86IE5lZWQgYmV0dGVyIHdheSB0byBnZXQgdGhlIG1lbW9yeSBidWRn
ZXQgYmFzZWQgb24gYWN0aXZlCj4gPiArICAgICAgICAqIFNNTVBUIG1vZGUuCj4gPiArICAgICAg
ICAqLwo+ID4gKyAgICAgICBoZWFwX3NpemUgKz0gMTAyNCAqIDEwMjQ7Cj4KPiBSUzogU2VlIGlm
IGl0IGlzIGJldHRlciB0byBkZWZpbmUgYW5kIHVzZSBtYWNyb3MgaGVyZSBsaWtlCgpJIGFncmVl
LCB3aWxsIHVwZGF0ZQoKPiAgICAgICAgICNkZWZpbmUgTUIoeCkgICh4ICogMTAyNCAqIDEwMjQp
Cj4KPiAgICAgICAgIGhlYXBfc2l6ZSArPSBNQigxKQo+Cj4gPiArCj4gPiAgICAgICAgIHJldHVy
biBCSVRfQUxJR04oaGVhcF9zaXplLCBIRUFQX0JBU0VfQUxJR04pOwo+ID4gIH0KPiA+Cj4gPiAt
LQo+ID4gMi41My4wCj4gPgo+ID4KPiA+IC0tCj4gPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+ID4g
b3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVu
c2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9vcGVuc2JpCg==
