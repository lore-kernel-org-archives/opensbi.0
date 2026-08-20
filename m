Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A1DC5DF81
	for <opensbi@archiver.kernel.org>; Thu, 20 Aug 2026 07:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ngzC8kzG0/YcCYWZAHiKFp+qOG4H0oEHcbY7whFV1Y8=; b=VjC66gz7/ojV27
	b4CMwc65S7DnUUAx6ITmAmhlcvgJdpYz+WQAxVxeydgqG55oeWDXSRr4pvyzcDWtbI6WqcFKMWdOg
	HhS/ErBPbkTVRccHxEnMgbRAoy+obIYCb0znOFb6CO8+lOYZellieFqOuAU12so7ArEpeu6xt6g4v
	81RF9R/wZGX4HlcLnvhFVzH8x9RemoWfIg3zNi1cOMhFOSfcXeFzOsjODwyeje5JSdHo7e/RD43Rc
	eH4O6sA6c77ARMDyN4e5J97cyi7UIqZV1/6mMyY/ltw2spbgoA9N9CFYNC3aGG0MCYLHLAKbRgJzH
	d5FGWoLfUYmbtGMxz5Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwxQ8-0000000B5Nh-2j5J;
	Thu, 20 Aug 2026 07:42:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwxQ6-0000000B5MH-1YUg
	for opensbi@lists.infradead.org;
	Thu, 20 Aug 2026 07:42:39 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K6KxWe490936
	for <opensbi@lists.infradead.org>; Thu, 20 Aug 2026 07:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5+IM+jbQa9KXhFpqOlj+S9XbsZbKXepXpeL2XMP8QzE=; b=DtrsAudEzkSu2P7q
	CA5CUCa4kw6pEYTAFpnOXpowKaQji1FDni5NJaeueGU4TQmDYFcCrmlzXoLjipjB
	999ripcrcDJ2HbhSHytMRtpMUfeGXBAAJsR95EpodoAz/+dste6noYUYq2G+RioX
	RAmZGUq6O4+OdS45ZC9gZ2A1GmWigfOJAn1ItQCQnjzH0ju3mYG03Ffj0S7Knyzu
	9O0j9lvo+ANBKKWAgkaZgm1a9VlXn3rqF2X+MePfhljNMVzbsmfK4j8KDCqJESwY
	vyGK6T8npg999N6ZdFWF+SIIogbXNjny9NfnTicYJ50F443NQ2YtdmVJC/RxjuJx
	g5wyLQ==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5ervktj1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Thu, 20 Aug 2026 07:42:36 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-45ecef50eeeso1766180fac.2
        for <opensbi@lists.infradead.org>; Thu, 20 Aug 2026 00:42:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787211756; cv=none;
        d=google.com; s=arc-20260327;
        b=XZdJwYyn7rHCy1jOZzEQArJGlAcc2eoZ4c05+5cQOxYQG+g350zYAvYu5PipiVbQsv
         Qmu/gD4NntjnWhRAcPYJlKqkO3RsJm4FXNsjWMVppvalrIFmat8eiQTC/9zk8KJAmPOu
         vBrLtC3teZQJD4MhCW4/zQbMhqlevf0ZwALDf9IjrYbXLZWG4UZ+xjCRcbCUBVKUgyZp
         c7kHgr6bvFma7ihQyQFFVr88rQ7/W7rqIlDSljPTlx7ivbhBnCqU5pYwPK+IfFbXzUm8
         w1Tjsc/yHZI9V0WMhLaizPZsYCldijQT/GWzKcD1D3eA0gjahUXxcmyY1kzOD0lL1ehP
         06NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5+IM+jbQa9KXhFpqOlj+S9XbsZbKXepXpeL2XMP8QzE=;
        fh=ZUTfy4K9dP08M0JghozI1RGDYR7A3bSPbXTXkV1CfjA=;
        b=dE+03GEHX+nUPNydSEaLtCaNgO4TPmeSc00pQsxK3RVROL11oPtAKpC3dbaiUCRONn
         E2W29eD1OeBhcek3oQiOGnGvc62Z6VnqMPSKEdBBjYMhSPxim8swF4ecRdYlfxdd4rNb
         xkii7Wc4ZiHDM3MADJvilkc/dr4vx+eUuAtDJN/Xxwq3rIDPEeVTYSoiz+JUWB60CTkQ
         Ot7JFVuvmj0U2+Xryhn0V09vgKQe/Q/ZqKwwYdKB7TZ1dZV/BOwsHKalY3+uPWe5Wcfl
         sntVEA2+TqrH0elsPUnlczCHNRc+A4OWE2b2JolL1TdhK5qMA9wSU2Sd2YLvOisEIVm0
         QxrQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787211756; x=1787816556; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5+IM+jbQa9KXhFpqOlj+S9XbsZbKXepXpeL2XMP8QzE=;
        b=AG4UjQa2Qjac2bvWmzotptWCU7UNJf0kcUNh0qWsOku3JBy0v2EqP+FQWtv32qE0Pw
         6oo23+hDkDk//XwhzH7qG7Vi8zOLUGqmyDkrKXM3n1+7L+MvAfYWjbDCOKQY4a7D7Uvz
         geKFoeQYqAfs9EltgzxvzqA8WCaFKD4jd2UYQLMALgofnfxQPoaeyEqkNOGWT123cGsi
         wNfOgdsXKCT5MLmsDXUko4RpwLAUKIbamJSzWY193LTzv133dtL229KQd9uQ8VJ6sUmn
         L9Q74eQmXUpJ21jwGTbmQbG6vTuZKZbqnUahBpo828ait/5HS+t/f3xOOvQO6O9jUO9O
         StlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787211756; x=1787816556;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5+IM+jbQa9KXhFpqOlj+S9XbsZbKXepXpeL2XMP8QzE=;
        b=Yzir1d9W/rxQ9udUg7NY6qdbrXC2+F2N7oNy7/a76iFX365sQS/zn1dXGKjSbJ0D8i
         Z6EviBRK+0QZ9PChWAtnv95BtW09ZUIAvbaSIvG6l9ApqURya6fUiutKnoyzuTSAgbtb
         hMx22ScI8uABhJpKeBukdUMQSdAyt0oi05fLrPMpB3t7ScaE4kiVqi0iMX+cgY9XyilK
         N2SFcPBHYOzxi/xgtt2JAKWhrsS81vMpwVuJ9a5IdM+zizLvklUJjfQdRJyuB6pZ7a9A
         co3GaPYsGuf44jlZNOhoHI7RubLxG9sNsloKYe4nR4dI/qvxx3f/84AIMukcepVsainp
         EqPg==
