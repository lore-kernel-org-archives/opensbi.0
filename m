Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38C9C531D0
	for <opensbi@archiver.kernel.org>; Mon, 27 Jul 2026 13:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QWdFKQX6iSaYSHyuUAtWdUTV4FXKqWf4/KIxSgD+dWo=; b=ltKxSYgcPPI9rs
	GddgbhcYOSvolCbYmPv6MlbJ1lFFgzjqrOIidfvv0TIIMM4DluC5Tg4s3O9pU7gqXGMlTwa0NnYMu
	/UUAdCXPOXkIEaG9z6HrgClqWiH+pbU2zdTx2D3eQS+9piTTJ0f+SJhPuq+FQlN2IKXkzM+VK4RdQ
	/cK7LJc5Rs9sp0sQgGoEUrc1oamvfkZLoRESUT3UQkgzV1nznmjZzGVqWRJmC7FI8ns/M+wmWRZuZ
	khs3xN2HyHkSwzlghPNn4JhmHfon5Cfc8+c3rSRW/gvoeZKVSE3ySu1rOpH2Vvjztd41Qk1O6koCt
	uv4slsTVcTU2/Sm7igJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKw2-00000002lVm-0pEm;
	Mon, 27 Jul 2026 12:59:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKvz-00000002lTn-1OPa
	for opensbi@lists.infradead.org;
	Mon, 27 Jul 2026 12:59:56 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RAMLjV3427831
	for <opensbi@lists.infradead.org>; Mon, 27 Jul 2026 12:59:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Uc3FX5YVXGKjLP0f0vtPsQPsRUuwUXH61yhPLeLDwI=; b=jPo1nBlpA3fMRGxq
	/Z/4+XXzorhPanafKYcv16kLD5DLWw6aQ2hqBKva0gyNr0gOZARF4PE8HZiInV+i
	Lw6hhA9lniClBibxvNM7L0ts8pnLSBx8dvIzTZCRf/ZwNPNKY509UTOglDFQjSol
	5hUh0C/5bsfT+IObPLLKobHPZXlm46D6wQrmvu/XqpAGMeYNBP3FX05irLYTgoX4
	v+zLXCYUDCTtlyZQ28b1O6e7lwF16tGnS2ofwAWwotxwTnsqRwA1I0r8W3LAAdIJ
	ZeYULEPLni0s4DzukmiNNwpdfrwBV11g9UYZShhXAA7hvggA65d0wL0Nuy52dCRZ
	g+lylg==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fnsxs2n6x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 27 Jul 2026 12:59:53 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-81f3c871fd7so72938077b3.2
        for <opensbi@lists.infradead.org>; Mon, 27 Jul 2026 05:59:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785157193; cv=none;
        d=google.com; s=arc-20260327;
        b=C4ET0R6KA7dNrotaVompeTTCRMy+RcocyESnC8Y5/Fp/FgLOlz1gi8+3ajsC2RqF1q
         kd5TFpfNCNks3lBo1p/orhTQcxhcHe9JyCkKju8KRaW8u1GgYCor6Qw6ZNU2Z9uy1+Ep
         Iob8OryrLRR00t5qKa+JWdtr3Mfa6p7rKXVWCZYjkns+PSOEsMaBx9wvoqpqOsMK0zGD
         UlrOsiCUMelVjF+TElFLfGeclyc1jW50j88M4YVn/qhNhm9qpoMwOmF3buHvKTbuhRmI
         SctU3ykJ9t+/s1K11E2mFVusuoWsUPFT99kX+Mxf05e6DPaHlh3rPAgWEPfDXSwxmGFE
         ld3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+Uc3FX5YVXGKjLP0f0vtPsQPsRUuwUXH61yhPLeLDwI=;
        fh=E7OKewNTJV1IHi3lLoC9NsB77KtSk6KYQ+nsYcto7e4=;
        b=FcLnLijR199FoKUMM5MumbSvq2wr5FonCT9nLW6qAAHHeewp0/hKvUopPDXdTB9+ck
         GWcrhCup3fzkXToERlzByoGEdZ3bUx6qBBeseyX2DIe5rlbCwD6sKS40uWkepvTipW33
         xG2rHiH5zRqYXKOlCAOGRdEI+HYqd/mJHmxnXAv7VNtEBeNgXYkhlN4C1t1/Cgsffbrq
         vz76smucpxGHLS05PJCvlrdUgOK4QVrrieQW6ILbUk9Ek1FTm24aRyRhmRsTQOvA8G80
         NX+Hl11zQuGAEHaGF05kAcXzjQ/fKnY5wpsSRYcjAYPN2EYdenm6kl8sj+3FIaQua9UI
         HcWw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785157193; x=1785761993; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+Uc3FX5YVXGKjLP0f0vtPsQPsRUuwUXH61yhPLeLDwI=;
        b=ZBFzeBW5YYhSGwtWeaVHKmImx7TTWxXmMM1BW04R7jUbGEut8w6cOvNwbBAc1k3mc0
         5wcr2QuRFRrc2vmmkMY65vfqUk9lS9DLbRbtSNVygBRYSWXMj/9RfBoIglKJ7L3gyB65
         s4LN4N2B3Q9GlbDrk5FtNuhy76W68PjtY9Lkl94wxlM2aluTO/+ZpFQeGUOH1T3pqldF
         NnJF0UNVMmbnK2mSkeDX+KqWw9xI0I297fUNS7y5CS412gDQJ4WBgEXMJT6K2haaPxhT
         pZnjL+BM/Am7XSpdMhYVXu6gMWrsbNaJpK8gq+2eIdDd+afCqsnZFyTYVkuxS7RC8iIm
         XChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785157193; x=1785761993;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Uc3FX5YVXGKjLP0f0vtPsQPsRUuwUXH61yhPLeLDwI=;
        b=jzB7zZ119U3jIpPGkw5jwlS5WBjylddQwek7TjOziypumqF7hJq24wwzojU1HPyFFF
         GWEF7qoSqdI+pO0whIiyF3Q0WRybKDyIe8x9SG3udnbU4JaVJ1ezbDNVzNPwKkUY+Ftw
         J4sSGS8n3M9QBKd8+BMGOHFZIK2KyY80xMGFd0EZ4TvFvDXy/P4M8NUS95TUHjx7mvk2
         8N0vQ7aYppPIw7GVHHf+L84II3O/CZcntS9A0rKjib8FiJIi3wNNjfONm2y06dfyChBX
         UW+6EQ30GOdRHvKfHDa3i9ZPR1GUcHKlQVmhouyI6MuOve+DcGOT06hXuqyxOiNWqsNm
         5S/w==
