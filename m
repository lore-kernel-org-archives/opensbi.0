Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B937CC61DB9
	for <opensbi@archiver.kernel.org>; Fri, 28 Aug 2026 10:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ru32o2O8wsKlbkDUyDIc5oZ9wb4kwR4VrnB8spjUYFc=; b=n7ZEZJ8zaaFMM1
	PT5QRdfbCKidwsmP53ubMgKeAgoR6t3K2ozyrWnOLEoV4V8lxkTyAaRduB/XMmeEncLaFkPiXTQmO
	+5TxuUreyJ3YLUuXxIaSq3E9cw0DZs8rDqSy9us/PwiM087lRkuBu9tAWTtb6nNA497+yJXifloFx
	EuxYGIlFpEav23wVjKLR8ypYgDxdQDS2FVo+5soXUdlyE6mHugdTGcAXFTLZrb8UfiY2XJt2eLncw
	U4Ss2Y6CFzg05KhZncceEWHVkKD/ENMYXI2BeKHMp2X9MLAAzE+IQk6x7ZmjEqX8IAyeikBam+3yl
	RzEe9Hsz2w7GjRKzlhBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wztWO-00000005Xmy-2TGH;
	Fri, 28 Aug 2026 10:09:16 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wztWM-00000005XmB-1wBz
	for opensbi@lists.infradead.org;
	Fri, 28 Aug 2026 10:09:15 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-39675172593so632602a91.2
        for <opensbi@lists.infradead.org>; Fri, 28 Aug 2026 03:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1787911753; x=1788516553; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p8AyDuypHHS5+qPEaV9NAEQH1VJ2psjhVFXkrMKJF9U=;
        b=chEDH+f/6zCI/M1YjZLjul19x1g4axcQr46qgKrZ6o72G5RVOPUuIyviqQwbZsN+C0
         7xIc3wopSNQSbsbHz6X5TrLo/6KWAdFPyFLLFCyv6w/nb7xxgBpS9V3sMyujbvj2J45Q
         WPIhO4NM8c/XIK1kF+y5nZz4L0Vq49IDmwKn9ZHJqGeBiVC/BLbl/ZibCkV4RaaZs0+e
         pn7/Pz56k2rsMZQBm+xLubYtuMwM2UliAYaP46bhitFvFYRp2xFAe+Kl3WBpi1/eeWTv
         6AXJQuwBuepj60kQq1zHwskAiOTfGuxMHUpgKS7TSopnkzHQQIDcd3ajUbTg+TpXk7uR
         8E7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787911753; x=1788516553;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p8AyDuypHHS5+qPEaV9NAEQH1VJ2psjhVFXkrMKJF9U=;
        b=llmATy2nUDgweHCEEAlvINOwlcZqxmw5a3/cl8HmHLErmlyHFelDzz7XDx2M6pfMbd
         F2JYz1WbxEgHdUpOMroIB+mErOU+UUkTgVt6CjDWWfxuRInEMvNrzT2+GT8umSFw1tKA
         +KjABr3H3ZQFVxWW1FEAM+vhQoxw9Kg2EuB6Vce1I7cOhzUiw9wdcQTsWVUXuP0jGxq1
         2Gxr/l4H92g4+Lok0H/A77BXWAPVMLKu42diuSeFCT/tRhwK0VWKvXO2lqL7zb/iE8gG
         XLlNACaAoXRgP5ozF7XMD2QonpziLsoEoJj6hd8kxNQYs+U1TzXaoj6vcd62uWP64+6e
         iDrA==
X-Forwarded-Encrypted: i=1; AHgh+Rp+74JMciUEHanTtvcJyWgDjq/SjPPt/+M8nA9aaeXqhPljtwZnIlrKBNJQ9mSiFB7OyGndHFbr@lists.infradead.org
X-Gm-Message-State: AFuF++nAqsL10ldRylTZZuwtkQoMdZYSW8RPbyFiVm2Xy5ERBTl+IrRG
	oaCAggdWb+fe8zWLr8Z4ESJVbcCiL3a85elyEIoEA9qLG3royOD2RFz+u4Bd5350AkY=
X-Gm-Gg: AR+sD11SghChWCwgFzkwmp6Ilm1dJhjuEKO/hefJIdN+73cUXxUQZA31t0ZzaEOeH1L
	mXd43P9l9MgVR5iD/xdKD25mu1y/MiKn+rqnVIduU8BU1jFpENDUj0moZFgXr4Qn9AkMrlJHKPX
	x47RKJ2ACbwuy09w5cx4Q1sqlnME7w6BPA3MBR8pmnHXIppcbLiYNu3ICDWbv8qHg1RoLkXfVcS
	XUd9rfLODYZs4j02jngWGPfT3KvJOnHG0PJgxJREkcXzEPgH3Yg0mDPfRc5BvdfJIze+aD5se/2
	npoJ7mr3SBqTC5MK1N724lKwnOBWM4CSlZbXUBS1lwL2xJrDr13Zcvvbj14Pf7FZTihlFJbf+kw
	gQIIJDfRjuXaYrxWGQ5JONvNg4QI9cLqfpZK/SeNFyuoeOBqIEwdaCFnmkAZ7fI4yGliTZ67Wn3
	rMBf6zr507hmZ8tTT/XIAnWBuH5TV+/zW5vZSmjIEttZbj/GuQnoeQSOXnGA==
X-Received: by 2002:a17:90b:1b0e:b0:38e:2517:5d1f with SMTP id 98e67ed59e1d1-396d0f8e755mr10855554a91.9.1787911752912;
        Fri, 28 Aug 2026 03:09:12 -0700 (PDT)
Received: from plin-1878 ([136.226.240.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda36a53sm1906294a91.3.2026.08.28.03.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 03:09:12 -0700 (PDT)
Date: Fri, 28 Aug 2026 18:09:08 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
	Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/3] lib: sbi_domain: Check possible harts in
 sbi_domain_context_enter/exit()
Message-ID: <apFeRCSwBy+2Kobq@plin-1878>
References: <20260817143025.3068512-1-anup.patel@oss.qualcomm.com>
 <20260817143025.3068512-2-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260817143025.3068512-2-anup.patel@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_030914_504159_668EE1FF 
X-CRM114-Status: UNSURE (   7.82  )
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

On Mon, Aug 17, 2026 at 08:00:23PM +0530, Anup Patel wrote:
> When context switching to a domain the current hart MUST be part
> of the possible harts of that domain. Add appropriate checks in
> sbi_domain_context_enter/exit() along these lines.
> 
> Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> Reviewed-by: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
> Tested-by: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>

Reviewed-by: Yu-Chien Peter Lin <peter.lin@sifive.com>

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
