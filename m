Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5DAEC61DD3
	for <opensbi@archiver.kernel.org>; Thu,  3 Sep 2026 22:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KVb1s7MD57/oOCZUpob5Fpoo6xoKJwul8dWcwnH9x8k=; b=FKNOR1Bm1b5PeW
	dledgdZ+COWAp9m/x9UxajZbsXf07Re68a0v0Y9ODZlXUSCZ8SLfbCkfqdebYQZQG7c8MMgUG6eQt
	OcYGrDsLFsPz+sHA61sV9C4l6zkctFZM/PLcgtTxbrQWNXSE7wvUZ5I6QZ1CEVbYMGdZEKzqihTtU
	qcXzgxNLQ3+7jFd61vfFY1D6GSAA9KEyrUA7c1KMlfyCV/YXgYq0/FKJwxSa74XdJDUbXZc3pxLXh
	nVpqPEysI4/kRyCc6kU6vuybFomBtmBr6lHpPQcgc7/qCImZT58YAIP9VVw7D/J950m/UAxbi+sRL
	2KOHuEHgf0DzqqLKBLUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2FUI-00000000ga1-0o2T;
	Thu, 03 Sep 2026 22:00:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2FUG-00000000gZT-1agS
	for opensbi@lists.infradead.org;
	Thu, 03 Sep 2026 22:00:49 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683JhWBc1575961
	for <opensbi@lists.infradead.org>; Thu, 3 Sep 2026 22:00:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lZDurmP7dW+L4INUnHkufKOxTbtc7G52sAbI4QenVpQ=; b=dFXqL5A2AOWZ7a8R
	nlSPvKcZh/j6FL5nW47KS/K2Va87snz31ZkfnmqDIj63iyglxx6+pLqRkx7WM7Kh
	mQ+9gWKp7FBDkpoCpWJivvy/cQFfVZmWgbdYFSmxNyvizFdcrV4oM0KS50fBkGSR
	zC4kqwM8EIVv/zRCaCkBm6he3ImZVAPtMS1ys/wgulWDFthZyDeS93a7naTeOU9S
	pS5Oo0xLPk/BWdWoLjhYm2a/l/7PoPBoi/dQKewEbgjOhDQVAAoZRTomhOWpYDbh
	VhEyZtgUJn5lFZ+j/iobATvmIYsgAS2B2q8zlLTa/wwjYcbeUlRdms8ivIDWODNn
	WyuTiw==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf4ekks9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Thu, 03 Sep 2026 22:00:46 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b139665345so262114eaf.1
        for <opensbi@lists.infradead.org>; Thu, 03 Sep 2026 15:00:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788472846; cv=none;
        d=google.com; s=arc-20260327;
        b=Ocq2gy89R6+DYZ/i+rQpYYOUBINFiYGdqGg6Aroh3YHsAfyYdDXmZpGJHzJQ4i8Bhr
         Z12VO6bxVhvYzLcbmWbtHrBWw3cLTlKpklbegDGSXoRx1XQQtv9fgF3fwPk65pGxu05x
         w6ubRuMRy/3h6vy8Zdgrdmky7gFvxoK7ssXMsx2hB8Ujg8AuDv1ILntHn9K7AQEZI/Jl
         WGrNYwSSqN+b6gWy0GGc1dDWK4yUhmQ1GKuPRtfDtVTUNjuMooxnNAIPk1s8ggIZofFd
         aAH7RRCACRjWtfj978a7BK68/b8QlrqZeAYA968YRkmWhNvgeX15MKCJHzja334dgtHx
         8C4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lZDurmP7dW+L4INUnHkufKOxTbtc7G52sAbI4QenVpQ=;
        fh=4ewBQFYQm5N+QAVC2yDkcGgJqnoV8H9Ixi/6ZlMkFAE=;
        b=lxxUedMRCsX3rsA4nhQ7J5NDnnFHNxESyxVmmtqVZ/eKy0MigNssmwzuFYg20AwrF/
         B8lfDCdh5/ECemD21dT+e8YzSx2AfJRIRKAaAiltuwaumdA3pWcMO3HfpYUbKgNj+Bhg
         Vi0CkfpX90UkBMAKcg1XIEEWTuQnXasj65Pff/bsUNXeTiFhE+BLdLpV8qJ37S9KRuYY
         +2QOwXr9vPMO04wq3eRGdq3QSlxu/rk9wxtQJh3zLgeLW4ABNZoJTFcz/MEcaYZt2OpR
         LkiPDk8EwgPsoKlbEakrWUeNB0AMp0MzmHLQrzLHY5t9RxljdFoyrvxe1bt6mKj8990G
         xIsA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788472846; x=1789077646; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lZDurmP7dW+L4INUnHkufKOxTbtc7G52sAbI4QenVpQ=;
        b=gC3xREVAQ+A2CLWWWtOaGBxThkR5CW4EOl0R65Or2urrnq00UXGJyMLp6Y7oQPJ6Mb
         mYHUrb3nnypxh5SLndMFH6Z04y2nuXlRprEfwT8+L9Mno3bRpJYeJiFv4rP7FKTaqOJb
         aP09Yva5toHKjFqG3dGNWwYyilHyN77gkCPHwPuJo0ytapQfnUumGN/xXPh9RUdAufs4
         E4Be1iNEU97AtUQBbbIjJ2UM5LILDlcvRbmRslhc9hMLJt+gVNKyKz9WXAbo5An48h1E
         lFliuyzP8icRupdCFMJ48oW2ECFiq9O+in6f3lHYQA22SEG8o4Ggxc9QzgkMQuubk8g2
         ehcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788472846; x=1789077646;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lZDurmP7dW+L4INUnHkufKOxTbtc7G52sAbI4QenVpQ=;
        b=s0E1Etow43kDWFCUH/nq5CUtzaLP70YOkkOHRaCkGTmLWy9ZkSU4rp23DlCll4ZIHr
         Mh2m8OXAiBdc5W5Wmd0WW6nJm+MpGoj65XAUIhBwb+Iwyg0PD/mGwO345S4KE3uT177o
         WRvcfMe9C4dR+SIaxMMmnfPJvFnyqE1bm8WL52ybUfLyursuv9++Zk8ND0nNlY5lZ32u
         xI/B2Jx56SENXd7aJbuD9aL1sCqNksCbJz1x//ifgnr4Tu5HVUdWXBfUbwTbpgwvEUZl
         nDxUBlexx4Dgb5IXVv/fTEX6C4Fai0hBefqaybnvyky3y09GmC3lkgtLukOMsr2l5eYJ
         sg1g==
