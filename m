Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E36606A329
	for <opensbi@archiver.kernel.org>; Mon,  2 Nov 2026 18:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nwCMniAn;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=UFL1bv4j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rP7W/zgxX1AjyIj4uJxABycNmA2eNFnKmEucBXQu/JU=; b=nwCMniAnMifX9NAhZo5Aho9KOV
	kPPPXaexo3vKLaWdh2x9SoWnyFghz5otTq0x5lAr2s0p6tSdYFd8jqO4qdf06pUescwn7Sx++esZ6
	u1pHYou0/L9gexcb94ZawtPy9J7qK6LDkyDRgVXiVeAWCUs3nRmw09ogedKiEmZQX7fSWDlymrLGX
	2uWdGEbB9ezDCwCIzsM6RabRV7NxfTuqQj29f/+HdrBobEcLC71aJHAWX1iwl8jjMPOgw3H7+Joue
	A9jaeYscg0oHvKn4tF8g1SUwNYHfssr+giZoZrk0mpl+akwkFD8kkai57LMWYgWOmSuQvPcsUeTB1
	sDyq7oAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNx6T-000000001Wc-0UOe;
	Mon, 02 Nov 2026 18:49:57 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNx6P-000000001WE-1sie
	for opensbi@lists.infradead.org;
	Mon, 02 Nov 2026 18:49:55 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-8ab43af5e97so37646647b3.1
        for <opensbi@lists.infradead.org>; Mon, 02 Nov 2026 10:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1793645391; x=1794250191; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tQfVjjZqIyLrZkn5QGW361rLb4lhncwBeupvXSSoUqE=;
        b=UFL1bv4jRrj+V6cfXHdku4FkXYyCz/uDWEmO2uwgdSJ6vvvJo+8voK4IU30yMqoZkp
         RiyHqoLS6tBHf57u6rsMzLdoh/SPwRuK4fLQVZlqOOIm8C9twGoOkkfCDl82CXeImmRx
         H6mvR51JJ0f8/EYEWjyaXzM8eFR506amKykJx5YkqF89vHpCWICjcPzD1C7uY5mOWoEc
         fIlDn6QNCssl7gnXgOzhXhN0+nqqXG6DYKnzoJR/c+146diXre+qXCJ7dVZqv50NBY1L
         osm2XAcZxSkK/R4KEpPCWL+Xe9Mxb0DqmF9Ah7Qe9B+pa+XRBECYpyzoXQ7LX4HHp63C
         totA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793645391; x=1794250191;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tQfVjjZqIyLrZkn5QGW361rLb4lhncwBeupvXSSoUqE=;
        b=eMG9ke4ukP9mjs1hSMAwzT9LyU8pwlib+H/imy3d+T/mjMacULv5lz5h+5JBhCxsXP
         kQMC2WFu8oX9J2Ek+OTyl3xYP0dYahzkfIG9Ojznfc9T2KqTVfXsW1W8XR0REJ6C0YvZ
         lxV2m6LMV9mqN4Y2kCrHtoh6v/OykI84AMgI2jrnVJolUd6KFmQxjMRSzCuFfrlgANOl
         0CIzKyEOJOvx2x3gHcVAmdzYEN2Ra1RI/wOevRNVd87L4aWlQIn3eJpsSuL+6i58WzV8
         H+dogpyl3WStiFlZIGUBvtMU+xkY61dbB94UpAiRBu0yAxQtSEuomgqQ1MLU4aLTgzcj
         zh3Q==
X-Gm-Message-State: APuU4Z/CpVleyi+gERfyfYrrATQ1HeCNjgOSM5795GwDF3KtLblzXeEx
	/1eeV8Opgak5VJsZpo7/M4gYLjT/etJmU//9WY+RyE3a0IIJz3Php4j9u/kj0S8LdH8=
