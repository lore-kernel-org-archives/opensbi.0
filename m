Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36AFAC61DD6
	for <opensbi@archiver.kernel.org>; Tue,  1 Sep 2026 07:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U0BPKBVrso7xdhQ06+YBKl7549LmUFjG591tmYCKb7o=; b=C7Kgs0R2nmLTn8
	Fb9CyJ9CTYsla1shFhmQxbVIYxtppDkAnhoBb/JFseirP9civjYpdDG82qL3+lZYJnMJXhVXxlxci
	rGPa0c53Ji3njZSnb8fW/6yhB3hgsTHUXPoE7qlJ7dt4bw+en1O5Od3l541ZXi+dybgvh78EL6N/c
	M4C9rnaGHV9p35Ep0yECUEaVacbk2yffzzA59orpGDbk6KJJcoty9joAHh2H7tHuftDgcQCJR0H/V
	94gesvnSBF+O0KB0xXVeUtHfJN0ZVmIGH50LMMnaOwpCbZTCpYjrd9W/RJpoEO6dk41v8tkigHrXD
	scmEBG8jympyM8WUXJ6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1IvC-0000000B8FM-0YKN;
	Tue, 01 Sep 2026 07:28:42 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Iv9-0000000B8Ez-3bkM
	for opensbi@lists.infradead.org;
	Tue, 01 Sep 2026 07:28:40 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso3768515e9.0
        for <opensbi@lists.infradead.org>; Tue, 01 Sep 2026 00:28:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788247718; cv=none;
        d=google.com; s=arc-20260327;
        b=MmBYC6uB82/ntQ1aUESLD9/Ls/b/V9F3g2lFYZqFH1E+5KdfUpvtvrRHMeoKfO+HJU
         MOWyBw5IXQm8NJhinSvxS5LRNXiqaCkCbs2Ml/dXEt64N6miyo24JdF0nRukt0XWVWfV
         GDhUeU3E2GvqMboe50Nn0nDSLLwWifYUTiABYJUT/H58vLBtbw2w5UpK02thB1bJacPH
         aFQ+j7T9DQlpf6Zu3aWght75HS59KyBFXymegT+MSAJ6W2EGqYQSnVywEJlash2qyQlJ
         rs7V19PtZueuEdPQXkrWGy+xyHIa1Uq9FAsbRaVRfAYvvB5rxkdA3DGkiuQ7acW3Dm8G
         IgSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oxS7sQYqNiEIPNh4DdYrgLVqbOMeXRJ5Bgbi9UxlJGM=;
        fh=UKE2hCUIskB9+31bp6MMA6kaXrGpLgmIm+rZbphqL8k=;
        b=TAvtpKM/UmNw1VzxjxgQMovJ7En5qtIPE/n7U6iGhC1OEVzHLsIVx4YNmAg0QasQgX
         XTJSCm6HQRIJR/qz8IKO/mCwy75UmRITiWxtgzPxY9E5jjux4jQBJJ6oWWNxsHnoxL9b
         fAvwG7iyiWn2zjxBsqwi2wg3YhR3e6BVxWKy4homC17U6BenZi23XBbJxo/cVy2g9QKB
         dtJ2GpA+DdCJ5IJcYXhglNpYngt1x86bdHdbKijSNf1q9rOS+IPGx18kcje9hpfqia90
         efoYYp2swjcJWDKdPLtxPph0KjNuYqbyghYKEjgukftpsIgrs/rZKpaqETbaw8ftdWgE
         nQ1g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1788247718; x=1788852518; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oxS7sQYqNiEIPNh4DdYrgLVqbOMeXRJ5Bgbi9UxlJGM=;
        b=h3q81W3Ct11vmb4lBP6rBaZr0ynzrpdJZCleBMWY7U3IywnfXO/AXbc9R+WX0bLzpY
         1Jvom0vRv/JAy511/Ttzia0fU8hfXempjh4vpERY/UCgVgiHYzHHJiUJjIXVEtxpH4go
         Lm8Upbrqzy8/DwTCL9CulzKe++5wcoaxnMXFjXf6youmZRlBMcYTj9jv5SSSAP/qyAJ4
         FVQ4rGMnFAZxgfJ3uUQuubRnKkg01q6//IHKWoO66lTYcaB7jHUIy2WLBR+InD0RkZNo
         bBQ7vULxyrOqYjTza2J5rGahGa15qVoGly+itMgTv0aPHz4DkHQlEXfPLgKy7RdQ/NFZ
         aV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788247718; x=1788852518;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oxS7sQYqNiEIPNh4DdYrgLVqbOMeXRJ5Bgbi9UxlJGM=;
        b=p+aivpjc/ymAPSGGhI6SMhcEjreG4u8MLyQHTVMBkJEF3cXByXAWxdB3rJijN2OiOH
         3JJZO7AcJTdyfiLo2KvvYIO0N9wnfDazVrPMxWI3yDIRkiteeXaMFOPvfxp/3CJkSeMp
         W3FpN5aFwAdL91i3gRNGPT5VlhjaUN/pDbTwzI9L/x9VMBvI074Db1BQ9RZxH2B/6701
         rw3GebbOcB+EkAAB2kh5oTM0F9GCDeDfSWtEpIMGcp3KDOgM8pmRWww4pOERTPl5Mdyr
         dZxGNwtnuTOzweZrpxMdUVtqVy/Jc0IXZ+zYK+vDFhrV0AhB2ysuqFBtrZCsWLaJlbj6
         5mYw==
