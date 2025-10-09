Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1326ACCD185
	for <opensbi@archiver.kernel.org>; Thu,  9 Oct 2025 01:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t9rYJhazT3NObFtYfpe1oJfOtCUcyhJu2+pGaXdCJqQ=; b=It7SxPWcqw5uRw
	rLho0hi05LPVR6N6R1+3O4WUFFXQBbv6BBWKh5pFZf3TYpai7vdaVFugHvD5X9Wscot9OzrmXA0Ym
	9Qf5hhYM9sSr8ZYBS5CHhA5bXuoEFYiMdXiB0zJqx1qdc4yUhbufFA75tSwthL0eB5kl3BK2IHC1V
	hFSYJmUe/IYNzspcTd9C5jiMR/3AEnoVvI/JhNNisRqtfBty1w+6CXkN4OR/yOxloZEjlETeb7c5c
	CtVmPKMy0oQnFvJquLE9qAWc36j8CDK/NaDISe8AKLUV5NEkV9GNLEiwJf0TkLbJ+RRCGiSXdukma
	4rORF0nJO0qUEqSU80Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6f88-00000004vAI-30jJ;
	Thu, 09 Oct 2025 01:07:40 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6f83-00000004uSP-3wHL
	for opensbi@lists.infradead.org;
	Thu, 09 Oct 2025 01:07:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1759972030;
	bh=Tr5R3QOM5wd2gAbQA4YEF2sJbJmeI01S+ZvpGK7FQ4Q=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=ODEFZm+qvxXUeKE7KfpjHJc9D2sNeXvBkh68uFUqOgE1J8eWeU6604LyQRqPP+Iwf
	 edprgcGtOG31R+W+McRDvlXbE/HUSIpTykOd6PtG1vQ2U2qehyUiU+ySruZ34TZXNf
	 NbWjr9g05sWafEjwyX89z38DDwDB9PbPGHQBJcPY=
X-QQ-mid: zesmtpsz2t1759972028tdc1787a8
X-QQ-Originating-IP: CKFJJ5NZ/wpGTEegVl1r7fQ45kppNsj0Y+yEfojQUB4=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 09 Oct 2025 09:07:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6529156234175016177
EX-QQ-RecipientCnt: 4
Date: Thu, 9 Oct 2025 09:07:06 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: =?utf-8?B?5pyx6LSk5b2s?= <xianbin.zhu@linux.spacemit.com>,
	Xiang W <wxjstz@126.com>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	opensbi <opensbi@lists.infradead.org>
Subject: Re: =?utf-8?B?5Zue5aSN77yaUmU=?= =?utf-8?Q?=3A?= [PATCH v3 1/3]
 platform: generic: spacemit: add K1
