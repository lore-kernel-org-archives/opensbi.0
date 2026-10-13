Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A961CC6B12
	for <opensbi@archiver.kernel.org>; Tue, 13 Oct 2026 19:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rBy+nOirTM/HyqFyZTp6yY/S3cYvDRookqFEB4vOpxU=; b=W+/PJNNQzhGkTt
	9tRGDUUg8Wcfc3fbKf+TlCmxZm0UhA04+C5Jdp5R3bu/qnR8INFjOLbqrmQvoaMnztM/utu2WjPVF
	Rvn0gwlvEuIEyeBgy6JObovYEtnzyBDsQGlNgp0PBGVOpVR7C7HcbtiOh6deSuHzX9o+doayUdnFm
	HykMXpYNU/VctGALiB/tlPkfmzbHIrsa9WF7V/hnGBiXf6nsNNvStrkFeE+mEooww2iSMZCCytuWc
	+UxuhJHjDS/2gtOYS1q0TR082GWMWvWD4SQd5HiQ3Px5fDFJJHuOvUMnIPjf9hyY82es4Kl9Hb1a8
	cU9JHd0K4p2y+ZvotH/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGiTt-0000000DxNn-0zKl;
	Tue, 13 Oct 2026 19:48:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGiTr-0000000DxM1-0WiE
	for opensbi@lists.infradead.org;
	Tue, 13 Oct 2026 19:48:12 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DHkgrF3000893
	for <opensbi@lists.infradead.org>; Tue, 13 Oct 2026 19:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r1em/W3gSQCS0h3lfrnzIKXg+awSolpmbBF+9uep7EU=; b=b453dmADHHhw/1fv
	tOt7YcPF2J+4Meek/Q8DFOIoA475hqMa4KwxTJvhO5OJR7s9wFdPtY1LCI1XTKRJ
	QKGwEVbhv6IC6N0yV/wU7sebtwNEq4U585rPFIoe762rvxw9M+FZAbstQz6OuZam
	8E7/8Qj2KxopnmXjpm0FyrflSNct2jexSkVmf1yHu9mPqY2WJ3BBZ0E+5TfoklaT
	ayQl+E8Uv2HlF06aMu+4FGLjOlXZ6dEKJHwks4agqjYpvQm9MnIxJcMj76WBtIdr
	NBgxqfXQ/IJs5fxl/1NWCdfWWzUCQ2jZI415LQQ2IKdz2vIzMO77Y8xynZKlDaCd
	9Sed9w==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sberj50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 13 Oct 2026 19:48:10 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-469debb526fso4992591fac.0
        for <opensbi@lists.infradead.org>; Tue, 13 Oct 2026 12:48:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791920890; cv=none;
        d=google.com; s=arc-20260327;
        b=Q2J2gzIxdYR+ImxySHUg3gHJWBfpu8r7R+q1S5UPfvvysawKa03kyA2BcUfX1r4PZv
         0X69UAmT5L6yluQxFhYtxO0KUB0o6RjSPAcml/CRtRW00l2jnc7UYsBSQChdgwKYaIXm
         IByL2emE8WCgzvwXjEt9nyUNE3mXyVwYAHnGF4giECL/O4bqTowtueMowLBrrTKM+TwL
         Y2vO+ThPIxzl2ygZJcGalh8wPt+lHsljB/SnLVXxNy3xpoGda0q2620b1I4Zno87zaz8
         2Mu4cjr8/cEC0MCq3oo5o+ijX4TVXhm1BRP/C/sGSbJyx+rCC9LnbN82rf8H6nKFZgc8
         QNmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r1em/W3gSQCS0h3lfrnzIKXg+awSolpmbBF+9uep7EU=;
        fh=JJCS+weyhSlx0hDZVfoTB6VdwuLlS6HSKqJzcxAFBBg=;
        b=cwvu17XJmJ7rUTZho3z0fKRvJaqbra4RhdkPQatZXznz/evEJ/SodEZyLTUHmdX9A3
         PqEkMJ20IkG4dQS5jygeIlDZ39CyCPOvb/5Xsw/8AZ9ZIotfXeTJbUz4L1NOzXKXJshn
         NVc8kTP2AIVQZn/RHzCD3wQiUs7spf1+Cb1Y9d36Y92mGJxE6hQ73DstiNyQ/wyUWWmx
         CiqfCwydqrjA3VDm53CQKxSLzwy465e2r3TDL5uPQiVQvkggCVSQHJOzjDbssPIxGEPO
         tGuhG90n1YLIYkjiyYvjABx97bSfZuVxkngekeZonT8Nh7BFtJSqSX3fjDm6ioLIRjia
         21Mg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791920890; x=1792525690; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r1em/W3gSQCS0h3lfrnzIKXg+awSolpmbBF+9uep7EU=;
        b=TNg8qJgXxMCIeQ8ByiXi38Z+pbl/0F/T/yocU4S6eNysjx3qfeMx4YWN3vmDnIitWr
         8iSclzxGtSg1b5mRfmW5C4Y4BOhurqvDfgpStcLuNz7q5KwAL1XX/6vm4pYRAxqgnA+U
         9WZ3PHYkS6q68X5evDt5ZdzhXXsiW9vjH5S5HUWaNrBFYFjCo3LqgyVV/Ns4BKZH5l9U
         LyHLuxTn69lkNVJ2X8ws2QgYKqehZ5buyEQe1i5ULorbsToQpaNIXOzl4RgoSOBSkyPf
         6DbBILnOiPkSsJ2ewgycPzrSO3elMEp84GTC5/JClZu71EMFKImknmut8+KqDIgmFGxw
         kp5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791920890; x=1792525690;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r1em/W3gSQCS0h3lfrnzIKXg+awSolpmbBF+9uep7EU=;
        b=ERm0CJYSsedM5JW0ufVib26G5tO10tYBLqGGmxedk7QcBVZh0rVvy54lvge5HnOoGU
         xB48K7VYBkwuJMlpxnjJ34qHHEPzQLr5Qq7J3BihurDeaRh9vYJXNQKZHA5hlUS2UuGj
         hnBAAFFqcOeiCFXEcRGmnaeUjtw49UsJNbxdKb+3RDFQZ8M+2hs1aYtin4hIAr1b0xkN
         jRzrzrRcpI2daT/2XAzi28Lm4JIq3AZnVZZGAGfHBmpngYnlN5a/hzrKyj1DypbIQwae
         pZbjXhq5YU7jlE4uK4uX99Yeck1VwqeFVMNw2+lDRKy3HKO8yhBCSxYrMQ50BwcGs5uL
         1vEQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqrsQbzavbE27pcrU21gs6Kyiq85kaVDHu0niLvYfTNcMYXQkod/hp+M+TlVlZH/MdjMxFDcx8@lists.infradead.org
