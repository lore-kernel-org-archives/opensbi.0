Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD08606A31B
	for <opensbi@archiver.kernel.org>; Fri, 23 Oct 2026 07:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GdSHuHOM;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=YJxPU9QN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PdJxb2pgW8xVCthC54tFTTr8e2x75DYfZWRmfkOmRGk=; b=GdSHuHOM8z2RnFcpYHUUH1wfJ4
	SeJ7kgGjMaCwXJ07uTQHOPTJVxc0jfX2VoxmWW6KGRiCSTIDn8AEHBKLC7OVHIBlDE9z78XCC72qf
	PZM5gel0wfuqQtyuYRPV4rcccsFB/zklTbJI/KuG+Bw2oVSem2bX7f9x9y1U7+ZvEBh8CSAQTTaIh
	cwOk3TOJxp9rrUD857cP7b9a2zNrO4HVlYD/7FWdNkgsK9jXXSKwQIHZ0N0xBnyfGIkTCMvyG69zP
	1/iDS37eFoCcj1PL5R6ZHXKxUgC1Hfjgr6z/n+0vVsD6IzU3lwttDWfmPdeE6XLoEbBxtYsoDCx/F
	Q85XNx3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9rH-0000000FmeX-3itZ;
	Fri, 23 Oct 2026 07:38:35 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9rE-0000000Fmdk-3mD1
	for opensbi@lists.infradead.org;
	Fri, 23 Oct 2026 07:38:34 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-48e3b22e971so70029f8f.0
        for <opensbi@lists.infradead.org>; Fri, 23 Oct 2026 00:38:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792741111; cv=none;
        d=google.com; s=arc-20260327;
        b=WcHy8uhVhYpuOvnK9OMQfK8NGyIsGBxVmwlPtvOB4zu/fzTbigsPOEtH25bl7DVXLC
         5BFcgUeSHo+vUaFDJIx8GuFZ8w+kt30Ijd1PxjL8cYk1h34zT5c2D5yz7uLwridoiS2c
         oVh/0yN/8T2ST7ypPDq/KyX0D4ojzL6y+rJMROMQ+z/fbvZ4ytqy/a8K0/gsxMb2LOZE
         5kGfgKrrO5idm0UFOmNQv8lg5VEWAy+OElta8Mk1FBQtCJhbSKEq1I440k4pv0FaMUUZ
         fVFZ2LcF6viLsr6f8mtPwq1IHic51nNrIoLurfj2w96flyYrKaPgWkivXd/eFgm/4viB
         nd9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xPnBOVXfeEqqI/mLo0mtR7Vhj4+o3ZaLLnWoB6h3ykY=;
        fh=JU/8e/U2lsxU6FcHv2RmplRykuLAG/aCOwx5VDrrj7Q=;
        b=RETwHPA4bJHgI9ln9/+qQvwHvWRBDeyFide5PG2hp9qtOF4RW6y0wZ5Cu5AuawPIXw
         FKF4rHOpL97hgZdiOupKnRFEBbn36LmZgj8knkfYgSwsieo+JaRFGV3tSgGZmOGyzixr
         +l9i1TGK244qzPp3GzQ829ZtNPtNORNw4//Y7ofubbuOWHnqp3mzBVQmqRC4iseVlXn9
         /z7ir8Av76iR8QdkXVsVhjpsUEbjwGun070KFndpMeMl1eSTjAMZXPOdTATZ3EiFaTuu
         OlVjTmEf8fkzASkMVojHUVxQEZKBuwayFKVxhGwbSwWTc3NQKqeOS1po4Hw959bhOG+C
         rPug==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792741111; x=1793345911; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xPnBOVXfeEqqI/mLo0mtR7Vhj4+o3ZaLLnWoB6h3ykY=;
        b=YJxPU9QNmR820xnw+t+hnbLZaF2HJttqe3ZAAEbgQZinUB/eV6NcG/IBZ3jg1duUe2
         y72TC127SxABmNmKd3NbaGYAOdxUAPW+fANbRUCd3yoV/s9h1Xq4qaWOAe19+4R6yDHt
         AzEQvoq3RC5sf1W/3Nleiq3jGg+z99tyHb6THJUVtEsQjJ/mNAFnOW9t/tOWiX8o2rc/
         gsA9yPI08KQOrKGtW78AWJCA9EF+bIUJ6hvVbUlzMQ0FpQ2+k7tTtw4FyV8U5kWD2HVZ
         F8LGX5zv3Q2n9kbhox2OhnYbRhSWbjjfJEru0w9l76+b6xVgN+n7YzDEKZLnfigYakKW
         AoLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792741111; x=1793345911;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xPnBOVXfeEqqI/mLo0mtR7Vhj4+o3ZaLLnWoB6h3ykY=;
        b=0p8/V071JRVYXj8GfBTOjNUPuYX7Y5Flce0ti5eKOjRaoO7C5hOu37bMror/rDh6cX
         H0a/HpgXSFEx3BYoOf134Ms44r0KJ0otw5s7zC3yracRNhq4Q3cZaX4ODF0X1YtevFZX
         AGBgQuKbdyCzkneTmygI8hulMDs+MDbFWb+cRtXmVKCHDbZLwtHy8FZ0wK/ZD9KE0NYw
         BBR+IzzuRGK8QQ+7yNHHOmKkuRRrEN8Rd+fCtYsgtRMd8Au78NG0e/KYSWWVZ0Phsn2h
         45LyxIlR75yTrFkRIcccBFXWEILJbQpzMNsMYu67GPS5/dQn9atP90eoK6ffrvLYQcRp
         mKFQ==
