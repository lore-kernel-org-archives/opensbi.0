Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A51C88E75
	for <opensbi@archiver.kernel.org>; Fri, 18 Sep 2026 08:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xh3tvubh7Qz5eWdKwuTbkEytWas2pKRhois0amiQkM8=; b=2zSIgXvmO6vR5D
	vK4rddtMDr0WhNNIeiZ0Ld54eG+oJuxPhwDcmL+bdZ3IpRlUGq6E8KCdlbX89eaxXBnA8UN1pVXVM
	bmrrGgT9t+L4E1jBYC8ki2Ih6tx3KAboWlLVydbV/mpGbG/fK4eji60nokxj9/jzRnDdTEwn6pT3k
	CbWv+0arLtFLlJZ16P3JajSQ15FpX69Nvngo38ZkraGs85i8kFt2otzMHHv02AyID0+COhx0cr19P
	DrCHjwAlWyjy0UwlKVbXUHjLab1QQpn7BPfNxr9Otb1qZtDAIBOMlFrB3Phnsziah4Hr5RZ/4k+Mt
	GFQMZDIWZY2kej/zdjlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Tii-0000000Dm40-1JUn;
	Fri, 18 Sep 2026 08:13:20 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Tif-0000000Dm2d-2OJV
	for opensbi@lists.infradead.org;
	Fri, 18 Sep 2026 08:13:18 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so1272020a12.0
        for <opensbi@lists.infradead.org>; Fri, 18 Sep 2026 01:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1789719196; x=1790323996; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ebJhKRQ9L1E6NJpxkko5HPASMCau2C19qojRLgE0V0M=;
        b=AM2g9BJtzF1PKakmR+6xPKVSDEP+JQk1h/KAwuBa13z106waheR9JftLaDiTvJBSO1
         Gn9I5KUmQSdW00RoQQsrKuu7h2N1bUvh3+SuUjQakWAJ6eaGJXZsWFxl6qfK/tvZFQGf
         BVq5GZ11BV6NH+b1pJqNB+H2zxkoTzilUhU7xIGuI0uylUrD76ZB1CCtOIT/afEMGQQQ
         IJ7tuWvXel2O1G9LQO2SWWURENBFkErQuGTGRchHjFPbxtqh4ev7XjokRxv6WpCY7ICH
         KqKKrbBsLCHEXjOtz7sh0LmlqeIrQqolkx7AUSraNOvMnDwbxeAojqdagz0puPjrde+E
         xcew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789719196; x=1790323996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ebJhKRQ9L1E6NJpxkko5HPASMCau2C19qojRLgE0V0M=;
        b=iw3u3JB2UO3eoeGZODhau4do6cmG9aJ3bQ9CHINB/FekKbYTMg/J8TnHjcuN0Bhdcz
         KkyXzyRhHUbuHaKbsc+iLpLX6jVaBh3poBrK0jE2YCiHn+CFQCXwLAKsNVKnlDhMBCCv
         f6QMhyhlBa+Vky3nOJ95OBxQYkd+HcbSI3NqfdqXxGdUVWL0wrksb23hk9KSMHTIBGmf
         lzanDBoMPW0INNN23i8rZFeSEA6eBtCGc5iiHbRcJ/FkrS2qRJUOE644OyCZ5qQcsxUc
         +bWOAvsuB99A5OsNqYTfR+NqEh7yN4hrELsg03jgtXX8f/m1XYuhDn0FnJ81ka71jb61
         kJ0g==
X-Gm-Message-State: AFuF++kyrq14YnYgRAI2Idx1c73Uzuj3XjM/sLkqwV83l+/cg7IAC039
	+4n2QIezoPuJ56H4Qk6s655psMANVoiMLqPJO9CnxTCG7oTE8f84i9YddI8tRsoAMMEa15Dmdnf
	RNxAf9FGOhOvChsjmxr0ZXNbu84HH484MsL90qnx1wPtFKQC/nIQOxfvwu4XkRPToaiP5cTYqHt
	1tXeBUek0eG+pc6+K1QVxrQTOlktgvddIK+IsKZBbW8AgUMq7K
X-Gm-Gg: AYBFou1JTjwGBg3SEQMo5R2HKpZvnQOENIgivSOonpQN2coWU0E90V3Bd0wQ+pLiy2J
	wcfXWBQIwGyPvRUiTuJwZSFhMYW6DO4xLET0IgIynUO1hy7TA2VwZ1LCmf+bNvCKXhEFepO/K8M
	oLWACnuc4VfxUtqWHpbAt5oM1w81V93xXgylsUIq60ySY01nKFiU+2OsBYHQNcaTD41J69vv9jx
	C8IGZ0FQPaHkiZw9fhxjzaCOGCZmfHMzQXKh8g/z5Aju6lRecsAd9+3GqzLCG/A1ohWgUA0ScfR
	Y20xZ6Tz3p5+6qPLl9l61pNGyXgdp4jxWnqLCn5L7K1Db6WyxKLXXElNTHm8tH/4dvpd10erWqM
	JqsFUICouQBGYrNWUFC14jiXBQZDD61BE7j8f+A5sLb2OyqjOhIgi6tApg/SVn3jq11i73YeVw8
	Th3sqM7ycvQCDvm4CKhB8n97979ZXIV3CPZSvnIa5aybc36W9nTzWiUuKE40Q9URxuQhiTzhXIy
	HmHXLBfvlA=
X-Received: by 2002:a17:90b:4a4b:b0:39d:e7c7:8044 with SMTP id 98e67ed59e1d1-39e36106e8dmr9428883a91.17.1789719195947;
        Fri, 18 Sep 2026 01:13:15 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c286d98e7sm2812649eec.9.2026.09.18.01.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 01:13:15 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: opensbi@lists.infradead.org,
	anup@brainfault.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v2 0/3] Support OpenSBI firmware header
Date: Fri, 18 Sep 2026 01:13:10 -0700
Message-ID: <20260918081313.659655-1-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_011317_622101_484878DD 
X-CRM114-Status: GOOD (  11.94  )
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

Changed in v1:
- Remove _fw_header_override_a0
- Use mhartid for a0 when FW_HEADER_FLAGS_OVERRIDE_A0 is set
- Update fw.md for the changes above

Zong Li (3):
  firmware: fw_base.S: add a formatted OpenSBI firmware header
  firmware: fw_base.S: override a0, a1 and a2 from the firmware header
  docs: firmware: document the OpenSBI firmware header

 docs/firmware/fw.md        |   9 +++
 docs/firmware/fw_header.md | 137 +++++++++++++++++++++++++++++++++++++
 firmware/fw_base.S         |  94 +++++++++++++++++++++++++
 3 files changed, 240 insertions(+)
 create mode 100644 docs/firmware/fw_header.md

-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
