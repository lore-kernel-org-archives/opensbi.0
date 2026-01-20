Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32420D2ECF7
	for <opensbi@archiver.kernel.org>; Tue, 20 Jan 2026 13:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc:Subject:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GxtNbavq5R+FKzcswjMeKc1doQeCNY7Hg9iEE0Jn6Rk=; b=vV5g55Qp7wtn2X
	4DfdgA87JlvSHX+hiN62R/4YSD3uKaOfS82cCOoYisGcQ7tghCiuSoolp4dUJ79M4qu9TxRCKbhi6
	cMiF6ZAtvqQ4Vc5koXYFGxcgP1bI7upecDBBb1k9s2RxBZ+1+hwT4tuKruIe/6iVDYLGswh0lyLsA
	exlaTxhKVO4kFaAjpmCGl621eRzcD2D/flhoinbVKjU/AAfnfvZymxrs6uDeugGGww8Ibbe0rfN/E
	JdncCC9tdW1OoLzhAEj6tgmnlMFQA8P+tbTems87QZR69tTvamne7xQsR/BD/mgWqc+BfC548zl6N
	uX8qQfqlPS+6kPQQNpUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viCGC-00000003wZK-3GWn;
	Tue, 20 Jan 2026 13:59:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viCGA-00000003wXz-0VJs
	for opensbi@lists.infradead.org;
	Tue, 20 Jan 2026 13:59:07 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KD9IN4511729
	for <opensbi@lists.infradead.org>; Tue, 20 Jan 2026 13:59:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hCG240uyu7IaStQRBzpdx6Bi4blsOXfj2w9Nj9spZjc=; b=Ud4y0lE46U3QmXo3
	crQl0d5tpGVPAJlxAqLqzyQz5YYetTN7HIK+PvBYf0olVRDXArPq27VCwbj2B3Wf
	2333hjzGz2ePxT8qy0vssMnaGvYAemGb0HYZX6QiGf0WV8e1XUWFv7LYSpSkSPUD
	aVjRQLQdRm1/AQNIHNZ6/x7Ed2MnbCV+d80O8JGLa4y5NqwxFvDn6CwZ0II4b9jt
	cZJSmnM1gqwreyRBAvByia0HjXtK5/D5r2SPXK7d9eE+HEy8dNTZA1kQ5yke62gP
	loTJprA/aeTFp+LEJQYDrcMm89+35+lfplkjTEyTlWxt1ph/bSP2TdxzC0bLV2aq
	Ga5zSQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btabe04ea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 20 Jan 2026 13:59:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c1cffa1f2dso1547353685a.1
        for <opensbi@lists.infradead.org>; Tue, 20 Jan 2026 05:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768917544; x=1769522344; darn=lists.infradead.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hCG240uyu7IaStQRBzpdx6Bi4blsOXfj2w9Nj9spZjc=;
        b=PNJ1FOOf5WA+GL7t3/NOKIOFu1PqdzKtSZ01KlM+cNSWN+ZJPtwHaV5BjWPrNvfMZO
         /CmCvPLKLiMS8sCVuqWbu1RBge2WrKNON00/TgfURgpsA/fsxqAdgsxZ2JFdhTfreqQV
         zpD2zgviPgh/Aw0WH5PyQBZ7KEdg4pNBMYq6ZUlwyzJhDn77sNP7UrD9dk/qtuLV5Rxd
         7Rnh1eD+62bVAMUtDcgoaskAozcM2RcyhhXZwafnjIcrLxr3DbX20yYequtTD/rR+x70
         sGTAzwu9/sVda1alT9iqXn8tOCC0mK5pRRdvAcx15qEiKz/gwxfk5wuSjill1nKMLF9B
         OztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768917544; x=1769522344;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hCG240uyu7IaStQRBzpdx6Bi4blsOXfj2w9Nj9spZjc=;
        b=srHJiV3+P4yRrZk7RGDCh7J9RfxBLtNnnGXMRC1+CXa8PFoqqRFeCha3YPbNh2jCVr
         NvxNitCGStR2oo7W295CNwSOjjFUvJHS2qUzt3C2Uz55qaGGmZPByjJLmayFynFWmMuz
         0fq4sk8TcUqxSVJjA3q6FTJu9eOGdaxUbuSRknfu8S0lKPpX+nVLwbnLgW/SlY9ScO8p
         XKFZMn3a41sWVhgkMmY+JGs5AlJTjLII2aJt68dIulv2JAcb/P62mZV4O1m4wCUfQ77W
         HJQWgRLE5ioN+xm+01u7RH4/DMn4mf/uEbikWqWa+itmy+XrMXNGXrcnJ93ij7pkeEHB
         1Cmw==
