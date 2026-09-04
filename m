Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9261C79F85
	for <opensbi@archiver.kernel.org>; Fri,  4 Sep 2026 08:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5xWFmSky/048qw+Tf/f3J3uzeFXSu4Q4jOW/J5wu74Q=; b=tvqHCNP4SHvSmr
	tqgiUnDk4f1kI71h0PPYfkoab0ouuw+rfdAAZkJM0diQVkvh/1TgqbkWQ2wUQQWvChjCZ/Vm7KTdW
	2oSXtwe4rmqCp08ARpuTuls5FxYu15hxcoRkeua2/ICpdkhS5U9LJCxa5s9qjcmGOTNObCDpqJwGf
	p0Mfb/I3T/8RXLyIPKQ16timVkpowI6MB4VeXIAAhR5PDLM23uxhp8GZpOQcl5oPYEUCAQLDWDyBY
	dMA2xyg7ZzpFQ+rPDaJPIBRsm9w4ORvw6/G8xntF55xD0HRZSktrMLywy4UbIewRYQLSl/mqHfBAT
	IcraJxwLJXSTX+aCccCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2P6z-00000001M4U-2U58;
	Fri, 04 Sep 2026 08:17:25 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2P6x-00000001M3Y-0QB1
	for opensbi@lists.infradead.org;
	Fri, 04 Sep 2026 08:17:24 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-395cf2535acso808473a91.1
        for <opensbi@lists.infradead.org>; Fri, 04 Sep 2026 01:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1788509842; x=1789114642; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Qe8MuxxtD2UL/8mvVx2qL913SnSLCEmltQjXXDnBbnM=;
        b=kX/mQ+S8vQxiTqHtiI8JR61SNucxo8N/jp1spQGEUtC3cZrtRAG3KLmSSujrSFc4dK
         pLUENc0xAUqCmjA7xECN9EFm5lf9qeaKHymoyjAhwVECsw/4upzo8MkMCwVXQK5vCe9f
         WPjxZ7gBfAIzd4H8FJfoiEwonyQ5/Z/4vsq/O13SjGirP1F4BGdRSocArkB1IW/Ganxq
         qIXkYjLvPmnPRQ8jPfqb8KjiOTWg02LSlTwKhXTLXqIU00hxJOMGyQdH9FtxBHAWEDnZ
         epMEyexB29nHjQV14IdZnhC2avVQSag5OR5VYGeo9aAZ9CEoLfEoEQxCpn1BlAJTB87J
         7gOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788509842; x=1789114642;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Qe8MuxxtD2UL/8mvVx2qL913SnSLCEmltQjXXDnBbnM=;
        b=LdxV4DV4BQWgbQsREvfDNTXiKzzmMLDYlle5v67GCkqfxlsC2aVoHLZ5xMzV/5bzfT
         VX1mhmHBClBgrdpXUje0eZE6gyKXtoNBovmT2PqpPVghQNS71YdsOBJRBAj9erekNTfK
         36gkHn/h1jRKl+sN8LSAyeHEr61M9x/Zvz2Ai+rX0NvjS0aeY+o116w3UwhST8dLa+lP
         J6AMqEqqtrNN6P3MoVxwH/Lwz4JOutkG7zOEej+KkBVeL22KW3zRPsEP/Pt3NbvBOIWy
         zT5hNXeEXuhUgGgkGMUZFaznxim/Ne60ew6sXDNsUt1DMyx7shpJk7BNoKWfx/zyC8rt
         G3gw==
X-Gm-Message-State: AFuF++lC/rIf+UA+Pacsd+0CgrNSEqSRmLo3NXcXRfo8JTrngpu5bZoh
	OaAESFCsjRDSfw1DIbwO97bHXbnO511PsybPcnTLxz0VEd+ccZqgYuH1WXgqHFh7nFM=
X-Gm-Gg: AYBFou3VgMRNSya5DX/CakDqefDVH4U6FqgGVPGzdc8yVeHj9+uinpm+MuyHc8ougSg
	En+TB6uI/2hyYGGo2h6WZCatN3bM/fRnNG5TWoW2tAiPkiAOGTHxdoog0fimwS6SIDxxWMOlZ91
	UEcp3RdWaG/DWg+IX+yqVhFEPF+48v6z/AxjVVf3gKwdhSkaqJriCjeWrl1phHkQshq+edk/eEi
	N1cUf3QzQFs5/ZRzuCEGV5CfZ5KHiys5HNpGAbgu0oxkzDZjlBQLc4Z5/908wbZ6Un3E04CB5ic
	azoQvpoZ1tsemzoqIrxP8oH7XpsGeCJhqpGbAiTDf/MXtPEMRj8SwNbw+TBrIRHmselXqBF9493
	ngR5N/cOqY8HxSSfsxE+03dlFm+jp8YFcn5plHDFV0lCLJtams4QrWtB4xnQ+Jw1bbCbwxwKLhD
	CQbIv22uPHfhIRiuECGvDsnTMxc60G7WjxxIiuDDsfQxLBA+8lEQjtupko0dsLMTBx49y0c9c=
