Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53C3D3941D
	for <opensbi@archiver.kernel.org>; Thu,  2 Apr 2026 13:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dqpHFndUwAEfZH/8bNzGG9j+rqH8gyRkpbsTaY7+hvY=; b=XmUM+WlDjv8a7w
	FQcEUc/K7DvEcATbFoJQAmvn5iqcyV7DQGNVGSZrS52aASAkIRWSoVdWCrowxF8eouRxPXbM0yduk
	IdIFbdc6zhBtEBhS8CbL7Nbqz80NCTUCxI0pZy+WO82iC9Mxsk5KVyGybwA01gLnEvWCGazgsIl3p
	dXJvvdFj3IBxIReIMaZKIl1SyyU9y1DHoS/R3EN5/6WMcVsBwYFmP4aM4ek6HU5FfsreYWzenclus
	mvj4GcRp5yxIk2CcaSxF9HQXLIQ2jDwRk0UC4GBRWF2ReLxvBGzdtM2k1Fgj9ec2y7IHcjEmVifc5
	nBta2Hrry+s9mg6+9aVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8IHP-00000000Cbk-2MF0;
	Thu, 02 Apr 2026 13:40:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8IHL-00000000CYa-0HzS
	for opensbi@bombadil.infradead.org;
	Thu, 02 Apr 2026 13:40:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kBTLkV4AY8Rw5NAihiD6isF7UR5U38CvHliVVKTAggs=; b=dgzAh8/Yrn0iRTP4sHG/ovZiYw
	k3+vG5wEMteR3rJiGtAPFxm8OaTO6mzfhFmRuefJaF8+B/0jhFXrSjnx/vENQjwMMJf/APl+K4IVI
	aFf7h4ve1aqUEwUj7jTXt4miviZcOWbxI/OEzsa3/M60raoZbqWCxntHhjIMsCUeCLWD1sZ90ck6i
	iZhithJ5/Ufditp/UjAt5sGsUS3BYeELBYScOlSR/AHaV2r6fo/Eg74bQ5A3f5Qy99L32qVANZD+L
	Xxb6ExxYGdNfm2OTg0+afkoVM/eoHntAWitrobLbsWlBgW7jlNMG9MQNpl7gCdgae2Tu19uA9wAf3
	JxpWuohg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8IHI-00000002ZaC-0TS3
	for opensbi@lists.infradead.org;
	Thu, 02 Apr 2026 13:40:09 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632B23PL091717
	for <opensbi@lists.infradead.org>; Thu, 2 Apr 2026 13:40:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kBTLkV4AY8Rw5NAihiD6isF7UR5U38CvHliVVKTAggs=; b=iN5Jc5fMBiZKbunq
	d5CVs9vADKatEUEfE57RN9mbdSgchlQYWIXjF6/SPyzzq6cNQOqYCud71zY+mIrs
	+NrHUydklo4gM31jdHMcOPU0bfe/FY6DLK6yC4Haatpp4fsq4CmJm/ACOXWjCVoJ
	JiKD88ywDwCMz1tcnouffyUATBByN4SnTqkKsfMWg8gF9Sq5jCG0HGZ4L0jG4sHM
	wLyjlb+Tqx15LRLbWBbdOk9KdKtg3IZg51yOnTmCJob9KHlf65Q9jz+EqzY9JY9C
	kZQKk98sbxe0TZFg20WxSCBBIPmS4XRC3ntVGvTXziNx77Jps72ft84qUkAL0wqt
	I4xI5Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9jcu9y91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Thu, 02 Apr 2026 13:40:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5093787e2fdso35488371cf.2
        for <opensbi@lists.infradead.org>; Thu, 02 Apr 2026 06:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775137204; x=1775742004; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kBTLkV4AY8Rw5NAihiD6isF7UR5U38CvHliVVKTAggs=;
        b=bq+zPL+apMl/EdMuxFdPBxl2beWACWNBZqPireWsepn9EPsFcfbhiTweyOeIqKWcvo
         LYh8gv3h5/mfyjKtxDHYU6E79//pb15nQedTuhqxAkxN00T6dm+Hj8RDudmzZ/6aR/Vu
         umKLET4WSKTg0N6RJwYEbcHBNynoco1hlIlyDyuRI3JF9A+gvYOsoFJT+a8HNMuH2mng
         JCNKPyOk8L2HQae6O1GdczZQWKmjo0uhJ5YXWxUeCRrcumv3+s4VFk3Vml8vxyfsrKUQ
         M3rBJEKVcOpmr9PC6fZfRbVgOs2D/Oe+uE8sYAY+BP2uKEG4QmKMtAJQJoPhNqMLUHyt
         e0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775137204; x=1775742004;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kBTLkV4AY8Rw5NAihiD6isF7UR5U38CvHliVVKTAggs=;
        b=rDs6A4E0UMoVKOdap38GWASK4pRmLuLIiroYIG2S+pkDQ4mFCzMyMlPitIZmMZwPoj
         kNp/vX2h0PtHwGoj5/MovbWeiu5a3ibt2o62O8zlg6baLj24b+62JVZuF3mKM8FHKrZE
         W7RVQZv+5G7cyir1sJlKaDfCtg7LuFGuQpeShabI5JKqOcUyYiOFitxv4qk8+GcF+A/5
         IWnCzo0UkJ+72xQ+0Pzr4HPl7myQVFrA0TBhA9mF5wL4BUvkvzQAYgs5MLoPcuS8q24i
         4RDR4YjcTAubFLGUafOajm3AXHKNvJrVu+xcr/jv/yLpkFiCu1P1zx17mwnoBs3dhyLw
         hPFA==
