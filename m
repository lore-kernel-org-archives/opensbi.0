Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10251C88E40
	for <opensbi@archiver.kernel.org>; Fri, 11 Sep 2026 01:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RbiqE3uJF4boGcHAhxinPH8XzzxbsyYV3jsvxf2eQmk=; b=OuvNoq4W0Czwve
	TswKMUI3HMs0ePHmIXVz8N8Efey5EefdElOrcZh+2PqhZIdTyX6zMLGfKHXmrNvDGfRIlVzWrK5pe
	VgotPNNphFGUKTJ90dwJGsZDDylgvk0BaECMDfbnb58RQCK9xn9Mlw5AEN4HjxGVA4Ty+NRbNg2cH
	MfcdoMfd+7YnuUx6s09KDUPUmniFbil+5tOMvl/zbPPIoy9ajBplgRpdW1lkHO7CFOhqN+qgd8rqS
	PbHvJteTMUC6z4620Vap6+soNvKyPeFSs4z20ugjP7bL59TDlIDrXewjdrMMoFgHP1UBcG8p9y7BU
	gMPBk9AkgSPrisiyvSdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4qYD-0000000FgCY-0m1L;
	Fri, 11 Sep 2026 01:59:37 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4qY9-0000000FgBU-2kpf
	for opensbi@lists.infradead.org;
	Fri, 11 Sep 2026 01:59:36 +0000
Received: from f3f1baf57000.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowABXLPCAYKNqRPukBw--.46671S2;
	Fri, 11 Sep 2026 09:59:29 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: pengpeng@iscas.ac.cn,
	himanshu.chauhan@oss.qualcomm.com,
	liutong <liutong@iscas.ac.cn>
Subject: Re: [PATCH] lib: sbi: dbtr: validate complete shared memory range
Date: Fri, 11 Sep 2026 01:59:19 +0000
Message-Id: <20260911015919.79296-1-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260827115833.50735-1-pengpeng@iscas.ac.cn>
References: <20260827115833.50735-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowABXLPCAYKNqRPukBw--.46671S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uw17WF4UCF4kAr1rCr45Wrg_yoW8Ary3pF
	WkXFyxJr1qqryxtr9agrn5XFWrCr4Sqry8t3s8WFnYyan8Zrn5Ar4Ygr1q9asayrWkKa1F
	vF45GFZrAa98AaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAK
	I48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
	67AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfU0iiSUUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_185934_071798_77790D2E 
X-CRM114-Status: UNSURE (   8.66  )
X-CRM114-Notice: Please train this message.
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

