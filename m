Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F499EF48C6
	for <opensbi@archiver.kernel.org>; Fri, 13 Feb 2026 04:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=22ULUxIidk8SwEErov2dNhcjz1ovuqXhRD7dnH1W/mk=; b=SLO/cEiRK4h5Mz
	wwXLO3xTjp8W34gXPqW7AEsRE0RSmDLNTJzlr0r4mmP5wGusB3VrAWJhvyc96qDRVa8wHL3n0C3ml
	2OKTXX+ROAGQI6oey3BbOKfsX85VgLGNG+uMnRbBtd8phBPj6G4Ob5VSCo9jA+9ntrIR5axGJosuL
	49UxlkSHRjruWkgTfjhegredF7FmPwAnCVwdsgXfygyWV8kdZCcMN7Ftr/YQ2K9Ue8WyF0CTvCgDV
	GAWOHTXFSlduidyGRMgAPg4+0HG0WElxJOfGmC7AmSZO7NeP4Q0wcrviBPegVy1V0SIg+Jo6/mQ6m
	n00BgSe709OBMEOZb/BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqkND-00000002w9l-2jEs;
	Fri, 13 Feb 2026 04:01:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqkNB-00000002w9O-2Dlj
	for opensbi@lists.infradead.org;
	Fri, 13 Feb 2026 04:01:42 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D0BeBo2733243
	for <opensbi@lists.infradead.org>; Fri, 13 Feb 2026 04:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dcrgsr42SwReNT4w3Ug3jHIaOC8ACTsJqPwn5qtiTds=; b=jVROnLUE5fT0+IlQ
	TRT0SyLnKmKFa6aNl7c3kcDc6YCsXkJ6b9Nldw/ADEKZcMBtYA64Sacth5rD1gNl
	IQG4W4p+07NvVzxylPjaaZ/TvKhUf6/z1xM7xkQiTf2JWEWx6b0B23YxO2M4vLAY
	6DxUR3h0r4TylMZcHMV2up8t0r9ulmzIWk7whuPJ1tmbCs6CWvNuRIWODEJNo5MK
	otQp+FzFCFO5/nXqUCeM111fobJQjbpCc5X8xOaFxpH4yv5MIOxpvN0Z86QEIIQl
	1tKuYcElu9YBnzD4sppWGJU/j7WDUSjm2rvqjzi4i54C9aMUx/26/s+KOITQ2s6J
	05kmQg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9s6wrm9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Fri, 13 Feb 2026 04:01:40 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ba87c0e198so503350eec.1
        for <opensbi@lists.infradead.org>; Thu, 12 Feb 2026 20:01:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770955300; cv=none;
        d=google.com; s=arc-20240605;
        b=Jad1GpCdm+6sdeb/e/2RxwFwhXlI9BXopQH+WEyWtxI4+Tno7hFxHutIANMUoUEAE1
         cHJtmzgJF8ynHGNDP8NdCv1Ey/Cv6QRyTUVhgJWMIG51an+220oYEJ6wJ3w1+uAFJyeC
         bsR39xOMpXzFb562OPFK7Z05AowydP/wBFzdZO5viDIN1BgEu4DW2GXbZO25X88RZx6M
         cxRcKEPd69VkDCgq0vn5rqX88DAXXVIsK7c69ROFs95dEggWYULz64rmwS+XBQvosmIA
         Ttz7XkcctV6BBqbd8inETjNg0X3KXYbQen0yhvTO+loWbtCmZcWSdnaWs/usgJpAgChE
         zWig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dcrgsr42SwReNT4w3Ug3jHIaOC8ACTsJqPwn5qtiTds=;
        fh=8mDJhs7ULvAddwOZtqoZhj2g8+IozlibtgRlAMlaYkE=;
        b=hvmucADxvJNj+Tv6AsBi4K9b6kv2eHB3tVSeQPmor4erv0XPn6YjqRYKFhjfIbhoBP
         w+GV291z5t1JZbAhYyWUk28agtcUeh/BVYITjHt1NpFLccqXncwpcZDwOvKCkpgSkbcQ
         tJ2YGSm5vdcUxz0pDRwicMFslCUq1+S+S6xC3xt53HBHFRBpV15MOXlGYDLsYh3lNwa3
         CTrEjR36aseK0S0ZoZmvL9ZcdmBzCa2vfhauvcFXfsx0i+XMHhQM5Bd4uUjv9paDJzrB
         Nz61Wnca+zsVB34A/kuHo5BrztGflpvOeQhOnwwyJsFHAqLbBPXkT9f5vnkd485pcWqJ
         uJ6A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770955300; x=1771560100; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dcrgsr42SwReNT4w3Ug3jHIaOC8ACTsJqPwn5qtiTds=;
        b=YcvdWyc41/lYsHh3sEsU1A4UzEANhzrBfUbUByQqe8m/QG+lVinPbWP7u3rZCofu9P
         oXRAPcNEUKgl199rdRezL8xAkiDrwfn8BqAK5yqJfs5QNO5N1KxyYSu29IQ5rUlQ031C
         afI2hrCC2tazUjdtg9bT67GXep1yQ2j0RRVAY4GuNuWIhNNu7cIREL36I8QAsNLKj7oq
         uoMMmiue2628FUfa2SGdyo5hJu3oQ1vrqUQjCX/nzGrTAEqbZosGhouwH3MylLlnJesZ
         ok36w7Pn3vkWba9RwqTy/ZJLWbuS53DTa41EqAQGPRyvmJsg7g0OK4MqajokSTmhlewy
         najA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770955300; x=1771560100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dcrgsr42SwReNT4w3Ug3jHIaOC8ACTsJqPwn5qtiTds=;
        b=uaI58mojlfdPLHjECVDdL8U9RZiXS+Hr5qHJ2JV8axojPCQigqwa5IPJdUKgkZJn1U
         fTce9eSL32oXDRS2jZSYlGD1l3PLMAJha0XoIp81VEQxyRAas0rlW6fMjoWeB9ZlLKOT
         94wMlC0jeYobzjzJ+gE6v4IhO37Eap/g5eFiXPwmHFP0gaj1JOZa7lSAtHE7rl31Be3P
         xNL/UVz5R5qFwEKffsTRKkoR1e6GFTBn0+be42d7KhMI52GbFTuGWnmA6SfUMrxc+wuu
         WqhCHdojQ81yQpGaAns5/cfy2H07nA5IktlP5UNAUUCk65ihcfWalE9o9ZY5xMBlg8kY
         MQbg==
