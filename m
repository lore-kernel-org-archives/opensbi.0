Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EDD8C44507
	for <opensbi@archiver.kernel.org>; Fri, 17 Jul 2026 08:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MX5ysrAdkfqZb0qOf4b7X1/L9jEzI+Qfdly8rjeN4dg=; b=JmTBJOSu+AnSOU
	vS3m8IASHWxmmZXzfYJyaOJzX4ZgOLrnD2hd+AO7/d7suKI+pWjc/aTJguzYyyF6LPit1VvNCUIeZ
	lTe+7MkavTAq16xoeIittfhOkbHv9PTCsK7K9X/AK6am/uKMiTnFKRRzruowWnv44vZ1a3pwUmXTF
	0dsmBZvKRk0Cvmlj3s7iRFWAJGR+KevbPXZb66hqaI9lPcGr5XRIfi53G13Zw1MMUiCCTs9k2gkHz
	vrJC5gjlTavWKVx0tIpbadkh2RDPF1m7hkBTeQRldstFLolWtP6eSPFsh9CsGwGv/qR1VJkp9+wXa
	AOnWRNvEwJ/dc4Uz7jVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdt9-00000001dAK-44Vj;
	Fri, 17 Jul 2026 08:25:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdt6-00000001dA7-3myC
	for opensbi@bombadil.infradead.org;
	Fri, 17 Jul 2026 08:25:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0/AiRwu2o7Ogw/grXaTDEjfHWfgdOi2/VDKDzf8kaz8=; b=c6cBLgI+6yLBHlkREMU6WguRWe
	E2p+e6IiAA+/eFks+ueRa33tx7Sn7xJA1WZrI+fVpKtFQi1CXzoNwVj3bXXuDNx3amsl7rco8W6B0
	iGvw1rGnnxj0aKi3th32HanG0GqjHF/uXBAAbHq70Tcry8PXv7wz4hh1UDWZ6QXZo/+2RLQ6mikd9
	Gzf1IG7eJK/UlW61PrCSsHrmsb6ojweNVPcatMvJSuyHGP9QIIArloPAH/dERxNgvk+XITokJ2HP0
	ofRv4FLYju6kev57WeIU5osWqn4oOtR8TpsTZS8De9ovx6haUSiX8qgLx4E5QODA+BHebns7B018L
	hZdyCcGw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wkdt3-0000000EfMO-1Rxx
	for opensbi@lists.infradead.org;
	Fri, 17 Jul 2026 08:25:39 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6civA1093146
	for <opensbi@lists.infradead.org>; Fri, 17 Jul 2026 08:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0/AiRwu2o7Ogw/grXaTDEjfHWfgdOi2/VDKDzf8kaz8=; b=Lp1LtR0immOFA9Qt
	0Y3hj3ovFJulSFIfHFPwnuAYGYeaaiAIC37c1wgnrEHsDHzt7z56YFVmjQ/3ZyFB
	tQ85q6LB3oV1cUcTQPH63IcI9cDp1hTXfVrXg2/xpYr0Ti4h5JnvHZZgx4OFX1vd
	gfAMaXajFoFQa5nsV/WVqmdKlvCKZyg8R+9GzOnewiwTrCht2CNrDht1sZv+kVe9
	Jk+xMdFR78bogpaDSgw2QR0jRJ5oWgvEi4/Qk5iUzU5cifv/WLPMpYLXq0Q4lVgS
	0hsD8YHP7/c/2jRmgRpEVs27iDabf89HL/WOxBTJQVhA16dNlgzppvHdkFr+Gt7Q
	xt4kyA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffe0urq7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Fri, 17 Jul 2026 08:25:32 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c9c26587e67so1863616a12.0
        for <opensbi@lists.infradead.org>; Fri, 17 Jul 2026 01:25:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784276731; cv=none;
        d=google.com; s=arc-20260327;
        b=iWVLBZYhboyVHq4sN6HzA9OaX9MLvAqXqdDzsBj8VjgCmRIsPrcYD4ZkO0dzEj3zWb
         ya3uGpMoHWd5KO7TShCmuxPUakzz34HZaBvLgMreuxLONtDnuEwki1wyvahQznE1vV+m
         QHurq8BO+79uz0L9vp/jkStzvo0WTH37TOjW7cAaNN8asUCU+PLCgt1ZRLQImUP/lV74
         ECTmwYxCM/7SB7yyEKh/xVlqfJD9r/gkPZT254hzh6+MgcnGU+xTLunurk3LleG52NGM
         PDr6XFIATFSkXkhRCe9HjsLPPcf706ng5NMCMf6r+S17aP7L8y5cEY6TLmGgUtjTXuaN
         ECVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0/AiRwu2o7Ogw/grXaTDEjfHWfgdOi2/VDKDzf8kaz8=;
        fh=KrYJhzZvIgXYjgi9IqeDq7QDVTAAX0EvLn/l70df43w=;
        b=KZw2rM1i1bptgQ64DgsLkoZp90iBqmHK2cK7cr2BwoImfaFn58gF5726vD9fN0lifR
         NLOpLdUZ36BMiXAGrXWb3bY7s4lzxPebLZIoxRmq6i6GWfMGOW/bcsjL+hH+gPcZpIPM
         Dkp4LhOtQPeNiQme4LDehxDhXBOV+vqJHxtUKYidQE2wGyowkL6kssNWtnyLWv/XCUGX
         JhCyAT/wjbpfvbAACznOUHY+3GMCt9hqvOwodP4SL6IsKrnXjY7LQTDhgPmWSfzv24Pr
         NBSHj0pg+GQmZgkVR/UjHu93yYU/elFC0aFap91nXeWXEFr38uC0eMayWcqK/2QCb55E
         r1yA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784276731; x=1784881531; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0/AiRwu2o7Ogw/grXaTDEjfHWfgdOi2/VDKDzf8kaz8=;
        b=UNjhUYIOU0cnrtOhNKaIFXe2JqQsj6A5qigxln2rb1aOuw4W684C0c6wzogMUQE+oU
         x9RZSGjMAr9+AKBjoX0agzN9q3ZlJZNmQCqLcg8H0fgfOTR8mpCC5NIQgH9wAh+KhY88
         zyGx0REuIL1d4/ZtThvtsl8p6167z5WKrNdt4R7OXZzvQiUDzobr8CGG/oxqW0BN/4V7
         zde2NHzgY3Gxp+lcNJn1gmThW/z0uPXX6IFqxHCmRAuz59v1D+OYU8YlO+1mhztj0PCK
         DXUAinvhcG9BNeUPifCJKE5DhD2OfdksLVdv3IocM0JN+b9iFoDUKqXUQ2A9NLnsR0z7
         LyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784276731; x=1784881531;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0/AiRwu2o7Ogw/grXaTDEjfHWfgdOi2/VDKDzf8kaz8=;
        b=Qzmf2iuf70+30rB4GcTdWoIKQEs1REhpi51ew7XmgzHqk3H8vlmRCTjg8V+uH0mcHa
         iufD0dUoDbIpAsA+5pUDIbnGMMPNwTKPxxqZIged8sbTFfApDFih/WneaFf4L8Wd4901
         mCrMh8pw86xa1SO6ssCRAoPtzOJ0AYwcPwy5Hm2NWtkfKGitOey+Mk2XtHO14YmTdsau
         od2cqini83rOpH/XwmtHbiVj9PUH8IPCiChOgqE1gU1oDVOAkIR2kkPBb+g0go0nV/DU
         ObIX9D2dVmHjyOwyegkd2WoRrSxp9rkeO2xmU4gSDvtekjGBTOeXNrXC4WxRXL5GoWcN
         XtCA==
