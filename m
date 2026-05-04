Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FAE6FF885A
	for <opensbi@archiver.kernel.org>; Mon,  4 May 2026 16:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/gDo5UxMTJQXJIhOV/bZqOmcXTDvU/BTie6XTxEJU40=; b=BOtS6f6+Kreo3z
	6NLTAatt5fuTJBWGs/BBQBCYU8zy6N9x11Quw87UxfMXAOIzc8o1OBww28rVW31eq/0OiRnm66BwT
	88gu+PS2o5UzvNQfB9ugMyqr3lhfg+hHQNXBB3mfOPW7KK1fCFFx72/GDiRC2vRqaBFftgXABItUa
	YAO8AUtVKRYOKSjodfwG/ERuIWZGYXBuR6v5IUZ9Mhb1Q25chfNqx+fqfC9XjTePtCSt8SekBlhRa
	ROFXv0e1glp/jeUleG0PcbVRJZBb4F++2g+oNxWQH/7NmYZcIcA9pAK1sYAVZujqasy0dImM8bjia
	b4CjSsUG59f/K4Wygnjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJwLP-0000000Djv2-12pJ;
	Mon, 04 May 2026 16:40:31 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJwLN-0000000DjuM-16hy
	for opensbi@lists.infradead.org;
	Mon, 04 May 2026 16:40:30 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-2f24905306dso70281eec.2
        for <opensbi@lists.infradead.org>; Mon, 04 May 2026 09:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1777912828; x=1778517628; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tTpUg0WDSTGVW2AXFwmhFWbp9hceZaZNc+v1Irt7j74=;
        b=Rn70H+Gm7NXazMr7rYOCTYr9M6bm0c9zB3wmifMroRZLRVHvD1w9Um9FHq6NidX44a
         ToBf6xmPeIpEMwSnoxbeJXWARc8MZvVtuN+e/Yp/XZB1W7LS+/Zy4vjjD2vsU/aUE6qc
         6uO5No5pTolYhY/IcTGm4oOuQJI9mfs0FOtxMjSiqgFJBDNI9ZT/sp5oBudh/yCZCXU5
         ZwAM3fPRNyYzaUce3jtox6MPO76Fu4ImRdwC+xhiE0+Y9l0YdlXWIMuAs/osiarRPct7
         X2ZEXdecAA/kKG9nrWkkNc5XFa7AudwIDmX3Lk7lkXp675ztMjP8ECoLIGtzB60bVrb9
         NnxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777912828; x=1778517628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tTpUg0WDSTGVW2AXFwmhFWbp9hceZaZNc+v1Irt7j74=;
        b=CT1RCXEm0EMQIC9hEvlCO3ayvvjv5oMERtonKUqmuD72+8wYr4XzgQTyfGumOAMumm
         84ko9+VmabpGUoe9W60huq38v7ZclySiaNZ0iafvFgI4H4lDW0Ekh35JAqt+MGB11rlI
         l14a88ASTjvAcI7GP4aD/16e3XKzDLeUXOiZAYeZyCE9lHuyIrPtMMwcaUcgbh6dDqrV
         6UvVAfSUnrAmyMpOb5rlu3gSnsPU9lc+8rJUWzwPIGko9aIgf66pBN0Yi+rK0Gtm2qbu
         K3US7OmhdA0eXyIxwlT9XwfKogJ0JJvTUZXRnUEJI242VQbQBkNSJyk75EXVXwFTaQww
         1+oQ==
X-Gm-Message-State: AOJu0YySRbltzOTPqSm3GRRGqeWR1CByNtjzAdH3GDFfRx2n1sBKuoJ4
	AFOl6+OdSoQ8Kxwb/2zrPZF1rp9yW6HVI9o9yPa4j7TZD9p1dRodF7nied7CK1bc688=
