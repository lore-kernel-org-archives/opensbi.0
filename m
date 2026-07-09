Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190DDC44501
	for <opensbi@archiver.kernel.org>; Thu,  9 Jul 2026 04:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nLAdQwAD20RvfbGM8gKpNvyqaGrDZqfupIgfblom/m0=; b=B4ZXCN7J1PKW8O
	PKtEsBTkHMC08vGSn9P4Je0GMFRRb9V86CDm3/+2A5d5wvYnxEZS/j94Yj7gFZQwlTx96LlI6198B
	y2gEv81eYTrBYzWkd+tBCiCR6orwucCqEpORSQeHIpi+de6/hangOWHtxK3rqTKQMOWN08jOo1r+X
	Cc5SEXBpNkRHFjNE50XLt47Uiek39gp5itpdzTadVzClZ3nP/0o2w0FPkjNGqgE6to57OtcVRuSP8
	Am3Hkoajn3kOsbBltkxnggxRF4l1dWXQZF1xYoHfgYwfrfLhgpvBG8IcJAQ52lbZGiihpwqtE+ziF
	2zPOC6RbZk1kMETXg53g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whgOk-00000000zc2-3KeD;
	Thu, 09 Jul 2026 04:30:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whgOh-00000000zbf-3fiu
	for opensbi@lists.infradead.org;
	Thu, 09 Jul 2026 04:30:05 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668N8xmh038229
	for <opensbi@lists.infradead.org>; Thu, 9 Jul 2026 04:30:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0tCdTwYmDPMxNKyVFo6J6MO5KIc1iBiak/n7Uzuc8So=; b=fuPVMK2Q0OT0u/8E
	NKsIAETon3pnYaLFmPJsLiP5a9lqYWt5ub0Fp1ovaNm9JzepsnOwLVpY9uAltOCA
	AOAMClTg6OtSv1sZzEi1b+v8jQOkGtKi0Y5d7eXp+7ifN12Wp5Wdr0cXkelkdhf7
	M4hKUTb6KR0tmktHkKfJaLKLmb6BsKQ5W2O4kEmbhmz7qy685NQWRy1WEK63yzqL
	fofwWkV1IXFS1T5/9DemJz2mOFUduiBpkEIBcIXztLn2E6NET5h6vYh3r4IXc5Y2
	ZWAmDifnl4icLN72S+rzKHvdG196eS5BZ4zSJya1Z43TtPMjVcIgiihU3rHEdvQ1
	qAbj2w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9ug6hv0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Thu, 09 Jul 2026 04:30:02 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c89704da8c7so1070648a12.0
        for <opensbi@lists.infradead.org>; Wed, 08 Jul 2026 21:30:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783571401; cv=none;
        d=google.com; s=arc-20260327;
        b=R4sSmfoWPfkrkPRscJeV1y1LnT24ewhEnJVurvcqJlVB9uft85TvnQqooYjcgf2y6Y
         Gjcy+/5IThp5B2wsxAX8GSeC1cg1sa5pTMK+TdCGUHVgLxKcu1BId3oFHY/oQgZVFOmP
         WpeupSEuLBJ9zMRpRLqQbt11bXe6gkHc2EjNSxWFMJXEORSK85yfamS4qFIKqu0jbpv5
         2/BQdWuODz6AyilNpSNsdztBHixM3NJiqeApBpYlJ7W5Hw8ivEdG/UbXUH6cvTOpVabA
         zKhj+e6KQpfnCF+zfehBOQqwkPBYRn+6M37885Q58MhnZ31XFuh3owwObcHODBUsPskm
         tWFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0tCdTwYmDPMxNKyVFo6J6MO5KIc1iBiak/n7Uzuc8So=;
        fh=KrYJhzZvIgXYjgi9IqeDq7QDVTAAX0EvLn/l70df43w=;
        b=WrQfTt1QgU4WwKs8qvbJxc0xdjgC5E03/9cquGH2yLxbW8O7sj9jlTB2a4KCdq0Ff9
         5b3uQ1JDwemDMIZtxf4tdBdf7MyOSYKlgEmzuVIDK/hozyiJQcTDubMyyH+NB20LLpuW
         YvFsHEy1uACYDg6InzjGlG7tDl5OH++kgQ1A9Fo6u+rbyT1EgIwZyIs6emxhL61pHl8u
         DFeAYxHx+FnQgOnga62MtN0OGxCmhjnCLYugggJFo7DNHZ6mB0gf4MQn5A+Z0wKujGhU
         FSdw3UIvwxWxT2Erhy4yAnpUVLS8tLwE89u17zBxhnOre9oPQBZUYz26DOKvbWXq/Zmo
         mVpw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783571401; x=1784176201; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0tCdTwYmDPMxNKyVFo6J6MO5KIc1iBiak/n7Uzuc8So=;
        b=KDzbWqIC1XHrulbnGOErak3jyIUTxtKCHJJoOiWH3sgeQm7P2kw7USe9gyo5Kpp8b1
         PGBYUXglAYfXhp8XC1RxRxUAvbxWPaI6K6Vpmzo2lu5Y4awjhrrkwWrogEonFUTDRrXM
         z3TqHPpojbo66YDPoUZPBFhesj/4U0KR+/ZAW0ra20FkRjxZDiHw5sZVVxftk3MZ5WZI
         Dk09YzW2zD5jfiOQ/5peRQaxrOsrsgyjZLL8rWAu6eyRIBSfTLFOhiuLadJOSiqVvixM
         aeQJLvLZxjDEugbGn653U81crX6jLHTyRJhddKKaitqm9XFOLhS80sZU71gM7Z1cn75q
         5eZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783571401; x=1784176201;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0tCdTwYmDPMxNKyVFo6J6MO5KIc1iBiak/n7Uzuc8So=;
        b=A5g1AZSKM3iHDimaUIHntb7o9wbeAYzLWIWoBGZOuvIn5V6+qsfg42eHrgXB8bRL5k
         FslysnxtOMd9w6Qo3LudCy9P6YXKLGRUzs/D7dKHZR/22yPCuC9vzhpgU1Ft5pZ+IoKW
         5mGxKIWUs1dzQn3YhCksdALIJZoGeuFFI97iF4FN7U2IREGjGeQoei/zm80V1Ic3aGkx
         9ddpKxx7KCYG7smQ7J293G9tQcejKREppEPd6NSoowu4JlKDPKdCGrzC9lDbt6zSlAK/
         rsQ1WhU+2giDs9s8RwHD4LzFfA+bvAvm6oQTkmiUolhOhbYn/j64L58Xm08aeEDmVpSy
         Wnww==
