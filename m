Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBC7C44512
	for <opensbi@archiver.kernel.org>; Wed, 22 Jul 2026 05:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4qBWlMTkwoI2uBv/KNkQmh5jkdJALXHC/eLzVYrlam4=; b=zulUpDzcd2HzMd
	9c3ripfhi7OOsvu7ImPH5xRK82ENFHSmZQEwR2sBtOkbAcpw5reID6lg++baXoV1IsDzKZst1gGu6
	WZkFTJc1kWJCPHJSNQfiwYJ1jW8L05vK4rqZAHCeYXOqx8teiE4lfA33llYMF8bGC0y71pY1iNs3T
	Aq5N3pEMEymlyTVHNY5lo/1sGW28OrkGAo7GVi2fyX4sNlPxwRMCmWPhDNRLFtZQL58Bq6ahfb51J
	JHCZoXV+5UIMfjOICfYRUl+0eyXdWzG+a1CBusg0efeOw2fiQEI0+LkdScgBTP5NqCL5EK1qk1dVD
	lxD+obH32RrN9dlTXc/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmPuY-0000000Awnj-2sdx;
	Wed, 22 Jul 2026 05:54:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmPuW-0000000AwnK-1Ulu
	for opensbi@lists.infradead.org;
	Wed, 22 Jul 2026 05:54:29 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53YNm3882917
	for <opensbi@lists.infradead.org>; Wed, 22 Jul 2026 05:54:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZZWJQHqf+MkabQGv2ZB8ra89CoKZHqOSGAGiM2GwTzM=; b=eKkSbCx6GwHJ8l7Y
	COGPo3oSSvcqvnGES8o3SHK3/YSyOMcrSQEJGKPMcMObCzHu5GLqttDv4PKdTI6f
	V8y6wav8Y09jwCX4KLNd+dmj587QziILngmNyI1pQ0tMOwzrW5b/zzkMqEgwq/A1
	c+XfOBzLeOoUGJF7f8k2oZ9XgDN60GRQEqNKVgAkADKl73FmpgVWfBzNOPsJVivQ
	/V9rYiQAZvQWDc1KCBkrHiRZ4Je7XKX089mkwqFX/U8sDdoUTaB9UhxL+/YnCzP+
	ox7XxwiF7Dxjuq5TbjBK5uexy9nE41l7iqwMtyC++sd/IgO8PZ2C5pQlQJlNyuNM
	s1tOWg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjntn0gck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Wed, 22 Jul 2026 05:54:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930a098ea19so842097185a.1
        for <opensbi@lists.infradead.org>; Tue, 21 Jul 2026 22:54:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784699666; cv=none;
        d=google.com; s=arc-20260327;
        b=UucYGJzRQkb8+QcsBiQXjKtmVzdDWkqwRPx5XZSyvDunU/7+Jmojosn1LuJKvSUe0u
         gMkp8zVnbhoCrJyYUNMaXC4+02pLN2bg8s4IyTSKL76dGmCEwi40AF4wtHzI17ZyIJmi
         lVYHHlrXEIFwNFkp8esuR0+ST0sS6JxfmsSKxHsYf0gSLn+1tKCPEy+hyMiV0v2Pfizk
         tiAzsp/rZikJoXiIO6h8nTXMFXfSeQITDCLKmT0jB+Gi9+Ex/cX6ytQdPRXnwcBbxrxQ
         qdPguygzseHVT7qSwCUIGaOSk20W0Eg7BHU3WVXoflagN2r11YBx8su0NCXoiNBqrAp8
         amuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZZWJQHqf+MkabQGv2ZB8ra89CoKZHqOSGAGiM2GwTzM=;
        fh=ZUTfy4K9dP08M0JghozI1RGDYR7A3bSPbXTXkV1CfjA=;
        b=HBCCXOU8Gs1w/3RdmdBVcmzj2H+cZuEdvZWZlFb4JVdsvipOfVUYLpAViwhH9uwr5l
         qXLPDZGRMq5IBz+tPqC/9fNgepMsvxkwHflORAetrPgsQAeFRckikj/lUbZS5/6oluU7
         YtbE2ID75KYcM0ImWXMdWTsnt0tkgkQkdRrTo3aYia0q1jMaYq6+08oraUY35t/xxYcw
         j+6P0hao+hBX+zPx2waWLQx8LBiDMWm8mCs+0+RcJ4u7wpPwvkESTWplzDHYCyde9qMs
         aMvTNNJiCt/rwCci1ps6JdPJUbrQhWdJ3WEA4Mn8IOPxdhlfehP3PJ9S1zWZig4fFDbq
         /Q6Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784699666; x=1785304466; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZZWJQHqf+MkabQGv2ZB8ra89CoKZHqOSGAGiM2GwTzM=;
        b=ds093b2cqPYvmll3E1T+kKB0JOObnaC49XdQUdDzBcrxFI3pWsLDeFe2VU5GzwjID1
         rO8iVKMehJ6ECWG3klneCt0LLk6z/zxHP+urj6sl4458N8Y4KqCEi070yISH8W8hHD6h
         lWNfhK1mNIcs01QbRwuEBVp127YxKECjofQ+K3s30b4dxf5Glpx/AGpntiGcRbp8L3a4
         oV4jz+etRfpYlAeTLSI7PP00pHa4sBCVC1NkkkxCWfIHXGgDCEWYk479wg8/QZA6lDnH
         XkyCaxZ284QPUm6F3oBOhFV6RzIkGNQnf3dyWhZuFjQvTGVju5sSG/9m3HlPpH0U7dbC
         gjNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784699666; x=1785304466;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZZWJQHqf+MkabQGv2ZB8ra89CoKZHqOSGAGiM2GwTzM=;
        b=fjNky1uGyhREwvARIRes1dNbWg03ghzS/DzIoL1umwPSKjS9qGtf5auMH4RjVd+E8Y
         SVjYj7NqNlmUrlyKe1rjOs2qLTvbLshOp7goaa/qdjIo1ZdLKcSs/9yH1M8t9erWvWOa
         HnhcmvoGp/XAsEhqUuzRupEIKEc7Nrl3wEhskufRuHc4crv6Jbc7l7ICh/d38UKrAw+T
         mJFnRrBC/W3V7gvFe9W7kqwPsIj1ZRBCOHkAtd7v6DBIXQdEixRL07hf5f54v8mzVjeT
         PNw9OZf36voPNuh2ruknG/A6aqTIAj6brUtzS0Z5TZovzssGOk1+hH7iPfrh1W2+itBY
         n58w==