X-Gm-Message-State: AOJu0YyRneILBVjeStxPSaS8AWoM8uiEaDn6PKgdVwe3JoH3sfPBxSby
	nzZXKjI+HWai03rR4yD1EggFP38I4FFkvJthSc+nyGfoxvSp8cIcDidb1QluJoi+amsbvcwFFKJ
	NzaacYA0NmBV4F8OU3HkBQqEgrR4xD1hY+ys4vH9z88yA+gTSAyUJJfTKP3G/TZYoufN52sj1SJ
	2xvJL4nZ5GEbV1l3M8M3wbM2q7TL183/+fYy2eVZdEap3x5PcT
X-Gm-Gg: AfdE7cmbFObx8Pc+mRGrb8bamUsfG2oyjocaWGGpCSEsd7yes/E/bHwr1aCbDtjsYH5
	UhdQlr1V8XNg1Qrq6gMe/WCONwcG4A0DjXlVw0QcPdylvc+kQUiup2kVJmoDLSw5OdB2UB5yY4h
	BJrAgculRmNWN0JOIw557/kclSbMpWj7kSUqBMFI4ec1nV0gwtUq0eKOoZBA==
X-Received: by 2002:a05:6a20:254:b0:3c3:80bc:1540 with SMTP id adf61e73a8af0-3c38d8cf127mr4389995637.3.1784276731271;
        Fri, 17 Jul 2026 01:25:31 -0700 (PDT)
