Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E65C53200
	for <opensbi@archiver.kernel.org>; Wed, 29 Jul 2026 16:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=suBe0SHoyvQWITfz9xCyr7XRvyXnQgp6apwDQrZvbvM=; b=k+NBDr08eFJgZS
	WDn7Itn8FGfCIFiH0Alov7ujWJDnWYdzUbCZt0ipH9Z6dE/fb55kAnMrWvN8DCqjTHZhB9D57Uch0
	6VJ7i6ozWemxqLX9sfySLwMAIHL4Vq/BOU9ygXkSkVlu84ebglIyPcI+KWFnwEMJixDXM8hS8iMcC
	XfhV6YmigcU+F+TvS45nfrw+pOOCJeJBE27wwlXp7LbRlXI4l9bybBPGLtnkbryo//rqafKrDq4jy
	+ZY9umEZ6VdtIS/SSmFdkCD/F9Z/sQk2DQ7/1Lg01JL5QDx/RRXP3TzSeC+/9bHRIQk4fWtxPMbMk
	kHGSX66VmUrKG9hg1pWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7OY-00000008bH4-1Icw;
	Wed, 29 Jul 2026 16:44:38 +0000
Received: from mail-wr2-x02.google.com ([2a00:1450:4864:30::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7OV-00000008bFQ-3fX2
	for opensbi@lists.infradead.org;
	Wed, 29 Jul 2026 16:44:37 +0000
Received: by mail-wr2-x02.google.com with SMTP id ffacd0b85a97d-47f9c6bc99eso334157f8f.0
        for <opensbi@lists.infradead.org>; Wed, 29 Jul 2026 09:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785343473; x=1785948273; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FIt/DoWQUfE0LmD5BBwj/2GV/xMDEDZzs9PsbViJFv4=;
        b=bcPFedjq4pOVTLeVXWUz4msdDgb9aNW6FEjRkpoi0rjHtB3wrgseU8sRp8QKu2ysZo
         mV5yhAQvP+HSYzCpPq3dLmGHxzDYYNB/tlmEJaSC0mPBPHXRUcspAnerebr1KtG1RAqI
         mmAleI32yAnvpnLk7sI2VbBf0zdAblLklvSdTZwPkQNZ17czOfIQc8J+zJsvFxjM3jhx
         TX4GkRXd5DsekaADdyihSrkBwTftaaK0ncIzN4bYCbWwdVSgFrqwwU+xqhDHIHjZo43s
         WmgD17qXP3QuOGlSTYh3g2dzzQ+Z7Y1kGQc77ZirEJeEn2s99SHqwkxtfz9/GRzh0Jau
         JUxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785343473; x=1785948273;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FIt/DoWQUfE0LmD5BBwj/2GV/xMDEDZzs9PsbViJFv4=;
        b=LkFYNRn2CPWaeKj5691aQ3XpUxgagTZ/xW4p6Fsk0J3pU97hkmd3SMsVcjJ78zAG+O
         0F0RVNNmsRUQtOfmQ9kYmR9xE3m2eRvnFYDdE3WC1Vs5cycBsFDzh8D7oZStCjyba91k
         Pye/R73+6P2VoL+k7x0ETWxYAVju11GLwJcmx8lZILidDriEUa/ffDl9G0lBguqtWik8
         AsylKqWJCkbhhgr8g3sPcdCeyzkmt4sW2WxouvCwedMNNxmgWp+ipiWDF3C5R+l0HseQ
         upaN9vas8PzCWO2cf/sUrbEQHoA1geweaXjC49i6vG3k70/D1tfWEEv7HN14XjvQcQPB
         hzgA==
X-Gm-Message-State: AOJu0YyyqcwDSDMDcjtNfh8pub8yK8MBN8VKYuNOyP7IR+yHsEACQ5Ma
	ASgXfpUZ6Y4sF2FgiK0+8Zs0IvsCNGQ98Zgyz54WtIGKtlsfpyK/Lql7BlwdVhpcQ7A=
X-Gm-Gg: AR+sD10MunUcdxVllk7VSu8OQGZEnohvcEDoIUS7b5AcGdQN2t21ZHLTou7NGncO6nB
	w5t9JovJ2NWGGVeIQ8l6zRIpljmKqFeBO+J+VfJFfpAhiBLq4wviI8gqf0igFPo2QhToDQfaM7p
	9ehnY1+zrzfeg1uDRbpiEThP17S9WZzyStSHk4j62WZXYXf21HJxadZI+aVmq8TrBLS6NBTpj+8
	5C5zYmGPzo8QZqck1EGykYm3Q3UyQy3zpzfIfgeL3ZCB3I/sYk31N1/W4gLfRgNWugtxuvMvfXP
	9ugONkOP0TrgS6vTZZxaWFqSJKjtu10AR+vk9FuVGOJObmG2qYR/3VBKfBptGWCSJ+JUhhEngwH
	oiT60ph63WLsjOJSYvNYUr+3cRqkv69o1Z2VckkOgHwXIaHEjjK9JEiMv0+K0dFh2x34+xJ15fs
	nU0SYdLlizZlXu+NtskV9/tRwWZmcixltMzi1bDiW+8lvvJ3vefpUQvXLxyDamcUJQsvzVuUDsQ
	VTkt2kwFPlig0uY9qKYF0Uepz25BO0HhvTNDIM3hXrN8aDPDyYaa9P//g==
X-Received: by 2002:a05:6000:61e:b0:47f:97e9:fe4a with SMTP id ffacd0b85a97d-47fb1edc973mr8686978f8f.43.1785343473511;
        Wed, 29 Jul 2026 09:44:33 -0700 (PDT)
Received: from leap.suse.de ([84.77.88.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6aa3a88sm8474869f8f.6.2026.07.29.09.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 09:44:33 -0700 (PDT)
From: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
To: opensbi@lists.infradead.org
Cc: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
Subject: [PATCH 00/14] Add clang Thread Safety Analysis (TSA) support
Date: Wed, 29 Jul 2026 18:35:27 +0200
Message-ID: <20260729163540.3162978-2-carlos.lopezr4096@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_094435_937235_D9EFEB73 
X-CRM114-Status: GOOD (  12.90  )
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

RW5hYmxlIHRoZSB1c2Ugb2YgY2xhbmcncyBUaHJlYWQgU2FmZXR5IEFuYWx5c2lzIFswXS4gVFNB
IGlzIGEgY2xhbmcKbGFuZ3VhZ2UgZXh0ZW5zaW9uIHRoYXQgYWxsb3dzIGRldGVjdGluZyBwb3Rl
bnRpYWwgaW52YWxpZCBsb2NraW5nCnBhdHRlcm5zIGFuZCByYWNlIGNvbmRpdGlvbnMgYXQgY29t
cGlsZSB0aW1lLCB3aXRoIHplcm8gcnVudGltZQpvdmVyaGVhZC4gVFNBIHJlbGllcyBvbiBhbm5v
dGF0aW9ucyB0byBleHByZXNzIHRoZSByZWxhdGlvbnNoaXBzIGJldHdlZW4KZGF0YSBhbmQgbG9j
a3MsIGFuZCB0aGUgZXhwZWN0ZWQgc3RhdGUgb2YgYSBsb2NrIGF0IGNlcnRhaW4gcG9pbnRzIGlu
CnRoZSBwcm9ncmFtLgoKVGhlIGZpcnN0IHR3byBjb21taXRzIGludHJvZHVjZSB0aGUgYmFzaWMg
aW5mcmFzdHJ1Y3R1cmUgdG8gdXNlIHRoZSBUU0EKYW5ub3RhdGlvbnMuIFRoZSBsYXN0IGNvbW1p
dCBlbmFibGVzIFRTQSBieSBkZWZhdWx0IGluIHRoZSBNYWtlZmlsZS4KQ29tbWl0cyBpbiBiZXR3
ZWVuIGFkZCB0aGUgbmV3IGFubm90YXRpb25zIHRvIHBhcnRpY3VsYXIgT3BlblNCSQpzdWJzeXN0
ZW1zLgoKVGhlIGdlbmVyYWwgcGF0dGVybiBpczoKKiBTdHJ1Y3QgZmllbGRzIGFyZSByZWFycmFu
Z2VkIHNvIHRoYXQgbG9ja3MgYXBwZWFyIGJlZm9yZSB0aGUKICBmaWVsZChzKSB0aGV5IHByb3Rl
Y3QuIFRoaXMgaXMgbmVlZGVkIGZvciB0aGUgY29tcGlsZXIgdG8gYmUgYWJsZSB0bwogIHBlcmZv
cm0gYW5hbHlzaXMuIFByb3RlY3RlZCBmaWVsZHMgYXJlIGFubm90YXRlZCB3aXRoIEdVQVJERURf
QlkoKSAvCiAgUFRfR1VBUkRFRF9CWSgpLgoqIEZ1bmN0aW9ucyB0aGF0IGFjY2VzcyBzcGlubG9j
ay1wcm90ZWN0ZWQgZmllbGRzIGFyZSBhbm5vdGF0ZWQgd3RoCiAgTVVTVF9IT0xEKCkuCiogRnVu
Y3Rpb25zIHRoYXQgYWNxdWlyZSBhIHNwaW5sb2NrLCBhbmQgd2hpY2ggbWF5IHBsYXVzaWJseSBi
ZSBjYWxsZWQKICB3aXRoIHRoYXQgc3BpbmxvY2sgaGVsZCwgYXJlIGFubm90YXRlZCB3aXRoIE1V
U1RfTk9UX0hPTEQoKSB0byBwcmV2ZW50CiAgcG90ZW50aWFsIGZ1dHVyZSBkZWFkbG9ja3MuCiog
SW5pdGlhbGl6ZXIgZnVuY3Rpb25zIGFuZCBvdGhlciBzcGVjaWFsIGNhc2VzIGFyZSBleGNsdWRl
ZCB2aWEKICBOT19USFJFQURfU0FGRVRZX0FOQUxZU0lTLgoKVGhpcyBzdWNjZXNzZnVsbHkgcmVz
dWx0cyBpbiBkZXRlY3RpbmcgaW5jb3JyZWN0IGxvY2tpbmcuIEZvciBleGFtcGxlLCB0aGUKZm9s
bG93aW5nIGNoYW5nZToKCmRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9maWZvLmMgYi9saWIvc2Jp
L3NiaV9maWZvLmMKaW5kZXggODhiODg4OGQyZTgxLi41MzQ4Yjc0NTJmNjQgMTAwNjQ0Ci0tLSBh
L2xpYi9zYmkvc2JpX2ZpZm8uYworKysgYi9saWIvc2JpL3NiaV9maWZvLmMKQEAgLTM3LDkgKzM3
LDcgQEAgdTE2IHNiaV9maWZvX2F2YWlsKHN0cnVjdCBzYmlfZmlmbyAqZmlmbykKICAgICAgICBp
ZiAoIWZpZm8pCiAgICAgICAgICAgICAgICByZXR1cm4gMDsKCi0gICAgICAgc3Bpbl9sb2NrKCZm
aWZvLT5xbG9jayk7CiAgICAgICAgcmV0ID0gZmlmby0+YXZhaWw7Ci0gICAgICAgc3Bpbl91bmxv
Y2soJmZpZm8tPnFsb2NrKTsKCiAgICAgICAgcmV0dXJuIHJldDsKIH0KClJlc3VsdHMgaW4gYSBi
dWlsZCBlcnJvcjoKCiAgbGliL3NiaS9zYmlfZmlmby5jOjQxOjE0OiBlcnJvcjogcmVhZGluZyB2
YXJpYWJsZSAnYXZhaWwnIHJlcXVpcmVzIGhvbGRpbmcgc3BpbmxvY2sgJyZzYmlfZmlmbzo6cWxv
Y2snIFstV2Vycm9yLC1XdGhyZWFkLXNhZmV0eS1hbmFseXNpc10KICAgNDEgfCAgICAgICAgIHJl
dCA9IGZpZm8tPmF2YWlsOwogICAgICB8ICAgICAgICAgICAgICAgICAgICAgXgogIDEgZXJyb3Ig
Z2VuZXJhdGVkLgoKVGVzdGVkIHdpdGggY2xhbmcgMTkuMS43IGFuZCAyMi4xLjguCgpbMF0gaHR0
cHM6Ly9jbGFuZy5sbHZtLm9yZy9kb2NzL1RocmVhZFNhZmV0eUFuYWx5c2lzLmh0bWwKCkNhcmxv
cyBMw7NwZXogKDE0KToKICBpbmNsdWRlOiBzYmk6IGFkZCB0aHJlYWQgc2FmZXR5IGFuYWx5c2lz
IG1hY3JvcwogIGxpYjogc2JpX2xvY2tzOiBhbm5vdGF0ZSBzcGlubG9jayBBUElzIGZvciBUU0EK
ICBsaWI6IHNiaV9maWZvOiBhZGQgVFNBIGFubm90YXRpb25zCiAgbGliOiBzYmlfaGVhcDogYWRk
IFRTQSBhbm5vdGF0aW9ucwogIGxpYjogc2JpX3NjcmF0Y2g6IGFkZCBUU0EgYW5ub3RhdGlvbnMK
ICBsaWI6IHJwbWk6IGFkZCBUU0EgYW5ub3RhdGlvbnMKICBsaWI6IHNiaV90aW1lcjogYWRkIFRT
QSBhbm5vdGF0aW9ucwogIGxpYjogaHRpZjogYWRkIFRTQSBhbm5vdGF0aW9ucwogIGxpYjogc2Jp
X2RvbWFpbjogYWRkIFRTQSBhbm5vdGF0aW9ucwogIGxpYjogc2JpX3NzZTogaW5saW5lIGVuYWJs
ZSBldmVudCBsb2NraW5nCiAgbGliOiBzYmlfc3NlOiBwYXNzIFNTRSBoYXJ0IHN0YXRlIGV4cGxp
Y2l0bHkKICBsaWI6IHNiaV9zc2U6IGFkZCBUU0EgYW5ub3RhdGlvbnMKICBsaWI6IHRlc3Q6IGRp
c2FibGUgVFNBIGZvciBzcGlubG9jayB0ZXN0cwogIE1ha2VmaWxlOiBlbmFibGUgVGhyZWFkIFNh
ZmV0eSBBbmFseXNpcwoKIE1ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICA3ICsrCiBpbmNsdWRlL3NiaS9yaXNjdl9sb2Nrcy5oICAgICAgICAgICAgICAgICAgfCAg
OCArLQogaW5jbHVkZS9zYmkvc2JpX2RvbWFpbi5oICAgICAgICAgICAgICAgICAgIHwgMTAgKyst
CiBpbmNsdWRlL3NiaS9zYmlfZmlmby5oICAgICAgICAgICAgICAgICAgICAgfCAgNiArLQogaW5j
bHVkZS9zYmkvc2JpX3Zpc2liaWxpdHkuaCAgICAgICAgICAgICAgIHwgMTcgKysrKysKIGxpYi9z
YmkvcmlzY3ZfbG9ja3MuYyAgICAgICAgICAgICAgICAgICAgICB8ICA0ICstCiBsaWIvc2JpL3Ni
aV9kb21haW4uYyAgICAgICAgICAgICAgICAgICAgICAgfCAgMyArCiBsaWIvc2JpL3NiaV9kb21h
aW5fY29udGV4dC5jICAgICAgICAgICAgICAgfCAgMiArCiBsaWIvc2JpL3NiaV9maWZvLmMgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAxMSArKy0KIGxpYi9zYmkvc2JpX2hlYXAuYyAgICAgICAg
ICAgICAgICAgICAgICAgICB8IDI1ICsrKy0tLQogbGliL3NiaS9zYmlfc2NyYXRjaC5jICAgICAg
ICAgICAgICAgICAgICAgIHwgIDMgKy0KIGxpYi9zYmkvc2JpX3NzZS5jICAgICAgICAgICAgICAg
ICAgICAgICAgICB8IDg5ICsrKysrKysrKystLS0tLS0tLS0tLS0KIGxpYi9zYmkvc2JpX3RpbWVy
LmMgICAgICAgICAgICAgICAgICAgICAgICB8ICA1ICstCiBsaWIvc2JpL3Rlc3RzL3Jpc2N2X2xv
Y2tzX3Rlc3QuYyAgICAgICAgICAgfCAgMyArCiBsaWIvdXRpbHMvbWFpbGJveC9mZHRfbWFpbGJv
eF9ycG1pX3NobWVtLmMgfCAxNCArKy0tCiBsaWIvdXRpbHMvc3lzL2h0aWYuYyAgICAgICAgICAg
ICAgICAgICAgICAgfCAyOCArKysrLS0tCiAxNiBmaWxlcyBjaGFuZ2VkLCAxNDAgaW5zZXJ0aW9u
cygrKSwgOTUgZGVsZXRpb25zKC0pCgoKYmFzZS1jb21taXQ6IGMwZjg3ZjEwZDFiZmI5ZTcyYTg0
ZGRmYWZiNTYwNGVlMWJmZTlkMDQKLS0gCjIuNTEuMAoKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlz
dApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
