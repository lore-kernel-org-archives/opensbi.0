Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD83CC3ABA6
	for <opensbi@archiver.kernel.org>; Mon, 28 Apr 2025 14:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w1lPzVP9zgrqKOCW6pcSrhw/1E7qnYEsQsbO7RKCscs=; b=eK1UJQNvZWI5YB
	eDsWPw5hNpKt3PUCR5fvJ4z3xOdbW+hCnqJLx1L0GQN0aNnH2QxwJtBwjUQTzh/jHcEzGdARwjBbd
	t4QXIn9fyxA44F/nlRufSIn+qhAn4rSlwuvuXJ9Q/0x5jutzToHHYMrr2RWD7a3o5o4/tQGg4DOI/
	Xz/QvNUgCPl+RgObWf011X1/jyLin0xlN8fuiRyRI5EdcpphE/ESRFUDO4Euc8Lzg18ic6PMzGwz2
	bRkqoO+efChozI9c6cz44wDs+fNLVYJFmga7J7LVPqhaYO4D/ageAOAqOSw28zW2BmPDu0mj90w5w
	xMrQjBIU4SWiz8SZOjJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9PHD-00000006b9Q-2Ysj;
	Mon, 28 Apr 2025 14:16:07 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9NnY-00000006EPG-3aan
	for opensbi@lists.infradead.org;
	Mon, 28 Apr 2025 12:41:26 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3d81ea55725so14118355ab.1
        for <opensbi@lists.infradead.org>; Mon, 28 Apr 2025 05:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1745844084; x=1746448884; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=trZY5KMoZJ2YKHjhUHTBMPf4TdRKBzZRH1EWUhHKEpA=;
        b=hUOnW4pHTPVN5t6Rt6EZgQuhw7hRtNLUpsKQukr1vkP0lSfs8V5OiY92q7YNa0Bm2O
         8v+BX8ipgSwl1VK2mm6LQiztQmX5J9BHdSYMyN+NfwmDkdObigx1YtWdPfg+gNkLj69j
         yS23pzHba8Y0TbOvmSNxL5H+UCQC1GH03pytfav40whKQ7jo4jhb+LCcLMhFj0HcltIT
         P++vD9HN2Otooi7GRl8UYvLKHVZEOD0mohoRbfjyRyLOdXtlLJoF92pHIRk/tqylC3QG
         jO8br4MZbG3H87XZNVIWPLS4RATn6dqpLHO6s7z9NipIWOfMx60DGcCdisspUk0jQl0S
         d+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745844084; x=1746448884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=trZY5KMoZJ2YKHjhUHTBMPf4TdRKBzZRH1EWUhHKEpA=;
        b=dacKEaVRdVMVSo8GyVBjjj4ip+7fVh+OdKImPDm5Mtsw/VLbX7G4HQOtCzjS1s3fCq
         1iwRd5brCcsNnK689l0NCxjQQijurcHfXAW7vep2iukCRTOL7WY3RE8CPHBpejw3Ex1m
         Zfda3qP5h8AQcT8Landg81XPhNqetASNmI22hpxyfYuaO7l9EIy+0W/FrS1XATF+yn0u
         QXJDStgL8lpafqyAetdmkIBnDaEWxGnJjXqEEBagcVKvndIJepvNLLPBpkPETOI+/qDA
         qdUXkFq1U6rxMjYEeaecVEKo+RR0ndX0+BP4Xcoyt6E2wZ6A2hBvwph0vyMPqF/1fS4V
         dE2g==
X-Gm-Message-State: AOJu0Yy8SVpjS9f6SyFfYsCzTRbgiTY9KiYNbbRVEdvZRPH5K2TVOdFO
	N2dhiWwhPZs5Vajr9Q0q4BiB8FSsElRYH0IdjyDRYw/sXb4sP7WX0eFxS75346I2BRI9TVI+4MB
	DP10vugGZPQ9L6kvnyLWfA2sU3N8FopcPL/tBXA==
