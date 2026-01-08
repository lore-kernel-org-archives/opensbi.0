Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34ACDD185F8
	for <opensbi@archiver.kernel.org>; Thu,  8 Jan 2026 13:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r49cUD4QaVjb8n88guzCY7iSMxJntHLg8ZGM3DzhuQQ=; b=eY1RMStEEbyazi
	PXbnJDI6L70L4M6o/bu29cAV8xtllelPJb63bLEr1zWdhqZbrGzeTWV/XX1lS+5xbOBFNuBmD1c9x
	4nnJfFMhJ7TnDXevlAV9ftQNsUfGvtJOtIeVuwwVxSz90xyrusM8zh3MqgSr1YlQYB/bpBl7vUw0p
	gdCt9/m/AeyCTSdq/IzkhB37Y/kqG1HcuUJ1JWnVeGmVjkdRmHC/Udyzxce3cHuo6AEL50Musc+HJ
	vuQtsbS4rLu3flSMvxSYMw3pVYV2K9hiu6eYQEno55Yga7rtVwKQObbzRSoyau1IRiKbnurE6/zRS
	NM/PeV0r9lSCr1yChstg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqGs-0000000HCvi-0Yuo;
	Thu, 08 Jan 2026 13:41:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqGq-0000000HCuD-0Pga
	for opensbi@lists.infradead.org;
	Thu, 08 Jan 2026 13:41:49 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608AiA5R3701352
	for <opensbi@lists.infradead.org>; Thu, 8 Jan 2026 13:41:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UuNs/1rpzglkgtw/z9vLPAtYFKtG9uhQt3QVMO5YEgU=; b=AIFaSPzYKSaXbCCM
	VQCPAuXDk2hoB/EyzSNwcU9bM6RTuS6BEpjLjUOfI9tAhe19EATn9oRkseXQle7H
	tuL/Kx4XOf4ugj2YMuWoxPFEW9quce0uQrLvRvEQUJH+g+l8eFg+iJ8I0ZMKxjqe
	VKZc4AbVr+MTF2uXHw/eSrd5Cyt3lrPNp6NR8I+ejn/NdBvhIHc1dvPoktqoroHh
	Z5BmFlTj0O4W3JXeEgd7yUBlhsu5NlGnqfsGkyt+QpFJ9/4j6G+aKt24plFEWU2i
	smb9O4HAPPzXcuhq8XZldkbGnbToUaF3VfIMFRH1KUxJA371RCuPv89Oi1bFbPXE
	Hmkh6Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjb39rfjq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Thu, 08 Jan 2026 13:41:45 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a360b8086so85853986d6.3
        for <opensbi@lists.infradead.org>; Thu, 08 Jan 2026 05:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767879705; x=1768484505; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UuNs/1rpzglkgtw/z9vLPAtYFKtG9uhQt3QVMO5YEgU=;
        b=YlBCHyiQcidpsn/LJc0M/Kkv3SNE3ztkAms+/LwCJ4Y8PlThnLC1CMfljea+Qsa+Oo
         F9JVyNwGPYFq0jDCrzUopqGEUXMYqijL4o6E2JR2qifhRGaTRR5ECtYfMXWWljLs6Ll/
         zhiFwm5Xic+6IbIqJEV0nK/cZVrnCgCYYD+xH15fm/RlGfB54kCRqmDGwxndl1jtMay1
         0XOsqi+93TgI+ca1cX6Az3VLBDWoUWoualOUjZHmkxChTmbYKplR4bvdVMa6tCL1yN7L
         HRPDZghV/Ll6xnBHybH5rRtzwFHTZgI6pxjgSGMoHkWAL1UMUuO2dMuaGfgvGhrjHRJy
         OfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767879705; x=1768484505;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UuNs/1rpzglkgtw/z9vLPAtYFKtG9uhQt3QVMO5YEgU=;
        b=AYDEqDr0z3uo2sT7meYX9+8K6GDzXNvmNTH0sFK0lVPjgskOeP4mXkpP2s0DRGYz5N
         0cnrjV/BOunx7CDCaVE8UAA83hIILKcDBYro9eCImKnSnXMobjhtjQqaPdpmRwcl1wsF
         gqLx6wFIcC6sBQtY+hva1xKpA40c4k+vlAXbVALAQ9PA22ANZ0y54cFIt2kt6hRx3LQr
         LUc/PnSjpv+E05b9PbejBi/3+gnwxOV7pW9Td/VXFtWkCs3E+oiQItSB5haDLD3qH9R5
         P0b9ZljX8BoqEArlgIOGqrCVjj06V6/bPkelfoISe/e0pGs5QQQTMj2Hvl9nyp1UXocK
         soYA==
