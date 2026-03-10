Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D8DAFCC9B8
	for <opensbi@archiver.kernel.org>; Tue, 10 Mar 2026 05:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=27Vj5Dg/Ym2SlYHQRH68EA6oYyiaq71vlsQsCh1Z+/Q=; b=LXDCpnj9Zvup59
	Mp1B45FJJveafDFhpPWcMrcTbToR9axjQkJQL3FZWV2nabOFc/FVmaoXujsrNlLL1lqrb6n0Atwcj
	Pg+tDzet+Q+k6WYVSjwqqKW+4MoaXnJe5pBvrNFN6qFhzaXloEHn16CP9K+xyEN2Kw2AnJmyIKqjE
	y25bgU93a5QbQDXLyngWRwWQM6AYefCR1RV5w8JRnbItbH/fHw5kJDZAasWa9LQBNAJt++QXRNlPa
	nAMy+VV9kBku/ENmj+ZpNQbFqekdHWbkyBkqRIlgLcD7vTWdGXQ3IYqTsa0RIjWClaTWAS4So/IBl
	ZjEfvIH7nqrdzwWars0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzpK6-00000008jC6-2Ftg;
	Tue, 10 Mar 2026 05:08:02 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzpK3-00000008jBh-0rhr
	for opensbi@lists.infradead.org;
	Tue, 10 Mar 2026 05:08:00 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-673ee2a98b1so7713060eaf.0
        for <opensbi@lists.infradead.org>; Mon, 09 Mar 2026 22:07:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773119278; cv=none;
        d=google.com; s=arc-20240605;
        b=VDERZROb7gbqs9/z2fvUR3MNXKJBryU3Q+Tdl+6/tjNJvGr6XwPpcSQ6PUfjY+TejB
         Ymovpp/csPblqZ7ThR9MthhdtSjRxyhWENuO9nlELJNYCEceip89UlgJCnLlfmhany1A
         VycJBP3zX2yihBUqWGB2/gZgBO6IzIRCWCLsFZQH0RoeoxnMfCQsicXI6QfFL6wrTd4I
         lOY2qNGHQplhFUfl25VX0QbCL3uCOwRsoqtgdAgPFKPm3pgoavvrTR7EfFYQr4Tns8l9
         CeGNX2JNSp8aRffsGxJImb1unjV3LiAHZMzEtsS17PBQQypMOQGHapeCZ+I9mRyoVCJF
         fARw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qjGwaCokNQPGasgv8AmB13xH13zlVWBQN4+lQEH1oxM=;
        fh=RufNf6ye3JBjONzdHDWY/Su4gT4npwALOBwufia7FoY=;
        b=Yz2jti75y89U4Wjoow0ZrzI2TLGDDBZlhM2ANo3CaQ8X+mgjq2IWNc9ACeajm/nYWQ
         8FxBW2CD+UFhqInk4LuEdorqzeg8WMdR7caNK+NODDPBOObrMVkJzgFKed7i1qWbniKD
         atVzG2dTiRE07HfkIJGnC/nLefnsgBB3IEGIrNG6zpHJnzzx6rNdea7cXBjXhOUGR0Zn
         l7SRwhhOSnz0yplYpOErBV2ceo6Albe86YRe7eXPsXYcegUga4VYSpd1J2hyZB+SlTr8
         gxWXemRYYdQd3CywNhrick3KcSTqhcJMrsZNCcKoOQsKJ6v9Xosc/KGkZS8gVNs+EHNS
         DhDg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1773119278; x=1773724078; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjGwaCokNQPGasgv8AmB13xH13zlVWBQN4+lQEH1oxM=;
        b=Y8ZRFJ6hst4LFJ0q1Xs5uT+HFdSMS9f5p9iKuM3+HVDxVn9zR3prZ7aFjRm4hRkIRh
         xaIodROG84da9E7H4Y3gD+beLFywGd9BPjJrsnZCe0aI9L8egJBsFH0d4UMasRDno/yt
         9CbZ8+0vqtzZS4XeB591OjEMXKgAGe+Ku3xMoXVNTWZdPDEJxmuxlpHhbyByk7V0Ota2
         /iQYhEbuhcvouDtaQouPEMo77uWX6c3kz5BHLodR/6gXILzdb3pONCXp3QLf2hOEmvEM
         HZxLnIy3qAgw3zStL9oQoyHoIkbecbHy87EPVdf52mczDrLkZbf04HVUBohOV94TKXpf
         9hqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773119278; x=1773724078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qjGwaCokNQPGasgv8AmB13xH13zlVWBQN4+lQEH1oxM=;
        b=O3YgXBAV1GAhdlaT0ehNGg3dte9L1gf94Ho6CQ1+a5Ic5RYsvUHeYYvNonDnaBwXzs
         o4t/nqSCnSI3p9bEgjjjX1surXdiaGFavciN+SJ+lVjRMmdZ/FkI4bL4cKy4ZEjMRf+3
         ZRuozgJWuKtnvAWWya6GxhCFBV5nKZVZkNwgkWZ+91GCwvH9MnqaSkzm+/ki4aFynAdQ
         a+QdNlbjjQXTqODfoi8u1QUTOY2QHk0zA+GcsOAIXIgaLzCr3vsc8luf0KYhe+WELlpw
         TIADzFc1W2b88om97riL8NLwGeWJxEyRsgt8Us2WKrhpB0hC68pe86I3Bvd+ksGKkprY
         Q5Ag==
