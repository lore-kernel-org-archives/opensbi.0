Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38496C624A4
	for <opensbi@archiver.kernel.org>; Thu,  3 Sep 2026 08:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CkiDwfZdMN0KiUldMczK8BMgxKIfB0xgM8lophDmX4w=; b=Yzh7qA38za9pRF
	quQEiA5I/wvcE/JhZw7qm8dhrabqgTLgUkOkVSC5kbLvljt3jKOiZihYuM9+vG4intin765QpnHRm
	z2dRABFozHgT9EfXy4VHEHY5eNWz+TdA5H6NmZVtsmnlujuyDXhWrHFphSXyA5YFjn+uDzTxrT8EY
	PjwV1qjtdSDnYntZBoJC9XaEXRYo4PkdI5xsts239wezDr5JBefVlypDuB3Piy7PUBbuK0AvOpnOI
	uPg6mTLE1BuJd4wc/Ovs/kB79pH0hvgz8Q3KCjK6vshS7hgMf6FGHpptqgj6ilBIfZGjYtOBl6oBA
	I4zmHd/VYtAUx9Cq7V9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x238a-0000000GqJP-3JV9;
	Thu, 03 Sep 2026 08:49:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x238T-0000000GqIZ-0mAK
	for opensbi@lists.infradead.org;
	Thu, 03 Sep 2026 08:49:33 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lGxK3798810
	for <opensbi@lists.infradead.org>; Thu, 3 Sep 2026 08:49:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OZ67ftNr1Lbul4ksW8xRrERc0vYAv6yv7LrGpr+Aapc=; b=Z8UTE0nbbuxOvrvw
	5JQIAUYdHj4RYB18RFz2CC+IaXCQvNgndkChCkGNVWIbVBMvPa9u5RXg3azhmnul
	GP13wsEg2OQWkrbN2xjItmwlCCVfFVXVfVd2GCyOokewqfk6a9BedZ4njH9uDmYv
	dNgr1+mU88ZMPn5wh55QR7uu5aUrPbgn/yWGurjrD0DnOPw+0yWvJEiaqhPnkNur
	5E5ai0IynEQzsDlVvaVR0xIUd1imYmYodGkGVN83AlImzcW0qYF5NMtubosYyPTn
	oe0+bno/juyH0FgLW9MwnjEorGnYolMCx9tlK4C/4Fx567MhlgKNklSkoAOnXI4N
	b6700g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1pyh1fw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Thu, 03 Sep 2026 08:49:28 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso3018799a12.0
        for <opensbi@lists.infradead.org>; Thu, 03 Sep 2026 01:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788425368; x=1789030168; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OZ67ftNr1Lbul4ksW8xRrERc0vYAv6yv7LrGpr+Aapc=;
        b=ChpaLEZuTtd4SYTNZlKepl3f8cySMPt87LTgLYqHVEJbxyLdJg8EMDiyVrL5ROVDRj
         G3cGy3LDmMh4FQ3LDqX9AARxeJ5FAjNcKU5qg7K7eY1FKDhKc00SsRNlC5gr5uePXqLB
         hhgq9gxCTjOiORkfgVjvEhTzuVf5x9gs6vTbL8uPwmlY83aJonCGhopuUYwBnAcdqJ99
         nAPHbox2bIV8i/rhHDtfeQ0SjmJODL9kVbsJg4+dyzN0/v4O/G+d1U7X3w8OXgT4L4Eu
         jfAbG6+0dE5cZZQ+vIAx0PqY4DU6PiQKfoi5Ffnq/rtXas5irWhW2qsotTF/f52WDp+Q
         o4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788425368; x=1789030168;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OZ67ftNr1Lbul4ksW8xRrERc0vYAv6yv7LrGpr+Aapc=;
        b=Xxknfxw9Mmi5YJqpnOSBIlGgA0O0bBASqTaHC39LxdyChw33IzAXZbSvRRlxwwamVN
         Klw6zaQ1IGM9f4h3huJ567oWfVthgJxGNkdjp2bBRM6Ugy9OPzKHrBusNyKdF9lretSM
         z9/DshCvYY6e9puyHuqFwt28KAyHVY9sI4EjfDwA2yI0yxCPmZfCa8Hz7DM26mcLmnP9
         CK6y3eraY/rZHRhWB3TtUYTn1mz/xKSl8kvMkO+o47hQMZs/lfhKI6PV+oDNmWRYkO17
         3cZP8icPMpSYRsDPva6ksXV2KPdYD3Xwb6vXqUbceOEVfvXNMmc1DOyFiehIDqrnsXQH
         HXiQ==
