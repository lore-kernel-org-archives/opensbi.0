Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30361C43458
	for <opensbi@archiver.kernel.org>; Mon, 13 Jul 2026 21:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OnHNkUNxGfQWVIsXgD8prL3TcKeEzMgOJtO8qIqrlmQ=; b=u31fexQV6MJxpP
	Z8YD0nl+l/7DpE0YxaKzk5FE6e0R97aSXH1mE/cyZFmQZNIhGRqLLxj+xn0H9AkXOAIrOMhk60mEP
	e+HcIKP2RfzwHyTOvPARwiXbNEfylAdXH0vtUn2TyglcvOq7bBEOiHCP1wXpiaebfl008P/oNO9xN
	nTjSPDbvuuhhIszY9C1uRQrgNUX1XzM4/KmyE5g1jbys/oe2tWPT5dfZllxN88gG7HpPINEYazsDz
	unFhoKi6SFk4RfKAVfID0UT5qC5VTd3wACBzNFYXUMdJaYL15yur7Z30nys2f2IZRVfwhrCdKJdBw
	/6+VSvJDPN/v7Hsd23hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjOAW-0000000ARMA-2OJ0;
	Mon, 13 Jul 2026 21:26:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjOAU-0000000ARLQ-0mCK
	for opensbi@lists.infradead.org;
	Mon, 13 Jul 2026 21:26:27 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DJ9Aw12275706
	for <opensbi@lists.infradead.org>; Mon, 13 Jul 2026 21:26:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yORTJKrrkEknsrhU2dVy/YGAGBNUXWQSF0Aq6PplFnU=; b=dePj06yo5ZSH+kZ9
	jE6+PqfcQ9qf5/oWkks1OdyH7R95A5OdeDwXfcPB8O7F/agkIsW1R8TokZnavgJX
	hg2lwuV7ymTugo3sgfKWnyiUr6HeUEx1LHkCX7YmD+QsIVKDRYl2Fibg0QcbRMu0
	tJ/5Km3GzH8cH4tYBQBt7xTbH9TE7DICdMjuKB6N2Q1uE5yrWBYjMYA97qXQeu9Z
	JFR1oXgLzrP42sU2ZKL9yMfFklVjbBz1WXTiaIMqV0rEZHFISRD9Zp7dOUJ99W8E
	nJEt9D7tJ4NKogUbhhusMF6TIX04kAxZhebXqoqGt54T54PLRumGevq1eT2IJwit
	JpLa5w==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44p0tyx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 13 Jul 2026 21:26:25 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6a13b72112dso4925323eaf.2
        for <opensbi@lists.infradead.org>; Mon, 13 Jul 2026 14:26:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783977985; cv=none;
        d=google.com; s=arc-20260327;
        b=RhiJDUveUFTBub31OpOc4s2A+q3l6ACfN2gIKw8P+X1/a+sDXkMrjUae6FJhv4+512
         q9PO3CQFhk2EC7AKpeaRDPIERE61CelyRDRO5gMxU+zRoGt3MiRbvl+cFQQhSiiu1IGQ
         b69x4QmhEhtFydEKEDBLLewyiuUDSe4hwM3ZiuvHe2yJiLJAbvuBuulA4SF7C/mXLYI3
         y1zcT6Kv3jljz1hG3RncQKNqx2Q+b0YKCTVLqc3DR//zRz4PYeiZsAJTXETJe1B3SvQM
         z2R5UfGBYGJY4XxB7y2KBPgvAcEDhjbJeSxK4xo4WsxypDJE4TwLzgy2C4Y9jIfSUKQv
         mo0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yORTJKrrkEknsrhU2dVy/YGAGBNUXWQSF0Aq6PplFnU=;
        fh=cyWYA3kXN4M7205T7O+U3EeZKBOqXRScKUv8W0MgTLc=;
        b=n6IB+tTCyqhAFq7qkA5pZASRnUeFoIfNmgjcfN/qIS2oQWEjPBntJSpVHWEUOxGVq0
         7hHt5Ki98v2sNh64jZVVW1RttlLszJFaAwGjWa43jtn8RP6XPyIl8u1MwoBIG5SgNet+
         FrE2NvyVZfMZOjbwB8mYb6ICXwkcLcIYFuvAH+WLciXo6u2+xR+G5PpFSqd3LbUBGKxW
         yIPIMOAYdzx71YMm0pcBKA3rc2k0x6elXWeSyCsEMpP+YiDkEVKp85ofK+jiDN9ZL29z
         h2nB+Tgq5TcesLXb//U2QlaMu3rapoFnxz7uloxv2uTHgepQYLV2D/8NkQo0h+UdRoJ9
         eLRA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783977985; x=1784582785; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yORTJKrrkEknsrhU2dVy/YGAGBNUXWQSF0Aq6PplFnU=;
        b=GKPGRbvD608SU7r0Wa6GdwyU1M9WoUyFL/pkupJ+O+OqbraHF5ZsOBARDKmJDgves0
         lY8gQ6e03W50BUH7sefxiXAr4HCOPH3ql5obmIEopNJlUdT8yArfLYCzpEEWh2/1i1aj
         mjwSHepGwTjx60mQ08zveGaS4JCIrUeSQc1Ydu+Np1IB0nu7uNWBCqgOYtBXc0g0SGsj
         McDS3sXf+PpGur11A9H2i22+omWTBoWlcxJ320ocIA8YfUdKMexbwxj8siZQT7lm4OCe
         GAbqoKC3UvQbKhlUjCV90dD6cVXLiwdqVzbG+EPUOvete/oUsA67livpIdRsDzvoSwF0
         u1CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783977985; x=1784582785;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yORTJKrrkEknsrhU2dVy/YGAGBNUXWQSF0Aq6PplFnU=;
        b=reKq3H51atV+O8M81/DWwCX/UKToWNHVlSIsl7WZfOwZ4vZ9dKqibaD2tjSUTtvTjc
         5Cm5O4UaivWeYEHkIvfCqswvC7fGfok9LSu2EoI5ZT4ZyH9fmQ1uKAVNYX5HCz3JxLdH
         Kv8f8UNEh0sdc4zU/gAUGK7qjWfvjr2LgKV3fibplWJxrQmjjLWffQ/z1E8Ekf2l2twW
         rIOKrBhmz29uGkgiEm6m0w/kIAjvZ26w7npNyavP7XUjydr6lnZ4mXaw0r6I2ZZ6Vifl
         /IXKpglslGAoWbPwbFMkxBvr5/duQhNPORNj/u6nkkPlip5bISy8rTF4Xab8t0XnyQtH
         nNwA==