X-Gm-Message-State: AFq9FYJNOZilzg4HQF/jjYGfDGbNnhuyyxaScboLlD6J2YSSfsFCHjY8
	NK5o6oiSjzKdDPmmYUI7/tok6KzuEcwjUWrqtOlScm8zPse0wNZki6FCLdbZAD9VzzF8hUaXbge
	3Z/BaLdwmADExb+FWuz7KrAwD/b6FmzBzfLgRTj9CJsGwrfbwX+T11Og0dmeeCNHZnJ6o9v1PQQ
	mnd6SB3QvAF/rarHkwkXSL9t2S4cX+tAECA7FWJEmG
X-Gm-Gg: AYBFou0JydMtTGoxWClhiSZclJDR6sYp5Ix5lAlIRHPzBaupLWhInbWxrEJCWwRfxbO
	VcJWrJz/axP3YCmkj1wwIcxe309Cv7tblR1qoGnjRx8sIZLqyjKSwYKaH+XyT91q3TqwyPqfpFU
	VyvqQvM9eTWmJMBPY2Tsxk/hi5xsYmlLS0QzXQu3TxlcwCZbPdt0brbHGi1Y4=
X-Received: by 2002:a05:6870:e304:b0:48f:e0f6:bd58 with SMTP id 586e51a60fabf-4a2a8a8c038mr11950865fac.41.1791920889606;
        Tue, 13 Oct 2026 12:48:09 -0700 (PDT)
