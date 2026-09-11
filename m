Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01785C88E4D
	for <opensbi@archiver.kernel.org>; Fri, 11 Sep 2026 08:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4O6CxVQinj21EMSvX04t2RrVe7Tg5kG0UfuQmLQzYvw=; b=Y5Lv9iRg6MONgM
	tBPguUIasEuLO17bNwuxQY+330ktaZLv7TDUtRk+8vbt3ejMcd9s7zohamYuuhwyhE0abl5nSybsh
	YRIFsSDLGCmo5s3ywf9qKvBYRjbUw1WJLRCPTEld8+DBF+oK2oywtRPr6rJ1dbYmnxXiS6/ZHqwqL
	DZgUSWcuMo+jZfae0SN3qKk0MMHQUFIWxEy03W+ZYdGmbzS+BvI55EKywzD2VPZaz1cr/1X6bDD7e
	8fd4paQ2jmgcnRRbNYKuUBnknEgfn8wSk+F6f4i9faxn5gJvTEafzPT4inEqdQHSG3mFzh/JQGpZp
	2Lnt5TTtk9cOOv272Aaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wdY-0000000G8YI-01qJ;
	Fri, 11 Sep 2026 08:29:32 +0000
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wdS-0000000G8TL-1HnE
	for opensbi@lists.infradead.org;
	Fri, 11 Sep 2026 08:29:29 +0000
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-5c7d4c663e9so635225e0c.3
        for <opensbi@lists.infradead.org>; Fri, 11 Sep 2026 01:29:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789115365; cv=none;
        d=google.com; s=arc-20260327;
        b=HGWdA32WnkWjFfMo0Bo/z9NUq297bIhbUQBBbG5xjLQA7G3CxeTwDwF8oyzWR1iqIG
         wDY5DrXSqovTCfiBObiT/UybWSarzKup4GkM1VGKuADNlDMHBMM5jTb1aWPVXVI6IeWz
         iHnfoaXkQsb+mA9bRFK9P/o8Nr7+5OJdiM85r31zadf3wSxzronNNUJukV/UfBYM4oKS
         G7v1XvN8Gl9FuU+pCZ0VHujUgy57HfgmnF4vj29U3+UY6opX6qwoTPnh7koscfC/5uyE
         Z8UmsPVsHu9EMQnb9H5P1utGEwFvwoA6FoeYG3uJd8LHh9Gyo+kx4C5AFf94f2erhtwy
         t1CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=88oiW0khA3ecRRSJoKi1+mv0VG8N9nBbiPtZvadAa6I=;
        fh=UeEtZRTkxKCY0dDrSlBwJELwBYPbryPqFzipvp9MKzg=;
        b=Yxn6McF6md/wfr5tNRuDPlHT6UKnilHaiGLjdl9VTII9S3e2INDlDKaoaHmomxbEWW
         jiMXcuwQtVE6Zy9S6deLUIqEmTIV1YvYz+Livv9NbPiV5XO43X72L02Nzlxw/Fe6iQ96
         J6mGZYAZHqAqL+2OGOxDCyjz1NvHbayBDaGRYSeZFd+upJm/akzyikG9ye+tp1S4yw3c
         xfUp/VK2gcrE1a00zhut3shrOPDavvYGEZKZ93QdCFeKEh2atTM0gD/Vdnt6xHZoWP9M
         kWw8e789n2IE4qnCYeHaGQsHG5/U/1ehfk6FWiJoS2mxo4YWkUY6Nvjt+3qjqemEqmmD
         FiFA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1789115365; x=1789720165; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=88oiW0khA3ecRRSJoKi1+mv0VG8N9nBbiPtZvadAa6I=;
        b=O/l+R4uq6e5Ot6Sg6JTBSp5ZyosGGgW4OrcfRPwMVgdcGn8GhlcYS/XdPS68Xnr6C3
         Snu8IN3iWzhGC2vy7MUrTltlTThhwPQHfjprpFhNXPbtf0RrmzB864KEpOMOcXiapREx
         /Rwad8j00BazubsLLZbWDKlpMD+zEEYqChHss0PAdEE51MUDr+vnDhLyxXoiGdXNJ7nc
         BQcYdbUc/aDOYKmtNCfGEO9S+8RsrS6AJegTF36GVG8gyyvVZX4i9qsDwj7p7ukkzMOA
         JR+4Zb3lfMpj5u7NtZVRON4S9c+69QWpZXJlXIjPYBlIm7Yk3gKjBhMeTJrMCDo/Ncro
         uDJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789115365; x=1789720165;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=88oiW0khA3ecRRSJoKi1+mv0VG8N9nBbiPtZvadAa6I=;
        b=szPjLP5zydABS7PwnwK7oBiHcw7dSNGZ8YYcr+0pOH/3lLov6j/EYDPiRg3Sgwo8FB
         jdUgbHEfTJIJ27ZO6gBqI0iyiv043Up3TxFkI60a4hlU6dH0Ll536x5vvYU8e78OOukd
         pf2D2IQGwZ/3nBvqV0dfYWjCOZDWpPsYbT1LuDptWrucizZMkcpgnjxaHhA8Im0GsT0H
         nfH3FwisyT/w9+6CFnlVoHhptPf22sVxIaPgiWKRlD/Lb//oU7A1U9gGoe2ZXzbHNO0h
         ZdU8z2MgSh5YnkXJGLeI1rhgAibCyXvvGn+sbP+XaAxXvCP+FP1OnVkJ3aDYREZ9C9Ym
         Np4A==
