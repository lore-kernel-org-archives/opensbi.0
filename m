Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A61DFC982ED
	for <opensbi@archiver.kernel.org>; Mon, 21 Sep 2026 13:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:From:To:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Uoj1dLFm+BLSfEn6ESQhAd0mOh//rRdFwz4D/OnHX8=; b=key9zCOH12QbCn
	gfWjM+Ps2n8Oti1k3IfTQzBeVLDhdy+SkAb1PPWqihwO+6dnrUx9R9NO06jRzkTCuAjN+k+B7U1ab
	6KLVS8YVi/xK9ASkCJWiD5VJtoTlT1tuAn2jgcXm81+LfScEuJNfQxuLeYNIbVFy2u9AkHa8Ur176
	n3MUDc/iRatRWT7xoRuA1pYc8athk4yV1pnRWHmLMC5rmZcHMnwIwb2LD2TjoKkal5n5IjWTl7HyE
	N62p4v60sbEkIcYVO560Om2pn+LL6yOSnucsm/l1+U5seZ5U5T/iq41Vd4frFmWKMO9x1BAs8vwmr
	eqmn2MBi3jOyHCGG00eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ePv-00000002IUd-1heQ;
	Mon, 21 Sep 2026 13:50:47 +0000
Received: from mail-qv2-x10.google.com ([2607:f8b0:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ePt-00000002IT9-02sF
	for opensbi@lists.infradead.org;
	Mon, 21 Sep 2026 13:50:46 +0000
Received: by mail-qv2-x10.google.com with SMTP id 6a1803df08f44-9106feddbdfso26673676d6.0
        for <opensbi@lists.infradead.org>; Mon, 21 Sep 2026 06:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789998641; x=1790603441; darn=lists.infradead.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Jm0gc2hgtI23Zb2+ell7w19LYoF7NcHxT2HHOpVvWVI=;
        b=HY0ldIzgM6mwxso/Qrul3OBY/eQ/Rop4jYo90BiOwHAQhpWRUhaRg1fus63NZGM7ll
         iM2cDYI9x+22q0VXz9JKjvXyNojS5fw+ARk724nKBznaoq9DCnXjvUw7Hczr/d4/ScSI
         zSe2sI34S7o+4BYCAmyODLXMXtFIb1S5rg4WUqN42P2/jHTCNOOhPmp5CsqO3vYIzJg6
         eZWjPCMXKbX2se+trtr1Z7jERJejb2yFZrgsOQKwUimYZmU+fmyr8R0xtfJifMJjOmSr
         Tz/MtSSETq8sqfaNt9lPejKNthohf7JPMgId2yDHys6PIaSVqkjNEUIWHF1V7JWEYBX8
         pu9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789998641; x=1790603441;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jm0gc2hgtI23Zb2+ell7w19LYoF7NcHxT2HHOpVvWVI=;
        b=eJqEuz/BoK7HgYwM7AEDskPQLAqdbtLvttdIcKetrMyBcqb869JN/mF/3WL7h2Kj8F
         GFP4W7MUpD0Lc/NQOWX/JFyzPfDDHEr3UoGY91G15cYPTPgxVmdpU15eGmJoeBcMCW1J
         L5VQQbg+BT3I7VqNR/YBGDxLQypLbVWb7/eq5b/WTTXV8WeIN9+j0fUILA5yDPG4wiA4
         b3CrqK0vSBBqrfvquU7UIHcM+ZLMtsRkDUDuEObJfqeZO3QhIjNA94+4VgZV9Rb2L7ST
         2afJjP88nyhVfoqemH5iEhu0+SlYzgzmqekK9A0Q5H+nLdpmQwSVW255yf6RhOgvLK4Q
         wN+w==
X-Forwarded-Encrypted: i=1; AKwUvBzRohn6DMqiNIG1arP/jkvAr2rGTaCfYJHkJXOayp5jsP4tNuFDmI8jwO7WyaHLSn/os+4LMTXp@lists.infradead.org
X-Gm-Message-State: AFuF++kyjOFtuTbPRFj/NdlsnDFH+APn6o2F1hu6ub4K88n/6KtFt9FV
	PaoujIzzvKvLzSRuN+OphIbLSuuttV2GfHBwRM4CSXmfL2WuhOv9UJrbQsiaEf4dU4s=
X-Gm-Gg: AYBFou2OvWDBE/iuu57OiJoU2wf0jNzhBTxSZ83T4WejzTXfDbfZlJ50Se5vfp9KJ9a
	d5+EIm9OO1n267fISfhDczHDsPuyzoIUHbt7qPurmPDGWs3pDVwFnpClUPNLV5GNTMXNVXTKFA1
	nu1bATtpsjecXCyrF/oH7s34N4t3/pOPZYsWllZsawTS82AtFE+1sWYz2hYQ6UqdibDvij8Swsg
	uYsGqfZzyI6W+sA4XMUItRL7YqKI+JUOlbbBmYoVHnShWWiVHEXAgqwOfFNHgsTPcvp2QBroMUM
	RRzrbJRQbaXWuMJkCmW3FOYXzkfBR2u/KQP69PLWGL7iKDWdwcILZaDe9BaIXoBGj4T/icdy8Kr
	mWqjIvt3uFBrMHL90UgHDt+vkJ1CyMbQARmtR+swNwbkI+YCNMgYm5wI+WdlznSAqmQNJ5M35qJ
	XwZhUB4PtqccKo6ijb9OQSQswTml03D+bZo9JI9p46w17UmWBOzYqoVNKAOKjgCHx6Fx0aWSS4U
	NQgAde4o+02q0XxfTC+XoMYvuqoU6kV8tM=
X-Received: by 2002:ad4:5e8e:0:b0:910:c44f:a81 with SMTP id 6a1803df08f44-913fc8a03ecmr7691096d6.10.1789998640486;
        Mon, 21 Sep 2026 06:50:40 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:1977:be2f:4a71:2892])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260aa15cdsm67921166d6.41.2026.09.21.06.50.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 06:50:39 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 21 Sep 2026 09:50:38 -0400
Message-Id: <DLL1K66Y085U.EOAJ6C1RLL6Z@baylibre.com>
Cc: <carlos.lopezr4096@gmail.com>, "opensbi"
 <opensbi-bounces@lists.infradead.org>
To: "Trevor Gamblin" <tgamblin@baylibre.com>, <opensbi@lists.infradead.org>
From: "Trevor Gamblin" <tgamblin@baylibre.com>
Subject: Re: [PATCH 0/3] Makefile: fix support checks that use grep
X-Mailer: aerc 0.22.0
References: <20260910-makefile_extension_grep-v1-0-b3ae0d456a6e@baylibre.com>
In-Reply-To: <20260910-makefile_extension_grep-v1-0-b3ae0d456a6e@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_065045_054306_EC1D98D0 
X-CRM114-Status: UNSURE (   4.19  )
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

Hi all,

Checking in on this series. Do I need to make changes?

Thanks,
Trevor

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
