Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB98606A31C
	for <opensbi@archiver.kernel.org>; Tue, 17 Nov 2026 03:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u9hIbfro;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BtCUcejo;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JAJHZ3qP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=y1v5/3NCuOEE1DJpmLJtD3FNzHL66lnhh7PLATZNpP4=; b=u9hIbfroTrValk/2xUdOy51zAr
	uT9kvO9TW/lqox8Hf2YZjruFOAAEaZTFPgsbi11Yt5ZPSQ1LCVCr6mbqa4827CaeinfuhcwiQNwON
	gzKKENZK/HPA+RYClRl/fRYHoh73yOSplMkTJSjrTKe7o3xMkB7D4e87NOwDH8ZxI3myZZ0s2hl6k
	3lQAIqOUcALRQZ2EFnE+MxFkWhHN+j1P/I37SMY8HVfduLkU/RdKK4UATi99OPdtxADrli85AkoeQ
	3g5rHyegvOsvtEead3eQ3cufRnNFyBruObkQg5UM92nPqU4b4RrQK/a+ojvmgyHPMM7C0p6GAlrD3
	aYsX3yYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT9XI-00000004S46-3BmV;
	Tue, 17 Nov 2026 03:07:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT9XG-00000004S3l-2HFK
	for opensbi@lists.infradead.org;
	Tue, 17 Nov 2026 03:07:07 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aKdO3142455
	for <opensbi@lists.infradead.org>; Tue, 17 Nov 2026 03:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	igNPeLoqb0hj11TG0iXRkVxc2BjgJoAhnYD50NKp74c=; b=BtCUcejoRGwVu0wm
	wj/AZbwspuRh/RLYO9Q724cGTYLsII25MjNdiXkDgbgeVPAeGBdkpup32wXTR0DN
	Z+1Q+2jxjiDPByr3DhaKlFZXfX1BWRGaC85CJEkrhm1AjNz7gX/ldxO8Ub+ifNNO
	PeKKdc75dI5jxV+M9e7dzyd/QNk6/9Sr9Ew2PNv3MsPV7KbtHAzzJUYvknVNfV6l
	RxLjacoQs8bAz4GhrwDW3XZf7V4rjBHj4cElp2OZvJ5S/rQHS0QoZIoPsIFzwkHF
	hYNYCYcqlLocyV/2Q2ruCKok6uzuN1u+DNpzggB0T5EcGm86xYthgw1UVzdcwlxN
	xlo2zQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyqybnh1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 17 Nov 2026 03:07:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f559420f3so444196785a.0
        for <opensbi@lists.infradead.org>; Mon, 16 Nov 2026 19:07:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794884825; cv=none;
        d=google.com; s=arc-20260327;
        b=jS9brx+CcBYkwb4FmB0Xfjm+jY8aR2VF6aLqji1SYOFCgxCqq5A7QYz3nAebw6Vhl/
         m175ZMTlRxqKZYTFl8VExoBkNuSBC/3bqEnmQail6moKJWZCOOcKDX/vnnHV9ZtGOeg3
         NsINvDlwQNtojYaCVPx+/hctB1EmUGznIUzfdO7rDX4hVwt3mRXrK5IdmhTwg0+ctdbA
         d/v2wQnrozjo1FzKdS87gOOOB+3hDNFittAx1c2nT+rBtKyzcYq4amx8jaXwlKDurXcE
         3N2hkFtO542oX7FnzWEGqeryKUacLl9CBt6DzMSTPHyYVOUhn9Jd57wfIeeELJJukmFA
         F9PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=igNPeLoqb0hj11TG0iXRkVxc2BjgJoAhnYD50NKp74c=;
        fh=Ck9X1cQ6zEXteMjVk79ib6BKr+LbI80fo5ky5B2JXhI=;
        b=Lg02h36IzATuzQKUQMdKNLQsZxcBxlg+xVa8mlw8n1m1jUR0CdAyk/uw2k/lmeU2Pj
         EyL0PEYfBrXZ0LDxepjCSamaoTr2tnVx6Y0hF3hB/ux4YFIM0iA3czvTwRR/RbNSPNNc
         s7tZYJKh9svPm/gdi7o0Rb4MQuUZ5i9H3GLORTMBO0birpk3Yq7PXNVzgSTRsxDkR5rU
         StjcuBgi0PLIKDux/0i6UHztmJwn2ShbERGnUdNJFYNpWWTylkyezEb7NQfE239EiZM/
         VOJkKQXVH/ygxz68rTXj7eIKeBG2KMZhWZ3sdF6gAu6c6Asu6GnwIAKUD7f0umBmtfVd
         sTgw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794884825; x=1795489625; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=igNPeLoqb0hj11TG0iXRkVxc2BjgJoAhnYD50NKp74c=;
        b=JAJHZ3qPUcOU7bPxcFeeRA+mgtVakVAgBOZhm/ctUDj8CLU/RSvEqVYwAwzTsIRGrB
         u5/Tf4XdSlt88h3IrQFx7KgBFBYJ9k5Up4vn2i4wWKviuPGjcTbQPL0jSt9kui8XXKpG
         Az7tA4s3TNH3w0uUNeaY3chHjk7IYKRAevfBTJFX1hUP3lYF5XpjabL4vUWdEDqw3tZA
         A/1UCXtPo0C+GdqjWc4zB+Q4OLVdANbdIHNkSCPP251nhLZcD9ABQPQpn9c58BfwR/LU
         czUEoAW/2b7jQeN5LHVkwoWfFjg+tRbJqv0+T0tfOTgx5PCCrzE0ZONlGlasZjhXmyzX
         KhdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794884825; x=1795489625;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=igNPeLoqb0hj11TG0iXRkVxc2BjgJoAhnYD50NKp74c=;
        b=ejjRQV7cdD0V2oKpgAnjIbRulN1slNCrqfxrPAsXPRtMuZzAwv5Jf6tiqWuQ79T4Dn
         5cT5ICWx0E3MlvRFDKCEyanZdWX7D7shaJECXgXkkPawmKnOunOXoS2twmUSnNILYHWD
         sPUReGQzMQjQ/u/2wchuGo5fx75xq9/jgvBAFvEDaluG3D4q2XQhks5OlYVA4cIEa8MJ
         pG2QDA8z/OSY+8MAzAH4EF6RA5F0wyBGEgFKTqv1Q2Rm5xavmYTNA2TqU6groZk7afLK
         BvyjnxkQbz6g0oanXtDc+4yyiebFTPBJoR2KOjGPa/ExfJyutb8958w1VHNKuckG2rNO
         Ie8g==
