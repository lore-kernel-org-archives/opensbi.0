Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69FACC53219
	for <opensbi@archiver.kernel.org>; Tue, 28 Jul 2026 17:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XZqfQei+nbt3Ux0m0sCDmhTGNqaDEo3oqXdpGHLN5yM=; b=Gr0FJu7KSgJhYp
	YLeGB8BoGbSvULfEKfhhQa5O33rxCPI/8T2N5dBnKBSzFeZUU+RT9/E1YBlgzXZ2yhMjXeorINUT6
	eox2GSmBcFVVWThVG6aR8TVdr3qdsOedw2DgrjUEdt8xXRYSPukSP2tc2GjldL4YAJJekGVMOLZzr
	fHRQK1gMOd6+OVPhXi5V/s1EhG89lPvOZRb/Ny98NdrS5+yEVsspOW27eqrVylGQK2ijwWPyjt4Ri
	mRme5TWrT48CKdwl7cP5aa/cZq+H41pcdoyTFYd1Wuvy/TGdkglz+z26CECgZCuSc+PN/SoFDsLs1
	mpgxFqNi5ba4rFB/TskQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wom0E-000000062c5-3ZnS;
	Tue, 28 Jul 2026 17:54:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wom0C-000000062bj-2rgn
	for opensbi@lists.infradead.org;
	Tue, 28 Jul 2026 17:54:05 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SHITKv3631227
	for <opensbi@lists.infradead.org>; Tue, 28 Jul 2026 17:54:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m1G7ule3AM10HjvD1h2t6tNRRUq7aDepKtWqIBx7JEA=; b=e0ucYnz6KkYmqeDf
	XYbV3uQDsX+5bwj9FRV+YQ06BS7Z/JHERot1VHXFSAoAVhAMDmNZWQ8Y6gumkTQ/
	nl9lFX+Thr8anph/QtAkTPoFOvFbUlykkBI5fhCiSITY9PtcSnyF39iylF6J1i4f
	yqN1/FFI7nnFsH4RdWqWmDx6m6MJn5SS8XO6BKqb++s4IhZdo4L/JsiajWNowKqu
	fcmKzR2/5vdwxlLmv0NHZs4cHochH1jnPToa1qX+Y7f8flLf2fDrZulkHfq8slmG
	XNLz0E9W6cVT6YSvlq6sqPPmDZ/0kD7fGzvUn7AxDNFO7fveF3LgNg9Q9qK7fd1V
	MtA5ng==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq0q6r4sx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 28 Jul 2026 17:54:03 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-458326d2d9aso30726fac.2
        for <opensbi@lists.infradead.org>; Tue, 28 Jul 2026 10:54:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785261243; cv=none;
        d=google.com; s=arc-20260327;
        b=WIWGnZqXAsXt1ZzVLf0vfwQLRZJNLORONRU1q3HuOWEuSG7rkGGA6G9Hp86StgLVWd
         BSsABOJKhCdxQT03PZwn0mMqcwwOjIWIDr1jqgKUMILILyx5yrxfgzivu+uTMiTHG5to
         2eGrpMr+UJolbQ2XfXI+Er7UWwIhlnOUSD+pQZpw4ZT83UDc/kJtmupDEVWExATjrDGN
         /k/pZ2guLExT/SJMK+nEC0kIPB6DKGZkbjefcwJWo8Mowly4QeiBYVemqV+EhwUt+B/m
         bzoJJ+dxWx7m+Dd7uHJrAENZdIHitme/eG/zROyGsCVJYygC8SoOs0+KOruZx0eop0Jp
         KpxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m1G7ule3AM10HjvD1h2t6tNRRUq7aDepKtWqIBx7JEA=;
        fh=MdmvXSUFENyCa9IM0o2OrD48qc7mts4Xf6MuVA5kyZ4=;
        b=iO4UPxM5r6/dPGyTUWCPvxdTIIvaocd+JvQ4OJUAIOdG4hOLNj81vQI5Do1iEI4D4x
         SGOdB9HBo0A2K/CvqNCOdJckcHZ8vOyAvv6bamhOAn3fbD7i+hCPq5YOAPVSVS/BretS
         NIfLX3iYuysieNT9vBleRIKaiGLFetBiLdq5XiPCDZEGudtqILQ137GtpVHOG54B2K/d
         R9riZqddJ875awAeV9UrS+lB0kjIRT1oNx6TQMKQSy9H1B9GMmYZj1G0Zhbvlqnni+1o
         q9k747jrhSxyzre3t4gwsMfdCJSffUdD0tem3hUiBRFZ/ZZYxCfzZ8/1LdyuoRa8CqzE
         zvWw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785261243; x=1785866043; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m1G7ule3AM10HjvD1h2t6tNRRUq7aDepKtWqIBx7JEA=;
        b=X0VpaXcqMNOUQdjWhEuKwToFEdjyRQKftAP9eJyLh37EI4OwQcmiKN+Wf51S7bycEd
         1aXDSSkE1jHed3sNEh8M5IPO61sjn5btpTlOMqMdKwbCLchvWWKJa9mvtxOPowd7b0CV
         gnAUt5Xwj6YZB4GBG3LV6z/H7Q/PE+UEA7TX0r8Jq8UVBcKbdDPWuCkara8IvkDsuXB2
         7oEnVfv7E37WOMD/H9CxOjmthOm46SI8+b0SEEXqyVtyOMaB0yMtDsVSgXLo1Ze4u5HT
         zovDYRoL3L8BuyTgTanYnvELiV1sbiXvdq0z0K3oa75IZkfLYeCLpBToOY+DWEw4JnWf
         idMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785261243; x=1785866043;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m1G7ule3AM10HjvD1h2t6tNRRUq7aDepKtWqIBx7JEA=;
        b=ePyOeh/92PW/h3Hu+FrIRj2KFhVBxTpNbcbQt/VZT6T0PEe93ctXPDt1PLBuuxbCH2
         gWVW+9ABkNjVL7n5V3cvOpuGhvTibhRDEUY92kywHc2oxGFeSlKKfUlvv5bWKIZRBVev
         EP9zuXUd0dAmA6k9fWTfIHB4eiZuW4f4Cy9kPhq8ZqZguz1Gkf8jQeDxMmY7BWCrHFm6
         6huJO9uahBqguF7v5Bc2Mn19noCZfZQKUiIaZIM+pON2J8zzhvzfjw/xRDKsFrTgvCYO
         XFia/V47jLKz/h2vQT+yLfouOt1R/qx6jC8qq0QqvhTS2r4/2p2sKeJDp7b0Bkdiu46L
         yaCQ==
