Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C885ECA5FA1
	for <opensbi@archiver.kernel.org>; Tue, 29 Sep 2026 13:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xDdRW/SJyyXjUwOoOcTfnL8jIhOF9eeXMFbCWVHRa/M=; b=mtfqJF/aULg/Ek
	JykMLegcDf3qlq1SyDHGJpfJfSszM821SOJN5VuikkCnQU7gcWHb7Kc8Hcx+qY8SocZTzxmn1r/1s
	HLYwkUW+xrlG/Jx3+IsPJYMOldgpmkJ+E74tgMtBOK4PGpf8bx1wwFoZvCLr+GilRT5Dlmd07bJ+c
	p5bkVkdeZ0h0YPK+Ff28QwLx9L4/Mmk24o187xtT91O/YYMqhfBnL0qzbFVipRxuB8yXAK61eoNNi
	kRBZexF8RB9DMMkFC9oGaTEdwEnO4HI5ll0lNoPqUJHEKexKSUFuDeWvysdnS/cyrpD28dqZpCu2n
	cmBPldLJPFhT+dLvS14g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBXy9-00000003gF6-2iKq;
	Tue, 29 Sep 2026 13:34:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBXy8-00000003gEp-26Uh
	for opensbi@bombadil.infradead.org;
	Tue, 29 Sep 2026 13:34:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UHI1jgvUoIZZKc3MkuP71FmQSTspMCxREUwqsAZMqNk=; b=pYXR5JZLlFvgC3Jq0f6/FHS0k9
	7+sAfA0/mz5FiTfvu/t65d0KDuplj31HT0lXgUtCfEb0U6e1FqMLkf8/YfTXynZSjQTHDbdZc68hn
	XZanmIApeEo2N/kVGCpIVNNfMF9IRx4UTSq66OsW699SoPw8c1pXQy5F0i577RC1mhmoDIjL/ie52
	k9yoVrwYWrw0AcSl7+qdfoZ5KlURngXU8rVXjzxt7ZrWMq+QUu1AE0p8rwIvBlcO0nl/xpz3MdPNy
	+I800WX0RRAfn1TLgFNu7e7JSTjmy7+8Txt1Cyg8Ct4uRA1qLl6r2kEBByhIUj8ihV/Y4rt6fmu54
	DLQ537dw==;
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBXy5-00000002gSA-0Gsm
	for opensbi@lists.infradead.org;
	Tue, 29 Sep 2026 13:34:03 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-398a147688bso3040312a91.1
        for <opensbi@lists.infradead.org>; Tue, 29 Sep 2026 06:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1790688837; x=1791293637; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UHI1jgvUoIZZKc3MkuP71FmQSTspMCxREUwqsAZMqNk=;
        b=KfLSsW07gi7tz+xQkQ5FqPjO66iqtwnRdYMLXQkO5dG1svYoGiEeTBbwRBeft7Li7A
         7svGHwDMCuUrRWijWPq87FyWzjpusEr4xQ0iZ4OhgSkRARWfwvLn3xRmo2UhhDGpQglA
         JQTaEZAcnIcxv6QR1rarkU93I8bNQfWgyfNOGsaRrBytDTxxc/AGB6OocGXRszTirLM6
         DvdzB6kYFVA94xvqGZ5iBSdw4dq1kcgkBKGh1ITaqfr1Z652xtROFUPEFMYwOw4SposA
         g3XwBRmvWL78RLHBvsDP4xTS6vFJwMTzoXAW+Ln3V4fiTdFeFuAR/+v78hsf4x0HzTua
         orcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790688837; x=1791293637;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UHI1jgvUoIZZKc3MkuP71FmQSTspMCxREUwqsAZMqNk=;
        b=pmt0oaXA+LoA7x05TlMYSY8jbGDXd5cBzOSlkNvoQ1GlF1pQ1EDCh65s+YXtkyayX0
         wVzzGQ0QFWYM8X9xni8Tdt07Fvr1TJKkF3kpABxDAGlIGO75MpuvuHEMuFpqABXOodtg
         A4FKEAoPygF/kWKY4pR1iyGM7mXMNm0Ya+mWD3SH493BqU4nUc6zr90PG2NIS1XpT1NM
         0gfBKqmm9wNi6PlHYQ5FMjE7RIrIIARmi4ZJNNAQOT5hWG4nwo+p6bjBU8dqwOcZD3DY
         asOupcKW/zrTZ/0hBalrGSudd5b8nuJZn5Jdv/cQ/9lkWtOAHCyai/YydQUHo7tt6fsH
         tByw==
