Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23291C5B572
	for <opensbi@archiver.kernel.org>; Fri, 14 Aug 2026 18:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rwIKN0I0XTdTVetEhIiBy0NhTlYzvOE6wkPdNHC/NSI=; b=hkulyZbwR0GUWp
	HqwJ7AcEydlQavg/piJ3/Rp1GIvJCBxPnIQhSxF4cq1biCrT64XG2SfppRfXZ+vXMKup+NfJc6yki
	8dTcbpy+8uHA1GB2O5Kga4M1sBrqakMxudbP89TC92Xz9AG/SD+a7Tua61lBdW+i5En0tbD+XqmU+
	Vc59TLB5uDCzV5GWdZS7hb5P1P2qLEHHaLKsM2QBVznuvwzP4xn/KTb3obfg1B707UVKcCvDhsKWu
	8H958cf7tYbViWW2PtigYUcvKKtbxasVpHbFEWKL8NWcLoC48i99ZflwQrNfW8+7tQw/wvpiGngDX
	OrLY2IueF+A8286UOyFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuwYb-000000032ED-44mi;
	Fri, 14 Aug 2026 18:23:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuwYY-000000032D9-24fP
	for opensbi@lists.infradead.org;
	Fri, 14 Aug 2026 18:23:04 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EGiDJn2608624
	for <opensbi@lists.infradead.org>; Fri, 14 Aug 2026 18:23:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z4vEG3A3704lbQbBg30/GHHVOCsizdxw/06cNYqjvWI=; b=MXfdJiT+/baCPwak
	Oh76ertfLEHzjMwKQI62PxCmfQIDZxWrJaqXZVhIMUDqP8zfaWhzH7UHZ+BhRVMf
	zsLf/f638vk/pOMFheEfFgJHq9hZqPelYX+skMCGVu7htcuutazZGaEV1Zq8E2WT
	pnbPp9GA+JzMeT0E5WYLs/kq/M1fFm+h9GlklbwIbEfw0u6Uplgc+N4SpTWz0iDE
	oSoEtNRJiqkdVSc4eWdIclcOGqDXAVKFTvoAtZDPt1jHsmxzRPntCh72HMEEwJiR
	aTwQC/RQWd6KoYyrL6ca0Q8++bFlqzwQ7+085UXv4eUoNR6FN2yzYb7+FBjRaZSp
	E+aXVQ==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g26j6gefe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Fri, 14 Aug 2026 18:23:01 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6a196857c7aso1434075eaf.2
        for <opensbi@lists.infradead.org>; Fri, 14 Aug 2026 11:23:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786731780; cv=none;
        d=google.com; s=arc-20260327;
        b=oYwN/4nY9f1FGObBG4YW3ZZ64F4104F0ktHezm7x1VUYW2U1fGQ+6+okEmW2MtbyY8
         amJ1XC6AugW89t/uORWhTL5EQBM0jSs1xeZD7gMo6Cek+4fNd5S98GeytTeQgnITxI2i
         2VnqrZx+L93S37WsuhmqsaGzIpyp85bqkt+4lO8icRyX+Yjn535iEnOjCBCfIQ8DXSm1
         4DBG7ceL7/3+8BJCIWW6kvrbavphz3ytu6wSaM7SIT+E4zDWC4W8L5lIjBsgYIjgn/N0
         uQEa6+ShwdV0hpmjZV/rwkvpkmkQEPyFEY+OShdlCNMKE4oLGnjQa1W0QW1zXs9oBNjl
         J6jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z4vEG3A3704lbQbBg30/GHHVOCsizdxw/06cNYqjvWI=;
        fh=Lkfg6rg1GqMvBfMlqDNTfhM75kjca1XYw5/9InBuIx8=;
        b=bJg9AgKBsuEoInkpB8xV9XXLH35UNdup1/LdR3OuD7pXI+O0z03W18Lywv24qa1gjE
         d9U4O3gEMREU0G1MqZuCbJ+GiBUqqQd/ca99IBKlfMvoNdOQLCaBFsNL0t7KElw3V8Wt
         oU5ekUU17Vdr0+VIdCtjhTa5VrymERzDWEnIt5zV53hXwyZr1i4Lp/trHlK5DnOZsFdw
         a2N87vUITT0+53biZXoP0dLuD/7oPr917yEnFo5lsH6NC9xUD7PCcAatd5puafUlhq5K
         vkkTQcgNzoHM6jm16tQhq9FjYZfmRjdydepkGDi+SP0qBN3CTWLynElV6eh5jRbKHh/u
         nO7w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786731780; x=1787336580; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z4vEG3A3704lbQbBg30/GHHVOCsizdxw/06cNYqjvWI=;
        b=Zma0CXm1R8XLX1u1Fbi9rYzNaqSM6aJJeJxJnhcjC8PJSD++Vp7D5l9xqGUbcGtEQv
         aAtRQO9TWp0Lg5TG9A3WQ8RHiPn+c/ZjG8G4dSt0kEFWGtG7fB045Kyuw5CALHd1TGRu
         WmTMF3jI9qtm01idOiomZyyqBbNlEFmQ4vtQnkiRuZlSGQvhBQUvWRtaXXFoW6L8fkbo
         N4PXwiyKtqwc79K8RPyhhH2srpMwHbEi3X3rWORI7mm7bB9GKnIUFPYisnr/8mwLBDcF
         Szg2d9HCAYe4IA0+XQdrj3xI1gY3L48qDSMMTSwHVEjcBjTd0qz5iPtJQ7YSJTfT+hBI
         GxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786731780; x=1787336580;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z4vEG3A3704lbQbBg30/GHHVOCsizdxw/06cNYqjvWI=;
        b=V/ekh+IvFhU73OLBc81khAeTmuTsT0irkVFgE3Pfw+QB7GsvixtcQN5/6z325bCPTx
         QgtRzot43w5FzSmqx4Agl7v3s/0hbASpV7cluRb6gOww+GymN3PTf21SO8ISPkMq8xcQ
         BgHlzZ+MfuVUV8v7AlBEwqlVlsebcQ1w67LZutAKwlIIyX9f/S4EPWxCKY6+wgCO+e8a
         EaL68spihJ4BhY2Xtf7YG7dd+372TEtCu69EaR7DD/HVuN/tttemHWnfc2COKyrXn94H
         VQ/B6GFhKZmkhb2S9dE+WK+mAj9zeEMKJSD1CU29Bgc+wcfYGjabwHXXsiX0A2da3QgA
         oVkw==
