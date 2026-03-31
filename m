Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE5FFF60CF
	for <opensbi@archiver.kernel.org>; Tue, 31 Mar 2026 05:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Vz/3ot4TAze7VT4/fmdMxAy9+gzH6nNtoaQtA8IKGgQ=; b=2jwL4XShqef6uI
	NNpICyDlU5O4LBU4G5yRYHwNpO+mDw3yftqluU2bBeeg6VgImCTxFS7/PDaveHeA0wCe1OyjQEvy5
	3kqBsy6so+LU/R5hWd5xVJhT7V3YbSZsbw92yhhWNisdhn7ExN422uJrXAeaSyqxOUXVQJlMxFZ7A
	PZxvmvk9Z9xPKr3tAGfbN8hyKPkrX4koO3QPN1jHk1Klp3gj4GXhfpfgG5FN9XPF9vkIzwI4skjHw
	54PoxXmrU+51aNO3q/jFOuBbrOT/XpwmOFlum8TFVaub7xHarDN3hKLNRMERsoAdFTz+NUoPqX7Ft
	PFN4dgHjl6phBUewJaPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7S82-0000000CKYL-2BWi;
	Tue, 31 Mar 2026 05:59:06 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7S7z-0000000CKWn-46Dr
	for opensbi@lists.infradead.org;
	Tue, 31 Mar 2026 05:59:05 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-43cfd96354aso1086588f8f.1
        for <opensbi@lists.infradead.org>; Mon, 30 Mar 2026 22:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1774936742; x=1775541542; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VmzPQEmEc7+0IXJxGy1g8RiprZdMxPdTcqfrlzvLGxo=;
        b=KcbR2j8cX6jY1XFQFk1xUlzVF4zJam+sC29dG2tMAtupWalvcJcXW2Di1jdy24RDLN
         Sevmio2nv01l0OXO/YGFsmubo31DIkoAnFUtjqn5k7EfOLk7M3SnGAZ3GTmjkAjECz6K
         qZbKH798HunT0Sf45e5ywPl2aE8imOz6TzSbmQxo9YfCN91K3m73qbiBJ/bop4dQnlRn
         6dN3RIk9nCCuIBjL7EJn6gSsGVsSP1RQwN3OAQIAvZUprMypKe98hfYyDFak9VKN0Ho0
         3YJ8L/Bp+diBbv7aPc4tzbyad4SDfifokusd/Fgr5inpH+cRixpW3acwd9Yr6HOmqTRr
         c84A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774936742; x=1775541542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VmzPQEmEc7+0IXJxGy1g8RiprZdMxPdTcqfrlzvLGxo=;
        b=mRf2czMSf9Ax9SvvBKuS6MWdfx8T+4UHcOPj4xM+t056ZeiF2+TqJt9eR+bemUqka8
         pz8bsGpnuaK775k0MZlOmLS1v80+0m2QtbAjY6mn6Dq7sKmqh/2aZJzlWmvHAfgZzyJo
         K3h4UbLQ3KLbkyHFFx9SWTJfHyXoFUFw+Im+U+Qx2swCnHrL/oLkmahWky5oBxjLqkUs
         aoaRxFvvvaqxdvFXK6r+077j6iOt1zHABWdItA4Msvosk/0VcR212v9PDpkDsle/A0Ts
         1TZiZ2eHY440co/247hcy6KInvq6IHI+Yz6lZdIkUe9myu9UApcUMXn1ci2/F6soJo2Q
         3VKg==
X-Forwarded-Encrypted: i=1; AJvYcCWpAdB6RfMgQYPd3TFUo8O1FpRm4GdyrfXuP/97MidVdVJ3KPytZWRZBN0tLP1c0nQRjWAKurTn@lists.infradead.org
X-Gm-Message-State: AOJu0YxizNhtA8yaKBDvMVyhxpSkWLRhVzWJA2HAnoHnDvdsQVU5nrsI
	twS9KqgEJqcQqSkMmK3YEiAMYW5boH+g/dKXRFm5yeBLVfpOZuMUa/fqKdgHe4Qo1dc=
X-Gm-Gg: ATEYQzwoHWuLyviicAZjtG61txB1/KBaKC0yChFO6ZIFZDidkbdZV5kYFOruh0EgS07
	ZhYQP/e770kIRk1OiLK+TMYF8lgLn/SuU0Wd8b1fSwslNEyg+ixhrczm48n8SJSTjw6e8XntVmt
	edp3wrF8vW66gmvABqoG+NRrVRVLDJydmUX6ccOD4G0XE8pV6OJqF/p9jWyXXhsICM7ab3yPU00
	hHK069/NeOIKNAuIx8E1QIbW8/PSJQwquMRAldMcoWCzRXXUupnwWryVgy6tvTMyPhyuZb4BF3k
	14vMlnElei5zlcsY3a+Pf2FRupb2CsFwpxzbOIdVw6Un7U1BpX7kJcg1OCPt010pdxM4i4ft56u
	x9iRJc0oM4fTHyDbVwLe6+cL1y/MTHqtDYScxrqQGZOi6Xqnz/xaQuf6JaHLDLvjBzWHHmLhxEo
	cctDPwe8aRiTNPEkt7MFXoSFxw7nwbj0CYmM11UIeiF7cBUiIhA8+dgnll1DrrnRwkvRMyr22EY
	/mMVw==
X-Received: by 2002:a05:6000:1445:b0:43b:514a:ec78 with SMTP id ffacd0b85a97d-43b9e9d5a20mr27163812f8f.1.1774936741390;
        Mon, 30 Mar 2026 22:59:01 -0700 (PDT)
Received: from Dev-EliteBook.Home (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf1db08e6sm35915544f8f.0.2026.03.30.22.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 22:59:00 -0700 (PDT)
From: dave.patel@riscstar.com
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Scott Bambrough <scott@riscstar.com>,
	Robin Randhawa <robin.randhawa@sifive.com>,
	Anup Patel <anup.patel@qti.qualcomm.com>,
	Dave Patel <dave.patel@riscstar.com>,
	Ray Mao <raymond.mao@riscstar.com>,
	Anup Patel <anuppate@qti.qualcomm.com>,
	Dhaval <dhaval@rivosinc.com>,
	Peter Lin <peter.lin@sifive.com>,
	opensbi@lists.infradead.org
Subject: [PATCH v3 0/3] Add eager FP and RISC-V vector context switching support
Date: Tue, 31 Mar 2026 06:58:54 +0100
Message-ID: <20260331055858.305207-1-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_225904_013377_C5EF9776 
X-CRM114-Status: UNSURE (   5.62  )
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

Hi Samuel et. al,
                Thank you for taking out time and reviewing the patches, there
has been some insightful comment and appreciate your inputs.

I have covered all your comments, please can you have a look and let me know.

Thanks and Regards,
Dave

Signed-off-by: Dave Patel <dave.patel@riscstar.com>

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