X-Gm-Message-State: APuU4Z/cp0zbza31faCuEues9DF4P/HqBSyWuMojiWhtL0QFF0m5m0WI
	nx5e/vG7yKJQhbNSpHgnKg9jjCrjMezOsgZisC91S/8vAbGtyWeGFZGweBkFb2J5qw6lLauVzHK
	XNXRFVyaBk9SoStgUy9j42uVipCKcfaAC699WTtWvYR7NXDMKKC78brOEnnDF2mVEXSjT+kqKpc
	4LhPTVJpowa09U2QGMT9x3VR2T8e5OZA1NpPqsFGb3qxeCG9gKK/4=
X-Gm-Gg: AYBFou0c5r/gFeBK03lV1WWoz37lv66xnEEKg9AUj9jOPi15IBHv5S3ncJUEffQl/oE
	i82uPr1Z5pRBFxJ9Ksn91cUNYsF2DBsThTIlgRBkC7WwiemWrJnrOSvotebLhut8M1UJcTqJfFi
	ezSii+PfrVMTiRq3JB0N4+FYmDBLL8WaOMmmfKEyWSytRKz+SSILpgKTM8sjc9foJQ8yy347w5y
	eadxKLkVRTcoqnpNw==
X-Received: by 2002:a05:620a:400f:b0:93e:c12c:fbcd with SMTP id af79cd13be357-9494bcacae6mr2075501985a.73.1794884824604;
        Mon, 16 Nov 2026 19:07:04 -0800 (PST)
