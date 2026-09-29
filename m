Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D4B3CA5FA5
	for <opensbi@archiver.kernel.org>; Tue, 29 Sep 2026 14:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0PTw3N2mJq9oJTRxCNNW6z24AliL12zCsag6FFR/2PU=; b=zVzaUGICH+hq+b
	WG9yi8s04f2/xz1Hgk/mkoE2VuNPnM0RinCOFUeWBntFz7FWdN7atQwm990O41Std1CGkYM15iNg6
	DpnqU1mcgfWV57H2Tj/Gr1pKSBOs8JeiSV30sg31d9UncoSwvWIOSMGyZAvF0V94/5kDGIH5Gr9KB
	e8niEM8sI/5bLSm4aEI+4OrOcRm9Ak32dRHQYfuPFQv39ZX0RkUovBcZftKhwabv8deXa2SDPnQSx
	ffGfgP1Dd19zprzK1o0g/re1/H3WefMOdAvZ0TZECf3BwMWkui2bKCJzYpjE5mBXbdlcQW7C2MvST
	J2ItA23/YTShQ9bJcU1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBYq8-00000003n64-3kET;
	Tue, 29 Sep 2026 14:29:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBYq7-00000003n5l-45b4
	for opensbi@bombadil.infradead.org;
	Tue, 29 Sep 2026 14:29:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6sYQXEjzJKAHNO++bvOooJXnuf8+g5fXFufgwb2vQ5A=; b=P/YAhKnp4aOyBuIHMxUsGGGJtc
	w8hkO5jnyMxCbCntRwPZFYd1SBGPoI3Y9858CN6pmphhFM9hqJj1R2QLdC4PeB03GvEPQ3OV5q3wv
	IO87xlOQY5EfdNbBg0risBqVoVg0qKDEM6EQXNogsLwFYLVL6GUnSaM/vA7rmiyN8xGOMxKiUpiGC
	Q5eLnuksO0+K+B9vCVWRTerkap0GyeWEUVie6GemN6bjmRveI9Y8M/+Iho6RqtLW9YTq4Vzl2mLKJ
	hzlVQfWaZb737W04flolX/5e/H+WxkXLhY+shk6vKCvowxuhiUFCuohrO3myLNoIonJ9m7DTvxKDu
	ZiPqyDhA==;
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBYq4-00000002jq8-1o0T
	for opensbi@lists.infradead.org;
	Tue, 29 Sep 2026 14:29:50 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-39b910bdf2eso2135735a91.2
        for <opensbi@lists.infradead.org>; Tue, 29 Sep 2026 07:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1790692186; x=1791296986; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6sYQXEjzJKAHNO++bvOooJXnuf8+g5fXFufgwb2vQ5A=;
        b=L7QgfVFJluhdYNGI895ZNtqQ22AVlYl8KS3dy2XWATI5x6dha/CPU+KyxLTBajLAai
         Z5o1i+/sxTDyhz63ZtkNpOaDg9W4RjqiRpxLrVmBn/VxUiKtMOoogdaJwDDfiaSM27Ut
         VKaNmV9IExff1+6YvKzor+eXPYKfj0EIoxLPOdujI6QEPNqHfnYyAfpRQip3Ietic4Qr
         wJWPW6V1Qpusre1QKvbAf6ad2OrPLjwsYLLC87bWziiQZtOgyLvxJrhSyyN74x0lyNmD
         2yXDPx0M2jLFu8YUYj49f/g6B1sYI7VPX+GEH8wvkASJuR3mkZYiW3rPGUBYp00h/b6w
         uAhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790692186; x=1791296986;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6sYQXEjzJKAHNO++bvOooJXnuf8+g5fXFufgwb2vQ5A=;
        b=SmXAMtZZsyD/ES/IGUOSVU+N5dW3CPU6e5UpW2Gi00QpIPiUEZtoewyh2mY+4+DX2n
         wSPag7xyJdvBe9e23YAY83CXPTgm2Cqjv0mxwOEjsSayxiqEePjsNynxDCISFhGHAUeb
         2/zAohlYoq1w75mM+QZ/popJ9KTg7VJC6hdlsFCnoHyc8AyVM9PHmJTVqwdOZooklP6j
         2wBALTDGTlEbqgCtSshiqI1qHyiv0OhR6itMCjqheBjJFyFdvvUQuBUeJbsaluQexb+I
         hfkfxcIdtIlg/iTyRJxEEwjizP7j4dU7QVpnWmQVLeMWIOU9X8En/RjZci+04qZKcu6K
         DeCA==
X-Gm-Message-State: AFq9FYKS1hdJR71rlszuUG6hc+UqP2pITBM8XzUrCs24UwCQ6R1ieDG7
	+TgSUUhjfY9uxa2PgsacoptkXRTX3dIf1uofHBjdggp4PPiZ3dhQyAwx6gl8a/0t5j8=
