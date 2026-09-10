Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06442C79FBF
	for <opensbi@archiver.kernel.org>; Thu, 10 Sep 2026 18:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5lodRtwdeclIybIhN8QqfMlqm5NqWXMnaGfl/fAMKNM=; b=zGLn5QxvRo/G/A
	ddM7wgUR9vW3jNZbE8WX2qLyP+5I5wbwO6uKg9g/z5w7rk0u8/YFxm3f7Y2AtHlJnfZO0qO8fDLB5
	NPICAKn7+9ynAj0y+MQm9cLawrdqgzzCXQkeGP96BFbsBTl4+sz+iBJRitQBA3lCYIMXRQLpS0tSP
	0KbO1aFD+0xf5Z3JZgo5r7Mu2qqfGav9dCA3c4aCm94Nyrt8mmvXNpoWOH+21Ul+RFk6t+uRLCt4u
	Q1jCCTALWVZa4ywnWOEFxf56QOv24XlsgI9gGynZjxxrhvhQQs1AzYN67tw6Me355GHgxUtcj+gGK
	71aBLmIV9rXvbnX5eyHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jx1-0000000FD5x-3tYy;
	Thu, 10 Sep 2026 18:56:47 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jx0-0000000FD5a-0BtD
	for opensbi@lists.infradead.org;
	Thu, 10 Sep 2026 18:56:47 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396672b2565so10717a91.0
        for <opensbi@lists.infradead.org>; Thu, 10 Sep 2026 11:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1789066604; x=1789671404; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zqlxCQBe/raT/KTXOMxc/+5FrWtNQGreHDbDaRg2vPc=;
        b=J8thO8Hz7wqlEZ5lEw8OwhpkfdgVCFNs0u1E5c/cYT5HKXUdBNb7+aU5TXr4KAoUts
         iJehiw9JJobVgMKdEeTEIChsrgXKi++PSe0n0vJl0J+e1KwYwY2xm8FGoNtaQW5HHYr8
         YVdTkcY2Iym+PLBTjIxFsz3wvfY9K6srbhRGqs0HBQE4cPy4D0RRzbHf/od7tfVncucM
         6k3XbtWG2ItA8uHISFXWoXf5PFyZ6a6C5LWyeDlWHiG9ya78/pDLKeL87xHB22nKdq8z
         qaKJBx9gvp+nn7uek0t5wbGKskvej6RULYH2isYxdiFvn6/x2IRnSN8je2GChhNYYZtK
         /w3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066604; x=1789671404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zqlxCQBe/raT/KTXOMxc/+5FrWtNQGreHDbDaRg2vPc=;
        b=ItsIwow7+k8usrOoAWcsWK6A+ztZrOnMqml0mCKl6iZQaKODLPEKfbolWyOn54BDgj
         Z13waDcQ+98jAPENSh5RUMWMSTz0XtXTNyZ3jdCZi7XFSa1P+HPJ0PsWLeqeChUJWHQ/
         tM8N10TKeLCES1w9LR5VZd0WSgbreHvIFSXsjTuua9qILnk6JPk9hsMLZaLm/0jqDP0V
         G60SqmzipK4hrpIjTVnkoNJ6UnwrvqHXWNEjKm+03Vio2Qtx9H3rRSP158Fmz26MhOW5
         jvXXHMZLkJkXcF3QYb/f8GN+K6xoOKWwdYemEMVhqau1s3bYILkbAtGnR6XGVfnV0cse
         K1Qg==
X-Forwarded-Encrypted: i=1; AKwUvBzGYE6Ma/zSfXWjBQPbmbsterZxTpLvqnsFCTinUn1fogrHycwev4AfWNxLhrqP0sz6NCZUuI4p@lists.infradead.org
X-Gm-Message-State: AFuF++lx/uok39eeoMmntIx4ktgz0NJ8DdPINQaY8WAnlN4bz6Yiubpb
	J0CqB6Hf4hwR6UVmZMZM00FVLN96y+ZhCX6nGPYPtXsPO6NzPS5zf/EGs/6YmcdDFIg=
X-Gm-Gg: AYBFou2VJCyt/s2bKXAnB6HcYGpMALBg4WqcK70OVNzVdye5Fdje3SDV1Im2SmdmhcO
	8Tr6Zr7uXlfYye0Mppx05d8DVXUFNSOu1Wt9Ec3RbKdPnu41Y6sYUpuRJi/qt2sJve69fstAc23
	ObIKQVUGqN3IBP4KWKp33ejp7C0lzIfI7lpnVAp5/hnNueJV2mR/RgGeOvrM+T5T07vM3NlMZWc
	4SjYWDr00lJ72G1T5rgQ6Xr0MyWZW86NTZJYbxcx3pe3ZFkzOyq8eH01/QCfMj32v0zUHcRBOWO
	bTJz5bxM+7N64x+TO16A9n06aR/Ue8MJclb8F40Hr74CBACrd96dg0ETlUYOQumcTyanR2Z128l
	lpOCPrpURVq9KFc82WBn+x/2k4QktPe8f2My8hyPegqJWXCajPvPOCJXU8e+aC+YpJAw4gJy5rn
	0XPmcfPi7d4I/zXDMTePmxhkYAKnuanccoSc44ZwUD7hYV/FA8mEQHnTGupEyXbpGwRlSuqFhGP
	A23/k8c5gN7s2BXal7CUO5t9Ts=
X-Received: by 2002:a17:90b:1d05:b0:398:bac7:72d0 with SMTP id 98e67ed59e1d1-39d9c3938f8mr51301a91.5.1789066604001;
        Thu, 10 Sep 2026 11:56:44 -0700 (PDT)
Received: from ausc-rvsw-c-02.tail89d63.ts.net ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e4fb3esm87242eec.7.2026.09.10.11.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 11:56:43 -0700 (PDT)
From: Evgeny Voevodin <evvoevod@tenstorrent.com>
To: Nia Su <nia.su@sifive.com>
Cc: Evgeny Voevodin <evvoevod@tenstorrent.com>,
	opensbi@lists.infradead.org,
	Nylon Chen <nylon.chen@sifive.com>,
	Nick Hu <nick.hu@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v2 2/3] lib: sbi: report smrnmi_handlers_init failures instead of ignoring them
Date: Thu, 10 Sep 2026 18:56:15 +0000
Message-ID: <20260910185618.12126-1-evvoevod@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903-smrnmi-context-restore-v2-2-10b17506d257@sifive.com>
References: <20260903-smrnmi-context-restore-v2-0-10b17506d257@sifive.com> <20260903-smrnmi-context-restore-v2-2-10b17506d257@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_115646_101929_754774F4 
X-CRM114-Status: UNSURE (   8.65  )
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

Code looks good to me.

Please, add a note about assumed SBI_E* return value on error in
sbi_platform.h where you change the return type of smrnmi_handlers_init:

      Returns SBI_OK on success, error code otherwise.

Note that comment for rnmi_handler below which says returns SBI_SUCCESS
is not precise. SBI_SUCCESS comes from sbi_ecall_interface.h and it is a
return value of the SBI call, while this callback is called by the
firmware itself and its result never goes to S-mode. sbi_error.h has
SBI_OK for that and the value is the same 0. Maybe worth changing it to
SBI_OK in the same commit or sending as a separate trivial fix.

Reviewed-by: Evgeny Voevodin <evvoevod@tenstorrent.com>

  Thanks,
  Evgeny

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