X-Forwarded-Encrypted: i=1; AHgh+RqKbHs2X3KUwLqDa/F5JF4Eb31b1tj5VguJ2eCNOV5JfBVSd5KUpb/rIVfveF57vSSHK5TmNFcJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwDD9n5+1abP7nlQLBg3evKLRPi1bRs6EwqOI7jCIw9FLFw4283
	CghCwaJIjFYg8U/jOh8caphykKGpSHOYYjxqgX6axXStyk7DalFRRNc4a0vNzmnLVzZswLGbfKI
	msDqADY6k1IK0btI5JtQ1k5030W+j8YNBOopEPd9/K9zP3fVLcxw8OM90H8oMZxKE2i0B99Ch2g
	3HroW5sTIj2FLGcMZfLYgvcqQIhaK4qH6Ulv0DGUxP
X-Gm-Gg: AR+sD13773p1KRuFB8XG5YkKovEvWTjUT9ehm6hBX3bVEHm22R4JnIUTyEHtTvFiOfx
	GdQZlsuAPLC1/lL8lr3/xQ9gXqQMJkaHq/ydMVFg13KiGTQBpAQxFuoQV7JdcOdSRErl4Jj6NFA
	Xm74F83X5R9LPB4rOslKUVonb3H4uxwu2TktRREb6DP9X3Erj/Um3Eq8HiyA==
X-Received: by 2002:a05:6820:338c:10b0:6b0:d7aa:5c36 with SMTP id 006d021491bc7-6b0d7aab5a3mr4675162eaf.24.1786731780466;
        Fri, 14 Aug 2026 11:23:00 -0700 (PDT)
X-Received: by 2002:a05:6820:338c:10b0:6b0:d7aa:5c36 with SMTP id
 006d021491bc7-6b0d7aab5a3mr4675134eaf.24.1786731780013; Fri, 14 Aug 2026
 11:23:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260807045002.2538935-1-anup.patel@oss.qualcomm.com> <20260807045002.2538935-4-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260807045002.2538935-4-anup.patel@oss.qualcomm.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 11:22:48 -0700
