Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5714A606A31A
	for <opensbi@archiver.kernel.org>; Sat, 24 Oct 2026 04:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S+B7A3NB;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Je21v0dy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Y+VoeKl53jiQGbA45Euh+IaTCXeHM+epPchfZfs8QSE=; b=S+B7A3NBUjS5GgXEucufM5Lyck
	YvItfCzLdagltBcWfojnidxRLvo8ibesKWBgRq/MQ1QxHGojIyey55gzc84N7/caLIFo8u6+TxwDp
	vNJwziXZwhLcG6mHBABRMZHsufdcqCN1x+rmDZjSCXNhaii9XXdspgQX0E3scr90eoX/AI6fF/IJe
	5kdZGcXfPjUcUNXqo6FQL3Z+FolzeCE1ZktrSj74de/8VGw29RaJ+dzJ9zhZ7s8YOUU2z2Kcib3NV
	Cb0bSG1UJ6Zf0OODYAi5QDvpzvk2bnJLEeMxzRZYNOkygZaYqyGoWNTXKJznj62n9jJq1RBLHMY9v
	+YWHWwdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKTau-0000000HQq8-2L7f;
	Sat, 24 Oct 2026 04:43:00 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKTas-0000000HQog-2Um2
	for opensbi@lists.infradead.org;
	Sat, 24 Oct 2026 04:42:59 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6af9a90e4bbso1541612a12.0
        for <opensbi@lists.infradead.org>; Fri, 23 Oct 2026 21:42:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792816976; cv=none;
        d=google.com; s=arc-20260327;
        b=DA9GDpClzSXGPi+jYkQjMNCwLZZT8jmE596KcY9IJiUmVjIiC/5UHWV/JCimZYPftI
         JNrYWAoZlmb/EsRksx3IqpfDUYDFAyu8fh4QHnF34gUaeI4y6jQvcuwJCw9dTJcytRTc
         K5oYm2VG60qXjGRC1UoPxmVbw50bsXovMJRqx+/ywqamn468BYvy9Bgi/f2WmFJvLQ6L
         lHK/zixh+oQmgl7+xyOujHpa7bRQ4qvo12tzth5WIHD2XwsadsuL7Nz0vNokkv0lsPX1
         5lUeCdwDw7FFGUcLS7Xzx0Jpafp1jGCTV97qsUCvOeCM7cdunq/aMtY8SsJimy8f3sfY
         8qEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=so5lSgQedqqj1qOwavjKZogRa+L8ztg8KUKtPEOgTds=;
        fh=Ef2Pb6iKs+fZ5uj9/IoRa3DLpVHj8SVPFsl0PHDwUbQ=;
        b=IG1SHyfdoXONpYX2+lpEFNjElFzYNyg/KXpakusZoetxDYmpJbe2MxsNJM0WnBXeAp
         RZn0SDePpD4wkk0Oc3oojP5vviduwoQ/JCYOEYq2WHEZZ6ciEVcMQr9zY6Y1ASY90QK9
         g7k9nsXbLubXDhzJqUFMFNub5dfaMnhJG/TY8BkCcPG+DmimY0ZbEcwRmGwCakIQ2N2P
         aiVyRw5tzrTEkg4GnCRSFZvfHggewiF3x9FyCSoi5bDRgU+Lvf0U3EtTROXortiLbp9c
         gG9DWeBXbyNL82fc/uf+unFV7+Un8ETd9vjEiPhljdE+6Jld/QnkE1WqVfWsE/GVgG4N
         DS4Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792816976; x=1793421776; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=so5lSgQedqqj1qOwavjKZogRa+L8ztg8KUKtPEOgTds=;
        b=Je21v0dyXnWfD1P4v9do1v29Gmmy+zhNHgja1sV/c0D2ZNQiqQ1jTPtZQUo9dDwVPx
         bVgWpz+Hc08B1JDPwFLeUxY2Cu0BojcJtbhqE0f/+aldldf27BnlxWMiNCaIHmf3cqWe
         gIE1G+3CzxaYxqEh1M5Po550BwOawVXwcSE8eBn4yrAkUQA/q17LfntfwllNkKTByDxO
         c2D1zM3b1eH1Qnk5uN1EDZjAQ5P8WlAc6Xhi/AflzaB81cpo+8OEBJaJtr+pizBrPQrw
         k5JH5e6pedDI4WNWZiWPfTv4p6wwcAAGF0S4yocGB1iMBXsivqrH5uKK/yBK5YkXXokc
         xbTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792816976; x=1793421776;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=so5lSgQedqqj1qOwavjKZogRa+L8ztg8KUKtPEOgTds=;
        b=ZyWkXbLZH/4Br4rCerpPfzblxlm8yKTJGOkf/hnXF4EJtSc+9cqea6n2PntWbno/eo
         OkFKBZHkACA3wOiMdfSNIx2/X4Rvj1KJIUV6UmZmMKljg3PqmEGulVPOvlnzVa91aFeT
         8m7Wy+CPEE/1Sx/ZMHyoYwktYYnI6GJjaM+B2LaczNxyAXb1ARAA8WfzZEuiogePpEPQ
         4btql71s4x+baU0u8C/aFg5QVYH3U3+LtLvIES8gB/CX4OKTU2hZ/0MTf1K1a8gABGh/
         FHy9nmsEFmU3qo8nndEGTr34GIn8zGMt3tdPtJqYxHkMHOX8M3MA8LtB09p8FsmDfjvp
         gG8g==
