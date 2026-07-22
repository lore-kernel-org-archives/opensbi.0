Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C461C44539
	for <opensbi@archiver.kernel.org>; Wed, 22 Jul 2026 11:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rjscm/OxIXd/FcF6cJ7lkpHNOuZjNmYwr4SxB67wFVw=; b=NYa51DBLUcFvR1
	ls9p11NkNudGE456SWu0bSmbkcKIFtID5oXmWYqETTw3Gk7S8H0ZHsu4/9sL6REvpheSX3SLtmLAE
	taYEfQY5wNnoVFT0Fdo/2Zmovog1+pS/GyG+49PhdjQ7nDTIpKyeLyqny4dB8+5BIpHXUP8vUGxM5
	ScgwS1qhG4LdAPLELqnVRycEbfdfFYW8spNmiuPya1CJ4KzYq5Ojous/gxDQMZn5ltcEuC9V7gJ9m
	vKYJ25DUnB2wrpFA9zh9NtMxvjhlt++50FyM+w9uTasv54AP5jJKpXqAnuEEw0BM6uGoRyA8Gvi1u
	/0mgRP9l2Gf4lW9Xqnxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmUlo-0000000BcH3-1Ayy;
	Wed, 22 Jul 2026 11:05:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmUlm-0000000BcGU-00X2
	for opensbi@lists.infradead.org;
	Wed, 22 Jul 2026 11:05:47 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xKwx237625
	for <opensbi@lists.infradead.org>; Wed, 22 Jul 2026 11:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CsXcbUpfCSLNwrtkolMbJtji2ELsl/xtuj/24c+rATA=; b=PjJWA8ANwd/s8FVV
	aRDxlZ3/yIv47HNMSeVzORYNvdFRonRkJcvBA1A4OHASbempeGn84taTh0UTc0Bb
	q8eK4ztLoNEWlA1ho8bxRcR2V1w4SgueHemptdc+gGX0AhB5Ic+sfCCOXE0+vuSg
	Dd2o207mZ7q/SdYqpw2/uugp0sYh+JMBb3+IfRJgXz5F6/x9zJuAgFbJPQfzH8AC
	7HM2vLe/HoMirCw2EoFRYiPZvz+2NocJNxiztR0W2FTTaCn85SknNzlnZPXga/XT
	rB8IwfJR3eHjcN3p7M9KoxU56axqLgbNytN0ZOFA+Rq64gU7KX304+zSkpuEzOlu
	HzsPWw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjntn1sdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Wed, 22 Jul 2026 11:05:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ec3146553so565365085a.1
        for <opensbi@lists.infradead.org>; Wed, 22 Jul 2026 04:05:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784718344; cv=none;
        d=google.com; s=arc-20260327;
        b=MODaylfLd55lHfy9ozYY2Vvqyo9UI+7uhqVaT78QKCs00HeWdspg2vRnwCu/UiGviW
         4Ie7cRVdNKGRwgmCeTA67CLed/PQNTrYO/tDDFyznRKPTL6xZF2awHsYOLeX+q1SILJt
         SxDEr0xdLoFSbL7S76P8bBtdgHXnuyVH55Sb49QdPuY+de9aIAc98E3/yP9jZnEMV4Xz
         JhGuVekvuvLoOYoRmjzUyk1EHRSOWhfM5wo8tIWqIivBdiaCGTwc9kX32RSlsfZEt+Ua
         vLjT/OAFNVU/rKXjLsNZ5c3q1HL/nCN9ivwBDNTWjExFrf5fN17574a3WqyRZI04ngfO
         zE7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CsXcbUpfCSLNwrtkolMbJtji2ELsl/xtuj/24c+rATA=;
        fh=ZLd3gCvN63FY4RVDxDr1oUjbHqsER8+StBL8b5HQnU4=;
        b=dkI4OIxMKa+K8Lwz4NeqYbD7SnLJ4UBvtMiWuACsw7iP1uJLylgVOOsqenZbOgpLSt
         UsAKlYE4sKvb0xErAlBqDqhp1YjBnvFR1RKtOSWbdK1wnG5eEcQu5JPhwjUmVPeIkAuy
         a6IY+00okUoUAoHkdOK6PsfOIoulgFJ0lcF5fXT/IxzsxIF8ImZgznCCTHwjoAdjnnL6
         p8Lu7Qh4uJuVUE4+6tlgdqYsPn+JrsNBh4v8vqBbdFC+PE/9rkQnWlp63jEC79y6KMCV
         1wJjtbSfqPuFh0qU5a0hmBLzMzbKD9SERhFGk/PotQqFMbHWSyGL/idzsvdGcOorEH/l
         o/qQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784718344; x=1785323144; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CsXcbUpfCSLNwrtkolMbJtji2ELsl/xtuj/24c+rATA=;
        b=Gj8DLC5KWz8eV9zqTw1HlgXMImnJ8n92MPFxfgR7KbyaZ4G43d8zP0bVbPMFllv3Ka
         sIFoLi8OtCfB/T3FV+6nk6p+kcnb4KMAhBzhMrswJQtu/Vq9Tp68+YydufQxQWtR/fft
         y09wmPhTGDzYWKNb2EVolynOhBZIY3w05cNUemuFCpqSkgpiuHZh+6hCGONi/5SWM5um
         O/qoPA918v5ulHN/StElEv9Rx5g9bgX/snQwSMIsz1dFAoVZbojVlz27GiOsLzZgvgAH
         tlnwfJMLBNlAt7crvF4qoGHXxD1byHH9S8Mm9Ghq52xg3mckrRkZVxcFa1WSLRl4JK/Z
         x2lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784718344; x=1785323144;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CsXcbUpfCSLNwrtkolMbJtji2ELsl/xtuj/24c+rATA=;
        b=i9kY3UgYRR9tmWbnkJJhxMvpQh2/9CFOHV5HFWK+u/72YVh/ykxs2QJT7nyijaVJiQ
         vAw1t9AcH/Z5w8nh6Xp2JEFJkle0DhUrmTlT1hxp+DunuwkAP6frm+T5wBmrdcYHq9sZ
         FzJMCg3xb5O2hjO0xVsFXZqCF5BQNPCO9xNQdpQcXe2DDSOgllJEnaTF2NwvuCbFIojB
         p3HdzniDbyJlwR5YBJPg0vy6XBFTTUPfK+2Ui/LpcDCh3ozSCB86MxD4BWLKlB46t5uD
         Vvwxi4ieoyc7OF4enY6qBfzTB5XCx6lWA6hITytcGx3Dv//qp6G8wSv224bt85ooqSIe
         yLJw==
