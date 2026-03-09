Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57951EF3718
	for <opensbi@archiver.kernel.org>; Mon,  9 Mar 2026 08:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZEB+KkFG3RBa2j+GEDdELhkOG7FfaoNqp0sPeT2odRc=; b=lFicO2vASL8fTO
	A/4oPimNzzraB11Z/jYFPh6SO6bS6no+nltWkuDdAeDfPcdhmiQzAYHQBa/4zzbF5ARKOQ1lvL/1E
	YupoY9KFVAPjdN57M1u3V175HWDt9vNK3IWH4hfw8sk+5zGSVhj5F2/GHiVfpxmD/8LdzcHAFAYyl
	AFxY+Z+8EHpWHNNZMx8Jr+rJuN4gzGE4LLnNh69/uZ9Y9Pv0tQ+welDG1uDRoyWgPtaPI6vL5RD6/
	0v819Aiw1EEADEyHWFXRTb6vqiwFoyRiTB0Y2lru0+p0y0u3GAWGOBPn/c8sRhKo+c7Fzz8kreLBn
	z4GI74/mAhzFQTdXEasQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzWSO-00000006v1w-2SxO;
	Mon, 09 Mar 2026 08:59:20 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzWSK-00000006v0s-1kQA
	for opensbi@lists.infradead.org;
	Mon, 09 Mar 2026 08:59:17 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-67bb021cb80so258807eaf.3
        for <opensbi@lists.infradead.org>; Mon, 09 Mar 2026 01:59:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773046755; cv=none;
        d=google.com; s=arc-20240605;
        b=WB35RbFOOKcw1c568Dy973ewr5wsGej1WlByG3arO5Kgi03ihltgNYhJmhxAj1Q6a6
         emQweW1NWhqtXtYXF9rp9M3sB7trTBkN7aPaWDbajccDHHTZeXTNZaMESarFkmK+JEf0
         3jk8NGH3jdBTXjF0CM+g53aB2ufkop3WDLNyBfLbH4hnI0WXGdTQU1ZZyb4+AOrwo6rf
         EMKAl6wE8cpW7nO8VnQbrThl5vcmD/O8OYWSsjmnsS5rdOwg2cWrNy/mmwSZN0JigxYj
         fvpjK8VzqVHpISUVclsDe973zCBxuoPp6oVD+QLoB0BWoTaJbepGZM4Z1DoFXE++xKnE
         jQTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bOpjynk8DXqvBeHMvL0+95R6HMkq3glv+0Dq5mvvjAY=;
        fh=T8OP/o7zS5H+6Uq6ILsRcHUpiRyWJDEXKBvt02zT5EI=;
        b=S9EZpgOzP13lyGvAWFu3DtcbbUwQDy7Iy+pX4mFAL0PS0t101O+X5UT/6mFe4J4pTI
         XL8ydUrrw98mf9ZsA+76auu0JmY7jG+gCbPmMbdSB1gp4RPjpgODHHy0zTu5Bc/E6sIA
         /cHWSHUP6bY9M8fxHQUBqONXNv5SPalCBblqdSKQgKKozxaWaWCE0qcXoTIEeagQglrc
         ZBHW18vp16bL2YvCunuxyvQH9siukHJQr9Ngy7IExYhj0SPF+xqJrUUs5Gi9+kOxjnsp
         yjbvhzIVvZVyfCIqlyGoCeF2w0rToJtDOs2jX9q0XNu2Pjj8amS9l6US2ABFcvr4GdKg
         9Oxw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1773046755; x=1773651555; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bOpjynk8DXqvBeHMvL0+95R6HMkq3glv+0Dq5mvvjAY=;
        b=ra6xaNTTMuCot61+7BxZQ0hIT5HFkKTVPs1YZ/7DGpyuCr9Fq1T3M+I+LfJZ3nsisk
         kvHJgoLkdqVqmtsHDzvJ4yLnY0EfCmJbE35vcR6bJTJi/2pCiOA6fsLIZW2f2rgrU+PU
         AnkWFTSisXu9Cfv3c5lvL8ScfYHQm/HDMAL+wInJzMmhkIbSOwwcPp9fGk31VNm3bimE
         1SOVo4J17zJKCVDtkLzFK2CTztbB+PSB7qGS8mX4dlShVOCPVNOpyqpTgMD5ByUHNi+H
         m2aBRztdRXBEVBmMuM6Ko/YtHhrqtyJGG4fvWMQ99peT93WAWZtK3H5w4rzdJ1P/teB5
         9zzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773046755; x=1773651555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bOpjynk8DXqvBeHMvL0+95R6HMkq3glv+0Dq5mvvjAY=;
        b=IArdUS0p5eHoz3uMJkKt7OjLykDVlF67ceCPzfW1asxabSUZXYoy6HJHFiwYEO/O/g
         nct8D7gLrrhB9TkTmwAz4x4SkXudMr8FFY+7eRwGNgy8H1L3s3jTiBKOSXK+lGavsNxS
         /1J5jwBKSuNghjFzR+qLG10rIump9Xk2h08vAnidx2IkOLTlJPPk2FaB9YCwLXYE3/2V
         e/4LrYY9iYWdne7vIbKzg+CElpDYxHdOOnw1zY0qpjKB5drnt+f6OHujpyaW/MeXYaQG
         jJPwJLHNMjhoJ53+6cT9Mle4LzM98iH3uplLMFqu47pdIbaLErLE4z5Zmp8y5lDVZYvE
         9o3w==