X-Gm-Message-State: AFq9FYJ+BorjSQTsNdFHt26iXTHFOsXMAKoeso9iFDNo6wGnWv3fUfWM
	okVmAGdOX6VeCj9emtZjczzO0uOiMyumNfW3HllfT2B2k8+NJhXi7fwpRRWfpE8lD/cxPaNZUx1
	RCiyeNDRGCg6X+64QxlZHtP+OrIsNJFo=
X-Gm-Gg: AYBFou0nx7hdawTzFsxQV7AL2KdWx4Zvs6vcq82612eyPSOfVeKIGTn/p8lcJkxe40W
	4F/r1qs5TjrcioS/Uhi9ZWfj6hfeQb2XRjEBEsmKy7d26Do2lb9uhnDgB9c3nVcG/Ws3qCSS/zp
	swZm3adixLst9K5f4j6eUuL0L2/yfZ5JVPGdwZbXhZ73VKmWp2oZb4wVjdFey2EU4TEJ3FvtwOA
	MwWrlGdOIbwGHsQOgp6W6yJI2Sgi9+MnGN7waz66qLPaNvEkQ92RSdOpWTFJKSRMUCDFxCpSjdC
	KgjEAmrIjUWIfG89p3B2cY12sxJ4eV8dnTLMKk4lQvwxgjxErtkmeDroxllCKPQweCovM7AOId2
	1nkBLWPGPg/asw29NbCxOSJA+CE5xxBPhr+CeBqNRDVdwl7yeZp+VLlNbjh/dJwQxOoYUXg==
X-Received: by 2002:a17:907:96a1:b0:c25:2d27:5652 with SMTP id
 a640c23a62f3a-c46bdd97aefmr95388766b.11.1792816976133; Fri, 23 Oct 2026
 21:42:56 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260827115718.50124-1-pengpeng@iscas.ac.cn> <20261013044221.1563754-1-sebasjosue84@gmail.com>
 <caplitmus-rv.reply.20261014.pmu-test.c7fe4ad71542422d99c77cdf4db674bd@163.com>
In-Reply-To: <caplitmus-rv.reply.20261014.pmu-test.c7fe4ad71542422d99c77cdf4db674bd@163.com>
From: =?UTF-8?Q?Sebasti=C3=A1n_Alba?= <sebasjosue84@gmail.com>
Date: Fri, 23 Oct 2026 22:42:43 -0600
X-Gm-Features: AclHuK900ZemIfcVm5FNMyzyoFR49D7gm4ZLstChETzO4s_pr9hJG12-Q8YZMhA
Message-ID: <CAJD=UNc2P_=ikq-oqdh-dD+5eZU-sBzms-8Dx-xtc06=yJoGQg@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: reject PMU skip-match counter class mismatches
To: Pengpeng Hou <hppiscas@163.com>
Cc: opensbi@lists.infradead.org, anup.patel@oss.qualcomm.com, 
	atishp@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_214258_675708_2717F3B9 