X-Gm-Gg: ASbGncvIggdgoH0fRGVHcxoJp+Qn9zAEwYfXYBMQ96rh6qnSUXl21rzfkECNWji+gCg
	LRf3E5ijueL7OmAJbvUvejJygpYfcSJwA6FZm16JLAe+qnN4pzRl2yAOpjSWtpsUd7+jlq7DBln
	9TZChX3BPk6pmMiex69wnbqOo=
X-Google-Smtp-Source: AGHT+IECl/uafxMxCIVbICQJ2s6T5NmISy3+DyBAo0V/MfM/QPe43UBq+MAnMUASEGQy0AcwdEJetBI4PilwSvnjcW0=
X-Received: by 2002:a05:6e02:74a:b0:3d8:2032:ca67 with SMTP id
 e9e14a558f8ab-3d93b41c0demr115135305ab.9.1745844083857; Mon, 28 Apr 2025
 05:41:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250415131908.2699782-2-rkrcmar@ventanamicro.com>
In-Reply-To: <20250415131908.2699782-2-rkrcmar@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Apr 2025 18:11:13 +0530
X-Gm-Features: ATxdqUG1BnASPyztB-DuwDL7Y17eOHvEKtqzztsmtp-xExkNRq-H1y0fc-DG7lc
Message-ID: <CAAhSdy0+zaWHuemPOtAWMeg2Z8A-1A71XmSqnS_=uMDmg66J4Q@mail.gmail.com>
Subject: Re: [PATCH 0/8] Reset more security-related CSRs
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_054124_896567_9CD048C6 
X-CRM114-Status: UNSURE (   8.35  )
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

T24gVHVlLCBBcHIgMTUsIDIwMjUgYXQgNzowMOKAr1BNIFJhZGltIEtyxI1tw6HFmSA8cmtyY21h
ckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IEhlbGxvLAo+Cj4gdGhlcmUgaXMgYSBwb3Nz
aWJsZSBzZWN1cml0eSBob2xlIGluIHRoZSBpbml0aWFsIHN0YXRlIG9mIG1hbnkgQ1NScyB0aGF0
Cj4gY29udHJvbCBpc29sYXRpb24gYmV0d2VlbiBwcml2aWxlZ2UgbGV2ZWxzLgo+Cj4gWzEsMi84
XSBhcmUgbWFraW5nIHRoZSByZXN0IGVhc2llciB0byBpbXBsZW1lbnQuCj4gVGhlIHZ1bG5lcmFi
aWxpdGllcyBnZXQgZml4ZWQgaW4gWzMsNCw4LzhdLgo+IFs1LzhdIGZpeGVzIGEgbG9vc2VseS1y
ZWxhdGVkIG9wZW5zYmkgYnVnLgo+Cj4gUmFkaW0gS3LEjW3DocWZICg4KToKPiAgIGxpYjogc2Jp
OiBhZGQgNjQgYml0IGNzciBtYWNyb3MKPiAgIGxpYjogc2JpOiB1c2UgNjQgYml0IGNzciBtYWNy
b3MKPiAgIGxpYjogc2JpX2hhcnQ6IHJlc2V0IGhzdGF0dXMKPiAgIGxpYjogc2JpX2hhcnQ6IHJl
c2V0IHNzdGF0ZWVuIGFuZCBoc3RhdGVlbgo+ICAgbGliOiBzYmlfaGFydDogZml4IHNzdGF0ZWVu
IGVtdWxhdGlvbgo+ICAgbGliOiBzYmlfaGFydDogcmVzZXQgbXN0YXRlZW4wCj4gICBsaWI6IHNi
aV9oYXJ0OiBhZGQgU3NzdGF0ZWVuIGV4dGVuc2lvbgo+ICAgbGliOiBzYmlfaGFydDogcHJvcGVy
bHkgcmVzZXQgU3NzdGF0ZWVuCgpHb29kIHNldCBvZiBpbXByb3ZlbWVudHMuIFRoYW5rcyBmb3Ig
Y2F0Y2hpbmcgdGhlc2UgaXNzdWVzLgoKUmVnYXJkcywKQW51cAoKLS0gCm9wZW5zYmkgbWFpbGlu
ZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