X-Gm-Message-State: AOJu0YynsimmXaLXi2dN1rbGDrUBYSb2o25tJbE28ZHSz9gMbGrJ35Ih
	xl8fCHZU4pqDeDM71Di+ckFG5SghJ58ZZiVQ5w6sRC2ymzDBvj/g6PfvB8TzwBfD8OKzvIC5ESU
	JTC1bHtVtdTBAhbjuRZ910z+LQgspaSHZYov4HYjJMkI2UD9cTOT+ycM=
X-Gm-Gg: ATEYQzw3c/IvLHDbGlDTQPJZ5QehQaECOUdNZnf1997SzOTvZfnuOKEZFCFBjxwOg/3
	elufHis8/gtsC6qX8+H6fqZi4Y+obCHndiKThNvcIvQAWGaqvyZx0rsCyAq04eJWx9RSlW3m3VF
	H1GHZQ6iMFcigmQtYwxRhnOifFJNdxNb7atCGa3uGla2FjW9A3lI0jqSkYmfaIVNeb5L4jciRsy
	7oTbg7yhevIfubP4oBueiMYIW1Bbplxue8xt9euud5lKXo37n6LsBXoqUZYOvSYItkC7itrxHiM
	TSEeEJ83bfLPIsokqryF+vLOCdflXBufwF5dSzo7VhQOrXQgIANEeT3Zn+Lrx2iMof+FRV7T+L4
	eH2CnyANTjiJZHgaRHT2yVk2cO7o7kIRR5yVd
X-Received: by 2002:a05:6820:161e:b0:67b:a85e:6cae with SMTP id
 006d021491bc7-67ba85e7024mr3493917eaf.47.1773046754910; Mon, 09 Mar 2026
 01:59:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260222235219.276432-1-marcos.oduardo@gmail.com>
In-Reply-To: <20260222235219.276432-1-marcos.oduardo@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 9 Mar 2026 14:29:03 +0530
X-Gm-Features: AaiRm52WLg_1Th1-RwVN2IkGhx3_uL0WxgQsBPkc3WAB65Al-nKjTP3nYWxu58M
Message-ID: <CAAhSdy0ps=38V_3KkKjCR3EqO=dbho3LdQq47OyVGzHt4H1Maw@mail.gmail.com>
Subject: Re: [PATCH] include: sbi: fix illegal shift in sbi_domain.h: sbi_domain_memregion_is_subset
To: Marcos Oduardo <marcos.oduardo@gmail.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_015916_566098_067B2A00 
X-CRM114-Status: GOOD (  19.36  )
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