X-Gm-Message-State: AFuF++msNgrT1KECuPRtJTFNWUYgAWGkfVKpYogQngZLXBVK0e1h0pyR
	H6p+V2E61O0YzJHOs6v77fwg+uFXrRoivmKb4QLAVA3aklhiFIzs3MyypM33n+C5hXyzFIG6HCU
	4ynbyQXsZUojD0bVE8QQvpYBZEHDoaGKPXRlSgQGPhPj7TCAOftUyX2mCWFWMVBkFglnL7+Llmy
	dicrs9Lu/XOg+y8YVPszWDNkPjnDh0rpT4TopFi7hD8hT7/Gh9j8E=
X-Gm-Gg: AYBFou2gN5QrYG+PspH/Fwe5jnfAWtVlatX4i6o3NqUWYcJuSw+sMzuXI5Dt9ReaDzQ
	aIUEIXI5soPMa4PAkYmCk6pLC3JjkSUoP0rqldLwkNiQI59P0Z+ISAWFs96HbJpNc9x8TUYjcKA
	kwtVGxrOI0vnenJbSHN20lKuVvOMjiEoriWKhGwzIXCFo1BV21x87ugH/x/g==
X-Received: by 2002:a05:6820:1c8d:b0:6b1:a9fc:96b6 with SMTP id 006d021491bc7-6b6fb6d296dmr1560529eaf.12.1788472845873;
        Thu, 03 Sep 2026 15:00:45 -0700 (PDT)
