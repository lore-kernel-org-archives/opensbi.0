Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FF7EF99CC
	for <opensbi@archiver.kernel.org>; Fri, 13 Feb 2026 19:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HUcqaQLVgBQ2l1IUsPC4GAs6omkXmCIk7aKEd3VG2RA=; b=bZM2nHnX3dqY5w
	e2/74Inrm83EQQ581cvBLv7i7f9Cd7gKwKyPKfHwcM0Je6BJ1NazKH7mxEPxKn9h5sBP+vOWSHF3j
	UGSl9T3tc48Yd8JX4lsrRl5vLY6zk+t6uKyLYoJwQVD7ksTJz1zWVgup/23jqbB2cbOT/bRypBDn9
	vBxUob0S2CZpokdSg+bLxTW5C+zxph/7iP+oQ0PgE5T+j4I77kP95nUDNcyZ9xyRkQkWTwQI7OnHa
	UJd10mTDdetyMkj9MebIP+VJOUoqtHK307nutTh4yKn85Zw6ItGHQOC2jhcmU5lQlHWR+2Xaod8mq
	Q/QmmVgolkLAimEHRZGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqyTU-00000003pBb-2X6R;
	Fri, 13 Feb 2026 19:05:08 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqyTS-00000003pAy-0RgA
	for opensbi@lists.infradead.org;
	Fri, 13 Feb 2026 19:05:07 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-506a7bbe9d0so8526321cf.0
        for <opensbi@lists.infradead.org>; Fri, 13 Feb 2026 11:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771009504; x=1771614304; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nAogf0Fm3ULW8wKb/+fMC6u1aNls6Rtf6I1dANetz5k=;
        b=dlpUbusRp9GMrtZ2f4dxwNuxkyTgPLqkNOqkQnhKRNhFdfvdocMR+gcZXnKLEI0rXX
         PCWnbGdMvl/z33aI+zazEVaM79MDuAM5X9eJuiDOSoTCbdNEKeSxxUdeuwxG7k/Z+0ql
         gdtob2enpdpaSsApENgQpa9z3cppv8XZZKCEQyIh+xLF0jH7mIiRyo/A2G5S2/Rq0LpN
         V7fSb71U8j7MUkHnSDlLMw/1ciIQ8UdgdWI9CXBMUhY8xg2nliC7AEUjyPbEx5j2vRRr
         OWAcFW7+RKB817SPbUaWS50X5R0+qQ6UAC0CRCg6goVWR4qL8d025sP25ifxf42RyXSX
         E71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771009504; x=1771614304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nAogf0Fm3ULW8wKb/+fMC6u1aNls6Rtf6I1dANetz5k=;
        b=VUAOM64ZUiGT8c5uKMcnzn6RWrhmRQtFrDCw12ycmTJrRLSTjFz7uLu5uNkKQ6AGRX
         RsI4oSdh9SwZowH7/d66q+S0xlI+IuSje8Di0AD7Pv4Ltu1e/PgUSmkq5hgchFRjeuEI
         g0BagjgyHVF+zHJOzy/qcbpD2PoVlDBgcdXEUb8bgzvG+yfAihuZkfz57UtbbHgIvgIK
         JlKO1qMHBvy/hOhtOp6tL+ysn70hPM07qhAUUc8lTLO+SYqS9jpGnb+hMOk1ufILAPL5
         dMJlOnwXZZ7eAdkPnAUOHoN3a3MAvaDZdFe6iuQIkGF35yAs6PSYRS6+LazS8Erj4+wF
         FoEQ==
X-Gm-Message-State: AOJu0YwMR8Lr+0Ifr4qmZkugp/hwbWICtLYL1pxddeBDrTadXbU0oKvK
	BaAbzBeaK6b77OWvDmBO8Hs4R8hqWNBB87+N4yme4ku17RWCxyykG4upNDzH/g==
X-Gm-Gg: AZuq6aKUJ7X+3pdQOshuscQIvapHGU+rbgJ3WDhfvuYvCCUEIpAi3ez3WGigFiE/tft
	NWAfJIhW9PA/RpITxfXgfA6ff3gie8yU9g37NVet8J1YRQtkzHha0KJ2tklzpb4ohbyFDBzxz0e
	ETI+XNEynJrUzkZucWLSrQfuT1sAxEXIFy8btd9bcfcthzSZYarEoYHEiXF5cUx3rjScONOWaoY
	qrcXbUFLCMP9BXtA3x42lmit6IgjQuGR20omPCR+DTQJtJDcBJD+ihQtRtBPpg36L9pzk7JG2Ng
	NWHWMo7fXf3dWGqsQ9X6qR1qDgja2GC9ThPIGVovxhfKm4huTbmtEvDdGbC/NLIbkb/Dsq/CBNt
	IXXy3LOF82nrwyyX/JyUdhEdYxFKGc+Fo3jyWCVFBycJ3vzdbdBB9/5VvlEkhYwuPQ388L+MKDa
	92GuKCWx1P0skBfL9iA7Ap6BHVdpRtnoncoxvXILv1uJ9t59xyaKbnvRaIbilT84RzdxxbJ06aW
	0XBFaKg2WE=
