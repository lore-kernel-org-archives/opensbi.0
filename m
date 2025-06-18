Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4DC1C71157
	for <opensbi@archiver.kernel.org>; Wed, 18 Jun 2025 06:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FtpzLF8zcN0mllsR0QklT8NaGTQ+Z5O8kjM6A50+QaA=; b=DivhWmBGVa1V8G
	aRdJMkwTz7z5eSEmBQ62MpXD5VhApwwqEUJPxk/gxZWvaTFbZSXozgulaZqVYuxoB1QM0ICNB//b1
	sSKswlHOzmwypKdazTn3XzuPzT1VKDbCwb/EY5GYNetGMjy4xPXCLfUjrBIyyCB6uomsS+/NmITff
	hvSUgxn4GXCi6c8VvtcAv6XIxcbFdDcX2+N9U+n8ZF84ePlVUGgmeC0NufwdYPfspaVyM9JrFei1/
	TBvgzi4JNVsXvwfaYSZPDU3TXgrUaxv0weHvXUYhxfJwlgeojvPahHmQlfx7rF2VrRK5u8gtpXDB6
	xp9/Q7rWUgpRruQOoWww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRm7x-000000099hn-3g9C;
	Wed, 18 Jun 2025 06:18:29 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRm7F-000000099gS-497g
	for opensbi@lists.infradead.org;
	Wed, 18 Jun 2025 06:17:47 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3de1875bfd4so11208415ab.1
        for <opensbi@lists.infradead.org>; Tue, 17 Jun 2025 23:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1750227464; x=1750832264; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mM5XJnowcg2ZzGzUHbJ9gTfCJBCHq+x+kZLKWCwJ0bc=;
        b=fuslmAPqy0pc6oqvr8RxjrgTWlTTnX3KthXjqMgQODsS6OJBEORH5/X/aRwTr9uOOU
         qEpWWIvxWSAGJPxRblHWb7r/ggk8B0L8aIPr+ubcWx8MsOEf14oZIGOSD6KCbbijqlHl
         husI6Bl5E2/9Y83VCfjFZ2biEnJcI2QocBCQrdE7WSvPY7LhyscQ+75hvRI5PwgsvIK0
         3H8Syom5E34F5BSkDS/yBGCMD4THFNWHO3SH1PF2ox8DsHB2wSVpucQAckeZ8Bt2G/3f
         pnFqsBk3UrrhXBaVexMDGRlIxJdsWu+yie70VrmT5hd2/4I1C5Cx3wW+PCD4CKuiLrYM
         GkZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750227464; x=1750832264;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mM5XJnowcg2ZzGzUHbJ9gTfCJBCHq+x+kZLKWCwJ0bc=;
        b=rNM2I1BbNp0KgQxKbizLfz8oSUO9Bq7K6yWp2Miiv4iU+lh2pyJJRHk1jJ6sgjkjy1
         jmPKx2l1T0UfLK0Pu4lo1RKm0Vt7K7WfE6cRX2hk4jnCNeVC5apqEEPGXCruzJgo9NaI
         +Iy5GA1E/ZvD1b6uN3tbhfk7vP5hKnU8TlaWY7GY6iVVPeXJDZInJ9Z76WKf/DlZ9+iZ
         EwrbCNZshXh60hguV2pZi6Ce6l0S5bG0525WV8eN/+KoyhACAz+MAFvEIy8yGvVy6B+R
         1Rz4QLLQcEEz8y4u5APB735ZevFvsI2td8GQdApxHyqhgGH3JhPquZFeaumHVzoUsK+e
         H9eg==
X-Gm-Message-State: AOJu0YyMUJW09hYvJ5GvyGqgPgZaBkLdhlm6PiceT6ljD+XktaVZms+R
	0I+Y+qIgcngi5rc+V9EKlJALMvmnF9xpsMq0+hQGiWugLERG5iH6a4CMFJqhcg+A3j3iF/FC3J8
	kKwsC2rkGKFlVSG8fn0rQ6v6f63H0yJO5km13DOy2nMacaZM2Zg3X
X-Gm-Gg: ASbGncvBdO/a0QNQ9Mxs/QhfTM0SMghZt3dkg+QCO0u265kTygMjz9kGd3Ncjaf4vcg
	uqwMuuOXvbHxSy14d4SzQ6GVh6cxZagWvVzlaDww4uxNbk0BkndVMBZpil/C6gWdztzNcxJe7B1
	MxZkyv9JHb2HhFShrR9zwAxssflUbyJ6fK4tqwNT6Iup2R
X-Google-Smtp-Source: AGHT+IG++1Xi3DqlnywS/0LkBncvNT27u7NDCNfoPHQSlnGWqQE5vdnx4peLaDGC7M59TQKYRtQ61eOvFONJfKay/J8=
X-Received: by 2002:a05:6e02:3786:b0:3dc:8423:5440 with SMTP id
 e9e14a558f8ab-3de07c4506emr170483305ab.0.1750227464400; Tue, 17 Jun 2025
 23:17:44 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Wed, 18 Jun 2025 11:47:32 +0530
X-Gm-Features: AX0GCFvo-pAsX0Bgn7Lodj7GbeK655L5LNnDJeDbG6wrJJMqu9TTBkB7pdgGR8Y
Message-ID: <CAAhSdy0AWsrDPaETOukFDch5kC4zEpNFAyZjvzRT4hn3DSiE-A@mail.gmail.com>
Subject: Upcoming OpenSBI v1.7 release
To: OpenSBI <opensbi@lists.infradead.org>
Cc: Atish Patra <atishp@rivosinc.com>, Atish Patra <atishp@atishpatra.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_231746_279165_F379B49B 
X-CRM114-Status: UNSURE (   3.52  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

Hi All,

We are close to the OpenSBI v1.7 release. I plan to complete this
release by the end of next week (27th or 28th June 2025).

Until the release happens, I will be mostly merging fixes and few
in-flight patches. Regular patch merging will resume after the
release happens.

I request everyone to test the latest OpenSBI on their RISC-V platforms.

Best Regards,
Anup

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