X-Forwarded-Encrypted: i=1; AHgh+RoIh0qsVTSUDTv/cGxFwO785sj+FluwAcyTtm9dPmXEyh7ZwyVhnPlHw03L6JlUS+xM0JAW+lJQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwUWPM/U1F3ntNsieEZxfqlN/44z0zhq7hseAtOMnCmKURxcSFd
	jV8ofXfMT8lhpXW5JHbrjeO13FZcKvLYrb59FgpxDSY30rLpURkze5Or4aAz3Exf0zvdroIjp2x
	CRIQ7mf/BGKFcAORkage6TBEWD+MJdOYCEBD3H49NRl9yzrGHPSrXkadGKDnAdby1bcCoOhWr9B
	F5NRlWRsg6qy8fnQDio+sW0LrEFxt6y//5I9zKkTZJ
X-Gm-Gg: AR+sD110dG8dMg5YER+qhTVkiokZaOeydCs0ylpNXkgyBopD9JX+BJixXKoD6XeXYF/
	ZRlRXXfoHC1nrjD9LgFTdBMEZc/lNIKzCb+m7UL7lLgR+4LyfA8gsojRMOH1/Yc/ZiJXRSQkNP2
	KZkGg9/jj33osjueSfhcOcvm/dFlN2TTI4ZffvSm3g4pusfQAEnlcMIuCSfg==
X-Received: by 2002:a05:620a:440b:b0:930:ea99:8097 with SMTP id af79cd13be357-930ea9980fbmr592494885a.61.1784718343963;
        Wed, 22 Jul 2026 04:05:43 -0700 (PDT)