X-Received: by 2002:ac8:5a03:0:b0:4f3:5652:6743 with SMTP id d75a77b69052e-506a8319061mr37668731cf.39.1771009504012;
        Fri, 13 Feb 2026 11:05:04 -0800 (PST)
Received: from ubuntu.localdomain (174-138-202-16.cpe.distributel.net. [174.138.202.16])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cd8b1bfsm70420096d6.28.2026.02.13.11.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 11:05:03 -0800 (PST)
From: Raymond Mao <raymondmaoca@gmail.com>
To: opensbi@lists.infradead.org
Cc: scott@riscstar.com,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	anup.patel@qti.qualcomm.com,
	anuppate@qti.qualcomm.com,
	dhaval@rivosinc.com,
	peter.lin@sifive.com
Subject: [PATCH RFC 0/2] VIRQ (Virtual IRQ) layer to support paravirtual interrupt delivery
Date: Fri, 13 Feb 2026 14:04:56 -0500
Message-Id: <20260213190459.2540597-1-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_110506_183060_3EDD571F 
X-CRM114-Status: GOOD (  11.34  )
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

RnJvbTogUmF5bW9uZCBNYW8gPHJheW1vbmQubWFvQHJpc2NzdGFyLmNvbT4KClRoaXMgUkZDIHBy
b3Bvc2VzIGEgbGlnaHR3ZWlnaHQgVklSUSBjb3VyaWVyL3JvdXRpbmcgbGF5ZXIgZm9yCk9wZW5T
QkkgdG8gc3VwcG9ydCBwYXJhdmlydHVhbCAvIHRyYXAtbi1lbXVsYXRlIHN0eWxlIGludGVycnVw
dApkZWxpdmVyeSB0byBTLW1vZGUgcGF5bG9hZHMsIHdoaWxlIGtlZXBpbmcgaG9zdCBwaHlzaWNh
bCBpbnRlcnJ1cHRzCmhhbmRsZWQgaW4gTS1tb2RlLgoKIyBWSVJRIEhpZ2gtbGV2ZWwgZGVzaWdu
CgpBdCBhIGhpZ2gtbGV2ZWwgdGhlIFZJUlEgbGF5ZXIgaXMgY29tcG9zZWQgb2YgdGhyZWUgbWFq
b3IgcGFydHM6CgoxLiBWSVJRIG1hcHBpbmcgYW5kIGFsbG9jYXRpb24KICAgLSBQcm92aWRlIGEg
c3RhYmxlIG1hcHBpbmcgYmV0d2VlbiBhIGhvc3QgaW50ZXJydXB0IGVuZHBvaW50CiAgICAgKGNo
aXBfdWlkLCBod2lycSkgYW5kIGEgVklSUSBudW1iZXIuCiAgIC0gVklSUSBudW1iZXIgYWxsb2Nh
dGlvbiB1c2VzIGEgZ3Jvd2FibGUgYml0bWFwLgoKMi4gSFdJUlEtPkRvbWFpbiByb3V0ZSBydWxl
cwogICAtIFJvdXRlIHJ1bGVzIGFyZSBkZXNjcmliZWQgaW4gRGV2aWNlVHJlZSB1bmRlciB0aGUg
T3BlblNCSSBkb21haW4KICAgICBjb25maWd1cmF0aW9uIHVzaW5nOgogICAgICAgJ29wZW5zYmks
aG9zdC1pcnFzID0gPGZpcnN0X2h3aXJxIGNvdW50PiAuLi47JwogICAtIEVhY2ggPGZpcnN0X2h3
aXJxIGNvdW50PiBlbnRyeSBpcyBjb252ZXJ0ZWQgaW50byBhbiBpbnRlcm5hbAogICAgIGluY2x1
c2l2ZSByYW5nZSBbZmlyc3QgLi4gZmlyc3QrY291bnQtMV0gYW5kIGNhY2hlZCBhcyBhIHJvdXRl
CiAgICAgcnVsZS4KICAgLSBEZWZhdWx0IGJlaGF2aW9yOiBpZiBhbiBhc3NlcnRlZCBIV0lSUSBk
b2VzIG5vdCBtYXRjaCBhbnkgcm91dGUKICAgICBydWxlLCBpdCBpcyByb3V0ZWQgdG8gdGhlIHJv
b3QgZG9tYWluLgoKMy4gUGVyLShkb21haW4saGFydCkgcGVuZGluZyBxdWV1ZSBjb3VyaWVyaW5n
CgogICAtIEVhY2ggZG9tYWluIG1haW50YWlucyBhIHBlci1oYXJ0IHJpbmcgYnVmZmVyIHF1ZXVl
IG9mIHBlbmRpbmcKICAgICBWSVJRcy4KICAgLSBPbiBhbiBhc3NlcnRlZCBIV0lSUSwgdGhlIGNv
dXJpZXIgaGFuZGxlcjoKICAgICAgIG1hcHMgKGNoaXBfdWlkLGh3aXJxKSAtPiBWSVJROwogICAg
ICAgZmluZHMgZGVzdGluYXRpb24gZG9tYWluIHZpYSByb3V0ZSBydWxlczsKICAgICAgIG1hc2tz
IHRoZSBob3N0IEhXSVJRICh0byBhdm9pZCBsZXZlbC10cmlnZ2VyIHN0b3Jtcyk7CiAgICAgICBw
dXNoZXMgdGhlIFZJUlEgaW50byB0aGUgcGVyLShkb21haW4saGFydCkgcGVuZGluZyBxdWV1ZTsK
ICAgICAgIGluamVjdHMgYW4gU1NFIGV2ZW50IHRvIG5vdGlmeSB0aGUgZGVzdGluYXRpb24gUy1t
b2RlIHBheWxvYWQKICAgLSBJbiBTLW1vZGUsIHRoZSBwYXlsb2Fk4oCZcyBTU0UgdHJhcCBoYW5k
bGVyOgogICAgICAgaXNzdWVzIGFuIGVjYWxsIHRvIHBvcCBwZW5kaW5nIFZJUlEgZnJvbSB0aGUg
cGVyLWhhcnQgcXVldWU7CiAgICAgICBydW5zIGl0cyBJU1IgZm9yIHRoZSBkZXZpY2U7CiAgICAg
ICBpc3N1ZXMgYW4gZWNhbGwgdG8gY29tcGxldGUgdGhlIFZJUlEsIHdoaWNoIHVubWFza3MgdGhl
CiAgICAgICBjb3JyZXNwb25kaW5nIGhvc3QgSFdJUlEKCiMgVklSUSBFQ0FMTCBleHRlbnNpb24K
CkFkZCBhIHZlbmRvci1kZWZpbmVkIFNCSSBleHRlbnNpb24gZWNhbGwgZm9yIFZJUlEuClRoaXMg
YWxsb3dzIFMtbW9kZSBwYXlsb2FkIHRvIHBvcC9jb21wbGV0ZSB0aGUgbmV4dCBwZW5kaW5nIFZJ
UlEgaGFzCmNvdXJpZWQgaW50byB0aGUgY3VycmVudCBkb21haW4uCgojIFJlZmVyZW5jZSBEVCBv
dmVybGF5IGZvciBpbnRyb2R1Y2luZyB0aGUgcm91dGUgcnVsZXM6CgpBIHJlZmVyZW5jZSBEVCBv
dmVybGF5IGNhbiBiZSB1c2VkIHRvIGFkZCByb3V0ZSBydWxlcyB0byBhIGRvbWFpbgp1c2luZyAn
b3BlbnNiaSxob3N0LWlycXMnIHByb3BlcnR5LgoKRm9yIGV4YW1wbGUsIHRvIHJvdXRlIFVBUlQg
UlggSFdJUlEgMTAgdG8gZG9tYWluMToKYGBgCi8gewogIGZyYWdtZW50QDAgewogICAgdGFyZ2V0
LXBhdGggPSAiL2Nob3NlbiI7CiAgICBfX292ZXJsYXlfXyB7CiAgICAgIG9wZW5zYmktZG9tYWlu
cyB7CiAgICAgICAgY29tcGF0aWJsZSA9ICJvcGVuc2JpLGRvbWFpbixjb25maWciOwoKICAgICAg
ICBkb21haW4xOiBkb21haW4xIHsKICAgICAgICAgIGNvbXBhdGlibGUgPSAib3BlbnNiaSxkb21h
aW4saW5zdGFuY2UiOwogICAgICAgICAgcG9zc2libGUtaGFydHMgPSA8MHgxPjsgICAgICAvKiBj
cHUwICovCiAgICAgICAgICByZWdpb25zID0gPC4uLj47ICAgICAvKiBtaW5pbWFsIGV4ZWN1dGFi
bGUgKyBkZXZpY2UgTU1JTyAqLwogICAgICAgICAgb3BlbnNiaSxob3N0LWlycXMgPSA8MTAgMT47
IC8qIHJvdXRlIGh3aXJxIDEwIHRvIGRvbWFpbjEgKi8KICAgICAgICB9OwogICAgICB9OwogICAg
fTsKICB9Owp9OwpgYGAKQSBzYW1wbGUgRFQgb3ZlcmxheSBkdHMgZm9yIHJlZmVyZW5jZSBpcyBh
dHRhY2hlZCB0b2dldGhlciB3aXRoIHRoZQpSRkMuCgojIEJvb3QtdGltZSBhbmQgcnVudGltZSBm
bG93CgoxLiBDb2xkIGJvb3QgZmxvdyAoTS1tb2RlKToKICAgLSBEdXJpbmcgRkRUIGRvbWFpbiBw
YXJzaW5nLCBleHRyYWN0ICdvcGVuc2JpLGhvc3QtaXJxcycgZnJvbSBlYWNoCiAgICAgZG9tYWlu
IGluc3RhbmNlIGFuZCBjYWNoZSB0aGUgcm91dGUgcnVsZXMgaW4gVklSUSBsYXllci4KICAgLSBJ
bml0aWFsaXplIGhvc3QgaXJxY2hpcCBkcml2ZXJzIGFuZCByZWdpc3RlciB0aGUgVklSUSBjb3Vy
aWVyCiAgICAgaGFuZGxlci4KMi4gV2hlbiBhIGhvc3QgSFdJUlEgaXMgYXNzZXJ0ZWQgYW5kIHRy
YXBwZWQvaGFuZGxlZCBpbiBNLW1vZGUgYnkgdGhlCiAgIGhvc3QgaXJxY2hpcCBkcml2ZXIuCiAg
IC0gVGhlIGNvdXJpZXIgaGFuZGxlciBtYXBzIChjaGlwX3VpZCxod2lycSkgdG8gYSBzdGFibGUg
VklSUSBudW1iZXIuCiAgIC0gVGhlIGNvdXJpZXIgaGFuZGxlciByb3V0ZXMgdGhlIGludGVycnVw
dCB0byB0aGUgZGVzdGluYXRpb24KICAgICBkb21haW4gdXNpbmcgY2FjaGVkIHJvdXRlIHJ1bGVz
IChvciBkZWZhdWx0cyB0byByb290IGRvbWFpbiBpZiBubwogICAgIHJ1bGVzIG1hdGNoKS4KICAg
LSBUaGUgY291cmllciBoYW5kbGVyIG1hc2tzIHRoZSBob3N0IEhXSVJRIGFuZCBwdXNoZXMgdGhl
IFZJUlEgaW50bwogICAgIHRoZSBwZXItaGFydCBwZW5kaW5nIHF1ZXVlIG9mIHRoZSByb3V0ZWQg
ZG9tYWluLgogICAtIFRoZSBjb3VyaWVyIGhhbmRsZXIgaW5qZWN0cyBhbiBTU0UgZXZlbnQgdG8g
bm90aWZ5IFMtbW9kZS4KICAgLSBUaGUgUy1tb2RlIHBheWxvYWQgdHJhcHMgdGhlIFNTRSwgcG9w
cyB0aGUgcGVuZGluZyBWSVJRKHMpIHZpYQogICAgIGVjYWxsLCBhbmQgcnVucyB0aGUgSVNSLgog
ICAtIFRoZSBTLW1vZGUgcGF5bG9hZCBjb21wbGV0ZXMgdGhlIGludGVycnVwdCB2aWEgZWNhbGws
IHdoaWNoCiAgICAgdW5tYXNrcyB0aGUgaG9zdCBIV0lSUSwgYWxsb3dpbmcgZnVydGhlciBpbnRl
cnJ1cHRzLgoKUmF5bW9uZCBNYW8gKDIpOgogIGxpYjogc2JpOiBQcm90b3R5cGUgb2YgVmlydHVh
bCBJUlEgKFZJUlEpIGxheWVyIGZvcgogICAgbWFwcGluZy9yb3V0aW5nL2NvdXJpZXIvIElSUXMK
ICBwbGF0Zm9ybTogZ2VuZXJpYzogQWRkIHNhbXBsZSBkdHMgb3ZlcmxheSBmb3IgdGVzdGluZyBo
d2lycS9kb21haW4KICAgIHJvdXRlIHJ1bGVzCgogaW5jbHVkZS9zYmkvc2JpX3ZpcnEuaCAgICAg
ICAgICAgICAgICAgICAgICB8IDQwMSArKysrKysrKysrKysrKysrKysrKwogcGxhdGZvcm0vZ2Vu
ZXJpYy92aXJ0L2h3aXJxX2JpbmRfZG9tYWluLmR0cyB8ICA3OSArKysrCiAyIGZpbGVzIGNoYW5n
ZWQsIDQ4MCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9zYmkvc2Jp
X3ZpcnEuaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHBsYXRmb3JtL2dlbmVyaWMvdmlydC9od2lycV9i
aW5kX2RvbWFpbi5kdHMKCi0tIAoyLjI1LjEKCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3Bl
bnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vb3BlbnNiaQo=