X-Gm-Message-State: AFq9FYIZf8u1zFtmkc/Ua3ZtXFniOu9WR/0ajhg8IqY9IufNKCne78t6
	ppn6TSZYN3TfXUYuZI+WVP9JwzLkd7TorGjnLAfmE27SZJQeKf6KRIiY8M8fIY51eJE=
X-Gm-Gg: AYBFou34sLXsZAcK1c+ZZNnbEmP1P5oyD0JZpc+diyMOWtIugSu/bHWqGBGarsAkx5/
	k33yfO1qhWp2S+memc0JruhWjDgZaVE7XnW8XknQC35vpghQwjxjfCY4WIgcIojpjOaekmJLDBz
	ChipPXmNpUZUkMy6+MKncA1DQE4qrwBFguGafnFfyyR5hIoujN5BCucZABqaDJb+2C5+/qhoUe2
	cQ1cDtzZsBRiZrImJfl5xqS+pPeTP79sjKKrVAGtOJBJvepdG6agULWyAfZqJC+TJOAbFqa2Ede
	dZq1wbpVZrUNEUEYnb83LlWYkD5eAB4iqWYORBpp5WWu/t1bFtW7YwQUHXa7Gf/uQs+cwKBTsVp
	ASWJgtJK9TDaii0TI3mffsE7JaGsAj3F2BvitfHHVdyNgGPt3jd776FyLMca4sOFoybRnIX3EFU
	R+Ho0ruf21FGe6KefGP5xIKm4wzkgN8kSFPCLFpcBjAnxc2bB3Ijzuy0BwDw4pV5W2NKZDGgHeL
	/lstBg=
X-Received: by 2002:a17:90b:57c7:b0:3a0:ca1d:b40d with SMTP id 98e67ed59e1d1-3a0ca1db726mr8890465a91.55.1790688836808;
        Tue, 29 Sep 2026 06:33:56 -0700 (PDT)
