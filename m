Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8409CCA468
	for <opensbi@archiver.kernel.org>; Tue, 30 Sep 2025 11:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rj+aL04eMJWCb3M34j7RI2N0BjrE/P+pjaAx7uRnOng=; b=xxCym5JnqhkDTf
	nlVNd4z5qsDzLsmopf26faA+WttATTCuMupjVcd5bIuNqvcA0X5dG1g1o8+HzAoFJFEpaRyTQDe+f
	x+q2DBcN3iVnciQNzAaX+ZW8hNyEhRd4NCns3mFpXdA8YRiGc9uRbsHAFm+cteR9iPJR4voEkrmFt
	LzsjCQC6tkFcd+dAQwuoXWkJKcN73HUGiYS7XZHckOFlpnpViSO8dvrCLtxtPi+JBTcwQUpBAUl9V
	tE974k+QNrvv8rltpPmiCl8fmc86dKgOAWiBQ/ughVq3gNBCX2uRuPr68ji8/tcuB9oKl90nz7gIQ
	VRwhTpu5XdrizmRszsnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Ycb-000000059NJ-12Tb;
	Tue, 30 Sep 2025 11:34:17 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3YcY-000000059MR-2uur
	for opensbi@lists.infradead.org;
	Tue, 30 Sep 2025 11:34:15 +0000
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-92b92e4b078so72561839f.0
        for <opensbi@lists.infradead.org>; Tue, 30 Sep 2025 04:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1759232054; x=1759836854; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w9RPN2anrdqNga15QwfOiKUsE8iGbz1QM6EgaZ2xGgk=;
        b=N6ERIGZi0TKBBYiCWL9HYCpqFBnHRv2vyXxLrYp7MFeq3ymsUF3/PeH8iMATiVwUuk
         PR6ZhIaZcvF2aTW2WadyR1TbRhb+IxcVCSYIgZCUNQpfgtoSXbjPkngDXChwt4qqVBmx
         AMjbB4Nwa/CaWgJnYIvwkPj/3Ad1X+0GgMbQbfRmqmDDTh1SjfUEd9kTDn5uo4wBny6W
         y+ctK3AJr9YQMqx7kmKxfLTW/YthFN+YNfbYRPhIov2vpQ0QWhhl1VDYKYrpTbe9E0as
         WR8rMI38qBXAi7qlU7QDYONDsQWSzMxtbcXfnBLjna6Qle0iKOZfBcMwks97m3dIn4LT
         bfvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759232054; x=1759836854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w9RPN2anrdqNga15QwfOiKUsE8iGbz1QM6EgaZ2xGgk=;
        b=ETI2K3k41T9wtDrywdbtxruYVWPKrTD7WfNXypJOCVSQabE7eiIIwl5WUZvTNHDQnG
         3gAotM7qmI3mh5HVNN9fm//Fl0H9jmy75E2gZWW2WtijKpfhGDiEi9ToAFBWnmf6MJE6
         32AkN4DBYhNlMR5cXEgk3WSvZVpQwWTxpEvf+r9HudL1UtsXCe0nUUhZNTXDb846EW3O
         65EoGCT2ts6wxtYsmbXr6ot/ORmsVoHDVoNfH04MyANnVHNw8D1OnyDs/52ic4cgN2kD
         9A05qP9ePxKaOQilcqgM4x2RpKU2Ee1fJ1U1J/noQDIslzspgW1LYFSFg/5aVkGZ1iYC
         YyuQ==
X-Gm-Message-State: AOJu0YxrNv0kKij78Q4HjerY30aEs8PRMxVKJg2SPCEFV3nDxgc0Lj4S
	NLopfnSnHvESOzrK7/sOOnzaTwzw+AwEDzgWnHoonIKq3plxHc+6vqTpV8j8B3Xz/gEqZqrM7Qn
	WYu7/y7WQO/lEroe6/gH8ibYbCztZYKM8u7py1JuRuWDh9ri5/uEW3R8=