X-Received: by 2002:a05:620a:400f:b0:93e:c12c:fbcd with SMTP id
 af79cd13be357-9494bcacae6mr2075499485a.73.1794884824156; Mon, 16 Nov 2026
 19:07:04 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261116214722.243038-1-pawandeep.oza@oss.qualcomm.com> <20261116214722.243038-3-pawandeep.oza@oss.qualcomm.com>
In-Reply-To: <20261116214722.243038-3-pawandeep.oza@oss.qualcomm.com>
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 08:36:52 +0530
X-Gm-Features: AclHuK9Ouj3wt53urBR3ibci0tJkF_oHdOmDpFYX1-0Y_4m6_p3ahXh_fadhAWw
Message-ID: <CAFR3w34uzDtcg9rz2r7O97MK9gjLJiHMPtPwFekNrqTH+UWfyQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/5] include: sbi/sbi_hartmask: add equality helper
To: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, Anup Patel <anup@brainfault.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAxMSBTYWx0ZWRfX03WSlHi7KGCC
 tC2WB5Bov8eGpX+enV+69YirCkYZk+DFyTMiAykNmEs6XtlC0cMtHHnno7liHr48XtBaC7dAG7j
 a/Ke8gwB8/behdgAfHnTYhV7nQP9qxk=
X-Proofpoint-GUID: rA-NY-a8UcIvFeAqWV388je2uni3gDyM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAxMSBTYWx0ZWRfX8X5skGalqJwu
 KpCE6P7hA3VXycPBD5NQujmTpWGQl3feJDm4MmQegWoBJs1BT/IjZgnoAniKOGlCIB48zm/c+bD
 azhvGsnBq4gyTECuFm7pjBaBLTGgvboKBPnmv6hix+MjYgpl6sL37GC3ayayoAcX1Qp99R247+7
 i7/nX/pB54iw03723icmHyYaTBipYE6ogGThMWMMReZlx+eNtUJovmI0KL/dKE1j56yIor75gEM
 2AIXyUKZVELz2Hq97Je66lj/8VuHsik6BiyfteEXo1tRenRkOCyK8rY7DPnMInzcbEtzmkLEW7X
 GZQpAvLKRf9AGZ4Psp7DO3wVS+ys/8ycmy902YjPq0ZYXwyHUqFT/KQE9Gin25F/U+u/vANwXmx
 VEPvR9yiKrBSj5833+EJha9Icd0I34XXmwDUwxhk0+UsVMBx6n9h8y1RZztNF4gG3kv51wXzyEi
 DYCF1WYq4y4ou1eg6+g==
