Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D140C54F55
	for <opensbi@archiver.kernel.org>; Wed, 29 Jul 2026 16:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O1sD+YcFqd6GRrUPdDfywvV3e7H/Z+/bCLEQfF2U+Iw=; b=bb+EQ+M5mLdsMm
	qYCoQ4hAMR05jQVVtVGJN9gbsyB9BmyHs28Bd7RTDVGztH+5XrCnlt8nkfeE/Hc9ALrBpSKXdznDT
	cyb2nBFWdoIQGldjJ8Dd+O9Exa3Q/Z2uCmdhKzSkOWmmzViULarQcfsx+q20od3kOBc1+DkycJt2y
	aP9UraCU3EseAI+x1xrTu7W63um7/YIEPkvOHGQrlPZLdgk4eGMFnrioUlNr9Hjc17HWJcuk4UBwf
	4yRBXneH39wkZfYGz2asi09EUzXNcV+i/Mvu80BVBZetjACpzs8EbDkrnqVsOGC1Whr5eK2OGeRdy
	CcxqoxmWwHmvAlxA2LQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7Od-00000008bMr-3mOr;
	Wed, 29 Jul 2026 16:44:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7Oc-00000008bJV-01uO
	for opensbi@bombadil.infradead.org;
	Wed, 29 Jul 2026 16:44:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=oimCyaUVgC1Ktdf2j+o40ks8fFeS+45SZhhZXjtyyxQ=; b=JDgW1AQjRNBRpZfDE/gKihlkyI
	ry7+96xHoaOTZ5t75wWFcrOFVKadI+SmfXtJoaz4jyHT0t3F/wx7wkkmtnUFnC7NPr7NpYXcmjcPO
	sT9bFHngypBYxesGfFG3i4pSey08CSfswS1NdWDgCj/wmpI7+d0AlaX0c9T4itmrv0UY8ezKJxEUD
	s4EHBlary7GSWu4GBRK18do+phhD8DFwKZanBLLvXjg5IqC6hdzImy8cXD99QfqvjWzPM7ELYoEtM
	9PVJAmpS0xJcEk0knKRAYqprNVg37o6zZhcnEPJFkYgp4aAmtULcl7Ll6AjPHmRxxGnrTxKEZRRhU
	p3gS9guA==;
Received: from mail-wm2-x0a.google.com ([2a00:1450:4864:31::a])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wp7OZ-000000061Cf-0B7j
	for opensbi@lists.infradead.org;
	Wed, 29 Jul 2026 16:44:40 +0000
Received: by mail-wm2-x0a.google.com with SMTP id 5b1f17b1804b1-495482c36b8so3259505e9.0
        for <opensbi@lists.infradead.org>; Wed, 29 Jul 2026 09:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785343476; x=1785948276; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oimCyaUVgC1Ktdf2j+o40ks8fFeS+45SZhhZXjtyyxQ=;
        b=hcG83BtJvwURE4E/L1Hm/ZgQKrAhOVSEKL32Kim4+/t/UMV46eIk7DzM8PQDI0NI1l
         X63eavzTpnm89FyUJvNAulGufQKqLebq0fNx1j9fbYn3aIYrZMsTpLOxnZ/G+SCRJ2kp
         8HoRiVd7xj79WFOEDVr+pOEHMgmhEQGVQwGcL9ShMqaIPrDPokha55UDDKiMf9bGkfMZ
         8CNwfJDOqhzi5K/zxZhm7HBtjnA1rw21zxzB8AWcsHYvcxD74Ak02MKOm4/hE5pTq+sV
         o8IQADGQkL7Hp7rd6ALBR2pCQM84CTeRof0zwD7CZeWaHJN6gmqKU0DveZXuxpRFf5Z9
         aCpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785343476; x=1785948276;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oimCyaUVgC1Ktdf2j+o40ks8fFeS+45SZhhZXjtyyxQ=;
        b=F8cng+JQOMdeFcJyYoGoTL5OrEmAyILe0jC2f61kSAeopswyrAWOFX68yvCdWMnWam
         0gojkRYxca4Ab2Clq7wo0toXX7Y2NnF6Fuxwi4wf07MIA6smDQAc9p1jPPs6HHaDdcFa
         5QR32FJ6sc9P0TElUeav1qzUvKbnwW75vBwUmV/DBnfj1dwvKl/hQxR7fK9DKbyBJ9yu
         6eby7tu0jO7/ctu0isgANB0DkcajXZIoXX40SzCNhN8/8ERQNefDurjIhOCzJV70t0lQ
         ACYZ9UmngD0zZcEDXRlPe6xjUk4Uo/UcH05hE+6l0qj96kE2h1qBGn7nK+8T9Bsn41vW
         b0Dw==