X-Received: by 2002:a05:6a20:254:b0:3c3:80bc:1540 with SMTP id
 adf61e73a8af0-3c38d8cf127mr4389978637.3.1784276730797; Fri, 17 Jul 2026
 01:25:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260711201413.2931099-1-pawandeep.oza@oss.qualcomm.com> <20260711201413.2931099-4-pawandeep.oza@oss.qualcomm.com>
In-Reply-To: <20260711201413.2931099-4-pawandeep.oza@oss.qualcomm.com>
From: Anup Patel <anup.patel@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 13:55:18 +0530
X-Gm-Features: AUfX_myOIVSEtSxvFtEq2l7SxqqVnRY2hceT7Z4gEa3OWdAYRML5tzZApLW5RS4
Message-ID: <CABBgwmts8n=etoOD_yFJBw8=FA9LqshV5Eddvw_7UpVmGoc2Lw@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] lib: utils/irqchip/imsic: embed sbi_irqchip_device
 in imsic data
To: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org
X-Authority-Analysis: v=2.4 cv=deWwG3Xe c=1 sm=1 tr=0 ts=6a59e6fc cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=W-_n0kkjAAAA:8
 a=IVizPbnhZPznKyaG8H8A:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4MyBTYWx0ZWRfX00iZhgGI1nNq
 UUvxEzxlANgi85EitgBwS43DAfrV9rU34Ous+9OfLwLKBM6wQqEpayKiY+BkqXBKvmtwV6lr+pR
 W1onaSoC4QJfwHMQQSNOnU4D+EqwsbDVLxSbqBUecnDKQfoCPpLkZATejT8fed7bNxdZTJ0OJgv
 uFMzq5LTGFAjuezZWY+9kCeA05KfyZ6/BPS2esLenpE7dwfi99qBcRuNWOnAdeVkMY0ptFRx/pz
 Bpkv+/R5uQPj4jBRFyOCILmskC4b3yH74eX7jDHHRC6CP4nZcGvkWNn+usAMkFyoCZ3ipaolRAJ
 MWxhOk2D/5JdYDeZYkHI8WoojVOWTngJVFdXlJL0CTD8CHzr1i6attQT6uS1hknp8Of9ovV5rmm
 QAYpM/7KPNaZEy3UmhbPtmS28yxdqflAmAQmkkNGK9kOBU51HDSluQLnfUdWf3AXm2xZqVgxHvG
 nLHUubhf4uQJ1UGILVw==
X-Proofpoint-ORIG-GUID: r16eypZaeVQ5ObTrfQUB9WjRaBUbiUyM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4MyBTYWx0ZWRfXyQu4YzmXeL8b
 3pezSkUHMpKBRETnXozjStmGdL8sy3WBLKZMlXFOLQ+OMh31av4hEd8Io4IZGVNRU/dMrBTCHDy
 D3nJyeonbqDFXj2dCOKrbZQzZNOPEbs=
