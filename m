Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9944CC531D0
	for <opensbi@archiver.kernel.org>; Mon, 27 Jul 2026 13:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qkAn29LQ3j3oKtsitNXfG/aBaIXVbn1Fk9S7Cocq10A=; b=geBdPeXn8tSlBB
	KyqjApOQtVdKY1qxOkSEDVy8pSSljsYBpbtuxhWv5NeV/gpP5Zx8bGEAD4e26QLXwgKUXLZ3L4d3I
	2vgAyB0+AydKscN3zkb3+55n4bZGZ/4DKb9K+mlVAtYKH2rl54+8MqCN6mPSqzhoUeeswWpH3n7kp
	3jaJNxnpQKEWL7Vcns3R6YxjFRe7hsJupar9cTh0ai/5WixGlKEyM2BQv86IBtvkfLftA5jH5/eM2
	ZAkQskTzno3s2WiZmfGM5fKGvDa2lyOSFsi8Cs0q6iwBAJ0DJNYtn3TFxFTk5ui8Ka4ddOZqzRreq
	9MaI5PSvjq4TOKFGsIbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woL4I-00000002njU-3fTg;
	Mon, 27 Jul 2026 13:08:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woL4G-00000002nid-2bxi
	for opensbi@lists.infradead.org;
	Mon, 27 Jul 2026 13:08:29 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RAM5rq3438955
	for <opensbi@lists.infradead.org>; Mon, 27 Jul 2026 13:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eek9tVZimxCRQrU/tc6x7fP853HatsnekoBVAekKJFU=; b=iDbkkEmO5bidCMHm
	ahNf4dAaRZKpFXWoHGRIWUjhHZ+Q+r+uszAqsM3DpBIScl5Q37CrahFxYUykA3r9
	aN7RkobERNQhhseuuXn+jKu8YLoyFVnY4g0Ads9usvUkvT4fgkzygVBxgA7ZlJIJ
	E1lkxIrM2kCXxIHxrQd/DjkzwPMCXIF4dAMGRN1ePiZ8qKljkQgqcxqR2lwfZWTH
	msMHZOqbat5Yj/E0clVaXhQYPTLiQJyL0l9Po1TuhJmrCDwW4jYcV5A2NC/E2tU1
	Y6kOhhI/+ZEhcbnGJI9V/szOL4zste46UkyjOtVs7DbJCgHxNJe7pa5i2URcByto
	VtrFqw==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4ukrrqn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 27 Jul 2026 13:08:27 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7f5b54da461so37786227b3.3
        for <opensbi@lists.infradead.org>; Mon, 27 Jul 2026 06:08:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785157707; cv=none;
        d=google.com; s=arc-20260327;
        b=OFTZjSqQ6vT6DaTlkNPBphj/CQNnadIXcLXphtKz5RH2R1jU3pwbm1I3ycInA4NvBN
         Qm9O3RdOaMfS8qn+b6fvzXaWfFg2Etv0d41W4eNFEjCio8PBz6cJEho037ycNSb718zK
         aS5yyJokAOxTT4gFX+QjofjRgkW+PV5aRbfuz06MFpcg/sCCUcLXi3pgYZIwVU/kNTNq
         Zcz7pF8ObtrNmi7cib2caA6wdtfH0F72MIwDaJK+H5oW4EGmUa1K+HCOy1q8mtx1Hd4X
         ZBQXwi9lsjjHxvX2misKHiymQ/ojifj0o3LVxdYTkd8axOMXl/P3yVBTBgl+i4DPYzA8
         ZAew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eek9tVZimxCRQrU/tc6x7fP853HatsnekoBVAekKJFU=;
        fh=ChRIb1hWvRyYtYhbMBDEgmNJ83ccdWGKdTpSsMXMt1I=;
        b=ZF9v2ev+LMA7Q3l0u7K4jmCwst/a6JUFah6ylP8zs9WszYW6iDiRWPlmOQI8/U4p3O
         u3g2KtXFgv8TMC2V4J2dOtXE7QWEMOtFHXFcutl20e13YLfBnPlZzs3roEyuYRyyEYJ7
         cmnlqyiujJpHiiUVwjnAsAr9xZr1XhVLl2cKTqRT7a0RVeacYrIY4kvGE/ast9S6QFmj
         3EhEEYiFOctKndtr55AE3FdB/Ep5zwnCnyYFSCoSBDbAuv31dAPl3skxQI67jE3korSa
         TJkjuqUUjQQYWw22uOno+5P5r51PhypAfEnMKbAmi9KlxAfTFetdletBrMqcBUphn6GR
         CF/Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785157707; x=1785762507; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eek9tVZimxCRQrU/tc6x7fP853HatsnekoBVAekKJFU=;
        b=Q7B+QqnPvks6ZmCgK5PnGz/ZqXE4L6DOMHQAhHYs+HHVYNLbaO/+iJlyb7I2QDXQNR
         y8VzD+AXy5ufNVIpeleZ+ID1uIQSGmiCLbn8LXidSDqhqDQqBuMNsAkOaepD0eekBPiL
         OkZ1wJK61DLRb8ZsDzN+gPOZbZ+1PHfGJjVWLAjgq62JkCOJ8dJLTpkJCnvLVlLE0aIA
         I9M9Be4nu0rFjdW4KSg/zp9di4aHHuMKNSlYqw493w0w+QLk9yET3U558Ea/+y1Kz/Ia
         YF0YhmNfG4SsE07lJM2aAVYOwlKPZCMv1be6L4/bLio0H7nn/DmTNX80z9s697WIlsh9
         644Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785157707; x=1785762507;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eek9tVZimxCRQrU/tc6x7fP853HatsnekoBVAekKJFU=;
        b=kZDYfDCrXOgC/Bj0J8nS8FH6LFE4n0qGriNcIKWK/QhvLw6KdKjs7wL2VBfSgewXD7
         oSpoKBRuWOKqck1Lgv5nEiGhe9JJLQUwLlyLFzrmHwbqFp6NKm49XiUPpvvaaflVPP0p
         XPb/Qte0xoB6FF5r4MzrQLDX3WQyrHrX8PXXQ1YuxbL6VsRnBym10+XCFiNm09Ewsy/S
         nIJABGKJ6gKrD+U/wuR5A/miNLvRAEAfWmoYBDMcC3tiothK0sdqO/3ZOyo0CK6WybZH
         4J35qCvWzPXREfD1BGLKVnPv1uVfP/bg630+5YtXLR7blNBYMpsY804hDluH+zzGfjRW
         F7YQ==
