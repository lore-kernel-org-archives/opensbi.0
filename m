Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EDB606A31E
	for <opensbi@archiver.kernel.org>; Tue, 27 Oct 2026 15:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IIAbgEqr;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=jF2OZJef
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=O8p5qe5N9bZy9OJcUEqouS8Jvhk2elfaKJPMT+o7BSI=; b=IIAbgEqrUHVxTnAb/g1nw/89HM
	QOL5PExExamnZ7bCWXiThFLSU8q3il4oqKCDoJ8XcUgNYENrDu9kZ+ruvzSbt7Cp+fyW4WNM5EIRY
	tbcfAgfwtGnSu6lc7kQ6Cb1nuEhRGIhkInqyfjqXdJ4EVxv6NHN04JoyxO4yfyw0WzQ+81A181Fz6
	0t+KQeudSM2kpSOTPguk+a8XO5BazY5JKgJZ9hTY3dDFcWSEdpIS7OjHO7438US1n9Oi+OhvW+qjR
	+/Fi1bOxhIibgwA0/h99kedDGrrZ6JxV1MAArGPNlXmpwHZVtHqnVAHJOjPM9wm0bPgMc6KCBn1my
	wCrWs/jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLj7E-00000005Ahh-1btQ;
	Tue, 27 Oct 2026 15:29:32 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLj7B-00000005AfQ-3VR7
	for opensbi@lists.infradead.org;
	Tue, 27 Oct 2026 15:29:31 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-3ab27b4924aso30696241fa.2
        for <opensbi@lists.infradead.org>; Tue, 27 Oct 2026 08:29:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793114968; cv=none;
        d=google.com; s=arc-20260327;
        b=sxNFIRZjYrtmbhvVVDL4Z4hydFrle9pZMdDBw2qWrLhlawSFoO4IaEVqPJlQKCpLH1
         i4gThOj3PiTQzI6GA+K9m+MIqGHa4uabngtr5Z4gY1Hq+jfqLFSi338LaZyo4MaL4VHx
         ph0SFu69WzDJxkCOjQDCI8cMALEsCSPf+5otmar9SZDOvI5LS56GZlelWtiLWYkIJpcH
         BNEnZctukDzJP3HfPL6H+GC07a0COHc4GI/tmHoR14QaOlgpAED/59W41bZINTZbE8HM
         cPRnoGNsT8P2Xcjb+3h3pQXr9c7wK5M0QsrsjVLs2d22Ue+LnwVuBw0lx1/7CAaxz18B
         OMBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QKjJxeWtHleqpeDQixTgFsFKxw4rLzNLmDrpO3I3WPk=;
        fh=uFdjnj4owPykmFBAe7MQjc3rFE+iHzSvXSeL187O8GQ=;
        b=O62GGyhDvm5VZXbi/Abh6MWL0UF9AGW/huOxFEZXWsafi3RTrTov8zOmieylq3eLYN
         05EuUeHIMso+slDueJaetHOi2HjaLp4YRp8Z2NPRCOhoOcsU65WP13awojNznoXZXB+w
         zKLjxTrUpCYBTbryZpNSGQftE+2+WXdP+OheN06MbYMMP8M5jBs2gVTdVH5kgUVJZ4x4
         aZo1aPgqshPISiIMMCJ30U3yvGEEZ/L8l6g91XYJWtcCajvnW0Fo64XLVmAeOxFNeACA
         VY+8Y16sx4EeaGjB7vAcELcw+0H8MBaxbtv8ddmUfqWWLFoZi5fAa1rSLlGWBus8+vIX
         Oi8w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793114968; x=1793719768; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QKjJxeWtHleqpeDQixTgFsFKxw4rLzNLmDrpO3I3WPk=;
        b=jF2OZJefYAAT1r46IaujeMFvVhWh7eDk+PjPFhsg6fGYNINqXrHuZkdbTCe48PlD0C
         bubviu4qhOa90xLYrx5Lyzrn2N7o2AVnb+mQXAHupC0hpTKXjgMxX2iFZsuNcrawms2V
         Wa7krT4Fr75FIxo/Ln53c5E/AP67NrAYBiTxUOLoZjG2tuFk0vEQ6zlqwcAqdWMOL7qV
         sgQKF7AY02unELLUjmQPVOahMkzGRQQqzYimsKYPs4rxNl+U76AjzyIWcDs8wBpsczoK
         NtagVwX2QTRvuL9vw+1Vm8gGkppQ5Kil0VS/KnbEKt32fSXLMl5KSz0gtnqr8gIGveg4
         3VrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114968; x=1793719768;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QKjJxeWtHleqpeDQixTgFsFKxw4rLzNLmDrpO3I3WPk=;
        b=tpvooNHEaqimXEIkQ5o9EfI2fd8KZ64JhT5JWe7L73oKIu7GCLthkXYzBElSqh+X48
         P+xq+l03pGkSyKZ1FUCRDs58yZbQQWR6T08KloZKNfulbOIuLQUdC/rxclSGtsdclBMp
         Va937WXsgfWlVg0rTTwiY5UMwUADMERmAUV7h1jn8UWYJz8ceu5rx2Hgbh5Wa8i82Y5G
         TBOrHvaSWbe+MMAi0kX+NmFaCERt3TyJJ9ks5XT24zNxuZE6MnW1VqC5HNwdNF2LP5Yu
         SfT2zeH9QIPCJ08GV46AV6k2zejp889zu4o0AMKM7bIhja1lGqwncY9fcdFHfiwgRMJh
         hKCQ==