X-Gm-Message-State: AOJu0YzFYwF4/1KsPPWgWE2FTSDpJAqWFY6TAYy03ERHM3Z+xI4cn8I+
	4k3BaVZLVjoqap+mboHMEV5Q28C+tpqzR9ezosOpW4+Y3UzRoAepue5pkBgJkdAblfdle3lB3Ss
	3+I1lcJik7298d8wf4HG15OdmosTgGzgadrUPKKnLPPA6ZAZjLiU3LiZtjr/wqD42Y+oxyUDU8W
	uh7mBMzTBfq9bbb1D3jb0/UkZhOde9UKNU6V0T8S1i
X-Gm-Gg: AfdE7cm2lquE1xRnoPVitb14dyahNhLKlE7Xugv0x9G8/PIJkbIlTof7rMUBiXggbBB
	4eWKYbzcAydFjiFAAVIhc4AQW5f6/qIdk6+YnvoFE4uJY7IyGw2w3JLW9cAPyIzxf1GvzvMcV0S
	5HNnf3Dq8VrsZ34u7pscURpKDG+QmHTeWOwbR1tF4cu0sOnGHglcNiH8dRg5YjxaHCRfNL
X-Received: by 2002:a05:6820:818a:b0:6a3:6a8f:5c72 with SMTP id 006d021491bc7-6a39a72e0e9mr6482845eaf.50.1783977984846;
        Mon, 13 Jul 2026 14:26:24 -0700 (PDT)