X-Gm-Message-State: AFuF++lxL0YbJWzZDjcHK2kqJeWczKWf9TODeDUubOmfsAtA4/7uLiNx
	O4BcKlp2TtQHAwLz3plStl8Xbo2cmy5JI8Zoyb8DgCSHRdNppjDiXFalT2qkKGaLA/71JXUnAbY
	VzLhL0rcQxiVqNnfTZy94wlDi2ACUVc+fukrG8sEiLeAN9SFGsDDXYzoO6UgSFXVSw6JCmchdmA
	==
X-Gm-Gg: AYBFou18macecrHlX5o0lPBg3vy3yZQ2WFnX1Q1vY/Xz3A7wxtoyZpSzMB3OAVKgMui
	1BnYNz02WkZ1uk7LpLBaDjxwL6AhPsoDbvgRgYf2T2Dd6+ewyzS2e+AxY39H6Z/qn1+/z6tAx53
	YX2ah+shcQ27kbuB/SIbIw8SXhLIKNmFIszSPx5KP5IAQM/xnCFbg71bTYWxc9mVkoAZhEPxaoF
	2DDV8wepCLnuJ0f5/y9fLN/sqDn5P2y27Eejy5C/iYaFxzWONP9EqVG2fQx7fLY2+9SBcruVcFc
	SGIpP6wQOlW8RFfIYTFTU+Rgb0X/QKKJvN660+ATe3o+v3xQay4CkD+KPpvRlkHTZS7vDRhFOTC
	7ikTk0goNqLWB0xnj+r1Z1529OnU5i3wA2xTFIf8Y1aC7/JRvC8Agf8h+lhmaZ9kMmM9nEkiLNf
	RTCCR0bFttY9M2P1SLKkuznRCM
X-Received: by 2002:a17:90a:da83:b0:38f:2168:b9cb with SMTP id 98e67ed59e1d1-39aedfb8f16mr17073182a91.9.1788425367844;
        Thu, 03 Sep 2026 01:49:27 -0700 (PDT)
X-Received: by 2002:a17:90a:da83:b0:38f:2168:b9cb with SMTP id 98e67ed59e1d1-39aedfb8f16mr17073133a91.9.1788425367378;
        Thu, 03 Sep 2026 01:49:27 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255e3172asm5637400eec.17.2026.09.03.01.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 01:49:26 -0700 (PDT)
Date: Thu, 3 Sep 2026 14:19:22 +0530
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: liutong <liutong@iscas.ac.cn>
Cc: opensbi@lists.infradead.org, Rahul Pathak <rahul@summations.net>
Subject: Re: [PATCH v2 2/6] lib: sbi_dbtr: fix shared memory double-fetch in
 install_trig
Message-ID: <apk0kuDTxmyAiu2-@hu-himchau-blr.qualcomm.com>
References: <20260731103405.1535818-1-liutong@iscas.ac.cn>
 <20260731103405.1535818-3-liutong@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260731103405.1535818-3-liutong@iscas.ac.cn>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3NSBTYWx0ZWRfX+gT1o+7F7hxY
 q1y4vfEw7BUZ8+Xu9j/U2hMv1CQUv1Q1aGDU4uTpSxheN1plrTHcNcapkfLzJkauY+y+LicRuii
 gM83229Axku5yy2OlH9Kd8h4vO4SsV/YvceX1Psc4Eh2WApBLcBRoJ+59XEnjzh8zMeSvwioK8b
 jUzs/Gtm5RAv7XRdlGSsj27VOaee7SNwhCdR9z+NNXn/TlqzYevj0K0EN0G24L1EGiu2CiwVxyJ
 PsVcQulasp1EcPbpd0Fb8emEWcBnWxasnaVsK+pkdPgBztudaG27k5DJh+Y1I/gle9NCerhRifn
 YZS1O2vupGkq3YB3akfKvaCIBvDwXQhj5duelgP9ItExHltcWckPf/yXaRxsW4tmplE7Hftf5t8
 YeWcj3D8wfmqzOc1pb2kCpRiPHvcO+Ca7tRkFcGGU55up4UKU+ry56L/YqFK8ogFJnd7RvleHO+
 ziKKsB7JIGUY+HMGMsw==