X-Forwarded-Encrypted: i=1; AJvYcCVZN11a79svOc5vb2lNr4UzAbmRhhHWMzSKKgd2z7j/B3vBNcOR4rByH+6BxW17ijt+/NeVKF8e@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ/XQJanZRvCMj7+Z2O7Mrh3u9k7uFBlhXs72HvYeA+5Fm+W6Y
	DpWvffqxD4MhTHwQTJPBhM5Uq1wnDL1+aYu7WMhrJewLge/Jojf/xwi/p4LBHL8bwmD8D+mpyca
	GElyEZexT0XMF8qXSt8ah+GGiBK2Bst0jHLyjJc2iF/x7vz/2DE4QcJmezdgS/tz6yw==
X-Gm-Gg: AY/fxX7GzamiXYla7Nfdi1WElF9PPOk7Ovt9iRuN/DcS0gJj2kxMmMkroNtqO4RJ8sY
	dh1b9irUkH4kTHUn5naoMn81ou4AeZ0TRzThjcDmtkxyYzOhsCZaJ4H+JnIph/kjuSceroQ1s7J
	0o8BGKduEFXOtNSZmNnnkO1Qfx8ywTvIc4SGP8Wv0QhH1VMrJguaJYBbhcgQmqYqA9bfuDlddYl
	3O/RccbZNPhT9/D3j1BxKJ5JLUdiA4MEeUlHmpwPvSImHjA/zLpa1y38WmRcPx4vcfAOqOPaUux
	+5ullDUVfbY42/k6aSADWQRbkt0ddwAJtVltUanvH9leMQrNsEYxHSTv0YCQTdwiW5Pgd0ndiIZ
	5glLmse4G4EY7d4zy3W1Kczcu8UvQNebH9pO/GAk5Q5OnV9ez
X-Received: by 2002:a05:620a:4454:b0:8be:9218:4c62 with SMTP id af79cd13be357-8c589b85a7amr2477302385a.4.1768917543572;
        Tue, 20 Jan 2026 05:59:03 -0800 (PST)
X-Received: by 2002:a05:620a:4454:b0:8be:9218:4c62 with SMTP id af79cd13be357-8c589b85a7amr2477298585a.4.1768917542870;
        Tue, 20 Jan 2026 05:59:02 -0800 (PST)
