Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8078AC79FB6
	for <opensbi@archiver.kernel.org>; Wed,  9 Sep 2026 16:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gWuIPleSYC0WR3AZfIGjwUUDfAd31ZE/TvIpsCkcmB4=; b=nlrHkE+/kKgdF2
	OvA2SabUcFyCBuMapuaQn8cMrEcuHDFc0IlbmgIsNn/PuMxUO9pCJ9JGe7q26gmo8YGhRn3TiyhcB
	R3X5nQrAX349FfWxs/19JywgSJq08rTyS/+Yo35ds8INmGjFhPJajFqkph4idCcHi1Vq2s2JkuQPs
	Jxb8cQeaE8lSPEBhhehXMP4aRYMVhtBLl1ONoB35RHFYQTzu/xkO6nBQ1tbrjuWDuoiZ3HOq3xQzx
	sbigWp2Hmr66OabgtSXx7bF9Tyy+itxgxYIr3GZXMXYx42q5o1FvoPJpPIlN540Jzp3b1QmH9Us9i
	NWVH2BLoKBtuYqc/vCsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LCr-0000000CJhi-2jmT;
	Wed, 09 Sep 2026 16:31:29 +0000
Received: from mail-wm2-x02.google.com ([2a00:1450:4864:31::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LCo-0000000CJe0-2rt1
	for opensbi@lists.infradead.org;
	Wed, 09 Sep 2026 16:31:27 +0000
Received: by mail-wm2-x02.google.com with SMTP id 5b1f17b1804b1-49add2a23e5so21728855e9.1
        for <opensbi@lists.infradead.org>; Wed, 09 Sep 2026 09:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788971485; x=1789576285; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5u9BoFGiiRYXMRjyrapa1cnSNSUsBX+n7WOR5agchWc=;
        b=YwPRH9RPCxwdS9I8aVd5Ft+qphwqeAva/C7r/7gU+1Z7lkAFK1OxVD6YgDgYCSfVk8
         NeMxuiizNM4lmJNTV+eWFUetsvs8Eecxmb+5u5dlxOOz6x/QEbi6T/Qi6Z+saAoaUCoj
         9AadBPThw46DCvX+UakTkMjwLOYEl63VAH2qaEHLUnGxk6ZRFEM+oFRpFxEIzVQdl+cq
         OqOqWMlk4u1GcP20vRoltRqqw6p+7p1CqhikuypNJNnNNUC4tou7xmwT3+AMeBRQmvA8
         k4Khxd20KMKaBZ6SbaXAFiPkicsUnhuM9TGnB3t7Nci0aBktKdJ9tzs5vwZk7oYlT+EO
         U0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788971485; x=1789576285;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5u9BoFGiiRYXMRjyrapa1cnSNSUsBX+n7WOR5agchWc=;
        b=nzAeA2XQIdFQvm1GhnBpoDFBlfDioosZ9Nq3TnhwfkI62mY+yzKmOaeS1i9F6AEfDf
         0qjIMv67tT26i/TBiv7d9Mj7Udo9mYLuwvQSqUt66TZhEMJ3VNyMLy3a6FZd5naVIDHl
         wg04QBlt0AbyRdjMW8L5jZwQMMBhwkidtotAJrfQUtVoZDdFE7cx3vyslJLIQVbW06ln
         NekyNRR+dJJ+djIsuLOuZZQnYa3QtZpx5WgjbLzfL00duN6tXeJfvW6nyGKYrxS/hf7j
         QUujHPZre8qe8edjMI264EFaS2fTHGx7AB9x+mkcqQzvib5BHp8JJZBnB82gNVP3oBCQ
         Rjpw==
X-Gm-Message-State: AFuF++nwDTN8Ictes4EfdLi8nsgIhItJcYgRSUX8V/jclrYkKHlU2LKG
	Hdc4KiMvWoB6OlNVWb0fIv8yGoltth8nX5bL4Dc1UtHF2OWtoqZ3HI1An7qJmGfC
X-Gm-Gg: AYBFou1I3tsTt6d3dyMN0FHG6vV/9qkUfX/KGrAueKmg4xmnEOErZSGx8pTdD/GZQ0I
	PPU3vxpkWs4f+t1jPPUmzHZZh9xj1QIyKxxLftoC2pOy+MfhVp6kWDJgWhwi4xjUozvXAxqVNsk
	PKWtkwlmD1Jr0U16QHf85VLpOuetImcsJornwVujaKkzbQVuumvNDDQtra7RdRDdRC+3LrwF7U3
	jRp2HxJdV4hFtf+vfp3w0i8vQCTvxWiL9PVNwczGGisMUFq+yuOiMHKqdkuf1wugManQyvIgQPN
	b+jknYQwF9QtiUloIhgBVsWeL7xis+0VN8DgzHW4YDh1LpHecai13XFwtITiNlrJIYoPuLkFMbe
	d2sMY0dkjXcUoO6fKR3cuzyniV0nnBtx8lsaoDDHq0HxO6gYwj6rAlHbOV4QrPGLGIZWZyAwszX
	D5NTsF7O9XUNvCHEa788ySQj1jQt1c1ouKFpUHDqdN2r5Vt+6RV2PWgSjvdRpA84kTEyjZPMSGe
	tlTx5zI2CSRexv7q1ToE7K/ERt8+TIqUkW8/r3e+FD50dWWgPw/pL2Gsou8iWpLd89/dZEZJA6D
	s3g=
X-Received: by 2002:a05:600c:3511:b0:49c:fa21:1c86 with SMTP id 5b1f17b1804b1-49cfa211cd7mr354418015e9.27.1788971484445;
        Wed, 09 Sep 2026 09:31:24 -0700 (PDT)
Received: from localhost.localdomain ([84.77.88.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c06f04sm2763705e9.13.2026.09.09.09.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 09:31:23 -0700 (PDT)
From: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
To: opensbi@lists.infradead.org
Cc: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
Subject: [PATCH v2 07/14] lib: sbi_timer: add TSA annotations
Date: Wed,  9 Sep 2026 18:23:16 +0200
Message-ID: <20260909162322.29778-9-carlos.lopezr4096@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260909162322.29778-2-carlos.lopezr4096@gmail.com>
References: <20260909162322.29778-2-carlos.lopezr4096@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_093126_740310_395C5301 
X-CRM114-Status: GOOD (  12.74  )
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

QWRkIFRocmVhZCBTYWZldHkgQW5hbHlzaXMgKFRTQSkgYW5ub3RhdGlvbnMgZm9yIHRoZSB0aW1l
cgppbXBsZW1lbnRhdGlvbi4gVGhpcyBpbmNsdWRlcyBpbmRpY2F0aW5nIHdoaWNoIGZpZWxkcyBh
cmUgcHJvdGVjdGVkCmJ5IGEgc3BpbmxvY2ssIGFuZCBhbm5vdGF0aW5nIHdoaWNoIGZ1bmN0aW9u
cyBtdXN0IGJlIGNhbGxlZCB1bmRlciBhCnNwaW5sb2NrLiBFeGNsdWRlIHNiaV90aW1lcl9pbml0
KCksIGFzIHRoZSBzcGlubG9jayBjYW5ub3QgYmUgYWNxdWlyZWQKYmVmb3JlIGl0IGlzIGluaXRp
YWxpemVkLgoKU2lnbmVkLW9mZi1ieTogQ2FybG9zIEzDs3BleiA8Y2FybG9zLmxvcGV6cjQwOTZA
Z21haWwuY29tPgotLS0KIGxpYi9zYmkvc2JpX3RpbWVyLmMgfCA1ICsrKystCiAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbGliL3Ni
aS9zYmlfdGltZXIuYyBiL2xpYi9zYmkvc2JpX3RpbWVyLmMKaW5kZXggOGFiYjVlN2JlYTIwLi43
OGFhYTMyZTlkMTAgMTAwNjQ0Ci0tLSBhL2xpYi9zYmkvc2JpX3RpbWVyLmMKKysrIGIvbGliL3Ni
aS9zYmlfdGltZXIuYwpAQCAtMjMsNyArMjMsNyBAQAogc3RydWN0IHRpbWVyX3N0YXRlIHsKIAl1
NjQgdGltZV9kZWx0YTsKIAlzcGlubG9ja190IGV2ZW50X2xpc3RfbG9jazsKLQlzdHJ1Y3Qgc2Jp
X2RsaXN0IGV2ZW50X2xpc3Q7CisJc3RydWN0IHNiaV9kbGlzdCBldmVudF9saXN0IEdVQVJERURf
QlkoJmV2ZW50X2xpc3RfbG9jayk7CiAJc3RydWN0IHNiaV90aW1lcl9ldmVudCBzbW9kZV9ldjsK
IH07CiAKQEAgLTE2MCw2ICsxNjAsNyBAQCB2b2lkIHNiaV90aW1lcl9zZXRfZGVsdGFfdXBwZXIo
dWxvbmcgZGVsdGFfdXBwZXIpCiAjZW5kaWYKIAogc3RhdGljIHZvaWQgX19zYmlfdGltZXJfdXBk
YXRlX2RldmljZShzdHJ1Y3QgdGltZXJfc3RhdGUgKnRzdGF0ZSkKKwlNVVNUX0hPTEQoJnRzdGF0
ZS0+ZXZlbnRfbGlzdF9sb2NrKQogewogCXN0cnVjdCBzYmlfdGltZXJfZXZlbnQgKmV2OwogCkBA
IC0xODgsNiArMTg5LDcgQEAgc3RhdGljIHZvaWQgX19zYmlfdGltZXJfZXZlbnRfc3RvcChzdHJ1
Y3Qgc2JpX3RpbWVyX2V2ZW50ICpldikKIAogc3RhdGljIHZvaWQgX19zYmlfdGltZXJfZXZlbnRf
c3RhcnQoc3RydWN0IHRpbWVyX3N0YXRlICp0c3RhdGUsCiAJCQkJICAgIHN0cnVjdCBzYmlfdGlt
ZXJfZXZlbnQgKmV2LCB1NjQgbmV4dF9ldmVudCkKKwlNVVNUX0hPTEQoJnRzdGF0ZS0+ZXZlbnRf
bGlzdF9sb2NrKQogewogCXN0cnVjdCBzYmlfdGltZXJfZXZlbnQgKnRldiwgKm5leHRfZXYgPSBO
VUxMOwogCkBAIC0zNTAsNiArMzUyLDcgQEAgdm9pZCBzYmlfdGltZXJfc2V0X2RldmljZShjb25z
dCBzdHJ1Y3Qgc2JpX3RpbWVyX2RldmljZSAqZGV2KQogfQogCiBpbnQgc2JpX3RpbWVyX2luaXQo
c3RydWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoLCBib29sIGNvbGRfYm9vdCkKKwlOT19USFJFQURf
U0FGRVRZX0FOQUxZU0lTCiB7CiAJY29uc3Qgc3RydWN0IHNiaV9wbGF0Zm9ybSAqcGxhdCA9IHNi
aV9wbGF0Zm9ybV9wdHIoc2NyYXRjaCk7CiAJc3RydWN0IHRpbWVyX3N0YXRlICp0c3RhdGU7Ci0t
IAoyLjUxLjAKCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNi
aQo=