X-Received: by 2002:a17:90b:5587:b0:37f:a913:1554 with SMTP id 98e67ed59e1d1-39b086549ccmr13490195a91.16.1788509841903;
        Fri, 04 Sep 2026 01:17:21 -0700 (PDT)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f44d7sm4767183eec.22.2026.09.04.01.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:17:21 -0700 (PDT)
From: Nia Su <nia.su@sifive.com>
Subject: [PATCH 0/2] lib: sbi: Fix stale trap_context/prev_context linking
Date: Fri, 04 Sep 2026 01:16:42 -0700
Message-Id: <20260904-trap-context-fix-v1-0-6bf7fa45d5f1@sifive.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAG5+mmoC/x2MywqAIBAAfyX23IKaPexXokOPrfaioRKC9O9Jx
 xmYyRDIMwUYqwyeHg7sbAFZV7Bdiz0JeS8MSqhOGKEw+uXGzdlIKeLBCVdD/aC1NG1DULLbU9H
 /cprf9wNJetWZYgAAAA==
X-Change-ID: 20260902-trap-context-fix-b9e78441953e
To: opensbi@lists.infradead.org
Cc: Nia Su <nia.su@sifive.com>, Nylon Chen <nylon.chen@sifive.com>, 
 Nick Hu <nick.hu@sifive.com>, Zong Li <zong.li@sifive.com>, 
 Evgeny Voevodin <evvoevod@tenstorrent.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=746; i=nia.su@sifive.com;
 h=from:subject:message-id; bh=E/WF3l7gugRjlLfJTkBhSIK8UxUtQZu/oWVP6SyITqM=;
 b=owEBbQKS/ZANAwAIAYihNJa3+YfgAcsmYgBqmn6PoUIV3Wr7TUtWpyWgECCNAwZGOY3yvISKI
 ZihznnocAKJAjMEAAEIAB0WIQThGl/T4FqBBU9NhIeIoTSWt/mH4AUCapp+jwAKCRCIoTSWt/mH
 4G+zD/9QCkp4N9PmHowX+yaHSvgrnZXkQE8U/axjaTwudDjg5vCQtJWnU5Ep8iBamCaKYJifelS
 hPpz4KkvxvEnpUCfRIc3foEpZD4s61VmAY/azfobnc9nuKcz3ELQSYLMJwaMbrKCRoon3+DDmWr
 g5IwdfrjdxBHqioj24yI99XHnNu853o28oH0vDovu10aK1+qdMs+fYmW6UuBzi80oMYFye3TG0K
 3oQmFiCM6JD1bL4m1TvgM2aLhNZBmotJM6bLSpI4NxjaXMlgt+tSkXa7F0tJYlx7RpsvX/tHnCl
 B564tWUEwbe3SJNeu8YKc3fyAS4+Et/SG+9efvBDDmjQedjz8PdY841hYvlaxfA0KX9BZOnQ89E
 9YKlLNCqA5VszXdRn9no1j5vDYciS7p8oLlbCBenaqZOBp9y2j20y8T4tNLA0gvcKXg8Akzlg11
 oYsGUvkahMPCdWdmmM8GEZdLmSV1v8OFF5E6XzZDJ1u39mKbt/dvtkREo6mcKyXpzlMzgWTd8ug
 Iinq8GLMI/tYyz5zXuoW/7uV6/Rogo9xLKgZVBqZcKKaBnmkOLom5HUhnwM6S3YCbdKVOwq5IY6
 j45DNt4wU7inv2eogpRPsSENsmf0Pouv08z9ylKRSMIqLKlaLddyKUnKm9Q2e5qGwVKBpOtnm3V
 2NB8VBYrPEFl/1A==
X-Developer-Key: i=nia.su@sifive.com; a=openpgp;
 fpr=55235C875092ACC578EFCE6CD1699E646B29B1AF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_011723_166062_7CAECFBF 
X-CRM114-Status: UNSURE (   6.50  )
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

Patch 1 clears scratch->trap_context on warm boot, since
non-retentive suspend/resume jumps straight there without restoring
it, leaving a stale pointer misused as the next trap's prev_context.

Patch 2 fixes sbi_trap_rnmi_handler() to link prev_context on entry
and restore it on exit, the same way sbi_trap_handler() does.

Signed-off-by: Nia Su <nia.su@sifive.com>
---
Nia Su (2):
      firmware: Clear scratch->trap_context on warm boot
      lib: sbi: Fix stale prev_context in RNMI handler

 firmware/fw_base.S |  3 +++
 lib/sbi/sbi_trap.c | 10 ++++++++--
 2 files changed, 11 insertions(+), 2 deletions(-)
---
base-commit: 35511bc6ee1c9c17b6a89b44c52e2044bb51b979
change-id: 20260902-trap-context-fix-b9e78441953e

--


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