Received: from localhost (ip-86-49-253-11.bb.vodafone.cz. [86.49.253.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959c9fbbsm1441583366b.38.2026.01.20.05.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 05:59:02 -0800 (PST)
Mime-Version: 1.0
Date: Tue, 20 Jan 2026 13:59:00 +0000
Message-Id: <DFTGXNRIH3T0.3134F4Q1EKSX8@oss.qualcomm.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
Subject: Re: [PATCH] lib: sbi_pmu: Add FW counter index validation when
 reading high bits on RV64
Cc: <andrew.jones@linux.dev>, <atishp@rivosinc.com>,
        "opensbi"
 <opensbi-bounces@lists.infradead.org>
To: "James R T" <jamestiotio@gmail.com>, <opensbi@lists.infradead.org>
References: <20260117125031.56031-1-jamestiotio@gmail.com>
 <DFSJPWHEF293.2Z6H79QH3IDXR@oss.qualcomm.com>
 <CAA_Li+u6p1WSwYEW_EVyfQYrZ+yvFjdHbHZh8=wuJVAkuKfy6Q@mail.gmail.com>
In-Reply-To: <CAA_Li+u6p1WSwYEW_EVyfQYrZ+yvFjdHbHZh8=wuJVAkuKfy6Q@mail.gmail.com>
X-Proofpoint-GUID: LkwozZDq519y_RBXfcvItHY32X_XUvd3
X-Authority-Analysis: v=2.4 cv=Q43fIo2a c=1 sm=1 tr=0 ts=696f8a28 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=HFCiZzTCIv7qJCpyeE1rag==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=42jCdXldD8llITY2SzcA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: LkwozZDq519y_RBXfcvItHY32X_XUvd3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDExNSBTYWx0ZWRfX6j7RzNvmECmk
 ysxWSCodxUl5JTH2Be1c8C/zGO6rWjNFJ4bqSsmgzgxVnyoqqHoAsSlPGWpEeTLxePBnyZeSahc
 KiNgt6XYfqcHjPJOmDCIjGR8etsFP+YFociWwQ8eSJC7QM0rwQAkYuk1Nn+FEyMNxhKrfvQH2R8
 LSOm+VWqJSCthSni/ZOZIAYT9xnzbZZV47ix41IKu6WiDxB4ZYtw4gPoEqMwcSFtZC9yKwJ7XKp
 H9Q4Lv52GQLR4XWnPYIjaB5ni5AgWRAPE0v9TSVk7IRKyeH50FMETMDou69yWbq56Kg0f3eOp3+
 pkV5wrwp8mk1yOZOPAL2R+rZmM5Q8mLxB/G2i14HMcaqCoBTWqUgzh4AmF/EJzZuQu15ZI/5XCO
 cICoRvadbZDoRK33eF9ys19QW7wdwofYE6wwnQnMTsDD7jj+tZcBnLeqwZ2Z+msd7LWLcrYlp57
 SuU39AsW1NKxgDagvzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_03,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_055906_163231_664B6F5E 
X-CRM114-Status: GOOD (  28.80  )
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

MjAyNi0wMS0yMFQwMTozMjo1NCswODowMCwgSmFtZXMgUiBUIDxqYW1lc3Rpb3Rpb0BnbWFpbC5j
b20+Ogo+IE9uIE1vbiwgSmFuIDE5LCAyMDI2IGF0IDc6NTfigK9QTSBSYWRpbSBLcsSNbcOhxZkK
PiA8cmFkaW0ua3JjbWFyQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Pgo+PiAyMDI2LTAxLTE3
VDIwOjUwOjMxKzA4OjAwLCBKYW1lcyBSYXBoYWVsIFRpb3ZhbGVuIDxqYW1lc3Rpb3Rpb0BnbWFp
bC5jb20+Ogo+PiA+IEN1cnJlbnRseSwgd2hlbiB3ZSBhdHRlbXB0IHRvIHJlYWQgdGhlIHVwcGVy
IDMyIGJpdHMgb2YgYSBmaXJtd2FyZQo+PiA+IGNvdW50ZXIgb24gUlY2NCBvciBoaWdoZXIsIHdl
IGp1c3Qgc2V0IGBzYmlyZXQudmFsdWVgIHRvIDAgd2l0aG91dAo+PiA+IHZhbGlkYXRpbmcgdGhl
IGNvdW50ZXIgaW5kZXguIFRoZSBTQkkgc3BlY2lmaWNhdGlvbiByZXF1aXJlcyB1cyB0byBzZXQK
Pj4gPiBgc2JpcmV0LmVycm9yYCB0byBgU0JJX0VSUl9JTlZBTElEX1BBUkFNYCBpZiB0aGUgY291
bnRlciBpbmRleCBwb2ludHMgdG8KPj4gPiBhIGhhcmR3YXJlIGNvdW50ZXIgb3IgYW4gaW52YWxp
ZCBjb3VudGVyLiBBZGQgYSB2YWxpZGF0aW9uIGNoZWNrIHRvCj4+ID4gZW5zdXJlIGNvbXBsaWFu
Y2Ugd2l0aCB0aGUgc3BlY2lmaWNhdGlvbiBvbiBSVjY0IG9yIGhpZ2hlci4KPj4gPgo+PiA+IEZp
eGVzOiA1MTk1MWQ5ZTlhZjggKCJsaWI6IHNiaV9wbXU6IEltcGxlbWVudCBzYmlfcG11X2NvdW50
ZXJfZndfcmVhZF9oaSIpCj4+ID4gU2lnbmVkLW9mZi1ieTogSmFtZXMgUmFwaGFlbCBUaW92YWxl
biA8amFtZXN0aW90aW9AZ21haWwuY29tPgo+PiA+IC0tLQo+Pgo+PiBXaGlsZSB0aGUgY2FsbCBp
cyBwb29ybHkgc3BlY2lmaWVkIGFuZCB5b3VyIGludGVycHJldGF0aW9uIGlzIHZhbGlkLAo+PiBJ
IHRoaW5rIHRoZSBpbnRlbnRpb24gaXMgdG8gbWFrZSB0aGlzIGZ1bmN0aW9uIGRvIG5vdGhpbmcg
ZWxzZSB0aGFuCj4+IHJldHVybiB7ZXJyLCAwfSBvbiBSVjY0IGFzIHRoZXJlIGlzbid0IG11Y2gg
cmVhc29uIHRvIGNvbXBsaWNhdGUgdGhlCj4+IGltcGxlbWVudGF0aW9uLgo+Pgo+Cj4gSSBkaXNj
b3ZlcmVkIHRoaXMgd2hlbiBJIHdhcyB3cml0aW5nIHNvbWUgUE1VIFNCSSB0ZXN0cyBmb3IKPiBL
Vk0tVW5pdC1UZXN0cyBhbmQsIGF0IGxlYXN0IHRvIG1lLCBpdCB3YXMgdW5leHBlY3RlZC4gSSB1
bmRlcnN0YW5kCj4gdGhlIGludGVudGlvbiBiZWhpbmQgaW1wbGVtZW50aW5nIGl0IGluIHRoZSBz
aW1wbGVzdCB3YXkgcG9zc2libGUsIGJ1dAo+IGl0IGRpZCBzZWVtIHRvIGRldmlhdGUgZnJvbSB0
aGUgc3BlY2lmaWNhdGlvbiwgYXQgbGVhc3Qgd2l0aCBteSB3YXkgb2YKPiByZWFkaW5nIGl0LgoK
SWYgeW91IGNhbiBhcmd1ZSB0aGF0IHRoZSBjdXJyZW50IGJlaGF2aW9yIGlzIGFnYWluc3QgdGhl
IHNwZWNpZmljYXRpb24sCnRoZW4gd2Ugb2J2aW91c2x5IHNob3VsZCBmaXggaXQsIGJ1dCBJIGNh
bm5vdCBmaW5kIGFueSBncm91bmQgZm9yIGl0LgoKU2ltaWxhcmx5LCBJIGNhbm5vdCBmaW5kIGFu
eXRoaW5nIHdyb25nIHdpdGggeW91ciBsb2dpYywgYnV0IGl0IHRvb2sgYQp3aGlsZSAtLSBhdCBm
aXJzdCwgSSBkaWRuJ3QgdGhpbmsgdGhhdCB3ZSBjYW4gYXBwbHkgdGhlIFNCSSBjbGF1c2UgdGhh
dAphbGxvd3MgZXhjZXB0aW9uYWwgZnVuY3Rpb25zIHRvIHJldHVybiBzcGVjaWZpZWQgdmFsdWUg
YWxvbmcgYW4gZXJyb3IKY29kZS4KClRoZSBmdW4gd2l0aCBpbmZvcm1hbCBzcGVjaWZpY2F0aW9u
cyBpcyB0aGF0IGFsbCB2YWxpZCBpbnRlcnByZXRhdGlvbnMKYXJlIGNvcnJlY3QsIGV2ZW4gaWYg
bm90IGV4cGVjdGVkIG5vciBpbnRlbmRlZC4KClNpbmNlIHRoZSBleHBsaWNpdGx5IHJldHVybmVk
IHZhbHVlIG9mIDAgaXMgbWVhbmluZ2xlc3MsIGFuZCBub3QgcmVsYXRlZAp0byBhbnkgY291bnRl
cl9pZHgsIHdlIGRvIGhhdmUgYSBsb3Qgb2YgZnJlZWRvbS4KSSBqdXN0IHByZWZlciB0aGUgY3Vy
cmVudCBpbXBsZW1lbnRhdGlvbi4KCj4+IEkgdGhpbmsgYWx3YXlzIHJldHVybmluZyB7U0JJX0VJ
TlZBTCwgMH0gd291bGQgYmUgZXZlbiBiZXR0ZXIgdGhhbgo+PiB0aGUgY3VycmVudCB7U0JJX1NV
Q0NFU1MsIDB9LCBidXQgaXQgZG9lc24ndCBtYXR0ZXIgbXVjaCBzaW5jZQo+PiBsZWdpdGltYXRl
IFJWNjQgc29mdHdhcmUgc2hvdWxkbid0IGV2ZXIgaW52b2tlIHRoZSBlY2FsbC4KPj4KPgo+IElm
IGl0IGlzIGJldHRlciB0byByZXR1cm4ge1NCSV9FSU5WQUwsIDB9LCB0aGVuIGxldCdzIGRvIGl0
LiBUaGF0Cj4gc2FpZCwgSSB0aGluayB3ZSBzaG91bGQgb25seSByZXR1cm4gdGhhdCBvbiBhbiBp
bnZhbGlkIGNvdW50ZXIgaW5kZXgsCj4gbm90IGFsd2F5cy4KCkkgYWdyZWUgd2l0aCB5b3UgdGhh
dCBhbHdheXMgcmV0dXJuaW5nIFNCSV9FSU5WQUwgaXMgZGVmaW5pdGVseSBub3QgdGhlCmV4cGVj
dGVkIHJlYWRpbmcgb2YgdGhlIHNwZWNpZmljYXRpb24uCkkgd291bGRuJ3QgY2hhbmdlIGl0IHRv
IGFsd2F5cyBTQklfRUlOVkFMIGVpdGhlciBhcyBzb21lb25lIG1pZ2h0IGRlcGVuZApvbiB0aGUg
Y3VycmVudCBiZWhhdmlvciwgYW5kIEkgZG9uJ3QgdGhpbmsgdGhlIGJlbmVmaXQgaXMgd29ydGgg
dGhlIHJpc2sKb2YgYnJlYWthZ2UuCgpUaGFua3MuCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QK
b3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