X-Received: by 2002:a05:6820:818a:b0:6a3:6a8f:5c72 with SMTP id
 006d021491bc7-6a39a72e0e9mr6482822eaf.50.1783977984489; Mon, 13 Jul 2026
 14:26:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260626101433.3133466-1-peter.lin@sifive.com> <20260626101433.3133466-4-peter.lin@sifive.com>
In-Reply-To: <20260626101433.3133466-4-peter.lin@sifive.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:26:13 -0700
X-Gm-Features: AUfX_myNK-YWdGGaOXbaXvBrLT1nyvrXx8KWzy6brE7fm89da5ok4ljRp2bsVMM
Message-ID: <CAAVgOkL1oRfEXgNot5V899LO-GjPhpbm4gOm8r2MFZw6U7i=Pg@mail.gmail.com>
Subject: Re: [RFC PATCH 03/12] lib: sbi_hart: enforce riscv,pmwid for Worlds ISA
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com, greentime.hu@sifive.com,
        anup@brainfault.org, scott@riscstar.com, conor@kernel.org,
        dave.patel@riscstar.com, raymond.mao@riscstar.com,
        robin.randhawa@sifive.com, samuel.holland@sifive.com
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDIyMCBTYWx0ZWRfX3/97n97IxBs5
 Ipq14MvFDejY2hVf+n6/8Q89ipC/f6uhEXLocpmmCc4XtlIQOrkdP5PXO1i7F8HRCIepW5Vj7Kj
 GRXoeO3hS9P51g3eAMY6z85AEgej0Wc=
X-Proofpoint-GUID: ifXNIZnZ96R4NHl74RQSrWqCie6rGXa4
X-Proofpoint-ORIG-GUID: ifXNIZnZ96R4NHl74RQSrWqCie6rGXa4
X-Authority-Analysis: v=2.4 cv=BZroFLt2 c=1 sm=1 tr=0 ts=6a555801 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=JfrnYn6hAAAA:8 a=pFyQfRViAAAA:8
 a=ThOElcfV_O2Aj-sx_T4A:9 a=QEXdDO2ut3YA:10 a=-UhsvdU3ccFDOXFxFb4l:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDIyMCBTYWx0ZWRfXx2oXUzkcbZ0W
 sn3of8d6tRvxiS3yMS+B/QJFiAprmyTGSnHxe98S5HBWcbrdy5XwY9uoc8+fZpiM7xLn+fCK18A
 kzXytR4rJcrrDgMBjTZxdz+08AAP/VHLgfdNLe/apkjzK6xhHLX4VQqFALdCuCVoiqJ+VUTxjhF
 ujQLcOEd3Ffho5CjXJhVT+68BTrLTBOnJSpIp8HJeNm9JLj7GXf+CSdFrmWPyEp21VUx+mvxwXn
 8jS0r8MX8PvMHcq+qiexZ60sMPzs9Z2PEvPGXXo55so4QhGntgLELyxVWo/2tlHn95G4Eu1iQOe
 CmXEQcCHujSqgFKgJjAiKyy2CK6DzLWOJ71JxSetFGvOIsnAf8qdrVQx9YdlND9Vqg9Wr0E+45V
 4hgPt+/rPcCpbkI4KMI5HjxjKoJdyGbwQ5nhFQRMgpk4LOe4Du+vw0EHPa0TWI8oasjO+IwYE62
 VgTOBXGvCqsMtusOt4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130220
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_142626_227994_5EBB9667 
X-CRM114-Status: GOOD (  18.37  )
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

