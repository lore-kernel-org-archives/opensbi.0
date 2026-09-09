Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35506C79FB7
	for <opensbi@archiver.kernel.org>; Wed,  9 Sep 2026 19:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FUj6z8V5+M1U1EeVodFSE/QK0l5pdVDu2xbV6v6nkEg=; b=258zrvFVKDv9N1
	fVjs4rMBIYnltomzT5ylOqtA36tkrC59YfOcYZ2wdHlCu47u5L7UPzhNrr3pNI4xwgF/LhVMmcFQS
	FPhpKUz6SylbH8Y+vJBkU+M52B/tkoz9pGUCO7Z+7R9AKwurIA2E9mDSPGa4pIqm9hXqnqAyzC0j5
	2hZmbJaiN3hyvQufcZCEfwAeREJYDzcs1IqBiDF/wL/q6dPFc1dEsJW8r7UP0OV9YLZVnay76haD3
	j5uGNtM6W3JRjk4uionWS2Y9A/gcpE4lz5+aOded3Z8o7noCRy5rDskcM9lsrzRkjnBtVUtjmcalj
	kTECaJnTjnALkVveg6OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4O4R-0000000Ciuc-2uhc;
	Wed, 09 Sep 2026 19:34:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4O4R-0000000CiuL-06M4
	for opensbi@bombadil.infradead.org;
	Wed, 09 Sep 2026 19:34:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=AXcnVCGPlaByOmnjg/QnMZHTo+TrBi7dKAlieEG01Bk=; b=pm1Z1de6/xCf8v/pnLtPwSq1XF
	OowFuN7lRi9jIrfFnLKYkGIHMufooJNsLqmrzPsOAFIb01Wd4QuoVj1Y9pNHzKTClAiBsMXL40Muq
	klNVRJwoS34gT3swyOhL4vWEYF83pap6PRUlrQIpwUL03yl6mAwYtXQ/D+UO3hl/QWoNZKsrI69mI
	UquksaMEHhLqC7RUcjsagwY+M/8pzAsy841gFGGuDcv1SMwbQ9s//CWUYJqwx7jProsDwHicvtOUJ
	YcA/J30h1qkSQMFaT2t5PTth++2tX08osEL1S7tMaZLc22jTszM3oN7OeM+wcIvohcR9SlSAwEQ7q
	ikEUp89Q==;
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4O4K-00000001bbP-3ldt
	for opensbi@lists.infradead.org;
	Wed, 09 Sep 2026 19:34:57 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-39666bed444so704275a91.1
        for <opensbi@lists.infradead.org>; Wed, 09 Sep 2026 12:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1788982490; x=1789587290; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AXcnVCGPlaByOmnjg/QnMZHTo+TrBi7dKAlieEG01Bk=;
        b=V+noiCy/WmKwx15NtNt+Ky2idxbIh2vZQE7kZvJAEqIGef777UZjEaN8YETNMLAKxI
         kym9uzGxN0gxaNIgCongNNbcst7gQ+DhZNBIUYoRPAW9iwmlrv8z6gb2jbK0Tt7RHAWX
         Pj8T5fhYwrg83PI/6c9GV7FrNOFR4QWieid0pQS3m8dadHSuCvxeqXVtl8mA44e4EAIs
         sbho9cLif0RnuB1bHwvzqMipQ+ncGJxjzQu8e//mnl9/zwZ6NIko9TVR5U5w4K+Ffh1S
         sxqCCKtXQsf8s30YQhRC9ODs9/e6AldIXOMhRUVMgMALmkt63VmWYD1ITht/sfKjaW9e
         mi7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788982490; x=1789587290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AXcnVCGPlaByOmnjg/QnMZHTo+TrBi7dKAlieEG01Bk=;
        b=eQU+mV4I8+SeNCI6bZXzEnM8mE7p+dnTBytyHGoyflktRsIDrro9J/oWYIQQdiMBRH
         QYIF2eOOI5/pyGMKHVh6u3H1qkhyzW0UCLrqC/RT7ylhlpy7csWZY+wIPy0sNc6tIEOZ
         ZBsbo6uAOlJphETMpW40/vTAI3qWlfRrzAMya7sM1Me6L+gvLG41/EDpmIqRL5tQegL7
         M9gayvH4BV7Yv1Pw/OtckPg23FryLEQ2PVIEJ/aVE906SEkfkTozZAaPsN04hOuNqKx5
         J8y5NMvNIMWgv/hSm21mO6yTkgBbbq6OmBxS+Gy1HX+IMaNlHh9AaoD49iU/89JC2xKF
         0ejA==
