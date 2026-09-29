Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA35C9832A
	for <opensbi@archiver.kernel.org>; Tue, 29 Sep 2026 14:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IR/AXWWufrNO2l1obh9EA9kxQH+FWpGcPEktsptmYoY=; b=WahwiNBF5neSD9
	TJKE8ukIQnSUePOkaSLrw0+K4qPkDbX9JuVjGuNMa0XdQbBP/PVAHuryXlXrCEMGk2TERtev1SrOC
	OEufI8I6rJ5dnpGsKJFP5uHv2EXjUX2sG091XIsbypFloHKoUh7UMXIhO3L8tPhoYaRNJh7AOVXwC
	YMYDo6Nk0W8fFESOgGoYSWg4ygWCND8x+XU7MpklZ6Oh3Pi+ZakhRYG6oe4dwgv+7G0J+G58QsMTG
	JMBPPpMiCAOOEH7RJHxayl32b04Y0dj9wfbY1nUzbAvi5bpRu7Abu3ld5X/mjNg23XYIMXfGE7DeA
	6K10dWMakHEnuFi2kXMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBYfy-00000003ljd-2NkG;
	Tue, 29 Sep 2026 14:19:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBYfx-00000003ljV-0eEV
	for opensbi@bombadil.infradead.org;
	Tue, 29 Sep 2026 14:19:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mGYWR2v2ejth20l3Pz4RZXCMLSOUq3SYNz4b/00vHtM=; b=SiRie6CLbsxV2LX5WYGiAwyRrn
	XNAnAw6zlZHissMLgy6xDH3OYXCdVG0kSB/eQA1QE41mmXH3OuwxwicHu5+mMkeX3HtDF2UkcdgbP
	WSZIWmHHlaOqRTqZ0VO3y9rufkMgSNZeml9cBt6gWJLWIYnykym2jbrK4Gl40un5jIlwyQkI9ZTmO
	0ouxL2yb+EdqlZ/HJPPX5CQ4e3i/Apsa/ZoI4P/DAm6sRGxm7QxJR7ns2cGsJ7YL/fWzrbqZLZ4Fn
	jaJv67Pm4ZQ21it4XFJVVbfSchx5YN/JKsAVZRAQzlpzWheyKq6DI4c+ladGA9bs+eVlX/+8d8kEQ
	np2rV0fw==;
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBYfr-00000002jEw-14z6
	for opensbi@lists.infradead.org;
	Tue, 29 Sep 2026 14:19:19 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-398a147688bso3102394a91.1
        for <opensbi@lists.infradead.org>; Tue, 29 Sep 2026 07:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1790691553; x=1791296353; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mGYWR2v2ejth20l3Pz4RZXCMLSOUq3SYNz4b/00vHtM=;
        b=XFqvyn3TG0wDHxxr1r2a+rMbr7lK/PxHtlgNncOlsmDltjrpbP7L+HSTh+hOsYxWxW
         xVuhlV5y1qlONKCzKbxTX/H2q2u9NAmTOTsAorxT/ECWXXQEuI1O0Aw8AWzMS6HmwHaD
         pkhEA1TEr4iTwS5d0hgcQTtiD4w6ZU/hqMhlfbPLJjaDl53toYjw5PGPtUhCsXgzMvlA
         ISjFxyFBLCNZBQmJxgSFBQ/tD6WFz7axUGLolnPBPcUIwHMrXtuo7L6LMSQVgOhhYJKy
         D/++KOWFkff0In9xQ9FEYB8mp9CVFXj3r1UNqnAEb+ZR/AlwvOzPrVbsQkux//BvbLbd
         aviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790691553; x=1791296353;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mGYWR2v2ejth20l3Pz4RZXCMLSOUq3SYNz4b/00vHtM=;
        b=S4ZBykylJk65mGyriAvkVvLWRsH3S+3oHmDU2iluod4dbHOgoEcxiHpNn03Ot9bg8Q
         62K/7A2S1h2vgMGU9IB846iLViJhX3awK3K98c6B8vcW+Bo32M0nMh5AK4bk3a+CEZ55
         TNAUDieFzkU4BLIARFR+4NcSlwpnJLBKE6blFyjGvFxcVhDlbNYv/wXRB0Dum1GttDqO
         ZMtOguqOXi42hkt6pMElMA9sx8OYtOBn/amPV070plC72qFZQWOEXCby5jy8qaty29i4
         lv0drUOjS3jMsQ7VoApxFo5n/oYSllKwKRmjPQXwUo+m1v2Y0O+ppUAAI0ybcdOgMNGp
         +zgw==
X-Gm-Message-State: AFq9FYJD1mF2yuvoMDNwFvpWZg6HHHbdykbr5Bv1/pwniB7Q2LsNj060
	zPsFvCmCvZQSpGE2yGR/VwHLBy8XySb35iUIDSmujwd5B6lW8xCnts6pZEPV0mrc/Fo=
