Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F91CC624D7
	for <opensbi@archiver.kernel.org>; Thu,  3 Sep 2026 21:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oyh4/ZlQ6JcE0xKQyJRp28mY0fIky7Fi3LwxWqvECuw=; b=jo/lKzYFCYVDdW
	MJd1HvSOuinX7yFjARDRT18A0gWsBiM2XVJVhV7wHj8m48xEP+Fv8JTFwBocBKkpNeRHpqDSU9SYt
	AtLBR0LAzwmDkdqCM2TqHqvqOCR5dv2t1w3ckWhnu5bAyuoRLt7xgds8x62b5fcUialv3Myj+Eb+N
	GA1YNl9e6o6e81/ZSbz/g39IKvjJugDiyqBs6eY4KDDC8sKLA7bpIUmYznFR2wacJCZiXfuwvgrJL
	ooUrDFg1HnMZrhILS/6rZyyO9dXjxQN7MTG1woYlzxc1UrToGg9UBCQLU2nFHWWZPbpiljRPQKpoQ
	DarlruB7vM8YiUVxWKCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Eps-00000000coa-13qV;
	Thu, 03 Sep 2026 21:19:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Epp-00000000coE-3PUi
	for opensbi@lists.infradead.org;
	Thu, 03 Sep 2026 21:19:02 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683JhDBJ1306081
	for <opensbi@lists.infradead.org>; Thu, 3 Sep 2026 21:19:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hi3iopsr6yT9vK/L8Ph2tFGy62U4vQZwEqgaZhILmDI=; b=U7qKp1anHLf5xZ9Q
	7qyc9zvwbol1cB7P+TBP1wjpuBMbbBphMkSuTGrbgnU24waDg05S5gZ+5EvTNtor
	b3cX9FttzUpFB357qJ5znIiTkN4uR3x0wdutbJaf65KbFuciBas4m+4xSaYtQ1vE
	E3eBbVIFZo1FFB7wf3VL0F+Gdw5cUWuobm0+3snjyCI/ESNEnnZDQ9NT9h4bRXqU
	RBGQGhLkEEpA17rxjcJNLMQH6kGBFsZ4EdThrWWbyUWvkiP9YfCFsgIuPI2KY/iR
	IX9p6KQm+GbGIL2VN29TdqWx1XdYIqvnM2AL64PBKN8KcvdCUT7T6rPDXHB+azLW
	djSPKg==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf82kanug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Thu, 03 Sep 2026 21:19:00 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4ab260600easo1990256b6e.1
        for <opensbi@lists.infradead.org>; Thu, 03 Sep 2026 14:19:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788470340; cv=none;
        d=google.com; s=arc-20260327;
        b=GutPnxswTIfaIndOC5uj+Z9qqs4dQj+Yznxn2uNshLYyACrgo6Z20k3Q6JTjdU6Hz1
         qk2I0jef1B/S/chOkQsTUqw90rc37Qa8BI5oHwFWBaBywl/dWdKbrfJ9lTSbMSqifYnW
         c0B9DMGNq5nUtxXxK5s/YJW62qJ4jFX28PS9c6u21KCAZNC8uRLGULvNra9+EXvjQiKd
         795LLyvlpFKYzuCvSG9+Ct6wn9W8qFYHC4f3K4sXSCvQ2RBhjuz4wdjunmfEwMT78CJg
         5UgWqnSTdCJPxIIxSApYWhaUh0LMXx78b7tMkQrQ7XzJDrwquEzJqExI6FRD8G4tWGNs
         lKag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hi3iopsr6yT9vK/L8Ph2tFGy62U4vQZwEqgaZhILmDI=;
        fh=4ewBQFYQm5N+QAVC2yDkcGgJqnoV8H9Ixi/6ZlMkFAE=;
        b=RyCc9kkuvRPCPzlhRxj0xugXx8sauxa1vGhDdOeQAmUxB+CIoarTOKnQjYUBbwejXL
         sicCUxnU8BLkNPcITB8pL16GPL4jAxgXefDvY9jEa5Ew7aEQksGct89rWauf7O1NnTj3
         pmzKusYIkYip9aFGseCblBfXiquOLY5Qd3a+qVLox9+54o5xjrY2rXnex5fMqs/wbKcc
         i0LaZBxtubh9tMdOmnaAWfI6Rg6+BWiivhOxqu4epnxT8i7PnPS+JeL1Xb2yc8LaQEJ3
         TFgXBaB4NggDTkCbaNM+xuk20C5991oOL4Ckylz522nRh3BtNZeDJLU3iaPdIqE4hIbY
         flpg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788470340; x=1789075140; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hi3iopsr6yT9vK/L8Ph2tFGy62U4vQZwEqgaZhILmDI=;
        b=FKypXDADH/4bk4bRp+c1vRoreDiL8WHjtkewIJHUF4iiTutZituvmcY+PTKQct6syu
         0/zixqFr4nt5b+icEl/L6ALp+OACuSvQz+Kjlkg1mhnJ4KQefYbyruXwRfggZpkujCue
         Pc+ugrqmQArbQk06qgD54L6a65WLVW5H++DkO47yCHoTtyjr+f0Z5X/8SqQka0DLfphU
         ONEY8FzvKFfUj7Ye9+Z5jHPvu4jyZS33wIUZ0XsMcNtW3SP47DNUZXjREn0Dk1Kxfxky
         RrgKF/7q/FZvrz66+qiH/sW7FYiHja7CIvHSvvngzCwJ/aSbMF9rw+gCZ5tr6sw5YRdh
         cm2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788470340; x=1789075140;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hi3iopsr6yT9vK/L8Ph2tFGy62U4vQZwEqgaZhILmDI=;
        b=S9iKPM1RE5PkQhJ8HqYzxgAmDuSq7LL/vgE9rRAJwdp5WLA6ErvA4UlA/MscIjUQpD
         f68jcf7lkSO0dNaXiJPZ5lxZxeQXr3R8ZGSSClwTQefxArUJRaeLdy3lyeDJmna0xAq1
         IQXq2TztdFfGGMYNpMa7iiKRJcu6Sw+NVcGk8lFNybJKWN7g/dyOpl6A66fhvymS/BbV
         JQcKU4mzEq5TsMscr/ctlEmQejWqy7+ijSb1kds49w2H8aU16jBL4g0W8L+EF9AN3nhJ
         jXgxz/zPBGlteKQ4M5QU+U4p187yKYPuc3HDckibEZZnJZUnPIRZO6wAT5QU3Hk0vp3R
         rpJw==