X-Gm-Features: AUfX_mzgvg8r4Z-vKyP18O-fSlSKXgh5I4Tiqsgy2-ZrlSfQQV9wqR9rRDtNWps
Message-ID: <CAAVgOkLAa8Y-n-+NYNGRP+yZR1he5tWOa9nZ4OcBiYewGMJPCg@mail.gmail.com>
Subject: Re: [PATCH 3/3] lib: sbi_domain: Introduce domain intialization order
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
X-Proofpoint-ORIG-GUID: a2X5uUooJKsygXqFfLSMQne_BCb8sQ2J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDE0MSBTYWx0ZWRfX3IRFX5s3zLnZ
 arjlKUs5/gpbYse4AE0rc/OILerpvF45vS5mTP0+kmRkGEQ6UDF793qU2bKPS1wLrMzn5XNvWbf
 l+wCHODVJzAPUctG32nwjbupwRLFfNa/KbpspkD8CIIPTXTF6yKBNkEPKueWDTeSc/Ayhu6b1C5
 BeNZytoJL+Yt4Ergx2lJfnViKOdC5JBZXK8L5Ch+KWX9aFZxtzw45T824q3QuYveBvRX+/5+PFN
 cE7na1Qd+nt8TITK5ogfaAl+P4P4jdQSvYjlcXwZSSt4e6ewM+mmjN5P8MUHjcTDlk0X2K1r46r
 ekVtFnBVksitxzMvvKlpImtXyHIPYr81KqbXKyonHx1iHufzc/hw7X4i0CYXsTEiAG92M/oD/OV
 8y4b1vvnN9FSv+dQx1w/+pLv0NtGnEwhQLp/xhddpdhT6MBxnw7UwerYrglYFx0wrBa8uCbpAZN
 V8vIngjSdu2PS9Im2jA==
X-Authority-Analysis: v=2.4 cv=ZbMt8MVA c=1 sm=1 tr=0 ts=6a7f5d05 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=hAoamk1H0vS1687qQkkA:9 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: a2X5uUooJKsygXqFfLSMQne_BCb8sQ2J
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDE0MSBTYWx0ZWRfX4ie5RPH0P6Bi
 W5+wsThT00KvelWmOSkCeOaJ5OBzSiI77vsBvMO8NCjAUIW4ghS2foVjJUVY7jB91CMXtI/2Mc4
 6IAMDAv+Ml191xWsq1E3hFVAQv7fNUE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_112302_677287_0A9D9D6A 
X-CRM114-Status: GOOD (  33.70  )
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