X-Forwarded-Encrypted: i=1; AJvYcCVW9Pd4K6CT2nrdc3xFO12aLuA2Z5N2MArORd5b8H2Li8CprHPg9ibwyEYWIMwI5U2BAaroo11F@lists.infradead.org
X-Gm-Message-State: AOJu0YxmEs7MwBDkIdVFwdtXW1jppo/clseeyCiu2716grDzp5wPbIKg
	e51I+TME7cWlkkmMfLwnEApfsOx07OTE7nqdBe5hWUasCYvj1gCvN6e+BhWOrFCj0Nt8zL5ml3U
	t9o8Hz4YH835niebla2vvTmuw8V4buLWxsjJq26C199k5cFsF9Y5dsXuRqvNeo920LA==
X-Gm-Gg: AY/fxX52wvJ+9xLY39TfviqzY4NRR30Y2Wix+PzXxgMKUT/ocM7Ev0mHDfQam1a06ni
	XLUqosIeZ5E/EyEYClFJM5PJ3EZaFCgYGjhAW3gK0fxqtR9denqJteWqyR/J2Jm5jNQvE+tXAsW
	wKfWvEUm8jBbDaGo4e+bjKwQXuUGHYfdTj+ZZ83+CgFQ7oPHMGb12a/7fgiwyX2pEWpKmBWiMrd
	AmG0WZGRWu0n+DLXhvJ8I84lKe7R4Z0uv+GX6+5LeiWtbYisG6vSWAiZWnjVRaN5uLBSAN93d6w
	r/r1Hw+0/Suia7O+wndfM1JVqp+GJQd+T7ErL5msY9DAjXaXP/cioXgrViUlIX9kdjigCEsqW7l
	vm9JVMuwP0Rav9YuS/LjrYwWji5gQIRm5nG9cvMt3AX7V/gYv/xFVX8qKcUXmHb4FYC2z+EI+hw
	WQkS5B03Aah31f8BX3
X-Received: by 2002:ad4:5cad:0:b0:88a:342c:69c1 with SMTP id 6a1803df08f44-890841d0630mr84023106d6.27.1767879704519;
        Thu, 08 Jan 2026 05:41:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrmmkU7P8GNOaM9joG7nlPdemTdRqI4kVCdjsxpccsl4RZUaGdn7OaBkVy/p3UtPWwUG7Y9Q==
X-Received: by 2002:ad4:5cad:0:b0:88a:342c:69c1 with SMTP id 6a1803df08f44-890841d0630mr84022576d6.27.1767879703759;
        Thu, 08 Jan 2026 05:41:43 -0800 (PST)
Received: from [192.168.68.101] (200-162-225-127.static-corp.ajato.com.br. [200.162.225.127])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8907728565dsm51296246d6.56.2026.01.08.05.41.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 05:41:43 -0800 (PST)
Message-ID: <632a9235-f727-4b0d-9698-1f8bbdf3be60@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 10:41:39 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Hart isolation configuration failure (error -3) with OpenSBI 1.8
 on QEMU 10.1.3 rva22s64/rva23s64 profiles
To: Anup Patel <anup@brainfault.org>,
        Thomas Perrot <thomas.perrot@bootlin.com>
Cc: Xiang W <wxjstz@126.com>, OpenSBI <opensbi@lists.infradead.org>,
        qemu-riscv@nongnu.org
References: <bd8cc9b22f496b06e4c874253ba964f306c8f575.camel@bootlin.com>
 <ee3a8b0fe02eb882cfbb312e80d0694a2e964e76.camel@126.com>
 <c7901a6dfcedb10a1002d8874a1fd54cb2b58edf.camel@bootlin.com>
 <CAAhSdy3tzMsF_8gNxRZgCP5TBENTSpw+WpA1C=tZ08OtDNKRcg@mail.gmail.com>
