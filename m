Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA85EF48CC
	for <opensbi@archiver.kernel.org>; Fri, 13 Feb 2026 03:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2mUYLo2WBg6o9NV7gyEM8xjgN6FB9oKqY/rmDSfLSqQ=; b=JSvneE6lyaKYhH
	OzoloYJ2j8RA+8aVSUijHRVeJ0SSsl4pcEneSiyPqPq8A+GNdzT0I3PxRitmQ0T4Yn/t+OAo+6My5
	T5fEuVTlMzB4DKJfTmi4eWvJAInpX1GltI+NFjZYZs5QRgwsUymYK1/cAJN41Vo3n7qa2+Xng9Mmt
	iCslFIf8+AnAkC63SK24LrhetcOZZ4j+GCR5JniTlbnSXZ/Et6nSoYoSok3UXgFv/EwqEA0MDPkf1
	dxp23e0BpIQ8tkYksBctueGLbkT3UkwBEfeNP2M/IS0MEDA5hvHv7A3EsTNSm/aoqiRmSwYyeOKXK
	6uLkbPDXTCz/Gj0aVWXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqkLN-00000002w1h-0ryD;
	Fri, 13 Feb 2026 03:59:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqkLK-00000002w1K-3Opj
	for opensbi@lists.infradead.org;
	Fri, 13 Feb 2026 03:59:48 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CIlHEm454948
	for <opensbi@lists.infradead.org>; Fri, 13 Feb 2026 03:59:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fi6uIvK6ywtq+SegViSByWnkELaDiCD8tydWPeenj1c=; b=Bv7gOjpAH7tX+Wj4
	kwSeYNpaVI3CHDOY0ucb8yw8so2l2pDh1H2npmYOWgJOvB5FJ8QUu8NFKAujTlZX
	F8IX9ZnTk8DKW6tGQVkS/yItADyd7Di3gl+wHrBImeDpNj7hXmPHI88UIc2kKi1h
	XiVjGAd9pYGSIw5klzeDMoKLEjugMrH5dYnc6M/BaUcI3S+VifMs0N2GOMho8l03
	G7EJ8ZQJLHq1pMN19YZ7xZ8vXyFA9AEarHzZ9WnH3lvDD4x5hzwhpdE3QLdgmtEj
	aalPDdjccdQl6fjhC5mGEVJI3kEgtNL0xVKGPCVEQP8kL3HY88JGZOwBfUzOYRiO
	JtTDTw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9mev1q99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Fri, 13 Feb 2026 03:59:45 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ba9a159437so582855eec.0
        for <opensbi@lists.infradead.org>; Thu, 12 Feb 2026 19:59:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770955184; cv=none;
        d=google.com; s=arc-20240605;
        b=W6qT0jrj3/eCSrpoMaWKnNYCTPSTYvGXmL7w3xYlgdqvcdLKQf6ITwLgUDUB0X4L+G
         5+uXSednCeJHYdjVllOyDwLxXGWHd0+koqPHYUmJJOhTOzQwpZ1tk723qkWZ9uScNwzE
         jXLGM8+1eoO5T4QoaE7O8XzeZH54tVhzTDejG1YvzkUEKlsEcujbH/6B1oRFRLOqTSXE
         fnSmRIbllMoEYW80AEbPeRJmh3mELvyZuGll0ACFa//b4rag3/gwWU4bpHP9EDGspdQd
         5/gaHzviCG7Ek48HuxrgK9HDAhuS1W64GMmVFK/lTVE+MZF/OwEPLt895uWfpxfHpK30
         jFtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fi6uIvK6ywtq+SegViSByWnkELaDiCD8tydWPeenj1c=;
        fh=BMiIXeIvMRuV9ZqQyJ+EnmXoEscD+uAZ3O8RS38Peos=;
        b=IDWHiwTrNz5uMsYxx10Kzo3VFq7BT8tJO0Ngw80IlL6XF2IpJ2gaDAWVtf2yLPP/Zv
         AmqPFpRi9VeYXDr7F8Y3vQGXfpTLYQ7EITRnzDPFTmbWXZJ+3HUGrFQKt9x3jvFJXU2h
         MU6z5anZyu4ee8jwapiPsw5M+3CoewmBH5EHDyupRt2XJH/8LapUezlYl3J8OaiHPkft
         JfW+KcHWMEMBQiDZZ4IX4QXIIjAuxOHFkq4xuVb8EYqR5QEPtD1JYpGSq4VsZKKu6gGV
         O8NdGsirX/aeh8ltRIUNJwq5OGsErrkgdeecQMM4pHLjW2Vz/a5FYZrzFsGHkS84HGLZ
         9v6g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770955184; x=1771559984; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fi6uIvK6ywtq+SegViSByWnkELaDiCD8tydWPeenj1c=;
        b=CX7VXNSR/zALgY+JzeDZAp13QGxJthhQm0rljdhgiDFalbKF+ADrJqKzWCKhMjZssJ
         UubfF75ELw0mhkkNXhqM3H9u0hRlixwSPT6/6BQFnh6U7IjJC6hW0NJ/LvuaYcrUJTph
         tPQfp9yokZEgbkofgvDFAriNnDlo9wh7XvRCQieJf80sVuFIB2YBYn3RPPTOCk9BpjoK
         o2p56dKTv2rke42pDaoyNt/t+RM3Sd6W1ovzD+g+mZ5FesnztiUX0eG3OOcku59TMrGn
         A8etqFiiutnJ1/M9vp9fhmHrhaslhKMIAeFggT6fXfj40/LckM2ZSB6gsq922h2xbIPe
         wOpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770955184; x=1771559984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fi6uIvK6ywtq+SegViSByWnkELaDiCD8tydWPeenj1c=;
        b=jfKr/MFSspAg8PXxKutuTC1MK2aX5ZLLViN0uGSYLaYUSaByncJHfSI6aNlIVFMpZN
         clKoTBpekaR0bAXBo2NIQFdaZX1sCOnQ390EPowLwm7kYKdIU5txNb96LZhfysBhADxE
         0EwCxFHnwjDGLEqh1rAEyBrRfde/CzQnZgO/cfDDYlrOAJqsPF9Ff3vfx3LpHBfU284f
         jlYjEiKmsHtCrae+J/LqwU4PWqNuHpCF6Bg3TcfV2eBJ2GuK0tBOTp9RwnaWIgQhmzm9
         KUAdKzILYRAlXqZ6V+BverCwuA13oQgxxMpJWk+NA5+7i9Fkf4KXv5I6x7p5pZkcD1bD
         OtJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWI7tn4RoNYK5/7Z1/oxrVQwp6v9RzyA3bmVcxGr4LYnJB4Z+ytlZGcEQ2IQZg4uzEsgKvH/slJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwW/olYiyFFG5J9VpzjM9PWM2BLSwLU4iAQ1zpzT/jkurZ6WPli
	k8uFu7zFCON9y7JEDb6ra5d73VeIY6EjjqJfJQQl6M0z93PjBiAsMvDPqMjhhFIaZ2Ub7YFYwG0
	ys8osWrFYbk5wFT0fhnb5uK58yBSjrYIlPeMd7nmbc8nxNQuw29ulBxXpFkuhYFNzQlDfHoN78N
	xRXNQL8Du9bLvb+rzfezwIthpj1GJrHwv2BfWN1zkS