X-Forwarded-Encrypted: i=1; AJvYcCWuTGD59Yq5lIgPzAl/aFCFqb2V9AdWw69VTT16ZDYlcG5D7YJglI14ybEjo1upoynR/yUa76Tb@lists.infradead.org
X-Gm-Message-State: AOJu0YxN3htnNEg49OKhWV4oriQfWw3S9S+GqKeW+iA4EHnZWD4bL4Qc
	8xy/rbFByeM111p2eT1dvDT8NTOf4EdEjZlZQQyi1Y4t3rcCpwvoGF0PBPjkiiPofTIzQBDOr5p
	dNLVmrHR7H+vy+6YwVvcB9NpsRqt/wwrCvGu9sjOkOO6SwvOXX4KO
X-Gm-Gg: ATEYQzx4fdJpPAoAL8sxyxHoO3Qed/bQ0ADYzZPxGtu3u+yff3BTXOOuIF6EA5dOcF8
	wgggvf+RuEISzD5PWLvJyNmvZm4pqL4YUKZgjgRHyFxMyfeDlAJCV6Xa2OnE0jyheIQ20QLxBZD
	XQ799sLVz7bU1u713tNBXDq+vfwVCGr7bQUZdjgWUh2KXFQ42mxFDgh7guC1LoElCinqWd9PFe5
	AczacqmVuJvS/Kw70zwzIQ6hNcXd4A7iJTG0iS/BlCgGhSyT1mSHEHygnV6iRL43P9z9FPoYYMX
	vjh59jkk0gUsTww0a1ZeIc3u8fVuUIvXjiPhkEAysS1Pzlz2jawXq0yfFGtb0I7Hnv+u+ZdhzXT
	ChZ9wtyvAv9EWlogT/KWxHEzqrFH6hC4S9+Nh
X-Received: by 2002:a05:6820:2083:b0:674:911:98fa with SMTP id
 006d021491bc7-67b9bd52173mr9353961eaf.64.1773119277966; Mon, 09 Mar 2026
 22:07:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260301141332.2941601-1-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20260301141332.2941601-1-vladimir.kondratiev@mobileye.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 10 Mar 2026 10:37:47 +0530
X-Gm-Features: AaiRm51MCtrK2RAwg_jCqfpjsutJa-BH9hWOCGdbfv1t52Sfh9oxbs0dLKKBk_I
Message-ID: <CAAhSdy0ScKPU+2ZnrK2sg2ER6rUoyQ2fgTPCbH6dOWT9q73MEg@mail.gmail.com>
Subject: Re: [PATCH] platform: generic: mips boston: update "compatible"
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Cc: conor@kernel.org, chao-ying.fu@globalfoundries.com, 
	opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_220759_272317_AB2B4E82 
X-CRM114-Status: GOOD (  15.39  )
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

T24gU3VuLCBNYXIgMSwgMjAyNiBhdCA3OjQz4oCvUE0gVmxhZGltaXIgS29uZHJhdGlldgo8dmxh
ZGltaXIua29uZHJhdGlldkBtb2JpbGV5ZS5jb20+IHdyb3RlOgo+Cj4gVXNlIGEgcGxhdGZvcm0t
c3BlY2lmaWMgY29tcGF0aWJsZSB0byBhdm9pZCBjbGFzaGluZwo+IHdpdGggQ1BVIGNvbXBhdGli
bGUKPgo+IFNpZ25lZC1vZmYtYnk6IFZsYWRpbWlyIEtvbmRyYXRpZXYgPHZsYWRpbWlyLmtvbmRy
YXRpZXZAbW9iaWxleWUuY29tPgoKQXBwbGllZCB0aGlzIHBhdGNoIHRvIHRoZSByaXNjdi9vcGVu
c2JpIHJlcG8uCgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIHBsYXRmb3JtL2dlbmVyaWMvbWlwcy9i
b3N0b24uYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvcGxhdGZvcm0vZ2VuZXJpYy9taXBzL2Jvc3Rvbi5jIGIv
cGxhdGZvcm0vZ2VuZXJpYy9taXBzL2Jvc3Rvbi5jCj4gaW5kZXggZWNlNjBhN2U1ZTUyLi44N2Ni
MzI4ZGM0ZTMgMTAwNjQ0Cj4gLS0tIGEvcGxhdGZvcm0vZ2VuZXJpYy9taXBzL2Jvc3Rvbi5jCj4g
KysrIGIvcGxhdGZvcm0vZ2VuZXJpYy9taXBzL2Jvc3Rvbi5jCj4gQEAgLTE0MCw3ICsxNDAsNyBA
QCBzdGF0aWMgc3RydWN0IHA4NzAwX2NtX2luZm8gYm9zdG9uX2NtX2luZm8gPSB7Cj4gIH07Cj4K
PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBmZHRfbWF0Y2ggYm9zdG9uX21hdGNoW10gPSB7Cj4gLSAg
ICAgICB7IC5jb21wYXRpYmxlID0gIm1pcHMscDg3MDAiLCAuZGF0YSA9ICZib3N0b25fY21faW5m
byB9LAo+ICsgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtaXBzLHA4NzAwLWJvc3RvbiIsIC5kYXRh
ID0gJmJvc3Rvbl9jbV9pbmZvIH0sCj4gICAgICAgICB7IH0sCj4gIH07Cj4KPiAtLQo+IDIuNDMu
MAo+CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
