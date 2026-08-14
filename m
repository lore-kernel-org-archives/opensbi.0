Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197F2C5B572
	for <opensbi@archiver.kernel.org>; Fri, 14 Aug 2026 18:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v/7CnKtd+G3Gcd69W8cv+CTF3rn0UiYXNNZ1pvWva4o=; b=0LofOypReOktGo
	ZavXDi9pJ+1bM7deW8ar/JgNrP3LyMxdDdUFsUV69s+Dcg53asNgYPyqc0xkCOTfFgm9IREQIYawR
	gFqG3GvAV/DQKaQ+hnwZR0nt2QrkHl/FEwrBPpDxIewAQvfSsQsJkr5YmFRQ4zE1OJRBwWBeVdsLd
	sOwdS893ddCs/0gLzR7Xq87R2W1RI/yEUwT79IA9ZQ1VSYB1QbwX4O138OVsYMagq7maddmXWSp4x
	GpC0EW84jp1uYdazOtikMEl1Bk+QNYmYKs4IOmePFPz4B/1GuZMDqkdwOU1yCQbOw/lImLngrMDWN
	uP3ZTU6TAralC4UxJo1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuwV8-000000031rY-1mt8;
	Fri, 14 Aug 2026 18:19:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuwV5-000000031qn-2OQT
	for opensbi@lists.infradead.org;
	Fri, 14 Aug 2026 18:19:28 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EGhjXs2608034
	for <opensbi@lists.infradead.org>; Fri, 14 Aug 2026 18:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jGrugokewo4cMUKhvXy1H71kRkodqNklsSMjg/nIw+o=; b=O9JTSnlpdRQJeird
	ideDQN3AeNNuzxAu1wr4FscTsan6oXBHmGOPbv/eUHNgsPMxUkomNfynu99iPvkz
	B5Udw2WhkgbbFGazBYsfCMYcDPA44DjtwmgLj/k/qXo8r7FB5VbEoY7X4v+wLTWc
	dlG8lAk5nO6MsCNP3XT844/W/xwmRp/FuziJS5/k8DeC74+xyl4TDlWoCzQrdh+/
	FV27JuEmhRDIdMOdtZ3o/XjSwZYhY/QVlwdooa0+BJQAyJpZBc/5UkqqJtnhh6F0
	Z/t1DWs17RNmYDHfsSXzNpp8zANx6N6GUKaQrrCpDItO7VYrwmfkTeq0WA6+4ovH
	r6W4HQ==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g26j6ge0w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Fri, 14 Aug 2026 18:19:25 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-44aeefa1c36so658672fac.3
        for <opensbi@lists.infradead.org>; Fri, 14 Aug 2026 11:19:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786731564; cv=none;
        d=google.com; s=arc-20260327;
        b=cq4B0g8elbc4jBawaw4OEd9Jk1d2NI9u3AVhEIHfwaI3SRKHBOSgJ1L1wW2AxNa8vk
         cKsHdvFgWC9GrEvI4OcDMZn3dXwhxC4ckIRMAYl+l+KIfeK+JlGWHANydUeb/0gEd8BN
         dMkV5qFy1shLzfJgUXMxCZ9eW6vEWSWOy4CMusZAkBv7DmPhNi1JovVYz2iy+BG1STGk
         3+6+UFCIefzDeYVuXNbxubSTNSNJZOK4geuosnpufQC1WWf8pXLpEBzSC2xbn9+Mh0Co
         BULZZFKSbfcs9sD2+XfYvIiEk9w4aaHzE8GAxNsl98ScxbkgLI0MXDWc6ns/AoewIVHD
         XFPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jGrugokewo4cMUKhvXy1H71kRkodqNklsSMjg/nIw+o=;
        fh=mpfGXRYo+FrbP5IoaaaE1oiJA+2XMrbtPaMREodPUiA=;
        b=oLvBWG3bpskTEe/yzrJKXdZCssmpN2n3W16y+mdJvFUK78MDs5bkQxbiMEaVpWhmU2
         D1iHW+oVADYoBUp6BMgP48iOCem6xtHw/wpLOeu7fFT3af8n0zbkGEfvVRHEgGD4phLp
         5ukdlMfiOSNZhboIwxs/aqOUWIqCwHoCE26UlKECoNoQ7Y2frKqVlNyKKD9si2ASED/Z
         KbepE84SS7kSP/+JKgRjXlkU7MbhhPNiPL5v25sK5PEfVo81r2hZeDMS6zXJbPGLjkOx
         GAeTL8A7nDunSjmaJTU+wo1pFYIDrUv5OudnN9pIONLbgt+6+bKfTNw1ur24/wXchqEK
         vsFw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786731564; x=1787336364; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jGrugokewo4cMUKhvXy1H71kRkodqNklsSMjg/nIw+o=;
        b=cEx8HrudmTlD/C0/7Qn/D3E6RDhZkPOxRBLorZBJ7QgHQnjpm/Fid2ElDY8tDqAYUP
         hCmErDXLI5LXHZjPJpZNdhAQ6ny4lL9QouJyDgp6Dw+VVJvzcnpXPL+GSmw2FrKFm9x4
         VTnH1PMXlBMLYBssZCScgc2kGYu3TxQbSFZMV4TQLxQkvBxJKAnXkhKHFgpo0Y3Iln6i
         DlZHG3mrurArRTO0cYkzQ8VXL701A43T4ggXGWAmEm6IdkxKsjrRDC/r2HNEgnPCfwRG
         aWYoPzItkM5W8xHfrWgMBvqCYrrRbUrHyxj6Vy26pjlj4Vd8vXjA8v8bSFeJAFQYF+aT
         OIZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786731564; x=1787336364;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jGrugokewo4cMUKhvXy1H71kRkodqNklsSMjg/nIw+o=;
        b=dwbGQPD5JiD9yFzi06L9UyXuFjKBTGdPX2EHLargp92ViI0VBgmMBLpmfxRWa/fywf
         ruF12AvR1uzbqkgAI3Vm7uTIw8XJVeeWaSCyzn2BC/Apog3bubQ9dEEYlTBhNoV/Y/4r
         gVZ6AqeJUtuCkqAA0LYInJjX9zkENKwU1bPrCFkIPwsTAWHvkrfLks4XABT/AINco0lk
         yExM00jalYVPHdQrs4yG85YauBVBK5SXhGaEJRrsj8WBFA2yPlYdKHmYP8JyPqq2OgBj
         Ow1qu0ymaemc3KCnbXFnTo5nrp0PdM+o1F3CnXaiM3TLibxYwLdHOfXYI/RRsSomfis7
         VLFw==
