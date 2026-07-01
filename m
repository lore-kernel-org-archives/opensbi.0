Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BCF3C43458
	for <opensbi@archiver.kernel.org>; Wed,  1 Jul 2026 12:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=OM4LZ5+SpAfjjEw3ZzAZQv14gc3G+HDxHkwZmtMjwmw=; b=bLc
	B1ZwN/L3RYzX2nfkg4Ihh8Y7XYHvf+y+1rNUxiw8ZBHMUD31TTxl+CIuHI4RzHecwZa7qy7VWY4EG
	CoWyKsul7K3NxYvCyy79ZY+zbF34COxuiLi7QPZ9LLJ659jCZQwx0mCylDhK3YjkDe25P2mUvex1D
	WBboiNY+br5bBKg9azFjvshAFLb2h3HEZ3BFfou58+64dm3lN3tWipPNJgAQZ9QDQRGN91QbYFqb/
	vcxToqAYCodVa0dH5AWy9JU9LsZjDfQvUJ0wyblSZATSHbI56r/w/iYmiTpJZj/nA1b9qyRLg5RcV
	18F+LP/0XT37siR8mY5Y8unGIFitWSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weu34-00000001zcQ-4BOH;
	Wed, 01 Jul 2026 12:28:14 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weu2i-00000001zZt-3bQS
	for opensbi@lists.infradead.org;
	Wed, 01 Jul 2026 12:28:14 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-4763b0c1dcdso711185f8f.2
        for <opensbi@lists.infradead.org>; Wed, 01 Jul 2026 05:27:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782908871; cv=none;
        d=google.com; s=arc-20260327;
        b=ilbRxmuJh1Vp8nlrygU+njLx+1LHmSQFnku4ztlieHBx0nT4wCzsyfyQQWhp1oO1Ge
         IMuButQRHqnqe06903zSC4HXgaTSG6yJsAYARf2/DK5X3Lr/LvxStEam9Ru2V+3VTz+7
         0265v6WWdflRHamtfUKnAiiVrPaMDhYxN+ob96QBU+RZ2lAWNOy1976xnMJ037z5VN2A
         1iqWJQcTW3qA45rxdTRnrka1bof6RpZIaM2YN4XP8iimFs6D3NzuefXVerNIptTaJrX0
         XkHMC0+Q65gQ+h/pLGs23GgG5R5d5ALJXdc8/ellcHcwmKTT6HphHzs2YVmjlEm78aOi
         YQMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=kJwwzdFYb1WJ2u0DYBnf3tU1nm20xAT+/r7Rci0NB9I=;
        fh=/vb2rB49pn2ac6sFgHCyKiLPHEyDQtXHFJGpH21uLRY=;
        b=Lo6j6wiaoWDk0UvotSvR6LOIWgn4thw4yo7CnDQCsf1CIEmlpX/7SzGGAS9J2fQN8R
         obvrktuJYKzceb3IRIfAxvsyCZO6CQ2CbO5bDS+A8M1g9yIXZqcm9GyRTr1vFakxzZ5J
         HoyYh/GtUfYfQYUi3J0viXyKydQIhW5BkMf9lrUVYZnNi7Rn5i+FysdaqxuDGtwcmVxM
         kdvdtUA/9BOQvvApnjwh/L4BgkP3P1+5On0er1gDuJ0/Y+xvkqfUJ9xL7z7Z90m5GBy5
         Mjnz75KOX8XtQulPNY4DnB4rFUab90MJ+1/WZYYRfjduSnIlnEQlamJov7xNoD8hhDZf
         t/jw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1782908871; x=1783513671; darn=lists.infradead.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kJwwzdFYb1WJ2u0DYBnf3tU1nm20xAT+/r7Rci0NB9I=;
        b=omu2nX4ZnW/YDkw9LL/PX6UTmEHjyQWRtrPdENZ2EhxUinBsXraeJJz6TxUzm2cE2U
         oxrECE74MlkeGqX87HScAz8v6HY2A7yfleuLyo2F9TPobvBm/yQWZaiMP0knVqQjlR+e
         27LFSNDxOpc2CXKAwZvlp+XSBJVMSO8QTJ1uxO9AHEVO8nj5rkURo9ZcpkMPaI5cpQg3
         cStQvoNDb8rZTgxrykIJbFvF3Q8xGR3yks3QUtxxdeUXNi2X/p1TMa5BPowFANMDD8lW
         zA+WxZVrYPlM8XhFIVz6G4cVrIXqhFLGVQdevibRk8Nyg8zx++BbQ2hSfaNuonKtrs/s
         H4ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782908871; x=1783513671;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kJwwzdFYb1WJ2u0DYBnf3tU1nm20xAT+/r7Rci0NB9I=;
        b=hbkxAnGkFGFDm0X7QfL3PyrMDpmJV7bFsc+tV7dMTGI8V4tKESdrKx/BfaoVDsyzJc
         oMiyT0CIo8rNEwoDRx0blA2a7hyrR2tciWrS5uZedhN6438rp08JL55V5g8IaG95GrOi
         uLSKwJH8nPKXBn34CfmQ6rgscbO+vv25zGEZSklW0M4LDqzsPAVgX2ozySzinr2thSX4
         wB1TRibB258np3jSXidD59c/toWY9PV8ycPCgzFqdAkUrh8ZEieHseHXDswgqa9qOvcS
         7Zg7EJv1f5OfYqxfCUnTp7dTYNJQXiH/ptzaYN8J+eO8njUld6+L4AY689gjNpcMEq8u
         bwBA==
