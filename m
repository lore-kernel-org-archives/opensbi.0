Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F2811125854
	for <opensbi@archiver.kernel.org>; Wed, 11 Mar 2026 17:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fb8ymIMVUQyLpe/8/uI/0e/7g5Jty16Pk11fKahmGOU=; b=CD+3OAOi63RLg6
	9lel4eNL4MdCtCJ2vbQzelmgbfUupblnQkN2kceKlU6VqmWZG1Z2IbPJMqll6/so1uKuWZk79oHs5
	h9opT6t7bfXJND3t7VKwEhmbF3iC61jX9hkgwdv8Y5Ud27ETRz6UZgpUhj8qS6t5wqsDy+ot5R9R+
	11+6rfa+WqJ1DWN2na6A/WArLgJLyTSDWTYCSZ3kHiYD4wT5M1OOYYHWXlueJxH1SEOHJ6aF9sNn6
	xmpMpslQL4UHEhDbT4qr05T9JwY10ddxO/CprZWqD7DUcTwF3zpPvoodtNx1yhVjn0DS/7BwzaaiJ
	PCqmMMcK6OYQo0tIYwSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0N5T-0000000C03L-3lgr;
	Wed, 11 Mar 2026 17:11:11 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0N5S-0000000C032-0C6O
	for opensbi@lists.infradead.org;
	Wed, 11 Mar 2026 17:11:11 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-48538c5956bso1534365e9.0
        for <opensbi@lists.infradead.org>; Wed, 11 Mar 2026 10:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1773249066; x=1773853866; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gq+Z5qXCwK5afMqQ4U+xO4r+MxpghLKPHpgf7ljLA7w=;
        b=aFoLHqH+5QcJCSwZPw7Te8InY50MeTyFR+wCvbmAm9f6LhECtlBTGt2LiEEwbhL9Kg
         ORNORNJYAeja5IYUZFIQIuFpKhinh2m3uRUeSqETX7UpB9zKfMT/EWAFDYB3LgNgU18o
         OcSzMDaYUjBTRHdWLGZR7XqaP2OM6DFZmjb8cWxvbxcttHzSP3vITx13mJgCODu9jTW3
         m6b34DbWN0RoqUebr+VD/7+qhZAkqqqYh2Oy35GKsXllD/kLhqLIWMorHxSuercsJDH+
         OILJZeIfKYq1INFibDboTcGrZR6NpGePRhA15m1z/PqF3HZKjX2zox0RKVHvV1ocXCVA
         Hn+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773249066; x=1773853866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gq+Z5qXCwK5afMqQ4U+xO4r+MxpghLKPHpgf7ljLA7w=;
        b=cKAKwWzTe/m89MvRRZr3XkWSnoRW9cKAgK4d5Y/KQbiAXOcTYiJvxS8QCwdCLHCqrC
         23JMLF5IPJ1R7+xpKzF8vSpK70FJ0zaCERe5jSMUjS2Druv+NSn9F3ZiF8qTYej+k5Ca
         alO+3hb6noh/xgGTa9MhWkSUbQab4vujhJ9I2iuhx3S7i13uMUOacUKvxib1oJsPNC/N
         g5z+jsalq5l6xmcUDqt762V4vROmlJgrDJs6R44S67MPQf6T0i7KKjP0ac7/Ejp6jad8
         nQVDwBy/mTEYOzB+zITKgW9fp8w+390UTaxlxJQsjHE89UMyznt1Ask2vy0ypvXALkrk
         MdxA==
X-Gm-Message-State: AOJu0Yww27/4aFRBHnXmRpMMvZJbvcxqRNxuywg3+7A4L7blZQyJudvt
	tgLV0tQfBFmCjeyBzmAp5X2fA7gWsw/BopFTBNNTjADXvYmmE0JgLv3Bgpks4qS1Fr9LH6YSNNg
	wgllY