X-Forwarded-Encrypted: i=1; AJvYcCVWk9pogSJYrz/FfLCa/rqEcT70UXWZqdEhFx4XnPXXbFB7ZTPvUoypaU6fsY7FBx4MDUC+ymu1@lists.infradead.org
X-Gm-Message-State: AOJu0YycoD0g3zkT/z7K9mK7iUCWFSaZVWSEYpsyeV+vrGUsFP2NbhrG
	jH/FPYwLU1t8dqHp1L6lHKryE7HNWbavKWW19LdoHmTdT1u+jkxQZ10ch4/Ht8ILeYUvVqEjlHl
	kx2RhvxZEz6k4GxwsDIvgD6yFhrXgJW1j8J78tthK+MYLW1qZorLf9DNOaxgnm1CAfg==
X-Gm-Gg: ATEYQzycWMFvysV/0HXKwmm4+3okKjCIIyopbemVUSAXp7Y4cpLVwmZaBkQmNSlOmKR
	4I3ww8KE+HWapgHTJ78e+qw+k8xQ0WKKobY/4cKdKMCH08MgdGrjkaOAoC6/O40wpGV713UT5q4
	92v9pdVZX0OAMrzBcPnG0GVxK/O09SbEEfrrAWWolZf22jYeaooYo7VlTCf0NJm+QHf0zlYlVxc
	Y/7tLyAXwmgYXhrF8Ho9srjiB3NwM2l+WWL/KcAqASKLFWPuMcIHKPrDcpzD3NCucqgBecXcQ/v
	4zwI5mLkz8Uia5j6H5z8/IX+NV6cS0lknmynzR0NSH4IILE3rkbbVBuRDkRLvNBpdIexNzkbwSl
	qzwfvFevh+QdWlbUOQEecYG5Cp8t2Njh4ii/ZThvJfgMj1R3MZEWfCpYaGTK5
X-Received: by 2002:ac8:57c8:0:b0:50b:496c:baac with SMTP id d75a77b69052e-50d3bd0ed80mr102386181cf.59.1775137204495;
        Thu, 02 Apr 2026 06:40:04 -0700 (PDT)