Content-Language: en-US
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
In-Reply-To: <CAAhSdy3tzMsF_8gNxRZgCP5TBENTSpw+WpA1C=tZ08OtDNKRcg@mail.gmail.com>
X-Proofpoint-GUID: DIWyS9y15oVvErfyV7FVZIMg7L6IVM1L
X-Authority-Analysis: v=2.4 cv=X7Jf6WTe c=1 sm=1 tr=0 ts=695fb419 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ewOVoc8TSmC0cCmMeNMfEg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=P-IC7800AAAA:8
 a=q1HOcgkARA4PmTF_wpsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA5NiBTYWx0ZWRfX/T16DVI2RDSD
 Pl6Uooy5Fs4JteX5LYwowZoYTEu/ujxLAlMBHpQZ8ioiNIyUJd5duzhroAeDfPUn6nuk6pJeCrX
 wmyy6CUCvqWMHIKxd2TFK8uPSN+XBW2M5KDOyzeTs3M9P4Y3hQekwGQSyxFvrvanuVmZlLZEUej
 d6808BITM7XR2E47rY1owDuRXVrdr4w6rlyqDrqn8PCllcIgh0I4qkzUd2ZZO0s9p4GwPIYiIx1
 RJLJKSiYaoRXMPuncnFFZgo6JtwuC3axRZsekUoqrNntarD/fLDtaCT3wrISGVPMkL6ndje+zmz
 TDvy4FRsJRFYE0KM0m3GkjGjnizx5Sn/fQhbrvB0+sWJJ65hqod328dzRpNT/n5cHotfVJ8PLev
 giYljSEnarTCaNSJD2l1Ve8qi3fBuaLtrnejXNQ325omQ7Xnb9ci0eZrI/OOMcv0jINzA/JY5a/
 QwvzvphO8/xMlOdeiAQ==
