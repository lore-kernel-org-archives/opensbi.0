Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48A410A1E82
	for <opensbi@archiver.kernel.org>; Thu, 26 Mar 2026 11:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cU8YSL1OIv/tyw+nBUIIQjO+YYMcy6Qdr6iYs42ieQY=; b=sXZk3QG0BUXfTz
	Y4QOmwWllxEOwya4BF8+823Adw6enpdeHRthZGo8tTf9EAigXhI8QezzqLpVUQfON9AjLsfjc8pL/
	s062d3Kv8N6ICmz0rd8EybniCTFjHQPGw8SM5DsbS8wxO1LPeCgWUCev6gptlt85vX8uDIJi232Ft
	/03q5zpW5yMvsSlvFO3eleCV89Oca61fYVXMihSoIdh1ZzxNDJOh0NgU1U+SAhrZgjZyQiBkd64zP
	Un2EpZ0g/Ox59BVYfm7qKklH6CiUiAdRXi/Rhu6CM444VtQ/Bw+Ri2EIf5xKccvUYDKmx+ApagW2w
	9aKYQB6P/XSL94s+iTSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5jJv-00000005O10-0ORS;
	Thu, 26 Mar 2026 11:56:15 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5jJq-00000005Nze-2I5F
	for opensbi@lists.infradead.org;
	Thu, 26 Mar 2026 11:56:11 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-486fc4725f0so7693935e9.1
        for <opensbi@lists.infradead.org>; Thu, 26 Mar 2026 04:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1774526168; x=1775130968; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rf9MF9MK9aXjzq/caiURCmxXQOYsQlXJbVNlxF+FtPA=;
        b=IFM4d8KOuExcTQfeRKZJ86tvXXp41enEUmWVg+bD1TWTzuBE291nBQ+T80Zk0uxQJ2
         OOdr7/YO/vbgi3AxzUEYknBBTH4CUqiZ54+OcaFiH53ECnwthfmaEmE1JtZpxHu/yU2b
         9HxgE8GyZLxUG7OvIDstsRQ0LHTq4E6guokZUXsktU2/tU+H26VCq6ffS8m/xpu+nveu
         DGlmStJWjcSB8g6NarbOMfEQPx6kuy3lTqMXnp2kTCfc32a8ylncuWSg8SkOYFeyyCdr
         Z3UuCOWynnBVq951L2BBr/UAlqFrg196eL2jEe/gOyAZ5OFjjbWIyqXjwrx8ngnXQy0W
         PbAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774526168; x=1775130968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rf9MF9MK9aXjzq/caiURCmxXQOYsQlXJbVNlxF+FtPA=;
        b=fueub0iOKLS+Cxx4EBeVIsd99uRQdFo1K1teJjCII97k9UuwXLPbdMh1fiLm6Y4qes
         AQ00bAAXLO8MC46biHeQNzUhoWP/6hXElShrvfz3Wk4esrZRojTqecRmlKZNnvPWVW2f
         sCH36FwmBWM/S9AlhkKGAnsSJnNd/uObv34SLBJUFkUwHAmmJ5Np1N8+xGRplHowAbG1
         QCSrx0XD6TDO/8Tsn0DkB53KR1E/cMMhJCUs4NFWLRGpxelxWGb27Rk1uo0/aQDvc0JV
         +3VzMc3ER7qSEf3dozh3mm7qWdS+2AJ91RAJHvsh3UqVpDRCE335nwKbJY+Q2Xlsc6WM
         yYgw==
X-Forwarded-Encrypted: i=1; AJvYcCWaRyVQXUKv4KiBb1GJw8bwQF0Vvz+tj4S+RJ6SmMmP/D6u18FB73owuSRYUWCu9snaCFeHciuV@lists.infradead.org
X-Gm-Message-State: AOJu0Ywi7cl37NLSz6qaPx5LmHAUnFaUeoZbTX/kWf3WEY1MhlDSjKTf
	fCFEApg3lP5GhlW87K1Aja9j4GDrU4z4xwaVFzc+1tCoZzyrGj99TVdSNp9UrL1Yez0=
X-Gm-Gg: ATEYQzypUycfTYFC3nGCe/TqCky3mu4EV7UWTs+Ih1WxOPaFYs48JK9yzdSTncLuQg6
	k7TBEqxyAQPmP+XstFX+jFpzJYzacUsyQ5jp9Fn5tbC8mwzu/g4c8cZaDoJ2ez2BmBSM+0Ye4qa
	jVN4/hs7os6bXKC+MmmPJOu0ps6ayWvosy6leNu9iY3RUhDK30ppZheR7ZXf1O0SQ8YiBUQL1br
	t6sx4YX0N97ixPIL6tk8ZcsjsgUhwDMUijcXHyyTVR6eCg2qi6QYpTAI0KabfGGApcQpkOHX9Aq
	y0Oz5nRmx6sDyFXfMm+r9OtQR5ADhA2VxQCjwAW5bTj0gmcd1pEZXGnUZdUY0kWjNzG8GZtkOZd
	CDePi1yJkcjLCdEoAx4a2G9qu7T3tiVUbZiJmuki4reqaSvA1aDttfiCi+DU/9o9dki/HDhBvss
	TR2RQjVVr+TDTiCfbduXuzdMfH8ACueQFexKo6cQ==