X-Forwarded-Encrypted: i=1; AHgh+Rrxfi3A0mYOVOAZGIw/qddwkqH+DivbKYY+TDmPC/Tqg8vCMJCX4w6bXcrKXiE/foSdBo8P4bnl@lists.infradead.org
X-Gm-Message-State: AOJu0YzD4+e4LW9V98OtE29zfO/Oh4a8rAFCXDTgnq5Zlo+wmpE6sF11
	mXIABfsScAfYmONIGfSmDzScS5xpnJ89TG2H6egyR89AhSfFyEuYfl0e91UChbB5p9od1unZ4ac
	9+jHp46fGNYKZ8np3JzYAcrZQD5tFbFZGz6FcE95xILpEzkQcRjRSsk7BLD9PT7gVEDL+KNZJVN
	38Ixk4fE2Ra7Ije5uIew9+mEdekgotvF6F3TIvdRsW
X-Gm-Gg: AR+sD13be9QLm0+Kj3lmTprgrAipkdvFtKvKKFA0EJfNAYhu3Nyk9Azg1atlhduQsPa
	gOiZwOXlhZzcqt9rQAD4j4NFty5jauYWiGoH7wXK+pDT4AIBafex7xgxYZ05Ke3xz56TM8wJJuL
	yHE6loSa8N4C8EZRRN6PTsQCCL3N42SPEwPc0S8vrv3jrtt3Zn8jvG9oxKKQ==