X-Forwarded-Encrypted: i=1; AJvYcCWudbd9ABev7WDbtHvtdXDR1xJle4dPqD4i0JBI3jYGFfZOiES9mJOjNnJ8DePzmPP1Pc6Dz/gi@lists.infradead.org
X-Gm-Message-State: AOJu0YxfdSMjRz2gVotxO2k0HwAbxBs1vBDQqzz3yATuBsVPIEPJUjyY
	c8G/vV8O+iVC9UCcvnPttZVuSMYBHBufQlIKTD8Ubkdu5F36d+T1YBX1omOqtXSFtzZ6hqRm+aa
	oCz8kwn+Leo3RQ5m/VFXQc/UbEeiJ/Qlb6hsoTw353/+ERogzLxCqUYS3xCfia6bSok9tcxpinQ
	ewwKoxy3TVoKoAoHnns96YpRe3S8nfZ+cDH6ZPFcvO
X-Gm-Gg: AZuq6aKu0EEYhnqYlEhCeL+sa7hs3XU7JoTGNIm6Qv8YG9wcC6tu++cifagvQMk+Eyj
	ELomiQES1PCt+mJkf4A3vZJNAPwa1tDhnydRGGkaxumfCHvCbWutqYnDbG6HSEu4wCuOLknkGFt
	DRirX69f0DK63/Hr7swlXbTXZ3RlT/E9160o0SyQ/Dkte++WK/VOIIy+ibgo372f05n5GrqAFc4
	O1yi+OB