X-Gm-Gg: AYBFou0LcJWdAUxgUVBZZvpR16hmoQKhMfFTqQPP4+qTBzlGoqJ1JzIBpoGhUf529gy
	pbufSZEAPVYSijAMt7mOeQRV39+G3pQ/KqVpQwXNrvY3KSl0VGAdLuA4GzelexmYQMMF41SdQB4
	i8K0dAdFLOXCocSJsgVlQjFKe396D4Udv+2b4/VcVyBCO5s8jqgVY3Eu+XXUV3/4X2wDXGKhLIr
	3VZt8nrlmeENjDB3zhQJT6ZOumg4fytMHAmtAwpToYGCxU+LVfe+MgyN+mH4skPZ1e6YW5ePVgP
	XtAJQQM+NhSFI7Rkn/I1lrrn1YcWRM8k7kIPDYGPbyCFm2LKd/EMpdtV63RgiP4jHmMYIlbKdu2
	NhVXTwbl8p7vLiqUaukm3F50K5yMUkZbbG6VAuJSl83XTMARIXNy9MQl3fXssdAhfJBrGTq7zxQ
	AiL0BFH4Ajgkz/bPBQ5MPLEhap1vLFN7e8ktntdd31k0Ssgyo61Fg8sOzAEV7f723jZEhF
X-Received: by 2002:a17:90b:4a05:b0:3a4:b3ac:904c with SMTP id 98e67ed59e1d1-3a4b3ac94a4mr824791a91.51.1790692186037;
        Tue, 29 Sep 2026 07:29:46 -0700 (PDT)
Received: from plin-1878 ([136.226.240.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a497f1b13esm6129428a91.9.2026.09.29.07.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 07:29:44 -0700 (PDT)
Date: Tue, 29 Sep 2026 22:29:38 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com,
	greentime.hu@sifive.com, anup@brainfault.org, scott@riscstar.com,
	conor@kernel.org, dave.patel@riscstar.com, raymond.mao@riscstar.com,
	robin.randhawa@sifive.com, samuel.holland@sifive.com,
	pawandeep.oza@oss.qualcomm.com
Subject: Re: [PATCH v2 0/9] Add RISC-V Worlds ISA support to OpenSBI
Message-ID: <arvLUmn/lQ1ZDuWU@plin-1878>
References: <20260817090503.2104998-1-peter.lin@sifive.com>
 <43ee673a-8df0-4b6f-9e8d-eeda05eb32b9@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <43ee673a-8df0-4b6f-9e8d-eeda05eb32b9@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_152948_825572_A9D371E8 
X-CRM114-Status: GOOD (  22.65  )
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

Hi Krzysztof,

On Mon, Sep 28, 2026 at 01:33:17PM +0200, Krzysztof Kozlowski wrote:
> On 17/08/2026 11:04, Yu-Chien Peter Lin wrote:
> > This patch series adds support for RISC-V Worlds ISA extensions,
> > enabling hardware-enforced isolation boundaries based on World IDs
> > by extending the OpenSBI domain framework.
> > 
> > Trust Model and Boot-time Roles
> > --------------------------------
> > 
> > The implementation follows the two-phase M-mode trust model:
> > 
> > - RoT M-mode phase: Prior boot stage (ROM/SPL) that may program mwid and
> >   mlwidlist and lock mwid before handing off to OpenSBI.
> > 
> > - Regular M-mode phase (OpenSBI): Treats pmwid/pmwidlist/pmlwidlist as
> >   input policy from hardware/RoT. Locks mwid to prevent later M-mode code
> >   from changing its own WID. Programs per-domain mlwid/mwiddeleg based on
> >   DT configuration.
> > 
> > Device Tree Bindings
> > ---------------------
> > 
> > Per-hart properties defined in linux kernel DT bindings v3 [1]:
> > - riscv,pmwid: M-mode World ID
> > - riscv,pmwidlist: M-mode permitted WID bitmap
> > - riscv,pmlwidlist: S/U-mode permitted WID bitmap>
> > Per-domain properties (see domain_support.md):
> > - wid: S-mode WID for this domain
> > - widdeleg: WID delegation bitmap for this domain
> 
> 
> I don't understand why I am cc-ed here,

OpenSBI consumes the riscv,pmwid/pmwidlist/pmlwidlist
properties. Sorry for the confusion; I will remove you
from the CC list and provide links to the associated
OpenSBI patches in the kernel patch cover letter.

> why DT is described here but not
> in the bindings and why do you reference some RFC (which means: not
> READY for review) patchset in a different patchset which is ready for
> review.

The kernel patch series is currently pending and cannot
be merged until the RISC-V Worlds specification has landed
with an associated commit hash. Therefore, I used a TBD
placeholder in PATCH 2 [1].

Best regards,
Peter Lin

[1] https://patchwork.kernel.org/project/linux-riscv/patch/20260812122131.1534906-2-peter.lin@sifive.com/

> 
> Best regards,
> Krzysztof

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