X-Received: by 2002:a05:600c:638e:b0:485:3c09:843 with SMTP id 5b1f17b1804b1-48722be44b4mr31473055e9.9.1774526167831;
        Thu, 26 Mar 2026 04:56:07 -0700 (PDT)
Received: from localhost.localdomain ([78.41.211.48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9194311asm8932438f8f.10.2026.03.26.04.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 04:56:07 -0700 (PDT)
From: dave.patel@riscstar.com
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Scott Bambrough <scott@riscstar.com>,
	Robin Randhawa <robin.randhawa@sifive.com>,
	Anup Patel <anup.patel@qti.qualcomm.com>,
	Dave Patel <dave.patel@riscstar.com>,
	Ray Mao <raymond.mao@riscstar.com>,
	Anup Patel <anuppate@qti.qualcomm.com>,
	Dhaval <dhaval@rivosinc.com>,
	Peter Lin <peter.lin@sifive.com>,
	opensbi@lists.infradead.org
Subject: [PATCH v2 0/3] Add eager FP and RISC-V vector context switching support
Date: Thu, 26 Mar 2026 11:55:14 +0000
Message-ID: <20260326115517.2156-1-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_045610_740784_04511BAC 
X-CRM114-Status: GOOD (  10.84  )
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

SGkgU2FtdWVsIGV0LiBhbCwKClRoYW5rcyB5b3UgZm9yIHRoZSBpbml0aWFsIHJldmlldyBhbmQg
c3VwcG9ydCwgc2VuZGluZyBvdXQgdjIgc2V0IG9mIHBhdGNoIHRvIGdhdGhlcgptb3JlIGNvbnNl
bnN1cywgY3VycmVudGx5IHRoZSBjb250ZXh0IHN3aXRjaCBpdHNlbGYgaW4gT3BlbnNiaSBpcyBu
b3QgYmVpbmcgaG9va2VkIHVwLgoKVGhpcyBzZXJpZXMgZW5oYW5jZXMgT3BlblNCSSBkb21haW4g
Y29udGV4dCBzd2l0Y2hpbmcgdG8gcHJvcGVybHkgc2F2ZSBhbmQgcmVzdG9yZQpmbG9hdGluZy1w
b2ludCAoRlApIGFuZCB2ZWN0b3IgKFYpIHJlZ2lzdGVycyBvbiBtdWx0aS1kb21haW4gc3lzdGVt
cy4KClRoZSBjb250ZXh0IHN3aXRjaCBoYXMgbm93IGJlZW4gY29ycmVjdGVkIHRvIHRoZSBkb21h
aW4gY29udGV4dCBzd2l0Y2ggaW5zdGVhZCBvZgp0cmFwIGhhbmRsZXI7IHRoZXJlIGlzIG1vcmUg
dW5kZXJzdGFuZGluZyBvZiBob3cgdGhlIG9uZSBPUyBjYW4gY29udGV4dCBzd2l0Y2ggdG8KYW5v
dGhlciBPUyBmb3IgZWcuIFJpY2ggT1Mgd2l0aCBTZWN1cmUgT1MgdXNpbmcgT3BlbnNiaSBhcyBt
b25pdG9yIGFuZCB0aGF0IGNvbnRleHQKbmVlZHMgc2F2aW5nIGJldHdlZW4gdGhlIGRvbWFpbiBz
d2l0Y2guCgpUaGlzIGVhZ2VyIGNvbnRleHQgc3dpdGNoaW5nIGFwcHJvYWNoIGlzIG1vcmUgZWZm
aWNpZW50IGFzIGFuIGFsdGVybmF0aXZlIHRvIGxhenkKY29udGV4dCBzd2l0Y2ggd2hpY2ggY2Fu
bm90IGJlIHVzZWQgZHVlIHRvIGl0cyBsaW1pdGF0aW9uIGFuZCBpcyBtb3JlIGVmZmljaWVudAp0
byBvbmx5IHN0b3JlIGFuZCByZXN0b3JlIG9uIGRvbWFpbiBjb250ZXh0IHN3aXRjaC4KClRoaXMg
My1wYXRjaCBzZXJpZXMgaW50cm9kdWNlczoKCjEuICoqUEFUQ0ggMS8zIOKAkyBEb21haW4gZGF0
YSBzdHJ1Y3R1cmUgZW5oYW5jZW1lbnRzIGZvciBWZWN0b3IgdW5pdCoqCiAgIC0gQWRkcyBkb21h
aW4gcG9pbnRlcnMgZm9yIFZlY3RvciAoYHZlY19jdHhgKSBjb250ZXh0cy4KICAgLSBQcmVwYXJl
cyB0aGUgZG9tYWluIHN0cnVjdHVyZSBmb3Igc3RvcmluZyBpc29sYXRlZCB2ZWN0b3Igc3RhdGUu
CiAgIC0gRml4aW5nIGNvbXBpbGF0aW9uIHdpdGhpbiBlYWNoIHNldCBvZiBwYXRjaAogICAtIEZp
eGVkIGFsbCB0aGUgYXNzdW1wdGlvbnMKCQktLSAgYWRkZWQgdnN0YXJ0IENTUiBhc3dlbGwgZm9y
IGNvbnRleHQgc3dpdGNoaW5nLgoJCS0tICBoYW5kbGVkIGNvbmZpZyBiYXNlZCBTQklfTUFYX1ZM
RU5CLgoJCS0tICBGaXhlZCB2ZWN0b3Igc3VwcG9ydCBmb3IgWnZlMzJ4CgoyLiAqKlBBVENIIDIv
MyDigJMgRlAgYW5kIFZlY3RvciBkb21haW4gaW5pdC9leGl0IHJvdXRpbmVzKioKICAgLSBBZGRz
IGRvbWFpbiBwb2ludGVycyBmb3IgRlAgKGBmcF9jdHhgKSBjb250ZXh0cy4KICAgLSBQcmVwYXJl
cyB0aGUgZG9tYWluIHN0cnVjdHVyZSBmb3Igc3RvcmluZyBpc29sYXRlZCB2ZWN0b3Igc3RhdGUu
CiAgIC0gRml4aW5nIGNvbXBpbGF0aW9uIHdpdGhpbiB0aGUgcGF0Y2ggYW5kIGlzc3VlIHNlZW4g
aW4gdjEgc2VyaWVzLgogICAtIEZpeGVkIGFsbCB0aGUgYXNzdW1wdGlvbnMKCQktLSBhZGRlZCBz
dXBwb3J0IGZvciBib3RoIDY0IGFuZCAzMiBiaXQgRlAKCQktLSBhZGRlZCBzdXBwb3J0IGZvciBk
b3VibGUgYW5kIHNpbmdsZSBwcmVjaXNpb24gc3VwcG9ydC4KCQktLSBTdXBwb3J0IGZvciBjb3Jy
ZWN0IGNvbnRleHQgZm9yIFp2ZTMyeC4KCQktLSByZW1vdmVkIGRlcGVuZGVuY2llcyBvbiBQTEFU
Rk9STV9SSVNDVl9JU0E9cnY2NGdjdgoKMy4gKipQQVRDSCAzLzMg4oCTIERvbWFpbiBjb250ZXh0
IHN3aXRjaCB1cGRhdGVzKioKICAgLSBVcGRhdGVzIGBzd2l0Y2hfdG9fbmV4dF9kb21haW5fY29u
dGV4dCgpYCB0byBzYXZlIGFuZCByZXN0b3JlIEZQIGFuZCB2ZWN0b3IKICAgICByZWdpc3RlcnMu
CiAgIC0gSW1wbGVtZW50cyBgc2JpX2ZwX2RvbWFpbl9pbml0L2V4aXRgIGFuZCBgc2JpX3ZlY3Rv
cl9kb21haW5faW5pdC9leGl0YC4KICAgLSBJbml0aWFsaXplcyBGUC92ZWN0b3IgY29udGV4dHMg
ZHVyaW5nIGRvbWFpbiByZWdpc3RyYXRpb24uCiAgIC0gQ2xlYW5zIHVwIGNvbnRleHQgbWVtb3J5
IGR1cmluZyBzaHV0ZG93bi4KICAgLSBQcm92aWRlcyBzYWZlIG5vLW9wIHZlcnNpb25zIGZvciBo
YXJ0cyB3aXRob3V0IEZQIG9yIHZlY3RvciBleHRlbnNpb25zLgogICAtIEVuc3VyZXMgRlMgYW5k
IFZTIGluIGBtc3RhdHVzYCBhcmUgZW5hYmxlZCBvbmx5IGlmIE9mZi4KICAgLSBQcmVzZXJ2ZXMg
b3JpZ2luYWwgYG1zdGF0dXNgIGFmdGVyIHJlc3RvcmluZyBGUC92ZWN0b3Igc3RhdGUuCiAgIC0g
V29ya3Mgc2FmZWx5IGV2ZW4gb24gaGFydHMgd2l0aG91dCBGUCBvciB2ZWN0b3Igc3VwcG9ydC4K
ClRvZ2V0aGVyLCB0aGVzZSBjaGFuZ2VzIGVuc3VyZSBwcm9wZXIgaXNvbGF0aW9uIG9mIEZQIGFu
ZCB2ZWN0b3IgcmVnaXN0ZXJzIGJldHdlZW4KZG9tYWlucywgZW5hYmxpbmcgcm9idXN0IG11bHRp
LWRvbWFpbiBvcGVyYXRpb24gb24gUklTQy1WIHN5c3RlbXMuCgpTaWduZWQtb2ZmLWJ5OiBEYXZl
IFBhdGVsIDxkYXZlLnBhdGVsQHJpc2NzdGFyLmNvbT4KCi0tIApvcGVuc2JpIG1haWxpbmcgbGlz
dApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