X-Gm-Message-State: AOJu0Ywy5cMO4UJZIZCuANHARcN20kzhIbtzscmbSHj394TAvkoDY4rM
	ILLlaAAxzjEQyR4dZGRGx7ozkUykH6MiQBd4DLZiOOTmf7KUlk6Swd4D33TLGWR7SHSovNK4Xbi
	i6+Zm6zDhFCVDI7aPk14Gvbe0kmdWOkqXGiTIiOe2pvD3WPt/o1RWBqp0aKJhUJDGbFq54brclc
	ar5e1s7FkOeJg+kTmaOh9aJofrlREODdytNtyzvlSa
X-Gm-Gg: AR+sD12IWMvxJOrhkj50syARu/OLUxiJ971cuPdLNNO8BRsahaxGAtWGspstQx+t7kA
	dP+s6KiZjAzsrOJVeTsAUxky23nGd8t+fTuNX0o/T7S31OvarZSxzo+HEsi0AGUN10cEt4Tea6h
	0PDKyXLSC1xRx4NCidEqHzeNxdsHBW9JMmA8LMmxvHrHehHhHm6DcGCI0yCw==
X-Received: by 2002:a05:6871:3842:b0:457:ed1a:9da3 with SMTP id 586e51a60fabf-4586c98565emr2022422fac.17.1785261242916;
        Tue, 28 Jul 2026 10:54:02 -0700 (PDT)