X-Gm-Message-State: AOJu0Yy5fCf+bdNW5iVrw5gTF8gOu4OvLBezks2GOEJXhJ6h2eqIJHM3
	BHWB0XmBsJh9LRdI14PJ43U6Bd4G0X1Y4LzfNTaK93HJ8ICXanWw37m1iNbpagHA2yOxLe3RPok
	q2hFaAzxM1Wr1u7zOMDOFKi5reyYGoUG975B7puGk570IjF3eBDpaDqSCM3r5zUcgZ28D67j4sS
	vQK/WEnRrkBdzfebs17KaOtfA5RWZ/r40yUET4lNZC
X-Gm-Gg: AfdE7cmTfZTaYtkzvCjVAiYGTN/c9QVAPv9A6ydobvknQt8djVNJB9yHeDyLrxVXQE+
	LUoxCeRvHxbgXMJMo+Xpv+W1o5lQfiuCsl6uzlRFCC8JeHcHxi0ZXpTHIuav8OLER72ns2Ezkk4
	k8f+LQ4ZV7vJbl74YTakRFWeMQudbgLofIoZ5tHnrT10JuiJSf1SdS4cxK9cHlhzbSnkKV
X-Received: by 2002:a05:6a20:4304:b0:3b4:b2d7:c146 with SMTP id adf61e73a8af0-3c0bcc5af6amr6863997637.21.1783571401400;
        Wed, 08 Jul 2026 21:30:01 -0700 (PDT)
X-Received: by 2002:a05:6a20:4304:b0:3b4:b2d7:c146 with SMTP id
 adf61e73a8af0-3c0bcc5af6amr6863967637.21.1783571400974; Wed, 08 Jul 2026
 21:30:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260617184047.70388-1-pawandeep.oza@oss.qualcomm.com> <20260617184047.70388-4-pawandeep.oza@oss.qualcomm.com>
In-Reply-To: <20260617184047.70388-4-pawandeep.oza@oss.qualcomm.com>
From: Anup Patel <anup.patel@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 09:59:49 +0530
X-Gm-Features: AUfX_mzsGr4rP6HINhxO6ElbH2aQUicdHdpzVo0tX0-V4Gx4r6MAFm3p62j8hRk
Message-ID: <CABBgwmsYOHK7twXEpfXs72graLLz8HhADqMDp+-S=OiOX-M7bw@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] lib: utils/irqchip/imsic: embed sbi_irqchip_device
 in imsic data