X-Gm-Message-State: AFuF++kMm4B2OYQwTxKXx57Q01ULocGfexMGGO96E66uAFQY1FbXexq+
	mxuJHX4dNoRk3GvcS0sn9xD1nyYIe5NM7fifERjGH8iBSMSFz6MTPFPV1GNFLxK08z1Atnmc+TM
	FCSCDgdQfHl9l86RguGbEXLqGH3v7MV7IYPe8n4QJBg==
X-Gm-Gg: AYBFou3fxgnOtBce6DIbHWJ37HbYoUjGdJLX3NzTQhU3Rr7UuV9+jXYJdZ83tlSx/md
	3ZpjJqoV7TVfdv9BnyuvyeSGVERRGNmWxarQIA7/7syuh1ZLirbx55qiqx3qr2O62MrcicEQh9u
	hOG++K+2KBdd0k4Vdum8lRYS8lJedjrV5PWzcI374US5/U108zNCNlKPNwnRgmcYHJ2tBs1Nf6E
	ojCDl0qX493vLnCf8oxWsiwhVOfuxUHpN3iXi1B9nlNhOOOAhyx2oMtKTU+q11TswOHWhTM8s28
	s/6wg4MoAwrIABq1RXfUeUCSjg9ST+sDf6oj4xZ/QguawE94AyevBy6yhA==
X-Received: by 2002:a05:6122:21a4:b0:5c8:3a2f:a497 with SMTP id
 71dfb90a1353d-5c845d7d798mr4227053e0c.0.1789115365145; Fri, 11 Sep 2026
 01:29:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260903-smrnmi-context-restore-v2-0-10b17506d257@sifive.com>
 <20260903-smrnmi-context-restore-v2-2-10b17506d257@sifive.com> <20260910185618.12126-1-evvoevod@tenstorrent.com>
In-Reply-To: <20260910185618.12126-1-evvoevod@tenstorrent.com>
From: Nia Su <nia.su@sifive.com>
Date: Fri, 11 Sep 2026 16:29:14 +0800
X-Gm-Features: AcwNN1VrEeq0DW5SO_QrUfQl6-rogELms7g4N1_Ab73LNtcif2lehvcZFNNEWC8
Message-ID: <CACpYXwCwn0-mjTyMyYAr_zDVyK2gjUFzTktb5F693octdEZKxw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] lib: sbi: report smrnmi_handlers_init failures
 instead of ignoring them
