Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F92606A31A
	for <opensbi@archiver.kernel.org>; Mon, 26 Oct 2026 03:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QXPehLeH;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qtlcJYkH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1/cqW5R80N0YVCCgb+B7MvtRxNWW6eyNyDSi08zgHM4=; b=QXPehLeHWv6qaLkhvmDoZah4Go
	XD6OwPVDGEdZdsSQVZPig5jQ4hAqomUISHiA0QwOEIr2FdrgqMduOCvDX+ekbEDK6vkGkaJGezTlt
	kDbmbO8AaGF8xK7jWNam0IWxe7CYtcri2AIc8kJVpanhhhddr+Xgql9/WJkBkPFwr1sCAV0Mn/16v
	iDRPYFz1ng6x9vBPd8ssIu5yGWfV5L60OQ0534hxH6B3ZEjVNKc61S0PH6webHy5HFBurlS8avxlx
	ICbVLgAVPrIeNauGhoJoGaYNbabaqenF7toFtokiZLwc3c+LELdJpr4pdf+GrhLJlnQsQ8iOfafLE
	FgqkoKTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLBjA-00000001glC-1BT2;
	Mon, 26 Oct 2026 03:50:28 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLBj7-00000001gkm-2Qyr
	for opensbi@lists.infradead.org;
	Mon, 26 Oct 2026 03:50:26 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id ada2fe7eead31-7cc2bb73cd9so709352137.3
        for <opensbi@lists.infradead.org>; Sun, 25 Oct 2026 20:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792986624; x=1793591424; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wYPV0BmvBIVE7ZYHBl3RlykhKOh6M7nMMKrdiXA0u/c=;
        b=qtlcJYkHQ5Uuv0Vd4QRz2TK36VFCihijInLwIY9AYB6OGLaL2ORxWgFx6DKq7vY36v
         VKYdV8iD9mHcGRXBdnLVKfFUQyB/mBLq9orexa91worXgPJM+rKEkb2AC5bGYBWobVpd
         mhR/UPAxTi6MPuMxYUmHd39P9bZsPrGBSmnWec7SEcetYAhiHSGwNqjssizjLrfOFvk2
         DHJ6P0igXpK8jXu9dFt6YqZn1+v+YK/ejMH0Oes2M4/fdU2d5MbHJkD9BxWd7Sz3vIBh
         dc2D5zbzuXjuwKXBQhnIVshVzFbB8DoQPCOfFYJR4bscbRYD8CH1SDlAYx3U1/4iBEb+
         +28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792986624; x=1793591424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wYPV0BmvBIVE7ZYHBl3RlykhKOh6M7nMMKrdiXA0u/c=;
        b=WRrHdn3ovMEth3eZ5gYNN8G/Yk6INn7Zn2v+Z52Liq6WHQw7+flGUUdR+phoCcrhvg
         Ula/oOz/iybDr+30b2YSEQkg8x0dWWUV70rK4K14qKrTVxaIGNnYm31arbH9fwY++58/
         HRCOpSJtuVRCgAjntbVL5ob2HlVR1EmkrBNgfUe2Xfabr++kp4nf0YoLBVLWA47sV0Y7
         r/mSnEsXNepwJ9JBUR41Dagz3mspiRtG4bUTsOHx0Tb0Ei1Ge5vTzJU9fRn8mbMx8rDY
         iQXAxaVzixAmYNmhfi0ySCw0U/zocwSAVh/+gyTp/3my6ABMcF+CDCFflKsky5l4YR1j
         bgNg==
X-Gm-Message-State: AFq9FYKL5HXTNWbupWPZBffX/NhkjLiaTQpGv5V/tI39vCNu4kmtyVgV
	VHubdj1SCV65JCUhAwNdfB0wMKDqqwJj5tEX3qJe4g39Wlmmt7n8OYK6n/2KdQ==
X-Gm-Gg: AYBFou0TcySQXS1QSR6K668bOreMzM9/sIwYJ8+siXxf3Cg02yLsUVRygSB/5a0/pkT
	Ubiy2w+v3aXZ0BgvX+gIwlidHDJO9P20eu2Ksbx+1b5eJe/yq0ax7XXbfqBJsY8rjXZhJBQdGQz
	L8z7r1614k+6kYTrIziftNvpKgKboF/hgkFU5A3zgRUCJOhWzs6oHRftWuDIIrougMx4IoLjjSF
	TI04SovlZwVHVHyJ6EUVzzgOW/B4Sl00+DFg+VCo0yo0jVdQ8kx6rqd7ixpFEdXIulIyVa2RQam
	oLMr70m1ztaUz36OSee+7mRXw1C0sCa/onqi1Nr/20EHQIsGeS9TN4XIJ4OXln6zOAhbb6L/YLg
	FlGQQvBXzy5Cc0gr4O/nfxshC4SrRp+Frcnaz/v+OF7f5UKmUv7gMNViyTm4CvznjDW43SKXa0T
	iv6S/h+aFQwyHPXgYg8JPtau7X1ET6gvcHUEf93CDYQNq1BFxy55LM56KIa/HKq0zVK78ZG1Y3W
	MpgeR2MLKETF8yxpBN5HGiEO0eLAF2POIwqupwHzNPS1DODQGPy/wvhHNQR6BPn7fRgUZnBKFvO
	Ni97X9MdTU445QK2HUak1Qun9aNeB5vINfHdkMX+Bw9I
X-Received: by 2002:a05:6102:a4a:b0:7a6:85d6:8ae0 with SMTP id ada2fe7eead31-7ce5ca1e4fdmr1365479137.1.1792986624162;
        Sun, 25 Oct 2026 20:50:24 -0700 (PDT)
Received: from localhost.localdomain ([186.151.100.62])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ce5e1b3472sm6355215137.5.2026.10.25.20.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:50:23 -0700 (PDT)
From: Sebastian Alba Vives <sebasjosue84@gmail.com>
To: opensbi@lists.infradead.org
Cc: anup.patel@oss.qualcomm.com,
	liutong@iscas.ac.cn,
	david.garcia@aheadcomputing.com,
	Sebastian Alba Vives <sebasjosue84@gmail.com>
Subject: Re: [PATCH] lib: sbi_pmu: unmap shared memory on the early exit in event_get_info
Date: Sun, 25 Oct 2026 21:50:13 -0600
Message-ID: <20261026035013.2728338-1-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAAhSdy21+URDb3TWXjhzrQhXjzrvpg1SFta5F95AHrZFKR=3Lg@mail.gmail.com>
References: <20261012022033.1165060-1-sebasjosue84@gmail.com> <20261025145704.2570129-1-sebasjosue84@gmail.com> <CAAhSdy21+URDb3TWXjhzrQhXjzrvpg1SFta5F95AHrZFKR=3Lg@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_205025_624486_23AA641F 
X-CRM114-Status: UNSURE (   5.26  )
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

Makes sense, and I agree on not rewriting published commits.

Fair point on flagging it sooner, too. I spotted liutong's patch on
12 October and didn't say anything until after this one had landed, so
that part is on me. I'll raise duplicates the same day from now on.

Leaving the record in the thread is fine by me, nothing else needed
from my end.

Thanks,
Sebastian

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