T24gVGh1LCBBdWcgNiwgMjAyNiBhdCA5OjUw4oCvUE0gQW51cCBQYXRlbCA8YW51cC5wYXRlbEBv
c3MucXVhbGNvbW0uY29tPiB3cm90ZToKPgo+IEN1cnJlbnRseSwgdGhlIGRvbWFpbiBpbml0aWFs
aXphdGlvbiBvcmRlciBpcyBpbXBsaWVkIGJ5IHRoZSBvcmRlcgo+IGluIHdoaWNoIGRvbWFpbnMg
YXJlIHBvcHVsYXRlZCBieSBzYmlfcGxhdGZvcm1fZG9tYWluc19pbml0KCkgZnJvbQo+IHNiaV9k
b21haW5fZmluYWxpemUoKS4gVGhpcyBpcyBub3QgZG9jdW1lbnRlZCBhbnl3aGVyZSBhbmQgZm9y
Y2VzCj4gdW5lY2Vzc2FyeSBvcmRlcmluZyBiZXR3ZWVuIGRvbWFpbiBEVCBub2Rlcy4KPgo+IFRv
IGFkZHJlc3MgdGhlIGFib3ZlLCBpbnRyb2R1Y2UgcGVyLWRvbWFpbiAzMi1iaXQgaW50ZWdlciB0
byByZXByZXNlbnQKPiBpbnRpYWxpemF0aW9uIG9yZGVyIChha2EgImluaXRfb3JkZXIiKSB3aGVy
ZSBkb21haW4gd2l0aCBhIGxvd2VyCj4gaW5pdGlhbGl6YXRpb24gb3JkZXIgd2lsbCBiZSBib290
ZWQgZmlyc3QgYW5kIHR3byBkb21haW5zIG11c3Qgbm90Cj4gaGF2ZSBzYW1lIGluaXRpYWxpemF0
aW9uIG9yZGVyLiBGb3IgRFQgYmFzZWQgZG9tYWluIGNyZWF0aW9uLCBuZXcKPiAiaW5pdC1vcmRl
ciIgRFQgcHJvcGVydHkgY2FuIGJlIHVzZWQgaW4gZG9tYWluIERUIG5vZGUgdG8gc3BlY2lmeQo+
IHRoZSBpbml0aWFsaXphdGlvbiBvcmRlci4gVGhlIFJPT1QgZG9tYWluIGlzIGFzc3VtZWQgdG8g
aGF2ZSBsb3dlc3QKPiBpbml0aWFsaXphdGlvbiBvcmRlciAoYWthIDB4ZmZmZmZmZmYpLgo+Cj4g
U2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YW51cC5wYXRlbEBvc3MucXVhbGNvbW0uY29tPgo+
IC0tLQo+ICBkb2NzL2RvbWFpbl9zdXBwb3J0Lm1kICAgICAgIHwgIDUgKysrKysKPiAgaW5jbHVk
ZS9zYmkvc2JpX2RvbWFpbi5oICAgICB8ICAyICsrCj4gIGxpYi9zYmkvc2JpX2RvbWFpbi5jICAg
ICAgICAgfCAyMSArKysrKysrKysrKysrKy0tLS0tLS0KPiAgbGliL3NiaS9zYmlfZG9tYWluX2Nv
bnRleHQuYyB8IDE1ICsrKysrKysrKy0tLS0tLQo+ICBsaWIvdXRpbHMvZmR0L2ZkdF9kb21haW4u
YyAgIHwgIDggKysrKysrKysKPiAgNSBmaWxlcyBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspLCAx
MyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kb2NzL2RvbWFpbl9zdXBwb3J0Lm1kIGIv
ZG9jcy9kb21haW5fc3VwcG9ydC5tZAo+IGluZGV4IDgyZjE1NWUxLi42NTViZjQ3NCAxMDA2NDQK
PiAtLS0gYS9kb2NzL2RvbWFpbl9zdXBwb3J0Lm1kCj4gKysrIGIvZG9jcy9kb21haW5fc3VwcG9y
dC5tZAo+IEBAIC0zOSw2ICszOSw5IEBAIGhhcyBmb2xsb3dpbmcgZGV0YWlsczoKPgo+ICAqICoq
aW5kZXgqKiAtIExvZ2ljYWwgaW5kZXggb2YgdGhpcyBkb21haW4KPiAgKiAqKm5hbWUqKiAtIE5h
bWUgb2YgdGhpcyBkb21haW4KPiArKiAqKmluaXRfb3JkZXIqKiAtIEluaXRpYWxpemF0aW9uIG9y
ZGVyIG9mIHRoaXMgZG9tYWluLiBEb21haW4gd2l0aCBhCj4gKyAgbG93ZXIgaW5pdGlhbGl6YXRp
b24gb3JkZXIgd2lsbCBiZSBib290ZWQgZmlyc3QgYW5kIHR3byBkb21haW5zIG11c3QKPiArICBu
b3QgaGF2ZSBzYW1lIGluaXRpYWxpemF0aW9uIG9yZGVyLgo+ICAqICoqYXNzaWduZWRfaGFydHMq
KiAtIEhBUlRzIGFzc2lnbmVkIHRvIHRoaXMgZG9tYWluCj4gICogKipwb3NzaWJsZV9oYXJ0cyoq
IC0gSEFSVHMgcG9zc2libGUgaW4gdGhpcyBkb21haW4KPiAgKiAqKnJlZ2lvbnMqKiAtIEFycmF5
IG9mIG1lbW9yeSByZWdpb25zIHRlcm1pbmF0ZWQgYnkgYSBtZW1vcnkgcmVnaW9uCj4gQEAgLTc1
LDYgKzc4LDggQEAgZm9sbG93aW5nIG1hbm5lcjoKPgo+ICAqICoqaW5kZXgqKiAtIExvZ2ljYWwg
aW5kZXggb2YgdGhlIFJPT1QgZG9tYWluIGlzIGFsd2F5cyB6ZXJvCj4gICogKipuYW1lKiogLSBO
YW1lIG9mIHRoZSBST09UIGRvbWFpbiBpcyAicm9vdCIKPiArKiAqKmluaXRfb3JkZXIqKiAtIElu
aXRpYWxpemF0aW9uIG9yZGVyIG9mIHRoZSBST09UIGRvbWFpbiBpcyBhbHdheXMKPiArICAweGZm
ZmZmZmZmIChha2EgbWF4aW11bSBwb3NzaWJsZSAzMi1iaXQgdmFsdWUpCj4gICogKiphc3NpZ25l
ZF9oYXJ0cyoqIC0gQXQgYm9vdC10aW1lIGFsbCB2YWxpZCBIQVJUcyBvZiBhIFJJU0MtViBwbGF0
Zm9ybQo+ICAgIGFyZSBhc3NpZ25lZCB0aGUgUk9PVCBkb21haW4gd2hpY2ggY2hhbmdlcyBsYXRl
ciBiYXNlZCBvbiBPcGVuU0JJCj4gICAgcGxhdGZvcm0gc3VwcG9ydAo+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL3NiaS9zYmlfZG9tYWluLmggYi9pbmNsdWRlL3NiaS9zYmlfZG9tYWluLmgKPiBpbmRl
eCBiNjczMWMwNC4uYjM1ZWE5OWYgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9zYmkvc2JpX2RvbWFp
bi5oCj4gKysrIGIvaW5jbHVkZS9zYmkvc2JpX2RvbWFpbi5oCj4gQEAgLTE5OSw2ICsxOTksOCBA
QCBzdHJ1Y3Qgc2JpX2RvbWFpbiB7Cj4gICAgICAgICBzcGlubG9ja190IGFzc2lnbmVkX2hhcnRz
X2xvY2s7Cj4gICAgICAgICAvKiogTmFtZSBvZiB0aGlzIGRvbWFpbiAqLwo+ICAgICAgICAgY2hh
ciBuYW1lWzY0XTsKPiArICAgICAgIC8qKiBJbml0aWFsaXphdGlvbiBvcmRlciBvZiB0aGlzIGRv
bWFpbiAqLwo+ICsgICAgICAgdTMyIGluaXRfb3JkZXI7Cj4gICAgICAgICAvKiogUG9zc2libGUg
SEFSVHMgaW4gdGhpcyBkb21haW4gKi8KPiAgICAgICAgIGNvbnN0IHN0cnVjdCBzYmlfaGFydG1h
c2sgKnBvc3NpYmxlX2hhcnRzOwo+ICAgICAgICAgLyoqIEFycmF5IG9mIG1lbW9yeSByZWdpb25z
IHRlcm1pbmF0ZWQgYnkgYSByZWdpb24gd2l0aCBvcmRlciB6ZXJvICovCj4gZGlmZiAtLWdpdCBh
L2xpYi9zYmkvc2JpX2RvbWFpbi5jIGIvbGliL3NiaS9zYmlfZG9tYWluLmMKPiBpbmRleCBhZjc1
MzQ1OS4uNzQ3YzM0NmMgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfZG9tYWluLmMKPiArKysg
Yi9saWIvc2JpL3NiaV9kb21haW4uYwo+IEBAIC0yOCw2ICsyOCw3IEBAIHN0YXRpYyBib29sIGRv
bWFpbl9maW5hbGl6ZWQgPSBmYWxzZTsKPgo+ICBzdHJ1Y3Qgc2JpX2RvbWFpbiByb290ID0gewo+
ICAgICAgICAgLm5hbWUgPSAicm9vdCIsCj4gKyAgICAgICAuaW5pdF9vcmRlciA9IC0xVSwKPiAg
ICAgICAgIC5wb3NzaWJsZV9oYXJ0cyA9IE5VTEwsCj4gICAgICAgICAucmVnaW9ucyA9IE5VTEws
Cj4gICAgICAgICAuc3lzdGVtX3Jlc2V0X2FsbG93ZWQgPSB0cnVlLAo+IEBAIC01MzcsNiArNTM4
LDkgQEAgdm9pZCBzYmlfZG9tYWluX2R1bXAoY29uc3Qgc3RydWN0IHNiaV9kb21haW4gKmRvbSwg
Y29uc3QgY2hhciAqc3VmZml4KQo+ICAgICAgICAgc2JpX3ByaW50ZigiRG9tYWluJWQgTmFtZSAg
ICAgICAgJXM6ICVzXG4iLAo+ICAgICAgICAgICAgICAgICAgICBkb20tPmluZGV4LCBzdWZmaXgs
IGRvbS0+bmFtZSk7Cj4KPiArICAgICAgIHNiaV9wcmludGYoIkRvbWFpbiVkIEluaXQgT3JkZXIg
ICVzOiAweCV4XG4iLAo+ICsgICAgICAgICAgICAgICAgICBkb20tPmluZGV4LCBzdWZmaXgsIGRv
bS0+aW5pdF9vcmRlcik7Cj4gKwo+ICAgICAgICAgc2JpX3ByaW50ZigiRG9tYWluJWQgQm9vdCBI
QVJUICAgJXM6ICVkXG4iLAo+ICAgICAgICAgICAgICAgICAgICBkb20tPmluZGV4LCBzdWZmaXgs
IGRvbS0+Ym9vdF9oYXJ0aWQpOwo+Cj4gQEAgLTYzNSw5ICs2MzksMTQgQEAgaW50IHNiaV9kb21h
aW5fcmVnaXN0ZXIoc3RydWN0IHNiaV9kb21haW4gKmRvbSkKPiAgICAgICAgIGlmICghZG9tIHx8
IGRvbWFpbl9maW5hbGl6ZWQpCj4gICAgICAgICAgICAgICAgIHJldHVybiBTQklfRUlOVkFMOwo+
Cj4gLSAgICAgICAvKiBDaGVjayBpZiBkb21haW4gYWxyZWFkeSBkaXNjb3ZlcmVkICovCj4gKyAg
ICAgICAvKgo+ICsgICAgICAgICogRW5zdXJlIHRoYXQ6Cj4gKyAgICAgICAgKiAgMSkgRG9tYWlu
IG5vdCBhbHJlYWR5IHJlZ2lzdGVyZWQKPiArICAgICAgICAqICAyKSBJbml0aWFsaXphdGlvbiBv
cmRlciBpcyB1bmlxdWUKPiArICAgICAgICAqLwo+ICAgICAgICAgc2JpX2RvbWFpbl9mb3JfZWFj
aCh0ZG9tKSB7Cj4gLSAgICAgICAgICAgICAgIGlmICh0ZG9tID09IGRvbSkKPiArICAgICAgICAg
ICAgICAgaWYgKHRkb20gPT0gZG9tIHx8Cj4gKyAgICAgICAgICAgICAgICAgICB0ZG9tLT5pbml0
X29yZGVyID09IGRvbS0+aW5pdF9vcmRlcikKPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1
cm4gU0JJX0VBTFJFQURZOwo+ICAgICAgICAgfQo+Cj4gQEAgLTY2MiwxNSArNjcxLDEzIEBAIGlu
dCBzYmlfZG9tYWluX3JlZ2lzdGVyKHN0cnVjdCBzYmlfZG9tYWluICpkb20pCj4gICAgICAgICBz
YmlfaGFydG1hc2tfY2xlYXJfYWxsKCZkb20tPmFzc2lnbmVkX2hhcnRzKTsKPgo+ICAgICAgICAg
LyoKPiAtICAgICAgICAqIEFzc2lnbiBhIG5vbi1ST09UIGRvbWFpbiB0byBhIEhBUlQgb24gZmly
c3QgY29tZSBmaXJzdCBzZXJ2ZQo+IC0gICAgICAgICogYmFzaXMgaWYgdGhlIEhBUlQgaXMgbGlz
dGVkIGFzIGEgcG9zc2libGUgSEFSVCBvZiB0aGUgbm9uLVJPT1QKPiAtICAgICAgICAqIGRvbWFp
bi4gSWYgbm8gbm9uLVJPT1QgZG9tYWluIGxpc3QgYSBIQVJUIGFzIHBvc3NpYmxlIEhBUlQgdGhl
bgo+IC0gICAgICAgICogdGhlIEhBUlQgaXMgYXNzaWduZWQgdG8gdGhlIFJPT1QgZG9tYWluLgo+
ICsgICAgICAgICogQXNzaWduIEhBUlQgdG8gYSBkb21haW4gd2l0aCB0aGUgbGVhc3QgaW5pdGlh
bGl6YXRpb24gb3JkZXIKPiArICAgICAgICAqIHdoZXJlIHRoZSBIQVJUIGlzIGxpc3RlZCBhcyBh
IHBvc3NpYmxlIEhBUlQgb2YgdGhlIGRvbWFpbi4KPiAgICAgICAgICAqLwo+ICAgICAgICAgc2Jp
X2hhcnRtYXNrX2Zvcl9lYWNoX2hhcnRpbmRleChpLCBkb20tPnBvc3NpYmxlX2hhcnRzKSB7Cj4g
ICAgICAgICAgICAgICAgIHRkb20gPSBzYmlfaGFydGluZGV4X3RvX2RvbWFpbihpKTsKPiAgICAg
ICAgICAgICAgICAgaWYgKHRkb20pIHsKPiAtICAgICAgICAgICAgICAgICAgICAgICBpZiAodGRv
bSA9PSAmcm9vdCkKPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAodGRvbS0+aW5pdF9vcmRl
ciA+IGRvbS0+aW5pdF9vcmRlcikKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNi
aV9oYXJ0bWFza19jbGVhcl9oYXJ0aW5kZXgoaSwgJnRkb20tPmFzc2lnbmVkX2hhcnRzKTsKPiAg
ICAgICAgICAgICAgICAgICAgICAgICBlbHNlCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBjb250aW51ZTsKPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfZG9tYWluX2NvbnRleHQu
YyBiL2xpYi9zYmkvc2JpX2RvbWFpbl9jb250ZXh0LmMKPiBpbmRleCA4MzdmZjU0Zi4uZTM5YzEw
ZmEgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfZG9tYWluX2NvbnRleHQuYwo+ICsrKyBiL2xp
Yi9zYmkvc2JpX2RvbWFpbl9jb250ZXh0LmMKPiBAQCAtMjkxLDI4ICsyOTEsMzEgQEAgaW50IHNi
aV9kb21haW5fY29udGV4dF9leGl0KHZvaWQpCj4gICAgICAgICB9Cj4KPiAgICAgICAgIGRvbV9j
dHggPSBjdHgtPnByZXZfY3R4Owo+ICsgICAgICAgY3R4LT5wcmV2X2N0eCA9IE5VTEw7Cj4KPiAg
ICAgICAgIC8qIElmIG5vIHByZXZpb3VzIGNhbGxlciBjb250ZXh0ICovCj4gICAgICAgICBpZiAo
IWRvbV9jdHgpIHsKPiAtICAgICAgICAgICAgICAgLyogVHJ5IHRvIGZpbmQgbmV4dCB1bmluaXRp
YWxpemVkIHVzZXItZGVmaW5lZCBkb21haW4ncyBjb250ZXh0ICovCj4gKyAgICAgICAgICAgICAg
IC8qIFRyeSB0byBmaW5kIG5leHQgdW5pbml0aWFsaXplZCBkb21haW4gd2l0aCBsZWFzdCBpbml0
aWFsaXphdGlvbiBvcmRlciAqLwo+ICsgICAgICAgICAgICAgICBkb21fY3R4ID0gTlVMTDsKPiAg
ICAgICAgICAgICAgICAgc2JpX2RvbWFpbl9mb3JfZWFjaChkb20pIHsKPiAtICAgICAgICAgICAg
ICAgICAgICAgICBpZiAoZG9tID09ICZyb290IHx8IGRvbSA9PSBzYmlfZG9tYWluX3RoaXNoYXJ0
X3B0cigpKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmIChkb20gPT0gc2JpX2RvbWFpbl90
aGlzaGFydF9wdHIoKSkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVl
Owo+Cj4gICAgICAgICAgICAgICAgICAgICAgICAgaWYgKCFzYmlfaGFydG1hc2tfdGVzdF9oYXJ0
aW5kZXgoaGFydGluZGV4LCBkb20tPnBvc3NpYmxlX2hhcnRzKSkKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+Cj4gICAgICAgICAgICAgICAgICAgICAgICAgdG1w
ID0gaGFydF9jb250ZXh0X2dldChkb20sIGhhcnRpbmRleCk7Cj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgaWYgKHRtcCAmJiAhdG1wLT5pbml0aWFsaXplZCkgewo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIGlmICh0bXAgJiYgdG1wLT5pbml0aWFsaXplZCkKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGNvbnRpbnVlOwo+ICsKPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAo
IWRvbV9jdHggfHwgdG1wLT5kb20tPmluaXRfb3JkZXIgPCBkb21fY3R4LT5kb20tPmluaXRfb3Jk
ZXIpIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRvbV9jdHggPSB0bXA7Cj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgICAgICAgICAg
ICAgICAgICB9Cj4gICAgICAgICAgICAgICAgIH0KPiAgICAgICAgIH0KPiAtCj4gLSAgICAgICAv
KiBUYWtlIHRoZSByb290IGRvbWFpbiBjb250ZXh0IGlmIGZhaWwgdG8gZmluZCAqLwo+ICAgICAg
ICAgaWYgKCFkb21fY3R4KQo+IC0gICAgICAgICAgICAgICBkb21fY3R4ID0gaGFydF9jb250ZXh0
X2dldCgmcm9vdCwgaGFydGluZGV4KTsKPiArICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FTk9F
TlQ7Cj4KPiAgICAgICAgIHJldHVybiBzd2l0Y2hfdG9fbmV4dF9kb21haW5fY29udGV4dChjdHgs
IGRvbV9jdHgpOwo+ICB9Cj4gZGlmZiAtLWdpdCBhL2xpYi91dGlscy9mZHQvZmR0X2RvbWFpbi5j
IGIvbGliL3V0aWxzL2ZkdC9mZHRfZG9tYWluLmMKPiBpbmRleCAzMTc4NmUwZS4uMzY2YWIxMzgg
MTAwNjQ0Cj4gLS0tIGEvbGliL3V0aWxzL2ZkdC9mZHRfZG9tYWluLmMKPiArKysgYi9saWIvdXRp
bHMvZmR0L2ZkdF9kb21haW4uYwo+IEBAIC0zMzEsNiArMzMxLDE0IEBAIHN0YXRpYyBpbnQgX19m
ZHRfcGFyc2VfZG9tYWluKGNvbnN0IHZvaWQgKmZkdCwgaW50IGRvbWFpbl9vZmZzZXQsIHZvaWQg
Km9wYXF1ZSkKPiAgICAgICAgICAgICAgICAgICAgIHNpemVvZihkb20tPm5hbWUpKTsKPiAgICAg
ICAgIGRvbS0+bmFtZVtzaXplb2YoZG9tLT5uYW1lKSAtIDFdID0gJ1wwJzsKPgo+ICsgICAgICAg
LyogUmVhZCBpbml0YWxpemF0aW9uIG9yZGVyICovCj4gKyAgICAgICB2YWwgPSBmZHRfZ2V0cHJv
cChmZHQsIGRvbWFpbl9vZmZzZXQsICJpbml0LW9yZGVyIiwgJmxlbik7Cj4gKyAgICAgICBsZW4g
PSBsZW4gLyBzaXplb2YodTMyKTsKPiArICAgICAgIGlmICh2YWwgJiYgbGVuKQo+ICsgICAgICAg
ICAgICAgICBkb20tPmluaXRfb3JkZXIgPSBmZHQzMl90b19jcHUodmFsWzBdKTsKPiArICAgICAg
IGVsc2UKPiArICAgICAgICAgICAgICAgZG9tLT5pbml0X29yZGVyID0gKHUzMilkb21haW5fb2Zm
c2V0Owo+ICsKCk96YTogaWYgZG9taW5hIGRvZXNudCBwcm92aWRlIGZvbGxvd2luZyBwcm9wZXJ0
aWVzIHRoZW4gaGF2ZSBjbGVhbmVyCmVsc2UgYW5kIGV4cGxjaXRseSBpbmhlcml0IGZyb20gcm9v
dCBkb21pbmEKCnZhbDY0ID0gcm9vdC5uZXh0X2FyZzE7CnZhbDY0ID0gcm9vdC5uZXh0X2FkZHI7
CgovKiBSZWFkICJuZXh0LWFyZzEiIERUIHByb3BlcnR5ICovCi8qIFJlYWQgIm5leHQtYWRkciIg
RFQgcHJvcGVydHkgKi8KCgpSZXZpZXdlZC1ieTogUGF3YW5kZWVwIE96YSA8cGF3YW5kZWVwLm96
YUBvc3MucXVhbGNvbW0uY29tPgpUZXN0ZWQtYnk6IFBhd2FuZGVlcCBPemEgPHBhd2FuZGVlcC5v
emFAb3NzLnF1YWxjb21tLmNvbT4KCgo+ICAgICAgICAgLyogU2V0dXAgcG9zc2libGUgSEFSVHMg
bWFzayAqLwo+ICAgICAgICAgU0JJX0hBUlRNQVNLX0lOSVQobWFzayk7Cj4gICAgICAgICBkb20t
PnBvc3NpYmxlX2hhcnRzID0gbWFzazsKPiAtLQo+IDIuNDMuMAo+Cj4KPiAtLQo+IG9wZW5zYmkg
bWFpbGluZyBsaXN0Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCgotLSAKb3BlbnNiaSBtYWls
aW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
