Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE30CCF9E9
	for <opensbi@archiver.kernel.org>; Wed, 29 Oct 2025 03:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9jymetyZrc1Hl9HG9IGhaSOUytIKM9KfRMN104cZIqM=; b=tGheNNW7d7txHO
	SdrkXpW8JX5ypCyqGgmjQoxnUZjAbIXckvV3QsgUvXSotFEUeQ/s+x8tOFn19TXlQzyXBZa6udjc1
	6220x8zwpKLubinb7LhN9HtgKG0oDT+VWrRvDDKF0uNJB4Owut+9qOfShzsXb0soTRJWqVbGOgdWL
	sULP5yafL4YWx/PCbfCAGS3B77dampnT122Ry7vAZETMJiL5AvtJMZReTk5wlTOS/apPBsYeKWO/X
	jQcyT5gVmJ5IiCPPo8a8z1owXuKNmvw4TBz+tMFspC+I8+6gIFaLUZixtyxgRnhrRAfxTVxFPr/j8
	kLMElQcVF6NBTKnR3a7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDxHM-0000000H5ov-2KJC;
	Wed, 29 Oct 2025 03:55:20 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDxHJ-0000000H5oB-1K41
	for opensbi@lists.infradead.org;
	Wed, 29 Oct 2025 03:55:18 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-3c92328d0bcso3570604fac.2
        for <opensbi@lists.infradead.org>; Tue, 28 Oct 2025 20:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1761710116; x=1762314916; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GeVOT0GlqVvp0vHJk3OzOcTKTb4eX8eQ+tPIbL6N52E=;
        b=amy/C+EAlNiy8c5hoHnbfbgVuLx6h/BSuNjzG8EKHk2v/P4z297Q4po1heWS5M7cJN
         qGsuh6XKW+oxcVVNVrdHFCvhgpimTu3s6NSP1gyNdHWwveT0twBZ2m8olvStH1f8xs+f
         VYTiUIiZP6jReJWDAiJxv+QJMAgzifB7m5Hq96v8ysSxujgzPyXSX0oWYD984HhjAYjV
         zjMjJy0RWPhbr/42J4rnYNytv+RCLc17/hhASx9oseX4Y5EVMmYZOJ0TRzg+UrwdrvVf
         Yq39VAVwLpnNA2fkbEztREmXxYwt4HnraqXQs0pw4PeSnFrjEzIwDwZQGEyKItlsJLzs
         e2Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761710116; x=1762314916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GeVOT0GlqVvp0vHJk3OzOcTKTb4eX8eQ+tPIbL6N52E=;
        b=I3zEdOo71XANyaNbEQusR7v/qtm330Rz20fDVKxnZKCfu+oJ4+Dj/XjKoGFBftINOC
         3M3gmcgm5XqEXRwZFlo84RCe8Jku3ejQy5f6X1VQTOhO0h0HY0117Sf8M2x7RIyLFQR1
         +oq/f7/d1SMzylcrC+gT4+DlpqQFovkLqh8XVPL7YkFG9c/1di0JnhhqsLQiltqlCONj
         xVU2Khi6TSRyP5iNJ+6KhEaY/0fqZohKB3M7er8pQA0FYuNzig8NPu7WJX8wuxpH/ZyG
         GH1Dl84UpPAg373mo6DK77O/Lm3w35ZXSeVTqfgo0r4xHoUYqyI63u010nK/XLYpisz3
         K83g==
X-Forwarded-Encrypted: i=1; AJvYcCWvhW9jmpyeigqRDIVXe/tH6S+NJauALEMy258eLYsA5aaEelXAAN0e70TI6zVvKmOieSQaczn+@lists.infradead.org
X-Gm-Message-State: AOJu0Yzbqv+iNPFrBaFM8JiaVVi4SHMSdarouc2HVj1QlM7rtYk1qZqf
	a/zjwaOKSSLcAUDsp9Imt82/OPUE4J1oUaQqtb4VlXphCg0qv7p6PcfCMSDi7iCfX7rqeSzCDHK
	RILehNkDOpG/dE58XQC9/ywKzP0xmRBLnAtpNYpuTWg==
