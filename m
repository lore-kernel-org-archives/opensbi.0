Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372F2606A321
	for <opensbi@archiver.kernel.org>; Tue, 24 Nov 2026 09:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TP7INTAl;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=FFo1y8Hx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+efYE64UOfUJQTaH74s7VpK73Y3qdPGGMbWtlFR5ui0=; b=TP7INTAlhXPZlxM/2EdcujyfRS
	GJb63q1I19+ywQNWhgKPBUwr2btE2fGL55HWk/ArYJ+RByUbLCnBOvvd9FTUbx00crhN2XckjRbQa
	sT27XgduhtBC880ze3Jlv3lurHKBvkImNikR3p/TRl2Ykx4zNV6eBtXvAqLpxguBV/0WfaOXsFw06
	cNY/qebBye1vopAFbzbarbLwLAUl+y872peClKxnorF/6DYE2Jp542Jz0v78hcJhc9YtGqc8neqlT
	BxQuqPGFjInQiLvCNrhDiNk9pkoLfRx0VyDXzmDYGeG81HVqc+WeiGhNbi3Kpgn/5+1rGlxYU9ciR
	bPSma7ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVnHN-000000069vz-0nep;
	Tue, 24 Nov 2026 09:57:37 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVnH9-000000069oB-3q0B
	for opensbi@lists.infradead.org;
	Tue, 24 Nov 2026 09:57:35 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so39395605e9.2
        for <opensbi@lists.infradead.org>; Tue, 24 Nov 2026 01:57:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795514242; cv=none;
        d=google.com; s=arc-20260327;
        b=ieNW4kocVUcf6avCThUBbK3GIXUOai/3+EruPmGDx3DlrNFL/FmjxaMhy4nAbH2NFB
         DigBad8pRU+r4HHuL+oxMdLqr3omjKg8c17hwY1S9zOaHY06Wp9gGz6RVGPIWrC2fxks
         q4IR4pHtqz/i9ycFQRT9rsOl11zfUdFE/xjj384ghV27npgy4zOCvJbCFFu4+3I4IDgi
         8PuNi/yCF9RRJ/fb5ZHB798zxOgZHtoSPH8QUnsvxqX+v9XJ8T/y15rYalTrERjxBeCq
         EL6QOlVempUdDzlLc7CYKxh82yixgG9lweW4SzH5JwOM6uxnyeJ2Jt0wOTXU3SZ39FAC
         FGvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qtx9i8WwVG6SswLlHdKLJoZrLfmyLIpVhLoZb9c/HX4=;
        fh=s0V2QxfkZ31uI08A+gYD94xQ3QEn9NHnxJRAVF9iZzc=;
        b=pn9zr0hWdu1sbumXork2WTiYWc8S1IXTC6APKm2xRfT9o30fdxoqZ1n2WcjdjYxy+X
         xISjIsdrKSHB7KQfdPM8WgDQH2US1I6ClWUAIxnAfZOK1IAilJcB3CrPCM8HT/6Lec3+
         ikP3xN5fW/dELZfqiSANJ/oDDUPALHwRQhoqTE2lo3jtiS3l9iLLTirjoi2ZFEhJv8Hd
         rLVyROUL4OTw96HmBrN2M8c0iGTIMEAqUKLHIPT7/fDuCVeuP62m3Zqs8RpxYeQHO28c
         +6iInWAH6ETOt9bouapWzmLya666udAL9b6NqFo0W75CMJirRSE6seqc5stbZuqzdNq7
         /Z4A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795514242; x=1796119042; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qtx9i8WwVG6SswLlHdKLJoZrLfmyLIpVhLoZb9c/HX4=;
        b=FFo1y8Hxtz5dD7RuouAxqQb4MT7C4p5/+vslXomKYovdtqAviSiN/2K/bsuSEuOfas
         V5V5XUK+Fg2gm5VM/uakb9mJ3Mz/Qw+Lz7pjzrfKvNfNXqqPK3ASq/H98n7I2xXCs+Cz
         tBUTUnX5IKc36e4xDKYAdTDR1xRpE3jl/Cga6Ticxq3bYDZCUgUm6gVQJZGpG9EbMgpX
         b4aWIdl+e3vvSx3/RSKxxHJcXiATHaknVjzAW5s7nPbM0xibkJWiR4JvETLOzQoESccc
         PbqKf1h+bsB0p8FDvGZNV/VPLoaeMSCVXDpi7Bj/GnpShiMxEceSA65Oq4CCY6oV2wz0
         6xzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795514242; x=1796119042;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qtx9i8WwVG6SswLlHdKLJoZrLfmyLIpVhLoZb9c/HX4=;
        b=hPqkRUDMIdMvG1xL8UrbhFnf4J5rj538oDJ4WYVw88IDXt3gW+cwXzw5B96YexApfd
         qAJeSeWHDQHnnT78OfJ1pP7ATNdu7B8dF6ELONjrxq0FR0Zf1cenb6yETc14JAHQlvKl
         Xkt5Ck/O6xn9SHqCedGwKrk5Ie840XJ83IYMW5h8jRhrYrpGk9rp3r7LXkNCMcZQ6vQw
         AAVgjXA7U+X9UEzDXZY+NntRnySoC6+M94K7k19PhJOZkC/564oPqQrNvGAwMQ7j2amJ
         7EYftYeovVoFoObWQBpLBtl+q40qza7gVXA4dor3Ia2Dtxx7+GkZ39eLeswxlwVYlIO3
         TiAg==
