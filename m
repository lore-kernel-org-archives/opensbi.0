Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7F5CCA490
	for <opensbi@archiver.kernel.org>; Fri, 16 Oct 2026 15:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RCfZs7glaTUb7+W1CYDPgfEiQgD2T4NXscMUw0O3EOs=; b=rDqwJ/KAZC4rac
	DXLd0K2aaqI8Mj29AWmvPJzMUNP1VU1j5CWohTZ/2lyUqdri0utQtzOAv8mZBQEdYVTEXcDLhDWk6
	oS72ShGDtnvZXMNMy5QS5bWTQGT25J+X2cdMUgZ12jqnTWvbOzVSFLWBIgq//wuuXJhCUKsnowv7/
	+VQZMJun+vsVen3kdFxgaRDoI6fq2MRgAsVCSc4rk9LNzyD5V4RTUlEuv5vXB1ol0V1kXtn6F6EQe
	Ui4R0DLBKeKGrNQfbfhsQeTEe2adpqzFBdOqJ3lMYchnE2lNIEETMgqS6v0Fbd4klw5TYg4T7W6+D
	BuFwunwAoOTg1WHrtWxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHk1N-00000003InZ-0aYU;
	Fri, 16 Oct 2026 15:39:01 +0000
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHk1J-00000003In3-3b7O
	for opensbi@lists.infradead.org;
	Fri, 16 Oct 2026 15:38:59 +0000
Received: by mail-yx1-xb12a.google.com with SMTP id 956f58d0204a3-675676afc3cso157472d50.3
        for <opensbi@lists.infradead.org>; Fri, 16 Oct 2026 08:38:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792165136; cv=none;
        d=google.com; s=arc-20260327;
        b=AL0aXLyl/DtbydcLNYPbm4ikm+L6h0HuFmZ8ICYoTybsCLDzy9Peguki56Qjjcx65d
         fjhJgY8ntS7xho/cplQ5jdlxoUecLUnA+rItK4osoOcCt4Extp7kzB005X18mwAB6y6e
         qwPFaeFHjPIwCyIJp+mAqBYEdKtm7OMxHq+Cv8vNICl0KoC0dozcseLE1a0OVzvOXYpG
         cZbe5k6eEGY0cUNq/qa0yaUS/NAnni6MCJWKEZk9MTLJ4Xtdaf0eiD4Vu95l0Y3XG2G9
         K8LdG2Xz4MYC/Vn5mfL3NrKnPxDLwN133xb9nyOAbp4Tyn6sw1NMt1gsSoPFDZnrEapC
         Jc8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=iviavYjYHGDKJt4MPnM5a/huxzJ5IdnCyuAZ/l7FQFA=;
        fh=z6o6QVON9Zue+WiPFGWqO4R+QeAplVVNKgA3Y1eGRZQ=;
        b=oIO69FHbasrbwWNR6N0SeHq4AmhCCHJFC7iVBdDj1g6af7XriGN8fQPa8oOktS7zq+
         0BRizButkN3IBoq+l2E7E4xW9S3Uc1tPaxMlckU/PpY+siq2zLLmLqS3MWoMjY7Lidkk
         Ddb8X9ti7OE0s/6SNUsLeUo3afXAqXnyIHvc9LOCX/dl4TsZh2Frilpz26KdzY5P5Z/G
         EAX44Ng5tCaQ9wCqw45uzGxPolnk5sbKTxh9epA55GjVwV1Yd4j6aP1uk4OB6pAMfoPi
         HTNMrZX8oHbHOXdF1YxvjGKBJNrxUTl0eZxrfMLAorPmjz6BTLJ14CjU1vRx5uVZIDHG
         OnPg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792165136; x=1792769936; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iviavYjYHGDKJt4MPnM5a/huxzJ5IdnCyuAZ/l7FQFA=;
        b=iDoPbdZJoAecROpZPTiSuW5kn19+s3cyViJP8PaGGwJhl4dALwAjXB4SLRsxE5ysg/
         bc/QDoQG/H0PdNj44RrKpa9VX3nRLemJ7wsXr+1/+LiAt94Poun7LQDiWoaWsXxN1Zx1
         V6gmI4GskrGzWJ39P3SjfLwXi9jqfBH7iZCBRL/+te0KNxAajdYpIMO55ZV9+kR/hqxx
         D46hGNV8MVHb/zHteW9rYZVsIZ8ORXPjc2czLf58oBzaXfIyEQEO9ldHXLXhgLZWWZF6
         oT0OGPJBrxRe6NwxjHTuu3F+RuVtuitM4Mk6T016ASIAV9lI2p2oNLlHz0AD0Mu+jHv1
         H7iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792165136; x=1792769936;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iviavYjYHGDKJt4MPnM5a/huxzJ5IdnCyuAZ/l7FQFA=;
        b=A47U5yooVwvCJkiq0l9fgyg+wfQiwikAsLjfMGY/bHZurVvlBJh6Pq48oEK4SObt8R
         KsuiD1q2tt+NR0c0zloZNrdroakn3trf+JkNAwYBjDZ6qbZ48qapatmSUR15LSOTl4nC
         9ttyXeX++LExiTP13AALhvgr6lSz3Uc7uPBHR9SY1YLmjbTUPuUoinEir2ypIp4m3qrJ
         NaB0ujs+3BMcbIs9oJ83fJ6PuUS58bz+jxdC4AAt9rlZv0ttoeeKvFXncwi+ie3nDB1E
         arYOjhV6tYG7vD90gawzTTJ8qw69DBpFeQECMQ3r30RxfP7r8gNeZSUXzRjKzmGSq/QJ
         5Ekg==