X-Gm-Message-State: AFq9FYK0XpjNmAUubj2UidOqxhlh2RMKkXer9es9NgI3hT1WFhGrjVsx
	SRbEmPRYQGuNr50Or/WjaevncPhzhLgEJyFMLKV+3MNoNXINFNI3FRtNupzgpA1vSm/NBeCCr2Y
	TD6CdwIOGAKZ9FApo0d2Ldt+vDE5qJzug8SgNwfMUsviJKMGKsW6z
X-Gm-Gg: AYBFou0zkMdg5jo+MGxNyKJNcy4MZU5xPznByHuPXMSDtIGA23rbxYQkDJPQg2mmwgW
	E/diqWO7oprv4J8if/OH+19vMC1BMTdCHYTNRuh+KbVccO03nQEORFPXOQZJMzbB/sBYCsk95lS
	ek5JyRtDdxQdPAEVM7BG9OiKccrec9re2YN0fvFPAB3i3L/XoznagdKNRWMnzRFniG/sp2Uu9Xo
	SMJtTAofTTmS1JB1qF2RjED7bm3tzjbHCRXYXF7nhf3ZclOmmsIIjdj5uqVGuM+B8hFuhXR5iv4
	b6pQD3Bsp6qjZVXQDmyEXaTODD4SyfFkv3myBP4HbmQNXcq9TaLBkvX//M1vbyD1lmzrgsESmE2
	o1kpOOAH5Wk6JUBsih5mmSeiEtqL0hE4sz1To34fYSmqpgIEmSSojPQJkrKo7nEMI4/TuOZxEXl
	VqnMC47admbpbyqJbhF1/psUB4Y2lg2lXOHDWQO6qbINd+aocERFRYZJ8=
X-Received: by 2002:a05:6000:1608:b0:48d:c178:f6e9 with SMTP id
 ffacd0b85a97d-48e38588c6amr1509066f8f.20.1792741110733; Fri, 23 Oct 2026
 00:38:30 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260828142521.14267-1-pengpeng@iscas.ac.cn>
In-Reply-To: <20260828142521.14267-1-pengpeng@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 23 Oct 2026 13:08:17 +0530
X-Gm-Features: AclHuK-Duqmd8bscMlhAn_Uo37yYY1gfh5msxMsqXUld84h2xIyCcOSdLLTi9jw
Message-ID: <CAAhSdy2n7WYunHywfjjg7ZK3WeaM1VtO4pvPeV3g2gn3hFvu9A@mail.gmail.com>
Subject: Re: [PATCH] lib: utils/mailbox: reject undersized RPMI shmem queues
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: opensbi@lists.infradead.org, Rahul Pathak <rpathak@ventanamicro.com>, 
	Subrahmanya Lingappa <slingappa@ventanamicro.com>, Anup Patel <anup.patel@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_003832_976276_8BCC5A82 