X-Received: by 2002:a05:6871:3842:b0:457:ed1a:9da3 with SMTP id
 586e51a60fabf-4586c98565emr2022209fac.17.1785261236694; Tue, 28 Jul 2026
 10:53:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260727135605.465309-1-rahul.pathak@oss.qualcomm.com> <20260727135605.465309-4-rahul.pathak@oss.qualcomm.com>
In-Reply-To: <20260727135605.465309-4-rahul.pathak@oss.qualcomm.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 10:53:45 -0700
X-Gm-Features: AUfX_mwezeex52KE1XTALoudHCub_sNEhSdBZPT8utOhksR75wgHEWtk6udW1CE
Message-ID: <CAAVgOk+rvAbyKAApWub-3KrCNVjcMb8ggaS_bTwGdN_aTPMk1g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/5] platform/generic: Initialise MPT at boot
To: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, rahul@summations.net
X-Proofpoint-GUID: JX0Ugnk2QQHIA0a81ad4ZZDyUToDLsWu
X-Authority-Analysis: v=2.4 cv=DqpmPm/+ c=1 sm=1 tr=0 ts=6a68ecbb cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=tTq5QqSSbEJAz5J_TQ4A:9 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: JX0Ugnk2QQHIA0a81ad4ZZDyUToDLsWu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDE1NiBTYWx0ZWRfX+iBl2QB+g2gu
 1qoznEDBJCxEe15X6WpvQREviRKGgpoHGQMSux72YWTWgUvDzM608hR+1N1DHxCGYA+deL88hPX
 9bCRYE0EjFiWrxgkL5bW9MZrFc0fJHk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDE1NiBTYWx0ZWRfX4m9qnU/xulC2
 fMuTmPzSvQEqyro40BLu5V/X6TUYytCySzIultkFEH76JDBbJ8cLKveRIfuwLZZzcaWDhxfmnbn
 S4cX/BqyqfG2dgH2ISa6t3xyibliTiAyj/G2mhmC3qCX64M1bY3LhUlSCs0xYdk0ydkAxMRco0u
 kuMG7X5DYq8CddS0SUDq8mWVLs1U8tHOm2njBCX+awj7Gfvv0m64MLJFhPWVYnCvRfIbzVrmvIE
 mtn3v3EEHsaJfUElGxVDDxdptvhRebx1zXaV/uSxMZnEScxQI2cWkEPKnYhRX2FiGE36Ljl9deC
 /hqmmwhMbcMAKryRZUJLYQrMWAVMzBHcaW9rICkkLxmcz+HR8WsuLaQ2P7/PZlj3UE0J7Ukgr2I
 OKEzHvgvitU3QyJGXCWtbPgT/9LO7MuJZ0kqgbUOceSfGUL9+Sh8VVHAJDJ+a3RPtM5dESViho0
 Qs0UNX8DRv7lsEsJQXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_105404_753539_1264832E 
X-CRM114-Status: GOOD (  29.42  )
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