X-Received: by 2002:ac8:57c8:0:b0:50b:496c:baac with SMTP id d75a77b69052e-50d3bd0ed80mr102385341cf.59.1775137203584;
        Thu, 02 Apr 2026 06:40:03 -0700 (PDT)
Received: from localhost (ip-86-49-249-15.bb.vodafone.cz. [86.49.249.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cff0a1esm88013666b.43.2026.04.02.06.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 06:40:02 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 02 Apr 2026 15:40:01 +0200
Message-Id: <DHIPMCI378P5.2V9E4QV6R9BTW@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/3] lib: sbi: Add floating-point context
 save/restore support.
Cc: "Scott Bambrough" <scott@riscstar.com>,
        "Robin Randhawa"
 <robin.randhawa@sifive.com>,
        "Anup Patel" <anup.patel@qti.qualcomm.com>,
        "Ray Mao" <raymond.mao@riscstar.com>,
        "Anup Patel"
 <anuppate@qti.qualcomm.com>,
        "Dhaval" <dhaval@rivosinc.com>, "Peter Lin"
 <peter.lin@sifive.com>,
        <opensbi@lists.infradead.org>,
        "opensbi"
 <opensbi-bounces@lists.infradead.org>
To: <dave.patel@riscstar.com>, "Samuel Holland" <samuel.holland@sifive.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
References: <20260331055858.305207-1-dave.patel@riscstar.com>
 <20260331055858.305207-3-dave.patel@riscstar.com>
In-Reply-To: <20260331055858.305207-3-dave.patel@riscstar.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEyMCBTYWx0ZWRfXxSlHXvQ+tEYq
 diJFFSlv1qH+moKqJSRU7nD4KFDvAByqvPkqhFJT7l6uT00509CtgU0SVsm6m8p75az+wQcoXsw
 IsatdOUT/zpxD1sCEcG2Vf9ArHq1th8Zu+oAa4ZBQeSdGY3E8fv45iyNX3XMrjEWqA87zHgToaP
 AT6Gfugz0NIFlCKqYxSW83xd/Jl7ccTrwXZJWCtpZfx4HY73BjHVEGXjEk8CON6gPriwuUjjoyN
 RRtAS3gCOWXhzhlof+FnnuIRqYJOQ4bc7RFYsH/aZZ+SkS2E9EeXtD7Fk2TEeKAJ969jEZAqUs0
 zreKER6zCsjfAAMfDdQPliufoRzIDADeT0Rtvxy3J5DzWlqwzzZAN971puHc4wW+J+eTmrhQHQI
 2H9yaSX9jLHGjeeqtm6+H84UAsJ3F6Kmtpv9IJf7N37hQWC4tGsA0orIZ8+iQKonaX3dWdrzxxd
 5F5dx5y+mnMzKY3iPpA==
X-Proofpoint-GUID: P9GnBwNXyu5nxIWQmAtrx2ZfHgYrKHum
X-Authority-Analysis: v=2.4 cv=eYYwvrEH c=1 sm=1 tr=0 ts=69ce71b6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=fuErIE+P63Icv3tqjtEZBw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=ee_2aqc6AAAA:8 a=Rj1X5WVIab1q3HosCyIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-ORIG-GUID: P9GnBwNXyu5nxIWQmAtrx2ZfHgYrKHum
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_02,2026-04-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_144008_461694_CF7C3656 
X-CRM114-Status: GOOD (  13.92  )
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

MjAyNi0wMy0zMVQwNjo1ODo1NiswMTowMCwgPGRhdmUucGF0ZWxAcmlzY3N0YXIuY29tPjoKPiBG
cm9tOiBEYXZlIFBhdGVsIDxkYXZlLnBhdGVsQHJpc2NzdGFyLmNvbT4KPgo+IEFkZCBzdXBwb3J0
IGZvciBzYXZpbmcgYW5kIHJlc3RvcmluZyBSSVNDLVYgZmxvYXRpbmctcG9pbnQgKEYvRCkgZXh0
ZW5zaW9uCj4gc3RhdGUgaW4gT3BlblNCSS4gVGhpcyBpbnRyb2R1Y2VzIGEgZmxvYXRpbmctcG9p
bnQgY29udGV4dCBzdHJ1Y3R1cmUgYW5kCj4gaGVscGVyIHJvdXRpbmVzIHRvIHBlcmZvcm0gZnVs
bCBjb250ZXh0IHNhdmUgYW5kIHJlc3RvcmUuCj4KPiBUaGUgZmxvYXRpbmctcG9pbnQgY29udGV4
dCBpbmNsdWRlcyBzdG9yYWdlIGZvciBhbGwgMzIgRlBpIHJlZ2lzdGVycyAoZjDigJNmMzEpCj4g
YWxvbmcgd2l0aCB0aGUgZmNzciBjb250cm9sIGFuZCBzdGF0dXMgcmVnaXN0ZXIuIFRoZSByZWdp
c3RlciBzdGF0ZSBpcyBzYXZlZAo+IGFuZCByZXN0b3JlZCB1c2luZyBkb3VibGUtcHJlY2lzaW9u
IGxvYWQvc3RvcmUgaW5zdHJ1Y3Rpb25zIChmc2QvZmxkKSwgYW5kCj4gc2luZ2xlLXByZWNpc2lv
biBsb2FkL3N0b3JlIGluc3RydWN0aW9ucyAoZnN3L2Zsdykgb24gYW4gUlY2NCBzeXN0ZW0gd2l0
aAo+IEYgYW5kIEQtZXh0ZW5zaW9uIHN1cHBvcnQuCj4KPiBUaGUgaW1wbGVtZW50YXRpb24gZm9s
bG93cyBhbiBlYWdlciBjb250ZXh0IHN3aXRjaGluZyBtb2RlbCB3aGVyZSB0aGUgZW50aXJlCj4g
RlAgc3RhdGUgaXMgc2F2ZWQgYW5kIHJlc3RvcmVkIG9uIGV2ZXJ5IGNvbnRleHQgc3dpdGNoLiBU
aGlzIGF2b2lkcyB0aGUgbmVlZAo+IGZvciB0cmFwLWJhc2VkIGxhenkgbWFuYWdlbWVudCBhbmQg
a2VlcHMgdGhlIGRlc2lnbiBzaW1wbGUgYW5kIGRldGVybWluaXN0aWMuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBEYXZlIFBhdGVsIDxkYXZlLnBhdGVsQHJpc2NzdGFyLmNvbT4iCj4gLS0tCj4gZGlmZiAt
LWdpdCBhL2xpYi9zYmkvc2JpX3ZlY3Rvci5jIGIvbGliL3NiaS9zYmlfdmVjdG9yLmMKPiBAQCAt
NTAsOCArNTAsOCBAQCB2b2lkIHNiaV92ZWN0b3Jfc2F2ZShzdHJ1Y3Qgc2JpX3ZlY3Rvcl9jb250
ZXh0ICpkc3QpCj4gIAlpZiAoIWRzdCkKPiAgCQlyZXR1cm47Cj4KPiAtI2RlZmluZSBSRUFEX0NT
Uihkc3QsIGNzcikgKAkJCQlcCj4gLQlkbyB7CQkJCQkJXAo+ICsjZGVmaW5lIFJFQURfQ1NSKGRz
dCwgY3NyKSAJCQkJXAo+ICsJewkJCQkJCVwKClBsZWFzZSwgY2hhbmdlIHRoZSBmaXJzdCBwYXRj
aCBpbnN0ZWFkIG9mIGZpeGluZyB0aGUgYnVnIGhlcmUuCgooQnR3LiAiKHsgLi4uIH0pIiBpcyBh
IHN1cGVyaW9yIG1hY3JvIHdyYXBwZXIuKQoKVGhhbmtzLgoKWy4uLl0KCj4gLQl9IHdoaWxlICgw
KSkKPiArCX0KCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2Jp
Cg==