X-Gm-Gg: AeBDieszcHnaTbrURIxDoDem40lpHEC8EWyay00wr402mKH4I/C5x606ZqCrr2ylDCs
	twrs/o7mgnmpsqLrHxh06NwL/OcCkzw+9A4mrAAxYl+HGNPXrM+BwwS5bjQvkfgOOdgmesznqiy
	78/bRlRt2Q+V16Y5ZFOsl93HBFuOsbTPNbmRUnoE2vRcHGQ9RcpAJstI1BifcfrK1sW7OR8j1t4
	MhYVGM1oVZuCgTLCsbJNboOQSgvk6cYw1+EQy/8hixKFLMBiLzaOUspfdo0Hq/72hvMrMWNpKSG
	Spi/pBY0eRQTZTWRwaw0ZzCfVWKUJ10tjd/s+9G3Y3Wg+fvOFGL7bFgXLpmt78pspn/7Uiq9nhK
	ub/IZN/6ZBXV9Gw7Hq1dVTeIM2wahbpaK+mTaaDirWYDzJ1zv/BVMr3fS5Y0LZgb3OzRYDaZptC
	t/6L8I13Ck3j+vbpOqE7oE+F0b7601EWbRd1pQErT9sgpUCc1tUppgm2NXWE67
X-Received: by 2002:a05:7301:1696:b0:2f3:c1a6:361f with SMTP id 5a478bee46e88-2f3c1a63eaamr146522eec.2.1777912826642;
        Mon, 04 May 2026 09:40:26 -0700 (PDT)
Received: from ausc-rvsw-c-02.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee393578f1sm17168272eec.13.2026.05.04.09.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 09:40:26 -0700 (PDT)
From: Evgeny Voevodin <evvoevod@tenstorrent.com>
To: Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org,
	Nylon Chen <nylon.chen@sifive.com>,
	evvoevod@tenstorrent.com
Subject: Re: [PATCH v2 4/5] lib: sbi: Create a spot to place Smrnmi detection before traps and after DT is ready
Date: Mon,  4 May 2026 16:40:15 +0000
Message-ID: <20260504164015.3775558-1-evvoevod@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAAhSdy2CHgZ7cmrENKeJOenbcsgTVrQVNPFequqtmgufZ=1Epg@mail.gmail.com>
References: <20260501211627.3293126-1-evvoevod@tenstorrent.com> <20260501211627.3293126-5-evvoevod@tenstorrent.com> <CAAhSdy2CHgZ7cmrENKeJOenbcsgTVrQVNPFequqtmgufZ=1Epg@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_094029_337352_3FDC4D44 
X-CRM114-Status: UNSURE (   7.76  )
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

Hi Anup,

Two concerns about the suggested approach.

1) Enablement of NMIs before the platform has set up its NMI handler
introduces a window of possible hang. While NMIE=1, the trap handler is
not defined, so if an NMI arrives, the trap jumps to nowhere.

The v2 series keeps NMIE=0 until smrnmi_handlers_init() has installed
both NMIVEC and the regular trap entry, which avoids this hole.

More generally: on Smrnmi-enabled platforms, there is really no way to
use any trap-based mechanism until the platform has set its NMI handlers.
Holding off them until after a call to the platform's
smrnmi_handlers_init() is mandatory to prevent possible hangs.

2) About the stack canary concern with the C-side __stack_chk_guard_init().

The danger pattern "canary already pushed on stack" only triggers if a
function call which returns is currently on stack, which means
__stack_chk_guard variable will be checked against its value on prologue.
Neither C nor asm functions currently on stack return or use epilogue
check of __stack_chk_guard. The full call chain to __stack_chk_guard_init()
consists of:

  asm _start
   -> sbi_init()              __noreturn
      -> init_coldboot()      __noreturn
         -> __stack_chk_guard_init()    asm, no canary

Even if asm side falls back to `return`, it is still `j _start_hang`
which also doesn't check epilogue.

Could you reconsider patch 4/5 with this context?

Thanks,
Evgeny

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
