Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D826AC88E64
	for <opensbi@archiver.kernel.org>; Mon, 14 Sep 2026 06:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4it0OV0KtLEoMUFgS4/uQs5pehUIN9Qvzeh9LHp9vQo=; b=1sQrteJlKE4nD4
	Sb+a0uuFA1mxc+15jLcwbkY/cGyJAMmr+HDfuiEs05U+4MS5YnBDJ1Bo9QSyxJX4nj8uXHbwpYi6V
	+sDvTKBXEx5PRGGRvNOG4LgQk0pj58yzuYlvnIPNQuEE/udxdhV1Gy0zmzkV7ldwV4B33/TdcpgAb
	TF3DvZp8RjdoxOQpFTPK8W36oOjn2l1kjEhwjfmQ0iHoscTf+VALbQz+Te2TFUvgc+Eanmjy/9poD
	9lKnkZ6PIVk9M7ftPXWyOJVNOvwRYDsIQ4lFMbBnjaljjdKpqWjifiBMsrVfvTGnNIOCqBhEQdHxM
	FoP706/pddWJPJnHm7HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x60Hx-00000002S9J-20oH;
	Mon, 14 Sep 2026 06:35:37 +0000
Received: from mail-vs2-x10.google.com ([2a00:1450:4864:3a::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x60Hu-00000002S8S-1Kpx
	for opensbi@lists.infradead.org;
	Mon, 14 Sep 2026 06:35:35 +0000
Received: by mail-vs2-x10.google.com with SMTP id 71dfb90a1353d-5c67e2ff27eso1352732e0c.0
        for <opensbi@lists.infradead.org>; Sun, 13 Sep 2026 23:35:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789367732; cv=none;
        d=google.com; s=arc-20260327;
        b=qncdjboBrQtg5LZ5XP4IkQrNQX0FIW4PC3HN/HgGmu7g2CpQQ3HFXZgVkfr/ESNJ25
         uhcX1AN9d2y76G5QPeriXPxKpFtpe02bW+EvJasTtxojZTQ+1K8kGQwqA2AoUFVq7gjK
         E28ZnS4iE+F0oOLzI3IWh+TNsTghcABRaE6DfiyFAaYABYZ36AJHVtHrHMAlTLrEMAfz
         RA9galbXYw/BQvEA5FV3md++JVMXeaaeyVp/QQeKUqLzUKDcsoSf1nGezS+qCoL2yerm
         idSkGLMsXqH9IcNFyeQJ/2bx4Er6RRol6HfsRNE5/2be8ialiNZCnk5pATc1Y2Ird1t6
         Ansg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S0SaRIUDBEzAduT+gEqwk1tLrx/s3/Jra8HZKlA72KY=;
        fh=UeEtZRTkxKCY0dDrSlBwJELwBYPbryPqFzipvp9MKzg=;
        b=ewgtbGURC01vyzu8Bv+16I0rYXfYVpzmrbsv9GV1pX77tvPUAobhcFBJb1+Ju/5f4D
         IV9IR1Fm8Vjw12KEjMQKR/r5ACZNXlN1rNJGWqIMNb90rzqq2lH+lv6aMrOr2I1eSoH/
         TEsi9IUXoDMIEZaCDqsVnCrg5tr5ino4ocb2ubbKdTcE6/O3Ip8kmMf640T0fRYRIN3n
         mjCRlHbR/o+NRpJhwGzUKVOsf9lUXCKnGZs6yvB/7dA2R7afUMRmJqybivSIiHrO3gB3
         3nuZSKG25MSQBfXGcSqSfITBWxZXDJ3rkH7lFhwicEfvbbMYfZJopoJHuRLx1NEgVn27
         OOmw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1789367732; x=1789972532; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S0SaRIUDBEzAduT+gEqwk1tLrx/s3/Jra8HZKlA72KY=;
        b=P43kzlYE6vzxzKWafghOmCquY9IiDt1uIsFY1mZ+WJuOQwY/twUsT2UwsFOGdA/2W0
         sFqH6tNKT2tBOTZwyRfukktg/erb7D+kISlQmxT67cKtgZt4cTyq5iknQ+sIg3rUH5IP
         0Y2QuH29Subvuss3b3Kr6clBkBQa4mqPk0N0u/qAMe2eLW6cBnQMhrqfiqEdwDfQ7XxC
         a+r3BcbHHIi1fvExyz3CtS1sfCJl9I28NzpnzaGYjQg26KB0jgnFKFUk0OwwXrgfZuli
         tdgkuUbtIrpFfM5SKiHZX6f62GMEgGAn6bpCjVvRgo3i0BXAWHCRy3DBRkW+Kbk6uAXt
         /7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789367732; x=1789972532;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S0SaRIUDBEzAduT+gEqwk1tLrx/s3/Jra8HZKlA72KY=;
        b=llQIobKzqVRNsCb4BOXxzS8APW4A6rrGio/l04FrVKcGwQHzV9ltdVQMeShZ/Df6xX
         EIXWRzXYBAcTsfJr1LPGZ4p8IRqPEBLY0296F5rc5T9nJCtPDVscaFTlXNJxtXrLNSwt
         eD7UYgghoEHlZ6Af40e57aPTziJV4fxt84d+quh52DRDAPIwciJGhTPw91RIwR8pLSIY
         ej/QEvmOR5n0sRMgZThkHzhmqI1JTqL0q3oE3Jd6DHR9xWpTiFlI6oBhc0yJGc+s4xhD
         ib8QslhDyu2kE1ieabIgLGqpjRB2SORGlLa4nzvq9M18M2xxMei47R/r8k3o9/nV4R9m
         pMFg==
X-Gm-Message-State: AFuF++kbSKTRGh2oBCh35J388lgZalqiuTlV1nDniooLymSUPmijsNn7
	xbu5DmR2SuYGL5baYhMEKOuYKze7lgg3QVG9CnQRXaCg8M5vxbxWbVuiq9BLQo3JywhgxEANjAg
	XK89yzuonq+Hyxr40QIQv9nMOjKGfRAYZzwBqGFx4vA==
X-Gm-Gg: AYBFou2fLszt/QjGtusk1b4F37ZCLFYaavKv61HwsT1pnfL1z9KYZurMmOEfbWh9RGc
	Ik1wrel5LsPpnM2uQOYKXYQ64UEb+F4lFN+7K357efUyQSyNR/qXtFs/ZD/LSRCb90AmfXMlB1X
	jZLhWE4e0XXYD072oGKYsA9SwAzJ5YnQtwhEizpecc1ET0nus65UVByjD82zHZKKRYqmWw0cLeT
	fhpngfPBPFc7rZmwfjzGOR4WMZiRMQh4uKqy1Y9ftjSifdTXl496gWgyOXYpHi4ZZrwKJf+QIow
	wdhLs2Tqh4LtGO8MuHdAwOKjWrI44Qdi6SWNpr76pZnek4qMpjLyff3LuA==
X-Received: by 2002:a05:6122:3a02:b0:5c6:8480:35c8 with SMTP id
 71dfb90a1353d-5c981e9762fmr581522e0c.8.1789367732346; Sun, 13 Sep 2026
 23:35:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260903-smrnmi-context-restore-v2-0-10b17506d257@sifive.com>
 <20260910185840.12169-1-evvoevod@tenstorrent.com> <CACpYXwAACrdFcxTpNUgdsk6xGQ3yMRti6jFD_ui-EDH7WtyBaw@mail.gmail.com>
 <20260911171103.18573-1-evvoevod@tenstorrent.com>
In-Reply-To: <20260911171103.18573-1-evvoevod@tenstorrent.com>
From: Nia Su <nia.su@sifive.com>
Date: Mon, 14 Sep 2026 14:35:20 +0800
X-Gm-Features: AcwNN1XtQcujcLPxoZR216IIjFu1ahzgG-2GL16BBGiTjl3OH37Q-ZLpIOKPWIY
Message-ID: <CACpYXwCNakoUGui1SUSFPePk_Zw43oLv2BmicbEadF0OF+Tu0Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] lib: sbi: Fix Smrnmi resume init and optional
 platform callback
To: Evgeny Voevodin <evvoevod@tenstorrent.com>
Cc: opensbi@lists.infradead.org, Nylon Chen <nylon.chen@sifive.com>, 
	Nick Hu <nick.hu@sifive.com>, Zong Li <zong.li@sifive.com>, 
	Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_233534_376141_58510D7E 
X-CRM114-Status: GOOD (  26.90  )
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

T24gU2F0LCBTZXAgMTIsIDIwMjYgYXQgMToxMeKAr0FNIEV2Z2VueSBWb2V2b2Rpbgo8ZXZ2b2V2
b2RAdGVuc3RvcnJlbnQuY29tPiB3cm90ZToKPgo+IFBhdGNoIDMvMzoKPgo+IC0gQWJvdXQgdGhl
IG1vZGUgdmFyaWFibGU6IEkgZG9uJ3QgdGhpbmsgd2UgbmVlZCB0byBrZWVwIGFueSBzdGF0ZSBq
dXN0Cj4gICB0byBpbmRpY2F0ZSBob3cgU21ybm1pIHRyYXAgaGFuZGxlcnMgd2VyZSBpbml0aWFs
aXplZCwgaWYgYSBzaW1wbGUKPiAgIGNoZWNrIGdpdmVzIHRoZSBzYW1lIGFuc3dlci4KPgo+ICAg
c2JpX2Jvb3RfcHJpbnRfaGFydCgpICh3aGVyZSB0aGUgU21ybm1pIG1vZGUgaXMgaW5kaWNhdGVk
KSBpcyBvbmx5Cj4gICByZWFjaGVkIGluIHRoZXNlIGNhc2VzOgo+Cj4gICAxLiBObyBTbXJubWkg
ZGV0ZWN0ZWQgKFNtcm5taSBtb2RlIG91dHB1dCBpcyBzdXBwcmVzc2VkIGJhc2VkIG9uIGl0cwo+
ICAgICAgYWJzZW5jZSkKPiAgIDIuIE5vIHBsYXRmb3JtIGhhbmRsZXJzIGluc3RhbGxlZCAoRGVm
YXVsdCkKPiAgIDMuIFBsYXRmb3JtIGhhbmRsZXJzIGluc3RhbGxlZCBBTkQgc3VjY2VlZCAoUGxh
dGZvcm0pCj4KPiAgIElmIGEgcGxhdGZvcm0gaGFzIGhhbmRsZXJzIGJ1dCB0aGUgaW5pdGlhbGl6
YXRpb24gZGlkbid0IHN1Y2NlZWQKPiAgIChzYmlfc21ybm1pX2hhcnRfaW5pdCgpIHJldHVybmVk
IG5vbi16ZXJvKSB0aGUgaGFydCBnZXRzIGhhbmdlZCBpbgo+ICAgaW5pdF9jb2xkYm9vdCgpIGJl
Zm9yZSBhbnkgcGFydCBvZiB0aGUgYmFubmVyIGlzIHByaW50ZWQKPiAgIChzYmlfaW5pdC5jOjI5
OSwgdGhlIGJhbm5lciBzdGFydHMgYXQgc2JpX2luaXQuYzo0NDApLCBzbyB0aGUgU21ybm1pCj4g
ICBtb2RlIGxpbmUgaXMgbmV2ZXIgcmVhY2hlZC4KPgo+ICAgU28sIEkgd291bGQgc3RpbGwgcHJl
ZmVyIHRvIGdldCByaWQgb2YgdGhlIFNtcm5taSBtb2RlIHZhcmlhYmxlIGluCj4gICBmYXZvciBv
ZiBhIHNpbXBsZSBvbiB0aGUgZmx5IGNoZWNrLgoKVW5kZXJzdG9vZC4gSSBhZ3JlZSB0aGF0IGEg
ZmFpbGVkIFNtcm5taSBoYW5kbGVyIGluaXRpYWxpemF0aW9uIHNob3VsZApmYWlsIGJlZm9yZSB0
aGUgYmFubmVyIGlzIHByaW50ZWQuIEnigJlsbCByZW1vdmUgaXQuCgo+IC0gQWJvdXQgdGhlIHBs
YXRmb3JtIGZsYWcuIEFsbG93aW5nIHRoZSBOVUxMIGNhbGxiYWNrIGlzIHJpZ2h0LCBpdCBmaXhl
cwo+ICAgdGhlIHBhbmljIG9uIHBsYXRmb3JtcyB3aXRoIGZpeGVkIG9yIG10dmVjIGJhc2VkIHZl
Y3RvcnMuIE15IHBvaW50IGlzCj4gICB0aGF0IE5VTEwgYWxvbmUgZG9lcyBub3QgZGlzdGluZ3Vp
c2ggYmV0d2VlbiBwbGF0Zm9ybXMgd2hpY2gKPiAgIGludGVudGlvbmFsbHkgZGlkbid0IHNldCB0
aGUgaGFuZGxlcnMgYW5kIHRob3NlIHdoaWNoIGZvcmdvdCB0byBkbwo+ICAgdGhpcy4gQm90aCBw
cm9jZWVkIHdpdGggY3NyX3NldChDU1JfTU5TVEFUVVMsIE1OU1RBVFVTX05NSUUpLCBzbyBmb3IK
PiAgIHRoZSBzZWNvbmQgb25lIE5NSXMgYXJlIGVuYWJsZWQgd2hpbGUgdGhlIHZlbmRvciB2ZWN0
b3IgcmVnaXN0ZXIga2VlcHMKPiAgIGl0cyByZXNldCB2YWx1ZSwgYW5kIHRoZSBmaXJzdCBSTk1J
IGp1bXBzIHRvIGFuIHVuZGVmaW5lZCBhZGRyZXNzLgo+ICAgVGhpcyBpcyBicm9rZW4gaW4gYSB3
YXkgd2hpY2ggbWlnaHQgYmUgaGFyZCB0byBkZWJ1Zy4KPgo+ICAgQSBmbGFnIGluIHNiaV9wbGF0
Zm9ybSB3aGljaCBzYXlzICJ0aGlzIHBsYXRmb3JtIGhhcyBub3RoaW5nIHRvCj4gICBwcm9ncmFt
IiBzZXBhcmF0ZXMgdGhlIHR3byBjYXNlczogbm8gZmxhZyBhbmQgbm8gY2FsbGJhY2sgaXMgdGhl
biBhCj4gICBwbGF0Zm9ybSBlcnJvci4gVGhpcyBpcyB3aGF0IHdlIGFncmVlZCBvbiBpbiBbMV0s
IG9wdGlvbnMgYSkgYW5kIGMpCj4gICB0b2dldGhlci4KClRoYW5rcyBmb3IgdGhlIGNsYXJpZmlj
YXRpb24uIEkgdGhpbmsgSSB1bmRlcnN0YW5kIHRoZSBkaXN0aW5jdGlvbiBub3cuClRoZSBmbGFn
IGRpc3Rpbmd1aXNoZXMgcGxhdGZvcm1zIHRoYXQgaW50ZW50aW9uYWxseSBsZWF2ZQpzbXJubWlf
aGFuZGxlcnNfaW5pdCB1bnNldCBmcm9tIHBsYXRmb3JtcyB0aGF0IGFjY2lkZW50YWxseSBvbWl0
IGl0LiBJCnBsYW4gdG8gaW1wbGVtZW50IGl0IGFzIGZvbGxvd3MuCgplbnVtIHNiaV9wbGF0Zm9y
bV9mZWF0dXJlcyB7Ci4uLgovKiBQbGF0Zm9ybSB1c2VzIGEgZml4ZWQgb3IgbXR2ZWMtYmFzZWQg
Uk5NSSB2ZWN0b3IuICovClNCSV9QTEFURk9STV9IQVNfRklYRURfU01STk1JX1ZFQ1RPUiA9ICgx
IDw8IDIpLAouLi4KfTsKCiNkZWZpbmUgc2JpX3BsYXRmb3JtX2hhc19maXhlZF9zbXJubWlfdmVj
dG9yKF9fcCkgXAooKF9fcCktPmZlYXR1cmVzICYgU0JJX1BMQVRGT1JNX0hBU19GSVhFRF9TTVJO
TUlfVkVDVE9SKQoKUGxhdGZvcm1zIHdpdGggZml4ZWQgb3IgbXR2ZWMtYmFzZWQgdmVjdG9ycyB3
aWxsIHNldCB0aGUgZmxhZyBpbiB0aGVpcgpwbGF0Zm9ybSBkZXNjcmlwdG9yOgoKLmZlYXR1cmVz
ID0gU0JJX1BMQVRGT1JNX0RFRkFVTFRfRkVBVFVSRVMgfAogICBTQklfUExBVEZPUk1fSEFTX0ZJ
WEVEX1NNUk5NSV9WRUNUT1IsCgpUaGUgU21ybm1pIGluaXRpYWxpemF0aW9uIHdpbGwgYWNjZXB0
IGEgTlVMTCBjYWxsYmFjayBvbmx5IHdoZW4gdGhlIGZsYWcgaXMKc2V0LiBPdGhlcndpc2UsIGl0
IHdpbGwgZmFpbCBiZWZvcmUgZW5hYmxpbmcgTk1JczoKCnN0YXRpYyBpbnQgc2JpX3Ntcm5taV9o
YXJ0X2luaXQoc3RydWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoKQp7Ci4uLgogICBpZiAob3BzICYm
IG9wcy0+c21ybm1pX2hhbmRsZXJzX2luaXQpIHsKICAgICAgICAvL2RvIG9wcy0+c21ybm1pX2hh
bmRsZXJzX2luaXQKICAgICAgICAuLi4KICAgfSBlbHNlIGlmICghc2JpX3BsYXRmb3JtX2hhc19m
aXhlZF9zbXJubWlfdmVjdG9yKHBsYXQpKSB7CiAgICAgICAgc2JpX3ByaW50ZigiJXM6IHBsYXRm
b3JtIG11c3QgcHJvdmlkZSAiCiAgICAgICAgICAgICAgICAgICAgICAgICAic21ybm1pX2hhbmRs
ZXJzX2luaXQoKSBvciBzZXQgIgogICAgICAgICAgICAgICAgICAgICAgICAgIlNCSV9QTEFURk9S
TV9IQVNfRklYRURfU01STk1JX1ZFQ1RPUlxcbiIsCiAgICAgICAgICAgICAgICAgICAgICAgICAg
X19mdW5jX18pOwogICAgICAgcmV0dXJuIFNCSV9FTk9UU1VQUDsKICAgfQouLi4KfQoKU2luY2Ug
aW5pdGlhbGl6YXRpb24gZmFpbHVyZXMgc3RvcCBib290IGJlZm9yZSB0aGUgYmFubmVyLCB0aGUg
bW9kZSBjYW4KYmUgcmVwb3J0ZWQgZnJvbSB0aGUgY2FsbGJhY2sgcHJlc2VuY2U6CgppZiAoc2Jp
X2hhcnRfaGFzX2V4dGVuc2lvbihzY3JhdGNoLCBTQklfSEFSVF9FWFRfU01STk1JKSkgewouLi4K
ICAgc2JpX3ByaW50ZigiQm9vdCBIQVJUIFNtcm5taSBJbml0ICAgICAgIDogJXNcXG4iLAogICAg
ICAgIChvcHMgJiYgb3BzLT5zbXJubWlfaGFuZGxlcnNfaW5pdCkgPwogICAgICAgICJQbGF0Zm9y
bSIgOiAiRGVmYXVsdCIpOwogICB9Cn0KClBsZWFzZSBsZXQgbWUga25vdyBpZiBJ4oCZdmUgbWlz
dW5kZXJzdG9vZCBhbnl0aGluZyBvciBpZiB0aGlzIGFwcHJvYWNoCm5lZWRzIGFueSBjaGFuZ2Vz
OyBvdGhlcndpc2UsIEnigJlsbCBpbmNsdWRlIGl0IGluIHRoZSBuZXh0IHJldmlzaW9uLgoKVGhh
bmtzLApOaWEKCj4gICBUaGFua3MsCj4gICBFdmdlbnkKPgo+IFsxXSBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9vcGVuc2JpL0NBQ3BZWHdDaWNpUXpRbzk5PWY9X3dpb1liM2tISFRaa1FtX1VBaTZG
Q1hZcGJKbWVvZ0BtYWlsLmdtYWlsLmNvbS8KCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVu
c2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9vcGVuc2JpCg==