X-Gm-Message-State: AFuF++mVaD2RNt3+E08CwbHjwCJ8P9L1eqXUW0Pw2stEG0fE15AShr/t
	Ya78BKj2TAuL3jmR5DcpoUA2O5SdMaAYLzJr7hZjZzObee9uW6LJwsZO844bKOjudOCCSpS3yrL
	T8vZGz+emRUgJCJ38AgA/W8qvomGLvK4LAYM0rYESs37ou56Wlc3s
X-Gm-Gg: AR+sD11UGXttk51goG7KRZ6uBALv9tszzVNkd8hUhByuUFLii0J4Uq09a7eSv3M8K1w
	k3vc6ZHietyC/SSLHFkGhD6sMy8aNn8QyPyOvm3ws0esdaTlXPA0KdUNBwXFlVIm154Y43DUqXj
	h9+TYwUQNutonwYBXvae4F47l2mbrHl1NxdUe1tz5mwO8m8cGwiM+kl9+fE6vu1knDZAmKgwbWW
	zc6UJmWiqcSJw3iWz5OK7l0wivyaZnTwR0vfBmsadqhVcLRGTLJhLgNCHC69m6RvuGCkIjZqVhM
	VG3dYGM+KOuS7lctY/X7bMhI4Su7bcf5oGnCOkZgAESEggWr6ZqzpewgjYeSiVMzDnP38c/klsp
	efjNJRa+SRN9Baqyrx6fKbUQ15jOMKNKtRmM+21nNCzLPePpYtJRRXKuaeexRrSLn
X-Received: by 2002:a05:600c:8b42:b0:496:c93d:e2f with SMTP id
 5b1f17b1804b1-49b91c57d64mr509125545e9.15.1788247717482; Tue, 01 Sep 2026
 00:28:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260731071820.7318-1-zhangzhanpeng.jasper@bytedance.com>
In-Reply-To: <20260731071820.7318-1-zhangzhanpeng.jasper@bytedance.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 1 Sep 2026 12:58:24 +0530
X-Gm-Features: AcwNN1XLg1QSXysFBRwM2EVMtTk3hsKg6f-DkfARE88Ms1Mxd222JqwPrV7DQpU
Message-ID: <CAAhSdy3beJBWGXSJbuwnZia-9Lmu659zMtv4e+hwj6zv1=sX9g@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: sse: clear SPV for non-virtualized events
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: opensbi@lists.infradead.org, himanshu.chauhan@oss.qualcomm.com, 
	thecharlesjenkins@gmail.com, cleger@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_002839_920155_03C4EE36 
X-CRM114-Status: GOOD (  19.92  )
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