X-CRM114-Status: GOOD (  10.04  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgQW51cCwgQXRpc2gsCgpUaGlzIHBhdGNoIGhhcyBiZWVuIGluIHBhdGNod29yayBhcyBOZXcg
c2luY2UgMjAyNi0wOC0yNyBhbmQgdGhlIGlzc3VlIGlzCnN0aWxsIHByZXNlbnQgaW4gbWFzdGVy
IGF0IDEzMWJkYTk0LiBJIHJlcHJvZHVjZWQgaXQgaW5kZXBlbmRlbnRseSBpbiBib3RoCmRpcmVj
dGlvbnMgZWFybGllciBpbiB0aGlzIHRocmVhZCBhbmQgUGVuZ3BlbmcgY29uZmlybWVkIHRoZSBh
bmFseXNpcy4KClJlc2VuZGluZyB3aXRoIEF0aXNoJ3MgY3VycmVudCBhZGRyZXNzLCBzaW5jZSBt
eSBlYXJsaWVyIENjIHRvCmF0aXNocEByaXZvc2luYy5jb20gYm91bmNlZCB3aXRoIGEgNTUwLgoK
T25lIG9ic2VydmF0aW9uIGZvciB3aG9ldmVyIGFwcGxpZXMgaXQuIHBtdV9jdHJfc3RhcnRfaHco
KSBkb2VzIGNhcnJ5IHRoZQppbmRleCBndWFyZCwgYnV0IGl0cyByZXR1cm4gdmFsdWUgaXMgZGlz
Y2FyZGVkIGF0IHRoZSBjYWxsIHNpdGUsIHNvIHRoZQpBVVRPX1NUQVJUIHBhdGggZmFpbHMgc2ls
ZW50bHkgd2hlcmUgQ0xFQVJfVkFMVUUgdHJhcHMuIFRoaXMgcGF0Y2ggY2xvc2VzCnRoZSBTS0lQ
X01BVENIIHJvdXRlLCBhbmQgcG11X2N0cl93cml0ZV9odygpIHN0aWxsIGhhcyBubyBndWFyZCBv
ZiBpdHMgb3duLgoKVGhhbmtzLApTZWJhc3RpYW4KCgpFbCBtacOpLCAxNCBvY3QgMjAyNiBhIGxh
cyAzOjAyLCBQZW5ncGVuZyBIb3UgKDxocHBpc2Nhc0AxNjMuY29tPikgZXNjcmliacOzOgo+Cj4g
SGkgU2ViYXN0aWFuLAo+Cj4gVGhhbmtzIGZvciB0ZXN0aW5nIGJvdGggZGlyZWN0aW9ucyBhbmQg
Zm9yIHRoZSBUZXN0ZWQtYnkuCj4KPiBZZXMsIGN0cl9pZHggLSBudW1faHdfY3RycyBpcyBldmFs
dWF0ZWQgYXMgdW5zaWduZWQgYW5kIHdyYXBzOyBpdCBkb2VzCj4gbm90IHByb2R1Y2UgYSBuZWdh
dGl2ZSBhcnJheSBpbmRleC4gVGhlIGNsYXNzIGNoZWNrIHJlamVjdHMgZWl0aGVyCj4gbWlzbWF0
Y2ggYmVmb3JlIGl0IHJlYWNoZXMgdGhlIGNvdW50ZXItc3BlY2lmaWMgb3BlcmF0aW9ucy4KPgo+
IFRoYW5rcywKPiBQZW5ncGVuZwo+CgoKLS0gClNlYmFzdGnDoW4gQWxiYQoKLS0gCm9wZW5zYmkg
bWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