X-Received: by 2002:a05:6820:1c8d:b0:6b1:a9fc:96b6 with SMTP id
 006d021491bc7-6b6fb6d296dmr1560478eaf.12.1788472845428; Thu, 03 Sep 2026
 15:00:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260817090503.2104998-1-peter.lin@sifive.com> <20260817090503.2104998-9-peter.lin@sifive.com>
In-Reply-To: <20260817090503.2104998-9-peter.lin@sifive.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 15:00:34 -0700
X-Gm-Features: AcwNN1U_BHpqkgJwJ3NWD0LsN_Uu-kXLFl0utqirrz9pL791Hd0cHk9EM0bL69Q
Message-ID: <CAAVgOkJpXeEF00qwn_2GSLoa_fyxuTefTm8Y27N=FhhCzRnHJQ@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] lib: sbi: display World ID configuration at boot
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com, greentime.hu@sifive.com,
        anup@brainfault.org, scott@riscstar.com, conor@kernel.org,
        dave.patel@riscstar.com, raymond.mao@riscstar.com,
        robin.randhawa@sifive.com, samuel.holland@sifive.com, krzk@kernel.org
X-Proofpoint-ORIG-GUID: 2B7jNdHcQNiY97X4eBubNiT310G8WW0s
X-Proofpoint-GUID: 2B7jNdHcQNiY97X4eBubNiT310G8WW0s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE5MiBTYWx0ZWRfXyAFzoWb7ed8n
 EcG5S8/ne4Jy2IKj24p944zefm7W6+Ta9AE1N2bYAMNl0iLz45NJ/56i9lgjhBhWtm49FG9xHOW
 Z+xvpNvJ1lfkrZ3BgpkuEAAdi9FNd4rb+OOjsnAffmREkmaDrNPAVkDaeysFb5sl65k/IneqF42
 m7JOwRcf0NU9tO1TdBEu0YtBq+xBfAPvq1pZXEvSjmqQd7s3wGKAEjL/FFzu7D7tM7pv2l2ZP1Q
 P1GZhY+NDotHdTZMEg5xF677PabYul+OdyqOdg7TJ1FSBOQDPOUqgEKAplC1VeMHa3ExF+xP9l1
 l5rQn/5EQm1uiANc5pYvFq6YiY9iPqo9fdavH02lO9IHZkYGfei+JyJEO9erp29Vxcaw4REbGyg
 KakhS8419ni0OxQi4WDQo57bsTznEomExt97mSdj+zOgGgY7KDuFtPglHUaeNIUP3jvgZRllNDe
 +nl5Pk3jzqi3HVbqneA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE5MiBTYWx0ZWRfX2nEwKNBaQfyv
 wTF600CJ2HFOZRqjw66hb1GUVz8f1w0J2aAm/ARBA/c+8kUQ3ABVHBzG1Hy8FTLk9f/XehzRFga
 OAmQTYfHAy6pWwAbKNVNclz8zxmFnIY=
X-Authority-Analysis: v=2.4 cv=PKc/P/qC c=1 sm=1 tr=0 ts=6a99ee0e cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8
 a=viVnANhlhBBK-J0EohcA:9 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22
 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_06,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_150048_532252_CC52F83C 
X-CRM114-Status: GOOD (  19.81  )
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

