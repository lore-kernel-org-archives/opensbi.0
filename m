Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0147C79FBD
	for <opensbi@archiver.kernel.org>; Wed,  9 Sep 2026 16:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aeqHo1YbBglBvQ+jtHbZGNL/Hk77mLoST6CCboNPghA=; b=io1AB/v+VzpStM
	dy4OD/iSNMGGWmTLLRgG9aeHsmWdQkXWD2YzlukqMrjdl/nm6GeaoggKO564fBCEFeH9dQiyomud4
	HmBCIYxtYhnpPT8CnBVr38MbPdVeJ018kDsqSLXsMuCEPkpoKmV2t19jOQ7sTyoY+MSWIBeyNu6Qw
	7EixWXbsPHhYmJ3OQHwpgNZWUZaMCpnfMJ4D/nfRWKdHMysV9Yfj62YAnKF4FLRwTCz/5gzlJiI5v
	nO2nmTOEoysO/fbGR5V8/dDWuKXLaKZSs3muh4XniZmnZxG3cbgutob/zZbciV6HcgCfvt1z/gy0T
	MUoeIJewZKtcY+KQShvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LCk-0000000CJax-3b5q;
	Wed, 09 Sep 2026 16:31:22 +0000
Received: from mail-wm2-x0a.google.com ([2a00:1450:4864:31::a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LCh-0000000CJYY-167C
	for opensbi@lists.infradead.org;
	Wed, 09 Sep 2026 16:31:20 +0000
Received: by mail-wm2-x0a.google.com with SMTP id 5b1f17b1804b1-495501e57beso26930625e9.1
        for <opensbi@lists.infradead.org>; Wed, 09 Sep 2026 09:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788971477; x=1789576277; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/lQxIyCoaZq6PdqzaXsVeQfV90qzq+Ykl6wRQhBxxLM=;
        b=o0Y2pgim0GTCz2sFvSPRBwBHigEvjqrxEfdoTbbo2Z3HLHanqjukTPL7G0SYdq6i7c
         imU+qmlYAMksM8nUbmzdLubu44fEW1A+/C0E0Nerg2TIBVhQmof4m4Gh2nwKLk9JTNp5
         PJUWu4d+We0rPa6q0zOUoIy5ZxmWivdQvEvFkLK8lnZmu9WsxIDXaz07n5fLnmtcgZhc
         Brl1fCmwsHMi9Y4PmpUL/49lmL8Wf4oU6ZMf2WIpEqr11qt9XMoB2ONPUDQzypbSPTi+
         ACNQthpFXh5ADzmq6cEw48XIUcA+vXf5cz+5nMqJKmce9+bZRQobBL+/8BOoFr8P2U1M
         aHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788971477; x=1789576277;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/lQxIyCoaZq6PdqzaXsVeQfV90qzq+Ykl6wRQhBxxLM=;
        b=TCNBa9guSqI19jGfT6nRdRwDo5i3jUHtoj4UpU5kpbe0poxrlUJJM0vHzw56+9FdD/
         IWOAKlAplRFiqSIfJtWGsE5ZQTWr5NbaysonH7olXPDKtedWgzkLKTr7ad6VKwSezC6j
         bf7W8u36yq7E3RLN+bS9Gl7FgqtqE+0iK9qUA5Xj/qBDvAywRa0Q+WKQ9Gy5DFTQmapP
         yuySBVQEfm7413eZ+FtQMnIgO26HDQVqSn+RxZ7i7QmgSFlgRtigA+IwSdkUMVzQi1Sb
         iG9eWLO2hdLjgKN8l1FhFqfgmUvWDuDtsLo7OZPCrSNEDG3e0SQk96oYnB+HaPgwVNjm
         KIZg==
X-Gm-Message-State: AFuF++lQUCJwhlRxOBCDSDMywPhFLlPXoyX6iWeqImpqMlE/SDHOTDxx
	gZ7LIQQm/Rk3xN8MgcD+qLTM7o7RIfzv3Ao48wdqLQ7qqGbPRV+uN+GVoiPCYAWc
X-Gm-Gg: AYBFou3QpyH5U1m193kF0TNdWrru9rXbiKwH/bq/ySQMnnWw/hOTaRu8ddMswt8gpRn
	9xXrepN7+roCkL3Fz/BL2Y8zYiDHZlyo+teJEzR4u1KwHmQ5ZMCsShY2ZBsZ4vZ9fTCYuCy0I1m
	GvPtS7OGjyRV1qpRXJUj7hG4y+PrfuWbdulLJ8DpD1cibD59NORBpA0+Q13Uf2rQzAP3M/kCgeW
	PJle2btEUaDCoJAuLA/Mf6AnrlDyZxOVMNic9p6Bzz/memZBh3yzyhtbBv28iSctYL8mRInAc8N
	sbJSy0auB9NFMVxtOoAPWgUOhj6GIwU/kHn10NSQyw/R5sE3Mp2b8yh7vg/ciNHvFkLK4pEq8v5
	uPDRAgi8a0nF9aLBM5ajQqe9eUA9YiEvLPfet3eU+iSvlsXAy/dJw6LzxEG3omWiZlopICRH+jJ
	KkC6x1ndKJKQf/IVcxneDIr0EoeMENA83vDkwBvV4SZfqd2PGssg6//mz5+sX64Ny9cXN8mf1lK
	BL9XnAux9486OzSKDClc26ECowJWnzHG8W8bAEiQe/CzoZ3CCsoj86EwD8RVJnHMATfmo5qI0CV
	O/3qREyF2bkvWw==
X-Received: by 2002:a05:600c:6214:b0:49c:edd8:ba35 with SMTP id 5b1f17b1804b1-49cf823b95dmr367924835e9.6.1788971477097;
        Wed, 09 Sep 2026 09:31:17 -0700 (PDT)
Received: from localhost.localdomain ([84.77.88.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c06f04sm2763705e9.13.2026.09.09.09.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 09:31:16 -0700 (PDT)
From: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
To: opensbi@lists.infradead.org
Cc: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
Subject: [PATCH v2 02/14] lib: sbi_locks: annotate spinlock APIs for TSA
Date: Wed,  9 Sep 2026 18:23:11 +0200
Message-ID: <20260909162322.29778-4-carlos.lopezr4096@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260909162322.29778-2-carlos.lopezr4096@gmail.com>
References: <20260909162322.29778-2-carlos.lopezr4096@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_093119_316807_7D369624 
X-CRM114-Status: GOOD (  12.02  )
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

QWRkIFRocmVhZCBTYWZldHkgQW5hbHlzaXMgKFRTQSkgYW5ub3RhdGlvbnMgZm9yIHNwaW5sb2Nr
IEFQSXMsIGFsbG93aW5nCnRoZSBjb21waWxlciB0byByZWFzb24gYWJvdXQgbG9jayBhY3F1aXNp
dGlvbiBhbmQgcmVsZWFzZS4KCkFubm90YXRpb25zIGhhdmUgYSBkaWZmZXJlbnQgbWVhbmluZyBp
ZiB1c2VkIGluIGhlYWRlciBkZWNsYXJhdGlvbnMgdnMgQwpmaWxlIGltcGxlbWVudGF0aW9ucy4g
SW4gaGVhZGVyIGRlY2xhcmF0aW9ucywgdGhleSBzcGVjaWZ5IHRoZSBzZW1hbnRpY3MKb2YgdGhl
IGdpdmVuIGZ1bmN0aW9uLCBtZWFuaW5nIHRoYXQgd2UgbXVzdCBzcGVjaWZ5IHRoYXQgdGhlIHNw
aW5sb2NrCmZ1bmN0aW9ucyBhY3F1aXJlIGFuZCByZWxlYXNlIGEgbG9jayAoImNhcGFiaWxpdHki
IGluIGNsYW5nIHRlcm1zKS4KSW4gZnVuY3Rpb24gaW1wbGVtZW50YXRpb25zLCBhdHRyaWJ1dGVz
IGFmZmVjdCB0aGUgZnVuY3Rpb24gYm9keSBhbmQKY2FsbGVycyBpbiB0aGUgc2FtZSB0cmFuc2xh
dGlvbiB1bml0OyBzaW5jZSB0aGUgc3BpbmxvY2sgZnVuY3Rpb25zCmNvbnRhaW4gaW5saW5lIGFz
c2VtYmx5LCB0aGV5IG11c3QgYmUgZXhjbHVkZWQgZnJvbSBhbmFseXNpcy4KClNpZ25lZC1vZmYt
Ynk6IENhcmxvcyBMw7NwZXogPGNhcmxvcy5sb3BlenI0MDk2QGdtYWlsLmNvbT4KLS0tCiBpbmNs
dWRlL3NiaS9yaXNjdl9sb2Nrcy5oIHwgOCArKysrLS0tLQogbGliL3NiaS9yaXNjdl9sb2Nrcy5j
ICAgICB8IDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zYmkvcmlzY3ZfbG9ja3MuaCBiL2luY2x1ZGUv
c2JpL3Jpc2N2X2xvY2tzLmgKaW5kZXggMzhkOWNiZWI3YjJhLi5hMGEzNGMwNDk3NTAgMTAwNjQ0
Ci0tLSBhL2luY2x1ZGUvc2JpL3Jpc2N2X2xvY2tzLmgKKysrIGIvaW5jbHVkZS9zYmkvcmlzY3Zf
bG9ja3MuaApAQCAtMjAsNyArMjAsNyBAQCB0eXBlZGVmIHN0cnVjdCB7CiAgICAgICAgdTE2IG93
bmVyOwogICAgICAgIHUxNiBuZXh0OwogI2VuZGlmCi19IF9fYWxpZ25lZCg0KSBzcGlubG9ja190
OworfSBfX2FsaWduZWQoNCkgQ0FQQUJJTElUWSgic3BpbmxvY2siKSBzcGlubG9ja190OwogCiAj
ZGVmaW5lIF9fU1BJTl9MT0NLX1VOTE9DS0VECVwKIAkoc3BpbmxvY2tfdCkgeyAwLCAwIH0KQEAg
LTM2LDEwICszNiwxMCBAQCB0eXBlZGVmIHN0cnVjdCB7CiAKIGJvb2wgc3Bpbl9sb2NrX2NoZWNr
KHNwaW5sb2NrX3QgKmxvY2spOwogCi1ib29sIHNwaW5fdHJ5bG9jayhzcGlubG9ja190ICpsb2Nr
KTsKK2Jvb2wgc3Bpbl90cnlsb2NrKHNwaW5sb2NrX3QgKmxvY2spIFRSWV9BQ1FVSVJFKHRydWUs
ICpsb2NrKTsKIAotdm9pZCBzcGluX2xvY2soc3BpbmxvY2tfdCAqbG9jayk7Cit2b2lkIHNwaW5f
bG9jayhzcGlubG9ja190ICpsb2NrKSBBQ1FVSVJFKCpsb2NrKSBNVVNUX05PVF9IT0xEKCpsb2Nr
KTsKIAotdm9pZCBzcGluX3VubG9jayhzcGlubG9ja190ICpsb2NrKTsKK3ZvaWQgc3Bpbl91bmxv
Y2soc3BpbmxvY2tfdCAqbG9jaykgUkVMRUFTRSgqbG9jayk7CiAKICNlbmRpZgpkaWZmIC0tZ2l0
IGEvbGliL3NiaS9yaXNjdl9sb2Nrcy5jIGIvbGliL3NiaS9yaXNjdl9sb2Nrcy5jCmluZGV4IGUy
NTNiMWI3MjNhYi4uZmE2MjRhOTRiZTgxIDEwMDY0NAotLS0gYS9saWIvc2JpL3Jpc2N2X2xvY2tz
LmMKKysrIGIvbGliL3NiaS9yaXNjdl9sb2Nrcy5jCkBAIC00NSw3ICs0NSw3IEBAIGJvb2wgc3Bp
bl90cnlsb2NrKHNwaW5sb2NrX3QgKmxvY2spCiAJcmV0dXJuIGwwID09IDA7CiB9CiAKLXZvaWQg
c3Bpbl9sb2NrKHNwaW5sb2NrX3QgKmxvY2spCit2b2lkIHNwaW5fbG9jayhzcGlubG9ja190ICps
b2NrKSBOT19USFJFQURfU0FGRVRZX0FOQUxZU0lTCiB7CiAJdW5zaWduZWQgbG9uZyBpbmMgPSAx
dSA8PCBUSUNLRVRfU0hJRlQ7CiAJdW5zaWduZWQgbG9uZyBtYXNrID0gMHhmZmZmdTsKQEAgLTg0
LDcgKzg0LDcgQEAgdm9pZCBzcGluX2xvY2soc3BpbmxvY2tfdCAqbG9jaykKIAkJOiAibWVtb3J5
Iik7CiB9CiAKLXZvaWQgc3Bpbl91bmxvY2soc3BpbmxvY2tfdCAqbG9jaykKK3ZvaWQgc3Bpbl91
bmxvY2soc3BpbmxvY2tfdCAqbG9jaykgTk9fVEhSRUFEX1NBRkVUWV9BTkFMWVNJUwogewogCV9f
c21wX3N0b3JlX3JlbGVhc2UoJmxvY2stPm93bmVyLCBsb2NrLT5vd25lciArIDEpOwogfQotLSAK
Mi41MS4wCgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
