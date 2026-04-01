Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6CD5D3517B
	for <opensbi@archiver.kernel.org>; Wed,  1 Apr 2026 12:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qt2pJEOPdVV5OkeUdrzooZ44/2W0awhT7Cu5Of5bYeU=; b=q+4J50mjDQcUqJ
	5UJNDSMsnJIR3D50wMt7B89/ogZMndg91mQKiSXRTqylvowTZknV2pbzDxm+stEbSJ1mBkQNFryOZ
	LvfUiZulv1WNrQXx8Wa5O4mPW2epwwltAh8ZGkIRGIWK4oFVm8mKnceIpsQMDR2/0V0NPUMxRDVbv
	IaJQcbun80UUPDadkI8Od8grS4A+Ex31mJUGcsocTrKab+tC/K1oPt2hhV0qbAi+w9CWVVA4I154D
	Bhs2uoZs14+UbCtrh4Owg2cCYj/W6P4zObo1TBn6CUAo5d/3lE4ZvfMjJLKzTjLGfxxXOQH/ju5qy
	8yrOPW1rgHl5OC24Wuyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7v2E-0000000FFm6-3wRA;
	Wed, 01 Apr 2026 12:51:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7v2B-0000000FFll-2JSU
	for opensbi@bombadil.infradead.org;
	Wed, 01 Apr 2026 12:50:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3sGsa7WTyQPu6rdQNioPVUjPf+hOVcJTR6WgXNXO104=; b=LcR7MUd7Hpkx0x61LmZRIFk0HY
	sHD9DllLgAmh/QMGPf5Hc2WhFBKMmDQiqp0vMxs6YgLqqOC8p5jY/pZIbvOssW2Hlp00IjlQ6C7Is
	BIseItQJ08l6TS/V/mwZZkTDHlLjGoeXegShneVqSAJx3pi1H9JpNLtQyjcV5Ph6KhppwlY7A4iHY
	yzIorMZQ5JakZttEhYfibIPmsFPjoyDahAWaF6oBKHpoaq+0Sv5OGVQn3mYKOeqMxwt2D7YiyCPAY
	bADNrDEu/Raa6U2uV3IwedGsHEjAvufr/vc0Y40TVD5BAwVK3bX1WD0LkQ1zbuboHY+Fpop2vdoHD
	XA2Xebxw==;
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7v27-00000000OFI-3YnB
	for opensbi@lists.infradead.org;
	Wed, 01 Apr 2026 12:50:58 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-65009bfdcfdso7997935d50.2
        for <opensbi@lists.infradead.org>; Wed, 01 Apr 2026 05:50:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775047853; cv=none;
        d=google.com; s=arc-20240605;
        b=TU85yOs9O6Y2M65ghDXmmVtSO+h+GIT6ReAjn40DWNGqdZDs1IPz1XjSpZMyoQ0OZk
         IjYpPOWREelnZGWBFPQDsMNTJ0sluo4F/G4NfYLxt2S0wFFwdrAdmkuBZBM5QW+sOG+n
         k693TGr6neuH7UPo50sCIP6S7L13ZQETFaS9+I+Gg3CeLk0uTfjElC36+1PexrQWiWRX
         nN19jbM0NTKej7khG4Teh5aC7oWvQ3o3LW4yavdfV5RCsQeM2rCPe2Q2EyMZt1XOpABc
         z2GvWl1IuSxb8h14S7xjVv31homsoChd66t2aO1R8etxQqy7wPgtkkhKVvqXylDFpXh3
         pmyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3sGsa7WTyQPu6rdQNioPVUjPf+hOVcJTR6WgXNXO104=;
        fh=s8r/FTK/68oCjpkCnOc1fK9DCo6TBMvdxlAYkLUYfOI=;
        b=RUkpj9NMRtIixNmhCF7Dn/nKdx96sUfVfB1tbxh43agb908l0aGh8QwsCFfW6UMDFm
         aY2aFZjilbYhqGJsW/iNXzX6son7TgUck+QaAntcM3x32SXt3YtsYqoVt8EutWvP7wrL
         zHHFobd7keQhjkDSsldR8AovcithSPI7lBpq1FnGUNNE6f9mZLZIPs7cPJWcsdaSFQ8d
         wqJ+6FOkZKU3RoruL05l0ZGFe8XZK3+LX3rG5kVRp5tL7wyEziqZE1x1JPknNPIPJDE3
         1w3gRC2mVa+/ynrYD1nx+yvbZRdICLYHH9d3DAixqvMDcpV/YSJW83e1ThGbraRVaKxS
         F/Kg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1775047853; x=1775652653; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3sGsa7WTyQPu6rdQNioPVUjPf+hOVcJTR6WgXNXO104=;
        b=CsHFHkj9YqamZrAxE4p8RY9lIftZ9cOzdO0hy2rDuScbdQbbahFPPcA6+a3rV6DdZx
         uex18MyVwzPXVaSKo0l0AmreCpDlLcr0Wcsdrkjof6I+kqjl1YE6JcZyvQH4ROgfl+pn
         S92Ba8KFfsBOf10osHni+5V1PairKSPKAJpjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775047853; x=1775652653;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3sGsa7WTyQPu6rdQNioPVUjPf+hOVcJTR6WgXNXO104=;
        b=Iq4T/k5Vps/tkiX7FD+LlBBQGhcfis+XaHZRA+aTVQYX+6QLjrgkUP43wQG9QoyjuH
         KhIK0TbV7IetUNUYaSzyfSm3hUYZgRgQspWk8UvbW0e7RDHkJW6u4EyCHZfBkF1aFkvO
         lK/XZM/P8ZtNlsOZM1JUMMI6SNVZSKXDlPvnaMKKmNXxc/K+EZKOy4DS8WGjn/vd8Voy
         3ne9noq9n0qLlakzhtMjRot0M0WLMcJQMpODuzVH3MGycKitS+kfIjNkFqrvytu6mxAe
         zUZBPcOIpsXR+jq6qm2aYDHEGEOY08dKy2HmArzBAdslM/yuXwv9wFpuudLD9dQ5YIvs
         sbVQ==