X-Forwarded-Encrypted: i=1; AHgh+RrR7wdCYmDuUtj6WGfGNDZvnzFl+rUIMj4DdqalSvoie8kkfs7foC6fM0F6+7ZetFHOJQ/4StUC@lists.infradead.org
X-Gm-Message-State: AOJu0YyGQ2qZMKgZnU023qerGhHj6h1wONswg3+W4x1tVPlKYTHZ1dlP
	zNODWK7dlbW+nKOhCUmktaWXz1PADaKXkWk+BL6UWAKemKhmvhCCNYU3CkjY1Fky3LGkRfmp9TZ
	TT6CPmog+iTD+leH5H8PRv5u4WU1MJQHARMNGDq5titEH2lGvB4IZS8Aa9Y9IchEHEJOb6tv41/
	Wwcjm23XS608VYdJ1vuZY/e2arD7LsPdQGzBlPxUYD
X-Gm-Gg: AR+sD10e6gNrLNRbe1tq0j+Wi1QUtwM1nr+G6ZYvbUgHQB+t2gRzLyWSu2ARloPxokF
	AQUaOCEnU7154BUjl8dZpkppP+TJ/c4ebhbaxkRUxGZixSCm/n63OHRuM+lFR5J7ooZ8PUBH+ZE
	E5Z6MIMnKPCcgpU1o6v7TzsLJZMMwvEf6anJHkRaj5S9ciDzfYYnoER3YqzOw=
X-Received: by 2002:a05:690c:9a8f:b0:81e:685a:2f78 with SMTP id 00721157ae682-81f69e2e736mr25918267b3.43.1785157707308;
        Mon, 27 Jul 2026 06:08:27 -0700 (PDT)