X-Gm-Gg: AYBFou2OwWSGTjLLA7KaEq46Dy9snUrTuMXYu925fnfeTQEtDOYM+q+GjUwZznmF7eU
	yvnwv/stcnkkyFLsE8EvnyHtFBPldsyzd1KR9TuiiIam9HJXGSKA5KbSNrP9/nuNkt+mVM16RG+
	q2u7XXchw9ZDTI8SxOaTwaE3YSEh6H2HXVF6Gk7/Ai9Tvz0JrjI/RtLqGibt4KhlDGqdWxEDl8q
	pHTEOAL9IXr0nrk4tr5oFCOfg86CFKzSuggKGRiaPNmdJWvbG32FLbizoTJU+q4TfxjoJunRnjP
	FaE0t9ZmP8Ip1YVBOIaFFizRfjBFDUAsUIl5Qu6ssw+Hcs/WLxbMH2HIHAT/jXasNj9YzO2SxlH
	LBW7UXn51xv60UEfeh9i+N+ljq88y5A7p/BXnRtrBanOKa8v/4ySlOAxZQWUVeBrjL813yrEdxy
	TBs9DUpA1Q7scYqxORsNj5Mv3fdIo6l/Za8wvGbGmq4Ll3LSzGwc8KaUQ8iM3Y2hcirQGS
X-Received: by 2002:a17:90a:ec83:b0:39e:21a7:5dff with SMTP id 98e67ed59e1d1-3a098d453aamr13595815a91.11.1790691552819;
        Tue, 29 Sep 2026 07:19:12 -0700 (PDT)
Received: from plin-1878 ([136.226.240.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4b7da4953sm262333a91.3.2026.09.29.07.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 07:19:12 -0700 (PDT)
Date: Tue, 29 Sep 2026 22:19:06 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, anup@brainfault.org
Cc: opensbi@lists.infradead.org, zong.li@sifive.com,
	greentime.hu@sifive.com, scott@riscstar.com, conor@kernel.org,
	dave.patel@riscstar.com, raymond.mao@riscstar.com,
	robin.randhawa@sifive.com, samuel.holland@sifive.com,
	pawandeep.oza@oss.qualcomm.com
Subject: Re: [PATCH v2 9/9] docs: document WID DT properties
Message-ID: <arvI2kBDY4oAxbDo@plin-1878>
References: <20260817090503.2104998-1-peter.lin@sifive.com>
 <20260817090503.2104998-10-peter.lin@sifive.com>
 <f837e198-eac2-4766-b11a-b724002f8452@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f837e198-eac2-4766-b11a-b724002f8452@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_151915_592641_500F5C35 
X-CRM114-Status: GOOD (  24.80  )
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

On Mon, Sep 28, 2026 at 01:30:28PM +0200, Krzysztof Kozlowski wrote:
> On 17/08/2026 11:05, Yu-Chien Peter Lin wrote:
> > Add "wid" and "widdeleg" properties to domain instance node
> > documentation and example DT. Add a "Root Domain Node" section
> > describing the "root" subnode under the domain configuration
> > node for root domain WID configuration
> > 
> > Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> > ---
> >  docs/domain_support.md | 36 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 36 insertions(+)
> > 
> > diff --git a/docs/domain_support.md b/docs/domain_support.md
> > index e267a9f7..c35a1d9a 100644
> > --- a/docs/domain_support.md
> > +++ b/docs/domain_support.md
> > @@ -93,6 +93,8 @@ following manner:
> >    is the next mode for the ROOT domain
> >  * **system_reset_allowed** - The ROOT domain is allowed to reset the system
> >  * **system_suspend_allowed** - The ROOT domain is allowed to suspend the system
> > +* **wid** - Configurable World ID for the ROOT domain
> > +* **widdeleg** - Configurable World ID delegation bitmask for the ROOT domain
> 
> Why are you documenting DT in some random docts?
> 
> >  
> >  Domain Effects
> >  --------------
> > @@ -126,6 +128,23 @@ The DT properties of a domain configuration DT node are as follows:
> >  * **compatible** (Mandatory) - The compatible string of the domain
> >    configuration. This DT property should have value *"opensbi,domain,config"*
> >  
> > +### Root Domain Node
> > +
> > +The root domain WID configuration is described in a **root** subnode under
> > +the domain configuration DT node. This subnode does not have a compatible
> > +string.
> > +
> > +The DT properties of the root domain node are as follows:
> 
> NAK, please read writing bindings and both documents for submitting patches.

I agree that it should be validated by kernel's
dt_binding_check/dtbs_check tooling.

To support Worlds-based supervisor domain and the
upcoming OP-TEE (and possibly StandaloneMM) trusted
domain use cases, this raises an open question for
Anup and the OpenSBI community: should we start
upstreaming the OpenSBI domain DT bindings
to linux/Documentation/devicetree/bindings?

I can send an RFC if there is consensus.

Thanks,
Peter Lin

> 
> 
> Best regards,
> Krzysztof

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