X-Gm-Gg: ATEYQzw5WC+eAbvcWMZKT75R8G8/2O37wxf/kQG6LbQvukzlrV+EcUD3lpUAqsH7A9c
	Bjm2XTRcBuj5XiJsZOjG+DNHi63FVRFU97WNxblfkJ18xKUXe/w9JGZeXZU/CE6WgmArOl9FhTV
	K2357q6Y3RS/r/RyRL7XNRLgBR30VYdDhu825Y1tKC6GCkZGBe29AG0ZdttCZ2aAJUHNceuUmMw
	1pygnxYB8oiJPZrESHOJKduizxf+3mNltWQqhEvhoQx+JknPyiCAPaokBm5DSTupa2F4b1yARv8
	LqCTxzbwE6KKYB9NU+38yMRELz6nPD/2It7eXVC5j6ekq8PwdbsATAfTQ5WLCxLFrXzodp7RfXN
	mG0+JFE7zCOgaJDzq027NyZ+FXUgAlRw1Hd2RUTqFcCd3iuXwfxrF1Y2F6Nk73VT1Z3kXDDHBsP
	8AoB1xW8R6nju4xaOwLI7pKOSHl5f43+iFZ2gU7MPi9m+rerVPQLiJDG0HtNK1u1m6WXMJhtPkL
	u/N9w==
X-Received: by 2002:a05:600c:a086:b0:483:6d9e:e4f5 with SMTP id 5b1f17b1804b1-4854f578e52mr6963285e9.5.1773249065972;
        Wed, 11 Mar 2026 10:11:05 -0700 (PDT)