X-Received: by 2002:a05:6870:210e:b0:456:b9a2:1374 with SMTP id 586e51a60fabf-45e92350330mr6233757fac.11.1786731564392;
        Fri, 14 Aug 2026 11:19:24 -0700 (PDT)
X-Received: by 2002:a05:6870:210e:b0:456:b9a2:1374 with SMTP id
 586e51a60fabf-45e92350330mr6233715fac.11.1786731564002; Fri, 14 Aug 2026
 11:19:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260807045002.2538935-1-anup.patel@oss.qualcomm.com> <20260807045002.2538935-2-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260807045002.2538935-2-anup.patel@oss.qualcomm.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 11:19:12 -0700
X-Gm-Features: AUfX_mxch0YO2UYrcCTOp8I-zyEiyL8wVXHWLjOOBrtLEyfbGtEV_qnrQribZ2s
Message-ID: <CAAVgOkJG4nyd-PgwQxBvVL0Dj7R+unXC+NXe_uTjeqT=kd91Xg@mail.gmail.com>
Subject: Re: [PATCH 1/3] lib: sbi_domain: Check possible harts in sbi_domain_context_enter/exit()
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
X-Proofpoint-ORIG-GUID: O1G0MjyjCs6QtWCHLXJm_Z6b_UNJo00M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDE0MCBTYWx0ZWRfX9cjuTFZf21MI
 RmXSvvRI4gIK+Ts3NFxbR0aLbACA7PWhI1kzCAVVB0scm2MmsLjLJGDHvtgHXZkhwc/2DfSujAg
 R56jjCASCHi+WfoyJ0Vw0Fx3uBJAVXTqGWT1F3+3HLeqapgPujTjVAUI/smzqnZ/u4YpOBioxVY
 8A7k6ejCdrBZ4gID7N9JWmMKKMFyMzpzVpWL+nWtbtIsCRO4ZnjoC32BCn4AFHRuq+Cvh0OxZCc
 9c1fkr6pDWMKQyOv20nH5fH0F9ez/gnWF3iejKKHfi4PyFg9IcjNZEy/0SzR9rCmM3ntxZQqTNn
 LLnCHnX5JsejyLjMYwJ9OBa62vTHUqSMLBvomgNi0Jt7VBqvYPpXPRfsabQblaJ8y77PjVBZWRv
 VuT9/bRwsntcRUdOcunRrTR1ouYZx3KW37M/Wb9RkNdJpjv3g9RHIqLrDRmTWJsqd1Eicw45qzF
 6+yWFYBDJIl6ZO97WMA==
X-Authority-Analysis: v=2.4 cv=ZbMt8MVA c=1 sm=1 tr=0 ts=6a7f5c2d cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=lf-S3f9Phoz_vvJnbsoA:9 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: O1G0MjyjCs6QtWCHLXJm_Z6b_UNJo00M
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDE0MCBTYWx0ZWRfX5I92SToy5Sq5
 XF0vxGdybfiqzPzpDZf5TlTWyZ87r5f4utIHovFExfs1is1iUcMLnWA5X+QtnHioOP31hyc9r35
 MuYoSurQD0Z5lFSG20zc2IRmlsJhkRY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_111927_737126_B512FF35 