X-Received: by 2002:a05:690c:9a8f:b0:81e:685a:2f78 with SMTP id
 00721157ae682-81f69e2e736mr25918137b3.43.1785157706814; Mon, 27 Jul 2026
 06:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260727042504.1743250-1-anup.patel@oss.qualcomm.com> <20260727042504.1743250-6-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260727042504.1743250-6-anup.patel@oss.qualcomm.com>
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 18:38:15 +0530
X-Gm-Features: AUfX_mwFX6vhOQazmHAp6chKABpWMbnRKPqyAnu8pRb-6NjUWmUmR7Rr3d9eBGM
Message-ID: <CAFR3w36Ve+=snFHieVCY2AFYjfc=4_4vSR-yKz4jzZZ0KT=zaw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] lib: sbi: Print list of all hart protection
 mechanisms at boot time
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
X-Proofpoint-GUID: MW2COk4zEn1vTHCHHWe1CljH_lpJyr0_
X-Proofpoint-ORIG-GUID: MW2COk4zEn1vTHCHHWe1CljH_lpJyr0_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEyNyBTYWx0ZWRfX3VydYIUfbqfH
 rQ39aHYwyXpUOA5FNJsXtBGhiVT37N4f0yf8PJ6RSj4kE26V0Zl37/zQAEcc5vIp17XisPg08U4
 iM9YkrQWhXLm7lPQPe0UKlykzgSLAnI=
X-Authority-Analysis: v=2.4 cv=PeHPQChd c=1 sm=1 tr=0 ts=6a67584b cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=0nWREx_VDNvy2z94HyMA:9
 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEyNyBTYWx0ZWRfX/PLR4RocLi/+
 sUsj2NSxaqdFdkyHDT8mFwIFsOns7yi+b3EFxSanIcPsixT1KHHFfDz8wJSZZrq6TC5yip4nBoX
 ravKzdxLFayflDK64g4bL5c0NIuClJUmxLGfv+IjhO16gXU7i8os5jgWaK5K0LbyCuuL5xx60c0
 hrJufmidtCjA5ktFgFmb22zX4h57H5QNS2S8LDnuw4ppGiktu2LsC9Q4iU0/EhEn8Tejt8v5twj
 hhbeUh4PbkWmnMz0JSGTAj7/ARCuAZ+LaSRSGYqkvlo29gXsv8Vc+7r/W0Y8r8n/M6pXeTkzlW4
 D9NCudF8nZzzdI0Un7rM5qlCPWc/DA9b6bg+aYkUvf6WF+tlJE5xRScYhokpd40Z/2hV1X9ovhW
 C9czNIoFctzOimhWXh1//4QjV/ktxa7I4NVjNwdCho0pMGdl4OD5mqL0KnurehmvJU3jLpgh95C
 d4XLMB7IymSxwv2LomQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_060828_779582_E1BD443D 
X-CRM114-Status: GOOD (  11.10  )
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

T24gTW9uLCBKdWwgMjcsIDIwMjYgYXQgOTo1NeKAr0FNIEFudXAgUGF0ZWwgPGFudXAucGF0ZWxA
b3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBJbnN0ZWFkIG9mIHByaW50aW5nIG9ubHkgdGhl
IGJlc3QgaGFydCBtZW1vcnkgcHJvdGVjdGlvbiBuYW1lIGF0Cj4gYm9vdCB0aW1lIGxldCdzIHBy
aW50IGEgbGlzdCBvZiBhbGwgaGFydCBwcm9qZWN0aW9uIG1lY2hhbmlzbXMuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBBbnVwIFBhdGVsIDxhbnVwLnBhdGVsQG9zcy5xdWFsY29tbS5jb20+Cj4gLS0tCj4g
IGluY2x1ZGUvc2JpL3NiaV9oYXJ0X3Byb3RlY3Rpb24uaCB8ICA3ICsrKysrLS0KPiAgbGliL3Ni
aS9zYmlfaGFydF9wcm90ZWN0aW9uLmMgICAgIHwgMzQgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKy0tLQo+ICBsaWIvc2JpL3NiaV9pbml0LmMgICAgICAgICAgICAgICAgfCAgNiArKy0tLS0K
PiAgMyBmaWxlcyBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+CgpS
ZXZpZXdlZC1ieTogUmFodWwgUGF0aGFrIDxyYWh1bC5wYXRoYWtAb3NzLnF1YWxjb21tLmNvbT4K
Ci0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