Received: from plin-1878 ([136.226.240.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a49804220fsm6047457a91.12.2026.09.29.06.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:33:56 -0700 (PDT)
Date: Tue, 29 Sep 2026 21:33:50 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com,
	greentime.hu@sifive.com, scott@riscstar.com, conor@kernel.org,
	dave.patel@riscstar.com, raymond.mao@riscstar.com,
	robin.randhawa@sifive.com, samuel.holland@sifive.com,
	pawandeep.oza@oss.qualcomm.com, krzk@kernel.org
Subject: Re: [PATCH v2 9/9] docs: document WID DT properties
Message-ID: <aru+PpdbFaAilSQS@plin-1878>
References: <20260817090503.2104998-1-peter.lin@sifive.com>
 <20260817090503.2104998-10-peter.lin@sifive.com>
 <CAAhSdy0ZDYTLKPJ3OTMrs=Mpebejn_PxWYGGiphDbStGOgYN=A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy0ZDYTLKPJ3OTMrs=Mpebejn_PxWYGGiphDbStGOgYN=A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_143401_636606_A92D09E7 
X-CRM114-Status: GOOD (  19.76  )
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

SGkgQW51cCwKCk9uIE1vbiwgU2VwIDI4LCAyMDI2IGF0IDAyOjA1OjMyUE0gKzA1MzAsIEFudXAg
UGF0ZWwgd3JvdGU6Cj4gT24gTW9uLCBBdWcgMTcsIDIwMjYgYXQgMjozNeKAr1BNIFl1LUNoaWVu
IFBldGVyIExpbiA8cGV0ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+ID4KPiA+IEFkZCAid2lk
IiBhbmQgIndpZGRlbGVnIiBwcm9wZXJ0aWVzIHRvIGRvbWFpbiBpbnN0YW5jZSBub2RlCj4gPiBk
b2N1bWVudGF0aW9uIGFuZCBleGFtcGxlIERULiBBZGQgYSAiUm9vdCBEb21haW4gTm9kZSIgc2Vj
dGlvbgo+ID4gZGVzY3JpYmluZyB0aGUgInJvb3QiIHN1Ym5vZGUgdW5kZXIgdGhlIGRvbWFpbiBj
b25maWd1cmF0aW9uCj4gPiBub2RlIGZvciByb290IGRvbWFpbiBXSUQgY29uZmlndXJhdGlvbgo+
ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFl1LUNoaWVuIFBldGVyIExpbiA8cGV0ZXIubGluQHNpZml2
ZS5jb20+Cj4gPiAtLS0KPiA+ICBkb2NzL2RvbWFpbl9zdXBwb3J0Lm1kIHwgMzYgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDM2IGluc2Vy
dGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZG9jcy9kb21haW5fc3VwcG9ydC5tZCBiL2Rv
Y3MvZG9tYWluX3N1cHBvcnQubWQKPiA+IGluZGV4IGUyNjdhOWY3Li5jMzVhMWQ5YSAxMDA2NDQK
PiA+IC0tLSBhL2RvY3MvZG9tYWluX3N1cHBvcnQubWQKPiA+ICsrKyBiL2RvY3MvZG9tYWluX3N1
cHBvcnQubWQKPiA+IEBAIC05Myw2ICs5Myw4IEBAIGZvbGxvd2luZyBtYW5uZXI6Cj4gPiAgICBp
cyB0aGUgbmV4dCBtb2RlIGZvciB0aGUgUk9PVCBkb21haW4KPiA+ICAqICoqc3lzdGVtX3Jlc2V0
X2FsbG93ZWQqKiAtIFRoZSBST09UIGRvbWFpbiBpcyBhbGxvd2VkIHRvIHJlc2V0IHRoZSBzeXN0
ZW0KPiA+ICAqICoqc3lzdGVtX3N1c3BlbmRfYWxsb3dlZCoqIC0gVGhlIFJPT1QgZG9tYWluIGlz
IGFsbG93ZWQgdG8gc3VzcGVuZCB0aGUgc3lzdGVtCj4gPiArKiAqKndpZCoqIC0gQ29uZmlndXJh
YmxlIFdvcmxkIElEIGZvciB0aGUgUk9PVCBkb21haW4KPiA+ICsqICoqd2lkZGVsZWcqKiAtIENv
bmZpZ3VyYWJsZSBXb3JsZCBJRCBkZWxlZ2F0aW9uIGJpdG1hc2sgZm9yIHRoZSBST09UIGRvbWFp
bgo+IAo+IEJhc2VkIG9uIHRoZSBiZWxvdyBleGFtcGxlcywgdGhlICJ3aWQiIGFuZCAid2lkZGVs
ZWciIGlzIGFsc28gYXZhaWxhYmxlIGZvcgo+IG5vbi1ST09UIGRvbWFpbnMgc28gc2hvdWxkIG5v
dCBoYXZlIHRoZXNlIGxpc3RlZCB1bmRlciAiRG9tYWluIEluc3RhbmNlIgo+IHNlY3Rpb24gYXMg
d2VsbCA/PwoKWWVzLCB0aGV5IHNob3VsZCBiZSBhZGRlZCwgd2lsbCBmaXggaW4gdGhlIFBBVENI
djMuCgpUaGFua3MsClBldGVyIExpbgoKPiBSZWdhcmRzLAo+IEFudXAKCi0tIApvcGVuc2JpIG1h
aWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