X-Received: by 2002:a05:620a:440b:b0:930:ea99:8097 with SMTP id
 af79cd13be357-930ea9980fbmr592489685a.61.1784718343517; Wed, 22 Jul 2026
 04:05:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260717074413.2536416-1-anup.patel@oss.qualcomm.com> <20260717074413.2536416-4-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260717074413.2536416-4-anup.patel@oss.qualcomm.com>
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 16:35:31 +0530
X-Gm-Features: AUfX_my7jfunur2O_KD9ch4YQqvPuDo_W9zpDfukLL2mHSG8q-QL3x8_3Lrrbvs
Message-ID: <CAFR3w371OmLWXmxOwjUOio5VNjvasq4Y5OK9N7o3=8RPtpBpug@mail.gmail.com>
Subject: Re: [PATCH 3/5] lib: sbi: Add domain parameter to hart protection (un)configure()
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
X-Authority-Analysis: v=2.4 cv=AJsSZ1gA c=1 sm=1 tr=0 ts=6a60a408 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=mOiJm9Dm1vi6pPn5lyYA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 9iQfaVPu33ajHlN_2qXfbTBmhgC4VJZ9
X-Proofpoint-ORIG-GUID: 9iQfaVPu33ajHlN_2qXfbTBmhgC4VJZ9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwNyBTYWx0ZWRfX1qe1Flg4cBuS
 THETmMWZmZ43Kj+oE13/xKIRoRXNrFOiMVgAP2T7K0XYGptOo+wZ7nft5pVXxoTy6CQqyNuJbqR
 RaBORDg294D/Pskzb7J6zKFKfo5y0Cc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwNyBTYWx0ZWRfXxLvCcqU5Uz0U
 Kaaap+L1LJKMZOVqsfHdc4jskTIuVviAtt6VevAhZVtNPvGFfVfzMvVUFyclBg5DlJ2e0XB6T50
 aR8gz9psOUbZgQrg7xghuYnnexPWaq84n9rv3yretdbYj//NAxesZ1y9Cd1jIhGb9XGOrI/+4On
 Jq0a0Cf45LexwbRus9mPJDPe6l0jbo1hZq1dGXnpAUs5wgcZbljyIh9wECnjx1Lv/4/FWHFl2at
 BMXmdImaRM3OGJr3PtI2dGKMFdo9yPLzoC9Vj+oz6dndCbKBVDeq8kWiR8BjljwKkaDGEqtLP35
 xoz5kaTwKsQjtwTFzFaqHeSbCZWmMwkjyn9UAXkITNwr2RUhAKWXZnFq+LtTnII6EmFIJo/kTpg
 rpv6huWP3uP09bxPtA9D81AolyTfl96OTTiOulnIDd69ydR4Pze6A3FE5hCSE986zFwSoycmMJl
 MkAsjekIj/crIWMj4Hg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_040546_161366_5DE8537F 
X-CRM114-Status: GOOD (  12.68  )
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

T24gRnJpLCBKdWwgMTcsIDIwMjYgYXQgMToxNeKAr1BNIEFudXAgUGF0ZWwgPGFudXAucGF0ZWxA
b3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBUaGUgc3dpdGNoX3RvX25leHRfZG9tYWluX2Nv
bnRleHQoKSBhbHJlYWR5IGhhcyB0aGUgcG9pbnRlcnMgdG8gY3VycmVudAo+IGFuZCBuZXh0IGRv
bWFpbnMgc28gcGFzcyB0aGVtIGFzIHBhcmFtZXRlcnMgdG8gaGFydCBwcm90ZWN0aW9uIGNvbmZp
Z3VyZSgpCj4gYW5kIHVuY29uZmlndXJlKCkgY2FsbGJhY2tzLgo+Cj4gU2lnbmVkLW9mZi1ieTog
QW51cCBQYXRlbCA8YW51cC5wYXRlbEBvc3MucXVhbGNvbW0uY29tPgo+IC0tLQo+ICBpbmNsdWRl
L3NiaS9zYmlfaGFydF9wcm90ZWN0aW9uLmggfCAyNSArKysrKysrKysrKysrKysrKysrLS0tLS0t
Cj4gIGxpYi9zYmkvc2JpX2RvbWFpbl9jb250ZXh0LmMgICAgICB8ICAyICstCj4gIGxpYi9zYmkv
c2JpX2hhcnRfcG1wLmMgICAgICAgICAgICB8IDExICsrKysrKy0tLS0tCj4gIGxpYi9zYmkvc2Jp
X2hhcnRfcHJvdGVjdGlvbi5jICAgICB8IDI4ICsrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0K
PiAgbGliL3NiaS9zYmlfaW5pdC5jICAgICAgICAgICAgICAgIHwgIDYgKysrLS0tCj4gIHBsYXRm
b3JtL2dlbmVyaWMvZXN3aW4vZWljNzcweC5jICB8ICA3ICsrKystLS0KPiAgNiBmaWxlcyBjaGFu
Z2VkLCA1MCBpbnNlcnRpb25zKCspLCAyOSBkZWxldGlvbnMoLSkKPgoKTG9va3MgZ29vZAoKUmV2
aWV3ZWQtYnk6IFJhaHVsIFBhdGhhayA8cmFodWwucGF0aGFrQG9zcy5xdWFsY29tbS5jb20+Cgot
LSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