X-Proofpoint-ORIG-GUID: DIWyS9y15oVvErfyV7FVZIMg7L6IVM1L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_054148_151880_278AEEA0 
X-CRM114-Status: GOOD (  15.86  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

CgpPbiAxLzgvMjAyNiAxMDozMyBBTSwgQW51cCBQYXRlbCB3cm90ZToKPiBIaSBUaG9tYXMsCj4g
Cj4gT24gV2VkLCBKYW4gNywgMjAyNiBhdCAzOjAy4oCvUE0gVGhvbWFzIFBlcnJvdCA8dGhvbWFz
LnBlcnJvdEBib290bGluLmNvbT4gd3JvdGU6Cj4+Cj4+IEhlbGxvIFhpYW5nLAo+Pgo+PiBPbiBX
ZWQsIDIwMjYtMDEtMDcgYXQgMTA6NDggKzA4MDAsIFhpYW5nIFcgd3JvdGU6Cj4+PiDlnKggMjAy
Ni0wMS0wNeS4gOeahCAxODo0MiArMDEwMO+8jFRob21hcyBQZXJyb3TlhpnpgZPvvJoKPj4+PiBI
ZWxsbywKPj4+Pgo+Pj4+IEhhcHB5IE5ldyBZZWFyIQo+Pj4+Cj4+Pj4gSSdtIGZhY2luZyBhIGhh
cnQgaXNvbGF0aW9uIGNvbmZpZ3VyYXRpb24gZXJyb3Igd2hlbiBydW5uaW5nCj4+Pj4gT3BlblNC
SQo+Pj4+IDEuOCBvbiBRRU1VIDEwLjEuMyB3aXRoIHRoZSBSSVNDLVYgYXBwbGljYXRpb24gcHJv
ZmlsZXMgcnZhMjJzNjQKPj4+PiBhbmQKPj4+PiBydmEyM3M2NDoKPj4+Pgo+Pj4+ICAgICAgaW5p
dF9jb2xkYm9vdDogaGFydCBpc29sYXRpb24gY29uZmlndXJlIGZhaWxlZCAoZXJyb3IgLTMpCj4+
Pj4KPj4+PiBObyBpc3N1ZSBvY2N1cnMgd2hlbiB1c2luZyB0aGUgcnY2NCBwcm9maWxlLiBUaGUg
c3lzdGVtIGNvbnRpbnVlcwo+Pj4+IHRvCj4+Pj4gYm9vdCBhZnRlciB0aGUgZXJyb3IsIGJ1dCBJ
J2QgbGlrZSB0byB1bmRlcnN0YW5kIHRoZSByb290IGNhdXNlLgo+Pj4+Cj4+Pj4gSSBoYXZlbid0
IHRlc3RlZCBPcGVuU0JJIDEuOCBvbiByZWFsIGhhcmR3YXJlIHlldCAtIHRoYXQncyBteSBuZXh0
Cj4+Pj4gc3RlcC4KPj4+Pgo+Pj4+IElzIHRoZXJlIGEga25vd24gUUVNVSBpc3N1ZT8gSXMgdGhl
cmUgYSByZWNvbW1lbmRlZCB3b3JrYXJvdW5kCj4+Pj4gYmVzaWRlcwo+Pj4+IHVzaW5nIHJ2NjQ/
Cj4+Pj4KPj4+PiBCZWxvdyBpcyB0aGUgY29tcGxldGUgdHJhY2U6Cj4+Pj4KPj4+PiBxZW11LXN5
c3RlbS1yaXNjdjY0IC1kZXZpY2UgdmlydGlvLW5ldC0KPj4+PiBkZXZpY2UsbmV0ZGV2PW5ldDAs
bWFjPTUyOjU0OjAwOjEyOjM1OjAyIC1uZXRkZXYKPj4+PiB1c2VyLGlkPW5ldDAsaG9zdGZ3ZD10
Y3A6MTI3LjAuMC4xOjIyMjItCj4+Pj4gOjIyLGhvc3Rmd2Q9dGNwOjEyNy4wLjAuMToyMzIzLQo+
Pj4+IDoyMyx0ZnRwPS9zcmMvYnVpbGQvdG1wL2RlcGxveS9pbWFnZXMvcWVtdXJpc2N2NjQgLW9i
amVjdCBybmctCj4+Pj4gcmFuZG9tLGZpbGVuYW1lPS9kZXYvdXJhbmRvbSxpZD1ybmcwIC1kZXZp
Y2UgdmlydGlvLXJuZy0KPj4+PiBwY2kscm5nPXJuZzAgLQo+Pj4+IGRyaXZlIGlkPWRpc2swLGZp
bGU9L3NyYy9idWlsZC90bXAvZGVwbG95L2ltYWdlcy9xZW11cmlzY3Y2NC9jb3JlLQo+Pj4+IGlt
YWdlLW1pbmltYWwtcWVtdXJpc2N2NjQucm9vdGZzLQo+Pj4+IDIwMjYwMTA1MTczODQ3LmV4dDQs
aWY9bm9uZSxmb3JtYXQ9cmF3Cj4+Pj4gLWRldmljZSB2aXJ0aW8tYmxrLWRldmljZSxkcml2ZT1k
aXNrMCAtZGV2aWNlIHFlbXUteGhjaSAtZGV2aWNlCj4+Pj4gdXNiLQo+Pj4+IHRhYmxldCAtZGV2
aWNlIHVzYi1rYmQgIC1tYWNoaW5lIHZpcnQgLWNwdSBydmEyM3M2NCAtc21wIDQgLW0gMjU2IC0K
Pj4+IFFFTVUgZGlzYWJsZXMgUE1QIGJ5IGRlZmF1bHQ7IHRoZSBmb2xsb3dpbmcgb3B0aW9uIG5l
ZWRzIHRvIGJlIGFkZGVkLgo+Pj4KPj4+IC1jcHUgcnZhMjNzNjQscG1wPXRydWUKPj4+Cj4+Cj4+
IFRoYW5rIHlvdS4gV2l0aCB0aGUgYWRkaXRpb25hbCBvcHRpb24sIHRoZSBpc3N1ZSBubyBsb25n
ZXIgb2NjdXJzLgo+IAo+IEkgaGF2ZSBkb25lIGFuIGluY3JlbWVudGFsIE9wZW5TQkkgdjEuOC4x
IHJlbGVhc2UKPiB0byBhZGRyZXNzIHRoaXMgaXNzdWUuIFdpdGggdGhpcyBpbmNyZW1lbnRhbCBy
ZWxlYXNlLAo+IHlvdSBkb24ndCBoYXZlIHRvIGV4cGxpY2l0bHkgcGFzcyAicG1wPXRydWUiIHRv
Cj4gcnZhMjJzNjQgYW5kIHJ2YTIzczY0IENQVSB0eXBlcyBpbiBRRU1VLgoKU2VlbXMgbGlrZSB3
ZSBkb24ndCBuZWVkIHRoaXMgcGF0Y2ggSSBzZW50IGEgZmV3IGRheXMgYWdvIHRoZW46CgoKIltQ
QVRDSF0gdGFyZ2V0L3Jpc2N2L2NwdS5jOiBlbmFibGUgUE1QIGJ5IGRlZmF1bHQgZm9yIHByb2Zp
bGUgQ1BVcyIKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3FlbXUtZGV2ZWwvMjAyNjAxMDYyMDUx
NTIuMzY1NDk3NS0xLWRhbmllbC5iYXJib3phQG9zcy5xdWFsY29tbS5jb20vCgoKV2UgY2FuIGxl
YXZlIHRoaXMgcGF0Y2ggYWxvbmUuIFdlIGNhbiBhbHNvIGxlYXZlIHRoZSB1cGRhdGUgdG8gT3Bl
blNCSSAKMS44IGFsb25lIGFzIHdlbGwgYW5kIHVwZGF0ZSB0byAxLjguMSB0byBnZXQgdGhlIGZp
eC4KCgpUaGFua3MsCgpEYW5pZWwKCgoKPiAKPiBSZWdhcmRzLAo+IEFudXAKPiAKCgotLSAKb3Bl
bnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