Received: from Dev-EliteBook.Home (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b5e912fsm164620025e9.2.2026.03.11.10.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 10:11:05 -0700 (PDT)
From: dave.patel@riscstar.com
To: opensbi@lists.infradead.org
Cc: Scott Bambrough <scott@riscstar.com>,
	Robin Randhawa <robin.randhawa@sifive.com>,
	Anup Patel <anup.patel@qti.qualcomm.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Dave Patel <dave.patel@riscstar.com>,
	Ray Mao <raymond.mao@riscstar.com>,
	Anup Patel <anuppate@qti.qualcomm.com>,
	Dhaval <dhaval@rivosinc.com>,
	Peter Lin <peter.lin@sifive.com>
Subject: [RFC] OpenSBI: Lazy floating-point and vector context switching
Date: Wed, 11 Mar 2026 17:11:03 +0000
Message-ID: <20260311171103.70074-1-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_101110_359672_C5196F4E 
X-CRM114-Status: UNSURE (   9.89  )
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

SGkgT3BlblNCSSBtYWludGFpbmVycyBhbmQgY29tbXVuaXR5LAoKSSBhbSB3b3JraW5nIG9uIGFu
IGltcGxlbWVudGF0aW9uIHRvIHN1cHBvcnQgZmxvYXRpbmctcG9pbnQgKEZQKSBhbmQKdmVjdG9y
IHJlZ2lzdGVyIGNvbnRleHQgbWFuYWdlbWVudCBkdXJpbmcgZG9tYWluIGFuZCBhcHBsaWNhdGlv
bgpjb250ZXh0IHN3aXRjaGVzIGluIE9wZW5TQkkuCgpDdXJyZW50bHksIE9wZW5TQkkgc2F2ZXMg
YW5kIHJlc3RvcmVzIG9ubHkgdGhlIGludGVnZXIgcmVnaXN0ZXIKY29udGV4dCB3aGVuIGhhbmRs
aW5nIHRyYXBzIG9yIGRvbWFpbiB0cmFuc2l0aW9ucy4gVGhlIEZQIHJlZ2lzdGVycwooZjDigJNm
MzEpIGFuZCB2ZWN0b3IgcmVnaXN0ZXJzICh2MOKAk3YzMSkgYXJlIG5vdCBjdXJyZW50bHkgbWFu
YWdlZCBieQpPcGVuU0JJLgoKV2l0aCBpbmNyZWFzaW5nIGFkb3B0aW9uIG9mIHRoZSBSSVNDLVYg
dmVjdG9yIGV4dGVuc2lvbiBhbmQKZmxvYXRpbmctcG9pbnQgd29ya2xvYWRzLCBpdCBiZWNvbWVz
IGltcG9ydGFudCB0byBlbnN1cmUgY29ycmVjdApiZWhhdmlvciB3aGVuIFMtbW9kZSBzb2Z0d2Fy
ZSBvciB0cnVzdGVkIGFwcGxpY2F0aW9ucyB1c2UgdGhlc2UKZXhlY3V0aW9uIHVuaXRzLgoKVGhp
cyBlbWFpbCBwcm9wb3NlcyBhbiBhcHByb2FjaCB0byBzdXBwb3J0IGxhenkgRlAgYW5kIHZlY3Rv
cgpjb250ZXh0IHN3aXRjaGluZywgYWxpZ25lZCB3aXRoIHRoZSBtZWNoYW5pc20gZGVzY3JpYmVk
IGluIHRoZQpSSVNDLVYgcHJpdmlsZWdlZCBzcGVjaWZpY2F0aW9uLgoKLS0tCgojIyBCYWNrZ3Jv
dW5kCgpJbiBSSVNDLVYsIHRoZSBgRlNgIChGbG9hdGluZy1wb2ludCBTdGF0ZSkgYW5kIGBWU2Ag
KFZlY3RvciBTdGF0ZSkKZmllbGRzIGluIGBtc3RhdHVzYCAvIGBzc3RhdHVzYCBjb250cm9sIGFj
Y2VzcyB0byB0aGUgZmxvYXRpbmctcG9pbnQKYW5kIHZlY3RvciB1bml0cy4KCldoZW4gdGhlc2Ug
ZmllbGRzIGFyZSBzZXQgdG8gYE9mZmAsIGFueSBhdHRlbXB0IHRvIGV4ZWN1dGUgRlAgb3IKdmVj
dG9yIGluc3RydWN0aW9ucyByZXN1bHRzIGluIGFuIGlsbGVnYWwgaW5zdHJ1Y3Rpb24gdHJhcC4K
ClRoaXMgbWVjaGFuaXNtIGFsbG93cyBvcGVyYXRpbmcgc3lzdGVtcyBhbmQgZmlybXdhcmUgdG8g
aW1wbGVtZW50CmxhenkgY29udGV4dCBzd2l0Y2hpbmcgd2hlcmUgRlAvdmVjdG9yIHJlZ2lzdGVy
cyBhcmUgc2F2ZWQgb3IKcmVzdG9yZWQgb25seSB3aGVuIHRoZXkgYXJlIGFjdHVhbGx5IHVzZWQu
CgotLS0KCiMjIFByb3Bvc2VkIERlc2lnbgoKVGhlIGRlc2lnbiBzZXBhcmF0ZXMgcmVzcG9uc2li
aWxpdGllcyBiZXR3ZWVuIE9wZW5TQkkgYW5kIFMtbW9kZQpzb2Z0d2FyZS4KCjEuIE9wZW5TQkkg
KE0tbW9kZSByZXNwb25zaWJpbGl0aWVzKQoKICAgKiBEZXRlY3QgRlAgb3IgdmVjdG9yIGluc3Ry
dWN0aW9uIHRyYXBzLgogICAqIEVuYWJsZSB0aGUgY29ycmVzcG9uZGluZyB1bml0IGJ5IHVwZGF0
aW5nIGBGU2Agb3IgYFZTYC4KICAgKiBSZXR1cm4gY29udHJvbCB0byBTLW1vZGUgc28gdGhlIGlu
c3RydWN0aW9uIGNhbiBiZSByZXRyaWVkLgoKICAgRHVyaW5nIGRvbWFpbiBjb250ZXh0IHN3aXRj
aGVzOgoKICAgKiBJZiBgRlMgPT0gRGlydHlgLCBzYXZlIGZsb2F0aW5nLXBvaW50IHN0YXRlCiAg
ICAgKGYw4oCTZjMxLCBmY3NyKS4KICAgKiBJZiBgVlMgPT0gRGlydHlgLCBzYXZlIHZlY3RvciBz
dGF0ZQogICAgICh2MOKAk3YzMSwgdmwsIHZ0eXBlLCB2Y3NyKS4KICAgKiBJZiB0aGUgc3RhdGUg
aXMgQ2xlYW4sIEluaXRpYWwsIG9yIE9mZiwgc2tpcCBzYXZpbmcuCgoyLiBTLW1vZGUgcmVzcG9u
c2liaWxpdGllcwoKICAgKiBNYW5hZ2UgRlAvdmVjdG9yIHJlZ2lzdGVyIGNvbnRleHQgZm9yIHRh
c2tzLgogICAqIFJlc3RvcmUgc3RhdGUgd2hlbiB0aGUgdGFzayByZXN1bWVzIGV4ZWN1dGlvbi4K
Ci0tLQoKIyMgVHJhcCBIYW5kbGluZyBPdmVydmlldwoKYGBgCiAgICAgICAgICAgICstLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tKwogICAgICAgICAgICB8ICAgICAgICBTLW1vZGUgQXBwICAg
ICAgICAgIHwKICAgICAgICAgICAgfCAgUEMsIEdQUnMsIEZQL1ZTIHJlZ2lzdGVycyB8CiAgICAg
ICAgICAgICstLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tKwogICAgICAgICAgICAgICAgICAg
ICAgICAgIHwKICAgICAgICAgICAgICAgICAgICAgICAgICB8IFRyYXAgLyBJbnRlcnJ1cHQKICAg
ICAgICAgICAgICAgICAgICAgICAgICB2CiAgICAgICAgICAgICstLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tKwogICAgICAgICAgICB8ICAgICAgICAgIE0tbW9kZSAgICAgICAgICAgIHwKICAg
ICAgICAgICAgfCAgICAgIFRyYXAgSGFuZGxlciBFbnRyeSAgICB8CiAgICAgICAgICAgICstLS0t
LS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tKwogICAgICAgICAgICAgICAgICAgICAgICAgIHwKICAg
ICAgICAgICAgQ2hlY2sgbXN0YXR1cy5GUyAvIFZTIHN0YXRlCiAgICAgICAgICAgICAgICB8ICAg
ICAgICAgICAgICAgICAgICAgfAogICAgICAgICAgICBEaXJ0eSA9IFllcyAgICAgICAgICAgRGly
dHkgPSBObwogICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgIHwKICAgICAgIFNh
dmUgRlAvVlMgcmVnaXN0ZXJzICAgICAgIFNraXAgc2F2ZQogICAgICAgICAgICAgICAgfAogICAg
ICAgICAgICAgICAgdgogICAgICAgIEhhbmRsZSB0cmFwIGluIE0tbW9kZQogICAgICAgICAgICAg
ICAgfAogICAgICAgICAgICAgICAgdgogICAgICAgICAgIEJlZm9yZSBtcmV0CiAgICAgICAgICAg
ICAgICB8CiAgICAgICBSZXN0b3JlIHJlZ2lzdGVycyBpZiBzYXZlZAogICAgICAgICAgICAgICAg
fAogICAgICAgICAgICAgICAgdgogICAgICAgICAgICAgRXhlY3V0ZSBtcmV0CiAgICAgICAgICAg
ICAgICB8CiAgICAgICAgICAgICAgICB2CiAgICAgICAgICAgIFJlc3VtZSBTLW1vZGUKYGBgCgot
LS0KCiMjIEV4ZWN1dGlvbiBGbG93CgoxLiBTY2hlZHVsZXIgcGVyZm9ybXMgYSBjb250ZXh0IHN3
aXRjaCBhbmQgY2xlYXJzIGBGU2AgYW5kIGBWU2AuCjIuIEEgdGhyZWFkIGV4ZWN1dGVzIGFuIEZQ
IG9yIHZlY3RvciBpbnN0cnVjdGlvbi4KMy4gSGFyZHdhcmUgZ2VuZXJhdGVzIGFuIGlsbGVnYWwg
aW5zdHJ1Y3Rpb24gdHJhcC4KNC4gT3BlblNCSSBkZXRlY3RzIHRoZSBpbnN0cnVjdGlvbiBjbGFz
cyBhbmQgZW5hYmxlcyB0aGUgdW5pdC4KNS4gQ29udHJvbCByZXR1cm5zIHRvIFMtbW9kZS4KNi4g
VGhlIGluc3RydWN0aW9uIGlzIHJldHJpZWQgc3VjY2Vzc2Z1bGx5LgoKVGhpcyBhcHByb2FjaCBh
dm9pZHMgc2F2aW5nIGxhcmdlIEZQL3ZlY3RvciByZWdpc3RlciBmaWxlcyBkdXJpbmcKZXZlcnkg
Y29udGV4dCBzd2l0Y2gsIGltcHJvdmluZyBwZXJmb3JtYW5jZS4KCi0tLQoKIyMgSW1wbGVtZW50
YXRpb24gT3V0bGluZQoKVGhlIGltcGxlbWVudGF0aW9uIGluY2x1ZGVzOgoKKiBJbnN0cnVjdGlv
biBkZWNvZGluZyBpbiB0aGUgaWxsZWdhbCBpbnN0cnVjdGlvbiBoYW5kbGVyIHRvIGRldGVjdAog
IEZQIGluc3RydWN0aW9ucyAob3Bjb2RlcyAweDUzLCAweDA3LCAweDI3KSBhbmQgdmVjdG9yIGlu
c3RydWN0aW9ucwogIChvcGNvZGUgMHg1NykuCiogSGVscGVyIHJvdXRpbmVzIGluIE9wZW5TQkkg
dG8gZW5hYmxlIEZQIG9yIHZlY3RvciBleGVjdXRpb24gYnkKICB1cGRhdGluZyBgbXN0YXR1c2Au
CiogUy1tb2RlIHJ1bnRpbWUgY29kZSB0byBzdG9yZSBhbmQgcmVzdG9yZSBGUC92ZWN0b3IgY29u
dGV4dHMuCiogQmFyZS1tZXRhbCB0ZXN0cyB2YWxpZGF0aW5nIGxhenkgcmVzdG9yZSBiZWhhdmlv
ci4KCi0tLQoKIyMgVGVzdGluZwoKSW5pdGlhbCB0ZXN0aW5nIGlzIHBsYW5uZWQgdXNpbmcgUUVN
VSB3aXRoIHZlY3RvciBleHRlbnNpb24gc3VwcG9ydAoocnY2NGdjdikuCgpUaGUgdGVzdCBlbnZp
cm9ubWVudCBjb250YWlucyB0d28gUy1tb2RlIHdvcmtsb2FkczoKCjEuIEZsb2F0aW5nLXBvaW50
IHByb2Nlc3NpbmcKMi4gVmVjdG9yIHByb2Nlc3NpbmcKCkV4cGVjdGVkIGJlaGF2aW9yOgoKKiBU
aGUgZmlyc3QgRlAvdmVjdG9yIGluc3RydWN0aW9uIHRyaWdnZXJzIGEgdHJhcC4KKiBPcGVuU0JJ
IGVuYWJsZXMgdGhlIGNvcnJlc3BvbmRpbmcgdW5pdC4KKiBTdWJzZXF1ZW50IGluc3RydWN0aW9u
cyBleGVjdXRlIG5vcm1hbGx5LgoqIERvbWFpbiBjb250ZXh0IHN3aXRjaGVzIHNhdmUvcmVzdG9y
ZSBGUC92ZWN0b3IgcmVnaXN0ZXJzIHdoZW4KICByZXF1aXJlZC4KCi0tLQoKIyMgUmVxdWVzdCBm
b3IgRmVlZGJhY2sKCkkgd291bGQgYXBwcmVjaWF0ZSBmZWVkYmFjayBvbjoKCiogUHJlZmVycmVk
IGxvY2F0aW9uIHdpdGhpbiB0aGUgT3BlblNCSSB0cmFwIGZyYW1ld29yayBmb3IKICBpbnN0cnVj
dGlvbiBjbGFzc2lmaWNhdGlvbi4KKiBBbnkgZXhpc3Rpbmcgd29yayByZWxhdGVkIHRvIEZQL3Zl
Y3RvciBjb250ZXh0IG1hbmFnZW1lbnQgdGhhdAogIHNob3VsZCBiZSByZWZlcmVuY2VkLgoKSWYg
dGhlcmUgaXMgaW50ZXJlc3QsIEkgY2FuIGZvbGxvdyB1cCB3aXRoIGFuIFJGQyBwYXRjaCBzZXJp
ZXMKaW1wbGVtZW50aW5nIHRoaXMgbWVjaGFuaXNtIGFsb25nIHdpdGggdGVzdCBpbmZyYXN0cnVj
dHVyZS4KClRoYW5rcyBmb3IgeW91ciB0aW1lIGFuZCBmZWVkYmFjay4KCkJlc3QgcmVnYXJkcywK
RGF2ZSBQYXRlbAoKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVu
c2JpCg==