X-CRM114-Status: GOOD (  19.84  )
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBBdWcgMjgsIDIwMjYgYXQgNzo1NeKAr1BNIFBlbmdwZW5nIEhvdSA8cGVuZ3BlbmdA
aXNjYXMuYWMuY24+IHdyb3RlOgo+Cj4gVGhlIFJQTUkgc2hhcmVkLW1lbW9yeSBtYWlsYm94IHRy
YW5zcG9ydCBkZXJpdmVzIHFjdHgtPm51bV9zbG90cyBmcm9tIHRoZQo+IGRldmljZS10cmVlIHF1
ZXVlIHdpbmRvdyBzaXplIGFuZCB0aGUgcmlzY3Ysc2xvdC1zaXplIHByb3BlcnR5LiBUaGUgY3Vy
cmVudAo+IGluaXRpYWxpemF0aW9uIG9ubHkgY2hlY2tzIHRoYXQgdGhlIHF1ZXVlIHdpbmRvdyBp
cyBub256ZXJvIGJlZm9yZQo+IHN1YnRyYWN0aW5nIHRoZSB0d28gUlBNSSBoZWFkZXIgc2xvdHMu
Cj4KPiBSZWplY3QgcXVldWUgd2luZG93cyB0aGF0IGNhbm5vdCBwcm92aWRlIHRoZSB0d28gaGVh
ZGVyIHNsb3RzIHBsdXMgYXQgbGVhc3QKPiB0d28gZGF0YSByaW5nIHNsb3RzLiBBIHplcm8gZGF0
YS1zbG90IGNvdW50IHdvdWxkIGxhdGVyIGJlIHVzZWQgYXMgYSBtb2R1bG8KPiBkaXZpc29yLCBh
bmQgYSBvbmUtc2xvdCByaW5nIGlzIGFsc28gdW51c2FibGUgd2l0aCB0aGUgY3VycmVudCBmdWxs
L2VtcHR5Cj4gY29udmVudGlvbiBiZWNhdXNlIG9uZSBlbXB0eSBzbG90IGlzIHJlc2VydmVkIHRv
IGRpc3Rpbmd1aXNoIHRoZSB0d28KPiBzdGF0ZXMuCj4KPiBBbHNvIHJlamVjdCBkYXRhLXNsb3Qg
Y291bnRzIHRoYXQgY2Fubm90IGJlIHJlcHJlc2VudGVkIGJ5IHFjdHgtPm51bV9zbG90cy4KPgo+
IEZpeGVzOiA5MWY0NmZiNDdlZWYgKCJsaWIvdXRpbHM6IEFkZCBSUE1JIG1lc3NhZ2luZyBwcm90
b2NvbCBhbmQgc2hhcmVkIG1lbW9yeSB0cmFuc3BvcnQgc3VwcG9ydCIpCj4gU2lnbmVkLW9mZi1i
eTogUGVuZ3BlbmcgSG91IDxwZW5ncGVuZ0Bpc2Nhcy5hYy5jbj4KCkxHVE0uCgpSZXZpZXdlZC1i
eTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KCkFwcGxpZWQgdGhpcyBwYXRjaCB0
byB0aGUgcmlzY3Yvb3BlbnNiaSByZXBvLgoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICBsaWIvdXRp
bHMvbWFpbGJveC9mZHRfbWFpbGJveF9ycG1pX3NobWVtLmMgfCAxMyArKysrKysrKystLS0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvbGliL3V0aWxzL21haWxib3gvZmR0X21haWxib3hfcnBtaV9zaG1lbS5jIGIvbGli
L3V0aWxzL21haWxib3gvZmR0X21haWxib3hfcnBtaV9zaG1lbS5jCj4gaW5kZXggNTIxZTA2NzMu
LjQ0NTc2MTdhIDEwMDY0NAo+IC0tLSBhL2xpYi91dGlscy9tYWlsYm94L2ZkdF9tYWlsYm94X3Jw
bWlfc2htZW0uYwo+ICsrKyBiL2xpYi91dGlscy9tYWlsYm94L2ZkdF9tYWlsYm94X3JwbWlfc2ht
ZW0uYwo+IEBAIC01ODksNiArNTg5LDcgQEAgc3RhdGljIGludCBycG1pX3NobWVtX3RyYW5zcG9y
dF9pbml0KHN0cnVjdCBycG1pX3NobWVtX21ib3hfY29udHJvbGxlciAqbWN0bCwKPiAgICAgICAg
IGNvbnN0IGZkdDMyX3QgKnByb3A7Cj4gICAgICAgICBpbnQgY291bnQsIGxlbiwgcmV0LCBxaWQ7
Cj4gICAgICAgICB1aW50NjRfdCByZWdfYWRkciwgcmVnX3NpemU7Cj4gKyAgICAgICB1NjQgdG90
YWxfc2xvdHM7Cj4gICAgICAgICBzdHJ1Y3Qgc21xX3F1ZXVlX2N0eCAqcWN0eDsKPgo+ICAgICAg
ICAgcmV0ID0gZmR0X25vZGVfY2hlY2tfY29tcGF0aWJsZShmZHQsIG5vZGVvZmYsCj4gQEAgLTYz
OCw2ICs2MzksMTQgQEAgc3RhdGljIGludCBycG1pX3NobWVtX3RyYW5zcG9ydF9pbml0KHN0cnVj
dCBycG1pX3NobWVtX21ib3hfY29udHJvbGxlciAqbWN0bCwKPiAgICAgICAgICAgICAgICAgaWYg
KHJldCA8IDAgfHwgIXJlZ19hZGRyIHx8ICFyZWdfc2l6ZSkKPiAgICAgICAgICAgICAgICAgICAg
ICAgICByZXR1cm4gU0JJX0VOT0VOVDsKPgo+ICsgICAgICAgICAgICAgICAvKiBjYWxjdWxhdGUg
bnVtYmVyIG9mIHNsb3RzIGluIGVhY2ggcXVldWUgKi8KPiArICAgICAgICAgICAgICAgdG90YWxf
c2xvdHMgPSByZWdfc2l6ZSAvIG1jdGwtPnNsb3Rfc2l6ZTsKPiArICAgICAgICAgICAgICAgaWYg
KHRvdGFsX3Nsb3RzIDwgUlBNSV9RVUVVRV9IRUFERVJfU0xPVFMgKyAyIHx8Cj4gKyAgICAgICAg
ICAgICAgICAgICB0b3RhbF9zbG90cyAtIFJQTUlfUVVFVUVfSEVBREVSX1NMT1RTID4gKHUzMikt
MSkKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VJTlZBTDsKPiArCj4gKyAg
ICAgICAgICAgICAgIHFjdHgtPm51bV9zbG90cyA9IHRvdGFsX3Nsb3RzIC0gUlBNSV9RVUVVRV9I
RUFERVJfU0xPVFM7Cj4gKwo+ICAgICAgICAgICAgICAgICByZXQgPSBzYmlfZG9tYWluX3Jvb3Rf
YWRkX21lbXJhbmdlKHJlZ19hZGRyLCByZWdfc2l6ZSwgcmVnX3NpemUsCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKFNCSV9ET01BSU5fTUVNUkVH
SU9OX01NSU8gfAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBTQklfRE9NQUlOX01FTVJFR0lPTl9NX1JFQURBQkxFIHwKPiBAQCAtNjQ1LDEwICs2
NTQsNiBAQCBzdGF0aWMgaW50IHJwbWlfc2htZW1fdHJhbnNwb3J0X2luaXQoc3RydWN0IHJwbWlf
c2htZW1fbWJveF9jb250cm9sbGVyICptY3RsLAo+ICAgICAgICAgICAgICAgICBpZiAocmV0KQo+
ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4KPiAtICAgICAgICAgICAgICAg
LyogY2FsY3VsYXRlIG51bWJlciBvZiBzbG90cyBpbiBlYWNoIHF1ZXVlICovCj4gLSAgICAgICAg
ICAgICAgIHFjdHgtPm51bV9zbG90cyA9Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgKHJlZ19z
aXplIC0gKG1jdGwtPnNsb3Rfc2l6ZSAqIFJQTUlfUVVFVUVfSEVBREVSX1NMT1RTKSkgLyBtY3Rs
LT5zbG90X3NpemU7Cj4gLQo+ICAgICAgICAgICAgICAgICAvKiBzZXR1cCBxdWV1ZSBwb2ludGVy
cyAqLwo+ICAgICAgICAgICAgICAgICBxY3R4LT5oZWFkcHRyID0gKCh2b2lkICopKHVuc2lnbmVk
IGxvbmcpcmVnX2FkZHIpICsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFJQTUlf
UVVFVUVfSEVBRF9TTE9UICogbWN0bC0+c2xvdF9zaXplOwo+Cj4gYmFzZS1jb21taXQ6IDRlNzlm
ZDdkZTU5ZjFiMjg5OTA5MmMxYTg0Y2U2OGM4ZWJjNjhmOTMKPiAtLQo+IDIuNDMuMAo+Cj4KPiAt
LQo+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4g
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCgotLSAK
b3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