X-Gm-Message-State: APuU4Z8M5XkHTuKNIiuYX3Cx9kKuZfJEtPAOkIY/LStjBFrdSCceazvf
	vDvr1rTsZdAENoT62CpnoLU19C18x2s2FlVf00SRa4UmokAheiBjgjfL1xY6EhmQgZX+/fzc4Xs
	SdFdMudj7aoVMkVk2Cky6V91OqNl9ZMnMZBo3YZkWpg==
X-Gm-Gg: AZFdTZcjlkB2g7N0AKK34oREoWChFxWZ2whb6KzbXDkOE1nUQhSNdE1zzxM/H3dCi2p
	dRjLX1lP5hv4XCK0VZUwbNBDnTK4kUzBramxHkDse8odndJlLJ+J/kZKD+skYDBW03CDN0Ml8Z4
	zNd7ePlmzmQ1VAFHJJ8qgKYO3ARzLSR13AFmt5swKjbpztMUnnNG0TFNZ0lli6SCtXXMnc7uy0R
	/bk1MB2jTr9itp4he9OjdN7NyBXstvY6LQXWAHZFH7YOF+0xXUBx4XSE2x9krZpE6dc45DB/qy+
	vXdDiLIe53PHO8PVF6ouB3ypmVb8w/Kw0hBDLec331V1wWA6Ax8NpOuw5M4ydtW8FPBi8f9F3fX
	2JwTHZ4fA9wekpXdBRVoH5NjIOYFh7laayNY7Bp5VGVFc5vbvo6+bAFcvTHgllrXZyL13zHG/Wq
	y3oHcOJV3on6Mdzgr7rF9++0VyV54ls98TVMLRYmNWwxWxqwibkHLLLmNzWnw5c7U7t0IjwDS96
	V4A
X-Received: by 2002:a05:600c:34c9:b0:4a3:5d64:df91 with SMTP id
 5b1f17b1804b1-4bb88810d28mr310460635e9.18.1795514241519; Tue, 24 Nov 2026
 01:57:21 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261124041631.1049169-1-peter.lin@sifive.com> <20261124041631.1049169-5-peter.lin@sifive.com>
In-Reply-To: <20261124041631.1049169-5-peter.lin@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 24 Nov 2026 15:27:09 +0530
X-Gm-Features: Aa3M54rTw9Gu68bxCyMD28gr9o-MPmFy4sY0fkT3Pwl3GyIfjJQzZJtX1c_gH68
Message-ID: <CAAhSdy2LW+AEiq0pmoHHNWwTyL787t+BjNxhT3DAkk2xdkfF1Q@mail.gmail.com>
Subject: Re: [PATCH v6 4/9] lib: sbi_hart: lock mwid CSR for RoT immutability
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, pawandeep.oza@oss.qualcomm.com, 
	rkrcmar@qti.qualcomm.com, raymond.mao@riscstar.com, robin.randhawa@sifive.com, 
	samuel.holland@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_015724_000787_3217B3DE 
