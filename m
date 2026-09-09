Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B75C8C79FB6
	for <opensbi@archiver.kernel.org>; Wed,  9 Sep 2026 16:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xdqRdNXqjW8EPPkaaT3JxuSFXX4wZTNQ+3yb1yROxuM=; b=O4fd6wjhY8eN+1
	kCV3dtC9kFzRgm9c/Tl11AQ8rCS9+Bd1hDS7d7YTmLjqp/lZhYZFnrBDXRYsqjzVsAsUcUWonF4Jd
	0cBX0CscfM14LE6H2QbvOrLufEAlytrt4zSEw4C+7cJhaJ1OuYbXBx2Qv1nqwt5WfeTd5i+0zpYMf
	28HH689fK/7shQglZY0HEez+dUIVCiGeSV+Rc3WgmtShTXXeEdPNXyXPyZwBwz6VRbRNDYwzz6qkg
	97S3EtR1SaicORFF0hgOtbxLoe9Q2o8E8NQrjmpZFFS/UypJ1gUJa2DypCldZqDFX/5UqN/S3unC/
	agarNb49/cS0mNs6zZfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LCz-0000000CJo4-495R;
	Wed, 09 Sep 2026 16:31:37 +0000
Received: from mail-wr2-x0b.google.com ([2a00:1450:4864:30::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LCx-0000000CJlw-3R8q
	for opensbi@lists.infradead.org;
	Wed, 09 Sep 2026 16:31:36 +0000
Received: by mail-wr2-x0b.google.com with SMTP id ffacd0b85a97d-48431ba6e38so277125f8f.1
        for <opensbi@lists.infradead.org>; Wed, 09 Sep 2026 09:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788971494; x=1789576294; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=URBmxUXrnjMwT9ytKJln86i0rOWFgAfbdQihTchXzFM=;
        b=nd7J2NXy6cVhJlN74TCWw+QM4Z4pfh3j32PX6aTr18JhqRRS+y2rTnnuOQ92qBiS1O
         VG2KuslTTEypcSC0Igbwr6J8KZ/VO9gVLpMfrAo92Y9oglxGwj1AKQsqlQO1JrUZaKbp
         3xNh2KBepMjHCYppiwVLAehOg1wNZCWQ4WA5cIIHEqd2+7pdGpkB+wzXhEDGMamsW31f
         oGqXzBvO6OYiRn7SVPclP9ODkHKsWL5UftC//2mxkpZ9U2RgrRt4eVzjZXGwCsdscIpb
         tOTqQAUN2X0EncniC2yCI5wgrxaSFsWXjlrvB5TVdczhhZe6vP5CYb50+wrswuPF4+rx
         LbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788971494; x=1789576294;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=URBmxUXrnjMwT9ytKJln86i0rOWFgAfbdQihTchXzFM=;
        b=c6ftdiNoUs9uN2NrPTQngL/bJslcS++f3O5C26eZhBVrxjgqiQapYggYVYxVLLpIXq
         JEZ+Nq4bY1xUBCQFda36jtX5goMKJRr723ifkoCsIHvsuBhKMihpeeKQH681QIYwB86f
         CuJLCIxQp811joqNTU69fLDwuHPl5s/fpjG5rSikeGn1ppNK22Lis+qlhfTPwVxjpSrS
         m7OrbHBG2MjPFTdulerrYBJjEa19Jf07XlZomgjYhCOJfVG5xGu320p2SrixILWGx/cj
         0aaotzXfc9NIEIMm/2sJm6nAZ/+RflU7D8KY9FxUH2Q+vyhHk+bRzUr0TNGQSDwmmONI
         CIEg==
X-Gm-Message-State: AFuF++npfh0FvSwv9AOVxZL5Oq81qwN1dGnZcwkW3LxY4hcU+hRUUJTG
	a1Pg8nibRR4SakyFWqpA1K9UwhArPmvUbdgchCkVUSkzMA8mCtqpvEoAge805aMJ
X-Gm-Gg: AYBFou3NwnlztHgIyyEwrVwiUMbZuBrdSNT7CFzfLSpeUPDAAeNxt7/z51f01u+h4IP
	QEk1w7u50B8RcmUx2eG5+Q6FJjt+tBl/glwYmO9kSivQirvVmC25sah54Of4TPhKoQKs5FLVwKR
	4msm0gVFzCm5P1tsEiXgEhiFJ5nMLIysOG/M/2hHIPTkv1TpL3Ifq8fas9uDdjp9JvxtTPxzQAZ
	PG2AOf3PdskRP6jG2Oy/1sQpAH5Ec3QAR7xT9uOh2l1Yuz2LXG0HfJhnlkXtJ0+0hlYpvhHTjNA
	96j4gJuP6loFl+RBcjFd181jjMFbe8vBCn2FJGpQjZDtAGzzZJxdrJkXiMD19WUnepQ9OeHj+Vf
	Evi0tnNZhJCp3ZTM1CM0AgQ4PIHtF4bC9oqdg6rUzOn9FvTmUOO5d3fREkYz+ohpXJF44VbI+tY
	F+pQuADGKwbF+PJ0mwmZIu0kREiIoHOWQG+nymJULKsffrXedTFoVYN50FqVBrDPx2DTnnIddAG
	+7Lq5abpIssEz7Uzpbg4NVjMnxeNx9mxEL0q2B39iC54VLKQYF1TUGS3d9d5z2Yawe+oKMbxTuv
	p14=
X-Received: by 2002:a05:600c:4e03:b0:49c:e37e:4389 with SMTP id 5b1f17b1804b1-49d26d9dd0fmr1338875e9.4.1788971494108;
        Wed, 09 Sep 2026 09:31:34 -0700 (PDT)
Received: from localhost.localdomain ([84.77.88.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c06f04sm2763705e9.13.2026.09.09.09.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 09:31:31 -0700 (PDT)
From: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
To: opensbi@lists.infradead.org
Cc: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
Subject: [PATCH v2 09/14] lib: sbi_domain: add TSA annotations
Date: Wed,  9 Sep 2026 18:23:18 +0200
Message-ID: <20260909162322.29778-11-carlos.lopezr4096@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260909162322.29778-2-carlos.lopezr4096@gmail.com>
References: <20260909162322.29778-2-carlos.lopezr4096@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_093135_935713_D4BC3905 
X-CRM114-Status: GOOD (  14.74  )
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

QWRkIFRocmVhZCBTYWZldHkgQW5hbHlzaXMgKFRTQSkgYW5ub3RhdGlvbnMgZm9yIHRoZSBkb21h
aW4gaGFuZGxpbmcKY29kZS4gVGhpcyBpbmNsdWRlcyBpbmRpY2F0aW5nIHdoaWNoIGZpZWxkcyBh
cmUgcHJvdGVjdGVkIGJ5IGEgc3BpbmxvY2ssCmFuZCBhbm5vdGF0aW5nIHdoaWNoIGZ1bmN0aW9u
cyBhY3F1aXJlIGEgc3BpbmxvY2ssIGluIG9yZGVyIHRvIHByZXZlbnQKbmVzdGluZy4gRXhjbHVk
ZSBzYmlfZG9tYWluX3JlZ2lzdGVyKCkgZnJvbSBhbmFseXNpcywgYXMgaXQgaW5pdGlhbGl6ZXMK
YSBkb21haW4ncyBzcGlubG9jay4KClNpZ25lZC1vZmYtYnk6IENhcmxvcyBMw7NwZXogPGNhcmxv
cy5sb3BlenI0MDk2QGdtYWlsLmNvbT4KLS0tCiBpbmNsdWRlL3NiaS9zYmlfZG9tYWluLmggICAg
IHwgMTAgKysrKysrLS0tLQogbGliL3NiaS9zYmlfZG9tYWluLmMgICAgICAgICB8ICAzICsrKwog
bGliL3NiaS9zYmlfZG9tYWluX2NvbnRleHQuYyB8ICAyICsrCiAzIGZpbGVzIGNoYW5nZWQsIDEx
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zYmkv
c2JpX2RvbWFpbi5oIGIvaW5jbHVkZS9zYmkvc2JpX2RvbWFpbi5oCmluZGV4IDM4Nzg0YTBlMjVi
OC4uZDhjNDJiZTU5NWJlIDEwMDY0NAotLS0gYS9pbmNsdWRlL3NiaS9zYmlfZG9tYWluLmgKKysr
IGIvaW5jbHVkZS9zYmkvc2JpX2RvbWFpbi5oCkBAIC0xOTMsMTAgKzE5MywxMCBAQCBzdHJ1Y3Qg
c2JpX2RvbWFpbiB7CiAJc3RydWN0IHNiaV9kb21haW5fc3RhdGVfcHJpdiBzdGF0ZV9wcml2Owog
CS8qKiBMb2dpY2FsIGluZGV4IG9mIHRoaXMgZG9tYWluICovCiAJdTMyIGluZGV4OwotCS8qKiBI
QVJUcyBhc3NpZ25lZCB0byB0aGlzIGRvbWFpbiAqLwotCXN0cnVjdCBzYmlfaGFydG1hc2sgYXNz
aWduZWRfaGFydHM7CiAJLyoqIFNwaW5sb2NrIGZvciBhY2Nlc3NpbmcgYXNzaWduZWRfaGFydHMg
Ki8KIAlzcGlubG9ja190IGFzc2lnbmVkX2hhcnRzX2xvY2s7CisJLyoqIEhBUlRzIGFzc2lnbmVk
IHRvIHRoaXMgZG9tYWluICovCisJc3RydWN0IHNiaV9oYXJ0bWFzayBhc3NpZ25lZF9oYXJ0cyBH
VUFSREVEX0JZKCZhc3NpZ25lZF9oYXJ0c19sb2NrKTsKIAkvKiogTmFtZSBvZiB0aGlzIGRvbWFp
biAqLwogCWNoYXIgbmFtZVs2NF07CiAJLyoqIFBvc3NpYmxlIEhBUlRzIGluIHRoaXMgZG9tYWlu
ICovCkBAIC0yNTIsNyArMjUyLDggQEAgZXh0ZXJuIHN0cnVjdCBzYmlfZGxpc3QgZG9tYWluX2xp
c3Q7CiAgKiBAcGFyYW0gaGFydGluZGV4IHRoZSBIQVJUIGluZGV4CiAgKiBAcmV0dXJuIHRydWUg
aWYgSEFSVCBpcyBhc3NpZ25lZCB0byBkb21haW4gb3RoZXJ3aXNlIGZhbHNlCiAgKi8KLWJvb2wg
c2JpX2RvbWFpbl9pc19hc3NpZ25lZF9oYXJ0KGNvbnN0IHN0cnVjdCBzYmlfZG9tYWluICpkb20s
IHUzMiBoYXJ0aW5kZXgpOworYm9vbCBzYmlfZG9tYWluX2lzX2Fzc2lnbmVkX2hhcnQoY29uc3Qg
c3RydWN0IHNiaV9kb21haW4gKmRvbSwgdTMyIGhhcnRpbmRleCkKKwlNVVNUX05PVF9IT0xEKCZk
b20tPmFzc2lnbmVkX2hhcnRzX2xvY2spOwogCiAvKioKICAqIEdldCB0aGUgYXNzaWduZWQgSEFS
VCBtYXNrIGZvciBnaXZlbiBkb21haW4KQEAgLTI2MSw3ICsyNjIsOCBAQCBib29sIHNiaV9kb21h
aW5faXNfYXNzaWduZWRfaGFydChjb25zdCBzdHJ1Y3Qgc2JpX2RvbWFpbiAqZG9tLCB1MzIgaGFy
dGluZGV4KTsKICAqIEByZXR1cm4gMCBvbiBzdWNjZXNzIGFuZCBTQklfRXh4eCAoPCAwKSBvbiBm
YWlsdXJlCiAgKi8KIGludCBzYmlfZG9tYWluX2dldF9hc3NpZ25lZF9oYXJ0bWFzayhjb25zdCBz
dHJ1Y3Qgc2JpX2RvbWFpbiAqZG9tLAotCQkJCSAgICAgc3RydWN0IHNiaV9oYXJ0bWFzayAqbWFz
ayk7CisJCQkJICAgICBzdHJ1Y3Qgc2JpX2hhcnRtYXNrICptYXNrKQorCU1VU1RfTk9UX0hPTEQo
JmRvbS0+YXNzaWduZWRfaGFydHNfbG9jayk7CiAKIC8qKgogICogSW5pdGlhbGl6ZSBhIGRvbWFp
biBtZW1vcnkgcmVnaW9uIGJhc2VkIG9uIGl0J3MgcGh5c2ljYWwKZGlmZiAtLWdpdCBhL2xpYi9z
Ymkvc2JpX2RvbWFpbi5jIGIvbGliL3NiaS9zYmlfZG9tYWluLmMKaW5kZXggNzlkNjFjNTRmNTQ1
Li5kYzA4MjhiZmRkNDcgMTAwNjQ0Ci0tLSBhL2xpYi9zYmkvc2JpX2RvbWFpbi5jCisrKyBiL2xp
Yi9zYmkvc2JpX2RvbWFpbi5jCkBAIC02MCw2ICs2MCw3IEBAIHZvaWQgc2JpX3VwZGF0ZV9oYXJ0
aW5kZXhfdG9fZG9tYWluKHUzMiBoYXJ0aW5kZXgsIHN0cnVjdCBzYmlfZG9tYWluICpkb20pCiB9
CiAKIGJvb2wgc2JpX2RvbWFpbl9pc19hc3NpZ25lZF9oYXJ0KGNvbnN0IHN0cnVjdCBzYmlfZG9t
YWluICpkb20sIHUzMiBoYXJ0aW5kZXgpCisJTVVTVF9OT1RfSE9MRCgmZG9tLT5hc3NpZ25lZF9o
YXJ0c19sb2NrKQogewogCWJvb2wgcmV0OwogCXN0cnVjdCBzYmlfZG9tYWluICp0ZG9tID0gKHN0
cnVjdCBzYmlfZG9tYWluICopZG9tOwpAQCAtNzYsNiArNzcsNyBAQCBib29sIHNiaV9kb21haW5f
aXNfYXNzaWduZWRfaGFydChjb25zdCBzdHJ1Y3Qgc2JpX2RvbWFpbiAqZG9tLCB1MzIgaGFydGlu
ZGV4KQogCiBpbnQgc2JpX2RvbWFpbl9nZXRfYXNzaWduZWRfaGFydG1hc2soY29uc3Qgc3RydWN0
IHNiaV9kb21haW4gKmRvbSwKIAkJCQkgICAgIHN0cnVjdCBzYmlfaGFydG1hc2sgKm1hc2spCisJ
TVVTVF9OT1RfSE9MRCgmZG9tLT5hc3NpZ25lZF9oYXJ0c19sb2NrKQogewogCXVsb25nIHJldCA9
IDA7CiAJc3RydWN0IHNiaV9kb21haW4gKnRkb20gPSAoc3RydWN0IHNiaV9kb21haW4gKilkb207
CkBAIC02MjcsNiArNjI5LDcgQEAgdm9pZCBzYmlfZG9tYWluX2R1bXBfYWxsKGNvbnN0IGNoYXIg
KnN1ZmZpeCkKIAogaW50IHNiaV9kb21haW5fcmVnaXN0ZXIoc3RydWN0IHNiaV9kb21haW4gKmRv
bSwKIAkJCWNvbnN0IHN0cnVjdCBzYmlfaGFydG1hc2sgKmFzc2lnbl9tYXNrKQorCU5PX1RIUkVB
RF9TQUZFVFlfQU5BTFlTSVMKIHsKIAl1MzIgaTsKIAlpbnQgcmM7CmRpZmYgLS1naXQgYS9saWIv
c2JpL3NiaV9kb21haW5fY29udGV4dC5jIGIvbGliL3NiaS9zYmlfZG9tYWluX2NvbnRleHQuYwpp
bmRleCAzN2NiZTE3NTFkODkuLjUzYmYwYzIwNzk3MSAxMDA2NDQKLS0tIGEvbGliL3NiaS9zYmlf
ZG9tYWluX2NvbnRleHQuYworKysgYi9saWIvc2JpL3NiaV9kb21haW5fY29udGV4dC5jCkBAIC0x
MDcsNiArMTA3LDggQEAgc3RhdGljIHZvaWQgaGFydF9jb250ZXh0X3NldChzdHJ1Y3Qgc2JpX2Rv
bWFpbiAqZG9tLCB1MzIgaGFydGluZGV4LAogICovCiBzdGF0aWMgaW50IHN3aXRjaF90b19uZXh0
X2RvbWFpbl9jb250ZXh0KHN0cnVjdCBoYXJ0X2NvbnRleHQgKmN0eCwKIAkJCQkJICBzdHJ1Y3Qg
aGFydF9jb250ZXh0ICpkb21fY3R4KQorCU1VU1RfTk9UX0hPTEQoJmN0eC0+ZG9tLT5hc3NpZ25l
ZF9oYXJ0c19sb2NrKQorCU1VU1RfTk9UX0hPTEQoJmRvbV9jdHgtPmRvbS0+YXNzaWduZWRfaGFy
dHNfbG9jaykKIHsKIAl1MzIgaGFydGluZGV4ID0gY3VycmVudF9oYXJ0aW5kZXgoKTsKIAlzdHJ1
Y3Qgc2JpX3RyYXBfY29udGV4dCAqdHJhcF9jdHg7Ci0tIAoyLjUxLjAKCgotLSAKb3BlbnNiaSBt
YWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
