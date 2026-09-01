Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B96C624CE
	for <opensbi@archiver.kernel.org>; Tue,  1 Sep 2026 02:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jMQlvuOqK4RVgHypqMpVh35FMxl2DPyHPf39yaTGw0k=; b=pXeSk5IBtqXbfE
	FMBORDdX83pC4WzvJjI90JNETlIiJPyHDXL9gFktfTEJFmpkPYgvqfuFff03rggTOryH3IdDkrQB5
	ola+0R5hrPOynK7vUBy/QirMVvmDD9IrLViSGepOXFvPxVzNj889uOnBNbWioQhBk/HOnQlurbIZI
	yYzDo9Cfh+sFLjG1r8HaiFqLMxtfTty0KxdfMCZkwtuP2+vZY6aNiskUpGoHHrmtitF5tHzhx5sUS
	gDCmnOYoWGZWqhJZn/EThcrtpXj+eK1j3jkMpgBzcn95D+55KQjVpwN4IHkm/ehka8TqQCfu8MdV4
	tgvQLpXnJGcToUqBa8zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1E8j-0000000Argh-1fmK;
	Tue, 01 Sep 2026 02:22:21 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1E8f-0000000AreT-1tWc
	for opensbi@lists.infradead.org;
	Tue, 01 Sep 2026 02:22:19 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-cc1c3c90074so3594736a12.2
        for <opensbi@lists.infradead.org>; Mon, 31 Aug 2026 19:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1788229336; x=1788834136; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HS5CYWUDMjA5vIjS9zsD1ItQVF/fpIGgEQNRmKHQjyw=;
        b=Wd1w7qSi4QhR5Xvg4OZ8kq3Fbc+ne9FlPSlmc9KIis9fBIy4S1VXwjcUsziI1jr5KJ
         rAtx6EI2kjYjnUzdytNJnEc3qNjr5UKvownq5k0K/EDzNOrP4+YFESET5UupsrLmVFdl
         FTDrq7OHLXNJ7zb6aIhEP86Gy56etSGlb4gS0cG8mMGLceahTE8IoiPVWw3WeCoYm019
         TqOQNtdodA0xI42hCDfDk7EYUHGL7aOj6YLBsodqtWs4TpLkCpqHNscHb2pcKSD+zfw9
         8zy9I5u1aHtkAddckSwfYeRxi7K36UO585pasDIK2yBBibUuao6DceSYnDE666ygkLoX
         FY+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788229336; x=1788834136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HS5CYWUDMjA5vIjS9zsD1ItQVF/fpIGgEQNRmKHQjyw=;
        b=QtAd8b9ZOtmspCeIakRdQIxSlHUmYkapONjtFPkDlWTEIZ6tKZtciVcASriQdV35sY
         KcOiNnULUukNoNZ5N+kZYR34tEt5vi+5iCjUBdjodKlFLA38WYlWc8kqX1xZP0+pl7hf
         a4ERyqdFIWTvYIndPF6PafVxWy1SPchw4XhIO8jYjMQNVsWWDGycfF6+ctHSfL6e/2mZ
         +GK19Am12OSv7HibV7QO1kFw0QqRIVSy8ClmH0hvvaxh/+1B9pqo2VqE/rSXfx87YLHE
         CT54Y3bZJRCPpRwKXXhKF44sn4ELorJ96lyPzlOBgrAkoEfNZhAc68Dov1bh9OEvU5ds
         ILQw==
X-Gm-Message-State: AFuF++k38PkcOUfZWPXoL5Q3w7xvHG90zS83T4HPEnrimszFBQVPEUXL
	csTXXuJ36r6Fx25imAeeRNbjxtgBFTtDFE/nEyttcLTv3lcKQB4SUT79TI/npXWdBh4iBgGMzQC
	Bf921Qc3Onoxg8BIMUDRPloTMeYT4O1X9hb16+rdOIwX4Jj90m4pLiybo/uAe5JpWsL+55zs0GV
	+Gpn7HSdUO89y6zzPu93gOp8qFEU7L4Cm1ErbRyQKnlg+fdg==
X-Gm-Gg: AYBFou2W2n/8DFf26TUB5ZqMs1T5ASZJ/UKNkUJTO8sPfuj+VsVQPvzsjLG/D2Es3hh
	00tV/qhw+yqpmzRW4VILR1jmM5ArZzfFY+cl7HP/zR/6H9N6uShTzF0tMKK5Qt8YthPVS5U/hVl
	LZxd+n5ADL2eG9E1gV7jra/Su3XmNWJyFlBd4HoVNMw6AJ2RHg/CJMH5SMr1oSPyEguNT54dS6I
	QIoZYsWRxJyf2EhEwdPEv3pGXrWMbDGzNBzqBfQSUcB2OD2v77+sne2uvlpuEcI7Wqgb/Huv7+Y
	PonZrt4l216hrr45gpH95CTMTawMfH8Dj8zhs+t8rLzm9fc1lFf41aD8HAo6mag2c0QUwgLtBdT
	oWNHRFZMthhZJ6k438PeIavtbWNbn6qJKGSs/czXJo+VYZwu0rHu9a9O5FknKFUW8vouDISSrne
	0vUkJiDUhsqO8PysmTphQXsJhosJZYN12cMz/nKLaKYdHqXiV/LDV563QZrE5dbterU/yw95Bo
X-Received: by 2002:a17:90b:2783:b0:398:9beb:5c19 with SMTP id 98e67ed59e1d1-3989beb6352mr32610437a91.20.1788229335828;
        Mon, 31 Aug 2026 19:22:15 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d3fdf6sm33287164c88.6.2026.08.31.19.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 19:22:15 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: opensbi@lists.infradead.org,
	anup@brainfault.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH 0/3] Support OpenSBI firmware header
Date: Mon, 31 Aug 2026 19:22:08 -0700
Message-ID: <20260901022211.2619560-1-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_192217_497438_471FE5D6 
X-CRM114-Status: GOOD (  11.48  )
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

This series adds OpenSBI firmware header. The motivation is when a
system where the previous booting stage runs on a dedicated boot
processor, it can load and patch the OpenSBI image in DRAM and then
release the application hart that runs OpenSBI, but it can never execute
on that hart and therefore cannot place anything in its registers, such
as $a0, $a1 and $a2

Every OpenSBI firmware image, regardless of its type (FW_DYNAMIC,
FW_JUMP or FW_PAYLOAD), starts with a fixed 128-byte header. The header
serves two purposes:

1. it lets the previous booting stage recognize an OpenSBI firmware
   image and find out what it was built for, and
2. it gives the previous booting stage a well-known place inside the
   image to hand over the boot arguments by patching a few words,
   instead of setting up the *a0*, *a1* and *a2* registers.

This series also provides a document 'docs/firmware/fw_header.md' to
describe the layout of the 128-byte OpenSBI firmware header, the
a0/a1/a2 override flags, what a previous booting stage is expected to put
in each register, and an example of how to patch the header.

Thanks Anup for discussing it and providing the ideas

Zong Li (3):
  firmware: fw_base.S: add a formatted OpenSBI firmware header
  firmware: fw_base.S: override a0, a1 and a2 from the firmware header
  docs: firmware: document the OpenSBI firmware header

 docs/firmware/fw.md        |   9 +++
 docs/firmware/fw_header.md | 127 +++++++++++++++++++++++++++++++++++++
 firmware/fw_base.S         | 100 +++++++++++++++++++++++++++++
 3 files changed, 236 insertions(+)
 create mode 100644 docs/firmware/fw_header.md

-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