X-Gm-Gg: ASbGncvtFDMXpsxroihW/bcbPGQ6XpmWKqgPwR79huopnHbBpENS+wFgsKxKcJd/Gsa
	QZp1RWfA3R639ko+Gl9YNed/o7z5qAradztlLPb+hjsFiBojJZECrr0ha+22tbju/PtfFT8XhSP
	pi0gN5N5GpwlbnlIrSq/CV3Sw0jlNcGFVg2cmbmJk4SW1Us+Ypm3wsZ5HpyCJGxe+JF1hnFxyBo
	S4aX4l1bmHkn6nXjeTWUKkAy2uNrkEPkGxD4IsUn1/dO3hwrmrrkqebtBAP8X9GniV9hYSaDIw=
X-Google-Smtp-Source: AGHT+IFCGOi/Fc4yDKcZEFY3GOqJQPtRq8Ul+ULhfq7PuSUTvG8WbcYRP6G4FaNNQ0mvcSJe3iemo/QlDRJitGhGAPo=
X-Received: by 2002:a05:6e02:1a82:b0:42b:2f98:3fc2 with SMTP id
 e9e14a558f8ab-42b2f9843d3mr121144965ab.17.1759232053055; Tue, 30 Sep 2025
 04:34:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250806084123476SCLxg-qQRa8CRuhuY-dwE@zte.com.cn> <202508060106.57616bhq072530@mse-db.zte.com.cn>
In-Reply-To: <202508060106.57616bhq072530@mse-db.zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 30 Sep 2025 17:04:01 +0530
X-Gm-Features: AS18NWAWeKb7-inBW0f8N8DZeduthefC3gbErghWMDOKzdZxdJJ77wWwDPYyLPs
Message-ID: <CAAhSdy1H=9P7PLTvp5dJs9-yJvXyns9177KZ98eR9a0V_nnBfQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] platform: generic: Extra memory for housekeeping
To: wu.fei9@sanechips.com.cn
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_043414_740272_D77B9A44 
X-CRM114-Status: GOOD (  16.61  )
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