T24gRnJpLCBKdWwgMzEsIDIwMjYgYXQgMTI6NDjigK9QTSBaaGFucGVuZyBaaGFuZwo8emhhbmd6
aGFucGVuZy5qYXNwZXJAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4KPiBTU0UgaW5qZWN0aW9uIHNl
dHMgaHN0YXR1cy5TUFYgdG8gdGhlIHZpcnR1YWxpemF0aW9uIHN0YXRlIG9mIHRoZQo+IGludGVy
cnVwdGVkIGNvbnRleHQgYmVmb3JlIGVudGVyaW5nIHRoZSBzdXBlcnZpc29yIGhhbmRsZXIuIFRo
aXMgcGF0Y2gKPiBjb21wbGV0ZXMgdGhhdCBleGlzdGluZyByZXF1aXJlbWVudCBhbmQgZG9lcyBu
b3QgY2hhbmdlIHRoZSBTU0UgQUJJLgo+Cj4gVGhlIGV4aXN0aW5nIGNvZGUgc2V0cyBTUFYgd2hl
biB0aGUgaW50ZXJydXB0ZWQgY29udGV4dCBpcyB2aXJ0dWFsaXplZCwKPiBidXQgbGVhdmVzIGl0
IHVuY2hhbmdlZCBvdGhlcndpc2UuIEEgc3RhbGUgU1BWIHZhbHVlIGNhbiB0aGVyZWZvcmUgbWFr
ZQo+IGFuIGV2ZW50IHRoYXQgaW50ZXJydXB0ZWQgaG9zdCBleGVjdXRpb24gYXBwZWFyIHRvIGhh
dmUgaW50ZXJydXB0ZWQgYQo+IGd1ZXN0LiBFdmVudCBjb21wbGV0aW9uIGNhbiB0aGVuIHJlc3Vt
ZSB3aXRoIHZpcnR1YWxpemF0aW9uIGVuYWJsZWQuCj4KPiBDbGVhciBTUFYgd2hlbiB0aGUgaW50
ZXJydXB0ZWQgY29udGV4dCBpcyBub3QgdmlydHVhbGl6ZWQgc28gdGhlCj4gaGFuZGxlci12aXNp
YmxlIHN0YXRlIG1hdGNoZXMgdGhlIGludGVycnVwdGVkIGNvbnRleHQuIFRoaXMgYWxzbyBsZXRz
Cj4gc3VwZXJ2aXNvciBzb2Z0d2FyZSwgc3VjaCBhcyB0aGUgTGludXggUE1VIGFuZCBwZXJmIGNv
ZGUsIHJlbGlhYmx5IHRlbGwKPiB3aGV0aGVyIGFuIFNTRSBpbnRlcnJ1cHRlZCBob3N0IG9yIHZp
cnR1YWxpemVkIGV4ZWN1dGlvbi4KPgo+IEZpeGVzOiBjOGNkZjAxZDhmM2EgKCJsaWI6IHNiaTog
QWRkIHN1cHBvcnQgZm9yIFN1cGVydmlzb3IgU29mdHdhcmUgRXZlbnRzIGV4dGVuc2lvbiIpCj4g
U2lnbmVkLW9mZi1ieTogWmhhbnBlbmcgWmhhbmcgPHpoYW5nemhhbnBlbmcuamFzcGVyQGJ5dGVk
YW5jZS5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVs
dC5vcmc+CgpBcHBsaWVkIHRoaXMgcGF0Y2ggdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRo
YW5rcywKQW51cAoKPiAtLS0KPiAgbGliL3NiaS9zYmlfc3NlLmMgfCAxMSArKystLS0tLS0tLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+Cj4gZGlm
ZiAtLWdpdCBhL2xpYi9zYmkvc2JpX3NzZS5jIGIvbGliL3NiaS9zYmlfc3NlLmMKPiBpbmRleCA4
MThhZmI4Ny4uNjhlNGZhYjQgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfc3NlLmMKPiArKysg
Yi9saWIvc2JpL3NiaV9zc2UuYwo+IEBAIC01NjMsMTUgKzU2MywxMCBAQCBzdGF0aWMgdm9pZCBz
c2VfZXZlbnRfaW5qZWN0KHN0cnVjdCBzYmlfc3NlX2V2ZW50ICplLAo+Cj4gICAgICAgICBpZiAo
bWlzYV9leHRlbnNpb24oJ0gnKSkgewo+ICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGhz
dGF0dXMgPSBjc3JfcmVhZChDU1JfSFNUQVRVUyk7Cj4gLQo+IC0jaWYgX19yaXNjdl94bGVuID09
IDY0Cj4gLSAgICAgICAgICAgICAgIGlmIChyZWdzLT5tc3RhdHVzICYgTVNUQVRVU19NUFYpCj4g
LSNlbGlmIF9fcmlzY3ZfeGxlbiA9PSAzMgo+IC0gICAgICAgICAgICAgICBpZiAocmVncy0+bXN0
YXR1c0ggJiBNU1RBVFVTSF9NUFYpCj4gLSNlbHNlCj4gLSNlcnJvciAiVW5leHBlY3RlZCBfX3Jp
c2N2X3hsZW4iCj4gLSNlbmRpZgo+ICsgICAgICAgICAgICAgICBpZiAoc2JpX3JlZ3NfZnJvbV92
aXJ0KHJlZ3MpKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGhzdGF0dXMgfD0gSFNUQVRVU19T
UFY7Cj4gKyAgICAgICAgICAgICAgIGVsc2UKPiArICAgICAgICAgICAgICAgICAgICAgICBoc3Rh
dHVzICY9IH5IU1RBVFVTX1NQVjsKPgo+ICAgICAgICAgICAgICAgICBoc3RhdHVzICY9IH5IU1RB
VFVTX1NQVlA7Cj4gICAgICAgICAgICAgICAgIGlmIChoc3RhdHVzICYgSFNUQVRVU19TUFYgJiYg
cmVncy0+bXN0YXR1cyAmIFNTVEFUVVNfU1BQKQo+IC0tCj4gMi41MC4xIChBcHBsZSBHaXQtMTU1
KQo+CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