X-Gm-Message-State: AFuF++n7MdWHi52HRJ7Bt5AqAsIv7faDWnbYicPUTtBNmsfuA/uTIhX2
	OAlfpO0aoHvEX+eCw8iTccRp9ZvIoPURoftdGg+z/OIGSIXFnqNXTetgfLk6hwC5x1C1ZmDZrPL
	8/NvAuEh+SQIwq2RHIPhbRmG2VFn/1E/X0t6G+8M7aorA0ympO9CWnS8s4PGleNvIK9I1IiO2MD
	lY5N0XUqDKFcb87MT/wYvfDriLpJm9Qxfp+EIN4LXk
X-Gm-Gg: AYBFou3ZvRdgKTeIJyebNcToNvcDRTgpjle6/rryLvj7AZR9qdZRbSrD5KLgc3e/nCr
	ABXvvFDxiptqOdL21SLpp9XBku14PmqdKBYheO0cGG6Y+dk4rxMA5cYe6BsSQhZoykDs/RXVpy5
	aRoMXLQsQ0px6JCmTL/adaCIi3cce3shnQ3o/Rc766Uyp+CbqqFIHGifj3Xg==
X-Received: by 2002:a05:6808:f92:b0:4b8:4703:db8f with SMTP id 5614622812f47-4b84703dcaemr2407239b6e.24.1788470339891;
        Thu, 03 Sep 2026 14:18:59 -0700 (PDT)