X-Gm-Message-State: AOJu0YyuYdQgMyXgGSceTdGTIWBn3DGKAYb7ldblqtQ9muBgW109SuNC
	B5il7Q+ZLkWc7xcuVNEO1VHreow1N7yWSw+r1ZwNr2uMZVZr+dUcSpomOoPQ4EzgNPnVfM/nwns
	C0tPtvuS910Km/4+BLX/PdG7yXBV5z9En92rKh6+fKrPnVBf0Mv7MuSe5C/JR8w2dNc8wb/5TwX
	QJ2jtQDv6pWCJ/phcixsrAkElF97dzuFmTjAM2H/w2
X-Gm-Gg: AR+sD134x2/uNLVS8sxGXQqp+zzWz6O3UixFTm64+zGE+Q39H37rfa6FyZbjuA4Qqzd
	xQLFQQ18mfL+C/MVGB/Y2/e5ABCIgug3smtP6Yw8mQI5swlRsILw84G8QrhB86kWw9W3Cw9l5iY
	wKe6K1eK9eoR9YBoyDo5fPdFvnLQkTLZbN3IQx3Nr9xXla0wodqmXTDJeIQA==
X-Received: by 2002:a05:6871:581f:b0:45e:d1cd:5e80 with SMTP id 586e51a60fabf-462f68af281mr10711226fac.9.1787211755945;
        Thu, 20 Aug 2026 00:42:35 -0700 (PDT)
X-Received: by 2002:a05:6871:581f:b0:45e:d1cd:5e80 with SMTP id
 586e51a60fabf-462f68af281mr10711217fac.9.1787211755560; Thu, 20 Aug 2026
 00:42:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260724080920.1629065-1-ranbir.singh@oss.qualcomm.com>