X-CRM114-Status: GOOD (  20.11  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCBOb3YgMjQsIDIwMjYgYXQgOTo0NuKAr0FNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gTG9jayB0aGUgTS1tb2RlIFdvcmxkIElEICht
d2lkKSBDU1IgZHVyaW5nIGhhcnQgcmUtaW5pdGlhbGl6YXRpb24KPiB0byBlbmZvcmNlIGltbXV0
YWJpbGl0eSBvZiB0aGUgV0lEIGVzdGFibGlzaGVkIGJ5IHRoZSByb290LW9mLXRydXN0Lgo+Cj4g
T3BlblNCSSBkb2VzIG5vdCBhc3NpZ24gdGhlIFdJRCB2YWx1ZSBpdHNlbGY7IGl0IG9ubHkgc2V0
cyBNV0lEX0xPQ0sKPiB0byBmcmVlemUgdGhlIHZhbHVlIGVzdGFibGlzaGVkIGJ5IHByaW9yIFJv
VCBzdGFnZS4gVGhlIE1XSURfTE9DSyBiaXQKPiBhdCBYTEVOLTEgaXMgc3RpY2t5IGFuZCBtYWtl
cyB0aGUgQ1NSIHJlYWQtb25seSB1bnRpbCByZXNldCwgZW5mb3JjaW5nCj4gYSB0ZW1wb3JhbCBz
ZWN1cml0eSBib3VuZGFyeSBwZXIgdGhlIFJJU0MtViBXb3JsZHMgc3BlY2lmaWNhdGlvbi4KPgo+
IFNpZ25lZC1vZmYtYnk6IFl1LUNoaWVuIFBldGVyIExpbiA8cGV0ZXIubGluQHNpZml2ZS5jb20+
Cj4gUmV2aWV3ZWQtYnk6IFBhd2FuZGVlcCBPemEgPHBhd2FuZGVlcC5vemFAb3NzLnF1YWxjb21t
LmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9y
Zz4KClJlZ2FyZHMsCkFudXAKCj4gLS0tCj4gQ2hhbmdlcyB2NS0+djY6Cj4gLSBBZGQgd2Fybmlu
ZyBtZXNzYWdlIHdoZW4gcG13aWQgIT0gbXdpZCAoQW51cCkKPiAtLS0KPiAgbGliL3NiaS9zYmlf
aGFydC5jIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyNyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfaGFydC5jIGIv
bGliL3NiaS9zYmlfaGFydC5jCj4gaW5kZXggZDg2YWJmMDcuLjhlOGY4NGNkIDEwMDY0NAo+IC0t
LSBhL2xpYi9zYmkvc2JpX2hhcnQuYwo+ICsrKyBiL2xpYi9zYmkvc2JpX2hhcnQuYwo+IEBAIC00
NjksNiArNDY5LDMxIEBAIHN0YXRpYyBpbnQgaGFydF9taHBtX2dldF9hbGxvd2VkX2JpdHModm9p
ZCkKPiAgICAgICAgIHJldHVybiBudW1fYml0czsKPiAgfQo+Cj4gK3N0YXRpYyB2b2lkIHNtd2lk
X2hhcnRfaW5pdChzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gpCj4gK3sKPiArICAgICAgIHN0
cnVjdCBzYmlfaGFydF9mZWF0dXJlcyAqaGZlYXR1cmVzID0gc2JpX2hhcnRfZmVhdHVyZXNfcHRy
KHNjcmF0Y2gpOwo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBtd2lkOwo+ICsKPiArICAgICAgIGlm
ICghc2JpX2hhcnRfaGFzX2V4dGVuc2lvbihzY3JhdGNoLCBTQklfSEFSVF9FWFRfU01XSUQpKQo+
ICsgICAgICAgICAgICAgICByZXR1cm47Cj4gKwo+ICsgICAgICAgLyoKPiArICAgICAgICAqIE1X
SUQgaXMgZXhwZWN0ZWQgdG8gaGF2ZSBiZWVuIHNldC9yZXN0b3JlZCBieSB0aGUgUm9UJ3MKPiAr
ICAgICAgICAqIE0tbW9kZSBpbXBsZW1lbnRhdGlvbiBkdXJpbmcgYW4gZWFybGllciBib290L3Jl
c3VtZSBzdGFnZS4KPiArICAgICAgICAqIExvY2sgaXQgdG8gcHJlc2VydmUgdGhlIFJvVC1kZWZp
bmVkIFdJRCBhcyBpbW11dGFibGUuCj4gKyAgICAgICAgKgo+ICsgICAgICAgICogTVdJRCBtYXkg
ZGlmZmVyIGZyb20gcG13aWQgaWYgdGhlIFJvVCBoYXMgZGVtb3RlZCBNLW1vZGUuCj4gKyAgICAg
ICAgKi8KPiArICAgICAgIG13aWQgPSBjc3JfcmVhZChDU1JfTVdJRCkgJiB+TVdJRF9MT0NLOwo+
ICsgICAgICAgaWYgKGhmZWF0dXJlcy0+aGFzX3Btd2lkICYmIG13aWQgIT0gaGZlYXR1cmVzLT5w
bXdpZCkgewo+ICsgICAgICAgICAgICAgICBzYmlfcHJpbnRmKCJXQVJOSU5HOiAlczogaGFydCV1
IG13aWQgKCVsdSkgZGlmZmVycyBmcm9tIgo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICIg
cG13aWQgKCV1KVxuIiwgX19mdW5jX18sIGN1cnJlbnRfaGFydGlkKCksCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgbXdpZCwgaGZlYXR1cmVzLT5wbXdpZCk7Cj4gKyAgICAgICB9Cj4gKwo+
ICsgICAgICAgY3NyX3NldChDU1JfTVdJRCwgTVdJRF9MT0NLKTsKPiArfQo+ICsKPiAgc3RhdGlj
IGludCBzbXJubWlfaGFydF9pbml0KHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCkKPiAgewo+
ICAgICAgICAgY29uc3Qgc3RydWN0IHNiaV9wbGF0Zm9ybSAqcGxhdDsKPiBAQCAtNzIxLDYgKzc0
Niw4IEBAIGludCBzYmlfaGFydF9yZWluaXQoc3RydWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoKQo+
ICB7Cj4gICAgICAgICBpbnQgcmM7Cj4KPiArICAgICAgIHNtd2lkX2hhcnRfaW5pdChzY3JhdGNo
KTsKPiArCj4gICAgICAgICByYyA9IHNtcm5taV9oYXJ0X2luaXQoc2NyYXRjaCk7Cj4gICAgICAg
ICBpZiAocmMpCj4gICAgICAgICAgICAgICAgIHJldHVybiByYzsKPiAtLQo+IDIuNDMuNwo+Cgot
LSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