X-Received: by 2002:a05:7300:cb0f:b0:2b7:4157:9afc with SMTP id 5a478bee46e88-2baba07d745mr515544eec.19.1770955300038;
        Thu, 12 Feb 2026 20:01:40 -0800 (PST)
X-Received: by 2002:a05:7300:cb0f:b0:2b7:4157:9afc with SMTP id
 5a478bee46e88-2baba07d745mr515534eec.19.1770955299480; Thu, 12 Feb 2026
 20:01:39 -0800 (PST)
MIME-Version: 1.0
References: <20260207102602.2917520-1-anup.patel@oss.qualcomm.com>
 <20260207102602.2917520-6-anup.patel@oss.qualcomm.com> <9f0f5554-fbec-44ca-a3a1-760a6366975e@sifive.com>
In-Reply-To: <9f0f5554-fbec-44ca-a3a1-760a6366975e@sifive.com>
From: Anup Patel <anup.patel@oss.qualcomm.com>
Date: Fri, 13 Feb 2026 09:31:28 +0530
X-Gm-Features: AZwV_QjCbvOOokzu33OkxJE8BXF3xVnWVnEjnB4VPASJp1uY9l_aafqInRWg50M
Message-ID: <CABBgwmscLey96H8banyt0Ji00_DFAMeh-hMPGFpfEpX859uv=w@mail.gmail.com>
Subject: Re: [PATCH 5/8] lib: sbi_irqchip: Support irqchip device targetting
 subset of harts
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Raymond Mao <raymond.mao@riscstar.com>,
        Dave Patel <dave.patel@riscstar.com>, Anup Patel <anup@brainfault.org>,
        opensbi@lists.infradead.org
X-Proofpoint-ORIG-GUID: lazOzV1Zit2lIYNA7SW9_rADAvFS0XKp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDAyNyBTYWx0ZWRfX5wBrJVoWA3NF
 H3RHhIDCZTCVUCtWH9lwXeQAyyXJre6wRqOiPwYsHCnOZeCla4iXZj6U4cNrYdsuKRF0HNTejw7
 WkYnk5deEviqgjxxTzacG0SE5QxUpRBVosd8cZ70+uuxFysSUwwRK9C0VTR3GBEQuxwBAg4g71b
 AyrS8+rTOVN+E89xT0C5VwCLnJe1Z1Ubs0/BJJkHCa/F82pXzSn45Mx6+RLjjwSHJoXpr/ZZ7b9
 mwnlyt6SG9hwPYh88NNt9Tyg2PZCg3hK6zmGgRlaEA+34xaCKI4OEqlkIR3LgIvyZkUrMrs5Ko1
 1ncT61ZnK8JNt2AgcMc6ju8h8t1Oii0mD8uS55yoyDPFPUSUYLGxlG3YNMbtc8bJVVzFQObwEkq
 sGhE2/qWG5Ar/08e/mkKUIYvj9yKQUmrqHiIASrplLVgEozhDVNdDlwPytJVJjNeUCFergOiyWq
 QTM98LPJAaJ4mhykVDw==
X-Proofpoint-GUID: lazOzV1Zit2lIYNA7SW9_rADAvFS0XKp
X-Authority-Analysis: v=2.4 cv=CLInnBrD c=1 sm=1 tr=0 ts=698ea224 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8
 a=aZ1a-3IND06sAhtLilIA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_200141_602080_F2A5E1F4 
X-CRM114-Status: GOOD (  30.74  )
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

