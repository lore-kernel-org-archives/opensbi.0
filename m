Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE363CD98CE
	for <opensbi@archiver.kernel.org>; Mon, 15 Jun 2026 04:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uwHANVs4/CXWgQf1rSyU5aSogD75riJPv/qusd2Fd9g=; b=wqTLctyN6Uf5s6
	FYQBSneoHRu3xypooaSoWP8FyTxuQUBp9ypLHsPpXKkMERprKxTG7jazU1b7NDeC58eARED+ushux
	4eUbLUJmuvtCT6o7uELI3qyZwEtuP46Edou5fyUgAly0DXkWHgu2oAaBx+XMAYVYvCK9DbbD9OWKD
	ivCN/eza6RgcojqS2XncP6kPavm7ABaFHCJQHqyDmNq7G/Ol2a7CmiSse956qCrzhTXvPYFeB3MT8
	qsrbUrHKxiyTvlc8gCu7Ujz1JIlKUtxS+U8f8uHyOF9giVQzwLCwOYx1OxXppQUCvSkJO3Mtxem10
	HlCoDKqyteD88ZGRrzFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYzPh-0000000DarE-42vR;
	Mon, 15 Jun 2026 04:59:09 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYzPf-0000000Daqr-0PZW
	for opensbi@lists.infradead.org;
	Mon, 15 Jun 2026 04:59:08 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-396aacc5bcfso25765431fa.3
        for <opensbi@lists.infradead.org>; Sun, 14 Jun 2026 21:59:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781499545; cv=none;
        d=google.com; s=arc-20240605;
        b=U8/gw4PfQXzO+62EViUWaLyonE22YW1H12tSHlbCquvjSE+9trhWT+EymupWujCRoq
         64eSXQbnXNJj10pGZOVYvAFYh67ChZrqI46HXUaToMJeQeMntl6d8r3Hx7XtxZcX2f1e
         bGhWeaEt+LtFfnZswjgT5TEM8OUgT5y2lv6i5sgZL3DhJvkufPFSsrWM9Yyw8V478jJv
         K1uGfFMRUgbnEuLBwjFyfyBfqKX5nvqL6wA6QQ6Y0vKsaEoDBry8smfbblYKDmm7PVOn
         Tc0rY9XlHGMqCQxRt274xMhZ1jvXD2wj8/1F9nlsrarN6VIG9S83iqK8zClSvOV758Kd
         ECcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hNsi9v2vLi1g6JGqFY2py6d0oRrtERU6EJMq1vvNiIU=;
        fh=hWSqxhDrXtiUHqQvJPdVlu3TdYeTR8ygHrqeYKGTfNY=;
        b=dHKOuQu3okNjK5Qyl8cfR43hzxUzh8FwvDCgySKdIKiuelgL5QsHVSfsMJlegAIRH8
         j/oyleBc+sLuZT+9bRQE2HjI7U0Htd+h/lhqRfa7EcqPIirznjVnYq+B2oy6MPwQaz2V
         aM//i4U9MNzHhLh2lkpt1JVLAqmLa4H5d82LtA2G/p/EgsH2sNqKlUDAlH//hFJSaMy3
         PCm0aa6QyFRvLTBb2ik3sBaO72u18a67ci9ATHIWyPnRcMfjAOVpcPqoaPlIDWlaYRwU
         63Fqlh3Cd88kDeqX9q3YjcX+z/l4gfW8UUI9YhoVMwHocVfWGzDiVs2WUrAbvJUDitSI
         EHBQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1781499545; x=1782104345; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNsi9v2vLi1g6JGqFY2py6d0oRrtERU6EJMq1vvNiIU=;
        b=HEV8usfdN/ljAA4V8/3CRx1+XXe+1eZm03MyPuEl0j8J8vXLDgj68SfU5kAMer3Ues
         0DJCwQBnPK56yW05OdGVoklrnzVUEdKS4kxqBUkw4UCxRX65yEfDpo7t/eP7vqsBhUg/
         MVG9G0JaAKJoRUn4q0c5nu2HXQdUKtsw6KbcGirTfQ3jzjsOkVmmU6uI5JFhIm8/JjmX
         7b/uyrG92CtKR1G0iibxIm1smUlk0WI2mt9eRz08Xsjr6YEV8QwqK/CIrwtb5vkXy6uG
         2pRryfuC9A6VYUS0ernHKR/ISzN/c71cWsVZ7Nr3Jv/D3prqEivbHQTEvKnuP4wrblQH
         wjWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781499545; x=1782104345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hNsi9v2vLi1g6JGqFY2py6d0oRrtERU6EJMq1vvNiIU=;
        b=EsbsJbovtn7gi7Q1u+/0bz2kscDoFhHgN2AQQcdJohYqww3aqyaJp4tnydK62GGJ8/
         AJz1ASiYotR20eRDa5W4R2DxKcttFz7JpYWFROu8Tajme6RfGEqI5btUSAM4CVzASFb8
         MKwVidQz98Kk0EmfyGfNKlVx9ZJo4l7f6dOBGRPzX9dE6J+JnCz0QP9GeeIkyGTKbyGm
         bICTwUYkfDXS8/R5Fe8b9CtkL4n+8u5r0woTMNLrQ/Ayorwfk1VoQYNT8KPUzdsge6cK
         vdmaAIqyx+oJ1nhhab3mIekE/GAmW+mKXt1dE8NDjzIPgv+CeDpTbRlpSU9GdxJcGdfZ
         YbHA==
