Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD31EA8542
	for <opensbi@archiver.kernel.org>; Mon,  9 Mar 2026 04:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JG7s8zo4sHK2hZgfPLqaJhBEdFIUaJTtl9iqamzZAow=; b=1JJKl51k8KcNjr
	Jbz9Kue7fkqysSZkZK/otFTxxWCbmao910To6S/C4nnh2crWw+PSdjCOr9AQZtbuL9vqpiwFsgw3R
	0rOwZKjWaVzUft7XxSphWQN5yMiK7V2Q0FepXdj3zbZntr7rbfbU5xB0HZp19w14X0ngkhx0RUr8M
	F2zOqTESHnGOSienWD56udkgE/ttOwl2RVtM83PJFpOFOs0CT1DuTiHiyUTVvaxqG3ISXQSC4yd8K
	FXtfkfbHoo4OA9PnSCmMZgRwZth+rzDzwWyDBrIR/hcI//IFKiNILDlR/2q6PgmdORBBhPd/z9LwF
	hZJqTJRxl2opfuZjKvLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzRqy-00000006cWj-2c0E;
	Mon, 09 Mar 2026 04:04:24 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzRqv-00000006cWO-3fnK
	for opensbi@lists.infradead.org;
	Mon, 09 Mar 2026 04:04:23 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-67ba58c0220so921245eaf.0
        for <opensbi@lists.infradead.org>; Sun, 08 Mar 2026 21:04:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773029060; cv=none;
        d=google.com; s=arc-20240605;
        b=htL6oKjhwdsAclbdKoMzzxeHF4L03IcjCxIdNKgAmAmLZ+omD1R6a4VhdMxxPMQGRZ
         bNyY9EiRK1gDxL36HStBg/5R15Xtsi+1akmfx5CfVbaiL9unT9WckPLTX5tj+fgGHvBF
         IoLtR4AuFFQQNDK113roLSw3lla/bVH4ZU8max602sAhrKpTMUuiPnZFUDVrOcT2hcUI
         4AOH+m4Tkn5YfMA4ev2Uj2IX+Qqe03dWyAPbab8f9xTI/rZpDn67xXpwhq9TiU2HoTB3
         oJuSnNj4KDpNFTGvOvDzlpNIt6H5k6OGEfdruBKbnazuqqGbzdfOweJxaVrJNeX9ZtPD
         uinw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sxNhiznoFR05iE5U6ZgJ0BDYIKP/s82QqDfNHe0tT6Q=;
        fh=ogOpC+NuY6d6ijIoHdhMeQOuUVrG3CbVshhiGiFFF8w=;
        b=C2t8ZjZ+szjkgZfKhQz9XrBDc7hfqzgdVUFXm3SO0soJKO+BUt0fv1ydU9ZRMbJ6lb
         4xxVZkPJ8gblpsVCjm2XoR3EhwZSHRfMnh2MTIxxqerf7V6Kf0NPcbIS12lzrt0gQMDf
         YOsOljjTXMgTQt05y/lbuH7UqG4qnz6IYww9XvvXrY6NnoGNgDZ/VEYWXXXYFF4g6fH8
         m8cwgpuXJABjfqppzoaAgMBclud63lmzm8+J6tCI6UEvTKYbOfoQX7cGCnN3GVyjbuJY
         piAd9X3ZKzDhvzqE6dEmboc8zptBvxmvEqjoAkfIgOYtAVil08QgTkGbIAxl7eKofetU
         3LBw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1773029060; x=1773633860; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sxNhiznoFR05iE5U6ZgJ0BDYIKP/s82QqDfNHe0tT6Q=;
        b=URK6lCuhFHSwOKxud1yrHbH50uFiUymL4H+2re3mI14SQJEB77bXiMkGLpq+TfcAn2
         sk+hq6gu+pfQ7YafXqP4QRHbZdgeUWEmVBiLunPMCdrrM74A7ni5LmHNHbIDCz4Lb8vq
         /yZ2yNJiMCZhmFeIjdJ8k5zAfXI3Pxlp8PT1ckByxu4quVXt1pqK2CZCGYnQU+QFpi73
         znv+HwPUaWE7K5/hyvswH5GQUOf1s1w60Q4c2lUmMZ+T0Cznrrpstk9b7UVDthmZjDZn
         KQ8jq/jT37hpfaN3GoyfoxQDSNkATYOLSV9aW8fZPdCTuqMZp21MUOZeumCSGd9PCouQ
         J2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773029060; x=1773633860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sxNhiznoFR05iE5U6ZgJ0BDYIKP/s82QqDfNHe0tT6Q=;
        b=hWa21F56O0fTyabuHOUQnQPJ3Gi0xZvnOX9C2px7L78gtgI1Tr5+e4C0V2WORHfZKO
         +gpjMhV9RnpXZMXx7Liorxa3yJmsIQFQZ4Vp3svKGn71h9KxJE76wbIES9VGizvZKqCT
         XQBbqntL6GD76ZIsCEehbvrUmjTIW/m6zGfii06RI3HG3B6ZjRHqKOOmYRSG6eD8/oJW
         TJ8s1hMpaoodULdjYyDMnWoqF37g8KS/sACKh0koi5Y/6C0KjOj7p+E07ui2W5euWksT
         pe+eI13ORbzoxAYDBwI8tcrFOapA2SYSPQ0c82fAWdHTC1V+KG+ZEsB+BCZyEMotBpaz
         Fjig==