X-Proofpoint-ORIG-GUID: Vc_P6LYG5yCrDTTzr4RBCLctuF4HRW3t
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3NSBTYWx0ZWRfX3v+DHSYB9ea3
 gDq6dDUM9kKPyv/cGB23YRK6Luqv8hR0WdfxxOc6w3bq9jpdniwOe1LeKkI2HVMm9E8V1yDwkY/
 6f84bfer3kx6D5sjBHA2j0sbLx/P3O0=
X-Proofpoint-GUID: Vc_P6LYG5yCrDTTzr4RBCLctuF4HRW3t
X-Authority-Analysis: v=2.4 cv=DMO/JSNb c=1 sm=1 tr=0 ts=6a993498 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=nkLdZtOIF7EDp3jNP4kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_014929_228423_7F7C2269 
X-CRM114-Status: GOOD (  31.41  )
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

U3ViamVjdDogUmU6IFtQQVRDSCB2MiAyLzZdIGxpYjogc2JpX2RidHI6IGZpeCBzaGFyZWQgbWVt
b3J5IGRvdWJsZS1mZXRjaCBpbiBpbnN0YWxsX3RyaWcKCkhpIExpdXRvbmcsCgpPbiBGcmksIEp1
bCAzMSAyMDI2LCBsaXV0b25nIHdyb3RlOgoKPiBzYmlfZGJ0cl9pbnN0YWxsX3RyaWcoKSByZWFk
cyB0cmlnZ2VyIGNvbmZpZ3VyYXRpb24gZnJvbSBTLW1vZGUgc2hhcmVkCj4gbWVtb3J5IGluIHR3
byBzZXBhcmF0ZSBsb29wczogZmlyc3QgdG8gdmFsaWRhdGUsIHRoZW4gdG8gaW5zdGFsbC4gU2lu
Y2UKPiB0aGUgc2hhcmVkIG1lbW9yeSByZW1haW5zIHdyaXRhYmxlIGJ5IFMtbW9kZSBiZXR3ZWVu
IHRoZSB0d28gcmVhZHMsIHRoZQo+IGRhdGEgdXNlZCBmb3IgaW5zdGFsbGF0aW9uIG1heSBkaWZm
ZXIgZnJvbSB3aGF0IHdhcyB2YWxpZGF0ZWQuIFRoaXMKPiBhbGxvd3MgUy1tb2RlIHRvIGJ5cGFz
cyB2YWxpZGF0aW9uIGJ5IG1vZGlmeWluZyBzaGFyZWQgbWVtb3J5IGNvbnRlbnRzCj4gYmV0d2Vl
biB0aGUgdHdvIHBhc3NlcywgcG90ZW50aWFsbHkgaW5zdGFsbGluZyBtYWxpY2lvdXMgdHJpZ2dl
cgo+IGNvbmZpZ3VyYXRpb25zIGluIE0tbW9kZS4KPgo+IEZpeCB0aGlzIGJ5IG1lcmdpbmcgdmFs
aWRhdGlvbiBhbmQgaW5zdGFsbGF0aW9uIGludG8gYSBzaW5nbGUgcGFzcy4KPiBFYWNoIGVudHJ5
IGlzIGNvcGllZCB0byBhIGxvY2FsIHZhcmlhYmxlIGJlZm9yZSB1c2UsIHNvIFMtbW9kZSBjYW5u
b3QKPiBtb2RpZnkgdGhlIGRhdGEgYmV0d2VlbiB2YWxpZGF0aW9uIGFuZCBpbnN0YWxsYXRpb24u
IE9uIHZhbGlkYXRpb24KPiBmYWlsdXJlLCBhbGwgcHJldmlvdXNseSBpbnN0YWxsZWQgdHJpZ2dl
cnMgYXJlIHJvbGxlZCBiYWNrLgo+Cj4gRml4ZXM6IDk3ZjIzNGYxNWM5NiAoImxpYjogc2JpOiBJ
bnRyb2R1Y2UgdGhlIFNCSSBkZWJ1ZyB0cmlnZ2VycyBleHRlbnNpb24gc3VwcG9ydCIpCj4gU2ln
bmVkLW9mZi1ieTogbGl1dG9uZyA8bGl1dG9uZ0Bpc2Nhcy5hYy5jbj4KClRoYW5rcyBmb3IgdGhl
IHBhdGNoIHNlcmllcyB0byBhZGRyZXNzIFRPQ1RPVS4gQSBmZXcgdGhpbmdzIEkgdGhpbmsgbmVl
ZCB0byBiZSByZXNvbHZlZCBiZWZvcmUKdGhpcyBjYW4gZ28gaW4uCgo+IC0tLSBhL2xpYi9zYmkv
c2JpX2RidHIuYwo+ICsrKyBiL2xpYi9zYmkvc2JpX2RidHIuYwo+IEBAIC0zMjcsNyArMzI3LDcg
QEAgc3RhdGljIHZvaWQgZGJ0cl90cmlnZ2VyX3NldHVwKHN0cnVjdCBzYmlfZGJ0cl90cmlnZ2Vy
ICp0cmlnLAo+ICAJdHJpZy0+dGRhdGEyID0gbGxlX3RvX2NwdShyZWN2LT50ZGF0YTIpOwo+ICAJ
dHJpZy0+dGRhdGEzID0gbGxlX3RvX2NwdShyZWN2LT50ZGF0YTMpOwo+Cj4gLQl0ZGF0YTEgPSBs
bGVfdG9fY3B1KHJlY3YtPnRkYXRhMSk7Cj4gKwl0ZGF0YTEgPSB0cmlnLT50ZGF0YTE7CgpHb29k
IGNhdGNoLgoKPiBAQCAtNjAzLDEyICs2MDMsMTUgQEAgaW50IHNiaV9kYnRyX2luc3RhbGxfdHJp
Zyh1bnNpZ25lZCBsb25nIHNtb2RlLAo+ICBpbnQgc2JpX2RidHJfaW5zdGFsbF90cmlnKHVuc2ln
bmVkIGxvbmcgc21vZGUsCj4gIAkJCSAgdW5zaWduZWQgbG9uZyB0cmlnX2NvdW50LCB1bnNpZ25l
ZCBsb25nICpvdXQpCj4gIHsKPiArCXN0cnVjdCBzYmlfZGJ0cl9kYXRhX21zZyBsb2NhbDsKWy4u
Ll0KPiArCXN0cnVjdCBzYmlfZGJ0cl90cmlnZ2VyICppbnN0YWxsZWRbUlZfTUFYX1RSSUdHRVJT
XTsKPiArCWludCBudW1faW5zdGFsbGVkID0gMDsKPiArCWludCByZXQgPSBTQklfRVJSX0ZBSUxF
RDsKWy4uLl0KPiArCWlmICh0cmlnX2NvdW50ID4gUlZfTUFYX1RSSUdHRVJTKQo+ICsJCXJldHVy
biBTQklfRVJSX0lOVkFMSURfUEFSQU07CgpJIHRoaW5rIGl0J2QgYmUgd29ydGggY2FsbGluZyBv
dXQgdGhlIHBvc3NpYmxlIHN0YWNrIG92ZXJmbG93IHdpdGgKaW5zdGFsbGVkW251bV9pbnN0YWxs
ZWQrK10gZXhwbGljaXRseSBpbiB0aGUgY29tbWl0LiBJdCBtYXkgY3JlZXAgaW4uCgo+IC0JLyog
Q2hlY2sgcmVxdWVzdGVkIHRyaWdnZXJzIGNvbmZpZ3VyYXRpb24gKi8KPiAtCWZvcl9lYWNoX3Ry
aWdfZW50cnkoc2htZW1fYmFzZSwgdHJpZ19jb3VudCwgdHlwZW9mKCplbnRyeSksIGVudHJ5KSB7
Cj4gLQkJcmVjdiA9IChzdHJ1Y3Qgc2JpX2RidHJfZGF0YV9tc2cgKikoJmVudHJ5LT5kYXRhKTsK
Wy4uLl0KPiArCWZvcl9lYWNoX3RyaWdfZW50cnkoc2htZW1fYmFzZSwgdHJpZ19jb3VudCwgdHlw
ZW9mKCplbnRyeSksIGVudHJ5KSB7Cj4gKwkJLyoKPiArCQkgKiBTbmFwc2hvdCBvbmUgZW50cnkg
ZnJvbSBzaGFyZWQgbWVtb3J5IHNvIHRoYXQgUy1tb2RlCj4gKwkJICogY2Fubm90IG1vZGlmeSBp
dCBiZXR3ZWVuIHZhbGlkYXRpb24gYW5kIGluc3RhbGxhdGlvbi4KPiArCQkgKi8KPiArCQlsb2Nh
bCA9IGVudHJ5LT5kYXRhOwo+ICsJCWN0cmwgPSBsbGVfdG9fY3B1KGxvY2FsLnRkYXRhMSk7CgpU
aGlzIGlzIGFnYWluc3QgYW4gb2xkZXIgYmFzZSBvZiBzYmlfZGJ0cl9pbnN0YWxsX3RyaWcoKSB0
aGFuIHdoYXQncwpvbiBtYXN0ZXIgcmlnaHQgbm93LiBTaW5jZSB0aGUgY29tbWl0IHRoaXMgZml4
ZXMsIHdlJ3ZlIHBpY2tlZCB1cCB0aGUKcGVyLXNsb3QgaGFyZHdhcmUtY2FwYWJpbGl0eSBtYXRj
aGluZyAoZGJ0cl90cmlnZ2VyX2FueV9od19zdXBwb3J0ZWQoKSkKYW5kIHRoZSBkcnktcnVuIHNs
b3QgYWxsb2NhdGlvbiBwYXNzIChkYnRyX2ZpbmRfZnJlZV9zbG90KCksIHdpdGggdGhlCmBjbGFp
bWVkYCBiaXRtYXNrKSwgYW5kIHNiaV9hbGxvY190cmlnZ2VyKCkgbm93IHRha2VzICh0ZGF0YTEs
IHRkYXRhMiwKdGRhdGEzKSBkaXJlY3RseSBpbnN0ZWFkIG9mIGJlaW5nIGNhbGxlZCB3aXRoIG5v
IGFyZ3MuIEFsbCBvZiB0aG9zZQpjYWxsIHNpdGVzIGluZGVwZW5kZW50bHkgZG8gbGxlX3RvX2Nw
dShyZWN2LT50ZGF0YTEvdGRhdGEyL3RkYXRhMykKc3RyYWlnaHQgZnJvbSBzaGFyZWQgbWVtb3J5
IOKAlCB0aGV5J3JlIG5vdCBjb3ZlcmVkIGJ5IGBsb2NhbGAgaGVyZS4KClNvIG9uIGN1cnJlbnQg
bWFzdGVyIHRoaXMgcGF0Y2ggZG9lc24ndCBmdWxseSBjbG9zZSB0aGUgVE9DVE9VIGl0CmRlc2Ny
aWJlczogdGhlIHZhbGlkYXRlLXRoZW4taW5zdGFsbCByYWNlIHlvdXIgY29tbWl0IG1lc3NhZ2Ug
Y2FsbHMKb3V0IGZvciB0aGUgY2hlY2svaW5zdGFsbCBsb29wcyBpcyBzdGlsbCBwcmVzZW50IGJl
dHdlZW4gdGhlCmh3LXN1cHBvcnRlZCBjaGVjaywgdGhlIGRyeS1ydW4gc2xvdC1tYXRjaGluZyBs
b29wLCBhbmQgdGhlIGluc3RhbGwKbG9vcCwgc2luY2UgdGhvc2UgYWxsIHJlLXJlYWQgYGVudHJ5
LT5kYXRhYCBpbmRlcGVuZGVudGx5LiBDb3VsZCB5b3UKcmViYXNlIG9udG8gbWFzdGVyIGFuZCB0
aHJlYWQgdGhlIHNhbWUgYGxvY2FsYCBzbmFwc2hvdCB0aHJvdWdoCmRidHJfdHJpZ2dlcl9hbnlf
aHdfc3VwcG9ydGVkKCkgYW5kIGRidHJfZmluZF9mcmVlX3Nsb3QoKSAoZS5nLiBwYXNzCnRoZSBh
bHJlYWR5LWRlY29kZWQgdGRhdGExL3RkYXRhMi90ZGF0YTMgaW5zdGVhZCBvZiByZS1kZXJpdmlu
ZyB0aGVtCmZyb20gcmVjdiBlYWNoIHRpbWUpPyBPdGhlcndpc2UgdGhpcyBmaXhlcyB0aGUgYnVn
IGluIGEgdmVyc2lvbiBvZiB0aGUKZnVuY3Rpb24gdGhhdCBubyBsb25nZXIgZXhpc3RzIHVwc3Ry
ZWFtLgoKQWxzbywgY3VycmVudCBtYXN0ZXIgZGlzdGluZ3Vpc2hlcyBTQklfRVJSX0lOVkFMSURf
UEFSQU0gZnJvbQpTQklfRVJSX0ZBSUxFRCBmb3IgdGhlICJpbnZhbGlkIGNvbmZpZ3VyYXRpb24i
IGNhc2Ugd2hpY2ggdGhpcyBwYXRjaCdzCmNoZWNrIGNvbGxhcHNlcyBiYWNrIGludG8gYSBzaW5n
bGUgYGdvdG8gcm9sbGJhY2tgIHdpdGggdGhlIGRlZmF1bHQKYHJldCA9IFNCSV9FUlJfRkFJTEVE
YC4gUGxlYXNlIG1ha2Ugc3VyZSB0aGUgcmViYXNlIHByZXNlcnZlcyB0aGF0CmRpc3RpbmN0aW9u
LCBlLmcuIGJ5IHNldHRpbmcgYHJldCA9IFNCSV9FUlJfSU5WQUxJRF9QQVJBTWAgYmVmb3JlIHRo
ZQpnb3RvIGZvciB0aGUgZGJ0cl90cmlnZ2VyX3ZhbGlkKCkgZmFpbHVyZSBjYXNlLgoKT25lIG5p
dCBwaWNrLCBsb3dlci1zZXZlcml0eSBhbmQgYm9yZGVyIGxpbmUgdW5leHBsb2l0YWJsZSB0aG91
Z2gsCmBsb2NhbCA9IGVudHJ5LT5kYXRhO2AgY29waWVzIGZvdXIgdW5zaWduZWQgbG9uZ3MgaW4g
b25lIEMgc3RhdGVtZW50LApidXQgdGhhdCdzIG5vdCBhbiBhdG9taWMgYWNjZXNzIOKAlCBpdCds
bCBjb21waWxlIHRvIHNlcGFyYXRlIGxvYWRzLgpBIHNlY29uZCBoYXJ0IHdpdGggd3JpdGUgYWNj
ZXNzIHRvIHRoZSBzYW1lIHBoeXNpY2FsIHNobWVtIHBhZ2UgY291bGQKaW4gcHJpbmNpcGxlIHRl
YXIgdGhpcyBhY3Jvc3MgdHdvIGRpZmZlcmVudCBtZXNzYWdlcyBpdCB3cm90ZS4gSXQgd291bGQg
YmUKd29ydGggYSBvbmUtbGluZSBub3RlIHJlZ2FyZGluZyB0aGlzIGluIHRoZSBjb21taXQgbWVz
c2FnZQoKPiArcm9sbGJhY2s6Cj4gKwl3aGlsZSAobnVtX2luc3RhbGxlZC0tKSB7Cj4gKwkJZGJ0
cl90cmlnZ2VyX2NsZWFyKGluc3RhbGxlZFtudW1faW5zdGFsbGVkXSk7Cj4gKwkJc2JpX2ZyZWVf
dHJpZ2dlcihpbnN0YWxsZWRbbnVtX2luc3RhbGxlZF0pOwo+ICsJfQo+ICsJc2JpX2hhcnRfcHJv
dGVjdGlvbl91bm1hcF9yYW5nZSgodW5zaWduZWQgbG9uZylzaG1lbV9iYXNlLAo+ICsJCQkJCXRy
aWdfY291bnQgKiBzaXplb2YoKmVudHJ5KSk7Cj4gKwlyZXR1cm4gcmV0OwoKUm9sbGJhY2sgb3Jk
ZXJpbmcgKHJldmVyc2Ugb2YgaW5zdGFsbCBvcmRlcikgYW5kIHRoZSBjbGVhci1iZWZvcmUtZnJl
ZQpzZXF1ZW5jZSBsb29rIGNvcnJlY3QgdG8gbWUuCgpQbGVhc2UgcmViYXNlIG9udG8gY3VycmVu
dCBtYXN0ZXIgYW5kIGV4dGVuZCB0aGUgc25hcHNob3QgZGlzY2lwbGluZSB0bwp0aGUgaHctc3Vw
cG9ydGVkL2RyeS1ydW4tYWxsb2NhdGlvbiBwYXRocywgb3RoZXJ3aXNlIHRoZSBzZXJpZXMgZG9l
c24ndAphY3R1YWxseSBjbG9zZSB0aGUgYWN0dWFsIFRPQ1RPVSBpbiBsYXRlc3QgY29kZSBiYXNl
LgoKUmVnYXJkcwpIaW1hbnNodQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL29wZW5zYmkK