X-Gm-Message-State: AOJu0YyIilvG43/8YBlBGX0vd9RssnHvC0cqwSSX+XgM7AeBH4QQPPWx
	ilLssc9x+tvkTUJATKgaFC9JIKK8bhD3Mp44TRg7XJa7CNfXtXt+pWLhWVHgRiEh5uo=
X-Gm-Gg: AR+sD11AvXURQ1W3pWgDHUh+9R6JCpi9B73YSsgMjmOxKLKHClXKKfe3KQPxnbjms1h
	RV9p/PWqZC1dF+Gp1lYQW8IMpaL62AvBaGoOLMB7ntsRKcNUzaO34SZ1+Hqd21XMvqnbVqdxaTY
	aKNczHkwN/r9fTIw8q9DfStnIVBS5GJ9mZeEBEvfHm7FeZ9GOrl4XqOgQA9mUiIdcwcC/jzY+Do
	TmMECce02/B7ICMOm0UdwHJWc/oi+xVgx/sdwQEUMaVCkr9laIsEFicHXQooELmTFbJtHa5E9BL
	cGSwsGpwTBbaeYT+ID9s7/qVCCZkZLzSlXMu+Y1u3tqY99NnS6h54P6VJl/F1l2aDv7EWJes8fH
	Go9GwfNKRRJhtQXAlimCHHW4f7sSE/cG7aor+3/LFsWeXzu7fCUEXOkGiRG91t2wUY1sGm6z9Tm
	6pVmBWeczup5FEdrFLgoIu778XU2JnF88dDa1phxia4U8bKddkmVkZF1UEOK2fzVHK0tO1JGOT/
	08YybFW0gHrLntKWqzLIwJqxq3DwZdxlxouqSxxhmNoBNMRdLjXf8iH0w==
X-Received: by 2002:a05:6000:2905:b0:47f:9763:9870 with SMTP id ffacd0b85a97d-47fb1e9f835mr9812988f8f.35.1785343476300;
        Wed, 29 Jul 2026 09:44:36 -0700 (PDT)