Message-ID: <15169E392597D319+aOcKujCl8mz4XK4L@kernel.org>
References: <tencent_6CDA0C40375DBE3206FFF664@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_6CDA0C40375DBE3206FFF664@qq.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MXHph1aUIgaby/g1c/WU3CaD0RgUaka1cTOlVeMUPMgiHCQpjKDP8A5K
	vVHG+1wvsAlx886f+6bSgim+H9RHjnTuMan0YNHCzJNySQq3u73URdDXlmGJ7P33KIiuiNN
	iKC2bF2IIm0J5Yv0jXFIERfWQgaYmqkvZ1IGpPxxPDETK1xFVr/dSyd4zVbTQoEGYZo9+w9
	Yn7Ee7dt8uoCAzt4dLiTSCaVHgoDtx8MXL5Yxp5RIdkQWUMaCOhl6Oc7EpUJvns3ifPq4XL
	Q0HLyyDybd0PKphOmEq1OzMzvivp1kN9/jtRYeP6ioETpRXXsH7vUxOMlRdPOUxXgTJ/X5i
	HR02ZeAZlhA8QhZbnpgpD2s09fLfQk1xPkfhoarNHgPSM2/+Rn9+libYlghiI/j0mM7qymy
	rU5BKo6Mc9xMPwoj1BKOk82rXmFT7G5o+wm5HHlQvE0fiWPuZJeHCCyCm9knhX6hjaldKbP
	ca5pp04MIBSzVGuQ3q0MZvYMR1JBkfPCsK5ctj2lt1Qy80oSk5vx+4UJbDrSPFcqTqDTCT4
	UF+QbdowJTw3Zvj1QlFKo5wqtUZ3X2VWNBdJJf7BxR2SpX17ZhH/b4/f7CAbXchrzgT/ufz
	5LQb/o8K1UIcYPTOSsPJjPeiPtrgK0XvlyUoSMTOBcKes2xSvjaGo1zqVTpRW8WxRXhLK2C
	hl6iApoIoupYs4v6TDTG8PoqHAnxDnMqdfhRvrhhN+pzFLLFyDJ2UKRoRFHo2HjMeW8fBRq
	kjJ8WvR9eICLKfgco5FoOnqnkRV5CjYBtGGYhWqRR4z/N2N8Qd4XJpQy3lBD3F1bezhCv01
	ttirQ+kN7tZhFTBQXTQpAyjaeWJZGzdSMDhJrqihio/AWRMAqFjvqeFvNDqMh1pYdhdsoTg
	OUJTr4GVCWee9oryUryUxjTdI3UVj5OmMvO+/Q5lxFUnuCvKhwXOaX9Jv1Cep694AUc0kAn
	03LrozBjR3NGk/bW/wJpYfVNJ1nMzQoREYdsX+M9QKsIL2xCG7sLqi8PkZ1fXslvT2VUXmS
	yf+mro3xD0FgBP68U/Vgm2tzZ+r1Qmg3/qekbjLcYnD7qTPx8mlzSfWLZHBcWKh3KFJqwPy
	4de1+yot0sHCkdKwu1DrH4=
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_180736_665036_F73A5FD2 
X-CRM114-Status: GOOD (  10.98  )
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

