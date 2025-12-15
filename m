Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 587CBD5B16C
	for <opensbi@archiver.kernel.org>; Mon, 15 Dec 2025 15:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=akICTryQPxgOJ+W2YbAak5xi5lcFOrI0JIZ6DhNm0DY=; b=xjjZL0R1oAFLQ9
	fUMBw7Fw2BL28Q0Rimw5AUicDF/kiJnR13BW3HhjsQWcLLTznhqNxTacWR/Lf/qd6rTaCHLKx96NL
	sLnc+38JG5C3+7fROshgFuVphp8ON0pTg5PdgDsxWm9dP3Fcfst/+rCbzvRUaok1Iv/K84vVgsVGu
	3x+66NXZ6PMluA43o9NdPIyx/ZSRRIDREkx652zM9/ywXnqZyLSCg4zrEGFXBDFnJrHpWztk+LIY7
	9WmupXp8e0iQkMEMXUVR4tRzaix+4Nsqx07rcwBmz1N6VaLje2wLV/QisHdellgCn9U8pwO3ovlf6
	MCyE/JP8yBD8hks6FVww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAma-00000003vYH-0lpU;
	Mon, 15 Dec 2025 15:46:44 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAmU-00000003vU2-27nG
	for opensbi@lists.infradead.org;
	Mon, 15 Dec 2025 15:46:42 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-3e12fd71984so2716011fac.2
        for <opensbi@lists.infradead.org>; Mon, 15 Dec 2025 07:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1765813597; x=1766418397; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=diAfPKEBD3Y1dNbpZ3SBMD/Zu5T+IwPBL8+iOYDDkT0=;
        b=AP5rcjYD2URyVeXdvLF0XNjpdoBh+IGDEoQGBH3b+1ewO0F8R+wJLMIsnLijt8ZhHx
         yMT+P8Mn9WWLmnQS7IpAoxncNpiXO15WYdSLgHf+hejVF8CUyHidMnBx7aNq/9jGCrNN
         FR7Y+/b0SB0s8kpPNXn0+7+QoTvqiJsXY1GNHgqUBvqneZm5X2uNiA478cdZjUXvtbtj
         9al5Zo1Abxst4PlwDgazAxubnFJWMUPQK9FMsXg4V15ypULkX8SFB3sOUv7GafA8t+xN
         8JFHmDFARQyirrhypXLXFmaGXnEksJ1aZ4uOUKw3szJGf8TTuhU3SVh/YpbKSklDT+qK
         XOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765813597; x=1766418397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=diAfPKEBD3Y1dNbpZ3SBMD/Zu5T+IwPBL8+iOYDDkT0=;
        b=WROf/a+kAQ6ZfmmD4MbjaDMtMN1qbneg0Sx+QkT+OSgdhbCkm7ilrl12KyhKWR6oHN
         C6UGhizmDF3XpHQyix+CrqL2Fq7y4jVXYWCBk/pS71OXUQbBmP3JFHzFaUjjM+GwWCVe
         DZ1R4MP4SqWnl1AFsxj46gi11cMbN6Ku8WgHemJ5JFd9fl7PfBAckHbPiT7oZ0ohgWIm
         uz5OztXnNIXXQZWH5L54amLY3sbJOrKQnH+ECEAFkoesLwILDgfmjzfGOevfNnnyl3uh
         /C6qot+JsCYqdExCNzBfDGR/zT/ZN7l++okvi1TPMU+ouv4LIzWf/n3dOmasqNjduRct
         Luyw==
X-Gm-Message-State: AOJu0Yydf7+eMzU29zNXmyfZPMV7iwa6oWJu6+Ff3OaYTJt70/vCuwSf
	9mm6hWX9mypdbRnDu7rd5JukN9MDzG8xyqv1SIwzJpocyyRea6FSD+xfCo0jQ8PJuzQi3ZgBFo3
	3J35+pPEJcBuLZXm9fP04PpBh4pjptiBgYUgLlocuig==