X-Gm-Message-State: AOJu0Ywy+ilmHn8cGv7QtCIwz34YZGM3XQFAAamG6I3FTT2C1pksWPgu
	Xj+cU+7y0KgDzFYZuqb2vHduMEJTGX6rRawv7a6YcJXNzSgygQLCQGg9rx3XUhsP2b6N0eYFR8d
	2qQf8VchBYW7Bz/bYHmYBMg8ZbM3enwo=
X-Gm-Gg: ATEYQzzLGcI/zFahBp1upBVRBS0ipjswOFp2s3w2gVlMo22jZBJdnNHQ72JPE9JaypD
	fR3zi1uB73IO9cUWcqLHGIRUnSszY/nLQKJYM+DgWulvziQplz3wSyOxEP19dY9crkeEeb2eZ5i
	N66wQ8jsCLnHEL/xCkxCxxxz/PdzhmvymiSlTi4liL0HBAT8LlLDf9jCTkOKuQ3LZx/iCnbJlCo
	tNCJNnSpKz+3Q4JYCsL3+eq29wJ7mEqwGihXTXLrd0g/ScnTl9SnaiGoI6eEUfxOpy9a2kg1DE6
	eW5M0oARLM7D1PvAZw4SKmVFlN3XRwJSxwwBD9OxbCF1xqTy/KGfMI1uDh+XiTcjvgEt
X-Received: by 2002:a05:690c:c504:b0:79d:7525:a241 with SMTP id
 00721157ae682-7a20ffcaa66mr40329747b3.15.1775047853086; Wed, 01 Apr 2026
 05:50:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260310005000.3837512-1-npiggin@gmail.com> <20260310005000.3837512-3-npiggin@gmail.com>
In-Reply-To: <20260310005000.3837512-3-npiggin@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Apr 2026 23:20:41 +1030
X-Gm-Features: AQROBzCngIs1ZawJmPEVoIA3IYUMRk4n-qN15b0CqTKm_HsFtmVLbygkVYlICv8
Message-ID: <CACPK8Xcb-G7KpghhbT4eFH2wigYeftU_U0v+92kEnjbXbiU5Tw@mail.gmail.com>
Subject: Re: [PATCH 3/4] lib: sbi: Add hart_ prefix to PMP functions
To: Nicholas Piggin <npiggin@gmail.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_135056_398025_764E80FD 
X-CRM114-Status: GOOD (  10.29  )
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

On Tue, 10 Mar 2026 at 11:19, Nicholas Piggin <npiggin@gmail.com> wrote:
>
> Give PMP functions that deal with HART CSRs a hart_ prefix, to help
> distinguish from general PMP encoding functions that will be shared by
> the Tenstorrent IOMMU.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  include/sbi/riscv_asm.h          |  8 +++----
>  lib/sbi/riscv_asm.c              | 10 ++++-----
>  lib/sbi/sbi_hart_pmp.c           | 14 ++++++-------

Some changes have been made to master since you sent your patch. This
fixup is required for sbi_hart_pmp.c :

--- a/lib/sbi/sbi_hart_pmp.c
+++ b/lib/sbi/sbi_hart_pmp.c
@@ -206,7 +206,7 @@ static int sbi_hart_smepmp_configure(struct
sbi_scratch *scratch)
        }
        /* Disable remaining PMP entries */
        for(; pmp_idx < pmp_count; pmp_idx++)
-               pmp_disable(pmp_idx);
+               hart_pmp_disable(pmp_idx);

        /*
         * All entries are programmed.
@@ -291,7 +291,7 @@ static int sbi_hart_oldpmp_configure(struct
sbi_scratch *scratch)
        }
        /* Disable remaining PMP entries */
        for(; pmp_idx < pmp_count; pmp_idx++)
-               pmp_disable(pmp_idx);
+               hart_pmp_disable(pmp_idx);

        sbi_hart_pmp_fence();
        return 0;

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