X-Gm-Gg: AZuq6aLUPLOfoTAKZXKeXRDyLWivs9QgtkBMONZHy1gSmWY1Jx9LQdRiOKxOKlKaFaQ
	TgOInqtPoZ8pts3FnZz1hBo9GotC2u3pZEmKajShDdII4z0VIY7yKGukKgBQmbyOQ7uY/VfISnv
	S0TUFdocZcKfIeJZmtzrvX98hm4d96o2IXXlztIz82o51BVCoXfqzERuqL0YFM6gjUE8YCnwnu7
	ixFpfzC
X-Received: by 2002:a05:7301:2f8c:b0:2a4:3593:466d with SMTP id 5a478bee46e88-2babc3aaf7emr216395eec.9.1770955183981;
        Thu, 12 Feb 2026 19:59:43 -0800 (PST)
X-Received: by 2002:a05:7301:2f8c:b0:2a4:3593:466d with SMTP id
 5a478bee46e88-2babc3aaf7emr216385eec.9.1770955183505; Thu, 12 Feb 2026
 19:59:43 -0800 (PST)
MIME-Version: 1.0
References: <20260207102602.2917520-1-anup.patel@oss.qualcomm.com>
 <20260207102602.2917520-6-anup.patel@oss.qualcomm.com> <urkwgvbeaqqpfieewyjuapido3774mscw7v7kjq7wm3qo2kfxz@iyu45i5lq5jq>