To: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDAzOSBTYWx0ZWRfX1QelzScAHJ1+
 jDENeoZ3du3oR+AALUCsI/nHVrMIgtqzShqhu98TnPpVKRvgUYVIrCQX2/17kv1W/sUW0PDc92O
 NOeG7U4034cIBfIZJS2TchrKL4RIgEU=
X-Proofpoint-GUID: cOJFB9A4_2jVJuj9_DEtUOtrVlauz2lu
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a4f23ca cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=W-_n0kkjAAAA:8
 a=IVizPbnhZPznKyaG8H8A:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-ORIG-GUID: cOJFB9A4_2jVJuj9_DEtUOtrVlauz2lu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDAzOSBTYWx0ZWRfX1diNmNL9odnF
 K8tqyhXWeo/W/evO2NEav6n0d/hpC9OYrBErI67xyVrRks2fl1GlNsO7BSgI5LPaOqaipIpSCQr
 WQaM9XGMu6tL0wsI6UyUhcMoDRJ1Rg7H7B5D20QvlEFJWX0V19xeF5tla7lD5POgKfYg12RAC92
 fZDcOnEfYoFSKPqvUcXn6wsie4SwMNwqIzCFYZ/EjtrqqoHM2/4S6nEpPsJ9IGAFRXP2DhIj69k
 kjAyDQoJFaDe3YMrI5unwPkhiAVKl4wYKwyo4AZQE194lh1Tv1xtTRj79pTdSZrndAOEU4SK5mx
 6h/W5ykMl0K7JZYfYa2paLMf2leizu2tXjDP5IUQkJUKBjUpuYDzaLipaHCWnGzodtxFyz3E04Y
 CRjaJAz4cWStuFCo2OCjEb1Fogt5icxDRdvEdP+WS6nLFGwL45E1AY3wm0st92vF1HFi671lTml
 KfXGKLREb0hqA0WOcQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_05,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_213004_039784_8E2CBE25 
X-CRM114-Status: GOOD (  23.37  )
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