X-Gm-Gg: AYBFou1bvne6mWGXY2rydZb5mSjniUfWFjqo97BNdx5aLWg/8UefR+3A85Mogb9ilHg
	w+0LFe9npyY/Csx+OfeyZh4zyoiJyWHKS4xpc2Jxn5zwfxd5yo/bsze4v2HhnsI98PEd1lADIxT
	ctR1//k7VOUPhAJAK2z3PMuX85OADtXEpvsEhuTEmaj2z430MHn5ZVj4PecYBjHBLrJzfJzLVQN
	KACHbI8tHVq+rV+T7+SIvY3mvXm7LQAg2aPY19Y8lDebLT1xvF7rRy8QlO/+pNYxqI0opIRDyXD
	hPuSLAmj/QOrGD8m5DQJSDPeKC4jr/1HYwI+jhDhnYI9xUkXpMvK19Vfgm30jnKCD8yrl8MhIwa
	OLSZc4p8M6xg2zC0qcZe3HurPQDdJz3g3brVs9EkMvhNCVz0ii/gIRYE7pV2lYAnVlgxhyE6+6+
	5aPABUtkR+kLimDMi9zsUmnBoCsy++7idSJ8AZPPIcpmsuLsw09oQmAgx9GHAC2+3JuQHmtc1d8
	YsmqnPfVmYnf3m6jtSfi798RgiFm+8LKaYBeQIgUpPuv7Ikj3l/Y9gOFqsUobdVPxG8xOtgYj9q
	9qsPWm3594mLK+PHMZZFfiw2y/6deahUAwoiTjQy+3AzGln41pUZZFYsAXoo/7/L3nw=
X-Received: by 2002:a05:690c:e181:10b0:8b0:d255:5f8a with SMTP id 00721157ae682-8b1c6691f66mr69110567b3.8.1793645391653;
        Mon, 02 Nov 2026 10:49:51 -0800 (PST)
Received: from toolbox ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b71641aasm58296937b3.25.2026.11.02.10.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 10:49:51 -0800 (PST)
Date: Mon, 2 Nov 2026 12:49:19 -0600
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: opensbi@lists.infradead.org, 
	Xianbin Zhu <xianbin.zhu@linux.spacemit.com>, Anup Patel <anup@brainfault.org>, Bo Gan <ganboing@gmail.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
	Kevin Zhang <zhangmeng.kevin@linux.spacemit.com>, Alvin Chang <alvinga@andestech.com>, 
	Valentin Haudiquet <valentin.haudiquet@canonical.com>
Subject: Re: [PATCH v4 0/6] platform: generic: spacemit: add K3 platform
 support
Message-ID: <dh5ghrr34gyr3nz2tb6x3wz4e5fdncgvu2co7rg4heek2jvmpo@xisfdsqsqpyk>
References: <20260910-spacemit-k3-v4-0-0793b62329f6@linux.spacemit.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260910-spacemit-k3-v4-0-0793b62329f6@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_104953_648851_6F64D328 
X-CRM114-Status: GOOD (  19.11  )
X-Spam-Score: -2.0 (--)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Troy,

On Thu, Sep 10, 2026 at 10:00:01PM +0800, Troy Mitchell wrote:
> This series adds basic K3 platform initialization and start-only HSM
> support. Secondary harts are started directly through the SoC PMU. RPMI
> support for the vendor kernel is outside the scope of this series; the
> upstream Linux boot path does not depend on ESOS.
> 
> K3 has eight X100 harts and eight A100 harts across four clusters. X100
> implements H with a 256-bit VLEN; A100 has no H and a 1024-bit VLEN. The
> existing expected-trap handler is chosen by the cold-boot hart, which
> fails if that hart implements H and another does not. Store the handler
> per hart in scratch space and load it directly, avoiding an accessor call
> in CSR probes. Other extension and vector state is already maintained or
> queried per hart.
> 
> Only hart 0 is powered at reset. The HSM backend clears the requested
> hart's core and cluster power-down votes and wakes it on demand. PMA,
> cache and X100 H-extension setup precede the common warm-boot entry.
> Cold boot programs the cluster reset vectors and enables CCI-550 snoop
> and DVM requests before secondary harts start.

I was hoping you could clarify a couple of details about how the non
boot HARTs are brought out of reset. There seem to be some differences
between this OpenSBI series and the vendoer opensbi tree.

The vendor OpenSBI tree relies on a "riscv,rpmi-hsm" node in the DT to
probe a HSM driver. This calls spacemit_wakeup_core [1] which does the
writes to the registers that is done by spacemit_k3_hart_start in this
patch series.

However, I am noticing that the probe for the riscv,rpmi-hsm device
fails on my board with the Vendor OpenSBI. OpenSBI logs are here [2].
This would result in OpenSBI falling back to simple IPIs to wake the
remaining harts up, and that shouldn't work if the harts are still in
reset.

Is my understanding of this correct? How does the vendor OpenSBI wake
the other harts up? Does the ESOS firmware play a role here? Are
incoming IPIs translated to a reset-desassert for the core?

[1] https://github.com/spacemit-com/opensbi/blob/k3-br-v1.0.y/lib/utils/hsm/fdt_hsm_rpmi.c#L382
[2] https://gist.github.com/asrinivasanTT/2ddc73b05f4b290fb6618408fd5bd2d2

Regards
Anirudh Srinivasan

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