T24gRnJpLCBKdW4gMjYsIDIwMjYgYXQgMzoxNuKAr0FNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gV2hlbiBTbXdpZC9TbWx3aWQgZXh0ZW5zaW9u
cyBhcmUgZGV0ZWN0ZWQgZHVyaW5nIGhhcnQgSVNBIGRldGVjdGlvbiwKPiB0aGUgcmlzY3YscG13
aWQgZGV2aWNlIHRyZWUgcHJvcGVydHkgaXMgcmVxdWlyZWQgdG8gc3BlY2lmeSB0aGUgTS1tb2Rl
Cj4gV0lEIGRlZmF1bHQgdmFsdWUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBZdS1DaGllbiBQZXRlciBM
aW4gPHBldGVyLmxpbkBzaWZpdmUuY29tPgo+IC0tLQo+ICBsaWIvc2JpL3NiaV9oYXJ0LmMgfCAx
MyArKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspCj4KPiBk
aWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfaGFydC5jIGIvbGliL3NiaS9zYmlfaGFydC5jCj4gaW5k
ZXggMGM1ODRiZmMuLmNiMGM2NmVhIDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkvc2JpX2hhcnQuYwo+
ICsrKyBiL2xpYi9zYmkvc2JpX2hhcnQuYwo+IEBAIC03NjgsNiArNzY4LDE5IEBAIHNraXBfc213
aWRkZWxlZzoKPiAgICAgICAgIC8qIE1hcmsgaGFydCBmZWF0dXJlIGRldGVjdGlvbiBkb25lICov
Cj4gICAgICAgICBoZmVhdHVyZXMtPmRldGVjdGVkID0gdHJ1ZTsKPgo+ICsgICAgICAgLyoKPiAr
ICAgICAgICAqIFZhbGlkYXRlIE0tbW9kZSBXSUQgZGVmYXVsdCB2YWx1ZTogaWYgV29ybGRzIElT
QSBleHRlbnNpb25zCj4gKyAgICAgICAgKiBhcmUgcHJlc2VudCwgcmlzY3YscG13aWQgbXVzdCBl
eGlzdCBpbiBEVC4KPiArICAgICAgICAqLwo+ICsgICAgICAgaWYgKChzYmlfaGFydF9oYXNfZXh0
ZW5zaW9uKHNjcmF0Y2gsIFNCSV9IQVJUX0VYVF9TTVdJRCkgfHwKPiArICAgICAgICAgICAgc2Jp
X2hhcnRfaGFzX2V4dGVuc2lvbihzY3JhdGNoLCBTQklfSEFSVF9FWFRfU01MV0lEKSkgJiYKPiAr
ICAgICAgICAgICAgIWhmZWF0dXJlcy0+aGFzX3Btd2lkKSB7Cj4gKyAgICAgICAgICAgICAgIHNi
aV9wcmludGYoIldBUk5JTkc6IGhhcnQldSBoYXMgV29ybGRzIElTQSBleHRlbnNpb24gYnV0IERU
ICIKOiVzL1dBUk5JTkcvRVJST1IvZ2MgYXMgdGhpcyBpcyBjYXVzaW5nIHBhbmljL2hhbmcKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAibGFja3MgcmlzY3YscG13aWQuXG4iLAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgIGN1cnJlbnRfaGFydGlkKCkpOwo+ICsgICAgICAgICAgICAg
ICByZXR1cm4gU0JJX0VJTlZBTDsKPiArICAgICAgIH0KPiArCj4gICAgICAgICAvKgo+ICAgICAg
ICAgICogT24gcGxhdGZvcm1zIHdpdGggU21lcG1wLCB0aGUgcHJldmlvdXMgYm9vdGluZyBzdGFn
ZSBtdXN0Cj4gICAgICAgICAgKiBlbnRlciBPcGVuU0JJIHdpdGggbXNlY2NmZy5NTUwgPT0gMC4g
VGhpcyBhbGxvd3MgT3BlblNCSQo+IC0tCj4gMi40My43Cj4KPgo+IC0tCj4gb3BlbnNiaSBtYWls
aW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0tIApvcGVuc2JpIG1haWxpbmcg
bGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
