Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C735ECD5BD1
	for <opensbi@archiver.kernel.org>; Tue, 26 May 2026 03:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jCm4ySLbF8dHkVpqF398D8XKQ8GFS3/+JCE6AznNk38=; b=jPHctpgojVquE0
	2m8AKQK7hZn6SeW0zaAqTSpy2tSBHG1RQm/YmJrwfarDMfWss51R1rHTdGdHb5MEt/4MyYar+rdub
	MVlo4Vk22HvgloFo7BMlg9g5N/12pc0vv8k+sAwvfMqDm+go0bP4VRae1LReVuUDkdf9L0/12/A16
	cqOWeXpdzEICjRsONK8biVayD+s29HT8xSF7WL90iMfnhdWYS8q//jiH0wbg3m0MVjhl3cf7WjN7v
	KKVz03OwTpt53+42CJdosGfrHQiVbli27fQbpvCbB6eJxGSnlYhn23yCZJc1zYH0RW0mXwdtfvTKm
	yrwKEvGdAtarZsZ7RPSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRiR8-00000000vz4-0rCZ;
	Tue, 26 May 2026 03:26:34 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRiR5-00000000vyI-035C
	for opensbi@lists.infradead.org;
	Tue, 26 May 2026 03:26:32 +0000
Received: from [10.213.6.37] (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowABXa9LjEhVqithjEg--.3975S2;
	Tue, 26 May 2026 11:26:27 +0800 (CST)
Message-ID: <1b2d686f-9be6-4e28-9ed2-f89dfd72a148@iscas.ac.cn>
Date: Tue, 26 May 2026 11:26:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] include: sbi_platform: Increase default stack size
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: opensbi@lists.infradead.org, Michael Ellerman <mpe@kernel.org>,
 Bo Gan <ganboing@gmail.com>
References: <edbce78c-71a7-41d7-aa81-3fa57241644a@iscas.ac.cn>
 <CAEev2e-MU3Gz3Ag5RV9YDQo+XqxS6Jrw0X+m83stqCLAqVr99A@mail.gmail.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <CAEev2e-MU3Gz3Ag5RV9YDQo+XqxS6Jrw0X+m83stqCLAqVr99A@mail.gmail.com>
X-CM-TRANSID: rQCowABXa9LjEhVqithjEg--.3975S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KrW5WryDZw48uw45JFykGrg_yoW8GFW7pF
	4xJFnrKFWDtFy7Xan3C3Wjqa48G34q9Fy3WwsYqayrua98ZF90vrZIgr43WF1DCr1kKFW7
	Awn3Z340qFyqy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyYb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxC20s02
	6xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
	I_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
	6r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj4
	0_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8
	JbIYCTnIWIevJa73UjIFyTuYvjxUcksgUUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_202631_419668_1F86D7A2 
X-CRM114-Status: GOOD (  10.99  )
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

T24gNS8yNS8yNiAyMToyMywgQW5pcnVkaCBTcmluaXZhc2FuIHdyb3RlOgo+IEhpIFZpdmlhbiwK
Pgo+IE9uIFN1biwgTWF5IDI0LCAyMDI2IGF0IDEyOjUz4oCvQU0gVml2aWFuIFdhbmcgPHdhbmdy
dWlrYW5nQGlzY2FzLmFjLmNuPiB3cm90ZToKPj4gc2JpX21pc2FsaWduZWRfdl9sZF9lbXVsYXRv
cigpIGhhcyBhIGxvY2FsIGJ1ZmZlciAobmFtZWx5IG1hc2spIHdoaWNoIGlzCj4+IDgxOTIgYnl0
ZXMgaW4gc2l6ZSwgc28gdGhlIGRlZmF1bHQgc3RhY2sgc2l6ZSBpcyBub3QgZW5vdWdoLiBEb3Vi
bGUgaXQKPj4gdG8gMTYzODQuCj4+Cj4+IFRoaXMgc3RhY2sgb3ZlcmZsb3cgY2FuIGJlIG9ic2Vy
dmVkIGJ5IGFueSBTLW1vZGUgc29mdHdhcmUgYW5kIGxlYWRzIHRvCj4+IE0tbW9kZSBjcmFzaCBv
ciB1bmV4cGVjdGVkIGJlaGF2aW9yLCBhcyBsb25nIGFzIHRoZSBTLW1vZGUgc29mdHdhcmUgZG9l
cwo+PiBub3QgZW5hYmxlIEZXRlQgbWlzYWxpZ25lZCBkZWxlZ2F0aW9uIFsxXS4gVGhpcyBtYXkg
YmUgY29uc2lkZXJlZCBhCj4+IHRlbXBvcmFyeSBmaXggdW50aWwgZnVydGhlciBmaXhlcyBhcmUg
bWFkZSB0byBtaXNhbGlnbmVkIGhhbmRsaW5nIFsyXS4KPj4KPj4gTGluazogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGludXgtcmlzY3YvbnJ2dDc0cW5vamF1Yml3am8zN3VtczRsbmNsdTQ2Nmhv
dndyaG10YmFnNmY1dWhycWxAcTZtc29lMm90bzRiICMgWzFdCj4+IExpbms6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL29wZW5zYmkvMjAyNjAyMTAwOTQwNDQuNzI1OTEtMS1nYW5ib2luZ0BnbWFp
bC5jb20gIyBbMl0KPj4gU2lnbmVkLW9mZi1ieTogVml2aWFuIFdhbmcgPHdhbmdydWlrYW5nQGlz
Y2FzLmFjLmNuPgo+IFRoZXJlIHdhcyBhIHNpbWlsYXIgcGF0Y2ggWzFdIGZyb20gZmV3IGRheXMg
YWdvIHRoYXQgbWFrZXMgdGhpcyBhCj4gS2NvbmZpZyBvcHRpb24uIEVpdGhlciBvcHRpb24gd291
bGQgd29yayB0byBmaXggdGhlIGJ1ZyBJIGVuY291bnRlcmVkLgoKQWgsIG9vcHMsIEkgZGVmaW5p
dGVseSBtaXNzZWQgdGhhdC4gVGhhbmtzIGZvciB0aGUgcG9pbnRlci4KCj4gV29uZGVyaW5nIHdo
YXQgdGhlIG1haW50YWluZXJzIHRoaW5rIGFib3V0IGhvdyB0byBwcm9jZWVkIHdpdGggdGhpcy4K
Pgo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9vcGVuc2JpL1ZJMFAxOTJNQjMwNjI3MzVB
NjE5NEJCNkRBNzIwODM0OTlFMDAyQFZJMFAxOTJNQjMwNjIuRVVSUDE5Mi5QUk9ELk9VVExPT0su
Q09NL1QvI3UKCkkgd291bGQgYXBwcmVjaWF0ZSBndWlkYW5jZSBmcm9tIHRoZSBtYWludGFpbmVy
cyBvbiB0aGlzIGFzIHdlbGwuCgpUaGFua3MsClZpdmlhbiAiZHJhbWZvcmV2ZXIiIFdhbmcKCgot
LSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
