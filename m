Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC13C5AE49
	for <opensbi@archiver.kernel.org>; Mon, 10 Aug 2026 13:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8BwJP6RzzHOHEaPHzH3zfxJZjPq2rqPKCi4biIhyvLg=; b=SLZ4Y6Z5JJNFY5
	gvq0/XRTL5L52LYDRUQxfVYg2TQiO+DK5OKbDyJcuqv4cPfaRbLVF9OMaSriOQVhLRA0qVuG0HXtQ
	RrTJhzcr9IS67FD010oH4hR+5fMIaoUgr66oefX2PwKgcEGYsZgK8sqoPZm2bY0NCNFxNqC0c81kZ
	fNGpJ5skZb9CJhXwiKC35ZVJ41m/NlPPdTmoKR0I3h9f9Q/CiMXUfIDd18K1Z19MrBE2l6v2sna/d
	gx87fk3QWslINIh0j8HLt+Tk6yuaQrARvPezCePEZPqkYdkQEZOGXlguV2v2/as/woCMKcajjV37R
	m2pVTDElNSoSTqtusOGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQKG-0000000BvhD-2SiM;
	Mon, 10 Aug 2026 13:46:00 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQKD-0000000BvgQ-0wfW
	for opensbi@lists.infradead.org;
	Mon, 10 Aug 2026 13:45:58 +0000
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-758caf52714so329484137.0
        for <opensbi@lists.infradead.org>; Mon, 10 Aug 2026 06:45:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786369555; cv=none;
        d=google.com; s=arc-20260327;
        b=rwfmRUsbWjhmb1O2BG/6NM0eVpK10I05VVpmoxUMRAvOMVY7PMkL+MRv0mMdxFt2iO
         HdsV/GiOk1kWNZmET5XUMKBklC02Xy7cPOJpTMIhKUjRgA7+XmxUveBb4TmXHCFqi/Ld
         EUN4kexK20b1Iwxp5bEZvLUzLzQs7jRYaMc6KAnoAJfvM/fcYTewTodjUJh7ga6KAEFE
         /+5WbsSzlN1AhRGkLUW+ft94BMXbqKVMl+QoKdPY3/gtExAy0W3j/jp32Gm3L6oSIGVD
         Cp5CRY0+XY+MZ4YGZrxXxtZDSxFH5d6RGH0rZvWkkqv2/jPDtfCbREfgTW25gbwsd4Be
         BGeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mTl6xCyiLWA6MJD/kWsUR71lIDcikhq4Rzfn5uJAlF0=;
        fh=QtxlpNGI7KrvBRMk81BYOaZ603RoeKGSIK++2AIJDsE=;
        b=IoNoG5zk0ZoAd2A7C+e9D8rgJBw175Map4Jay8pW0RNap7T+0MbKg91IH2ey/CEpWI
         nc8EauKS50SqLBQzuMdxvXt3vn3anYuEcN+tal16b1JtFDknnFHrmpGirmnKbaS/2sSY
         UUCgknWj71RJ0nv/n9TrurY2FYT3ZXZ6t8MpnDpQlZ1mBJ0WZuYxPGHFpKnoK2teZOpe
         k4hkzTrMvCvJM18wuIEiUU801fWI/mleq1wyZE/Ph2aMWoED7Ax9/j9EO8yQwIjW9l9X
         nk7BFiOaKCS5sok7qOLh3xUqodGot5X2nhvJi4+940ewTpz9c5OJnQZBZtaXKKdo4MEE
         QDpA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786369555; x=1786974355; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mTl6xCyiLWA6MJD/kWsUR71lIDcikhq4Rzfn5uJAlF0=;
        b=kGwo7Htu9tBimYaU2pnCvlV7w8nMnS/3JR4SejxvaPa5uQZC92s/Qk5qHg2X5FwtbE
         KsiLBE196MovujmPszMmpYLXGWmbiJ5vQtmvfMM7jZsAhQ0wNDwdeqEU4kf9Z9mwXZm7
         XqYdQxjPRmO6L5tRkgx6Y9ZqGDsQXSIU8WQuQAB3LGxH0F+a8yq9YkaktkafZ+Kv1iz2
         U2Daouqh8G4ShdnoEpBJhxsFV7DZ8TorF71USzz3RIxlBKmsaDJLxJ3V6fHMZ38c4Cer
         7hLyErlk8gQSUNicyB60HG65AsuBlhlKNAMS+PZzk1kgwYTwBNj90uOYixHHfuPQUMZD
         VfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786369555; x=1786974355;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mTl6xCyiLWA6MJD/kWsUR71lIDcikhq4Rzfn5uJAlF0=;
        b=jfyR12NkY3dKHJRkLHZfYVqohw0VfFbUtTCYKf/VwsuBjy8uMDU8rfm5aeFCTqnvb3
         2idUw1Dxv3zx4gFfrsj0FsNTmd5hoNnXCIEALsT5TJu5fP3+/pieWn++6imLXlINuEI8
         RzbqOwu3kKub3NqHk+JYxC0z20zSUi2b1PG4uhESXTVzthGVfKL+prsCnJZ9/zHg+mZo
         omywtSQUbSLVsrAJS9J9p+HabuJv4XtRxYVvRkZNOX46mMlsGBDVJ5Sk/rh6GnaaPkgH
         GRdhuZtg6cvJmk7zdWU4LzaPeu3vNa0U1IygFzYQZBscTXll9kOsHnVMlaHntWdFai20
         MTmQ==
