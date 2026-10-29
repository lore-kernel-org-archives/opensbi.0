Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70165606A31A
	for <opensbi@archiver.kernel.org>; Thu, 29 Oct 2026 08:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j79X5d1R;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=j+pHkj1u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ptmMpJG4OhkEo6BziwCjAPj0GenBP4j5ahvj7corwPQ=; b=j79X5d1RRMkYBWBppElnmghHwU
	M6TAIg+F6hWqx13aIrs1C6Vgz8WGveWYdIJ6N2CHzdqZuQasVJilfulas9X3eHUW681+UNuQ0YqIY
	/afyvOacBoOngJthYMHbyqCIXr9s+hDdMzaGsaQoKjlVZ/qj5Qix4PHAvtchPgvwRwwC+siYpPeH0
	jnL54kspIlTyiiMhaRAj5c8fAQRLMYTfeTumxvItqLc/4vPNB/bGzNgARAkVIt8sNy9aVp+d7lZFD
	zMBVNFL+xlGoJpVjPrQDmmnlrEzBpKzflXfjjEPAd7snvL9b08sXpIwP9ls6y/YDGCNIsbnEi17FX
	BrxEnazg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMLQQ-00000008iIK-1TkL;
	Thu, 29 Oct 2026 08:23:54 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMLQN-00000008iHW-2czm
	for opensbi@lists.infradead.org;
	Thu, 29 Oct 2026 08:23:53 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso19069015e9.3
        for <opensbi@lists.infradead.org>; Thu, 29 Oct 2026 01:23:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793262229; cv=none;
        d=google.com; s=arc-20260327;
        b=kTy6oJ4l+CIEQanuLt11izMJGWSbC21janDPz67Pfl92mrK/A192m9GyopEoaxdIP+
         itVIPu5h/hFXqUVhEs879ng+slbQiAvTGuznITPgAbMHIgjvEdprcZLIghbdIxn/5cC/
         IruTkMW4o5V47bdjjcsD87r/Ar+AHrRg5xVNNjSHjYfHmEQOB3FQOMe7z1SHm4Y+tJJo
         9vMcPy5zkU06TKlU0aX8NBAte28z94WXeZhWMd8kgD/L8wdDd4nXyleaLabCNid7yOhw
         Eic+HMmcyuFYimpJ9mylIr+SqS3bo5r239Jmz200dN7FyoUOsgY12zNmRU2MoUcG9mN3
         drFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x4B4hPxBR1r74VG67VZ7ZCOWkQQSpP6X77WYXLvyhdc=;
        fh=vIdEKAS85wJF4kVr1hPvqPxowGm5XGH5KR4fr+ORURk=;
        b=hVYi7jjFycwZ22DHA4NmKa+pRAaGBah54X6HRSRfpMDHT3dSH253+2Mgm+vUklAdDp
         H2GT0aRagZvMKTs/CjZNsqBlnpnxw2LBCKx6EKOfIVFzSMtsrY0hFh2+3zKa+4Vpg0l5
         DB2eRt+4iR/66S7Pt84c3fXarkM/VJU6/K42JRAEskWh+O8sEqNxahavsriPKsaC66Fd
         chWLV3CY+Kf5nthqiRJDp2zN0uhbKOYW6WSig+yHwD8dckEEHpIV4eJwadDHHEiEDeL8
         tBeDEn0/ZL5UNNWBcI51YHmCqnJTV+c2UBGPkjezz0LnBtd1ygveSsdJR837m0gWrYd4
         WrLg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793262229; x=1793867029; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x4B4hPxBR1r74VG67VZ7ZCOWkQQSpP6X77WYXLvyhdc=;
        b=j+pHkj1u8CeW3LsM+k+/Wti96GzTTLoRzWwPmJcxHPrmnPNqfv1NXbSPeoOAjJRr7l
         OXsgVxluVX5Omi5SNfrhByhS2G79ZoyT41hz5fhTIL/ClJ37YbuBgTXt+vyle8D5KLla
         dfvTDpjKTDwayw/yiT6/hUocKClUvoP1BiKWqG4XLITy1/VYa4ionS1r3OK6Zv+gLi7f
         yMmwP4vSLGYYRGNPWkY0XFdX3qpyHb3XhJzgZJEfzt1I+Xko3Pl1Ycv76Q5mZ8Y+MKiP
         fJuQJOLe+ruBsWQjkuk2qcZWyv6D5QUHEnV9wLvimmTGRT9FXH/5q/pwi6Aqa/pobsE/
         dmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793262229; x=1793867029;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x4B4hPxBR1r74VG67VZ7ZCOWkQQSpP6X77WYXLvyhdc=;
        b=YlnIR7N9x+AOObCIBQzoW86QdHaJHD9vMyMugvgjfsiIB+WCGh/YErcEEQqj4fQteY
         Bq54bD8nGBYzB0P+Jq4SmXnsyJRvbNQztBg91XCAeicZ5qjslTJPlCsHq21aeQIJqDjO
         cYf7b3bTTfKVzO0yhJu9kz0fIFncOnr1mSQN0Um/ZHk8vThibJyH4t8KCs261bMaQPAZ
         3PC4HlP8oQauWsZJJ0KAk/J01Fp40mds0etL4TrUY1jGhHMYOtBNeKPZkgiqdJsY5eO/
         vVOQud8dIMNZ6fqITP4DM8e0FUtSvBYfPKmzs6GVM5TBGQyYoFQ5gso9zYZQywf2RfdK
         /lEA==