T24gV2VkLCBBdWcgNiwgMjAyNSBhdCA2OjM54oCvQU0gPHd1LmZlaTlAc2FuZWNoaXBzLmNvbS5j
bj4gd3JvdGU6Cj4KPiBBbGxvY2F0ZSB0aGUgZXh0cmEgaG91c2VrZWVwaW5nIG1ldGFkYXRhIGZv
ciBoZWFwIG9yIHRoZSBleHBlY3RlZCBmcmVlCj4gbWVtb3J5IHNpemUgY2Fubm90IGJlIGFjaGll
dmVkLgo+Cj4gU2lnbmVkLW9mZi1ieTogV3UgRmVpIDx3dS5mZWk5QHNhbmVjaGlwcy5jb20uY24+
CgpObyBuZWVkIGZvciB0aGlzIHBhdGNoIHNpbmNlIHdlIG5vdyBoYXZlIGR5bmFtaWNhbGx5IGdy
b3dpbmcgaG91c2Uga2VlcGluZy4KClJlZ2FyZHMsCkFudXAKCj4gLS0tCj4gIGluY2x1ZGUvc2Jp
L3NiaV9oZWFwLmggICAgICB8IDMgKysrCj4gIGxpYi9zYmkvc2JpX2hlYXAuYyAgICAgICAgICB8
IDUgKysrKysKPiAgcGxhdGZvcm0vZ2VuZXJpYy9wbGF0Zm9ybS5jIHwgMSArCj4gIDMgZmlsZXMg
Y2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zYmkvc2Jp
X2hlYXAuaCBiL2luY2x1ZGUvc2JpL3NiaV9oZWFwLmgKPiBpbmRleCBhNGIzZjBjLi4zZDNmZWVl
IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvc2JpL3NiaV9oZWFwLmgKPiArKysgYi9pbmNsdWRlL3Ni
aS9zYmlfaGVhcC5oCj4gQEAgLTk4LDQgKzk4LDcgQEAgaW50IHNiaV9oZWFwX2luaXRfbmV3KHN0
cnVjdCBzYmlfaGVhcF9jb250cm9sICpocGN0cmwsIHVuc2lnbmVkIGxvbmcgYmFzZSwKPiAgICAg
ICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgc2l6ZSk7Cj4gIGludCBzYmlfaGVhcF9h
bGxvY19uZXcoc3RydWN0IHNiaV9oZWFwX2NvbnRyb2wgKipocGN0cmwpOwo+Cj4gKy8qKiBSZXR1
cm4gdGhlIHRvdGFsIGhlYXAgc2l6ZSB3aXRoIGhvdXNla2VlcGluZyAqKi8KPiArdW5zaWduZWQg
bG9uZyBzYmlfaGVhcF90b3RhbF9zaXplKHVuc2lnbmVkIGxvbmcgdXNhYmxlX3NpemUpOwo+ICsK
PiAgI2VuZGlmCj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX2hlYXAuYyBiL2xpYi9zYmkvc2Jp
X2hlYXAuYwo+IGluZGV4IDY0NmMyZTAuLjdhYTI3YjEgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9z
YmlfaGVhcC5jCj4gKysrIGIvbGliL3NiaS9zYmlfaGVhcC5jCj4gQEAgLTI3OSwzICsyNzksOCBA
QCBpbnQgc2JpX2hlYXBfYWxsb2NfbmV3KHN0cnVjdCBzYmlfaGVhcF9jb250cm9sICoqaHBjdHJs
KQo+ICAgICAgICAgKmhwY3RybCA9IHNiaV9jYWxsb2MoMSwgc2l6ZW9mKHN0cnVjdCBzYmlfaGVh
cF9jb250cm9sKSk7Cj4gICAgICAgICByZXR1cm4gMDsKPiAgfQo+ICsKPiArdW5zaWduZWQgbG9u
ZyBzYmlfaGVhcF90b3RhbF9zaXplKHVuc2lnbmVkIGxvbmcgdXNhYmxlX3NpemUpCj4gK3sKPiAr
ICAgICAgIHJldHVybiB1c2FibGVfc2l6ZSArIHVzYWJsZV9zaXplIC8gKEhFQVBfSE9VU0VLRUVQ
SU5HX0ZBQ1RPUiAtIDEpOwo+ICt9Cj4gZGlmZiAtLWdpdCBhL3BsYXRmb3JtL2dlbmVyaWMvcGxh
dGZvcm0uYyBiL3BsYXRmb3JtL2dlbmVyaWMvcGxhdGZvcm0uYwo+IGluZGV4IDQ3ZTc3MWEuLjQ0
MmY3ZDUgMTAwNjQ0Cj4gLS0tIGEvcGxhdGZvcm0vZ2VuZXJpYy9wbGF0Zm9ybS5jCj4gKysrIGIv
cGxhdGZvcm0vZ2VuZXJpYy9wbGF0Zm9ybS5jCj4gQEAgLTQxLDYgKzQxLDcgQEAgc3RhdGljIHUz
MiBmd19wbGF0Zm9ybV9jYWxjdWxhdGVfaGVhcF9zaXplKHUzMiBoYXJ0X2NvdW50KQo+Cj4gICAg
ICAgICAvKiBGb3IgVExCIGZpZm8gKi8KPiAgICAgICAgIGhlYXBfc2l6ZSArPSBTQklfVExCX0lO
Rk9fU0laRSAqIChoYXJ0X2NvdW50KSAqIChoYXJ0X2NvdW50KTsKPiArICAgICAgIGhlYXBfc2l6
ZSA9IHNiaV9oZWFwX3RvdGFsX3NpemUoaGVhcF9zaXplKTsKPgo+ICAgICAgICAgcmV0dXJuIEJJ
VF9BTElHTihoZWFwX3NpemUsIEhFQVBfQkFTRV9BTElHTik7Cj4gIH0KPiAtLQo+IDIuNDMuMAo+
Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9y
Zwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoK
LS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