X-Gm-Message-State: AFq9FYJor5KJSPswXKJ3ERj5TSEqaaCOGh6jp4gHDSznFzR927eXWJl1
	tXDqwAI/yAsIfZ+tBZvfgwIDypeJUXQ0Z22Wyyl3pmJY0mjztkTMQlsecAFPQntHCyF7fCosBMC
	oCbkhsaedyuRhnER8tWLtRcxuy+2cLoaFYlN+
X-Gm-Gg: AYBFou1k1Ro4G3PgGkpMQnaGDoe49EQa+vCZhaDAvfdpu/gFG2eb6daifCd2EF24aaP
	3fW7UcXoegB7YYkinPwB+j8IDTQgSGyCnQmd0aKdo65jH4iZjXwe/2YbS4a+3ZkXBer/+lwj5Zj
	7sGZxU9v/GYmnEMMxWfOogjlLeyp37fIrLtrJ5JcuFm9saahX+ZT7vx/tCT/NN02s1jBg91365L
	sYj+lE/Fd2oJ0Er7BM4wNUiL0QNYGzzWW3C6pbUTMqgv1c2pFzvotYWZOAWBf1erpcYMbYy4A7w
	iM4kX6kw6opY+joyiDBxGdV5ug6NS2qDM5u0u1ZwWpZ0cntl8ujnBlEc
X-Received: by 2002:a05:690e:168d:b0:679:98b1:cba3 with SMTP id
 956f58d0204a3-67998b1d8abmr3104871d50.44.1792165135889; Fri, 16 Oct 2026
 08:38:55 -0700 (PDT)
MIME-Version: 1.0
From: Raymond Mao <raymondmaoca@gmail.com>
Date: Fri, 16 Oct 2026 11:38:44 -0400
X-Gm-Features: AclHuK8Mq8m36rfXh7PomUkEZ33NjsPH0JKAA5CkLVc3_qH4BOPnqA4nl3cHoPE
Message-ID: <CAMDkj5ycqf0+tfShVMTVf1MXc+J_XvRNen_hK5MM94NLUSLXTw@mail.gmail.com>
Subject: [RFC] OpenSBI per-domain handling for FWFT LANDING_PAD / menvcfg.LPE
To: opensbi@lists.infradead.org, Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Robin Randhawa <robin.randhawa@sifive.com>, Scott Bambrough <scott@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_083857_906885_A4C0DF12 
X-CRM114-Status: UNSURE (   7.95  )
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

Hi Anup and all,

As part of RISE RP022, I am working on adding RISC-V Zicfilp landing-pad
support to OP-TEE.

For OP-TEE running in S-mode, enabling Zicfilp enforcement requires the
SBI Firmware Features (FWFT) LANDING_PAD feature, which controls
menvcfg.LPE for the calling supervisor.

During review of the OP-TEE RFC, Robin identified a possible issue with
domain coexistence.

As we understand the current OpenSBI implementation, the FWFT LANDING_PAD
state and menvcfg.LPE are effectively maintained per hart rather than
per domain. Although the domain context switch already preserves state
such as sstatus and senvcfg, menvcfg.LPE does not appear to be part of
the per-domain context.

If menvcfg.LPE is not switched together with the OpenSBI domain,
enabling Zicfilp for one S-mode domain could unintentionally leave it
enabled for another S-mode domain running later on the same hart. For
example, an uninstrumented Linux kernel could inherit landing-pad
enforcement enabled by an OP-TEE domain and fault on an indirect branch.
The reverse situation could also occur.

Could you please confirm whether this understanding of the current
OpenSBI behavior is correct, and whether per-domain handling of the
FWFT LANDING_PAD / menvcfg.LPE state would be needed?

I am mainly raising this here to highlight the dependency before the
OP-TEE S-mode Zicfilp enablement work progresses further.

The OP-TEE RFC is being tracked here:
https://lists.riseproject.dev/g/platform-wg/topic/121789281
https://github.com/OP-TEE/optee_os/issues/8096

Thanks and regards,
Raymond

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