SGkgUGVuZ3BlbmcsCgpPbiBUaHUsIEF1ZyAyNywgMjAyNiBhdCAwNzo1ODozM1BNICswODAwLCBQ
ZW5ncGVuZyBIb3Ugd3JvdGU6Cj4gLQlpZiAoZG9tICYmICFzYmlfZG9tYWluX2NoZWNrX2FkZHIo
ZG9tLAo+IC0JCSAgREJUUl9TSE1FTV9NQUtFX1BIWVMoc2htZW1fcGh5c19oaSwgc2htZW1fcGh5
c19sbyksIHNtb2RlLAo+IC0JCSAgU0JJX0RPTUFJTl9SRUFEIHwgU0JJX0RPTUFJTl9XUklURSkp
Cj4gKwlzaG1lbV9hZGRyID0gREJUUl9TSE1FTV9NQUtFX1BIWVMoc2htZW1fcGh5c19oaSwgc2ht
ZW1fcGh5c19sbyk7Cj4gKwlzaG1lbV9zaXplID0gaGFydF9zdGF0ZS0+dG90YWxfdHJpZ3MgKgo+
ICsJCSAgICAgc2l6ZW9mKHVuaW9uIHNiaV9kYnRyX3NobWVtX2VudHJ5KTsKPiArCWlmIChkb20g
JiYgIXNiaV9kb21haW5fY2hlY2tfYWRkcl9yYW5nZShkb20sIHNobWVtX2FkZHIsIHNobWVtX3Np
emUsCj4gKwkJCQkJICAgICAgICBzbW9kZSwKPiArCQkJCQkgICAgICAgIFNCSV9ET01BSU5fUkVB
RCB8Cj4gKwkJCQkJICAgICAgICBTQklfRE9NQUlOX1dSSVRFKSkKPiAgCQlyZXR1cm4gU0JJX0VS
Ul9JTlZBTElEX0FERFJFU1M7CgpUaGUgcmFuZ2UgZXh0ZW5zaW9uIGxvb2tzIGNvcnJlY3QuIE9u
ZSB0aGluZyB3b3J0aCBub3Rpbmc6IEhpbWFuc2h1CnBvaW50ZWQgb3V0IG9uIG15IHYyIDMvNiwg
d2hpY2ggZml4ZWQgdGhlIHNhbWUgc2luZ2xlLWFkZHJlc3MgY2hlY2ssCnRoYXQgdGhlICJkb20g
JiYiIGd1YXJkIHNraXBzIHRoZSB2YWxpZGF0aW9uIGVudGlyZWx5IHdoZW4gZG9tIGlzCk5VTEwg
WzFdLiBUaGUgc2FtZSBhcHBsaWVzIGhlcmUg4oCUIHdpdGggZG9tID09IE5VTEwgdGhlIG5ldyBy
YW5nZQpjaGVjayBpcyBuZXZlciByZWFjaGVkLCBzbyB0aGUgc2hhcmVkIG1lbW9yeSBhZGRyZXNz
IGdvZXMKdW52YWxpZGF0ZWQuCgpzYmlfaGFydGluZGV4X3RvX2RvbWFpbigpIGNhbiByZXR1cm4g
TlVMTCB3aGVuIGRvbWFpbl9oYXJ0X3B0cl9vZmZzZXQKaGFzIG5vdCBiZWVuIHNldCBvciB3aGVu
IHRoZSBzY3JhdGNoIGFyZWEgaXMgdW5hdmFpbGFibGUuIFdoZXRoZXIgdGhhdAppcyByZWFjaGFi
bGUgYWZ0ZXIgaW5pdCBjb21wbGV0ZXMgbWF5IGRlcGVuZCBvbiBwbGF0Zm9ybSBjb25maWd1cmF0
aW9uLApidXQgc2luY2UgdGhpcyBwYXRjaCBpcyB0aWdodGVuaW5nIHRoZSBhZGRyZXNzIHZhbGlk
YXRpb24gaXQgc2VlbXMKd29ydGggY2xvc2luZyB0aGF0IGdhcCBpbiB0aGUgc2FtZSBjaGFuZ2Uu
CgpPbmUgb3B0aW9uIHdvdWxkIGJlIHRvIHJldHVybiBhbiBlcnJvciB3aGVuIGRvbSBpcyBOVUxM
IHJhdGhlciB0aGFuCnNpbGVudGx5IHNraXBwaW5nOgoKCWlmICghZG9tIHx8ICFzYmlfZG9tYWlu
X2NoZWNrX2FkZHJfcmFuZ2UoZG9tLCBzaG1lbV9hZGRyLAoJCQkJCQkgc2htZW1fc2l6ZSwgc21v
ZGUsCgkJCQkJCSBTQklfRE9NQUlOX1JFQUQgfAoJCQkJCQkgU0JJX0RPTUFJTl9XUklURSkpCgkJ
cmV0dXJuIFNCSV9FUlJfSU5WQUxJRF9BRERSRVNTOwoKVGhlIHNhbWUgImRvbSAmJiIgcGF0dGVy
biBleGlzdHMgaW4gdGhlIGlzX2Fzc2lnbmVkX2hhcnQgY2hlY2sgYSBmZXcKbGluZXMgYWJvdmUs
IHNvIGJvdGggbWF5IG5lZWQgdXBkYXRpbmcgdG9nZXRoZXIuCgpbMV0gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvb3BlbnNiaS9hcGszWkNKdjljdXBBelRMQGh1LWhpbWNoYXUtYmxyLnF1YWxjb21t
LmNvbS8KClJlZ2FyZHMsCmxpdXRvbmcKCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNi
aUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vb3BlbnNiaQo=
