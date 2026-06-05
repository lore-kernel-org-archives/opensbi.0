Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C38DCD6E74
	for <opensbi@archiver.kernel.org>; Fri,  5 Jun 2026 11:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZruFU+4cPtQFYT0pws9wT5Pd0xtoD6bVFoyZfpYbC3g=; b=wDGLjyielvCbj5
	Gu3hVUCP3r7kYBVuR7NF5shFW78+SaGizWVfhpuXkeHWOjMc6hzkSxihzgJaRMtac9TaElc33IOUi
	C6qJXOSKidR8+ZmPy6BIcVi3Tagvsx1JN0hGpgYJkb6vO/POF35gLjB6vk1ODG0v4GVsNLOqcqdpF
	Aldabc/m0PpqDyXuWWx1+scmM1QKItWYth5FW6mthkXS2PSUlrNiaLUb4jWb5RCf56dnJ/i0afwEZ
	Q8hKehIEeUjMJFe2k0Y5CMCL4we/UoIdxZeWv8pr4UDjadUxleC9fJ/YJI/eIgikRT6E4cJU4wJgk
	jJP2rHAxxTI4p1d/JTBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVSop-00000000XoJ-0nqE;
	Fri, 05 Jun 2026 11:34:31 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVSom-00000000Xm7-0Azz
	for opensbi@lists.infradead.org;
	Fri, 05 Jun 2026 11:34:29 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8422a92b6d6so961726b3a.1
        for <opensbi@lists.infradead.org>; Fri, 05 Jun 2026 04:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780659267; x=1781264067; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQCwP9xc2akSGMqTwh3S26eoLz7OR5pjAhKTJwPZWfg=;
        b=CU3tob0xp7hP53gMUA+zDjGCZix185h0W90+tlvmyRHQa+/Tr6u8x2gUerEK0jIO7l
         XEGXX5b8nGAR/bxC3Y7P0gQeVyzyILgmDNKfwrt/vLiOFB7b3IBPOkBLBvp8v+zgxqn0
         5EiepylbUhdV8Ph3TAK1B1ML/o4r669knzZiomzMXDGnNr3gYFhoeFd51mri5QRVFuaB
         1uAQ/Cz4NmbpoOua3xqsbqfbWqKxvN+cdWg/pO+g/g9aNL7QXkaAnPquGp5d0lHe7nkH
         YHTF3UhJ/3zN2u2sVffdcBEQl+fL0szWMMEhmRIrumPVNRqoEs/1ZTze+mrsWn4iVyDd
         tm/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780659267; x=1781264067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bQCwP9xc2akSGMqTwh3S26eoLz7OR5pjAhKTJwPZWfg=;
        b=OZa3xMnICgiF09vzB3PJwzeaCtuXbj0GO5Ko+USYdVbSwoEox20zYYnXu9BeHg0Um6
         8KI+vdaP0nSPYnJFvf5R23U5d1si8lN+zDxbA4ejLu85z+MW+CjzJl/u19inx4cj7l2k
         sHXUNFm85T26HI2na8ZObMkft7hV0jpV06uzkaZlThFARIXHIfN+of+GIMrGgLddfb3v
         JdxSORJTYc8pa80ZB3KAT5lWuwBFfXk7hikIuAXBR/7QcpA0WPOpW6WPtjeo4v6NAtTV
         zSlyk7m/WK55mIuvpxplb7MPsHqvD5mqSnk6jVPl+SUoVzHj1S6J9UWRnQM0TczUwSnb
         GE3A==
X-Gm-Message-State: AOJu0YyTiDei9obf+qBV1XmDHjERlTVNqf5fNvT2q5KBI7qjyywo+EmI
	ETLPFBh6/bchWaTcJGotDTcP3w868RPOJXH/i2vAisd47/8sOZfbUcmZ5mqK9A==
X-Gm-Gg: Acq92OFTw7zHAi0/oR4sGhczW29gcztxsi2CXO29RxG05ZRVI+7JnAs04K3WmYFDDZq
	4Y6Lv2JoDfrQEsz68a7RwGUldRFq/xG0lGt+YZ17pP1+Nmc5KzQ/XQJEBfpIcKf7efa3Efb+atk
	/V86T7ALaE78iiqSFMBZD13je2MCr53gxk1ymkLOWOU6bdnzWetvEQDC9iJ3uK665o0FTH9OqwD
	K0XgqYa5tc9FVWxOGSTKPcoKvdPR6csroVtaXmJLFs1bV8iUP2Bxo3gGjSSGpKZ60dmt95bs/hp
	ShF2EBwjbBLy969ZiVPqzNQJ/YHl6esu2FGnyOCK6X9QhhrqBB5Sm/RHrOIs0lTAIXPf+vVd8z6
	NdoXezoZnjoHpId6jbGUsz2VCWIIgsiWwV5x2T7jtADyB/AQ2Lk4R7owNgsCgQwsD4bJ2YRzCVj
	6OGIOzD3KZANSXQHTUSekMgtpg5F8Jkl784Ts=
X-Received: by 2002:a05:6a00:2993:b0:841:a0c8:6e9c with SMTP id d2e1a72fcca58-842b67cb7efmr1908918b3a.26.1780659267495;
        Fri, 05 Jun 2026 04:34:27 -0700 (PDT)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428222263dsm10141414b3a.2.2026.06.05.04.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:34:27 -0700 (PDT)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org,
	wangruikang@iscas.ac.cn,
	dramforever@live.com,
	andrew.jones@oss.qualcomm.com
Cc: cleger@rivosinc.com,
	pjw@kernel.org,
	asrinivasan@oss.tenstorrent.com
Subject: [PATCH v2 6/8] Makefile: define OPENSBI_DEBUG if DEBUG builds
Date: Fri,  5 Jun 2026 04:32:12 -0700
Message-Id: <20260605113214.242-7-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260605113214.242-1-ganboing@gmail.com>
References: <20260605113214.242-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_043428_593893_C12F6BDE 
X-CRM114-Status: UNSURE (   7.17  )
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

Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 46541063..6ce3c11e 100644
--- a/Makefile
+++ b/Makefile
@@ -451,6 +451,7 @@ DTSCPPFLAGS	=	$(CPPFLAGS) -nostdinc -nostdlib -fno-builtin -D__DTS__ -x assemble
 
 ifneq ($(DEBUG),)
 CFLAGS		+=	-O0
+CPPFLAGS	+=	-DOPENSBI_DEBUG
 else
 CFLAGS		+=	-O2
 endif
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