X-Gm-Gg: AY/fxX5Xogwb3AAT0LCT4ZSyve3lCyFgqlchq3NYE5nq2v+c2/AXMcNRWiYSUOiD/T/
	BKh046MD66VjGGOG6F3Wp6H+lQ4cglwC9PWpSNZDL7OIC1fo2rer53RB9Ki4kzZdBcfuaHJIcaG
	JZfY5vxOApSvhtRNhQWP5y02qY2KjjkrIMZ0YZizpauwvVoJYp50hM7SA5dLPp9q8t3H4XBA7z2
	pIVyBWltCOXQY2dKKhqweyCZPAX6rS5e6ZFLlfVbpalX3ZiilMUaW/8w3/NBr7O53nWUMU=
X-Google-Smtp-Source: AGHT+IFZp+7INYgcIAOox3GMWxsMWzuqd4t9sKP+pbkZNr5bfAtPc4JzAvcQ+3/Z/J6JOLWosIbLSxgWMh7pbriaqco=
X-Received: by 2002:a05:6820:4b98:b0:65b:29be:d2f6 with SMTP id
 006d021491bc7-65b4525d2d7mr4677287eaf.52.1765813597065; Mon, 15 Dec 2025
 07:46:37 -0800 (PST)
MIME-Version: 1.0
References: <20251114203842.13396-1-b.freisen@gmx.net> <20251114203842.13396-2-b.freisen@gmx.net>
In-Reply-To: <20251114203842.13396-2-b.freisen@gmx.net>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 15 Dec 2025 21:16:25 +0530
X-Gm-Features: AQt7F2oVUNWfNbFynf3Vr9CFZtZdhmhntr6ohWhvVX-wGEB4pQoqKhC51KziEP0
Message-ID: <CAAhSdy3+uzNTaObQh21AVj++A_hpddvKoJfmsRiifwqFXk=jwA@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] include: sbi: Make "s8" actually signed.
To: Benedikt Freisen <b.freisen@gmx.net>
Cc: opensbi@lists.infradead.org, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_074638_796565_76B73FBD 
X-CRM114-Status: GOOD (  13.64  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

T24gU2F0LCBOb3YgMTUsIDIwMjUgYXQgMjowOeKAr0FNIEJlbmVkaWt0IEZyZWlzZW4gPGIuZnJl
aXNlbkBnbXgubmV0PiB3cm90ZToKPgo+IFNpbmNlIHBsYWluICJjaGFyIiBpcyBpbXBsaWNpdGx5
IHVuc2lnbmVkIG9uIFJJU0MtViwgInM4IiBzaG91bGQgYmUgYW4gYWxpYXMgZm9yICJzaWduZWQg
Y2hhciIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBCZW5lZGlrdCBGcmVpc2VuIDxiLmZyZWlzZW5AZ214
Lm5ldD4KPiBSZXZpZXdlZC1ieTogUmFkaW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNy
by5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5v
cmc+CgpBcHBsaWVkIHRoaXMgcGF0Y2ggdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5r
cywKQW51cAoKPiAtLS0KPiAgaW5jbHVkZS9zYmkvc2JpX3R5cGVzLmggfCAyICstCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvc2JpL3NiaV90eXBlcy5oIGIvaW5jbHVkZS9zYmkvc2JpX3R5cGVzLmgKPiBpbmRl
eCAyNjM3ZmFmLi5iOGE3ZTZjIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvc2JpL3NiaV90eXBlcy5o
Cj4gKysrIGIvaW5jbHVkZS9zYmkvc2JpX3R5cGVzLmgKPiBAQCAtMTQsNyArMTQsNyBAQAo+Cj4g
IC8qIGNsYW5nLWZvcm1hdCBvZmYgKi8KPgo+IC10eXBlZGVmIGNoYXIgICAgICAgICAgICAgICAg
ICAgczg7Cj4gK3R5cGVkZWYgc2lnbmVkIGNoYXIgICAgICAgICAgICBzODsKPiAgdHlwZWRlZiB1
bnNpZ25lZCBjaGFyICAgICAgICAgIHU4Owo+ICB0eXBlZGVmIHVuc2lnbmVkIGNoYXIgICAgICAg
ICAgdWludDhfdDsKPgo+IC0tCj4gMi41MS4xCj4KPgo+IC0tCj4gb3BlbnNiaSBtYWlsaW5nIGxp
c3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApv
cGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9vcGVuc2JpCg==