In-Reply-To: <20260724080920.1629065-1-ranbir.singh@oss.qualcomm.com>
From: Anup Patel <anup.patel@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 13:12:23 +0530
X-Gm-Features: AcwNN1WbMh-yiY48rhaoDLfbFE6r-DiZMlfwytbJbnk0Wn3kwA8mubsFocdUcYA
Message-ID: <CABBgwmuHRRXt8Lwg9Kv1HwnAUVbKtJg4c=5G8T+t=tzGKVHGuA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Fix Enable Notification
To: Ranbir Singh <ranbir.singh@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org
X-Proofpoint-GUID: BUscpCmrdawNKnWgw0_7oNkVo-ZsE5f_
X-Authority-Analysis: v=2.4 cv=VZ3H+lp9 c=1 sm=1 tr=0 ts=6a86afec cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=-wWOpaUd1X9wcQh3cikA:9
 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA1NCBTYWx0ZWRfX1ARxQmbM4D4x
 0VHn+SFzyV/UQzSIaWjdD9iosQZx924vrvoXaqe1WPDjUP87InhdkMDcB+k137NR9gl48EePWL5
 prEmHPli04dlKW30fobeSnnok7Eo1uv9cbV8wB4udVXJ3wvgmUiIpMPle95iW/UKaLC0qlMhDtu
 h2vZyQx1Wmd9s337KX1tHhfsi65LS8XfN8/UYA3KO9wyhrGr0RGPWf40ZJ0NV29z+uBBiWpPJn7
 7FpiZ1YA7ESPAPlOqvPZn7+MtU8gqu78Hk+FhCXp7Lw+gYOUouir+1Ly0XYiFEnOxwFQbhUYqm1
 oqkXSh/wsSdclTt7iO1NUCO3CS647rKX2n+4ymXPUm0JgRAx9SjgDo6/FEQrjXtBFe01STT4vp+
 mTeFI6FOJx60CBkphwUvhlgSyQEYFMOiJWQxGckZ5uVMH3Tco2snEDvfb+KQg9Ce3C2fB3omo4g
 1U6oCVvMq3ycthYWGJQ==
X-Proofpoint-ORIG-GUID: BUscpCmrdawNKnWgw0_7oNkVo-ZsE5f_
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA1NCBTYWx0ZWRfX/i64Oq6An3MP
 hqaZNEGftsmFmp7gTuQGjYboEfG10PrKMy9uhR1laQRjgpGEo3xcBdeH5munB048PeVFJjbJehv
 HCin4fNrN09Nz2Hod3EAFPp1rZd8gJI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_004238_427762_4C1D75F4 
X-CRM114-Status: GOOD (  10.05  )
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

T24gRnJpLCBKdWwgMjQsIDIwMjYgYXQgMjowM+KAr1BNIFJhbmJpciBTaW5naAo8cmFuYmlyLnNp
bmdoQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gQWRkIG1pc3NpbmcgUlBNSV9NTV9TUlZf
RU5BQkxFX05PVElGSUNBVElPTiBlbnRyeSBpbiBNTSBNUFhZIGNsaWVudAo+IGRyaXZlciBhbmQg
ZW51bSBjb3JyZWN0aW9uIGluIExvZ2dpbmcgTVBYWSBjbGllbnQgZHJpdmVyLgo+Cj4gQ2hhbmdl
cyBzaW5jZSB2MToKPiAgICAgICAgIEFkZGVkIHNob3J0IGNvbW1pdCBkZXNjcmlwdGlvbiBpbiBw
YXRjaCAyCj4gICAgICAgICBBZGRlZCBSZXZpZXdlZC1ieSB0YWcgaW4gYm90aCBwYXRjaGVzCj4K
PiBSYW5iaXIgU2luZ2ggKDIpOgo+ICAgbGliOiB1dGlscy9tcHh5OiBtbTogQWRkIG1pc3Npbmcg
UlBNSV9NTV9TUlZfRU5BQkxFX05PVElGSUNBVElPTiBlbnRyeQo+ICAgbGliOiB1dGlscy9tcHh5
OiBsb2dnaW5nOiBVc2UgY29ycmVjdCBlbnVtIGZvciBlbmFibGUgbm90aWZpY2F0aW9uCgpBcHBs
aWVkIHRoaXMgc2VyaWVzIHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8uCgpUaGFua3MsCkFudXAK
Ci0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
