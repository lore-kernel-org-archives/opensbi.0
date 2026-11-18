Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC98D606A31C
	for <opensbi@archiver.kernel.org>; Wed, 18 Nov 2026 04:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RutKWNve;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=K2v9LsxO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SbvYoqeS2Gujc8bOyoz4UackU8etFjeb0HoWO9P/aUU=; b=RutKWNvet0e1OxTh9WouEDQRKh
	xEYzqHvNKbhPVUN/JdvF7XBwlEBK0UXEHWHJQNzZlpAydXR1ronJvO1RCjOR/ZDC5PdJBX1DVc+7t
	Tbg6vpNodQo8+OWyvIytKleb9cIs+HuHMlIvMPXmNBcQzw5PnQIfMKDzr2CFqndxrq90UN5crXrwE
	80xwJPBlb8HRpPRAKUtMjhJGtnz7K8bpVHqL8Rfk14fk+GbbQwaU77brvt+RCFgYvFMj1N4pfDWvo
	941uLiuAuGLqR91Cj4h3V7kKc754SOIuClNSQwB08O+v8UNueVVuXhi6xclSnQspptWSMqMyO+x+h
	s5Kl7dRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTXhz-00000007j1h-2nvm;
	Wed, 18 Nov 2026 04:55:47 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTXhv-00000007j1K-2wwt
	for opensbi@lists.infradead.org;
	Wed, 18 Nov 2026 04:55:45 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2e946155442so4427815ad.3
        for <opensbi@lists.infradead.org>; Tue, 17 Nov 2026 20:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1794977743; x=1795582543; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bY9ccOT37ovxkuAtP18oooYWGchhcMKPYsPpJcFcfZs=;
        b=K2v9LsxOTV3T24UKYfSPFc3TjyeJ6oaWdBpTk0Yrh3b+PowfgBzJkL6aFeDwHgKSPN
         XFCOpGK2bjN/VX/7Ev9boF1XOn6ZUmh6K0B3GbYBifLRe4ZaaePJHh9mlFNiHJd4MSUg
         zltnFmDSHFek+ZTEJT39hwnBVH6AdsQRGdV6bV9m2oz6JkbgvVjnZaQv1ID/1JQi6fLB
         We8Ig0BWnegFOxqPHS5tM+hs/UA+vXdf77jp09rcUVUcTI8zdxMnvjVrJSS+OHBw4h1b
         6GA8QFqVFuhRHJWMG+/Yob0oNsHGtz5rAClEFRCj7Jb+BhREKnhif7g6tZXwsiwh4E45
         pZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794977743; x=1795582543;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bY9ccOT37ovxkuAtP18oooYWGchhcMKPYsPpJcFcfZs=;
        b=2MKLUJ5weFWexcSDSZsn2zrYi0wyk7nuqJXrabaZX7F9wRCC9cs5vaK2e/DHRcQa03
         W+MqKGpZAHsTVwvtMsLm8nP3+aFbjH2MH4MaXdsjifO2NE+VZwq4O3JEAZiBModpXQPw
         vOYtyULsMGNKOpqKazhJCkmndx8qouaUl6KSWjULiJx9QP/aL1PJfwQW1VUfhasA0Y6h
         ECMdftXZ/F4i6e4jjIreLDQLUdc3TywZGCeIODbkgtQoxgHGBfokj9rSF5FDUx1F++EQ
         QBfey6vlfTyUOWZEPLE84e3dYmzTrH6SN5vxexkEqG5CAcTOOZ+mHpdJbhaIbkHXeXkd
         DFcg==
X-Gm-Message-State: APuU4Z/9vZZOn8opCMGLc9FhxLlJ+4A8xvDPiS1Vk7ZaAdkddXln8axo
	QN25mkIMWWq8LzDOekF8iUpMBBohdr18nET1rmhKxwnAO3fpRapiIgKo1B7noRrJchk=
X-Gm-Gg: AZFdTZdnqZd+NHynIAgDen1AKXVCPtO2eNDPXo5sasdX1w4ITzoZsAUlzwz/iCwCxda
	Vu5WAiOqXGJpZaQT9nNiwmOPbVwSBDkW0ahReBEnWhvcKXL3b1f6iAV3oqw7QqF5oRsTpxRip8A
	R4o13oornCmZyjG6L/EfdthlMeH2KpI4k5XbXgIDsbO3bk2fJdb9cvpD6H00fJvdHk6hCG8EHCC
	dfM1BeblFh1yun3Cp2Z5j4J8I7CaSLpUHjALFe82X22NwGKA/sYSKuz9Uzh6TuwWwdX27EDcXyL
	izFhHGAGbUHUTdf9fCy3H+1C9u/AOrmj242BO/4qp8qQpopYcGErHBIwQPRnseWIbIarjnKYqH4
	c6OPhsD39ik9XRT0eVjSjRqff3ZtCSfxSiAVtJ8U64AKpvADIHd1LtXrcq4T6Uijy8LwHLUAlIl
	qv7DMGCVWgfMyo8YoSLvRjo2hPXqBgz2jtTWKLcCoPMmfTwxhmdRMxEd7ODRPt2RjHQ4BdWUGex
	icgo8YAiehndR07srQNHtRGHDei1pveh7oyJIzcp4DD5Uxzv0AkGHSgmnEMvkMkuOAUkAZU5Z9p
	sgt5PBT4vZ/FFRKee9uNgj0O38as
X-Received: by 2002:a17:903:2cf:b0:2e9:8ef0:cf6c with SMTP id d9443c01a7336-2eff73f4e88mr15705955ad.26.1794977742561;
        Tue, 17 Nov 2026 20:55:42 -0800 (PST)
Received: from plin-1878 ([136.226.240.170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6234f43sm6175295ad.52.2026.11.17.20.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:55:42 -0800 (PST)
Date: Wed, 18 Nov 2026 12:55:37 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org, pawandeep.oza@oss.qualcomm.com,
	rkrcmar@qti.qualcomm.com, raymond.mao@riscstar.com,
	robin.randhawa@sifive.com, samuel.holland@sifive.com,
	zong.li@sifive.com, greentime.hu@sifive.com
Subject: Re: [PATCH v5 4/9] lib: sbi_hart: lock mwid CSR for RoT immutability
Message-ID: <av0vya/EcY8tEzMy@plin-1878>
References: <20261110095029.117504-1-peter.lin@sifive.com>
 <20261110095029.117504-5-peter.lin@sifive.com>
 <CAAhSdy2=JhtXg_h==eiet7nJ-VMaq7VCMgmVuha-uwQKkVEmMw@mail.gmail.com>
 <av0GzyFfzDvasVEW@plin-1878>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <av0GzyFfzDvasVEW@plin-1878>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_205544_014273_534589B1 
X-CRM114-Status: UNSURE (   8.45  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Thanks for the suggestion. I'd prefer lock-only, because writing pmwid before the
> lock is either a no-op or can undo an earlier stage's decision.
> 
> The spec says "On-reset, the mwid CSR is expected to show the platform-defined pmwid
> value", so if OpenSBI is the first stage, mwid already equals pmwid and the write
> changes nothing.
> 
> It only changes something when mwid != pmwid, which means an earlier stage has already
> programmed mwid. Example with nWorlds=16, trusted WID = 15:

For context, wgChecker MMIO must be accessed with the trusted WID,
which is held by the trusted agent. The trusted agent can be the
application processor's M-mode or a dedicated secure control core.

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