Received: from leap.suse.de ([84.77.88.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6aa3a88sm8474869f8f.6.2026.07.29.09.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 09:44:35 -0700 (PDT)
From: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
To: opensbi@lists.infradead.org
Cc: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
Subject: [PATCH 03/14] lib: sbi_fifo: add TSA annotations
Date: Wed, 29 Jul 2026 18:35:30 +0200
Message-ID: <20260729163540.3162978-5-carlos.lopezr4096@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260729163540.3162978-2-carlos.lopezr4096@gmail.com>
References: <20260729163540.3162978-2-carlos.lopezr4096@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_174439_145042_C657CBD2 
X-CRM114-Status: GOOD (  10.64  )
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

QWRkIFRocmVhZCBTYWZldHkgQW5hbHlzaXMgKFRTQSkgYW5ub3RhdGlvbnMgZm9yIHRoZSBGSUZP
CmltcGxlbWVudGF0aW9uLiBUaGlzIGNvbnNpc3RzIG9mIGluZGljYXRpbmcgd2hpY2ggZmllbGRz
IGFyZSBwcm90ZWN0ZWQKYnkgYSBzcGlubG9jayBhbmQgYW5ub3RhdGluZyBmdW5jdGlvbnN0IHRo
YXQgbXVzdCBiZSBjYWxsZWQgdW5kZXIgYQpzcGlubG9jay4gc2JpX2ZpZm9faW5pdCgpIG11c3Qg
YmUgZXhjbHVkZWQsIGFzIGFjcXVpcmluZyBhIHNwaW5sb2NrCmJlZm9yZSBpdCBpcyBpbml0aWFs
aXplZCBkb2VzIG5vdCBtYWtlIHNlbnNlLgoKU2lnbmVkLW9mZi1ieTogQ2FybG9zIEzDs3BleiA8
Y2FybG9zLmxvcGV6cjQwOTZAZ21haWwuY29tPgotLS0KIGluY2x1ZGUvc2JpL3NiaV9maWZvLmgg
fCAgNiArKystLS0KIGxpYi9zYmkvc2JpX2ZpZm8uYyAgICAgfCAxMSArKysrKysrKy0tLQogMiBm
aWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2luY2x1ZGUvc2JpL3NiaV9maWZvLmggYi9pbmNsdWRlL3NiaS9zYmlfZmlmby5oCmluZGV4
IDg5YTJlYTI2YTI1OS4uNGVjMTBlMDU0MTVlIDEwMDY0NAotLS0gYS9pbmNsdWRlL3NiaS9zYmlf
Zmlmby5oCisrKyBiL2luY2x1ZGUvc2JpL3NiaV9maWZvLmgKQEAgLTE1LDEyICsxNSwxMiBAQAog
I2luY2x1ZGUgPHNiaS9zYmlfdHlwZXMuaD4KIAogc3RydWN0IHNiaV9maWZvIHsKLQl2b2lkICpx
dWV1ZTsKIAlzcGlubG9ja190IHFsb2NrOworCXZvaWQgKnF1ZXVlIFBUX0dVQVJERURfQlkoJnFs
b2NrKTsKIAl1MTYgZW50cnlfc2l6ZTsKIAl1MTYgbnVtX2VudHJpZXM7Ci0JdTE2IGF2YWlsOwot
CXUxNiB0YWlsOworCXUxNiBhdmFpbCBHVUFSREVEX0JZKCZxbG9jayk7CisJdTE2IHRhaWwgR1VB
UkRFRF9CWSgmcWxvY2spOwogfTsKIAogI2RlZmluZSBTQklfRklGT19JTklUSUFMSVpFUihfX3F1
ZXVlX21lbSwgX19lbnRyaWVzLCBfX2VudHJ5X3NpemUpCVwKZGlmZiAtLWdpdCBhL2xpYi9zYmkv
c2JpX2ZpZm8uYyBiL2xpYi9zYmkvc2JpX2ZpZm8uYwppbmRleCBkMDdlYmZmNDk1NWMuLjg4Yjg4
ODhkMmU4MSAxMDA2NDQKLS0tIGEvbGliL3NiaS9zYmlfZmlmby5jCisrKyBiL2xpYi9zYmkvc2Jp
X2ZpZm8uYwpAQCAtMTMsNyArMTMsNyBAQAogI2luY2x1ZGUgPHNiaS9zYmlfc3RyaW5nLmg+CiAK
IHZvaWQgc2JpX2ZpZm9faW5pdChzdHJ1Y3Qgc2JpX2ZpZm8gKmZpZm8sIHZvaWQgKnF1ZXVlX21l
bSwgdTE2IGVudHJpZXMsCi0JCSAgIHUxNiBlbnRyeV9zaXplKQorCQkgICB1MTYgZW50cnlfc2l6
ZSkgTk9fVEhSRUFEX1NBRkVUWV9BTkFMWVNJUwogewogCWZpZm8tPnF1ZXVlCSAgPSBxdWV1ZV9t
ZW07CiAJZmlmby0+bnVtX2VudHJpZXMgPSBlbnRyaWVzOwpAQCAtMjUsNiArMjUsNyBAQCB2b2lk
IHNiaV9maWZvX2luaXQoc3RydWN0IHNiaV9maWZvICpmaWZvLCB2b2lkICpxdWV1ZV9tZW0sIHUx
NiBlbnRyaWVzLAogCiAvKiBOb3RlOiBtdXN0IGJlIGNhbGxlZCB3aXRoIGZpZm8tPnFsb2NrIGhl
bGQgKi8KIHN0YXRpYyBpbmxpbmUgYm9vbCBfX3NiaV9maWZvX2lzX2Z1bGwoc3RydWN0IHNiaV9m
aWZvICpmaWZvKQorCU1VU1RfSE9MRCgmZmlmby0+cWxvY2spCiB7CiAJcmV0dXJuIChmaWZvLT5h
dmFpbCA9PSBmaWZvLT5udW1fZW50cmllcykgPyB0cnVlIDogZmFsc2U7CiB9CkBAIC01OCw3ICs1
OSw4IEBAIGludCBzYmlfZmlmb19pc19mdWxsKHN0cnVjdCBzYmlfZmlmbyAqZmlmbykKIH0KIAog
LyogTm90ZTogbXVzdCBiZSBjYWxsZWQgd2l0aCBmaWZvLT5xbG9jayBoZWxkICovCi1zdGF0aWMg
aW5saW5lIHZvaWQgIF9fc2JpX2ZpZm9fZW5xdWV1ZShzdHJ1Y3Qgc2JpX2ZpZm8gKmZpZm8sIHZv
aWQgKmRhdGEpCitzdGF0aWMgaW5saW5lIHZvaWQgX19zYmlfZmlmb19lbnF1ZXVlKHN0cnVjdCBz
YmlfZmlmbyAqZmlmbywgdm9pZCAqZGF0YSkKKwlNVVNUX0hPTEQoJmZpZm8tPnFsb2NrKQogewog
CXUzMiBoZWFkOwogCkBAIC05MSw3ICs5Myw4IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCAgX19zYmlf
Zmlmb19lbnF1ZXVlKHN0cnVjdCBzYmlfZmlmbyAqZmlmbywgdm9pZCAqZGF0YSkKIH0KIAogLyog
Tm90ZTogbXVzdCBiZSBjYWxsZWQgd2l0aCBmaWZvLT5xbG9jayBoZWxkICovCi1zdGF0aWMgaW5s
aW5lIHZvaWQgIF9fc2JpX2ZpZm9fZGVxdWV1ZShzdHJ1Y3Qgc2JpX2ZpZm8gKmZpZm8sIHZvaWQg
KmRhdGEpCitzdGF0aWMgaW5saW5lIHZvaWQgX19zYmlfZmlmb19kZXF1ZXVlKHN0cnVjdCBzYmlf
ZmlmbyAqZmlmbywgdm9pZCAqZGF0YSkKKwlNVVNUX0hPTEQoJmZpZm8tPnFsb2NrKQogewogCWlm
ICghZGF0YSkKIAkJZ290byBza2lwX2RhdGFfY29weTsKQEAgLTEyNiw2ICsxMjksNyBAQCBza2lw
X2RhdGFfY29weToKIAogLyogTm90ZTogbXVzdCBiZSBjYWxsZWQgd2l0aCBmaWZvLT5xbG9jayBo
ZWxkICovCiBzdGF0aWMgaW5saW5lIGJvb2wgX19zYmlfZmlmb19pc19lbXB0eShzdHJ1Y3Qgc2Jp
X2ZpZm8gKmZpZm8pCisJTVVTVF9IT0xEKCZmaWZvLT5xbG9jaykKIHsKIAlyZXR1cm4gKGZpZm8t
PmF2YWlsID09IDApID8gdHJ1ZSA6IGZhbHNlOwogfQpAQCAtMTQ2LDYgKzE1MCw3IEBAIGludCBz
YmlfZmlmb19pc19lbXB0eShzdHJ1Y3Qgc2JpX2ZpZm8gKmZpZm8pCiAKIC8qIE5vdGU6IG11c3Qg
YmUgY2FsbGVkIHdpdGggZmlmby0+cWxvY2sgaGVsZCAqLwogc3RhdGljIGlubGluZSB2b2lkIF9f
c2JpX2ZpZm9fcmVzZXQoc3RydWN0IHNiaV9maWZvICpmaWZvKQorCU1VU1RfSE9MRCgmZmlmby0+
cWxvY2spCiB7CiAJc2l6ZV90IHNpemUgPSAoc2l6ZV90KWZpZm8tPm51bV9lbnRyaWVzICogZmlm
by0+ZW50cnlfc2l6ZTsKIAotLSAKMi41MS4wCgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9w
ZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL29wZW5zYmkK
