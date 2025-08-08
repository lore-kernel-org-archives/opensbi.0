Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255CAC87FD2
	for <opensbi@archiver.kernel.org>; Fri,  8 Aug 2025 09:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ubk1t5PhIgcYTrR4AvOA7EZKgrvaz/kjwHQoiqFhfVM=; b=BcpH7a8UMoCeWy
	m75L4Mp2xDnccpYEL44iNiRjfombTK5sXrz5WmGfN3bHFw+2IwQHs79iUmiOdSaUoWIMJl6xNxpbk
	u5UzsOgTsvrPuWkc40ZKx89eB0Cdtpo2L/7yWAIQSM4vToUiELzHLUlMvYLOSrpt2gALoExOBUm6V
	wXINTvKiz5ASW9/vzsBoexGB778R3uCZ7AuwGcO+MVblmmhfDwB3DQPi0JNw4wmXYeWLKnme1Rqx+
	UbIoertIwNfydtm517rZNnxlrNdmxP7he0AHj+bU1y/jmUynjfqHdNCFN9NACQIwJCHYQL344j6yd
	BLFSQckhqbigfrvARUrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukJDN-00000002RKl-33zQ;
	Fri, 08 Aug 2025 09:16:41 +0000
Received: from m16.mail.126.com ([117.135.210.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukJDK-00000002RK8-2tt5
	for opensbi@lists.infradead.org;
	Fri, 08 Aug 2025 09:16:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Subject:From:To:Date:Content-Type:
	MIME-Version; bh=ulOq4IqbYrwcpEpRprRnGWrTxqE7ZRus2QzpVC2huIs=;
	b=P1/OJuqDzEEDWQEtlePdIA6QptUZoqyxa0h7GHT7wYgpilp0CxoSGeW7Tcv1cm
	aO8ZEBUgvAU+E22bWfdO4Gzh4IDw80fh+FpR/EgsgYJAdLA5ICY48yVa2QIjm54l
	WpxyETp/Wj4xKtyyZANAf65ixiTt5gZV6UYmuUeg9l7IM=
Received: from [127.0.0.1] (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wDnb3BrwJVoiflEBg--.57922S2;
	Fri, 08 Aug 2025 17:16:28 +0800 (CST)
Message-ID: <dab816b55e9dd48ae33aefe006febe02451f8b02.camel@126.com>
Subject: Re: [PATCH 2/3] platform: generic: Extra memory for housekeeping
From: Xiang W <wxjstz@126.com>
To: wu.fei9@sanechips.com.cn
Cc: opensbi@lists.infradead.org
Date: Fri, 08 Aug 2025 17:16:27 +0800
In-Reply-To: <202508071041.577AfcFt026811@mse-fl1.zte.com.cn>
References: 20250806084123476SCLxg-qQRa8CRuhuY-dwE@zte.com.cn,202508060106.57616bhq072530@mse-db.zte.com.cn,0d619f92fb64e6d36e5fa8ae64ec5cc472f9da98.camel@126.com <202508071041.577AfcFt026811@mse-fl1.zte.com.cn>
Autocrypt: addr=wxjstz@126.com; prefer-encrypt=mutual;
 keydata=mQINBGWNXNgBEADRGPJX/wgu4llF7WU3Tnt8sq+7K0l9vQF5wzKJxH9tg6W0zy7JdW1OC
 qQjns3r39y8Z/XbJ31qqRZxcI7UD8WQCi7u7BSeA6vyvxloYZ8SRZPs/PAUKW6mQ3M1i+NNULAkgY
 YqEq6bbNyI72mDt08/tNn1NUWFo+Rcf2plFjse/DW18UQAmS+1J/r1OwbwfSA1gMIrC5o1nahcFjq
 ayPF0J85YBMD/o+Rmla9thQrDqutU2bFbNHmtv1rYfDAQsDgmoxjcJJrjFWId1eNl7LNH4oCDcVbZ
 zA6AinT0tF0zTBb4J8E52MtuNASgJYoPvPW/X4utrVBIlVHuemqNf2qumkAlgSUYNpu+FhOWR8FYS
 AQSvZ7RgRr8ku+jW3rhf+o5Emz0APc94M7YFB/zePAcTfJSB2eRI9sasxo1sUTAsa2o+ZJpro4E0S
 meYrzKiOvvpe2UfFTuUDLQNS3CwVXQ/UUN5PsK/F5TTRwNF2W0a3HR3xXWj4x7RqXc4sJSqkVfj0n
 chmXhLg9uUmbtoK3rKd1fkCUPIsONZ2x12e/B8ixCRtM9xLQW15JW/FdACk5reB8a+SjclRPb+0ji
 7cmixzcpXtL928FmD9lG0R96H+ue0ef8xU13pa/RTnd6nnAPQQFVID/3i/dlb9MXqN3YwFPjwtQ5l
 30+k5ogI+oiUQARAQABtB9YaWFuZyBXIDxtZXJsZXc0bjZAb3V0bG9vay5jb20+iQJOBBMBCgA4Fi
 EE6tPXav6ZJ8F+iGWobB/uBulQ3HYFAmWNbOYCGwMFCwkIBwMFFQoJCAsFFgIDAQACHgECF4AACgk
 QbB/uBulQ3Ha7Ew/+LLf9tCp2ofcyAKBXtU+EboZ3scdhI9Yb1Tb6MD1emLcTJ8MjSuk5hjjoE5x5
 mdMwjYaz1Mmwlu6f0LhnpP1Xu7Y8HvNvNy6XED82z0PXwG/SRFhgvBiRuX28gwb6rD4QEehYwqYsS
 EWTWSt+/mzUlbJQfKC6pckhvGvjVWvoCUCumem/CcfX3pOxkWUYmFjUHNBndiVKdokM6Sl5NOeVtG
 br48Kc8+qj17imHNaxJdMv8Omo6sr28BCDaMAZBYE1sZA1dyC6tRY5favQCSKMoSomYoGLyev8q/r
 R+Yfbqh5XoW7p7fVTaQTnd0bDnsKONeMQBNddwQjlT71wrcShT9nkkkZDp/2dWHb12lapphmqeuLq
 emv1ZUqf36aW5NH3K7RTOMHYLm+usUZvwy/mxkm4MbYtr7/pcF2KUuru9qPxRq/B0j4Rg4bwPuael
 4bWfGZlscgLfb2wVH+L8M5k69zb+SEtO5t19d8HOSVmeY3WsFW+5WTc6I0b5uhTewgv5wqSoG3iD1
 Fq8MtlA3BEhOZVTJyrRlSmndnEhukD0mXxaIjj5gWrLJpH0ZkLhOn8vVR8CPfto5UEi+vMfP8lJT1
 zokR15412sMc3SkgwGWQ2zIY351Iq27W7v1tE7k6PQNGR/UmpYAm6pWlKT0Y1ys8V65A3mL30JTal
 bnLTjiC0GFhpYW5nIFcgPHd4anN0ekAxMjYuY29tPokCTgQTAQoAOBYhBOrT12r+mSfBfohlqGwf7
 gbpUNx2BQJljVzYAhsDBQsJCAcDBRUKCQgLBRYCAwEAAh4BAheAAAoJEGwf7gbpUNx2xh0QAJ0/1Y
 60LCwkcLNJRlZsE4+5FILGpn6ObQgshanPMhmhwW13rmD/Pt8lO77QJ/yYYgKOAoP9AnJ4lbC44ND
 QTWQuUNVzuPYq816lH/S8KrLBiZ+fXKjcL2Eo3PoRW8q2dEb8XqeJewPL4SRfZeb1yEprwCnxmnQm
 PmtLUYe6zS6kY09+iRuqiR4qsG0Mkp0WiV5HaYDsJvt+bQiTOMvimciL0XTHR7OGjivikLKFAYJGb
 h2plgxc9VLBdvmG3tpMRbEQj2ll3IBNuR0P0qKht4Febx1Vw7QfOFkTCJkbSTpV9Y8ORDEBIJCf7s
 +4dHo1eQxC95AMAtrGbKPHWqZHynv5ktgQBzVQq/jP6xHrtetxA+5criMR8gAFMyoC0ficxAU9S1a
 yWg2ct967vb6z1AghXZgzWmQf1yl9CXAw242sXZgROHXIdm7SU05kOxbni0HSWx1QkJy5hL/rHWQP
 9MKBbPzOxxg0Q9C8LhylaCkZ1sLrxh2BFjrD/CLy3h+MgK+QkdGf8owHSrD4U7+ZGWcN40dxrptM/
 JcLcJP+n0OcZL9aOrEbAnvhGORcOH6vlZOnOaIkU8qFFyYxbOcGz2bTRBPqZ77DQxtIgVCkPJFMr4
 rIv96dkJt+Zshyp5/38mr/ymZeGZbQI3Vx3bGHhGKOcknK5281HhhcnmfRsCevtB1YaWFuZyBXIDx
 tZXJsZXc0bjZAZ21haWwuY29tPokCTgQTAQoAOBYhBOrT12r+mSfBfohlqGwf7gbpUNx2BQJljWzJ
 AhsDBQsJCAcDBRUKCQgLBRYCAwEAAh4BAheAAAoJEGwf7gbpUNx2d8EP/R7EBjtNfIXGRV4MmEGWN
 qoG+9xcJU60aW/eMOWfabF3IBj0vnVv4IlrvksNKht077E+LlQne51ntxZtcAkhZGDkj95DvQJMEF
 itO+eLVgXYOx8v2Ua0OD0PB/lqEdHTQaxoEjDhu/IpU8aTbe/EFvUZ1O3FPaRLgLFaW23Krngnune
 rchcANDfGiF0ZpBbUwno5OkXiBvf8lzqPNowUzXnJKJfAA5cr8vPjJPXgY8GOkHBgX68NJkhIIb2u
 eBs7EH+hconWQ96srTs3UiQLgZZtKBTjq86BHKqMdlpkTngSiUoJUfzqLFfC4MU7XX9B9c0opIVcP
 Pbug8NA7YOzjvJSjXqW57kvErlfl6hrmbbXQ1+ZHIcZSFFyiyAeBfPANY5HXOkVjGlFEzgY9HIzqE
 /+bxVchzBwWn/sq2R/Mydwkjp0YVMVoxkSCjzCCL+mO9O0oI6H0Q7qRk3DG3K5PnUUXhJD1IqzTad
 O67dg5oJCDVpnsw1zXWF0JfNJ0BeoKMOI+acYmgraPMLOAc8TEIolRQEDWnEl7J5DOnOZk1DEce8P
 Jbd7InXJlybFJ4LsVY3ZQTTr9Hg268KdXtXN87Ig6UnRLvS5AhTCecBRfsaa5zd2Km4sgAyNx0YR/
 HEAt695R7SWT2HxgO/JbcRNPn5oSz7IrkYNN2F7zDHbPdQq
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-CM-TRANSID: _____wDnb3BrwJVoiflEBg--.57922S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKryUAryUtw1xJryxKr45Wrg_yoWktFg_Cr
	s7ZrW7KFs7XrsaqF45JrW8ursYkFs0qryDJrW8AFsxGa45Ars5Z397Xw1fuF9xWryxCF9F
	grnaqFW8CryYgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRMmhFDUUUUU==
X-Originating-IP: [2408:823c:b211:31b5:ce10:514f:adfc:b35f]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbiFxCjOmiVsrLRLQAAsf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_021639_092569_CBF115B8 
X-CRM114-Status: GOOD (  12.32  )
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

5ZyoIDIwMjUtMDgtMDflm5vnmoQgMTg6MTggKzA4MDDvvIx3dS5mZWk5QHNhbmVjaGlwcy5jb20u
Y27lhpnpgZPvvJoKPiA+ID4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX2hlYXAuYyBiL2xpYi9z
Ymkvc2JpX2hlYXAuYwo+ID4gPiBpbmRleCA2NDZjMmUwLi43YWEyN2IxIDEwMDY0NAo+ID4gPiAt
LS0gYS9saWIvc2JpL3NiaV9oZWFwLmMKPiA+ID4gKysrIGIvbGliL3NiaS9zYmlfaGVhcC5jCj4g
PiA+IEBAIC0yNzksMyArMjc5LDggQEAgaW50IHNiaV9oZWFwX2FsbG9jX25ldyhzdHJ1Y3Qgc2Jp
X2hlYXBfY29udHJvbCAqKmhwY3RybCkKPiA+ID4gKmhwY3RybCA9IHNiaV9jYWxsb2MoMSwgc2l6
ZW9mKHN0cnVjdCBzYmlfaGVhcF9jb250cm9sKSk7Cj4gPiA+IHJldHVybiAwOwo+ID4gPiB9Cj4g
PiA+ICsKPiA+ID4gK3Vuc2lnbmVkIGxvbmcgc2JpX2hlYXBfdG90YWxfc2l6ZSh1bnNpZ25lZCBs
b25nIHVzYWJsZV9zaXplKQo+ID4gPiArewo+ID4gPiArIHJldHVybiB1c2FibGVfc2l6ZSArIHVz
YWJsZV9zaXplIC8gKEhFQVBfSE9VU0VLRUVQSU5HX0ZBQ1RPUiAtIDEpOwo+ID4gVGhpcyBwYXRj
aCB3aWxsIGNvbmZsaWN0IHdpdGggdGhlIHBhdGNoCj4gPiBodHRwczovL3BhdGNod29yay5vemxh
YnMub3JnL3Byb2plY3Qvb3BlbnNiaS9wYXRjaC8yMDI1MDYxNzAzMjMwNi4xNDk0NTI4LTMtc2Ft
dWVsLmhvbGxhbmRAc2lmaXZlLmNvbS8uCj4gCj4gVGhhbmsgeW91IGZvciBwb2ludGluZyBpdCBv
dXQuIElzIHRoaXMgcGF0Y2ggcXVldWVkIHRvIHVwc3RyZWFtPyBXaGVyZSBjYW4gSQo+IGZpbmQg
dGhpcyBraW5kIG9mIHBhdGNoZXM/CgpUaGlzIHBhdGNoIGlzIGF3YWl0aW5nIHJldmlldy4gWW91
IGNhbiBmaW5kIHBhdGNoZXMgYXdhaXRpbmcgcmV2aWV3IGF0wqAKaHR0cHM6Ly9wYXRjaHdvcmsu
b3psYWJzLm9yZy9wcm9qZWN0L29wZW5zYmkvbGlzdC8KClJlZ2FyZHMsClhpYW5nIFcKPiAKPiA+
IElmIG1vcmUgbWVtb3J5IGlzIG5lZWRlZCwgaXQgaXMgcmVjb21tZW5kZWQgdG8gaW1wbGVtZW50
IGl0IHRocm91Z2ggb3RoZXIgbWVhbnMuCj4gCj4gWWVzLCB0aGUgaG91c2VrZWVwaW5nIG1ldGFk
YXRhIGlzIHN0aWxsIG5lZWRlZC4gTGV0IG1lIHRyeSBhbm90aGVyIHZlcnNpb24uCj4gCj4gVGhh
bmtzLAo+IEZlaS4KPiAKPiA+IFJlZ2FyZHMsCj4gPiBYaWFuZyBXCgoKLS0gCm9wZW5zYmkgbWFp
bGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