X-Proofpoint-ORIG-GUID: rA-NY-a8UcIvFeAqWV388je2uni3gDyM
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6afbc4d9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=wYIP8v1rXLUK1VC6-mcA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_190706_700904_B67E1819 
X-CRM114-Status: GOOD (  19.19  )
X-Spam-Score: -2.8 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCBOb3YgMTcsIDIwMjYgYXQgNDowNuKAr0FNIFBhd2FuZGVlcCBPemEKPHBhd2FuZGVl
cC5vemFAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBPemEgUGF3YW5kZWVwIDxw
YXdhbmRlZXAub3phQG9zcy5xdWFsY29tbS5jb20+Cj4KPiBBZGQgc2JpX2hhcnRtYXNrX2VxdWFs
KCkgdG8gY2hlY2sgd2hldGhlciB0d28gaGFydG1hc2tzIGNvbnRhaW4gdGhlCj4gc2FtZSBoYXJ0
IGluZGV4ZXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBPemEgUGF3YW5kZWVwIDxwYXdhbmRlZXAub3ph
QG9zcy5xdWFsY29tbS5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvc2JpL3NiaV9oYXJ0bWFzay5oIHwg
MjYgKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDI2IGluc2Vy
dGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3NiaS9zYmlfaGFydG1hc2suaCBiL2lu
Y2x1ZGUvc2JpL3NiaV9oYXJ0bWFzay5oCj4gaW5kZXggZGE2ODIxZWUuLjI1M2E1ZGNkIDEwMDY0
NAo+IC0tLSBhL2luY2x1ZGUvc2JpL3NiaV9oYXJ0bWFzay5oCj4gKysrIGIvaW5jbHVkZS9zYmkv
c2JpX2hhcnRtYXNrLmgKPiBAQCAtMjA2LDQgKzIwNiwzMCBAQCBzdGF0aWMgaW5saW5lIGludCBz
YmlfaGFydG1hc2tfd2VpZ2h0KGNvbnN0IHN0cnVjdCBzYmlfaGFydG1hc2sgKnNyY3ApCj4gICAg
ICAgICAgICAgICAgIChfX2kpIDwgU0JJX0hBUlRNQVNLX01BWF9CSVRTOyBcCj4gICAgICAgICAg
ICAgICAgIChfX2kpID0gZmluZF9uZXh0X2JpdCgoX19tKS0+Yml0cywgU0JJX0hBUlRNQVNLX01B
WF9CSVRTLCAoX19pKSArIDEpKQo+Cj4gKwo+ICsvKioKPiArICogQ2hlY2sgd2hldGhlciB0d28g
aGFydG1hc2tzIGFyZSBlcXVhbAo+ICsgKiBAcGFyYW0gYSB0aGUgZmlyc3QgaGFydG1hc2sgdG8g
Y29tcGFyZQo+ICsgKiBAcGFyYW0gYiB0aGUgc2Vjb25kIGhhcnRtYXNrIHRvIGNvbXBhcmUKPiAr
ICoKPiArICogUmV0dXJuOiB0cnVlIGlmIGJvdGggaGFydG1hc2tzIGNvbnRhaW4gdGhlIHNhbWUg
aGFydHMsIGZhbHNlIG90aGVyd2lzZQo+ICsgKi8KCkZvciB0aGlzIHNpbXBsZSBjb21wYXJpc29u
IHdoeSBub3QgcGVyZm9ybSB0aGUgd29yZHMgY29tcGFyaXNvbgppbnN0ZWFkIG9mIGdvaW5nIGJp
dCBieSBiaXQuIEJJVFNfVE9fTE9OR1Mgd2lsbCBnaXZlIHRoZSBmaXhlZCB3b3JkcwptYWtpbmcg
dGhlIHNiaV9oYXJ0bWFzay4KCj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBzYmlfaGFydG1hc2tfZXF1
YWwoY29uc3Qgc3RydWN0IHNiaV9oYXJ0bWFzayAqYSwKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBzYmlfaGFydG1hc2sgKmIpCj4gK3sKPiArICAg
ICAgIHUzMiBoYXJ0aW5kZXg7Cj4gKwo+ICsgICAgICAgc2JpX2hhcnRtYXNrX2Zvcl9lYWNoX2hh
cnRpbmRleChoYXJ0aW5kZXgsIGEpIHsKPiArICAgICAgICAgICAgICAgaWYgKCFzYmlfaGFydG1h
c2tfdGVzdF9oYXJ0aW5kZXgoaGFydGluZGV4LCBiKSkKPiArICAgICAgICAgICAgICAgICAgICAg
ICByZXR1cm4gZmFsc2U7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgc2JpX2hhcnRtYXNrX2Zv
cl9lYWNoX2hhcnRpbmRleChoYXJ0aW5kZXgsIGIpIHsKPiArICAgICAgICAgICAgICAgaWYgKCFz
YmlfaGFydG1hc2tfdGVzdF9oYXJ0aW5kZXgoaGFydGluZGV4LCBhKSkKPiArICAgICAgICAgICAg
ICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgcmV0dXJu
IHRydWU7Cj4gK30KPiArCj4gICNlbmRpZgo+IC0tCj4gMi40My4wCj4KPgo+IC0tCj4gb3BlbnNi
aSBtYWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0tIApvcGVuc2JpIG1h
aWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