X-Gm-Message-State: AFq9FYL+4JPY1jCiwg7WZTcCRKGr+rT1/I12eaCu0DdKQVZX4lUfWdBB
	QqLk7BvtD/kv6X0Ks7/FY56j8GCtee7T5FPGsw/kas4aMfiElKSp4dexzkc7ky14ZSPmgmPXe+o
	nyuI+9z3vEfMuWjF2WnSC99IZls6046ke1v8RPqplCxSz6H5hngov
X-Gm-Gg: AYBFou0G+JpdMD62WzG8WZ2+vgkMbj3oXdeakencu91brB5Dc3/6jOsMRzV93WVsptT
	wfbgqD72ZmGwdFHco9Hu/RgspqUL8TFb8Lyw62LCJ5OFw0cVPlES37SZnQT5oZObJXVrwJhk+Ob
	jxTbMinaxXzxlfIqmHctNWYJNPoJT3h4HTujy4hrAeNzFxUf0jrYi4DCq/4t8j/wgMUeb2H50a9
	rHUxyIzV1SjcJGX5Cf8dzd2FSwukCEG0WVYDDZfq7youf1QkgIdrA2Dmn4fdreXnhPoSuclJ1U9
	ZKBs0D91SHiPvk+UvUupjKuJHn2PWjjCbPmBnZg6crTJstQfQqOI7dV5TspfJbckv+A/fCERzRF
	PwNfTBd13O/A9ejwcPQxa7VW3+BnNLwzj4vp4IVUGk5HIeFlC8+/Uyeo8leSvk84tXGOA0MU/m/
	6lWmce3Ush7hwHx6+e6ZIqF0J6fIhLvZd8TW1zsOfIkmk+u8eKOFgdAgo=
X-Received: by 2002:a2e:b8c1:0:b0:3ab:483c:914c with SMTP id
 38308e7fff4ca-3ac6fd5c21amr26444251fa.21.1793114968021; Tue, 27 Oct 2026
 08:29:28 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260924060133.294142-1-fido_max@inbox.ru>
In-Reply-To: <20260924060133.294142-1-fido_max@inbox.ru>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 27 Oct 2026 20:59:00 +0530
X-Gm-Features: AclHuK9j2Lu3Bml0_gS6zHGJAM7gVt6A4ayXjU7mUn8dmD67VafYiRTeM2EYT8M
Message-ID: <CAAhSdy0SGdeM8aCzQT8p1X4PN9bZ1LmjCd4X-f+krUR6i24TLw@mail.gmail.com>
Subject: Re: [PATCH 1/1] Makefile: Speed up parallel build
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_082929_901618_B2D2EEBD 
X-CRM114-Status: GOOD (  15.72  )
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