X-Gm-Message-State: AFq9FYL63yLEqdrc1abDe+EsjOVYGWNL07x9mK65v874ztKGUlNi/87R
	G7L6++PxZNFf5sBtWg4rad8YjVl38Io39JcaPq9N/L5vMLzydEwheMRipPM42eqwZGxS0HDdhQD
	VUGGEb0+uGIFzaloEHdMvV6pu1gqLWN9kDtsyfXiMVg==
X-Gm-Gg: AYBFou2PQ993kJqINPjouqG4zgBEF6+LRg8byi7wbFfSt14bt1hNo4bscraEvI6S1Ns
	cGNHr+P/+0Sq+bhjTxZ0vUaIJAho1917/9lk4GKkbdkArrfOhqZtqgarBLtx/SVWWHxNt+obOgp
	c8mlkssEujKS+etcaqzVBRukDV69dxdhxRGZjRlNRL4v0+4HNL3S1QlJ6IlFkrdypVrl146AAK9
	viYf0TNSc/imoS73AAl5B+ZMTjn99FBRLIOTBDG77oMqfHYIgC7mSFz8hpTwBFqTmUIe5IfkPgu
	Q+/mroHtV8D61b5Rsvi67L2ZiOCo7gMO99nUu7eJp4l2yfGhcdclyLB/Gp4vltgH1p+En7XMrjk
	/LO34hnxsbZ+ElHOvE1pA0qc2/YnL1o1H/5z9uk7SpkP2GtDH5GD65zYKTN/LK/yDseZ604sv7m
	b9y2syBdHLkmokzEHJFzcfIrWoEhTkzn3O2Z4MiZDW9hqZhT3uCQpaebPr
X-Received: by 2002:a05:600c:83c5:b0:4a8:c6a0:c08f with SMTP id
 5b1f17b1804b1-4a967e8c05emr119860445e9.35.1793262228939; Thu, 29 Oct 2026
 01:23:48 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261025145338.2569358-1-sebasjosue84@gmail.com>
In-Reply-To: <20261025145338.2569358-1-sebasjosue84@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 29 Oct 2026 13:53:37 +0530
X-Gm-Features: AclHuK_KoYburjXj8k95raiuKEQdtcA427jeZxq-x_IhRwG6RB7mYiZV2xNVCbY
Message-ID: <CAAhSdy2fNFtZhxSmzzJqyJqUGcDJW8DpVQHTQMsbivzqzWofVg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] lib: sbi_pmu: propagate hardware counter errors
To: Sebastian Alba Vives <sebasjosue84@gmail.com>
Cc: opensbi@lists.infradead.org, anup.patel@oss.qualcomm.com, 
	pengpeng@iscas.ac.cn, hppiscas@163.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_012351_876726_07C87702 