X-Received: by 2002:a05:6870:e304:b0:48f:e0f6:bd58 with SMTP id
 586e51a60fabf-4a2a8a8c038mr11950846fac.41.1791920889138; Tue, 13 Oct 2026
 12:48:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260923032359.4041876-1-anup.patel@oss.qualcomm.com> <20260923032359.4041876-11-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260923032359.4041876-11-anup.patel@oss.qualcomm.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:47:57 -0700
X-Gm-Features: AclHuK8ifCG37lEAueF0HF9GS4I5U3D1kD-0kPfIpf6ofB7mrQHmGc1xP6bryBo
Message-ID: <CAAVgOkJy1SY1KSdeQL1JOQP5jtaQqde4uBVgs=RWJNroa10Hug@mail.gmail.com>
Subject: Re: [PATCH 10/11] lib: sbi_domain: Add domain notifier infrastructure
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
X-Proofpoint-ORIG-GUID: _BuuXXWezWp9AviSaQQP-1_9uthPTK90
X-Proofpoint-GUID: _BuuXXWezWp9AviSaQQP-1_9uthPTK90
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA3OCBTYWx0ZWRfX2es39NVR7JfG
 fOKkQYz9YPTqVOtsy74FcWBOIdzsTKEQk85OhffSMjmovtv7W/tdyyDR10sUyyQvclUZkZbIQYh
 2kczkX4DjGQREV1p7sR/GySgKFk9QYJ90SkgrjGDM4opgqr/H2z3YxXyrMznbXoK1XHjW6cljvu
 3gp61VDx07ryBVAAo67Lm8SukOoQEwqlB1hw1szISSbrPMW1NIcNwAtZdlTWsxrlCz0C8LeJnlL
 FYRhsZFNfW5mtA4CFKPkZkbJokC4d1y5wgl6T5U/WBwnhuuWOBnMNrAE+g2V27Ihs8Rlq2ni7Do
 86ckE4LXfrxJLYdnNFzbgEkpOHFYaeSLlwwEdDlo7UOpia7uRKeU8jHwZj0Wtcv8wKUyZV0S92Y
 t9tYWz4/ysXihio6plMbeS/doPHt3/B6YjVONNTGL7vegdtRCUB85cgXEs6Rw2ShCsxgP1IMhtf
 J0aZA5bzGL3v8jFTxgw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA3OCBTYWx0ZWRfX84fllB53WIhm
 w9GbAhpTKwG9MO5AlHihJekfajvhlHteKtPnmipDSMOWelkkRQpLUYSqbNvFXTmTxMdApN5R5wp
 owbiuuOXTohTJR8I93kZK5nHdFCSYAw=
X-Authority-Analysis: v=2.4 cv=U7AHnuru c=1 sm=1 tr=0 ts=6ace8afa cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=PWti950ptDWf6VW80DMA:9
 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_124811_172688_5D2FA21B 