X-Gm-Message-State: AOJu0YyiukK4ALY/SDDqSANUL14SCAoNPkW+4CDr6v2jvkxd8I5W4jry
	BgzGiar0B9AxxQcJvDu6jhDr9dMJmCP5i6f5Wqqm6+6UaPh27J14mX/imGiTTltg9Osp85BL1oi
	xcZozLX7NR1rSWuosVDWBRA7u9PzL3J1VWTkuEw+pie75cRK7sjBwtq4brHYaUO4mI8uILWAnTN
	a4dEH1FmRt7NeZ6gZNXEmtlY7JO+4ha/dFzh4z5CZZG/FQDpu6RRE=
X-Gm-Gg: AR+sD13/OpVhHtiykEaJ3ei7Z7imB4NSnPBK12qM+da5cakU0T6TJ8i21/OoNF/X1gH
	mYSMIG0n/SuM2EJvZ6aRrJxD2WGxTSYwqpP+t/vWL++NL6uaIpqpbWQYlojJdQC6lVc32h/KHzs
	MBLbZG5C7WWjjlqv8T9Uqd0ZkLAna4xd/pl0BJTLb/Tp+tUG86dO7lJjE5IA==
X-Received: by 2002:a05:6214:440c:b0:8e8:7de7:ec20 with SMTP id 6a1803df08f44-90778316492mr232796546d6.4.1784699666518;
        Tue, 21 Jul 2026 22:54:26 -0700 (PDT)
X-Received: by 2002:a05:6214:440c:b0:8e8:7de7:ec20 with SMTP id
 6a1803df08f44-90778316492mr232796326d6.4.1784699665979; Tue, 21 Jul 2026
 22:54:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260721061459.1422227-1-ranbir.singh@oss.qualcomm.com> <20260721061459.1422227-3-ranbir.singh@oss.qualcomm.com>