T24gVGh1LCBPY3QgMDksIDIwMjUgYXQgMDg6NDM6MjlBTSArMDgwMCwg5pyx6LSk5b2sIHdyb3Rl
Ogo+IEhpIFhpYW5nIFcKPiDigIPigIMKPiBPbmx5IHRoZSBwcmltYXJ5IGNvcmUgd2lsbCBiZSBi
cm91Z2h0IHVwLCBzbyB3ZSBkbyBub3QgbmVlZCB0byBpbXBsZW1lbnQKPiAKPiBjb2xkX2Jvb3Rf
YWxsb3dlZC4gVGhlIENTUiBvcGVyYXRpb24gaGVyZSBjYW4gYmUgbW92ZWQgdG8gbmFzY2VudF9p
bml0Cj4gCj4gCj4gRnJvbSBvdXIgcGxhdGZvcm0sIHRoZSBuYXNjZW50X2luaXQgY2Fubid0IGJl
IGNhbGxlZCBmcm9tJm5ic3A7Z2VuZXJpY19uYXNjZW50X2luaXQKPiAKPiAKPiAgICAgICAgICAg
ICAgICAgICAgIFhpYW5nIFc8d3hqc3R6QDEyNi5jb20mZ3Q7Jm5ic3A75ZyoIDIwMjXlubQ55pyI
Mjbml6Ug5ZGo5LqUIDE1OjE3IOWGmemBk++8mgo+IAo+ICZndDsgK3N0YXRpYyBpbnQgc3BhY2Vt
aXRfazFfZmluYWxfaW5pdChib29sIGNvbGRfYm9vdCkKPiAmZ3Q7ICt7Cj4gJmd0OyArCXJldHVy
biBnZW5lcmljX2ZpbmFsX2luaXQoY29sZF9ib290KTsKPiAmZ3Q7ICt9Cj4gJmd0OyArCj4gJmd0
OyArc3RhdGljIGJvb2wgc3BhY2VtaXRfY29sZF9ib290X2FsbG93ZWQodTMyIGhhcnRpZCkKPiAm
Z3Q7ICt7Cj4gJmd0OyArCWNzcl9zZXQoQ1NSX01MMlNFVFVQLCAxIDw8IChoYXJ0aWQgJSBQTEFU
Rk9STV9NQVhfQ1BVU19QRVJfQ0xVU1RFUikpOwo+ICZndDsgKwo+ICZndDsgKwlyZXR1cm4gIWhh
cnRpZDsKPiAmZ3Q7ICt9Cj4gT25seSB0aGUgcHJpbWFyeSBjb3JlIHdpbGwgYmUgYnJvdWdodCB1
cCwgc28gd2UgZG8gbm90IG5lZWQgdG8gaW1wbGVtZW50IAo+IGNvbGRfYm9vdF9hbGxvd2VkLiBU
aGUgQ1NSIG9wZXJhdGlvbiBoZXJlIGNhbiBiZSBtb3ZlZCB0byBuYXNjZW50X2luaXQKPiAKPiBS
ZWdhcmRzLAo+IFhpYW5nIFcKU2luY2UgWGlhbmJpbiBzZW50IGEgd3Jvbmcgc3R5bGUgZW1haWws
IHNvIEkgY2xhcmZ5IGl0IGhlcmU6CgoiRnJvbSBvdXIgcGxhdGZvcm0sIHRoZSBuYXNjZW50X2lu
aXQgY2Fubid0IGJlIGNhbGxlZCBmcm9tIGdlbmVyaWNfbmFzY2VudF9pbml0IgoKVGhhbmtzLAoK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0gVHJveQoKPiAmZ3Q7ICsKPiAmZ3Q7
ICtzdGF0aWMgaW50IHNwYWNlbWl0X2sxX3BsYXRmb3JtX2luaXQoY29uc3Qgdm9pZCAqZmR0LCBp
bnQgbm9kZW9mZiwKPiAmZ3Q7ICsJCQkJJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGNvbnN0IHN0
cnVjdCBmZHRfbWF0Y2ggKm1hdGNoKQo+ICZndDsgK3sKPiAmZ3Q7ICsJZ2VuZXJpY19wbGF0Zm9y
bV9vcHMuZWFybHlfaW5pdCA9IHNwYWNlbWl0X2sxX2Vhcmx5X2luaXQ7Cj4gJmd0OyArCWdlbmVy
aWNfcGxhdGZvcm1fb3BzLmZpbmFsX2luaXQgPSBzcGFjZW1pdF9rMV9maW5hbF9pbml0Owo+ICZn
dDsgKwlnZW5lcmljX3BsYXRmb3JtX29wcy5jb2xkX2Jvb3RfYWxsb3dlZCA9IHNwYWNlbWl0X2Nv
bGRfYm9vdF9hbGxvd2VkOwo+ICZndDsgKwo+ICZndDsgKwlyZXR1cm4gMDsKPiAmZ3Q7ICt9Cj4g
Jmd0OyArCj4gJmd0OyArc3RhdGljIGNvbnN0IHN0cnVjdCBmZHRfbWF0Y2ggc3BhY2VtaXRfazFf
bWF0Y2hbXSA9IHsKPiAmZ3Q7ICsJeyAuY29tcGF0aWJsZSA9ICJzcGFjZW1pdCxrMSIgfSwKPiAm
Z3Q7ICsJeyAvKiBzZW50aW5lbCAqLyB9Cj4gJmd0OyArfTsKPiAmZ3Q7ICsKPiAmZ3Q7ICtjb25z
dCBzdHJ1Y3QgZmR0X2RyaXZlciBzcGFjZW1pdF9rMSA9IHsKPiAmZ3Q7ICsJLm1hdGNoX3RhYmxl
ID0gc3BhY2VtaXRfazFfbWF0Y2gsCj4gJmd0OyArCS5pbml0ID0gc3BhY2VtaXRfazFfcGxhdGZv
cm1faW5pdCwKPiAmZ3Q7ICt9Owo+ICZndDsgCj4gJmd0OyAtLSAKPiAmZ3Q7IDIuNTEuMAo+ICZn
dDsKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