X-CRM114-Status: GOOD (  11.59  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU3VuLCBPY3QgMjUsIDIwMjYgYXQgODoyM+KAr1BNIFNlYmFzdGlhbiBBbGJhIFZpdmVzCjxz
ZWJhc2pvc3VlODRAZ21haWwuY29tPiB3cm90ZToKPgo+IFRoZSB0d28gcGF0Y2hlcyBBbnVwIGFz
a2VkIGZvciBpbiB0aGUgdGhyZWFkIGZvciBQZW5ncGVuZyBIb3Uncwo+IFNLSVBfTUFUQ0ggY2xh
c3MgY2hlY2suIHYxIGlzIGF0Cj4KPiAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjEw
MjUwNjI4MzYuMjQ0NTY1NS0xLXNlYmFzam9zdWU4NEBnbWFpbC5jb20KPgo+IENoYW5nZXMgaW4g
djI6Cj4gIC0gcGF0Y2ggMTogcHJvcGFnYXRlIFNCSV9FQUxSRUFEWV9TVEFSVEVEIGFzIHdlbGws
IHBlciBBbnVwJ3MgcmV2aWV3Lgo+ICAgIEFuIGFscmVhZHkgcnVubmluZyBjb3VudGVyIG1heSBo
YXZlIGJlZW4gY29uZmlndXJlZCBmb3IgYSBkaWZmZXJlbnQKPiAgICBldmVudCBwcmV2aW91c2x5
LCBzbyB0aGUgY29uZmlndXJlIG11c3Qgbm90IHJlcG9ydCBzdWNjZXNzLiBUaGUKPiAgICBjb21t
aXQgbWVzc2FnZSB3YXMgcmV3b3JrZWQgYXJvdW5kIHRoYXQgYW5kIHRoZSBzcGVjaWFsIGNhc2Ug
aXMgZ29uZS4KPiAgLSBwYXRjaCAyOiB1bmNoYW5nZWQgZXhjZXB0IGZvciB0aGUgY29udGV4dCBs
aW5lIHRoYXQgcGF0Y2ggMSB0b3VjaGVzLgo+ICAgIFBpY2tlZCB1cCBBbnVwJ3MgUmV2aWV3ZWQt
YnkuCj4KPiBUaGV5IHN0YXkgYSBzZXJpZXMgYmVjYXVzZSBib3RoIHRvdWNoIHRoZSBzYW1lIGlm
IGJsb2NrIGluCj4gc2JpX3BtdV9jdHJfY2ZnX21hdGNoKCkgYW5kIHRoZSBzZWNvbmQgZG9lcyBu
b3QgYXBwbHkgd2l0aG91dCB0aGUgZmlyc3QuCj4KPiBCdWlsdCBjbGVhbiBmb3IgcnY2NCBhbmQg
cnYzMiwgUExBVEZPUk09Z2VuZXJpYywgbm8gbmV3IHdhcm5pbmdzLgo+Cj4gU2ViYXN0aWFuIEFs
YmEgVml2ZXMgKDIpOgo+ICAgbGliOiBzYmlfcG11OiBkbyBub3QgaWdub3JlIHBtdV9jdHJfc3Rh
cnRfaHcoKSBlcnJvciBpbiBjZmdfbWF0Y2gKPiAgIGxpYjogc2JpX3BtdTogcmVqZWN0IG91dC1v
Zi1ib3VuZHMgY291bnRlciBpbmRleCBpbiBwbXVfY3RyX3dyaXRlX2h3KCkKCkFwcGxpZWQgdGhp
cyBzZXJpZXMgdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywKQW51cAoKLS0gCm9w
ZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