In-Reply-To: <20260721061459.1422227-3-ranbir.singh@oss.qualcomm.com>
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 11:24:13 +0530
X-Gm-Features: AUfX_mz6i8TA-fLhDMDMXoo5wVhIHzIPBK74UuR6PZz-Cn3bTfdVhrgMOOj8yFc
Message-ID: <CAFR3w358rt2ZF97fpdeiqAfsLVBJ43Hy7K4GnKAxBwigzNXw8w@mail.gmail.com>
Subject: Re: [PATCH 2/2] lib: utils/mpxy: logging: Use correct enum for enable notification
To: Ranbir Singh <ranbir.singh@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org
X-Authority-Analysis: v=2.4 cv=AJsSZ1gA c=1 sm=1 tr=0 ts=6a605b13 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=pGCEIxsDQXSLPFqdgTwA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: rXw_i5f0Y4LRvaYM2Ot7rK1BGf1CJylX
X-Proofpoint-ORIG-GUID: rXw_i5f0Y4LRvaYM2Ot7rK1BGf1CJylX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA1MiBTYWx0ZWRfX05w++CQecBEh
 C9UrZLsTNL3XVWQVKheSMEdgzV/41HVy8tWWeIqxubI2cYvoZJab7W6Xi3KDbxD4MHoyT7HyQO6
 PZHmc1/HeJgKY088sFdmqSMlqL4sQDQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA1MiBTYWx0ZWRfX6Wyrf5cCs1wK
 H8B2z4rV+VNlNWz6gUk88a/PLxQWv5HZpV1CK9GwY89IPs0nbWZGQJUjssVhu7zaJmjDQXxVcAK
 Ve09+3Rr0v6jrOwcjd48sKt5qGXpEsc+p3KGit+bPtpLwRO3v741J5jPIEk1irW9pTy6JTtqXdF
 N+hyiPHskjHfu9Sm9walsWIsy69QltxojOFrwTFsT9vMq0waUFVAdkmZSuhZbKozvraRYz924rX
 Hx6RT1qBOyTAtRfrTdUPGlFleKEWembJPusTteKB93zvuTuGhb9G4qT7S3g3B3cn3NHDzlXUWex
 ZW7wkM5X8e+6uVYvRwO1/DqGaLR9DQu09udYaVMFLo+2SiICsY7e8WdYVsTt2e83Q29iq6GV9+j
 JRSNcrAZN/BlhU8pjq/cue/rZUN/SunfC9+GCZXATLuFHVeQvNT09loKT77SoOOjrUaC6JfEVrk
 zn8EoCPT+b+ovLGTsEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_225428_516650_6E1A0C2E 
X-CRM114-Status: GOOD (  17.56  )
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

T24gVHVlLCBKdWwgMjEsIDIwMjYgYXQgMTE6NDbigK9BTSBSYW5iaXIgU2luZ2gKPHJhbmJpci5z
aW5naEBvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPgo+IEZpeGVzOiAyNjI1NzEyMTdjNzUgKCJs
aWI6IHV0aWxzL21weHk6IEFkZCBSUE1JIE1QWFkgZHJpdmVyIGZvciBsb2dnaW5nCj4gc2Vydmlj
ZSBncm91cCIpCj4KPiBTaWduZWQtb2ZmLWJ5OiBSYW5iaXIgU2luZ2ggPHJhbmJpci5zaW5naEBv
c3MucXVhbGNvbW0uY29tPgo+IC0tLQo+ICBsaWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pX2xv
Z2dpbmcuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvbGliL3V0aWxzL21weHkvZmR0X21weHlfcnBtaV9sb2dn
aW5nLmMgYi9saWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pX2xvZ2dpbmcuYwo+IGluZGV4IGU4
ZjA4NWViLi4xZTkyMDUzZCAxMDA2NDQKPiAtLS0gYS9saWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9y
cG1pX2xvZ2dpbmcuYwo+ICsrKyBiL2xpYi91dGlscy9tcHh5L2ZkdF9tcHh5X3JwbWlfbG9nZ2lu
Zy5jCj4gQEAgLTExLDcgKzExLDcgQEAKPgo+ICBzdGF0aWMgc3RydWN0IG1weHlfcnBtaV9zZXJ2
aWNlX2RhdGEgbG9nZ2luZ19zZXJ2aWNlc1tdID0gewo+ICAgICAgICAgWzBdID0gewo+IC0gICAg
ICAgICAgICAgICAuaWQgPSBSUE1JX01NX1NSVl9FTkFCTEVfTk9USUZJQ0FUSU9OLAo+ICsgICAg
ICAgICAgICAgICAuaWQgPSBSUE1JX0xPR0dJTkdfU1JWX0VOQUJMRV9OT1RJRklDQVRJT04sCj4g
ICAgICAgICAgICAgICAgIC5taW5fdHhfbGVuID0gc2l6ZW9mKHN0cnVjdCBycG1pX2VuYWJsZV9u
b3RpZmljYXRpb25fcmVxKSwKPiAgICAgICAgICAgICAgICAgLm1heF90eF9sZW4gPSBzaXplb2Yo
c3RydWN0IHJwbWlfZW5hYmxlX25vdGlmaWNhdGlvbl9yZXEpLAo+ICAgICAgICAgICAgICAgICAu
bWluX3J4X2xlbiA9IHNpemVvZihzdHJ1Y3QgcnBtaV9lbmFibGVfbm90aWZpY2F0aW9uX3Jlc3Ap
LAo+IC0tCj4gMi40My4wCj4KPgpNYXkgYmUgYWRkIGEgc2hvcnQgY29tbWl0IG1lc3NhZ2UgdG9v
IGFwYXJ0IGZyb20gc3ViamVjdCBsaW5lCgpidXQgbG9va3MgZ29vZAoKUmV2aWV3ZWQtYnk6IFJh
aHVsIFBhdGhhayA8cmFodWwucGF0aGFrQG9zcy5xdWFsY29tbS5jb20+CgotLSAKb3BlbnNiaSBt
YWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
