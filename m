Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DB6606A31B
	for <opensbi@archiver.kernel.org>; Thu,  5 Nov 2026 02:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eXleF8Ns;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=gQ/fEbFB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fIATIcYdJEDdJ6L7y+aysRCZikGNmUcXg7Xm9T5auFA=; b=eXleF8NsJP99ayBoxfs5c/NIxs
	LK/kh/jHl/eD/chI/1625n3a1KGLVlppxoe2iCyBiKhUNZK5RITnZXCcliEYcQaW+uzagxPtcp9zG
	KoD0ju6s7TQ1XArL/kAyvRb/QMvIUDS7f8qHklilUm5r70ZJND9kVwYj0EPhuUBqBaehY8BgMFna3
	P+vDE1KzcXlEGHBGi4x7yg4gHNJfr7Al7JZKN264f6U9y6SDW+XZrqGNmCwoWKw5xao6PBsdg/Ja1
	rgLBkIGcyAsC8yDuurEtZua7rrqePZTVRdYhGQ/28qshCMkH+Nd/5T91OxSHhFiIoJOPyf8oL81zX
	M59uSMYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOmw5-00000007XIZ-0w2q;
	Thu, 05 Nov 2026 02:10:41 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOmw1-00000007XHb-2xRr
	for opensbi@lists.infradead.org;
	Thu, 05 Nov 2026 02:10:39 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3ada8bc2380so708609a91.3
        for <opensbi@lists.infradead.org>; Wed, 04 Nov 2026 18:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1793844636; x=1794449436; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qDKi7yTPHB32kCmZKUJCx7oxzg39xIZ0uiAQltcV4hs=;
        b=gQ/fEbFB9qUa/tteieQJrMld4rnrjg7cJP06VbXA2asR6+Pd6kC0ZRNZtvvM1LchNn
         z4ljHxq47UVxsyPc+sK9YU/N9bSBJvUkqn0We+eFZxjr7V4MD8o3r0+TMldXMH+XqG3U
         l8mddVA+KHsENx+S3Mt69xqb36VTQhNXQMpRgHsbSNq/QqrE4UhTThmiZUILhgnXhKXK
         IghmyW26vr69IgDMSrHOFX8MAsChk6IgfsKVhPOl20vwq9Ql0La7g0RQum2bAwsUAtcI
         UlachhRmQ14gl3xk8Xb/w8cna0AO+wFBJyxt07QhcGsmluyCF80BDLoePt/kgd6tj4G7
         MzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793844636; x=1794449436;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qDKi7yTPHB32kCmZKUJCx7oxzg39xIZ0uiAQltcV4hs=;
        b=UEjWvqo1OT8p33HF5B4DwEh42toDTrhOt4so3e78PJ2VAxNI+tg/Ss1JWGncZKxkR7
         /abRlReIdaeh8yHAxJIuej+Suly+3Qvyz3UPAArGUIgVkoZFtEyLW1APCO1zPosE2T/I
         cA3P9+LsVn3alsr7WQvd7vTlcaq6XmajEQDfBk3l8vGKA+4Fc9LOTe/1Zbmvl+nXDInH
         Td/rQZ3gKJF7mqodUtB53Zie0Cf0GLKNzDPyq+TEJcMOiuNu19sLgO92Kr2sA8fl+RT9
         Q8qoGggZvB9s+Y45kTZmVplA69ha3QcComaIqdj/IOvl3/hhEOtdsJVEXWxl/lYnq125
         kqjA==
X-Gm-Message-State: APuU4Z/74HrEyIdFRE3gpky0dThQb3VLL0mx0Q8TY+c8CvoSHhNS/1Sf
	uhMpPtmIhTHDpFtgwkQyMzI26qJ9fkQRERLTw49vPjPtclsiWvndB9AlxU4kah1XkJY=