X-CRM114-Status: GOOD (  22.81  )
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
c3MucXVhbGNvbW0uY29tPiB3cm90ZToKPgo+IFdoZW4gY29udGV4dCBzd2l0Y2hpbmcgdG8gYSBk
b21haW4gdGhlIGN1cnJlbnQgaGFydCBNVVNUIGJlIHBhcnQKPiBvZiB0aGUgcG9zc2libGUgaGFy
dHMgb2YgdGhhdCBkb21haW4uIEFkZCBhcHByb3ByaWF0ZSBjaGVja3MgaW4KPiBzYmlfZG9tYWlu
X2NvbnRleHRfZW50ZXIvZXhpdCgpIGFsb25nIHRoZXNlIGxpbmVzLgo+Cj4gU2lnbmVkLW9mZi1i
eTogQW51cCBQYXRlbCA8YW51cC5wYXRlbEBvc3MucXVhbGNvbW0uY29tPgo+IC0tLQo+ICBsaWIv
c2JpL3NiaV9kb21haW5fY29udGV4dC5jIHwgMTQgKysrKysrKysrKystLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDExIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
bGliL3NiaS9zYmlfZG9tYWluX2NvbnRleHQuYyBiL2xpYi9zYmkvc2JpX2RvbWFpbl9jb250ZXh0
LmMKPiBpbmRleCAwODYxZDU0MS4uODM3ZmY1NGYgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlf
ZG9tYWluX2NvbnRleHQuYwo+ICsrKyBiL2xpYi9zYmkvc2JpX2RvbWFpbl9jb250ZXh0LmMKPiBA
QCAtMjMxLDE4ICsyMzEsMjMgQEAgaW50IHNiaV9kb21haW5fY29udGV4dF9lbnRlcihzdHJ1Y3Qg
c2JpX2RvbWFpbiAqZG9tKQo+ICAgICAgICAgaW50IHJjOwo+ICAgICAgICAgc3RydWN0IGhhcnRf
Y29udGV4dCAqZG9tX2N0eDsKPiAgICAgICAgIHN0cnVjdCBoYXJ0X2NvbnRleHQgKmN0eCA9IGhh
cnRfY29udGV4dF90aGlzaGFydF9nZXQoKTsKPiArICAgICAgIHUzMiBoYXJ0aW5kZXggPSBjdXJy
ZW50X2hhcnRpbmRleCgpOwo+Cj4gICAgICAgICAvKiBUYXJnZXQgZG9tYWluIG11c3Qgbm90IGJl
IHNhbWUgYXMgdGhlIGN1cnJlbnQgZG9tYWluICovCj4gICAgICAgICBpZiAoIWRvbSB8fCBkb20g
PT0gc2JpX2RvbWFpbl90aGlzaGFydF9wdHIoKSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIFNC
SV9FSU5WQUw7Cj4KPiArICAgICAgIC8qIFRhcmdldCBkb21haW4gbXVzdCBoYXZlIGN1cnJlbnQg
aGFydCBhcyBhIHBvc3NpYmxlIGhhcnRzICovCj4gKyAgICAgICBpZiAoIXNiaV9oYXJ0bWFza190
ZXN0X2hhcnRpbmRleChoYXJ0aW5kZXgsIGRvbS0+cG9zc2libGVfaGFydHMpKQo+ICsgICAgICAg
ICAgICAgICByZXR1cm4gU0JJX0VJTlZBTDsKPiArCj4gICAgICAgICAvKgo+ICAgICAgICAgICog
SWYgaXQncyBmaXJzdCB0aW1lIHRvIGNhbGwgYGVudGVyYCBvbiB0aGUgY3VycmVudCBoYXJ0LCBu
bwo+ICAgICAgICAgICogY29udGV4dCBhbGxvY2F0ZWQgYmVmb3JlLiBBbGxvY2F0ZSBjb250ZXh0
IGZvciBlYWNoIHZhbGlkCj4gICAgICAgICAgKiBkb21haW4gb24gdGhlIGN1cnJlbnQgaGFydC4K
PiAgICAgICAgICAqLwo+ICAgICAgICAgaWYgKCFjdHgpIHsKPiAtICAgICAgICAgICAgICAgcmMg
PSBoYXJ0X2NvbnRleHRfaW5pdChjdXJyZW50X2hhcnRpbmRleCgpKTsKPiArICAgICAgICAgICAg
ICAgcmMgPSBoYXJ0X2NvbnRleHRfaW5pdChoYXJ0aW5kZXgpOwo+ICAgICAgICAgICAgICAgICBp
ZiAocmMpCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJjOwo+Cj4gQEAgLTI1MSw3
ICsyNTYsNyBAQCBpbnQgc2JpX2RvbWFpbl9jb250ZXh0X2VudGVyKHN0cnVjdCBzYmlfZG9tYWlu
ICpkb20pCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FSU5WQUw7Cj4gICAg
ICAgICB9Cj4KPiAtICAgICAgIGRvbV9jdHggPSBoYXJ0X2NvbnRleHRfZ2V0KGRvbSwgY3VycmVu
dF9oYXJ0aW5kZXgoKSk7Cj4gKyAgICAgICBkb21fY3R4ID0gaGFydF9jb250ZXh0X2dldChkb20s
IGhhcnRpbmRleCk7Cj4gICAgICAgICAvKiBWYWxpZGF0ZSB0aGUgZG9tYWluIGNvbnRleHQgZXhp
c3RlbmNlICovCj4gICAgICAgICBpZiAoIWRvbV9jdHgpCj4gICAgICAgICAgICAgICAgIHJldHVy
biBTQklfRUlOVkFMOwo+IEBAIC0yNzYsNyArMjgxLDcgQEAgaW50IHNiaV9kb21haW5fY29udGV4
dF9leGl0KHZvaWQpCj4gICAgICAgICAgKiBpdHMgY29udGV4dCBvbiB0aGUgY3VycmVudCBoYXJ0
IGlmIHZhbGlkLgo+ICAgICAgICAgICovCj4gICAgICAgICBpZiAoIWN0eCkgewo+IC0gICAgICAg
ICAgICAgICByYyA9IGhhcnRfY29udGV4dF9pbml0KGN1cnJlbnRfaGFydGluZGV4KCkpOwo+ICsg
ICAgICAgICAgICAgICByYyA9IGhhcnRfY29udGV4dF9pbml0KGhhcnRpbmRleCk7Cj4gICAgICAg
ICAgICAgICAgIGlmIChyYykKPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmM7Cj4K
PiBAQCAtMjk0LDYgKzI5OSw5IEBAIGludCBzYmlfZG9tYWluX2NvbnRleHRfZXhpdCh2b2lkKQo+
ICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChkb20gPT0gJnJvb3QgfHwgZG9tID09IHNiaV9k
b21haW5fdGhpc2hhcnRfcHRyKCkpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBj
b250aW51ZTsKPgo+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmICghc2JpX2hhcnRtYXNrX3Rl
c3RfaGFydGluZGV4KGhhcnRpbmRleCwgZG9tLT5wb3NzaWJsZV9oYXJ0cykpCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiArCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgdG1wID0gaGFydF9jb250ZXh0X2dldChkb20sIGhhcnRpbmRleCk7Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgaWYgKHRtcCAmJiAhdG1wLT5pbml0aWFsaXplZCkgewo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZG9tX2N0eCA9IHRtcDsKPiAtLQo+IDIuNDMuMAoKaWYg
KCFkb21fY3R4IHx8IHRtcC0+ZG9tLT5pbml0X29yZGVyIDwgZG9tX2N0eC0+ZG9tLT5pbml0X29y
ZGVyKSB7CmRvbV9jdHggPSB0bXA7CmJyZWFrOwp9Ck96YTogcmVtb3ZlIHRoaXMgYnJlYWsgYXMg
aXQgcGlja3MgdXAgd3Jvbmcgb3JkZXIgc2luY2UgaXQgZG9lbnN0IGdldAphIGNoYW5jZSB0byBp
dGVyYXRlIHRocm91Z2ggdGhlIGxpc3QgZnVsbHkuCgpSZXZpZXdlZC1ieTogUGF3YW5kZWVwIE96
YSA8cGF3YW5kZWVwLm96YUBvc3MucXVhbGNvbW0uY29tPgpUZXN0ZWQtYnk6IFBhd2FuZGVlcCBP
emEgPHBhd2FuZGVlcC5vemFAb3NzLnF1YWxjb21tLmNvbT4KCgoKPgo+Cj4gLS0KPiBvcGVuc2Jp
IG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFp
bGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