In-Reply-To: <urkwgvbeaqqpfieewyjuapido3774mscw7v7kjq7wm3qo2kfxz@iyu45i5lq5jq>
From: Anup Patel <anup.patel@oss.qualcomm.com>
Date: Fri, 13 Feb 2026 09:29:32 +0530
X-Gm-Features: AZwV_Qgw6LruGH4HZ5ivts_K6BmDkCQLdiZALUybh4HEWoMmIGMkXK07Vn5_eL4
Message-ID: <CABBgwmuF-_hY2LresiK_LzLxdvi=_oeQMdnhLLumXoZkE1Yh0A@mail.gmail.com>
Subject: Re: [PATCH 5/8] lib: sbi_irqchip: Support irqchip device targetting
 subset of harts
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>,
        Raymond Mao <raymond.mao@riscstar.com>,
        Dave Patel <dave.patel@riscstar.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
X-Authority-Analysis: v=2.4 cv=Zq7g6t7G c=1 sm=1 tr=0 ts=698ea1b1 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8 a=lw4HpSQD7S-HxYXh9EIA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: AhpQx3iqDGwikMO8llaboQggpwoXCYFV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDAyNiBTYWx0ZWRfX6vrSezyFHwOh
 BVaSZSPANP2swBkHAeFFos0bUZSmwnkbrek4xt9FsLhCyyutx56pVnB1Tr7XeOH8BqzCH0kPKsz
 oBDVjUDVFZvY9PvznnbSJPIMYCnGAjMwYfjXUlNwCvoB0We/KHN0UAeRA/GZmqcH9ke0/zFszHP
 UYVPjtCm3X/4yTb0KH+CfaOgQSH1obQfPC9qXre0XaqUuFGJeGwzxYzi/zZaV/NN0lDxRKcBDWO
 QjmvBKR+xF/hCXWwxhQ1Z3T7IPkstGyenv3K8KRBsbH0RRtfBsKlIQWznfyUIO5RQCpBcvhkoyN
 U0gDDjkPSQq86/M9+7w80/5sm0oBli2q2TCLCMpSu2tUOTJUblSVo8l3p7Yz4aJ/ua4a8ABGWKe
 VvHcyNOwJs4KhqJ35N7i1P9rcl8c9SorXG4o++DnD3FZAS6ijWegMJL3pTA2CEVxCcRJf1ucDFp
 ArGecklsZXbsnK8AWlA==
X-Proofpoint-GUID: AhpQx3iqDGwikMO8llaboQggpwoXCYFV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602130026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_195947_692978_30F9DB1E 
X-CRM114-Status: GOOD (  13.47  )
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

T24gTW9uLCBGZWIgOSwgMjAyNiBhdCAxMDoyMOKAr1BNIEFuZHJldyBKb25lcwo8YW5kcmV3Lmpv
bmVzQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gT24gU2F0LCBGZWIgMDcsIDIwMjYgYXQg
MDM6NTU6NTlQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPiA+IEl0IGlzIHBvc3NpYmxlIHRv
IGhhdmUgcGxhdGZvcm0gd2hlcmUgYW4gaXJxY2hpcCBkZXZpY2UgdGFyZ2V0cwo+ID4gYSBzdWJz
ZXQgb2YgaGFydHMgYW5kIHRoZXJlIGFyZSBtdWx0aXBsZSBpcnFjaGlwIGRldmljZXMgdG8gY292
ZXIKPiA+IGFsbCBoYXJ0cy4KPiA+Cj4gPiBUbyBzdXBwb3J0IHRoaXMgc2NlbmFyaW86Cj4gPiAx
KSBBZGQgdGFyZ2V0X2hhcnRzIGhhcnRtYXNrIHRvIHN0cnVjdCBzYmlfaXJxY2hpcF9kZXZpY2Ug
d2hpY2gKPiA+ICAgIHJlcHJlc2VudHMgdGhlIHNldCBvZiBoYXJ0cyB0YXJnZXR0ZWQgYnkgdGhl
IGlycWNoaXAgZGV2aWNlCj4gPiAyKSBDYWxsIHdhcm1faW5pdCgpIGFuZCBpcnFfaGFuZGxlKCkg
Y2FsbGJhY2tzIG9mIGFuIGlycWNoaXAgZGV2aWNlCj4KPiAvaXJxX2hhbmRsZS9wcm9jZXNzX2h3
aXJxcy8KPgoKT2theSwgSSB3aWxsIHVwZGF0ZS4KClJlZ2FyZHMsCkFudXAKCi0tIApvcGVuc2Jp
IG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