T24gTW9uLCBGZWIgMjMsIDIwMjYgYXQgNToyMeKAr0FNIE1hcmNvcyBPZHVhcmRvIDxtYXJjb3Mu
b2R1YXJkb0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogbWFyY29zIDxtYXJjb3Mub2R1YXJk
b0BnbWFpbC5jb20+Cj4KPiBJbiBzYmlfZG9tYWluLmgsIHdoZW4gY2hlY2tpbmcgaWYgYSBtZW1v
cnkgcmVnaW9uIGlzIGEgc3Vic2V0IG9mIGFub3RoZXIsCj4gYW4gdW5kZWZpbmVkIGJlaGF2aW9y
IGFyaXRobWV0aWMgb3BlcmF0aW9uIHdhcyBjYXVnaHQgd2hlbiBzYW5pdGl6aW5nIHdpdGgKPiBV
QlNhbiAoc2hpZnQgZXhwb25lbnQgNjQpLgoKcy82NC9fX3Jpc2N2X3hsZW4vCgo+Cj4gVGhpcyBw
YXRjaCBhZGRzIGEgY2hlY2sgdG8gaGFuZGxlIHRoZSBjYXNlIHdoZXJlIHRoZSByZWdpb24gb3Jk
ZXIgaXMgNjQsCgpzLzY0L19fcmlzY3ZfeGxlbi8KCj4gYXZvaWRpbmcgdGhlIGlsbGVnYWwgc2hp
ZnQgYW5kIGVuc3VyaW5nIHRoZSBvcGVyYXRpb24gcmVtYWlucyBkZWZpbmVkLgo+Cj4gUGxlYXNl
IGxldCBtZSBrbm93IGlmIHRoZXJl4oCZcyBhbnkgb3RoZXIgbW9zdCBzdWl0YWJsZSBzb2x1dGlv
biBmb3IgdGhpcyBidWcuCj4KPiBTaWduZWQtb2ZmLWJ5OiBNYXJjb3MgT2R1YXJkbyA8bWFyY29z
Lm9kdWFyZG9AZ21haWwuY29tPgo+IC0tLQo+ICBpbmNsdWRlL3NiaS9zYmlfZG9tYWluLmggfCA2
ICsrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3NiaV9kb21haW4uaCBiL2luY2x1ZGUvc2Jp
L3NiaV9kb21haW4uaAo+IGluZGV4IGM4YTZkYTk5Li42ZTZkZDMzYSAxMDA2NDQKPiAtLS0gYS9p
bmNsdWRlL3NiaS9zYmlfZG9tYWluLmgKPiArKysgYi9pbmNsdWRlL3NiaS9zYmlfZG9tYWluLmgK
PiBAQCAtMTcwLDkgKzE3MCwxMSBAQCBzdGF0aWMgaW5saW5lIGJvb2wgc2JpX2RvbWFpbl9tZW1y
ZWdpb25faXNfc3Vic2V0KAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qg
c3RydWN0IHNiaV9kb21haW5fbWVtcmVnaW9uICpyZWdCKQo+ICB7Cj4gICAgICAgICB1bG9uZyBy
ZWdBX3N0YXJ0ID0gcmVnQS0+YmFzZTsKPiAtICAgICAgIHVsb25nIHJlZ0FfZW5kID0gcmVnQS0+
YmFzZSArIChCSVQocmVnQS0+b3JkZXIpIC0gMSk7Cj4gKyAgICAgICB1bG9uZyByZWdBX21hc2sg
PSAocmVnQS0+b3JkZXIgPj0gNjQpID8gfjBVTCA6IChCSVQocmVnQS0+b3JkZXIpIC0gMSk7Cj4g
KyAgICAgICB1bG9uZyByZWdBX2VuZCA9IHJlZ0Ffc3RhcnQgKyByZWdBX21hc2s7Cj4gICAgICAg
ICB1bG9uZyByZWdCX3N0YXJ0ID0gcmVnQi0+YmFzZTsKPiAtICAgICAgIHVsb25nIHJlZ0JfZW5k
ID0gcmVnQi0+YmFzZSArIChCSVQocmVnQi0+b3JkZXIpIC0gMSk7Cj4gKyAgICAgICB1bG9uZyBy
ZWdCX21hc2sgPSAocmVnQi0+b3JkZXIgPj0gNjQpID8gfjBVTCA6IChCSVQocmVnQi0+b3JkZXIp
IC0gMSk7Cj4gKyAgICAgICB1bG9uZyByZWdCX2VuZCA9IHJlZ0Jfc3RhcnQgKyByZWdCX21hc2s7
CgpzLzY0L19fcmlzY3ZfeGxlbi8KCj4KPiAgICAgICAgIGlmICgocmVnQl9zdGFydCA8PSByZWdB
X3N0YXJ0KSAmJgo+ICAgICAgICAgICAgIChyZWdBX3N0YXJ0IDwgcmVnQl9lbmQpICYmCj4gLS0K
PiAyLjUzLjAKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMu
aW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vb3BlbnNiaQoKT3RoZXJ3aXNlLCBMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFu
dXBAYnJhaW5mYXVsdC5vcmc+CgpJIGhhdmUgdGFrZW4gY2FyZSBvZiB0aGUgYWJvdmUgY29tbWVu
dHMgYXQgdGhlIHRpbWUKb2YgbWVyZ2luZy4KCkFwcGxpZWQgdGhpcyBwYXRjaCB0byB0aGUgcmlz
Y3Yvb3BlbnNiaSByZXBvLgoKUmVnYXJkcywKQW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0
Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