T24gVGh1LCBTZXAgMjQsIDIwMjYgYXQgMTE6MzLigK9BTSBNYXhpbSBLb2NoZXRrb3YgPGZpZG9f
bWF4QGluYm94LnJ1PiB3cm90ZToKPgo+IFBhcmFsbGVsIGJ1aWxkIGlzIGV4dHJlbWVseSBzbG93
IHdoZW4gdXNpbmcgdmFycyAoTywgSSwKPiBQTEFURk9STV9ESVIrUExBVEZPUk0pLiBBbmQgYWxs
IHRoaXMgaXMgYmVjYXVzZSB0aGUgdmFyaWFibGVzIGFyZQo+IGNhbGN1bGF0ZWQgY29udGludW91
c2x5LCB3aXRoIHRoZSBzaW11bHRhbmVvdXMgaW52b2NhdGlvbiBvZgo+IHRoZSAkKHNoZWxsIC4u
LikuIFNvIHVzZSAiU2ltcGx5IGV4cGFuZGVkIHZhcmlhYmxlcyIgdG8KPiBjYWxjdWxhdGUgdmFs
dWUgYW5kIGNhbGwgJChzaGVsbCAuLi4pIGp1c3Qgb25jZS4KPgo+IFNpZ25lZC1vZmYtYnk6IE1h
eGltIEtvY2hldGtvdiA8Zmlkb19tYXhAaW5ib3gucnU+CgpMR01ULgoKUmV2aWV3ZWQtYnk6IEFu
dXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpBcHBsaWVkIHRoaXMgcGF0Y2ggdG8gdGhl
IHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywKQW51cAoKCj4gLS0tCj4gIE1ha2VmaWxlIHwg
MTQgKysrKysrKy0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNyBk
ZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9NYWtlZmlsZSBiL01ha2VmaWxlCj4gaW5kZXgg
MWIzMzMzZjMuLmRhNjc1MWZkIDEwMDY0NAo+IC0tLSBhL01ha2VmaWxlCj4gKysrIGIvTWFrZWZp
bGUKPiBAQCAtMjIsMTggKzIyLDE4IEBAIGVuZGlmCj4gICMgRmluZCBvdXQgc291cmNlLCBidWls
ZCwgYW5kIGluc3RhbGwgZGlyZWN0b3JpZXMKPiAgc3JjX2Rpcj0kKENVUkRJUikKPiAgaWZkZWYg
Two+IC0gYnVpbGRfZGlyPSQoc2hlbGwgJChSRUFETElOSykgLWYgJChPKSkKPiArIGJ1aWxkX2Rp
cjo9JChzaGVsbCAkKFJFQURMSU5LKSAtZiAkKE8pKQo+ICBlbHNlCj4gLSBidWlsZF9kaXI9JChD
VVJESVIpL2J1aWxkCj4gKyBidWlsZF9kaXI6PSQoQ1VSRElSKS9idWlsZAo+ICBlbmRpZgo+ICBp
ZmVxICgkKGJ1aWxkX2RpciksJChDVVJESVIpKQo+ICAkKGVycm9yIEJ1aWxkIGRpcmVjdG9yeSBp
cyBzYW1lIGFzIHNvdXJjZSBkaXJlY3RvcnkuKQo+ICBlbmRpZgo+ICBpbnN0YWxsX3Jvb3RfZGly
X2RlZmF1bHQ9JChDVVJESVIpL2luc3RhbGwKPiAgaWZkZWYgSQo+IC0gaW5zdGFsbF9yb290X2Rp
cj0kKHNoZWxsICQoUkVBRExJTkspIC1mICQoSSkpCj4gKyBpbnN0YWxsX3Jvb3RfZGlyOj0kKHNo
ZWxsICQoUkVBRExJTkspIC1mICQoSSkpCj4gIGVsc2UKPiAtIGluc3RhbGxfcm9vdF9kaXI9JChp
bnN0YWxsX3Jvb3RfZGlyX2RlZmF1bHQpL3Vzcgo+ICsgaW5zdGFsbF9yb290X2Rpcjo9JChpbnN0
YWxsX3Jvb3RfZGlyX2RlZmF1bHQpL3Vzcgo+ICBlbmRpZgo+ICBpZmVxICgkKGluc3RhbGxfcm9v
dF9kaXIpLCQoQ1VSRElSKSkKPiAgJChlcnJvciBJbnN0YWxsIHJvb3QgZGlyZWN0b3J5IGlzIHNh
bWUgYXMgc291cmNlIGRpcmVjdG9yeS4pCj4gQEAgLTQyLDEyICs0MiwxMiBAQCBpZmVxICgkKGlu
c3RhbGxfcm9vdF9kaXIpLCQoYnVpbGRfZGlyKSkKPiAgJChlcnJvciBJbnN0YWxsIHJvb3QgZGly
ZWN0b3J5IGlzIHNhbWUgYXMgYnVpbGQgZGlyZWN0b3J5LikKPiAgZW5kaWYKPiAgaWZkZWYgUExB
VEZPUk1fRElSCj4gLSAgcGxhdGZvcm1fZGlyX3BhdGg9JChzaGVsbCAkKFJFQURMSU5LKSAtZiAk
KFBMQVRGT1JNX0RJUikpCj4gKyAgcGxhdGZvcm1fZGlyX3BhdGg6PSQoc2hlbGwgJChSRUFETElO
SykgLWYgJChQTEFURk9STV9ESVIpKQo+ICAgIGlmZGVmIFBMQVRGT1JNCj4gICAgICBwbGF0Zm9y
bV9wYXJlbnRfZGlyPSQocGxhdGZvcm1fZGlyX3BhdGgpCj4gICAgZWxzZQo+IC0gICAgUExBVEZP
Uk09JChzaGVsbCBiYXNlbmFtZSAkKHBsYXRmb3JtX2Rpcl9wYXRoKSkKPiAtICAgIHBsYXRmb3Jt
X3BhcmVudF9kaXI9JChzaGVsbCByZWFscGF0aCAke3BsYXRmb3JtX2Rpcl9wYXRofS8uLikKPiAr
ICAgIFBMQVRGT1JNOj0kKHNoZWxsIGJhc2VuYW1lICQocGxhdGZvcm1fZGlyX3BhdGgpKQo+ICsg
ICAgcGxhdGZvcm1fcGFyZW50X2Rpcjo9JChzaGVsbCByZWFscGF0aCAke3BsYXRmb3JtX2Rpcl9w
YXRofS8uLikKPiAgICBlbmRpZgo+ICBlbHNlCj4gICBwbGF0Zm9ybV9wYXJlbnRfZGlyPSQoc3Jj
X2RpcikvcGxhdGZvcm0KPiAtLQo+IDIuNTUuMAo+Cj4KPiAtLQo+IG9wZW5zYmkgbWFpbGluZyBs
aXN0Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QK
b3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