X-Forwarded-Encrypted: i=1; AHgh+Rrc0bRel6Rp/j7b5GU3Mw1OP1kASwY9AqpEMgsRHhmO/sDudPw7TnR1f2giZbmjeIRH/XXg90qN@lists.infradead.org
X-Gm-Message-State: AOJu0YwenOWAc41zKy0jNCjNa/5gABMpqg1wDBj9gS6fSniaRU+uCW4w
	AViZOtih9Cwe1oekF987DqdYKMG+hQHdH/R4mJP+nFHTJHSWQCHpBSvFltAfldgjWGdf5I0b00S
	GQns5KSZy5baPuJWyxhmfEcV8DeBMlrFPbprOdyRgbpxD2smfqH7DchfS0CLWhRyJPi8IQ1bT+I
	JcReW1eeDtHE2/oAr9rJ/2Pf2QPhXbEhsRGlBAPxUI
X-Gm-Gg: AR+sD137FYMhoBGNqWihr1WO9ljwLClJLizoKXB+KC5JRTn2ay0xZgL99fPb/LjG6DV
	uP9SUAnYe3oYtJWtXN/ovwK2WHpmg/WdnhcjaPgmhgEgTMgmeBV0R1F8QdSw0XvLejTyAmcw21f
	0dI9t/gkMqyBBaSVFInrXb9m25E5hI5eog3PB8zj74DPcqUI1HhAEDy/nt/G4=
X-Received: by 2002:a05:690c:6301:b0:81e:528d:3625 with SMTP id 00721157ae682-81f69d19ed1mr31143237b3.24.1785157192829;
        Mon, 27 Jul 2026 05:59:52 -0700 (PDT)