X-Gm-Message-State: AOJu0YzJLgcof7lj4UJsDZLTEqe+c0RY9mYV596LhZDahJE5DMy9q71c
	iBTCQUsY30vo1JH/phoVrdruHQ2YbtGNytwoRfKe9vwF23s/PRIlgtwqsgheJTgOFlUp1bvvUPx
	OL83QS6d8WjF0RP5ksak3wiCt2i/gi2snGtUWrFFGfQ==
X-Gm-Gg: ATEYQzy+vj9fpBC/alpmiMu6rvIJtRzd0qme00qWaFPsrf+oMSPr4UJsaiRaSJz6AXf
	s3arvY11U2FGrXMnU9+H7b8Z/KG7dqaCHxLkH5RLBP0JWeU72jDXGR4APK4V9lCovdmDBzrbqMU
	4teMfKcUMICmkp8pokziF9fUJhU2hvv6azfCqQ98l2Jyz2qWhpXV3PE7y9usMC63VaFvkCAEXyA
	YChnsPisDMQoLIzf+PkCbaNz9wbZMNzC19etfNdBBZGgtBMMlwfbFsPagIfCBZPckwiIWIuOSJI
	AOIbhy2BQf0NKnvuo7+tqO1e42Mzjem+BEuLQDQq+O5kFwdypGOUa8JJaFsXFnOWjfQiI43HW8x
	fNv1mOoKw9BmkUZHg/7dsq5MOXw==
X-Received: by 2002:a05:6820:c2d0:10b0:67b:3c00:fea with SMTP id
 006d021491bc7-67b9457e9f1mr6160949eaf.35.1773029060416; Sun, 08 Mar 2026
 21:04:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260108160316.912497-1-wxjstz@126.com>
In-Reply-To: <20260108160316.912497-1-wxjstz@126.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 9 Mar 2026 09:34:09 +0530
X-Gm-Features: AaiRm5019R9_GXWD2iIOfu1nBiDdRG9sBHBsCO0yc9EHNSvT9sHQhJWr7CsO5NE
Message-ID: <CAAhSdy3g8WYAbpY+ui2VGSby4SNQFUBS-S4Zo3VTOyfRXnGnKg@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: warning when PMP is not present.
To: Xiang W <wxjstz@126.com>
Cc: opensbi@lists.infradead.org, thomas.perrot@bootlin.com, 
	daniel.barboza@oss.qualcomm.com, Xiang W <wangxiang@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_210422_255785_A03DBCAF 
X-CRM114-Status: UNSURE (   6.61  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKYW4gOCwgMjAyNiBhdCA5OjMz4oCvUE0gWGlhbmcgVyA8d3hqc3R6QDEyNi5jb20+
IHdyb3RlOgo+Cj4gV2UgbmVlZCB0byBvdXRwdXQgYSB3YXJuaW5nIG1lc3NhZ2UgaWYgUE1QIGlz
IG5vdCBwcmVzZW50LgoKVGhpcyB3YXJuaW5nIGlzIG1pc2xlYWRpbmcgb24gcGxhdGZvcm1zIHdp
dGhvdXQgUE1QIGJlY2F1c2UKClRoZSBSSVNDLVYgc3BlYyBhbGxvd3MgYSBwbGF0Zm9ybSB0byBo
YXZlIG5vIGhhcnQgaXNvbGF0aW9uCm1lY2hhbmlzbSAoc3VjaCBhcyBQTVApIHNvIHRoaXMgd2Fy
bmluZyBpcyBtaXNsZWFkaW5nIG9uCnN1Y2ggcGxhdGZvcm1zLgoKUmVnYXJkcywKQW51cAoKLS0g
Cm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