To: Evgeny Voevodin <evvoevod@tenstorrent.com>
Cc: opensbi@lists.infradead.org, Nylon Chen <nylon.chen@sifive.com>, 
	Nick Hu <nick.hu@sifive.com>, Zong Li <zong.li@sifive.com>, 
	Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_012927_395552_48B9503D 
X-CRM114-Status: GOOD (  15.39  )
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

T24gRnJpLCBTZXAgMTEsIDIwMjYgYXQgMjo1NuKAr0FNIEV2Z2VueSBWb2V2b2Rpbgo8ZXZ2b2V2
b2RAdGVuc3RvcnJlbnQuY29tPiB3cm90ZToKPgo+IENvZGUgbG9va3MgZ29vZCB0byBtZS4KPgo+
IFBsZWFzZSwgYWRkIGEgbm90ZSBhYm91dCBhc3N1bWVkIFNCSV9FKiByZXR1cm4gdmFsdWUgb24g
ZXJyb3IgaW4KPiBzYmlfcGxhdGZvcm0uaCB3aGVyZSB5b3UgY2hhbmdlIHRoZSByZXR1cm4gdHlw
ZSBvZiBzbXJubWlfaGFuZGxlcnNfaW5pdDoKPgo+ICAgICAgIFJldHVybnMgU0JJX09LIG9uIHN1
Y2Nlc3MsIGVycm9yIGNvZGUgb3RoZXJ3aXNlLgo+Cj4gTm90ZSB0aGF0IGNvbW1lbnQgZm9yIHJu
bWlfaGFuZGxlciBiZWxvdyB3aGljaCBzYXlzIHJldHVybnMgU0JJX1NVQ0NFU1MKPiBpcyBub3Qg
cHJlY2lzZS4gU0JJX1NVQ0NFU1MgY29tZXMgZnJvbSBzYmlfZWNhbGxfaW50ZXJmYWNlLmggYW5k
IGl0IGlzIGEKPiByZXR1cm4gdmFsdWUgb2YgdGhlIFNCSSBjYWxsLCB3aGlsZSB0aGlzIGNhbGxi
YWNrIGlzIGNhbGxlZCBieSB0aGUKPiBmaXJtd2FyZSBpdHNlbGYgYW5kIGl0cyByZXN1bHQgbmV2
ZXIgZ29lcyB0byBTLW1vZGUuIHNiaV9lcnJvci5oIGhhcwo+IFNCSV9PSyBmb3IgdGhhdCBhbmQg
dGhlIHZhbHVlIGlzIHRoZSBzYW1lIDAuIE1heWJlIHdvcnRoIGNoYW5naW5nIGl0IHRvCj4gU0JJ
X09LIGluIHRoZSBzYW1lIGNvbW1pdCBvciBzZW5kaW5nIGFzIGEgc2VwYXJhdGUgdHJpdmlhbCBm
aXguCgpJIHRoaW5rIGZpeGluZyB0aGlzIGluIHRoZSBzYW1lIGNvbW1pdCBpcyBmaW5lLiBUaGlz
IGVuc3VyZXMgdGhhdCBib3RoCmNhbGxiYWNrcyBjb25zaXN0ZW50bHkgdXNlIHRoZSBzYW1lLCBj
b3JyZWN0IGZpcm13YXJlLWludGVybmFsIHN1Y2Nlc3MKY29uc3RhbnQsIHJhdGhlciB0aGFuIHRo
ZSBlY2FsbC1mYWNpbmcgb25lLiBJ4oCZbGwgYWRvcHQgdGhlc2Ugc3VnZ2VzdGlvbnMgaW4KdGhl
IG5leHQgcmV2aXNpb24uCgpUaGFua3MsCk5pYQoKPiBSZXZpZXdlZC1ieTogRXZnZW55IFZvZXZv
ZGluIDxldnZvZXZvZEB0ZW5zdG9ycmVudC5jb20+Cj4KPiAgIFRoYW5rcywKPiAgIEV2Z2VueQoK
LS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