X-Gm-Gg: ASbGncs0DmefqtwjDED003MEWmBgPR+/5DP0LVBrJwz6iDb7NV/1Zql+fWRCypAFFJq
	UgriShh8OGzjQNhPibIHvCqyZ7MqifKOZuyUnfS43Ao1wjeLg4zD0+fI7+4eJ/9WAwlzycz7Ab3
	9ihTAY7LjQADF/jmuZw88b45Ug7om3ko/7YfFxDnNOwhmf3A0RkQdvQuiP3aSfjMzCZ5lriGpMk
	aJCWn4brSAczI9qXzrDMHUdJOIpCYgWV1JxK/R+DySiBnZRbt/E57v9j8+TDnWX1P1g+3NeaX9i
	3z/JVk0KTtTnQhm4UPE0JcCUK3jkPl226X1j+cdVXxAhGS2/aaqq56P1T3K6oJbfC8epCnsaKGC
	zlQjHc/jKiX3NYL60Wkik9PTg7NkqMwalbnHAy0oNFC9V1g==
X-Google-Smtp-Source: AGHT+IELEXXrrkB04lKUOxojZmS+krKYc4nvLAQGOI5lXTGdbByXXtx5YwW4VxpK4axHKWMtcVMjlSQoAXRsuNak3eI=
X-Received: by 2002:a05:6870:a199:b0:3d3:d17f:28ad with SMTP id
 586e51a60fabf-3d748cd23a1mr893871fac.51.1761710116322; Tue, 28 Oct 2025
 20:55:16 -0700 (PDT)
MIME-Version: 1.0
References: <20251013153138.1574512-1-joshua.yeong@starfivetech.com> <20251013153138.1574512-4-joshua.yeong@starfivetech.com>
In-Reply-To: <20251013153138.1574512-4-joshua.yeong@starfivetech.com>
From: Rahul Pathak <rpathak@ventanamicro.com>
Date: Wed, 29 Oct 2025 09:24:40 +0530
X-Gm-Features: AWmQ_bngiXk95Vm4bLtGrf7cH_ordiRf2dkeLJ9oDM_LdAmnjskhGJUMWIPp5jo
Message-ID: <CA+Oz1=YXY7u5g+8JLsRndUmaBE+rmoYye3MfWN23J=VJR74efA@mail.gmail.com>
Subject: Re: [PATCH 3/3] lib: utils: Add MPXY RPMI mailbox driver for performance
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: atishp@atishpatra.org, opensbi@lists.infradead.org, 
	apatel@ventanamicro.com, leyfoon.tan@starfivetech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_205517_378299_6880647A 
X-CRM114-Status: UNSURE (   8.71  )
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

T24gTW9uLCBPY3QgMTMsIDIwMjUgYXQgOTowMuKAr1BNIEpvc2h1YSBZZW9uZwo8am9zaHVhLnll
b25nQHN0YXJmaXZldGVjaC5jb20+IHdyb3RlOgo+Cj4gQWRkIE1QWFkgUlBNSSBtYWlsYm94IGRy
aXZlciBmb3IgcGVyZm9ybWFuY2UuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKb3NodWEgWWVvbmcgPGpv
c2h1YS55ZW9uZ0BzdGFyZml2ZXRlY2guY29tPgo+IC0tLQo+ICBpbmNsdWRlL3NiaV91dGlscy9t
YWlsYm94L3JwbWlfbXNncHJvdC5oICAgfCAxMTggKysrKysrKysrKysrKysrKysrKysrCj4gIGxp
Yi91dGlscy9tcHh5L0tjb25maWcgICAgICAgICAgICAgICAgICAgICB8ICAgNCArCj4gIGxpYi91
dGlscy9tcHh5L2ZkdF9tcHh5X3JwbWlfcGVyZm9ybWFuY2UuYyB8ICA5MCArKysrKysrKysrKysr
KysrCj4gIGxpYi91dGlscy9tcHh5L29iamVjdHMubWsgICAgICAgICAgICAgICAgICB8ICAgMyAr
Cj4gIHBsYXRmb3JtL2dlbmVyaWMvY29uZmlncy9kZWZjb25maWcgICAgICAgICB8ICAgMSArCj4g
IDUgZmlsZXMgY2hhbmdlZCwgMjE2IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGxpYi91dGlscy9tcHh5L2ZkdF9tcHh5X3JwbWlfcGVyZm9ybWFuY2UuYwo+CgpMR1RNCgpSZXZp
ZXdlZC1ieTogUmFodWwgUGF0aGFrIDxycGF0aGFrQHZlbnRhbmFtaWNyby5jb20+CgotLSAKb3Bl
bnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