X-Gm-Message-State: AOJu0Ywrj7SHtmBnzjYQ8WscUytYMoFM5lCupJPXMldDMIn81O1KnLE7
	ef7hq5POoqoONpxAOApYwCTXEjNWC0RXhfGXbvG8OPIS1o4yp5IY7D32uxxt/jejrSag/VQLvQn
	3/oECGRB84wuUOwAVwWx6qVBTJBqO8Zy2S59m0rf4090LMadAkv036UPZqw==
X-Gm-Gg: AfdE7clrXIXe4YH9hWYxmeE2NHuZGQUDonxSZXrDWpIbAGCWA1znzksv70jrkVu0tpD
	TavEMs0xhVOfcO2PjFVTS7Jc++L3mfHlH8SniO3KvpPcx4gvt5O6tvjlNb68qwhydZ+VE5l/1KI
	ao0qw7dTV/yU8Yv1nPwPIppuo1bHTtk4IgV5hhMHODNGoHzOn+5UDlEsuD+llXdiPh092rUVtfP
	VzgtLAhJK9qxhN5TjPWYrv1jZ6WqROAyvpYCr2pLdjD8i2z0WausUqGwaX4zMqETrTNWRVX3aVk
	MzFoOU2zXwWsLlf2QIFJAOsktdPr+pfEdg7UCMesV5ybd7DSW+/3FHtm0xA/g9RhBTTryW0Nac8
	U7pimNQXRhjeB7YWu
X-Received: by 2002:a05:6000:604:b0:46f:558:a43f with SMTP id
 ffacd0b85a97d-477b34b039fmr490183f8f.4.1782908870546; Wed, 01 Jul 2026
 05:27:50 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Wed, 1 Jul 2026 17:57:35 +0530
X-Gm-Features: AVVi8CdSU8v3_vX4HFn7bx1KdNZcSqZtBfeCkkEPZS6pqeZLhrBcgSriSluC-yE
Message-ID: <CAAhSdy2ty7yTA0G3nCT7=CaYb3v58=hGME_U5cdDA543DLWk=g@mail.gmail.com>
Subject: OpenSBI v1.9 Released
To: OpenSBI <opensbi@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_052753_159776_E1DF9A17 
X-CRM114-Status: UNSURE (   5.70  )
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

The OpenSBI v1.9 is now available on GitHub at:
https://github.com/riscv-software-src/opensbi/releases

This release has the following changes.

General:
* Initialize stack guard using Zkr extension
* Improved irqchip framework to handle wired interrupts and MSIs
* Added unit test for string operations
* Added NMI support using Smrnmi extension
* Added timer events support
* Added Vector context save/restore in domain switch
* Added Floating-point context save/restore in domain switch
* Added Common PMP encoding/decoding helper functions
* Added UBSan support
* Improved misaligned vector load/store emulation

Platforms:
* Added SiFive development platform support
* Removed kendryte/k210 platform
* Added Tenstorrent Atlantis platform support

Drivers:
* Added Andes last level cache controller driver
* Added Andes ATCSMU suspend driver
* Added Altera JTAG UART driver
* Added MPXY client driver for RPMI MM service group
* Added minimal SpacemiT I2C driver
* Added SpacemiT P1 PMIC reset driver
* Added Litex SoC reset driver

Many thanks to everyone who has contributed to this release.

Best Regards,
Anup Patel

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