X-Gm-Message-State: AOJu0YzkCwTXotlMG5xX8/FOSwV6dz+zdmXZSnx3GitCkokqsZwMcSli
	bduHJTU83bNmvCQz6msxyn+YPCgJJeAiw90oa4OKHGa58PAQtsIhVQFdvuYfRDN1V2c0pGmx4vf
	fbfCzizI9VcvIxLVz58mZ+CUu7nQbsWEq3KcPdP/CGEw6pHK//YNL
X-Gm-Gg: Acq92OGk8ksDiW/Tns24oxKLnbA8nOw1v8jMVFSza9VotbEI0kf3gc++hH3a2HWvpcI
	uEAAuNWa/nQfmNl+KL5MHLX36ieLRJflQK3LpPwLOEAxDKn8KslhqxXKAHOQvYnv/gls9kW+Ks8
	lnt9gWCeMz9Lxsmj+4cbahoeR0wdCJU2j30dMbkZdMsjkZ+8r8VqxND8n3911sEx7nLr8+PbM1L
	pJa2g2vyDE7Y/SyoLmC5bE7gOgV836PY2ze0Xu32I87UngzBdXTIl0MYeXQfLxgdAdBTs7Zhk5G
	/YZs0oVL9ngqgJ/IZHk0mrWr3eQdm+VsU8VK3Go48A==
X-Received: by 2002:a2e:bc08:0:b0:396:94fd:35d2 with SMTP id
 38308e7fff4ca-3992b2b8171mr35019451fa.29.1781499544980; Sun, 14 Jun 2026
 21:59:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260602-fix-gitignore-v1-1-4299e2e40ee4@kernel.org>
In-Reply-To: <20260602-fix-gitignore-v1-1-4299e2e40ee4@kernel.org>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 15 Jun 2026 10:28:53 +0530
X-Gm-Features: AVVi8Ccwy180i9zCBA7ZlR6bbjxGV3xXabjAf8HpVJfJujyPJw8sL6GgGvAAI1M
Message-ID: <CAK9=C2VzgR2jSwS0iD-voewELU-+easTZrPavTVJLqzJQJBFEg@mail.gmail.com>
Subject: Re: [PATCH] gitignore: Ignore python cache directories
To: Michael Ellerman <mpe@kernel.org>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_215907_155230_846B935B 
X-CRM114-Status: GOOD (  15.25  )
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

T24gVHVlLCBKdW4gMiwgMjAyNiBhdCA0OjU54oCvUE0gTWljaGFlbCBFbGxlcm1hbiA8bXBlQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gUnVubmluZyAuL3NjcmlwdHMvS2NvbmZpZ2xpYi9zZXRjb25m
aWcucHkgbGVhdmVzIHRoZSB0cmVlIHdpdGggdW50cmFja2VkCj4gZmlsZXM6Cj4KPiAgICAgVW50
cmFja2VkIGZpbGVzOgo+ICAgICAgICh1c2UgImdpdCBhZGQgPGZpbGU+Li4uIiB0byBpbmNsdWRl
IGluIHdoYXQgd2lsbCBiZSBjb21taXR0ZWQpCj4gICAgICAgICAgICAgc2NyaXB0cy9LY29uZmln
bGliL19fcHljYWNoZV9fLwo+Cj4gQWRkIF9fcHljYWNoZV9fIHRvIC5naXRpZ25vcmUgdG8gZml4
IGl0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBFbGxlcm1hbiA8bXBlQGtlcm5lbC5vcmc+
CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpB
cHBsaWVkIHRoaXMgcGF0Y2ggdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywKQW51
cAoKPiAtLS0KPiAgLmdpdGlnbm9yZSB8IDMgKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS8uZ2l0aWdub3JlIGIvLmdpdGlnbm9yZQo+IGluZGV4
IDk0Y2FlYjkwLi5mYzI3ZTc0NyAxMDA2NDQKPiAtLS0gYS8uZ2l0aWdub3JlCj4gKysrIGIvLmdp
dGlnbm9yZQo+IEBAIC0xNiw2ICsxNiw5IEBACj4gIGJ1aWxkLwo+ICBpbnN0YWxsLwo+Cj4gKyMg
UHl0aG9uIGJ5dGVjb2RlIChlLmcuIGZyb20gc2NyaXB0cy9LY29uZmlnbGliKQo+ICtfX3B5Y2Fj
aGVfXwo+ICsKPiAgIyBEZXZlbG9wbWVudCBmcmllbmRseSBmaWxlcwo+ICB0YWdzCj4gIGNzY29w
ZSoKPgo+IC0tLQo+IGJhc2UtY29tbWl0OiA1NDdhNWJiZGE3YzNlYzAwOTZhNmM4NzgwOTg1MWY4
YzJkZjA0N2QxCj4gY2hhbmdlLWlkOiAyMDI2MDYwMi1maXgtZ2l0aWdub3JlLWU0Y2E0YTliZWQx
MAo+Cj4KPiAtLQo+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRl
YWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVu
c2JpCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