X-CRM114-Status: GOOD (  23.10  )
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
b3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBPemEgUGF3YW5kZWVwIDxwYXdhbmRl
ZXAub3phQG9zcy5xdWFsY29tbS5jb20+Cj4KPiBJbnRyb2R1Y2UgYSBub3RpZmllciBjYWxsYmFj
ayBtZWNoYW5pc20gdGhhdCBhbGxvd3Mgc3Vic3lzdGVtcyB0bwo+IHJlZ2lzdGVyIGludGVyZXN0
IGluIGRvbWFpbiBldmVudHMgKHN1Y2ggYXMgcmVnaXN0cmF0aW9uKS4gV2hlbmV2ZXIKPiBzdWNo
IGV2ZW50cyBoYXBwZW4gZm9yIGEgZG9tYWluLCBhbGwgcmVnaXN0ZXJlZCBub3RpZmllcnMgYXJl
IGludm9rZWQuCj4KPiBUaGUgZm9sbG93aW5nIHB1YmxpYyBpbnRlcmZhY2VzIGFyZSBhZGRlZCB0
byBzYmlfZG9tYWluLmg6Cj4KPiAgIC0gc2JpX2RvbWFpbl9yZWdpc3Rlcl9ub3RpZmllcigpOiBy
ZWdpc3RlcnMgYSBub3RpZmllciBjYWxsYmFjay4KPiAgICAgRHVwbGljYXRlIChmbiwgZXZlbnQs
IHByaXYpIHBhaXJzIGFyZSBzaWxlbnRseSBpZ25vcmVkLgo+Cj4gICAtIHNiaV9kb21haW5fdW5y
ZWdpc3Rlcl9ub3RpZmllcigpOiByZW1vdmVzIGEgcHJldmlvdXNseSByZWdpc3RlcmVkCj4gICAg
IG5vdGlmaWVyIGNhbGxiYWNrLgo+Cj4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YW51cC5w
YXRlbEBvc3MucXVhbGNvbW0uY29tPgo+IFNpZ25lZC1vZmYtYnk6IE96YSBQYXdhbmRlZXAgPHBh
d2FuZGVlcC5vemFAb3NzLnF1YWxjb21tLmNvbT4KPiAtLS0KPiAgaW5jbHVkZS9zYmkvc2JpX2Rv
bWFpbi5oIHwgNDAgKysrKysrKysrKysrKysrKysrKysrCj4gIGxpYi9zYmkvc2JpX2RvbWFpbi5j
ICAgICB8IDc4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMiBm
aWxlcyBjaGFuZ2VkLCAxMTggaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUv
c2JpL3NiaV9kb21haW4uaCBiL2luY2x1ZGUvc2JpL3NiaV9kb21haW4uaAo+IGluZGV4IGQ1MzBm
OTM5Li41NmEyMTM5NyAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3NiaS9zYmlfZG9tYWluLmgKPiAr
KysgYi9pbmNsdWRlL3NiaS9zYmlfZG9tYWluLmgKPiBAQCAtMzg3LDQgKzM4Nyw0NCBAQCBpbnQg
c2JpX2RvbWFpbl9maW5hbGl6ZShzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gpOwo+ICAvKiog
SW5pdGlhbGl6ZSBkb21haW5zICovCj4gIGludCBzYmlfZG9tYWluX2luaXQoc3RydWN0IHNiaV9z
Y3JhdGNoICpzY3JhdGNoLCB1MzIgY29sZF9oYXJ0aWQpOwo+Cj4gKy8qKiBQb3NzaWJsZSBkb21h
aW4gbm90aWZ5IGV2ZW50cyAqLwo+ICtlbnVtIHNiaV9kb21haW5fbm90aWZ5X2V2ZW50IHsKPiAr
ICAgICAgIFNCSV9ET01BSU5fTk9USUZZX0VWRU5UX1JFR0lTVEVSID0gMCwKPiArICAgICAgIFNC
SV9ET01BSU5fTk9USUZZX0VWRU5UX01BWCwKPiArfTsKPiArCj4gKy8qKgo+ICsgKiBEb21haW4g
bm90aWZ5IGNhbGxiYWNrLgo+ICsgKiBAcGFyYW0gZG9tIHBvaW50ZXIgdG8gZG9tYWluCj4gKyAq
IEBwYXJhbSBldmVudCBkb21haW4gbm90aWZ5IGV2ZW50Cj4gKyAqIEBwYXJhbSBwcml2IHByaXZh
dGUgZGF0YSBvZiB0aGUgY2FsbGJhY2sKPiArICogQHJldHVybiAwIG9uIHN1Y2Nlc3MgKGluZm9y
bXMgZnJhbWV3b3JrIHRvIGNvbnRpbnVlIG5vdGlmaWNhdGlvbnMpCj4gKyAqIEByZXR1cm4gbmVn
YXRpdmUgZXJyb3IgY29kZSBvbiBmYWlsdXJlIChpbmZvcm1zIGZyYW1ld29yayB0byBub3QgY29u
dGludWUgbm90aWZpY2F0aW9ucykKPiArICovCj4gK3R5cGVkZWYgaW50ICgqc2JpX2RvbWFpbl9u
b3RpZnlfZm4pKHN0cnVjdCBzYmlfZG9tYWluICpkb20sCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGVudW0gc2JpX2RvbWFpbl9ub3RpZnlfZXZlbnQgZXZlbnQsCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKnByaXYpOwo+ICsKPiArLyoq
Cj4gKyAqIFJlZ2lzdGVyIGRvbWFpbiBub3RpZmllcgo+ICsgKiBAcGFyYW0gZm4gZG9tYWluIG5v
dGlmeSBjYWxsYmFjawo+ICsgKiBAcGFyYW0gZXZlbnQgZG9tYWluIG5vdGlmeSBldmVudAo+ICsg
KiBAcGFyYW0gcHJpdiBwcml2YXRlIGRhdGEgb2YgdGhlIGNhbGxiYWNrCj4gKyAqIEByZXR1cm4g
MCBvbiBzdWNjZXNzCj4gKyAqIEByZXR1cm4gbmVnYXRpdmUgZXJyb3IgY29kZSBvbiBmYWlsdXJl
Cj4gKyAqLwo+ICtpbnQgc2JpX2RvbWFpbl9yZWdpc3Rlcl9ub3RpZmllcihzYmlfZG9tYWluX25v
dGlmeV9mbiBmbiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbnVtIHNiaV9k
b21haW5fbm90aWZ5X2V2ZW50IGV2ZW50LCB2b2lkICpwcml2KTsKPiArCj4gKy8qKgo+ICsgKiBV
bnJlZ2lzdGVyIGRvbWFpbiBub3RpZmllcgo+ICsgKiBAcGFyYW0gZm4gZG9tYWluIG5vdGlmeSBj
YWxsYmFjawo+ICsgKiBAcGFyYW0gZXZlbnQgZG9tYWluIG5vdGlmeSBldmVudAo+ICsgKiBAcGFy
YW0gcHJpdiBwcml2YXRlIGRhdGEgb2YgdGhlIGNhbGxiYWNrCj4gKyAqIEByZXR1cm4gMCBvbiBz
dWNjZXNzCj4gKyAqIEByZXR1cm4gbmVnYXRpdmUgZXJyb3IgY29kZSBvbiBmYWlsdXJlCj4gKyAq
Lwo+ICtpbnQgc2JpX2RvbWFpbl91bnJlZ2lzdGVyX25vdGlmaWVyKHNiaV9kb21haW5fbm90aWZ5
X2ZuIGZuLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW51bSBzYmlfZG9t
YWluX25vdGlmeV9ldmVudCBldmVudCwgdm9pZCAqcHJpdik7Cj4gKwo+ICAjZW5kaWYKPiBkaWZm
IC0tZ2l0IGEvbGliL3NiaS9zYmlfZG9tYWluLmMgYi9saWIvc2JpL3NiaV9kb21haW4uYwo+IGlu
ZGV4IDFjOTViMGZjLi40MmZlNTYzMiAxMDA2NDQKPiAtLS0gYS9saWIvc2JpL3NiaV9kb21haW4u
Ywo+ICsrKyBiL2xpYi9zYmkvc2JpX2RvbWFpbi5jCj4gQEAgLTM1LDYgKzM1LDc0IEBAIHN0cnVj
dCBzYmlfZG9tYWluIHJvb3QgPSB7Cj4KPiAgc3RhdGljIHVuc2lnbmVkIGxvbmcgZG9tYWluX2hh
cnRfcHRyX29mZnNldDsKPgo+ICtzdHJ1Y3Qgc2JpX2RvbWFpbl9ub3RpZnlfZW50cnkgewo+ICsg
ICAgICAgc3RydWN0IHNiaV9kbGlzdCAgICAgICAgICAgICAgICBub2RlOwo+ICsgICAgICAgc2Jp
X2RvbWFpbl9ub3RpZnlfZm4gICAgICAgICAgICBmbjsKPiArICAgICAgIGVudW0gc2JpX2RvbWFp
bl9ub3RpZnlfZXZlbnQgICAgZXZlbnQ7Cj4gKyAgICAgICB2b2lkICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICpwcml2Owo+ICt9Owo+ICsKPiArc3RhdGljIFNCSV9MSVNUX0hFQUQoZG9tYWlu
X25vdGlmaWVyX2xpc3QpOwo+ICsKPiAraW50IHNiaV9kb21haW5fcmVnaXN0ZXJfbm90aWZpZXIo
c2JpX2RvbWFpbl9ub3RpZnlfZm4gZm4sCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZW51bSBzYmlfZG9tYWluX25vdGlmeV9ldmVudCBldmVudCwgdm9pZCAqcHJpdikKPiArewo+
ICsgICAgICAgc3RydWN0IHNiaV9kb21haW5fbm90aWZ5X2VudHJ5ICplbnRyeTsKPiArCj4gKyAg
ICAgICBpZiAoIWZuIHx8IFNCSV9ET01BSU5fTk9USUZZX0VWRU5UX01BWCA8PSBldmVudCkKPiAr
ICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FSU5WQUw7Cj4gKwo+ICsgICAgICAgc2JpX2xpc3Rf
Zm9yX2VhY2hfZW50cnkoZW50cnksICZkb21haW5fbm90aWZpZXJfbGlzdCwgbm9kZSkgewo+ICsg
ICAgICAgICAgICAgICBpZiAoZW50cnktPmZuID09IGZuICYmIGVudHJ5LT5ldmVudCA9PSBldmVu
dCAmJiBlbnRyeS0+cHJpdiA9PSBwcml2KQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVy
biBTQklfT0s7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgZW50cnkgPSBzYmlfemFsbG9jKHNp
emVvZigqZW50cnkpKTsKPiArICAgICAgIGlmICghZW50cnkpCj4gKyAgICAgICAgICAgICAgIHJl
dHVybiBTQklfRU5PTUVNOwo+ICsKPiArICAgICAgIGVudHJ5LT5mbiAgICA9IGZuOwo+ICsgICAg
ICAgZW50cnktPmV2ZW50ID0gZXZlbnQ7Cj4gKyAgICAgICBlbnRyeS0+cHJpdiAgPSBwcml2Owo+
ICsgICAgICAgc2JpX2xpc3RfYWRkX3RhaWwoJmVudHJ5LT5ub2RlLCAmZG9tYWluX25vdGlmaWVy
X2xpc3QpOwo+ICsgICAgICAgcmV0dXJuIFNCSV9PSzsKPiArfQo+ICsKPiAraW50IHNiaV9kb21h
aW5fdW5yZWdpc3Rlcl9ub3RpZmllcihzYmlfZG9tYWluX25vdGlmeV9mbiBmbiwKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVudW0gc2JpX2RvbWFpbl9ub3RpZnlfZXZlbnQg
ZXZlbnQsIHZvaWQgKnByaXYpCj4gK3sKPiArICAgICAgIHN0cnVjdCBzYmlfZG9tYWluX25vdGlm
eV9lbnRyeSAqZW50cnksICp0bXA7Cj4gKwo+ICsgICAgICAgaWYgKCFmbiB8fCBTQklfRE9NQUlO
X05PVElGWV9FVkVOVF9NQVggPD0gZXZlbnQpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBTQklf
RUlOVkFMOwo+ICsKPiArICAgICAgIHNiaV9saXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUoZW50cnks
IHRtcCwgJmRvbWFpbl9ub3RpZmllcl9saXN0LCBub2RlKSB7Cj4gKyAgICAgICAgICAgICAgIGlm
IChlbnRyeS0+Zm4gPT0gZm4gJiYgZW50cnktPmV2ZW50ID09IGV2ZW50ICYmIGVudHJ5LT5wcml2
ID09IHByaXYpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBzYmlfbGlzdF9kZWwoJmVudHJ5
LT5ub2RlKTsKPiArICAgICAgICAgICAgICAgICAgICAgICBzYmlfZnJlZShlbnRyeSk7Cj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9PSzsKPiArICAgICAgICAgICAgICAgfQo+
ICsgICAgICAgfQo+ICsKPiArICAgICAgIHJldHVybiBTQklfRU5PREVWOwo+ICt9Cj4gKwo+ICtz
dGF0aWMgaW50IHNiaV9kb21haW5fbm90aWZ5X2FsbChzdHJ1Y3Qgc2JpX2RvbWFpbiAqZG9tLCBl
bnVtIHNiaV9kb21haW5fbm90aWZ5X2V2ZW50IGV2ZW50KQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3Qg
c2JpX2RvbWFpbl9ub3RpZnlfZW50cnkgKmVudHJ5LCAqdG1wOwo+ICsgICAgICAgaW50IHJjOwo+
ICsKPiArICAgICAgIHNiaV9saXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUoZW50cnksIHRtcCwgJmRv
bWFpbl9ub3RpZmllcl9saXN0LCBub2RlKSB7Cj4gKyAgICAgICAgICAgICAgIGlmIChlbnRyeS0+
ZXZlbnQgPT0gZXZlbnQpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICByYyA9IGVudHJ5LT5m
bihkb20sIGV2ZW50LCBlbnRyeS0+cHJpdik7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYg
KHJjKQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJjOwo+ICsgICAg
ICAgICAgICAgICB9Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgcmV0dXJuIDA7Cj4gK30KPiAr
Cj4gIHN0cnVjdCBzYmlfZG9tYWluICpzYmlfaGFydGluZGV4X3RvX2RvbWFpbih1MzIgaGFydGlu
ZGV4KQo+ICB7Cj4gICAgICAgICBzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2g7Cj4gQEAgLTcx
OSw2ICs3ODcsMTYgQEAgaW50IHNiaV9kb21haW5fcmVnaXN0ZXIoc3RydWN0IHNiaV9kb21haW4g
KmRvbSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIHJjOwo+ICAgICAgICAgfQo+Cj4gKyAgICAg
ICAvKiBOb3RpZnkgZXZlcnlvbmUgKi8KPiArICAgICAgIHJjID0gc2JpX2RvbWFpbl9ub3RpZnlf
YWxsKGRvbSwgU0JJX0RPTUFJTl9OT1RJRllfRVZFTlRfUkVHSVNURVIpOwo+ICsgICAgICAgaWYg
KHJjKSB7Cj4gKyAgICAgICAgICAgICAgIHNiaV9wcmludGYoIiVzOiBkb21haW4gbm90aWZpY2F0
aW9uIGZhaWxlZCBmb3IgJXMgKGVycm9yICVkKVxuIiwKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICBfX2Z1bmNfXywgZG9tLT5uYW1lLCByYyk7Cj4gKyAgICAgICAgICAgICAgIHNiaV9kb21h
aW5fY2xlYW51cF9zdGF0ZShkb20pOwo+ICsgICAgICAgICAgICAgICBzYmlfbGlzdF9kZWwoJmRv
bS0+bm9kZSk7Cj4gKyAgICAgICAgICAgICAgIHJldHVybiByYzsKPiArICAgICAgIH0KPiArCj4g
ICAgICAgICByZXR1cm4gMDsKPiAgfQo+Cj4gLS0KPiAyLjQzLjAKPgoKUmV2aWV3ZWQtYnk6IFBh
d2FuZGVlcCBPemEgPHBhd2FuZGVlcC5vemFAb3NzLnF1YWxjb21tLmNvbT4KVGVzdGVkLWJ5OiBQ
YXdhbmRlZXAgT3phIDxwYXdhbmRlZXAub3phQG9zcy5xdWFsY29tbS5jb20+CgotLSAKb3BlbnNi
aSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
