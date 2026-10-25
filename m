Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1895606A31A
	for <opensbi@archiver.kernel.org>; Sun, 25 Oct 2026 14:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eFJKtP4q;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oS4XQYye
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sg+NtweA8y+0rNNWbmPH06ArDjM+R1zgUfJGvgGtiGk=; b=eFJKtP4qfV7zOGE6+bBS9uJVrZ
	dCzwHxq0fifdUqT77c2/wpHBexu24z+csom+S5L2lo0LGWrbhiE9GAQavTxaTg8e+5xhcrVXl0ZmY
	BkLnQB/6CelwyPgGhfJF/F+xzmfz5WMrHbFHN/7U0Yq4wuO0mpgEx8kqt7bURyfgrkuR+un+HWqbM
	95JhBOwwS5e3/iODrj/NsN9PZ43aX/pbgYcJLVzV6P6bfVH7y0nR7wVDQLR5rI0bHJTqlXd2h1IjM
	18BFeWPOc4c/fkzDpYd6s5u7S43GBXgKl99L2aBMGcVK52ipqXROufamApO4ImFy+tOH/LHSYqAvY
	TNChE0vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKzeq-000000019Al-0rgl;
	Sun, 25 Oct 2026 14:57:12 +0000
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKzen-000000019AO-1TPx
	for opensbi@lists.infradead.org;
	Sun, 25 Oct 2026 14:57:10 +0000
Received: by mail-ua1-x934.google.com with SMTP id a1e0cc1a2514c-98c78660542so1727634241.1
        for <opensbi@lists.infradead.org>; Sun, 25 Oct 2026 07:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792940228; x=1793545028; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VnhAxDb0oKL62Kl7pp0Mv5MfmpQZWiVFnTN5LIROKj8=;
        b=oS4XQYye09pLQ7MtMCs4vNMPW7GOy0XKlRGCZ8kN/PXbaRCJxWZyb+V3bgUGvyTek3
         w5H7tFrNlgGcbqLzMUP4dxu95FnuyjOJBZb3+gTSWI6OI7+x5oUOfqlM+6plPFJnr4XY
         +0hQtcfuyTcQVV1yDnb9SvJcV3EgWNCQ9U4+IUBA9A/srzDqZaW7dicVJ5uFqSMfPGxY
         S7yefayB0i/UtL+p7tusByEoSD6JIGdUFTNmzbSBvk7YmMdtWkVTh1En8XykneMl4sEs
         JzQZeOdeGVG+3EUK7aPu75tw8ynzLlAl35JkYa5L8fen/Ij+I9VE2P+8hgG7R423S/9L
         bIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792940228; x=1793545028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VnhAxDb0oKL62Kl7pp0Mv5MfmpQZWiVFnTN5LIROKj8=;
        b=Rp+/v9hkqWkmJgmD5WwfEfw5lfI+Us8VW/9Fmjke9xqYr+nyor5EqB4nYfAUnYmso9
         7IYTHZvemrO8gm1D/hZ3c4KjE4v6+rpyMTUMlJncEbfjo/v9oqgSkaxhFJ2IYCKX8GNt
         h5reKPu6YNObXlUwVAOIKn1PGSLBAAAzPHwbOLQ8mxCWmOwe1du+8JtQFLM3RInI/D2v
         Ks/OaALlMWSEvSgOMLIc9yffY7ehpHqAeBmZqfMgl+AscsqpBia3Ctg2QfxNDl7QN57h
         1hSeRdfKwPWrIAfvx6ay4A1M+Sqn/Kr1mfG94lSPqoz+9eY6m4+0EmKOJPZYFu+vVBTe
         U6vg==
X-Gm-Message-State: AFq9FYJ1ElHVbnb5/00UhEI2kJNsgEONlUMvA94/APX0Vr7YAcT1Vf1g
	GGTxNPV5lBW1k8QbqLzlY8Qpv1AL6QNjspbWOY7TPzbvLiOOwiW9zPT9QKlRH0RR
X-Gm-Gg: AYBFou2RS9/pg896M//I/TKFH+ALk7Ipwo4xoTZzaXdiYKKYfqcXAyqiFzCG+hYf4LZ
	gwM9VZc8+Umv+48Ukg0DUYGi8fqKt/kLmL4SGb95epJEGvWVizVqpV/0NauCXsEiTop7G3ZPlEK
	6wy+klDNhp60wjgVKqCGZB2iJoLTWeUHhioy3tIlAr9gIHCh+mskfqacXRrHNkYGNJqog3wPyVT
	pnywU8PXffSUljma2lxcEAGT4DzFtb02vhDu+hZBpY/rgRlWkSFH+PsvS0OXpXkGcDLbWvvgpzn
	A+oziuVxge7cj1lRUq0udvTi56e47PIJqZKBuReu/HH1hLzRws4tfqqaNdT+8hpTJIrVj58vcPg
	VSrMCHJKFzdlH1zTIA7Bb/WcKb5bRsId8mjKBGG9SsU9OBu66CU8aYqPBgw/xvtgWl0F0hf1k7X
	th0/UxOVMl2sExSBOF/NcEyHUMF4eqL5U2Jp8Ntmohx1IseXV7LENXLDcaii5b3K2kMDjxw4RFw
	/XaewGIR6sqsCynVnSZaMx3yKozrWAdg/WLZ+eBggf/DYnJgpkUAsM0FDPdsNhQjEvYzXHe7jx6
	Opuw5R2x2G2cdDeyVfoKUbO7LlebwgR9Xdr1ZfvCfFaD
X-Received: by 2002:a05:6102:14cd:10b0:78e:1e0f:ea42 with SMTP id ada2fe7eead31-7ce5ca1e478mr1163690137.2.1792940227817;
        Sun, 25 Oct 2026 07:57:07 -0700 (PDT)
Received: from localhost.localdomain ([186.151.100.62])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9910e80597esm5462394241.10.2026.10.25.07.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 07:57:07 -0700 (PDT)
From: Sebastian Alba Vives <sebasjosue84@gmail.com>
To: opensbi@lists.infradead.org
Cc: anup.patel@oss.qualcomm.com,
	liutong@iscas.ac.cn,
	david.garcia@aheadcomputing.com,
	Sebastian Alba Vives <sebasjosue84@gmail.com>
Subject: Re: [PATCH] lib: sbi_pmu: unmap shared memory on the early exit in event_get_info
Date: Sun, 25 Oct 2026 08:57:04 -0600
Message-ID: <20261025145704.2570129-1-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012022033.1165060-1-sebasjosue84@gmail.com>
References: <20261012022033.1165060-1-sebasjosue84@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_075709_396197_1BE83D90 
X-CRM114-Status: UNSURE (   7.55  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Anup,

Thanks for applying this.

One thing that belongs on the record: liutong sent the same fix a month
before mine, on 2026-09-10, as part of a v3 series.

  https://lore.kernel.org/r/20260910052629.3359493-4-liutong@iscas.ac.cn

Same function, same early exit, same Fixes tag. I was not aware of it
when I sent mine. It arrived as patch 3/4 of a series whose cover letter
is about integer overflows, and I had only checked the standalone July
patch for that function.

liutong is Cc'd here. That patch is still unmerged, so if you would
rather add a Reported-by or handle the credit some other way, that is
the right outcome as far as I am concerned.

Thanks,
Sebastian

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