X-Gm-Gg: AYBFou3j0T3RvSQ4RBxzx2hOYwqAaEeRF1mGxla2q++kkjHX1G8QchwoYFIlgHiztO1
	s9ObOeFg6ZNVcVpZVy1JyuSAF9yjTVlQoK7qU4EWScldxO3VqbpQemPCx7P1oY4uBI95JZ5cXpn
	VPFBlgfNyDwA3wMuKktt1D8L0WGm81rFCn9cTUq/ZBx53uu+ZiOt9OdhXToekbtHSrn2ITabj07
	vxDkqJbxH6/NF9ruvoTkVq3Fcnw0U0hQDHP2Pm6+8W8s/LEloe2/GFjh/W/4/5oCqp3aJduiRy8
	O7wvhjDuGfagcqNkfCrB/3CL8Yb/SnzszLiUo4zFJHgPOUa0IgdjrclV6eC0unUGzmFD+iiDML1
	G02zVBqabRnQIHRt7OM1eF21m4y3AugH/jojiiKyE2YXLQuLtdeI67vjGpYFXyq4Hk5Q8qBbZ5a
	kZeLpLxAxcVl2ICnX3Q5/Xwy1VtNW6htfaBOcOMaHm3AE15Dlj++jgcIR708usUciWwbzWHin2i
	nXXGyvHq5NH1r/DZZ/PSCNu81kBCjS3VNux4+IZ7YpfgTrI5dx33xa9BKqAySZEVmQp+yc88G12
	jz/BV7XXbPY1abNNJfyxofeJQpzgLmO3YNs58NYukHd6pXZm
X-Received: by 2002:a17:90b:3807:b0:3ab:413:49bc with SMTP id 98e67ed59e1d1-3ae897994cfmr14314701a91.37.1793844636310;
        Wed, 04 Nov 2026 18:10:36 -0800 (PST)
Received: from plin-1878 ([136.226.240.181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b096b52911sm2549920a91.3.2026.11.04.18.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 18:10:35 -0800 (PST)
Date: Thu, 5 Nov 2026 10:10:29 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Radim Krcmar <rkrcmar@qti.qualcomm.com>
Cc: "opensbi@lists.infradead.org" <opensbi@lists.infradead.org>,
	"anup@brainfault.org" <anup@brainfault.org>,
	"pawandeep.oza@oss.qualcomm.com" <pawandeep.oza@oss.qualcomm.com>,
	"raymond.mao@riscstar.com" <raymond.mao@riscstar.com>,
	"robin.randhawa@sifive.com" <robin.randhawa@sifive.com>,
	"samuel.holland@sifive.com" <samuel.holland@sifive.com>,
	"zong.li@sifive.com" <zong.li@sifive.com>,
	"greentime.hu@sifive.com" <greentime.hu@sifive.com>,
	opensbi <opensbi-bounces@lists.infradead.org>
Subject: Re: [PATCH v3 9/9] docs: document WID DT properties
Message-ID: <auvllcjA1ztGXUEW@plin-1878>
References: <20261027083509.1076577-1-peter.lin@sifive.com>
 <20261027083509.1076577-10-peter.lin@sifive.com>
 <DMI6OBB8VVH2.3R7QIDD1FYPO2@qti.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DMI6OBB8VVH2.3R7QIDD1FYPO2@qti.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_181037_754714_91E8D963 
X-CRM114-Status: GOOD (  17.42  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Radim,

On Fri, Oct 30, 2026 at 12:49:08PM +0000, Radim Krcmar wrote:
> 2026-10-27T16:35:09+08:00, Yu-Chien Peter Lin <peter.lin@sifive.com>:
> > Add "wid" and "widdeleg" properties to domain instance node
> > documentation and example DT. Add a "Root Domain Node" section
> > describing the "root" subnode under the domain configuration
> > node for root domain WID configuration
> >
> > Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> > ---
> > Change v2->v3:
> > - Mark 'wid' property as mandatory when Smlwid is present for both root
> >   and domain instance nodes.
> > - Remove mention of M-mode WID fallback when 'wid' is absent.
> > ---
> > diff --git a/docs/domain_support.md b/docs/domain_support.md
> > @@ -205,6 +225,13 @@ The DT properties of a domain instance DT node are as follows:
> > +* **wid** (Mandatory if Smlwid is present) - The 32-bit World ID for
> > +  lower-privilege modes (S/U-mode) for the domain instance. If the hart
> > +  supports the Smlwid extension, this property must be provided.
> 
> WID CSR field with Smlwid is log_2(MXLEN)-bit.
> 
> > +* **widdeleg** (Optional) - The 64 bit World ID delegation bitmask for
> 
> mwiddeleg CSR with Smwiddeleg is MXLEN-bit.
> 
> BIT_ULL(dom->wid) in [6/9] is UB because DT parser allows WID above
> MXLEN, but it's easy to blame the platform for that...
> How much do we want to sanitize the DT?

Indeed, I will refine the document and agreed we should be careful on
processing inputs used by the security feature. Let me take some time
to review the series.

Thanks,
Peter Lin

> 
> Thanks.

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