T24gVGh1LCBKdW4gMTgsIDIwMjYgYXQgMTI6MTbigK9BTSBQYXdhbmRlZXAgT3phCjxwYXdhbmRl
ZXAub3phQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gRW1iZWQgc2JpX2lycWNoaXBfZGV2
aWNlIGluIHN0cnVjdCBpbXNpY19kYXRhIHRvIGVuYWJsZSBpbnN0YW5jZS1iYXNlZAo+IGlycWNo
aXAgcmVnaXN0cmF0aW9uLCByZXBsYWNpbmcgdGhlIHByZXZpb3VzIGdsb2JhbCBpbXNpY19kZXZp
Y2UKPiBzaW5nbGV0b24uIEluY2x1ZGUgc2JpX2lycWNoaXAuaCBmcm9tIGltc2ljLmggdG8gbWFr
ZSB0aGUgZW1iZWRkZWQKPiBzdHJ1Y3QgdmlzaWJsZSB0byBjb25zdW1lcnMuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBPemEgUGF3YW5kZWVwIDxwYXdhbmRlZXAub3phQG9zcy5xdWFsY29tbS5jb20+Cj4g
LS0tCj4gIGluY2x1ZGUvc2JpX3V0aWxzL2lycWNoaXAvaW1zaWMuaCB8ICAyICsrCj4gIGxpYi91
dGlscy9pcnFjaGlwL2ltc2ljLmMgICAgICAgICB8IDI1ICsrKysrKysrKysrKysrKysrKy0tLS0t
LS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpX3V0aWxzL2lycWNoaXAvaW1zaWMuaCBiL2luY2x1
ZGUvc2JpX3V0aWxzL2lycWNoaXAvaW1zaWMuaAo+IGluZGV4IDg4ZGQzY2ZiLi4xOTEwYjYyYSAx
MDA2NDQKPiAtLS0gYS9pbmNsdWRlL3NiaV91dGlscy9pcnFjaGlwL2ltc2ljLmgKPiArKysgYi9p
bmNsdWRlL3NiaV91dGlscy9pcnFjaGlwL2ltc2ljLmgKPiBAQCAtMTIsNiArMTIsNyBAQAo+ICAj
ZGVmaW5lIF9fSVJRQ0hJUF9JTVNJQ19IX18KPgo+ICAjaW5jbHVkZSA8c2JpL3NiaV90eXBlcy5o
Pgo+ICsjaW5jbHVkZSA8c2JpL3NiaV9pcnFjaGlwLmg+Cj4KPiAgI2RlZmluZSBJTVNJQ19NTUlP
X1BBR0VfU0hJRlQgICAgICAgICAgMTIKPiAgI2RlZmluZSBJTVNJQ19NTUlPX1BBR0VfU1ogICAg
ICAgICAgICAgKDFVTCA8PCBJTVNJQ19NTUlPX1BBR0VfU0hJRlQpCj4gQEAgLTI1LDYgKzI2LDcg
QEAgc3RydWN0IGltc2ljX3JlZ3Mgewo+Cj4gIHN0cnVjdCBpbXNpY19kYXRhIHsKPiAgICAgICAg
IHUzMiB1bmlxdWVfaWQ7Cj4gKyAgICAgICBzdHJ1Y3Qgc2JpX2lycWNoaXBfZGV2aWNlIGlycWNo
aXA7CgpNaW5vciBuaXQ6IG1ha2UgdGhpcyBhcyBmaXJzdCBtZW1iZXIgb2Ygc3RydWN0IGltc2lj
X2RhdGEKCj4gICAgICAgICBib29sIHRhcmdldHNfbW1vZGU7Cj4gICAgICAgICB1MzIgZ3Vlc3Rf
aW5kZXhfYml0czsKPiAgICAgICAgIHUzMiBoYXJ0X2luZGV4X2JpdHM7Cj4gZGlmZiAtLWdpdCBh
L2xpYi91dGlscy9pcnFjaGlwL2ltc2ljLmMgYi9saWIvdXRpbHMvaXJxY2hpcC9pbXNpYy5jCj4g
aW5kZXggMGU3ZjNlNmIuLjJhYmRjOGVmIDEwMDY0NAo+IC0tLSBhL2xpYi91dGlscy9pcnFjaGlw
L2ltc2ljLmMKPiArKysgYi9saWIvdXRpbHMvaXJxY2hpcC9pbXNpYy5jCj4gQEAgLTE0OSw4ICsx
NDksMTMgQEAgaW50IGltc2ljX2dldF90YXJnZXRfZmlsZSh1MzIgaGFydGluZGV4KQo+Cj4gIHN0
YXRpYyBpbnQgaW1zaWNfcHJvY2Vzc19od2lycXMoc3RydWN0IHNiaV9pcnFjaGlwX2RldmljZSAq
Y2hpcCkKPiAgewo+ICsgICAgICAgc3RydWN0IGltc2ljX2RhdGEgKmltc2ljOwo+ICAgICAgICAg
dWxvbmcgbWlycTsKPgo+ICsgICAgICAgaW1zaWMgPSBjb250YWluZXJfb2YoY2hpcCwgc3RydWN0
IGltc2ljX2RhdGEsIGlycWNoaXApOwo+ICsgICAgICAgaWYgKCFpbXNpYyB8fCAhaW1zaWMtPnRh
cmdldHNfbW1vZGUpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBTQklfRUlOVkFMOwo+ICsKPiAg
ICAgICAgIHdoaWxlICgobWlycSA9IGNzcl9zd2FwKENTUl9NVE9QRUksIDApKSkgewo+ICAgICAg
ICAgICAgICAgICBtaXJxID0gKG1pcnEgPj4gSU1TSUNfVE9QRUlfSURfU0hJRlQpOwo+Cj4gQEAg
LTI1OCwxMCArMjYzLDE1IEBAIHZvaWQgaW1zaWNfbG9jYWxfaXJxY2hpcF9pbml0KHZvaWQpCj4K
PiAgc3RhdGljIGludCBpbXNpY193YXJtX2lycWNoaXBfaW5pdChzdHJ1Y3Qgc2JpX2lycWNoaXBf
ZGV2aWNlICpkZXYpCj4gIHsKPiAtICAgICAgIHN0cnVjdCBpbXNpY19kYXRhICppbXNpYyA9IGlt
c2ljX2dldF9kYXRhKGN1cnJlbnRfaGFydGluZGV4KCkpOwo+ICsgICAgICAgc3RydWN0IGltc2lj
X2RhdGEgKmltc2ljOwo+ICsgICAgICAgc3RydWN0IGltc2ljX2RhdGEgKmhhcnRfaW1zaWM7Cj4g
Kwo+ICsgICAgICAgaW1zaWMgPSBjb250YWluZXJfb2YoZGV2LCBzdHJ1Y3QgaW1zaWNfZGF0YSwg
aXJxY2hpcCk7Cj4gKyAgICAgICBoYXJ0X2ltc2ljID0gaW1zaWNfZ2V0X2RhdGEoY3VycmVudF9o
YXJ0aW5kZXgoKSk7Cj4KPiAgICAgICAgIC8qIFNhbml0eSBjaGVja3MgKi8KPiAtICAgICAgIGlm
ICghaW1zaWMgfHwgIWltc2ljLT50YXJnZXRzX21tb2RlKQo+ICsgICAgICAgaWYgKCFoYXJ0X2lt
c2ljIHx8IGhhcnRfaW1zaWMgIT0gaW1zaWMgfHwKPiArICAgICAgICAgICAgICAgIWhhcnRfaW1z
aWMtPnRhcmdldHNfbW1vZGUpCj4gICAgICAgICAgICAgICAgIHJldHVybiBTQklfRUlOVkFMOwo+
Cj4gICAgICAgICAvKiBEaXNhYmxlIGFsbCBpbnRlcnJ1cHRzICovCj4gQEAgLTM5OSwxNiArNDA5
LDE3IEBAIGludCBpbXNpY19jb2xkX2lycWNoaXBfaW5pdChzdHJ1Y3QgaW1zaWNfZGF0YSAqaW1z
aWMpCj4gICAgICAgICB9Cj4KPiAgICAgICAgIC8qIFJlZ2lzdGVyIGlycWNoaXAgZGV2aWNlICov
Cj4gLSAgICAgICBpbXNpY19kZXZpY2UuaWQgPSBpbXNpYy0+dW5pcXVlX2lkOwo+ICsgICAgICAg
aW1zaWMtPmlycWNoaXAgPSBpbXNpY19kZXZpY2U7Cj4gKyAgICAgICBpbXNpYy0+aXJxY2hpcC5p
ZCA9IGltc2ljLT51bmlxdWVfaWQ7Cj4gICAgICAgICBpbXNpY19kZXZpY2UuY2FwcyA9IFNCSV9J
UlFDSElQX0NBUFNfTVNJOwo+IC0gICAgICAgaW1zaWNfZGV2aWNlLm51bV9od2lycSA9IGltc2lj
LT5udW1faWRzICsgMTsKPiAtICAgICAgIHNiaV9oYXJ0bWFza19zZXRfYWxsKCZpbXNpY19kZXZp
Y2UudGFyZ2V0X2hhcnRzKTsKPiAtICAgICAgIHJjID0gc2JpX2lycWNoaXBfYWRkX2RldmljZSgm
aW1zaWNfZGV2aWNlKTsKPiArICAgICAgIGltc2ljLT5pcnFjaGlwLm51bV9od2lycSA9IGltc2lj
LT5udW1faWRzICsgMTsKPiArICAgICAgIHNiaV9oYXJ0bWFza19zZXRfYWxsKCZpbXNpYy0+aXJx
Y2hpcC50YXJnZXRfaGFydHMpOwo+ICsgICAgICAgcmMgPSBzYmlfaXJxY2hpcF9hZGRfZGV2aWNl
KCZpbXNpYy0+aXJxY2hpcCk7Cj4gICAgICAgICBpZiAocmMpCj4gICAgICAgICAgICAgICAgIHJl
dHVybiByYzsKPgo+ICAgICAgICAgLyogTWFyayBod2lycSAwIGFuZCBJUEkgaHdpcnEgYXMgcmVz
ZXJ2ZWQgKi8KPiAtICAgICAgIHJjID0gc2JpX2lycWNoaXBfcmVnaXN0ZXJfcmVzZXJ2ZWQoJmlt
c2ljX2RldmljZSwgMCwgSU1TSUNfSVBJX0lEICsgMSk7Cj4gKyAgICAgICByYyA9IHNiaV9pcnFj
aGlwX3JlZ2lzdGVyX3Jlc2VydmVkKCZpbXNpYy0+aXJxY2hpcCwgMCwgSU1TSUNfSVBJX0lEICsg
MSk7Cj4gICAgICAgICBpZiAocmMpCj4gICAgICAgICAgICAgICAgIHJldHVybiByYzsKPgo+IC0t
Cj4gMi40My4wCj4KPgo+IC0tCj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3Rz
LmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL29wZW5zYmkKCk90aGVyd2lzZSwgdGhpcyBsb29rcyBnb29kIHRvIG1lLgoKUmV2aWV3ZWQt
Ynk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpUaGFua3MsCkFudXAKCi0tIApv
cGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
