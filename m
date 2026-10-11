Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D05CA9EBD
	for <opensbi@archiver.kernel.org>; Sun, 11 Oct 2026 04:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XJ0jbbAlu92DdkxzLlK4vpghaLkgU37z9BqGWLWUeyw=; b=jSQu7HK36kWa+n
	NVdGe5pAiuA/Re37shCBl5TZFoIyf0Ip1ZSXAOG74/pQrQDoB8aF4RSoFEQImmJiNgdzecZt/LSti
	BirPDTF4kjAzMia03BLjM8mpUdH2Mkbq7f0YJFl/f65TYg9q+Azc35fyol/HNfbBAmvVP/YvUrm1G
	WTt2jNN93BbYhv1jcZ6Tyu5qias8YjKcFSSNiFXhiKyQQspDvwCMK+NY1VA5Zhhn8kWgRPBmfcoab
	FXjUKsDFQaLfjiyIXXF9tz9CENb4vrZTbTWTxCPa8QVFdXagsiLnNsSbnnxqtL23sgiQFhBPIhtSp
	w1JMbuoeSqGREmSdayIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFkzj-00000008hYa-0rlh;
	Sun, 11 Oct 2026 04:17:07 +0000
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFkzh-00000008hYH-0yII
	for opensbi@lists.infradead.org;
	Sun, 11 Oct 2026 04:17:06 +0000
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-5e948e56af3so36e0c.2
        for <opensbi@lists.infradead.org>; Sat, 10 Oct 2026 21:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791692224; x=1792297024; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lUVdyafbp8wjMMxznjYTgybCfuHVNTqAtuWVfLw41qQ=;
        b=OQhNAEPURSeWo7hAnm3fR2qkzCfOdM9yeUGujzgeMQ9alphfqXc8+8Kdon4H9UraUz
         1BD7tVpP4xQ/sdRS/PiH8zGuCbhFeO8mtVepxdJbFwUE1LM2/xt+ci6Bprwm0U0s10/5
         6H/JrHKmTcJGxaiqE/Ed+npqQvDKSC38EGYB8h9Pu579ig/+SmFkqgu7dhz+iXydpKeY
         VA/SdSRiKUCz92m99WdnJC0fno+3w6SqdBxkc1UJufymykOVNp4MWqAyuiIZydHvPVRF
         yvN8VH6LpOYAIW2mOuAWCFjQesD5gmXk3EGLZVBp4ONfm4KWZt+WQeCT0+O7omXke0I4
         3tnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791692224; x=1792297024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lUVdyafbp8wjMMxznjYTgybCfuHVNTqAtuWVfLw41qQ=;
        b=jK/BdkELBIeO4Ho+p7q47w7hNtX8QyC5jDlCJJrsZVc6v8vxlECjrJBQ77kQKB968R
         kMTzftX3WlkOYDvM/D62b8NpNqJKj4lEKgOVVuUXVxDQXv/cwFkIMXwFm2vTZa7EoeLs
         FEK+yylkEo4Rm8QhW1RtB8mJ2dYXyvTmDetfGqUMHKOtxKr+N61RB+at7LCArLiu7cPT
         zv9V4bHIIZFNnNHvqi4cGCiiI7hLl5hloHKt6ShKQ7VVUGHGExShEmpxN47Qwb1EUZSr
         twqaGuMaiKwc7qNnoUzmF0HVQDAkf8VC4H21uG64KlQ18YQZH9Au5BoJm8iSY+rZNRZN
         1F3Q==
X-Gm-Message-State: AFq9FYLKDnn5QAN/+gdW0ZnfzabTS6/B75MWB+0XGcA8PJwCsqlFVVBw
	2O+OJWePk+Fpp+U7J3lA3lm3ziirahuouH6Xbq9qsvaRIU7tug+ntFWEjaNj5M6jUlBxpA==
X-Gm-Gg: AYBFou2FVF0bkmY0jy1DPRz4n3QnWoTHCHEIMaTBhunKsvgQQ3UinD1qzWWpagoIr88
	UAmUQG66JzWf3DLPcqAbFKpEfoppkoa7RWz9UVZ4uOXqIgoVdRHLTKdJeTCVVg/pXJ5WHYqpNKJ
	VeL7bm4eZ0D5Vu6Cyukc01y9R60f0l0Xi1iO/0Z0TMamGJaxU5HgrhE0qgNhcmPgkLwBxQbthJQ
	e75+Boy/JPr/Bbu/UqXBHF5o9QyB8HETg55iN51ooxLNwXql5FIxhjeHaWESgGoBk3niJNnfXmD
	lXhZsgbATYZn7i56grO+i8FU1chpkKcaBvL2yZaZjw0SC20ccAd1Ckip2Cq2BzYL/32bmy+jKB7
	0Aya1fgQrsFuDxYAwNmGz+w+tC8KPtk1DEHbeV81e63NEL2WG3JUqeLnR0H3O0T77lIxWj9iZD5
	PzMdFrz2TFAY8KlIuG38gD/X5u8r6w5btXbdDiG3oVeNxHWFLlU96lRfHVKq8uQHmW7LXh+5yDB
	3CMsj6VifpKpklRRJC2DYXGXohndcaSLO6xFRfybcmXG0Ie/CMlhDpHw9H3mTk2fgwLhe9KVw==
X-Received: by 2002:a05:6122:3a06:b0:5c9:a60d:327d with SMTP id 71dfb90a1353d-5e91f518afamr1967613e0c.17.1791692223835;
        Sat, 10 Oct 2026 21:17:03 -0700 (PDT)
Received: from localhost.localdomain ([186.151.100.62])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5e92f300f42sm3316106e0c.0.2026.10.10.21.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 21:17:02 -0700 (PDT)
From: Sebastian Alba Vives <sebasjosue84@gmail.com>
To: opensbi@lists.infradead.org
Cc: ganboing@gmail.com,
	anup@brainfault.org,
	apatel@ventanamicro.com,
	Sebastian Alba Vives <sebasjosue84@gmail.com>
Subject: Re: [PATCH] lib: sbi_trap_v_ldst: fix mask buffer overflow on VLEN > 128
Date: Sat, 10 Oct 2026 22:17:00 -0600
Message-ID: <20261011041700.809827-1-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922030633.10886-1-sebasjosue84@gmail.com>
References: <20260922030633.10886-1-sebasjosue84@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_211705_280920_E83BAAFB 
X-CRM114-Status: UNSURE (   5.07  )
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

Ping.

This is a stack buffer overflow in M-mode reachable from S-mode or
U-mode on any hart with VLEN > 128, which covers most vector-capable
hardware shipping today.

The fix is a unit conversion at two call sites. Happy to rework it if
there's a preferred approach.

Thanks,
Sebastian

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
