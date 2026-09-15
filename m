Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C53C88E75
	for <opensbi@archiver.kernel.org>; Tue, 15 Sep 2026 06:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QiuOKpHIIB9aJTHB7jQ1YbG3SR+UH5hOTONvbROy/n4=; b=lUYdzT3z5plLIV
	/fOXvKTAZYqRrF2kPBMf1Mbl878HfcTNdn+cyj9BUq3L7u3c6lgLHmVtEPFgJGLRE0IRKiNcap+Ks
	yrAAViXYm1hH8XgZly3z2quzb94XwRjDj/51I4sG6IGc6m3NB1pra/LHkWo5AJYwxXrfdzDGACpE7
	FzUY0PEfmwCEzvO8zOcSOQMDfsuNmuRTyhv8rdfiVyKlKsN13/e+YeSfQx0p25Lqmo/Ok2Kgy8aBt
	ucwDwhQFBAePShZ3wqtUvBSK5TD2Od18ZFi5kJuZbk95qXCKSnesPpYNyRbD+pg7CWGZHzpXjY51f
	p8GQz1X+Wu5eju7oOo1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6MxW-00000005NVV-244y;
	Tue, 15 Sep 2026 06:48:02 +0000
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6MxU-00000005NUd-0w0C
	for opensbi@lists.infradead.org;
	Tue, 15 Sep 2026 06:48:01 +0000
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-5c9851764a8so625431e0c.2
        for <opensbi@lists.infradead.org>; Mon, 14 Sep 2026 23:47:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789454878; cv=none;
        d=google.com; s=arc-20260327;
        b=VjnUVJD7fB9HgF8xiJ5Pg8dMiOrWE2j+E9v/R6DtJBf0JoE3RmFnvgq1xHfwK/OtqJ
         dFO8IePvTFpMRbSqvh3WmX4I52m5GZr0LTc2b/z0lsw2Bx2CVdwIx3/yVDQIXxe1Y3qM
         Hnf7BNil+WbU9Q0K0IUv6HEwBslhZCmZyJXMliCOJrfwEaFbStYh96E5HDAP8zGRMi87
         1LwbMQpVPScRo8t6JoMr9YmK0V1w7cTEmmpRPzJ62f/4sfL+NMwLdSA3wF+0CIcxouT3
         3uTfvw4o+15su1sfi9aY9f5NgIOQN9jJ154TCbC7VdnZJXzoi/8xModoCW8hL5Me3k49
         uX/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=esQdfJTJXteGYFwNbx7NAEny8cs2auIuVYfmXIx8+Lk=;
        fh=UeEtZRTkxKCY0dDrSlBwJELwBYPbryPqFzipvp9MKzg=;
        b=aAIttoqGUdGA3eWZ1G/fvqWOXsZ36Sou3O9uPrB/FFLegOeHM3lOg/EeYGB9d+kJIt
         H966Syd71YaYSnf7OxyeuHSbu/h4qrppmnEH3vgDfq2rRXcDZG8O1DpV0TFAeMbFRA6F
         lBc4BKsUfcOTLhi5B1bgZC2hgtUpKx2v4OmDaGHtA5i2oMwrY32ASTIT325Ucoo7RVqR
         ekJHPDCUpV0hEQXXBwbGZ2vvXeatKsPnv2Fv39sT+dtirvq2WxPgRSggi29VJruzUXCF
         aaLbbpSctbVifysTcLVLFpeqsu9Z+FRjLPmBztzGwJVIZ9P76Np3zuMHpdBTLUBagBZ8
         p58Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1789454878; x=1790059678; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=esQdfJTJXteGYFwNbx7NAEny8cs2auIuVYfmXIx8+Lk=;
        b=nIV/eNWRC0WyZibL88S0u6jyWHobYC07Vw8tg1lhEkFkhhKP1vx490D64Ge8LupUI7
         VmVUTGmKvaQy4jZ4DfoVKog8G6YrnZvmVxJwXh+I4ygkBb+FitZlckRHfavxTkd5x/hd
         FbM3oM5AOiBVr7zrRhX4uCUNCK5VD6++8NpVZn59Y2bc9pg5QqRkku8WgD0qiH1OSV2z
         GPcxBud2QYuZKMEO8ayenSzrFj05iFNg3usEaJBhqBJrZOs6MoAYwbl9+G647KhppNXZ
         9m+e/7aPJyzf+6ywHw9EdaA4kN5q5RDQBmk+S27dK2xpk1VM9C/bqofshaRGdYvJc+Ik
         5eiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789454878; x=1790059678;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=esQdfJTJXteGYFwNbx7NAEny8cs2auIuVYfmXIx8+Lk=;
        b=GvNnIbhunAT1NsVKaLUzMSxPHDCPcgKulO1uXuOvHjBK0N7y1uhaYOUwG3eaTRP25k
         /RMsRtCsg9GKu5c75dlWAG16wxlNvyhUske7MApQSUlMOIONbpDt50Q5Gxx7UKecDr5H
         UJapRc0OAokyXxs6VLGWkHrTmZaifoZv23N6uwl5J9SebGyq68WgAVZwO2LYfhaKyOVx
         +iCHk3cW9gi9XfBGJB3mIbfu4JlyM7Eg+6mvwECgLIABX4aTtVde6CmxZx7RAWKm8T4W
         GYq6Dcco/mBW1xFbcIa024MJnn6KlDxwGq3TlBiSPZ15PGTJk19teFGBizcYDCWnz5F+
         jZ0w==