X-Gm-Message-State: AOJu0Yzy+Kfz/GfE7P17zfKfCtZbDIEWpUx3oKrfW3/El0b++EyDrMS6
	NV9tX3phOGFeG4PXTTKv4wES72fFzniM3W5MKuKO22BQCb6oSxxAJLCnTdR+XaIRkgZojJK/F7P
	8YjZBfw4HZpyFAQlaX0xyavV3vcQzsQc=
X-Gm-Gg: AR+sD13hOivmDzpRPT9buCwrhuWaC9Y/ww1zEp2Kk9eEVwz9OTnG131Sb77UCopa3Yu
	ode2W3TIj7xh73mRhzEjePKHxPeHpfAG8SKSbTRkq15W51fzZfhB1NDlD2nBu+bgFxXaQy+TzsF
	zAlmgDrOkmuz0B9PQX7NnyqazyBrLC35S7DvQH+Ema/NxyMVlvjNZMmEUaehrffv0sNQkXQjEoL
	ZIBETg6DinvFmVk3jrKk21BXRe3f0gJd+aclUIO3bYZY8Hkxty1IuqpcFDb4XoVB5sDzV7VHMrs
	dh9ovQ0RX2sxjhP85mlGzWCieuKhqMAJ8Ud8CN1hb+4Y
X-Received: by 2002:a05:6102:26c7:b0:726:e608:6658 with SMTP id
 ada2fe7eead31-768e8119938mr352938137.11.1786369555268; Mon, 10 Aug 2026
 06:45:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260725023821.3795618-1-raymondmaoca@gmail.com> <annPYjSvMVMlG7hn@plin-1878>
In-Reply-To: <annPYjSvMVMlG7hn@plin-1878>
From: Raymond Mao <raymondmaoca@gmail.com>
Date: Mon, 10 Aug 2026 09:45:44 -0400
X-Gm-Features: AUfX_myY-Pdy9CiDg3EKycGc5u_-peUydJWRmCn4ixoUOQGp5_MebEaye4QFNRY
Message-ID: <CAMDkj5wcSvDkDXyb30E=U5gw_sxxsw6e74RXMKftehb4QugcuQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Add WorldGuard support with wgchecker2
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, scott@riscstar.com, dave.patel@riscstar.com, 
	raymond.mao@riscstar.com, robin.randhawa@sifive.com, 
	samuel.holland@sifive.com, anup.patel@qti.qualcomm.com, 
	anuppate@qti.qualcomm.com, anup@brainfault.org, dhaval@rivosinc.com, 
	jim.shu@sifive.com, zong.li@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_064557_273745_8323EB5A 
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

SGkgUGV0ZXIsCgpPbiBNb24sIEF1ZyAxMCwgMjAyNiBhdCA5OjE34oCvQU0gWXUtQ2hpZW4gUGV0
ZXIgTGluIDxwZXRlci5saW5Ac2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiBIaSBBbGwsCj4KPiBBcyBk
aXNjdXNzZWQgd2l0aCBSYXltb25kIHRvZGF5LCB0aGUgSVNBIHBhcnQgb2YgdGhpcwo+IHNlcmll
cyB3aWxsIGJlIGFkZHJlc3NlZCBpbiBteSBuZXh0IHZlcnNpb24gb2YKPiBbUkZDLDAwLzEyXSBB
ZGQgUklTQy1WIFdvcmxkcyBJU0Egc3VwcG9ydCB0byBPcGVuU0JJIFsxXQo+IHNlcmllcywgYW5k
IHdnQ2hlY2tlciBkcml2ZXIgd2lsbCBhbHNvIG5lZWQgdG8gYWxpZ24gd2l0aAo+IHRoZSBuZXcg
dmVyc2lvbiBvZiBEVCBiaW5kaW5ncy4KPgo+IEdpdmVuIHRoZXNlIGNoYW5nZXMsIGxldCdzIHNr
aXAgcmV2aWV3aW5nIHRoaXMgc2VyaWVzIGZvciBub3cuCj4KCk5vIHdvcnJpZXMsIHdpbGwgc2Vu
ZCBhIHYzIHNob3J0bHkgdG8gYWxpZ24gd2l0aCB0aGUgdjIgRFQtYmluZGluZ3MuCgpSYXltb25k
Cgo+IFRoYW5rcywKPiBQZXRlciBMaW4KPgo+IFsxXSBodHRwczovL3BhdGNod29yay5vemxhYnMu
b3JnL3Byb2plY3Qvb3BlbnNiaS9jb3Zlci8yMDI2MDYyNjEwMTQzMy4zMTMzNDY2LTEtcGV0ZXIu
bGluQHNpZml2ZS5jb20vCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
b3BlbnNiaQo=