T24gTW9uLCBBdWcgMTcsIDIwMjYgYXQgMjowNeKAr0FNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gRGlzcGxheSBkb21haW4tc3BlY2lmaWMgV29y
bGQgSUQgKFdpZC9XaWRkZWxlZykKPiBhbmQgTS1tb2RlIFdvcmxkIElEIHNvdXJjZSAoZnJvbSBt
d2lkL3Btd2lkKSBkdXJpbmcKPiBpbml0aWFsaXphdGlvbiBmb3IgUklTQy1WIFdvcmxkcyBkZWJ1
Z2dpbmcgYW5kCj4gdmVyaWZpY2F0aW9uLgo+Cj4gU2lnbmVkLW9mZi1ieTogWXUtQ2hpZW4gUGV0
ZXIgTGluIDxwZXRlci5saW5Ac2lmaXZlLmNvbT4KPiAtLS0KPiAgbGliL3NiaS9zYmlfZG9tYWlu
LmMgfCAzMSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIGxpYi9zYmkvc2JpX2lu
aXQuYyAgIHwgMTMgKysrKysrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDQ0IGluc2VydGlv
bnMoKykKPgo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9kb21haW4uYyBiL2xpYi9zYmkvc2Jp
X2RvbWFpbi5jCj4gaW5kZXggZmE2OTE3MGIuLmQxZjdiYjBjIDEwMDY0NAo+IC0tLSBhL2xpYi9z
Ymkvc2JpX2RvbWFpbi5jCj4gKysrIGIvbGliL3NiaS9zYmlfZG9tYWluLmMKPiBAQCAtMTAsNiAr
MTAsNyBAQAo+ICAjaW5jbHVkZSA8c2JpL3Jpc2N2X2FzbS5oPgo+ICAjaW5jbHVkZSA8c2JpL3Ni
aV9jb25zb2xlLmg+Cj4gICNpbmNsdWRlIDxzYmkvc2JpX2RvbWFpbi5oPgo+ICsjaW5jbHVkZSA8
c2JpL3NiaV9oYXJ0Lmg+Cj4gICNpbmNsdWRlIDxzYmkvc2JpX2hhcnRtYXNrLmg+Cj4gICNpbmNs
dWRlIDxzYmkvc2JpX2hlYXAuaD4KPiAgI2luY2x1ZGUgPHNiaS9zYmlfaHNtLmg+Cj4gQEAgLTUz
Myw2ICs1MzQsOCBAQCB2b2lkIHNiaV9kb21haW5fZHVtcChjb25zdCBzdHJ1Y3Qgc2JpX2RvbWFp
biAqZG9tLCBjb25zdCBjaGFyICpzdWZmaXgpCj4gICAgICAgICB1MzIgaSwgaiwgazsKPiAgICAg
ICAgIHVuc2lnbmVkIGxvbmcgcnN0YXJ0LCByZW5kOwo+ICAgICAgICAgc3RydWN0IHNiaV9kb21h
aW5fbWVtcmVnaW9uICpyZWc7Cj4gKyAgICAgICBzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gg
PSBzYmlfc2NyYXRjaF90aGlzaGFydF9wdHIoKTsKPiArICAgICAgIGNvbnN0IHN0cnVjdCBzYmlf
aGFydF9mZWF0dXJlcyAqaGYgPSBzYmlfaGFydF9mZWF0dXJlc19wdHIoc2NyYXRjaCk7Cj4KPiAg
ICAgICAgIHNiaV9wcmludGYoIkRvbWFpbiVkIE5hbWUgICAgICAgICVzOiAlc1xuIiwKPiAgICAg
ICAgICAgICAgICAgICAgZG9tLT5pbmRleCwgc3VmZml4LCBkb20tPm5hbWUpOwo+IEBAIC02MDgs
NiArNjExLDM0IEBAIHZvaWQgc2JpX2RvbWFpbl9kdW1wKGNvbnN0IHN0cnVjdCBzYmlfZG9tYWlu
ICpkb20sIGNvbnN0IGNoYXIgKnN1ZmZpeCkKPiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAg
ICAgICB9Cj4KPiArICAgICAgIGlmIChzYmlfaGFydF9oYXNfZXh0ZW5zaW9uKHNjcmF0Y2gsIFNC
SV9IQVJUX0VYVF9TTUxXSUQpKSB7Cj4gKyAgICAgICAgICAgICAgIGlmIChkb20tPmhhc193aWQp
IHsKPiArICAgICAgICAgICAgICAgICAgICAgICBzYmlfcHJpbnRmKCJEb21haW4lZCBXaWQgICAg
ICAgICAlczogJXVcbiIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkb20t
PmluZGV4LCBzdWZmaXgsIGRvbS0+d2lkKTsKPiArICAgICAgICAgICAgICAgfSBlbHNlIGlmIChz
YmlfaGFydF9oYXNfZXh0ZW5zaW9uKHNjcmF0Y2gsIFNCSV9IQVJUX0VYVF9TTVdJRCkpIHsKPiAr
ICAgICAgICAgICAgICAgICAgICAgICBzYmlfcHJpbnRmKCJEb21haW4lZCBXaWQgICAgICAgICAl
czogJWx1IChtd2lkKVxuIiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRv
bS0+aW5kZXgsIHN1ZmZpeCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNz
cl9yZWFkKENTUl9NV0lEKSAmIH5NV0lEX0xPQ0spOwo+ICsgICAgICAgICAgICAgICB9IGVsc2Ug
aWYgKGhmLT5oYXNfcG13aWQpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBzYmlfcHJpbnRm
KCJEb21haW4lZCBXaWQgICAgICAgICAlczogJXUgKHBtd2lkKVxuIiwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGRvbS0+aW5kZXgsIHN1ZmZpeCwgaGYtPnBtd2lkKTsKPiAr
ICAgICAgICAgICAgICAgfSBlbHNlIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBzYmlfcHJp
bnRmKCJEb21haW4lZCBXaWQgICAgICAgICAlczogdW5rbm93blxuIiwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGRvbS0+aW5kZXgsIHN1ZmZpeCk7Cj4gKyAgICAgICAgICAg
ICAgIH0KPiArICAgICAgIH0gZWxzZSB7Cj4gKyAgICAgICAgICAgICAgIHNiaV9wcmludGYoIkRv
bWFpbiVkIFdpZCAgICAgICAgICVzOiB1bnN1cHBvcnRlZFxuIiwKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICBkb20tPmluZGV4LCBzdWZmaXgpOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAg
IGlmIChzYmlfaGFydF9oYXNfZXh0ZW5zaW9uKHNjcmF0Y2gsIFNCSV9IQVJUX0VYVF9TTVdJRERF
TEVHKSkgewo+ICsgICAgICAgICAgICAgICBzYmlfcHJpbnRmKCJEb21haW4lZCBXaWRkZWxlZyAg
ICAlczogMHglIiBQUkl4NjQgIlxuIiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICBkb20t
PmluZGV4LCBzdWZmaXgsIGRvbS0+d2lkZGVsZWcpOwo+ICsgICAgICAgfSBlbHNlIHsKPiArICAg
ICAgICAgICAgICAgc2JpX3ByaW50ZigiRG9tYWluJWQgV2lkZGVsZWcgICAgJXM6IHVuc3VwcG9y
dGVkXG4iLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIGRvbS0+aW5kZXgsIHN1ZmZpeCk7
Cj4gKyAgICAgICB9Cj4gKwo+ICAgICAgICAgc2JpX3ByaW50ZigiRG9tYWluJWQgU3lzUmVzZXQg
ICAgJXM6ICVzXG4iLAo+ICAgICAgICAgICAgICAgICAgICBkb20tPmluZGV4LCBzdWZmaXgsIChk
b20tPnN5c3RlbV9yZXNldF9hbGxvd2VkKSA/ICJ5ZXMiIDogIm5vIik7Cj4KPiBkaWZmIC0tZ2l0
IGEvbGliL3NiaS9zYmlfaW5pdC5jIGIvbGliL3NiaS9zYmlfaW5pdC5jCj4gaW5kZXggYWNkMmY4
YjYuLmY3NzFmNTQ4IDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkvc2JpX2luaXQuYwo+ICsrKyBiL2xp
Yi9zYmkvc2JpX2luaXQuYwo+IEBAIC0xNjcsNiArMTY3LDcgQEAgc3RhdGljIHZvaWQgc2JpX2Jv
b3RfcHJpbnRfaGFydChzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gsIHUzMiBoYXJ0aWQpCj4g
ICAgICAgICBpbnQgeGxlbjsKPiAgICAgICAgIGNoYXIgc3RyWzI1Nl07Cj4gICAgICAgICBjb25z
dCBzdHJ1Y3Qgc2JpX2RvbWFpbiAqZG9tID0gc2JpX2RvbWFpbl90aGlzaGFydF9wdHIoKTsKPiAr
ICAgICAgIHN0cnVjdCBzYmlfaGFydF9mZWF0dXJlcyAqaGYgPSBzYmlfaGFydF9mZWF0dXJlc19w
dHIoc2NyYXRjaCk7Cj4KPiAgICAgICAgIGlmIChzY3JhdGNoLT5vcHRpb25zICYgU0JJX1NDUkFU
Q0hfTk9fQk9PVF9QUklOVFMpCj4gICAgICAgICAgICAgICAgIHJldHVybjsKPiBAQCAtMTk5LDYg
KzIwMCwxOCBAQCBzdGF0aWMgdm9pZCBzYmlfYm9vdF9wcmludF9oYXJ0KHN0cnVjdCBzYmlfc2Ny
YXRjaCAqc2NyYXRjaCwgdTMyIGhhcnRpZCkKPiAgICAgICAgIHNiaV9wcmludGYoIkJvb3QgSEFS
VCBEZWJ1ZyBUcmlnZ2VycyAgICA6ICVkIHRyaWdnZXJzXG4iLAo+ICAgICAgICAgICAgICAgICAg
ICBzYmlfZGJ0cl9nZXRfdG90YWxfdHJpZ2dlcnMoKSk7Cj4gICAgICAgICBzYmlfaGFydF9kZWxl
Z2F0aW9uX2R1bXAoc2NyYXRjaCwgIkJvb3QgSEFSVCAiLCAiICAgICAgICAgICAiKTsKPiArICAg
ICAgIGlmIChzYmlfaGFydF9oYXNfZXh0ZW5zaW9uKHNjcmF0Y2gsIFNCSV9IQVJUX0VYVF9TTVdJ
RCkpIHsKPiArICAgICAgICAgICAgICAgdWxvbmcgbXdpZCA9IGNzcl9yZWFkKENTUl9NV0lEKTsK
PiArCj4gKyAgICAgICAgICAgICAgIHNiaV9wcmludGYoIkJvb3QgSEFSVCBNLW1vZGUgV29ybGQg
SUQgICA6ICVsdSAoJXMpXG4iLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIG13aWQgJiB+
TVdJRF9MT0NLLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIChtd2lkICYgTVdJRF9MT0NL
KSA/ICJsb2NrZWQiIDogInVubG9ja2VkIik7Cj4gKyAgICAgICB9IGVsc2UgaWYgKGhmLT5oYXNf
cG13aWQpIHsKPiArICAgICAgICAgICAgICAgc2JpX3ByaW50ZigiQm9vdCBIQVJUIE0tbW9kZSBX
b3JsZCBJRCAgIDogJXUgKHBtd2lkKVxuIiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICBo
Zi0+cG13aWQpOwo+ICsgICAgICAgfSBlbHNlIHsKPiArICAgICAgICAgICAgICAgc2JpX3ByaW50
ZigiQm9vdCBIQVJUIE0tbW9kZSBXb3JsZCBJRCAgIDogdW5zdXBwb3J0ZWRcbiIpOwo+ICsgICAg
ICAgfQo+ICB9Cj4KPiAgc3RhdGljIHVuc2lnbmVkIGxvbmcgY29sZGJvb3RfZG9uZTsKPiAtLQo+
IDIuNDMuNwo+CgppZiB5b3UgZGVjaWRlIHRvIHJlbW92ZSBhbGwgdGhlIGJvb2xlYW5zIG1heSBi
ZSB0aGVuIHRoaXMgcGF0Y2ggd2lsbApjaGFuZ2UgYXMgd2VsbAoKUmV2aWV3ZWQtYnk6IFBhd2Fu
ZGVlcCBPemEgPHBhd2FuZGVlcC5vemFAb3NzLnF1YWxjb21tLmNvbT4KCi0tIApvcGVuc2JpIG1h
aWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