X-Forwarded-Encrypted: i=1; AKwUvByrqdMO810bjrSRaNTCh/Xb7Y1ieL0KDJAkKev9EaS3jO8U/2u7uMzgBdVpqLqEP+FPcrHXEovM@lists.infradead.org
X-Gm-Message-State: AFuF++nnTd5RTIx1NbfN2xFbFyo/fmO71G3Kk6pTGjb3pfrUbuieOOBx
	fbOsmhHbecVOwkH8BG+RuI90TFJSnUTPIHu7Er5qfreTO0iHPa5j4hA7r0WWxVzdFGQ=
X-Gm-Gg: AYBFou2EkTZctVhzhR21g9LnM7N0mN1uhPr44GU1XQXC6P0hJqis2/jFLzFRhpT4jau
	/sf7QFhEIuRyad5DoCS8c+ILuEAQRQ07Pr59v8hTJ4a12BHNrdYr6VA4qAmseyFhTXh++wXKX2u
	H0+dRnV3jMXo9mDXvFFszwCtSvrPjFOJ72Z0MxurI8tpYbYQC2YjY24ztA19O9VLMN6GwTQgZnS
	BsULC5ykuQp4ij1m5R5tMDtKmVr71BYvyazi1jAtuG5lFZPaOo1mubXOfO5YgfrJBNKoTDir5tP
	ny5ZNIU8Gj9h+Am+dOcjdcx3ECwdGjZ855m1URlA56c8vWJjX/bz5mb6X2DJUyngUk/ciFTGojP
	rwI/SvXVjJDyxvhYBFOKQbLueaIqRD1xx+6NSfUdNp/oW6IpOcP9qGiUiAcrWjgH/RoEzMcxjS6
	9KnlezK8o9k9hJuZndd7EwYKn2DoAgiog4Aur2QcbTTId8LEExYoR8rD+XNrwrjFF89zcqs1ArH
	kgRQwuMi+AoCVg20naQZsVKVeQ=
X-Received: by 2002:a17:90b:4ec7:b0:396:a47f:d38f with SMTP id 98e67ed59e1d1-39d77a45c2fmr894239a91.3.1788982489631;
        Wed, 09 Sep 2026 12:34:49 -0700 (PDT)
Received: from ausc-rvsw-c-02.tail89d63.ts.net ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm52664496eec.21.2026.09.09.12.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:34:48 -0700 (PDT)
From: Evgeny Voevodin <evvoevod@tenstorrent.com>
To: Nia Su <nia.su@sifive.com>
Cc: Evgeny Voevodin <evvoevod@tenstorrent.com>,
	opensbi@lists.infradead.org,
	Nylon Chen <nylon.chen@sifive.com>,
	Nick Hu <nick.hu@sifive.com>,
	Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH 0/2] lib: sbi: Fix stale trap_context/prev_context linking
Date: Wed,  9 Sep 2026 19:34:20 +0000
Message-ID: <20260909193431.5544-1-evvoevod@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904-trap-context-fix-v1-0-6bf7fa45d5f1@sifive.com>
References: <20260904-trap-context-fix-v1-0-6bf7fa45d5f1@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_203453_195615_39A7CABA 
X-CRM114-Status: UNSURE (   5.80  )
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

LGTM, but please resend with some changes in the descriptions.

Patch 1/2: it clears trap_context and not tmp0 and tmp1, so the
_scratch_init mirroring mentioned is not precise. Also it avoids a
broken trap dump and a sbi_memcpy via scratch->trap_context with no
NULL check, which corrupts memory silently.

Add a Fixes tag, I think this is what gets fixed with this
patch:

      Fixes: 60ffc154c84d ("include: sbi: Add trap_context pointer in struct sbi_scratch")

Reviewed-by: Evgeny Voevodin <evvoevod@tenstorrent.com>

  Thanks,
  Evgeny

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