X-Received: by 2002:a05:6808:f92:b0:4b8:4703:db8f with SMTP id
 5614622812f47-4b84703dcaemr2407217b6e.24.1788470339444; Thu, 03 Sep 2026
 14:18:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260817090503.2104998-1-peter.lin@sifive.com> <20260817090503.2104998-4-peter.lin@sifive.com>
In-Reply-To: <20260817090503.2104998-4-peter.lin@sifive.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 14:18:48 -0700
X-Gm-Features: AcwNN1V-EzHYzvK3cjUmDYr6JlYjcE9Qs0mqdaLOWsIR3mwUg94Rv9aYthU52KQ
Message-ID: <CAAVgOkL68rtTjWf9zoLZjL=L4OyTwgHePWsEYdH1ioUX1Fdk6w@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] lib: fdt_domain: parse domain WID properties
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com, greentime.hu@sifive.com,
        anup@brainfault.org, scott@riscstar.com, conor@kernel.org,
        dave.patel@riscstar.com, raymond.mao@riscstar.com,
        robin.randhawa@sifive.com, samuel.holland@sifive.com, krzk@kernel.org
X-Proofpoint-GUID: VSs6Eg575R8ogpAa_qpkOIgSXf9Gx8Yk
X-Proofpoint-ORIG-GUID: VSs6Eg575R8ogpAa_qpkOIgSXf9Gx8Yk
X-Authority-Analysis: v=2.4 cv=OuJ/DS/t c=1 sm=1 tr=0 ts=6a99e444 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=pFyQfRViAAAA:8 a=8nQ5P_4hhDeCbUG1NBcA:9
 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE4NiBTYWx0ZWRfX2H3H5SBjrX7X
 qMB7FhMCZNPW97WRwyLzKBomqpbRmHfflJv25g5rtlRksxkmVUQ7GgR/qwZcT/sfT/c67jnQ9dn
 2sFRypCr6HkT3b4vO0QXOcRuscVBJv19BXey9x4qwORR6BEuEqAzMn3GcfFtuvT4GF+4ZRFBG4k
 LSsl39TqiV1P7zo6edgJ3kSXdfzVzxjiTEm3RQ3AX66IypPXlHc+SvB8BGGG3YXbzI4Ddd47WdH
 5KpYbAg4XP9C2UIQOl8l/wgHQATLXRT4RMFiR+laL9IVpeK9GMD8dTtqYo8OV99UPKoeyS6z5RY
 UOo3nJ6oZ+YSWfV4SR/9W6C6DB1rvU5Uzn/IM8otFjpfxTNbylyx+nDa66+0lDqE3Pv4XDhllMf
 gYW3pxjXA3jyg2DLjYYT2n3HDfXFSUfe65NAwml5t6STtrAGFqQbdICLhOavB453i2fuUOkxEZp
 K3GzpIih2uwbdf0H3IA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE4NiBTYWx0ZWRfXyITtqMHcCOwo
 Mqc9YoLNR9gzm0lOteeiq8LTiZNBNVjVH2Gd1W5KDBUeBtjChwqAvAsuUBrFTRwJ32eP2C/SkDv
 YTwvXmWyh3CleKs/kdQ2IXbwWPndfeo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_06,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030186
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_141901_989322_F8240360 
X-CRM114-Status: GOOD (  23.68  )
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
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gQWRkIHdpZCBhbmQgd2lkZGVsZWcgZmllbGRz
IHRvIHN0cnVjdCBzYmlfZG9tYWluIHRvIHN0b3JlIHRoZQo+IFJJU0MtViBXb3JsZHMgbWx3aWQg
YW5kIG13aWRlbGVnIENTUiB2YWx1ZXMgZm9yIGVhY2ggZG9tYWluLgo+IEFsc28sIHBhcnNlIHRo
ZSByb290IGFuZCB1c2VyLWRlZmluZWQgZG9tYWlucycgV0lEIGR1cmluZwo+IGZkdF9kb21haW5z
X3BvcHVsYXRlKCkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBZdS1DaGllbiBQZXRlciBMaW4gPHBldGVy
LmxpbkBzaWZpdmUuY29tPgo+IC0tLQo+IENoYW5nZXMgdjEgLT4gdjI6Cj4gLSBBZGQgcm9vdCBz
dWJub2RlIGZvciByb290IGRvbWFpbiBjb25maWd1cmF0aW9uIChPemEgYW5kIEFudXApCj4gLSBS
ZW5hbWUgbmV4dF93aWQvd2lkbGlzdCB0byB3aWQvd2lkZGVsZWcgKE96YSkKPiAtLS0KPiAgaW5j
bHVkZS9zYmkvc2JpX2RvbWFpbi5oICAgfCAgNiArKysrKwo+ICBsaWIvdXRpbHMvZmR0L2ZkdF9k
b21haW4uYyB8IDUwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDIg
ZmlsZXMgY2hhbmdlZCwgNTYgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUv
c2JpL3NiaV9kb21haW4uaCBiL2luY2x1ZGUvc2JpL3NiaV9kb21haW4uaAo+IGluZGV4IDE2ZWRk
NGNlLi40NGM4YmVmYyAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3NiaS9zYmlfZG9tYWluLmgKPiAr
KysgYi9pbmNsdWRlL3NiaS9zYmlfZG9tYWluLmgKPiBAQCAtMjE1LDYgKzIxNSwxMiBAQCBzdHJ1
Y3Qgc2JpX2RvbWFpbiB7Cj4gICAgICAgICBib29sIHN5c3RlbV9yZXNldF9hbGxvd2VkOwo+ICAg
ICAgICAgLyoqIElzIGRvbWFpbiBhbGxvd2VkIHRvIHN1c3BlbmQgdGhlIHN5c3RlbSAqLwo+ICAg
ICAgICAgYm9vbCBzeXN0ZW1fc3VzcGVuZF9hbGxvd2VkOwo+ICsgICAgICAgLyoqIFdvcmxkIElE
IGZvciB0aGlzIGRvbWFpbiAobWx3aWQgdmFsdWUpICovCj4gKyAgICAgICB1MzIgd2lkOwo+ICsg
ICAgICAgLyoqIFdoZXRoZXIgV29ybGQgSUQgd2FzIGV4cGxpY2l0bHkgc2V0ICovCj4gKyAgICAg
ICBib29sIGhhc193aWQ7Ck96YTogYWdhaW4gaGVyZSB5b3UgbWF5IGJlIGFibGUgdG8gZmluZCBv
dXQgaWYgd2lkID09IFVJTlRfTUFYIHRoZW4Kd2lkIGlzIG5vdCBzZXQuIGJlY2F1c2Ugd2UgaGF2
ZSBmaW5pdGUgbnVtYmVyIG9mIE4gd29scmRzIHNvIG1heCBpcyBOCi0xID8KeW91IGNhbiB0aGVu
IGRyb3AgYm9vbCBoYXNfd2lkOwoKPiArICAgICAgIC8qKiBXb3JsZCBJRCBkZWxlZ2F0aW9uIGJp
dG1hc2sgZm9yIHRoaXMgZG9tYWluIChtd2lkZGVsZWcgdmFsdWUpICovCj4gKyAgICAgICB1NjQg
d2lkZGVsZWc7Cj4gICAgICAgICAvKiogSWRlbnRpZmllcyB3aGV0aGVyIHRvIGluY2x1ZGUgdGhl
IGZpcm13YXJlIHJlZ2lvbiAqLwo+ICAgICAgICAgYm9vbCBmd19yZWdpb25faW5pdGVkOwo+ICB9
Owo+IGRpZmYgLS1naXQgYS9saWIvdXRpbHMvZmR0L2ZkdF9kb21haW4uYyBiL2xpYi91dGlscy9m
ZHQvZmR0X2RvbWFpbi5jCj4gaW5kZXggNjE2MjdkYjMuLjY4ZGQ2ZGE0IDEwMDY0NAo+IC0tLSBh
L2xpYi91dGlscy9mZHQvZmR0X2RvbWFpbi5jCj4gKysrIGIvbGliL3V0aWxzL2ZkdC9mZHRfZG9t
YWluLmMKPiBAQCAtMzA3LDYgKzMwNywyNyBAQCBzdGF0aWMgaW50IF9fZmR0X3BhcnNlX3JlZ2lv
bihjb25zdCB2b2lkICpmZHQsIGludCBkb21haW5fb2Zmc2V0LAo+ICAgICAgICAgcmV0dXJuIDA7
Cj4gIH0KPgo+ICtzdGF0aWMgdm9pZCBmZHRfcGFyc2VfZG9tYWluX3dpZF9wcm9wcyhjb25zdCB2
b2lkICpmZHQsIGludCBvZmZzZXQsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgc3RydWN0IHNiaV9kb21haW4gKmRvbSkKPiArewo+ICsgICAgICAgY29uc3QgZmR0MzJf
dCAqdmFsOwo+ICsgICAgICAgaW50IGxlbjsKPiArICAgICAgIHU2NCB2YWw2NDsKPiArCj4gKyAg
ICAgICB2YWwgPSBmZHRfZ2V0cHJvcChmZHQsIG9mZnNldCwgIndpZCIsICZsZW4pOwo+ICsgICAg
ICAgaWYgKHZhbCAmJiBsZW4gPT0gc2l6ZW9mKGZkdDMyX3QpKSB7Cj4gKyAgICAgICAgICAgICAg
IGRvbS0+d2lkID0gZmR0MzJfdG9fY3B1KHZhbFswXSk7Cj4gKyAgICAgICAgICAgICAgIGRvbS0+
aGFzX3dpZCA9IHRydWU7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgdmFsID0gZmR0X2dldHBy
b3AoZmR0LCBvZmZzZXQsICJ3aWRkZWxlZyIsICZsZW4pOwo+ICsgICAgICAgaWYgKHZhbCAmJiAo
bGVuID09ICgyICogc2l6ZW9mKGZkdDMyX3QpKSkpIHsKPiArICAgICAgICAgICAgICAgdmFsNjQg
PSBmZHQzMl90b19jcHUodmFsWzBdKTsKPiArICAgICAgICAgICAgICAgdmFsNjQgPSAodmFsNjQg
PDwgMzIpIHwgZmR0MzJfdG9fY3B1KHZhbFsxXSk7Cj4gKyAgICAgICAgICAgICAgIGRvbS0+d2lk
ZGVsZWcgPSB2YWw2NDsKPiArICAgICAgIH0KPiArfQo+ICsKPiAgc3RhdGljIGludCBfX2ZkdF9w
YXJzZV9kb21haW4oY29uc3Qgdm9pZCAqZmR0LCBpbnQgZG9tYWluX29mZnNldCwgdm9pZCAqb3Bh
cXVlKQo+ICB7Cj4gICAgICAgICB1MzIgdmFsMzI7Cj4gQEAgLTQ2OSw2ICs0OTAsOSBAQCBzdGF0
aWMgaW50IF9fZmR0X3BhcnNlX2RvbWFpbihjb25zdCB2b2lkICpmZHQsIGludCBkb21haW5fb2Zm
c2V0LCB2b2lkICpvcGFxdWUpCj4gICAgICAgICB9Cj4gICAgICAgICBkb20tPm5leHRfbW9kZSA9
IHZhbDMyOwo+Cj4gKyAgICAgICAvKiBSZWFkICJ3aWQiIGFuZCAid2lkZGVsZWciIERUIHByb3Bl
cnRpZXMgKi8KPiArICAgICAgIGZkdF9wYXJzZV9kb21haW5fd2lkX3Byb3BzKGZkdCwgZG9tYWlu
X29mZnNldCwgZG9tKTsKPiArCj4gICAgICAgICAvKiBSZWFkICJzeXN0ZW0tcmVzZXQtYWxsb3dl
ZCIgRFQgcHJvcGVydHkgKi8KPiAgICAgICAgIGlmIChmZHRfZ2V0X3Byb3BlcnR5KGZkdCwgZG9t
YWluX29mZnNldCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJzeXN0ZW0tcmVzZXQt
YWxsb3dlZCIsIE5VTEwpKQo+IEBAIC01MzUsNiArNTU5LDI5IEBAIGZhaWxfZnJlZV9kb21haW46
Cj4gICAgICAgICByZXR1cm4gZXJyOwo+ICB9Cj4KPiArc3RhdGljIHZvaWQgZmR0X3BhcnNlX3Jv
b3RfZG9tYWluKGNvbnN0IHZvaWQgKmZkdCkKPiArewo+ICsgICAgICAgaW50IG9mZnNldDsKPiAr
Cj4gKyAgICAgICBpZiAoIWZkdCkKPiArICAgICAgICAgICAgICAgcmV0dXJuOwo+ICsKPiArICAg
ICAgIG9mZnNldCA9IGZkdF9wYXRoX29mZnNldChmZHQsICIvY2hvc2VuIik7Cj4gKyAgICAgICBp
ZiAob2Zmc2V0IDwgMCkKPiArICAgICAgICAgICAgICAgcmV0dXJuOwo+ICsKPiArICAgICAgIG9m
ZnNldCA9IGZkdF9ub2RlX29mZnNldF9ieV9jb21wYXRpYmxlKGZkdCwgb2Zmc2V0LAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIm9wZW5zYmksZG9tYWlu
LGNvbmZpZyIpOwo+ICsgICAgICAgaWYgKG9mZnNldCA8IDApCj4gKyAgICAgICAgICAgICAgIHJl
dHVybjsKPiArCj4gKyAgICAgICBvZmZzZXQgPSBmZHRfc3Vibm9kZV9vZmZzZXQoZmR0LCBvZmZz
ZXQsICJyb290Iik7Cj4gKyAgICAgICBpZiAob2Zmc2V0IDwgMCkKPiArICAgICAgICAgICAgICAg
cmV0dXJuOwo+ICsKPiArICAgICAgIGZkdF9wYXJzZV9kb21haW5fd2lkX3Byb3BzKGZkdCwgb2Zm
c2V0LCAmcm9vdCk7Cj4gK30KPiArCj4gIGludCBmZHRfZG9tYWluc19wb3B1bGF0ZShjb25zdCB2
b2lkICpmZHQpCj4gIHsKPiAgICAgICAgIGNvbnN0IHUzMiAqdmFsOwo+IEBAIC01NzMsNiArNjIw
LDkgQEAgaW50IGZkdF9kb21haW5zX3BvcHVsYXRlKGNvbnN0IHZvaWQgKmZkdCkKPiAgICAgICAg
ICAgICAgICAgYnJlYWs7Cj4gICAgICAgICB9Cj4KPiArICAgICAgIC8qIFBhcnNlIHJvb3QgZG9t
YWluIGNvbmZpZyBmcm9tICJyb290IiBzdWJub2RlICovCj4gKyAgICAgICBmZHRfcGFyc2Vfcm9v
dF9kb21haW4oZmR0KTsKPiArCj4gICAgICAgICAvKiBJdGVyYXRlIG92ZXIgZWFjaCBkb21haW4g
aW4gRkRUIGFuZCBwb3B1bGF0ZSBkZXRhaWxzICovCj4gICAgICAgICByZXR1cm4gZmR0X2l0ZXJh
dGVfZWFjaF9kb21haW5fcm8oZmR0LCAmY29sZF9kb21haW5fb2Zmc2V0LAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9fZmR0X3BhcnNlX2RvbWFpbik7Cj4gLS0K
PiAyLjQzLjcKPgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5z
YmkK
