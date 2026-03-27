Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FC710F284F
	for <opensbi@archiver.kernel.org>; Fri, 27 Mar 2026 17:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Vz/3ot4TAze7VT4/fmdMxAy9+gzH6nNtoaQtA8IKGgQ=; b=kdw/qOV9BgJgrK
	Od8ZVHM9lG9RIuUdhDWhUCk4CHIznbYzcFPGT2ec960UUnowbRXLGtUnRH7yJvxtP2kVLusZyGERK
	iUliZJ084jPosa8/tJGyRNb/EHUt2p6lHpKRDChbLJW5GSJ2FTzWssCVK1herFQQpl1C+V4dIe60T
	ydmZAHIcFENGV5+imf7qc22OvRATHmkDvSEZrdsSzyls4ZIvn6E5/RIqXzTsqMVo8B4nMsN6VPxh0
	fifYr5EGvScZs2Fh3763Y99ZijL6BBBQ+8PdJXoSGWgtP4K4SrD3xhnTFcZ8iFatmBkdta/3yV2ZX
	UWSGc7YEy/rJPnlf4f6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6An4-00000007qT5-3P3J;
	Fri, 27 Mar 2026 17:16:10 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6An2-00000007qRx-3Yx1
	for opensbi@lists.infradead.org;
	Fri, 27 Mar 2026 17:16:10 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-439b7c2788dso1430392f8f.1
        for <opensbi@lists.infradead.org>; Fri, 27 Mar 2026 10:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1774631766; x=1775236566; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VmzPQEmEc7+0IXJxGy1g8RiprZdMxPdTcqfrlzvLGxo=;
        b=TxFZye5mCtxyxjm8hHEl1fNk/tR+4QOuEunwfvESGRKRvgOJAhDaUh+aAxNMhii4BJ
         ve8JsVsYjDGaUyN73fD9Qbn8uhIIdh4AGtzmjh8HVtiZ2VtagVEh2PV3y6fInOxQY+Jk
         kl7YqwR9DPD5vlgs5geOpyaA5rzLPQPoTgKHnPxJxsSkL3ClVnpPTb/zpxJJA2JrPlb3
         ZCBTIo3QuVjvbul5/LBAJfiq15VBte8XHiD1b6H4IiyxragGS8fFDA6XYYa2RuezE2Ws
         aXPCy3nSvQJjEd9JFZvZskOwobW0zqrZhR7MeF141k717IWLQXDOoB+KBgZaEpHZ5LmP
         Vc8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774631766; x=1775236566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VmzPQEmEc7+0IXJxGy1g8RiprZdMxPdTcqfrlzvLGxo=;
        b=DzCYLHNmkPU68gSzZSMGFVQtI7GxSlhp887rPEhyUIzSNsNKLyM9e1GQjHFgM3Vhb+
         hfyAtWyag8PwhwE3QujLjiiQGI1PNO8ENcP3lGxSYQuXQT4nktWM2OXwmWVjSsqaIrki
         mr/5fcHf1H1yokDCV82fGND2ygHhRD8RICmJiDiLjEjmtsBRXZqvEKLKt1V+1R3QQ4a7
         nq8iUJoxcJybe3gXd4RmAQyjbdH16vj2UAL+NNzLP5AORkTP9jf83Hefi2gT5n0yBf/+
         /LQeTfNoaTeR3pmDjEvGgPDg6KrEaCvgvwQwlcssisxBL4InuBmUBui49e8rt5AORFis
         YCng==
X-Forwarded-Encrypted: i=1; AJvYcCUalhbIZS7/ZJpOXqQSwmB+mPpFdwQ+15Jg82UWdR87jH/uYynZjJC8XEZ+fnK6iQGNoGCLxu2Z@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6HLH50/mw/7bWK4QGGBWdVsQ7VVvJrWOqj93qE0NcOaa6dAp5
	TOHVBLm8DtHrLg6FJFBH+RF1+EtE8TEVND3wx7TwxZJiXEcwgvGlWc/6hoke0FHzD4M=
X-Gm-Gg: ATEYQzyA5UY2BQtnQ0R1fkoNs55eRB1pLCukmyfJ96XKtEMC5Y7Mv8E5SDt3Wpryvi1
	admsexOZeEPPhCvGzg06aK20bqJsDPeNuqcExDXPugE/PtEUfMmHwy1bzCVxMOrFizm0Nd2LFQJ
	oL3piJukshx+Ih/1dnCFI3agH4B1xOgUUY/+1ohNW4al4fon8gg8NbfB+JiBcsV3MsUcXlLSnhL
	HQhOgUzxRZyf3DmxkAxquM/H29mqD8+dneImfT1HPTbMN3H3gmD5FoKt6glPE3qcICoMfoe2pbp
	3xobtm55+tCmLNk73ZxwOFQ3KuTE5YTHYrkAuZa6Cd5LIZtnqSFNYd8U3o+SEfhXQBQVITvACRM
	58N3gBfoRJLFOb9falXgj0RZevVoPRdRgOIrmLVgsLusPqinic01A8ZaNLa7rN9YFfOC56pSYJT
	u2Btco7hPclTWMgfd+7/vIOxAnxh5JeE3s0Mv3e1XR13GJzADwXrfZvSa/2DQ8BJmxeNN57PhwT
	TDjJQ==
X-Received: by 2002:a05:6000:2284:b0:43b:564d:c123 with SMTP id ffacd0b85a97d-43b9e9d5e6amr5763454f8f.3.1774631766455;
        Fri, 27 Mar 2026 10:16:06 -0700 (PDT)
Received: from Dev-EliteBook.Home (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e3f9sm17150785f8f.7.2026.03.27.10.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 10:16:05 -0700 (PDT)
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
Date: Fri, 27 Mar 2026 17:15:58 +0000
Message-ID: <20260327171601.169103-1-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_101609_142836_94B1F7F1 
X-CRM114-Status: UNSURE (   5.06  )
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