X-Received: by 2002:a05:690c:6301:b0:81e:528d:3625 with SMTP id
 00721157ae682-81f69d19ed1mr31143077b3.24.1785157192485; Mon, 27 Jul 2026
 05:59:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260727042504.1743250-1-anup.patel@oss.qualcomm.com> <20260727042504.1743250-5-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260727042504.1743250-5-anup.patel@oss.qualcomm.com>
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 18:29:41 +0530
X-Gm-Features: AUfX_mykrTNrLihN74rA2gw9ZkISzkSQJB7xhMc81L7JWtc6i4-odHNVtRiC7d0
Message-ID: <CAFR3w37ciCrzJ-_82xRG66wPi7U_5rtPOh7CZo9dfQ52mrzwiw@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] lib: sbi: Extend hart protection abstraction to
 allow ID configuration
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEyNiBTYWx0ZWRfX9dGmUq3yFtb/
 bLYKrE5Vrxx0FTE76Bh6PNftI4AzeW/hIlpImh8IifUizy4QqOYqpG60P/9Ew1WiybpKmntmXpQ
 4lJyiEWV6KGaKXu2dc8o6N+aASx71WNQ0H34tMZv7vPu3Jm9NakcikqqC2Vzmc9BIveGZ8ZoaTD
 YjaowSiwNdF0ClcpEvpjJyaYxibBQRfIpo5SwyaVcDhXEssLhTGN8FvhnWmB0wd3dC0y15isrDt
 Ea8WgBZHCaei5s4FH2LeeFX1sJoaxFn2WybTnyWQ+14qv+DlE2viVWcucte/nr9XAwyvfzrTiNs
 k0UdP+05xdeNkHeMKjNhz+AMLMx9NSdhTwYcvwcseYj0MhmJkj6i/S31WpU5NXTIzIdnxWY4nqU
 zOY01NhsBu0vLRZbukqAX86lP8wW1ZB7pTtCw1uhapJF/A4QGZ8oO2tGbLtwQyxy3HTegvYJn2v
 Ijr9ntV1RyVyQxRN0xQ==
X-Authority-Analysis: v=2.4 cv=EYr4hvmC c=1 sm=1 tr=0 ts=6a675649 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=Ts1TgqlxzuD5jIt09rQA:9
 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-ORIG-GUID: HXrSq3yiXzsDthXtg8Dh1kDjJ7KfA0-I
X-Proofpoint-GUID: HXrSq3yiXzsDthXtg8Dh1kDjJ7KfA0-I
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEyNiBTYWx0ZWRfX1NW8FSxCpS2w
 kazZdVnj0wpbBrQKMQ3owfYr5uOgZHR0Ed+GteWH8McBqy9HgEiVjmD3nJtFIQRElgObviepUdz
 quw5uOfhjuzt8FTVRsmnDsYUlw0jmMU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_055955_483625_B63BF606 
X-CRM114-Status: GOOD (  12.49  )
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

T24gTW9uLCBKdWwgMjcsIDIwMjYgYXQgOTo1NuKAr0FNIEFudXAgUGF0ZWwgPGFudXAucGF0ZWxA
b3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBUaGVyZSBhcmUgdmFyaW91cyBJRCBjb25maWd1
cmF0aW9uIElTQSBleHRlbnNpb25zIHN1Y2ggYXMgUklTQy1WIFdvcmxkcywKPiBTdXBlcnZpc29y
IGRvbWFpbiBJRCwgUW9TIElELCBldGMgd2hpY2ggbmVlZCB0byBiZSByZS1jb25maWd1cmVkIHVw
b24KPiBkb21haW4gY29udGV4dCBzd2l0Y2ggb24gYSBoYXJ0LiBFeHRlbmQgaGFydCBwcm90ZWN0
aW9uIGFic3RyYWN0aW9uIHRvCj4gc3VwcG9ydCBib3RoIG1lbW9yeSBwcm90ZWN0aW9uIGFuZCBJ
RCBjb25maWd1cmF0aW9uIElTQSBleHRlbnNpb25zLgo+Cj4gU2lnbmVkLW9mZi1ieTogQW51cCBQ
YXRlbCA8YW51cC5wYXRlbEBvc3MucXVhbGNvbW0uY29tPgo+IC0tLQo+ICBpbmNsdWRlL3NiaS9z
YmlfaGFydF9wcm90ZWN0aW9uLmggfCAxNiArKysrLQo+ICBsaWIvc2JpL3NiaV9oYXJ0X3BtcC5j
ICAgICAgICAgICAgfCAgMiArCj4gIGxpYi9zYmkvc2JpX2hhcnRfcHJvdGVjdGlvbi5jICAgICB8
IDk3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0KPiAgbGliL3NiaS9zYmlfaW5pdC5j
ICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgcGxhdGZvcm0vZ2VuZXJpYy9lc3dpbi9laWM3NzB4
LmMgIHwgIDEgKwo+ICA1IGZpbGVzIGNoYW5nZWQsIDEwMyBpbnNlcnRpb25zKCspLCAxNSBkZWxl
dGlvbnMoLSkKPgoKUmV2aWV3ZWQtYnk6IFJhaHVsIFBhdGhhayA8cmFodWwucGF0aGFrQG9zcy5x
dWFsY29tbS5jb20+CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3Bl
bnNiaQo=