T24gTW9uLCBKdWwgMjcsIDIwMjYgYXQgNjo1NuKAr0FNIFJhaHVsIFBhdGhhawo8cmFodWwucGF0
aGFrQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gSW50ZWdyYXRlcyBNUFQgaW5pdGlhbGlz
YXRpb24gaW50byB0aGUgZ2VuZXJpYyBwbGF0Zm9ybSBib290IGZsb3cuCj4KPiBtcHRfZWFybHlf
aW5pdCgpIHByb2JlcyBmb3IgU01NUFQgZHVyaW5nIGNvbGQtYm9vdCBlYXJseSBpbml0IGFuZAo+
IGluaXRpYWxpc2VzIHRoZSBzdHJ1Y3R1cmVzIHJlcXVpcmVkIHRvIGJ1aWxkIE1QVCB0YWJsZXMu
Cj4KPiBtcHRfZmluYWxfaW5pdCgpIGNyZWF0ZXMgdGhlIHJvb3Qgc3VwZXJ2aXNvciBkb21haW4g
d2hpY2ggaXMgbWFwcGluZyBhbGwKPiBwaHlzaWNhbCBtZW1vcnkgd2l0aCB0aGUgZmlybXdhcmUg
cmVnaW9uIGV4cGxjaXRseSBkZW5pZWQgdG8gUy1tb2RlIGFuZAo+IGFkZHMgc3VwcG9ydCBmb3Ig
YW4gTVBUIGRvbWFpbiBmb3IgZWFjaCBhZGRpdGlvbmFsIHJlZ2lzdGVyZWQgU0JJIGRvbWFpbi4K
Pgo+IFRoZSBoZWFwIGJ1ZGdldCBpcyBleHRlbmRlZCB0byByZXNlcnZlIHNwYWNlIGZvciBNUFQg
dGFibGVzLgo+Cj4gV2l0aCB0aGlzIHBhdGNoIE1QVCB0YWJsZXMgYXJlIGJ1aWx0IGF0IGJvb3Qu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBSYWh1bCBQYXRoYWsgPHJhaHVsLnBhdGhha0Bvc3MucXVhbGNv
bW0uY29tPgo+IC0tLQo+ICBwbGF0Zm9ybS9nZW5lcmljL3BsYXRmb3JtLmMgfCAxMDEgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMDEgaW5z
ZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL3BsYXRmb3JtL2dlbmVyaWMvcGxhdGZvcm0uYyBi
L3BsYXRmb3JtL2dlbmVyaWMvcGxhdGZvcm0uYwo+IGluZGV4IDFkZjAyODBkLi5iOWE3MTViNiAx
MDA2NDQKPiAtLS0gYS9wbGF0Zm9ybS9nZW5lcmljL3BsYXRmb3JtLmMKPiArKysgYi9wbGF0Zm9y
bS9nZW5lcmljL3BsYXRmb3JtLmMKPiBAQCAtMTcsNiArMTcsOSBAQAo+ICAjaW5jbHVkZSA8c2Jp
L3NiaV9zdHJpbmcuaD4KPiAgI2luY2x1ZGUgPHNiaS9zYmlfc3lzdGVtLmg+Cj4gICNpbmNsdWRl
IDxzYmkvc2JpX3RsYi5oPgo+ICsjaW5jbHVkZSA8c2JpL3NiaV9tcHQuaD4KPiArI2luY2x1ZGUg
PHNiaS9zYmlfZG9tYWluLmg+Cj4gKyNpbmNsdWRlIDxzYmkvc2JpX2NvbnNvbGUuaD4KPiAgI2lu
Y2x1ZGUgPHNiaV91dGlscy9jYWNoZS9mZHRfY21vX2hlbHBlci5oPgo+ICAjaW5jbHVkZSA8c2Jp
X3V0aWxzL2ZkdC9mZHRfZG9tYWluLmg+Cj4gICNpbmNsdWRlIDxzYmlfdXRpbHMvZmR0L2ZkdF9k
cml2ZXIuaD4KPiBAQCAtMzMsNiArMzYsODYgQEAKPiAgLyogTGlzdCBvZiBwbGF0Zm9ybSBvdmVy
cmlkZSBtb2R1bGVzIGdlbmVyYXRlZCBhdCBjb21waWxlIHRpbWUgKi8KPiAgZXh0ZXJuIGNvbnN0
IHN0cnVjdCBmZHRfZHJpdmVyICpjb25zdCBwbGF0Zm9ybV9vdmVycmlkZV9tb2R1bGVzW107Cj4K
PiArLyoKPiArICogbXB0X2Vhcmx5X2luaXQoKTogRGV0ZWN0cyB0aGUgU01NUFQgbW9kZSBhbmQg
aW5pdGlhbGl6ZXMgdGhlCj4gKyAqIHN0cnVjdHVyZXMgKG5vdCBNUFQgdGFibGVzKSByZXF1cmll
ZCB0byBwcmVwYXJlIE1QVCB0YWJsZXMgYW5kCj4gKyAqIGRvbWFpbiBwcm9ncmFtbWluZy4KPiAr
ICovCj4gK2ludCBtcHRfZWFybHlfaW5pdChib29sIGNvbGRfYm9vdCkKPiArewo+ICsgICAgICAg
aW50IHJjOwo+ICsKPiArICAgICAgIGlmICghY29sZF9ib290KQo+ICsgICAgICAgICAgICAgICBy
ZXR1cm4gMDsKPiArCj4gKyAgICAgICByYyA9IHNiaV9tcHRfaW5pdCgpOwo+ICsgICAgICAgaWYg
KHJjID09IFNCSV9FTk9ERVYpCj4gKyAgICAgICAgICAgICAgIHJldHVybiAwOwo+ICsKPiArICAg
ICAgIHJldHVybiByYzsKPiArfQo+ICsKPiArLyoKPiArICogbXB0X2ZpbmFsX2luaXQoKTogUGVy
Zm9ybXMgdGhlIGZpbmFsIGluaXRpYWx6YXRpb24gaW5jbHVkaW5nCj4gKyAqIGNyZWF0aW9uIG9m
IFJvb3Qgc3VwZXJ2aXNvciBkb21haW4uCj4gKyAqLwo+ICtpbnQgbXB0X2ZpbmFsX2luaXQoYm9v
bCBjb2xkX2Jvb3QpCj4gK3sKPiArICAgICAgIGludCByYzsKPiArICAgICAgIHUzMiBzZGlkOwo+
ICsgICAgICAgc3RydWN0IHNiaV9kb21haW4gKmRvbSwgKnJvb3RfZG9tOwo+ICsgICAgICAgc3Ry
dWN0IHNiaV9tcHRfZG9tYWluX2NvbmZpZyBjZmc7Cj4gKwo+ICsgICAgICAgaWYgKCFjb2xkX2Jv
b3QpCj4gKyAgICAgICAgICAgICAgIHJldHVybiAwOwo+ICsKPiArICAgICAgIC8qIFNNTVBUIG1h
eSBiZSB1bmF2YWlsYWJsZSAqLwo+ICsgICAgICAgaWYgKCFzYmlfbXB0X2N0cmxfZ2V0KCktPnJl
YWR5KQo+ICsgICAgICAgICAgICAgICByZXR1cm4gMDsKPiArCj4gKyAgICAgICAvKgo+ICsgICAg
ICAgICogQ3JlYXRlIE1QVCBkb21haW4gZm9yIFJvb3QgZG9tYWluLgo+ICsgICAgICAgICoKPiAr
ICAgICAgICAqIFJvb3QgZG9tYWluIG1hcHMgYWxsIHBoeXNpY2FsIG1lbW9yeSBzbyB0aGUKPiAr
ICAgICAgICAqIGZpcm13YXJlIHJlZ2lvbiBtdXN0IGJlIGV4cGxpY2l0bHkgZGVuaWVkIHRvIFMt
bW9kZS4KPiArICAgICAgICAqCj4gKyAgICAgICAgKiByZWdpb25zIHBvaW50ZXIgaXMgTlVMTCBh
bmQgbnJlZ2lvbnMgaXMgMCBzaW5jZSB0aGVyZQo+ICsgICAgICAgICogYXJlIG5vIG90aGVyIHJl
Z2lvbnMgb3RoZXIgdGhhbiByZXNwZWN0aXZlIFNCSSBkb21haW4gZm9yIG1hcHBpbmcuCj4gKyAg
ICAgICAgKi8KPiArICAgICAgIHJvb3RfZG9tID0gc2JpX2RvbWFpbl90aGlzaGFydF9wdHIoKTsK
PiArICAgICAgIGNmZy5zYmlfZG9tID0gcm9vdF9kb207Cj4gKyAgICAgICBjZmcueHdyID0gU0JJ
X01QVF9QRVJNX1JXWDsKPiArICAgICAgIGNmZy5md19wcm90ZWN0ID0gdHJ1ZTsKPiArICAgICAg
IGNmZy5yZWdpb25zID0gTlVMTDsKPiArICAgICAgIGNmZy5ucmVnaW9ucyA9IDA7Cj4gKwo+ICsg
ICAgICAgcmMgPSBzYmlfbXB0X2RvbWFpbl9jcmVhdGUoJmNmZywgJnNkaWQpOwo+ICsgICAgICAg
aWYgKHJjKSB7Cj4gKyAgICAgICAgICAgICAgIHNiaV9wcmludGYoIm1wdDogUm9vdCBkb21haW4g
Y3JlYXRlIGZhaWxlZCByYz0lZFxuIiwgcmMpOwo+ICsgICAgICAgICAgICAgICByZXR1cm4gcmM7
Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgc2JpX21lbXNldCgmY2ZnLCAwLCBzaXplb2YoY2Zn
KSk7Cj4gKwo+ICsgICAgICAgLyogQ3JlYXRlIE1QVCBkb21haW4gZm9yIGFsbCBvdGhlciByZWdp
c3RlcmVkIFNCSSBkb21haW5zLiAqLwo+ICsgICAgICAgc2JpX2RvbWFpbl9mb3JfZWFjaChkb20p
IHsKPiArICAgICAgICAgICAgICAgaWYgKGRvbSA9PSByb290X2RvbSkKPiArICAgICAgICAgICAg
ICAgICAgICAgICBjb250aW51ZTsKPiArCj4gKyAgICAgICAgICAgICAgIGNmZy5zYmlfZG9tID0g
ZG9tOwo+ICsgICAgICAgICAgICAgICBjZmcueHdyID0gU0JJX01QVF9QRVJNX1JXWDsKPiArICAg
ICAgICAgICAgICAgY2ZnLmZ3X3Byb3RlY3QgPSBmYWxzZTsKPiArICAgICAgICAgICAgICAgY2Zn
LnJlZ2lvbnMgPSBOVUxMOwo+ICsgICAgICAgICAgICAgICBjZmcubnJlZ2lvbnMgPSAwOwo+ICsK
PiArICAgICAgICAgICAgICAgcmMgPSBzYmlfbXB0X2RvbWFpbl9jcmVhdGUoJmNmZywgJnNkaWQp
Owo+ICsgICAgICAgICAgICAgICBpZiAocmMpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgc2Jp
X3ByaW50ZigibXB0OiBkb21haW4gJyVzJyBmYWlsZWQgcmM9JWRcbiIsIGRvbS0+bmFtZSwgcmMp
Owo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIHJldHVybiAwOwo+ICt9Cj4gKwo+ICBzdGF0aWMg
dTMyIGZ3X3BsYXRmb3JtX2NhbGN1bGF0ZV9oZWFwX3NpemUodTMyIGhhcnRfY291bnQpCj4gIHsK
PiAgICAgICAgIHUzMiBoZWFwX3NpemU7Cj4gQEAgLTQyLDYgKzEyNSwxNSBAQCBzdGF0aWMgdTMy
IGZ3X3BsYXRmb3JtX2NhbGN1bGF0ZV9oZWFwX3NpemUodTMyIGhhcnRfY291bnQpCj4gICAgICAg
ICAvKiBGb3IgVExCIGZpZm8gKi8KPiAgICAgICAgIGhlYXBfc2l6ZSArPSBTQklfVExCX0lORk9f
U0laRSAqIChoYXJ0X2NvdW50KSAqIChoYXJ0X2NvdW50KTsKPgo+ICsgICAgICAgLyoKPiArICAg
ICAgICAqIE1QVCB0YWJsZSBidWRnZXQKPiArICAgICAgICAqIDEgTWlCIG1lbW9yeSBmb3IgTVBU
IGFsbG9jYXRlZCBjdXJyZW50bHkuCj4gKyAgICAgICAgKgo+ICsgICAgICAgICogVE9ETzogTmVl
ZCBiZXR0ZXIgd2F5IHRvIGdldCB0aGUgbWVtb3J5IGJ1ZGdldCBiYXNlZCBvbiBhY3RpdmUKPiAr
ICAgICAgICAqIFNNTVBUIG1vZGUuCj4gKyAgICAgICAgKi8KPiArICAgICAgIGhlYXBfc2l6ZSAr
PSAxMDI0ICogMTAyNDsKPiArCj4gICAgICAgICByZXR1cm4gQklUX0FMSUdOKGhlYXBfc2l6ZSwg
SEVBUF9CQVNFX0FMSUdOKTsKPiAgfQo+Cj4gQEAgLTIyOSw2ICszMjEsMTAgQEAgaW50IGdlbmVy
aWNfZWFybHlfaW5pdChib29sIGNvbGRfYm9vdCkKPiAgICAgICAgICAgICAgICAgICAgICAgICBy
ZXR1cm4gcmM7Cj4KPiAgICAgICAgICAgICAgICAgZmR0X2RyaXZlcl9pbml0X2FsbChmZHQsIGZk
dF9lYXJseV9kcml2ZXJzKTsKPiArCj4gKyAgICAgICAgICAgICAgIHJjID0gbXB0X2Vhcmx5X2lu
aXQoY29sZF9ib290KTsKPiArICAgICAgICAgICAgICAgaWYgKHJjKQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIHJldHVybiByYzsKPiAgICAgICAgIH0KPgo+ICAgICAgICAgcmV0dXJuIGZkdF9j
bW9faW5pdChjb2xkX2Jvb3QpOwo+IEBAIC0yMzYsMTEgKzMzMiwxNiBAQCBpbnQgZ2VuZXJpY19l
YXJseV9pbml0KGJvb2wgY29sZF9ib290KQo+Cj4gIGludCBnZW5lcmljX2ZpbmFsX2luaXQoYm9v
bCBjb2xkX2Jvb3QpCj4gIHsKPiArICAgICAgIGludCByYzsKPiAgICAgICAgIHZvaWQgKmZkdCA9
IGZkdF9nZXRfYWRkcmVzc19ydygpOwo+Cj4gICAgICAgICBpZiAoIWNvbGRfYm9vdCkKPiAgICAg
ICAgICAgICAgICAgcmV0dXJuIDA7Cj4KPiArICAgICAgIHJjID0gbXB0X2ZpbmFsX2luaXQoY29s
ZF9ib290KTsKPiArICAgICAgIGlmIChyYykKPiArICAgICAgICAgICAgICAgcmV0dXJuIHJjOwo+
ICsKT3phOiBkbyB5b3UgdGhpbmsgLSBpZiB0aGVyZSBpcyBhIG5lZWQgIHRvIG1vdmUgdGhpcyBj
YWxsIGFmdGVyIGFsbAp0aGUgZml4dXAgY2FsbHMgPwo+ICAgICAgICAgZmR0X2NwdV9maXh1cChm
ZHQpOwo+ICAgICAgICAgZmR0X2ZpeHVwcyhmZHQpOwo+ICAgICAgICAgZmR0X2RvbWFpbl9maXh1
cChmZHQpOwo+IC0tCj4gMi41MS4wCj4KPgo+IC0tCj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBv
cGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKClJldmlld2VkLWJ5OiBQYXdhbmRlZXAgT3phIDxwYXdh
bmRlZXAub3phQG9zcy5xdWFsY29tbS5jb20+CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3Bl
bnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vb3BlbnNiaQo=
