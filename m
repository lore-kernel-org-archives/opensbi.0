Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B08ECCD185
	for <opensbi@archiver.kernel.org>; Thu,  9 Oct 2025 12:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t83mXsBxT2t+JwvulYf1Ty1gvjUwsJSPWevtlmsSbt4=; b=D2KIsTEAuwswER
	z/xuwJq4/hwEOUtc6lXcpwxcxPsKm51neib3V8ykNwfpivljPU4hoM2/JNvP49SJmp/EJUTtgwfkb
	3JYAlbwK6vBAzt5a2b6+dVeG/sGrrbv5ITG3/+zb9JZ/bIVDCLNJHSXWZXu5+TOPlABJIfjXI2u+N
	ihI8bl/rNPT3mjUArQtuI+FuPTyNt3pqqDieB2xf6aKVei+wUCabXwnX9lbL/NTa0GpYBmsoBQG11
	e3HgKOfTiRNdseKtkT3XknqxX26zLyf7djsiChSebHSROhZ6Wr62z03d0sAYHRnLfxAHeda33o6uB
	jNYUyWmssNKFiXAFUDRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6piS-000000065RF-3oGZ;
	Thu, 09 Oct 2025 12:25:52 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6piQ-000000065QJ-0mU8
	for opensbi@lists.infradead.org;
	Thu, 09 Oct 2025 12:25:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=pKEQVldbGODtBMcRqrhFGpYg9ONwpOeMmehwMbUgLlI=;
	b=PpxmqHYlKhCef+tYIWeWN0J3gitCZXz1wbFYqOUHSEEnMrJhMJEF/Y1EA1JFxY
	VGgJTZcE1gVOV/JDJyz1mupZjmHLrtaE5jhSeZI/WIkKgfXCkPQJ3FF5Lj7EL4YO
	B6YSGKCqCMcM9TyH1tCXw3OTnfTbwqWzUhCasG0t167g4=
Received: from [IPV6:240e:38d:8311:d200:5af6:a9f0:accb:2e3f] (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgAXrcjDqedoZY2qBg--.49774S2;
	Thu, 09 Oct 2025 20:25:39 +0800 (CST)
Message-ID: <4b6afa21-f68e-4341-afed-e5d52beab77b@163.com>
Date: Thu, 9 Oct 2025 20:25:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] include: sbi: Lift the maximum harts to 1024
To: Anup Patel <anup@brainfault.org>, wu.fei9@sanechips.com.cn
Cc: opensbi@lists.infradead.org
References: <20250806084123476SCLxg-qQRa8CRuhuY-dwE@zte.com.cn>
 <202508060106.57616maD072614@mse-db.zte.com.cn>
 <CAAhSdy2N0FQ4+3PR8ksYvi0CMc3m3Rt2Bsv+ABWWcXdWSMtXeQ@mail.gmail.com>
Content-Language: en-US
From: Wu Fei <atwufei@163.com>
In-Reply-To: <CAAhSdy2N0FQ4+3PR8ksYvi0CMc3m3Rt2Bsv+ABWWcXdWSMtXeQ@mail.gmail.com>
X-CM-TRANSID: QCgvCgAXrcjDqedoZY2qBg--.49774S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jry7JF15WFWxKF1DXFW5ZFb_yoWkKrg_Aw
	nxAws2krs7ZrWftr4fKaykCr4Y9395G3yvqF4kAr4DGw4qywn5G3WkKr1fCFZ8Ww1kJrs3
	Cr1FqrySkF13CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUU2YLJUUUUU==
X-Originating-IP: [240e:38d:8311:d200:5af6:a9f0:accb:2e3f]
X-CM-SenderInfo: pdwz3wlhl6il2tof0z/1tbiERrhoWjnpEKzUQAAsA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_052550_700213_7C1B14D5 
X-CRM114-Status: GOOD (  13.20  )
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

Ck9uIDkvMzAvMjUgMTk6MzYsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gT24gV2VkLCBBdWcgNiwgMjAy
NSBhdCA2OjM54oCvQU0gPHd1LmZlaTlAc2FuZWNoaXBzLmNvbS5jbj4gd3JvdGU6Cj4+IEl0IGlz
IGV4cGVjdGVkIHRvIGhhdmUgcmlzY3Ygc2VydmVyIGJvYXJkcyB3aXRoIG1hbnkgY29yZXMgdmVy
eSBzb29uLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBXdSBGZWkgPHd1LmZlaTlAc2FuZWNoaXBzLmNv
bS5jbj4KPj4gLS0tCj4+ICAgaW5jbHVkZS9zYmkvc2JpX2hhcnRtYXNrLmggfCAyICstCj4+ICAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL3NiaS9zYmlfaGFydG1hc2suaCBiL2luY2x1ZGUvc2JpL3NiaV9oYXJ0
bWFzay5oCj4+IGluZGV4IDIwMGFiNmUuLjJmOTRmMzkgMTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUv
c2JpL3NiaV9oYXJ0bWFzay5oCj4+ICsrKyBiL2luY2x1ZGUvc2JpL3NiaV9oYXJ0bWFzay5oCj4+
IEBAIC0yMCw3ICsyMCw3IEBACj4+ICAgICogYWxzbyByZXByZXNlbnRzIHRoZSBtYXhpbXVtIG51
bWJlciBvZiBIQVJUIGlkcyBnZW5lcmljIE9wZW5TQkkKPj4gICAgKiBjYW4gaGFuZGxlLgo+PiAg
ICAqLwo+PiAtI2RlZmluZSBTQklfSEFSVE1BU0tfTUFYX0JJVFMgICAgICAgICAgMTI4Cj4+ICsj
ZGVmaW5lIFNCSV9IQVJUTUFTS19NQVhfQklUUyAgICAgICAgICAxMDI0Cj4gSW5zdGVhZCBvZiBt
YWtpbmcgdGhpcyA4eCwgaXQgaXMgYmV0dGVyIHRvIG1vdmUgdG8gYSBtb3JlIHJlYWxpc3RpYwo+
IG51bWJlciBsaWtlIDI1NiBvciA1MTIuIE5PID8KCgpEbyB5b3UgdGhpbmsgd2UgbmVlZCB0byBt
YWtlIHRoaXMgY29uZmlndXJhYmxlPyBJdCBzb3VuZHMgZ29vZCB0byBtYWtlIAppdCBsYXJnZXIg
aWYgaXQncyBjb25maWd1cmFibGUsCgo1MTIgaXMgbm90IGVub3VnaCBzb29uZXIgb3IgbGF0ZXIg
b24gc2VydmVycy4KCgpUaGFua3MsCgpGZWkuCgo+Cj4gUmVnYXJkcywKPiBBbnVwCj4KPj4gICAv
KiogUmVwcmVzZW50YXRpb24gb2YgaGFydG1hc2sgKi8KPj4gICBzdHJ1Y3Qgc2JpX2hhcnRtYXNr
IHsKPj4gLS0KPj4gMi40My4wCj4+Cj4+IC0tCj4+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4+IG9w
ZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNi
aUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vb3BlbnNiaQo=