X-Gm-Message-State: AFuF++ngX3NthLpc7VOnIqV1HR6/jt38WlfqmMq8b3deQJ3eBiTpa8xG
	uA7lms0TOY/9ImEdmmW3bY6+2Cz9pLGBFjA1dgK3Ux7zXDY96Dgyhy+G/HhkCc4OnRJA1mTTw0r
	dT2gfJYRA308aapjsW5LSs5eKFO9gsTz2BDcikkkc5g==
X-Gm-Gg: AYBFou0eyLQTcZJlDDswXTdtzv3TDbpgd596defqJWDYRFfG7pc/QJF88eWuAs7oFGI
	6gHlsPfjQnTafj9kf4TU9Pfm5gvz9D7y6HSqOVUHv6osux+e57JzNfjOUdkW0yKu+0XUjObhAG9
	Oozqti8P11t612/r5y3BpRziSEWnW3mwVvpj03GvsATDVrCoqPcM09mqr0LeHNrYjVILIAbIPYs
	juVzxVZlahZW7jUkIngR9ppe9cBx3fD2w5aXPtdV79yf1YmEtj0ZrcsMbSdpa0sb4XlqsoyT/6C
	ABssh17+vDFyDgUF0dKfDipI3ACBvzvyUEKfh4w0Wrx+dW6krsssiMSlAQ==
X-Received: by 2002:a05:6122:4b10:b0:5c1:25d4:e29c with SMTP id
 71dfb90a1353d-5c98187e811mr6940969e0c.0.1789454877896; Mon, 14 Sep 2026
 23:47:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260903-smrnmi-context-restore-v2-0-10b17506d257@sifive.com>
 <20260911171103.18573-1-evvoevod@tenstorrent.com> <CACpYXwCNakoUGui1SUSFPePk_Zw43oLv2BmicbEadF0OF+Tu0Q@mail.gmail.com>
 <20260914155759.21435-1-evvoevod@tenstorrent.com>
In-Reply-To: <20260914155759.21435-1-evvoevod@tenstorrent.com>
From: Nia Su <nia.su@sifive.com>
Date: Tue, 15 Sep 2026 14:47:44 +0800
X-Gm-Features: AcwNN1VVR4JUKAr0BYesdwQigeYi6Q4_pSvY6fZA-jzMTVWep0RIYG9t4NxhaIA
Message-ID: <CACpYXwAcaHUzM+JNafeUAm7usff0wo858XJc-M=t_CNn1O4heQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] lib: sbi: Fix Smrnmi resume init and optional
 platform callback
To: Evgeny Voevodin <evvoevod@tenstorrent.com>
Cc: opensbi@lists.infradead.org, Nylon Chen <nylon.chen@sifive.com>, 
	Nick Hu <nick.hu@sifive.com>, Zong Li <zong.li@sifive.com>, 
	Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_234800_269745_0BBCD2B7 
X-CRM114-Status: UNSURE (   4.96  )
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

All of the suggestions above are great. I will incorporate them into
the next revision.

Thanks,
Nia

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