X-Proofpoint-GUID: r16eypZaeVQ5ObTrfQUB9WjRaBUbiUyM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_092537_912364_30D58271 
X-CRM114-Status: GOOD (  21.22  )
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
cC5vemFAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBFbWJlZCBzYmlfaXJxY2hpcF9kZXZp
Y2UgaW4gc3RydWN0IGltc2ljX2RhdGEgdG8gZW5hYmxlIGluc3RhbmNlLWJhc2VkCj4gaXJxY2hp
cCByZWdpc3RyYXRpb24sIHJlcGxhY2luZyB0aGUgcHJldmlvdXMgZ2xvYmFsIGltc2ljX2Rldmlj
ZQo+IHNpbmdsZXRvbi4gSW5jbHVkZSBzYmlfaXJxY2hpcC5oIGZyb20gaW1zaWMuaCB0byBtYWtl
IHRoZSBlbWJlZGRlZAo+IHN0cnVjdCB2aXNpYmxlIHRvIGNvbnN1bWVycy4KPgo+IFNpZ25lZC1v
ZmYtYnk6IE96YSBQYXdhbmRlZXAgPHBhd2FuZGVlcC5vemFAb3NzLnF1YWxjb21tLmNvbT4KCkxH
VE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClRoYW5r
cywKQW51cAoKPiAtLS0KPiAgaW5jbHVkZS9zYmlfdXRpbHMvaXJxY2hpcC9pbXNpYy5oIHwgIDIg
KysKPiAgbGliL3V0aWxzL2lycWNoaXAvaW1zaWMuYyAgICAgICAgIHwgMjUgKysrKysrKysrKysr
KysrKysrLS0tLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDcgZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zYmlfdXRpbHMvaXJxY2hpcC9pbXNp
Yy5oIGIvaW5jbHVkZS9zYmlfdXRpbHMvaXJxY2hpcC9pbXNpYy5oCj4gaW5kZXggODhkZDNjZmIu
LmZmYjYyZDM1IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvc2JpX3V0aWxzL2lycWNoaXAvaW1zaWMu
aAo+ICsrKyBiL2luY2x1ZGUvc2JpX3V0aWxzL2lycWNoaXAvaW1zaWMuaAo+IEBAIC0xMiw2ICsx
Miw3IEBACj4gICNkZWZpbmUgX19JUlFDSElQX0lNU0lDX0hfXwo+Cj4gICNpbmNsdWRlIDxzYmkv
c2JpX3R5cGVzLmg+Cj4gKyNpbmNsdWRlIDxzYmkvc2JpX2lycWNoaXAuaD4KPgo+ICAjZGVmaW5l
IElNU0lDX01NSU9fUEFHRV9TSElGVCAgICAgICAgICAxMgo+ICAjZGVmaW5lIElNU0lDX01NSU9f
UEFHRV9TWiAgICAgICAgICAgICAoMVVMIDw8IElNU0lDX01NSU9fUEFHRV9TSElGVCkKPiBAQCAt
MjQsNiArMjUsNyBAQCBzdHJ1Y3QgaW1zaWNfcmVncyB7Cj4gIH07Cj4KPiAgc3RydWN0IGltc2lj
X2RhdGEgewo+ICsgICAgICAgc3RydWN0IHNiaV9pcnFjaGlwX2RldmljZSBpcnFjaGlwOwo+ICAg
ICAgICAgdTMyIHVuaXF1ZV9pZDsKPiAgICAgICAgIGJvb2wgdGFyZ2V0c19tbW9kZTsKPiAgICAg
ICAgIHUzMiBndWVzdF9pbmRleF9iaXRzOwo+IGRpZmYgLS1naXQgYS9saWIvdXRpbHMvaXJxY2hp
cC9pbXNpYy5jIGIvbGliL3V0aWxzL2lycWNoaXAvaW1zaWMuYwo+IGluZGV4IDBlN2YzZTZiLi4y
YWJkYzhlZiAxMDA2NDQKPiAtLS0gYS9saWIvdXRpbHMvaXJxY2hpcC9pbXNpYy5jCj4gKysrIGIv
bGliL3V0aWxzL2lycWNoaXAvaW1zaWMuYwo+IEBAIC0xNDksOCArMTQ5LDEzIEBAIGludCBpbXNp
Y19nZXRfdGFyZ2V0X2ZpbGUodTMyIGhhcnRpbmRleCkKPgo+ICBzdGF0aWMgaW50IGltc2ljX3By
b2Nlc3NfaHdpcnFzKHN0cnVjdCBzYmlfaXJxY2hpcF9kZXZpY2UgKmNoaXApCj4gIHsKPiArICAg
ICAgIHN0cnVjdCBpbXNpY19kYXRhICppbXNpYzsKPiAgICAgICAgIHVsb25nIG1pcnE7Cj4KPiAr
ICAgICAgIGltc2ljID0gY29udGFpbmVyX29mKGNoaXAsIHN0cnVjdCBpbXNpY19kYXRhLCBpcnFj
aGlwKTsKPiArICAgICAgIGlmICghaW1zaWMgfHwgIWltc2ljLT50YXJnZXRzX21tb2RlKQo+ICsg
ICAgICAgICAgICAgICByZXR1cm4gU0JJX0VJTlZBTDsKPiArCj4gICAgICAgICB3aGlsZSAoKG1p
cnEgPSBjc3Jfc3dhcChDU1JfTVRPUEVJLCAwKSkpIHsKPiAgICAgICAgICAgICAgICAgbWlycSA9
IChtaXJxID4+IElNU0lDX1RPUEVJX0lEX1NISUZUKTsKPgo+IEBAIC0yNTgsMTAgKzI2MywxNSBA
QCB2b2lkIGltc2ljX2xvY2FsX2lycWNoaXBfaW5pdCh2b2lkKQo+Cj4gIHN0YXRpYyBpbnQgaW1z
aWNfd2FybV9pcnFjaGlwX2luaXQoc3RydWN0IHNiaV9pcnFjaGlwX2RldmljZSAqZGV2KQo+ICB7
Cj4gLSAgICAgICBzdHJ1Y3QgaW1zaWNfZGF0YSAqaW1zaWMgPSBpbXNpY19nZXRfZGF0YShjdXJy
ZW50X2hhcnRpbmRleCgpKTsKPiArICAgICAgIHN0cnVjdCBpbXNpY19kYXRhICppbXNpYzsKPiAr
ICAgICAgIHN0cnVjdCBpbXNpY19kYXRhICpoYXJ0X2ltc2ljOwo+ICsKPiArICAgICAgIGltc2lj
ID0gY29udGFpbmVyX29mKGRldiwgc3RydWN0IGltc2ljX2RhdGEsIGlycWNoaXApOwo+ICsgICAg
ICAgaGFydF9pbXNpYyA9IGltc2ljX2dldF9kYXRhKGN1cnJlbnRfaGFydGluZGV4KCkpOwo+Cj4g
ICAgICAgICAvKiBTYW5pdHkgY2hlY2tzICovCj4gLSAgICAgICBpZiAoIWltc2ljIHx8ICFpbXNp
Yy0+dGFyZ2V0c19tbW9kZSkKPiArICAgICAgIGlmICghaGFydF9pbXNpYyB8fCBoYXJ0X2ltc2lj
ICE9IGltc2ljIHx8Cj4gKyAgICAgICAgICAgICAgICFoYXJ0X2ltc2ljLT50YXJnZXRzX21tb2Rl
KQo+ICAgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VJTlZBTDsKPgo+ICAgICAgICAgLyogRGlz
YWJsZSBhbGwgaW50ZXJydXB0cyAqLwo+IEBAIC0zOTksMTYgKzQwOSwxNyBAQCBpbnQgaW1zaWNf
Y29sZF9pcnFjaGlwX2luaXQoc3RydWN0IGltc2ljX2RhdGEgKmltc2ljKQo+ICAgICAgICAgfQo+
Cj4gICAgICAgICAvKiBSZWdpc3RlciBpcnFjaGlwIGRldmljZSAqLwo+IC0gICAgICAgaW1zaWNf
ZGV2aWNlLmlkID0gaW1zaWMtPnVuaXF1ZV9pZDsKPiArICAgICAgIGltc2ljLT5pcnFjaGlwID0g
aW1zaWNfZGV2aWNlOwo+ICsgICAgICAgaW1zaWMtPmlycWNoaXAuaWQgPSBpbXNpYy0+dW5pcXVl
X2lkOwo+ICAgICAgICAgaW1zaWNfZGV2aWNlLmNhcHMgPSBTQklfSVJRQ0hJUF9DQVBTX01TSTsK
PiAtICAgICAgIGltc2ljX2RldmljZS5udW1faHdpcnEgPSBpbXNpYy0+bnVtX2lkcyArIDE7Cj4g
LSAgICAgICBzYmlfaGFydG1hc2tfc2V0X2FsbCgmaW1zaWNfZGV2aWNlLnRhcmdldF9oYXJ0cyk7
Cj4gLSAgICAgICByYyA9IHNiaV9pcnFjaGlwX2FkZF9kZXZpY2UoJmltc2ljX2RldmljZSk7Cj4g
KyAgICAgICBpbXNpYy0+aXJxY2hpcC5udW1faHdpcnEgPSBpbXNpYy0+bnVtX2lkcyArIDE7Cj4g
KyAgICAgICBzYmlfaGFydG1hc2tfc2V0X2FsbCgmaW1zaWMtPmlycWNoaXAudGFyZ2V0X2hhcnRz
KTsKPiArICAgICAgIHJjID0gc2JpX2lycWNoaXBfYWRkX2RldmljZSgmaW1zaWMtPmlycWNoaXAp
Owo+ICAgICAgICAgaWYgKHJjKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gcmM7Cj4KPiAgICAg
ICAgIC8qIE1hcmsgaHdpcnEgMCBhbmQgSVBJIGh3aXJxIGFzIHJlc2VydmVkICovCj4gLSAgICAg
ICByYyA9IHNiaV9pcnFjaGlwX3JlZ2lzdGVyX3Jlc2VydmVkKCZpbXNpY19kZXZpY2UsIDAsIElN
U0lDX0lQSV9JRCArIDEpOwo+ICsgICAgICAgcmMgPSBzYmlfaXJxY2hpcF9yZWdpc3Rlcl9yZXNl
cnZlZCgmaW1zaWMtPmlycWNoaXAsIDAsIElNU0lDX0lQSV9JRCArIDEpOwo+ICAgICAgICAgaWYg
KHJjKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gcmM7Cj4KPiAtLQo+IDIuNDMuMAo+Cj4KPiAt
LQo+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4g
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCgotLSAK
b3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