T24gTW9uLCBGZWIgOSwgMjAyNiBhdCAxMDozM+KAr1BNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEhpIEFudXAsCj4KPiBPbiAyMDI2LTAyLTA3
IDQ6MjUgQU0sIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBJdCBpcyBwb3NzaWJsZSB0byBoYXZlIHBs
YXRmb3JtIHdoZXJlIGFuIGlycWNoaXAgZGV2aWNlIHRhcmdldHMKPiA+IGEgc3Vic2V0IG9mIGhh
cnRzIGFuZCB0aGVyZSBhcmUgbXVsdGlwbGUgaXJxY2hpcCBkZXZpY2VzIHRvIGNvdmVyCj4gPiBh
bGwgaGFydHMuCj4gPgo+ID4gVG8gc3VwcG9ydCB0aGlzIHNjZW5hcmlvOgo+ID4gMSkgQWRkIHRh
cmdldF9oYXJ0cyBoYXJ0bWFzayB0byBzdHJ1Y3Qgc2JpX2lycWNoaXBfZGV2aWNlIHdoaWNoCj4g
PiAgICByZXByZXNlbnRzIHRoZSBzZXQgb2YgaGFydHMgdGFyZ2V0dGVkIGJ5IHRoZSBpcnFjaGlw
IGRldmljZQo+ID4gMikgQ2FsbCB3YXJtX2luaXQoKSBhbmQgaXJxX2hhbmRsZSgpIGNhbGxiYWNr
cyBvZiBhbiBpcnFjaGlwIGRldmljZQo+ID4gICAgb24gYSBoYXJ0IG9ubHkgaWYgaXJxY2hpcCBk
ZXZpY2UgdGFyZ2V0cyB0aGF0IHBhcnRpY3VsYXIgaGFydAo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6
IEFudXAgUGF0ZWwgPGFudXAucGF0ZWxAb3NzLnF1YWxjb21tLmNvbT4KPiA+IC0tLQo+ID4gIGlu
Y2x1ZGUvc2JpL3NiaV9pcnFjaGlwLmggfCAgOCArKysrKy0tCj4gPiAgbGliL3NiaS9zYmlfaXJx
Y2hpcC5jICAgICB8IDQ4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLQo+
ID4gIGxpYi91dGlscy9pcnFjaGlwL2FwbGljLmMgfCAxMiArKysrKysrKystCj4gPiAgbGliL3V0
aWxzL2lycWNoaXAvaW1zaWMuYyB8ICA3ICsrKystLQo+ID4gIGxpYi91dGlscy9pcnFjaGlwL3Bs
aWMuYyAgfCAgNSArKy0tCj4gPiAgNSBmaWxlcyBjaGFuZ2VkLCA1OSBpbnNlcnRpb25zKCspLCAy
MSBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zYmkvc2JpX2lycWNo
aXAuaCBiL2luY2x1ZGUvc2JpL3NiaV9pcnFjaGlwLmgKPiA+IGluZGV4IGNkYTFlNTBmLi5jM2Rl
ZDI3MSAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvc2JpL3NiaV9pcnFjaGlwLmgKPiA+ICsrKyBi
L2luY2x1ZGUvc2JpL3NiaV9pcnFjaGlwLmgKPiA+IEBAIC0xMCw2ICsxMCw3IEBACj4gPiAgI2lm
bmRlZiBfX1NCSV9JUlFDSElQX0hfXwo+ID4gICNkZWZpbmUgX19TQklfSVJRQ0hJUF9IX18KPiA+
Cj4gPiArI2luY2x1ZGUgPHNiaS9zYmlfaGFydG1hc2suaD4KPiA+ICAjaW5jbHVkZSA8c2JpL3Ni
aV9saXN0Lmg+Cj4gPiAgI2luY2x1ZGUgPHNiaS9zYmlfdHlwZXMuaD4KPiA+Cj4gPiBAQCAtMjAs
MTEgKzIxLDE0IEBAIHN0cnVjdCBzYmlfaXJxY2hpcF9kZXZpY2Ugewo+ID4gICAgICAgLyoqIE5v
ZGUgaW4gdGhlIGxpc3Qgb2YgaXJxY2hpcCBkZXZpY2VzICovCj4gPiAgICAgICBzdHJ1Y3Qgc2Jp
X2RsaXN0IG5vZGU7Cj4gPgo+ID4gKyAgICAgLyoqIFNldCBvZiBoYXJ0cyB0YXJnZXR0ZWQgYnkg
dGhpcyBpcnFjaGlwICovCj4gPiArICAgICBzdHJ1Y3Qgc2JpX2hhcnRtYXNrIHRhcmdldF9oYXJ0
czsKPiA+ICsKPiA+ICAgICAgIC8qKiBJbml0aWFsaXplIHBlci1oYXJ0IHN0YXRlIGZvciB0aGUg
Y3VycmVudCBoYXJ0ICovCj4gPiAgICAgICBpbnQgKCp3YXJtX2luaXQpKHN0cnVjdCBzYmlfaXJx
Y2hpcF9kZXZpY2UgKmNoaXApOwo+ID4KPiA+ICAgICAgIC8qKiBQcm9jZXNzIGhhcmR3YXJlIGlu
dGVycnVwdHMgZnJvbSB0aGlzIGlycWNoaXAgKi8KPiA+IC0gICAgIGludCAoKnByb2Nlc3NfaHdp
cnFzKSh2b2lkKTsKPiA+ICsgICAgIGludCAoKnByb2Nlc3NfaHdpcnFzKShzdHJ1Y3Qgc2JpX2ly
cWNoaXBfZGV2aWNlICpjaGlwKTsKPiA+ICB9Owo+ID4KPiA+ICAvKioKPiA+IEBAIC0zOCw3ICs0
Miw3IEBAIHN0cnVjdCBzYmlfaXJxY2hpcF9kZXZpY2Ugewo+ID4gIGludCBzYmlfaXJxY2hpcF9w
cm9jZXNzKHZvaWQpOwo+ID4KPiA+ICAvKiogUmVnaXN0ZXIgYW4gaXJxY2hpcCBkZXZpY2UgdG8g
cmVjZWl2ZSBjYWxsYmFja3MgKi8KPiA+IC12b2lkIHNiaV9pcnFjaGlwX2FkZF9kZXZpY2Uoc3Ry
dWN0IHNiaV9pcnFjaGlwX2RldmljZSAqY2hpcCk7Cj4gPiAraW50IHNiaV9pcnFjaGlwX2FkZF9k
ZXZpY2Uoc3RydWN0IHNiaV9pcnFjaGlwX2RldmljZSAqY2hpcCk7Cj4gPgo+ID4gIC8qKiBJbml0
aWFsaXplIGludGVycnVwdCBjb250cm9sbGVycyAqLwo+ID4gIGludCBzYmlfaXJxY2hpcF9pbml0
KHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCwgYm9vbCBjb2xkX2Jvb3QpOwo+ID4gZGlmZiAt
LWdpdCBhL2xpYi9zYmkvc2JpX2lycWNoaXAuYyBiL2xpYi9zYmkvc2JpX2lycWNoaXAuYwo+ID4g
aW5kZXggM2I5NzA1MjcuLjc3ZWMwNWFmIDEwMDY0NAo+ID4gLS0tIGEvbGliL3NiaS9zYmlfaXJx
Y2hpcC5jCj4gPiArKysgYi9saWIvc2JpL3NiaV9pcnFjaGlwLmMKPiA+IEBAIC0xMywyNCArMTMs
NDQgQEAKPiA+Cj4gPiAgc3RhdGljIFNCSV9MSVNUX0hFQUQoaXJxY2hpcF9saXN0KTsKPiA+Cj4g
PiAtc3RhdGljIGludCBkZWZhdWx0X2lycWZuKHZvaWQpCj4gPiAraW50IHNiaV9pcnFjaGlwX3By
b2Nlc3Modm9pZCkKPiA+ICB7Cj4gPiAtICAgICByZXR1cm4gU0JJX0VOT0RFVjsKPiA+IC19Cj4g
PiArICAgICBzdHJ1Y3Qgc2JpX2lycWNoaXBfZGV2aWNlICpjaGlwOwo+ID4gKyAgICAgaW50IHJj
ID0gU0JJX0VOT0RFVjsKPiA+Cj4gPiAtc3RhdGljIGludCAoKmV4dF9pcnFmbikodm9pZCkgPSBk
ZWZhdWx0X2lycWZuOwo+ID4gKyAgICAgc2JpX2xpc3RfZm9yX2VhY2hfZW50cnkoY2hpcCwgJmly
cWNoaXBfbGlzdCwgbm9kZSkgewo+ID4gKyAgICAgICAgICAgICBpZiAoIWNoaXAtPnByb2Nlc3Nf
aHdpcnFzKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ID4gKyAgICAgICAg
ICAgICBpZiAoIXNiaV9oYXJ0bWFza190ZXN0X2hhcnRpbmRleChjdXJyZW50X2hhcnRpbmRleCgp
LCAmY2hpcC0+dGFyZ2V0X2hhcnRzKSkKPiA+ICsgICAgICAgICAgICAgICAgICAgICBjb250aW51
ZTsKPiA+ICsgICAgICAgICAgICAgcmMgPSBjaGlwLT5wcm9jZXNzX2h3aXJxcyhjaGlwKTsKPiA+
ICsgICAgICAgICAgICAgaWYgKHJjKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+
Cj4gVGhpcyBpcyBhIGhvdCBwYXRoICh1c2VkIGZvciBJUElzIGFscmVhZHkpLCBzbyBJIHdvdWxk
IHJlY29tbWVuZCB1c2luZyBhCj4gcGVyLWhhcnQgcG9pbnRlciB0byB0aGUgdG9wLWxldmVsIGNo
aXAgdGhhdCBnZXRzIHNldCBpbgo+IHNiaV9pcnFjaGlwX2FkZF9kZXZpY2UoKSwgc28gdGhlcmUg
aXMgbm8gbG9va3VwIG5lZWRlZCBoZXJlLgoKR29vZCBzdWdnZXN0aW9uLiBJIHdpbGwgdXBkYXRl
IGluIHRoZSBuZXh0IHJldmlzaW9uLgoKPgo+ID4gKyAgICAgfQo+ID4KPiA+IC1pbnQgc2JpX2ly
cWNoaXBfcHJvY2Vzcyh2b2lkKQo+ID4gLXsKPiA+IC0gICAgIHJldHVybiBleHRfaXJxZm4oKTsK
PiA+ICsgICAgIHJldHVybiByYzsKPiA+ICB9Cj4gPgo+ID4gLXZvaWQgc2JpX2lycWNoaXBfYWRk
X2RldmljZShzdHJ1Y3Qgc2JpX2lycWNoaXBfZGV2aWNlICpjaGlwKQo+ID4gK2ludCBzYmlfaXJx
Y2hpcF9hZGRfZGV2aWNlKHN0cnVjdCBzYmlfaXJxY2hpcF9kZXZpY2UgKmNoaXApCj4gPiAgewo+
ID4gLSAgICAgc2JpX2xpc3RfYWRkX3RhaWwoJmNoaXAtPm5vZGUsICZpcnFjaGlwX2xpc3QpOwo+
ID4gKyAgICAgc3RydWN0IHNiaV9pcnFjaGlwX2RldmljZSAqYzsKPiA+ICsgICAgIHN0cnVjdCBz
YmlfaGFydG1hc2sgaG07Cj4gPiArCj4gPiArICAgICBpZiAoIWNoaXAgfHwgIXNiaV9oYXJ0bWFz
a193ZWlnaHQoJmNoaXAtPnRhcmdldF9oYXJ0cykpCj4gPiArICAgICAgICAgICAgIHJldHVybiBT
QklfRUlOVkFMOwo+ID4gKwo+ID4gKyAgICAgaWYgKGNoaXAtPnByb2Nlc3NfaHdpcnFzKSB7Cj4g
PiArICAgICAgICAgICAgIHNiaV9saXN0X2Zvcl9lYWNoX2VudHJ5KGMsICZpcnFjaGlwX2xpc3Qs
IG5vZGUpIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBpZiAoIWMtPnByb2Nlc3NfaHdpcnFz
KQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gPiArICAgICAg
ICAgICAgICAgICAgICAgc2JpX2hhcnRtYXNrX2FuZCgmaG0sICZjLT50YXJnZXRfaGFydHMsICZj
aGlwLT50YXJnZXRfaGFydHMpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGlmIChzYmlfaGFy
dG1hc2tfd2VpZ2h0KCZobSkpCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1
cm4gU0JJX0VJTlZBTDsKPiA+ICsgICAgICAgICAgICAgfQo+ID4gKyAgICAgfQo+ID4KPiA+IC0g
ICAgIGlmIChjaGlwLT5wcm9jZXNzX2h3aXJxcykKPiA+IC0gICAgICAgICAgICAgZXh0X2lycWZu
ID0gY2hpcC0+cHJvY2Vzc19od2lycXM7Cj4gPiArICAgICBzYmlfbGlzdF9hZGRfdGFpbCgmY2hp
cC0+bm9kZSwgJmlycWNoaXBfbGlzdCk7Cj4gPiArICAgICByZXR1cm4gMDsKPiA+ICB9Cj4gPgo+
ID4gIGludCBzYmlfaXJxY2hpcF9pbml0KHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCwgYm9v
bCBjb2xkX2Jvb3QpCj4gPiBAQCAtNDgsMTIgKzY4LDE0IEBAIGludCBzYmlfaXJxY2hpcF9pbml0
KHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCwgYm9vbCBjb2xkX2Jvb3QpCj4gPiAgICAgICBz
YmlfbGlzdF9mb3JfZWFjaF9lbnRyeShjaGlwLCAmaXJxY2hpcF9saXN0LCBub2RlKSB7Cj4gPiAg
ICAgICAgICAgICAgIGlmICghY2hpcC0+d2FybV9pbml0KQo+ID4gICAgICAgICAgICAgICAgICAg
ICAgIGNvbnRpbnVlOwo+ID4gKyAgICAgICAgICAgICBpZiAoIXNiaV9oYXJ0bWFza190ZXN0X2hh
cnRpbmRleChjdXJyZW50X2hhcnRpbmRleCgpLCAmY2hpcC0+dGFyZ2V0X2hhcnRzKSkKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiA+ICAgICAgICAgICAgICAgcmMgPSBjaGlw
LT53YXJtX2luaXQoY2hpcCk7Cj4gPiAgICAgICAgICAgICAgIGlmIChyYykKPiA+ICAgICAgICAg
ICAgICAgICAgICAgICByZXR1cm4gcmM7Cj4gPiAgICAgICB9Cj4gPgo+ID4gLSAgICAgaWYgKGV4
dF9pcnFmbiAhPSBkZWZhdWx0X2lycWZuKQo+ID4gKyAgICAgaWYgKCFzYmlfbGlzdF9lbXB0eSgm
aXJxY2hpcF9saXN0KSkKPiA+ICAgICAgICAgICAgICAgY3NyX3NldChDU1JfTUlFLCBNSVBfTUVJ
UCk7Cj4KPiBUaGlzIHNob3VsZCBvbmx5IGVuYWJsZSBpbnRlcnJ1cHRzIGlmIHRoZXJlIGlzIGFu
IGlycWNoaXAgdGFyZ2V0aW5nIHRoZSBjdXJyZW50Cj4gaGFydC4KClllcywgZ29vZCBjYXRjaC4g
SSB3aWxsIHVwZGF0ZSBpbiB0aGUgbmV4dCByZXZpc2lvbi4KClJlZ2FyZHMsCkFudXAKCi0tIApv
cGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
